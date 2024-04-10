; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31956 () Bool)

(assert start!31956)

(declare-fun res!173736 () Bool)

(declare-fun e!198357 () Bool)

(assert (=> start!31956 (=> (not res!173736) (not e!198357))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31956 (= res!173736 (validMask!0 mask!3777))))

(assert (=> start!31956 e!198357))

(assert (=> start!31956 true))

(declare-datatypes ((array!16276 0))(
  ( (array!16277 (arr!7702 (Array (_ BitVec 32) (_ BitVec 64))) (size!8054 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16276)

(declare-fun array_inv!5665 (array!16276) Bool)

(assert (=> start!31956 (array_inv!5665 a!3305)))

(declare-fun b!319350 () Bool)

(declare-fun res!173735 () Bool)

(assert (=> b!319350 (=> (not res!173735) (not e!198357))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319350 (= res!173735 (and (= (size!8054 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8054 a!3305))))))

(declare-fun b!319351 () Bool)

(declare-fun res!173734 () Bool)

(assert (=> b!319351 (=> (not res!173734) (not e!198357))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319351 (= res!173734 (validKeyInArray!0 k!2497))))

(declare-fun b!319352 () Bool)

(assert (=> b!319352 (= e!198357 (and (bvslt #b00000000000000000000000000000000 (size!8054 a!3305)) (bvsge (size!8054 a!3305) #b01111111111111111111111111111111)))))

(assert (= (and start!31956 res!173736) b!319350))

(assert (= (and b!319350 res!173735) b!319351))

(assert (= (and b!319351 res!173734) b!319352))

(declare-fun m!327977 () Bool)

(assert (=> start!31956 m!327977))

(declare-fun m!327979 () Bool)

(assert (=> start!31956 m!327979))

(declare-fun m!327981 () Bool)

(assert (=> b!319351 m!327981))

(push 1)

(assert (not b!319351))

(assert (not start!31956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

