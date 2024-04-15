; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51386 () Bool)

(assert start!51386)

(declare-fun b!561181 () Bool)

(declare-fun res!352480 () Bool)

(declare-fun e!323354 () Bool)

(assert (=> b!561181 (=> (not res!352480) (not e!323354))))

(declare-datatypes ((array!35260 0))(
  ( (array!35261 (arr!16931 (Array (_ BitVec 32) (_ BitVec 64))) (size!17296 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35260)

(declare-datatypes ((List!11050 0))(
  ( (Nil!11047) (Cons!11046 (h!12049 (_ BitVec 64)) (t!17269 List!11050)) )
))
(declare-fun arrayNoDuplicates!0 (array!35260 (_ BitVec 32) List!11050) Bool)

(assert (=> b!561181 (= res!352480 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11047))))

(declare-fun b!561182 () Bool)

(declare-fun res!352486 () Bool)

(declare-fun e!323361 () Bool)

(assert (=> b!561182 (=> (not res!352486) (not e!323361))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561182 (= res!352486 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561183 () Bool)

(declare-fun e!323356 () Bool)

(declare-fun e!323357 () Bool)

(assert (=> b!561183 (= e!323356 e!323357)))

(declare-fun res!352479 () Bool)

(assert (=> b!561183 (=> res!352479 e!323357)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255292 () (_ BitVec 64))

(assert (=> b!561183 (= res!352479 (or (= lt!255292 (select (arr!16931 a!3118) j!142)) (= lt!255292 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5377 0))(
  ( (MissingZero!5377 (index!23735 (_ BitVec 32))) (Found!5377 (index!23736 (_ BitVec 32))) (Intermediate!5377 (undefined!6189 Bool) (index!23737 (_ BitVec 32)) (x!52651 (_ BitVec 32))) (Undefined!5377) (MissingVacant!5377 (index!23738 (_ BitVec 32))) )
))
(declare-fun lt!255287 () SeekEntryResult!5377)

(assert (=> b!561183 (= lt!255292 (select (arr!16931 a!3118) (index!23737 lt!255287)))))

(declare-fun b!561184 () Bool)

(declare-fun e!323355 () Bool)

(assert (=> b!561184 (= e!323355 e!323356)))

(declare-fun res!352482 () Bool)

(assert (=> b!561184 (=> res!352482 e!323356)))

(get-info :version)

(assert (=> b!561184 (= res!352482 (or (undefined!6189 lt!255287) (not ((_ is Intermediate!5377) lt!255287))))))

(declare-fun b!561185 () Bool)

(declare-fun e!323358 () Bool)

(assert (=> b!561185 (= e!323358 (not true))))

(assert (=> b!561185 e!323355))

(declare-fun res!352483 () Bool)

(assert (=> b!561185 (=> (not res!352483) (not e!323355))))

(declare-fun lt!255289 () SeekEntryResult!5377)

(assert (=> b!561185 (= res!352483 (= lt!255289 (Found!5377 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35260 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!561185 (= lt!255289 (seekEntryOrOpen!0 (select (arr!16931 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35260 (_ BitVec 32)) Bool)

(assert (=> b!561185 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17514 0))(
  ( (Unit!17515) )
))
(declare-fun lt!255285 () Unit!17514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17514)

(assert (=> b!561185 (= lt!255285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!352484 () Bool)

(assert (=> start!51386 (=> (not res!352484) (not e!323361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51386 (= res!352484 (validMask!0 mask!3119))))

(assert (=> start!51386 e!323361))

(assert (=> start!51386 true))

(declare-fun array_inv!12814 (array!35260) Bool)

(assert (=> start!51386 (array_inv!12814 a!3118)))

(declare-fun b!561186 () Bool)

(declare-fun res!352476 () Bool)

(assert (=> b!561186 (=> (not res!352476) (not e!323361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561186 (= res!352476 (validKeyInArray!0 (select (arr!16931 a!3118) j!142)))))

(declare-fun b!561187 () Bool)

(assert (=> b!561187 (= e!323361 e!323354)))

(declare-fun res!352485 () Bool)

(assert (=> b!561187 (=> (not res!352485) (not e!323354))))

(declare-fun lt!255288 () SeekEntryResult!5377)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561187 (= res!352485 (or (= lt!255288 (MissingZero!5377 i!1132)) (= lt!255288 (MissingVacant!5377 i!1132))))))

(assert (=> b!561187 (= lt!255288 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561188 () Bool)

(assert (=> b!561188 (= e!323354 e!323358)))

(declare-fun res!352481 () Bool)

(assert (=> b!561188 (=> (not res!352481) (not e!323358))))

(declare-fun lt!255284 () (_ BitVec 32))

(declare-fun lt!255286 () (_ BitVec 64))

(declare-fun lt!255290 () array!35260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35260 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!561188 (= res!352481 (= lt!255287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255284 lt!255286 lt!255290 mask!3119)))))

(declare-fun lt!255291 () (_ BitVec 32))

(assert (=> b!561188 (= lt!255287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255291 (select (arr!16931 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561188 (= lt!255284 (toIndex!0 lt!255286 mask!3119))))

(assert (=> b!561188 (= lt!255286 (select (store (arr!16931 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561188 (= lt!255291 (toIndex!0 (select (arr!16931 a!3118) j!142) mask!3119))))

(assert (=> b!561188 (= lt!255290 (array!35261 (store (arr!16931 a!3118) i!1132 k0!1914) (size!17296 a!3118)))))

(declare-fun b!561189 () Bool)

(declare-fun res!352487 () Bool)

(assert (=> b!561189 (=> (not res!352487) (not e!323361))))

(assert (=> b!561189 (= res!352487 (validKeyInArray!0 k0!1914))))

(declare-fun b!561190 () Bool)

(declare-fun e!323359 () Bool)

(assert (=> b!561190 (= e!323357 e!323359)))

(declare-fun res!352477 () Bool)

(assert (=> b!561190 (=> (not res!352477) (not e!323359))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35260 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!561190 (= res!352477 (= lt!255289 (seekKeyOrZeroReturnVacant!0 (x!52651 lt!255287) (index!23737 lt!255287) (index!23737 lt!255287) (select (arr!16931 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561191 () Bool)

(declare-fun res!352475 () Bool)

(assert (=> b!561191 (=> (not res!352475) (not e!323361))))

(assert (=> b!561191 (= res!352475 (and (= (size!17296 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17296 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17296 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561192 () Bool)

(assert (=> b!561192 (= e!323359 (= (seekEntryOrOpen!0 lt!255286 lt!255290 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52651 lt!255287) (index!23737 lt!255287) (index!23737 lt!255287) lt!255286 lt!255290 mask!3119)))))

(declare-fun b!561193 () Bool)

(declare-fun res!352478 () Bool)

(assert (=> b!561193 (=> (not res!352478) (not e!323354))))

(assert (=> b!561193 (= res!352478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51386 res!352484) b!561191))

(assert (= (and b!561191 res!352475) b!561186))

(assert (= (and b!561186 res!352476) b!561189))

(assert (= (and b!561189 res!352487) b!561182))

(assert (= (and b!561182 res!352486) b!561187))

(assert (= (and b!561187 res!352485) b!561193))

(assert (= (and b!561193 res!352478) b!561181))

(assert (= (and b!561181 res!352480) b!561188))

(assert (= (and b!561188 res!352481) b!561185))

(assert (= (and b!561185 res!352483) b!561184))

(assert (= (and b!561184 (not res!352482)) b!561183))

(assert (= (and b!561183 (not res!352479)) b!561190))

(assert (= (and b!561190 res!352477) b!561192))

(declare-fun m!538577 () Bool)

(assert (=> b!561190 m!538577))

(assert (=> b!561190 m!538577))

(declare-fun m!538579 () Bool)

(assert (=> b!561190 m!538579))

(assert (=> b!561186 m!538577))

(assert (=> b!561186 m!538577))

(declare-fun m!538581 () Bool)

(assert (=> b!561186 m!538581))

(declare-fun m!538583 () Bool)

(assert (=> b!561181 m!538583))

(declare-fun m!538585 () Bool)

(assert (=> b!561189 m!538585))

(declare-fun m!538587 () Bool)

(assert (=> b!561182 m!538587))

(declare-fun m!538589 () Bool)

(assert (=> start!51386 m!538589))

(declare-fun m!538591 () Bool)

(assert (=> start!51386 m!538591))

(assert (=> b!561188 m!538577))

(declare-fun m!538593 () Bool)

(assert (=> b!561188 m!538593))

(assert (=> b!561188 m!538577))

(declare-fun m!538595 () Bool)

(assert (=> b!561188 m!538595))

(assert (=> b!561188 m!538577))

(declare-fun m!538597 () Bool)

(assert (=> b!561188 m!538597))

(declare-fun m!538599 () Bool)

(assert (=> b!561188 m!538599))

(declare-fun m!538601 () Bool)

(assert (=> b!561188 m!538601))

(declare-fun m!538603 () Bool)

(assert (=> b!561188 m!538603))

(assert (=> b!561183 m!538577))

(declare-fun m!538605 () Bool)

(assert (=> b!561183 m!538605))

(declare-fun m!538607 () Bool)

(assert (=> b!561192 m!538607))

(declare-fun m!538609 () Bool)

(assert (=> b!561192 m!538609))

(declare-fun m!538611 () Bool)

(assert (=> b!561193 m!538611))

(assert (=> b!561185 m!538577))

(assert (=> b!561185 m!538577))

(declare-fun m!538613 () Bool)

(assert (=> b!561185 m!538613))

(declare-fun m!538615 () Bool)

(assert (=> b!561185 m!538615))

(declare-fun m!538617 () Bool)

(assert (=> b!561185 m!538617))

(declare-fun m!538619 () Bool)

(assert (=> b!561187 m!538619))

(check-sat (not b!561193) (not b!561190) (not b!561187) (not b!561189) (not b!561181) (not b!561186) (not start!51386) (not b!561182) (not b!561188) (not b!561192) (not b!561185))
(check-sat)
