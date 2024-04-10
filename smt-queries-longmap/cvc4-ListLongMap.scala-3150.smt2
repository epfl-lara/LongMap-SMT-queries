; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44374 () Bool)

(assert start!44374)

(declare-fun b!487689 () Bool)

(declare-fun e!286947 () Bool)

(assert (=> b!487689 (= e!286947 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!220126 () (_ BitVec 32))

(declare-datatypes ((array!31580 0))(
  ( (array!31581 (arr!15182 (Array (_ BitVec 32) (_ BitVec 64))) (size!15546 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31580)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487689 (= lt!220126 (toIndex!0 (select (arr!15182 a!3235) j!176) mask!3524))))

(declare-fun e!286945 () Bool)

(assert (=> b!487689 e!286945))

(declare-fun res!290967 () Bool)

(assert (=> b!487689 (=> (not res!290967) (not e!286945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31580 (_ BitVec 32)) Bool)

(assert (=> b!487689 (= res!290967 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14244 0))(
  ( (Unit!14245) )
))
(declare-fun lt!220125 () Unit!14244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14244)

(assert (=> b!487689 (= lt!220125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487690 () Bool)

(declare-fun res!290968 () Bool)

(declare-fun e!286946 () Bool)

(assert (=> b!487690 (=> (not res!290968) (not e!286946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487690 (= res!290968 (validKeyInArray!0 (select (arr!15182 a!3235) j!176)))))

(declare-fun b!487691 () Bool)

(declare-datatypes ((SeekEntryResult!3649 0))(
  ( (MissingZero!3649 (index!16775 (_ BitVec 32))) (Found!3649 (index!16776 (_ BitVec 32))) (Intermediate!3649 (undefined!4461 Bool) (index!16777 (_ BitVec 32)) (x!45893 (_ BitVec 32))) (Undefined!3649) (MissingVacant!3649 (index!16778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31580 (_ BitVec 32)) SeekEntryResult!3649)

(assert (=> b!487691 (= e!286945 (= (seekEntryOrOpen!0 (select (arr!15182 a!3235) j!176) a!3235 mask!3524) (Found!3649 j!176)))))

(declare-fun b!487692 () Bool)

(declare-fun res!290965 () Bool)

(assert (=> b!487692 (=> (not res!290965) (not e!286946))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487692 (= res!290965 (and (= (size!15546 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15546 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15546 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487694 () Bool)

(declare-fun res!290969 () Bool)

(assert (=> b!487694 (=> (not res!290969) (not e!286946))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!487694 (= res!290969 (validKeyInArray!0 k!2280))))

(declare-fun b!487695 () Bool)

(declare-fun res!290966 () Bool)

(assert (=> b!487695 (=> (not res!290966) (not e!286946))))

(declare-fun arrayContainsKey!0 (array!31580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487695 (= res!290966 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487696 () Bool)

(assert (=> b!487696 (= e!286946 e!286947)))

(declare-fun res!290964 () Bool)

(assert (=> b!487696 (=> (not res!290964) (not e!286947))))

(declare-fun lt!220124 () SeekEntryResult!3649)

(assert (=> b!487696 (= res!290964 (or (= lt!220124 (MissingZero!3649 i!1204)) (= lt!220124 (MissingVacant!3649 i!1204))))))

(assert (=> b!487696 (= lt!220124 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487697 () Bool)

(declare-fun res!290963 () Bool)

(assert (=> b!487697 (=> (not res!290963) (not e!286947))))

(declare-datatypes ((List!9340 0))(
  ( (Nil!9337) (Cons!9336 (h!10192 (_ BitVec 64)) (t!15568 List!9340)) )
))
(declare-fun arrayNoDuplicates!0 (array!31580 (_ BitVec 32) List!9340) Bool)

(assert (=> b!487697 (= res!290963 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9337))))

(declare-fun b!487693 () Bool)

(declare-fun res!290961 () Bool)

(assert (=> b!487693 (=> (not res!290961) (not e!286947))))

(assert (=> b!487693 (= res!290961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290962 () Bool)

(assert (=> start!44374 (=> (not res!290962) (not e!286946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44374 (= res!290962 (validMask!0 mask!3524))))

(assert (=> start!44374 e!286946))

(assert (=> start!44374 true))

(declare-fun array_inv!10978 (array!31580) Bool)

(assert (=> start!44374 (array_inv!10978 a!3235)))

(assert (= (and start!44374 res!290962) b!487692))

(assert (= (and b!487692 res!290965) b!487690))

(assert (= (and b!487690 res!290968) b!487694))

(assert (= (and b!487694 res!290969) b!487695))

(assert (= (and b!487695 res!290966) b!487696))

(assert (= (and b!487696 res!290964) b!487693))

(assert (= (and b!487693 res!290961) b!487697))

(assert (= (and b!487697 res!290963) b!487689))

(assert (= (and b!487689 res!290967) b!487691))

(declare-fun m!467479 () Bool)

(assert (=> b!487694 m!467479))

(declare-fun m!467481 () Bool)

(assert (=> b!487696 m!467481))

(declare-fun m!467483 () Bool)

(assert (=> start!44374 m!467483))

(declare-fun m!467485 () Bool)

(assert (=> start!44374 m!467485))

(declare-fun m!467487 () Bool)

(assert (=> b!487689 m!467487))

(assert (=> b!487689 m!467487))

(declare-fun m!467489 () Bool)

(assert (=> b!487689 m!467489))

(declare-fun m!467491 () Bool)

(assert (=> b!487689 m!467491))

(declare-fun m!467493 () Bool)

(assert (=> b!487689 m!467493))

(declare-fun m!467495 () Bool)

(assert (=> b!487693 m!467495))

(declare-fun m!467497 () Bool)

(assert (=> b!487695 m!467497))

(assert (=> b!487690 m!467487))

(assert (=> b!487690 m!467487))

(declare-fun m!467499 () Bool)

(assert (=> b!487690 m!467499))

(declare-fun m!467501 () Bool)

(assert (=> b!487697 m!467501))

(assert (=> b!487691 m!467487))

(assert (=> b!487691 m!467487))

(declare-fun m!467503 () Bool)

(assert (=> b!487691 m!467503))

(push 1)

