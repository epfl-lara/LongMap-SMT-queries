; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48218 () Bool)

(assert start!48218)

(declare-fun b!530833 () Bool)

(declare-fun res!326541 () Bool)

(declare-fun e!309219 () Bool)

(assert (=> b!530833 (=> (not res!326541) (not e!309219))))

(declare-datatypes ((array!33643 0))(
  ( (array!33644 (arr!16168 (Array (_ BitVec 32) (_ BitVec 64))) (size!16532 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33643)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530833 (= res!326541 (validKeyInArray!0 (select (arr!16168 a!3154) j!147)))))

(declare-fun b!530834 () Bool)

(declare-fun res!326540 () Bool)

(assert (=> b!530834 (=> (not res!326540) (not e!309219))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530834 (= res!326540 (and (= (size!16532 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16532 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16532 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530835 () Bool)

(declare-fun res!326539 () Bool)

(assert (=> b!530835 (=> (not res!326539) (not e!309219))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!530835 (= res!326539 (validKeyInArray!0 k0!1998))))

(declare-fun b!530836 () Bool)

(declare-fun res!326542 () Bool)

(assert (=> b!530836 (=> (not res!326542) (not e!309219))))

(declare-fun arrayContainsKey!0 (array!33643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530836 (= res!326542 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!326543 () Bool)

(assert (=> start!48218 (=> (not res!326543) (not e!309219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48218 (= res!326543 (validMask!0 mask!3216))))

(assert (=> start!48218 e!309219))

(assert (=> start!48218 true))

(declare-fun array_inv!11964 (array!33643) Bool)

(assert (=> start!48218 (array_inv!11964 a!3154)))

(declare-fun b!530837 () Bool)

(assert (=> b!530837 (= e!309219 false)))

(declare-datatypes ((SeekEntryResult!4626 0))(
  ( (MissingZero!4626 (index!20728 (_ BitVec 32))) (Found!4626 (index!20729 (_ BitVec 32))) (Intermediate!4626 (undefined!5438 Bool) (index!20730 (_ BitVec 32)) (x!49712 (_ BitVec 32))) (Undefined!4626) (MissingVacant!4626 (index!20731 (_ BitVec 32))) )
))
(declare-fun lt!244807 () SeekEntryResult!4626)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33643 (_ BitVec 32)) SeekEntryResult!4626)

(assert (=> b!530837 (= lt!244807 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48218 res!326543) b!530834))

(assert (= (and b!530834 res!326540) b!530833))

(assert (= (and b!530833 res!326541) b!530835))

(assert (= (and b!530835 res!326539) b!530836))

(assert (= (and b!530836 res!326542) b!530837))

(declare-fun m!511379 () Bool)

(assert (=> b!530835 m!511379))

(declare-fun m!511381 () Bool)

(assert (=> start!48218 m!511381))

(declare-fun m!511383 () Bool)

(assert (=> start!48218 m!511383))

(declare-fun m!511385 () Bool)

(assert (=> b!530836 m!511385))

(declare-fun m!511387 () Bool)

(assert (=> b!530837 m!511387))

(declare-fun m!511389 () Bool)

(assert (=> b!530833 m!511389))

(assert (=> b!530833 m!511389))

(declare-fun m!511391 () Bool)

(assert (=> b!530833 m!511391))

(check-sat (not b!530835) (not b!530833) (not start!48218) (not b!530837) (not b!530836))
