; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45648 () Bool)

(assert start!45648)

(declare-fun b!503487 () Bool)

(declare-datatypes ((Unit!15274 0))(
  ( (Unit!15275) )
))
(declare-fun e!294824 () Unit!15274)

(declare-fun Unit!15276 () Unit!15274)

(assert (=> b!503487 (= e!294824 Unit!15276)))

(declare-fun lt!228998 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!229004 () Unit!15274)

(declare-datatypes ((array!32414 0))(
  ( (array!32415 (arr!15587 (Array (_ BitVec 32) (_ BitVec 64))) (size!15952 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32414)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4051 0))(
  ( (MissingZero!4051 (index!18392 (_ BitVec 32))) (Found!4051 (index!18393 (_ BitVec 32))) (Intermediate!4051 (undefined!4863 Bool) (index!18394 (_ BitVec 32)) (x!47423 (_ BitVec 32))) (Undefined!4051) (MissingVacant!4051 (index!18395 (_ BitVec 32))) )
))
(declare-fun lt!229005 () SeekEntryResult!4051)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32414 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15274)

(assert (=> b!503487 (= lt!229004 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228998 #b00000000000000000000000000000000 (index!18394 lt!229005) (x!47423 lt!229005) mask!3524))))

(declare-fun lt!228996 () array!32414)

(declare-fun lt!228997 () (_ BitVec 64))

(declare-fun res!304898 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32414 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!503487 (= res!304898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228998 lt!228997 lt!228996 mask!3524) (Intermediate!4051 false (index!18394 lt!229005) (x!47423 lt!229005))))))

(declare-fun e!294817 () Bool)

(assert (=> b!503487 (=> (not res!304898) (not e!294817))))

(assert (=> b!503487 e!294817))

(declare-fun b!503488 () Bool)

(declare-fun res!304899 () Bool)

(declare-fun e!294821 () Bool)

(assert (=> b!503488 (=> (not res!304899) (not e!294821))))

(declare-datatypes ((List!9784 0))(
  ( (Nil!9781) (Cons!9780 (h!10657 (_ BitVec 64)) (t!16003 List!9784)) )
))
(declare-fun arrayNoDuplicates!0 (array!32414 (_ BitVec 32) List!9784) Bool)

(assert (=> b!503488 (= res!304899 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9781))))

(declare-fun b!503489 () Bool)

(declare-fun res!304902 () Bool)

(declare-fun e!294822 () Bool)

(assert (=> b!503489 (=> (not res!304902) (not e!294822))))

(declare-fun arrayContainsKey!0 (array!32414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503489 (= res!304902 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503490 () Bool)

(assert (=> b!503490 (= e!294817 false)))

(declare-fun b!503491 () Bool)

(declare-fun e!294818 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32414 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!503491 (= e!294818 (= (seekEntryOrOpen!0 (select (arr!15587 a!3235) j!176) a!3235 mask!3524) (Found!4051 j!176)))))

(declare-fun b!503493 () Bool)

(declare-fun res!304895 () Bool)

(declare-fun e!294825 () Bool)

(assert (=> b!503493 (=> res!304895 e!294825)))

(declare-fun e!294823 () Bool)

(assert (=> b!503493 (= res!304895 e!294823)))

(declare-fun res!304897 () Bool)

(assert (=> b!503493 (=> (not res!304897) (not e!294823))))

(assert (=> b!503493 (= res!304897 (bvsgt #b00000000000000000000000000000000 (x!47423 lt!229005)))))

(declare-fun b!503494 () Bool)

(assert (=> b!503494 (= e!294822 e!294821)))

(declare-fun res!304892 () Bool)

(assert (=> b!503494 (=> (not res!304892) (not e!294821))))

(declare-fun lt!228999 () SeekEntryResult!4051)

(assert (=> b!503494 (= res!304892 (or (= lt!228999 (MissingZero!4051 i!1204)) (= lt!228999 (MissingVacant!4051 i!1204))))))

(assert (=> b!503494 (= lt!228999 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503495 () Bool)

(declare-fun res!304903 () Bool)

(assert (=> b!503495 (=> (not res!304903) (not e!294821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32414 (_ BitVec 32)) Bool)

(assert (=> b!503495 (= res!304903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503496 () Bool)

(declare-fun e!294820 () Bool)

(assert (=> b!503496 (= e!294821 (not e!294820))))

(declare-fun res!304904 () Bool)

(assert (=> b!503496 (=> res!304904 e!294820)))

(declare-fun lt!229000 () (_ BitVec 32))

(assert (=> b!503496 (= res!304904 (= lt!229005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229000 lt!228997 lt!228996 mask!3524)))))

(assert (=> b!503496 (= lt!229005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228998 (select (arr!15587 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503496 (= lt!229000 (toIndex!0 lt!228997 mask!3524))))

(assert (=> b!503496 (= lt!228997 (select (store (arr!15587 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503496 (= lt!228998 (toIndex!0 (select (arr!15587 a!3235) j!176) mask!3524))))

(assert (=> b!503496 (= lt!228996 (array!32415 (store (arr!15587 a!3235) i!1204 k0!2280) (size!15952 a!3235)))))

(assert (=> b!503496 e!294818))

(declare-fun res!304901 () Bool)

(assert (=> b!503496 (=> (not res!304901) (not e!294818))))

(assert (=> b!503496 (= res!304901 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229006 () Unit!15274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15274)

(assert (=> b!503496 (= lt!229006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503497 () Bool)

(assert (=> b!503497 (= e!294825 true)))

(declare-fun lt!229001 () SeekEntryResult!4051)

(assert (=> b!503497 (= lt!229001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228998 lt!228997 lt!228996 mask!3524))))

(declare-fun b!503498 () Bool)

(declare-fun res!304896 () Bool)

(assert (=> b!503498 (=> (not res!304896) (not e!294822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503498 (= res!304896 (validKeyInArray!0 k0!2280))))

(declare-fun b!503499 () Bool)

(assert (=> b!503499 (= e!294820 e!294825)))

(declare-fun res!304900 () Bool)

(assert (=> b!503499 (=> res!304900 e!294825)))

(assert (=> b!503499 (= res!304900 (or (bvsgt (x!47423 lt!229005) #b01111111111111111111111111111110) (bvslt lt!228998 #b00000000000000000000000000000000) (bvsge lt!228998 (size!15952 a!3235)) (bvslt (index!18394 lt!229005) #b00000000000000000000000000000000) (bvsge (index!18394 lt!229005) (size!15952 a!3235)) (not (= lt!229005 (Intermediate!4051 false (index!18394 lt!229005) (x!47423 lt!229005))))))))

(assert (=> b!503499 (= (index!18394 lt!229005) i!1204)))

(declare-fun lt!229002 () Unit!15274)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32414 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15274)

(assert (=> b!503499 (= lt!229002 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228998 #b00000000000000000000000000000000 (index!18394 lt!229005) (x!47423 lt!229005) mask!3524))))

(assert (=> b!503499 (and (or (= (select (arr!15587 a!3235) (index!18394 lt!229005)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15587 a!3235) (index!18394 lt!229005)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15587 a!3235) (index!18394 lt!229005)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15587 a!3235) (index!18394 lt!229005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229003 () Unit!15274)

(assert (=> b!503499 (= lt!229003 e!294824)))

(declare-fun c!59577 () Bool)

(assert (=> b!503499 (= c!59577 (= (select (arr!15587 a!3235) (index!18394 lt!229005)) (select (arr!15587 a!3235) j!176)))))

(assert (=> b!503499 (and (bvslt (x!47423 lt!229005) #b01111111111111111111111111111110) (or (= (select (arr!15587 a!3235) (index!18394 lt!229005)) (select (arr!15587 a!3235) j!176)) (= (select (arr!15587 a!3235) (index!18394 lt!229005)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15587 a!3235) (index!18394 lt!229005)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503500 () Bool)

(declare-fun res!304894 () Bool)

(assert (=> b!503500 (=> (not res!304894) (not e!294822))))

(assert (=> b!503500 (= res!304894 (and (= (size!15952 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15952 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15952 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503501 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32414 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!503501 (= e!294823 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228998 (index!18394 lt!229005) (select (arr!15587 a!3235) j!176) a!3235 mask!3524) (Found!4051 j!176))))))

(declare-fun res!304890 () Bool)

(assert (=> start!45648 (=> (not res!304890) (not e!294822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45648 (= res!304890 (validMask!0 mask!3524))))

(assert (=> start!45648 e!294822))

(assert (=> start!45648 true))

(declare-fun array_inv!11470 (array!32414) Bool)

(assert (=> start!45648 (array_inv!11470 a!3235)))

(declare-fun b!503492 () Bool)

(declare-fun res!304893 () Bool)

(assert (=> b!503492 (=> res!304893 e!294820)))

(get-info :version)

(assert (=> b!503492 (= res!304893 (or (undefined!4863 lt!229005) (not ((_ is Intermediate!4051) lt!229005))))))

(declare-fun b!503502 () Bool)

(declare-fun res!304891 () Bool)

(assert (=> b!503502 (=> (not res!304891) (not e!294822))))

(assert (=> b!503502 (= res!304891 (validKeyInArray!0 (select (arr!15587 a!3235) j!176)))))

(declare-fun b!503503 () Bool)

(declare-fun Unit!15277 () Unit!15274)

(assert (=> b!503503 (= e!294824 Unit!15277)))

(assert (= (and start!45648 res!304890) b!503500))

(assert (= (and b!503500 res!304894) b!503502))

(assert (= (and b!503502 res!304891) b!503498))

(assert (= (and b!503498 res!304896) b!503489))

(assert (= (and b!503489 res!304902) b!503494))

(assert (= (and b!503494 res!304892) b!503495))

(assert (= (and b!503495 res!304903) b!503488))

(assert (= (and b!503488 res!304899) b!503496))

(assert (= (and b!503496 res!304901) b!503491))

(assert (= (and b!503496 (not res!304904)) b!503492))

(assert (= (and b!503492 (not res!304893)) b!503499))

(assert (= (and b!503499 c!59577) b!503487))

(assert (= (and b!503499 (not c!59577)) b!503503))

(assert (= (and b!503487 res!304898) b!503490))

(assert (= (and b!503499 (not res!304900)) b!503493))

(assert (= (and b!503493 res!304897) b!503501))

(assert (= (and b!503493 (not res!304895)) b!503497))

(declare-fun m!483811 () Bool)

(assert (=> b!503489 m!483811))

(declare-fun m!483813 () Bool)

(assert (=> b!503502 m!483813))

(assert (=> b!503502 m!483813))

(declare-fun m!483815 () Bool)

(assert (=> b!503502 m!483815))

(declare-fun m!483817 () Bool)

(assert (=> b!503487 m!483817))

(declare-fun m!483819 () Bool)

(assert (=> b!503487 m!483819))

(declare-fun m!483821 () Bool)

(assert (=> b!503496 m!483821))

(declare-fun m!483823 () Bool)

(assert (=> b!503496 m!483823))

(declare-fun m!483825 () Bool)

(assert (=> b!503496 m!483825))

(declare-fun m!483827 () Bool)

(assert (=> b!503496 m!483827))

(assert (=> b!503496 m!483813))

(declare-fun m!483829 () Bool)

(assert (=> b!503496 m!483829))

(assert (=> b!503496 m!483813))

(assert (=> b!503496 m!483813))

(declare-fun m!483831 () Bool)

(assert (=> b!503496 m!483831))

(declare-fun m!483833 () Bool)

(assert (=> b!503496 m!483833))

(declare-fun m!483835 () Bool)

(assert (=> b!503496 m!483835))

(assert (=> b!503491 m!483813))

(assert (=> b!503491 m!483813))

(declare-fun m!483837 () Bool)

(assert (=> b!503491 m!483837))

(declare-fun m!483839 () Bool)

(assert (=> b!503495 m!483839))

(declare-fun m!483841 () Bool)

(assert (=> b!503499 m!483841))

(declare-fun m!483843 () Bool)

(assert (=> b!503499 m!483843))

(assert (=> b!503499 m!483813))

(declare-fun m!483845 () Bool)

(assert (=> b!503488 m!483845))

(declare-fun m!483847 () Bool)

(assert (=> start!45648 m!483847))

(declare-fun m!483849 () Bool)

(assert (=> start!45648 m!483849))

(assert (=> b!503501 m!483813))

(assert (=> b!503501 m!483813))

(declare-fun m!483851 () Bool)

(assert (=> b!503501 m!483851))

(declare-fun m!483853 () Bool)

(assert (=> b!503494 m!483853))

(declare-fun m!483855 () Bool)

(assert (=> b!503498 m!483855))

(assert (=> b!503497 m!483819))

(check-sat (not b!503496) (not b!503495) (not b!503488) (not b!503494) (not b!503497) (not b!503498) (not b!503487) (not b!503491) (not b!503501) (not start!45648) (not b!503502) (not b!503499) (not b!503489))
(check-sat)
