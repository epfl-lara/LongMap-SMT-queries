; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48922 () Bool)

(assert start!48922)

(declare-fun b!539246 () Bool)

(declare-fun res!334458 () Bool)

(declare-fun e!312605 () Bool)

(assert (=> b!539246 (=> (not res!334458) (not e!312605))))

(declare-datatypes ((array!34134 0))(
  ( (array!34135 (arr!16406 (Array (_ BitVec 32) (_ BitVec 64))) (size!16770 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34134)

(declare-datatypes ((List!10525 0))(
  ( (Nil!10522) (Cons!10521 (h!11464 (_ BitVec 64)) (t!16753 List!10525)) )
))
(declare-fun arrayNoDuplicates!0 (array!34134 (_ BitVec 32) List!10525) Bool)

(assert (=> b!539246 (= res!334458 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10522))))

(declare-fun b!539247 () Bool)

(declare-fun res!334459 () Bool)

(assert (=> b!539247 (=> (not res!334459) (not e!312605))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4864 0))(
  ( (MissingZero!4864 (index!21680 (_ BitVec 32))) (Found!4864 (index!21681 (_ BitVec 32))) (Intermediate!4864 (undefined!5676 Bool) (index!21682 (_ BitVec 32)) (x!50591 (_ BitVec 32))) (Undefined!4864) (MissingVacant!4864 (index!21683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34134 (_ BitVec 32)) SeekEntryResult!4864)

(assert (=> b!539247 (= res!334459 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16406 a!3154) j!147) a!3154 mask!3216) (Intermediate!4864 false resIndex!32 resX!32)))))

(declare-fun b!539248 () Bool)

(assert (=> b!539248 (= e!312605 false)))

(declare-fun lt!247098 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539248 (= lt!247098 (toIndex!0 (select (arr!16406 a!3154) j!147) mask!3216))))

(declare-fun b!539249 () Bool)

(declare-fun res!334451 () Bool)

(declare-fun e!312606 () Bool)

(assert (=> b!539249 (=> (not res!334451) (not e!312606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539249 (= res!334451 (validKeyInArray!0 (select (arr!16406 a!3154) j!147)))))

(declare-fun res!334453 () Bool)

(assert (=> start!48922 (=> (not res!334453) (not e!312606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48922 (= res!334453 (validMask!0 mask!3216))))

(assert (=> start!48922 e!312606))

(assert (=> start!48922 true))

(declare-fun array_inv!12202 (array!34134) Bool)

(assert (=> start!48922 (array_inv!12202 a!3154)))

(declare-fun b!539250 () Bool)

(declare-fun res!334454 () Bool)

(assert (=> b!539250 (=> (not res!334454) (not e!312605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34134 (_ BitVec 32)) Bool)

(assert (=> b!539250 (= res!334454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539251 () Bool)

(declare-fun res!334460 () Bool)

(assert (=> b!539251 (=> (not res!334460) (not e!312606))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539251 (= res!334460 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539252 () Bool)

(assert (=> b!539252 (= e!312606 e!312605)))

(declare-fun res!334455 () Bool)

(assert (=> b!539252 (=> (not res!334455) (not e!312605))))

(declare-fun lt!247099 () SeekEntryResult!4864)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539252 (= res!334455 (or (= lt!247099 (MissingZero!4864 i!1153)) (= lt!247099 (MissingVacant!4864 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34134 (_ BitVec 32)) SeekEntryResult!4864)

(assert (=> b!539252 (= lt!247099 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539253 () Bool)

(declare-fun res!334452 () Bool)

(assert (=> b!539253 (=> (not res!334452) (not e!312605))))

(assert (=> b!539253 (= res!334452 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16770 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16770 a!3154)) (= (select (arr!16406 a!3154) resIndex!32) (select (arr!16406 a!3154) j!147))))))

(declare-fun b!539254 () Bool)

(declare-fun res!334457 () Bool)

(assert (=> b!539254 (=> (not res!334457) (not e!312606))))

(assert (=> b!539254 (= res!334457 (and (= (size!16770 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16770 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16770 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539255 () Bool)

(declare-fun res!334456 () Bool)

(assert (=> b!539255 (=> (not res!334456) (not e!312606))))

(assert (=> b!539255 (= res!334456 (validKeyInArray!0 k!1998))))

(assert (= (and start!48922 res!334453) b!539254))

(assert (= (and b!539254 res!334457) b!539249))

(assert (= (and b!539249 res!334451) b!539255))

(assert (= (and b!539255 res!334456) b!539251))

(assert (= (and b!539251 res!334460) b!539252))

(assert (= (and b!539252 res!334455) b!539250))

(assert (= (and b!539250 res!334454) b!539246))

(assert (= (and b!539246 res!334458) b!539253))

(assert (= (and b!539253 res!334452) b!539247))

(assert (= (and b!539247 res!334459) b!539248))

(declare-fun m!518307 () Bool)

(assert (=> b!539250 m!518307))

(declare-fun m!518309 () Bool)

(assert (=> b!539246 m!518309))

(declare-fun m!518311 () Bool)

(assert (=> b!539252 m!518311))

(declare-fun m!518313 () Bool)

(assert (=> b!539248 m!518313))

(assert (=> b!539248 m!518313))

(declare-fun m!518315 () Bool)

(assert (=> b!539248 m!518315))

(assert (=> b!539247 m!518313))

(assert (=> b!539247 m!518313))

(declare-fun m!518317 () Bool)

(assert (=> b!539247 m!518317))

(declare-fun m!518319 () Bool)

(assert (=> b!539253 m!518319))

(assert (=> b!539253 m!518313))

(declare-fun m!518321 () Bool)

(assert (=> b!539255 m!518321))

(declare-fun m!518323 () Bool)

(assert (=> b!539251 m!518323))

(assert (=> b!539249 m!518313))

(assert (=> b!539249 m!518313))

(declare-fun m!518325 () Bool)

(assert (=> b!539249 m!518325))

(declare-fun m!518327 () Bool)

(assert (=> start!48922 m!518327))

(declare-fun m!518329 () Bool)

(assert (=> start!48922 m!518329))

(push 1)

(assert (not b!539252))

(assert (not b!539249))

(assert (not b!539251))

(assert (not b!539255))

(assert (not b!539246))

(assert (not b!539248))

(assert (not b!539247))

(assert (not start!48922))

(assert (not b!539250))

