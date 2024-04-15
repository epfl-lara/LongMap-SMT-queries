; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48990 () Bool)

(assert start!48990)

(declare-fun b!539635 () Bool)

(declare-fun res!334829 () Bool)

(declare-fun e!312733 () Bool)

(assert (=> b!539635 (=> (not res!334829) (not e!312733))))

(declare-datatypes ((array!34161 0))(
  ( (array!34162 (arr!16418 (Array (_ BitVec 32) (_ BitVec 64))) (size!16783 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34161)

(declare-datatypes ((List!10576 0))(
  ( (Nil!10573) (Cons!10572 (h!11518 (_ BitVec 64)) (t!16795 List!10576)) )
))
(declare-fun arrayNoDuplicates!0 (array!34161 (_ BitVec 32) List!10576) Bool)

(assert (=> b!539635 (= res!334829 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10573))))

(declare-fun b!539636 () Bool)

(declare-fun res!334823 () Bool)

(assert (=> b!539636 (=> (not res!334823) (not e!312733))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34161 (_ BitVec 32)) Bool)

(assert (=> b!539636 (= res!334823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539637 () Bool)

(declare-fun res!334826 () Bool)

(declare-fun e!312735 () Bool)

(assert (=> b!539637 (=> (not res!334826) (not e!312735))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539637 (= res!334826 (validKeyInArray!0 (select (arr!16418 a!3154) j!147)))))

(declare-fun b!539638 () Bool)

(declare-fun res!334830 () Bool)

(assert (=> b!539638 (=> (not res!334830) (not e!312733))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4873 0))(
  ( (MissingZero!4873 (index!21716 (_ BitVec 32))) (Found!4873 (index!21717 (_ BitVec 32))) (Intermediate!4873 (undefined!5685 Bool) (index!21718 (_ BitVec 32)) (x!50641 (_ BitVec 32))) (Undefined!4873) (MissingVacant!4873 (index!21719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34161 (_ BitVec 32)) SeekEntryResult!4873)

(assert (=> b!539638 (= res!334830 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16418 a!3154) j!147) a!3154 mask!3216) (Intermediate!4873 false resIndex!32 resX!32)))))

(declare-fun b!539639 () Bool)

(declare-fun res!334827 () Bool)

(assert (=> b!539639 (=> (not res!334827) (not e!312735))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539639 (= res!334827 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539640 () Bool)

(declare-fun res!334824 () Bool)

(assert (=> b!539640 (=> (not res!334824) (not e!312733))))

(assert (=> b!539640 (= res!334824 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16783 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16783 a!3154)) (= (select (arr!16418 a!3154) resIndex!32) (select (arr!16418 a!3154) j!147))))))

(declare-fun res!334832 () Bool)

(assert (=> start!48990 (=> (not res!334832) (not e!312735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48990 (= res!334832 (validMask!0 mask!3216))))

(assert (=> start!48990 e!312735))

(assert (=> start!48990 true))

(declare-fun array_inv!12301 (array!34161) Bool)

(assert (=> start!48990 (array_inv!12301 a!3154)))

(declare-fun b!539641 () Bool)

(assert (=> b!539641 (= e!312735 e!312733)))

(declare-fun res!334831 () Bool)

(assert (=> b!539641 (=> (not res!334831) (not e!312733))))

(declare-fun lt!247039 () SeekEntryResult!4873)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539641 (= res!334831 (or (= lt!247039 (MissingZero!4873 i!1153)) (= lt!247039 (MissingVacant!4873 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34161 (_ BitVec 32)) SeekEntryResult!4873)

(assert (=> b!539641 (= lt!247039 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539642 () Bool)

(declare-fun res!334828 () Bool)

(assert (=> b!539642 (=> (not res!334828) (not e!312735))))

(assert (=> b!539642 (= res!334828 (validKeyInArray!0 k0!1998))))

(declare-fun b!539643 () Bool)

(assert (=> b!539643 (= e!312733 false)))

(declare-fun lt!247038 () SeekEntryResult!4873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539643 (= lt!247038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16418 a!3154) j!147) mask!3216) (select (arr!16418 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539644 () Bool)

(declare-fun res!334825 () Bool)

(assert (=> b!539644 (=> (not res!334825) (not e!312735))))

(assert (=> b!539644 (= res!334825 (and (= (size!16783 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16783 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16783 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48990 res!334832) b!539644))

(assert (= (and b!539644 res!334825) b!539637))

(assert (= (and b!539637 res!334826) b!539642))

(assert (= (and b!539642 res!334828) b!539639))

(assert (= (and b!539639 res!334827) b!539641))

(assert (= (and b!539641 res!334831) b!539636))

(assert (= (and b!539636 res!334823) b!539635))

(assert (= (and b!539635 res!334829) b!539640))

(assert (= (and b!539640 res!334824) b!539638))

(assert (= (and b!539638 res!334830) b!539643))

(declare-fun m!518023 () Bool)

(assert (=> b!539640 m!518023))

(declare-fun m!518025 () Bool)

(assert (=> b!539640 m!518025))

(declare-fun m!518027 () Bool)

(assert (=> b!539642 m!518027))

(assert (=> b!539638 m!518025))

(assert (=> b!539638 m!518025))

(declare-fun m!518029 () Bool)

(assert (=> b!539638 m!518029))

(declare-fun m!518031 () Bool)

(assert (=> b!539636 m!518031))

(declare-fun m!518033 () Bool)

(assert (=> b!539635 m!518033))

(declare-fun m!518035 () Bool)

(assert (=> b!539639 m!518035))

(assert (=> b!539637 m!518025))

(assert (=> b!539637 m!518025))

(declare-fun m!518037 () Bool)

(assert (=> b!539637 m!518037))

(declare-fun m!518039 () Bool)

(assert (=> start!48990 m!518039))

(declare-fun m!518041 () Bool)

(assert (=> start!48990 m!518041))

(assert (=> b!539643 m!518025))

(assert (=> b!539643 m!518025))

(declare-fun m!518043 () Bool)

(assert (=> b!539643 m!518043))

(assert (=> b!539643 m!518043))

(assert (=> b!539643 m!518025))

(declare-fun m!518045 () Bool)

(assert (=> b!539643 m!518045))

(declare-fun m!518047 () Bool)

(assert (=> b!539641 m!518047))

(check-sat (not b!539643) (not b!539642) (not b!539637) (not b!539641) (not b!539639) (not b!539635) (not b!539636) (not start!48990) (not b!539638))
(check-sat)
