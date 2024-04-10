; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32118 () Bool)

(assert start!32118)

(declare-fun b!320112 () Bool)

(declare-fun res!174360 () Bool)

(declare-fun e!198712 () Bool)

(assert (=> b!320112 (=> (not res!174360) (not e!198712))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320112 (= res!174360 (validKeyInArray!0 k0!2497))))

(declare-fun b!320113 () Bool)

(declare-fun res!174357 () Bool)

(assert (=> b!320113 (=> (not res!174357) (not e!198712))))

(declare-datatypes ((array!16353 0))(
  ( (array!16354 (arr!7737 (Array (_ BitVec 32) (_ BitVec 64))) (size!8089 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16353)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16353 (_ BitVec 32)) Bool)

(assert (=> b!320113 (= res!174357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174356 () Bool)

(assert (=> start!32118 (=> (not res!174356) (not e!198712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32118 (= res!174356 (validMask!0 mask!3777))))

(assert (=> start!32118 e!198712))

(assert (=> start!32118 true))

(declare-fun array_inv!5700 (array!16353) Bool)

(assert (=> start!32118 (array_inv!5700 a!3305)))

(declare-fun b!320114 () Bool)

(assert (=> b!320114 (= e!198712 false)))

(declare-fun lt!155982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320114 (= lt!155982 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!320115 () Bool)

(declare-fun res!174355 () Bool)

(assert (=> b!320115 (=> (not res!174355) (not e!198712))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320115 (= res!174355 (and (= (size!8089 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8089 a!3305))))))

(declare-fun b!320116 () Bool)

(declare-fun res!174359 () Bool)

(assert (=> b!320116 (=> (not res!174359) (not e!198712))))

(declare-fun arrayContainsKey!0 (array!16353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320116 (= res!174359 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320117 () Bool)

(declare-fun res!174358 () Bool)

(assert (=> b!320117 (=> (not res!174358) (not e!198712))))

(declare-datatypes ((SeekEntryResult!2868 0))(
  ( (MissingZero!2868 (index!13648 (_ BitVec 32))) (Found!2868 (index!13649 (_ BitVec 32))) (Intermediate!2868 (undefined!3680 Bool) (index!13650 (_ BitVec 32)) (x!31921 (_ BitVec 32))) (Undefined!2868) (MissingVacant!2868 (index!13651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16353 (_ BitVec 32)) SeekEntryResult!2868)

(assert (=> b!320117 (= res!174358 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2868 i!1250)))))

(assert (= (and start!32118 res!174356) b!320115))

(assert (= (and b!320115 res!174355) b!320112))

(assert (= (and b!320112 res!174360) b!320116))

(assert (= (and b!320116 res!174359) b!320117))

(assert (= (and b!320117 res!174358) b!320113))

(assert (= (and b!320113 res!174357) b!320114))

(declare-fun m!328543 () Bool)

(assert (=> b!320116 m!328543))

(declare-fun m!328545 () Bool)

(assert (=> b!320112 m!328545))

(declare-fun m!328547 () Bool)

(assert (=> b!320114 m!328547))

(declare-fun m!328549 () Bool)

(assert (=> b!320113 m!328549))

(declare-fun m!328551 () Bool)

(assert (=> start!32118 m!328551))

(declare-fun m!328553 () Bool)

(assert (=> start!32118 m!328553))

(declare-fun m!328555 () Bool)

(assert (=> b!320117 m!328555))

(check-sat (not start!32118) (not b!320113) (not b!320112) (not b!320116) (not b!320117) (not b!320114))
(check-sat)
