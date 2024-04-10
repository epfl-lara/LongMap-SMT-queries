; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48938 () Bool)

(assert start!48938)

(declare-fun b!539486 () Bool)

(declare-fun e!312685 () Bool)

(declare-fun e!312687 () Bool)

(assert (=> b!539486 (= e!312685 e!312687)))

(declare-fun res!334698 () Bool)

(assert (=> b!539486 (=> (not res!334698) (not e!312687))))

(declare-datatypes ((SeekEntryResult!4872 0))(
  ( (MissingZero!4872 (index!21712 (_ BitVec 32))) (Found!4872 (index!21713 (_ BitVec 32))) (Intermediate!4872 (undefined!5684 Bool) (index!21714 (_ BitVec 32)) (x!50623 (_ BitVec 32))) (Undefined!4872) (MissingVacant!4872 (index!21715 (_ BitVec 32))) )
))
(declare-fun lt!247146 () SeekEntryResult!4872)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539486 (= res!334698 (or (= lt!247146 (MissingZero!4872 i!1153)) (= lt!247146 (MissingVacant!4872 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34150 0))(
  ( (array!34151 (arr!16414 (Array (_ BitVec 32) (_ BitVec 64))) (size!16778 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34150)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34150 (_ BitVec 32)) SeekEntryResult!4872)

(assert (=> b!539486 (= lt!247146 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539487 () Bool)

(declare-fun res!334692 () Bool)

(assert (=> b!539487 (=> (not res!334692) (not e!312687))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!539487 (= res!334692 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16778 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16778 a!3154)) (= (select (arr!16414 a!3154) resIndex!32) (select (arr!16414 a!3154) j!147))))))

(declare-fun b!539488 () Bool)

(declare-fun res!334691 () Bool)

(assert (=> b!539488 (=> (not res!334691) (not e!312687))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34150 (_ BitVec 32)) SeekEntryResult!4872)

(assert (=> b!539488 (= res!334691 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16414 a!3154) j!147) a!3154 mask!3216) (Intermediate!4872 false resIndex!32 resX!32)))))

(declare-fun b!539490 () Bool)

(assert (=> b!539490 (= e!312687 false)))

(declare-fun lt!247147 () SeekEntryResult!4872)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539490 (= lt!247147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16414 a!3154) j!147) mask!3216) (select (arr!16414 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539491 () Bool)

(declare-fun res!334693 () Bool)

(assert (=> b!539491 (=> (not res!334693) (not e!312687))))

(declare-datatypes ((List!10533 0))(
  ( (Nil!10530) (Cons!10529 (h!11472 (_ BitVec 64)) (t!16761 List!10533)) )
))
(declare-fun arrayNoDuplicates!0 (array!34150 (_ BitVec 32) List!10533) Bool)

(assert (=> b!539491 (= res!334693 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10530))))

(declare-fun b!539492 () Bool)

(declare-fun res!334694 () Bool)

(assert (=> b!539492 (=> (not res!334694) (not e!312687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34150 (_ BitVec 32)) Bool)

(assert (=> b!539492 (= res!334694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539493 () Bool)

(declare-fun res!334695 () Bool)

(assert (=> b!539493 (=> (not res!334695) (not e!312685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539493 (= res!334695 (validKeyInArray!0 k0!1998))))

(declare-fun b!539494 () Bool)

(declare-fun res!334699 () Bool)

(assert (=> b!539494 (=> (not res!334699) (not e!312685))))

(declare-fun arrayContainsKey!0 (array!34150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539494 (= res!334699 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539495 () Bool)

(declare-fun res!334697 () Bool)

(assert (=> b!539495 (=> (not res!334697) (not e!312685))))

(assert (=> b!539495 (= res!334697 (validKeyInArray!0 (select (arr!16414 a!3154) j!147)))))

(declare-fun res!334696 () Bool)

(assert (=> start!48938 (=> (not res!334696) (not e!312685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48938 (= res!334696 (validMask!0 mask!3216))))

(assert (=> start!48938 e!312685))

(assert (=> start!48938 true))

(declare-fun array_inv!12210 (array!34150) Bool)

(assert (=> start!48938 (array_inv!12210 a!3154)))

(declare-fun b!539489 () Bool)

(declare-fun res!334700 () Bool)

(assert (=> b!539489 (=> (not res!334700) (not e!312685))))

(assert (=> b!539489 (= res!334700 (and (= (size!16778 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16778 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16778 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48938 res!334696) b!539489))

(assert (= (and b!539489 res!334700) b!539495))

(assert (= (and b!539495 res!334697) b!539493))

(assert (= (and b!539493 res!334695) b!539494))

(assert (= (and b!539494 res!334699) b!539486))

(assert (= (and b!539486 res!334698) b!539492))

(assert (= (and b!539492 res!334694) b!539491))

(assert (= (and b!539491 res!334693) b!539487))

(assert (= (and b!539487 res!334692) b!539488))

(assert (= (and b!539488 res!334691) b!539490))

(declare-fun m!518501 () Bool)

(assert (=> b!539488 m!518501))

(assert (=> b!539488 m!518501))

(declare-fun m!518503 () Bool)

(assert (=> b!539488 m!518503))

(declare-fun m!518505 () Bool)

(assert (=> b!539486 m!518505))

(declare-fun m!518507 () Bool)

(assert (=> start!48938 m!518507))

(declare-fun m!518509 () Bool)

(assert (=> start!48938 m!518509))

(declare-fun m!518511 () Bool)

(assert (=> b!539487 m!518511))

(assert (=> b!539487 m!518501))

(declare-fun m!518513 () Bool)

(assert (=> b!539493 m!518513))

(declare-fun m!518515 () Bool)

(assert (=> b!539491 m!518515))

(assert (=> b!539495 m!518501))

(assert (=> b!539495 m!518501))

(declare-fun m!518517 () Bool)

(assert (=> b!539495 m!518517))

(declare-fun m!518519 () Bool)

(assert (=> b!539492 m!518519))

(assert (=> b!539490 m!518501))

(assert (=> b!539490 m!518501))

(declare-fun m!518521 () Bool)

(assert (=> b!539490 m!518521))

(assert (=> b!539490 m!518521))

(assert (=> b!539490 m!518501))

(declare-fun m!518523 () Bool)

(assert (=> b!539490 m!518523))

(declare-fun m!518525 () Bool)

(assert (=> b!539494 m!518525))

(check-sat (not start!48938) (not b!539491) (not b!539494) (not b!539495) (not b!539490) (not b!539486) (not b!539493) (not b!539492) (not b!539488))
(check-sat)
