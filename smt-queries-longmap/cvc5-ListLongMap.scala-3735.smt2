; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51404 () Bool)

(assert start!51404)

(declare-fun b!561569 () Bool)

(declare-fun e!323603 () Bool)

(declare-fun e!323600 () Bool)

(assert (=> b!561569 (= e!323603 e!323600)))

(declare-fun res!352721 () Bool)

(assert (=> b!561569 (=> (not res!352721) (not e!323600))))

(declare-datatypes ((SeekEntryResult!5384 0))(
  ( (MissingZero!5384 (index!23763 (_ BitVec 32))) (Found!5384 (index!23764 (_ BitVec 32))) (Intermediate!5384 (undefined!6196 Bool) (index!23765 (_ BitVec 32)) (x!52671 (_ BitVec 32))) (Undefined!5384) (MissingVacant!5384 (index!23766 (_ BitVec 32))) )
))
(declare-fun lt!255604 () SeekEntryResult!5384)

(declare-fun lt!255599 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255603 () (_ BitVec 64))

(declare-datatypes ((array!35269 0))(
  ( (array!35270 (arr!16935 (Array (_ BitVec 32) (_ BitVec 64))) (size!17299 (_ BitVec 32))) )
))
(declare-fun lt!255601 () array!35269)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35269 (_ BitVec 32)) SeekEntryResult!5384)

(assert (=> b!561569 (= res!352721 (= lt!255604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255599 lt!255603 lt!255601 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255606 () (_ BitVec 32))

(declare-fun a!3118 () array!35269)

(assert (=> b!561569 (= lt!255604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255606 (select (arr!16935 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561569 (= lt!255599 (toIndex!0 lt!255603 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!561569 (= lt!255603 (select (store (arr!16935 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561569 (= lt!255606 (toIndex!0 (select (arr!16935 a!3118) j!142) mask!3119))))

(assert (=> b!561569 (= lt!255601 (array!35270 (store (arr!16935 a!3118) i!1132 k!1914) (size!17299 a!3118)))))

(declare-fun b!561570 () Bool)

(declare-fun e!323601 () Bool)

(assert (=> b!561570 (= e!323601 e!323603)))

(declare-fun res!352730 () Bool)

(assert (=> b!561570 (=> (not res!352730) (not e!323603))))

(declare-fun lt!255600 () SeekEntryResult!5384)

(assert (=> b!561570 (= res!352730 (or (= lt!255600 (MissingZero!5384 i!1132)) (= lt!255600 (MissingVacant!5384 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35269 (_ BitVec 32)) SeekEntryResult!5384)

(assert (=> b!561570 (= lt!255600 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561571 () Bool)

(declare-fun res!352729 () Bool)

(assert (=> b!561571 (=> (not res!352729) (not e!323603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35269 (_ BitVec 32)) Bool)

(assert (=> b!561571 (= res!352729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561572 () Bool)

(declare-fun res!352727 () Bool)

(assert (=> b!561572 (=> (not res!352727) (not e!323603))))

(declare-datatypes ((List!11015 0))(
  ( (Nil!11012) (Cons!11011 (h!12014 (_ BitVec 64)) (t!17243 List!11015)) )
))
(declare-fun arrayNoDuplicates!0 (array!35269 (_ BitVec 32) List!11015) Bool)

(assert (=> b!561572 (= res!352727 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11012))))

(declare-fun b!561573 () Bool)

(declare-fun e!323607 () Bool)

(declare-fun e!323602 () Bool)

(assert (=> b!561573 (= e!323607 e!323602)))

(declare-fun res!352733 () Bool)

(assert (=> b!561573 (=> res!352733 e!323602)))

(assert (=> b!561573 (= res!352733 (or (undefined!6196 lt!255604) (not (is-Intermediate!5384 lt!255604))))))

(declare-fun b!561574 () Bool)

(assert (=> b!561574 (= e!323600 (not true))))

(assert (=> b!561574 e!323607))

(declare-fun res!352724 () Bool)

(assert (=> b!561574 (=> (not res!352724) (not e!323607))))

(declare-fun lt!255607 () SeekEntryResult!5384)

(assert (=> b!561574 (= res!352724 (= lt!255607 (Found!5384 j!142)))))

(assert (=> b!561574 (= lt!255607 (seekEntryOrOpen!0 (select (arr!16935 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561574 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17542 0))(
  ( (Unit!17543) )
))
(declare-fun lt!255605 () Unit!17542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17542)

(assert (=> b!561574 (= lt!255605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561575 () Bool)

(declare-fun res!352722 () Bool)

(assert (=> b!561575 (=> (not res!352722) (not e!323601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561575 (= res!352722 (validKeyInArray!0 (select (arr!16935 a!3118) j!142)))))

(declare-fun res!352726 () Bool)

(assert (=> start!51404 (=> (not res!352726) (not e!323601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51404 (= res!352726 (validMask!0 mask!3119))))

(assert (=> start!51404 e!323601))

(assert (=> start!51404 true))

(declare-fun array_inv!12731 (array!35269) Bool)

(assert (=> start!51404 (array_inv!12731 a!3118)))

(declare-fun b!561576 () Bool)

(declare-fun res!352732 () Bool)

(assert (=> b!561576 (=> (not res!352732) (not e!323601))))

(declare-fun arrayContainsKey!0 (array!35269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561576 (= res!352732 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561577 () Bool)

(declare-fun e!323606 () Bool)

(declare-fun e!323605 () Bool)

(assert (=> b!561577 (= e!323606 e!323605)))

(declare-fun res!352725 () Bool)

(assert (=> b!561577 (=> (not res!352725) (not e!323605))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35269 (_ BitVec 32)) SeekEntryResult!5384)

(assert (=> b!561577 (= res!352725 (= lt!255607 (seekKeyOrZeroReturnVacant!0 (x!52671 lt!255604) (index!23765 lt!255604) (index!23765 lt!255604) (select (arr!16935 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561578 () Bool)

(assert (=> b!561578 (= e!323605 (= (seekEntryOrOpen!0 lt!255603 lt!255601 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52671 lt!255604) (index!23765 lt!255604) (index!23765 lt!255604) lt!255603 lt!255601 mask!3119)))))

(declare-fun b!561579 () Bool)

(declare-fun res!352723 () Bool)

(assert (=> b!561579 (=> (not res!352723) (not e!323601))))

(assert (=> b!561579 (= res!352723 (and (= (size!17299 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17299 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17299 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561580 () Bool)

(declare-fun res!352731 () Bool)

(assert (=> b!561580 (=> (not res!352731) (not e!323601))))

(assert (=> b!561580 (= res!352731 (validKeyInArray!0 k!1914))))

(declare-fun b!561581 () Bool)

(assert (=> b!561581 (= e!323602 e!323606)))

(declare-fun res!352728 () Bool)

(assert (=> b!561581 (=> res!352728 e!323606)))

(declare-fun lt!255602 () (_ BitVec 64))

(assert (=> b!561581 (= res!352728 (or (= lt!255602 (select (arr!16935 a!3118) j!142)) (= lt!255602 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561581 (= lt!255602 (select (arr!16935 a!3118) (index!23765 lt!255604)))))

(assert (= (and start!51404 res!352726) b!561579))

(assert (= (and b!561579 res!352723) b!561575))

(assert (= (and b!561575 res!352722) b!561580))

(assert (= (and b!561580 res!352731) b!561576))

(assert (= (and b!561576 res!352732) b!561570))

(assert (= (and b!561570 res!352730) b!561571))

(assert (= (and b!561571 res!352729) b!561572))

(assert (= (and b!561572 res!352727) b!561569))

(assert (= (and b!561569 res!352721) b!561574))

(assert (= (and b!561574 res!352724) b!561573))

(assert (= (and b!561573 (not res!352733)) b!561581))

(assert (= (and b!561581 (not res!352728)) b!561577))

(assert (= (and b!561577 res!352725) b!561578))

(declare-fun m!539481 () Bool)

(assert (=> b!561580 m!539481))

(declare-fun m!539483 () Bool)

(assert (=> b!561581 m!539483))

(declare-fun m!539485 () Bool)

(assert (=> b!561581 m!539485))

(assert (=> b!561569 m!539483))

(declare-fun m!539487 () Bool)

(assert (=> b!561569 m!539487))

(declare-fun m!539489 () Bool)

(assert (=> b!561569 m!539489))

(assert (=> b!561569 m!539483))

(assert (=> b!561569 m!539483))

(declare-fun m!539491 () Bool)

(assert (=> b!561569 m!539491))

(declare-fun m!539493 () Bool)

(assert (=> b!561569 m!539493))

(declare-fun m!539495 () Bool)

(assert (=> b!561569 m!539495))

(declare-fun m!539497 () Bool)

(assert (=> b!561569 m!539497))

(declare-fun m!539499 () Bool)

(assert (=> start!51404 m!539499))

(declare-fun m!539501 () Bool)

(assert (=> start!51404 m!539501))

(declare-fun m!539503 () Bool)

(assert (=> b!561570 m!539503))

(declare-fun m!539505 () Bool)

(assert (=> b!561572 m!539505))

(declare-fun m!539507 () Bool)

(assert (=> b!561571 m!539507))

(assert (=> b!561575 m!539483))

(assert (=> b!561575 m!539483))

(declare-fun m!539509 () Bool)

(assert (=> b!561575 m!539509))

(assert (=> b!561577 m!539483))

(assert (=> b!561577 m!539483))

(declare-fun m!539511 () Bool)

(assert (=> b!561577 m!539511))

(declare-fun m!539513 () Bool)

(assert (=> b!561576 m!539513))

(assert (=> b!561574 m!539483))

(assert (=> b!561574 m!539483))

(declare-fun m!539515 () Bool)

(assert (=> b!561574 m!539515))

(declare-fun m!539517 () Bool)

(assert (=> b!561574 m!539517))

(declare-fun m!539519 () Bool)

(assert (=> b!561574 m!539519))

(declare-fun m!539521 () Bool)

(assert (=> b!561578 m!539521))

(declare-fun m!539523 () Bool)

(assert (=> b!561578 m!539523))

(push 1)

