; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49522 () Bool)

(assert start!49522)

(declare-fun b!545034 () Bool)

(declare-fun res!339141 () Bool)

(declare-fun e!315054 () Bool)

(assert (=> b!545034 (=> (not res!339141) (not e!315054))))

(declare-datatypes ((array!34392 0))(
  ( (array!34393 (arr!16526 (Array (_ BitVec 32) (_ BitVec 64))) (size!16890 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34392)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545034 (= res!339141 (validKeyInArray!0 (select (arr!16526 a!3154) j!147)))))

(declare-fun b!545035 () Bool)

(declare-fun res!339146 () Bool)

(declare-fun e!315055 () Bool)

(assert (=> b!545035 (=> (not res!339146) (not e!315055))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!545035 (= res!339146 (and (not (= (select (arr!16526 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16526 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16526 a!3154) index!1177) (select (arr!16526 a!3154) j!147)))))))

(declare-fun b!545036 () Bool)

(declare-fun e!315056 () Bool)

(assert (=> b!545036 (= e!315054 e!315056)))

(declare-fun res!339138 () Bool)

(assert (=> b!545036 (=> (not res!339138) (not e!315056))))

(declare-datatypes ((SeekEntryResult!4984 0))(
  ( (MissingZero!4984 (index!22160 (_ BitVec 32))) (Found!4984 (index!22161 (_ BitVec 32))) (Intermediate!4984 (undefined!5796 Bool) (index!22162 (_ BitVec 32)) (x!51079 (_ BitVec 32))) (Undefined!4984) (MissingVacant!4984 (index!22163 (_ BitVec 32))) )
))
(declare-fun lt!248678 () SeekEntryResult!4984)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545036 (= res!339138 (or (= lt!248678 (MissingZero!4984 i!1153)) (= lt!248678 (MissingVacant!4984 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34392 (_ BitVec 32)) SeekEntryResult!4984)

(assert (=> b!545036 (= lt!248678 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545037 () Bool)

(declare-fun res!339142 () Bool)

(assert (=> b!545037 (=> (not res!339142) (not e!315056))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545037 (= res!339142 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16890 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16890 a!3154)) (= (select (arr!16526 a!3154) resIndex!32) (select (arr!16526 a!3154) j!147))))))

(declare-fun b!545038 () Bool)

(declare-fun res!339148 () Bool)

(assert (=> b!545038 (=> (not res!339148) (not e!315054))))

(assert (=> b!545038 (= res!339148 (and (= (size!16890 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16890 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16890 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545039 () Bool)

(assert (=> b!545039 (= e!315056 e!315055)))

(declare-fun res!339140 () Bool)

(assert (=> b!545039 (=> (not res!339140) (not e!315055))))

(declare-fun lt!248680 () SeekEntryResult!4984)

(assert (=> b!545039 (= res!339140 (= lt!248680 (Intermediate!4984 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34392 (_ BitVec 32)) SeekEntryResult!4984)

(assert (=> b!545039 (= lt!248680 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16526 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545040 () Bool)

(declare-fun res!339139 () Bool)

(assert (=> b!545040 (=> (not res!339139) (not e!315054))))

(assert (=> b!545040 (= res!339139 (validKeyInArray!0 k!1998))))

(declare-fun b!545041 () Bool)

(assert (=> b!545041 (= e!315055 false)))

(declare-fun lt!248679 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545041 (= lt!248679 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545042 () Bool)

(declare-fun res!339147 () Bool)

(assert (=> b!545042 (=> (not res!339147) (not e!315055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545042 (= res!339147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16526 a!3154) j!147) mask!3216) (select (arr!16526 a!3154) j!147) a!3154 mask!3216) lt!248680))))

(declare-fun b!545043 () Bool)

(declare-fun res!339143 () Bool)

(assert (=> b!545043 (=> (not res!339143) (not e!315056))))

(declare-datatypes ((List!10645 0))(
  ( (Nil!10642) (Cons!10641 (h!11602 (_ BitVec 64)) (t!16873 List!10645)) )
))
(declare-fun arrayNoDuplicates!0 (array!34392 (_ BitVec 32) List!10645) Bool)

(assert (=> b!545043 (= res!339143 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10642))))

(declare-fun b!545044 () Bool)

(declare-fun res!339145 () Bool)

(assert (=> b!545044 (=> (not res!339145) (not e!315054))))

(declare-fun arrayContainsKey!0 (array!34392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545044 (= res!339145 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545045 () Bool)

(declare-fun res!339144 () Bool)

(assert (=> b!545045 (=> (not res!339144) (not e!315056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34392 (_ BitVec 32)) Bool)

(assert (=> b!545045 (= res!339144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!339149 () Bool)

(assert (=> start!49522 (=> (not res!339149) (not e!315054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49522 (= res!339149 (validMask!0 mask!3216))))

(assert (=> start!49522 e!315054))

(assert (=> start!49522 true))

(declare-fun array_inv!12322 (array!34392) Bool)

(assert (=> start!49522 (array_inv!12322 a!3154)))

(assert (= (and start!49522 res!339149) b!545038))

(assert (= (and b!545038 res!339148) b!545034))

(assert (= (and b!545034 res!339141) b!545040))

(assert (= (and b!545040 res!339139) b!545044))

(assert (= (and b!545044 res!339145) b!545036))

(assert (= (and b!545036 res!339138) b!545045))

(assert (= (and b!545045 res!339144) b!545043))

(assert (= (and b!545043 res!339143) b!545037))

(assert (= (and b!545037 res!339142) b!545039))

(assert (= (and b!545039 res!339140) b!545042))

(assert (= (and b!545042 res!339147) b!545035))

(assert (= (and b!545035 res!339146) b!545041))

(declare-fun m!522753 () Bool)

(assert (=> b!545043 m!522753))

(declare-fun m!522755 () Bool)

(assert (=> b!545045 m!522755))

(declare-fun m!522757 () Bool)

(assert (=> b!545042 m!522757))

(assert (=> b!545042 m!522757))

(declare-fun m!522759 () Bool)

(assert (=> b!545042 m!522759))

(assert (=> b!545042 m!522759))

(assert (=> b!545042 m!522757))

(declare-fun m!522761 () Bool)

(assert (=> b!545042 m!522761))

(declare-fun m!522763 () Bool)

(assert (=> b!545041 m!522763))

(declare-fun m!522765 () Bool)

(assert (=> start!49522 m!522765))

(declare-fun m!522767 () Bool)

(assert (=> start!49522 m!522767))

(declare-fun m!522769 () Bool)

(assert (=> b!545035 m!522769))

(assert (=> b!545035 m!522757))

(declare-fun m!522771 () Bool)

(assert (=> b!545037 m!522771))

(assert (=> b!545037 m!522757))

(declare-fun m!522773 () Bool)

(assert (=> b!545044 m!522773))

(declare-fun m!522775 () Bool)

(assert (=> b!545036 m!522775))

(assert (=> b!545034 m!522757))

(assert (=> b!545034 m!522757))

(declare-fun m!522777 () Bool)

(assert (=> b!545034 m!522777))

(declare-fun m!522779 () Bool)

(assert (=> b!545040 m!522779))

(assert (=> b!545039 m!522757))

(assert (=> b!545039 m!522757))

(declare-fun m!522781 () Bool)

(assert (=> b!545039 m!522781))

(push 1)

(assert (not b!545039))

(assert (not b!545045))

(assert (not b!545044))

(assert (not b!545036))

