; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50746 () Bool)

(assert start!50746)

(declare-fun b!555063 () Bool)

(declare-fun res!347479 () Bool)

(declare-fun e!319970 () Bool)

(assert (=> b!555063 (=> (not res!347479) (not e!319970))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555063 (= res!347479 (validKeyInArray!0 k0!1914))))

(declare-fun b!555064 () Bool)

(declare-fun res!347478 () Bool)

(assert (=> b!555064 (=> (not res!347478) (not e!319970))))

(declare-datatypes ((array!34971 0))(
  ( (array!34972 (arr!16795 (Array (_ BitVec 32) (_ BitVec 64))) (size!17159 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34971)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555064 (= res!347478 (validKeyInArray!0 (select (arr!16795 a!3118) j!142)))))

(declare-fun b!555065 () Bool)

(declare-fun e!319971 () Bool)

(assert (=> b!555065 (= e!319971 (not true))))

(declare-datatypes ((SeekEntryResult!5244 0))(
  ( (MissingZero!5244 (index!23203 (_ BitVec 32))) (Found!5244 (index!23204 (_ BitVec 32))) (Intermediate!5244 (undefined!6056 Bool) (index!23205 (_ BitVec 32)) (x!52110 (_ BitVec 32))) (Undefined!5244) (MissingVacant!5244 (index!23206 (_ BitVec 32))) )
))
(declare-fun lt!252165 () SeekEntryResult!5244)

(declare-fun lt!252164 () SeekEntryResult!5244)

(get-info :version)

(assert (=> b!555065 (and (= lt!252164 (Found!5244 j!142)) (or (undefined!6056 lt!252165) (not ((_ is Intermediate!5244) lt!252165)) (= (select (arr!16795 a!3118) (index!23205 lt!252165)) (select (arr!16795 a!3118) j!142)) (not (= (select (arr!16795 a!3118) (index!23205 lt!252165)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252164 (MissingZero!5244 (index!23205 lt!252165)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34971 (_ BitVec 32)) SeekEntryResult!5244)

(assert (=> b!555065 (= lt!252164 (seekEntryOrOpen!0 (select (arr!16795 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34971 (_ BitVec 32)) Bool)

(assert (=> b!555065 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17262 0))(
  ( (Unit!17263) )
))
(declare-fun lt!252168 () Unit!17262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17262)

(assert (=> b!555065 (= lt!252168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!347475 () Bool)

(assert (=> start!50746 (=> (not res!347475) (not e!319970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50746 (= res!347475 (validMask!0 mask!3119))))

(assert (=> start!50746 e!319970))

(assert (=> start!50746 true))

(declare-fun array_inv!12591 (array!34971) Bool)

(assert (=> start!50746 (array_inv!12591 a!3118)))

(declare-fun b!555066 () Bool)

(declare-fun res!347483 () Bool)

(declare-fun e!319968 () Bool)

(assert (=> b!555066 (=> (not res!347483) (not e!319968))))

(assert (=> b!555066 (= res!347483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555067 () Bool)

(assert (=> b!555067 (= e!319970 e!319968)))

(declare-fun res!347482 () Bool)

(assert (=> b!555067 (=> (not res!347482) (not e!319968))))

(declare-fun lt!252169 () SeekEntryResult!5244)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555067 (= res!347482 (or (= lt!252169 (MissingZero!5244 i!1132)) (= lt!252169 (MissingVacant!5244 i!1132))))))

(assert (=> b!555067 (= lt!252169 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555068 () Bool)

(assert (=> b!555068 (= e!319968 e!319971)))

(declare-fun res!347481 () Bool)

(assert (=> b!555068 (=> (not res!347481) (not e!319971))))

(declare-fun lt!252166 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34971 (_ BitVec 32)) SeekEntryResult!5244)

(assert (=> b!555068 (= res!347481 (= lt!252165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252166 (select (store (arr!16795 a!3118) i!1132 k0!1914) j!142) (array!34972 (store (arr!16795 a!3118) i!1132 k0!1914) (size!17159 a!3118)) mask!3119)))))

(declare-fun lt!252167 () (_ BitVec 32))

(assert (=> b!555068 (= lt!252165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252167 (select (arr!16795 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555068 (= lt!252166 (toIndex!0 (select (store (arr!16795 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555068 (= lt!252167 (toIndex!0 (select (arr!16795 a!3118) j!142) mask!3119))))

(declare-fun b!555069 () Bool)

(declare-fun res!347476 () Bool)

(assert (=> b!555069 (=> (not res!347476) (not e!319970))))

(assert (=> b!555069 (= res!347476 (and (= (size!17159 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17159 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17159 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555070 () Bool)

(declare-fun res!347477 () Bool)

(assert (=> b!555070 (=> (not res!347477) (not e!319968))))

(declare-datatypes ((List!10875 0))(
  ( (Nil!10872) (Cons!10871 (h!11856 (_ BitVec 64)) (t!17103 List!10875)) )
))
(declare-fun arrayNoDuplicates!0 (array!34971 (_ BitVec 32) List!10875) Bool)

(assert (=> b!555070 (= res!347477 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10872))))

(declare-fun b!555071 () Bool)

(declare-fun res!347480 () Bool)

(assert (=> b!555071 (=> (not res!347480) (not e!319970))))

(declare-fun arrayContainsKey!0 (array!34971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555071 (= res!347480 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50746 res!347475) b!555069))

(assert (= (and b!555069 res!347476) b!555064))

(assert (= (and b!555064 res!347478) b!555063))

(assert (= (and b!555063 res!347479) b!555071))

(assert (= (and b!555071 res!347480) b!555067))

(assert (= (and b!555067 res!347482) b!555066))

(assert (= (and b!555066 res!347483) b!555070))

(assert (= (and b!555070 res!347477) b!555068))

(assert (= (and b!555068 res!347481) b!555065))

(declare-fun m!532595 () Bool)

(assert (=> b!555070 m!532595))

(declare-fun m!532597 () Bool)

(assert (=> b!555066 m!532597))

(declare-fun m!532599 () Bool)

(assert (=> b!555067 m!532599))

(declare-fun m!532601 () Bool)

(assert (=> b!555071 m!532601))

(declare-fun m!532603 () Bool)

(assert (=> b!555068 m!532603))

(declare-fun m!532605 () Bool)

(assert (=> b!555068 m!532605))

(assert (=> b!555068 m!532603))

(declare-fun m!532607 () Bool)

(assert (=> b!555068 m!532607))

(assert (=> b!555068 m!532603))

(declare-fun m!532609 () Bool)

(assert (=> b!555068 m!532609))

(declare-fun m!532611 () Bool)

(assert (=> b!555068 m!532611))

(assert (=> b!555068 m!532607))

(declare-fun m!532613 () Bool)

(assert (=> b!555068 m!532613))

(assert (=> b!555068 m!532607))

(declare-fun m!532615 () Bool)

(assert (=> b!555068 m!532615))

(declare-fun m!532617 () Bool)

(assert (=> b!555063 m!532617))

(assert (=> b!555065 m!532603))

(declare-fun m!532619 () Bool)

(assert (=> b!555065 m!532619))

(declare-fun m!532621 () Bool)

(assert (=> b!555065 m!532621))

(declare-fun m!532623 () Bool)

(assert (=> b!555065 m!532623))

(assert (=> b!555065 m!532603))

(declare-fun m!532625 () Bool)

(assert (=> b!555065 m!532625))

(declare-fun m!532627 () Bool)

(assert (=> start!50746 m!532627))

(declare-fun m!532629 () Bool)

(assert (=> start!50746 m!532629))

(assert (=> b!555064 m!532603))

(assert (=> b!555064 m!532603))

(declare-fun m!532631 () Bool)

(assert (=> b!555064 m!532631))

(check-sat (not b!555065) (not b!555068) (not start!50746) (not b!555071) (not b!555070) (not b!555066) (not b!555067) (not b!555064) (not b!555063))
(check-sat)
