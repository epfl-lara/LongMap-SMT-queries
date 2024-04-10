; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50730 () Bool)

(assert start!50730)

(declare-fun b!554847 () Bool)

(declare-fun res!347264 () Bool)

(declare-fun e!319874 () Bool)

(assert (=> b!554847 (=> (not res!347264) (not e!319874))))

(declare-datatypes ((array!34955 0))(
  ( (array!34956 (arr!16787 (Array (_ BitVec 32) (_ BitVec 64))) (size!17151 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34955)

(declare-datatypes ((List!10867 0))(
  ( (Nil!10864) (Cons!10863 (h!11848 (_ BitVec 64)) (t!17095 List!10867)) )
))
(declare-fun arrayNoDuplicates!0 (array!34955 (_ BitVec 32) List!10867) Bool)

(assert (=> b!554847 (= res!347264 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10864))))

(declare-fun b!554848 () Bool)

(declare-fun res!347266 () Bool)

(declare-fun e!319873 () Bool)

(assert (=> b!554848 (=> (not res!347266) (not e!319873))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554848 (= res!347266 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554849 () Bool)

(declare-fun res!347261 () Bool)

(assert (=> b!554849 (=> (not res!347261) (not e!319874))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34955 (_ BitVec 32)) Bool)

(assert (=> b!554849 (= res!347261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554850 () Bool)

(assert (=> b!554850 (= e!319873 e!319874)))

(declare-fun res!347259 () Bool)

(assert (=> b!554850 (=> (not res!347259) (not e!319874))))

(declare-datatypes ((SeekEntryResult!5236 0))(
  ( (MissingZero!5236 (index!23171 (_ BitVec 32))) (Found!5236 (index!23172 (_ BitVec 32))) (Intermediate!5236 (undefined!6048 Bool) (index!23173 (_ BitVec 32)) (x!52078 (_ BitVec 32))) (Undefined!5236) (MissingVacant!5236 (index!23174 (_ BitVec 32))) )
))
(declare-fun lt!252023 () SeekEntryResult!5236)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554850 (= res!347259 (or (= lt!252023 (MissingZero!5236 i!1132)) (= lt!252023 (MissingVacant!5236 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34955 (_ BitVec 32)) SeekEntryResult!5236)

(assert (=> b!554850 (= lt!252023 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554851 () Bool)

(declare-fun res!347267 () Bool)

(assert (=> b!554851 (=> (not res!347267) (not e!319873))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554851 (= res!347267 (and (= (size!17151 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17151 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17151 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347265 () Bool)

(assert (=> start!50730 (=> (not res!347265) (not e!319873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50730 (= res!347265 (validMask!0 mask!3119))))

(assert (=> start!50730 e!319873))

(assert (=> start!50730 true))

(declare-fun array_inv!12583 (array!34955) Bool)

(assert (=> start!50730 (array_inv!12583 a!3118)))

(declare-fun b!554852 () Bool)

(declare-fun e!319875 () Bool)

(assert (=> b!554852 (= e!319874 e!319875)))

(declare-fun res!347263 () Bool)

(assert (=> b!554852 (=> (not res!347263) (not e!319875))))

(declare-fun lt!252022 () (_ BitVec 32))

(declare-fun lt!252020 () SeekEntryResult!5236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34955 (_ BitVec 32)) SeekEntryResult!5236)

(assert (=> b!554852 (= res!347263 (= lt!252020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252022 (select (store (arr!16787 a!3118) i!1132 k!1914) j!142) (array!34956 (store (arr!16787 a!3118) i!1132 k!1914) (size!17151 a!3118)) mask!3119)))))

(declare-fun lt!252024 () (_ BitVec 32))

(assert (=> b!554852 (= lt!252020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252024 (select (arr!16787 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554852 (= lt!252022 (toIndex!0 (select (store (arr!16787 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554852 (= lt!252024 (toIndex!0 (select (arr!16787 a!3118) j!142) mask!3119))))

(declare-fun b!554853 () Bool)

(assert (=> b!554853 (= e!319875 (not (or (undefined!6048 lt!252020) (not (is-Intermediate!5236 lt!252020)) (= (select (arr!16787 a!3118) (index!23173 lt!252020)) (select (arr!16787 a!3118) j!142)) (not (= (select (arr!16787 a!3118) (index!23173 lt!252020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17151 a!3118)))))))

(declare-fun lt!252021 () SeekEntryResult!5236)

(assert (=> b!554853 (and (= lt!252021 (Found!5236 j!142)) (or (undefined!6048 lt!252020) (not (is-Intermediate!5236 lt!252020)) (= (select (arr!16787 a!3118) (index!23173 lt!252020)) (select (arr!16787 a!3118) j!142)) (not (= (select (arr!16787 a!3118) (index!23173 lt!252020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252021 (MissingZero!5236 (index!23173 lt!252020)))))))

(assert (=> b!554853 (= lt!252021 (seekEntryOrOpen!0 (select (arr!16787 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554853 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17246 0))(
  ( (Unit!17247) )
))
(declare-fun lt!252025 () Unit!17246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17246)

(assert (=> b!554853 (= lt!252025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554854 () Bool)

(declare-fun res!347262 () Bool)

(assert (=> b!554854 (=> (not res!347262) (not e!319873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554854 (= res!347262 (validKeyInArray!0 k!1914))))

(declare-fun b!554855 () Bool)

(declare-fun res!347260 () Bool)

(assert (=> b!554855 (=> (not res!347260) (not e!319873))))

(assert (=> b!554855 (= res!347260 (validKeyInArray!0 (select (arr!16787 a!3118) j!142)))))

(assert (= (and start!50730 res!347265) b!554851))

(assert (= (and b!554851 res!347267) b!554855))

(assert (= (and b!554855 res!347260) b!554854))

(assert (= (and b!554854 res!347262) b!554848))

(assert (= (and b!554848 res!347266) b!554850))

(assert (= (and b!554850 res!347259) b!554849))

(assert (= (and b!554849 res!347261) b!554847))

(assert (= (and b!554847 res!347264) b!554852))

(assert (= (and b!554852 res!347263) b!554853))

(declare-fun m!532291 () Bool)

(assert (=> b!554848 m!532291))

(declare-fun m!532293 () Bool)

(assert (=> b!554855 m!532293))

(assert (=> b!554855 m!532293))

(declare-fun m!532295 () Bool)

(assert (=> b!554855 m!532295))

(declare-fun m!532297 () Bool)

(assert (=> b!554847 m!532297))

(declare-fun m!532299 () Bool)

(assert (=> b!554849 m!532299))

(assert (=> b!554853 m!532293))

(declare-fun m!532301 () Bool)

(assert (=> b!554853 m!532301))

(declare-fun m!532303 () Bool)

(assert (=> b!554853 m!532303))

(assert (=> b!554853 m!532293))

(declare-fun m!532305 () Bool)

(assert (=> b!554853 m!532305))

(declare-fun m!532307 () Bool)

(assert (=> b!554853 m!532307))

(declare-fun m!532309 () Bool)

(assert (=> start!50730 m!532309))

(declare-fun m!532311 () Bool)

(assert (=> start!50730 m!532311))

(declare-fun m!532313 () Bool)

(assert (=> b!554850 m!532313))

(assert (=> b!554852 m!532293))

(declare-fun m!532315 () Bool)

(assert (=> b!554852 m!532315))

(assert (=> b!554852 m!532293))

(declare-fun m!532317 () Bool)

(assert (=> b!554852 m!532317))

(assert (=> b!554852 m!532293))

(declare-fun m!532319 () Bool)

(assert (=> b!554852 m!532319))

(declare-fun m!532321 () Bool)

(assert (=> b!554852 m!532321))

(declare-fun m!532323 () Bool)

(assert (=> b!554852 m!532323))

(assert (=> b!554852 m!532321))

(assert (=> b!554852 m!532321))

(declare-fun m!532325 () Bool)

(assert (=> b!554852 m!532325))

(declare-fun m!532327 () Bool)

(assert (=> b!554854 m!532327))

(push 1)

