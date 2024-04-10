; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45626 () Bool)

(assert start!45626)

(declare-fun b!502891 () Bool)

(declare-fun res!304256 () Bool)

(declare-fun e!294538 () Bool)

(assert (=> b!502891 (=> res!304256 e!294538)))

(declare-fun e!294537 () Bool)

(assert (=> b!502891 (= res!304256 e!294537)))

(declare-fun res!304259 () Bool)

(assert (=> b!502891 (=> (not res!304259) (not e!294537))))

(declare-datatypes ((SeekEntryResult!4038 0))(
  ( (MissingZero!4038 (index!18340 (_ BitVec 32))) (Found!4038 (index!18341 (_ BitVec 32))) (Intermediate!4038 (undefined!4850 Bool) (index!18342 (_ BitVec 32)) (x!47367 (_ BitVec 32))) (Undefined!4038) (MissingVacant!4038 (index!18343 (_ BitVec 32))) )
))
(declare-fun lt!228674 () SeekEntryResult!4038)

(assert (=> b!502891 (= res!304259 (bvsgt #b00000000000000000000000000000000 (x!47367 lt!228674)))))

(declare-fun b!502892 () Bool)

(declare-fun res!304266 () Bool)

(declare-fun e!294539 () Bool)

(assert (=> b!502892 (=> (not res!304266) (not e!294539))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32382 0))(
  ( (array!32383 (arr!15571 (Array (_ BitVec 32) (_ BitVec 64))) (size!15935 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32382)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502892 (= res!304266 (and (= (size!15935 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15935 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15935 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!304255 () Bool)

(assert (=> start!45626 (=> (not res!304255) (not e!294539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45626 (= res!304255 (validMask!0 mask!3524))))

(assert (=> start!45626 e!294539))

(assert (=> start!45626 true))

(declare-fun array_inv!11367 (array!32382) Bool)

(assert (=> start!45626 (array_inv!11367 a!3235)))

(declare-fun b!502893 () Bool)

(assert (=> b!502893 (= e!294538 true)))

(declare-fun lt!228679 () (_ BitVec 32))

(declare-fun lt!228673 () SeekEntryResult!4038)

(declare-fun lt!228676 () (_ BitVec 64))

(declare-fun lt!228675 () array!32382)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32382 (_ BitVec 32)) SeekEntryResult!4038)

(assert (=> b!502893 (= lt!228673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228679 lt!228676 lt!228675 mask!3524))))

(declare-fun b!502894 () Bool)

(declare-fun res!304260 () Bool)

(declare-fun e!294534 () Bool)

(assert (=> b!502894 (=> (not res!304260) (not e!294534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32382 (_ BitVec 32)) Bool)

(assert (=> b!502894 (= res!304260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502895 () Bool)

(declare-fun e!294540 () Bool)

(assert (=> b!502895 (= e!294540 e!294538)))

(declare-fun res!304261 () Bool)

(assert (=> b!502895 (=> res!304261 e!294538)))

(assert (=> b!502895 (= res!304261 (or (bvsgt (x!47367 lt!228674) #b01111111111111111111111111111110) (bvslt lt!228679 #b00000000000000000000000000000000) (bvsge lt!228679 (size!15935 a!3235)) (bvslt (index!18342 lt!228674) #b00000000000000000000000000000000) (bvsge (index!18342 lt!228674) (size!15935 a!3235)) (not (= lt!228674 (Intermediate!4038 false (index!18342 lt!228674) (x!47367 lt!228674))))))))

(assert (=> b!502895 (= (index!18342 lt!228674) i!1204)))

(declare-datatypes ((Unit!15228 0))(
  ( (Unit!15229) )
))
(declare-fun lt!228672 () Unit!15228)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32382 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15228)

(assert (=> b!502895 (= lt!228672 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228679 #b00000000000000000000000000000000 (index!18342 lt!228674) (x!47367 lt!228674) mask!3524))))

(assert (=> b!502895 (and (or (= (select (arr!15571 a!3235) (index!18342 lt!228674)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15571 a!3235) (index!18342 lt!228674)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15571 a!3235) (index!18342 lt!228674)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15571 a!3235) (index!18342 lt!228674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228678 () Unit!15228)

(declare-fun e!294536 () Unit!15228)

(assert (=> b!502895 (= lt!228678 e!294536)))

(declare-fun c!59597 () Bool)

(assert (=> b!502895 (= c!59597 (= (select (arr!15571 a!3235) (index!18342 lt!228674)) (select (arr!15571 a!3235) j!176)))))

(assert (=> b!502895 (and (bvslt (x!47367 lt!228674) #b01111111111111111111111111111110) (or (= (select (arr!15571 a!3235) (index!18342 lt!228674)) (select (arr!15571 a!3235) j!176)) (= (select (arr!15571 a!3235) (index!18342 lt!228674)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15571 a!3235) (index!18342 lt!228674)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502896 () Bool)

(declare-fun Unit!15230 () Unit!15228)

(assert (=> b!502896 (= e!294536 Unit!15230)))

(declare-fun lt!228677 () Unit!15228)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32382 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15228)

(assert (=> b!502896 (= lt!228677 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228679 #b00000000000000000000000000000000 (index!18342 lt!228674) (x!47367 lt!228674) mask!3524))))

(declare-fun res!304254 () Bool)

(assert (=> b!502896 (= res!304254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228679 lt!228676 lt!228675 mask!3524) (Intermediate!4038 false (index!18342 lt!228674) (x!47367 lt!228674))))))

(declare-fun e!294533 () Bool)

(assert (=> b!502896 (=> (not res!304254) (not e!294533))))

(assert (=> b!502896 e!294533))

(declare-fun b!502897 () Bool)

(assert (=> b!502897 (= e!294533 false)))

(declare-fun b!502898 () Bool)

(declare-fun e!294532 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32382 (_ BitVec 32)) SeekEntryResult!4038)

(assert (=> b!502898 (= e!294532 (= (seekEntryOrOpen!0 (select (arr!15571 a!3235) j!176) a!3235 mask!3524) (Found!4038 j!176)))))

(declare-fun b!502899 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32382 (_ BitVec 32)) SeekEntryResult!4038)

(assert (=> b!502899 (= e!294537 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228679 (index!18342 lt!228674) (select (arr!15571 a!3235) j!176) a!3235 mask!3524) (Found!4038 j!176))))))

(declare-fun b!502900 () Bool)

(declare-fun res!304257 () Bool)

(assert (=> b!502900 (=> (not res!304257) (not e!294534))))

(declare-datatypes ((List!9729 0))(
  ( (Nil!9726) (Cons!9725 (h!10602 (_ BitVec 64)) (t!15957 List!9729)) )
))
(declare-fun arrayNoDuplicates!0 (array!32382 (_ BitVec 32) List!9729) Bool)

(assert (=> b!502900 (= res!304257 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9726))))

(declare-fun b!502901 () Bool)

(declare-fun res!304265 () Bool)

(assert (=> b!502901 (=> res!304265 e!294540)))

(get-info :version)

(assert (=> b!502901 (= res!304265 (or (undefined!4850 lt!228674) (not ((_ is Intermediate!4038) lt!228674))))))

(declare-fun b!502902 () Bool)

(declare-fun res!304263 () Bool)

(assert (=> b!502902 (=> (not res!304263) (not e!294539))))

(declare-fun arrayContainsKey!0 (array!32382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502902 (= res!304263 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502903 () Bool)

(declare-fun res!304258 () Bool)

(assert (=> b!502903 (=> (not res!304258) (not e!294539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502903 (= res!304258 (validKeyInArray!0 (select (arr!15571 a!3235) j!176)))))

(declare-fun b!502904 () Bool)

(declare-fun res!304267 () Bool)

(assert (=> b!502904 (=> (not res!304267) (not e!294539))))

(assert (=> b!502904 (= res!304267 (validKeyInArray!0 k0!2280))))

(declare-fun b!502905 () Bool)

(declare-fun Unit!15231 () Unit!15228)

(assert (=> b!502905 (= e!294536 Unit!15231)))

(declare-fun b!502906 () Bool)

(assert (=> b!502906 (= e!294539 e!294534)))

(declare-fun res!304264 () Bool)

(assert (=> b!502906 (=> (not res!304264) (not e!294534))))

(declare-fun lt!228670 () SeekEntryResult!4038)

(assert (=> b!502906 (= res!304264 (or (= lt!228670 (MissingZero!4038 i!1204)) (= lt!228670 (MissingVacant!4038 i!1204))))))

(assert (=> b!502906 (= lt!228670 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502907 () Bool)

(assert (=> b!502907 (= e!294534 (not e!294540))))

(declare-fun res!304262 () Bool)

(assert (=> b!502907 (=> res!304262 e!294540)))

(declare-fun lt!228669 () (_ BitVec 32))

(assert (=> b!502907 (= res!304262 (= lt!228674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228669 lt!228676 lt!228675 mask!3524)))))

(assert (=> b!502907 (= lt!228674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228679 (select (arr!15571 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502907 (= lt!228669 (toIndex!0 lt!228676 mask!3524))))

(assert (=> b!502907 (= lt!228676 (select (store (arr!15571 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502907 (= lt!228679 (toIndex!0 (select (arr!15571 a!3235) j!176) mask!3524))))

(assert (=> b!502907 (= lt!228675 (array!32383 (store (arr!15571 a!3235) i!1204 k0!2280) (size!15935 a!3235)))))

(assert (=> b!502907 e!294532))

(declare-fun res!304268 () Bool)

(assert (=> b!502907 (=> (not res!304268) (not e!294532))))

(assert (=> b!502907 (= res!304268 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228671 () Unit!15228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15228)

(assert (=> b!502907 (= lt!228671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45626 res!304255) b!502892))

(assert (= (and b!502892 res!304266) b!502903))

(assert (= (and b!502903 res!304258) b!502904))

(assert (= (and b!502904 res!304267) b!502902))

(assert (= (and b!502902 res!304263) b!502906))

(assert (= (and b!502906 res!304264) b!502894))

(assert (= (and b!502894 res!304260) b!502900))

(assert (= (and b!502900 res!304257) b!502907))

(assert (= (and b!502907 res!304268) b!502898))

(assert (= (and b!502907 (not res!304262)) b!502901))

(assert (= (and b!502901 (not res!304265)) b!502895))

(assert (= (and b!502895 c!59597) b!502896))

(assert (= (and b!502895 (not c!59597)) b!502905))

(assert (= (and b!502896 res!304254) b!502897))

(assert (= (and b!502895 (not res!304261)) b!502891))

(assert (= (and b!502891 res!304259) b!502899))

(assert (= (and b!502891 (not res!304256)) b!502893))

(declare-fun m!483781 () Bool)

(assert (=> b!502896 m!483781))

(declare-fun m!483783 () Bool)

(assert (=> b!502896 m!483783))

(declare-fun m!483785 () Bool)

(assert (=> b!502898 m!483785))

(assert (=> b!502898 m!483785))

(declare-fun m!483787 () Bool)

(assert (=> b!502898 m!483787))

(assert (=> b!502903 m!483785))

(assert (=> b!502903 m!483785))

(declare-fun m!483789 () Bool)

(assert (=> b!502903 m!483789))

(assert (=> b!502893 m!483783))

(declare-fun m!483791 () Bool)

(assert (=> b!502894 m!483791))

(assert (=> b!502899 m!483785))

(assert (=> b!502899 m!483785))

(declare-fun m!483793 () Bool)

(assert (=> b!502899 m!483793))

(assert (=> b!502907 m!483785))

(declare-fun m!483795 () Bool)

(assert (=> b!502907 m!483795))

(declare-fun m!483797 () Bool)

(assert (=> b!502907 m!483797))

(declare-fun m!483799 () Bool)

(assert (=> b!502907 m!483799))

(declare-fun m!483801 () Bool)

(assert (=> b!502907 m!483801))

(declare-fun m!483803 () Bool)

(assert (=> b!502907 m!483803))

(assert (=> b!502907 m!483785))

(declare-fun m!483805 () Bool)

(assert (=> b!502907 m!483805))

(assert (=> b!502907 m!483785))

(declare-fun m!483807 () Bool)

(assert (=> b!502907 m!483807))

(declare-fun m!483809 () Bool)

(assert (=> b!502907 m!483809))

(declare-fun m!483811 () Bool)

(assert (=> b!502902 m!483811))

(declare-fun m!483813 () Bool)

(assert (=> b!502895 m!483813))

(declare-fun m!483815 () Bool)

(assert (=> b!502895 m!483815))

(assert (=> b!502895 m!483785))

(declare-fun m!483817 () Bool)

(assert (=> b!502900 m!483817))

(declare-fun m!483819 () Bool)

(assert (=> start!45626 m!483819))

(declare-fun m!483821 () Bool)

(assert (=> start!45626 m!483821))

(declare-fun m!483823 () Bool)

(assert (=> b!502904 m!483823))

(declare-fun m!483825 () Bool)

(assert (=> b!502906 m!483825))

(check-sat (not b!502899) (not b!502895) (not b!502894) (not b!502902) (not b!502907) (not start!45626) (not b!502898) (not b!502903) (not b!502896) (not b!502900) (not b!502893) (not b!502906) (not b!502904))
(check-sat)
