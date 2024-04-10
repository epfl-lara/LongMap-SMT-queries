; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48912 () Bool)

(assert start!48912)

(declare-fun b!539103 () Bool)

(declare-fun res!334308 () Bool)

(declare-fun e!312561 () Bool)

(assert (=> b!539103 (=> (not res!334308) (not e!312561))))

(declare-datatypes ((array!34124 0))(
  ( (array!34125 (arr!16401 (Array (_ BitVec 32) (_ BitVec 64))) (size!16765 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34124)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539103 (= res!334308 (validKeyInArray!0 (select (arr!16401 a!3154) j!147)))))

(declare-fun b!539104 () Bool)

(declare-fun e!312559 () Bool)

(assert (=> b!539104 (= e!312561 e!312559)))

(declare-fun res!334309 () Bool)

(assert (=> b!539104 (=> (not res!334309) (not e!312559))))

(declare-datatypes ((SeekEntryResult!4859 0))(
  ( (MissingZero!4859 (index!21660 (_ BitVec 32))) (Found!4859 (index!21661 (_ BitVec 32))) (Intermediate!4859 (undefined!5671 Bool) (index!21662 (_ BitVec 32)) (x!50578 (_ BitVec 32))) (Undefined!4859) (MissingVacant!4859 (index!21663 (_ BitVec 32))) )
))
(declare-fun lt!247068 () SeekEntryResult!4859)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539104 (= res!334309 (or (= lt!247068 (MissingZero!4859 i!1153)) (= lt!247068 (MissingVacant!4859 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34124 (_ BitVec 32)) SeekEntryResult!4859)

(assert (=> b!539104 (= lt!247068 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539105 () Bool)

(declare-fun res!334315 () Bool)

(assert (=> b!539105 (=> (not res!334315) (not e!312561))))

(assert (=> b!539105 (= res!334315 (validKeyInArray!0 k!1998))))

(declare-fun res!334311 () Bool)

(assert (=> start!48912 (=> (not res!334311) (not e!312561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48912 (= res!334311 (validMask!0 mask!3216))))

(assert (=> start!48912 e!312561))

(assert (=> start!48912 true))

(declare-fun array_inv!12197 (array!34124) Bool)

(assert (=> start!48912 (array_inv!12197 a!3154)))

(declare-fun b!539106 () Bool)

(declare-fun res!334313 () Bool)

(assert (=> b!539106 (=> (not res!334313) (not e!312561))))

(assert (=> b!539106 (= res!334313 (and (= (size!16765 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16765 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16765 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539107 () Bool)

(declare-fun res!334314 () Bool)

(assert (=> b!539107 (=> (not res!334314) (not e!312561))))

(declare-fun arrayContainsKey!0 (array!34124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539107 (= res!334314 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539108 () Bool)

(declare-fun res!334316 () Bool)

(assert (=> b!539108 (=> (not res!334316) (not e!312559))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539108 (= res!334316 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16765 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16765 a!3154)) (= (select (arr!16401 a!3154) resIndex!32) (select (arr!16401 a!3154) j!147))))))

(declare-fun b!539109 () Bool)

(declare-fun res!334312 () Bool)

(assert (=> b!539109 (=> (not res!334312) (not e!312559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34124 (_ BitVec 32)) Bool)

(assert (=> b!539109 (= res!334312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539110 () Bool)

(declare-fun res!334310 () Bool)

(assert (=> b!539110 (=> (not res!334310) (not e!312559))))

(declare-datatypes ((List!10520 0))(
  ( (Nil!10517) (Cons!10516 (h!11459 (_ BitVec 64)) (t!16748 List!10520)) )
))
(declare-fun arrayNoDuplicates!0 (array!34124 (_ BitVec 32) List!10520) Bool)

(assert (=> b!539110 (= res!334310 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10517))))

(declare-fun b!539111 () Bool)

(assert (=> b!539111 (= e!312559 false)))

(declare-fun lt!247069 () SeekEntryResult!4859)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34124 (_ BitVec 32)) SeekEntryResult!4859)

(assert (=> b!539111 (= lt!247069 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16401 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48912 res!334311) b!539106))

(assert (= (and b!539106 res!334313) b!539103))

(assert (= (and b!539103 res!334308) b!539105))

(assert (= (and b!539105 res!334315) b!539107))

(assert (= (and b!539107 res!334314) b!539104))

(assert (= (and b!539104 res!334309) b!539109))

(assert (= (and b!539109 res!334312) b!539110))

(assert (= (and b!539110 res!334310) b!539108))

(assert (= (and b!539108 res!334316) b!539111))

(declare-fun m!518193 () Bool)

(assert (=> b!539105 m!518193))

(declare-fun m!518195 () Bool)

(assert (=> b!539109 m!518195))

(declare-fun m!518197 () Bool)

(assert (=> b!539108 m!518197))

(declare-fun m!518199 () Bool)

(assert (=> b!539108 m!518199))

(declare-fun m!518201 () Bool)

(assert (=> b!539104 m!518201))

(declare-fun m!518203 () Bool)

(assert (=> b!539110 m!518203))

(assert (=> b!539111 m!518199))

(assert (=> b!539111 m!518199))

(declare-fun m!518205 () Bool)

(assert (=> b!539111 m!518205))

(assert (=> b!539103 m!518199))

(assert (=> b!539103 m!518199))

(declare-fun m!518207 () Bool)

(assert (=> b!539103 m!518207))

(declare-fun m!518209 () Bool)

(assert (=> b!539107 m!518209))

(declare-fun m!518211 () Bool)

(assert (=> start!48912 m!518211))

(declare-fun m!518213 () Bool)

(assert (=> start!48912 m!518213))

(push 1)

