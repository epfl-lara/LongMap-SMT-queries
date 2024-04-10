; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48660 () Bool)

(assert start!48660)

(declare-fun b!534596 () Bool)

(declare-fun res!329809 () Bool)

(declare-fun e!310760 () Bool)

(assert (=> b!534596 (=> (not res!329809) (not e!310760))))

(declare-datatypes ((array!33872 0))(
  ( (array!33873 (arr!16275 (Array (_ BitVec 32) (_ BitVec 64))) (size!16639 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33872)

(declare-datatypes ((List!10394 0))(
  ( (Nil!10391) (Cons!10390 (h!11333 (_ BitVec 64)) (t!16622 List!10394)) )
))
(declare-fun arrayNoDuplicates!0 (array!33872 (_ BitVec 32) List!10394) Bool)

(assert (=> b!534596 (= res!329809 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10391))))

(declare-fun b!534597 () Bool)

(declare-fun res!329802 () Bool)

(declare-fun e!310761 () Bool)

(assert (=> b!534597 (=> (not res!329802) (not e!310761))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534597 (= res!329802 (validKeyInArray!0 (select (arr!16275 a!3154) j!147)))))

(declare-fun b!534598 () Bool)

(declare-fun res!329801 () Bool)

(assert (=> b!534598 (=> (not res!329801) (not e!310761))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534598 (= res!329801 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534599 () Bool)

(declare-fun res!329808 () Bool)

(assert (=> b!534599 (=> (not res!329808) (not e!310761))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534599 (= res!329808 (and (= (size!16639 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16639 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16639 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534600 () Bool)

(assert (=> b!534600 (= e!310760 false)))

(declare-datatypes ((SeekEntryResult!4733 0))(
  ( (MissingZero!4733 (index!21156 (_ BitVec 32))) (Found!4733 (index!21157 (_ BitVec 32))) (Intermediate!4733 (undefined!5545 Bool) (index!21158 (_ BitVec 32)) (x!50116 (_ BitVec 32))) (Undefined!4733) (MissingVacant!4733 (index!21159 (_ BitVec 32))) )
))
(declare-fun lt!245665 () SeekEntryResult!4733)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33872 (_ BitVec 32)) SeekEntryResult!4733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534600 (= lt!245665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16275 a!3154) j!147) mask!3216) (select (arr!16275 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534601 () Bool)

(assert (=> b!534601 (= e!310761 e!310760)))

(declare-fun res!329803 () Bool)

(assert (=> b!534601 (=> (not res!329803) (not e!310760))))

(declare-fun lt!245664 () SeekEntryResult!4733)

(assert (=> b!534601 (= res!329803 (or (= lt!245664 (MissingZero!4733 i!1153)) (= lt!245664 (MissingVacant!4733 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33872 (_ BitVec 32)) SeekEntryResult!4733)

(assert (=> b!534601 (= lt!245664 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534602 () Bool)

(declare-fun res!329804 () Bool)

(assert (=> b!534602 (=> (not res!329804) (not e!310761))))

(assert (=> b!534602 (= res!329804 (validKeyInArray!0 k!1998))))

(declare-fun b!534603 () Bool)

(declare-fun res!329805 () Bool)

(assert (=> b!534603 (=> (not res!329805) (not e!310760))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534603 (= res!329805 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16639 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16639 a!3154)) (= (select (arr!16275 a!3154) resIndex!32) (select (arr!16275 a!3154) j!147))))))

(declare-fun b!534604 () Bool)

(declare-fun res!329806 () Bool)

(assert (=> b!534604 (=> (not res!329806) (not e!310760))))

(assert (=> b!534604 (= res!329806 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16275 a!3154) j!147) a!3154 mask!3216) (Intermediate!4733 false resIndex!32 resX!32)))))

(declare-fun b!534605 () Bool)

(declare-fun res!329807 () Bool)

(assert (=> b!534605 (=> (not res!329807) (not e!310760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33872 (_ BitVec 32)) Bool)

(assert (=> b!534605 (= res!329807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!329810 () Bool)

(assert (=> start!48660 (=> (not res!329810) (not e!310761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48660 (= res!329810 (validMask!0 mask!3216))))

(assert (=> start!48660 e!310761))

(assert (=> start!48660 true))

(declare-fun array_inv!12071 (array!33872) Bool)

(assert (=> start!48660 (array_inv!12071 a!3154)))

(assert (= (and start!48660 res!329810) b!534599))

(assert (= (and b!534599 res!329808) b!534597))

(assert (= (and b!534597 res!329802) b!534602))

(assert (= (and b!534602 res!329804) b!534598))

(assert (= (and b!534598 res!329801) b!534601))

(assert (= (and b!534601 res!329803) b!534605))

(assert (= (and b!534605 res!329807) b!534596))

(assert (= (and b!534596 res!329809) b!534603))

(assert (= (and b!534603 res!329805) b!534604))

(assert (= (and b!534604 res!329806) b!534600))

(declare-fun m!514293 () Bool)

(assert (=> b!534602 m!514293))

(declare-fun m!514295 () Bool)

(assert (=> b!534598 m!514295))

(declare-fun m!514297 () Bool)

(assert (=> b!534596 m!514297))

(declare-fun m!514299 () Bool)

(assert (=> b!534604 m!514299))

(assert (=> b!534604 m!514299))

(declare-fun m!514301 () Bool)

(assert (=> b!534604 m!514301))

(assert (=> b!534600 m!514299))

(assert (=> b!534600 m!514299))

(declare-fun m!514303 () Bool)

(assert (=> b!534600 m!514303))

(assert (=> b!534600 m!514303))

(assert (=> b!534600 m!514299))

(declare-fun m!514305 () Bool)

(assert (=> b!534600 m!514305))

(declare-fun m!514307 () Bool)

(assert (=> start!48660 m!514307))

(declare-fun m!514309 () Bool)

(assert (=> start!48660 m!514309))

(declare-fun m!514311 () Bool)

(assert (=> b!534605 m!514311))

(declare-fun m!514313 () Bool)

(assert (=> b!534603 m!514313))

(assert (=> b!534603 m!514299))

(declare-fun m!514315 () Bool)

(assert (=> b!534601 m!514315))

(assert (=> b!534597 m!514299))

(assert (=> b!534597 m!514299))

(declare-fun m!514317 () Bool)

(assert (=> b!534597 m!514317))

(push 1)

