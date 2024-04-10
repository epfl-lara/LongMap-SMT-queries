; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50254 () Bool)

(assert start!50254)

(declare-fun b!550151 () Bool)

(declare-fun e!317595 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!550151 (= e!317595 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!317597 () Bool)

(assert (=> b!550151 e!317597))

(declare-fun res!343299 () Bool)

(assert (=> b!550151 (=> (not res!343299) (not e!317597))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34707 0))(
  ( (array!34708 (arr!16669 (Array (_ BitVec 32) (_ BitVec 64))) (size!17033 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34707)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34707 (_ BitVec 32)) Bool)

(assert (=> b!550151 (= res!343299 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17010 0))(
  ( (Unit!17011) )
))
(declare-fun lt!250422 () Unit!17010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17010)

(assert (=> b!550151 (= lt!250422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550152 () Bool)

(declare-fun res!343303 () Bool)

(declare-fun e!317598 () Bool)

(assert (=> b!550152 (=> (not res!343303) (not e!317598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550152 (= res!343303 (validKeyInArray!0 (select (arr!16669 a!3118) j!142)))))

(declare-fun b!550153 () Bool)

(declare-fun res!343295 () Bool)

(assert (=> b!550153 (=> (not res!343295) (not e!317595))))

(assert (=> b!550153 (= res!343295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550154 () Bool)

(assert (=> b!550154 (= e!317598 e!317595)))

(declare-fun res!343298 () Bool)

(assert (=> b!550154 (=> (not res!343298) (not e!317595))))

(declare-datatypes ((SeekEntryResult!5118 0))(
  ( (MissingZero!5118 (index!22699 (_ BitVec 32))) (Found!5118 (index!22700 (_ BitVec 32))) (Intermediate!5118 (undefined!5930 Bool) (index!22701 (_ BitVec 32)) (x!51624 (_ BitVec 32))) (Undefined!5118) (MissingVacant!5118 (index!22702 (_ BitVec 32))) )
))
(declare-fun lt!250423 () SeekEntryResult!5118)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550154 (= res!343298 (or (= lt!250423 (MissingZero!5118 i!1132)) (= lt!250423 (MissingVacant!5118 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34707 (_ BitVec 32)) SeekEntryResult!5118)

(assert (=> b!550154 (= lt!250423 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!343304 () Bool)

(assert (=> start!50254 (=> (not res!343304) (not e!317598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50254 (= res!343304 (validMask!0 mask!3119))))

(assert (=> start!50254 e!317598))

(assert (=> start!50254 true))

(declare-fun array_inv!12465 (array!34707) Bool)

(assert (=> start!50254 (array_inv!12465 a!3118)))

(declare-fun b!550155 () Bool)

(assert (=> b!550155 (= e!317597 (= (seekEntryOrOpen!0 (select (arr!16669 a!3118) j!142) a!3118 mask!3119) (Found!5118 j!142)))))

(declare-fun b!550156 () Bool)

(declare-fun res!343301 () Bool)

(assert (=> b!550156 (=> (not res!343301) (not e!317598))))

(declare-fun arrayContainsKey!0 (array!34707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550156 (= res!343301 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550157 () Bool)

(declare-fun res!343300 () Bool)

(assert (=> b!550157 (=> (not res!343300) (not e!317595))))

(declare-datatypes ((List!10749 0))(
  ( (Nil!10746) (Cons!10745 (h!11718 (_ BitVec 64)) (t!16977 List!10749)) )
))
(declare-fun arrayNoDuplicates!0 (array!34707 (_ BitVec 32) List!10749) Bool)

(assert (=> b!550157 (= res!343300 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10746))))

(declare-fun b!550158 () Bool)

(declare-fun res!343302 () Bool)

(assert (=> b!550158 (=> (not res!343302) (not e!317595))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34707 (_ BitVec 32)) SeekEntryResult!5118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550158 (= res!343302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16669 a!3118) j!142) mask!3119) (select (arr!16669 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16669 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16669 a!3118) i!1132 k0!1914) j!142) (array!34708 (store (arr!16669 a!3118) i!1132 k0!1914) (size!17033 a!3118)) mask!3119)))))

(declare-fun b!550159 () Bool)

(declare-fun res!343297 () Bool)

(assert (=> b!550159 (=> (not res!343297) (not e!317598))))

(assert (=> b!550159 (= res!343297 (and (= (size!17033 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17033 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17033 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550160 () Bool)

(declare-fun res!343296 () Bool)

(assert (=> b!550160 (=> (not res!343296) (not e!317598))))

(assert (=> b!550160 (= res!343296 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50254 res!343304) b!550159))

(assert (= (and b!550159 res!343297) b!550152))

(assert (= (and b!550152 res!343303) b!550160))

(assert (= (and b!550160 res!343296) b!550156))

(assert (= (and b!550156 res!343301) b!550154))

(assert (= (and b!550154 res!343298) b!550153))

(assert (= (and b!550153 res!343295) b!550157))

(assert (= (and b!550157 res!343300) b!550158))

(assert (= (and b!550158 res!343302) b!550151))

(assert (= (and b!550151 res!343299) b!550155))

(declare-fun m!527175 () Bool)

(assert (=> b!550154 m!527175))

(declare-fun m!527177 () Bool)

(assert (=> b!550157 m!527177))

(declare-fun m!527179 () Bool)

(assert (=> b!550158 m!527179))

(declare-fun m!527181 () Bool)

(assert (=> b!550158 m!527181))

(assert (=> b!550158 m!527179))

(declare-fun m!527183 () Bool)

(assert (=> b!550158 m!527183))

(declare-fun m!527185 () Bool)

(assert (=> b!550158 m!527185))

(assert (=> b!550158 m!527183))

(declare-fun m!527187 () Bool)

(assert (=> b!550158 m!527187))

(assert (=> b!550158 m!527181))

(assert (=> b!550158 m!527179))

(declare-fun m!527189 () Bool)

(assert (=> b!550158 m!527189))

(declare-fun m!527191 () Bool)

(assert (=> b!550158 m!527191))

(assert (=> b!550158 m!527183))

(assert (=> b!550158 m!527185))

(declare-fun m!527193 () Bool)

(assert (=> start!50254 m!527193))

(declare-fun m!527195 () Bool)

(assert (=> start!50254 m!527195))

(assert (=> b!550152 m!527179))

(assert (=> b!550152 m!527179))

(declare-fun m!527197 () Bool)

(assert (=> b!550152 m!527197))

(declare-fun m!527199 () Bool)

(assert (=> b!550151 m!527199))

(declare-fun m!527201 () Bool)

(assert (=> b!550151 m!527201))

(declare-fun m!527203 () Bool)

(assert (=> b!550160 m!527203))

(assert (=> b!550155 m!527179))

(assert (=> b!550155 m!527179))

(declare-fun m!527205 () Bool)

(assert (=> b!550155 m!527205))

(declare-fun m!527207 () Bool)

(assert (=> b!550153 m!527207))

(declare-fun m!527209 () Bool)

(assert (=> b!550156 m!527209))

(check-sat (not b!550153) (not b!550152) (not b!550155) (not b!550158) (not b!550156) (not b!550160) (not b!550151) (not start!50254) (not b!550154) (not b!550157))
(check-sat)
