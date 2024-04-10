; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50734 () Bool)

(assert start!50734)

(declare-fun b!554901 () Bool)

(declare-fun res!347313 () Bool)

(declare-fun e!319899 () Bool)

(assert (=> b!554901 (=> (not res!347313) (not e!319899))))

(declare-datatypes ((array!34959 0))(
  ( (array!34960 (arr!16789 (Array (_ BitVec 32) (_ BitVec 64))) (size!17153 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34959)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554901 (= res!347313 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554902 () Bool)

(declare-fun e!319896 () Bool)

(declare-fun e!319897 () Bool)

(assert (=> b!554902 (= e!319896 e!319897)))

(declare-fun res!347321 () Bool)

(assert (=> b!554902 (=> (not res!347321) (not e!319897))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5238 0))(
  ( (MissingZero!5238 (index!23179 (_ BitVec 32))) (Found!5238 (index!23180 (_ BitVec 32))) (Intermediate!5238 (undefined!6050 Bool) (index!23181 (_ BitVec 32)) (x!52088 (_ BitVec 32))) (Undefined!5238) (MissingVacant!5238 (index!23182 (_ BitVec 32))) )
))
(declare-fun lt!252057 () SeekEntryResult!5238)

(declare-fun lt!252058 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34959 (_ BitVec 32)) SeekEntryResult!5238)

(assert (=> b!554902 (= res!347321 (= lt!252057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252058 (select (store (arr!16789 a!3118) i!1132 k0!1914) j!142) (array!34960 (store (arr!16789 a!3118) i!1132 k0!1914) (size!17153 a!3118)) mask!3119)))))

(declare-fun lt!252061 () (_ BitVec 32))

(assert (=> b!554902 (= lt!252057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252061 (select (arr!16789 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554902 (= lt!252058 (toIndex!0 (select (store (arr!16789 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554902 (= lt!252061 (toIndex!0 (select (arr!16789 a!3118) j!142) mask!3119))))

(declare-fun res!347319 () Bool)

(assert (=> start!50734 (=> (not res!347319) (not e!319899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50734 (= res!347319 (validMask!0 mask!3119))))

(assert (=> start!50734 e!319899))

(assert (=> start!50734 true))

(declare-fun array_inv!12585 (array!34959) Bool)

(assert (=> start!50734 (array_inv!12585 a!3118)))

(declare-fun b!554903 () Bool)

(declare-fun res!347320 () Bool)

(assert (=> b!554903 (=> (not res!347320) (not e!319899))))

(assert (=> b!554903 (= res!347320 (and (= (size!17153 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17153 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17153 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554904 () Bool)

(assert (=> b!554904 (= e!319897 (not true))))

(declare-fun lt!252056 () SeekEntryResult!5238)

(get-info :version)

(assert (=> b!554904 (and (= lt!252056 (Found!5238 j!142)) (or (undefined!6050 lt!252057) (not ((_ is Intermediate!5238) lt!252057)) (= (select (arr!16789 a!3118) (index!23181 lt!252057)) (select (arr!16789 a!3118) j!142)) (not (= (select (arr!16789 a!3118) (index!23181 lt!252057)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252056 (MissingZero!5238 (index!23181 lt!252057)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34959 (_ BitVec 32)) SeekEntryResult!5238)

(assert (=> b!554904 (= lt!252056 (seekEntryOrOpen!0 (select (arr!16789 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34959 (_ BitVec 32)) Bool)

(assert (=> b!554904 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17250 0))(
  ( (Unit!17251) )
))
(declare-fun lt!252059 () Unit!17250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17250)

(assert (=> b!554904 (= lt!252059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554905 () Bool)

(declare-fun res!347317 () Bool)

(assert (=> b!554905 (=> (not res!347317) (not e!319899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554905 (= res!347317 (validKeyInArray!0 (select (arr!16789 a!3118) j!142)))))

(declare-fun b!554906 () Bool)

(declare-fun res!347316 () Bool)

(assert (=> b!554906 (=> (not res!347316) (not e!319896))))

(declare-datatypes ((List!10869 0))(
  ( (Nil!10866) (Cons!10865 (h!11850 (_ BitVec 64)) (t!17097 List!10869)) )
))
(declare-fun arrayNoDuplicates!0 (array!34959 (_ BitVec 32) List!10869) Bool)

(assert (=> b!554906 (= res!347316 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10866))))

(declare-fun b!554907 () Bool)

(declare-fun res!347315 () Bool)

(assert (=> b!554907 (=> (not res!347315) (not e!319896))))

(assert (=> b!554907 (= res!347315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554908 () Bool)

(assert (=> b!554908 (= e!319899 e!319896)))

(declare-fun res!347318 () Bool)

(assert (=> b!554908 (=> (not res!347318) (not e!319896))))

(declare-fun lt!252060 () SeekEntryResult!5238)

(assert (=> b!554908 (= res!347318 (or (= lt!252060 (MissingZero!5238 i!1132)) (= lt!252060 (MissingVacant!5238 i!1132))))))

(assert (=> b!554908 (= lt!252060 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554909 () Bool)

(declare-fun res!347314 () Bool)

(assert (=> b!554909 (=> (not res!347314) (not e!319899))))

(assert (=> b!554909 (= res!347314 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50734 res!347319) b!554903))

(assert (= (and b!554903 res!347320) b!554905))

(assert (= (and b!554905 res!347317) b!554909))

(assert (= (and b!554909 res!347314) b!554901))

(assert (= (and b!554901 res!347313) b!554908))

(assert (= (and b!554908 res!347318) b!554907))

(assert (= (and b!554907 res!347315) b!554906))

(assert (= (and b!554906 res!347316) b!554902))

(assert (= (and b!554902 res!347321) b!554904))

(declare-fun m!532367 () Bool)

(assert (=> b!554907 m!532367))

(declare-fun m!532369 () Bool)

(assert (=> b!554908 m!532369))

(declare-fun m!532371 () Bool)

(assert (=> b!554906 m!532371))

(declare-fun m!532373 () Bool)

(assert (=> b!554902 m!532373))

(declare-fun m!532375 () Bool)

(assert (=> b!554902 m!532375))

(assert (=> b!554902 m!532373))

(declare-fun m!532377 () Bool)

(assert (=> b!554902 m!532377))

(assert (=> b!554902 m!532377))

(declare-fun m!532379 () Bool)

(assert (=> b!554902 m!532379))

(declare-fun m!532381 () Bool)

(assert (=> b!554902 m!532381))

(assert (=> b!554902 m!532373))

(declare-fun m!532383 () Bool)

(assert (=> b!554902 m!532383))

(assert (=> b!554902 m!532377))

(declare-fun m!532385 () Bool)

(assert (=> b!554902 m!532385))

(assert (=> b!554905 m!532373))

(assert (=> b!554905 m!532373))

(declare-fun m!532387 () Bool)

(assert (=> b!554905 m!532387))

(assert (=> b!554904 m!532373))

(declare-fun m!532389 () Bool)

(assert (=> b!554904 m!532389))

(declare-fun m!532391 () Bool)

(assert (=> b!554904 m!532391))

(declare-fun m!532393 () Bool)

(assert (=> b!554904 m!532393))

(assert (=> b!554904 m!532373))

(declare-fun m!532395 () Bool)

(assert (=> b!554904 m!532395))

(declare-fun m!532397 () Bool)

(assert (=> start!50734 m!532397))

(declare-fun m!532399 () Bool)

(assert (=> start!50734 m!532399))

(declare-fun m!532401 () Bool)

(assert (=> b!554901 m!532401))

(declare-fun m!532403 () Bool)

(assert (=> b!554909 m!532403))

(check-sat (not b!554909) (not b!554904) (not b!554908) (not b!554907) (not b!554905) (not b!554902) (not start!50734) (not b!554901) (not b!554906))
(check-sat)
