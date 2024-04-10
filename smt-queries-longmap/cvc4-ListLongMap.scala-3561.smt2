; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48940 () Bool)

(assert start!48940)

(declare-fun b!539517 () Bool)

(declare-fun e!312696 () Bool)

(declare-fun e!312694 () Bool)

(assert (=> b!539517 (= e!312696 e!312694)))

(declare-fun res!334724 () Bool)

(assert (=> b!539517 (=> (not res!334724) (not e!312694))))

(declare-datatypes ((SeekEntryResult!4873 0))(
  ( (MissingZero!4873 (index!21716 (_ BitVec 32))) (Found!4873 (index!21717 (_ BitVec 32))) (Intermediate!4873 (undefined!5685 Bool) (index!21718 (_ BitVec 32)) (x!50624 (_ BitVec 32))) (Undefined!4873) (MissingVacant!4873 (index!21719 (_ BitVec 32))) )
))
(declare-fun lt!247153 () SeekEntryResult!4873)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539517 (= res!334724 (or (= lt!247153 (MissingZero!4873 i!1153)) (= lt!247153 (MissingVacant!4873 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34152 0))(
  ( (array!34153 (arr!16415 (Array (_ BitVec 32) (_ BitVec 64))) (size!16779 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34152)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34152 (_ BitVec 32)) SeekEntryResult!4873)

(assert (=> b!539517 (= lt!247153 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539518 () Bool)

(declare-fun res!334730 () Bool)

(assert (=> b!539518 (=> (not res!334730) (not e!312694))))

(declare-datatypes ((List!10534 0))(
  ( (Nil!10531) (Cons!10530 (h!11473 (_ BitVec 64)) (t!16762 List!10534)) )
))
(declare-fun arrayNoDuplicates!0 (array!34152 (_ BitVec 32) List!10534) Bool)

(assert (=> b!539518 (= res!334730 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10531))))

(declare-fun b!539519 () Bool)

(declare-fun res!334728 () Bool)

(assert (=> b!539519 (=> (not res!334728) (not e!312694))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34152 (_ BitVec 32)) SeekEntryResult!4873)

(assert (=> b!539519 (= res!334728 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16415 a!3154) j!147) a!3154 mask!3216) (Intermediate!4873 false resIndex!32 resX!32)))))

(declare-fun b!539520 () Bool)

(declare-fun res!334723 () Bool)

(assert (=> b!539520 (=> (not res!334723) (not e!312696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539520 (= res!334723 (validKeyInArray!0 k!1998))))

(declare-fun b!539521 () Bool)

(declare-fun res!334721 () Bool)

(assert (=> b!539521 (=> (not res!334721) (not e!312694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34152 (_ BitVec 32)) Bool)

(assert (=> b!539521 (= res!334721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539522 () Bool)

(declare-fun res!334727 () Bool)

(assert (=> b!539522 (=> (not res!334727) (not e!312696))))

(assert (=> b!539522 (= res!334727 (and (= (size!16779 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16779 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16779 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539516 () Bool)

(declare-fun res!334725 () Bool)

(assert (=> b!539516 (=> (not res!334725) (not e!312696))))

(declare-fun arrayContainsKey!0 (array!34152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539516 (= res!334725 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!334729 () Bool)

(assert (=> start!48940 (=> (not res!334729) (not e!312696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48940 (= res!334729 (validMask!0 mask!3216))))

(assert (=> start!48940 e!312696))

(assert (=> start!48940 true))

(declare-fun array_inv!12211 (array!34152) Bool)

(assert (=> start!48940 (array_inv!12211 a!3154)))

(declare-fun b!539523 () Bool)

(declare-fun res!334726 () Bool)

(assert (=> b!539523 (=> (not res!334726) (not e!312694))))

(assert (=> b!539523 (= res!334726 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16779 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16779 a!3154)) (= (select (arr!16415 a!3154) resIndex!32) (select (arr!16415 a!3154) j!147))))))

(declare-fun b!539524 () Bool)

(assert (=> b!539524 (= e!312694 false)))

(declare-fun lt!247152 () SeekEntryResult!4873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539524 (= lt!247152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) (select (arr!16415 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539525 () Bool)

(declare-fun res!334722 () Bool)

(assert (=> b!539525 (=> (not res!334722) (not e!312696))))

(assert (=> b!539525 (= res!334722 (validKeyInArray!0 (select (arr!16415 a!3154) j!147)))))

(assert (= (and start!48940 res!334729) b!539522))

(assert (= (and b!539522 res!334727) b!539525))

(assert (= (and b!539525 res!334722) b!539520))

(assert (= (and b!539520 res!334723) b!539516))

(assert (= (and b!539516 res!334725) b!539517))

(assert (= (and b!539517 res!334724) b!539521))

(assert (= (and b!539521 res!334721) b!539518))

(assert (= (and b!539518 res!334730) b!539523))

(assert (= (and b!539523 res!334726) b!539519))

(assert (= (and b!539519 res!334728) b!539524))

(declare-fun m!518527 () Bool)

(assert (=> b!539518 m!518527))

(declare-fun m!518529 () Bool)

(assert (=> b!539516 m!518529))

(declare-fun m!518531 () Bool)

(assert (=> b!539525 m!518531))

(assert (=> b!539525 m!518531))

(declare-fun m!518533 () Bool)

(assert (=> b!539525 m!518533))

(declare-fun m!518535 () Bool)

(assert (=> b!539523 m!518535))

(assert (=> b!539523 m!518531))

(assert (=> b!539524 m!518531))

(assert (=> b!539524 m!518531))

(declare-fun m!518537 () Bool)

(assert (=> b!539524 m!518537))

(assert (=> b!539524 m!518537))

(assert (=> b!539524 m!518531))

(declare-fun m!518539 () Bool)

(assert (=> b!539524 m!518539))

(declare-fun m!518541 () Bool)

(assert (=> start!48940 m!518541))

(declare-fun m!518543 () Bool)

(assert (=> start!48940 m!518543))

(declare-fun m!518545 () Bool)

(assert (=> b!539520 m!518545))

(assert (=> b!539519 m!518531))

(assert (=> b!539519 m!518531))

(declare-fun m!518547 () Bool)

(assert (=> b!539519 m!518547))

(declare-fun m!518549 () Bool)

(assert (=> b!539517 m!518549))

(declare-fun m!518551 () Bool)

(assert (=> b!539521 m!518551))

(push 1)

