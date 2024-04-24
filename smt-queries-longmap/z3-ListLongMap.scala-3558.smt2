; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48964 () Bool)

(assert start!48964)

(declare-fun b!539387 () Bool)

(declare-fun res!334495 () Bool)

(declare-fun e!312717 () Bool)

(assert (=> b!539387 (=> (not res!334495) (not e!312717))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34124 0))(
  ( (array!34125 (arr!16399 (Array (_ BitVec 32) (_ BitVec 64))) (size!16763 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34124)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539387 (= res!334495 (and (= (size!16763 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16763 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16763 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539388 () Bool)

(declare-fun res!334491 () Bool)

(assert (=> b!539388 (=> (not res!334491) (not e!312717))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539388 (= res!334491 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539389 () Bool)

(declare-fun res!334490 () Bool)

(declare-fun e!312716 () Bool)

(assert (=> b!539389 (=> (not res!334490) (not e!312716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34124 (_ BitVec 32)) Bool)

(assert (=> b!539389 (= res!334490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539390 () Bool)

(declare-fun res!334493 () Bool)

(assert (=> b!539390 (=> (not res!334493) (not e!312716))))

(declare-datatypes ((List!10425 0))(
  ( (Nil!10422) (Cons!10421 (h!11367 (_ BitVec 64)) (t!16645 List!10425)) )
))
(declare-fun arrayNoDuplicates!0 (array!34124 (_ BitVec 32) List!10425) Bool)

(assert (=> b!539390 (= res!334493 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10422))))

(declare-fun b!539391 () Bool)

(assert (=> b!539391 (= e!312716 false)))

(declare-fun lt!247194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539391 (= lt!247194 (toIndex!0 (select (arr!16399 a!3154) j!147) mask!3216))))

(declare-fun b!539392 () Bool)

(declare-fun res!334494 () Bool)

(assert (=> b!539392 (=> (not res!334494) (not e!312717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539392 (= res!334494 (validKeyInArray!0 (select (arr!16399 a!3154) j!147)))))

(declare-fun b!539393 () Bool)

(declare-fun res!334487 () Bool)

(assert (=> b!539393 (=> (not res!334487) (not e!312716))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4813 0))(
  ( (MissingZero!4813 (index!21476 (_ BitVec 32))) (Found!4813 (index!21477 (_ BitVec 32))) (Intermediate!4813 (undefined!5625 Bool) (index!21478 (_ BitVec 32)) (x!50543 (_ BitVec 32))) (Undefined!4813) (MissingVacant!4813 (index!21479 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34124 (_ BitVec 32)) SeekEntryResult!4813)

(assert (=> b!539393 (= res!334487 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16399 a!3154) j!147) a!3154 mask!3216) (Intermediate!4813 false resIndex!32 resX!32)))))

(declare-fun b!539394 () Bool)

(declare-fun res!334488 () Bool)

(assert (=> b!539394 (=> (not res!334488) (not e!312717))))

(assert (=> b!539394 (= res!334488 (validKeyInArray!0 k0!1998))))

(declare-fun b!539395 () Bool)

(declare-fun res!334486 () Bool)

(assert (=> b!539395 (=> (not res!334486) (not e!312716))))

(assert (=> b!539395 (= res!334486 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16763 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16763 a!3154)) (= (select (arr!16399 a!3154) resIndex!32) (select (arr!16399 a!3154) j!147))))))

(declare-fun res!334492 () Bool)

(assert (=> start!48964 (=> (not res!334492) (not e!312717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48964 (= res!334492 (validMask!0 mask!3216))))

(assert (=> start!48964 e!312717))

(assert (=> start!48964 true))

(declare-fun array_inv!12258 (array!34124) Bool)

(assert (=> start!48964 (array_inv!12258 a!3154)))

(declare-fun b!539386 () Bool)

(assert (=> b!539386 (= e!312717 e!312716)))

(declare-fun res!334489 () Bool)

(assert (=> b!539386 (=> (not res!334489) (not e!312716))))

(declare-fun lt!247195 () SeekEntryResult!4813)

(assert (=> b!539386 (= res!334489 (or (= lt!247195 (MissingZero!4813 i!1153)) (= lt!247195 (MissingVacant!4813 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34124 (_ BitVec 32)) SeekEntryResult!4813)

(assert (=> b!539386 (= lt!247195 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48964 res!334492) b!539387))

(assert (= (and b!539387 res!334495) b!539392))

(assert (= (and b!539392 res!334494) b!539394))

(assert (= (and b!539394 res!334488) b!539388))

(assert (= (and b!539388 res!334491) b!539386))

(assert (= (and b!539386 res!334489) b!539389))

(assert (= (and b!539389 res!334490) b!539390))

(assert (= (and b!539390 res!334493) b!539395))

(assert (= (and b!539395 res!334486) b!539393))

(assert (= (and b!539393 res!334487) b!539391))

(declare-fun m!518581 () Bool)

(assert (=> b!539386 m!518581))

(declare-fun m!518583 () Bool)

(assert (=> b!539388 m!518583))

(declare-fun m!518585 () Bool)

(assert (=> b!539390 m!518585))

(declare-fun m!518587 () Bool)

(assert (=> start!48964 m!518587))

(declare-fun m!518589 () Bool)

(assert (=> start!48964 m!518589))

(declare-fun m!518591 () Bool)

(assert (=> b!539394 m!518591))

(declare-fun m!518593 () Bool)

(assert (=> b!539391 m!518593))

(assert (=> b!539391 m!518593))

(declare-fun m!518595 () Bool)

(assert (=> b!539391 m!518595))

(assert (=> b!539392 m!518593))

(assert (=> b!539392 m!518593))

(declare-fun m!518597 () Bool)

(assert (=> b!539392 m!518597))

(declare-fun m!518599 () Bool)

(assert (=> b!539389 m!518599))

(declare-fun m!518601 () Bool)

(assert (=> b!539395 m!518601))

(assert (=> b!539395 m!518593))

(assert (=> b!539393 m!518593))

(assert (=> b!539393 m!518593))

(declare-fun m!518603 () Bool)

(assert (=> b!539393 m!518603))

(check-sat (not b!539390) (not b!539393) (not b!539386) (not b!539389) (not b!539388) (not start!48964) (not b!539391) (not b!539392) (not b!539394))
(check-sat)
