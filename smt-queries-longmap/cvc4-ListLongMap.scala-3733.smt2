; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51396 () Bool)

(assert start!51396)

(declare-fun b!561413 () Bool)

(declare-fun res!352575 () Bool)

(declare-fun e!323507 () Bool)

(assert (=> b!561413 (=> (not res!352575) (not e!323507))))

(declare-datatypes ((array!35261 0))(
  ( (array!35262 (arr!16931 (Array (_ BitVec 32) (_ BitVec 64))) (size!17295 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35261)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561413 (= res!352575 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561415 () Bool)

(declare-fun res!352573 () Bool)

(assert (=> b!561415 (=> (not res!352573) (not e!323507))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561415 (= res!352573 (and (= (size!17295 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17295 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17295 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!255499 () (_ BitVec 64))

(declare-fun e!323506 () Bool)

(declare-fun lt!255498 () array!35261)

(declare-datatypes ((SeekEntryResult!5380 0))(
  ( (MissingZero!5380 (index!23747 (_ BitVec 32))) (Found!5380 (index!23748 (_ BitVec 32))) (Intermediate!5380 (undefined!6192 Bool) (index!23749 (_ BitVec 32)) (x!52651 (_ BitVec 32))) (Undefined!5380) (MissingVacant!5380 (index!23750 (_ BitVec 32))) )
))
(declare-fun lt!255492 () SeekEntryResult!5380)

(declare-fun b!561416 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35261 (_ BitVec 32)) SeekEntryResult!5380)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35261 (_ BitVec 32)) SeekEntryResult!5380)

(assert (=> b!561416 (= e!323506 (= (seekEntryOrOpen!0 lt!255499 lt!255498 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52651 lt!255492) (index!23749 lt!255492) (index!23749 lt!255492) lt!255499 lt!255498 mask!3119)))))

(declare-fun b!561417 () Bool)

(declare-fun res!352565 () Bool)

(declare-fun e!323511 () Bool)

(assert (=> b!561417 (=> (not res!352565) (not e!323511))))

(declare-datatypes ((List!11011 0))(
  ( (Nil!11008) (Cons!11007 (h!12010 (_ BitVec 64)) (t!17239 List!11011)) )
))
(declare-fun arrayNoDuplicates!0 (array!35261 (_ BitVec 32) List!11011) Bool)

(assert (=> b!561417 (= res!352565 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11008))))

(declare-fun b!561418 () Bool)

(declare-fun e!323510 () Bool)

(declare-fun e!323508 () Bool)

(assert (=> b!561418 (= e!323510 e!323508)))

(declare-fun res!352566 () Bool)

(assert (=> b!561418 (=> res!352566 e!323508)))

(declare-fun lt!255491 () (_ BitVec 64))

(assert (=> b!561418 (= res!352566 (or (= lt!255491 (select (arr!16931 a!3118) j!142)) (= lt!255491 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561418 (= lt!255491 (select (arr!16931 a!3118) (index!23749 lt!255492)))))

(declare-fun b!561419 () Bool)

(assert (=> b!561419 (= e!323507 e!323511)))

(declare-fun res!352576 () Bool)

(assert (=> b!561419 (=> (not res!352576) (not e!323511))))

(declare-fun lt!255495 () SeekEntryResult!5380)

(assert (=> b!561419 (= res!352576 (or (= lt!255495 (MissingZero!5380 i!1132)) (= lt!255495 (MissingVacant!5380 i!1132))))))

(assert (=> b!561419 (= lt!255495 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561420 () Bool)

(declare-fun e!323509 () Bool)

(assert (=> b!561420 (= e!323509 e!323510)))

(declare-fun res!352567 () Bool)

(assert (=> b!561420 (=> res!352567 e!323510)))

(assert (=> b!561420 (= res!352567 (or (undefined!6192 lt!255492) (not (is-Intermediate!5380 lt!255492))))))

(declare-fun b!561421 () Bool)

(assert (=> b!561421 (= e!323508 e!323506)))

(declare-fun res!352570 () Bool)

(assert (=> b!561421 (=> (not res!352570) (not e!323506))))

(declare-fun lt!255493 () SeekEntryResult!5380)

(assert (=> b!561421 (= res!352570 (= lt!255493 (seekKeyOrZeroReturnVacant!0 (x!52651 lt!255492) (index!23749 lt!255492) (index!23749 lt!255492) (select (arr!16931 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561414 () Bool)

(declare-fun res!352569 () Bool)

(assert (=> b!561414 (=> (not res!352569) (not e!323507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561414 (= res!352569 (validKeyInArray!0 (select (arr!16931 a!3118) j!142)))))

(declare-fun res!352571 () Bool)

(assert (=> start!51396 (=> (not res!352571) (not e!323507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51396 (= res!352571 (validMask!0 mask!3119))))

(assert (=> start!51396 e!323507))

(assert (=> start!51396 true))

(declare-fun array_inv!12727 (array!35261) Bool)

(assert (=> start!51396 (array_inv!12727 a!3118)))

(declare-fun b!561422 () Bool)

(declare-fun res!352568 () Bool)

(assert (=> b!561422 (=> (not res!352568) (not e!323507))))

(assert (=> b!561422 (= res!352568 (validKeyInArray!0 k!1914))))

(declare-fun b!561423 () Bool)

(declare-fun e!323505 () Bool)

(assert (=> b!561423 (= e!323511 e!323505)))

(declare-fun res!352577 () Bool)

(assert (=> b!561423 (=> (not res!352577) (not e!323505))))

(declare-fun lt!255496 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35261 (_ BitVec 32)) SeekEntryResult!5380)

(assert (=> b!561423 (= res!352577 (= lt!255492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255496 lt!255499 lt!255498 mask!3119)))))

(declare-fun lt!255497 () (_ BitVec 32))

(assert (=> b!561423 (= lt!255492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255497 (select (arr!16931 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561423 (= lt!255496 (toIndex!0 lt!255499 mask!3119))))

(assert (=> b!561423 (= lt!255499 (select (store (arr!16931 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561423 (= lt!255497 (toIndex!0 (select (arr!16931 a!3118) j!142) mask!3119))))

(assert (=> b!561423 (= lt!255498 (array!35262 (store (arr!16931 a!3118) i!1132 k!1914) (size!17295 a!3118)))))

(declare-fun b!561424 () Bool)

(assert (=> b!561424 (= e!323505 (not true))))

(assert (=> b!561424 e!323509))

(declare-fun res!352572 () Bool)

(assert (=> b!561424 (=> (not res!352572) (not e!323509))))

(assert (=> b!561424 (= res!352572 (= lt!255493 (Found!5380 j!142)))))

(assert (=> b!561424 (= lt!255493 (seekEntryOrOpen!0 (select (arr!16931 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35261 (_ BitVec 32)) Bool)

(assert (=> b!561424 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17534 0))(
  ( (Unit!17535) )
))
(declare-fun lt!255494 () Unit!17534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17534)

(assert (=> b!561424 (= lt!255494 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561425 () Bool)

(declare-fun res!352574 () Bool)

(assert (=> b!561425 (=> (not res!352574) (not e!323511))))

(assert (=> b!561425 (= res!352574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51396 res!352571) b!561415))

(assert (= (and b!561415 res!352573) b!561414))

(assert (= (and b!561414 res!352569) b!561422))

(assert (= (and b!561422 res!352568) b!561413))

(assert (= (and b!561413 res!352575) b!561419))

(assert (= (and b!561419 res!352576) b!561425))

(assert (= (and b!561425 res!352574) b!561417))

(assert (= (and b!561417 res!352565) b!561423))

(assert (= (and b!561423 res!352577) b!561424))

(assert (= (and b!561424 res!352572) b!561420))

(assert (= (and b!561420 (not res!352567)) b!561418))

(assert (= (and b!561418 (not res!352566)) b!561421))

(assert (= (and b!561421 res!352570) b!561416))

(declare-fun m!539305 () Bool)

(assert (=> b!561416 m!539305))

(declare-fun m!539307 () Bool)

(assert (=> b!561416 m!539307))

(declare-fun m!539309 () Bool)

(assert (=> b!561413 m!539309))

(declare-fun m!539311 () Bool)

(assert (=> b!561424 m!539311))

(assert (=> b!561424 m!539311))

(declare-fun m!539313 () Bool)

(assert (=> b!561424 m!539313))

(declare-fun m!539315 () Bool)

(assert (=> b!561424 m!539315))

(declare-fun m!539317 () Bool)

(assert (=> b!561424 m!539317))

(assert (=> b!561423 m!539311))

(declare-fun m!539319 () Bool)

(assert (=> b!561423 m!539319))

(assert (=> b!561423 m!539311))

(assert (=> b!561423 m!539311))

(declare-fun m!539321 () Bool)

(assert (=> b!561423 m!539321))

(declare-fun m!539323 () Bool)

(assert (=> b!561423 m!539323))

(declare-fun m!539325 () Bool)

(assert (=> b!561423 m!539325))

(declare-fun m!539327 () Bool)

(assert (=> b!561423 m!539327))

(declare-fun m!539329 () Bool)

(assert (=> b!561423 m!539329))

(declare-fun m!539331 () Bool)

(assert (=> b!561417 m!539331))

(assert (=> b!561421 m!539311))

(assert (=> b!561421 m!539311))

(declare-fun m!539333 () Bool)

(assert (=> b!561421 m!539333))

(declare-fun m!539335 () Bool)

(assert (=> start!51396 m!539335))

(declare-fun m!539337 () Bool)

(assert (=> start!51396 m!539337))

(assert (=> b!561418 m!539311))

(declare-fun m!539339 () Bool)

(assert (=> b!561418 m!539339))

(assert (=> b!561414 m!539311))

(assert (=> b!561414 m!539311))

(declare-fun m!539341 () Bool)

(assert (=> b!561414 m!539341))

(declare-fun m!539343 () Bool)

(assert (=> b!561422 m!539343))

(declare-fun m!539345 () Bool)

(assert (=> b!561425 m!539345))

(declare-fun m!539347 () Bool)

(assert (=> b!561419 m!539347))

(push 1)

