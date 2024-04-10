; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45634 () Bool)

(assert start!45634)

(declare-fun b!503095 () Bool)

(declare-fun e!294643 () Bool)

(assert (=> b!503095 (= e!294643 true)))

(declare-fun lt!228807 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4042 0))(
  ( (MissingZero!4042 (index!18356 (_ BitVec 32))) (Found!4042 (index!18357 (_ BitVec 32))) (Intermediate!4042 (undefined!4854 Bool) (index!18358 (_ BitVec 32)) (x!47379 (_ BitVec 32))) (Undefined!4042) (MissingVacant!4042 (index!18359 (_ BitVec 32))) )
))
(declare-fun lt!228805 () SeekEntryResult!4042)

(declare-datatypes ((array!32390 0))(
  ( (array!32391 (arr!15575 (Array (_ BitVec 32) (_ BitVec 64))) (size!15939 (_ BitVec 32))) )
))
(declare-fun lt!228804 () array!32390)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!228803 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32390 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!503095 (= lt!228805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228807 lt!228803 lt!228804 mask!3524))))

(declare-fun b!503096 () Bool)

(declare-fun e!294647 () Bool)

(assert (=> b!503096 (= e!294647 e!294643)))

(declare-fun res!304442 () Bool)

(assert (=> b!503096 (=> res!304442 e!294643)))

(declare-fun a!3235 () array!32390)

(declare-fun lt!228808 () SeekEntryResult!4042)

(assert (=> b!503096 (= res!304442 (or (bvsgt (x!47379 lt!228808) #b01111111111111111111111111111110) (bvslt lt!228807 #b00000000000000000000000000000000) (bvsge lt!228807 (size!15939 a!3235)) (bvslt (index!18358 lt!228808) #b00000000000000000000000000000000) (bvsge (index!18358 lt!228808) (size!15939 a!3235)) (not (= lt!228808 (Intermediate!4042 false (index!18358 lt!228808) (x!47379 lt!228808))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503096 (= (index!18358 lt!228808) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15244 0))(
  ( (Unit!15245) )
))
(declare-fun lt!228806 () Unit!15244)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32390 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15244)

(assert (=> b!503096 (= lt!228806 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228807 #b00000000000000000000000000000000 (index!18358 lt!228808) (x!47379 lt!228808) mask!3524))))

(assert (=> b!503096 (and (or (= (select (arr!15575 a!3235) (index!18358 lt!228808)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15575 a!3235) (index!18358 lt!228808)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15575 a!3235) (index!18358 lt!228808)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15575 a!3235) (index!18358 lt!228808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228810 () Unit!15244)

(declare-fun e!294648 () Unit!15244)

(assert (=> b!503096 (= lt!228810 e!294648)))

(declare-fun c!59609 () Bool)

(assert (=> b!503096 (= c!59609 (= (select (arr!15575 a!3235) (index!18358 lt!228808)) (select (arr!15575 a!3235) j!176)))))

(assert (=> b!503096 (and (bvslt (x!47379 lt!228808) #b01111111111111111111111111111110) (or (= (select (arr!15575 a!3235) (index!18358 lt!228808)) (select (arr!15575 a!3235) j!176)) (= (select (arr!15575 a!3235) (index!18358 lt!228808)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15575 a!3235) (index!18358 lt!228808)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503097 () Bool)

(declare-fun res!304446 () Bool)

(assert (=> b!503097 (=> res!304446 e!294647)))

(assert (=> b!503097 (= res!304446 (or (undefined!4854 lt!228808) (not (is-Intermediate!4042 lt!228808))))))

(declare-fun b!503098 () Bool)

(declare-fun Unit!15246 () Unit!15244)

(assert (=> b!503098 (= e!294648 Unit!15246)))

(declare-fun b!503099 () Bool)

(declare-fun res!304444 () Bool)

(declare-fun e!294642 () Bool)

(assert (=> b!503099 (=> (not res!304444) (not e!294642))))

(assert (=> b!503099 (= res!304444 (and (= (size!15939 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15939 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15939 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!304443 () Bool)

(assert (=> start!45634 (=> (not res!304443) (not e!294642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45634 (= res!304443 (validMask!0 mask!3524))))

(assert (=> start!45634 e!294642))

(assert (=> start!45634 true))

(declare-fun array_inv!11371 (array!32390) Bool)

(assert (=> start!45634 (array_inv!11371 a!3235)))

(declare-fun b!503100 () Bool)

(declare-fun e!294640 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32390 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!503100 (= e!294640 (= (seekEntryOrOpen!0 (select (arr!15575 a!3235) j!176) a!3235 mask!3524) (Found!4042 j!176)))))

(declare-fun b!503101 () Bool)

(declare-fun res!304439 () Bool)

(assert (=> b!503101 (=> (not res!304439) (not e!294642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503101 (= res!304439 (validKeyInArray!0 (select (arr!15575 a!3235) j!176)))))

(declare-fun b!503102 () Bool)

(declare-fun res!304438 () Bool)

(assert (=> b!503102 (=> (not res!304438) (not e!294642))))

(declare-fun arrayContainsKey!0 (array!32390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503102 (= res!304438 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503103 () Bool)

(declare-fun res!304445 () Bool)

(declare-fun e!294645 () Bool)

(assert (=> b!503103 (=> (not res!304445) (not e!294645))))

(declare-datatypes ((List!9733 0))(
  ( (Nil!9730) (Cons!9729 (h!10606 (_ BitVec 64)) (t!15961 List!9733)) )
))
(declare-fun arrayNoDuplicates!0 (array!32390 (_ BitVec 32) List!9733) Bool)

(assert (=> b!503103 (= res!304445 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9730))))

(declare-fun b!503104 () Bool)

(declare-fun Unit!15247 () Unit!15244)

(assert (=> b!503104 (= e!294648 Unit!15247)))

(declare-fun lt!228809 () Unit!15244)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32390 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15244)

(assert (=> b!503104 (= lt!228809 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228807 #b00000000000000000000000000000000 (index!18358 lt!228808) (x!47379 lt!228808) mask!3524))))

(declare-fun res!304448 () Bool)

(assert (=> b!503104 (= res!304448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228807 lt!228803 lt!228804 mask!3524) (Intermediate!4042 false (index!18358 lt!228808) (x!47379 lt!228808))))))

(declare-fun e!294641 () Bool)

(assert (=> b!503104 (=> (not res!304448) (not e!294641))))

(assert (=> b!503104 e!294641))

(declare-fun b!503105 () Bool)

(declare-fun res!304435 () Bool)

(assert (=> b!503105 (=> res!304435 e!294643)))

(declare-fun e!294644 () Bool)

(assert (=> b!503105 (= res!304435 e!294644)))

(declare-fun res!304436 () Bool)

(assert (=> b!503105 (=> (not res!304436) (not e!294644))))

(assert (=> b!503105 (= res!304436 (bvsgt #b00000000000000000000000000000000 (x!47379 lt!228808)))))

(declare-fun b!503106 () Bool)

(assert (=> b!503106 (= e!294645 (not e!294647))))

(declare-fun res!304434 () Bool)

(assert (=> b!503106 (=> res!304434 e!294647)))

(declare-fun lt!228801 () (_ BitVec 32))

(assert (=> b!503106 (= res!304434 (= lt!228808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228801 lt!228803 lt!228804 mask!3524)))))

(assert (=> b!503106 (= lt!228808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228807 (select (arr!15575 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503106 (= lt!228801 (toIndex!0 lt!228803 mask!3524))))

(assert (=> b!503106 (= lt!228803 (select (store (arr!15575 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503106 (= lt!228807 (toIndex!0 (select (arr!15575 a!3235) j!176) mask!3524))))

(assert (=> b!503106 (= lt!228804 (array!32391 (store (arr!15575 a!3235) i!1204 k!2280) (size!15939 a!3235)))))

(assert (=> b!503106 e!294640))

(declare-fun res!304441 () Bool)

(assert (=> b!503106 (=> (not res!304441) (not e!294640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32390 (_ BitVec 32)) Bool)

(assert (=> b!503106 (= res!304441 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228811 () Unit!15244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15244)

(assert (=> b!503106 (= lt!228811 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503107 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32390 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!503107 (= e!294644 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228807 (index!18358 lt!228808) (select (arr!15575 a!3235) j!176) a!3235 mask!3524) (Found!4042 j!176))))))

(declare-fun b!503108 () Bool)

(declare-fun res!304440 () Bool)

(assert (=> b!503108 (=> (not res!304440) (not e!294645))))

(assert (=> b!503108 (= res!304440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503109 () Bool)

(declare-fun res!304437 () Bool)

(assert (=> b!503109 (=> (not res!304437) (not e!294642))))

(assert (=> b!503109 (= res!304437 (validKeyInArray!0 k!2280))))

(declare-fun b!503110 () Bool)

(assert (=> b!503110 (= e!294642 e!294645)))

(declare-fun res!304447 () Bool)

(assert (=> b!503110 (=> (not res!304447) (not e!294645))))

(declare-fun lt!228802 () SeekEntryResult!4042)

(assert (=> b!503110 (= res!304447 (or (= lt!228802 (MissingZero!4042 i!1204)) (= lt!228802 (MissingVacant!4042 i!1204))))))

(assert (=> b!503110 (= lt!228802 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503111 () Bool)

(assert (=> b!503111 (= e!294641 false)))

(assert (= (and start!45634 res!304443) b!503099))

(assert (= (and b!503099 res!304444) b!503101))

(assert (= (and b!503101 res!304439) b!503109))

(assert (= (and b!503109 res!304437) b!503102))

(assert (= (and b!503102 res!304438) b!503110))

(assert (= (and b!503110 res!304447) b!503108))

(assert (= (and b!503108 res!304440) b!503103))

(assert (= (and b!503103 res!304445) b!503106))

(assert (= (and b!503106 res!304441) b!503100))

(assert (= (and b!503106 (not res!304434)) b!503097))

(assert (= (and b!503097 (not res!304446)) b!503096))

(assert (= (and b!503096 c!59609) b!503104))

(assert (= (and b!503096 (not c!59609)) b!503098))

(assert (= (and b!503104 res!304448) b!503111))

(assert (= (and b!503096 (not res!304442)) b!503105))

(assert (= (and b!503105 res!304436) b!503107))

(assert (= (and b!503105 (not res!304435)) b!503095))

(declare-fun m!483965 () Bool)

(assert (=> start!45634 m!483965))

(declare-fun m!483967 () Bool)

(assert (=> start!45634 m!483967))

(declare-fun m!483969 () Bool)

(assert (=> b!503106 m!483969))

(declare-fun m!483971 () Bool)

(assert (=> b!503106 m!483971))

(declare-fun m!483973 () Bool)

(assert (=> b!503106 m!483973))

(declare-fun m!483975 () Bool)

(assert (=> b!503106 m!483975))

(declare-fun m!483977 () Bool)

(assert (=> b!503106 m!483977))

(declare-fun m!483979 () Bool)

(assert (=> b!503106 m!483979))

(assert (=> b!503106 m!483971))

(declare-fun m!483981 () Bool)

(assert (=> b!503106 m!483981))

(assert (=> b!503106 m!483971))

(declare-fun m!483983 () Bool)

(assert (=> b!503106 m!483983))

(declare-fun m!483985 () Bool)

(assert (=> b!503106 m!483985))

(declare-fun m!483987 () Bool)

(assert (=> b!503103 m!483987))

(declare-fun m!483989 () Bool)

(assert (=> b!503095 m!483989))

(declare-fun m!483991 () Bool)

(assert (=> b!503102 m!483991))

(assert (=> b!503100 m!483971))

(assert (=> b!503100 m!483971))

(declare-fun m!483993 () Bool)

(assert (=> b!503100 m!483993))

(declare-fun m!483995 () Bool)

(assert (=> b!503109 m!483995))

(declare-fun m!483997 () Bool)

(assert (=> b!503108 m!483997))

(declare-fun m!483999 () Bool)

(assert (=> b!503096 m!483999))

(declare-fun m!484001 () Bool)

(assert (=> b!503096 m!484001))

(assert (=> b!503096 m!483971))

(assert (=> b!503107 m!483971))

(assert (=> b!503107 m!483971))

(declare-fun m!484003 () Bool)

(assert (=> b!503107 m!484003))

(declare-fun m!484005 () Bool)

(assert (=> b!503110 m!484005))

(declare-fun m!484007 () Bool)

(assert (=> b!503104 m!484007))

(assert (=> b!503104 m!483989))

(assert (=> b!503101 m!483971))

(assert (=> b!503101 m!483971))

(declare-fun m!484009 () Bool)

(assert (=> b!503101 m!484009))

(push 1)

