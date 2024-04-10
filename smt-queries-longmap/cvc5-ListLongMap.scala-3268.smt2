; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45480 () Bool)

(assert start!45480)

(declare-fun b!500763 () Bool)

(declare-fun e!293381 () Bool)

(assert (=> b!500763 (= e!293381 false)))

(declare-fun res!302553 () Bool)

(declare-fun e!293377 () Bool)

(assert (=> start!45480 (=> (not res!302553) (not e!293377))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45480 (= res!302553 (validMask!0 mask!3524))))

(assert (=> start!45480 e!293377))

(assert (=> start!45480 true))

(declare-datatypes ((array!32305 0))(
  ( (array!32306 (arr!15534 (Array (_ BitVec 32) (_ BitVec 64))) (size!15898 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32305)

(declare-fun array_inv!11330 (array!32305) Bool)

(assert (=> start!45480 (array_inv!11330 a!3235)))

(declare-fun b!500764 () Bool)

(declare-fun res!302554 () Bool)

(declare-fun e!293379 () Bool)

(assert (=> b!500764 (=> (not res!302554) (not e!293379))))

(declare-datatypes ((List!9692 0))(
  ( (Nil!9689) (Cons!9688 (h!10562 (_ BitVec 64)) (t!15920 List!9692)) )
))
(declare-fun arrayNoDuplicates!0 (array!32305 (_ BitVec 32) List!9692) Bool)

(assert (=> b!500764 (= res!302554 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9689))))

(declare-fun b!500765 () Bool)

(declare-fun res!302557 () Bool)

(assert (=> b!500765 (=> (not res!302557) (not e!293377))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500765 (= res!302557 (validKeyInArray!0 (select (arr!15534 a!3235) j!176)))))

(declare-fun b!500766 () Bool)

(declare-fun res!302552 () Bool)

(assert (=> b!500766 (=> (not res!302552) (not e!293379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32305 (_ BitVec 32)) Bool)

(assert (=> b!500766 (= res!302552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500767 () Bool)

(declare-fun res!302560 () Bool)

(assert (=> b!500767 (=> (not res!302560) (not e!293377))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!500767 (= res!302560 (validKeyInArray!0 k!2280))))

(declare-fun b!500768 () Bool)

(declare-fun e!293380 () Bool)

(assert (=> b!500768 (= e!293379 (not e!293380))))

(declare-fun res!302556 () Bool)

(assert (=> b!500768 (=> res!302556 e!293380)))

(declare-fun lt!227331 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4001 0))(
  ( (MissingZero!4001 (index!18186 (_ BitVec 32))) (Found!4001 (index!18187 (_ BitVec 32))) (Intermediate!4001 (undefined!4813 Bool) (index!18188 (_ BitVec 32)) (x!47222 (_ BitVec 32))) (Undefined!4001) (MissingVacant!4001 (index!18189 (_ BitVec 32))) )
))
(declare-fun lt!227336 () SeekEntryResult!4001)

(declare-fun lt!227332 () (_ BitVec 32))

(declare-fun lt!227335 () array!32305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32305 (_ BitVec 32)) SeekEntryResult!4001)

(assert (=> b!500768 (= res!302556 (= lt!227336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227332 lt!227331 lt!227335 mask!3524)))))

(declare-fun lt!227333 () (_ BitVec 32))

(assert (=> b!500768 (= lt!227336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227333 (select (arr!15534 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500768 (= lt!227332 (toIndex!0 lt!227331 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500768 (= lt!227331 (select (store (arr!15534 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500768 (= lt!227333 (toIndex!0 (select (arr!15534 a!3235) j!176) mask!3524))))

(assert (=> b!500768 (= lt!227335 (array!32306 (store (arr!15534 a!3235) i!1204 k!2280) (size!15898 a!3235)))))

(declare-fun e!293375 () Bool)

(assert (=> b!500768 e!293375))

(declare-fun res!302551 () Bool)

(assert (=> b!500768 (=> (not res!302551) (not e!293375))))

(assert (=> b!500768 (= res!302551 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15080 0))(
  ( (Unit!15081) )
))
(declare-fun lt!227330 () Unit!15080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15080)

(assert (=> b!500768 (= lt!227330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500769 () Bool)

(declare-fun res!302559 () Bool)

(assert (=> b!500769 (=> (not res!302559) (not e!293377))))

(declare-fun arrayContainsKey!0 (array!32305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500769 (= res!302559 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500770 () Bool)

(assert (=> b!500770 (= e!293377 e!293379)))

(declare-fun res!302555 () Bool)

(assert (=> b!500770 (=> (not res!302555) (not e!293379))))

(declare-fun lt!227338 () SeekEntryResult!4001)

(assert (=> b!500770 (= res!302555 (or (= lt!227338 (MissingZero!4001 i!1204)) (= lt!227338 (MissingVacant!4001 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32305 (_ BitVec 32)) SeekEntryResult!4001)

(assert (=> b!500770 (= lt!227338 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500771 () Bool)

(declare-fun e!293382 () Bool)

(assert (=> b!500771 (= e!293380 e!293382)))

(declare-fun res!302558 () Bool)

(assert (=> b!500771 (=> res!302558 e!293382)))

(assert (=> b!500771 (= res!302558 (or (bvsgt #b00000000000000000000000000000000 (x!47222 lt!227336)) (bvsgt (x!47222 lt!227336) #b01111111111111111111111111111110) (bvslt lt!227333 #b00000000000000000000000000000000) (bvsge lt!227333 (size!15898 a!3235)) (bvslt (index!18188 lt!227336) #b00000000000000000000000000000000) (bvsge (index!18188 lt!227336) (size!15898 a!3235)) (not (= lt!227336 (Intermediate!4001 false (index!18188 lt!227336) (x!47222 lt!227336))))))))

(assert (=> b!500771 (and (or (= (select (arr!15534 a!3235) (index!18188 lt!227336)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15534 a!3235) (index!18188 lt!227336)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15534 a!3235) (index!18188 lt!227336)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15534 a!3235) (index!18188 lt!227336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227337 () Unit!15080)

(declare-fun e!293376 () Unit!15080)

(assert (=> b!500771 (= lt!227337 e!293376)))

(declare-fun c!59384 () Bool)

(assert (=> b!500771 (= c!59384 (= (select (arr!15534 a!3235) (index!18188 lt!227336)) (select (arr!15534 a!3235) j!176)))))

(assert (=> b!500771 (and (bvslt (x!47222 lt!227336) #b01111111111111111111111111111110) (or (= (select (arr!15534 a!3235) (index!18188 lt!227336)) (select (arr!15534 a!3235) j!176)) (= (select (arr!15534 a!3235) (index!18188 lt!227336)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15534 a!3235) (index!18188 lt!227336)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500772 () Bool)

(declare-fun res!302550 () Bool)

(assert (=> b!500772 (=> res!302550 e!293380)))

(assert (=> b!500772 (= res!302550 (or (undefined!4813 lt!227336) (not (is-Intermediate!4001 lt!227336))))))

(declare-fun b!500773 () Bool)

(declare-fun res!302561 () Bool)

(assert (=> b!500773 (=> (not res!302561) (not e!293377))))

(assert (=> b!500773 (= res!302561 (and (= (size!15898 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15898 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15898 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500774 () Bool)

(declare-fun Unit!15082 () Unit!15080)

(assert (=> b!500774 (= e!293376 Unit!15082)))

(declare-fun b!500775 () Bool)

(assert (=> b!500775 (= e!293382 true)))

(declare-fun lt!227329 () SeekEntryResult!4001)

(assert (=> b!500775 (= lt!227329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227333 lt!227331 lt!227335 mask!3524))))

(declare-fun b!500776 () Bool)

(declare-fun Unit!15083 () Unit!15080)

(assert (=> b!500776 (= e!293376 Unit!15083)))

(declare-fun lt!227334 () Unit!15080)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15080)

(assert (=> b!500776 (= lt!227334 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227333 #b00000000000000000000000000000000 (index!18188 lt!227336) (x!47222 lt!227336) mask!3524))))

(declare-fun res!302549 () Bool)

(assert (=> b!500776 (= res!302549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227333 lt!227331 lt!227335 mask!3524) (Intermediate!4001 false (index!18188 lt!227336) (x!47222 lt!227336))))))

(assert (=> b!500776 (=> (not res!302549) (not e!293381))))

(assert (=> b!500776 e!293381))

(declare-fun b!500777 () Bool)

(assert (=> b!500777 (= e!293375 (= (seekEntryOrOpen!0 (select (arr!15534 a!3235) j!176) a!3235 mask!3524) (Found!4001 j!176)))))

(assert (= (and start!45480 res!302553) b!500773))

(assert (= (and b!500773 res!302561) b!500765))

(assert (= (and b!500765 res!302557) b!500767))

(assert (= (and b!500767 res!302560) b!500769))

(assert (= (and b!500769 res!302559) b!500770))

(assert (= (and b!500770 res!302555) b!500766))

(assert (= (and b!500766 res!302552) b!500764))

(assert (= (and b!500764 res!302554) b!500768))

(assert (= (and b!500768 res!302551) b!500777))

(assert (= (and b!500768 (not res!302556)) b!500772))

(assert (= (and b!500772 (not res!302550)) b!500771))

(assert (= (and b!500771 c!59384) b!500776))

(assert (= (and b!500771 (not c!59384)) b!500774))

(assert (= (and b!500776 res!302549) b!500763))

(assert (= (and b!500771 (not res!302558)) b!500775))

(declare-fun m!481875 () Bool)

(assert (=> b!500764 m!481875))

(declare-fun m!481877 () Bool)

(assert (=> b!500776 m!481877))

(declare-fun m!481879 () Bool)

(assert (=> b!500776 m!481879))

(declare-fun m!481881 () Bool)

(assert (=> b!500777 m!481881))

(assert (=> b!500777 m!481881))

(declare-fun m!481883 () Bool)

(assert (=> b!500777 m!481883))

(declare-fun m!481885 () Bool)

(assert (=> b!500766 m!481885))

(declare-fun m!481887 () Bool)

(assert (=> b!500770 m!481887))

(assert (=> b!500765 m!481881))

(assert (=> b!500765 m!481881))

(declare-fun m!481889 () Bool)

(assert (=> b!500765 m!481889))

(declare-fun m!481891 () Bool)

(assert (=> b!500771 m!481891))

(assert (=> b!500771 m!481881))

(assert (=> b!500775 m!481879))

(declare-fun m!481893 () Bool)

(assert (=> b!500769 m!481893))

(declare-fun m!481895 () Bool)

(assert (=> start!45480 m!481895))

(declare-fun m!481897 () Bool)

(assert (=> start!45480 m!481897))

(declare-fun m!481899 () Bool)

(assert (=> b!500767 m!481899))

(assert (=> b!500768 m!481881))

(declare-fun m!481901 () Bool)

(assert (=> b!500768 m!481901))

(declare-fun m!481903 () Bool)

(assert (=> b!500768 m!481903))

(declare-fun m!481905 () Bool)

(assert (=> b!500768 m!481905))

(declare-fun m!481907 () Bool)

(assert (=> b!500768 m!481907))

(declare-fun m!481909 () Bool)

(assert (=> b!500768 m!481909))

(assert (=> b!500768 m!481881))

(declare-fun m!481911 () Bool)

(assert (=> b!500768 m!481911))

(assert (=> b!500768 m!481881))

(declare-fun m!481913 () Bool)

(assert (=> b!500768 m!481913))

(declare-fun m!481915 () Bool)

(assert (=> b!500768 m!481915))

(push 1)

