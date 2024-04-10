; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52776 () Bool)

(assert start!52776)

(declare-fun b!575445 () Bool)

(declare-fun e!331102 () Bool)

(declare-fun e!331105 () Bool)

(assert (=> b!575445 (= e!331102 e!331105)))

(declare-fun res!363862 () Bool)

(assert (=> b!575445 (=> res!363862 e!331105)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35921 0))(
  ( (array!35922 (arr!17243 (Array (_ BitVec 32) (_ BitVec 64))) (size!17607 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35921)

(declare-fun lt!263043 () (_ BitVec 64))

(assert (=> b!575445 (= res!363862 (or (= lt!263043 (select (arr!17243 a!3118) j!142)) (= lt!263043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5692 0))(
  ( (MissingZero!5692 (index!24995 (_ BitVec 32))) (Found!5692 (index!24996 (_ BitVec 32))) (Intermediate!5692 (undefined!6504 Bool) (index!24997 (_ BitVec 32)) (x!53885 (_ BitVec 32))) (Undefined!5692) (MissingVacant!5692 (index!24998 (_ BitVec 32))) )
))
(declare-fun lt!263042 () SeekEntryResult!5692)

(assert (=> b!575445 (= lt!263043 (select (arr!17243 a!3118) (index!24997 lt!263042)))))

(declare-fun b!575446 () Bool)

(declare-fun res!363864 () Bool)

(declare-fun e!331103 () Bool)

(assert (=> b!575446 (=> (not res!363864) (not e!331103))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575446 (= res!363864 (validKeyInArray!0 k!1914))))

(declare-fun b!575447 () Bool)

(declare-fun res!363871 () Bool)

(assert (=> b!575447 (=> (not res!363871) (not e!331103))))

(assert (=> b!575447 (= res!363871 (validKeyInArray!0 (select (arr!17243 a!3118) j!142)))))

(declare-fun b!575448 () Bool)

(declare-fun e!331101 () Bool)

(declare-fun e!331107 () Bool)

(assert (=> b!575448 (= e!331101 e!331107)))

(declare-fun res!363868 () Bool)

(assert (=> b!575448 (=> (not res!363868) (not e!331107))))

(declare-fun lt!263041 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!263040 () array!35921)

(declare-fun lt!263044 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35921 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!575448 (= res!363868 (= lt!263042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263041 lt!263044 lt!263040 mask!3119)))))

(declare-fun lt!263036 () (_ BitVec 32))

(assert (=> b!575448 (= lt!263042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263036 (select (arr!17243 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575448 (= lt!263041 (toIndex!0 lt!263044 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575448 (= lt!263044 (select (store (arr!17243 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575448 (= lt!263036 (toIndex!0 (select (arr!17243 a!3118) j!142) mask!3119))))

(assert (=> b!575448 (= lt!263040 (array!35922 (store (arr!17243 a!3118) i!1132 k!1914) (size!17607 a!3118)))))

(declare-fun res!363869 () Bool)

(assert (=> start!52776 (=> (not res!363869) (not e!331103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52776 (= res!363869 (validMask!0 mask!3119))))

(assert (=> start!52776 e!331103))

(assert (=> start!52776 true))

(declare-fun array_inv!13039 (array!35921) Bool)

(assert (=> start!52776 (array_inv!13039 a!3118)))

(declare-fun b!575449 () Bool)

(declare-fun res!363865 () Bool)

(assert (=> b!575449 (=> (not res!363865) (not e!331103))))

(assert (=> b!575449 (= res!363865 (and (= (size!17607 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17607 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17607 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575450 () Bool)

(declare-fun e!331106 () Bool)

(assert (=> b!575450 (= e!331106 true)))

(declare-fun lt!263032 () SeekEntryResult!5692)

(declare-fun lt!263033 () SeekEntryResult!5692)

(assert (=> b!575450 (= lt!263032 lt!263033)))

(declare-datatypes ((Unit!18086 0))(
  ( (Unit!18087) )
))
(declare-fun lt!263031 () Unit!18086)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18086)

(assert (=> b!575450 (= lt!263031 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53885 lt!263042) (index!24997 lt!263042) (index!24997 lt!263042) mask!3119))))

(declare-fun b!575451 () Bool)

(assert (=> b!575451 (= e!331107 (not e!331102))))

(declare-fun res!363870 () Bool)

(assert (=> b!575451 (=> res!363870 e!331102)))

(assert (=> b!575451 (= res!363870 (or (undefined!6504 lt!263042) (not (is-Intermediate!5692 lt!263042))))))

(declare-fun lt!263034 () SeekEntryResult!5692)

(declare-fun lt!263035 () SeekEntryResult!5692)

(assert (=> b!575451 (= lt!263034 lt!263035)))

(assert (=> b!575451 (= lt!263035 (Found!5692 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35921 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!575451 (= lt!263034 (seekEntryOrOpen!0 (select (arr!17243 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35921 (_ BitVec 32)) Bool)

(assert (=> b!575451 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263037 () Unit!18086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18086)

(assert (=> b!575451 (= lt!263037 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575452 () Bool)

(declare-fun res!363867 () Bool)

(assert (=> b!575452 (=> (not res!363867) (not e!331103))))

(declare-fun arrayContainsKey!0 (array!35921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575452 (= res!363867 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575453 () Bool)

(declare-fun res!363863 () Bool)

(assert (=> b!575453 (=> (not res!363863) (not e!331101))))

(assert (=> b!575453 (= res!363863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575454 () Bool)

(assert (=> b!575454 (= e!331103 e!331101)))

(declare-fun res!363866 () Bool)

(assert (=> b!575454 (=> (not res!363866) (not e!331101))))

(declare-fun lt!263039 () SeekEntryResult!5692)

(assert (=> b!575454 (= res!363866 (or (= lt!263039 (MissingZero!5692 i!1132)) (= lt!263039 (MissingVacant!5692 i!1132))))))

(assert (=> b!575454 (= lt!263039 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575455 () Bool)

(declare-fun res!363872 () Bool)

(assert (=> b!575455 (=> (not res!363872) (not e!331101))))

(declare-datatypes ((List!11323 0))(
  ( (Nil!11320) (Cons!11319 (h!12358 (_ BitVec 64)) (t!17551 List!11323)) )
))
(declare-fun arrayNoDuplicates!0 (array!35921 (_ BitVec 32) List!11323) Bool)

(assert (=> b!575455 (= res!363872 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11320))))

(declare-fun b!575456 () Bool)

(assert (=> b!575456 (= e!331105 e!331106)))

(declare-fun res!363861 () Bool)

(assert (=> b!575456 (=> res!363861 e!331106)))

(assert (=> b!575456 (= res!363861 (or (bvslt (index!24997 lt!263042) #b00000000000000000000000000000000) (bvsge (index!24997 lt!263042) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53885 lt!263042) #b01111111111111111111111111111110) (bvslt (x!53885 lt!263042) #b00000000000000000000000000000000) (not (= lt!263043 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17243 a!3118) i!1132 k!1914) (index!24997 lt!263042)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263032 lt!263035))))))

(declare-fun lt!263038 () SeekEntryResult!5692)

(assert (=> b!575456 (= lt!263038 lt!263033)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35921 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!575456 (= lt!263033 (seekKeyOrZeroReturnVacant!0 (x!53885 lt!263042) (index!24997 lt!263042) (index!24997 lt!263042) lt!263044 lt!263040 mask!3119))))

(assert (=> b!575456 (= lt!263038 (seekEntryOrOpen!0 lt!263044 lt!263040 mask!3119))))

(assert (=> b!575456 (= lt!263034 lt!263032)))

(assert (=> b!575456 (= lt!263032 (seekKeyOrZeroReturnVacant!0 (x!53885 lt!263042) (index!24997 lt!263042) (index!24997 lt!263042) (select (arr!17243 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and start!52776 res!363869) b!575449))

(assert (= (and b!575449 res!363865) b!575447))

(assert (= (and b!575447 res!363871) b!575446))

(assert (= (and b!575446 res!363864) b!575452))

(assert (= (and b!575452 res!363867) b!575454))

(assert (= (and b!575454 res!363866) b!575453))

(assert (= (and b!575453 res!363863) b!575455))

(assert (= (and b!575455 res!363872) b!575448))

(assert (= (and b!575448 res!363868) b!575451))

(assert (= (and b!575451 (not res!363870)) b!575445))

(assert (= (and b!575445 (not res!363862)) b!575456))

(assert (= (and b!575456 (not res!363861)) b!575450))

(declare-fun m!554301 () Bool)

(assert (=> b!575451 m!554301))

(assert (=> b!575451 m!554301))

(declare-fun m!554303 () Bool)

(assert (=> b!575451 m!554303))

(declare-fun m!554305 () Bool)

(assert (=> b!575451 m!554305))

(declare-fun m!554307 () Bool)

(assert (=> b!575451 m!554307))

(declare-fun m!554309 () Bool)

(assert (=> b!575453 m!554309))

(declare-fun m!554311 () Bool)

(assert (=> b!575454 m!554311))

(declare-fun m!554313 () Bool)

(assert (=> b!575455 m!554313))

(declare-fun m!554315 () Bool)

(assert (=> b!575452 m!554315))

(declare-fun m!554317 () Bool)

(assert (=> b!575456 m!554317))

(assert (=> b!575456 m!554301))

(declare-fun m!554319 () Bool)

(assert (=> b!575456 m!554319))

(declare-fun m!554321 () Bool)

(assert (=> b!575456 m!554321))

(declare-fun m!554323 () Bool)

(assert (=> b!575456 m!554323))

(assert (=> b!575456 m!554301))

(declare-fun m!554325 () Bool)

(assert (=> b!575456 m!554325))

(declare-fun m!554327 () Bool)

(assert (=> start!52776 m!554327))

(declare-fun m!554329 () Bool)

(assert (=> start!52776 m!554329))

(assert (=> b!575447 m!554301))

(assert (=> b!575447 m!554301))

(declare-fun m!554331 () Bool)

(assert (=> b!575447 m!554331))

(declare-fun m!554333 () Bool)

(assert (=> b!575446 m!554333))

(declare-fun m!554335 () Bool)

(assert (=> b!575450 m!554335))

(assert (=> b!575445 m!554301))

(declare-fun m!554337 () Bool)

(assert (=> b!575445 m!554337))

(declare-fun m!554339 () Bool)

(assert (=> b!575448 m!554339))

(assert (=> b!575448 m!554301))

(declare-fun m!554341 () Bool)

(assert (=> b!575448 m!554341))

(assert (=> b!575448 m!554301))

(declare-fun m!554343 () Bool)

(assert (=> b!575448 m!554343))

(assert (=> b!575448 m!554301))

(declare-fun m!554345 () Bool)

(assert (=> b!575448 m!554345))

(assert (=> b!575448 m!554323))

(declare-fun m!554347 () Bool)

(assert (=> b!575448 m!554347))

(push 1)

