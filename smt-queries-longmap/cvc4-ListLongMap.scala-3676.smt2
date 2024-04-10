; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50676 () Bool)

(assert start!50676)

(declare-fun b!554063 () Bool)

(declare-fun res!346482 () Bool)

(declare-fun e!319522 () Bool)

(assert (=> b!554063 (=> (not res!346482) (not e!319522))))

(declare-datatypes ((array!34901 0))(
  ( (array!34902 (arr!16760 (Array (_ BitVec 32) (_ BitVec 64))) (size!17124 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34901)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34901 (_ BitVec 32)) Bool)

(assert (=> b!554063 (= res!346482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554064 () Bool)

(declare-fun res!346478 () Bool)

(declare-fun e!319524 () Bool)

(assert (=> b!554064 (=> (not res!346478) (not e!319524))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554064 (= res!346478 (validKeyInArray!0 k!1914))))

(declare-fun b!554065 () Bool)

(assert (=> b!554065 (= e!319522 (not true))))

(declare-fun e!319521 () Bool)

(assert (=> b!554065 e!319521))

(declare-fun res!346476 () Bool)

(assert (=> b!554065 (=> (not res!346476) (not e!319521))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554065 (= res!346476 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17192 0))(
  ( (Unit!17193) )
))
(declare-fun lt!251665 () Unit!17192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17192)

(assert (=> b!554065 (= lt!251665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554066 () Bool)

(declare-datatypes ((SeekEntryResult!5209 0))(
  ( (MissingZero!5209 (index!23063 (_ BitVec 32))) (Found!5209 (index!23064 (_ BitVec 32))) (Intermediate!5209 (undefined!6021 Bool) (index!23065 (_ BitVec 32)) (x!51979 (_ BitVec 32))) (Undefined!5209) (MissingVacant!5209 (index!23066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34901 (_ BitVec 32)) SeekEntryResult!5209)

(assert (=> b!554066 (= e!319521 (= (seekEntryOrOpen!0 (select (arr!16760 a!3118) j!142) a!3118 mask!3119) (Found!5209 j!142)))))

(declare-fun res!346479 () Bool)

(assert (=> start!50676 (=> (not res!346479) (not e!319524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50676 (= res!346479 (validMask!0 mask!3119))))

(assert (=> start!50676 e!319524))

(assert (=> start!50676 true))

(declare-fun array_inv!12556 (array!34901) Bool)

(assert (=> start!50676 (array_inv!12556 a!3118)))

(declare-fun b!554067 () Bool)

(declare-fun res!346483 () Bool)

(assert (=> b!554067 (=> (not res!346483) (not e!319522))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34901 (_ BitVec 32)) SeekEntryResult!5209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554067 (= res!346483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16760 a!3118) j!142) mask!3119) (select (arr!16760 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16760 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16760 a!3118) i!1132 k!1914) j!142) (array!34902 (store (arr!16760 a!3118) i!1132 k!1914) (size!17124 a!3118)) mask!3119)))))

(declare-fun b!554068 () Bool)

(assert (=> b!554068 (= e!319524 e!319522)))

(declare-fun res!346475 () Bool)

(assert (=> b!554068 (=> (not res!346475) (not e!319522))))

(declare-fun lt!251664 () SeekEntryResult!5209)

(assert (=> b!554068 (= res!346475 (or (= lt!251664 (MissingZero!5209 i!1132)) (= lt!251664 (MissingVacant!5209 i!1132))))))

(assert (=> b!554068 (= lt!251664 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554069 () Bool)

(declare-fun res!346484 () Bool)

(assert (=> b!554069 (=> (not res!346484) (not e!319524))))

(declare-fun arrayContainsKey!0 (array!34901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554069 (= res!346484 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554070 () Bool)

(declare-fun res!346477 () Bool)

(assert (=> b!554070 (=> (not res!346477) (not e!319524))))

(assert (=> b!554070 (= res!346477 (and (= (size!17124 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17124 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17124 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554071 () Bool)

(declare-fun res!346481 () Bool)

(assert (=> b!554071 (=> (not res!346481) (not e!319522))))

(declare-datatypes ((List!10840 0))(
  ( (Nil!10837) (Cons!10836 (h!11821 (_ BitVec 64)) (t!17068 List!10840)) )
))
(declare-fun arrayNoDuplicates!0 (array!34901 (_ BitVec 32) List!10840) Bool)

(assert (=> b!554071 (= res!346481 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10837))))

(declare-fun b!554072 () Bool)

(declare-fun res!346480 () Bool)

(assert (=> b!554072 (=> (not res!346480) (not e!319524))))

(assert (=> b!554072 (= res!346480 (validKeyInArray!0 (select (arr!16760 a!3118) j!142)))))

(assert (= (and start!50676 res!346479) b!554070))

(assert (= (and b!554070 res!346477) b!554072))

(assert (= (and b!554072 res!346480) b!554064))

(assert (= (and b!554064 res!346478) b!554069))

(assert (= (and b!554069 res!346484) b!554068))

(assert (= (and b!554068 res!346475) b!554063))

(assert (= (and b!554063 res!346482) b!554071))

(assert (= (and b!554071 res!346481) b!554067))

(assert (= (and b!554067 res!346483) b!554065))

(assert (= (and b!554065 res!346476) b!554066))

(declare-fun m!531279 () Bool)

(assert (=> b!554069 m!531279))

(declare-fun m!531281 () Bool)

(assert (=> b!554064 m!531281))

(declare-fun m!531283 () Bool)

(assert (=> b!554067 m!531283))

(declare-fun m!531285 () Bool)

(assert (=> b!554067 m!531285))

(assert (=> b!554067 m!531283))

(declare-fun m!531287 () Bool)

(assert (=> b!554067 m!531287))

(declare-fun m!531289 () Bool)

(assert (=> b!554067 m!531289))

(assert (=> b!554067 m!531287))

(declare-fun m!531291 () Bool)

(assert (=> b!554067 m!531291))

(assert (=> b!554067 m!531285))

(assert (=> b!554067 m!531283))

(declare-fun m!531293 () Bool)

(assert (=> b!554067 m!531293))

(declare-fun m!531295 () Bool)

(assert (=> b!554067 m!531295))

(assert (=> b!554067 m!531287))

(assert (=> b!554067 m!531289))

(declare-fun m!531297 () Bool)

(assert (=> b!554063 m!531297))

(declare-fun m!531299 () Bool)

(assert (=> start!50676 m!531299))

(declare-fun m!531301 () Bool)

(assert (=> start!50676 m!531301))

(assert (=> b!554066 m!531283))

(assert (=> b!554066 m!531283))

(declare-fun m!531303 () Bool)

(assert (=> b!554066 m!531303))

(assert (=> b!554072 m!531283))

(assert (=> b!554072 m!531283))

(declare-fun m!531305 () Bool)

(assert (=> b!554072 m!531305))

(declare-fun m!531307 () Bool)

(assert (=> b!554065 m!531307))

(declare-fun m!531309 () Bool)

(assert (=> b!554065 m!531309))

(declare-fun m!531311 () Bool)

(assert (=> b!554068 m!531311))

(declare-fun m!531313 () Bool)

(assert (=> b!554071 m!531313))

(push 1)

