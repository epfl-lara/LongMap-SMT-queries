; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52338 () Bool)

(assert start!52338)

(declare-fun b!570822 () Bool)

(declare-fun e!328312 () Bool)

(assert (=> b!570822 (= e!328312 (not true))))

(declare-fun e!328314 () Bool)

(assert (=> b!570822 e!328314))

(declare-fun res!360507 () Bool)

(assert (=> b!570822 (=> (not res!360507) (not e!328314))))

(declare-datatypes ((SeekEntryResult!5566 0))(
  ( (MissingZero!5566 (index!24491 (_ BitVec 32))) (Found!5566 (index!24492 (_ BitVec 32))) (Intermediate!5566 (undefined!6378 Bool) (index!24493 (_ BitVec 32)) (x!53517 (_ BitVec 32))) (Undefined!5566) (MissingVacant!5566 (index!24494 (_ BitVec 32))) )
))
(declare-fun lt!260244 () SeekEntryResult!5566)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570822 (= res!360507 (= lt!260244 (Found!5566 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35745 0))(
  ( (array!35746 (arr!17161 (Array (_ BitVec 32) (_ BitVec 64))) (size!17525 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35745 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!570822 (= lt!260244 (seekEntryOrOpen!0 (select (arr!17161 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35745 (_ BitVec 32)) Bool)

(assert (=> b!570822 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17905 0))(
  ( (Unit!17906) )
))
(declare-fun lt!260247 () Unit!17905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17905)

(assert (=> b!570822 (= lt!260247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570823 () Bool)

(declare-fun lt!260246 () SeekEntryResult!5566)

(declare-fun e!328316 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35745 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!570823 (= e!328316 (= lt!260244 (seekKeyOrZeroReturnVacant!0 (x!53517 lt!260246) (index!24493 lt!260246) (index!24493 lt!260246) (select (arr!17161 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!360499 () Bool)

(declare-fun e!328315 () Bool)

(assert (=> start!52338 (=> (not res!360499) (not e!328315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52338 (= res!360499 (validMask!0 mask!3119))))

(assert (=> start!52338 e!328315))

(assert (=> start!52338 true))

(declare-fun array_inv!13020 (array!35745) Bool)

(assert (=> start!52338 (array_inv!13020 a!3118)))

(declare-fun b!570824 () Bool)

(assert (=> b!570824 (= e!328314 e!328316)))

(declare-fun res!360508 () Bool)

(assert (=> b!570824 (=> res!360508 e!328316)))

(get-info :version)

(assert (=> b!570824 (= res!360508 (or (undefined!6378 lt!260246) (not ((_ is Intermediate!5566) lt!260246)) (= (select (arr!17161 a!3118) (index!24493 lt!260246)) (select (arr!17161 a!3118) j!142)) (= (select (arr!17161 a!3118) (index!24493 lt!260246)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570825 () Bool)

(declare-fun res!360502 () Bool)

(declare-fun e!328313 () Bool)

(assert (=> b!570825 (=> (not res!360502) (not e!328313))))

(assert (=> b!570825 (= res!360502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570826 () Bool)

(assert (=> b!570826 (= e!328313 e!328312)))

(declare-fun res!360505 () Bool)

(assert (=> b!570826 (=> (not res!360505) (not e!328312))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!260245 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35745 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!570826 (= res!360505 (= lt!260246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260245 (select (store (arr!17161 a!3118) i!1132 k0!1914) j!142) (array!35746 (store (arr!17161 a!3118) i!1132 k0!1914) (size!17525 a!3118)) mask!3119)))))

(declare-fun lt!260243 () (_ BitVec 32))

(assert (=> b!570826 (= lt!260246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260243 (select (arr!17161 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570826 (= lt!260245 (toIndex!0 (select (store (arr!17161 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570826 (= lt!260243 (toIndex!0 (select (arr!17161 a!3118) j!142) mask!3119))))

(declare-fun b!570827 () Bool)

(declare-fun res!360498 () Bool)

(assert (=> b!570827 (=> (not res!360498) (not e!328315))))

(declare-fun arrayContainsKey!0 (array!35745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570827 (= res!360498 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570828 () Bool)

(declare-fun res!360504 () Bool)

(assert (=> b!570828 (=> (not res!360504) (not e!328313))))

(declare-datatypes ((List!11148 0))(
  ( (Nil!11145) (Cons!11144 (h!12171 (_ BitVec 64)) (t!17368 List!11148)) )
))
(declare-fun arrayNoDuplicates!0 (array!35745 (_ BitVec 32) List!11148) Bool)

(assert (=> b!570828 (= res!360504 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11145))))

(declare-fun b!570829 () Bool)

(declare-fun res!360506 () Bool)

(assert (=> b!570829 (=> (not res!360506) (not e!328315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570829 (= res!360506 (validKeyInArray!0 (select (arr!17161 a!3118) j!142)))))

(declare-fun b!570830 () Bool)

(declare-fun res!360500 () Bool)

(assert (=> b!570830 (=> (not res!360500) (not e!328315))))

(assert (=> b!570830 (= res!360500 (validKeyInArray!0 k0!1914))))

(declare-fun b!570831 () Bool)

(declare-fun res!360503 () Bool)

(assert (=> b!570831 (=> (not res!360503) (not e!328315))))

(assert (=> b!570831 (= res!360503 (and (= (size!17525 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17525 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17525 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570832 () Bool)

(assert (=> b!570832 (= e!328315 e!328313)))

(declare-fun res!360501 () Bool)

(assert (=> b!570832 (=> (not res!360501) (not e!328313))))

(declare-fun lt!260248 () SeekEntryResult!5566)

(assert (=> b!570832 (= res!360501 (or (= lt!260248 (MissingZero!5566 i!1132)) (= lt!260248 (MissingVacant!5566 i!1132))))))

(assert (=> b!570832 (= lt!260248 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52338 res!360499) b!570831))

(assert (= (and b!570831 res!360503) b!570829))

(assert (= (and b!570829 res!360506) b!570830))

(assert (= (and b!570830 res!360500) b!570827))

(assert (= (and b!570827 res!360498) b!570832))

(assert (= (and b!570832 res!360501) b!570825))

(assert (= (and b!570825 res!360502) b!570828))

(assert (= (and b!570828 res!360504) b!570826))

(assert (= (and b!570826 res!360505) b!570822))

(assert (= (and b!570822 res!360507) b!570824))

(assert (= (and b!570824 (not res!360508)) b!570823))

(declare-fun m!549827 () Bool)

(assert (=> b!570829 m!549827))

(assert (=> b!570829 m!549827))

(declare-fun m!549829 () Bool)

(assert (=> b!570829 m!549829))

(declare-fun m!549831 () Bool)

(assert (=> start!52338 m!549831))

(declare-fun m!549833 () Bool)

(assert (=> start!52338 m!549833))

(declare-fun m!549835 () Bool)

(assert (=> b!570830 m!549835))

(assert (=> b!570826 m!549827))

(declare-fun m!549837 () Bool)

(assert (=> b!570826 m!549837))

(declare-fun m!549839 () Bool)

(assert (=> b!570826 m!549839))

(declare-fun m!549841 () Bool)

(assert (=> b!570826 m!549841))

(assert (=> b!570826 m!549827))

(declare-fun m!549843 () Bool)

(assert (=> b!570826 m!549843))

(assert (=> b!570826 m!549827))

(assert (=> b!570826 m!549839))

(declare-fun m!549845 () Bool)

(assert (=> b!570826 m!549845))

(assert (=> b!570826 m!549839))

(declare-fun m!549847 () Bool)

(assert (=> b!570826 m!549847))

(declare-fun m!549849 () Bool)

(assert (=> b!570828 m!549849))

(declare-fun m!549851 () Bool)

(assert (=> b!570827 m!549851))

(declare-fun m!549853 () Bool)

(assert (=> b!570832 m!549853))

(assert (=> b!570822 m!549827))

(assert (=> b!570822 m!549827))

(declare-fun m!549855 () Bool)

(assert (=> b!570822 m!549855))

(declare-fun m!549857 () Bool)

(assert (=> b!570822 m!549857))

(declare-fun m!549859 () Bool)

(assert (=> b!570822 m!549859))

(assert (=> b!570823 m!549827))

(assert (=> b!570823 m!549827))

(declare-fun m!549861 () Bool)

(assert (=> b!570823 m!549861))

(declare-fun m!549863 () Bool)

(assert (=> b!570824 m!549863))

(assert (=> b!570824 m!549827))

(declare-fun m!549865 () Bool)

(assert (=> b!570825 m!549865))

(check-sat (not b!570825) (not b!570832) (not start!52338) (not b!570826) (not b!570830) (not b!570827) (not b!570823) (not b!570822) (not b!570829) (not b!570828))
(check-sat)
