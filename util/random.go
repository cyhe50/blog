package util

import (
  "math/rand"
  "strings"
  "time"
)

const (
  alphabet = "abcdefghijklmnopqrstuvwxyz"
)

func init() {
  rand.Seed(time.Now().UnixNano())
}

func RandomInt(min, max int64) int64 {
  return min + rand.Int63n(max-min+1)
}

func RandomString(n int) string {
  var sb strings.Builder
  l := len(alphabet)

  for i:=0; i < n; i++ {
    c := alphabet[rand.Intn(l)]
    sb.WriteByte(c)
  }

  return sb.String()
}