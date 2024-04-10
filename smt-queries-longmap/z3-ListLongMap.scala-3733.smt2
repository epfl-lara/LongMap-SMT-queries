; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51394 () Bool)

(assert start!51394)

(declare-fun b!561374 () Bool)

(declare-fun e!323485 () Bool)

(declare-fun e!323480 () Bool)

(assert (=> b!561374 (= e!323485 e!323480)))

(declare-fun res!352537 () Bool)

(assert (=> b!561374 (=> (not res!352537) (not e!323480))))

(declare-datatypes ((SeekEntryResult!5379 0))(
  ( (MissingZero!5379 (index!23743 (_ BitVec 32))) (Found!5379 (index!23744 (_ BitVec 32))) (Intermediate!5379 (undefined!6191 Bool) (index!23745 (_ BitVec 32)) (x!52650 (_ BitVec 32))) (Undefined!5379) (MissingVacant!5379 (index!23746 (_ BitVec 32))) )
))
(declare-fun lt!255470 () SeekEntryResult!5379)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561374 (= res!352537 (or (= lt!255470 (MissingZero!5379 i!1132)) (= lt!255470 (MissingVacant!5379 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35259 0))(
  ( (array!35260 (arr!16930 (Array (_ BitVec 32) (_ BitVec 64))) (size!17294 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35259)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35259 (_ BitVec 32)) SeekEntryResult!5379)

(assert (=> b!561374 (= lt!255470 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561375 () Bool)

(declare-fun res!352532 () Bool)

(assert (=> b!561375 (=> (not res!352532) (not e!323485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561375 (= res!352532 (validKeyInArray!0 k0!1914))))

(declare-fun b!561376 () Bool)

(declare-fun e!323484 () Bool)

(assert (=> b!561376 (= e!323480 e!323484)))

(declare-fun res!352531 () Bool)

(assert (=> b!561376 (=> (not res!352531) (not e!323484))))

(declare-fun lt!255465 () SeekEntryResult!5379)

(declare-fun lt!255469 () (_ BitVec 32))

(declare-fun lt!255466 () array!35259)

(declare-fun lt!255471 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35259 (_ BitVec 32)) SeekEntryResult!5379)

(assert (=> b!561376 (= res!352531 (= lt!255465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255469 lt!255471 lt!255466 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255468 () (_ BitVec 32))

(assert (=> b!561376 (= lt!255465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255468 (select (arr!16930 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561376 (= lt!255469 (toIndex!0 lt!255471 mask!3119))))

(assert (=> b!561376 (= lt!255471 (select (store (arr!16930 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561376 (= lt!255468 (toIndex!0 (select (arr!16930 a!3118) j!142) mask!3119))))

(assert (=> b!561376 (= lt!255466 (array!35260 (store (arr!16930 a!3118) i!1132 k0!1914) (size!17294 a!3118)))))

(declare-fun b!561377 () Bool)

(declare-fun e!323482 () Bool)

(declare-fun e!323481 () Bool)

(assert (=> b!561377 (= e!323482 e!323481)))

(declare-fun res!352535 () Bool)

(assert (=> b!561377 (=> res!352535 e!323481)))

(get-info :version)

(assert (=> b!561377 (= res!352535 (or (undefined!6191 lt!255465) (not ((_ is Intermediate!5379) lt!255465))))))

(declare-fun res!352527 () Bool)

(assert (=> start!51394 (=> (not res!352527) (not e!323485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51394 (= res!352527 (validMask!0 mask!3119))))

(assert (=> start!51394 e!323485))

(assert (=> start!51394 true))

(declare-fun array_inv!12726 (array!35259) Bool)

(assert (=> start!51394 (array_inv!12726 a!3118)))

(declare-fun b!561378 () Bool)

(declare-fun res!352529 () Bool)

(assert (=> b!561378 (=> (not res!352529) (not e!323480))))

(declare-datatypes ((List!11010 0))(
  ( (Nil!11007) (Cons!11006 (h!12009 (_ BitVec 64)) (t!17238 List!11010)) )
))
(declare-fun arrayNoDuplicates!0 (array!35259 (_ BitVec 32) List!11010) Bool)

(assert (=> b!561378 (= res!352529 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11007))))

(declare-fun b!561379 () Bool)

(declare-fun e!323483 () Bool)

(declare-fun e!323487 () Bool)

(assert (=> b!561379 (= e!323483 e!323487)))

(declare-fun res!352530 () Bool)

(assert (=> b!561379 (=> (not res!352530) (not e!323487))))

(declare-fun lt!255467 () SeekEntryResult!5379)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35259 (_ BitVec 32)) SeekEntryResult!5379)

(assert (=> b!561379 (= res!352530 (= lt!255467 (seekKeyOrZeroReturnVacant!0 (x!52650 lt!255465) (index!23745 lt!255465) (index!23745 lt!255465) (select (arr!16930 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561380 () Bool)

(assert (=> b!561380 (= e!323484 (not true))))

(assert (=> b!561380 e!323482))

(declare-fun res!352533 () Bool)

(assert (=> b!561380 (=> (not res!352533) (not e!323482))))

(assert (=> b!561380 (= res!352533 (= lt!255467 (Found!5379 j!142)))))

(assert (=> b!561380 (= lt!255467 (seekEntryOrOpen!0 (select (arr!16930 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35259 (_ BitVec 32)) Bool)

(assert (=> b!561380 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17532 0))(
  ( (Unit!17533) )
))
(declare-fun lt!255464 () Unit!17532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17532)

(assert (=> b!561380 (= lt!255464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561381 () Bool)

(declare-fun res!352528 () Bool)

(assert (=> b!561381 (=> (not res!352528) (not e!323485))))

(assert (=> b!561381 (= res!352528 (validKeyInArray!0 (select (arr!16930 a!3118) j!142)))))

(declare-fun b!561382 () Bool)

(declare-fun res!352534 () Bool)

(assert (=> b!561382 (=> (not res!352534) (not e!323480))))

(assert (=> b!561382 (= res!352534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561383 () Bool)

(assert (=> b!561383 (= e!323481 e!323483)))

(declare-fun res!352526 () Bool)

(assert (=> b!561383 (=> res!352526 e!323483)))

(declare-fun lt!255472 () (_ BitVec 64))

(assert (=> b!561383 (= res!352526 (or (= lt!255472 (select (arr!16930 a!3118) j!142)) (= lt!255472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561383 (= lt!255472 (select (arr!16930 a!3118) (index!23745 lt!255465)))))

(declare-fun b!561384 () Bool)

(declare-fun res!352538 () Bool)

(assert (=> b!561384 (=> (not res!352538) (not e!323485))))

(assert (=> b!561384 (= res!352538 (and (= (size!17294 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17294 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17294 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561385 () Bool)

(declare-fun res!352536 () Bool)

(assert (=> b!561385 (=> (not res!352536) (not e!323485))))

(declare-fun arrayContainsKey!0 (array!35259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561385 (= res!352536 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561386 () Bool)

(assert (=> b!561386 (= e!323487 (= (seekEntryOrOpen!0 lt!255471 lt!255466 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52650 lt!255465) (index!23745 lt!255465) (index!23745 lt!255465) lt!255471 lt!255466 mask!3119)))))

(assert (= (and start!51394 res!352527) b!561384))

(assert (= (and b!561384 res!352538) b!561381))

(assert (= (and b!561381 res!352528) b!561375))

(assert (= (and b!561375 res!352532) b!561385))

(assert (= (and b!561385 res!352536) b!561374))

(assert (= (and b!561374 res!352537) b!561382))

(assert (= (and b!561382 res!352534) b!561378))

(assert (= (and b!561378 res!352529) b!561376))

(assert (= (and b!561376 res!352531) b!561380))

(assert (= (and b!561380 res!352533) b!561377))

(assert (= (and b!561377 (not res!352535)) b!561383))

(assert (= (and b!561383 (not res!352526)) b!561379))

(assert (= (and b!561379 res!352530) b!561386))

(declare-fun m!539261 () Bool)

(assert (=> b!561374 m!539261))

(declare-fun m!539263 () Bool)

(assert (=> b!561381 m!539263))

(assert (=> b!561381 m!539263))

(declare-fun m!539265 () Bool)

(assert (=> b!561381 m!539265))

(declare-fun m!539267 () Bool)

(assert (=> b!561375 m!539267))

(assert (=> b!561376 m!539263))

(declare-fun m!539269 () Bool)

(assert (=> b!561376 m!539269))

(declare-fun m!539271 () Bool)

(assert (=> b!561376 m!539271))

(assert (=> b!561376 m!539263))

(assert (=> b!561376 m!539263))

(declare-fun m!539273 () Bool)

(assert (=> b!561376 m!539273))

(declare-fun m!539275 () Bool)

(assert (=> b!561376 m!539275))

(declare-fun m!539277 () Bool)

(assert (=> b!561376 m!539277))

(declare-fun m!539279 () Bool)

(assert (=> b!561376 m!539279))

(assert (=> b!561380 m!539263))

(assert (=> b!561380 m!539263))

(declare-fun m!539281 () Bool)

(assert (=> b!561380 m!539281))

(declare-fun m!539283 () Bool)

(assert (=> b!561380 m!539283))

(declare-fun m!539285 () Bool)

(assert (=> b!561380 m!539285))

(declare-fun m!539287 () Bool)

(assert (=> start!51394 m!539287))

(declare-fun m!539289 () Bool)

(assert (=> start!51394 m!539289))

(assert (=> b!561379 m!539263))

(assert (=> b!561379 m!539263))

(declare-fun m!539291 () Bool)

(assert (=> b!561379 m!539291))

(declare-fun m!539293 () Bool)

(assert (=> b!561378 m!539293))

(assert (=> b!561383 m!539263))

(declare-fun m!539295 () Bool)

(assert (=> b!561383 m!539295))

(declare-fun m!539297 () Bool)

(assert (=> b!561382 m!539297))

(declare-fun m!539299 () Bool)

(assert (=> b!561386 m!539299))

(declare-fun m!539301 () Bool)

(assert (=> b!561386 m!539301))

(declare-fun m!539303 () Bool)

(assert (=> b!561385 m!539303))

(check-sat (not b!561386) (not b!561378) (not b!561375) (not b!561376) (not b!561379) (not start!51394) (not b!561381) (not b!561380) (not b!561382) (not b!561385) (not b!561374))
(check-sat)
