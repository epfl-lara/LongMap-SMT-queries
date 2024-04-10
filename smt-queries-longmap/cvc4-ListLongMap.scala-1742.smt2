; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31976 () Bool)

(assert start!31976)

(declare-fun res!173771 () Bool)

(declare-fun e!198376 () Bool)

(assert (=> start!31976 (=> (not res!173771) (not e!198376))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31976 (= res!173771 (validMask!0 mask!3777))))

(assert (=> start!31976 e!198376))

(assert (=> start!31976 true))

(declare-datatypes ((array!16283 0))(
  ( (array!16284 (arr!7705 (Array (_ BitVec 32) (_ BitVec 64))) (size!8057 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16283)

(declare-fun array_inv!5668 (array!16283) Bool)

(assert (=> start!31976 (array_inv!5668 a!3305)))

(declare-fun b!319387 () Bool)

(declare-fun res!173770 () Bool)

(assert (=> b!319387 (=> (not res!173770) (not e!198376))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319387 (= res!173770 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319388 () Bool)

(assert (=> b!319388 (= e!198376 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319385 () Bool)

(declare-fun res!173769 () Bool)

(assert (=> b!319385 (=> (not res!173769) (not e!198376))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319385 (= res!173769 (and (= (size!8057 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8057 a!3305))))))

(declare-fun b!319386 () Bool)

(declare-fun res!173772 () Bool)

(assert (=> b!319386 (=> (not res!173772) (not e!198376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319386 (= res!173772 (validKeyInArray!0 k!2497))))

(assert (= (and start!31976 res!173771) b!319385))

(assert (= (and b!319385 res!173769) b!319386))

(assert (= (and b!319386 res!173772) b!319387))

(assert (= (and b!319387 res!173770) b!319388))

(declare-fun m!327999 () Bool)

(assert (=> start!31976 m!327999))

(declare-fun m!328001 () Bool)

(assert (=> start!31976 m!328001))

(declare-fun m!328003 () Bool)

(assert (=> b!319387 m!328003))

(declare-fun m!328005 () Bool)

(assert (=> b!319386 m!328005))

(push 1)

