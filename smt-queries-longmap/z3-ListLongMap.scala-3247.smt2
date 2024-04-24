; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45278 () Bool)

(assert start!45278)

(declare-fun b!497547 () Bool)

(declare-fun res!299976 () Bool)

(declare-fun e!291624 () Bool)

(assert (=> b!497547 (=> (not res!299976) (not e!291624))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32167 0))(
  ( (array!32168 (arr!15466 (Array (_ BitVec 32) (_ BitVec 64))) (size!15830 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32167)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497547 (= res!299976 (and (= (size!15830 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15830 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15830 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497548 () Bool)

(declare-fun e!291625 () Bool)

(assert (=> b!497548 (= e!291625 false)))

(declare-fun b!497549 () Bool)

(declare-fun res!299969 () Bool)

(declare-fun e!291622 () Bool)

(assert (=> b!497549 (=> res!299969 e!291622)))

(declare-datatypes ((SeekEntryResult!3889 0))(
  ( (MissingZero!3889 (index!17735 (_ BitVec 32))) (Found!3889 (index!17736 (_ BitVec 32))) (Intermediate!3889 (undefined!4701 Bool) (index!17737 (_ BitVec 32)) (x!46930 (_ BitVec 32))) (Undefined!3889) (MissingVacant!3889 (index!17738 (_ BitVec 32))) )
))
(declare-fun lt!225315 () SeekEntryResult!3889)

(get-info :version)

(assert (=> b!497549 (= res!299969 (or (undefined!4701 lt!225315) (not ((_ is Intermediate!3889) lt!225315))))))

(declare-fun b!497550 () Bool)

(declare-fun e!291627 () Bool)

(assert (=> b!497550 (= e!291624 e!291627)))

(declare-fun res!299975 () Bool)

(assert (=> b!497550 (=> (not res!299975) (not e!291627))))

(declare-fun lt!225317 () SeekEntryResult!3889)

(assert (=> b!497550 (= res!299975 (or (= lt!225317 (MissingZero!3889 i!1204)) (= lt!225317 (MissingVacant!3889 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32167 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!497550 (= lt!225317 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497551 () Bool)

(declare-datatypes ((Unit!14791 0))(
  ( (Unit!14792) )
))
(declare-fun e!291621 () Unit!14791)

(declare-fun Unit!14793 () Unit!14791)

(assert (=> b!497551 (= e!291621 Unit!14793)))

(declare-fun lt!225320 () Unit!14791)

(declare-fun lt!225318 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14791)

(assert (=> b!497551 (= lt!225320 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225318 #b00000000000000000000000000000000 (index!17737 lt!225315) (x!46930 lt!225315) mask!3524))))

(declare-fun res!299966 () Bool)

(declare-fun lt!225314 () (_ BitVec 64))

(declare-fun lt!225319 () array!32167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32167 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!497551 (= res!299966 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225318 lt!225314 lt!225319 mask!3524) (Intermediate!3889 false (index!17737 lt!225315) (x!46930 lt!225315))))))

(assert (=> b!497551 (=> (not res!299966) (not e!291625))))

(assert (=> b!497551 e!291625))

(declare-fun b!497552 () Bool)

(assert (=> b!497552 (= e!291622 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!497552 (and (or (= (select (arr!15466 a!3235) (index!17737 lt!225315)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15466 a!3235) (index!17737 lt!225315)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15466 a!3235) (index!17737 lt!225315)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15466 a!3235) (index!17737 lt!225315)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225316 () Unit!14791)

(assert (=> b!497552 (= lt!225316 e!291621)))

(declare-fun c!59066 () Bool)

(assert (=> b!497552 (= c!59066 (= (select (arr!15466 a!3235) (index!17737 lt!225315)) (select (arr!15466 a!3235) j!176)))))

(assert (=> b!497552 (and (bvslt (x!46930 lt!225315) #b01111111111111111111111111111110) (or (= (select (arr!15466 a!3235) (index!17737 lt!225315)) (select (arr!15466 a!3235) j!176)) (= (select (arr!15466 a!3235) (index!17737 lt!225315)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15466 a!3235) (index!17737 lt!225315)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497553 () Bool)

(declare-fun Unit!14794 () Unit!14791)

(assert (=> b!497553 (= e!291621 Unit!14794)))

(declare-fun b!497554 () Bool)

(declare-fun res!299970 () Bool)

(assert (=> b!497554 (=> (not res!299970) (not e!291624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497554 (= res!299970 (validKeyInArray!0 (select (arr!15466 a!3235) j!176)))))

(declare-fun b!497555 () Bool)

(declare-fun res!299974 () Bool)

(assert (=> b!497555 (=> (not res!299974) (not e!291624))))

(assert (=> b!497555 (= res!299974 (validKeyInArray!0 k0!2280))))

(declare-fun res!299972 () Bool)

(assert (=> start!45278 (=> (not res!299972) (not e!291624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45278 (= res!299972 (validMask!0 mask!3524))))

(assert (=> start!45278 e!291624))

(assert (=> start!45278 true))

(declare-fun array_inv!11325 (array!32167) Bool)

(assert (=> start!45278 (array_inv!11325 a!3235)))

(declare-fun e!291626 () Bool)

(declare-fun b!497556 () Bool)

(assert (=> b!497556 (= e!291626 (= (seekEntryOrOpen!0 (select (arr!15466 a!3235) j!176) a!3235 mask!3524) (Found!3889 j!176)))))

(declare-fun b!497557 () Bool)

(declare-fun res!299971 () Bool)

(assert (=> b!497557 (=> (not res!299971) (not e!291627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32167 (_ BitVec 32)) Bool)

(assert (=> b!497557 (= res!299971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497558 () Bool)

(declare-fun res!299977 () Bool)

(assert (=> b!497558 (=> (not res!299977) (not e!291624))))

(declare-fun arrayContainsKey!0 (array!32167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497558 (= res!299977 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497559 () Bool)

(declare-fun res!299967 () Bool)

(assert (=> b!497559 (=> (not res!299967) (not e!291627))))

(declare-datatypes ((List!9531 0))(
  ( (Nil!9528) (Cons!9527 (h!10398 (_ BitVec 64)) (t!15751 List!9531)) )
))
(declare-fun arrayNoDuplicates!0 (array!32167 (_ BitVec 32) List!9531) Bool)

(assert (=> b!497559 (= res!299967 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9528))))

(declare-fun b!497560 () Bool)

(assert (=> b!497560 (= e!291627 (not e!291622))))

(declare-fun res!299968 () Bool)

(assert (=> b!497560 (=> res!299968 e!291622)))

(declare-fun lt!225321 () (_ BitVec 32))

(assert (=> b!497560 (= res!299968 (= lt!225315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225321 lt!225314 lt!225319 mask!3524)))))

(assert (=> b!497560 (= lt!225315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225318 (select (arr!15466 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497560 (= lt!225321 (toIndex!0 lt!225314 mask!3524))))

(assert (=> b!497560 (= lt!225314 (select (store (arr!15466 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497560 (= lt!225318 (toIndex!0 (select (arr!15466 a!3235) j!176) mask!3524))))

(assert (=> b!497560 (= lt!225319 (array!32168 (store (arr!15466 a!3235) i!1204 k0!2280) (size!15830 a!3235)))))

(assert (=> b!497560 e!291626))

(declare-fun res!299973 () Bool)

(assert (=> b!497560 (=> (not res!299973) (not e!291626))))

(assert (=> b!497560 (= res!299973 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225322 () Unit!14791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14791)

(assert (=> b!497560 (= lt!225322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45278 res!299972) b!497547))

(assert (= (and b!497547 res!299976) b!497554))

(assert (= (and b!497554 res!299970) b!497555))

(assert (= (and b!497555 res!299974) b!497558))

(assert (= (and b!497558 res!299977) b!497550))

(assert (= (and b!497550 res!299975) b!497557))

(assert (= (and b!497557 res!299971) b!497559))

(assert (= (and b!497559 res!299967) b!497560))

(assert (= (and b!497560 res!299973) b!497556))

(assert (= (and b!497560 (not res!299968)) b!497549))

(assert (= (and b!497549 (not res!299969)) b!497552))

(assert (= (and b!497552 c!59066) b!497551))

(assert (= (and b!497552 (not c!59066)) b!497553))

(assert (= (and b!497551 res!299966) b!497548))

(declare-fun m!479179 () Bool)

(assert (=> b!497550 m!479179))

(declare-fun m!479181 () Bool)

(assert (=> b!497554 m!479181))

(assert (=> b!497554 m!479181))

(declare-fun m!479183 () Bool)

(assert (=> b!497554 m!479183))

(assert (=> b!497556 m!479181))

(assert (=> b!497556 m!479181))

(declare-fun m!479185 () Bool)

(assert (=> b!497556 m!479185))

(declare-fun m!479187 () Bool)

(assert (=> b!497555 m!479187))

(declare-fun m!479189 () Bool)

(assert (=> b!497560 m!479189))

(declare-fun m!479191 () Bool)

(assert (=> b!497560 m!479191))

(assert (=> b!497560 m!479181))

(declare-fun m!479193 () Bool)

(assert (=> b!497560 m!479193))

(assert (=> b!497560 m!479181))

(declare-fun m!479195 () Bool)

(assert (=> b!497560 m!479195))

(assert (=> b!497560 m!479181))

(declare-fun m!479197 () Bool)

(assert (=> b!497560 m!479197))

(declare-fun m!479199 () Bool)

(assert (=> b!497560 m!479199))

(declare-fun m!479201 () Bool)

(assert (=> b!497560 m!479201))

(declare-fun m!479203 () Bool)

(assert (=> b!497560 m!479203))

(declare-fun m!479205 () Bool)

(assert (=> start!45278 m!479205))

(declare-fun m!479207 () Bool)

(assert (=> start!45278 m!479207))

(declare-fun m!479209 () Bool)

(assert (=> b!497557 m!479209))

(declare-fun m!479211 () Bool)

(assert (=> b!497552 m!479211))

(assert (=> b!497552 m!479181))

(declare-fun m!479213 () Bool)

(assert (=> b!497551 m!479213))

(declare-fun m!479215 () Bool)

(assert (=> b!497551 m!479215))

(declare-fun m!479217 () Bool)

(assert (=> b!497559 m!479217))

(declare-fun m!479219 () Bool)

(assert (=> b!497558 m!479219))

(check-sat (not b!497560) (not b!497557) (not b!497558) (not b!497554) (not b!497550) (not b!497555) (not b!497556) (not b!497551) (not b!497559) (not start!45278))
(check-sat)
(get-model)

(declare-fun b!497657 () Bool)

(declare-fun e!291676 () SeekEntryResult!3889)

(declare-fun lt!225383 () SeekEntryResult!3889)

(assert (=> b!497657 (= e!291676 (Found!3889 (index!17737 lt!225383)))))

(declare-fun d!78409 () Bool)

(declare-fun lt!225385 () SeekEntryResult!3889)

(assert (=> d!78409 (and (or ((_ is Undefined!3889) lt!225385) (not ((_ is Found!3889) lt!225385)) (and (bvsge (index!17736 lt!225385) #b00000000000000000000000000000000) (bvslt (index!17736 lt!225385) (size!15830 a!3235)))) (or ((_ is Undefined!3889) lt!225385) ((_ is Found!3889) lt!225385) (not ((_ is MissingZero!3889) lt!225385)) (and (bvsge (index!17735 lt!225385) #b00000000000000000000000000000000) (bvslt (index!17735 lt!225385) (size!15830 a!3235)))) (or ((_ is Undefined!3889) lt!225385) ((_ is Found!3889) lt!225385) ((_ is MissingZero!3889) lt!225385) (not ((_ is MissingVacant!3889) lt!225385)) (and (bvsge (index!17738 lt!225385) #b00000000000000000000000000000000) (bvslt (index!17738 lt!225385) (size!15830 a!3235)))) (or ((_ is Undefined!3889) lt!225385) (ite ((_ is Found!3889) lt!225385) (= (select (arr!15466 a!3235) (index!17736 lt!225385)) (select (arr!15466 a!3235) j!176)) (ite ((_ is MissingZero!3889) lt!225385) (= (select (arr!15466 a!3235) (index!17735 lt!225385)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3889) lt!225385) (= (select (arr!15466 a!3235) (index!17738 lt!225385)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!291678 () SeekEntryResult!3889)

(assert (=> d!78409 (= lt!225385 e!291678)))

(declare-fun c!59080 () Bool)

(assert (=> d!78409 (= c!59080 (and ((_ is Intermediate!3889) lt!225383) (undefined!4701 lt!225383)))))

(assert (=> d!78409 (= lt!225383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15466 a!3235) j!176) mask!3524) (select (arr!15466 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78409 (validMask!0 mask!3524)))

(assert (=> d!78409 (= (seekEntryOrOpen!0 (select (arr!15466 a!3235) j!176) a!3235 mask!3524) lt!225385)))

(declare-fun b!497658 () Bool)

(declare-fun e!291677 () SeekEntryResult!3889)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32167 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!497658 (= e!291677 (seekKeyOrZeroReturnVacant!0 (x!46930 lt!225383) (index!17737 lt!225383) (index!17737 lt!225383) (select (arr!15466 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497659 () Bool)

(assert (=> b!497659 (= e!291677 (MissingZero!3889 (index!17737 lt!225383)))))

(declare-fun b!497660 () Bool)

(assert (=> b!497660 (= e!291678 Undefined!3889)))

(declare-fun b!497661 () Bool)

(assert (=> b!497661 (= e!291678 e!291676)))

(declare-fun lt!225384 () (_ BitVec 64))

(assert (=> b!497661 (= lt!225384 (select (arr!15466 a!3235) (index!17737 lt!225383)))))

(declare-fun c!59081 () Bool)

(assert (=> b!497661 (= c!59081 (= lt!225384 (select (arr!15466 a!3235) j!176)))))

(declare-fun b!497662 () Bool)

(declare-fun c!59079 () Bool)

(assert (=> b!497662 (= c!59079 (= lt!225384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497662 (= e!291676 e!291677)))

(assert (= (and d!78409 c!59080) b!497660))

(assert (= (and d!78409 (not c!59080)) b!497661))

(assert (= (and b!497661 c!59081) b!497657))

(assert (= (and b!497661 (not c!59081)) b!497662))

(assert (= (and b!497662 c!59079) b!497659))

(assert (= (and b!497662 (not c!59079)) b!497658))

(assert (=> d!78409 m!479181))

(assert (=> d!78409 m!479193))

(declare-fun m!479305 () Bool)

(assert (=> d!78409 m!479305))

(assert (=> d!78409 m!479193))

(assert (=> d!78409 m!479181))

(declare-fun m!479307 () Bool)

(assert (=> d!78409 m!479307))

(declare-fun m!479309 () Bool)

(assert (=> d!78409 m!479309))

(assert (=> d!78409 m!479205))

(declare-fun m!479311 () Bool)

(assert (=> d!78409 m!479311))

(assert (=> b!497658 m!479181))

(declare-fun m!479313 () Bool)

(assert (=> b!497658 m!479313))

(declare-fun m!479315 () Bool)

(assert (=> b!497661 m!479315))

(assert (=> b!497556 d!78409))

(declare-fun b!497663 () Bool)

(declare-fun e!291679 () SeekEntryResult!3889)

(declare-fun lt!225386 () SeekEntryResult!3889)

(assert (=> b!497663 (= e!291679 (Found!3889 (index!17737 lt!225386)))))

(declare-fun d!78411 () Bool)

(declare-fun lt!225388 () SeekEntryResult!3889)

(assert (=> d!78411 (and (or ((_ is Undefined!3889) lt!225388) (not ((_ is Found!3889) lt!225388)) (and (bvsge (index!17736 lt!225388) #b00000000000000000000000000000000) (bvslt (index!17736 lt!225388) (size!15830 a!3235)))) (or ((_ is Undefined!3889) lt!225388) ((_ is Found!3889) lt!225388) (not ((_ is MissingZero!3889) lt!225388)) (and (bvsge (index!17735 lt!225388) #b00000000000000000000000000000000) (bvslt (index!17735 lt!225388) (size!15830 a!3235)))) (or ((_ is Undefined!3889) lt!225388) ((_ is Found!3889) lt!225388) ((_ is MissingZero!3889) lt!225388) (not ((_ is MissingVacant!3889) lt!225388)) (and (bvsge (index!17738 lt!225388) #b00000000000000000000000000000000) (bvslt (index!17738 lt!225388) (size!15830 a!3235)))) (or ((_ is Undefined!3889) lt!225388) (ite ((_ is Found!3889) lt!225388) (= (select (arr!15466 a!3235) (index!17736 lt!225388)) k0!2280) (ite ((_ is MissingZero!3889) lt!225388) (= (select (arr!15466 a!3235) (index!17735 lt!225388)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3889) lt!225388) (= (select (arr!15466 a!3235) (index!17738 lt!225388)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!291681 () SeekEntryResult!3889)

(assert (=> d!78411 (= lt!225388 e!291681)))

(declare-fun c!59083 () Bool)

(assert (=> d!78411 (= c!59083 (and ((_ is Intermediate!3889) lt!225386) (undefined!4701 lt!225386)))))

(assert (=> d!78411 (= lt!225386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78411 (validMask!0 mask!3524)))

(assert (=> d!78411 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!225388)))

(declare-fun b!497664 () Bool)

(declare-fun e!291680 () SeekEntryResult!3889)

(assert (=> b!497664 (= e!291680 (seekKeyOrZeroReturnVacant!0 (x!46930 lt!225386) (index!17737 lt!225386) (index!17737 lt!225386) k0!2280 a!3235 mask!3524))))

(declare-fun b!497665 () Bool)

(assert (=> b!497665 (= e!291680 (MissingZero!3889 (index!17737 lt!225386)))))

(declare-fun b!497666 () Bool)

(assert (=> b!497666 (= e!291681 Undefined!3889)))

(declare-fun b!497667 () Bool)

(assert (=> b!497667 (= e!291681 e!291679)))

(declare-fun lt!225387 () (_ BitVec 64))

(assert (=> b!497667 (= lt!225387 (select (arr!15466 a!3235) (index!17737 lt!225386)))))

(declare-fun c!59084 () Bool)

(assert (=> b!497667 (= c!59084 (= lt!225387 k0!2280))))

(declare-fun b!497668 () Bool)

(declare-fun c!59082 () Bool)

(assert (=> b!497668 (= c!59082 (= lt!225387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497668 (= e!291679 e!291680)))

(assert (= (and d!78411 c!59083) b!497666))

(assert (= (and d!78411 (not c!59083)) b!497667))

(assert (= (and b!497667 c!59084) b!497663))

(assert (= (and b!497667 (not c!59084)) b!497668))

(assert (= (and b!497668 c!59082) b!497665))

(assert (= (and b!497668 (not c!59082)) b!497664))

(declare-fun m!479317 () Bool)

(assert (=> d!78411 m!479317))

(declare-fun m!479319 () Bool)

(assert (=> d!78411 m!479319))

(assert (=> d!78411 m!479317))

(declare-fun m!479321 () Bool)

(assert (=> d!78411 m!479321))

(declare-fun m!479323 () Bool)

(assert (=> d!78411 m!479323))

(assert (=> d!78411 m!479205))

(declare-fun m!479325 () Bool)

(assert (=> d!78411 m!479325))

(declare-fun m!479327 () Bool)

(assert (=> b!497664 m!479327))

(declare-fun m!479329 () Bool)

(assert (=> b!497667 m!479329))

(assert (=> b!497550 d!78411))

(declare-fun d!78413 () Bool)

(assert (=> d!78413 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!497555 d!78413))

(declare-fun d!78415 () Bool)

(declare-fun lt!225394 () (_ BitVec 32))

(declare-fun lt!225393 () (_ BitVec 32))

(assert (=> d!78415 (= lt!225394 (bvmul (bvxor lt!225393 (bvlshr lt!225393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78415 (= lt!225393 ((_ extract 31 0) (bvand (bvxor (select (arr!15466 a!3235) j!176) (bvlshr (select (arr!15466 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78415 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300050 (let ((h!10401 ((_ extract 31 0) (bvand (bvxor (select (arr!15466 a!3235) j!176) (bvlshr (select (arr!15466 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46933 (bvmul (bvxor h!10401 (bvlshr h!10401 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46933 (bvlshr x!46933 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300050 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300050 #b00000000000000000000000000000000))))))

(assert (=> d!78415 (= (toIndex!0 (select (arr!15466 a!3235) j!176) mask!3524) (bvand (bvxor lt!225394 (bvlshr lt!225394 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497560 d!78415))

(declare-fun b!497683 () Bool)

(declare-fun e!291696 () Bool)

(declare-fun e!291695 () Bool)

(assert (=> b!497683 (= e!291696 e!291695)))

(declare-fun c!59087 () Bool)

(assert (=> b!497683 (= c!59087 (validKeyInArray!0 (select (arr!15466 a!3235) j!176)))))

(declare-fun b!497684 () Bool)

(declare-fun e!291694 () Bool)

(declare-fun call!31419 () Bool)

(assert (=> b!497684 (= e!291694 call!31419)))

(declare-fun b!497685 () Bool)

(assert (=> b!497685 (= e!291695 e!291694)))

(declare-fun lt!225401 () (_ BitVec 64))

(assert (=> b!497685 (= lt!225401 (select (arr!15466 a!3235) j!176))))

(declare-fun lt!225403 () Unit!14791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32167 (_ BitVec 64) (_ BitVec 32)) Unit!14791)

(assert (=> b!497685 (= lt!225403 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225401 j!176))))

(assert (=> b!497685 (arrayContainsKey!0 a!3235 lt!225401 #b00000000000000000000000000000000)))

(declare-fun lt!225402 () Unit!14791)

(assert (=> b!497685 (= lt!225402 lt!225403)))

(declare-fun res!300061 () Bool)

(assert (=> b!497685 (= res!300061 (= (seekEntryOrOpen!0 (select (arr!15466 a!3235) j!176) a!3235 mask!3524) (Found!3889 j!176)))))

(assert (=> b!497685 (=> (not res!300061) (not e!291694))))

(declare-fun bm!31416 () Bool)

(assert (=> bm!31416 (= call!31419 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497686 () Bool)

(assert (=> b!497686 (= e!291695 call!31419)))

(declare-fun d!78417 () Bool)

(declare-fun res!300062 () Bool)

(assert (=> d!78417 (=> res!300062 e!291696)))

(assert (=> d!78417 (= res!300062 (bvsge j!176 (size!15830 a!3235)))))

(assert (=> d!78417 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!291696)))

(assert (= (and d!78417 (not res!300062)) b!497683))

(assert (= (and b!497683 c!59087) b!497685))

(assert (= (and b!497683 (not c!59087)) b!497686))

(assert (= (and b!497685 res!300061) b!497684))

(assert (= (or b!497684 b!497686) bm!31416))

(assert (=> b!497683 m!479181))

(assert (=> b!497683 m!479181))

(assert (=> b!497683 m!479183))

(assert (=> b!497685 m!479181))

(declare-fun m!479335 () Bool)

(assert (=> b!497685 m!479335))

(declare-fun m!479337 () Bool)

(assert (=> b!497685 m!479337))

(assert (=> b!497685 m!479181))

(assert (=> b!497685 m!479185))

(declare-fun m!479339 () Bool)

(assert (=> bm!31416 m!479339))

(assert (=> b!497560 d!78417))

(declare-fun d!78427 () Bool)

(declare-fun lt!225405 () (_ BitVec 32))

(declare-fun lt!225404 () (_ BitVec 32))

(assert (=> d!78427 (= lt!225405 (bvmul (bvxor lt!225404 (bvlshr lt!225404 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78427 (= lt!225404 ((_ extract 31 0) (bvand (bvxor lt!225314 (bvlshr lt!225314 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78427 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300050 (let ((h!10401 ((_ extract 31 0) (bvand (bvxor lt!225314 (bvlshr lt!225314 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46933 (bvmul (bvxor h!10401 (bvlshr h!10401 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46933 (bvlshr x!46933 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300050 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300050 #b00000000000000000000000000000000))))))

(assert (=> d!78427 (= (toIndex!0 lt!225314 mask!3524) (bvand (bvxor lt!225405 (bvlshr lt!225405 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497560 d!78427))

(declare-fun d!78429 () Bool)

(assert (=> d!78429 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!225414 () Unit!14791)

(declare-fun choose!38 (array!32167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14791)

(assert (=> d!78429 (= lt!225414 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78429 (validMask!0 mask!3524)))

(assert (=> d!78429 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!225414)))

(declare-fun bs!15869 () Bool)

(assert (= bs!15869 d!78429))

(assert (=> bs!15869 m!479201))

(declare-fun m!479341 () Bool)

(assert (=> bs!15869 m!479341))

(assert (=> bs!15869 m!479205))

(assert (=> b!497560 d!78429))

(declare-fun d!78431 () Bool)

(declare-fun e!291738 () Bool)

(assert (=> d!78431 e!291738))

(declare-fun c!59104 () Bool)

(declare-fun lt!225436 () SeekEntryResult!3889)

(assert (=> d!78431 (= c!59104 (and ((_ is Intermediate!3889) lt!225436) (undefined!4701 lt!225436)))))

(declare-fun e!291735 () SeekEntryResult!3889)

(assert (=> d!78431 (= lt!225436 e!291735)))

(declare-fun c!59105 () Bool)

(assert (=> d!78431 (= c!59105 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225435 () (_ BitVec 64))

(assert (=> d!78431 (= lt!225435 (select (arr!15466 lt!225319) lt!225321))))

(assert (=> d!78431 (validMask!0 mask!3524)))

(assert (=> d!78431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225321 lt!225314 lt!225319 mask!3524) lt!225436)))

(declare-fun b!497743 () Bool)

(declare-fun e!291737 () SeekEntryResult!3889)

(assert (=> b!497743 (= e!291735 e!291737)))

(declare-fun c!59106 () Bool)

(assert (=> b!497743 (= c!59106 (or (= lt!225435 lt!225314) (= (bvadd lt!225435 lt!225435) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497744 () Bool)

(declare-fun e!291739 () Bool)

(assert (=> b!497744 (= e!291738 e!291739)))

(declare-fun res!300089 () Bool)

(assert (=> b!497744 (= res!300089 (and ((_ is Intermediate!3889) lt!225436) (not (undefined!4701 lt!225436)) (bvslt (x!46930 lt!225436) #b01111111111111111111111111111110) (bvsge (x!46930 lt!225436) #b00000000000000000000000000000000) (bvsge (x!46930 lt!225436) #b00000000000000000000000000000000)))))

(assert (=> b!497744 (=> (not res!300089) (not e!291739))))

(declare-fun b!497745 () Bool)

(assert (=> b!497745 (and (bvsge (index!17737 lt!225436) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225436) (size!15830 lt!225319)))))

(declare-fun res!300088 () Bool)

(assert (=> b!497745 (= res!300088 (= (select (arr!15466 lt!225319) (index!17737 lt!225436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291736 () Bool)

(assert (=> b!497745 (=> res!300088 e!291736)))

(declare-fun b!497746 () Bool)

(assert (=> b!497746 (= e!291737 (Intermediate!3889 false lt!225321 #b00000000000000000000000000000000))))

(declare-fun b!497747 () Bool)

(assert (=> b!497747 (and (bvsge (index!17737 lt!225436) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225436) (size!15830 lt!225319)))))

(declare-fun res!300087 () Bool)

(assert (=> b!497747 (= res!300087 (= (select (arr!15466 lt!225319) (index!17737 lt!225436)) lt!225314))))

(assert (=> b!497747 (=> res!300087 e!291736)))

(assert (=> b!497747 (= e!291739 e!291736)))

(declare-fun b!497748 () Bool)

(assert (=> b!497748 (and (bvsge (index!17737 lt!225436) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225436) (size!15830 lt!225319)))))

(assert (=> b!497748 (= e!291736 (= (select (arr!15466 lt!225319) (index!17737 lt!225436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497749 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497749 (= e!291737 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225321 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!225314 lt!225319 mask!3524))))

(declare-fun b!497750 () Bool)

(assert (=> b!497750 (= e!291735 (Intermediate!3889 true lt!225321 #b00000000000000000000000000000000))))

(declare-fun b!497751 () Bool)

(assert (=> b!497751 (= e!291738 (bvsge (x!46930 lt!225436) #b01111111111111111111111111111110))))

(assert (= (and d!78431 c!59105) b!497750))

(assert (= (and d!78431 (not c!59105)) b!497743))

(assert (= (and b!497743 c!59106) b!497746))

(assert (= (and b!497743 (not c!59106)) b!497749))

(assert (= (and d!78431 c!59104) b!497751))

(assert (= (and d!78431 (not c!59104)) b!497744))

(assert (= (and b!497744 res!300089) b!497747))

(assert (= (and b!497747 (not res!300087)) b!497745))

(assert (= (and b!497745 (not res!300088)) b!497748))

(declare-fun m!479363 () Bool)

(assert (=> b!497748 m!479363))

(assert (=> b!497745 m!479363))

(assert (=> b!497747 m!479363))

(declare-fun m!479365 () Bool)

(assert (=> d!78431 m!479365))

(assert (=> d!78431 m!479205))

(declare-fun m!479367 () Bool)

(assert (=> b!497749 m!479367))

(assert (=> b!497749 m!479367))

(declare-fun m!479369 () Bool)

(assert (=> b!497749 m!479369))

(assert (=> b!497560 d!78431))

(declare-fun d!78443 () Bool)

(declare-fun e!291749 () Bool)

(assert (=> d!78443 e!291749))

(declare-fun c!59109 () Bool)

(declare-fun lt!225438 () SeekEntryResult!3889)

(assert (=> d!78443 (= c!59109 (and ((_ is Intermediate!3889) lt!225438) (undefined!4701 lt!225438)))))

(declare-fun e!291746 () SeekEntryResult!3889)

(assert (=> d!78443 (= lt!225438 e!291746)))

(declare-fun c!59110 () Bool)

(assert (=> d!78443 (= c!59110 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225437 () (_ BitVec 64))

(assert (=> d!78443 (= lt!225437 (select (arr!15466 a!3235) lt!225318))))

(assert (=> d!78443 (validMask!0 mask!3524)))

(assert (=> d!78443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225318 (select (arr!15466 a!3235) j!176) a!3235 mask!3524) lt!225438)))

(declare-fun b!497760 () Bool)

(declare-fun e!291748 () SeekEntryResult!3889)

(assert (=> b!497760 (= e!291746 e!291748)))

(declare-fun c!59111 () Bool)

(assert (=> b!497760 (= c!59111 (or (= lt!225437 (select (arr!15466 a!3235) j!176)) (= (bvadd lt!225437 lt!225437) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497761 () Bool)

(declare-fun e!291750 () Bool)

(assert (=> b!497761 (= e!291749 e!291750)))

(declare-fun res!300098 () Bool)

(assert (=> b!497761 (= res!300098 (and ((_ is Intermediate!3889) lt!225438) (not (undefined!4701 lt!225438)) (bvslt (x!46930 lt!225438) #b01111111111111111111111111111110) (bvsge (x!46930 lt!225438) #b00000000000000000000000000000000) (bvsge (x!46930 lt!225438) #b00000000000000000000000000000000)))))

(assert (=> b!497761 (=> (not res!300098) (not e!291750))))

(declare-fun b!497762 () Bool)

(assert (=> b!497762 (and (bvsge (index!17737 lt!225438) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225438) (size!15830 a!3235)))))

(declare-fun res!300097 () Bool)

(assert (=> b!497762 (= res!300097 (= (select (arr!15466 a!3235) (index!17737 lt!225438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291747 () Bool)

(assert (=> b!497762 (=> res!300097 e!291747)))

(declare-fun b!497763 () Bool)

(assert (=> b!497763 (= e!291748 (Intermediate!3889 false lt!225318 #b00000000000000000000000000000000))))

(declare-fun b!497764 () Bool)

(assert (=> b!497764 (and (bvsge (index!17737 lt!225438) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225438) (size!15830 a!3235)))))

(declare-fun res!300096 () Bool)

(assert (=> b!497764 (= res!300096 (= (select (arr!15466 a!3235) (index!17737 lt!225438)) (select (arr!15466 a!3235) j!176)))))

(assert (=> b!497764 (=> res!300096 e!291747)))

(assert (=> b!497764 (= e!291750 e!291747)))

(declare-fun b!497765 () Bool)

(assert (=> b!497765 (and (bvsge (index!17737 lt!225438) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225438) (size!15830 a!3235)))))

(assert (=> b!497765 (= e!291747 (= (select (arr!15466 a!3235) (index!17737 lt!225438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497766 () Bool)

(assert (=> b!497766 (= e!291748 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15466 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497767 () Bool)

(assert (=> b!497767 (= e!291746 (Intermediate!3889 true lt!225318 #b00000000000000000000000000000000))))

(declare-fun b!497768 () Bool)

(assert (=> b!497768 (= e!291749 (bvsge (x!46930 lt!225438) #b01111111111111111111111111111110))))

(assert (= (and d!78443 c!59110) b!497767))

(assert (= (and d!78443 (not c!59110)) b!497760))

(assert (= (and b!497760 c!59111) b!497763))

(assert (= (and b!497760 (not c!59111)) b!497766))

(assert (= (and d!78443 c!59109) b!497768))

(assert (= (and d!78443 (not c!59109)) b!497761))

(assert (= (and b!497761 res!300098) b!497764))

(assert (= (and b!497764 (not res!300096)) b!497762))

(assert (= (and b!497762 (not res!300097)) b!497765))

(declare-fun m!479371 () Bool)

(assert (=> b!497765 m!479371))

(assert (=> b!497762 m!479371))

(assert (=> b!497764 m!479371))

(declare-fun m!479373 () Bool)

(assert (=> d!78443 m!479373))

(assert (=> d!78443 m!479205))

(declare-fun m!479375 () Bool)

(assert (=> b!497766 m!479375))

(assert (=> b!497766 m!479375))

(assert (=> b!497766 m!479181))

(declare-fun m!479377 () Bool)

(assert (=> b!497766 m!479377))

(assert (=> b!497560 d!78443))

(declare-fun d!78445 () Bool)

(assert (=> d!78445 (= (validKeyInArray!0 (select (arr!15466 a!3235) j!176)) (and (not (= (select (arr!15466 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15466 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!497554 d!78445))

(declare-fun bm!31425 () Bool)

(declare-fun call!31428 () Bool)

(declare-fun c!59117 () Bool)

(assert (=> bm!31425 (= call!31428 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59117 (Cons!9527 (select (arr!15466 a!3235) #b00000000000000000000000000000000) Nil!9528) Nil!9528)))))

(declare-fun b!497793 () Bool)

(declare-fun e!291770 () Bool)

(declare-fun e!291769 () Bool)

(assert (=> b!497793 (= e!291770 e!291769)))

(assert (=> b!497793 (= c!59117 (validKeyInArray!0 (select (arr!15466 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497794 () Bool)

(assert (=> b!497794 (= e!291769 call!31428)))

(declare-fun b!497795 () Bool)

(declare-fun e!291767 () Bool)

(declare-fun contains!2694 (List!9531 (_ BitVec 64)) Bool)

(assert (=> b!497795 (= e!291767 (contains!2694 Nil!9528 (select (arr!15466 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497796 () Bool)

(declare-fun e!291768 () Bool)

(assert (=> b!497796 (= e!291768 e!291770)))

(declare-fun res!300112 () Bool)

(assert (=> b!497796 (=> (not res!300112) (not e!291770))))

(assert (=> b!497796 (= res!300112 (not e!291767))))

(declare-fun res!300111 () Bool)

(assert (=> b!497796 (=> (not res!300111) (not e!291767))))

(assert (=> b!497796 (= res!300111 (validKeyInArray!0 (select (arr!15466 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78447 () Bool)

(declare-fun res!300113 () Bool)

(assert (=> d!78447 (=> res!300113 e!291768)))

(assert (=> d!78447 (= res!300113 (bvsge #b00000000000000000000000000000000 (size!15830 a!3235)))))

(assert (=> d!78447 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9528) e!291768)))

(declare-fun b!497797 () Bool)

(assert (=> b!497797 (= e!291769 call!31428)))

(assert (= (and d!78447 (not res!300113)) b!497796))

(assert (= (and b!497796 res!300111) b!497795))

(assert (= (and b!497796 res!300112) b!497793))

(assert (= (and b!497793 c!59117) b!497797))

(assert (= (and b!497793 (not c!59117)) b!497794))

(assert (= (or b!497797 b!497794) bm!31425))

(declare-fun m!479391 () Bool)

(assert (=> bm!31425 m!479391))

(declare-fun m!479393 () Bool)

(assert (=> bm!31425 m!479393))

(assert (=> b!497793 m!479391))

(assert (=> b!497793 m!479391))

(declare-fun m!479395 () Bool)

(assert (=> b!497793 m!479395))

(assert (=> b!497795 m!479391))

(assert (=> b!497795 m!479391))

(declare-fun m!479397 () Bool)

(assert (=> b!497795 m!479397))

(assert (=> b!497796 m!479391))

(assert (=> b!497796 m!479391))

(assert (=> b!497796 m!479395))

(assert (=> b!497559 d!78447))

(declare-fun d!78453 () Bool)

(declare-fun res!300119 () Bool)

(declare-fun e!291775 () Bool)

(assert (=> d!78453 (=> res!300119 e!291775)))

(assert (=> d!78453 (= res!300119 (= (select (arr!15466 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78453 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!291775)))

(declare-fun b!497802 () Bool)

(declare-fun e!291776 () Bool)

(assert (=> b!497802 (= e!291775 e!291776)))

(declare-fun res!300120 () Bool)

(assert (=> b!497802 (=> (not res!300120) (not e!291776))))

(assert (=> b!497802 (= res!300120 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15830 a!3235)))))

(declare-fun b!497803 () Bool)

(assert (=> b!497803 (= e!291776 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78453 (not res!300119)) b!497802))

(assert (= (and b!497802 res!300120) b!497803))

(assert (=> d!78453 m!479391))

(declare-fun m!479401 () Bool)

(assert (=> b!497803 m!479401))

(assert (=> b!497558 d!78453))

(declare-fun d!78457 () Bool)

(assert (=> d!78457 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45278 d!78457))

(declare-fun d!78467 () Bool)

(assert (=> d!78467 (= (array_inv!11325 a!3235) (bvsge (size!15830 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45278 d!78467))

(declare-fun b!497831 () Bool)

(declare-fun e!291795 () Bool)

(declare-fun e!291794 () Bool)

(assert (=> b!497831 (= e!291795 e!291794)))

(declare-fun c!59128 () Bool)

(assert (=> b!497831 (= c!59128 (validKeyInArray!0 (select (arr!15466 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497832 () Bool)

(declare-fun e!291793 () Bool)

(declare-fun call!31430 () Bool)

(assert (=> b!497832 (= e!291793 call!31430)))

(declare-fun b!497833 () Bool)

(assert (=> b!497833 (= e!291794 e!291793)))

(declare-fun lt!225464 () (_ BitVec 64))

(assert (=> b!497833 (= lt!225464 (select (arr!15466 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!225466 () Unit!14791)

(assert (=> b!497833 (= lt!225466 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225464 #b00000000000000000000000000000000))))

(assert (=> b!497833 (arrayContainsKey!0 a!3235 lt!225464 #b00000000000000000000000000000000)))

(declare-fun lt!225465 () Unit!14791)

(assert (=> b!497833 (= lt!225465 lt!225466)))

(declare-fun res!300128 () Bool)

(assert (=> b!497833 (= res!300128 (= (seekEntryOrOpen!0 (select (arr!15466 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3889 #b00000000000000000000000000000000)))))

(assert (=> b!497833 (=> (not res!300128) (not e!291793))))

(declare-fun bm!31427 () Bool)

(assert (=> bm!31427 (= call!31430 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497834 () Bool)

(assert (=> b!497834 (= e!291794 call!31430)))

(declare-fun d!78469 () Bool)

(declare-fun res!300129 () Bool)

(assert (=> d!78469 (=> res!300129 e!291795)))

(assert (=> d!78469 (= res!300129 (bvsge #b00000000000000000000000000000000 (size!15830 a!3235)))))

(assert (=> d!78469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!291795)))

(assert (= (and d!78469 (not res!300129)) b!497831))

(assert (= (and b!497831 c!59128) b!497833))

(assert (= (and b!497831 (not c!59128)) b!497834))

(assert (= (and b!497833 res!300128) b!497832))

(assert (= (or b!497832 b!497834) bm!31427))

(assert (=> b!497831 m!479391))

(assert (=> b!497831 m!479391))

(assert (=> b!497831 m!479395))

(assert (=> b!497833 m!479391))

(declare-fun m!479421 () Bool)

(assert (=> b!497833 m!479421))

(declare-fun m!479423 () Bool)

(assert (=> b!497833 m!479423))

(assert (=> b!497833 m!479391))

(declare-fun m!479425 () Bool)

(assert (=> b!497833 m!479425))

(declare-fun m!479427 () Bool)

(assert (=> bm!31427 m!479427))

(assert (=> b!497557 d!78469))

(declare-fun d!78471 () Bool)

(declare-fun e!291818 () Bool)

(assert (=> d!78471 e!291818))

(declare-fun res!300149 () Bool)

(assert (=> d!78471 (=> (not res!300149) (not e!291818))))

(assert (=> d!78471 (= res!300149 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15830 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15830 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15830 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15830 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15830 a!3235))))))

(declare-fun lt!225484 () Unit!14791)

(declare-fun choose!47 (array!32167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14791)

(assert (=> d!78471 (= lt!225484 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!225318 #b00000000000000000000000000000000 (index!17737 lt!225315) (x!46930 lt!225315) mask!3524))))

(assert (=> d!78471 (validMask!0 mask!3524)))

(assert (=> d!78471 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225318 #b00000000000000000000000000000000 (index!17737 lt!225315) (x!46930 lt!225315) mask!3524) lt!225484)))

(declare-fun b!497871 () Bool)

(assert (=> b!497871 (= e!291818 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225318 (select (store (arr!15466 a!3235) i!1204 k0!2280) j!176) (array!32168 (store (arr!15466 a!3235) i!1204 k0!2280) (size!15830 a!3235)) mask!3524) (Intermediate!3889 false (index!17737 lt!225315) (x!46930 lt!225315))))))

(assert (= (and d!78471 res!300149) b!497871))

(declare-fun m!479455 () Bool)

(assert (=> d!78471 m!479455))

(assert (=> d!78471 m!479205))

(assert (=> b!497871 m!479199))

(assert (=> b!497871 m!479191))

(assert (=> b!497871 m!479191))

(declare-fun m!479457 () Bool)

(assert (=> b!497871 m!479457))

(assert (=> b!497551 d!78471))

(declare-fun d!78485 () Bool)

(declare-fun e!291828 () Bool)

(assert (=> d!78485 e!291828))

(declare-fun c!59138 () Bool)

(declare-fun lt!225486 () SeekEntryResult!3889)

(assert (=> d!78485 (= c!59138 (and ((_ is Intermediate!3889) lt!225486) (undefined!4701 lt!225486)))))

(declare-fun e!291825 () SeekEntryResult!3889)

(assert (=> d!78485 (= lt!225486 e!291825)))

(declare-fun c!59139 () Bool)

(assert (=> d!78485 (= c!59139 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225485 () (_ BitVec 64))

(assert (=> d!78485 (= lt!225485 (select (arr!15466 lt!225319) lt!225318))))

(assert (=> d!78485 (validMask!0 mask!3524)))

(assert (=> d!78485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225318 lt!225314 lt!225319 mask!3524) lt!225486)))

(declare-fun b!497876 () Bool)

(declare-fun e!291827 () SeekEntryResult!3889)

(assert (=> b!497876 (= e!291825 e!291827)))

(declare-fun c!59140 () Bool)

(assert (=> b!497876 (= c!59140 (or (= lt!225485 lt!225314) (= (bvadd lt!225485 lt!225485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497877 () Bool)

(declare-fun e!291829 () Bool)

(assert (=> b!497877 (= e!291828 e!291829)))

(declare-fun res!300158 () Bool)

(assert (=> b!497877 (= res!300158 (and ((_ is Intermediate!3889) lt!225486) (not (undefined!4701 lt!225486)) (bvslt (x!46930 lt!225486) #b01111111111111111111111111111110) (bvsge (x!46930 lt!225486) #b00000000000000000000000000000000) (bvsge (x!46930 lt!225486) #b00000000000000000000000000000000)))))

(assert (=> b!497877 (=> (not res!300158) (not e!291829))))

(declare-fun b!497878 () Bool)

(assert (=> b!497878 (and (bvsge (index!17737 lt!225486) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225486) (size!15830 lt!225319)))))

(declare-fun res!300157 () Bool)

(assert (=> b!497878 (= res!300157 (= (select (arr!15466 lt!225319) (index!17737 lt!225486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291826 () Bool)

(assert (=> b!497878 (=> res!300157 e!291826)))

(declare-fun b!497879 () Bool)

(assert (=> b!497879 (= e!291827 (Intermediate!3889 false lt!225318 #b00000000000000000000000000000000))))

(declare-fun b!497880 () Bool)

(assert (=> b!497880 (and (bvsge (index!17737 lt!225486) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225486) (size!15830 lt!225319)))))

(declare-fun res!300156 () Bool)

(assert (=> b!497880 (= res!300156 (= (select (arr!15466 lt!225319) (index!17737 lt!225486)) lt!225314))))

(assert (=> b!497880 (=> res!300156 e!291826)))

(assert (=> b!497880 (= e!291829 e!291826)))

(declare-fun b!497881 () Bool)

(assert (=> b!497881 (and (bvsge (index!17737 lt!225486) #b00000000000000000000000000000000) (bvslt (index!17737 lt!225486) (size!15830 lt!225319)))))

(assert (=> b!497881 (= e!291826 (= (select (arr!15466 lt!225319) (index!17737 lt!225486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497882 () Bool)

(assert (=> b!497882 (= e!291827 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!225314 lt!225319 mask!3524))))

(declare-fun b!497883 () Bool)

(assert (=> b!497883 (= e!291825 (Intermediate!3889 true lt!225318 #b00000000000000000000000000000000))))

(declare-fun b!497884 () Bool)

(assert (=> b!497884 (= e!291828 (bvsge (x!46930 lt!225486) #b01111111111111111111111111111110))))

(assert (= (and d!78485 c!59139) b!497883))

(assert (= (and d!78485 (not c!59139)) b!497876))

(assert (= (and b!497876 c!59140) b!497879))

(assert (= (and b!497876 (not c!59140)) b!497882))

(assert (= (and d!78485 c!59138) b!497884))

(assert (= (and d!78485 (not c!59138)) b!497877))

(assert (= (and b!497877 res!300158) b!497880))

(assert (= (and b!497880 (not res!300156)) b!497878))

(assert (= (and b!497878 (not res!300157)) b!497881))

(declare-fun m!479459 () Bool)

(assert (=> b!497881 m!479459))

(assert (=> b!497878 m!479459))

(assert (=> b!497880 m!479459))

(declare-fun m!479461 () Bool)

(assert (=> d!78485 m!479461))

(assert (=> d!78485 m!479205))

(assert (=> b!497882 m!479375))

(assert (=> b!497882 m!479375))

(declare-fun m!479463 () Bool)

(assert (=> b!497882 m!479463))

(assert (=> b!497551 d!78485))

(check-sat (not d!78431) (not bm!31425) (not d!78429) (not d!78411) (not b!497683) (not b!497871) (not b!497795) (not b!497833) (not b!497793) (not b!497664) (not b!497831) (not b!497685) (not b!497803) (not b!497766) (not d!78485) (not b!497882) (not d!78471) (not bm!31416) (not b!497796) (not d!78443) (not b!497658) (not bm!31427) (not b!497749) (not d!78409))
(check-sat)
