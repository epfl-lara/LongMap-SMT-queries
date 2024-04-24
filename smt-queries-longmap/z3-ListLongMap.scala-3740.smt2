; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51480 () Bool)

(assert start!51480)

(declare-fun b!562354 () Bool)

(declare-fun e!324096 () Bool)

(assert (=> b!562354 (= e!324096 (not true))))

(declare-fun e!324090 () Bool)

(assert (=> b!562354 e!324090))

(declare-fun res!353412 () Bool)

(assert (=> b!562354 (=> (not res!353412) (not e!324090))))

(declare-datatypes ((SeekEntryResult!5350 0))(
  ( (MissingZero!5350 (index!23627 (_ BitVec 32))) (Found!5350 (index!23628 (_ BitVec 32))) (Intermediate!5350 (undefined!6162 Bool) (index!23629 (_ BitVec 32)) (x!52680 (_ BitVec 32))) (Undefined!5350) (MissingVacant!5350 (index!23630 (_ BitVec 32))) )
))
(declare-fun lt!256122 () SeekEntryResult!5350)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562354 (= res!353412 (= lt!256122 (Found!5350 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35292 0))(
  ( (array!35293 (arr!16945 (Array (_ BitVec 32) (_ BitVec 64))) (size!17309 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35292)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35292 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!562354 (= lt!256122 (seekEntryOrOpen!0 (select (arr!16945 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35292 (_ BitVec 32)) Bool)

(assert (=> b!562354 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17545 0))(
  ( (Unit!17546) )
))
(declare-fun lt!256119 () Unit!17545)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17545)

(assert (=> b!562354 (= lt!256119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562355 () Bool)

(declare-fun e!324091 () Bool)

(assert (=> b!562355 (= e!324091 e!324096)))

(declare-fun res!353403 () Bool)

(assert (=> b!562355 (=> (not res!353403) (not e!324096))))

(declare-fun lt!256117 () (_ BitVec 64))

(declare-fun lt!256121 () array!35292)

(declare-fun lt!256115 () SeekEntryResult!5350)

(declare-fun lt!256116 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35292 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!562355 (= res!353403 (= lt!256115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256116 lt!256117 lt!256121 mask!3119)))))

(declare-fun lt!256118 () (_ BitVec 32))

(assert (=> b!562355 (= lt!256115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256118 (select (arr!16945 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562355 (= lt!256116 (toIndex!0 lt!256117 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562355 (= lt!256117 (select (store (arr!16945 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562355 (= lt!256118 (toIndex!0 (select (arr!16945 a!3118) j!142) mask!3119))))

(assert (=> b!562355 (= lt!256121 (array!35293 (store (arr!16945 a!3118) i!1132 k0!1914) (size!17309 a!3118)))))

(declare-fun e!324092 () Bool)

(declare-fun b!562356 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35292 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!562356 (= e!324092 (= (seekEntryOrOpen!0 lt!256117 lt!256121 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52680 lt!256115) (index!23629 lt!256115) (index!23629 lt!256115) lt!256117 lt!256121 mask!3119)))))

(declare-fun b!562357 () Bool)

(declare-fun e!324089 () Bool)

(assert (=> b!562357 (= e!324090 e!324089)))

(declare-fun res!353409 () Bool)

(assert (=> b!562357 (=> res!353409 e!324089)))

(get-info :version)

(assert (=> b!562357 (= res!353409 (or (undefined!6162 lt!256115) (not ((_ is Intermediate!5350) lt!256115))))))

(declare-fun b!562358 () Bool)

(declare-fun res!353407 () Bool)

(declare-fun e!324094 () Bool)

(assert (=> b!562358 (=> (not res!353407) (not e!324094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562358 (= res!353407 (validKeyInArray!0 k0!1914))))

(declare-fun b!562359 () Bool)

(declare-fun e!324095 () Bool)

(assert (=> b!562359 (= e!324089 e!324095)))

(declare-fun res!353405 () Bool)

(assert (=> b!562359 (=> res!353405 e!324095)))

(declare-fun lt!256120 () (_ BitVec 64))

(assert (=> b!562359 (= res!353405 (or (= lt!256120 (select (arr!16945 a!3118) j!142)) (= lt!256120 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562359 (= lt!256120 (select (arr!16945 a!3118) (index!23629 lt!256115)))))

(declare-fun res!353404 () Bool)

(assert (=> start!51480 (=> (not res!353404) (not e!324094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51480 (= res!353404 (validMask!0 mask!3119))))

(assert (=> start!51480 e!324094))

(assert (=> start!51480 true))

(declare-fun array_inv!12804 (array!35292) Bool)

(assert (=> start!51480 (array_inv!12804 a!3118)))

(declare-fun b!562360 () Bool)

(assert (=> b!562360 (= e!324095 e!324092)))

(declare-fun res!353413 () Bool)

(assert (=> b!562360 (=> (not res!353413) (not e!324092))))

(assert (=> b!562360 (= res!353413 (= lt!256122 (seekKeyOrZeroReturnVacant!0 (x!52680 lt!256115) (index!23629 lt!256115) (index!23629 lt!256115) (select (arr!16945 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562361 () Bool)

(declare-fun res!353406 () Bool)

(assert (=> b!562361 (=> (not res!353406) (not e!324091))))

(assert (=> b!562361 (= res!353406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562362 () Bool)

(declare-fun res!353411 () Bool)

(assert (=> b!562362 (=> (not res!353411) (not e!324094))))

(declare-fun arrayContainsKey!0 (array!35292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562362 (= res!353411 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562363 () Bool)

(declare-fun res!353408 () Bool)

(assert (=> b!562363 (=> (not res!353408) (not e!324094))))

(assert (=> b!562363 (= res!353408 (validKeyInArray!0 (select (arr!16945 a!3118) j!142)))))

(declare-fun b!562364 () Bool)

(assert (=> b!562364 (= e!324094 e!324091)))

(declare-fun res!353402 () Bool)

(assert (=> b!562364 (=> (not res!353402) (not e!324091))))

(declare-fun lt!256123 () SeekEntryResult!5350)

(assert (=> b!562364 (= res!353402 (or (= lt!256123 (MissingZero!5350 i!1132)) (= lt!256123 (MissingVacant!5350 i!1132))))))

(assert (=> b!562364 (= lt!256123 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562365 () Bool)

(declare-fun res!353401 () Bool)

(assert (=> b!562365 (=> (not res!353401) (not e!324094))))

(assert (=> b!562365 (= res!353401 (and (= (size!17309 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17309 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17309 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562366 () Bool)

(declare-fun res!353410 () Bool)

(assert (=> b!562366 (=> (not res!353410) (not e!324091))))

(declare-datatypes ((List!10932 0))(
  ( (Nil!10929) (Cons!10928 (h!11934 (_ BitVec 64)) (t!17152 List!10932)) )
))
(declare-fun arrayNoDuplicates!0 (array!35292 (_ BitVec 32) List!10932) Bool)

(assert (=> b!562366 (= res!353410 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10929))))

(assert (= (and start!51480 res!353404) b!562365))

(assert (= (and b!562365 res!353401) b!562363))

(assert (= (and b!562363 res!353408) b!562358))

(assert (= (and b!562358 res!353407) b!562362))

(assert (= (and b!562362 res!353411) b!562364))

(assert (= (and b!562364 res!353402) b!562361))

(assert (= (and b!562361 res!353406) b!562366))

(assert (= (and b!562366 res!353410) b!562355))

(assert (= (and b!562355 res!353403) b!562354))

(assert (= (and b!562354 res!353412) b!562357))

(assert (= (and b!562357 (not res!353409)) b!562359))

(assert (= (and b!562359 (not res!353405)) b!562360))

(assert (= (and b!562360 res!353413) b!562356))

(declare-fun m!540479 () Bool)

(assert (=> b!562363 m!540479))

(assert (=> b!562363 m!540479))

(declare-fun m!540481 () Bool)

(assert (=> b!562363 m!540481))

(declare-fun m!540483 () Bool)

(assert (=> start!51480 m!540483))

(declare-fun m!540485 () Bool)

(assert (=> start!51480 m!540485))

(assert (=> b!562354 m!540479))

(assert (=> b!562354 m!540479))

(declare-fun m!540487 () Bool)

(assert (=> b!562354 m!540487))

(declare-fun m!540489 () Bool)

(assert (=> b!562354 m!540489))

(declare-fun m!540491 () Bool)

(assert (=> b!562354 m!540491))

(assert (=> b!562360 m!540479))

(assert (=> b!562360 m!540479))

(declare-fun m!540493 () Bool)

(assert (=> b!562360 m!540493))

(declare-fun m!540495 () Bool)

(assert (=> b!562355 m!540495))

(assert (=> b!562355 m!540479))

(declare-fun m!540497 () Bool)

(assert (=> b!562355 m!540497))

(declare-fun m!540499 () Bool)

(assert (=> b!562355 m!540499))

(declare-fun m!540501 () Bool)

(assert (=> b!562355 m!540501))

(assert (=> b!562355 m!540479))

(declare-fun m!540503 () Bool)

(assert (=> b!562355 m!540503))

(assert (=> b!562355 m!540479))

(declare-fun m!540505 () Bool)

(assert (=> b!562355 m!540505))

(declare-fun m!540507 () Bool)

(assert (=> b!562361 m!540507))

(declare-fun m!540509 () Bool)

(assert (=> b!562362 m!540509))

(declare-fun m!540511 () Bool)

(assert (=> b!562358 m!540511))

(declare-fun m!540513 () Bool)

(assert (=> b!562356 m!540513))

(declare-fun m!540515 () Bool)

(assert (=> b!562356 m!540515))

(declare-fun m!540517 () Bool)

(assert (=> b!562364 m!540517))

(declare-fun m!540519 () Bool)

(assert (=> b!562366 m!540519))

(assert (=> b!562359 m!540479))

(declare-fun m!540521 () Bool)

(assert (=> b!562359 m!540521))

(check-sat (not b!562362) (not b!562356) (not b!562361) (not b!562360) (not start!51480) (not b!562363) (not b!562354) (not b!562364) (not b!562358) (not b!562366) (not b!562355))
(check-sat)
