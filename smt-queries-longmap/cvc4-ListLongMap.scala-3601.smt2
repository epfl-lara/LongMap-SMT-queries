; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49600 () Bool)

(assert start!49600)

(declare-datatypes ((SeekEntryResult!4993 0))(
  ( (MissingZero!4993 (index!22196 (_ BitVec 32))) (Found!4993 (index!22197 (_ BitVec 32))) (Intermediate!4993 (undefined!5805 Bool) (index!22198 (_ BitVec 32)) (x!51121 (_ BitVec 32))) (Undefined!4993) (MissingVacant!4993 (index!22199 (_ BitVec 32))) )
))
(declare-fun lt!248932 () SeekEntryResult!4993)

(declare-fun b!545655 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248934 () SeekEntryResult!4993)

(declare-fun e!315393 () Bool)

(declare-fun lt!248930 () SeekEntryResult!4993)

(assert (=> b!545655 (= e!315393 (and (= lt!248932 lt!248930) (= lt!248934 lt!248932) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1030)) (bvsub #b01111111111111111111111111111110 x!1030))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248933 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34413 0))(
  ( (array!34414 (arr!16535 (Array (_ BitVec 32) (_ BitVec 64))) (size!16899 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34413)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34413 (_ BitVec 32)) SeekEntryResult!4993)

(assert (=> b!545655 (= lt!248932 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248933 (select (arr!16535 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545656 () Bool)

(declare-fun res!339589 () Bool)

(declare-fun e!315389 () Bool)

(assert (=> b!545656 (=> (not res!339589) (not e!315389))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545656 (= res!339589 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545657 () Bool)

(declare-fun e!315392 () Bool)

(assert (=> b!545657 (= e!315389 e!315392)))

(declare-fun res!339590 () Bool)

(assert (=> b!545657 (=> (not res!339590) (not e!315392))))

(declare-fun lt!248935 () SeekEntryResult!4993)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545657 (= res!339590 (or (= lt!248935 (MissingZero!4993 i!1153)) (= lt!248935 (MissingVacant!4993 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34413 (_ BitVec 32)) SeekEntryResult!4993)

(assert (=> b!545657 (= lt!248935 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!339588 () Bool)

(assert (=> start!49600 (=> (not res!339588) (not e!315389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49600 (= res!339588 (validMask!0 mask!3216))))

(assert (=> start!49600 e!315389))

(assert (=> start!49600 true))

(declare-fun array_inv!12331 (array!34413) Bool)

(assert (=> start!49600 (array_inv!12331 a!3154)))

(declare-fun b!545658 () Bool)

(declare-fun res!339593 () Bool)

(assert (=> b!545658 (=> (not res!339593) (not e!315389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545658 (= res!339593 (validKeyInArray!0 (select (arr!16535 a!3154) j!147)))))

(declare-fun b!545659 () Bool)

(declare-fun e!315391 () Bool)

(declare-fun e!315390 () Bool)

(assert (=> b!545659 (= e!315391 e!315390)))

(declare-fun res!339582 () Bool)

(assert (=> b!545659 (=> (not res!339582) (not e!315390))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248931 () SeekEntryResult!4993)

(assert (=> b!545659 (= res!339582 (and (= lt!248934 lt!248931) (not (= (select (arr!16535 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16535 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16535 a!3154) index!1177) (select (arr!16535 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545659 (= lt!248934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16535 a!3154) j!147) mask!3216) (select (arr!16535 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545660 () Bool)

(declare-fun res!339583 () Bool)

(assert (=> b!545660 (=> (not res!339583) (not e!315389))))

(assert (=> b!545660 (= res!339583 (and (= (size!16899 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16899 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16899 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545661 () Bool)

(assert (=> b!545661 (= e!315390 e!315393)))

(declare-fun res!339585 () Bool)

(assert (=> b!545661 (=> (not res!339585) (not e!315393))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545661 (= res!339585 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248933 #b00000000000000000000000000000000) (bvslt lt!248933 (size!16899 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545661 (= lt!248933 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545662 () Bool)

(declare-fun res!339591 () Bool)

(assert (=> b!545662 (=> (not res!339591) (not e!315392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34413 (_ BitVec 32)) Bool)

(assert (=> b!545662 (= res!339591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545663 () Bool)

(declare-fun res!339586 () Bool)

(assert (=> b!545663 (=> (not res!339586) (not e!315389))))

(assert (=> b!545663 (= res!339586 (validKeyInArray!0 k!1998))))

(declare-fun b!545664 () Bool)

(declare-fun res!339592 () Bool)

(assert (=> b!545664 (=> (not res!339592) (not e!315392))))

(declare-datatypes ((List!10654 0))(
  ( (Nil!10651) (Cons!10650 (h!11614 (_ BitVec 64)) (t!16882 List!10654)) )
))
(declare-fun arrayNoDuplicates!0 (array!34413 (_ BitVec 32) List!10654) Bool)

(assert (=> b!545664 (= res!339592 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10651))))

(declare-fun b!545665 () Bool)

(assert (=> b!545665 (= e!315392 e!315391)))

(declare-fun res!339584 () Bool)

(assert (=> b!545665 (=> (not res!339584) (not e!315391))))

(assert (=> b!545665 (= res!339584 (= lt!248931 lt!248930))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545665 (= lt!248930 (Intermediate!4993 false resIndex!32 resX!32))))

(assert (=> b!545665 (= lt!248931 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16535 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545666 () Bool)

(declare-fun res!339587 () Bool)

(assert (=> b!545666 (=> (not res!339587) (not e!315392))))

(assert (=> b!545666 (= res!339587 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16899 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16899 a!3154)) (= (select (arr!16535 a!3154) resIndex!32) (select (arr!16535 a!3154) j!147))))))

(assert (= (and start!49600 res!339588) b!545660))

(assert (= (and b!545660 res!339583) b!545658))

(assert (= (and b!545658 res!339593) b!545663))

(assert (= (and b!545663 res!339586) b!545656))

(assert (= (and b!545656 res!339589) b!545657))

(assert (= (and b!545657 res!339590) b!545662))

(assert (= (and b!545662 res!339591) b!545664))

(assert (= (and b!545664 res!339592) b!545666))

(assert (= (and b!545666 res!339587) b!545665))

(assert (= (and b!545665 res!339584) b!545659))

(assert (= (and b!545659 res!339582) b!545661))

(assert (= (and b!545661 res!339585) b!545655))

(declare-fun m!523201 () Bool)

(assert (=> start!49600 m!523201))

(declare-fun m!523203 () Bool)

(assert (=> start!49600 m!523203))

(declare-fun m!523205 () Bool)

(assert (=> b!545655 m!523205))

(assert (=> b!545655 m!523205))

(declare-fun m!523207 () Bool)

(assert (=> b!545655 m!523207))

(declare-fun m!523209 () Bool)

(assert (=> b!545656 m!523209))

(declare-fun m!523211 () Bool)

(assert (=> b!545662 m!523211))

(declare-fun m!523213 () Bool)

(assert (=> b!545657 m!523213))

(assert (=> b!545658 m!523205))

(assert (=> b!545658 m!523205))

(declare-fun m!523215 () Bool)

(assert (=> b!545658 m!523215))

(declare-fun m!523217 () Bool)

(assert (=> b!545663 m!523217))

(declare-fun m!523219 () Bool)

(assert (=> b!545661 m!523219))

(declare-fun m!523221 () Bool)

(assert (=> b!545666 m!523221))

(assert (=> b!545666 m!523205))

(assert (=> b!545665 m!523205))

(assert (=> b!545665 m!523205))

(declare-fun m!523223 () Bool)

(assert (=> b!545665 m!523223))

(declare-fun m!523225 () Bool)

(assert (=> b!545659 m!523225))

(assert (=> b!545659 m!523205))

(assert (=> b!545659 m!523205))

(declare-fun m!523227 () Bool)

(assert (=> b!545659 m!523227))

(assert (=> b!545659 m!523227))

(assert (=> b!545659 m!523205))

(declare-fun m!523229 () Bool)

(assert (=> b!545659 m!523229))

(declare-fun m!523231 () Bool)

(assert (=> b!545664 m!523231))

(push 1)

(assert (not b!545659))

(assert (not b!545657))

(assert (not b!545663))

(assert (not b!545658))

(assert (not b!545655))

(assert (not b!545665))

(assert (not b!545664))

(assert (not b!545661))

(assert (not b!545662))

(assert (not b!545656))

(assert (not start!49600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

