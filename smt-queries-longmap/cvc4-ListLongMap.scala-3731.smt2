; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51384 () Bool)

(assert start!51384)

(declare-fun b!561179 () Bool)

(declare-fun e!323366 () Bool)

(declare-fun e!323367 () Bool)

(assert (=> b!561179 (= e!323366 e!323367)))

(declare-fun res!352339 () Bool)

(assert (=> b!561179 (=> (not res!352339) (not e!323367))))

(declare-datatypes ((SeekEntryResult!5374 0))(
  ( (MissingZero!5374 (index!23723 (_ BitVec 32))) (Found!5374 (index!23724 (_ BitVec 32))) (Intermediate!5374 (undefined!6186 Bool) (index!23725 (_ BitVec 32)) (x!52629 (_ BitVec 32))) (Undefined!5374) (MissingVacant!5374 (index!23726 (_ BitVec 32))) )
))
(declare-fun lt!255330 () SeekEntryResult!5374)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255334 () SeekEntryResult!5374)

(declare-datatypes ((array!35249 0))(
  ( (array!35250 (arr!16925 (Array (_ BitVec 32) (_ BitVec 64))) (size!17289 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35249)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35249 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!561179 (= res!352339 (= lt!255334 (seekKeyOrZeroReturnVacant!0 (x!52629 lt!255330) (index!23725 lt!255330) (index!23725 lt!255330) (select (arr!16925 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561180 () Bool)

(declare-fun res!352333 () Bool)

(declare-fun e!323361 () Bool)

(assert (=> b!561180 (=> (not res!352333) (not e!323361))))

(declare-datatypes ((List!11005 0))(
  ( (Nil!11002) (Cons!11001 (h!12004 (_ BitVec 64)) (t!17233 List!11005)) )
))
(declare-fun arrayNoDuplicates!0 (array!35249 (_ BitVec 32) List!11005) Bool)

(assert (=> b!561180 (= res!352333 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11002))))

(declare-fun b!561181 () Bool)

(declare-fun e!323362 () Bool)

(assert (=> b!561181 (= e!323362 e!323366)))

(declare-fun res!352338 () Bool)

(assert (=> b!561181 (=> res!352338 e!323366)))

(declare-fun lt!255336 () (_ BitVec 64))

(assert (=> b!561181 (= res!352338 (or (= lt!255336 (select (arr!16925 a!3118) j!142)) (= lt!255336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561181 (= lt!255336 (select (arr!16925 a!3118) (index!23725 lt!255330)))))

(declare-fun b!561182 () Bool)

(declare-fun res!352335 () Bool)

(assert (=> b!561182 (=> (not res!352335) (not e!323361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35249 (_ BitVec 32)) Bool)

(assert (=> b!561182 (= res!352335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561183 () Bool)

(declare-fun res!352331 () Bool)

(declare-fun e!323360 () Bool)

(assert (=> b!561183 (=> (not res!352331) (not e!323360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561183 (= res!352331 (validKeyInArray!0 (select (arr!16925 a!3118) j!142)))))

(declare-fun b!561184 () Bool)

(declare-fun e!323365 () Bool)

(assert (=> b!561184 (= e!323365 (not true))))

(declare-fun e!323364 () Bool)

(assert (=> b!561184 e!323364))

(declare-fun res!352342 () Bool)

(assert (=> b!561184 (=> (not res!352342) (not e!323364))))

(assert (=> b!561184 (= res!352342 (= lt!255334 (Found!5374 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35249 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!561184 (= lt!255334 (seekEntryOrOpen!0 (select (arr!16925 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561184 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17522 0))(
  ( (Unit!17523) )
))
(declare-fun lt!255329 () Unit!17522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17522)

(assert (=> b!561184 (= lt!255329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561185 () Bool)

(assert (=> b!561185 (= e!323360 e!323361)))

(declare-fun res!352341 () Bool)

(assert (=> b!561185 (=> (not res!352341) (not e!323361))))

(declare-fun lt!255337 () SeekEntryResult!5374)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561185 (= res!352341 (or (= lt!255337 (MissingZero!5374 i!1132)) (= lt!255337 (MissingVacant!5374 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!561185 (= lt!255337 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561186 () Bool)

(declare-fun res!352343 () Bool)

(assert (=> b!561186 (=> (not res!352343) (not e!323360))))

(assert (=> b!561186 (= res!352343 (and (= (size!17289 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17289 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17289 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561187 () Bool)

(assert (=> b!561187 (= e!323361 e!323365)))

(declare-fun res!352336 () Bool)

(assert (=> b!561187 (=> (not res!352336) (not e!323365))))

(declare-fun lt!255335 () array!35249)

(declare-fun lt!255332 () (_ BitVec 32))

(declare-fun lt!255331 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35249 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!561187 (= res!352336 (= lt!255330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255332 lt!255331 lt!255335 mask!3119)))))

(declare-fun lt!255333 () (_ BitVec 32))

(assert (=> b!561187 (= lt!255330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255333 (select (arr!16925 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561187 (= lt!255332 (toIndex!0 lt!255331 mask!3119))))

(assert (=> b!561187 (= lt!255331 (select (store (arr!16925 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561187 (= lt!255333 (toIndex!0 (select (arr!16925 a!3118) j!142) mask!3119))))

(assert (=> b!561187 (= lt!255335 (array!35250 (store (arr!16925 a!3118) i!1132 k!1914) (size!17289 a!3118)))))

(declare-fun b!561188 () Bool)

(declare-fun res!352334 () Bool)

(assert (=> b!561188 (=> (not res!352334) (not e!323360))))

(declare-fun arrayContainsKey!0 (array!35249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561188 (= res!352334 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561189 () Bool)

(declare-fun res!352340 () Bool)

(assert (=> b!561189 (=> (not res!352340) (not e!323360))))

(assert (=> b!561189 (= res!352340 (validKeyInArray!0 k!1914))))

(declare-fun b!561190 () Bool)

(assert (=> b!561190 (= e!323367 (= (seekEntryOrOpen!0 lt!255331 lt!255335 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52629 lt!255330) (index!23725 lt!255330) (index!23725 lt!255330) lt!255331 lt!255335 mask!3119)))))

(declare-fun b!561191 () Bool)

(assert (=> b!561191 (= e!323364 e!323362)))

(declare-fun res!352337 () Bool)

(assert (=> b!561191 (=> res!352337 e!323362)))

(assert (=> b!561191 (= res!352337 (or (undefined!6186 lt!255330) (not (is-Intermediate!5374 lt!255330))))))

(declare-fun res!352332 () Bool)

(assert (=> start!51384 (=> (not res!352332) (not e!323360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51384 (= res!352332 (validMask!0 mask!3119))))

(assert (=> start!51384 e!323360))

(assert (=> start!51384 true))

(declare-fun array_inv!12721 (array!35249) Bool)

(assert (=> start!51384 (array_inv!12721 a!3118)))

(assert (= (and start!51384 res!352332) b!561186))

(assert (= (and b!561186 res!352343) b!561183))

(assert (= (and b!561183 res!352331) b!561189))

(assert (= (and b!561189 res!352340) b!561188))

(assert (= (and b!561188 res!352334) b!561185))

(assert (= (and b!561185 res!352341) b!561182))

(assert (= (and b!561182 res!352335) b!561180))

(assert (= (and b!561180 res!352333) b!561187))

(assert (= (and b!561187 res!352336) b!561184))

(assert (= (and b!561184 res!352342) b!561191))

(assert (= (and b!561191 (not res!352337)) b!561181))

(assert (= (and b!561181 (not res!352338)) b!561179))

(assert (= (and b!561179 res!352339) b!561190))

(declare-fun m!539041 () Bool)

(assert (=> b!561184 m!539041))

(assert (=> b!561184 m!539041))

(declare-fun m!539043 () Bool)

(assert (=> b!561184 m!539043))

(declare-fun m!539045 () Bool)

(assert (=> b!561184 m!539045))

(declare-fun m!539047 () Bool)

(assert (=> b!561184 m!539047))

(declare-fun m!539049 () Bool)

(assert (=> b!561182 m!539049))

(declare-fun m!539051 () Bool)

(assert (=> b!561190 m!539051))

(declare-fun m!539053 () Bool)

(assert (=> b!561190 m!539053))

(declare-fun m!539055 () Bool)

(assert (=> start!51384 m!539055))

(declare-fun m!539057 () Bool)

(assert (=> start!51384 m!539057))

(assert (=> b!561183 m!539041))

(assert (=> b!561183 m!539041))

(declare-fun m!539059 () Bool)

(assert (=> b!561183 m!539059))

(assert (=> b!561181 m!539041))

(declare-fun m!539061 () Bool)

(assert (=> b!561181 m!539061))

(declare-fun m!539063 () Bool)

(assert (=> b!561180 m!539063))

(declare-fun m!539065 () Bool)

(assert (=> b!561189 m!539065))

(declare-fun m!539067 () Bool)

(assert (=> b!561185 m!539067))

(assert (=> b!561187 m!539041))

(declare-fun m!539069 () Bool)

(assert (=> b!561187 m!539069))

(assert (=> b!561187 m!539041))

(declare-fun m!539071 () Bool)

(assert (=> b!561187 m!539071))

(declare-fun m!539073 () Bool)

(assert (=> b!561187 m!539073))

(declare-fun m!539075 () Bool)

(assert (=> b!561187 m!539075))

(declare-fun m!539077 () Bool)

(assert (=> b!561187 m!539077))

(assert (=> b!561187 m!539041))

(declare-fun m!539079 () Bool)

(assert (=> b!561187 m!539079))

(assert (=> b!561179 m!539041))

(assert (=> b!561179 m!539041))

(declare-fun m!539081 () Bool)

(assert (=> b!561179 m!539081))

(declare-fun m!539083 () Bool)

(assert (=> b!561188 m!539083))

(push 1)

