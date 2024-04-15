; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45372 () Bool)

(assert start!45372)

(declare-fun b!498332 () Bool)

(declare-datatypes ((Unit!14866 0))(
  ( (Unit!14867) )
))
(declare-fun e!292053 () Unit!14866)

(declare-fun Unit!14868 () Unit!14866)

(assert (=> b!498332 (= e!292053 Unit!14868)))

(declare-datatypes ((SeekEntryResult!3949 0))(
  ( (MissingZero!3949 (index!17978 (_ BitVec 32))) (Found!3949 (index!17979 (_ BitVec 32))) (Intermediate!3949 (undefined!4761 Bool) (index!17980 (_ BitVec 32)) (x!47037 (_ BitVec 32))) (Undefined!3949) (MissingVacant!3949 (index!17981 (_ BitVec 32))) )
))
(declare-fun lt!225659 () SeekEntryResult!3949)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225658 () Unit!14866)

(declare-datatypes ((array!32207 0))(
  ( (array!32208 (arr!15485 (Array (_ BitVec 32) (_ BitVec 64))) (size!15850 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32207)

(declare-fun lt!225656 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32207 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14866)

(assert (=> b!498332 (= lt!225658 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225656 #b00000000000000000000000000000000 (index!17980 lt!225659) (x!47037 lt!225659) mask!3524))))

(declare-fun res!300551 () Bool)

(declare-fun lt!225657 () array!32207)

(declare-fun lt!225664 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32207 (_ BitVec 32)) SeekEntryResult!3949)

(assert (=> b!498332 (= res!300551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225656 lt!225664 lt!225657 mask!3524) (Intermediate!3949 false (index!17980 lt!225659) (x!47037 lt!225659))))))

(declare-fun e!292052 () Bool)

(assert (=> b!498332 (=> (not res!300551) (not e!292052))))

(assert (=> b!498332 e!292052))

(declare-fun b!498333 () Bool)

(declare-fun res!300555 () Bool)

(declare-fun e!292054 () Bool)

(assert (=> b!498333 (=> (not res!300555) (not e!292054))))

(assert (=> b!498333 (= res!300555 (and (= (size!15850 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15850 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15850 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!300560 () Bool)

(assert (=> start!45372 (=> (not res!300560) (not e!292054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45372 (= res!300560 (validMask!0 mask!3524))))

(assert (=> start!45372 e!292054))

(assert (=> start!45372 true))

(declare-fun array_inv!11368 (array!32207) Bool)

(assert (=> start!45372 (array_inv!11368 a!3235)))

(declare-fun b!498334 () Bool)

(declare-fun res!300556 () Bool)

(declare-fun e!292050 () Bool)

(assert (=> b!498334 (=> (not res!300556) (not e!292050))))

(declare-datatypes ((List!9682 0))(
  ( (Nil!9679) (Cons!9678 (h!10552 (_ BitVec 64)) (t!15901 List!9682)) )
))
(declare-fun arrayNoDuplicates!0 (array!32207 (_ BitVec 32) List!9682) Bool)

(assert (=> b!498334 (= res!300556 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9679))))

(declare-fun b!498335 () Bool)

(declare-fun e!292051 () Bool)

(assert (=> b!498335 (= e!292051 true)))

(declare-fun lt!225661 () SeekEntryResult!3949)

(assert (=> b!498335 (= lt!225661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225656 lt!225664 lt!225657 mask!3524))))

(declare-fun b!498336 () Bool)

(declare-fun res!300554 () Bool)

(assert (=> b!498336 (=> (not res!300554) (not e!292054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498336 (= res!300554 (validKeyInArray!0 (select (arr!15485 a!3235) j!176)))))

(declare-fun b!498337 () Bool)

(assert (=> b!498337 (= e!292052 false)))

(declare-fun b!498338 () Bool)

(declare-fun e!292049 () Bool)

(assert (=> b!498338 (= e!292050 (not e!292049))))

(declare-fun res!300550 () Bool)

(assert (=> b!498338 (=> res!300550 e!292049)))

(declare-fun lt!225655 () (_ BitVec 32))

(assert (=> b!498338 (= res!300550 (= lt!225659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225655 lt!225664 lt!225657 mask!3524)))))

(assert (=> b!498338 (= lt!225659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225656 (select (arr!15485 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498338 (= lt!225655 (toIndex!0 lt!225664 mask!3524))))

(assert (=> b!498338 (= lt!225664 (select (store (arr!15485 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498338 (= lt!225656 (toIndex!0 (select (arr!15485 a!3235) j!176) mask!3524))))

(assert (=> b!498338 (= lt!225657 (array!32208 (store (arr!15485 a!3235) i!1204 k0!2280) (size!15850 a!3235)))))

(declare-fun e!292056 () Bool)

(assert (=> b!498338 e!292056))

(declare-fun res!300548 () Bool)

(assert (=> b!498338 (=> (not res!300548) (not e!292056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32207 (_ BitVec 32)) Bool)

(assert (=> b!498338 (= res!300548 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225662 () Unit!14866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14866)

(assert (=> b!498338 (= lt!225662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498339 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32207 (_ BitVec 32)) SeekEntryResult!3949)

(assert (=> b!498339 (= e!292056 (= (seekEntryOrOpen!0 (select (arr!15485 a!3235) j!176) a!3235 mask!3524) (Found!3949 j!176)))))

(declare-fun b!498340 () Bool)

(declare-fun Unit!14869 () Unit!14866)

(assert (=> b!498340 (= e!292053 Unit!14869)))

(declare-fun b!498341 () Bool)

(declare-fun res!300557 () Bool)

(assert (=> b!498341 (=> res!300557 e!292049)))

(get-info :version)

(assert (=> b!498341 (= res!300557 (or (undefined!4761 lt!225659) (not ((_ is Intermediate!3949) lt!225659))))))

(declare-fun b!498342 () Bool)

(declare-fun res!300549 () Bool)

(assert (=> b!498342 (=> (not res!300549) (not e!292050))))

(assert (=> b!498342 (= res!300549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498343 () Bool)

(declare-fun res!300552 () Bool)

(assert (=> b!498343 (=> (not res!300552) (not e!292054))))

(assert (=> b!498343 (= res!300552 (validKeyInArray!0 k0!2280))))

(declare-fun b!498344 () Bool)

(assert (=> b!498344 (= e!292054 e!292050)))

(declare-fun res!300553 () Bool)

(assert (=> b!498344 (=> (not res!300553) (not e!292050))))

(declare-fun lt!225660 () SeekEntryResult!3949)

(assert (=> b!498344 (= res!300553 (or (= lt!225660 (MissingZero!3949 i!1204)) (= lt!225660 (MissingVacant!3949 i!1204))))))

(assert (=> b!498344 (= lt!225660 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498345 () Bool)

(declare-fun res!300559 () Bool)

(assert (=> b!498345 (=> (not res!300559) (not e!292054))))

(declare-fun arrayContainsKey!0 (array!32207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498345 (= res!300559 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498346 () Bool)

(assert (=> b!498346 (= e!292049 e!292051)))

(declare-fun res!300558 () Bool)

(assert (=> b!498346 (=> res!300558 e!292051)))

(assert (=> b!498346 (= res!300558 (or (bvsgt #b00000000000000000000000000000000 (x!47037 lt!225659)) (bvsgt (x!47037 lt!225659) #b01111111111111111111111111111110) (bvslt lt!225656 #b00000000000000000000000000000000) (bvsge lt!225656 (size!15850 a!3235)) (bvslt (index!17980 lt!225659) #b00000000000000000000000000000000) (bvsge (index!17980 lt!225659) (size!15850 a!3235)) (not (= lt!225659 (Intermediate!3949 false (index!17980 lt!225659) (x!47037 lt!225659))))))))

(assert (=> b!498346 (and (or (= (select (arr!15485 a!3235) (index!17980 lt!225659)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15485 a!3235) (index!17980 lt!225659)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15485 a!3235) (index!17980 lt!225659)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15485 a!3235) (index!17980 lt!225659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225663 () Unit!14866)

(assert (=> b!498346 (= lt!225663 e!292053)))

(declare-fun c!59169 () Bool)

(assert (=> b!498346 (= c!59169 (= (select (arr!15485 a!3235) (index!17980 lt!225659)) (select (arr!15485 a!3235) j!176)))))

(assert (=> b!498346 (and (bvslt (x!47037 lt!225659) #b01111111111111111111111111111110) (or (= (select (arr!15485 a!3235) (index!17980 lt!225659)) (select (arr!15485 a!3235) j!176)) (= (select (arr!15485 a!3235) (index!17980 lt!225659)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15485 a!3235) (index!17980 lt!225659)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45372 res!300560) b!498333))

(assert (= (and b!498333 res!300555) b!498336))

(assert (= (and b!498336 res!300554) b!498343))

(assert (= (and b!498343 res!300552) b!498345))

(assert (= (and b!498345 res!300559) b!498344))

(assert (= (and b!498344 res!300553) b!498342))

(assert (= (and b!498342 res!300549) b!498334))

(assert (= (and b!498334 res!300556) b!498338))

(assert (= (and b!498338 res!300548) b!498339))

(assert (= (and b!498338 (not res!300550)) b!498341))

(assert (= (and b!498341 (not res!300557)) b!498346))

(assert (= (and b!498346 c!59169) b!498332))

(assert (= (and b!498346 (not c!59169)) b!498340))

(assert (= (and b!498332 res!300551) b!498337))

(assert (= (and b!498346 (not res!300558)) b!498335))

(declare-fun m!479107 () Bool)

(assert (=> b!498345 m!479107))

(declare-fun m!479109 () Bool)

(assert (=> b!498344 m!479109))

(declare-fun m!479111 () Bool)

(assert (=> b!498338 m!479111))

(declare-fun m!479113 () Bool)

(assert (=> b!498338 m!479113))

(declare-fun m!479115 () Bool)

(assert (=> b!498338 m!479115))

(declare-fun m!479117 () Bool)

(assert (=> b!498338 m!479117))

(declare-fun m!479119 () Bool)

(assert (=> b!498338 m!479119))

(declare-fun m!479121 () Bool)

(assert (=> b!498338 m!479121))

(assert (=> b!498338 m!479113))

(declare-fun m!479123 () Bool)

(assert (=> b!498338 m!479123))

(assert (=> b!498338 m!479113))

(declare-fun m!479125 () Bool)

(assert (=> b!498338 m!479125))

(declare-fun m!479127 () Bool)

(assert (=> b!498338 m!479127))

(declare-fun m!479129 () Bool)

(assert (=> start!45372 m!479129))

(declare-fun m!479131 () Bool)

(assert (=> start!45372 m!479131))

(declare-fun m!479133 () Bool)

(assert (=> b!498334 m!479133))

(declare-fun m!479135 () Bool)

(assert (=> b!498343 m!479135))

(assert (=> b!498339 m!479113))

(assert (=> b!498339 m!479113))

(declare-fun m!479137 () Bool)

(assert (=> b!498339 m!479137))

(declare-fun m!479139 () Bool)

(assert (=> b!498346 m!479139))

(assert (=> b!498346 m!479113))

(assert (=> b!498336 m!479113))

(assert (=> b!498336 m!479113))

(declare-fun m!479141 () Bool)

(assert (=> b!498336 m!479141))

(declare-fun m!479143 () Bool)

(assert (=> b!498342 m!479143))

(declare-fun m!479145 () Bool)

(assert (=> b!498335 m!479145))

(declare-fun m!479147 () Bool)

(assert (=> b!498332 m!479147))

(assert (=> b!498332 m!479145))

(check-sat (not b!498332) (not b!498344) (not b!498342) (not b!498338) (not b!498343) (not b!498339) (not b!498335) (not b!498345) (not b!498336) (not start!45372) (not b!498334))
(check-sat)
