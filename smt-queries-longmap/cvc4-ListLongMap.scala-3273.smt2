; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45586 () Bool)

(assert start!45586)

(declare-fun b!501871 () Bool)

(declare-fun res!303364 () Bool)

(declare-fun e!293999 () Bool)

(assert (=> b!501871 (=> (not res!303364) (not e!293999))))

(declare-datatypes ((array!32342 0))(
  ( (array!32343 (arr!15551 (Array (_ BitVec 32) (_ BitVec 64))) (size!15915 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32342)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501871 (= res!303364 (validKeyInArray!0 (select (arr!15551 a!3235) j!176)))))

(declare-fun b!501872 () Bool)

(declare-fun res!303360 () Bool)

(declare-fun e!293996 () Bool)

(assert (=> b!501872 (=> (not res!303360) (not e!293996))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32342 (_ BitVec 32)) Bool)

(assert (=> b!501872 (= res!303360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501873 () Bool)

(declare-fun res!303367 () Bool)

(assert (=> b!501873 (=> (not res!303367) (not e!293996))))

(declare-datatypes ((List!9709 0))(
  ( (Nil!9706) (Cons!9705 (h!10582 (_ BitVec 64)) (t!15937 List!9709)) )
))
(declare-fun arrayNoDuplicates!0 (array!32342 (_ BitVec 32) List!9709) Bool)

(assert (=> b!501873 (= res!303367 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9706))))

(declare-fun b!501874 () Bool)

(declare-datatypes ((Unit!15148 0))(
  ( (Unit!15149) )
))
(declare-fun e!293998 () Unit!15148)

(declare-fun Unit!15150 () Unit!15148)

(assert (=> b!501874 (= e!293998 Unit!15150)))

(declare-fun lt!228011 () (_ BitVec 32))

(declare-fun lt!228010 () Unit!15148)

(declare-datatypes ((SeekEntryResult!4018 0))(
  ( (MissingZero!4018 (index!18260 (_ BitVec 32))) (Found!4018 (index!18261 (_ BitVec 32))) (Intermediate!4018 (undefined!4830 Bool) (index!18262 (_ BitVec 32)) (x!47291 (_ BitVec 32))) (Undefined!4018) (MissingVacant!4018 (index!18263 (_ BitVec 32))) )
))
(declare-fun lt!228017 () SeekEntryResult!4018)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32342 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15148)

(assert (=> b!501874 (= lt!228010 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228011 #b00000000000000000000000000000000 (index!18262 lt!228017) (x!47291 lt!228017) mask!3524))))

(declare-fun lt!228019 () array!32342)

(declare-fun res!303363 () Bool)

(declare-fun lt!228015 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32342 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!501874 (= res!303363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228011 lt!228015 lt!228019 mask!3524) (Intermediate!4018 false (index!18262 lt!228017) (x!47291 lt!228017))))))

(declare-fun e!293995 () Bool)

(assert (=> b!501874 (=> (not res!303363) (not e!293995))))

(assert (=> b!501874 e!293995))

(declare-fun b!501875 () Bool)

(declare-fun e!293992 () Bool)

(declare-fun e!293997 () Bool)

(assert (=> b!501875 (= e!293992 e!293997)))

(declare-fun res!303362 () Bool)

(assert (=> b!501875 (=> res!303362 e!293997)))

(assert (=> b!501875 (= res!303362 (or (bvsgt (x!47291 lt!228017) #b01111111111111111111111111111110) (bvslt lt!228011 #b00000000000000000000000000000000) (bvsge lt!228011 (size!15915 a!3235)) (bvslt (index!18262 lt!228017) #b00000000000000000000000000000000) (bvsge (index!18262 lt!228017) (size!15915 a!3235)) (not (= lt!228017 (Intermediate!4018 false (index!18262 lt!228017) (x!47291 lt!228017))))))))

(assert (=> b!501875 (= (index!18262 lt!228017) i!1204)))

(declare-fun lt!228012 () Unit!15148)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32342 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15148)

(assert (=> b!501875 (= lt!228012 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228011 #b00000000000000000000000000000000 (index!18262 lt!228017) (x!47291 lt!228017) mask!3524))))

(assert (=> b!501875 (and (or (= (select (arr!15551 a!3235) (index!18262 lt!228017)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15551 a!3235) (index!18262 lt!228017)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15551 a!3235) (index!18262 lt!228017)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15551 a!3235) (index!18262 lt!228017)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228014 () Unit!15148)

(assert (=> b!501875 (= lt!228014 e!293998)))

(declare-fun c!59537 () Bool)

(assert (=> b!501875 (= c!59537 (= (select (arr!15551 a!3235) (index!18262 lt!228017)) (select (arr!15551 a!3235) j!176)))))

(assert (=> b!501875 (and (bvslt (x!47291 lt!228017) #b01111111111111111111111111111110) (or (= (select (arr!15551 a!3235) (index!18262 lt!228017)) (select (arr!15551 a!3235) j!176)) (= (select (arr!15551 a!3235) (index!18262 lt!228017)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15551 a!3235) (index!18262 lt!228017)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501877 () Bool)

(declare-fun res!303359 () Bool)

(assert (=> b!501877 (=> (not res!303359) (not e!293999))))

(declare-fun arrayContainsKey!0 (array!32342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501877 (= res!303359 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501878 () Bool)

(declare-fun res!303366 () Bool)

(assert (=> b!501878 (=> (not res!303366) (not e!293999))))

(assert (=> b!501878 (= res!303366 (validKeyInArray!0 k!2280))))

(declare-fun b!501879 () Bool)

(assert (=> b!501879 (= e!293999 e!293996)))

(declare-fun res!303355 () Bool)

(assert (=> b!501879 (=> (not res!303355) (not e!293996))))

(declare-fun lt!228013 () SeekEntryResult!4018)

(assert (=> b!501879 (= res!303355 (or (= lt!228013 (MissingZero!4018 i!1204)) (= lt!228013 (MissingVacant!4018 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32342 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!501879 (= lt!228013 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501880 () Bool)

(assert (=> b!501880 (= e!293997 true)))

(declare-fun lt!228009 () SeekEntryResult!4018)

(assert (=> b!501880 (= lt!228009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228011 lt!228015 lt!228019 mask!3524))))

(declare-fun b!501881 () Bool)

(declare-fun e!293993 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32342 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!501881 (= e!293993 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228011 (index!18262 lt!228017) (select (arr!15551 a!3235) j!176) a!3235 mask!3524) (Found!4018 j!176))))))

(declare-fun b!501882 () Bool)

(assert (=> b!501882 (= e!293996 (not e!293992))))

(declare-fun res!303356 () Bool)

(assert (=> b!501882 (=> res!303356 e!293992)))

(declare-fun lt!228016 () (_ BitVec 32))

(assert (=> b!501882 (= res!303356 (= lt!228017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228016 lt!228015 lt!228019 mask!3524)))))

(assert (=> b!501882 (= lt!228017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228011 (select (arr!15551 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501882 (= lt!228016 (toIndex!0 lt!228015 mask!3524))))

(assert (=> b!501882 (= lt!228015 (select (store (arr!15551 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501882 (= lt!228011 (toIndex!0 (select (arr!15551 a!3235) j!176) mask!3524))))

(assert (=> b!501882 (= lt!228019 (array!32343 (store (arr!15551 a!3235) i!1204 k!2280) (size!15915 a!3235)))))

(declare-fun e!294000 () Bool)

(assert (=> b!501882 e!294000))

(declare-fun res!303358 () Bool)

(assert (=> b!501882 (=> (not res!303358) (not e!294000))))

(assert (=> b!501882 (= res!303358 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228018 () Unit!15148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15148)

(assert (=> b!501882 (= lt!228018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501883 () Bool)

(assert (=> b!501883 (= e!293995 false)))

(declare-fun b!501884 () Bool)

(declare-fun res!303368 () Bool)

(assert (=> b!501884 (=> res!303368 e!293992)))

(assert (=> b!501884 (= res!303368 (or (undefined!4830 lt!228017) (not (is-Intermediate!4018 lt!228017))))))

(declare-fun res!303357 () Bool)

(assert (=> start!45586 (=> (not res!303357) (not e!293999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45586 (= res!303357 (validMask!0 mask!3524))))

(assert (=> start!45586 e!293999))

(assert (=> start!45586 true))

(declare-fun array_inv!11347 (array!32342) Bool)

(assert (=> start!45586 (array_inv!11347 a!3235)))

(declare-fun b!501876 () Bool)

(assert (=> b!501876 (= e!294000 (= (seekEntryOrOpen!0 (select (arr!15551 a!3235) j!176) a!3235 mask!3524) (Found!4018 j!176)))))

(declare-fun b!501885 () Bool)

(declare-fun res!303354 () Bool)

(assert (=> b!501885 (=> (not res!303354) (not e!293999))))

(assert (=> b!501885 (= res!303354 (and (= (size!15915 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15915 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15915 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501886 () Bool)

(declare-fun Unit!15151 () Unit!15148)

(assert (=> b!501886 (= e!293998 Unit!15151)))

(declare-fun b!501887 () Bool)

(declare-fun res!303365 () Bool)

(assert (=> b!501887 (=> res!303365 e!293997)))

(assert (=> b!501887 (= res!303365 e!293993)))

(declare-fun res!303361 () Bool)

(assert (=> b!501887 (=> (not res!303361) (not e!293993))))

(assert (=> b!501887 (= res!303361 (bvsgt #b00000000000000000000000000000000 (x!47291 lt!228017)))))

(assert (= (and start!45586 res!303357) b!501885))

(assert (= (and b!501885 res!303354) b!501871))

(assert (= (and b!501871 res!303364) b!501878))

(assert (= (and b!501878 res!303366) b!501877))

(assert (= (and b!501877 res!303359) b!501879))

(assert (= (and b!501879 res!303355) b!501872))

(assert (= (and b!501872 res!303360) b!501873))

(assert (= (and b!501873 res!303367) b!501882))

(assert (= (and b!501882 res!303358) b!501876))

(assert (= (and b!501882 (not res!303356)) b!501884))

(assert (= (and b!501884 (not res!303368)) b!501875))

(assert (= (and b!501875 c!59537) b!501874))

(assert (= (and b!501875 (not c!59537)) b!501886))

(assert (= (and b!501874 res!303363) b!501883))

(assert (= (and b!501875 (not res!303362)) b!501887))

(assert (= (and b!501887 res!303361) b!501881))

(assert (= (and b!501887 (not res!303365)) b!501880))

(declare-fun m!482861 () Bool)

(assert (=> b!501871 m!482861))

(assert (=> b!501871 m!482861))

(declare-fun m!482863 () Bool)

(assert (=> b!501871 m!482863))

(assert (=> b!501876 m!482861))

(assert (=> b!501876 m!482861))

(declare-fun m!482865 () Bool)

(assert (=> b!501876 m!482865))

(declare-fun m!482867 () Bool)

(assert (=> b!501878 m!482867))

(declare-fun m!482869 () Bool)

(assert (=> start!45586 m!482869))

(declare-fun m!482871 () Bool)

(assert (=> start!45586 m!482871))

(declare-fun m!482873 () Bool)

(assert (=> b!501873 m!482873))

(declare-fun m!482875 () Bool)

(assert (=> b!501882 m!482875))

(declare-fun m!482877 () Bool)

(assert (=> b!501882 m!482877))

(declare-fun m!482879 () Bool)

(assert (=> b!501882 m!482879))

(declare-fun m!482881 () Bool)

(assert (=> b!501882 m!482881))

(assert (=> b!501882 m!482861))

(declare-fun m!482883 () Bool)

(assert (=> b!501882 m!482883))

(assert (=> b!501882 m!482861))

(declare-fun m!482885 () Bool)

(assert (=> b!501882 m!482885))

(assert (=> b!501882 m!482861))

(declare-fun m!482887 () Bool)

(assert (=> b!501882 m!482887))

(declare-fun m!482889 () Bool)

(assert (=> b!501882 m!482889))

(declare-fun m!482891 () Bool)

(assert (=> b!501874 m!482891))

(declare-fun m!482893 () Bool)

(assert (=> b!501874 m!482893))

(declare-fun m!482895 () Bool)

(assert (=> b!501872 m!482895))

(declare-fun m!482897 () Bool)

(assert (=> b!501879 m!482897))

(assert (=> b!501880 m!482893))

(declare-fun m!482899 () Bool)

(assert (=> b!501875 m!482899))

(declare-fun m!482901 () Bool)

(assert (=> b!501875 m!482901))

(assert (=> b!501875 m!482861))

(declare-fun m!482903 () Bool)

(assert (=> b!501877 m!482903))

(assert (=> b!501881 m!482861))

(assert (=> b!501881 m!482861))

(declare-fun m!482905 () Bool)

(assert (=> b!501881 m!482905))

(push 1)

