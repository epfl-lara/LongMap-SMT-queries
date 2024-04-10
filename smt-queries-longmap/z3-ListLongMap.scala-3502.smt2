; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48584 () Bool)

(assert start!48584)

(declare-fun b!533465 () Bool)

(declare-fun e!310417 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!533465 (= e!310417 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!533466 () Bool)

(declare-fun res!328678 () Bool)

(assert (=> b!533466 (=> (not res!328678) (not e!310417))))

(declare-datatypes ((array!33796 0))(
  ( (array!33797 (arr!16237 (Array (_ BitVec 32) (_ BitVec 64))) (size!16601 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33796)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33796 (_ BitVec 32)) Bool)

(assert (=> b!533466 (= res!328678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328672 () Bool)

(declare-fun e!310419 () Bool)

(assert (=> start!48584 (=> (not res!328672) (not e!310419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48584 (= res!328672 (validMask!0 mask!3216))))

(assert (=> start!48584 e!310419))

(assert (=> start!48584 true))

(declare-fun array_inv!12033 (array!33796) Bool)

(assert (=> start!48584 (array_inv!12033 a!3154)))

(declare-fun b!533467 () Bool)

(declare-fun res!328675 () Bool)

(assert (=> b!533467 (=> (not res!328675) (not e!310417))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533467 (= res!328675 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16601 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16601 a!3154)) (= (select (arr!16237 a!3154) resIndex!32) (select (arr!16237 a!3154) j!147))))))

(declare-fun b!533468 () Bool)

(declare-fun res!328679 () Bool)

(assert (=> b!533468 (=> (not res!328679) (not e!310419))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533468 (= res!328679 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533469 () Bool)

(declare-fun res!328673 () Bool)

(assert (=> b!533469 (=> (not res!328673) (not e!310417))))

(declare-datatypes ((List!10356 0))(
  ( (Nil!10353) (Cons!10352 (h!11295 (_ BitVec 64)) (t!16584 List!10356)) )
))
(declare-fun arrayNoDuplicates!0 (array!33796 (_ BitVec 32) List!10356) Bool)

(assert (=> b!533469 (= res!328673 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10353))))

(declare-fun b!533470 () Bool)

(assert (=> b!533470 (= e!310419 e!310417)))

(declare-fun res!328674 () Bool)

(assert (=> b!533470 (=> (not res!328674) (not e!310417))))

(declare-datatypes ((SeekEntryResult!4695 0))(
  ( (MissingZero!4695 (index!21004 (_ BitVec 32))) (Found!4695 (index!21005 (_ BitVec 32))) (Intermediate!4695 (undefined!5507 Bool) (index!21006 (_ BitVec 32)) (x!49974 (_ BitVec 32))) (Undefined!4695) (MissingVacant!4695 (index!21007 (_ BitVec 32))) )
))
(declare-fun lt!245449 () SeekEntryResult!4695)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533470 (= res!328674 (or (= lt!245449 (MissingZero!4695 i!1153)) (= lt!245449 (MissingVacant!4695 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33796 (_ BitVec 32)) SeekEntryResult!4695)

(assert (=> b!533470 (= lt!245449 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533471 () Bool)

(declare-fun res!328671 () Bool)

(assert (=> b!533471 (=> (not res!328671) (not e!310419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533471 (= res!328671 (validKeyInArray!0 (select (arr!16237 a!3154) j!147)))))

(declare-fun b!533472 () Bool)

(declare-fun res!328676 () Bool)

(assert (=> b!533472 (=> (not res!328676) (not e!310417))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33796 (_ BitVec 32)) SeekEntryResult!4695)

(assert (=> b!533472 (= res!328676 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16237 a!3154) j!147) a!3154 mask!3216) (Intermediate!4695 false resIndex!32 resX!32)))))

(declare-fun b!533473 () Bool)

(declare-fun res!328670 () Bool)

(assert (=> b!533473 (=> (not res!328670) (not e!310419))))

(assert (=> b!533473 (= res!328670 (validKeyInArray!0 k0!1998))))

(declare-fun b!533474 () Bool)

(declare-fun res!328677 () Bool)

(assert (=> b!533474 (=> (not res!328677) (not e!310419))))

(assert (=> b!533474 (= res!328677 (and (= (size!16601 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16601 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16601 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48584 res!328672) b!533474))

(assert (= (and b!533474 res!328677) b!533471))

(assert (= (and b!533471 res!328671) b!533473))

(assert (= (and b!533473 res!328670) b!533468))

(assert (= (and b!533468 res!328679) b!533470))

(assert (= (and b!533470 res!328674) b!533466))

(assert (= (and b!533466 res!328678) b!533469))

(assert (= (and b!533469 res!328673) b!533467))

(assert (= (and b!533467 res!328675) b!533472))

(assert (= (and b!533472 res!328676) b!533465))

(declare-fun m!513337 () Bool)

(assert (=> b!533467 m!513337))

(declare-fun m!513339 () Bool)

(assert (=> b!533467 m!513339))

(declare-fun m!513341 () Bool)

(assert (=> b!533468 m!513341))

(declare-fun m!513343 () Bool)

(assert (=> b!533469 m!513343))

(assert (=> b!533472 m!513339))

(assert (=> b!533472 m!513339))

(declare-fun m!513345 () Bool)

(assert (=> b!533472 m!513345))

(declare-fun m!513347 () Bool)

(assert (=> b!533473 m!513347))

(declare-fun m!513349 () Bool)

(assert (=> b!533470 m!513349))

(declare-fun m!513351 () Bool)

(assert (=> start!48584 m!513351))

(declare-fun m!513353 () Bool)

(assert (=> start!48584 m!513353))

(assert (=> b!533471 m!513339))

(assert (=> b!533471 m!513339))

(declare-fun m!513355 () Bool)

(assert (=> b!533471 m!513355))

(declare-fun m!513357 () Bool)

(assert (=> b!533466 m!513357))

(check-sat (not b!533473) (not b!533470) (not b!533471) (not b!533469) (not b!533468) (not b!533466) (not start!48584) (not b!533472))
(check-sat)
