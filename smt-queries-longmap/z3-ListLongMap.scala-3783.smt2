; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51754 () Bool)

(assert start!51754)

(declare-fun b!566303 () Bool)

(declare-fun e!325905 () Bool)

(declare-fun e!325908 () Bool)

(assert (=> b!566303 (= e!325905 e!325908)))

(declare-fun res!357275 () Bool)

(assert (=> b!566303 (=> (not res!357275) (not e!325908))))

(declare-datatypes ((SeekEntryResult!5529 0))(
  ( (MissingZero!5529 (index!24343 (_ BitVec 32))) (Found!5529 (index!24344 (_ BitVec 32))) (Intermediate!5529 (undefined!6341 Bool) (index!24345 (_ BitVec 32)) (x!53206 (_ BitVec 32))) (Undefined!5529) (MissingVacant!5529 (index!24346 (_ BitVec 32))) )
))
(declare-fun lt!258061 () SeekEntryResult!5529)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566303 (= res!357275 (or (= lt!258061 (MissingZero!5529 i!1132)) (= lt!258061 (MissingVacant!5529 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35562 0))(
  ( (array!35563 (arr!17080 (Array (_ BitVec 32) (_ BitVec 64))) (size!17444 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35562)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35562 (_ BitVec 32)) SeekEntryResult!5529)

(assert (=> b!566303 (= lt!258061 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun e!325906 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!566304 () Bool)

(assert (=> b!566304 (= e!325906 (= (seekEntryOrOpen!0 (select (arr!17080 a!3118) j!142) a!3118 mask!3119) (Found!5529 j!142)))))

(declare-fun b!566305 () Bool)

(declare-fun res!357274 () Bool)

(assert (=> b!566305 (=> (not res!357274) (not e!325905))))

(declare-fun arrayContainsKey!0 (array!35562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566305 (= res!357274 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566306 () Bool)

(declare-fun res!357272 () Bool)

(assert (=> b!566306 (=> (not res!357272) (not e!325905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566306 (= res!357272 (validKeyInArray!0 k0!1914))))

(declare-fun b!566307 () Bool)

(assert (=> b!566307 (= e!325908 (not true))))

(assert (=> b!566307 e!325906))

(declare-fun res!357273 () Bool)

(assert (=> b!566307 (=> (not res!357273) (not e!325906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35562 (_ BitVec 32)) Bool)

(assert (=> b!566307 (= res!357273 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17760 0))(
  ( (Unit!17761) )
))
(declare-fun lt!258060 () Unit!17760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17760)

(assert (=> b!566307 (= lt!258060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566309 () Bool)

(declare-fun res!357280 () Bool)

(assert (=> b!566309 (=> (not res!357280) (not e!325905))))

(assert (=> b!566309 (= res!357280 (and (= (size!17444 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17444 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17444 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566310 () Bool)

(declare-fun res!357276 () Bool)

(assert (=> b!566310 (=> (not res!357276) (not e!325908))))

(declare-datatypes ((List!11160 0))(
  ( (Nil!11157) (Cons!11156 (h!12162 (_ BitVec 64)) (t!17388 List!11160)) )
))
(declare-fun arrayNoDuplicates!0 (array!35562 (_ BitVec 32) List!11160) Bool)

(assert (=> b!566310 (= res!357276 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11157))))

(declare-fun b!566311 () Bool)

(declare-fun res!357278 () Bool)

(assert (=> b!566311 (=> (not res!357278) (not e!325908))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35562 (_ BitVec 32)) SeekEntryResult!5529)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566311 (= res!357278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17080 a!3118) j!142) mask!3119) (select (arr!17080 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17080 a!3118) i!1132 k0!1914) j!142) (array!35563 (store (arr!17080 a!3118) i!1132 k0!1914) (size!17444 a!3118)) mask!3119)))))

(declare-fun b!566312 () Bool)

(declare-fun res!357281 () Bool)

(assert (=> b!566312 (=> (not res!357281) (not e!325905))))

(assert (=> b!566312 (= res!357281 (validKeyInArray!0 (select (arr!17080 a!3118) j!142)))))

(declare-fun res!357277 () Bool)

(assert (=> start!51754 (=> (not res!357277) (not e!325905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51754 (= res!357277 (validMask!0 mask!3119))))

(assert (=> start!51754 e!325905))

(assert (=> start!51754 true))

(declare-fun array_inv!12876 (array!35562) Bool)

(assert (=> start!51754 (array_inv!12876 a!3118)))

(declare-fun b!566308 () Bool)

(declare-fun res!357279 () Bool)

(assert (=> b!566308 (=> (not res!357279) (not e!325908))))

(assert (=> b!566308 (= res!357279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51754 res!357277) b!566309))

(assert (= (and b!566309 res!357280) b!566312))

(assert (= (and b!566312 res!357281) b!566306))

(assert (= (and b!566306 res!357272) b!566305))

(assert (= (and b!566305 res!357274) b!566303))

(assert (= (and b!566303 res!357275) b!566308))

(assert (= (and b!566308 res!357279) b!566310))

(assert (= (and b!566310 res!357276) b!566311))

(assert (= (and b!566311 res!357278) b!566307))

(assert (= (and b!566307 res!357273) b!566304))

(declare-fun m!544935 () Bool)

(assert (=> b!566308 m!544935))

(declare-fun m!544937 () Bool)

(assert (=> b!566303 m!544937))

(declare-fun m!544939 () Bool)

(assert (=> b!566307 m!544939))

(declare-fun m!544941 () Bool)

(assert (=> b!566307 m!544941))

(declare-fun m!544943 () Bool)

(assert (=> b!566312 m!544943))

(assert (=> b!566312 m!544943))

(declare-fun m!544945 () Bool)

(assert (=> b!566312 m!544945))

(assert (=> b!566304 m!544943))

(assert (=> b!566304 m!544943))

(declare-fun m!544947 () Bool)

(assert (=> b!566304 m!544947))

(declare-fun m!544949 () Bool)

(assert (=> b!566310 m!544949))

(assert (=> b!566311 m!544943))

(declare-fun m!544951 () Bool)

(assert (=> b!566311 m!544951))

(assert (=> b!566311 m!544943))

(declare-fun m!544953 () Bool)

(assert (=> b!566311 m!544953))

(declare-fun m!544955 () Bool)

(assert (=> b!566311 m!544955))

(assert (=> b!566311 m!544953))

(declare-fun m!544957 () Bool)

(assert (=> b!566311 m!544957))

(assert (=> b!566311 m!544951))

(assert (=> b!566311 m!544943))

(declare-fun m!544959 () Bool)

(assert (=> b!566311 m!544959))

(declare-fun m!544961 () Bool)

(assert (=> b!566311 m!544961))

(assert (=> b!566311 m!544953))

(assert (=> b!566311 m!544955))

(declare-fun m!544963 () Bool)

(assert (=> b!566305 m!544963))

(declare-fun m!544965 () Bool)

(assert (=> start!51754 m!544965))

(declare-fun m!544967 () Bool)

(assert (=> start!51754 m!544967))

(declare-fun m!544969 () Bool)

(assert (=> b!566306 m!544969))

(check-sat (not b!566304) (not b!566312) (not b!566310) (not b!566307) (not b!566311) (not b!566303) (not b!566308) (not start!51754) (not b!566306) (not b!566305))
(check-sat)
