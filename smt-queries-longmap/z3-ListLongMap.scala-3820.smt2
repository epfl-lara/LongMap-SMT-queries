; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52394 () Bool)

(assert start!52394)

(declare-fun b!571609 () Bool)

(declare-fun e!328758 () Bool)

(declare-fun e!328759 () Bool)

(assert (=> b!571609 (= e!328758 e!328759)))

(declare-fun res!361265 () Bool)

(assert (=> b!571609 (=> res!361265 e!328759)))

(declare-datatypes ((SeekEntryResult!5635 0))(
  ( (MissingZero!5635 (index!24767 (_ BitVec 32))) (Found!5635 (index!24768 (_ BitVec 32))) (Intermediate!5635 (undefined!6447 Bool) (index!24769 (_ BitVec 32)) (x!53651 (_ BitVec 32))) (Undefined!5635) (MissingVacant!5635 (index!24770 (_ BitVec 32))) )
))
(declare-fun lt!260617 () SeekEntryResult!5635)

(get-info :version)

(assert (=> b!571609 (= res!361265 (or (undefined!6447 lt!260617) (not ((_ is Intermediate!5635) lt!260617))))))

(declare-fun b!571610 () Bool)

(declare-fun e!328763 () Bool)

(declare-fun e!328760 () Bool)

(assert (=> b!571610 (= e!328763 e!328760)))

(declare-fun res!361261 () Bool)

(assert (=> b!571610 (=> (not res!361261) (not e!328760))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260623 () (_ BitVec 64))

(declare-datatypes ((array!35800 0))(
  ( (array!35801 (arr!17189 (Array (_ BitVec 32) (_ BitVec 64))) (size!17554 (_ BitVec 32))) )
))
(declare-fun lt!260616 () array!35800)

(declare-fun lt!260621 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35800 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!571610 (= res!361261 (= lt!260617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260621 lt!260623 lt!260616 mask!3119)))))

(declare-fun a!3118 () array!35800)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260615 () (_ BitVec 32))

(assert (=> b!571610 (= lt!260617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260615 (select (arr!17189 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571610 (= lt!260621 (toIndex!0 lt!260623 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571610 (= lt!260623 (select (store (arr!17189 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571610 (= lt!260615 (toIndex!0 (select (arr!17189 a!3118) j!142) mask!3119))))

(assert (=> b!571610 (= lt!260616 (array!35801 (store (arr!17189 a!3118) i!1132 k0!1914) (size!17554 a!3118)))))

(declare-fun b!571611 () Bool)

(declare-fun e!328761 () Bool)

(assert (=> b!571611 (= e!328759 e!328761)))

(declare-fun res!361267 () Bool)

(assert (=> b!571611 (=> res!361267 e!328761)))

(declare-fun lt!260618 () (_ BitVec 64))

(assert (=> b!571611 (= res!361267 (or (= lt!260618 (select (arr!17189 a!3118) j!142)) (= lt!260618 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571611 (= lt!260618 (select (arr!17189 a!3118) (index!24769 lt!260617)))))

(declare-fun b!571612 () Bool)

(declare-fun res!361259 () Bool)

(assert (=> b!571612 (=> (not res!361259) (not e!328763))))

(declare-datatypes ((List!11308 0))(
  ( (Nil!11305) (Cons!11304 (h!12331 (_ BitVec 64)) (t!17527 List!11308)) )
))
(declare-fun arrayNoDuplicates!0 (array!35800 (_ BitVec 32) List!11308) Bool)

(assert (=> b!571612 (= res!361259 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11305))))

(declare-fun b!571613 () Bool)

(declare-fun res!361260 () Bool)

(assert (=> b!571613 (=> (not res!361260) (not e!328763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35800 (_ BitVec 32)) Bool)

(assert (=> b!571613 (= res!361260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571614 () Bool)

(declare-fun res!361268 () Bool)

(declare-fun e!328757 () Bool)

(assert (=> b!571614 (=> (not res!361268) (not e!328757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571614 (= res!361268 (validKeyInArray!0 (select (arr!17189 a!3118) j!142)))))

(declare-fun b!571615 () Bool)

(declare-fun res!361270 () Bool)

(assert (=> b!571615 (=> (not res!361270) (not e!328757))))

(assert (=> b!571615 (= res!361270 (validKeyInArray!0 k0!1914))))

(declare-fun b!571616 () Bool)

(declare-fun res!361271 () Bool)

(assert (=> b!571616 (=> (not res!361271) (not e!328757))))

(declare-fun arrayContainsKey!0 (array!35800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571616 (= res!361271 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!328762 () Bool)

(declare-fun b!571617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35800 (_ BitVec 32)) SeekEntryResult!5635)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35800 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!571617 (= e!328762 (= (seekEntryOrOpen!0 lt!260623 lt!260616 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53651 lt!260617) (index!24769 lt!260617) (index!24769 lt!260617) lt!260623 lt!260616 mask!3119)))))

(declare-fun b!571618 () Bool)

(declare-fun res!361266 () Bool)

(assert (=> b!571618 (=> (not res!361266) (not e!328757))))

(assert (=> b!571618 (= res!361266 (and (= (size!17554 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17554 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17554 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571620 () Bool)

(assert (=> b!571620 (= e!328760 (not true))))

(assert (=> b!571620 e!328758))

(declare-fun res!361263 () Bool)

(assert (=> b!571620 (=> (not res!361263) (not e!328758))))

(declare-fun lt!260620 () SeekEntryResult!5635)

(assert (=> b!571620 (= res!361263 (= lt!260620 (Found!5635 j!142)))))

(assert (=> b!571620 (= lt!260620 (seekEntryOrOpen!0 (select (arr!17189 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571620 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17958 0))(
  ( (Unit!17959) )
))
(declare-fun lt!260622 () Unit!17958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17958)

(assert (=> b!571620 (= lt!260622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571621 () Bool)

(assert (=> b!571621 (= e!328761 e!328762)))

(declare-fun res!361264 () Bool)

(assert (=> b!571621 (=> (not res!361264) (not e!328762))))

(assert (=> b!571621 (= res!361264 (= lt!260620 (seekKeyOrZeroReturnVacant!0 (x!53651 lt!260617) (index!24769 lt!260617) (index!24769 lt!260617) (select (arr!17189 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!361269 () Bool)

(assert (=> start!52394 (=> (not res!361269) (not e!328757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52394 (= res!361269 (validMask!0 mask!3119))))

(assert (=> start!52394 e!328757))

(assert (=> start!52394 true))

(declare-fun array_inv!13072 (array!35800) Bool)

(assert (=> start!52394 (array_inv!13072 a!3118)))

(declare-fun b!571619 () Bool)

(assert (=> b!571619 (= e!328757 e!328763)))

(declare-fun res!361262 () Bool)

(assert (=> b!571619 (=> (not res!361262) (not e!328763))))

(declare-fun lt!260619 () SeekEntryResult!5635)

(assert (=> b!571619 (= res!361262 (or (= lt!260619 (MissingZero!5635 i!1132)) (= lt!260619 (MissingVacant!5635 i!1132))))))

(assert (=> b!571619 (= lt!260619 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52394 res!361269) b!571618))

(assert (= (and b!571618 res!361266) b!571614))

(assert (= (and b!571614 res!361268) b!571615))

(assert (= (and b!571615 res!361270) b!571616))

(assert (= (and b!571616 res!361271) b!571619))

(assert (= (and b!571619 res!361262) b!571613))

(assert (= (and b!571613 res!361260) b!571612))

(assert (= (and b!571612 res!361259) b!571610))

(assert (= (and b!571610 res!361261) b!571620))

(assert (= (and b!571620 res!361263) b!571609))

(assert (= (and b!571609 (not res!361265)) b!571611))

(assert (= (and b!571611 (not res!361267)) b!571621))

(assert (= (and b!571621 res!361264) b!571617))

(declare-fun m!550013 () Bool)

(assert (=> b!571610 m!550013))

(declare-fun m!550015 () Bool)

(assert (=> b!571610 m!550015))

(assert (=> b!571610 m!550013))

(declare-fun m!550017 () Bool)

(assert (=> b!571610 m!550017))

(assert (=> b!571610 m!550013))

(declare-fun m!550019 () Bool)

(assert (=> b!571610 m!550019))

(declare-fun m!550021 () Bool)

(assert (=> b!571610 m!550021))

(declare-fun m!550023 () Bool)

(assert (=> b!571610 m!550023))

(declare-fun m!550025 () Bool)

(assert (=> b!571610 m!550025))

(assert (=> b!571620 m!550013))

(assert (=> b!571620 m!550013))

(declare-fun m!550027 () Bool)

(assert (=> b!571620 m!550027))

(declare-fun m!550029 () Bool)

(assert (=> b!571620 m!550029))

(declare-fun m!550031 () Bool)

(assert (=> b!571620 m!550031))

(declare-fun m!550033 () Bool)

(assert (=> b!571616 m!550033))

(declare-fun m!550035 () Bool)

(assert (=> b!571613 m!550035))

(declare-fun m!550037 () Bool)

(assert (=> b!571615 m!550037))

(declare-fun m!550039 () Bool)

(assert (=> b!571612 m!550039))

(declare-fun m!550041 () Bool)

(assert (=> b!571619 m!550041))

(declare-fun m!550043 () Bool)

(assert (=> start!52394 m!550043))

(declare-fun m!550045 () Bool)

(assert (=> start!52394 m!550045))

(declare-fun m!550047 () Bool)

(assert (=> b!571617 m!550047))

(declare-fun m!550049 () Bool)

(assert (=> b!571617 m!550049))

(assert (=> b!571611 m!550013))

(declare-fun m!550051 () Bool)

(assert (=> b!571611 m!550051))

(assert (=> b!571614 m!550013))

(assert (=> b!571614 m!550013))

(declare-fun m!550053 () Bool)

(assert (=> b!571614 m!550053))

(assert (=> b!571621 m!550013))

(assert (=> b!571621 m!550013))

(declare-fun m!550055 () Bool)

(assert (=> b!571621 m!550055))

(check-sat (not b!571620) (not b!571617) (not start!52394) (not b!571610) (not b!571613) (not b!571616) (not b!571619) (not b!571615) (not b!571621) (not b!571612) (not b!571614))
(check-sat)
