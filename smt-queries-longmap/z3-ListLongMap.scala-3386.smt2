; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46716 () Bool)

(assert start!46716)

(declare-fun b!515604 () Bool)

(declare-fun res!315320 () Bool)

(declare-fun e!300974 () Bool)

(assert (=> b!515604 (=> (not res!315320) (not e!300974))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33038 0))(
  ( (array!33039 (arr!15887 (Array (_ BitVec 32) (_ BitVec 64))) (size!16252 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33038)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515604 (= res!315320 (and (= (size!16252 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16252 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16252 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!300971 () Bool)

(declare-fun b!515605 () Bool)

(declare-datatypes ((SeekEntryResult!4351 0))(
  ( (MissingZero!4351 (index!19592 (_ BitVec 32))) (Found!4351 (index!19593 (_ BitVec 32))) (Intermediate!4351 (undefined!5163 Bool) (index!19594 (_ BitVec 32)) (x!48565 (_ BitVec 32))) (Undefined!4351) (MissingVacant!4351 (index!19595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33038 (_ BitVec 32)) SeekEntryResult!4351)

(assert (=> b!515605 (= e!300971 (= (seekEntryOrOpen!0 (select (arr!15887 a!3235) j!176) a!3235 mask!3524) (Found!4351 j!176)))))

(declare-fun b!515606 () Bool)

(declare-fun e!300975 () Bool)

(declare-fun e!300972 () Bool)

(assert (=> b!515606 (= e!300975 (not e!300972))))

(declare-fun res!315314 () Bool)

(assert (=> b!515606 (=> res!315314 e!300972)))

(declare-fun lt!235929 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!235927 () SeekEntryResult!4351)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33038 (_ BitVec 32)) SeekEntryResult!4351)

(assert (=> b!515606 (= res!315314 (= lt!235927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235929 (select (store (arr!15887 a!3235) i!1204 k0!2280) j!176) (array!33039 (store (arr!15887 a!3235) i!1204 k0!2280) (size!16252 a!3235)) mask!3524)))))

(declare-fun lt!235930 () (_ BitVec 32))

(assert (=> b!515606 (= lt!235927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235930 (select (arr!15887 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515606 (= lt!235929 (toIndex!0 (select (store (arr!15887 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515606 (= lt!235930 (toIndex!0 (select (arr!15887 a!3235) j!176) mask!3524))))

(assert (=> b!515606 e!300971))

(declare-fun res!315311 () Bool)

(assert (=> b!515606 (=> (not res!315311) (not e!300971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33038 (_ BitVec 32)) Bool)

(assert (=> b!515606 (= res!315311 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15946 0))(
  ( (Unit!15947) )
))
(declare-fun lt!235928 () Unit!15946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15946)

(assert (=> b!515606 (= lt!235928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515607 () Bool)

(declare-fun res!315317 () Bool)

(assert (=> b!515607 (=> res!315317 e!300972)))

(get-info :version)

(assert (=> b!515607 (= res!315317 (or (undefined!5163 lt!235927) (not ((_ is Intermediate!4351) lt!235927))))))

(declare-fun b!515608 () Bool)

(declare-fun res!315312 () Bool)

(assert (=> b!515608 (=> (not res!315312) (not e!300974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515608 (= res!315312 (validKeyInArray!0 k0!2280))))

(declare-fun res!315318 () Bool)

(assert (=> start!46716 (=> (not res!315318) (not e!300974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46716 (= res!315318 (validMask!0 mask!3524))))

(assert (=> start!46716 e!300974))

(assert (=> start!46716 true))

(declare-fun array_inv!11770 (array!33038) Bool)

(assert (=> start!46716 (array_inv!11770 a!3235)))

(declare-fun b!515609 () Bool)

(declare-fun res!315313 () Bool)

(assert (=> b!515609 (=> (not res!315313) (not e!300975))))

(declare-datatypes ((List!10084 0))(
  ( (Nil!10081) (Cons!10080 (h!10978 (_ BitVec 64)) (t!16303 List!10084)) )
))
(declare-fun arrayNoDuplicates!0 (array!33038 (_ BitVec 32) List!10084) Bool)

(assert (=> b!515609 (= res!315313 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10081))))

(declare-fun b!515610 () Bool)

(assert (=> b!515610 (= e!300974 e!300975)))

(declare-fun res!315319 () Bool)

(assert (=> b!515610 (=> (not res!315319) (not e!300975))))

(declare-fun lt!235926 () SeekEntryResult!4351)

(assert (=> b!515610 (= res!315319 (or (= lt!235926 (MissingZero!4351 i!1204)) (= lt!235926 (MissingVacant!4351 i!1204))))))

(assert (=> b!515610 (= lt!235926 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515611 () Bool)

(declare-fun res!315315 () Bool)

(assert (=> b!515611 (=> (not res!315315) (not e!300974))))

(declare-fun arrayContainsKey!0 (array!33038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515611 (= res!315315 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515612 () Bool)

(assert (=> b!515612 (= e!300972 true)))

(assert (=> b!515612 (and (bvslt (x!48565 lt!235927) #b01111111111111111111111111111110) (or (= (select (arr!15887 a!3235) (index!19594 lt!235927)) (select (arr!15887 a!3235) j!176)) (= (select (arr!15887 a!3235) (index!19594 lt!235927)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15887 a!3235) (index!19594 lt!235927)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515613 () Bool)

(declare-fun res!315316 () Bool)

(assert (=> b!515613 (=> (not res!315316) (not e!300975))))

(assert (=> b!515613 (= res!315316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515614 () Bool)

(declare-fun res!315310 () Bool)

(assert (=> b!515614 (=> (not res!315310) (not e!300974))))

(assert (=> b!515614 (= res!315310 (validKeyInArray!0 (select (arr!15887 a!3235) j!176)))))

(assert (= (and start!46716 res!315318) b!515604))

(assert (= (and b!515604 res!315320) b!515614))

(assert (= (and b!515614 res!315310) b!515608))

(assert (= (and b!515608 res!315312) b!515611))

(assert (= (and b!515611 res!315315) b!515610))

(assert (= (and b!515610 res!315319) b!515613))

(assert (= (and b!515613 res!315316) b!515609))

(assert (= (and b!515609 res!315313) b!515606))

(assert (= (and b!515606 res!315311) b!515605))

(assert (= (and b!515606 (not res!315314)) b!515607))

(assert (= (and b!515607 (not res!315317)) b!515612))

(declare-fun m!496525 () Bool)

(assert (=> b!515609 m!496525))

(declare-fun m!496527 () Bool)

(assert (=> b!515614 m!496527))

(assert (=> b!515614 m!496527))

(declare-fun m!496529 () Bool)

(assert (=> b!515614 m!496529))

(assert (=> b!515605 m!496527))

(assert (=> b!515605 m!496527))

(declare-fun m!496531 () Bool)

(assert (=> b!515605 m!496531))

(declare-fun m!496533 () Bool)

(assert (=> b!515611 m!496533))

(assert (=> b!515606 m!496527))

(declare-fun m!496535 () Bool)

(assert (=> b!515606 m!496535))

(declare-fun m!496537 () Bool)

(assert (=> b!515606 m!496537))

(declare-fun m!496539 () Bool)

(assert (=> b!515606 m!496539))

(declare-fun m!496541 () Bool)

(assert (=> b!515606 m!496541))

(assert (=> b!515606 m!496527))

(declare-fun m!496543 () Bool)

(assert (=> b!515606 m!496543))

(assert (=> b!515606 m!496527))

(declare-fun m!496545 () Bool)

(assert (=> b!515606 m!496545))

(assert (=> b!515606 m!496541))

(declare-fun m!496547 () Bool)

(assert (=> b!515606 m!496547))

(assert (=> b!515606 m!496541))

(declare-fun m!496549 () Bool)

(assert (=> b!515606 m!496549))

(declare-fun m!496551 () Bool)

(assert (=> b!515613 m!496551))

(declare-fun m!496553 () Bool)

(assert (=> b!515610 m!496553))

(declare-fun m!496555 () Bool)

(assert (=> start!46716 m!496555))

(declare-fun m!496557 () Bool)

(assert (=> start!46716 m!496557))

(declare-fun m!496559 () Bool)

(assert (=> b!515608 m!496559))

(declare-fun m!496561 () Bool)

(assert (=> b!515612 m!496561))

(assert (=> b!515612 m!496527))

(check-sat (not b!515610) (not b!515605) (not b!515614) (not b!515606) (not b!515611) (not b!515608) (not start!46716) (not b!515609) (not b!515613))
(check-sat)
