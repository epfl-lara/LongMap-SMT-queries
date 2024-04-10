; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31366 () Bool)

(assert start!31366)

(declare-fun b!314344 () Bool)

(declare-fun res!170093 () Bool)

(declare-fun e!195823 () Bool)

(assert (=> b!314344 (=> (not res!170093) (not e!195823))))

(declare-datatypes ((array!16037 0))(
  ( (array!16038 (arr!7593 (Array (_ BitVec 32) (_ BitVec 64))) (size!7945 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16037)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16037 (_ BitVec 32)) Bool)

(assert (=> b!314344 (= res!170093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314345 () Bool)

(declare-fun res!170098 () Bool)

(assert (=> b!314345 (=> (not res!170098) (not e!195823))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314345 (= res!170098 (validKeyInArray!0 k0!2441))))

(declare-fun b!314346 () Bool)

(declare-fun res!170099 () Bool)

(assert (=> b!314346 (=> (not res!170099) (not e!195823))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2733 0))(
  ( (MissingZero!2733 (index!13108 (_ BitVec 32))) (Found!2733 (index!13109 (_ BitVec 32))) (Intermediate!2733 (undefined!3545 Bool) (index!13110 (_ BitVec 32)) (x!31339 (_ BitVec 32))) (Undefined!2733) (MissingVacant!2733 (index!13111 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16037 (_ BitVec 32)) SeekEntryResult!2733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314346 (= res!170099 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2733 false resIndex!52 resX!52)))))

(declare-fun b!314347 () Bool)

(assert (=> b!314347 (= e!195823 false)))

(declare-fun lt!153894 () SeekEntryResult!2733)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314347 (= lt!153894 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314348 () Bool)

(declare-fun res!170095 () Bool)

(assert (=> b!314348 (=> (not res!170095) (not e!195823))))

(declare-fun arrayContainsKey!0 (array!16037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314348 (= res!170095 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170094 () Bool)

(assert (=> start!31366 (=> (not res!170094) (not e!195823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31366 (= res!170094 (validMask!0 mask!3709))))

(assert (=> start!31366 e!195823))

(declare-fun array_inv!5556 (array!16037) Bool)

(assert (=> start!31366 (array_inv!5556 a!3293)))

(assert (=> start!31366 true))

(declare-fun b!314349 () Bool)

(declare-fun res!170100 () Bool)

(assert (=> b!314349 (=> (not res!170100) (not e!195823))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314349 (= res!170100 (and (= (select (arr!7593 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7945 a!3293))))))

(declare-fun b!314350 () Bool)

(declare-fun res!170096 () Bool)

(assert (=> b!314350 (=> (not res!170096) (not e!195823))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16037 (_ BitVec 32)) SeekEntryResult!2733)

(assert (=> b!314350 (= res!170096 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2733 i!1240)))))

(declare-fun b!314351 () Bool)

(declare-fun res!170097 () Bool)

(assert (=> b!314351 (=> (not res!170097) (not e!195823))))

(assert (=> b!314351 (= res!170097 (and (= (size!7945 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7945 a!3293))))))

(assert (= (and start!31366 res!170094) b!314351))

(assert (= (and b!314351 res!170097) b!314345))

(assert (= (and b!314345 res!170098) b!314348))

(assert (= (and b!314348 res!170095) b!314350))

(assert (= (and b!314350 res!170096) b!314344))

(assert (= (and b!314344 res!170093) b!314346))

(assert (= (and b!314346 res!170099) b!314349))

(assert (= (and b!314349 res!170100) b!314347))

(declare-fun m!323917 () Bool)

(assert (=> b!314345 m!323917))

(declare-fun m!323919 () Bool)

(assert (=> start!31366 m!323919))

(declare-fun m!323921 () Bool)

(assert (=> start!31366 m!323921))

(declare-fun m!323923 () Bool)

(assert (=> b!314350 m!323923))

(declare-fun m!323925 () Bool)

(assert (=> b!314349 m!323925))

(declare-fun m!323927 () Bool)

(assert (=> b!314344 m!323927))

(declare-fun m!323929 () Bool)

(assert (=> b!314347 m!323929))

(declare-fun m!323931 () Bool)

(assert (=> b!314348 m!323931))

(declare-fun m!323933 () Bool)

(assert (=> b!314346 m!323933))

(assert (=> b!314346 m!323933))

(declare-fun m!323935 () Bool)

(assert (=> b!314346 m!323935))

(check-sat (not b!314350) (not b!314348) (not b!314344) (not b!314345) (not b!314347) (not b!314346) (not start!31366))
