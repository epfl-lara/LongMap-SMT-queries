; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47724 () Bool)

(assert start!47724)

(declare-fun b!525004 () Bool)

(declare-fun res!321835 () Bool)

(declare-fun e!306147 () Bool)

(assert (=> b!525004 (=> res!321835 e!306147)))

(declare-datatypes ((SeekEntryResult!4499 0))(
  ( (MissingZero!4499 (index!20208 (_ BitVec 32))) (Found!4499 (index!20209 (_ BitVec 32))) (Intermediate!4499 (undefined!5311 Bool) (index!20210 (_ BitVec 32)) (x!49192 (_ BitVec 32))) (Undefined!4499) (MissingVacant!4499 (index!20211 (_ BitVec 32))) )
))
(declare-fun lt!241089 () SeekEntryResult!4499)

(assert (=> b!525004 (= res!321835 (or (undefined!5311 lt!241089) (not (is-Intermediate!4499 lt!241089))))))

(declare-fun b!525005 () Bool)

(declare-fun res!321833 () Bool)

(declare-fun e!306143 () Bool)

(assert (=> b!525005 (=> (not res!321833) (not e!306143))))

(declare-datatypes ((array!33361 0))(
  ( (array!33362 (arr!16032 (Array (_ BitVec 32) (_ BitVec 64))) (size!16396 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33361)

(declare-datatypes ((List!10190 0))(
  ( (Nil!10187) (Cons!10186 (h!11117 (_ BitVec 64)) (t!16418 List!10190)) )
))
(declare-fun arrayNoDuplicates!0 (array!33361 (_ BitVec 32) List!10190) Bool)

(assert (=> b!525005 (= res!321833 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10187))))

(declare-fun res!321832 () Bool)

(declare-fun e!306144 () Bool)

(assert (=> start!47724 (=> (not res!321832) (not e!306144))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47724 (= res!321832 (validMask!0 mask!3524))))

(assert (=> start!47724 e!306144))

(assert (=> start!47724 true))

(declare-fun array_inv!11828 (array!33361) Bool)

(assert (=> start!47724 (array_inv!11828 a!3235)))

(declare-fun b!525006 () Bool)

(declare-datatypes ((Unit!16448 0))(
  ( (Unit!16449) )
))
(declare-fun e!306146 () Unit!16448)

(declare-fun Unit!16450 () Unit!16448)

(assert (=> b!525006 (= e!306146 Unit!16450)))

(declare-fun lt!241086 () Unit!16448)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241093 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16448)

(assert (=> b!525006 (= lt!241086 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241093 #b00000000000000000000000000000000 (index!20210 lt!241089) (x!49192 lt!241089) mask!3524))))

(declare-fun lt!241092 () array!33361)

(declare-fun lt!241091 () (_ BitVec 64))

(declare-fun res!321842 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33361 (_ BitVec 32)) SeekEntryResult!4499)

(assert (=> b!525006 (= res!321842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241093 lt!241091 lt!241092 mask!3524) (Intermediate!4499 false (index!20210 lt!241089) (x!49192 lt!241089))))))

(declare-fun e!306141 () Bool)

(assert (=> b!525006 (=> (not res!321842) (not e!306141))))

(assert (=> b!525006 e!306141))

(declare-fun b!525007 () Bool)

(declare-fun res!321834 () Bool)

(assert (=> b!525007 (=> (not res!321834) (not e!306144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525007 (= res!321834 (validKeyInArray!0 (select (arr!16032 a!3235) j!176)))))

(declare-fun b!525008 () Bool)

(declare-fun res!321837 () Bool)

(assert (=> b!525008 (=> (not res!321837) (not e!306143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33361 (_ BitVec 32)) Bool)

(assert (=> b!525008 (= res!321837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525009 () Bool)

(declare-fun res!321841 () Bool)

(assert (=> b!525009 (=> (not res!321841) (not e!306144))))

(assert (=> b!525009 (= res!321841 (validKeyInArray!0 k!2280))))

(declare-fun b!525010 () Bool)

(declare-fun res!321836 () Bool)

(assert (=> b!525010 (=> (not res!321836) (not e!306144))))

(declare-fun arrayContainsKey!0 (array!33361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525010 (= res!321836 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525011 () Bool)

(declare-fun res!321831 () Bool)

(assert (=> b!525011 (=> (not res!321831) (not e!306144))))

(assert (=> b!525011 (= res!321831 (and (= (size!16396 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16396 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16396 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525012 () Bool)

(declare-fun Unit!16451 () Unit!16448)

(assert (=> b!525012 (= e!306146 Unit!16451)))

(declare-fun b!525013 () Bool)

(assert (=> b!525013 (= e!306147 true)))

(assert (=> b!525013 (= (index!20210 lt!241089) i!1204)))

(declare-fun lt!241084 () Unit!16448)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16448)

(assert (=> b!525013 (= lt!241084 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241093 #b00000000000000000000000000000000 (index!20210 lt!241089) (x!49192 lt!241089) mask!3524))))

(assert (=> b!525013 (and (or (= (select (arr!16032 a!3235) (index!20210 lt!241089)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16032 a!3235) (index!20210 lt!241089)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16032 a!3235) (index!20210 lt!241089)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16032 a!3235) (index!20210 lt!241089)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241088 () Unit!16448)

(assert (=> b!525013 (= lt!241088 e!306146)))

(declare-fun c!61892 () Bool)

(assert (=> b!525013 (= c!61892 (= (select (arr!16032 a!3235) (index!20210 lt!241089)) (select (arr!16032 a!3235) j!176)))))

(assert (=> b!525013 (and (bvslt (x!49192 lt!241089) #b01111111111111111111111111111110) (or (= (select (arr!16032 a!3235) (index!20210 lt!241089)) (select (arr!16032 a!3235) j!176)) (= (select (arr!16032 a!3235) (index!20210 lt!241089)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16032 a!3235) (index!20210 lt!241089)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525014 () Bool)

(assert (=> b!525014 (= e!306141 false)))

(declare-fun b!525015 () Bool)

(assert (=> b!525015 (= e!306144 e!306143)))

(declare-fun res!321838 () Bool)

(assert (=> b!525015 (=> (not res!321838) (not e!306143))))

(declare-fun lt!241087 () SeekEntryResult!4499)

(assert (=> b!525015 (= res!321838 (or (= lt!241087 (MissingZero!4499 i!1204)) (= lt!241087 (MissingVacant!4499 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33361 (_ BitVec 32)) SeekEntryResult!4499)

(assert (=> b!525015 (= lt!241087 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525016 () Bool)

(assert (=> b!525016 (= e!306143 (not e!306147))))

(declare-fun res!321839 () Bool)

(assert (=> b!525016 (=> res!321839 e!306147)))

(declare-fun lt!241085 () (_ BitVec 32))

(assert (=> b!525016 (= res!321839 (= lt!241089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241085 lt!241091 lt!241092 mask!3524)))))

(assert (=> b!525016 (= lt!241089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241093 (select (arr!16032 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525016 (= lt!241085 (toIndex!0 lt!241091 mask!3524))))

(assert (=> b!525016 (= lt!241091 (select (store (arr!16032 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525016 (= lt!241093 (toIndex!0 (select (arr!16032 a!3235) j!176) mask!3524))))

(assert (=> b!525016 (= lt!241092 (array!33362 (store (arr!16032 a!3235) i!1204 k!2280) (size!16396 a!3235)))))

(declare-fun e!306145 () Bool)

(assert (=> b!525016 e!306145))

(declare-fun res!321840 () Bool)

(assert (=> b!525016 (=> (not res!321840) (not e!306145))))

(assert (=> b!525016 (= res!321840 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241090 () Unit!16448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16448)

(assert (=> b!525016 (= lt!241090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525017 () Bool)

(assert (=> b!525017 (= e!306145 (= (seekEntryOrOpen!0 (select (arr!16032 a!3235) j!176) a!3235 mask!3524) (Found!4499 j!176)))))

(assert (= (and start!47724 res!321832) b!525011))

(assert (= (and b!525011 res!321831) b!525007))

(assert (= (and b!525007 res!321834) b!525009))

(assert (= (and b!525009 res!321841) b!525010))

(assert (= (and b!525010 res!321836) b!525015))

(assert (= (and b!525015 res!321838) b!525008))

(assert (= (and b!525008 res!321837) b!525005))

(assert (= (and b!525005 res!321833) b!525016))

(assert (= (and b!525016 res!321840) b!525017))

(assert (= (and b!525016 (not res!321839)) b!525004))

(assert (= (and b!525004 (not res!321835)) b!525013))

(assert (= (and b!525013 c!61892) b!525006))

(assert (= (and b!525013 (not c!61892)) b!525012))

(assert (= (and b!525006 res!321842) b!525014))

(declare-fun m!505641 () Bool)

(assert (=> b!525016 m!505641))

(declare-fun m!505643 () Bool)

(assert (=> b!525016 m!505643))

(declare-fun m!505645 () Bool)

(assert (=> b!525016 m!505645))

(declare-fun m!505647 () Bool)

(assert (=> b!525016 m!505647))

(declare-fun m!505649 () Bool)

(assert (=> b!525016 m!505649))

(assert (=> b!525016 m!505647))

(declare-fun m!505651 () Bool)

(assert (=> b!525016 m!505651))

(declare-fun m!505653 () Bool)

(assert (=> b!525016 m!505653))

(assert (=> b!525016 m!505647))

(declare-fun m!505655 () Bool)

(assert (=> b!525016 m!505655))

(declare-fun m!505657 () Bool)

(assert (=> b!525016 m!505657))

(declare-fun m!505659 () Bool)

(assert (=> b!525010 m!505659))

(declare-fun m!505661 () Bool)

(assert (=> start!47724 m!505661))

(declare-fun m!505663 () Bool)

(assert (=> start!47724 m!505663))

(declare-fun m!505665 () Bool)

(assert (=> b!525013 m!505665))

(declare-fun m!505667 () Bool)

(assert (=> b!525013 m!505667))

(assert (=> b!525013 m!505647))

(declare-fun m!505669 () Bool)

(assert (=> b!525015 m!505669))

(declare-fun m!505671 () Bool)

(assert (=> b!525006 m!505671))

(declare-fun m!505673 () Bool)

(assert (=> b!525006 m!505673))

(assert (=> b!525017 m!505647))

(assert (=> b!525017 m!505647))

(declare-fun m!505675 () Bool)

(assert (=> b!525017 m!505675))

(declare-fun m!505677 () Bool)

(assert (=> b!525005 m!505677))

(assert (=> b!525007 m!505647))

(assert (=> b!525007 m!505647))

(declare-fun m!505679 () Bool)

(assert (=> b!525007 m!505679))

(declare-fun m!505681 () Bool)

(assert (=> b!525008 m!505681))

(declare-fun m!505683 () Bool)

(assert (=> b!525009 m!505683))

(push 1)

