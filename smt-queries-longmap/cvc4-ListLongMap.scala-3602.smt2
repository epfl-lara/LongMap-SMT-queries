; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49606 () Bool)

(assert start!49606)

(declare-fun b!545771 () Bool)

(declare-fun res!339698 () Bool)

(declare-fun e!315456 () Bool)

(assert (=> b!545771 (=> (not res!339698) (not e!315456))))

(declare-datatypes ((array!34419 0))(
  ( (array!34420 (arr!16538 (Array (_ BitVec 32) (_ BitVec 64))) (size!16902 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34419)

(declare-datatypes ((List!10657 0))(
  ( (Nil!10654) (Cons!10653 (h!11617 (_ BitVec 64)) (t!16885 List!10657)) )
))
(declare-fun arrayNoDuplicates!0 (array!34419 (_ BitVec 32) List!10657) Bool)

(assert (=> b!545771 (= res!339698 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10654))))

(declare-fun b!545773 () Bool)

(declare-fun res!339710 () Bool)

(declare-fun e!315451 () Bool)

(assert (=> b!545773 (=> (not res!339710) (not e!315451))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545773 (= res!339710 (validKeyInArray!0 (select (arr!16538 a!3154) j!147)))))

(declare-fun b!545774 () Bool)

(declare-fun res!339709 () Bool)

(assert (=> b!545774 (=> (not res!339709) (not e!315451))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!545774 (= res!339709 (validKeyInArray!0 k!1998))))

(declare-fun b!545775 () Bool)

(declare-fun res!339705 () Bool)

(assert (=> b!545775 (=> (not res!339705) (not e!315451))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545775 (= res!339705 (and (= (size!16902 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16902 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16902 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545776 () Bool)

(declare-fun e!315452 () Bool)

(assert (=> b!545776 (= e!315456 e!315452)))

(declare-fun res!339702 () Bool)

(assert (=> b!545776 (=> (not res!339702) (not e!315452))))

(declare-datatypes ((SeekEntryResult!4996 0))(
  ( (MissingZero!4996 (index!22208 (_ BitVec 32))) (Found!4996 (index!22209 (_ BitVec 32))) (Intermediate!4996 (undefined!5808 Bool) (index!22210 (_ BitVec 32)) (x!51132 (_ BitVec 32))) (Undefined!4996) (MissingVacant!4996 (index!22211 (_ BitVec 32))) )
))
(declare-fun lt!248992 () SeekEntryResult!4996)

(declare-fun lt!248994 () SeekEntryResult!4996)

(assert (=> b!545776 (= res!339702 (= lt!248992 lt!248994))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545776 (= lt!248994 (Intermediate!4996 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34419 (_ BitVec 32)) SeekEntryResult!4996)

(assert (=> b!545776 (= lt!248992 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16538 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545777 () Bool)

(declare-fun e!315454 () Bool)

(declare-fun e!315453 () Bool)

(assert (=> b!545777 (= e!315454 e!315453)))

(declare-fun res!339699 () Bool)

(assert (=> b!545777 (=> (not res!339699) (not e!315453))))

(declare-fun lt!248996 () (_ BitVec 32))

(assert (=> b!545777 (= res!339699 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248996 #b00000000000000000000000000000000) (bvslt lt!248996 (size!16902 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545777 (= lt!248996 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545778 () Bool)

(assert (=> b!545778 (= e!315451 e!315456)))

(declare-fun res!339704 () Bool)

(assert (=> b!545778 (=> (not res!339704) (not e!315456))))

(declare-fun lt!248995 () SeekEntryResult!4996)

(assert (=> b!545778 (= res!339704 (or (= lt!248995 (MissingZero!4996 i!1153)) (= lt!248995 (MissingVacant!4996 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34419 (_ BitVec 32)) SeekEntryResult!4996)

(assert (=> b!545778 (= lt!248995 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545779 () Bool)

(declare-fun res!339701 () Bool)

(assert (=> b!545779 (=> (not res!339701) (not e!315451))))

(declare-fun arrayContainsKey!0 (array!34419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545779 (= res!339701 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545772 () Bool)

(declare-fun res!339706 () Bool)

(assert (=> b!545772 (=> (not res!339706) (not e!315456))))

(assert (=> b!545772 (= res!339706 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16902 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16902 a!3154)) (= (select (arr!16538 a!3154) resIndex!32) (select (arr!16538 a!3154) j!147))))))

(declare-fun res!339703 () Bool)

(assert (=> start!49606 (=> (not res!339703) (not e!315451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49606 (= res!339703 (validMask!0 mask!3216))))

(assert (=> start!49606 e!315451))

(assert (=> start!49606 true))

(declare-fun array_inv!12334 (array!34419) Bool)

(assert (=> start!49606 (array_inv!12334 a!3154)))

(declare-fun b!545780 () Bool)

(declare-fun e!315450 () Bool)

(assert (=> b!545780 (= e!315450 (not true))))

(assert (=> b!545780 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248996 (select (store (arr!16538 a!3154) i!1153 k!1998) j!147) (array!34420 (store (arr!16538 a!3154) i!1153 k!1998) (size!16902 a!3154)) mask!3216) lt!248994)))

(declare-datatypes ((Unit!16926 0))(
  ( (Unit!16927) )
))
(declare-fun lt!248998 () Unit!16926)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16926)

(assert (=> b!545780 (= lt!248998 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!248996 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545781 () Bool)

(declare-fun res!339707 () Bool)

(assert (=> b!545781 (=> (not res!339707) (not e!315456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34419 (_ BitVec 32)) Bool)

(assert (=> b!545781 (= res!339707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545782 () Bool)

(assert (=> b!545782 (= e!315452 e!315454)))

(declare-fun res!339700 () Bool)

(assert (=> b!545782 (=> (not res!339700) (not e!315454))))

(declare-fun lt!248993 () SeekEntryResult!4996)

(assert (=> b!545782 (= res!339700 (and (= lt!248993 lt!248992) (not (= (select (arr!16538 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16538 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16538 a!3154) index!1177) (select (arr!16538 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545782 (= lt!248993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16538 a!3154) j!147) mask!3216) (select (arr!16538 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545783 () Bool)

(assert (=> b!545783 (= e!315453 e!315450)))

(declare-fun res!339708 () Bool)

(assert (=> b!545783 (=> (not res!339708) (not e!315450))))

(declare-fun lt!248997 () SeekEntryResult!4996)

(assert (=> b!545783 (= res!339708 (and (= lt!248997 lt!248994) (= lt!248993 lt!248997)))))

(assert (=> b!545783 (= lt!248997 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248996 (select (arr!16538 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49606 res!339703) b!545775))

(assert (= (and b!545775 res!339705) b!545773))

(assert (= (and b!545773 res!339710) b!545774))

(assert (= (and b!545774 res!339709) b!545779))

(assert (= (and b!545779 res!339701) b!545778))

(assert (= (and b!545778 res!339704) b!545781))

(assert (= (and b!545781 res!339707) b!545771))

(assert (= (and b!545771 res!339698) b!545772))

(assert (= (and b!545772 res!339706) b!545776))

(assert (= (and b!545776 res!339702) b!545782))

(assert (= (and b!545782 res!339700) b!545777))

(assert (= (and b!545777 res!339699) b!545783))

(assert (= (and b!545783 res!339708) b!545780))

(declare-fun m!523313 () Bool)

(assert (=> b!545782 m!523313))

(declare-fun m!523315 () Bool)

(assert (=> b!545782 m!523315))

(assert (=> b!545782 m!523315))

(declare-fun m!523317 () Bool)

(assert (=> b!545782 m!523317))

(assert (=> b!545782 m!523317))

(assert (=> b!545782 m!523315))

(declare-fun m!523319 () Bool)

(assert (=> b!545782 m!523319))

(assert (=> b!545773 m!523315))

(assert (=> b!545773 m!523315))

(declare-fun m!523321 () Bool)

(assert (=> b!545773 m!523321))

(assert (=> b!545783 m!523315))

(assert (=> b!545783 m!523315))

(declare-fun m!523323 () Bool)

(assert (=> b!545783 m!523323))

(declare-fun m!523325 () Bool)

(assert (=> b!545772 m!523325))

(assert (=> b!545772 m!523315))

(declare-fun m!523327 () Bool)

(assert (=> b!545780 m!523327))

(declare-fun m!523329 () Bool)

(assert (=> b!545780 m!523329))

(assert (=> b!545780 m!523329))

(declare-fun m!523331 () Bool)

(assert (=> b!545780 m!523331))

(declare-fun m!523333 () Bool)

(assert (=> b!545780 m!523333))

(declare-fun m!523335 () Bool)

(assert (=> b!545779 m!523335))

(declare-fun m!523337 () Bool)

(assert (=> b!545778 m!523337))

(assert (=> b!545776 m!523315))

(assert (=> b!545776 m!523315))

(declare-fun m!523339 () Bool)

(assert (=> b!545776 m!523339))

(declare-fun m!523341 () Bool)

(assert (=> b!545777 m!523341))

(declare-fun m!523343 () Bool)

(assert (=> b!545774 m!523343))

(declare-fun m!523345 () Bool)

(assert (=> b!545781 m!523345))

(declare-fun m!523347 () Bool)

(assert (=> start!49606 m!523347))

(declare-fun m!523349 () Bool)

(assert (=> start!49606 m!523349))

(declare-fun m!523351 () Bool)

(assert (=> b!545771 m!523351))

(push 1)

