; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46264 () Bool)

(assert start!46264)

(declare-fun b!512450 () Bool)

(declare-fun e!299270 () Bool)

(assert (=> b!512450 (= e!299270 true)))

(declare-datatypes ((SeekEntryResult!4303 0))(
  ( (MissingZero!4303 (index!19400 (_ BitVec 32))) (Found!4303 (index!19401 (_ BitVec 32))) (Intermediate!4303 (undefined!5115 Bool) (index!19402 (_ BitVec 32)) (x!48342 (_ BitVec 32))) (Undefined!4303) (MissingVacant!4303 (index!19403 (_ BitVec 32))) )
))
(declare-fun lt!234587 () SeekEntryResult!4303)

(assert (=> b!512450 (= lt!234587 Undefined!4303)))

(declare-fun res!313120 () Bool)

(declare-fun e!299271 () Bool)

(assert (=> start!46264 (=> (not res!313120) (not e!299271))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46264 (= res!313120 (validMask!0 mask!3524))))

(assert (=> start!46264 e!299271))

(assert (=> start!46264 true))

(declare-datatypes ((array!32918 0))(
  ( (array!32919 (arr!15836 (Array (_ BitVec 32) (_ BitVec 64))) (size!16200 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32918)

(declare-fun array_inv!11632 (array!32918) Bool)

(assert (=> start!46264 (array_inv!11632 a!3235)))

(declare-fun b!512451 () Bool)

(declare-fun res!313113 () Bool)

(assert (=> b!512451 (=> (not res!313113) (not e!299271))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512451 (= res!313113 (validKeyInArray!0 k!2280))))

(declare-fun b!512452 () Bool)

(declare-fun res!313114 () Bool)

(assert (=> b!512452 (=> (not res!313114) (not e!299271))))

(declare-fun arrayContainsKey!0 (array!32918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512452 (= res!313114 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512453 () Bool)

(declare-fun res!313115 () Bool)

(declare-fun e!299268 () Bool)

(assert (=> b!512453 (=> (not res!313115) (not e!299268))))

(declare-datatypes ((List!9994 0))(
  ( (Nil!9991) (Cons!9990 (h!10870 (_ BitVec 64)) (t!16222 List!9994)) )
))
(declare-fun arrayNoDuplicates!0 (array!32918 (_ BitVec 32) List!9994) Bool)

(assert (=> b!512453 (= res!313115 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9991))))

(declare-fun b!512454 () Bool)

(declare-fun res!313112 () Bool)

(assert (=> b!512454 (=> (not res!313112) (not e!299268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32918 (_ BitVec 32)) Bool)

(assert (=> b!512454 (= res!313112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512455 () Bool)

(assert (=> b!512455 (= e!299268 (not e!299270))))

(declare-fun res!313119 () Bool)

(assert (=> b!512455 (=> res!313119 e!299270)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234591 () SeekEntryResult!4303)

(declare-fun lt!234590 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32918 (_ BitVec 32)) SeekEntryResult!4303)

(assert (=> b!512455 (= res!313119 (= lt!234591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234590 (select (store (arr!15836 a!3235) i!1204 k!2280) j!176) (array!32919 (store (arr!15836 a!3235) i!1204 k!2280) (size!16200 a!3235)) mask!3524)))))

(declare-fun lt!234588 () (_ BitVec 32))

(assert (=> b!512455 (= lt!234591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234588 (select (arr!15836 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512455 (= lt!234590 (toIndex!0 (select (store (arr!15836 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512455 (= lt!234588 (toIndex!0 (select (arr!15836 a!3235) j!176) mask!3524))))

(assert (=> b!512455 (= lt!234587 (Found!4303 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32918 (_ BitVec 32)) SeekEntryResult!4303)

(assert (=> b!512455 (= lt!234587 (seekEntryOrOpen!0 (select (arr!15836 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512455 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15864 0))(
  ( (Unit!15865) )
))
(declare-fun lt!234592 () Unit!15864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15864)

(assert (=> b!512455 (= lt!234592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512456 () Bool)

(assert (=> b!512456 (= e!299271 e!299268)))

(declare-fun res!313118 () Bool)

(assert (=> b!512456 (=> (not res!313118) (not e!299268))))

(declare-fun lt!234589 () SeekEntryResult!4303)

(assert (=> b!512456 (= res!313118 (or (= lt!234589 (MissingZero!4303 i!1204)) (= lt!234589 (MissingVacant!4303 i!1204))))))

(assert (=> b!512456 (= lt!234589 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512457 () Bool)

(declare-fun res!313117 () Bool)

(assert (=> b!512457 (=> res!313117 e!299270)))

(assert (=> b!512457 (= res!313117 (or (not (is-Intermediate!4303 lt!234591)) (not (undefined!5115 lt!234591))))))

(declare-fun b!512458 () Bool)

(declare-fun res!313121 () Bool)

(assert (=> b!512458 (=> (not res!313121) (not e!299271))))

(assert (=> b!512458 (= res!313121 (validKeyInArray!0 (select (arr!15836 a!3235) j!176)))))

(declare-fun b!512459 () Bool)

(declare-fun res!313116 () Bool)

(assert (=> b!512459 (=> (not res!313116) (not e!299271))))

(assert (=> b!512459 (= res!313116 (and (= (size!16200 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16200 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16200 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46264 res!313120) b!512459))

(assert (= (and b!512459 res!313116) b!512458))

(assert (= (and b!512458 res!313121) b!512451))

(assert (= (and b!512451 res!313113) b!512452))

(assert (= (and b!512452 res!313114) b!512456))

(assert (= (and b!512456 res!313118) b!512454))

(assert (= (and b!512454 res!313112) b!512453))

(assert (= (and b!512453 res!313115) b!512455))

(assert (= (and b!512455 (not res!313119)) b!512457))

(assert (= (and b!512457 (not res!313117)) b!512450))

(declare-fun m!494109 () Bool)

(assert (=> b!512455 m!494109))

(declare-fun m!494111 () Bool)

(assert (=> b!512455 m!494111))

(declare-fun m!494113 () Bool)

(assert (=> b!512455 m!494113))

(declare-fun m!494115 () Bool)

(assert (=> b!512455 m!494115))

(declare-fun m!494117 () Bool)

(assert (=> b!512455 m!494117))

(assert (=> b!512455 m!494115))

(declare-fun m!494119 () Bool)

(assert (=> b!512455 m!494119))

(assert (=> b!512455 m!494113))

(declare-fun m!494121 () Bool)

(assert (=> b!512455 m!494121))

(assert (=> b!512455 m!494115))

(declare-fun m!494123 () Bool)

(assert (=> b!512455 m!494123))

(assert (=> b!512455 m!494113))

(declare-fun m!494125 () Bool)

(assert (=> b!512455 m!494125))

(assert (=> b!512455 m!494115))

(declare-fun m!494127 () Bool)

(assert (=> b!512455 m!494127))

(declare-fun m!494129 () Bool)

(assert (=> b!512456 m!494129))

(declare-fun m!494131 () Bool)

(assert (=> b!512452 m!494131))

(declare-fun m!494133 () Bool)

(assert (=> b!512453 m!494133))

(declare-fun m!494135 () Bool)

(assert (=> b!512451 m!494135))

(declare-fun m!494137 () Bool)

(assert (=> b!512454 m!494137))

(assert (=> b!512458 m!494115))

(assert (=> b!512458 m!494115))

(declare-fun m!494139 () Bool)

(assert (=> b!512458 m!494139))

(declare-fun m!494141 () Bool)

(assert (=> start!46264 m!494141))

(declare-fun m!494143 () Bool)

(assert (=> start!46264 m!494143))

(push 1)

(assert (not b!512455))

(assert (not b!512451))

(assert (not start!46264))

(assert (not b!512453))

(assert (not b!512452))

(assert (not b!512454))

