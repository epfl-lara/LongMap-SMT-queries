; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27736 () Bool)

(assert start!27736)

(declare-fun res!148091 () Bool)

(declare-fun e!181241 () Bool)

(assert (=> start!27736 (=> (not res!148091) (not e!181241))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27736 (= res!148091 (validMask!0 mask!3809))))

(assert (=> start!27736 e!181241))

(assert (=> start!27736 true))

(declare-datatypes ((array!14272 0))(
  ( (array!14273 (arr!6772 (Array (_ BitVec 32) (_ BitVec 64))) (size!7124 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14272)

(declare-fun array_inv!4735 (array!14272) Bool)

(assert (=> start!27736 (array_inv!4735 a!3312)))

(declare-fun b!285939 () Bool)

(declare-fun res!148092 () Bool)

(assert (=> b!285939 (=> (not res!148092) (not e!181241))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285939 (= res!148092 (and (= (size!7124 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7124 a!3312))))))

(declare-fun b!285940 () Bool)

(declare-fun res!148090 () Bool)

(assert (=> b!285940 (=> (not res!148090) (not e!181241))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285940 (= res!148090 (validKeyInArray!0 k!2524))))

(declare-fun b!285941 () Bool)

(assert (=> b!285941 (= e!181241 (and (bvslt #b00000000000000000000000000000000 (size!7124 a!3312)) (bvsge (size!7124 a!3312) #b01111111111111111111111111111111)))))

(assert (= (and start!27736 res!148091) b!285939))

(assert (= (and b!285939 res!148092) b!285940))

(assert (= (and b!285940 res!148090) b!285941))

(declare-fun m!300735 () Bool)

(assert (=> start!27736 m!300735))

(declare-fun m!300737 () Bool)

(assert (=> start!27736 m!300737))

(declare-fun m!300739 () Bool)

(assert (=> b!285940 m!300739))

(push 1)

(assert (not start!27736))

(assert (not b!285940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65921 () Bool)

(assert (=> d!65921 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27736 d!65921))

(declare-fun d!65925 () Bool)

(assert (=> d!65925 (= (array_inv!4735 a!3312) (bvsge (size!7124 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27736 d!65925))

(declare-fun d!65929 () Bool)

(assert (=> d!65929 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285940 d!65929))

(push 1)

