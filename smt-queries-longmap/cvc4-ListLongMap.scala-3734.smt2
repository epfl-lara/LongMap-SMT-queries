; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51402 () Bool)

(assert start!51402)

(declare-fun b!561530 () Bool)

(declare-fun res!352689 () Bool)

(declare-fun e!323581 () Bool)

(assert (=> b!561530 (=> (not res!352689) (not e!323581))))

(declare-datatypes ((array!35267 0))(
  ( (array!35268 (arr!16934 (Array (_ BitVec 32) (_ BitVec 64))) (size!17298 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35267)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561530 (= res!352689 (validKeyInArray!0 (select (arr!16934 a!3118) j!142)))))

(declare-fun res!352690 () Bool)

(assert (=> start!51402 (=> (not res!352690) (not e!323581))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51402 (= res!352690 (validMask!0 mask!3119))))

(assert (=> start!51402 e!323581))

(assert (=> start!51402 true))

(declare-fun array_inv!12730 (array!35267) Bool)

(assert (=> start!51402 (array_inv!12730 a!3118)))

(declare-fun b!561531 () Bool)

(declare-fun e!323580 () Bool)

(declare-fun e!323576 () Bool)

(assert (=> b!561531 (= e!323580 e!323576)))

(declare-fun res!352692 () Bool)

(assert (=> b!561531 (=> res!352692 e!323576)))

(declare-fun lt!255576 () (_ BitVec 64))

(assert (=> b!561531 (= res!352692 (or (= lt!255576 (select (arr!16934 a!3118) j!142)) (= lt!255576 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5383 0))(
  ( (MissingZero!5383 (index!23759 (_ BitVec 32))) (Found!5383 (index!23760 (_ BitVec 32))) (Intermediate!5383 (undefined!6195 Bool) (index!23761 (_ BitVec 32)) (x!52662 (_ BitVec 32))) (Undefined!5383) (MissingVacant!5383 (index!23762 (_ BitVec 32))) )
))
(declare-fun lt!255580 () SeekEntryResult!5383)

(assert (=> b!561531 (= lt!255576 (select (arr!16934 a!3118) (index!23761 lt!255580)))))

(declare-fun b!561532 () Bool)

(declare-fun e!323582 () Bool)

(assert (=> b!561532 (= e!323576 e!323582)))

(declare-fun res!352693 () Bool)

(assert (=> b!561532 (=> (not res!352693) (not e!323582))))

(declare-fun lt!255577 () SeekEntryResult!5383)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35267 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!561532 (= res!352693 (= lt!255577 (seekKeyOrZeroReturnVacant!0 (x!52662 lt!255580) (index!23761 lt!255580) (index!23761 lt!255580) (select (arr!16934 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun lt!255574 () (_ BitVec 64))

(declare-fun b!561533 () Bool)

(declare-fun lt!255573 () array!35267)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35267 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!561533 (= e!323582 (= (seekEntryOrOpen!0 lt!255574 lt!255573 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52662 lt!255580) (index!23761 lt!255580) (index!23761 lt!255580) lt!255574 lt!255573 mask!3119)))))

(declare-fun b!561534 () Bool)

(declare-fun res!352684 () Bool)

(declare-fun e!323577 () Bool)

(assert (=> b!561534 (=> (not res!352684) (not e!323577))))

(declare-datatypes ((List!11014 0))(
  ( (Nil!11011) (Cons!11010 (h!12013 (_ BitVec 64)) (t!17242 List!11014)) )
))
(declare-fun arrayNoDuplicates!0 (array!35267 (_ BitVec 32) List!11014) Bool)

(assert (=> b!561534 (= res!352684 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11011))))

(declare-fun b!561535 () Bool)

(declare-fun res!352688 () Bool)

(assert (=> b!561535 (=> (not res!352688) (not e!323581))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561535 (= res!352688 (and (= (size!17298 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17298 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17298 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561536 () Bool)

(declare-fun e!323578 () Bool)

(assert (=> b!561536 (= e!323577 e!323578)))

(declare-fun res!352691 () Bool)

(assert (=> b!561536 (=> (not res!352691) (not e!323578))))

(declare-fun lt!255578 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35267 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!561536 (= res!352691 (= lt!255580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255578 lt!255574 lt!255573 mask!3119)))))

(declare-fun lt!255572 () (_ BitVec 32))

(assert (=> b!561536 (= lt!255580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255572 (select (arr!16934 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561536 (= lt!255578 (toIndex!0 lt!255574 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!561536 (= lt!255574 (select (store (arr!16934 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561536 (= lt!255572 (toIndex!0 (select (arr!16934 a!3118) j!142) mask!3119))))

(assert (=> b!561536 (= lt!255573 (array!35268 (store (arr!16934 a!3118) i!1132 k!1914) (size!17298 a!3118)))))

(declare-fun b!561537 () Bool)

(assert (=> b!561537 (= e!323581 e!323577)))

(declare-fun res!352685 () Bool)

(assert (=> b!561537 (=> (not res!352685) (not e!323577))))

(declare-fun lt!255575 () SeekEntryResult!5383)

(assert (=> b!561537 (= res!352685 (or (= lt!255575 (MissingZero!5383 i!1132)) (= lt!255575 (MissingVacant!5383 i!1132))))))

(assert (=> b!561537 (= lt!255575 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561538 () Bool)

(declare-fun res!352686 () Bool)

(assert (=> b!561538 (=> (not res!352686) (not e!323581))))

(assert (=> b!561538 (= res!352686 (validKeyInArray!0 k!1914))))

(declare-fun b!561539 () Bool)

(declare-fun res!352682 () Bool)

(assert (=> b!561539 (=> (not res!352682) (not e!323577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35267 (_ BitVec 32)) Bool)

(assert (=> b!561539 (= res!352682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561540 () Bool)

(declare-fun res!352687 () Bool)

(assert (=> b!561540 (=> (not res!352687) (not e!323581))))

(declare-fun arrayContainsKey!0 (array!35267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561540 (= res!352687 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561541 () Bool)

(assert (=> b!561541 (= e!323578 (not true))))

(declare-fun e!323583 () Bool)

(assert (=> b!561541 e!323583))

(declare-fun res!352694 () Bool)

(assert (=> b!561541 (=> (not res!352694) (not e!323583))))

(assert (=> b!561541 (= res!352694 (= lt!255577 (Found!5383 j!142)))))

(assert (=> b!561541 (= lt!255577 (seekEntryOrOpen!0 (select (arr!16934 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561541 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17540 0))(
  ( (Unit!17541) )
))
(declare-fun lt!255579 () Unit!17540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17540)

(assert (=> b!561541 (= lt!255579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561542 () Bool)

(assert (=> b!561542 (= e!323583 e!323580)))

(declare-fun res!352683 () Bool)

(assert (=> b!561542 (=> res!352683 e!323580)))

(assert (=> b!561542 (= res!352683 (or (undefined!6195 lt!255580) (not (is-Intermediate!5383 lt!255580))))))

(assert (= (and start!51402 res!352690) b!561535))

(assert (= (and b!561535 res!352688) b!561530))

(assert (= (and b!561530 res!352689) b!561538))

(assert (= (and b!561538 res!352686) b!561540))

(assert (= (and b!561540 res!352687) b!561537))

(assert (= (and b!561537 res!352685) b!561539))

(assert (= (and b!561539 res!352682) b!561534))

(assert (= (and b!561534 res!352684) b!561536))

(assert (= (and b!561536 res!352691) b!561541))

(assert (= (and b!561541 res!352694) b!561542))

(assert (= (and b!561542 (not res!352683)) b!561531))

(assert (= (and b!561531 (not res!352692)) b!561532))

(assert (= (and b!561532 res!352693) b!561533))

(declare-fun m!539437 () Bool)

(assert (=> b!561538 m!539437))

(declare-fun m!539439 () Bool)

(assert (=> b!561530 m!539439))

(assert (=> b!561530 m!539439))

(declare-fun m!539441 () Bool)

(assert (=> b!561530 m!539441))

(declare-fun m!539443 () Bool)

(assert (=> b!561533 m!539443))

(declare-fun m!539445 () Bool)

(assert (=> b!561533 m!539445))

(assert (=> b!561531 m!539439))

(declare-fun m!539447 () Bool)

(assert (=> b!561531 m!539447))

(assert (=> b!561541 m!539439))

(assert (=> b!561541 m!539439))

(declare-fun m!539449 () Bool)

(assert (=> b!561541 m!539449))

(declare-fun m!539451 () Bool)

(assert (=> b!561541 m!539451))

(declare-fun m!539453 () Bool)

(assert (=> b!561541 m!539453))

(assert (=> b!561532 m!539439))

(assert (=> b!561532 m!539439))

(declare-fun m!539455 () Bool)

(assert (=> b!561532 m!539455))

(declare-fun m!539457 () Bool)

(assert (=> start!51402 m!539457))

(declare-fun m!539459 () Bool)

(assert (=> start!51402 m!539459))

(declare-fun m!539461 () Bool)

(assert (=> b!561537 m!539461))

(declare-fun m!539463 () Bool)

(assert (=> b!561540 m!539463))

(assert (=> b!561536 m!539439))

(declare-fun m!539465 () Bool)

(assert (=> b!561536 m!539465))

(assert (=> b!561536 m!539439))

(declare-fun m!539467 () Bool)

(assert (=> b!561536 m!539467))

(assert (=> b!561536 m!539439))

(declare-fun m!539469 () Bool)

(assert (=> b!561536 m!539469))

(declare-fun m!539471 () Bool)

(assert (=> b!561536 m!539471))

(declare-fun m!539473 () Bool)

(assert (=> b!561536 m!539473))

(declare-fun m!539475 () Bool)

(assert (=> b!561536 m!539475))

(declare-fun m!539477 () Bool)

(assert (=> b!561534 m!539477))

(declare-fun m!539479 () Bool)

(assert (=> b!561539 m!539479))

(push 1)

