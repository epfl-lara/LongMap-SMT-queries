; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48556 () Bool)

(assert start!48556)

(declare-fun b!533120 () Bool)

(declare-fun res!328384 () Bool)

(declare-fun e!310290 () Bool)

(assert (=> b!533120 (=> (not res!328384) (not e!310290))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33767 0))(
  ( (array!33768 (arr!16222 (Array (_ BitVec 32) (_ BitVec 64))) (size!16586 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33767)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533120 (= res!328384 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16586 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16586 a!3154)) (= (select (arr!16222 a!3154) resIndex!32) (select (arr!16222 a!3154) j!147))))))

(declare-fun b!533121 () Bool)

(declare-fun res!328379 () Bool)

(declare-fun e!310288 () Bool)

(assert (=> b!533121 (=> (not res!328379) (not e!310288))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533121 (= res!328379 (validKeyInArray!0 k0!1998))))

(declare-fun b!533122 () Bool)

(declare-fun res!328383 () Bool)

(assert (=> b!533122 (=> (not res!328383) (not e!310288))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533122 (= res!328383 (and (= (size!16586 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16586 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16586 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533123 () Bool)

(declare-fun res!328381 () Bool)

(assert (=> b!533123 (=> (not res!328381) (not e!310290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33767 (_ BitVec 32)) Bool)

(assert (=> b!533123 (= res!328381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533124 () Bool)

(assert (=> b!533124 (= e!310290 false)))

(declare-datatypes ((SeekEntryResult!4636 0))(
  ( (MissingZero!4636 (index!20768 (_ BitVec 32))) (Found!4636 (index!20769 (_ BitVec 32))) (Intermediate!4636 (undefined!5448 Bool) (index!20770 (_ BitVec 32)) (x!49888 (_ BitVec 32))) (Undefined!4636) (MissingVacant!4636 (index!20771 (_ BitVec 32))) )
))
(declare-fun lt!245415 () SeekEntryResult!4636)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33767 (_ BitVec 32)) SeekEntryResult!4636)

(assert (=> b!533124 (= lt!245415 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16222 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533125 () Bool)

(declare-fun res!328387 () Bool)

(assert (=> b!533125 (=> (not res!328387) (not e!310290))))

(declare-datatypes ((List!10248 0))(
  ( (Nil!10245) (Cons!10244 (h!11187 (_ BitVec 64)) (t!16468 List!10248)) )
))
(declare-fun arrayNoDuplicates!0 (array!33767 (_ BitVec 32) List!10248) Bool)

(assert (=> b!533125 (= res!328387 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10245))))

(declare-fun res!328382 () Bool)

(assert (=> start!48556 (=> (not res!328382) (not e!310288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48556 (= res!328382 (validMask!0 mask!3216))))

(assert (=> start!48556 e!310288))

(assert (=> start!48556 true))

(declare-fun array_inv!12081 (array!33767) Bool)

(assert (=> start!48556 (array_inv!12081 a!3154)))

(declare-fun b!533126 () Bool)

(declare-fun res!328386 () Bool)

(assert (=> b!533126 (=> (not res!328386) (not e!310288))))

(assert (=> b!533126 (= res!328386 (validKeyInArray!0 (select (arr!16222 a!3154) j!147)))))

(declare-fun b!533127 () Bool)

(assert (=> b!533127 (= e!310288 e!310290)))

(declare-fun res!328380 () Bool)

(assert (=> b!533127 (=> (not res!328380) (not e!310290))))

(declare-fun lt!245416 () SeekEntryResult!4636)

(assert (=> b!533127 (= res!328380 (or (= lt!245416 (MissingZero!4636 i!1153)) (= lt!245416 (MissingVacant!4636 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33767 (_ BitVec 32)) SeekEntryResult!4636)

(assert (=> b!533127 (= lt!245416 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533128 () Bool)

(declare-fun res!328385 () Bool)

(assert (=> b!533128 (=> (not res!328385) (not e!310288))))

(declare-fun arrayContainsKey!0 (array!33767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533128 (= res!328385 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48556 res!328382) b!533122))

(assert (= (and b!533122 res!328383) b!533126))

(assert (= (and b!533126 res!328386) b!533121))

(assert (= (and b!533121 res!328379) b!533128))

(assert (= (and b!533128 res!328385) b!533127))

(assert (= (and b!533127 res!328380) b!533123))

(assert (= (and b!533123 res!328381) b!533125))

(assert (= (and b!533125 res!328387) b!533120))

(assert (= (and b!533120 res!328384) b!533124))

(declare-fun m!513301 () Bool)

(assert (=> b!533128 m!513301))

(declare-fun m!513303 () Bool)

(assert (=> b!533124 m!513303))

(assert (=> b!533124 m!513303))

(declare-fun m!513305 () Bool)

(assert (=> b!533124 m!513305))

(declare-fun m!513307 () Bool)

(assert (=> start!48556 m!513307))

(declare-fun m!513309 () Bool)

(assert (=> start!48556 m!513309))

(assert (=> b!533126 m!513303))

(assert (=> b!533126 m!513303))

(declare-fun m!513311 () Bool)

(assert (=> b!533126 m!513311))

(declare-fun m!513313 () Bool)

(assert (=> b!533123 m!513313))

(declare-fun m!513315 () Bool)

(assert (=> b!533121 m!513315))

(declare-fun m!513317 () Bool)

(assert (=> b!533125 m!513317))

(declare-fun m!513319 () Bool)

(assert (=> b!533120 m!513319))

(assert (=> b!533120 m!513303))

(declare-fun m!513321 () Bool)

(assert (=> b!533127 m!513321))

(check-sat (not b!533127) (not b!533128) (not b!533125) (not b!533126) (not b!533123) (not b!533121) (not b!533124) (not start!48556))
(check-sat)
