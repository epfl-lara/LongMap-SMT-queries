; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50820 () Bool)

(assert start!50820)

(declare-fun b!555642 () Bool)

(declare-fun res!347950 () Bool)

(declare-fun e!320268 () Bool)

(assert (=> b!555642 (=> (not res!347950) (not e!320268))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34992 0))(
  ( (array!34993 (arr!16804 (Array (_ BitVec 32) (_ BitVec 64))) (size!17168 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34992)

(assert (=> b!555642 (= res!347950 (and (= (size!17168 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17168 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17168 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555643 () Bool)

(declare-fun res!347955 () Bool)

(assert (=> b!555643 (=> (not res!347955) (not e!320268))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555643 (= res!347955 (validKeyInArray!0 k0!1914))))

(declare-fun b!555644 () Bool)

(declare-fun e!320265 () Bool)

(assert (=> b!555644 (= e!320268 e!320265)))

(declare-fun res!347949 () Bool)

(assert (=> b!555644 (=> (not res!347949) (not e!320265))))

(declare-datatypes ((SeekEntryResult!5209 0))(
  ( (MissingZero!5209 (index!23063 (_ BitVec 32))) (Found!5209 (index!23064 (_ BitVec 32))) (Intermediate!5209 (undefined!6021 Bool) (index!23065 (_ BitVec 32)) (x!52118 (_ BitVec 32))) (Undefined!5209) (MissingVacant!5209 (index!23066 (_ BitVec 32))) )
))
(declare-fun lt!252531 () SeekEntryResult!5209)

(assert (=> b!555644 (= res!347949 (or (= lt!252531 (MissingZero!5209 i!1132)) (= lt!252531 (MissingVacant!5209 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34992 (_ BitVec 32)) SeekEntryResult!5209)

(assert (=> b!555644 (= lt!252531 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555645 () Bool)

(declare-fun e!320266 () Bool)

(assert (=> b!555645 (= e!320266 (not true))))

(declare-fun lt!252530 () SeekEntryResult!5209)

(declare-fun lt!252532 () SeekEntryResult!5209)

(get-info :version)

(assert (=> b!555645 (and (= lt!252532 (Found!5209 j!142)) (or (undefined!6021 lt!252530) (not ((_ is Intermediate!5209) lt!252530)) (= (select (arr!16804 a!3118) (index!23065 lt!252530)) (select (arr!16804 a!3118) j!142)) (not (= (select (arr!16804 a!3118) (index!23065 lt!252530)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252532 (MissingZero!5209 (index!23065 lt!252530)))))))

(assert (=> b!555645 (= lt!252532 (seekEntryOrOpen!0 (select (arr!16804 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34992 (_ BitVec 32)) Bool)

(assert (=> b!555645 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17263 0))(
  ( (Unit!17264) )
))
(declare-fun lt!252529 () Unit!17263)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17263)

(assert (=> b!555645 (= lt!252529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555646 () Bool)

(declare-fun res!347948 () Bool)

(assert (=> b!555646 (=> (not res!347948) (not e!320268))))

(assert (=> b!555646 (= res!347948 (validKeyInArray!0 (select (arr!16804 a!3118) j!142)))))

(declare-fun b!555647 () Bool)

(declare-fun res!347952 () Bool)

(assert (=> b!555647 (=> (not res!347952) (not e!320265))))

(declare-datatypes ((List!10791 0))(
  ( (Nil!10788) (Cons!10787 (h!11775 (_ BitVec 64)) (t!17011 List!10791)) )
))
(declare-fun arrayNoDuplicates!0 (array!34992 (_ BitVec 32) List!10791) Bool)

(assert (=> b!555647 (= res!347952 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10788))))

(declare-fun b!555648 () Bool)

(declare-fun res!347951 () Bool)

(assert (=> b!555648 (=> (not res!347951) (not e!320268))))

(declare-fun arrayContainsKey!0 (array!34992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555648 (= res!347951 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555649 () Bool)

(assert (=> b!555649 (= e!320265 e!320266)))

(declare-fun res!347956 () Bool)

(assert (=> b!555649 (=> (not res!347956) (not e!320266))))

(declare-fun lt!252527 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34992 (_ BitVec 32)) SeekEntryResult!5209)

(assert (=> b!555649 (= res!347956 (= lt!252530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252527 (select (store (arr!16804 a!3118) i!1132 k0!1914) j!142) (array!34993 (store (arr!16804 a!3118) i!1132 k0!1914) (size!17168 a!3118)) mask!3119)))))

(declare-fun lt!252528 () (_ BitVec 32))

(assert (=> b!555649 (= lt!252530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252528 (select (arr!16804 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555649 (= lt!252527 (toIndex!0 (select (store (arr!16804 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555649 (= lt!252528 (toIndex!0 (select (arr!16804 a!3118) j!142) mask!3119))))

(declare-fun b!555641 () Bool)

(declare-fun res!347953 () Bool)

(assert (=> b!555641 (=> (not res!347953) (not e!320265))))

(assert (=> b!555641 (= res!347953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347954 () Bool)

(assert (=> start!50820 (=> (not res!347954) (not e!320268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50820 (= res!347954 (validMask!0 mask!3119))))

(assert (=> start!50820 e!320268))

(assert (=> start!50820 true))

(declare-fun array_inv!12663 (array!34992) Bool)

(assert (=> start!50820 (array_inv!12663 a!3118)))

(assert (= (and start!50820 res!347954) b!555642))

(assert (= (and b!555642 res!347950) b!555646))

(assert (= (and b!555646 res!347948) b!555643))

(assert (= (and b!555643 res!347955) b!555648))

(assert (= (and b!555648 res!347951) b!555644))

(assert (= (and b!555644 res!347949) b!555641))

(assert (= (and b!555641 res!347953) b!555647))

(assert (= (and b!555647 res!347952) b!555649))

(assert (= (and b!555649 res!347956) b!555645))

(declare-fun m!533465 () Bool)

(assert (=> b!555643 m!533465))

(declare-fun m!533467 () Bool)

(assert (=> b!555641 m!533467))

(declare-fun m!533469 () Bool)

(assert (=> start!50820 m!533469))

(declare-fun m!533471 () Bool)

(assert (=> start!50820 m!533471))

(declare-fun m!533473 () Bool)

(assert (=> b!555645 m!533473))

(declare-fun m!533475 () Bool)

(assert (=> b!555645 m!533475))

(declare-fun m!533477 () Bool)

(assert (=> b!555645 m!533477))

(declare-fun m!533479 () Bool)

(assert (=> b!555645 m!533479))

(assert (=> b!555645 m!533473))

(declare-fun m!533481 () Bool)

(assert (=> b!555645 m!533481))

(assert (=> b!555646 m!533473))

(assert (=> b!555646 m!533473))

(declare-fun m!533483 () Bool)

(assert (=> b!555646 m!533483))

(assert (=> b!555649 m!533473))

(declare-fun m!533485 () Bool)

(assert (=> b!555649 m!533485))

(assert (=> b!555649 m!533473))

(declare-fun m!533487 () Bool)

(assert (=> b!555649 m!533487))

(declare-fun m!533489 () Bool)

(assert (=> b!555649 m!533489))

(assert (=> b!555649 m!533473))

(declare-fun m!533491 () Bool)

(assert (=> b!555649 m!533491))

(assert (=> b!555649 m!533487))

(declare-fun m!533493 () Bool)

(assert (=> b!555649 m!533493))

(assert (=> b!555649 m!533487))

(declare-fun m!533495 () Bool)

(assert (=> b!555649 m!533495))

(declare-fun m!533497 () Bool)

(assert (=> b!555644 m!533497))

(declare-fun m!533499 () Bool)

(assert (=> b!555648 m!533499))

(declare-fun m!533501 () Bool)

(assert (=> b!555647 m!533501))

(check-sat (not start!50820) (not b!555645) (not b!555649) (not b!555641) (not b!555646) (not b!555644) (not b!555648) (not b!555643) (not b!555647))
(check-sat)
