; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46990 () Bool)

(assert start!46990)

(declare-fun b!518101 () Bool)

(declare-fun res!317123 () Bool)

(declare-fun e!302322 () Bool)

(assert (=> b!518101 (=> (not res!317123) (not e!302322))))

(declare-datatypes ((array!33131 0))(
  ( (array!33132 (arr!15929 (Array (_ BitVec 32) (_ BitVec 64))) (size!16293 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33131)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33131 (_ BitVec 32)) Bool)

(assert (=> b!518101 (= res!317123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun lt!237166 () (_ BitVec 32))

(declare-fun b!518102 () Bool)

(declare-fun e!302321 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4396 0))(
  ( (MissingZero!4396 (index!19772 (_ BitVec 32))) (Found!4396 (index!19773 (_ BitVec 32))) (Intermediate!4396 (undefined!5208 Bool) (index!19774 (_ BitVec 32)) (x!48737 (_ BitVec 32))) (Undefined!4396) (MissingVacant!4396 (index!19775 (_ BitVec 32))) )
))
(declare-fun lt!237163 () SeekEntryResult!4396)

(assert (=> b!518102 (= e!302321 (or (not (= (select (arr!15929 a!3235) (index!19774 lt!237163)) (select (arr!15929 a!3235) j!176))) (bvsgt (x!48737 lt!237163) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48737 lt!237163)) (bvslt lt!237166 #b00000000000000000000000000000000) (bvsge lt!237166 (size!16293 a!3235)) (bvslt (index!19774 lt!237163) #b00000000000000000000000000000000) (bvsge (index!19774 lt!237163) (size!16293 a!3235)) (= lt!237163 (Intermediate!4396 false (index!19774 lt!237163) (x!48737 lt!237163)))))))

(assert (=> b!518102 (and (bvslt (x!48737 lt!237163) #b01111111111111111111111111111110) (or (= (select (arr!15929 a!3235) (index!19774 lt!237163)) (select (arr!15929 a!3235) j!176)) (= (select (arr!15929 a!3235) (index!19774 lt!237163)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15929 a!3235) (index!19774 lt!237163)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!317121 () Bool)

(declare-fun e!302320 () Bool)

(assert (=> start!46990 (=> (not res!317121) (not e!302320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46990 (= res!317121 (validMask!0 mask!3524))))

(assert (=> start!46990 e!302320))

(assert (=> start!46990 true))

(declare-fun array_inv!11725 (array!33131) Bool)

(assert (=> start!46990 (array_inv!11725 a!3235)))

(declare-fun e!302319 () Bool)

(declare-fun b!518103 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33131 (_ BitVec 32)) SeekEntryResult!4396)

(assert (=> b!518103 (= e!302319 (= (seekEntryOrOpen!0 (select (arr!15929 a!3235) j!176) a!3235 mask!3524) (Found!4396 j!176)))))

(declare-fun b!518104 () Bool)

(declare-fun res!317120 () Bool)

(assert (=> b!518104 (=> res!317120 e!302321)))

(assert (=> b!518104 (= res!317120 (or (undefined!5208 lt!237163) (not (is-Intermediate!4396 lt!237163))))))

(declare-fun b!518105 () Bool)

(assert (=> b!518105 (= e!302320 e!302322)))

(declare-fun res!317124 () Bool)

(assert (=> b!518105 (=> (not res!317124) (not e!302322))))

(declare-fun lt!237162 () SeekEntryResult!4396)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518105 (= res!317124 (or (= lt!237162 (MissingZero!4396 i!1204)) (= lt!237162 (MissingVacant!4396 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!518105 (= lt!237162 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518106 () Bool)

(declare-fun res!317126 () Bool)

(assert (=> b!518106 (=> (not res!317126) (not e!302320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518106 (= res!317126 (validKeyInArray!0 (select (arr!15929 a!3235) j!176)))))

(declare-fun b!518107 () Bool)

(declare-fun res!317116 () Bool)

(assert (=> b!518107 (=> (not res!317116) (not e!302322))))

(declare-datatypes ((List!10087 0))(
  ( (Nil!10084) (Cons!10083 (h!10990 (_ BitVec 64)) (t!16315 List!10087)) )
))
(declare-fun arrayNoDuplicates!0 (array!33131 (_ BitVec 32) List!10087) Bool)

(assert (=> b!518107 (= res!317116 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10084))))

(declare-fun b!518108 () Bool)

(assert (=> b!518108 (= e!302322 (not e!302321))))

(declare-fun res!317119 () Bool)

(assert (=> b!518108 (=> res!317119 e!302321)))

(declare-fun lt!237164 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33131 (_ BitVec 32)) SeekEntryResult!4396)

(assert (=> b!518108 (= res!317119 (= lt!237163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237164 (select (store (arr!15929 a!3235) i!1204 k!2280) j!176) (array!33132 (store (arr!15929 a!3235) i!1204 k!2280) (size!16293 a!3235)) mask!3524)))))

(assert (=> b!518108 (= lt!237163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237166 (select (arr!15929 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518108 (= lt!237164 (toIndex!0 (select (store (arr!15929 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!518108 (= lt!237166 (toIndex!0 (select (arr!15929 a!3235) j!176) mask!3524))))

(assert (=> b!518108 e!302319))

(declare-fun res!317117 () Bool)

(assert (=> b!518108 (=> (not res!317117) (not e!302319))))

(assert (=> b!518108 (= res!317117 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16050 0))(
  ( (Unit!16051) )
))
(declare-fun lt!237165 () Unit!16050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16050)

(assert (=> b!518108 (= lt!237165 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518109 () Bool)

(declare-fun res!317125 () Bool)

(assert (=> b!518109 (=> (not res!317125) (not e!302320))))

(declare-fun arrayContainsKey!0 (array!33131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518109 (= res!317125 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518110 () Bool)

(declare-fun res!317122 () Bool)

(assert (=> b!518110 (=> (not res!317122) (not e!302320))))

(assert (=> b!518110 (= res!317122 (and (= (size!16293 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16293 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16293 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518111 () Bool)

(declare-fun res!317118 () Bool)

(assert (=> b!518111 (=> (not res!317118) (not e!302320))))

(assert (=> b!518111 (= res!317118 (validKeyInArray!0 k!2280))))

(assert (= (and start!46990 res!317121) b!518110))

(assert (= (and b!518110 res!317122) b!518106))

(assert (= (and b!518106 res!317126) b!518111))

(assert (= (and b!518111 res!317118) b!518109))

(assert (= (and b!518109 res!317125) b!518105))

(assert (= (and b!518105 res!317124) b!518101))

(assert (= (and b!518101 res!317123) b!518107))

(assert (= (and b!518107 res!317116) b!518108))

(assert (= (and b!518108 res!317117) b!518103))

(assert (= (and b!518108 (not res!317119)) b!518104))

(assert (= (and b!518104 (not res!317120)) b!518102))

(declare-fun m!499447 () Bool)

(assert (=> b!518111 m!499447))

(declare-fun m!499449 () Bool)

(assert (=> b!518102 m!499449))

(declare-fun m!499451 () Bool)

(assert (=> b!518102 m!499451))

(declare-fun m!499453 () Bool)

(assert (=> b!518107 m!499453))

(declare-fun m!499455 () Bool)

(assert (=> b!518105 m!499455))

(declare-fun m!499457 () Bool)

(assert (=> b!518101 m!499457))

(assert (=> b!518106 m!499451))

(assert (=> b!518106 m!499451))

(declare-fun m!499459 () Bool)

(assert (=> b!518106 m!499459))

(assert (=> b!518103 m!499451))

(assert (=> b!518103 m!499451))

(declare-fun m!499461 () Bool)

(assert (=> b!518103 m!499461))

(declare-fun m!499463 () Bool)

(assert (=> b!518109 m!499463))

(declare-fun m!499465 () Bool)

(assert (=> start!46990 m!499465))

(declare-fun m!499467 () Bool)

(assert (=> start!46990 m!499467))

(declare-fun m!499469 () Bool)

(assert (=> b!518108 m!499469))

(declare-fun m!499471 () Bool)

(assert (=> b!518108 m!499471))

(declare-fun m!499473 () Bool)

(assert (=> b!518108 m!499473))

(declare-fun m!499475 () Bool)

(assert (=> b!518108 m!499475))

(assert (=> b!518108 m!499469))

(assert (=> b!518108 m!499451))

(declare-fun m!499477 () Bool)

(assert (=> b!518108 m!499477))

(assert (=> b!518108 m!499451))

(declare-fun m!499479 () Bool)

(assert (=> b!518108 m!499479))

(assert (=> b!518108 m!499469))

(declare-fun m!499481 () Bool)

(assert (=> b!518108 m!499481))

(assert (=> b!518108 m!499451))

(declare-fun m!499483 () Bool)

(assert (=> b!518108 m!499483))

(push 1)

