; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48934 () Bool)

(assert start!48934)

(declare-fun b!539425 () Bool)

(declare-fun res!334639 () Bool)

(declare-fun e!312667 () Bool)

(assert (=> b!539425 (=> (not res!334639) (not e!312667))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!34146 0))(
  ( (array!34147 (arr!16412 (Array (_ BitVec 32) (_ BitVec 64))) (size!16776 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34146)

(assert (=> b!539425 (= res!334639 (and (= (size!16776 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16776 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16776 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539426 () Bool)

(declare-fun res!334634 () Bool)

(declare-fun e!312668 () Bool)

(assert (=> b!539426 (=> (not res!334634) (not e!312668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34146 (_ BitVec 32)) Bool)

(assert (=> b!539426 (= res!334634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539427 () Bool)

(declare-fun res!334637 () Bool)

(assert (=> b!539427 (=> (not res!334637) (not e!312667))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539427 (= res!334637 (validKeyInArray!0 k!1998))))

(declare-fun b!539428 () Bool)

(declare-fun e!312669 () Bool)

(assert (=> b!539428 (= e!312668 e!312669)))

(declare-fun res!334635 () Bool)

(assert (=> b!539428 (=> (not res!334635) (not e!312669))))

(declare-datatypes ((SeekEntryResult!4870 0))(
  ( (MissingZero!4870 (index!21704 (_ BitVec 32))) (Found!4870 (index!21705 (_ BitVec 32))) (Intermediate!4870 (undefined!5682 Bool) (index!21706 (_ BitVec 32)) (x!50613 (_ BitVec 32))) (Undefined!4870) (MissingVacant!4870 (index!21707 (_ BitVec 32))) )
))
(declare-fun lt!247134 () SeekEntryResult!4870)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539428 (= res!334635 (= lt!247134 (Intermediate!4870 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34146 (_ BitVec 32)) SeekEntryResult!4870)

(assert (=> b!539428 (= lt!247134 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16412 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539429 () Bool)

(declare-fun res!334638 () Bool)

(assert (=> b!539429 (=> (not res!334638) (not e!312669))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539429 (= res!334638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16412 a!3154) j!147) mask!3216) (select (arr!16412 a!3154) j!147) a!3154 mask!3216) lt!247134))))

(declare-fun res!334636 () Bool)

(assert (=> start!48934 (=> (not res!334636) (not e!312667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48934 (= res!334636 (validMask!0 mask!3216))))

(assert (=> start!48934 e!312667))

(assert (=> start!48934 true))

(declare-fun array_inv!12208 (array!34146) Bool)

(assert (=> start!48934 (array_inv!12208 a!3154)))

(declare-fun b!539430 () Bool)

(declare-fun res!334632 () Bool)

(assert (=> b!539430 (=> (not res!334632) (not e!312668))))

(declare-datatypes ((List!10531 0))(
  ( (Nil!10528) (Cons!10527 (h!11470 (_ BitVec 64)) (t!16759 List!10531)) )
))
(declare-fun arrayNoDuplicates!0 (array!34146 (_ BitVec 32) List!10531) Bool)

(assert (=> b!539430 (= res!334632 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10528))))

(declare-fun b!539431 () Bool)

(declare-fun res!334640 () Bool)

(assert (=> b!539431 (=> (not res!334640) (not e!312668))))

(assert (=> b!539431 (= res!334640 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16776 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16776 a!3154)) (= (select (arr!16412 a!3154) resIndex!32) (select (arr!16412 a!3154) j!147))))))

(declare-fun b!539432 () Bool)

(declare-fun res!334630 () Bool)

(assert (=> b!539432 (=> (not res!334630) (not e!312667))))

(declare-fun arrayContainsKey!0 (array!34146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539432 (= res!334630 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539433 () Bool)

(assert (=> b!539433 (= e!312669 (bvslt (bvsub #b01111111111111111111111111111110 x!1030) #b00000000000000000000000000000000))))

(declare-fun b!539434 () Bool)

(assert (=> b!539434 (= e!312667 e!312668)))

(declare-fun res!334631 () Bool)

(assert (=> b!539434 (=> (not res!334631) (not e!312668))))

(declare-fun lt!247135 () SeekEntryResult!4870)

(assert (=> b!539434 (= res!334631 (or (= lt!247135 (MissingZero!4870 i!1153)) (= lt!247135 (MissingVacant!4870 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34146 (_ BitVec 32)) SeekEntryResult!4870)

(assert (=> b!539434 (= lt!247135 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539435 () Bool)

(declare-fun res!334633 () Bool)

(assert (=> b!539435 (=> (not res!334633) (not e!312667))))

(assert (=> b!539435 (= res!334633 (validKeyInArray!0 (select (arr!16412 a!3154) j!147)))))

(assert (= (and start!48934 res!334636) b!539425))

(assert (= (and b!539425 res!334639) b!539435))

(assert (= (and b!539435 res!334633) b!539427))

(assert (= (and b!539427 res!334637) b!539432))

(assert (= (and b!539432 res!334630) b!539434))

(assert (= (and b!539434 res!334631) b!539426))

(assert (= (and b!539426 res!334634) b!539430))

(assert (= (and b!539430 res!334632) b!539431))

(assert (= (and b!539431 res!334640) b!539428))

(assert (= (and b!539428 res!334635) b!539429))

(assert (= (and b!539429 res!334638) b!539433))

(declare-fun m!518449 () Bool)

(assert (=> b!539434 m!518449))

(declare-fun m!518451 () Bool)

(assert (=> b!539431 m!518451))

(declare-fun m!518453 () Bool)

(assert (=> b!539431 m!518453))

(assert (=> b!539429 m!518453))

(assert (=> b!539429 m!518453))

(declare-fun m!518455 () Bool)

(assert (=> b!539429 m!518455))

(assert (=> b!539429 m!518455))

(assert (=> b!539429 m!518453))

(declare-fun m!518457 () Bool)

(assert (=> b!539429 m!518457))

(assert (=> b!539428 m!518453))

(assert (=> b!539428 m!518453))

(declare-fun m!518459 () Bool)

(assert (=> b!539428 m!518459))

(declare-fun m!518461 () Bool)

(assert (=> b!539426 m!518461))

(declare-fun m!518463 () Bool)

(assert (=> start!48934 m!518463))

(declare-fun m!518465 () Bool)

(assert (=> start!48934 m!518465))

(declare-fun m!518467 () Bool)

(assert (=> b!539427 m!518467))

(declare-fun m!518469 () Bool)

(assert (=> b!539432 m!518469))

(declare-fun m!518471 () Bool)

(assert (=> b!539430 m!518471))

(assert (=> b!539435 m!518453))

(assert (=> b!539435 m!518453))

(declare-fun m!518473 () Bool)

(assert (=> b!539435 m!518473))

(push 1)

(assert (not start!48934))

(assert (not b!539434))

(assert (not b!539435))

(assert (not b!539429))

(assert (not b!539427))

(assert (not b!539426))

(assert (not b!539430))

(assert (not b!539432))

(assert (not b!539428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

