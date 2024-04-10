; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45742 () Bool)

(assert start!45742)

(declare-fun b!505849 () Bool)

(declare-fun res!306874 () Bool)

(declare-fun e!296101 () Bool)

(assert (=> b!505849 (=> (not res!306874) (not e!296101))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505849 (= res!306874 (validKeyInArray!0 k!2280))))

(declare-fun b!505850 () Bool)

(declare-fun res!306872 () Bool)

(declare-fun e!296105 () Bool)

(assert (=> b!505850 (=> res!306872 e!296105)))

(declare-datatypes ((array!32498 0))(
  ( (array!32499 (arr!15629 (Array (_ BitVec 32) (_ BitVec 64))) (size!15993 (_ BitVec 32))) )
))
(declare-fun lt!230683 () array!32498)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230682 () (_ BitVec 64))

(declare-fun lt!230677 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4096 0))(
  ( (MissingZero!4096 (index!18572 (_ BitVec 32))) (Found!4096 (index!18573 (_ BitVec 32))) (Intermediate!4096 (undefined!4908 Bool) (index!18574 (_ BitVec 32)) (x!47577 (_ BitVec 32))) (Undefined!4096) (MissingVacant!4096 (index!18575 (_ BitVec 32))) )
))
(declare-fun lt!230681 () SeekEntryResult!4096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32498 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!505850 (= res!306872 (not (= lt!230681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230677 lt!230682 lt!230683 mask!3524))))))

(declare-fun b!505851 () Bool)

(declare-fun res!306867 () Bool)

(declare-fun e!296104 () Bool)

(assert (=> b!505851 (=> (not res!306867) (not e!296104))))

(declare-fun a!3235 () array!32498)

(declare-datatypes ((List!9787 0))(
  ( (Nil!9784) (Cons!9783 (h!10660 (_ BitVec 64)) (t!16015 List!9787)) )
))
(declare-fun arrayNoDuplicates!0 (array!32498 (_ BitVec 32) List!9787) Bool)

(assert (=> b!505851 (= res!306867 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9784))))

(declare-fun b!505852 () Bool)

(assert (=> b!505852 (= e!296101 e!296104)))

(declare-fun res!306876 () Bool)

(assert (=> b!505852 (=> (not res!306876) (not e!296104))))

(declare-fun lt!230673 () SeekEntryResult!4096)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505852 (= res!306876 (or (= lt!230673 (MissingZero!4096 i!1204)) (= lt!230673 (MissingVacant!4096 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32498 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!505852 (= lt!230673 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505854 () Bool)

(declare-fun lt!230679 () SeekEntryResult!4096)

(declare-fun e!296103 () Bool)

(declare-fun lt!230671 () SeekEntryResult!4096)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32498 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!505854 (= e!296103 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230677 (index!18574 lt!230679) (select (arr!15629 a!3235) j!176) a!3235 mask!3524) lt!230671)))))

(declare-fun b!505855 () Bool)

(declare-fun res!306869 () Bool)

(assert (=> b!505855 (=> (not res!306869) (not e!296104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32498 (_ BitVec 32)) Bool)

(assert (=> b!505855 (= res!306869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505856 () Bool)

(declare-fun e!296100 () Bool)

(assert (=> b!505856 (= e!296104 (not e!296100))))

(declare-fun res!306875 () Bool)

(assert (=> b!505856 (=> res!306875 e!296100)))

(assert (=> b!505856 (= res!306875 (or (= lt!230679 lt!230681) (undefined!4908 lt!230679) (not (is-Intermediate!4096 lt!230679))))))

(declare-fun lt!230674 () (_ BitVec 32))

(assert (=> b!505856 (= lt!230681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230674 lt!230682 lt!230683 mask!3524))))

(assert (=> b!505856 (= lt!230679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230677 (select (arr!15629 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505856 (= lt!230674 (toIndex!0 lt!230682 mask!3524))))

(assert (=> b!505856 (= lt!230682 (select (store (arr!15629 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505856 (= lt!230677 (toIndex!0 (select (arr!15629 a!3235) j!176) mask!3524))))

(assert (=> b!505856 (= lt!230683 (array!32499 (store (arr!15629 a!3235) i!1204 k!2280) (size!15993 a!3235)))))

(assert (=> b!505856 (= lt!230671 (Found!4096 j!176))))

(declare-fun e!296098 () Bool)

(assert (=> b!505856 e!296098))

(declare-fun res!306871 () Bool)

(assert (=> b!505856 (=> (not res!306871) (not e!296098))))

(assert (=> b!505856 (= res!306871 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15460 0))(
  ( (Unit!15461) )
))
(declare-fun lt!230672 () Unit!15460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15460)

(assert (=> b!505856 (= lt!230672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505857 () Bool)

(declare-fun res!306866 () Bool)

(assert (=> b!505857 (=> (not res!306866) (not e!296101))))

(assert (=> b!505857 (= res!306866 (validKeyInArray!0 (select (arr!15629 a!3235) j!176)))))

(declare-fun b!505858 () Bool)

(declare-fun e!296099 () Unit!15460)

(declare-fun Unit!15462 () Unit!15460)

(assert (=> b!505858 (= e!296099 Unit!15462)))

(declare-fun lt!230678 () Unit!15460)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15460)

(assert (=> b!505858 (= lt!230678 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230677 #b00000000000000000000000000000000 (index!18574 lt!230679) (x!47577 lt!230679) mask!3524))))

(declare-fun res!306870 () Bool)

(assert (=> b!505858 (= res!306870 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230677 lt!230682 lt!230683 mask!3524) (Intermediate!4096 false (index!18574 lt!230679) (x!47577 lt!230679))))))

(declare-fun e!296102 () Bool)

(assert (=> b!505858 (=> (not res!306870) (not e!296102))))

(assert (=> b!505858 e!296102))

(declare-fun b!505859 () Bool)

(assert (=> b!505859 (= e!296098 (= (seekEntryOrOpen!0 (select (arr!15629 a!3235) j!176) a!3235 mask!3524) (Found!4096 j!176)))))

(declare-fun b!505860 () Bool)

(declare-fun res!306865 () Bool)

(assert (=> b!505860 (=> (not res!306865) (not e!296101))))

(declare-fun arrayContainsKey!0 (array!32498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505860 (= res!306865 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505861 () Bool)

(declare-fun res!306873 () Bool)

(assert (=> b!505861 (=> (not res!306873) (not e!296101))))

(assert (=> b!505861 (= res!306873 (and (= (size!15993 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15993 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15993 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505862 () Bool)

(assert (=> b!505862 (= e!296105 true)))

(assert (=> b!505862 (= (seekEntryOrOpen!0 lt!230682 lt!230683 mask!3524) lt!230671)))

(declare-fun lt!230675 () Unit!15460)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15460)

(assert (=> b!505862 (= lt!230675 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230677 #b00000000000000000000000000000000 (index!18574 lt!230679) (x!47577 lt!230679) mask!3524))))

(declare-fun b!505863 () Bool)

(declare-fun Unit!15463 () Unit!15460)

(assert (=> b!505863 (= e!296099 Unit!15463)))

(declare-fun b!505864 () Bool)

(assert (=> b!505864 (= e!296100 e!296105)))

(declare-fun res!306877 () Bool)

(assert (=> b!505864 (=> res!306877 e!296105)))

(assert (=> b!505864 (= res!306877 (or (bvsgt (x!47577 lt!230679) #b01111111111111111111111111111110) (bvslt lt!230677 #b00000000000000000000000000000000) (bvsge lt!230677 (size!15993 a!3235)) (bvslt (index!18574 lt!230679) #b00000000000000000000000000000000) (bvsge (index!18574 lt!230679) (size!15993 a!3235)) (not (= lt!230679 (Intermediate!4096 false (index!18574 lt!230679) (x!47577 lt!230679))))))))

(assert (=> b!505864 (= (index!18574 lt!230679) i!1204)))

(declare-fun lt!230680 () Unit!15460)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15460)

(assert (=> b!505864 (= lt!230680 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230677 #b00000000000000000000000000000000 (index!18574 lt!230679) (x!47577 lt!230679) mask!3524))))

(assert (=> b!505864 (and (or (= (select (arr!15629 a!3235) (index!18574 lt!230679)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15629 a!3235) (index!18574 lt!230679)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15629 a!3235) (index!18574 lt!230679)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15629 a!3235) (index!18574 lt!230679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230676 () Unit!15460)

(assert (=> b!505864 (= lt!230676 e!296099)))

(declare-fun c!59771 () Bool)

(assert (=> b!505864 (= c!59771 (= (select (arr!15629 a!3235) (index!18574 lt!230679)) (select (arr!15629 a!3235) j!176)))))

(assert (=> b!505864 (and (bvslt (x!47577 lt!230679) #b01111111111111111111111111111110) (or (= (select (arr!15629 a!3235) (index!18574 lt!230679)) (select (arr!15629 a!3235) j!176)) (= (select (arr!15629 a!3235) (index!18574 lt!230679)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15629 a!3235) (index!18574 lt!230679)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505865 () Bool)

(declare-fun res!306878 () Bool)

(assert (=> b!505865 (=> res!306878 e!296105)))

(assert (=> b!505865 (= res!306878 e!296103)))

(declare-fun res!306864 () Bool)

(assert (=> b!505865 (=> (not res!306864) (not e!296103))))

(assert (=> b!505865 (= res!306864 (bvsgt #b00000000000000000000000000000000 (x!47577 lt!230679)))))

(declare-fun res!306868 () Bool)

(assert (=> start!45742 (=> (not res!306868) (not e!296101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45742 (= res!306868 (validMask!0 mask!3524))))

(assert (=> start!45742 e!296101))

(assert (=> start!45742 true))

(declare-fun array_inv!11425 (array!32498) Bool)

(assert (=> start!45742 (array_inv!11425 a!3235)))

(declare-fun b!505853 () Bool)

(assert (=> b!505853 (= e!296102 false)))

(assert (= (and start!45742 res!306868) b!505861))

(assert (= (and b!505861 res!306873) b!505857))

(assert (= (and b!505857 res!306866) b!505849))

(assert (= (and b!505849 res!306874) b!505860))

(assert (= (and b!505860 res!306865) b!505852))

(assert (= (and b!505852 res!306876) b!505855))

(assert (= (and b!505855 res!306869) b!505851))

(assert (= (and b!505851 res!306867) b!505856))

(assert (= (and b!505856 res!306871) b!505859))

(assert (= (and b!505856 (not res!306875)) b!505864))

(assert (= (and b!505864 c!59771) b!505858))

(assert (= (and b!505864 (not c!59771)) b!505863))

(assert (= (and b!505858 res!306870) b!505853))

(assert (= (and b!505864 (not res!306877)) b!505865))

(assert (= (and b!505865 res!306864) b!505854))

(assert (= (and b!505865 (not res!306878)) b!505850))

(assert (= (and b!505850 (not res!306872)) b!505862))

(declare-fun m!486505 () Bool)

(assert (=> b!505856 m!486505))

(declare-fun m!486507 () Bool)

(assert (=> b!505856 m!486507))

(declare-fun m!486509 () Bool)

(assert (=> b!505856 m!486509))

(declare-fun m!486511 () Bool)

(assert (=> b!505856 m!486511))

(declare-fun m!486513 () Bool)

(assert (=> b!505856 m!486513))

(declare-fun m!486515 () Bool)

(assert (=> b!505856 m!486515))

(declare-fun m!486517 () Bool)

(assert (=> b!505856 m!486517))

(assert (=> b!505856 m!486515))

(declare-fun m!486519 () Bool)

(assert (=> b!505856 m!486519))

(assert (=> b!505856 m!486515))

(declare-fun m!486521 () Bool)

(assert (=> b!505856 m!486521))

(declare-fun m!486523 () Bool)

(assert (=> b!505852 m!486523))

(assert (=> b!505859 m!486515))

(assert (=> b!505859 m!486515))

(declare-fun m!486525 () Bool)

(assert (=> b!505859 m!486525))

(declare-fun m!486527 () Bool)

(assert (=> b!505850 m!486527))

(declare-fun m!486529 () Bool)

(assert (=> b!505858 m!486529))

(assert (=> b!505858 m!486527))

(declare-fun m!486531 () Bool)

(assert (=> b!505860 m!486531))

(declare-fun m!486533 () Bool)

(assert (=> b!505864 m!486533))

(declare-fun m!486535 () Bool)

(assert (=> b!505864 m!486535))

(assert (=> b!505864 m!486515))

(declare-fun m!486537 () Bool)

(assert (=> b!505862 m!486537))

(declare-fun m!486539 () Bool)

(assert (=> b!505862 m!486539))

(assert (=> b!505857 m!486515))

(assert (=> b!505857 m!486515))

(declare-fun m!486541 () Bool)

(assert (=> b!505857 m!486541))

(assert (=> b!505854 m!486515))

(assert (=> b!505854 m!486515))

(declare-fun m!486543 () Bool)

(assert (=> b!505854 m!486543))

(declare-fun m!486545 () Bool)

(assert (=> b!505851 m!486545))

(declare-fun m!486547 () Bool)

(assert (=> b!505855 m!486547))

(declare-fun m!486549 () Bool)

(assert (=> b!505849 m!486549))

(declare-fun m!486551 () Bool)

(assert (=> start!45742 m!486551))

(declare-fun m!486553 () Bool)

(assert (=> start!45742 m!486553))

(push 1)

