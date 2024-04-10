; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45390 () Bool)

(assert start!45390)

(declare-fun b!498738 () Bool)

(declare-fun res!300800 () Bool)

(declare-fun e!292300 () Bool)

(assert (=> b!498738 (=> (not res!300800) (not e!292300))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32215 0))(
  ( (array!32216 (arr!15489 (Array (_ BitVec 32) (_ BitVec 64))) (size!15853 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32215)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498738 (= res!300800 (and (= (size!15853 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15853 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15853 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498739 () Bool)

(declare-datatypes ((Unit!14900 0))(
  ( (Unit!14901) )
))
(declare-fun e!292301 () Unit!14900)

(declare-fun Unit!14902 () Unit!14900)

(assert (=> b!498739 (= e!292301 Unit!14902)))

(declare-datatypes ((SeekEntryResult!3956 0))(
  ( (MissingZero!3956 (index!18006 (_ BitVec 32))) (Found!3956 (index!18007 (_ BitVec 32))) (Intermediate!3956 (undefined!4768 Bool) (index!18008 (_ BitVec 32)) (x!47057 (_ BitVec 32))) (Undefined!3956) (MissingVacant!3956 (index!18009 (_ BitVec 32))) )
))
(declare-fun lt!225981 () SeekEntryResult!3956)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!225979 () Unit!14900)

(declare-fun lt!225982 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32215 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14900)

(assert (=> b!498739 (= lt!225979 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225982 #b00000000000000000000000000000000 (index!18008 lt!225981) (x!47057 lt!225981) mask!3524))))

(declare-fun lt!225983 () array!32215)

(declare-fun lt!225984 () (_ BitVec 64))

(declare-fun res!300796 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32215 (_ BitVec 32)) SeekEntryResult!3956)

(assert (=> b!498739 (= res!300796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225982 lt!225984 lt!225983 mask!3524) (Intermediate!3956 false (index!18008 lt!225981) (x!47057 lt!225981))))))

(declare-fun e!292296 () Bool)

(assert (=> b!498739 (=> (not res!300796) (not e!292296))))

(assert (=> b!498739 e!292296))

(declare-fun b!498740 () Bool)

(declare-fun res!300801 () Bool)

(declare-fun e!292297 () Bool)

(assert (=> b!498740 (=> (not res!300801) (not e!292297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32215 (_ BitVec 32)) Bool)

(assert (=> b!498740 (= res!300801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498741 () Bool)

(declare-fun e!292299 () Bool)

(assert (=> b!498741 (= e!292297 (not e!292299))))

(declare-fun res!300804 () Bool)

(assert (=> b!498741 (=> res!300804 e!292299)))

(declare-fun lt!225986 () (_ BitVec 32))

(assert (=> b!498741 (= res!300804 (= lt!225981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225986 lt!225984 lt!225983 mask!3524)))))

(assert (=> b!498741 (= lt!225981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225982 (select (arr!15489 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498741 (= lt!225986 (toIndex!0 lt!225984 mask!3524))))

(assert (=> b!498741 (= lt!225984 (select (store (arr!15489 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498741 (= lt!225982 (toIndex!0 (select (arr!15489 a!3235) j!176) mask!3524))))

(assert (=> b!498741 (= lt!225983 (array!32216 (store (arr!15489 a!3235) i!1204 k!2280) (size!15853 a!3235)))))

(declare-fun e!292302 () Bool)

(assert (=> b!498741 e!292302))

(declare-fun res!300799 () Bool)

(assert (=> b!498741 (=> (not res!300799) (not e!292302))))

(assert (=> b!498741 (= res!300799 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225985 () Unit!14900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14900)

(assert (=> b!498741 (= lt!225985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498742 () Bool)

(declare-fun Unit!14903 () Unit!14900)

(assert (=> b!498742 (= e!292301 Unit!14903)))

(declare-fun b!498743 () Bool)

(declare-fun res!300802 () Bool)

(assert (=> b!498743 (=> (not res!300802) (not e!292300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498743 (= res!300802 (validKeyInArray!0 (select (arr!15489 a!3235) j!176)))))

(declare-fun b!498744 () Bool)

(declare-fun res!300798 () Bool)

(assert (=> b!498744 (=> (not res!300798) (not e!292297))))

(declare-datatypes ((List!9647 0))(
  ( (Nil!9644) (Cons!9643 (h!10517 (_ BitVec 64)) (t!15875 List!9647)) )
))
(declare-fun arrayNoDuplicates!0 (array!32215 (_ BitVec 32) List!9647) Bool)

(assert (=> b!498744 (= res!300798 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9644))))

(declare-fun b!498745 () Bool)

(declare-fun e!292295 () Bool)

(assert (=> b!498745 (= e!292299 e!292295)))

(declare-fun res!300805 () Bool)

(assert (=> b!498745 (=> res!300805 e!292295)))

(assert (=> b!498745 (= res!300805 (or (bvsgt #b00000000000000000000000000000000 (x!47057 lt!225981)) (bvsgt (x!47057 lt!225981) #b01111111111111111111111111111110) (bvslt lt!225982 #b00000000000000000000000000000000) (bvsge lt!225982 (size!15853 a!3235)) (bvslt (index!18008 lt!225981) #b00000000000000000000000000000000) (bvsge (index!18008 lt!225981) (size!15853 a!3235)) (not (= lt!225981 (Intermediate!3956 false (index!18008 lt!225981) (x!47057 lt!225981))))))))

(assert (=> b!498745 (and (or (= (select (arr!15489 a!3235) (index!18008 lt!225981)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15489 a!3235) (index!18008 lt!225981)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15489 a!3235) (index!18008 lt!225981)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15489 a!3235) (index!18008 lt!225981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225988 () Unit!14900)

(assert (=> b!498745 (= lt!225988 e!292301)))

(declare-fun c!59249 () Bool)

(assert (=> b!498745 (= c!59249 (= (select (arr!15489 a!3235) (index!18008 lt!225981)) (select (arr!15489 a!3235) j!176)))))

(assert (=> b!498745 (and (bvslt (x!47057 lt!225981) #b01111111111111111111111111111110) (or (= (select (arr!15489 a!3235) (index!18008 lt!225981)) (select (arr!15489 a!3235) j!176)) (= (select (arr!15489 a!3235) (index!18008 lt!225981)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15489 a!3235) (index!18008 lt!225981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498746 () Bool)

(assert (=> b!498746 (= e!292295 true)))

(declare-fun lt!225987 () SeekEntryResult!3956)

(assert (=> b!498746 (= lt!225987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225982 lt!225984 lt!225983 mask!3524))))

(declare-fun b!498747 () Bool)

(declare-fun res!300795 () Bool)

(assert (=> b!498747 (=> (not res!300795) (not e!292300))))

(declare-fun arrayContainsKey!0 (array!32215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498747 (= res!300795 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498748 () Bool)

(assert (=> b!498748 (= e!292300 e!292297)))

(declare-fun res!300797 () Bool)

(assert (=> b!498748 (=> (not res!300797) (not e!292297))))

(declare-fun lt!225980 () SeekEntryResult!3956)

(assert (=> b!498748 (= res!300797 (or (= lt!225980 (MissingZero!3956 i!1204)) (= lt!225980 (MissingVacant!3956 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32215 (_ BitVec 32)) SeekEntryResult!3956)

(assert (=> b!498748 (= lt!225980 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498749 () Bool)

(assert (=> b!498749 (= e!292302 (= (seekEntryOrOpen!0 (select (arr!15489 a!3235) j!176) a!3235 mask!3524) (Found!3956 j!176)))))

(declare-fun res!300794 () Bool)

(assert (=> start!45390 (=> (not res!300794) (not e!292300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45390 (= res!300794 (validMask!0 mask!3524))))

(assert (=> start!45390 e!292300))

(assert (=> start!45390 true))

(declare-fun array_inv!11285 (array!32215) Bool)

(assert (=> start!45390 (array_inv!11285 a!3235)))

(declare-fun b!498750 () Bool)

(declare-fun res!300803 () Bool)

(assert (=> b!498750 (=> (not res!300803) (not e!292300))))

(assert (=> b!498750 (= res!300803 (validKeyInArray!0 k!2280))))

(declare-fun b!498751 () Bool)

(declare-fun res!300806 () Bool)

(assert (=> b!498751 (=> res!300806 e!292299)))

(assert (=> b!498751 (= res!300806 (or (undefined!4768 lt!225981) (not (is-Intermediate!3956 lt!225981))))))

(declare-fun b!498752 () Bool)

(assert (=> b!498752 (= e!292296 false)))

(assert (= (and start!45390 res!300794) b!498738))

(assert (= (and b!498738 res!300800) b!498743))

(assert (= (and b!498743 res!300802) b!498750))

(assert (= (and b!498750 res!300803) b!498747))

(assert (= (and b!498747 res!300795) b!498748))

(assert (= (and b!498748 res!300797) b!498740))

(assert (= (and b!498740 res!300801) b!498744))

(assert (= (and b!498744 res!300798) b!498741))

(assert (= (and b!498741 res!300799) b!498749))

(assert (= (and b!498741 (not res!300804)) b!498751))

(assert (= (and b!498751 (not res!300806)) b!498745))

(assert (= (and b!498745 c!59249) b!498739))

(assert (= (and b!498745 (not c!59249)) b!498742))

(assert (= (and b!498739 res!300796) b!498752))

(assert (= (and b!498745 (not res!300805)) b!498746))

(declare-fun m!479985 () Bool)

(assert (=> b!498746 m!479985))

(declare-fun m!479987 () Bool)

(assert (=> b!498749 m!479987))

(assert (=> b!498749 m!479987))

(declare-fun m!479989 () Bool)

(assert (=> b!498749 m!479989))

(declare-fun m!479991 () Bool)

(assert (=> b!498750 m!479991))

(assert (=> b!498743 m!479987))

(assert (=> b!498743 m!479987))

(declare-fun m!479993 () Bool)

(assert (=> b!498743 m!479993))

(declare-fun m!479995 () Bool)

(assert (=> b!498748 m!479995))

(declare-fun m!479997 () Bool)

(assert (=> start!45390 m!479997))

(declare-fun m!479999 () Bool)

(assert (=> start!45390 m!479999))

(declare-fun m!480001 () Bool)

(assert (=> b!498745 m!480001))

(assert (=> b!498745 m!479987))

(declare-fun m!480003 () Bool)

(assert (=> b!498747 m!480003))

(declare-fun m!480005 () Bool)

(assert (=> b!498740 m!480005))

(declare-fun m!480007 () Bool)

(assert (=> b!498739 m!480007))

(assert (=> b!498739 m!479985))

(declare-fun m!480009 () Bool)

(assert (=> b!498741 m!480009))

(declare-fun m!480011 () Bool)

(assert (=> b!498741 m!480011))

(declare-fun m!480013 () Bool)

(assert (=> b!498741 m!480013))

(declare-fun m!480015 () Bool)

(assert (=> b!498741 m!480015))

(assert (=> b!498741 m!479987))

(declare-fun m!480017 () Bool)

(assert (=> b!498741 m!480017))

(assert (=> b!498741 m!479987))

(declare-fun m!480019 () Bool)

(assert (=> b!498741 m!480019))

(assert (=> b!498741 m!479987))

(declare-fun m!480021 () Bool)

(assert (=> b!498741 m!480021))

(declare-fun m!480023 () Bool)

(assert (=> b!498741 m!480023))

(declare-fun m!480025 () Bool)

(assert (=> b!498744 m!480025))

(push 1)

