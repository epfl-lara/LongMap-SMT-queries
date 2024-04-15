; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51074 () Bool)

(assert start!51074)

(declare-fun b!558018 () Bool)

(declare-fun res!350028 () Bool)

(declare-fun e!321442 () Bool)

(assert (=> b!558018 (=> (not res!350028) (not e!321442))))

(declare-datatypes ((array!35137 0))(
  ( (array!35138 (arr!16874 (Array (_ BitVec 32) (_ BitVec 64))) (size!17239 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35137)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558018 (= res!350028 (validKeyInArray!0 (select (arr!16874 a!3118) j!142)))))

(declare-fun b!558019 () Bool)

(declare-fun res!350031 () Bool)

(assert (=> b!558019 (=> (not res!350031) (not e!321442))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558019 (= res!350031 (and (= (size!17239 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17239 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17239 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558020 () Bool)

(declare-fun e!321444 () Bool)

(declare-fun e!321445 () Bool)

(assert (=> b!558020 (= e!321444 e!321445)))

(declare-fun res!350025 () Bool)

(assert (=> b!558020 (=> res!350025 e!321445)))

(declare-datatypes ((SeekEntryResult!5320 0))(
  ( (MissingZero!5320 (index!23507 (_ BitVec 32))) (Found!5320 (index!23508 (_ BitVec 32))) (Intermediate!5320 (undefined!6132 Bool) (index!23509 (_ BitVec 32)) (x!52415 (_ BitVec 32))) (Undefined!5320) (MissingVacant!5320 (index!23510 (_ BitVec 32))) )
))
(declare-fun lt!253460 () SeekEntryResult!5320)

(get-info :version)

(assert (=> b!558020 (= res!350025 (or (undefined!6132 lt!253460) (not ((_ is Intermediate!5320) lt!253460)) (= (select (arr!16874 a!3118) (index!23509 lt!253460)) (select (arr!16874 a!3118) j!142)) (= (select (arr!16874 a!3118) (index!23509 lt!253460)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!350027 () Bool)

(assert (=> start!51074 (=> (not res!350027) (not e!321442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51074 (= res!350027 (validMask!0 mask!3119))))

(assert (=> start!51074 e!321442))

(assert (=> start!51074 true))

(declare-fun array_inv!12757 (array!35137) Bool)

(assert (=> start!51074 (array_inv!12757 a!3118)))

(declare-fun b!558021 () Bool)

(declare-fun e!321443 () Bool)

(declare-fun e!321446 () Bool)

(assert (=> b!558021 (= e!321443 e!321446)))

(declare-fun res!350030 () Bool)

(assert (=> b!558021 (=> (not res!350030) (not e!321446))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!253463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35137 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!558021 (= res!350030 (= lt!253460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253463 (select (store (arr!16874 a!3118) i!1132 k0!1914) j!142) (array!35138 (store (arr!16874 a!3118) i!1132 k0!1914) (size!17239 a!3118)) mask!3119)))))

(declare-fun lt!253465 () (_ BitVec 32))

(assert (=> b!558021 (= lt!253460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253465 (select (arr!16874 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558021 (= lt!253463 (toIndex!0 (select (store (arr!16874 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558021 (= lt!253465 (toIndex!0 (select (arr!16874 a!3118) j!142) mask!3119))))

(declare-fun b!558022 () Bool)

(assert (=> b!558022 (= e!321442 e!321443)))

(declare-fun res!350029 () Bool)

(assert (=> b!558022 (=> (not res!350029) (not e!321443))))

(declare-fun lt!253464 () SeekEntryResult!5320)

(assert (=> b!558022 (= res!350029 (or (= lt!253464 (MissingZero!5320 i!1132)) (= lt!253464 (MissingVacant!5320 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35137 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!558022 (= lt!253464 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558023 () Bool)

(declare-fun res!350033 () Bool)

(assert (=> b!558023 (=> (not res!350033) (not e!321442))))

(assert (=> b!558023 (= res!350033 (validKeyInArray!0 k0!1914))))

(declare-fun b!558024 () Bool)

(declare-fun res!350024 () Bool)

(assert (=> b!558024 (=> (not res!350024) (not e!321443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35137 (_ BitVec 32)) Bool)

(assert (=> b!558024 (= res!350024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558025 () Bool)

(declare-fun res!350032 () Bool)

(assert (=> b!558025 (=> (not res!350032) (not e!321442))))

(declare-fun arrayContainsKey!0 (array!35137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558025 (= res!350032 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558026 () Bool)

(declare-fun res!350026 () Bool)

(assert (=> b!558026 (=> (not res!350026) (not e!321443))))

(declare-datatypes ((List!10993 0))(
  ( (Nil!10990) (Cons!10989 (h!11983 (_ BitVec 64)) (t!17212 List!10993)) )
))
(declare-fun arrayNoDuplicates!0 (array!35137 (_ BitVec 32) List!10993) Bool)

(assert (=> b!558026 (= res!350026 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10990))))

(declare-fun b!558027 () Bool)

(assert (=> b!558027 (= e!321446 (not true))))

(assert (=> b!558027 e!321444))

(declare-fun res!350023 () Bool)

(assert (=> b!558027 (=> (not res!350023) (not e!321444))))

(declare-fun lt!253461 () SeekEntryResult!5320)

(assert (=> b!558027 (= res!350023 (= lt!253461 (Found!5320 j!142)))))

(assert (=> b!558027 (= lt!253461 (seekEntryOrOpen!0 (select (arr!16874 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558027 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17400 0))(
  ( (Unit!17401) )
))
(declare-fun lt!253462 () Unit!17400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17400)

(assert (=> b!558027 (= lt!253462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558028 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35137 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!558028 (= e!321445 (= lt!253461 (seekKeyOrZeroReturnVacant!0 (x!52415 lt!253460) (index!23509 lt!253460) (index!23509 lt!253460) (select (arr!16874 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51074 res!350027) b!558019))

(assert (= (and b!558019 res!350031) b!558018))

(assert (= (and b!558018 res!350028) b!558023))

(assert (= (and b!558023 res!350033) b!558025))

(assert (= (and b!558025 res!350032) b!558022))

(assert (= (and b!558022 res!350029) b!558024))

(assert (= (and b!558024 res!350024) b!558026))

(assert (= (and b!558026 res!350026) b!558021))

(assert (= (and b!558021 res!350030) b!558027))

(assert (= (and b!558027 res!350023) b!558020))

(assert (= (and b!558020 (not res!350025)) b!558028))

(declare-fun m!535463 () Bool)

(assert (=> b!558027 m!535463))

(assert (=> b!558027 m!535463))

(declare-fun m!535465 () Bool)

(assert (=> b!558027 m!535465))

(declare-fun m!535467 () Bool)

(assert (=> b!558027 m!535467))

(declare-fun m!535469 () Bool)

(assert (=> b!558027 m!535469))

(declare-fun m!535471 () Bool)

(assert (=> b!558024 m!535471))

(declare-fun m!535473 () Bool)

(assert (=> b!558023 m!535473))

(assert (=> b!558018 m!535463))

(assert (=> b!558018 m!535463))

(declare-fun m!535475 () Bool)

(assert (=> b!558018 m!535475))

(declare-fun m!535477 () Bool)

(assert (=> b!558025 m!535477))

(assert (=> b!558028 m!535463))

(assert (=> b!558028 m!535463))

(declare-fun m!535479 () Bool)

(assert (=> b!558028 m!535479))

(assert (=> b!558021 m!535463))

(declare-fun m!535481 () Bool)

(assert (=> b!558021 m!535481))

(declare-fun m!535483 () Bool)

(assert (=> b!558021 m!535483))

(declare-fun m!535485 () Bool)

(assert (=> b!558021 m!535485))

(assert (=> b!558021 m!535483))

(declare-fun m!535487 () Bool)

(assert (=> b!558021 m!535487))

(assert (=> b!558021 m!535483))

(declare-fun m!535489 () Bool)

(assert (=> b!558021 m!535489))

(assert (=> b!558021 m!535463))

(declare-fun m!535491 () Bool)

(assert (=> b!558021 m!535491))

(assert (=> b!558021 m!535463))

(declare-fun m!535493 () Bool)

(assert (=> b!558022 m!535493))

(declare-fun m!535495 () Bool)

(assert (=> b!558026 m!535495))

(declare-fun m!535497 () Bool)

(assert (=> start!51074 m!535497))

(declare-fun m!535499 () Bool)

(assert (=> start!51074 m!535499))

(declare-fun m!535501 () Bool)

(assert (=> b!558020 m!535501))

(assert (=> b!558020 m!535463))

(check-sat (not start!51074) (not b!558018) (not b!558025) (not b!558027) (not b!558022) (not b!558021) (not b!558024) (not b!558028) (not b!558026) (not b!558023))
(check-sat)
