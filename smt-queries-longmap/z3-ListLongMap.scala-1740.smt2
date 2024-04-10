; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31948 () Bool)

(assert start!31948)

(declare-fun res!173699 () Bool)

(declare-fun e!198334 () Bool)

(assert (=> start!31948 (=> (not res!173699) (not e!198334))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31948 (= res!173699 (validMask!0 mask!3777))))

(assert (=> start!31948 e!198334))

(assert (=> start!31948 true))

(declare-datatypes ((array!16268 0))(
  ( (array!16269 (arr!7698 (Array (_ BitVec 32) (_ BitVec 64))) (size!8050 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16268)

(declare-fun array_inv!5661 (array!16268) Bool)

(assert (=> start!31948 (array_inv!5661 a!3305)))

(declare-fun b!319314 () Bool)

(declare-fun res!173700 () Bool)

(assert (=> b!319314 (=> (not res!173700) (not e!198334))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319314 (= res!173700 (and (= (size!8050 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8050 a!3305))))))

(declare-fun b!319315 () Bool)

(declare-fun res!173698 () Bool)

(assert (=> b!319315 (=> (not res!173698) (not e!198334))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319315 (= res!173698 (validKeyInArray!0 k0!2497))))

(declare-fun b!319316 () Bool)

(assert (=> b!319316 (= e!198334 (bvsge #b00000000000000000000000000000000 (size!8050 a!3305)))))

(assert (= (and start!31948 res!173699) b!319314))

(assert (= (and b!319314 res!173700) b!319315))

(assert (= (and b!319315 res!173698) b!319316))

(declare-fun m!327953 () Bool)

(assert (=> start!31948 m!327953))

(declare-fun m!327955 () Bool)

(assert (=> start!31948 m!327955))

(declare-fun m!327957 () Bool)

(assert (=> b!319315 m!327957))

(check-sat (not start!31948) (not b!319315))
(check-sat)
