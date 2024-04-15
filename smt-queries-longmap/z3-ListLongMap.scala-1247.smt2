; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26042 () Bool)

(assert start!26042)

(declare-fun res!132815 () Bool)

(declare-fun e!173377 () Bool)

(assert (=> start!26042 (=> (not res!132815) (not e!173377))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26042 (= res!132815 (validMask!0 mask!3868))))

(assert (=> start!26042 e!173377))

(declare-datatypes ((array!13128 0))(
  ( (array!13129 (arr!6213 (Array (_ BitVec 32) (_ BitVec 64))) (size!6566 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13128)

(declare-fun array_inv!4185 (array!13128) Bool)

(assert (=> start!26042 (array_inv!4185 a!3325)))

(assert (=> start!26042 true))

(declare-fun b!268482 () Bool)

(declare-fun e!173378 () Bool)

(assert (=> b!268482 (= e!173378 false)))

(declare-fun lt!134760 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13128 (_ BitVec 32)) Bool)

(assert (=> b!268482 (= lt!134760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268483 () Bool)

(assert (=> b!268483 (= e!173377 e!173378)))

(declare-fun res!132816 () Bool)

(assert (=> b!268483 (=> (not res!132816) (not e!173378))))

(declare-datatypes ((SeekEntryResult!1370 0))(
  ( (MissingZero!1370 (index!7650 (_ BitVec 32))) (Found!1370 (index!7651 (_ BitVec 32))) (Intermediate!1370 (undefined!2182 Bool) (index!7652 (_ BitVec 32)) (x!26030 (_ BitVec 32))) (Undefined!1370) (MissingVacant!1370 (index!7653 (_ BitVec 32))) )
))
(declare-fun lt!134759 () SeekEntryResult!1370)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268483 (= res!132816 (or (= lt!134759 (MissingZero!1370 i!1267)) (= lt!134759 (MissingVacant!1370 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13128 (_ BitVec 32)) SeekEntryResult!1370)

(assert (=> b!268483 (= lt!134759 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268484 () Bool)

(declare-fun res!132817 () Bool)

(assert (=> b!268484 (=> (not res!132817) (not e!173377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268484 (= res!132817 (validKeyInArray!0 k0!2581))))

(declare-fun b!268485 () Bool)

(declare-fun res!132814 () Bool)

(assert (=> b!268485 (=> (not res!132814) (not e!173377))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268485 (= res!132814 (and (= (size!6566 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6566 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6566 a!3325))))))

(declare-fun b!268486 () Bool)

(declare-fun res!132812 () Bool)

(assert (=> b!268486 (=> (not res!132812) (not e!173377))))

(declare-fun arrayContainsKey!0 (array!13128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268486 (= res!132812 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268487 () Bool)

(declare-fun res!132813 () Bool)

(assert (=> b!268487 (=> (not res!132813) (not e!173377))))

(declare-datatypes ((List!3994 0))(
  ( (Nil!3991) (Cons!3990 (h!4657 (_ BitVec 64)) (t!9067 List!3994)) )
))
(declare-fun arrayNoDuplicates!0 (array!13128 (_ BitVec 32) List!3994) Bool)

(assert (=> b!268487 (= res!132813 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3991))))

(assert (= (and start!26042 res!132815) b!268485))

(assert (= (and b!268485 res!132814) b!268484))

(assert (= (and b!268484 res!132817) b!268487))

(assert (= (and b!268487 res!132813) b!268486))

(assert (= (and b!268486 res!132812) b!268483))

(assert (= (and b!268483 res!132816) b!268482))

(declare-fun m!284123 () Bool)

(assert (=> b!268486 m!284123))

(declare-fun m!284125 () Bool)

(assert (=> b!268483 m!284125))

(declare-fun m!284127 () Bool)

(assert (=> b!268482 m!284127))

(declare-fun m!284129 () Bool)

(assert (=> b!268484 m!284129))

(declare-fun m!284131 () Bool)

(assert (=> b!268487 m!284131))

(declare-fun m!284133 () Bool)

(assert (=> start!26042 m!284133))

(declare-fun m!284135 () Bool)

(assert (=> start!26042 m!284135))

(check-sat (not b!268486) (not b!268484) (not b!268483) (not b!268482) (not start!26042) (not b!268487))
(check-sat)
