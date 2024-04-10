; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31786 () Bool)

(assert start!31786)

(declare-fun b!317432 () Bool)

(declare-fun res!172013 () Bool)

(declare-fun e!197361 () Bool)

(assert (=> b!317432 (=> (not res!172013) (not e!197361))))

(declare-datatypes ((array!16157 0))(
  ( (array!16158 (arr!7644 (Array (_ BitVec 32) (_ BitVec 64))) (size!7996 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16157)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317432 (= res!172013 (and (= (select (arr!7644 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7996 a!3293))))))

(declare-fun res!172014 () Bool)

(declare-fun e!197362 () Bool)

(assert (=> start!31786 (=> (not res!172014) (not e!197362))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31786 (= res!172014 (validMask!0 mask!3709))))

(assert (=> start!31786 e!197362))

(declare-fun array_inv!5607 (array!16157) Bool)

(assert (=> start!31786 (array_inv!5607 a!3293)))

(assert (=> start!31786 true))

(declare-fun b!317433 () Bool)

(declare-fun res!172017 () Bool)

(assert (=> b!317433 (=> (not res!172017) (not e!197362))))

(assert (=> b!317433 (= res!172017 (and (= (size!7996 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7996 a!3293))))))

(declare-fun b!317434 () Bool)

(declare-fun res!172016 () Bool)

(assert (=> b!317434 (=> (not res!172016) (not e!197362))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317434 (= res!172016 (validKeyInArray!0 k0!2441))))

(declare-fun b!317435 () Bool)

(declare-fun e!197364 () Bool)

(assert (=> b!317435 (= e!197361 e!197364)))

(declare-fun res!172015 () Bool)

(assert (=> b!317435 (=> (not res!172015) (not e!197364))))

(declare-datatypes ((SeekEntryResult!2784 0))(
  ( (MissingZero!2784 (index!13312 (_ BitVec 32))) (Found!2784 (index!13313 (_ BitVec 32))) (Intermediate!2784 (undefined!3596 Bool) (index!13314 (_ BitVec 32)) (x!31577 (_ BitVec 32))) (Undefined!2784) (MissingVacant!2784 (index!13315 (_ BitVec 32))) )
))
(declare-fun lt!154948 () SeekEntryResult!2784)

(declare-fun lt!154949 () SeekEntryResult!2784)

(assert (=> b!317435 (= res!172015 (and (= lt!154949 lt!154948) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7644 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16157 (_ BitVec 32)) SeekEntryResult!2784)

(assert (=> b!317435 (= lt!154949 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun lt!154947 () (_ BitVec 32))

(declare-fun b!317436 () Bool)

(declare-fun lt!154950 () array!16157)

(declare-fun e!197365 () Bool)

(assert (=> b!317436 (= e!197365 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154950 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154947 k0!2441 lt!154950 mask!3709)))))

(assert (=> b!317436 (= lt!154950 (array!16158 (store (arr!7644 a!3293) i!1240 k0!2441) (size!7996 a!3293)))))

(declare-fun b!317437 () Bool)

(declare-fun res!172018 () Bool)

(assert (=> b!317437 (=> (not res!172018) (not e!197362))))

(declare-fun arrayContainsKey!0 (array!16157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317437 (= res!172018 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317438 () Bool)

(declare-fun res!172020 () Bool)

(assert (=> b!317438 (=> (not res!172020) (not e!197362))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16157 (_ BitVec 32)) SeekEntryResult!2784)

(assert (=> b!317438 (= res!172020 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2784 i!1240)))))

(declare-fun b!317439 () Bool)

(assert (=> b!317439 (= e!197364 (not true))))

(assert (=> b!317439 e!197365))

(declare-fun res!172011 () Bool)

(assert (=> b!317439 (=> (not res!172011) (not e!197365))))

(assert (=> b!317439 (= res!172011 (= lt!154949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154947 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317439 (= lt!154947 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317440 () Bool)

(declare-fun res!172019 () Bool)

(assert (=> b!317440 (=> (not res!172019) (not e!197362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16157 (_ BitVec 32)) Bool)

(assert (=> b!317440 (= res!172019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317441 () Bool)

(assert (=> b!317441 (= e!197362 e!197361)))

(declare-fun res!172012 () Bool)

(assert (=> b!317441 (=> (not res!172012) (not e!197361))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317441 (= res!172012 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154948))))

(assert (=> b!317441 (= lt!154948 (Intermediate!2784 false resIndex!52 resX!52))))

(assert (= (and start!31786 res!172014) b!317433))

(assert (= (and b!317433 res!172017) b!317434))

(assert (= (and b!317434 res!172016) b!317437))

(assert (= (and b!317437 res!172018) b!317438))

(assert (= (and b!317438 res!172020) b!317440))

(assert (= (and b!317440 res!172019) b!317441))

(assert (= (and b!317441 res!172012) b!317432))

(assert (= (and b!317432 res!172013) b!317435))

(assert (= (and b!317435 res!172015) b!317439))

(assert (= (and b!317439 res!172011) b!317436))

(declare-fun m!326065 () Bool)

(assert (=> b!317441 m!326065))

(assert (=> b!317441 m!326065))

(declare-fun m!326067 () Bool)

(assert (=> b!317441 m!326067))

(declare-fun m!326069 () Bool)

(assert (=> start!31786 m!326069))

(declare-fun m!326071 () Bool)

(assert (=> start!31786 m!326071))

(declare-fun m!326073 () Bool)

(assert (=> b!317437 m!326073))

(declare-fun m!326075 () Bool)

(assert (=> b!317434 m!326075))

(declare-fun m!326077 () Bool)

(assert (=> b!317438 m!326077))

(declare-fun m!326079 () Bool)

(assert (=> b!317432 m!326079))

(declare-fun m!326081 () Bool)

(assert (=> b!317439 m!326081))

(declare-fun m!326083 () Bool)

(assert (=> b!317439 m!326083))

(declare-fun m!326085 () Bool)

(assert (=> b!317440 m!326085))

(declare-fun m!326087 () Bool)

(assert (=> b!317435 m!326087))

(declare-fun m!326089 () Bool)

(assert (=> b!317435 m!326089))

(declare-fun m!326091 () Bool)

(assert (=> b!317436 m!326091))

(declare-fun m!326093 () Bool)

(assert (=> b!317436 m!326093))

(declare-fun m!326095 () Bool)

(assert (=> b!317436 m!326095))

(check-sat (not b!317440) (not b!317437) (not b!317438) (not b!317435) (not b!317434) (not b!317441) (not start!31786) (not b!317436) (not b!317439))
(check-sat)
