; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51686 () Bool)

(assert start!51686)

(declare-fun b!565192 () Bool)

(declare-fun res!356308 () Bool)

(declare-fun e!325397 () Bool)

(assert (=> b!565192 (=> (not res!356308) (not e!325397))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565192 (= res!356308 (validKeyInArray!0 k0!1914))))

(declare-fun b!565193 () Bool)

(declare-fun res!356303 () Bool)

(assert (=> b!565193 (=> (not res!356303) (not e!325397))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35503 0))(
  ( (array!35504 (arr!17051 (Array (_ BitVec 32) (_ BitVec 64))) (size!17416 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35503)

(assert (=> b!565193 (= res!356303 (and (= (size!17416 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17416 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17416 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565194 () Bool)

(declare-fun e!325398 () Bool)

(assert (=> b!565194 (= e!325398 (not true))))

(declare-fun e!325395 () Bool)

(assert (=> b!565194 e!325395))

(declare-fun res!356309 () Bool)

(assert (=> b!565194 (=> (not res!356309) (not e!325395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35503 (_ BitVec 32)) Bool)

(assert (=> b!565194 (= res!356309 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17682 0))(
  ( (Unit!17683) )
))
(declare-fun lt!257658 () Unit!17682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17682)

(assert (=> b!565194 (= lt!257658 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565195 () Bool)

(declare-datatypes ((SeekEntryResult!5497 0))(
  ( (MissingZero!5497 (index!24215 (_ BitVec 32))) (Found!5497 (index!24216 (_ BitVec 32))) (Intermediate!5497 (undefined!6309 Bool) (index!24217 (_ BitVec 32)) (x!53097 (_ BitVec 32))) (Undefined!5497) (MissingVacant!5497 (index!24218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35503 (_ BitVec 32)) SeekEntryResult!5497)

(assert (=> b!565195 (= e!325395 (= (seekEntryOrOpen!0 (select (arr!17051 a!3118) j!142) a!3118 mask!3119) (Found!5497 j!142)))))

(declare-fun b!565196 () Bool)

(assert (=> b!565196 (= e!325397 e!325398)))

(declare-fun res!356304 () Bool)

(assert (=> b!565196 (=> (not res!356304) (not e!325398))))

(declare-fun lt!257659 () SeekEntryResult!5497)

(assert (=> b!565196 (= res!356304 (or (= lt!257659 (MissingZero!5497 i!1132)) (= lt!257659 (MissingVacant!5497 i!1132))))))

(assert (=> b!565196 (= lt!257659 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565197 () Bool)

(declare-fun res!356310 () Bool)

(assert (=> b!565197 (=> (not res!356310) (not e!325397))))

(declare-fun arrayContainsKey!0 (array!35503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565197 (= res!356310 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!356307 () Bool)

(assert (=> start!51686 (=> (not res!356307) (not e!325397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51686 (= res!356307 (validMask!0 mask!3119))))

(assert (=> start!51686 e!325397))

(assert (=> start!51686 true))

(declare-fun array_inv!12934 (array!35503) Bool)

(assert (=> start!51686 (array_inv!12934 a!3118)))

(declare-fun b!565198 () Bool)

(declare-fun res!356306 () Bool)

(assert (=> b!565198 (=> (not res!356306) (not e!325398))))

(declare-datatypes ((List!11170 0))(
  ( (Nil!11167) (Cons!11166 (h!12172 (_ BitVec 64)) (t!17389 List!11170)) )
))
(declare-fun arrayNoDuplicates!0 (array!35503 (_ BitVec 32) List!11170) Bool)

(assert (=> b!565198 (= res!356306 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11167))))

(declare-fun b!565199 () Bool)

(declare-fun res!356311 () Bool)

(assert (=> b!565199 (=> (not res!356311) (not e!325398))))

(assert (=> b!565199 (= res!356311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565200 () Bool)

(declare-fun res!356305 () Bool)

(assert (=> b!565200 (=> (not res!356305) (not e!325398))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35503 (_ BitVec 32)) SeekEntryResult!5497)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565200 (= res!356305 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17051 a!3118) j!142) mask!3119) (select (arr!17051 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17051 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17051 a!3118) i!1132 k0!1914) j!142) (array!35504 (store (arr!17051 a!3118) i!1132 k0!1914) (size!17416 a!3118)) mask!3119)))))

(declare-fun b!565201 () Bool)

(declare-fun res!356312 () Bool)

(assert (=> b!565201 (=> (not res!356312) (not e!325397))))

(assert (=> b!565201 (= res!356312 (validKeyInArray!0 (select (arr!17051 a!3118) j!142)))))

(assert (= (and start!51686 res!356307) b!565193))

(assert (= (and b!565193 res!356303) b!565201))

(assert (= (and b!565201 res!356312) b!565192))

(assert (= (and b!565192 res!356308) b!565197))

(assert (= (and b!565197 res!356310) b!565196))

(assert (= (and b!565196 res!356304) b!565199))

(assert (= (and b!565199 res!356311) b!565198))

(assert (= (and b!565198 res!356306) b!565200))

(assert (= (and b!565200 res!356305) b!565194))

(assert (= (and b!565194 res!356309) b!565195))

(declare-fun m!543155 () Bool)

(assert (=> b!565198 m!543155))

(declare-fun m!543157 () Bool)

(assert (=> b!565196 m!543157))

(declare-fun m!543159 () Bool)

(assert (=> b!565197 m!543159))

(declare-fun m!543161 () Bool)

(assert (=> b!565199 m!543161))

(declare-fun m!543163 () Bool)

(assert (=> start!51686 m!543163))

(declare-fun m!543165 () Bool)

(assert (=> start!51686 m!543165))

(declare-fun m!543167 () Bool)

(assert (=> b!565192 m!543167))

(declare-fun m!543169 () Bool)

(assert (=> b!565194 m!543169))

(declare-fun m!543171 () Bool)

(assert (=> b!565194 m!543171))

(declare-fun m!543173 () Bool)

(assert (=> b!565195 m!543173))

(assert (=> b!565195 m!543173))

(declare-fun m!543175 () Bool)

(assert (=> b!565195 m!543175))

(assert (=> b!565201 m!543173))

(assert (=> b!565201 m!543173))

(declare-fun m!543177 () Bool)

(assert (=> b!565201 m!543177))

(assert (=> b!565200 m!543173))

(declare-fun m!543179 () Bool)

(assert (=> b!565200 m!543179))

(assert (=> b!565200 m!543173))

(declare-fun m!543181 () Bool)

(assert (=> b!565200 m!543181))

(declare-fun m!543183 () Bool)

(assert (=> b!565200 m!543183))

(assert (=> b!565200 m!543181))

(declare-fun m!543185 () Bool)

(assert (=> b!565200 m!543185))

(assert (=> b!565200 m!543179))

(assert (=> b!565200 m!543173))

(declare-fun m!543187 () Bool)

(assert (=> b!565200 m!543187))

(declare-fun m!543189 () Bool)

(assert (=> b!565200 m!543189))

(assert (=> b!565200 m!543181))

(assert (=> b!565200 m!543183))

(check-sat (not start!51686) (not b!565196) (not b!565195) (not b!565201) (not b!565197) (not b!565199) (not b!565194) (not b!565200) (not b!565198) (not b!565192))
(check-sat)
