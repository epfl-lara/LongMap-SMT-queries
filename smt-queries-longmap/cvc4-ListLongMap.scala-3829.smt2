; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52464 () Bool)

(assert start!52464)

(declare-datatypes ((array!35861 0))(
  ( (array!35862 (arr!17219 (Array (_ BitVec 32) (_ BitVec 64))) (size!17583 (_ BitVec 32))) )
))
(declare-fun lt!261633 () array!35861)

(declare-fun b!573011 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!329631 () Bool)

(declare-datatypes ((SeekEntryResult!5668 0))(
  ( (MissingZero!5668 (index!24899 (_ BitVec 32))) (Found!5668 (index!24900 (_ BitVec 32))) (Intermediate!5668 (undefined!6480 Bool) (index!24901 (_ BitVec 32)) (x!53761 (_ BitVec 32))) (Undefined!5668) (MissingVacant!5668 (index!24902 (_ BitVec 32))) )
))
(declare-fun lt!261632 () SeekEntryResult!5668)

(declare-fun lt!261638 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35861 (_ BitVec 32)) SeekEntryResult!5668)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35861 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!573011 (= e!329631 (= (seekEntryOrOpen!0 lt!261638 lt!261633 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261632) (index!24901 lt!261632) (index!24901 lt!261632) lt!261638 lt!261633 mask!3119)))))

(declare-fun b!573012 () Bool)

(declare-fun res!362527 () Bool)

(declare-fun e!329629 () Bool)

(assert (=> b!573012 (=> (not res!362527) (not e!329629))))

(declare-fun a!3118 () array!35861)

(declare-datatypes ((List!11299 0))(
  ( (Nil!11296) (Cons!11295 (h!12322 (_ BitVec 64)) (t!17527 List!11299)) )
))
(declare-fun arrayNoDuplicates!0 (array!35861 (_ BitVec 32) List!11299) Bool)

(assert (=> b!573012 (= res!362527 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11296))))

(declare-fun b!573013 () Bool)

(declare-fun e!329632 () Bool)

(assert (=> b!573013 (= e!329632 (not true))))

(declare-fun e!329628 () Bool)

(assert (=> b!573013 e!329628))

(declare-fun res!362520 () Bool)

(assert (=> b!573013 (=> (not res!362520) (not e!329628))))

(declare-fun lt!261640 () SeekEntryResult!5668)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!573013 (= res!362520 (= lt!261640 (Found!5668 j!142)))))

(assert (=> b!573013 (= lt!261640 (seekEntryOrOpen!0 (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35861 (_ BitVec 32)) Bool)

(assert (=> b!573013 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18038 0))(
  ( (Unit!18039) )
))
(declare-fun lt!261637 () Unit!18038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18038)

(assert (=> b!573013 (= lt!261637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573014 () Bool)

(declare-fun res!362530 () Bool)

(declare-fun e!329630 () Bool)

(assert (=> b!573014 (=> (not res!362530) (not e!329630))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573014 (= res!362530 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573015 () Bool)

(declare-fun res!362524 () Bool)

(assert (=> b!573015 (=> (not res!362524) (not e!329629))))

(assert (=> b!573015 (= res!362524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!362522 () Bool)

(assert (=> start!52464 (=> (not res!362522) (not e!329630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52464 (= res!362522 (validMask!0 mask!3119))))

(assert (=> start!52464 e!329630))

(assert (=> start!52464 true))

(declare-fun array_inv!13015 (array!35861) Bool)

(assert (=> start!52464 (array_inv!13015 a!3118)))

(declare-fun b!573016 () Bool)

(declare-fun res!362525 () Bool)

(assert (=> b!573016 (=> (not res!362525) (not e!329630))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573016 (= res!362525 (and (= (size!17583 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17583 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17583 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573017 () Bool)

(declare-fun e!329633 () Bool)

(declare-fun e!329634 () Bool)

(assert (=> b!573017 (= e!329633 e!329634)))

(declare-fun res!362519 () Bool)

(assert (=> b!573017 (=> res!362519 e!329634)))

(declare-fun lt!261639 () (_ BitVec 64))

(assert (=> b!573017 (= res!362519 (or (= lt!261639 (select (arr!17219 a!3118) j!142)) (= lt!261639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573017 (= lt!261639 (select (arr!17219 a!3118) (index!24901 lt!261632)))))

(declare-fun b!573018 () Bool)

(assert (=> b!573018 (= e!329634 e!329631)))

(declare-fun res!362528 () Bool)

(assert (=> b!573018 (=> (not res!362528) (not e!329631))))

(assert (=> b!573018 (= res!362528 (= lt!261640 (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261632) (index!24901 lt!261632) (index!24901 lt!261632) (select (arr!17219 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573019 () Bool)

(declare-fun res!362526 () Bool)

(assert (=> b!573019 (=> (not res!362526) (not e!329630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573019 (= res!362526 (validKeyInArray!0 k!1914))))

(declare-fun b!573020 () Bool)

(assert (=> b!573020 (= e!329628 e!329633)))

(declare-fun res!362529 () Bool)

(assert (=> b!573020 (=> res!362529 e!329633)))

(assert (=> b!573020 (= res!362529 (or (undefined!6480 lt!261632) (not (is-Intermediate!5668 lt!261632))))))

(declare-fun b!573021 () Bool)

(assert (=> b!573021 (= e!329630 e!329629)))

(declare-fun res!362521 () Bool)

(assert (=> b!573021 (=> (not res!362521) (not e!329629))))

(declare-fun lt!261634 () SeekEntryResult!5668)

(assert (=> b!573021 (= res!362521 (or (= lt!261634 (MissingZero!5668 i!1132)) (= lt!261634 (MissingVacant!5668 i!1132))))))

(assert (=> b!573021 (= lt!261634 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!573022 () Bool)

(assert (=> b!573022 (= e!329629 e!329632)))

(declare-fun res!362523 () Bool)

(assert (=> b!573022 (=> (not res!362523) (not e!329632))))

(declare-fun lt!261636 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35861 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!573022 (= res!362523 (= lt!261632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261636 lt!261638 lt!261633 mask!3119)))))

(declare-fun lt!261635 () (_ BitVec 32))

(assert (=> b!573022 (= lt!261632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261635 (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573022 (= lt!261636 (toIndex!0 lt!261638 mask!3119))))

(assert (=> b!573022 (= lt!261638 (select (store (arr!17219 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!573022 (= lt!261635 (toIndex!0 (select (arr!17219 a!3118) j!142) mask!3119))))

(assert (=> b!573022 (= lt!261633 (array!35862 (store (arr!17219 a!3118) i!1132 k!1914) (size!17583 a!3118)))))

(declare-fun b!573023 () Bool)

(declare-fun res!362531 () Bool)

(assert (=> b!573023 (=> (not res!362531) (not e!329630))))

(assert (=> b!573023 (= res!362531 (validKeyInArray!0 (select (arr!17219 a!3118) j!142)))))

(assert (= (and start!52464 res!362522) b!573016))

(assert (= (and b!573016 res!362525) b!573023))

(assert (= (and b!573023 res!362531) b!573019))

(assert (= (and b!573019 res!362526) b!573014))

(assert (= (and b!573014 res!362530) b!573021))

(assert (= (and b!573021 res!362521) b!573015))

(assert (= (and b!573015 res!362524) b!573012))

(assert (= (and b!573012 res!362527) b!573022))

(assert (= (and b!573022 res!362523) b!573013))

(assert (= (and b!573013 res!362520) b!573020))

(assert (= (and b!573020 (not res!362529)) b!573017))

(assert (= (and b!573017 (not res!362519)) b!573018))

(assert (= (and b!573018 res!362528) b!573011))

(declare-fun m!552061 () Bool)

(assert (=> b!573014 m!552061))

(declare-fun m!552063 () Bool)

(assert (=> b!573018 m!552063))

(assert (=> b!573018 m!552063))

(declare-fun m!552065 () Bool)

(assert (=> b!573018 m!552065))

(assert (=> b!573023 m!552063))

(assert (=> b!573023 m!552063))

(declare-fun m!552067 () Bool)

(assert (=> b!573023 m!552067))

(declare-fun m!552069 () Bool)

(assert (=> b!573021 m!552069))

(declare-fun m!552071 () Bool)

(assert (=> b!573015 m!552071))

(declare-fun m!552073 () Bool)

(assert (=> b!573012 m!552073))

(assert (=> b!573017 m!552063))

(declare-fun m!552075 () Bool)

(assert (=> b!573017 m!552075))

(declare-fun m!552077 () Bool)

(assert (=> b!573019 m!552077))

(assert (=> b!573013 m!552063))

(assert (=> b!573013 m!552063))

(declare-fun m!552079 () Bool)

(assert (=> b!573013 m!552079))

(declare-fun m!552081 () Bool)

(assert (=> b!573013 m!552081))

(declare-fun m!552083 () Bool)

(assert (=> b!573013 m!552083))

(declare-fun m!552085 () Bool)

(assert (=> start!52464 m!552085))

(declare-fun m!552087 () Bool)

(assert (=> start!52464 m!552087))

(declare-fun m!552089 () Bool)

(assert (=> b!573022 m!552089))

(assert (=> b!573022 m!552063))

(declare-fun m!552091 () Bool)

(assert (=> b!573022 m!552091))

(declare-fun m!552093 () Bool)

(assert (=> b!573022 m!552093))

(declare-fun m!552095 () Bool)

(assert (=> b!573022 m!552095))

(assert (=> b!573022 m!552063))

(declare-fun m!552097 () Bool)

(assert (=> b!573022 m!552097))

(assert (=> b!573022 m!552063))

(declare-fun m!552099 () Bool)

(assert (=> b!573022 m!552099))

(declare-fun m!552101 () Bool)

(assert (=> b!573011 m!552101))

(declare-fun m!552103 () Bool)

(assert (=> b!573011 m!552103))

(push 1)

