; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52770 () Bool)

(assert start!52770)

(declare-fun b!575337 () Bool)

(declare-fun e!331044 () Bool)

(declare-fun e!331040 () Bool)

(assert (=> b!575337 (= e!331044 (not e!331040))))

(declare-fun res!363753 () Bool)

(assert (=> b!575337 (=> res!363753 e!331040)))

(declare-datatypes ((SeekEntryResult!5689 0))(
  ( (MissingZero!5689 (index!24983 (_ BitVec 32))) (Found!5689 (index!24984 (_ BitVec 32))) (Intermediate!5689 (undefined!6501 Bool) (index!24985 (_ BitVec 32)) (x!53874 (_ BitVec 32))) (Undefined!5689) (MissingVacant!5689 (index!24986 (_ BitVec 32))) )
))
(declare-fun lt!262908 () SeekEntryResult!5689)

(assert (=> b!575337 (= res!363753 (or (undefined!6501 lt!262908) (not (is-Intermediate!5689 lt!262908))))))

(declare-fun lt!262906 () SeekEntryResult!5689)

(declare-fun lt!262915 () SeekEntryResult!5689)

(assert (=> b!575337 (= lt!262906 lt!262915)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575337 (= lt!262915 (Found!5689 j!142))))

(declare-datatypes ((array!35915 0))(
  ( (array!35916 (arr!17240 (Array (_ BitVec 32) (_ BitVec 64))) (size!17604 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35915)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35915 (_ BitVec 32)) SeekEntryResult!5689)

(assert (=> b!575337 (= lt!262906 (seekEntryOrOpen!0 (select (arr!17240 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35915 (_ BitVec 32)) Bool)

(assert (=> b!575337 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18080 0))(
  ( (Unit!18081) )
))
(declare-fun lt!262911 () Unit!18080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18080)

(assert (=> b!575337 (= lt!262911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!363763 () Bool)

(declare-fun e!331041 () Bool)

(assert (=> start!52770 (=> (not res!363763) (not e!331041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52770 (= res!363763 (validMask!0 mask!3119))))

(assert (=> start!52770 e!331041))

(assert (=> start!52770 true))

(declare-fun array_inv!13036 (array!35915) Bool)

(assert (=> start!52770 (array_inv!13036 a!3118)))

(declare-fun b!575338 () Bool)

(declare-fun e!331039 () Bool)

(assert (=> b!575338 (= e!331039 e!331044)))

(declare-fun res!363756 () Bool)

(assert (=> b!575338 (=> (not res!363756) (not e!331044))))

(declare-fun lt!262913 () (_ BitVec 64))

(declare-fun lt!262917 () array!35915)

(declare-fun lt!262905 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35915 (_ BitVec 32)) SeekEntryResult!5689)

(assert (=> b!575338 (= res!363756 (= lt!262908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262905 lt!262913 lt!262917 mask!3119)))))

(declare-fun lt!262918 () (_ BitVec 32))

(assert (=> b!575338 (= lt!262908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262918 (select (arr!17240 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575338 (= lt!262905 (toIndex!0 lt!262913 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575338 (= lt!262913 (select (store (arr!17240 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575338 (= lt!262918 (toIndex!0 (select (arr!17240 a!3118) j!142) mask!3119))))

(assert (=> b!575338 (= lt!262917 (array!35916 (store (arr!17240 a!3118) i!1132 k!1914) (size!17604 a!3118)))))

(declare-fun b!575339 () Bool)

(declare-fun res!363758 () Bool)

(assert (=> b!575339 (=> (not res!363758) (not e!331039))))

(declare-datatypes ((List!11320 0))(
  ( (Nil!11317) (Cons!11316 (h!12355 (_ BitVec 64)) (t!17548 List!11320)) )
))
(declare-fun arrayNoDuplicates!0 (array!35915 (_ BitVec 32) List!11320) Bool)

(assert (=> b!575339 (= res!363758 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11317))))

(declare-fun b!575340 () Bool)

(assert (=> b!575340 (= e!331041 e!331039)))

(declare-fun res!363764 () Bool)

(assert (=> b!575340 (=> (not res!363764) (not e!331039))))

(declare-fun lt!262914 () SeekEntryResult!5689)

(assert (=> b!575340 (= res!363764 (or (= lt!262914 (MissingZero!5689 i!1132)) (= lt!262914 (MissingVacant!5689 i!1132))))))

(assert (=> b!575340 (= lt!262914 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575341 () Bool)

(declare-fun res!363760 () Bool)

(assert (=> b!575341 (=> (not res!363760) (not e!331041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575341 (= res!363760 (validKeyInArray!0 (select (arr!17240 a!3118) j!142)))))

(declare-fun b!575342 () Bool)

(declare-fun e!331042 () Bool)

(declare-fun e!331043 () Bool)

(assert (=> b!575342 (= e!331042 e!331043)))

(declare-fun res!363762 () Bool)

(assert (=> b!575342 (=> res!363762 e!331043)))

(declare-fun lt!262909 () (_ BitVec 64))

(declare-fun lt!262912 () SeekEntryResult!5689)

(assert (=> b!575342 (= res!363762 (or (bvslt (index!24985 lt!262908) #b00000000000000000000000000000000) (bvsge (index!24985 lt!262908) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53874 lt!262908) #b01111111111111111111111111111110) (bvslt (x!53874 lt!262908) #b00000000000000000000000000000000) (not (= lt!262909 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17240 a!3118) i!1132 k!1914) (index!24985 lt!262908)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262912 lt!262915))))))

(declare-fun lt!262916 () SeekEntryResult!5689)

(declare-fun lt!262907 () SeekEntryResult!5689)

(assert (=> b!575342 (= lt!262916 lt!262907)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35915 (_ BitVec 32)) SeekEntryResult!5689)

(assert (=> b!575342 (= lt!262907 (seekKeyOrZeroReturnVacant!0 (x!53874 lt!262908) (index!24985 lt!262908) (index!24985 lt!262908) lt!262913 lt!262917 mask!3119))))

(assert (=> b!575342 (= lt!262916 (seekEntryOrOpen!0 lt!262913 lt!262917 mask!3119))))

(assert (=> b!575342 (= lt!262906 lt!262912)))

(assert (=> b!575342 (= lt!262912 (seekKeyOrZeroReturnVacant!0 (x!53874 lt!262908) (index!24985 lt!262908) (index!24985 lt!262908) (select (arr!17240 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575343 () Bool)

(declare-fun res!363759 () Bool)

(assert (=> b!575343 (=> (not res!363759) (not e!331041))))

(assert (=> b!575343 (= res!363759 (validKeyInArray!0 k!1914))))

(declare-fun b!575344 () Bool)

(assert (=> b!575344 (= e!331040 e!331042)))

(declare-fun res!363755 () Bool)

(assert (=> b!575344 (=> res!363755 e!331042)))

(assert (=> b!575344 (= res!363755 (or (= lt!262909 (select (arr!17240 a!3118) j!142)) (= lt!262909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575344 (= lt!262909 (select (arr!17240 a!3118) (index!24985 lt!262908)))))

(declare-fun b!575345 () Bool)

(assert (=> b!575345 (= e!331043 true)))

(assert (=> b!575345 (= lt!262912 lt!262907)))

(declare-fun lt!262910 () Unit!18080)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18080)

(assert (=> b!575345 (= lt!262910 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53874 lt!262908) (index!24985 lt!262908) (index!24985 lt!262908) mask!3119))))

(declare-fun b!575346 () Bool)

(declare-fun res!363761 () Bool)

(assert (=> b!575346 (=> (not res!363761) (not e!331041))))

(declare-fun arrayContainsKey!0 (array!35915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575346 (= res!363761 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575347 () Bool)

(declare-fun res!363757 () Bool)

(assert (=> b!575347 (=> (not res!363757) (not e!331039))))

(assert (=> b!575347 (= res!363757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575348 () Bool)

(declare-fun res!363754 () Bool)

(assert (=> b!575348 (=> (not res!363754) (not e!331041))))

(assert (=> b!575348 (= res!363754 (and (= (size!17604 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17604 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17604 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52770 res!363763) b!575348))

(assert (= (and b!575348 res!363754) b!575341))

(assert (= (and b!575341 res!363760) b!575343))

(assert (= (and b!575343 res!363759) b!575346))

(assert (= (and b!575346 res!363761) b!575340))

(assert (= (and b!575340 res!363764) b!575347))

(assert (= (and b!575347 res!363757) b!575339))

(assert (= (and b!575339 res!363758) b!575338))

(assert (= (and b!575338 res!363756) b!575337))

(assert (= (and b!575337 (not res!363753)) b!575344))

(assert (= (and b!575344 (not res!363755)) b!575342))

(assert (= (and b!575342 (not res!363762)) b!575345))

(declare-fun m!554157 () Bool)

(assert (=> b!575345 m!554157))

(declare-fun m!554159 () Bool)

(assert (=> b!575341 m!554159))

(assert (=> b!575341 m!554159))

(declare-fun m!554161 () Bool)

(assert (=> b!575341 m!554161))

(assert (=> b!575337 m!554159))

(assert (=> b!575337 m!554159))

(declare-fun m!554163 () Bool)

(assert (=> b!575337 m!554163))

(declare-fun m!554165 () Bool)

(assert (=> b!575337 m!554165))

(declare-fun m!554167 () Bool)

(assert (=> b!575337 m!554167))

(declare-fun m!554169 () Bool)

(assert (=> b!575347 m!554169))

(declare-fun m!554171 () Bool)

(assert (=> start!52770 m!554171))

(declare-fun m!554173 () Bool)

(assert (=> start!52770 m!554173))

(declare-fun m!554175 () Bool)

(assert (=> b!575343 m!554175))

(assert (=> b!575338 m!554159))

(declare-fun m!554177 () Bool)

(assert (=> b!575338 m!554177))

(declare-fun m!554179 () Bool)

(assert (=> b!575338 m!554179))

(declare-fun m!554181 () Bool)

(assert (=> b!575338 m!554181))

(assert (=> b!575338 m!554159))

(declare-fun m!554183 () Bool)

(assert (=> b!575338 m!554183))

(assert (=> b!575338 m!554159))

(declare-fun m!554185 () Bool)

(assert (=> b!575338 m!554185))

(declare-fun m!554187 () Bool)

(assert (=> b!575338 m!554187))

(declare-fun m!554189 () Bool)

(assert (=> b!575339 m!554189))

(declare-fun m!554191 () Bool)

(assert (=> b!575342 m!554191))

(assert (=> b!575342 m!554159))

(declare-fun m!554193 () Bool)

(assert (=> b!575342 m!554193))

(declare-fun m!554195 () Bool)

(assert (=> b!575342 m!554195))

(assert (=> b!575342 m!554187))

(assert (=> b!575342 m!554159))

(declare-fun m!554197 () Bool)

(assert (=> b!575342 m!554197))

(declare-fun m!554199 () Bool)

(assert (=> b!575346 m!554199))

(declare-fun m!554201 () Bool)

(assert (=> b!575340 m!554201))

(assert (=> b!575344 m!554159))

(declare-fun m!554203 () Bool)

(assert (=> b!575344 m!554203))

(push 1)

