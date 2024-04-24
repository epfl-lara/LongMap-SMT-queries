; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50286 () Bool)

(assert start!50286)

(declare-fun b!550157 () Bool)

(declare-fun res!343203 () Bool)

(declare-fun e!317656 () Bool)

(assert (=> b!550157 (=> (not res!343203) (not e!317656))))

(declare-datatypes ((array!34686 0))(
  ( (array!34687 (arr!16657 (Array (_ BitVec 32) (_ BitVec 64))) (size!17021 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34686)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550157 (= res!343203 (validKeyInArray!0 (select (arr!16657 a!3118) j!142)))))

(declare-fun b!550158 () Bool)

(declare-fun res!343196 () Bool)

(declare-fun e!317658 () Bool)

(assert (=> b!550158 (=> (not res!343196) (not e!317658))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34686 (_ BitVec 32)) Bool)

(assert (=> b!550158 (= res!343196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550159 () Bool)

(assert (=> b!550159 (= e!317656 e!317658)))

(declare-fun res!343197 () Bool)

(assert (=> b!550159 (=> (not res!343197) (not e!317658))))

(declare-datatypes ((SeekEntryResult!5062 0))(
  ( (MissingZero!5062 (index!22475 (_ BitVec 32))) (Found!5062 (index!22476 (_ BitVec 32))) (Intermediate!5062 (undefined!5874 Bool) (index!22477 (_ BitVec 32)) (x!51555 (_ BitVec 32))) (Undefined!5062) (MissingVacant!5062 (index!22478 (_ BitVec 32))) )
))
(declare-fun lt!250492 () SeekEntryResult!5062)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550159 (= res!343197 (or (= lt!250492 (MissingZero!5062 i!1132)) (= lt!250492 (MissingVacant!5062 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34686 (_ BitVec 32)) SeekEntryResult!5062)

(assert (=> b!550159 (= lt!250492 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550160 () Bool)

(declare-fun res!343198 () Bool)

(assert (=> b!550160 (=> (not res!343198) (not e!317658))))

(declare-datatypes ((List!10644 0))(
  ( (Nil!10641) (Cons!10640 (h!11616 (_ BitVec 64)) (t!16864 List!10644)) )
))
(declare-fun arrayNoDuplicates!0 (array!34686 (_ BitVec 32) List!10644) Bool)

(assert (=> b!550160 (= res!343198 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10641))))

(declare-fun res!343200 () Bool)

(assert (=> start!50286 (=> (not res!343200) (not e!317656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50286 (= res!343200 (validMask!0 mask!3119))))

(assert (=> start!50286 e!317656))

(assert (=> start!50286 true))

(declare-fun array_inv!12516 (array!34686) Bool)

(assert (=> start!50286 (array_inv!12516 a!3118)))

(declare-fun b!550161 () Bool)

(assert (=> b!550161 (= e!317658 (not true))))

(assert (=> b!550161 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16969 0))(
  ( (Unit!16970) )
))
(declare-fun lt!250491 () Unit!16969)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16969)

(assert (=> b!550161 (= lt!250491 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550162 () Bool)

(declare-fun res!343199 () Bool)

(assert (=> b!550162 (=> (not res!343199) (not e!317656))))

(assert (=> b!550162 (= res!343199 (validKeyInArray!0 k0!1914))))

(declare-fun b!550163 () Bool)

(declare-fun res!343204 () Bool)

(assert (=> b!550163 (=> (not res!343204) (not e!317656))))

(declare-fun arrayContainsKey!0 (array!34686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550163 (= res!343204 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550164 () Bool)

(declare-fun res!343202 () Bool)

(assert (=> b!550164 (=> (not res!343202) (not e!317658))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34686 (_ BitVec 32)) SeekEntryResult!5062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550164 (= res!343202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16657 a!3118) j!142) mask!3119) (select (arr!16657 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16657 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16657 a!3118) i!1132 k0!1914) j!142) (array!34687 (store (arr!16657 a!3118) i!1132 k0!1914) (size!17021 a!3118)) mask!3119)))))

(declare-fun b!550165 () Bool)

(declare-fun res!343201 () Bool)

(assert (=> b!550165 (=> (not res!343201) (not e!317656))))

(assert (=> b!550165 (= res!343201 (and (= (size!17021 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17021 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17021 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50286 res!343200) b!550165))

(assert (= (and b!550165 res!343201) b!550157))

(assert (= (and b!550157 res!343203) b!550162))

(assert (= (and b!550162 res!343199) b!550163))

(assert (= (and b!550163 res!343204) b!550159))

(assert (= (and b!550159 res!343197) b!550158))

(assert (= (and b!550158 res!343196) b!550160))

(assert (= (and b!550160 res!343198) b!550164))

(assert (= (and b!550164 res!343202) b!550161))

(declare-fun m!527273 () Bool)

(assert (=> start!50286 m!527273))

(declare-fun m!527275 () Bool)

(assert (=> start!50286 m!527275))

(declare-fun m!527277 () Bool)

(assert (=> b!550160 m!527277))

(declare-fun m!527279 () Bool)

(assert (=> b!550158 m!527279))

(declare-fun m!527281 () Bool)

(assert (=> b!550161 m!527281))

(declare-fun m!527283 () Bool)

(assert (=> b!550161 m!527283))

(declare-fun m!527285 () Bool)

(assert (=> b!550164 m!527285))

(declare-fun m!527287 () Bool)

(assert (=> b!550164 m!527287))

(assert (=> b!550164 m!527285))

(declare-fun m!527289 () Bool)

(assert (=> b!550164 m!527289))

(declare-fun m!527291 () Bool)

(assert (=> b!550164 m!527291))

(assert (=> b!550164 m!527289))

(declare-fun m!527293 () Bool)

(assert (=> b!550164 m!527293))

(assert (=> b!550164 m!527287))

(assert (=> b!550164 m!527285))

(declare-fun m!527295 () Bool)

(assert (=> b!550164 m!527295))

(declare-fun m!527297 () Bool)

(assert (=> b!550164 m!527297))

(assert (=> b!550164 m!527289))

(assert (=> b!550164 m!527291))

(declare-fun m!527299 () Bool)

(assert (=> b!550162 m!527299))

(assert (=> b!550157 m!527285))

(assert (=> b!550157 m!527285))

(declare-fun m!527301 () Bool)

(assert (=> b!550157 m!527301))

(declare-fun m!527303 () Bool)

(assert (=> b!550163 m!527303))

(declare-fun m!527305 () Bool)

(assert (=> b!550159 m!527305))

(check-sat (not b!550163) (not b!550164) (not b!550159) (not b!550160) (not b!550158) (not b!550161) (not start!50286) (not b!550162) (not b!550157))
(check-sat)
