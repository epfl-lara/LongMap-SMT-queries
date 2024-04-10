; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50830 () Bool)

(assert start!50830)

(declare-fun b!556229 () Bool)

(declare-fun res!348641 () Bool)

(declare-fun e!320483 () Bool)

(assert (=> b!556229 (=> (not res!348641) (not e!320483))))

(declare-datatypes ((array!35055 0))(
  ( (array!35056 (arr!16837 (Array (_ BitVec 32) (_ BitVec 64))) (size!17201 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35055)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35055 (_ BitVec 32)) Bool)

(assert (=> b!556229 (= res!348641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556230 () Bool)

(declare-fun e!320481 () Bool)

(assert (=> b!556230 (= e!320481 e!320483)))

(declare-fun res!348642 () Bool)

(assert (=> b!556230 (=> (not res!348642) (not e!320483))))

(declare-datatypes ((SeekEntryResult!5286 0))(
  ( (MissingZero!5286 (index!23371 (_ BitVec 32))) (Found!5286 (index!23372 (_ BitVec 32))) (Intermediate!5286 (undefined!6098 Bool) (index!23373 (_ BitVec 32)) (x!52264 (_ BitVec 32))) (Undefined!5286) (MissingVacant!5286 (index!23374 (_ BitVec 32))) )
))
(declare-fun lt!252819 () SeekEntryResult!5286)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556230 (= res!348642 (or (= lt!252819 (MissingZero!5286 i!1132)) (= lt!252819 (MissingVacant!5286 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35055 (_ BitVec 32)) SeekEntryResult!5286)

(assert (=> b!556230 (= lt!252819 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556231 () Bool)

(declare-fun res!348645 () Bool)

(assert (=> b!556231 (=> (not res!348645) (not e!320481))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!556231 (= res!348645 (and (= (size!17201 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17201 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17201 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556232 () Bool)

(declare-fun res!348647 () Bool)

(assert (=> b!556232 (=> (not res!348647) (not e!320481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556232 (= res!348647 (validKeyInArray!0 (select (arr!16837 a!3118) j!142)))))

(declare-fun b!556233 () Bool)

(declare-fun res!348649 () Bool)

(assert (=> b!556233 (=> (not res!348649) (not e!320483))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35055 (_ BitVec 32)) SeekEntryResult!5286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556233 (= res!348649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16837 a!3118) j!142) mask!3119) (select (arr!16837 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16837 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16837 a!3118) i!1132 k0!1914) j!142) (array!35056 (store (arr!16837 a!3118) i!1132 k0!1914) (size!17201 a!3118)) mask!3119)))))

(declare-fun b!556234 () Bool)

(declare-fun res!348646 () Bool)

(assert (=> b!556234 (=> (not res!348646) (not e!320481))))

(declare-fun arrayContainsKey!0 (array!35055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556234 (= res!348646 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!348648 () Bool)

(assert (=> start!50830 (=> (not res!348648) (not e!320481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50830 (= res!348648 (validMask!0 mask!3119))))

(assert (=> start!50830 e!320481))

(assert (=> start!50830 true))

(declare-fun array_inv!12633 (array!35055) Bool)

(assert (=> start!50830 (array_inv!12633 a!3118)))

(declare-fun e!320484 () Bool)

(declare-fun b!556235 () Bool)

(assert (=> b!556235 (= e!320484 (= (seekEntryOrOpen!0 (select (arr!16837 a!3118) j!142) a!3118 mask!3119) (Found!5286 j!142)))))

(declare-fun b!556236 () Bool)

(assert (=> b!556236 (= e!320483 (not true))))

(assert (=> b!556236 e!320484))

(declare-fun res!348644 () Bool)

(assert (=> b!556236 (=> (not res!348644) (not e!320484))))

(assert (=> b!556236 (= res!348644 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17346 0))(
  ( (Unit!17347) )
))
(declare-fun lt!252820 () Unit!17346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17346)

(assert (=> b!556236 (= lt!252820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556237 () Bool)

(declare-fun res!348650 () Bool)

(assert (=> b!556237 (=> (not res!348650) (not e!320481))))

(assert (=> b!556237 (= res!348650 (validKeyInArray!0 k0!1914))))

(declare-fun b!556238 () Bool)

(declare-fun res!348643 () Bool)

(assert (=> b!556238 (=> (not res!348643) (not e!320483))))

(declare-datatypes ((List!10917 0))(
  ( (Nil!10914) (Cons!10913 (h!11898 (_ BitVec 64)) (t!17145 List!10917)) )
))
(declare-fun arrayNoDuplicates!0 (array!35055 (_ BitVec 32) List!10917) Bool)

(assert (=> b!556238 (= res!348643 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10914))))

(assert (= (and start!50830 res!348648) b!556231))

(assert (= (and b!556231 res!348645) b!556232))

(assert (= (and b!556232 res!348647) b!556237))

(assert (= (and b!556237 res!348650) b!556234))

(assert (= (and b!556234 res!348646) b!556230))

(assert (= (and b!556230 res!348642) b!556229))

(assert (= (and b!556229 res!348641) b!556238))

(assert (= (and b!556238 res!348643) b!556233))

(assert (= (and b!556233 res!348649) b!556236))

(assert (= (and b!556236 res!348644) b!556235))

(declare-fun m!534177 () Bool)

(assert (=> b!556235 m!534177))

(assert (=> b!556235 m!534177))

(declare-fun m!534179 () Bool)

(assert (=> b!556235 m!534179))

(declare-fun m!534181 () Bool)

(assert (=> b!556229 m!534181))

(declare-fun m!534183 () Bool)

(assert (=> b!556238 m!534183))

(declare-fun m!534185 () Bool)

(assert (=> b!556236 m!534185))

(declare-fun m!534187 () Bool)

(assert (=> b!556236 m!534187))

(declare-fun m!534189 () Bool)

(assert (=> b!556230 m!534189))

(assert (=> b!556232 m!534177))

(assert (=> b!556232 m!534177))

(declare-fun m!534191 () Bool)

(assert (=> b!556232 m!534191))

(declare-fun m!534193 () Bool)

(assert (=> b!556234 m!534193))

(declare-fun m!534195 () Bool)

(assert (=> start!50830 m!534195))

(declare-fun m!534197 () Bool)

(assert (=> start!50830 m!534197))

(assert (=> b!556233 m!534177))

(declare-fun m!534199 () Bool)

(assert (=> b!556233 m!534199))

(assert (=> b!556233 m!534177))

(declare-fun m!534201 () Bool)

(assert (=> b!556233 m!534201))

(declare-fun m!534203 () Bool)

(assert (=> b!556233 m!534203))

(assert (=> b!556233 m!534201))

(declare-fun m!534205 () Bool)

(assert (=> b!556233 m!534205))

(assert (=> b!556233 m!534199))

(assert (=> b!556233 m!534177))

(declare-fun m!534207 () Bool)

(assert (=> b!556233 m!534207))

(declare-fun m!534209 () Bool)

(assert (=> b!556233 m!534209))

(assert (=> b!556233 m!534201))

(assert (=> b!556233 m!534203))

(declare-fun m!534211 () Bool)

(assert (=> b!556237 m!534211))

(check-sat (not start!50830) (not b!556235) (not b!556232) (not b!556234) (not b!556229) (not b!556236) (not b!556238) (not b!556237) (not b!556233) (not b!556230))
(check-sat)
