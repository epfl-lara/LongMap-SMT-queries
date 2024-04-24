; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47900 () Bool)

(assert start!47900)

(declare-fun b!527664 () Bool)

(declare-fun e!307514 () Bool)

(declare-fun e!307515 () Bool)

(assert (=> b!527664 (= e!307514 (not e!307515))))

(declare-fun res!324002 () Bool)

(assert (=> b!527664 (=> res!324002 e!307515)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4507 0))(
  ( (MissingZero!4507 (index!20246 (_ BitVec 32))) (Found!4507 (index!20247 (_ BitVec 32))) (Intermediate!4507 (undefined!5319 Bool) (index!20248 (_ BitVec 32)) (x!49361 (_ BitVec 32))) (Undefined!4507) (MissingVacant!4507 (index!20249 (_ BitVec 32))) )
))
(declare-fun lt!242964 () SeekEntryResult!4507)

(declare-fun lt!242960 () (_ BitVec 32))

(declare-fun lt!242962 () (_ BitVec 64))

(declare-datatypes ((array!33469 0))(
  ( (array!33470 (arr!16084 (Array (_ BitVec 32) (_ BitVec 64))) (size!16448 (_ BitVec 32))) )
))
(declare-fun lt!242965 () array!33469)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33469 (_ BitVec 32)) SeekEntryResult!4507)

(assert (=> b!527664 (= res!324002 (= lt!242964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242960 lt!242962 lt!242965 mask!3524)))))

(declare-fun a!3235 () array!33469)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242961 () (_ BitVec 32))

(assert (=> b!527664 (= lt!242964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242961 (select (arr!16084 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527664 (= lt!242960 (toIndex!0 lt!242962 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527664 (= lt!242962 (select (store (arr!16084 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527664 (= lt!242961 (toIndex!0 (select (arr!16084 a!3235) j!176) mask!3524))))

(assert (=> b!527664 (= lt!242965 (array!33470 (store (arr!16084 a!3235) i!1204 k0!2280) (size!16448 a!3235)))))

(declare-fun e!307509 () Bool)

(assert (=> b!527664 e!307509))

(declare-fun res!324003 () Bool)

(assert (=> b!527664 (=> (not res!324003) (not e!307509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33469 (_ BitVec 32)) Bool)

(assert (=> b!527664 (= res!324003 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16639 0))(
  ( (Unit!16640) )
))
(declare-fun lt!242966 () Unit!16639)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16639)

(assert (=> b!527664 (= lt!242966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!324007 () Bool)

(declare-fun e!307511 () Bool)

(assert (=> start!47900 (=> (not res!324007) (not e!307511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47900 (= res!324007 (validMask!0 mask!3524))))

(assert (=> start!47900 e!307511))

(assert (=> start!47900 true))

(declare-fun array_inv!11943 (array!33469) Bool)

(assert (=> start!47900 (array_inv!11943 a!3235)))

(declare-fun b!527665 () Bool)

(declare-fun res!324004 () Bool)

(assert (=> b!527665 (=> res!324004 e!307515)))

(get-info :version)

(assert (=> b!527665 (= res!324004 (or (undefined!5319 lt!242964) (not ((_ is Intermediate!4507) lt!242964))))))

(declare-fun b!527666 () Bool)

(assert (=> b!527666 (= e!307511 e!307514)))

(declare-fun res!324006 () Bool)

(assert (=> b!527666 (=> (not res!324006) (not e!307514))))

(declare-fun lt!242967 () SeekEntryResult!4507)

(assert (=> b!527666 (= res!324006 (or (= lt!242967 (MissingZero!4507 i!1204)) (= lt!242967 (MissingVacant!4507 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33469 (_ BitVec 32)) SeekEntryResult!4507)

(assert (=> b!527666 (= lt!242967 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527667 () Bool)

(declare-fun res!324010 () Bool)

(assert (=> b!527667 (=> (not res!324010) (not e!307511))))

(declare-fun arrayContainsKey!0 (array!33469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527667 (= res!324010 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527668 () Bool)

(declare-fun res!324012 () Bool)

(assert (=> b!527668 (=> (not res!324012) (not e!307514))))

(assert (=> b!527668 (= res!324012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527669 () Bool)

(declare-fun res!324013 () Bool)

(assert (=> b!527669 (=> (not res!324013) (not e!307511))))

(assert (=> b!527669 (= res!324013 (and (= (size!16448 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16448 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16448 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527670 () Bool)

(declare-fun res!324008 () Bool)

(assert (=> b!527670 (=> (not res!324008) (not e!307511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527670 (= res!324008 (validKeyInArray!0 k0!2280))))

(declare-fun b!527671 () Bool)

(declare-fun res!324011 () Bool)

(assert (=> b!527671 (=> (not res!324011) (not e!307511))))

(assert (=> b!527671 (= res!324011 (validKeyInArray!0 (select (arr!16084 a!3235) j!176)))))

(declare-fun b!527672 () Bool)

(declare-fun e!307510 () Unit!16639)

(declare-fun Unit!16641 () Unit!16639)

(assert (=> b!527672 (= e!307510 Unit!16641)))

(declare-fun b!527673 () Bool)

(declare-fun Unit!16642 () Unit!16639)

(assert (=> b!527673 (= e!307510 Unit!16642)))

(declare-fun lt!242959 () Unit!16639)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16639)

(assert (=> b!527673 (= lt!242959 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242961 #b00000000000000000000000000000000 (index!20248 lt!242964) (x!49361 lt!242964) mask!3524))))

(declare-fun res!324009 () Bool)

(assert (=> b!527673 (= res!324009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242961 lt!242962 lt!242965 mask!3524) (Intermediate!4507 false (index!20248 lt!242964) (x!49361 lt!242964))))))

(declare-fun e!307513 () Bool)

(assert (=> b!527673 (=> (not res!324009) (not e!307513))))

(assert (=> b!527673 e!307513))

(declare-fun b!527674 () Bool)

(assert (=> b!527674 (= e!307515 true)))

(assert (=> b!527674 (= (index!20248 lt!242964) i!1204)))

(declare-fun lt!242968 () Unit!16639)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16639)

(assert (=> b!527674 (= lt!242968 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242961 #b00000000000000000000000000000000 (index!20248 lt!242964) (x!49361 lt!242964) mask!3524))))

(assert (=> b!527674 (and (or (= (select (arr!16084 a!3235) (index!20248 lt!242964)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16084 a!3235) (index!20248 lt!242964)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16084 a!3235) (index!20248 lt!242964)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16084 a!3235) (index!20248 lt!242964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242963 () Unit!16639)

(assert (=> b!527674 (= lt!242963 e!307510)))

(declare-fun c!62138 () Bool)

(assert (=> b!527674 (= c!62138 (= (select (arr!16084 a!3235) (index!20248 lt!242964)) (select (arr!16084 a!3235) j!176)))))

(assert (=> b!527674 (and (bvslt (x!49361 lt!242964) #b01111111111111111111111111111110) (or (= (select (arr!16084 a!3235) (index!20248 lt!242964)) (select (arr!16084 a!3235) j!176)) (= (select (arr!16084 a!3235) (index!20248 lt!242964)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16084 a!3235) (index!20248 lt!242964)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527675 () Bool)

(assert (=> b!527675 (= e!307509 (= (seekEntryOrOpen!0 (select (arr!16084 a!3235) j!176) a!3235 mask!3524) (Found!4507 j!176)))))

(declare-fun b!527676 () Bool)

(declare-fun res!324005 () Bool)

(assert (=> b!527676 (=> (not res!324005) (not e!307514))))

(declare-datatypes ((List!10149 0))(
  ( (Nil!10146) (Cons!10145 (h!11079 (_ BitVec 64)) (t!16369 List!10149)) )
))
(declare-fun arrayNoDuplicates!0 (array!33469 (_ BitVec 32) List!10149) Bool)

(assert (=> b!527676 (= res!324005 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10146))))

(declare-fun b!527677 () Bool)

(assert (=> b!527677 (= e!307513 false)))

(assert (= (and start!47900 res!324007) b!527669))

(assert (= (and b!527669 res!324013) b!527671))

(assert (= (and b!527671 res!324011) b!527670))

(assert (= (and b!527670 res!324008) b!527667))

(assert (= (and b!527667 res!324010) b!527666))

(assert (= (and b!527666 res!324006) b!527668))

(assert (= (and b!527668 res!324012) b!527676))

(assert (= (and b!527676 res!324005) b!527664))

(assert (= (and b!527664 res!324003) b!527675))

(assert (= (and b!527664 (not res!324002)) b!527665))

(assert (= (and b!527665 (not res!324004)) b!527674))

(assert (= (and b!527674 c!62138) b!527673))

(assert (= (and b!527674 (not c!62138)) b!527672))

(assert (= (and b!527673 res!324009) b!527677))

(declare-fun m!508573 () Bool)

(assert (=> b!527667 m!508573))

(declare-fun m!508575 () Bool)

(assert (=> b!527676 m!508575))

(declare-fun m!508577 () Bool)

(assert (=> b!527674 m!508577))

(declare-fun m!508579 () Bool)

(assert (=> b!527674 m!508579))

(declare-fun m!508581 () Bool)

(assert (=> b!527674 m!508581))

(declare-fun m!508583 () Bool)

(assert (=> b!527673 m!508583))

(declare-fun m!508585 () Bool)

(assert (=> b!527673 m!508585))

(declare-fun m!508587 () Bool)

(assert (=> b!527664 m!508587))

(declare-fun m!508589 () Bool)

(assert (=> b!527664 m!508589))

(declare-fun m!508591 () Bool)

(assert (=> b!527664 m!508591))

(assert (=> b!527664 m!508581))

(declare-fun m!508593 () Bool)

(assert (=> b!527664 m!508593))

(declare-fun m!508595 () Bool)

(assert (=> b!527664 m!508595))

(assert (=> b!527664 m!508581))

(declare-fun m!508597 () Bool)

(assert (=> b!527664 m!508597))

(assert (=> b!527664 m!508581))

(declare-fun m!508599 () Bool)

(assert (=> b!527664 m!508599))

(declare-fun m!508601 () Bool)

(assert (=> b!527664 m!508601))

(declare-fun m!508603 () Bool)

(assert (=> b!527670 m!508603))

(declare-fun m!508605 () Bool)

(assert (=> start!47900 m!508605))

(declare-fun m!508607 () Bool)

(assert (=> start!47900 m!508607))

(assert (=> b!527675 m!508581))

(assert (=> b!527675 m!508581))

(declare-fun m!508609 () Bool)

(assert (=> b!527675 m!508609))

(declare-fun m!508611 () Bool)

(assert (=> b!527668 m!508611))

(declare-fun m!508613 () Bool)

(assert (=> b!527666 m!508613))

(assert (=> b!527671 m!508581))

(assert (=> b!527671 m!508581))

(declare-fun m!508615 () Bool)

(assert (=> b!527671 m!508615))

(check-sat (not b!527668) (not b!527674) (not b!527675) (not b!527676) (not start!47900) (not b!527673) (not b!527664) (not b!527666) (not b!527667) (not b!527670) (not b!527671))
(check-sat)
