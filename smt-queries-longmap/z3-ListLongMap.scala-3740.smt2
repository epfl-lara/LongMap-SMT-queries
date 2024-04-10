; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51436 () Bool)

(assert start!51436)

(declare-fun b!562193 () Bool)

(declare-fun e!323988 () Bool)

(declare-fun e!323989 () Bool)

(assert (=> b!562193 (= e!323988 e!323989)))

(declare-fun res!353349 () Bool)

(assert (=> b!562193 (=> (not res!353349) (not e!323989))))

(declare-fun lt!256031 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5400 0))(
  ( (MissingZero!5400 (index!23827 (_ BitVec 32))) (Found!5400 (index!23828 (_ BitVec 32))) (Intermediate!5400 (undefined!6212 Bool) (index!23829 (_ BitVec 32)) (x!52727 (_ BitVec 32))) (Undefined!5400) (MissingVacant!5400 (index!23830 (_ BitVec 32))) )
))
(declare-fun lt!256039 () SeekEntryResult!5400)

(declare-fun lt!256032 () (_ BitVec 32))

(declare-datatypes ((array!35301 0))(
  ( (array!35302 (arr!16951 (Array (_ BitVec 32) (_ BitVec 64))) (size!17315 (_ BitVec 32))) )
))
(declare-fun lt!256033 () array!35301)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35301 (_ BitVec 32)) SeekEntryResult!5400)

(assert (=> b!562193 (= res!353349 (= lt!256039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256032 lt!256031 lt!256033 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256037 () (_ BitVec 32))

(declare-fun a!3118 () array!35301)

(assert (=> b!562193 (= lt!256039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256037 (select (arr!16951 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562193 (= lt!256032 (toIndex!0 lt!256031 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562193 (= lt!256031 (select (store (arr!16951 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562193 (= lt!256037 (toIndex!0 (select (arr!16951 a!3118) j!142) mask!3119))))

(assert (=> b!562193 (= lt!256033 (array!35302 (store (arr!16951 a!3118) i!1132 k0!1914) (size!17315 a!3118)))))

(declare-fun e!323985 () Bool)

(declare-fun b!562194 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35301 (_ BitVec 32)) SeekEntryResult!5400)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35301 (_ BitVec 32)) SeekEntryResult!5400)

(assert (=> b!562194 (= e!323985 (= (seekEntryOrOpen!0 lt!256031 lt!256033 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52727 lt!256039) (index!23829 lt!256039) (index!23829 lt!256039) lt!256031 lt!256033 mask!3119)))))

(declare-fun b!562195 () Bool)

(declare-fun res!353345 () Bool)

(assert (=> b!562195 (=> (not res!353345) (not e!323988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35301 (_ BitVec 32)) Bool)

(assert (=> b!562195 (= res!353345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562196 () Bool)

(declare-fun res!353346 () Bool)

(declare-fun e!323986 () Bool)

(assert (=> b!562196 (=> (not res!353346) (not e!323986))))

(assert (=> b!562196 (= res!353346 (and (= (size!17315 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17315 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17315 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562197 () Bool)

(declare-fun res!353357 () Bool)

(assert (=> b!562197 (=> (not res!353357) (not e!323988))))

(declare-datatypes ((List!11031 0))(
  ( (Nil!11028) (Cons!11027 (h!12030 (_ BitVec 64)) (t!17259 List!11031)) )
))
(declare-fun arrayNoDuplicates!0 (array!35301 (_ BitVec 32) List!11031) Bool)

(assert (=> b!562197 (= res!353357 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11028))))

(declare-fun res!353352 () Bool)

(assert (=> start!51436 (=> (not res!353352) (not e!323986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51436 (= res!353352 (validMask!0 mask!3119))))

(assert (=> start!51436 e!323986))

(assert (=> start!51436 true))

(declare-fun array_inv!12747 (array!35301) Bool)

(assert (=> start!51436 (array_inv!12747 a!3118)))

(declare-fun b!562198 () Bool)

(assert (=> b!562198 (= e!323989 (not true))))

(declare-fun e!323990 () Bool)

(assert (=> b!562198 e!323990))

(declare-fun res!353355 () Bool)

(assert (=> b!562198 (=> (not res!353355) (not e!323990))))

(declare-fun lt!256038 () SeekEntryResult!5400)

(assert (=> b!562198 (= res!353355 (= lt!256038 (Found!5400 j!142)))))

(assert (=> b!562198 (= lt!256038 (seekEntryOrOpen!0 (select (arr!16951 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562198 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17574 0))(
  ( (Unit!17575) )
))
(declare-fun lt!256034 () Unit!17574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17574)

(assert (=> b!562198 (= lt!256034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562199 () Bool)

(declare-fun res!353356 () Bool)

(assert (=> b!562199 (=> (not res!353356) (not e!323986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562199 (= res!353356 (validKeyInArray!0 k0!1914))))

(declare-fun b!562200 () Bool)

(declare-fun e!323984 () Bool)

(declare-fun e!323987 () Bool)

(assert (=> b!562200 (= e!323984 e!323987)))

(declare-fun res!353350 () Bool)

(assert (=> b!562200 (=> res!353350 e!323987)))

(declare-fun lt!256036 () (_ BitVec 64))

(assert (=> b!562200 (= res!353350 (or (= lt!256036 (select (arr!16951 a!3118) j!142)) (= lt!256036 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562200 (= lt!256036 (select (arr!16951 a!3118) (index!23829 lt!256039)))))

(declare-fun b!562201 () Bool)

(assert (=> b!562201 (= e!323986 e!323988)))

(declare-fun res!353347 () Bool)

(assert (=> b!562201 (=> (not res!353347) (not e!323988))))

(declare-fun lt!256035 () SeekEntryResult!5400)

(assert (=> b!562201 (= res!353347 (or (= lt!256035 (MissingZero!5400 i!1132)) (= lt!256035 (MissingVacant!5400 i!1132))))))

(assert (=> b!562201 (= lt!256035 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562202 () Bool)

(assert (=> b!562202 (= e!323990 e!323984)))

(declare-fun res!353351 () Bool)

(assert (=> b!562202 (=> res!353351 e!323984)))

(get-info :version)

(assert (=> b!562202 (= res!353351 (or (undefined!6212 lt!256039) (not ((_ is Intermediate!5400) lt!256039))))))

(declare-fun b!562203 () Bool)

(assert (=> b!562203 (= e!323987 e!323985)))

(declare-fun res!353348 () Bool)

(assert (=> b!562203 (=> (not res!353348) (not e!323985))))

(assert (=> b!562203 (= res!353348 (= lt!256038 (seekKeyOrZeroReturnVacant!0 (x!52727 lt!256039) (index!23829 lt!256039) (index!23829 lt!256039) (select (arr!16951 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562204 () Bool)

(declare-fun res!353354 () Bool)

(assert (=> b!562204 (=> (not res!353354) (not e!323986))))

(declare-fun arrayContainsKey!0 (array!35301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562204 (= res!353354 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562205 () Bool)

(declare-fun res!353353 () Bool)

(assert (=> b!562205 (=> (not res!353353) (not e!323986))))

(assert (=> b!562205 (= res!353353 (validKeyInArray!0 (select (arr!16951 a!3118) j!142)))))

(assert (= (and start!51436 res!353352) b!562196))

(assert (= (and b!562196 res!353346) b!562205))

(assert (= (and b!562205 res!353353) b!562199))

(assert (= (and b!562199 res!353356) b!562204))

(assert (= (and b!562204 res!353354) b!562201))

(assert (= (and b!562201 res!353347) b!562195))

(assert (= (and b!562195 res!353345) b!562197))

(assert (= (and b!562197 res!353357) b!562193))

(assert (= (and b!562193 res!353349) b!562198))

(assert (= (and b!562198 res!353355) b!562202))

(assert (= (and b!562202 (not res!353351)) b!562200))

(assert (= (and b!562200 (not res!353350)) b!562203))

(assert (= (and b!562203 res!353348) b!562194))

(declare-fun m!540185 () Bool)

(assert (=> b!562194 m!540185))

(declare-fun m!540187 () Bool)

(assert (=> b!562194 m!540187))

(declare-fun m!540189 () Bool)

(assert (=> b!562199 m!540189))

(declare-fun m!540191 () Bool)

(assert (=> b!562195 m!540191))

(declare-fun m!540193 () Bool)

(assert (=> b!562198 m!540193))

(assert (=> b!562198 m!540193))

(declare-fun m!540195 () Bool)

(assert (=> b!562198 m!540195))

(declare-fun m!540197 () Bool)

(assert (=> b!562198 m!540197))

(declare-fun m!540199 () Bool)

(assert (=> b!562198 m!540199))

(assert (=> b!562193 m!540193))

(declare-fun m!540201 () Bool)

(assert (=> b!562193 m!540201))

(declare-fun m!540203 () Bool)

(assert (=> b!562193 m!540203))

(declare-fun m!540205 () Bool)

(assert (=> b!562193 m!540205))

(declare-fun m!540207 () Bool)

(assert (=> b!562193 m!540207))

(assert (=> b!562193 m!540193))

(declare-fun m!540209 () Bool)

(assert (=> b!562193 m!540209))

(assert (=> b!562193 m!540193))

(declare-fun m!540211 () Bool)

(assert (=> b!562193 m!540211))

(assert (=> b!562205 m!540193))

(assert (=> b!562205 m!540193))

(declare-fun m!540213 () Bool)

(assert (=> b!562205 m!540213))

(assert (=> b!562200 m!540193))

(declare-fun m!540215 () Bool)

(assert (=> b!562200 m!540215))

(declare-fun m!540217 () Bool)

(assert (=> start!51436 m!540217))

(declare-fun m!540219 () Bool)

(assert (=> start!51436 m!540219))

(declare-fun m!540221 () Bool)

(assert (=> b!562201 m!540221))

(declare-fun m!540223 () Bool)

(assert (=> b!562204 m!540223))

(declare-fun m!540225 () Bool)

(assert (=> b!562197 m!540225))

(assert (=> b!562203 m!540193))

(assert (=> b!562203 m!540193))

(declare-fun m!540227 () Bool)

(assert (=> b!562203 m!540227))

(check-sat (not b!562195) (not b!562201) (not b!562193) (not b!562203) (not start!51436) (not b!562205) (not b!562198) (not b!562199) (not b!562204) (not b!562194) (not b!562197))
(check-sat)
