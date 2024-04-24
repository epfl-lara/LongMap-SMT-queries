; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52470 () Bool)

(assert start!52470)

(declare-fun b!572431 () Bool)

(declare-fun res!361845 () Bool)

(declare-fun e!329280 () Bool)

(assert (=> b!572431 (=> (not res!361845) (not e!329280))))

(declare-datatypes ((array!35814 0))(
  ( (array!35815 (arr!17194 (Array (_ BitVec 32) (_ BitVec 64))) (size!17558 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35814)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572431 (= res!361845 (validKeyInArray!0 (select (arr!17194 a!3118) j!142)))))

(declare-fun b!572432 () Bool)

(declare-fun e!329282 () Bool)

(declare-fun e!329279 () Bool)

(assert (=> b!572432 (= e!329282 e!329279)))

(declare-fun res!361838 () Bool)

(assert (=> b!572432 (=> res!361838 e!329279)))

(declare-datatypes ((SeekEntryResult!5599 0))(
  ( (MissingZero!5599 (index!24623 (_ BitVec 32))) (Found!5599 (index!24624 (_ BitVec 32))) (Intermediate!5599 (undefined!6411 Bool) (index!24625 (_ BitVec 32)) (x!53647 (_ BitVec 32))) (Undefined!5599) (MissingVacant!5599 (index!24626 (_ BitVec 32))) )
))
(declare-fun lt!261206 () SeekEntryResult!5599)

(get-info :version)

(assert (=> b!572432 (= res!361838 (or (undefined!6411 lt!261206) (not ((_ is Intermediate!5599) lt!261206))))))

(declare-fun b!572433 () Bool)

(declare-fun res!361834 () Bool)

(declare-fun e!329276 () Bool)

(assert (=> b!572433 (=> (not res!361834) (not e!329276))))

(declare-datatypes ((List!11181 0))(
  ( (Nil!11178) (Cons!11177 (h!12207 (_ BitVec 64)) (t!17401 List!11181)) )
))
(declare-fun arrayNoDuplicates!0 (array!35814 (_ BitVec 32) List!11181) Bool)

(assert (=> b!572433 (= res!361834 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11178))))

(declare-fun b!572434 () Bool)

(assert (=> b!572434 (= e!329280 e!329276)))

(declare-fun res!361837 () Bool)

(assert (=> b!572434 (=> (not res!361837) (not e!329276))))

(declare-fun lt!261210 () SeekEntryResult!5599)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572434 (= res!361837 (or (= lt!261210 (MissingZero!5599 i!1132)) (= lt!261210 (MissingVacant!5599 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35814 (_ BitVec 32)) SeekEntryResult!5599)

(assert (=> b!572434 (= lt!261210 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun lt!261205 () (_ BitVec 64))

(declare-fun lt!261203 () array!35814)

(declare-fun e!329277 () Bool)

(declare-fun b!572435 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35814 (_ BitVec 32)) SeekEntryResult!5599)

(assert (=> b!572435 (= e!329277 (= (seekEntryOrOpen!0 lt!261205 lt!261203 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53647 lt!261206) (index!24625 lt!261206) (index!24625 lt!261206) lt!261205 lt!261203 mask!3119)))))

(declare-fun b!572436 () Bool)

(declare-fun e!329281 () Bool)

(assert (=> b!572436 (= e!329276 e!329281)))

(declare-fun res!361840 () Bool)

(assert (=> b!572436 (=> (not res!361840) (not e!329281))))

(declare-fun lt!261207 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35814 (_ BitVec 32)) SeekEntryResult!5599)

(assert (=> b!572436 (= res!361840 (= lt!261206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261207 lt!261205 lt!261203 mask!3119)))))

(declare-fun lt!261208 () (_ BitVec 32))

(assert (=> b!572436 (= lt!261206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261208 (select (arr!17194 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572436 (= lt!261207 (toIndex!0 lt!261205 mask!3119))))

(assert (=> b!572436 (= lt!261205 (select (store (arr!17194 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572436 (= lt!261208 (toIndex!0 (select (arr!17194 a!3118) j!142) mask!3119))))

(assert (=> b!572436 (= lt!261203 (array!35815 (store (arr!17194 a!3118) i!1132 k0!1914) (size!17558 a!3118)))))

(declare-fun b!572437 () Bool)

(declare-fun res!361836 () Bool)

(assert (=> b!572437 (=> (not res!361836) (not e!329280))))

(declare-fun arrayContainsKey!0 (array!35814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572437 (= res!361836 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572438 () Bool)

(declare-fun e!329283 () Bool)

(assert (=> b!572438 (= e!329279 e!329283)))

(declare-fun res!361841 () Bool)

(assert (=> b!572438 (=> res!361841 e!329283)))

(declare-fun lt!261211 () (_ BitVec 64))

(assert (=> b!572438 (= res!361841 (or (= lt!261211 (select (arr!17194 a!3118) j!142)) (= lt!261211 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572438 (= lt!261211 (select (arr!17194 a!3118) (index!24625 lt!261206)))))

(declare-fun b!572439 () Bool)

(assert (=> b!572439 (= e!329281 (not true))))

(assert (=> b!572439 e!329282))

(declare-fun res!361846 () Bool)

(assert (=> b!572439 (=> (not res!361846) (not e!329282))))

(declare-fun lt!261209 () SeekEntryResult!5599)

(assert (=> b!572439 (= res!361846 (= lt!261209 (Found!5599 j!142)))))

(assert (=> b!572439 (= lt!261209 (seekEntryOrOpen!0 (select (arr!17194 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35814 (_ BitVec 32)) Bool)

(assert (=> b!572439 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17971 0))(
  ( (Unit!17972) )
))
(declare-fun lt!261204 () Unit!17971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17971)

(assert (=> b!572439 (= lt!261204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572440 () Bool)

(declare-fun res!361843 () Bool)

(assert (=> b!572440 (=> (not res!361843) (not e!329280))))

(assert (=> b!572440 (= res!361843 (validKeyInArray!0 k0!1914))))

(declare-fun b!572441 () Bool)

(assert (=> b!572441 (= e!329283 e!329277)))

(declare-fun res!361842 () Bool)

(assert (=> b!572441 (=> (not res!361842) (not e!329277))))

(assert (=> b!572441 (= res!361842 (= lt!261209 (seekKeyOrZeroReturnVacant!0 (x!53647 lt!261206) (index!24625 lt!261206) (index!24625 lt!261206) (select (arr!17194 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!361839 () Bool)

(assert (=> start!52470 (=> (not res!361839) (not e!329280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52470 (= res!361839 (validMask!0 mask!3119))))

(assert (=> start!52470 e!329280))

(assert (=> start!52470 true))

(declare-fun array_inv!13053 (array!35814) Bool)

(assert (=> start!52470 (array_inv!13053 a!3118)))

(declare-fun b!572442 () Bool)

(declare-fun res!361835 () Bool)

(assert (=> b!572442 (=> (not res!361835) (not e!329276))))

(assert (=> b!572442 (= res!361835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572443 () Bool)

(declare-fun res!361844 () Bool)

(assert (=> b!572443 (=> (not res!361844) (not e!329280))))

(assert (=> b!572443 (= res!361844 (and (= (size!17558 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17558 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17558 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52470 res!361839) b!572443))

(assert (= (and b!572443 res!361844) b!572431))

(assert (= (and b!572431 res!361845) b!572440))

(assert (= (and b!572440 res!361843) b!572437))

(assert (= (and b!572437 res!361836) b!572434))

(assert (= (and b!572434 res!361837) b!572442))

(assert (= (and b!572442 res!361835) b!572433))

(assert (= (and b!572433 res!361834) b!572436))

(assert (= (and b!572436 res!361840) b!572439))

(assert (= (and b!572439 res!361846) b!572432))

(assert (= (and b!572432 (not res!361838)) b!572438))

(assert (= (and b!572438 (not res!361841)) b!572441))

(assert (= (and b!572441 res!361842) b!572435))

(declare-fun m!551519 () Bool)

(assert (=> b!572442 m!551519))

(declare-fun m!551521 () Bool)

(assert (=> b!572435 m!551521))

(declare-fun m!551523 () Bool)

(assert (=> b!572435 m!551523))

(declare-fun m!551525 () Bool)

(assert (=> b!572433 m!551525))

(declare-fun m!551527 () Bool)

(assert (=> b!572438 m!551527))

(declare-fun m!551529 () Bool)

(assert (=> b!572438 m!551529))

(declare-fun m!551531 () Bool)

(assert (=> b!572437 m!551531))

(declare-fun m!551533 () Bool)

(assert (=> start!52470 m!551533))

(declare-fun m!551535 () Bool)

(assert (=> start!52470 m!551535))

(declare-fun m!551537 () Bool)

(assert (=> b!572440 m!551537))

(assert (=> b!572439 m!551527))

(assert (=> b!572439 m!551527))

(declare-fun m!551539 () Bool)

(assert (=> b!572439 m!551539))

(declare-fun m!551541 () Bool)

(assert (=> b!572439 m!551541))

(declare-fun m!551543 () Bool)

(assert (=> b!572439 m!551543))

(assert (=> b!572431 m!551527))

(assert (=> b!572431 m!551527))

(declare-fun m!551545 () Bool)

(assert (=> b!572431 m!551545))

(assert (=> b!572436 m!551527))

(declare-fun m!551547 () Bool)

(assert (=> b!572436 m!551547))

(assert (=> b!572436 m!551527))

(declare-fun m!551549 () Bool)

(assert (=> b!572436 m!551549))

(assert (=> b!572436 m!551527))

(declare-fun m!551551 () Bool)

(assert (=> b!572436 m!551551))

(declare-fun m!551553 () Bool)

(assert (=> b!572436 m!551553))

(declare-fun m!551555 () Bool)

(assert (=> b!572436 m!551555))

(declare-fun m!551557 () Bool)

(assert (=> b!572436 m!551557))

(declare-fun m!551559 () Bool)

(assert (=> b!572434 m!551559))

(assert (=> b!572441 m!551527))

(assert (=> b!572441 m!551527))

(declare-fun m!551561 () Bool)

(assert (=> b!572441 m!551561))

(check-sat (not b!572437) (not b!572433) (not b!572442) (not start!52470) (not b!572441) (not b!572431) (not b!572436) (not b!572439) (not b!572434) (not b!572435) (not b!572440))
(check-sat)
