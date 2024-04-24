; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48214 () Bool)

(assert start!48214)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun b!530802 () Bool)

(declare-datatypes ((SeekEntryResult!4579 0))(
  ( (MissingZero!4579 (index!20540 (_ BitVec 32))) (Found!4579 (index!20541 (_ BitVec 32))) (Intermediate!4579 (undefined!5391 Bool) (index!20542 (_ BitVec 32)) (x!49670 (_ BitVec 32))) (Undefined!4579) (MissingVacant!4579 (index!20543 (_ BitVec 32))) )
))
(declare-fun lt!244825 () SeekEntryResult!4579)

(declare-datatypes ((array!33638 0))(
  ( (array!33639 (arr!16165 (Array (_ BitVec 32) (_ BitVec 64))) (size!16529 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33638)

(declare-fun e!309192 () Bool)

(assert (=> b!530802 (= e!309192 (and (or (= lt!244825 (MissingZero!4579 i!1153)) (= lt!244825 (MissingVacant!4579 i!1153))) (bvsgt #b00000000000000000000000000000000 (size!16529 a!3154))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33638 (_ BitVec 32)) SeekEntryResult!4579)

(assert (=> b!530802 (= lt!244825 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530803 () Bool)

(declare-fun res!326566 () Bool)

(assert (=> b!530803 (=> (not res!326566) (not e!309192))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530803 (= res!326566 (validKeyInArray!0 (select (arr!16165 a!3154) j!147)))))

(declare-fun b!530804 () Bool)

(declare-fun res!326563 () Bool)

(assert (=> b!530804 (=> (not res!326563) (not e!309192))))

(assert (=> b!530804 (= res!326563 (validKeyInArray!0 k0!1998))))

(declare-fun res!326562 () Bool)

(assert (=> start!48214 (=> (not res!326562) (not e!309192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48214 (= res!326562 (validMask!0 mask!3216))))

(assert (=> start!48214 e!309192))

(assert (=> start!48214 true))

(declare-fun array_inv!12024 (array!33638) Bool)

(assert (=> start!48214 (array_inv!12024 a!3154)))

(declare-fun b!530805 () Bool)

(declare-fun res!326565 () Bool)

(assert (=> b!530805 (=> (not res!326565) (not e!309192))))

(assert (=> b!530805 (= res!326565 (and (= (size!16529 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16529 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16529 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530806 () Bool)

(declare-fun res!326564 () Bool)

(assert (=> b!530806 (=> (not res!326564) (not e!309192))))

(declare-fun arrayContainsKey!0 (array!33638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530806 (= res!326564 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48214 res!326562) b!530805))

(assert (= (and b!530805 res!326565) b!530803))

(assert (= (and b!530803 res!326566) b!530804))

(assert (= (and b!530804 res!326563) b!530806))

(assert (= (and b!530806 res!326564) b!530802))

(declare-fun m!511591 () Bool)

(assert (=> b!530802 m!511591))

(declare-fun m!511593 () Bool)

(assert (=> b!530804 m!511593))

(declare-fun m!511595 () Bool)

(assert (=> start!48214 m!511595))

(declare-fun m!511597 () Bool)

(assert (=> start!48214 m!511597))

(declare-fun m!511599 () Bool)

(assert (=> b!530803 m!511599))

(assert (=> b!530803 m!511599))

(declare-fun m!511601 () Bool)

(assert (=> b!530803 m!511601))

(declare-fun m!511603 () Bool)

(assert (=> b!530806 m!511603))

(check-sat (not b!530804) (not start!48214) (not b!530803) (not b!530806) (not b!530802))
(check-sat)
