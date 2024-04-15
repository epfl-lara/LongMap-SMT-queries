; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48402 () Bool)

(assert start!48402)

(declare-fun b!531725 () Bool)

(declare-fun e!309631 () Bool)

(declare-fun e!309632 () Bool)

(assert (=> b!531725 (= e!309631 e!309632)))

(declare-fun res!327360 () Bool)

(assert (=> b!531725 (=> (not res!327360) (not e!309632))))

(declare-datatypes ((SeekEntryResult!4657 0))(
  ( (MissingZero!4657 (index!20852 (_ BitVec 32))) (Found!4657 (index!20853 (_ BitVec 32))) (Intermediate!4657 (undefined!5469 Bool) (index!20854 (_ BitVec 32)) (x!49834 (_ BitVec 32))) (Undefined!4657) (MissingVacant!4657 (index!20855 (_ BitVec 32))) )
))
(declare-fun lt!244879 () SeekEntryResult!4657)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531725 (= res!327360 (or (= lt!244879 (MissingZero!4657 i!1153)) (= lt!244879 (MissingVacant!4657 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33720 0))(
  ( (array!33721 (arr!16202 (Array (_ BitVec 32) (_ BitVec 64))) (size!16567 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33720)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33720 (_ BitVec 32)) SeekEntryResult!4657)

(assert (=> b!531725 (= lt!244879 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531726 () Bool)

(declare-fun res!327357 () Bool)

(assert (=> b!531726 (=> (not res!327357) (not e!309632))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!531726 (= res!327357 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16567 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16567 a!3154)) (= (select (arr!16202 a!3154) resIndex!32) (select (arr!16202 a!3154) j!147))))))

(declare-fun b!531727 () Bool)

(assert (=> b!531727 (= e!309632 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!531728 () Bool)

(declare-fun res!327363 () Bool)

(assert (=> b!531728 (=> (not res!327363) (not e!309632))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33720 (_ BitVec 32)) SeekEntryResult!4657)

(assert (=> b!531728 (= res!327363 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16202 a!3154) j!147) a!3154 mask!3216) (Intermediate!4657 false resIndex!32 resX!32)))))

(declare-fun b!531729 () Bool)

(declare-fun res!327358 () Bool)

(assert (=> b!531729 (=> (not res!327358) (not e!309631))))

(declare-fun arrayContainsKey!0 (array!33720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531729 (= res!327358 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531730 () Bool)

(declare-fun res!327359 () Bool)

(assert (=> b!531730 (=> (not res!327359) (not e!309631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531730 (= res!327359 (validKeyInArray!0 k0!1998))))

(declare-fun b!531731 () Bool)

(declare-fun res!327362 () Bool)

(assert (=> b!531731 (=> (not res!327362) (not e!309632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33720 (_ BitVec 32)) Bool)

(assert (=> b!531731 (= res!327362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531732 () Bool)

(declare-fun res!327364 () Bool)

(assert (=> b!531732 (=> (not res!327364) (not e!309631))))

(assert (=> b!531732 (= res!327364 (and (= (size!16567 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16567 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16567 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531733 () Bool)

(declare-fun res!327365 () Bool)

(assert (=> b!531733 (=> (not res!327365) (not e!309632))))

(declare-datatypes ((List!10360 0))(
  ( (Nil!10357) (Cons!10356 (h!11296 (_ BitVec 64)) (t!16579 List!10360)) )
))
(declare-fun arrayNoDuplicates!0 (array!33720 (_ BitVec 32) List!10360) Bool)

(assert (=> b!531733 (= res!327365 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10357))))

(declare-fun b!531724 () Bool)

(declare-fun res!327361 () Bool)

(assert (=> b!531724 (=> (not res!327361) (not e!309631))))

(assert (=> b!531724 (= res!327361 (validKeyInArray!0 (select (arr!16202 a!3154) j!147)))))

(declare-fun res!327356 () Bool)

(assert (=> start!48402 (=> (not res!327356) (not e!309631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48402 (= res!327356 (validMask!0 mask!3216))))

(assert (=> start!48402 e!309631))

(assert (=> start!48402 true))

(declare-fun array_inv!12085 (array!33720) Bool)

(assert (=> start!48402 (array_inv!12085 a!3154)))

(assert (= (and start!48402 res!327356) b!531732))

(assert (= (and b!531732 res!327364) b!531724))

(assert (= (and b!531724 res!327361) b!531730))

(assert (= (and b!531730 res!327359) b!531729))

(assert (= (and b!531729 res!327358) b!531725))

(assert (= (and b!531725 res!327360) b!531731))

(assert (= (and b!531731 res!327362) b!531733))

(assert (= (and b!531733 res!327365) b!531726))

(assert (= (and b!531726 res!327357) b!531728))

(assert (= (and b!531728 res!327363) b!531727))

(declare-fun m!511561 () Bool)

(assert (=> b!531726 m!511561))

(declare-fun m!511563 () Bool)

(assert (=> b!531726 m!511563))

(declare-fun m!511565 () Bool)

(assert (=> b!531725 m!511565))

(declare-fun m!511567 () Bool)

(assert (=> b!531729 m!511567))

(declare-fun m!511569 () Bool)

(assert (=> b!531731 m!511569))

(declare-fun m!511571 () Bool)

(assert (=> b!531733 m!511571))

(declare-fun m!511573 () Bool)

(assert (=> start!48402 m!511573))

(declare-fun m!511575 () Bool)

(assert (=> start!48402 m!511575))

(assert (=> b!531728 m!511563))

(assert (=> b!531728 m!511563))

(declare-fun m!511577 () Bool)

(assert (=> b!531728 m!511577))

(assert (=> b!531724 m!511563))

(assert (=> b!531724 m!511563))

(declare-fun m!511579 () Bool)

(assert (=> b!531724 m!511579))

(declare-fun m!511581 () Bool)

(assert (=> b!531730 m!511581))

(check-sat (not b!531724) (not b!531731) (not b!531725) (not b!531733) (not b!531728) (not b!531729) (not start!48402) (not b!531730))
(check-sat)
