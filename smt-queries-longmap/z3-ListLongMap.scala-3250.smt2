; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45374 () Bool)

(assert start!45374)

(declare-fun b!498378 () Bool)

(declare-fun res!300484 () Bool)

(declare-fun e!292105 () Bool)

(assert (=> b!498378 (=> (not res!300484) (not e!292105))))

(declare-datatypes ((array!32199 0))(
  ( (array!32200 (arr!15481 (Array (_ BitVec 32) (_ BitVec 64))) (size!15845 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32199)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498378 (= res!300484 (validKeyInArray!0 (select (arr!15481 a!3235) j!176)))))

(declare-fun b!498380 () Bool)

(declare-fun e!292108 () Bool)

(declare-fun e!292103 () Bool)

(assert (=> b!498380 (= e!292108 (not e!292103))))

(declare-fun res!300491 () Bool)

(assert (=> b!498380 (=> res!300491 e!292103)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225747 () (_ BitVec 32))

(declare-fun lt!225740 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3948 0))(
  ( (MissingZero!3948 (index!17974 (_ BitVec 32))) (Found!3948 (index!17975 (_ BitVec 32))) (Intermediate!3948 (undefined!4760 Bool) (index!17976 (_ BitVec 32)) (x!47025 (_ BitVec 32))) (Undefined!3948) (MissingVacant!3948 (index!17977 (_ BitVec 32))) )
))
(declare-fun lt!225744 () SeekEntryResult!3948)

(declare-fun lt!225741 () array!32199)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32199 (_ BitVec 32)) SeekEntryResult!3948)

(assert (=> b!498380 (= res!300491 (= lt!225744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225747 lt!225740 lt!225741 mask!3524)))))

(declare-fun lt!225742 () (_ BitVec 32))

(assert (=> b!498380 (= lt!225744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225742 (select (arr!15481 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498380 (= lt!225747 (toIndex!0 lt!225740 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!498380 (= lt!225740 (select (store (arr!15481 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498380 (= lt!225742 (toIndex!0 (select (arr!15481 a!3235) j!176) mask!3524))))

(assert (=> b!498380 (= lt!225741 (array!32200 (store (arr!15481 a!3235) i!1204 k0!2280) (size!15845 a!3235)))))

(declare-fun e!292107 () Bool)

(assert (=> b!498380 e!292107))

(declare-fun res!300490 () Bool)

(assert (=> b!498380 (=> (not res!300490) (not e!292107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32199 (_ BitVec 32)) Bool)

(assert (=> b!498380 (= res!300490 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14868 0))(
  ( (Unit!14869) )
))
(declare-fun lt!225746 () Unit!14868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14868)

(assert (=> b!498380 (= lt!225746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498381 () Bool)

(declare-fun e!292106 () Bool)

(assert (=> b!498381 (= e!292103 e!292106)))

(declare-fun res!300487 () Bool)

(assert (=> b!498381 (=> res!300487 e!292106)))

(assert (=> b!498381 (= res!300487 (or (bvsgt #b00000000000000000000000000000000 (x!47025 lt!225744)) (bvsgt (x!47025 lt!225744) #b01111111111111111111111111111110) (bvslt lt!225742 #b00000000000000000000000000000000) (bvsge lt!225742 (size!15845 a!3235)) (bvslt (index!17976 lt!225744) #b00000000000000000000000000000000) (bvsge (index!17976 lt!225744) (size!15845 a!3235)) (not (= lt!225744 (Intermediate!3948 false (index!17976 lt!225744) (x!47025 lt!225744))))))))

(assert (=> b!498381 (and (or (= (select (arr!15481 a!3235) (index!17976 lt!225744)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15481 a!3235) (index!17976 lt!225744)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15481 a!3235) (index!17976 lt!225744)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15481 a!3235) (index!17976 lt!225744)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225739 () Unit!14868)

(declare-fun e!292104 () Unit!14868)

(assert (=> b!498381 (= lt!225739 e!292104)))

(declare-fun c!59225 () Bool)

(assert (=> b!498381 (= c!59225 (= (select (arr!15481 a!3235) (index!17976 lt!225744)) (select (arr!15481 a!3235) j!176)))))

(assert (=> b!498381 (and (bvslt (x!47025 lt!225744) #b01111111111111111111111111111110) (or (= (select (arr!15481 a!3235) (index!17976 lt!225744)) (select (arr!15481 a!3235) j!176)) (= (select (arr!15481 a!3235) (index!17976 lt!225744)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15481 a!3235) (index!17976 lt!225744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498382 () Bool)

(declare-fun res!300492 () Bool)

(assert (=> b!498382 (=> res!300492 e!292103)))

(get-info :version)

(assert (=> b!498382 (= res!300492 (or (undefined!4760 lt!225744) (not ((_ is Intermediate!3948) lt!225744))))))

(declare-fun b!498383 () Bool)

(declare-fun Unit!14870 () Unit!14868)

(assert (=> b!498383 (= e!292104 Unit!14870)))

(declare-fun b!498384 () Bool)

(declare-fun e!292109 () Bool)

(assert (=> b!498384 (= e!292109 false)))

(declare-fun b!498385 () Bool)

(declare-fun Unit!14871 () Unit!14868)

(assert (=> b!498385 (= e!292104 Unit!14871)))

(declare-fun lt!225748 () Unit!14868)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14868)

(assert (=> b!498385 (= lt!225748 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225742 #b00000000000000000000000000000000 (index!17976 lt!225744) (x!47025 lt!225744) mask!3524))))

(declare-fun res!300486 () Bool)

(assert (=> b!498385 (= res!300486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225742 lt!225740 lt!225741 mask!3524) (Intermediate!3948 false (index!17976 lt!225744) (x!47025 lt!225744))))))

(assert (=> b!498385 (=> (not res!300486) (not e!292109))))

(assert (=> b!498385 e!292109))

(declare-fun b!498386 () Bool)

(declare-fun res!300485 () Bool)

(assert (=> b!498386 (=> (not res!300485) (not e!292105))))

(assert (=> b!498386 (= res!300485 (validKeyInArray!0 k0!2280))))

(declare-fun b!498387 () Bool)

(assert (=> b!498387 (= e!292106 true)))

(declare-fun lt!225745 () SeekEntryResult!3948)

(assert (=> b!498387 (= lt!225745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225742 lt!225740 lt!225741 mask!3524))))

(declare-fun b!498388 () Bool)

(assert (=> b!498388 (= e!292105 e!292108)))

(declare-fun res!300493 () Bool)

(assert (=> b!498388 (=> (not res!300493) (not e!292108))))

(declare-fun lt!225743 () SeekEntryResult!3948)

(assert (=> b!498388 (= res!300493 (or (= lt!225743 (MissingZero!3948 i!1204)) (= lt!225743 (MissingVacant!3948 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32199 (_ BitVec 32)) SeekEntryResult!3948)

(assert (=> b!498388 (= lt!225743 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!300482 () Bool)

(assert (=> start!45374 (=> (not res!300482) (not e!292105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45374 (= res!300482 (validMask!0 mask!3524))))

(assert (=> start!45374 e!292105))

(assert (=> start!45374 true))

(declare-fun array_inv!11277 (array!32199) Bool)

(assert (=> start!45374 (array_inv!11277 a!3235)))

(declare-fun b!498379 () Bool)

(declare-fun res!300494 () Bool)

(assert (=> b!498379 (=> (not res!300494) (not e!292105))))

(declare-fun arrayContainsKey!0 (array!32199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498379 (= res!300494 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498389 () Bool)

(assert (=> b!498389 (= e!292107 (= (seekEntryOrOpen!0 (select (arr!15481 a!3235) j!176) a!3235 mask!3524) (Found!3948 j!176)))))

(declare-fun b!498390 () Bool)

(declare-fun res!300489 () Bool)

(assert (=> b!498390 (=> (not res!300489) (not e!292108))))

(declare-datatypes ((List!9639 0))(
  ( (Nil!9636) (Cons!9635 (h!10509 (_ BitVec 64)) (t!15867 List!9639)) )
))
(declare-fun arrayNoDuplicates!0 (array!32199 (_ BitVec 32) List!9639) Bool)

(assert (=> b!498390 (= res!300489 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9636))))

(declare-fun b!498391 () Bool)

(declare-fun res!300483 () Bool)

(assert (=> b!498391 (=> (not res!300483) (not e!292105))))

(assert (=> b!498391 (= res!300483 (and (= (size!15845 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15845 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15845 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498392 () Bool)

(declare-fun res!300488 () Bool)

(assert (=> b!498392 (=> (not res!300488) (not e!292108))))

(assert (=> b!498392 (= res!300488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45374 res!300482) b!498391))

(assert (= (and b!498391 res!300483) b!498378))

(assert (= (and b!498378 res!300484) b!498386))

(assert (= (and b!498386 res!300485) b!498379))

(assert (= (and b!498379 res!300494) b!498388))

(assert (= (and b!498388 res!300493) b!498392))

(assert (= (and b!498392 res!300488) b!498390))

(assert (= (and b!498390 res!300489) b!498380))

(assert (= (and b!498380 res!300490) b!498389))

(assert (= (and b!498380 (not res!300491)) b!498382))

(assert (= (and b!498382 (not res!300492)) b!498381))

(assert (= (and b!498381 c!59225) b!498385))

(assert (= (and b!498381 (not c!59225)) b!498383))

(assert (= (and b!498385 res!300486) b!498384))

(assert (= (and b!498381 (not res!300487)) b!498387))

(declare-fun m!479649 () Bool)

(assert (=> b!498386 m!479649))

(declare-fun m!479651 () Bool)

(assert (=> b!498380 m!479651))

(declare-fun m!479653 () Bool)

(assert (=> b!498380 m!479653))

(declare-fun m!479655 () Bool)

(assert (=> b!498380 m!479655))

(declare-fun m!479657 () Bool)

(assert (=> b!498380 m!479657))

(declare-fun m!479659 () Bool)

(assert (=> b!498380 m!479659))

(assert (=> b!498380 m!479657))

(declare-fun m!479661 () Bool)

(assert (=> b!498380 m!479661))

(declare-fun m!479663 () Bool)

(assert (=> b!498380 m!479663))

(declare-fun m!479665 () Bool)

(assert (=> b!498380 m!479665))

(declare-fun m!479667 () Bool)

(assert (=> b!498380 m!479667))

(assert (=> b!498380 m!479657))

(declare-fun m!479669 () Bool)

(assert (=> b!498385 m!479669))

(declare-fun m!479671 () Bool)

(assert (=> b!498385 m!479671))

(declare-fun m!479673 () Bool)

(assert (=> b!498388 m!479673))

(declare-fun m!479675 () Bool)

(assert (=> b!498381 m!479675))

(assert (=> b!498381 m!479657))

(assert (=> b!498389 m!479657))

(assert (=> b!498389 m!479657))

(declare-fun m!479677 () Bool)

(assert (=> b!498389 m!479677))

(declare-fun m!479679 () Bool)

(assert (=> b!498392 m!479679))

(assert (=> b!498378 m!479657))

(assert (=> b!498378 m!479657))

(declare-fun m!479681 () Bool)

(assert (=> b!498378 m!479681))

(declare-fun m!479683 () Bool)

(assert (=> start!45374 m!479683))

(declare-fun m!479685 () Bool)

(assert (=> start!45374 m!479685))

(declare-fun m!479687 () Bool)

(assert (=> b!498390 m!479687))

(declare-fun m!479689 () Bool)

(assert (=> b!498379 m!479689))

(assert (=> b!498387 m!479671))

(check-sat (not b!498386) (not b!498390) (not b!498388) (not b!498378) (not b!498387) (not b!498379) (not b!498385) (not b!498380) (not start!45374) (not b!498389) (not b!498392))
(check-sat)
