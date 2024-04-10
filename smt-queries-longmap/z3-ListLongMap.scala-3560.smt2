; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48932 () Bool)

(assert start!48932)

(declare-fun b!539392 () Bool)

(declare-fun e!312654 () Bool)

(declare-fun e!312657 () Bool)

(assert (=> b!539392 (= e!312654 e!312657)))

(declare-fun res!334607 () Bool)

(assert (=> b!539392 (=> (not res!334607) (not e!312657))))

(declare-datatypes ((SeekEntryResult!4869 0))(
  ( (MissingZero!4869 (index!21700 (_ BitVec 32))) (Found!4869 (index!21701 (_ BitVec 32))) (Intermediate!4869 (undefined!5681 Bool) (index!21702 (_ BitVec 32)) (x!50612 (_ BitVec 32))) (Undefined!4869) (MissingVacant!4869 (index!21703 (_ BitVec 32))) )
))
(declare-fun lt!247129 () SeekEntryResult!4869)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539392 (= res!334607 (or (= lt!247129 (MissingZero!4869 i!1153)) (= lt!247129 (MissingVacant!4869 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34144 0))(
  ( (array!34145 (arr!16411 (Array (_ BitVec 32) (_ BitVec 64))) (size!16775 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34144)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34144 (_ BitVec 32)) SeekEntryResult!4869)

(assert (=> b!539392 (= lt!247129 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539393 () Bool)

(declare-fun res!334606 () Bool)

(assert (=> b!539393 (=> (not res!334606) (not e!312654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539393 (= res!334606 (validKeyInArray!0 k0!1998))))

(declare-fun b!539394 () Bool)

(declare-fun res!334600 () Bool)

(assert (=> b!539394 (=> (not res!334600) (not e!312657))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539394 (= res!334600 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16775 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16775 a!3154)) (= (select (arr!16411 a!3154) resIndex!32) (select (arr!16411 a!3154) j!147))))))

(declare-fun b!539395 () Bool)

(declare-fun e!312655 () Bool)

(assert (=> b!539395 (= e!312657 e!312655)))

(declare-fun res!334599 () Bool)

(assert (=> b!539395 (=> (not res!334599) (not e!312655))))

(declare-fun lt!247128 () SeekEntryResult!4869)

(assert (=> b!539395 (= res!334599 (= lt!247128 (Intermediate!4869 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34144 (_ BitVec 32)) SeekEntryResult!4869)

(assert (=> b!539395 (= lt!247128 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16411 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539396 () Bool)

(declare-fun res!334603 () Bool)

(assert (=> b!539396 (=> (not res!334603) (not e!312654))))

(assert (=> b!539396 (= res!334603 (validKeyInArray!0 (select (arr!16411 a!3154) j!147)))))

(declare-fun b!539397 () Bool)

(declare-fun res!334601 () Bool)

(assert (=> b!539397 (=> (not res!334601) (not e!312657))))

(declare-datatypes ((List!10530 0))(
  ( (Nil!10527) (Cons!10526 (h!11469 (_ BitVec 64)) (t!16758 List!10530)) )
))
(declare-fun arrayNoDuplicates!0 (array!34144 (_ BitVec 32) List!10530) Bool)

(assert (=> b!539397 (= res!334601 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10527))))

(declare-fun b!539398 () Bool)

(assert (=> b!539398 (= e!312655 (bvslt (bvsub #b01111111111111111111111111111110 x!1030) #b00000000000000000000000000000000))))

(declare-fun res!334605 () Bool)

(assert (=> start!48932 (=> (not res!334605) (not e!312654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48932 (= res!334605 (validMask!0 mask!3216))))

(assert (=> start!48932 e!312654))

(assert (=> start!48932 true))

(declare-fun array_inv!12207 (array!34144) Bool)

(assert (=> start!48932 (array_inv!12207 a!3154)))

(declare-fun b!539399 () Bool)

(declare-fun res!334604 () Bool)

(assert (=> b!539399 (=> (not res!334604) (not e!312657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34144 (_ BitVec 32)) Bool)

(assert (=> b!539399 (= res!334604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539400 () Bool)

(declare-fun res!334597 () Bool)

(assert (=> b!539400 (=> (not res!334597) (not e!312655))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539400 (= res!334597 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) (select (arr!16411 a!3154) j!147) a!3154 mask!3216) lt!247128))))

(declare-fun b!539401 () Bool)

(declare-fun res!334598 () Bool)

(assert (=> b!539401 (=> (not res!334598) (not e!312654))))

(declare-fun arrayContainsKey!0 (array!34144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539401 (= res!334598 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539402 () Bool)

(declare-fun res!334602 () Bool)

(assert (=> b!539402 (=> (not res!334602) (not e!312654))))

(assert (=> b!539402 (= res!334602 (and (= (size!16775 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16775 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16775 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48932 res!334605) b!539402))

(assert (= (and b!539402 res!334602) b!539396))

(assert (= (and b!539396 res!334603) b!539393))

(assert (= (and b!539393 res!334606) b!539401))

(assert (= (and b!539401 res!334598) b!539392))

(assert (= (and b!539392 res!334607) b!539399))

(assert (= (and b!539399 res!334604) b!539397))

(assert (= (and b!539397 res!334601) b!539394))

(assert (= (and b!539394 res!334600) b!539395))

(assert (= (and b!539395 res!334599) b!539400))

(assert (= (and b!539400 res!334597) b!539398))

(declare-fun m!518423 () Bool)

(assert (=> b!539400 m!518423))

(assert (=> b!539400 m!518423))

(declare-fun m!518425 () Bool)

(assert (=> b!539400 m!518425))

(assert (=> b!539400 m!518425))

(assert (=> b!539400 m!518423))

(declare-fun m!518427 () Bool)

(assert (=> b!539400 m!518427))

(declare-fun m!518429 () Bool)

(assert (=> b!539393 m!518429))

(declare-fun m!518431 () Bool)

(assert (=> b!539392 m!518431))

(declare-fun m!518433 () Bool)

(assert (=> start!48932 m!518433))

(declare-fun m!518435 () Bool)

(assert (=> start!48932 m!518435))

(declare-fun m!518437 () Bool)

(assert (=> b!539401 m!518437))

(assert (=> b!539395 m!518423))

(assert (=> b!539395 m!518423))

(declare-fun m!518439 () Bool)

(assert (=> b!539395 m!518439))

(assert (=> b!539396 m!518423))

(assert (=> b!539396 m!518423))

(declare-fun m!518441 () Bool)

(assert (=> b!539396 m!518441))

(declare-fun m!518443 () Bool)

(assert (=> b!539399 m!518443))

(declare-fun m!518445 () Bool)

(assert (=> b!539397 m!518445))

(declare-fun m!518447 () Bool)

(assert (=> b!539394 m!518447))

(assert (=> b!539394 m!518423))

(check-sat (not b!539397) (not b!539392) (not b!539401) (not b!539393) (not b!539395) (not b!539399) (not start!48932) (not b!539400) (not b!539396))
(check-sat)
