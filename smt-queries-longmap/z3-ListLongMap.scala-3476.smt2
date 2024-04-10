; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48200 () Bool)

(assert start!48200)

(declare-fun res!326407 () Bool)

(declare-fun e!309165 () Bool)

(assert (=> start!48200 (=> (not res!326407) (not e!309165))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48200 (= res!326407 (validMask!0 mask!3216))))

(assert (=> start!48200 e!309165))

(assert (=> start!48200 true))

(declare-datatypes ((array!33625 0))(
  ( (array!33626 (arr!16159 (Array (_ BitVec 32) (_ BitVec 64))) (size!16523 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33625)

(declare-fun array_inv!11955 (array!33625) Bool)

(assert (=> start!48200 (array_inv!11955 a!3154)))

(declare-fun b!530698 () Bool)

(assert (=> b!530698 (= e!309165 false)))

(declare-datatypes ((SeekEntryResult!4617 0))(
  ( (MissingZero!4617 (index!20692 (_ BitVec 32))) (Found!4617 (index!20693 (_ BitVec 32))) (Intermediate!4617 (undefined!5429 Bool) (index!20694 (_ BitVec 32)) (x!49679 (_ BitVec 32))) (Undefined!4617) (MissingVacant!4617 (index!20695 (_ BitVec 32))) )
))
(declare-fun lt!244780 () SeekEntryResult!4617)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33625 (_ BitVec 32)) SeekEntryResult!4617)

(assert (=> b!530698 (= lt!244780 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530699 () Bool)

(declare-fun res!326404 () Bool)

(assert (=> b!530699 (=> (not res!326404) (not e!309165))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530699 (= res!326404 (validKeyInArray!0 (select (arr!16159 a!3154) j!147)))))

(declare-fun b!530700 () Bool)

(declare-fun res!326406 () Bool)

(assert (=> b!530700 (=> (not res!326406) (not e!309165))))

(assert (=> b!530700 (= res!326406 (validKeyInArray!0 k0!1998))))

(declare-fun b!530701 () Bool)

(declare-fun res!326408 () Bool)

(assert (=> b!530701 (=> (not res!326408) (not e!309165))))

(declare-fun arrayContainsKey!0 (array!33625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530701 (= res!326408 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530702 () Bool)

(declare-fun res!326405 () Bool)

(assert (=> b!530702 (=> (not res!326405) (not e!309165))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530702 (= res!326405 (and (= (size!16523 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16523 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16523 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48200 res!326407) b!530702))

(assert (= (and b!530702 res!326405) b!530699))

(assert (= (and b!530699 res!326404) b!530700))

(assert (= (and b!530700 res!326406) b!530701))

(assert (= (and b!530701 res!326408) b!530698))

(declare-fun m!511253 () Bool)

(assert (=> b!530701 m!511253))

(declare-fun m!511255 () Bool)

(assert (=> b!530699 m!511255))

(assert (=> b!530699 m!511255))

(declare-fun m!511257 () Bool)

(assert (=> b!530699 m!511257))

(declare-fun m!511259 () Bool)

(assert (=> start!48200 m!511259))

(declare-fun m!511261 () Bool)

(assert (=> start!48200 m!511261))

(declare-fun m!511263 () Bool)

(assert (=> b!530700 m!511263))

(declare-fun m!511265 () Bool)

(assert (=> b!530698 m!511265))

(check-sat (not b!530698) (not b!530700) (not b!530699) (not start!48200) (not b!530701))
