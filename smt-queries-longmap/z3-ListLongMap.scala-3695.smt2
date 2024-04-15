; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50774 () Bool)

(assert start!50774)

(declare-fun res!347890 () Bool)

(declare-fun e!320036 () Bool)

(assert (=> start!50774 (=> (not res!347890) (not e!320036))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50774 (= res!347890 (validMask!0 mask!3119))))

(assert (=> start!50774 e!320036))

(assert (=> start!50774 true))

(declare-datatypes ((array!35008 0))(
  ( (array!35009 (arr!16814 (Array (_ BitVec 32) (_ BitVec 64))) (size!17179 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35008)

(declare-fun array_inv!12697 (array!35008) Bool)

(assert (=> start!50774 (array_inv!12697 a!3118)))

(declare-fun b!555332 () Bool)

(declare-fun res!347892 () Bool)

(assert (=> b!555332 (=> (not res!347892) (not e!320036))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555332 (= res!347892 (validKeyInArray!0 k0!1914))))

(declare-fun b!555333 () Bool)

(declare-fun res!347889 () Bool)

(assert (=> b!555333 (=> (not res!347889) (not e!320036))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555333 (= res!347889 (validKeyInArray!0 (select (arr!16814 a!3118) j!142)))))

(declare-fun b!555334 () Bool)

(declare-fun res!347886 () Bool)

(declare-fun e!320034 () Bool)

(assert (=> b!555334 (=> (not res!347886) (not e!320034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35008 (_ BitVec 32)) Bool)

(assert (=> b!555334 (= res!347886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555335 () Bool)

(declare-fun res!347894 () Bool)

(assert (=> b!555335 (=> (not res!347894) (not e!320036))))

(declare-fun arrayContainsKey!0 (array!35008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555335 (= res!347894 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555336 () Bool)

(declare-fun res!347887 () Bool)

(assert (=> b!555336 (=> (not res!347887) (not e!320034))))

(declare-datatypes ((List!10933 0))(
  ( (Nil!10930) (Cons!10929 (h!11914 (_ BitVec 64)) (t!17152 List!10933)) )
))
(declare-fun arrayNoDuplicates!0 (array!35008 (_ BitVec 32) List!10933) Bool)

(assert (=> b!555336 (= res!347887 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10930))))

(declare-fun b!555337 () Bool)

(declare-fun res!347888 () Bool)

(assert (=> b!555337 (=> (not res!347888) (not e!320036))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555337 (= res!347888 (and (= (size!17179 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17179 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17179 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555338 () Bool)

(assert (=> b!555338 (= e!320036 e!320034)))

(declare-fun res!347891 () Bool)

(assert (=> b!555338 (=> (not res!347891) (not e!320034))))

(declare-datatypes ((SeekEntryResult!5260 0))(
  ( (MissingZero!5260 (index!23267 (_ BitVec 32))) (Found!5260 (index!23268 (_ BitVec 32))) (Intermediate!5260 (undefined!6072 Bool) (index!23269 (_ BitVec 32)) (x!52177 (_ BitVec 32))) (Undefined!5260) (MissingVacant!5260 (index!23270 (_ BitVec 32))) )
))
(declare-fun lt!252295 () SeekEntryResult!5260)

(assert (=> b!555338 (= res!347891 (or (= lt!252295 (MissingZero!5260 i!1132)) (= lt!252295 (MissingVacant!5260 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35008 (_ BitVec 32)) SeekEntryResult!5260)

(assert (=> b!555338 (= lt!252295 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555339 () Bool)

(declare-fun e!320035 () Bool)

(assert (=> b!555339 (= e!320035 (not true))))

(declare-fun lt!252293 () SeekEntryResult!5260)

(declare-fun lt!252290 () SeekEntryResult!5260)

(get-info :version)

(assert (=> b!555339 (and (= lt!252293 (Found!5260 j!142)) (or (undefined!6072 lt!252290) (not ((_ is Intermediate!5260) lt!252290)) (= (select (arr!16814 a!3118) (index!23269 lt!252290)) (select (arr!16814 a!3118) j!142)) (not (= (select (arr!16814 a!3118) (index!23269 lt!252290)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252293 (MissingZero!5260 (index!23269 lt!252290)))))))

(assert (=> b!555339 (= lt!252293 (seekEntryOrOpen!0 (select (arr!16814 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555339 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17280 0))(
  ( (Unit!17281) )
))
(declare-fun lt!252291 () Unit!17280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17280)

(assert (=> b!555339 (= lt!252291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555340 () Bool)

(assert (=> b!555340 (= e!320034 e!320035)))

(declare-fun res!347893 () Bool)

(assert (=> b!555340 (=> (not res!347893) (not e!320035))))

(declare-fun lt!252294 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35008 (_ BitVec 32)) SeekEntryResult!5260)

(assert (=> b!555340 (= res!347893 (= lt!252290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252294 (select (store (arr!16814 a!3118) i!1132 k0!1914) j!142) (array!35009 (store (arr!16814 a!3118) i!1132 k0!1914) (size!17179 a!3118)) mask!3119)))))

(declare-fun lt!252292 () (_ BitVec 32))

(assert (=> b!555340 (= lt!252290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252292 (select (arr!16814 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555340 (= lt!252294 (toIndex!0 (select (store (arr!16814 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555340 (= lt!252292 (toIndex!0 (select (arr!16814 a!3118) j!142) mask!3119))))

(assert (= (and start!50774 res!347890) b!555337))

(assert (= (and b!555337 res!347888) b!555333))

(assert (= (and b!555333 res!347889) b!555332))

(assert (= (and b!555332 res!347892) b!555335))

(assert (= (and b!555335 res!347894) b!555338))

(assert (= (and b!555338 res!347891) b!555334))

(assert (= (and b!555334 res!347886) b!555336))

(assert (= (and b!555336 res!347887) b!555340))

(assert (= (and b!555340 res!347893) b!555339))

(declare-fun m!532583 () Bool)

(assert (=> b!555336 m!532583))

(declare-fun m!532585 () Bool)

(assert (=> b!555335 m!532585))

(declare-fun m!532587 () Bool)

(assert (=> b!555334 m!532587))

(declare-fun m!532589 () Bool)

(assert (=> b!555338 m!532589))

(declare-fun m!532591 () Bool)

(assert (=> b!555340 m!532591))

(declare-fun m!532593 () Bool)

(assert (=> b!555340 m!532593))

(assert (=> b!555340 m!532591))

(declare-fun m!532595 () Bool)

(assert (=> b!555340 m!532595))

(assert (=> b!555340 m!532595))

(declare-fun m!532597 () Bool)

(assert (=> b!555340 m!532597))

(declare-fun m!532599 () Bool)

(assert (=> b!555340 m!532599))

(assert (=> b!555340 m!532591))

(declare-fun m!532601 () Bool)

(assert (=> b!555340 m!532601))

(assert (=> b!555340 m!532595))

(declare-fun m!532603 () Bool)

(assert (=> b!555340 m!532603))

(declare-fun m!532605 () Bool)

(assert (=> start!50774 m!532605))

(declare-fun m!532607 () Bool)

(assert (=> start!50774 m!532607))

(declare-fun m!532609 () Bool)

(assert (=> b!555339 m!532609))

(assert (=> b!555339 m!532591))

(declare-fun m!532611 () Bool)

(assert (=> b!555339 m!532611))

(declare-fun m!532613 () Bool)

(assert (=> b!555339 m!532613))

(assert (=> b!555339 m!532591))

(declare-fun m!532615 () Bool)

(assert (=> b!555339 m!532615))

(declare-fun m!532617 () Bool)

(assert (=> b!555332 m!532617))

(assert (=> b!555333 m!532591))

(assert (=> b!555333 m!532591))

(declare-fun m!532619 () Bool)

(assert (=> b!555333 m!532619))

(check-sat (not b!555338) (not b!555335) (not start!50774) (not b!555339) (not b!555332) (not b!555340) (not b!555334) (not b!555333) (not b!555336))
(check-sat)
