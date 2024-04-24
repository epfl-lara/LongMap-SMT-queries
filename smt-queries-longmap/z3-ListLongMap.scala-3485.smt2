; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48370 () Bool)

(assert start!48370)

(declare-fun b!531523 () Bool)

(declare-fun res!327073 () Bool)

(declare-fun e!309605 () Bool)

(assert (=> b!531523 (=> (not res!327073) (not e!309605))))

(declare-datatypes ((array!33677 0))(
  ( (array!33678 (arr!16180 (Array (_ BitVec 32) (_ BitVec 64))) (size!16544 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33677)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531523 (= res!327073 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531524 () Bool)

(declare-fun res!327070 () Bool)

(declare-fun e!309604 () Bool)

(assert (=> b!531524 (=> (not res!327070) (not e!309604))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33677 (_ BitVec 32)) Bool)

(assert (=> b!531524 (= res!327070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531525 () Bool)

(declare-fun res!327069 () Bool)

(assert (=> b!531525 (=> (not res!327069) (not e!309605))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531525 (= res!327069 (and (= (size!16544 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16544 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16544 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531526 () Bool)

(assert (=> b!531526 (= e!309605 e!309604)))

(declare-fun res!327072 () Bool)

(assert (=> b!531526 (=> (not res!327072) (not e!309604))))

(declare-datatypes ((SeekEntryResult!4594 0))(
  ( (MissingZero!4594 (index!20600 (_ BitVec 32))) (Found!4594 (index!20601 (_ BitVec 32))) (Intermediate!4594 (undefined!5406 Bool) (index!20602 (_ BitVec 32)) (x!49725 (_ BitVec 32))) (Undefined!4594) (MissingVacant!4594 (index!20603 (_ BitVec 32))) )
))
(declare-fun lt!245046 () SeekEntryResult!4594)

(assert (=> b!531526 (= res!327072 (or (= lt!245046 (MissingZero!4594 i!1153)) (= lt!245046 (MissingVacant!4594 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33677 (_ BitVec 32)) SeekEntryResult!4594)

(assert (=> b!531526 (= lt!245046 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531527 () Bool)

(declare-fun res!327068 () Bool)

(assert (=> b!531527 (=> (not res!327068) (not e!309605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531527 (= res!327068 (validKeyInArray!0 (select (arr!16180 a!3154) j!147)))))

(declare-fun b!531529 () Bool)

(declare-fun res!327071 () Bool)

(assert (=> b!531529 (=> (not res!327071) (not e!309605))))

(assert (=> b!531529 (= res!327071 (validKeyInArray!0 k0!1998))))

(declare-fun b!531528 () Bool)

(assert (=> b!531528 (= e!309604 false)))

(declare-fun lt!245047 () Bool)

(declare-datatypes ((List!10206 0))(
  ( (Nil!10203) (Cons!10202 (h!11142 (_ BitVec 64)) (t!16426 List!10206)) )
))
(declare-fun arrayNoDuplicates!0 (array!33677 (_ BitVec 32) List!10206) Bool)

(assert (=> b!531528 (= lt!245047 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10203))))

(declare-fun res!327067 () Bool)

(assert (=> start!48370 (=> (not res!327067) (not e!309605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48370 (= res!327067 (validMask!0 mask!3216))))

(assert (=> start!48370 e!309605))

(assert (=> start!48370 true))

(declare-fun array_inv!12039 (array!33677) Bool)

(assert (=> start!48370 (array_inv!12039 a!3154)))

(assert (= (and start!48370 res!327067) b!531525))

(assert (= (and b!531525 res!327069) b!531527))

(assert (= (and b!531527 res!327068) b!531529))

(assert (= (and b!531529 res!327071) b!531523))

(assert (= (and b!531523 res!327073) b!531526))

(assert (= (and b!531526 res!327072) b!531524))

(assert (= (and b!531524 res!327070) b!531528))

(declare-fun m!512155 () Bool)

(assert (=> b!531526 m!512155))

(declare-fun m!512157 () Bool)

(assert (=> b!531524 m!512157))

(declare-fun m!512159 () Bool)

(assert (=> b!531523 m!512159))

(declare-fun m!512161 () Bool)

(assert (=> b!531528 m!512161))

(declare-fun m!512163 () Bool)

(assert (=> b!531529 m!512163))

(declare-fun m!512165 () Bool)

(assert (=> b!531527 m!512165))

(assert (=> b!531527 m!512165))

(declare-fun m!512167 () Bool)

(assert (=> b!531527 m!512167))

(declare-fun m!512169 () Bool)

(assert (=> start!48370 m!512169))

(declare-fun m!512171 () Bool)

(assert (=> start!48370 m!512171))

(check-sat (not b!531528) (not b!531524) (not start!48370) (not b!531527) (not b!531526) (not b!531529) (not b!531523))
(check-sat)
