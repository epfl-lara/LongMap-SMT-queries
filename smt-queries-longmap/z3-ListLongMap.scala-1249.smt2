; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26054 () Bool)

(assert start!26054)

(declare-fun b!268590 () Bool)

(declare-fun res!132922 () Bool)

(declare-fun e!173433 () Bool)

(assert (=> b!268590 (=> (not res!132922) (not e!173433))))

(declare-datatypes ((array!13140 0))(
  ( (array!13141 (arr!6219 (Array (_ BitVec 32) (_ BitVec 64))) (size!6572 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13140)

(declare-datatypes ((List!4000 0))(
  ( (Nil!3997) (Cons!3996 (h!4663 (_ BitVec 64)) (t!9073 List!4000)) )
))
(declare-fun arrayNoDuplicates!0 (array!13140 (_ BitVec 32) List!4000) Bool)

(assert (=> b!268590 (= res!132922 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3997))))

(declare-fun res!132921 () Bool)

(assert (=> start!26054 (=> (not res!132921) (not e!173433))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26054 (= res!132921 (validMask!0 mask!3868))))

(assert (=> start!26054 e!173433))

(declare-fun array_inv!4191 (array!13140) Bool)

(assert (=> start!26054 (array_inv!4191 a!3325)))

(assert (=> start!26054 true))

(declare-fun b!268591 () Bool)

(declare-fun res!132925 () Bool)

(assert (=> b!268591 (=> (not res!132925) (not e!173433))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268591 (= res!132925 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268592 () Bool)

(declare-fun e!173431 () Bool)

(assert (=> b!268592 (= e!173433 e!173431)))

(declare-fun res!132920 () Bool)

(assert (=> b!268592 (=> (not res!132920) (not e!173431))))

(declare-datatypes ((SeekEntryResult!1376 0))(
  ( (MissingZero!1376 (index!7674 (_ BitVec 32))) (Found!1376 (index!7675 (_ BitVec 32))) (Intermediate!1376 (undefined!2188 Bool) (index!7676 (_ BitVec 32)) (x!26052 (_ BitVec 32))) (Undefined!1376) (MissingVacant!1376 (index!7677 (_ BitVec 32))) )
))
(declare-fun lt!134795 () SeekEntryResult!1376)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268592 (= res!132920 (or (= lt!134795 (MissingZero!1376 i!1267)) (= lt!134795 (MissingVacant!1376 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13140 (_ BitVec 32)) SeekEntryResult!1376)

(assert (=> b!268592 (= lt!134795 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268593 () Bool)

(declare-fun res!132924 () Bool)

(assert (=> b!268593 (=> (not res!132924) (not e!173433))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268593 (= res!132924 (and (= (size!6572 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6572 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6572 a!3325))))))

(declare-fun b!268594 () Bool)

(assert (=> b!268594 (= e!173431 false)))

(declare-fun lt!134796 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13140 (_ BitVec 32)) Bool)

(assert (=> b!268594 (= lt!134796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268595 () Bool)

(declare-fun res!132923 () Bool)

(assert (=> b!268595 (=> (not res!132923) (not e!173433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268595 (= res!132923 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26054 res!132921) b!268593))

(assert (= (and b!268593 res!132924) b!268595))

(assert (= (and b!268595 res!132923) b!268590))

(assert (= (and b!268590 res!132922) b!268591))

(assert (= (and b!268591 res!132925) b!268592))

(assert (= (and b!268592 res!132920) b!268594))

(declare-fun m!284207 () Bool)

(assert (=> b!268595 m!284207))

(declare-fun m!284209 () Bool)

(assert (=> start!26054 m!284209))

(declare-fun m!284211 () Bool)

(assert (=> start!26054 m!284211))

(declare-fun m!284213 () Bool)

(assert (=> b!268590 m!284213))

(declare-fun m!284215 () Bool)

(assert (=> b!268591 m!284215))

(declare-fun m!284217 () Bool)

(assert (=> b!268594 m!284217))

(declare-fun m!284219 () Bool)

(assert (=> b!268592 m!284219))

(check-sat (not b!268594) (not b!268595) (not b!268592) (not start!26054) (not b!268590) (not b!268591))
(check-sat)
