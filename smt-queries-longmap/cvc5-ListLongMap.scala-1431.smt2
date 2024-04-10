; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27732 () Bool)

(assert start!27732)

(declare-fun res!148072 () Bool)

(declare-fun e!181228 () Bool)

(assert (=> start!27732 (=> (not res!148072) (not e!181228))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27732 (= res!148072 (validMask!0 mask!3809))))

(assert (=> start!27732 e!181228))

(assert (=> start!27732 true))

(declare-datatypes ((array!14268 0))(
  ( (array!14269 (arr!6770 (Array (_ BitVec 32) (_ BitVec 64))) (size!7122 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14268)

(declare-fun array_inv!4733 (array!14268) Bool)

(assert (=> start!27732 (array_inv!4733 a!3312)))

(declare-fun b!285921 () Bool)

(declare-fun res!148074 () Bool)

(assert (=> b!285921 (=> (not res!148074) (not e!181228))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285921 (= res!148074 (and (= (size!7122 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7122 a!3312))))))

(declare-fun b!285922 () Bool)

(declare-fun res!148073 () Bool)

(assert (=> b!285922 (=> (not res!148073) (not e!181228))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285922 (= res!148073 (validKeyInArray!0 k!2524))))

(declare-fun b!285923 () Bool)

(assert (=> b!285923 (= e!181228 (and (bvslt #b00000000000000000000000000000000 (size!7122 a!3312)) (bvsge (size!7122 a!3312) #b01111111111111111111111111111111)))))

(assert (= (and start!27732 res!148072) b!285921))

(assert (= (and b!285921 res!148074) b!285922))

(assert (= (and b!285922 res!148073) b!285923))

(declare-fun m!300723 () Bool)

(assert (=> start!27732 m!300723))

(declare-fun m!300725 () Bool)

(assert (=> start!27732 m!300725))

(declare-fun m!300727 () Bool)

(assert (=> b!285922 m!300727))

(push 1)

(assert (not b!285922))

(assert (not start!27732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65919 () Bool)

(assert (=> d!65919 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285922 d!65919))

(declare-fun d!65923 () Bool)

(assert (=> d!65923 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27732 d!65923))

(declare-fun d!65927 () Bool)

(assert (=> d!65927 (= (array_inv!4733 a!3312) (bvsge (size!7122 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27732 d!65927))

(push 1)

(check-sat)

