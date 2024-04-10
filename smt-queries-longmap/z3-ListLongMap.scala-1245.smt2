; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26030 () Bool)

(assert start!26030)

(declare-fun b!268539 () Bool)

(declare-fun res!132821 () Bool)

(declare-fun e!173433 () Bool)

(assert (=> b!268539 (=> (not res!132821) (not e!173433))))

(declare-datatypes ((array!13127 0))(
  ( (array!13128 (arr!6213 (Array (_ BitVec 32) (_ BitVec 64))) (size!6565 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13127)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268539 (= res!132821 (and (= (size!6565 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6565 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6565 a!3325))))))

(declare-fun b!268540 () Bool)

(declare-fun res!132817 () Bool)

(assert (=> b!268540 (=> (not res!132817) (not e!173433))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268540 (= res!132817 (validKeyInArray!0 k0!2581))))

(declare-fun res!132818 () Bool)

(assert (=> start!26030 (=> (not res!132818) (not e!173433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26030 (= res!132818 (validMask!0 mask!3868))))

(assert (=> start!26030 e!173433))

(declare-fun array_inv!4176 (array!13127) Bool)

(assert (=> start!26030 (array_inv!4176 a!3325)))

(assert (=> start!26030 true))

(declare-fun b!268541 () Bool)

(declare-fun e!173435 () Bool)

(assert (=> b!268541 (= e!173433 e!173435)))

(declare-fun res!132822 () Bool)

(assert (=> b!268541 (=> (not res!132822) (not e!173435))))

(declare-datatypes ((SeekEntryResult!1371 0))(
  ( (MissingZero!1371 (index!7654 (_ BitVec 32))) (Found!1371 (index!7655 (_ BitVec 32))) (Intermediate!1371 (undefined!2183 Bool) (index!7656 (_ BitVec 32)) (x!26016 (_ BitVec 32))) (Undefined!1371) (MissingVacant!1371 (index!7657 (_ BitVec 32))) )
))
(declare-fun lt!134910 () SeekEntryResult!1371)

(assert (=> b!268541 (= res!132822 (or (= lt!134910 (MissingZero!1371 i!1267)) (= lt!134910 (MissingVacant!1371 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13127 (_ BitVec 32)) SeekEntryResult!1371)

(assert (=> b!268541 (= lt!134910 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268542 () Bool)

(declare-fun res!132820 () Bool)

(assert (=> b!268542 (=> (not res!132820) (not e!173433))))

(declare-fun arrayContainsKey!0 (array!13127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268542 (= res!132820 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268543 () Bool)

(declare-fun res!132819 () Bool)

(assert (=> b!268543 (=> (not res!132819) (not e!173433))))

(declare-datatypes ((List!4021 0))(
  ( (Nil!4018) (Cons!4017 (h!4684 (_ BitVec 64)) (t!9103 List!4021)) )
))
(declare-fun arrayNoDuplicates!0 (array!13127 (_ BitVec 32) List!4021) Bool)

(assert (=> b!268543 (= res!132819 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4018))))

(declare-fun b!268544 () Bool)

(assert (=> b!268544 (= e!173435 false)))

(declare-fun lt!134911 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13127 (_ BitVec 32)) Bool)

(assert (=> b!268544 (= lt!134911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26030 res!132818) b!268539))

(assert (= (and b!268539 res!132821) b!268540))

(assert (= (and b!268540 res!132817) b!268543))

(assert (= (and b!268543 res!132819) b!268542))

(assert (= (and b!268542 res!132820) b!268541))

(assert (= (and b!268541 res!132822) b!268544))

(declare-fun m!284645 () Bool)

(assert (=> b!268544 m!284645))

(declare-fun m!284647 () Bool)

(assert (=> b!268542 m!284647))

(declare-fun m!284649 () Bool)

(assert (=> b!268540 m!284649))

(declare-fun m!284651 () Bool)

(assert (=> start!26030 m!284651))

(declare-fun m!284653 () Bool)

(assert (=> start!26030 m!284653))

(declare-fun m!284655 () Bool)

(assert (=> b!268543 m!284655))

(declare-fun m!284657 () Bool)

(assert (=> b!268541 m!284657))

(check-sat (not b!268540) (not b!268543) (not b!268544) (not b!268541) (not start!26030) (not b!268542))
(check-sat)
