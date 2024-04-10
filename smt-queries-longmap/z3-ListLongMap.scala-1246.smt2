; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26036 () Bool)

(assert start!26036)

(declare-fun b!268593 () Bool)

(declare-fun res!132871 () Bool)

(declare-fun e!173462 () Bool)

(assert (=> b!268593 (=> (not res!132871) (not e!173462))))

(declare-datatypes ((array!13133 0))(
  ( (array!13134 (arr!6216 (Array (_ BitVec 32) (_ BitVec 64))) (size!6568 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13133)

(declare-datatypes ((List!4024 0))(
  ( (Nil!4021) (Cons!4020 (h!4687 (_ BitVec 64)) (t!9106 List!4024)) )
))
(declare-fun arrayNoDuplicates!0 (array!13133 (_ BitVec 32) List!4024) Bool)

(assert (=> b!268593 (= res!132871 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4021))))

(declare-fun b!268594 () Bool)

(declare-fun e!173460 () Bool)

(assert (=> b!268594 (= e!173462 e!173460)))

(declare-fun res!132874 () Bool)

(assert (=> b!268594 (=> (not res!132874) (not e!173460))))

(declare-datatypes ((SeekEntryResult!1374 0))(
  ( (MissingZero!1374 (index!7666 (_ BitVec 32))) (Found!1374 (index!7667 (_ BitVec 32))) (Intermediate!1374 (undefined!2186 Bool) (index!7668 (_ BitVec 32)) (x!26027 (_ BitVec 32))) (Undefined!1374) (MissingVacant!1374 (index!7669 (_ BitVec 32))) )
))
(declare-fun lt!134928 () SeekEntryResult!1374)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268594 (= res!132874 (or (= lt!134928 (MissingZero!1374 i!1267)) (= lt!134928 (MissingVacant!1374 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13133 (_ BitVec 32)) SeekEntryResult!1374)

(assert (=> b!268594 (= lt!134928 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268595 () Bool)

(declare-fun res!132876 () Bool)

(assert (=> b!268595 (=> (not res!132876) (not e!173462))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268595 (= res!132876 (and (= (size!6568 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6568 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6568 a!3325))))))

(declare-fun res!132875 () Bool)

(assert (=> start!26036 (=> (not res!132875) (not e!173462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26036 (= res!132875 (validMask!0 mask!3868))))

(assert (=> start!26036 e!173462))

(declare-fun array_inv!4179 (array!13133) Bool)

(assert (=> start!26036 (array_inv!4179 a!3325)))

(assert (=> start!26036 true))

(declare-fun b!268596 () Bool)

(declare-fun res!132872 () Bool)

(assert (=> b!268596 (=> (not res!132872) (not e!173462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268596 (= res!132872 (validKeyInArray!0 k0!2581))))

(declare-fun b!268597 () Bool)

(assert (=> b!268597 (= e!173460 false)))

(declare-fun lt!134929 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13133 (_ BitVec 32)) Bool)

(assert (=> b!268597 (= lt!134929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268598 () Bool)

(declare-fun res!132873 () Bool)

(assert (=> b!268598 (=> (not res!132873) (not e!173462))))

(declare-fun arrayContainsKey!0 (array!13133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268598 (= res!132873 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26036 res!132875) b!268595))

(assert (= (and b!268595 res!132876) b!268596))

(assert (= (and b!268596 res!132872) b!268593))

(assert (= (and b!268593 res!132871) b!268598))

(assert (= (and b!268598 res!132873) b!268594))

(assert (= (and b!268594 res!132874) b!268597))

(declare-fun m!284687 () Bool)

(assert (=> b!268598 m!284687))

(declare-fun m!284689 () Bool)

(assert (=> b!268593 m!284689))

(declare-fun m!284691 () Bool)

(assert (=> b!268596 m!284691))

(declare-fun m!284693 () Bool)

(assert (=> start!26036 m!284693))

(declare-fun m!284695 () Bool)

(assert (=> start!26036 m!284695))

(declare-fun m!284697 () Bool)

(assert (=> b!268594 m!284697))

(declare-fun m!284699 () Bool)

(assert (=> b!268597 m!284699))

(check-sat (not b!268593) (not b!268596) (not b!268594) (not start!26036) (not b!268597) (not b!268598))
(check-sat)
