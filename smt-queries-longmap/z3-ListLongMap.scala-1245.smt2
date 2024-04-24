; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26028 () Bool)

(assert start!26028)

(declare-fun b!268568 () Bool)

(declare-fun res!132825 () Bool)

(declare-fun e!173449 () Bool)

(assert (=> b!268568 (=> (not res!132825) (not e!173449))))

(declare-datatypes ((array!13124 0))(
  ( (array!13125 (arr!6211 (Array (_ BitVec 32) (_ BitVec 64))) (size!6563 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13124)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268568 (= res!132825 (and (= (size!6563 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6563 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6563 a!3325))))))

(declare-fun b!268569 () Bool)

(declare-fun res!132822 () Bool)

(assert (=> b!268569 (=> (not res!132822) (not e!173449))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268569 (= res!132822 (validKeyInArray!0 k0!2581))))

(declare-fun b!268571 () Bool)

(declare-fun e!173448 () Bool)

(assert (=> b!268571 (= e!173449 e!173448)))

(declare-fun res!132823 () Bool)

(assert (=> b!268571 (=> (not res!132823) (not e!173448))))

(declare-datatypes ((SeekEntryResult!1334 0))(
  ( (MissingZero!1334 (index!7506 (_ BitVec 32))) (Found!1334 (index!7507 (_ BitVec 32))) (Intermediate!1334 (undefined!2146 Bool) (index!7508 (_ BitVec 32)) (x!25979 (_ BitVec 32))) (Undefined!1334) (MissingVacant!1334 (index!7509 (_ BitVec 32))) )
))
(declare-fun lt!134963 () SeekEntryResult!1334)

(assert (=> b!268571 (= res!132823 (or (= lt!134963 (MissingZero!1334 i!1267)) (= lt!134963 (MissingVacant!1334 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13124 (_ BitVec 32)) SeekEntryResult!1334)

(assert (=> b!268571 (= lt!134963 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268572 () Bool)

(declare-fun res!132820 () Bool)

(assert (=> b!268572 (=> (not res!132820) (not e!173449))))

(declare-datatypes ((List!3932 0))(
  ( (Nil!3929) (Cons!3928 (h!4595 (_ BitVec 64)) (t!9006 List!3932)) )
))
(declare-fun arrayNoDuplicates!0 (array!13124 (_ BitVec 32) List!3932) Bool)

(assert (=> b!268572 (= res!132820 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3929))))

(declare-fun b!268573 () Bool)

(assert (=> b!268573 (= e!173448 false)))

(declare-fun lt!134964 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13124 (_ BitVec 32)) Bool)

(assert (=> b!268573 (= lt!134964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268570 () Bool)

(declare-fun res!132824 () Bool)

(assert (=> b!268570 (=> (not res!132824) (not e!173449))))

(declare-fun arrayContainsKey!0 (array!13124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268570 (= res!132824 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132821 () Bool)

(assert (=> start!26028 (=> (not res!132821) (not e!173449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26028 (= res!132821 (validMask!0 mask!3868))))

(assert (=> start!26028 e!173449))

(declare-fun array_inv!4161 (array!13124) Bool)

(assert (=> start!26028 (array_inv!4161 a!3325)))

(assert (=> start!26028 true))

(assert (= (and start!26028 res!132821) b!268568))

(assert (= (and b!268568 res!132825) b!268569))

(assert (= (and b!268569 res!132822) b!268572))

(assert (= (and b!268572 res!132820) b!268570))

(assert (= (and b!268570 res!132824) b!268571))

(assert (= (and b!268571 res!132823) b!268573))

(declare-fun m!284837 () Bool)

(assert (=> start!26028 m!284837))

(declare-fun m!284839 () Bool)

(assert (=> start!26028 m!284839))

(declare-fun m!284841 () Bool)

(assert (=> b!268572 m!284841))

(declare-fun m!284843 () Bool)

(assert (=> b!268569 m!284843))

(declare-fun m!284845 () Bool)

(assert (=> b!268573 m!284845))

(declare-fun m!284847 () Bool)

(assert (=> b!268571 m!284847))

(declare-fun m!284849 () Bool)

(assert (=> b!268570 m!284849))

(check-sat (not b!268571) (not b!268570) (not b!268569) (not start!26028) (not b!268572) (not b!268573))
(check-sat)
