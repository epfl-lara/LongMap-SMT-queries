; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50706 () Bool)

(assert start!50706)

(declare-fun b!554023 () Bool)

(declare-fun res!346333 () Bool)

(declare-fun e!319546 () Bool)

(assert (=> b!554023 (=> (not res!346333) (not e!319546))))

(declare-datatypes ((array!34878 0))(
  ( (array!34879 (arr!16747 (Array (_ BitVec 32) (_ BitVec 64))) (size!17111 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34878)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34878 (_ BitVec 32)) Bool)

(assert (=> b!554023 (= res!346333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554024 () Bool)

(declare-fun res!346334 () Bool)

(declare-fun e!319545 () Bool)

(assert (=> b!554024 (=> (not res!346334) (not e!319545))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554024 (= res!346334 (validKeyInArray!0 k0!1914))))

(declare-fun b!554025 () Bool)

(declare-fun res!346338 () Bool)

(assert (=> b!554025 (=> (not res!346338) (not e!319545))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554025 (= res!346338 (and (= (size!17111 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17111 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17111 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554026 () Bool)

(declare-fun res!346335 () Bool)

(assert (=> b!554026 (=> (not res!346335) (not e!319546))))

(declare-datatypes ((List!10734 0))(
  ( (Nil!10731) (Cons!10730 (h!11718 (_ BitVec 64)) (t!16954 List!10734)) )
))
(declare-fun arrayNoDuplicates!0 (array!34878 (_ BitVec 32) List!10734) Bool)

(assert (=> b!554026 (= res!346335 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10731))))

(declare-fun b!554027 () Bool)

(declare-fun res!346336 () Bool)

(assert (=> b!554027 (=> (not res!346336) (not e!319546))))

(declare-datatypes ((SeekEntryResult!5152 0))(
  ( (MissingZero!5152 (index!22835 (_ BitVec 32))) (Found!5152 (index!22836 (_ BitVec 32))) (Intermediate!5152 (undefined!5964 Bool) (index!22837 (_ BitVec 32)) (x!51909 (_ BitVec 32))) (Undefined!5152) (MissingVacant!5152 (index!22838 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34878 (_ BitVec 32)) SeekEntryResult!5152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554027 (= res!346336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16747 a!3118) j!142) mask!3119) (select (arr!16747 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16747 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16747 a!3118) i!1132 k0!1914) j!142) (array!34879 (store (arr!16747 a!3118) i!1132 k0!1914) (size!17111 a!3118)) mask!3119)))))

(declare-fun b!554028 () Bool)

(assert (=> b!554028 (= e!319546 (not true))))

(declare-fun e!319547 () Bool)

(assert (=> b!554028 e!319547))

(declare-fun res!346337 () Bool)

(assert (=> b!554028 (=> (not res!346337) (not e!319547))))

(assert (=> b!554028 (= res!346337 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17149 0))(
  ( (Unit!17150) )
))
(declare-fun lt!251700 () Unit!17149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17149)

(assert (=> b!554028 (= lt!251700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554030 () Bool)

(declare-fun res!346330 () Bool)

(assert (=> b!554030 (=> (not res!346330) (not e!319545))))

(assert (=> b!554030 (= res!346330 (validKeyInArray!0 (select (arr!16747 a!3118) j!142)))))

(declare-fun b!554031 () Bool)

(declare-fun res!346332 () Bool)

(assert (=> b!554031 (=> (not res!346332) (not e!319545))))

(declare-fun arrayContainsKey!0 (array!34878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554031 (= res!346332 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554032 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34878 (_ BitVec 32)) SeekEntryResult!5152)

(assert (=> b!554032 (= e!319547 (= (seekEntryOrOpen!0 (select (arr!16747 a!3118) j!142) a!3118 mask!3119) (Found!5152 j!142)))))

(declare-fun res!346339 () Bool)

(assert (=> start!50706 (=> (not res!346339) (not e!319545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50706 (= res!346339 (validMask!0 mask!3119))))

(assert (=> start!50706 e!319545))

(assert (=> start!50706 true))

(declare-fun array_inv!12606 (array!34878) Bool)

(assert (=> start!50706 (array_inv!12606 a!3118)))

(declare-fun b!554029 () Bool)

(assert (=> b!554029 (= e!319545 e!319546)))

(declare-fun res!346331 () Bool)

(assert (=> b!554029 (=> (not res!346331) (not e!319546))))

(declare-fun lt!251701 () SeekEntryResult!5152)

(assert (=> b!554029 (= res!346331 (or (= lt!251701 (MissingZero!5152 i!1132)) (= lt!251701 (MissingVacant!5152 i!1132))))))

(assert (=> b!554029 (= lt!251701 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50706 res!346339) b!554025))

(assert (= (and b!554025 res!346338) b!554030))

(assert (= (and b!554030 res!346330) b!554024))

(assert (= (and b!554024 res!346334) b!554031))

(assert (= (and b!554031 res!346332) b!554029))

(assert (= (and b!554029 res!346331) b!554023))

(assert (= (and b!554023 res!346333) b!554026))

(assert (= (and b!554026 res!346335) b!554027))

(assert (= (and b!554027 res!346336) b!554028))

(assert (= (and b!554028 res!346337) b!554032))

(declare-fun m!531323 () Bool)

(assert (=> b!554028 m!531323))

(declare-fun m!531325 () Bool)

(assert (=> b!554028 m!531325))

(declare-fun m!531327 () Bool)

(assert (=> b!554031 m!531327))

(declare-fun m!531329 () Bool)

(assert (=> start!50706 m!531329))

(declare-fun m!531331 () Bool)

(assert (=> start!50706 m!531331))

(declare-fun m!531333 () Bool)

(assert (=> b!554032 m!531333))

(assert (=> b!554032 m!531333))

(declare-fun m!531335 () Bool)

(assert (=> b!554032 m!531335))

(assert (=> b!554027 m!531333))

(declare-fun m!531337 () Bool)

(assert (=> b!554027 m!531337))

(assert (=> b!554027 m!531333))

(declare-fun m!531339 () Bool)

(assert (=> b!554027 m!531339))

(declare-fun m!531341 () Bool)

(assert (=> b!554027 m!531341))

(assert (=> b!554027 m!531339))

(declare-fun m!531343 () Bool)

(assert (=> b!554027 m!531343))

(assert (=> b!554027 m!531337))

(assert (=> b!554027 m!531333))

(declare-fun m!531345 () Bool)

(assert (=> b!554027 m!531345))

(declare-fun m!531347 () Bool)

(assert (=> b!554027 m!531347))

(assert (=> b!554027 m!531339))

(assert (=> b!554027 m!531341))

(declare-fun m!531349 () Bool)

(assert (=> b!554026 m!531349))

(declare-fun m!531351 () Bool)

(assert (=> b!554029 m!531351))

(assert (=> b!554030 m!531333))

(assert (=> b!554030 m!531333))

(declare-fun m!531353 () Bool)

(assert (=> b!554030 m!531353))

(declare-fun m!531355 () Bool)

(assert (=> b!554024 m!531355))

(declare-fun m!531357 () Bool)

(assert (=> b!554023 m!531357))

(check-sat (not b!554028) (not b!554029) (not b!554026) (not b!554027) (not b!554031) (not b!554023) (not b!554032) (not start!50706) (not b!554030) (not b!554024))
(check-sat)
