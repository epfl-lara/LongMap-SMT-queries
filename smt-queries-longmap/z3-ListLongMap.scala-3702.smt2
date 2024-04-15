; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50816 () Bool)

(assert start!50816)

(declare-fun b!555928 () Bool)

(declare-fun e!320297 () Bool)

(assert (=> b!555928 (= e!320297 (not true))))

(declare-fun e!320296 () Bool)

(assert (=> b!555928 e!320296))

(declare-fun res!348486 () Bool)

(assert (=> b!555928 (=> (not res!348486) (not e!320296))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35050 0))(
  ( (array!35051 (arr!16835 (Array (_ BitVec 32) (_ BitVec 64))) (size!17200 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35050)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35050 (_ BitVec 32)) Bool)

(assert (=> b!555928 (= res!348486 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17322 0))(
  ( (Unit!17323) )
))
(declare-fun lt!252580 () Unit!17322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17322)

(assert (=> b!555928 (= lt!252580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555929 () Bool)

(declare-fun res!348490 () Bool)

(assert (=> b!555929 (=> (not res!348490) (not e!320297))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5281 0))(
  ( (MissingZero!5281 (index!23351 (_ BitVec 32))) (Found!5281 (index!23352 (_ BitVec 32))) (Intermediate!5281 (undefined!6093 Bool) (index!23353 (_ BitVec 32)) (x!52254 (_ BitVec 32))) (Undefined!5281) (MissingVacant!5281 (index!23354 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35050 (_ BitVec 32)) SeekEntryResult!5281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555929 (= res!348490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16835 a!3118) j!142) mask!3119) (select (arr!16835 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16835 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16835 a!3118) i!1132 k0!1914) j!142) (array!35051 (store (arr!16835 a!3118) i!1132 k0!1914) (size!17200 a!3118)) mask!3119)))))

(declare-fun b!555930 () Bool)

(declare-fun res!348482 () Bool)

(declare-fun e!320295 () Bool)

(assert (=> b!555930 (=> (not res!348482) (not e!320295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555930 (= res!348482 (validKeyInArray!0 (select (arr!16835 a!3118) j!142)))))

(declare-fun b!555931 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35050 (_ BitVec 32)) SeekEntryResult!5281)

(assert (=> b!555931 (= e!320296 (= (seekEntryOrOpen!0 (select (arr!16835 a!3118) j!142) a!3118 mask!3119) (Found!5281 j!142)))))

(declare-fun b!555932 () Bool)

(declare-fun res!348487 () Bool)

(assert (=> b!555932 (=> (not res!348487) (not e!320297))))

(assert (=> b!555932 (= res!348487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555933 () Bool)

(declare-fun res!348483 () Bool)

(assert (=> b!555933 (=> (not res!348483) (not e!320297))))

(declare-datatypes ((List!10954 0))(
  ( (Nil!10951) (Cons!10950 (h!11935 (_ BitVec 64)) (t!17173 List!10954)) )
))
(declare-fun arrayNoDuplicates!0 (array!35050 (_ BitVec 32) List!10954) Bool)

(assert (=> b!555933 (= res!348483 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10951))))

(declare-fun res!348491 () Bool)

(assert (=> start!50816 (=> (not res!348491) (not e!320295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50816 (= res!348491 (validMask!0 mask!3119))))

(assert (=> start!50816 e!320295))

(assert (=> start!50816 true))

(declare-fun array_inv!12718 (array!35050) Bool)

(assert (=> start!50816 (array_inv!12718 a!3118)))

(declare-fun b!555934 () Bool)

(assert (=> b!555934 (= e!320295 e!320297)))

(declare-fun res!348485 () Bool)

(assert (=> b!555934 (=> (not res!348485) (not e!320297))))

(declare-fun lt!252579 () SeekEntryResult!5281)

(assert (=> b!555934 (= res!348485 (or (= lt!252579 (MissingZero!5281 i!1132)) (= lt!252579 (MissingVacant!5281 i!1132))))))

(assert (=> b!555934 (= lt!252579 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555935 () Bool)

(declare-fun res!348489 () Bool)

(assert (=> b!555935 (=> (not res!348489) (not e!320295))))

(assert (=> b!555935 (= res!348489 (validKeyInArray!0 k0!1914))))

(declare-fun b!555936 () Bool)

(declare-fun res!348484 () Bool)

(assert (=> b!555936 (=> (not res!348484) (not e!320295))))

(assert (=> b!555936 (= res!348484 (and (= (size!17200 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17200 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17200 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555937 () Bool)

(declare-fun res!348488 () Bool)

(assert (=> b!555937 (=> (not res!348488) (not e!320295))))

(declare-fun arrayContainsKey!0 (array!35050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555937 (= res!348488 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50816 res!348491) b!555936))

(assert (= (and b!555936 res!348484) b!555930))

(assert (= (and b!555930 res!348482) b!555935))

(assert (= (and b!555935 res!348489) b!555937))

(assert (= (and b!555937 res!348488) b!555934))

(assert (= (and b!555934 res!348485) b!555932))

(assert (= (and b!555932 res!348487) b!555933))

(assert (= (and b!555933 res!348483) b!555929))

(assert (= (and b!555929 res!348490) b!555928))

(assert (= (and b!555928 res!348486) b!555931))

(declare-fun m!533369 () Bool)

(assert (=> b!555928 m!533369))

(declare-fun m!533371 () Bool)

(assert (=> b!555928 m!533371))

(declare-fun m!533373 () Bool)

(assert (=> b!555937 m!533373))

(declare-fun m!533375 () Bool)

(assert (=> b!555930 m!533375))

(assert (=> b!555930 m!533375))

(declare-fun m!533377 () Bool)

(assert (=> b!555930 m!533377))

(declare-fun m!533379 () Bool)

(assert (=> b!555935 m!533379))

(declare-fun m!533381 () Bool)

(assert (=> b!555932 m!533381))

(declare-fun m!533383 () Bool)

(assert (=> b!555934 m!533383))

(assert (=> b!555929 m!533375))

(declare-fun m!533385 () Bool)

(assert (=> b!555929 m!533385))

(assert (=> b!555929 m!533375))

(declare-fun m!533387 () Bool)

(assert (=> b!555929 m!533387))

(declare-fun m!533389 () Bool)

(assert (=> b!555929 m!533389))

(assert (=> b!555929 m!533387))

(declare-fun m!533391 () Bool)

(assert (=> b!555929 m!533391))

(assert (=> b!555929 m!533385))

(assert (=> b!555929 m!533375))

(declare-fun m!533393 () Bool)

(assert (=> b!555929 m!533393))

(declare-fun m!533395 () Bool)

(assert (=> b!555929 m!533395))

(assert (=> b!555929 m!533387))

(assert (=> b!555929 m!533389))

(declare-fun m!533397 () Bool)

(assert (=> b!555933 m!533397))

(declare-fun m!533399 () Bool)

(assert (=> start!50816 m!533399))

(declare-fun m!533401 () Bool)

(assert (=> start!50816 m!533401))

(assert (=> b!555931 m!533375))

(assert (=> b!555931 m!533375))

(declare-fun m!533403 () Bool)

(assert (=> b!555931 m!533403))

(check-sat (not b!555931) (not b!555933) (not b!555932) (not b!555930) (not b!555937) (not start!50816) (not b!555929) (not b!555934) (not b!555928) (not b!555935))
(check-sat)
