; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50804 () Bool)

(assert start!50804)

(declare-fun res!348307 () Bool)

(declare-fun e!320216 () Bool)

(assert (=> start!50804 (=> (not res!348307) (not e!320216))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50804 (= res!348307 (validMask!0 mask!3119))))

(assert (=> start!50804 e!320216))

(assert (=> start!50804 true))

(declare-datatypes ((array!35038 0))(
  ( (array!35039 (arr!16829 (Array (_ BitVec 32) (_ BitVec 64))) (size!17194 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35038)

(declare-fun array_inv!12712 (array!35038) Bool)

(assert (=> start!50804 (array_inv!12712 a!3118)))

(declare-fun b!555748 () Bool)

(declare-fun e!320217 () Bool)

(assert (=> b!555748 (= e!320216 e!320217)))

(declare-fun res!348303 () Bool)

(assert (=> b!555748 (=> (not res!348303) (not e!320217))))

(declare-datatypes ((SeekEntryResult!5275 0))(
  ( (MissingZero!5275 (index!23327 (_ BitVec 32))) (Found!5275 (index!23328 (_ BitVec 32))) (Intermediate!5275 (undefined!6087 Bool) (index!23329 (_ BitVec 32)) (x!52232 (_ BitVec 32))) (Undefined!5275) (MissingVacant!5275 (index!23330 (_ BitVec 32))) )
))
(declare-fun lt!252524 () SeekEntryResult!5275)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555748 (= res!348303 (or (= lt!252524 (MissingZero!5275 i!1132)) (= lt!252524 (MissingVacant!5275 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35038 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!555748 (= lt!252524 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!320219 () Bool)

(declare-fun b!555749 () Bool)

(assert (=> b!555749 (= e!320219 (= (seekEntryOrOpen!0 (select (arr!16829 a!3118) j!142) a!3118 mask!3119) (Found!5275 j!142)))))

(declare-fun b!555750 () Bool)

(declare-fun res!348309 () Bool)

(assert (=> b!555750 (=> (not res!348309) (not e!320216))))

(assert (=> b!555750 (= res!348309 (and (= (size!17194 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17194 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17194 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555751 () Bool)

(declare-fun res!348302 () Bool)

(assert (=> b!555751 (=> (not res!348302) (not e!320217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35038 (_ BitVec 32)) Bool)

(assert (=> b!555751 (= res!348302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555752 () Bool)

(declare-fun res!348305 () Bool)

(assert (=> b!555752 (=> (not res!348305) (not e!320216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555752 (= res!348305 (validKeyInArray!0 (select (arr!16829 a!3118) j!142)))))

(declare-fun b!555753 () Bool)

(declare-fun res!348311 () Bool)

(assert (=> b!555753 (=> (not res!348311) (not e!320216))))

(declare-fun arrayContainsKey!0 (array!35038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555753 (= res!348311 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555754 () Bool)

(declare-fun e!320220 () Bool)

(assert (=> b!555754 (= e!320217 e!320220)))

(declare-fun res!348306 () Bool)

(assert (=> b!555754 (=> (not res!348306) (not e!320220))))

(declare-fun lt!252525 () (_ BitVec 32))

(declare-fun lt!252522 () SeekEntryResult!5275)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35038 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!555754 (= res!348306 (= lt!252522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252525 (select (store (arr!16829 a!3118) i!1132 k0!1914) j!142) (array!35039 (store (arr!16829 a!3118) i!1132 k0!1914) (size!17194 a!3118)) mask!3119)))))

(declare-fun lt!252523 () (_ BitVec 32))

(assert (=> b!555754 (= lt!252522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252523 (select (arr!16829 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555754 (= lt!252525 (toIndex!0 (select (store (arr!16829 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555754 (= lt!252523 (toIndex!0 (select (arr!16829 a!3118) j!142) mask!3119))))

(declare-fun b!555755 () Bool)

(get-info :version)

(assert (=> b!555755 (= e!320220 (not (or (not ((_ is Intermediate!5275) lt!252522)) (undefined!6087 lt!252522) (= (select (arr!16829 a!3118) (index!23329 lt!252522)) (select (arr!16829 a!3118) j!142)) (= (select (arr!16829 a!3118) (index!23329 lt!252522)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!555755 e!320219))

(declare-fun res!348310 () Bool)

(assert (=> b!555755 (=> (not res!348310) (not e!320219))))

(assert (=> b!555755 (= res!348310 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17310 0))(
  ( (Unit!17311) )
))
(declare-fun lt!252526 () Unit!17310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17310)

(assert (=> b!555755 (= lt!252526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555756 () Bool)

(declare-fun res!348308 () Bool)

(assert (=> b!555756 (=> (not res!348308) (not e!320216))))

(assert (=> b!555756 (= res!348308 (validKeyInArray!0 k0!1914))))

(declare-fun b!555757 () Bool)

(declare-fun res!348304 () Bool)

(assert (=> b!555757 (=> (not res!348304) (not e!320217))))

(declare-datatypes ((List!10948 0))(
  ( (Nil!10945) (Cons!10944 (h!11929 (_ BitVec 64)) (t!17167 List!10948)) )
))
(declare-fun arrayNoDuplicates!0 (array!35038 (_ BitVec 32) List!10948) Bool)

(assert (=> b!555757 (= res!348304 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10945))))

(assert (= (and start!50804 res!348307) b!555750))

(assert (= (and b!555750 res!348309) b!555752))

(assert (= (and b!555752 res!348305) b!555756))

(assert (= (and b!555756 res!348308) b!555753))

(assert (= (and b!555753 res!348311) b!555748))

(assert (= (and b!555748 res!348303) b!555751))

(assert (= (and b!555751 res!348302) b!555757))

(assert (= (and b!555757 res!348304) b!555754))

(assert (= (and b!555754 res!348306) b!555755))

(assert (= (and b!555755 res!348310) b!555749))

(declare-fun m!533147 () Bool)

(assert (=> b!555754 m!533147))

(declare-fun m!533149 () Bool)

(assert (=> b!555754 m!533149))

(declare-fun m!533151 () Bool)

(assert (=> b!555754 m!533151))

(declare-fun m!533153 () Bool)

(assert (=> b!555754 m!533153))

(assert (=> b!555754 m!533151))

(assert (=> b!555754 m!533147))

(declare-fun m!533155 () Bool)

(assert (=> b!555754 m!533155))

(assert (=> b!555754 m!533151))

(declare-fun m!533157 () Bool)

(assert (=> b!555754 m!533157))

(assert (=> b!555754 m!533147))

(declare-fun m!533159 () Bool)

(assert (=> b!555754 m!533159))

(declare-fun m!533161 () Bool)

(assert (=> b!555756 m!533161))

(declare-fun m!533163 () Bool)

(assert (=> b!555757 m!533163))

(declare-fun m!533165 () Bool)

(assert (=> b!555755 m!533165))

(assert (=> b!555755 m!533151))

(declare-fun m!533167 () Bool)

(assert (=> b!555755 m!533167))

(declare-fun m!533169 () Bool)

(assert (=> b!555755 m!533169))

(declare-fun m!533171 () Bool)

(assert (=> b!555748 m!533171))

(assert (=> b!555749 m!533151))

(assert (=> b!555749 m!533151))

(declare-fun m!533173 () Bool)

(assert (=> b!555749 m!533173))

(declare-fun m!533175 () Bool)

(assert (=> b!555753 m!533175))

(assert (=> b!555752 m!533151))

(assert (=> b!555752 m!533151))

(declare-fun m!533177 () Bool)

(assert (=> b!555752 m!533177))

(declare-fun m!533179 () Bool)

(assert (=> start!50804 m!533179))

(declare-fun m!533181 () Bool)

(assert (=> start!50804 m!533181))

(declare-fun m!533183 () Bool)

(assert (=> b!555751 m!533183))

(check-sat (not start!50804) (not b!555753) (not b!555751) (not b!555748) (not b!555752) (not b!555755) (not b!555757) (not b!555749) (not b!555756) (not b!555754))
(check-sat)
