; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48574 () Bool)

(assert start!48574)

(declare-fun res!328641 () Bool)

(declare-fun e!310370 () Bool)

(assert (=> start!48574 (=> (not res!328641) (not e!310370))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48574 (= res!328641 (validMask!0 mask!3216))))

(assert (=> start!48574 e!310370))

(assert (=> start!48574 true))

(declare-datatypes ((array!33785 0))(
  ( (array!33786 (arr!16231 (Array (_ BitVec 32) (_ BitVec 64))) (size!16595 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33785)

(declare-fun array_inv!12090 (array!33785) Bool)

(assert (=> start!48574 (array_inv!12090 a!3154)))

(declare-fun b!533374 () Bool)

(declare-fun res!328636 () Bool)

(declare-fun e!310371 () Bool)

(assert (=> b!533374 (=> (not res!328636) (not e!310371))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533374 (= res!328636 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16595 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16595 a!3154)) (= (select (arr!16231 a!3154) resIndex!32) (select (arr!16231 a!3154) j!147))))))

(declare-fun b!533375 () Bool)

(assert (=> b!533375 (= e!310371 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!533376 () Bool)

(assert (=> b!533376 (= e!310370 e!310371)))

(declare-fun res!328634 () Bool)

(assert (=> b!533376 (=> (not res!328634) (not e!310371))))

(declare-datatypes ((SeekEntryResult!4645 0))(
  ( (MissingZero!4645 (index!20804 (_ BitVec 32))) (Found!4645 (index!20805 (_ BitVec 32))) (Intermediate!4645 (undefined!5457 Bool) (index!20806 (_ BitVec 32)) (x!49921 (_ BitVec 32))) (Undefined!4645) (MissingVacant!4645 (index!20807 (_ BitVec 32))) )
))
(declare-fun lt!245458 () SeekEntryResult!4645)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533376 (= res!328634 (or (= lt!245458 (MissingZero!4645 i!1153)) (= lt!245458 (MissingVacant!4645 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33785 (_ BitVec 32)) SeekEntryResult!4645)

(assert (=> b!533376 (= lt!245458 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533377 () Bool)

(declare-fun res!328637 () Bool)

(assert (=> b!533377 (=> (not res!328637) (not e!310370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533377 (= res!328637 (validKeyInArray!0 (select (arr!16231 a!3154) j!147)))))

(declare-fun b!533378 () Bool)

(declare-fun res!328640 () Bool)

(assert (=> b!533378 (=> (not res!328640) (not e!310371))))

(declare-datatypes ((List!10257 0))(
  ( (Nil!10254) (Cons!10253 (h!11196 (_ BitVec 64)) (t!16477 List!10257)) )
))
(declare-fun arrayNoDuplicates!0 (array!33785 (_ BitVec 32) List!10257) Bool)

(assert (=> b!533378 (= res!328640 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10254))))

(declare-fun b!533379 () Bool)

(declare-fun res!328638 () Bool)

(assert (=> b!533379 (=> (not res!328638) (not e!310370))))

(declare-fun arrayContainsKey!0 (array!33785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533379 (= res!328638 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533380 () Bool)

(declare-fun res!328639 () Bool)

(assert (=> b!533380 (=> (not res!328639) (not e!310371))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33785 (_ BitVec 32)) SeekEntryResult!4645)

(assert (=> b!533380 (= res!328639 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16231 a!3154) j!147) a!3154 mask!3216) (Intermediate!4645 false resIndex!32 resX!32)))))

(declare-fun b!533381 () Bool)

(declare-fun res!328635 () Bool)

(assert (=> b!533381 (=> (not res!328635) (not e!310370))))

(assert (=> b!533381 (= res!328635 (validKeyInArray!0 k0!1998))))

(declare-fun b!533382 () Bool)

(declare-fun res!328642 () Bool)

(assert (=> b!533382 (=> (not res!328642) (not e!310370))))

(assert (=> b!533382 (= res!328642 (and (= (size!16595 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16595 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16595 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533383 () Bool)

(declare-fun res!328633 () Bool)

(assert (=> b!533383 (=> (not res!328633) (not e!310371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33785 (_ BitVec 32)) Bool)

(assert (=> b!533383 (= res!328633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48574 res!328641) b!533382))

(assert (= (and b!533382 res!328642) b!533377))

(assert (= (and b!533377 res!328637) b!533381))

(assert (= (and b!533381 res!328635) b!533379))

(assert (= (and b!533379 res!328638) b!533376))

(assert (= (and b!533376 res!328634) b!533383))

(assert (= (and b!533383 res!328633) b!533378))

(assert (= (and b!533378 res!328640) b!533374))

(assert (= (and b!533374 res!328636) b!533380))

(assert (= (and b!533380 res!328639) b!533375))

(declare-fun m!513499 () Bool)

(assert (=> b!533378 m!513499))

(declare-fun m!513501 () Bool)

(assert (=> b!533376 m!513501))

(declare-fun m!513503 () Bool)

(assert (=> start!48574 m!513503))

(declare-fun m!513505 () Bool)

(assert (=> start!48574 m!513505))

(declare-fun m!513507 () Bool)

(assert (=> b!533374 m!513507))

(declare-fun m!513509 () Bool)

(assert (=> b!533374 m!513509))

(declare-fun m!513511 () Bool)

(assert (=> b!533381 m!513511))

(assert (=> b!533380 m!513509))

(assert (=> b!533380 m!513509))

(declare-fun m!513513 () Bool)

(assert (=> b!533380 m!513513))

(assert (=> b!533377 m!513509))

(assert (=> b!533377 m!513509))

(declare-fun m!513515 () Bool)

(assert (=> b!533377 m!513515))

(declare-fun m!513517 () Bool)

(assert (=> b!533383 m!513517))

(declare-fun m!513519 () Bool)

(assert (=> b!533379 m!513519))

(check-sat (not b!533377) (not b!533379) (not b!533381) (not b!533376) (not b!533380) (not b!533378) (not start!48574) (not b!533383))
(check-sat)
