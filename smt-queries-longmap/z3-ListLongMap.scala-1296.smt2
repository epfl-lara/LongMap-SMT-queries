; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26336 () Bool)

(assert start!26336)

(declare-fun b!272781 () Bool)

(declare-fun e!174930 () Bool)

(declare-fun e!174928 () Bool)

(assert (=> b!272781 (= e!174930 e!174928)))

(declare-fun res!136823 () Bool)

(assert (=> b!272781 (=> (not res!136823) (not e!174928))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272781 (= res!136823 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13422 0))(
  ( (array!13423 (arr!6360 (Array (_ BitVec 32) (_ BitVec 64))) (size!6713 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13422)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!135952 () array!13422)

(assert (=> b!272781 (= lt!135952 (array!13423 (store (arr!6360 a!3325) i!1267 k0!2581) (size!6713 a!3325)))))

(declare-fun b!272782 () Bool)

(declare-fun res!136825 () Bool)

(assert (=> b!272782 (=> (not res!136825) (not e!174928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272782 (= res!136825 (validKeyInArray!0 (select (arr!6360 a!3325) startIndex!26)))))

(declare-fun b!272783 () Bool)

(declare-fun res!136827 () Bool)

(declare-fun e!174929 () Bool)

(assert (=> b!272783 (=> (not res!136827) (not e!174929))))

(assert (=> b!272783 (= res!136827 (validKeyInArray!0 k0!2581))))

(declare-fun b!272784 () Bool)

(assert (=> b!272784 (= e!174929 e!174930)))

(declare-fun res!136829 () Bool)

(assert (=> b!272784 (=> (not res!136829) (not e!174930))))

(declare-datatypes ((SeekEntryResult!1517 0))(
  ( (MissingZero!1517 (index!8238 (_ BitVec 32))) (Found!1517 (index!8239 (_ BitVec 32))) (Intermediate!1517 (undefined!2329 Bool) (index!8240 (_ BitVec 32)) (x!26569 (_ BitVec 32))) (Undefined!1517) (MissingVacant!1517 (index!8241 (_ BitVec 32))) )
))
(declare-fun lt!135954 () SeekEntryResult!1517)

(assert (=> b!272784 (= res!136829 (or (= lt!135954 (MissingZero!1517 i!1267)) (= lt!135954 (MissingVacant!1517 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13422 (_ BitVec 32)) SeekEntryResult!1517)

(assert (=> b!272784 (= lt!135954 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272785 () Bool)

(declare-fun res!136826 () Bool)

(assert (=> b!272785 (=> (not res!136826) (not e!174929))))

(declare-fun arrayContainsKey!0 (array!13422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272785 (= res!136826 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272786 () Bool)

(assert (=> b!272786 (= e!174928 (not true))))

(assert (=> b!272786 (= (seekEntryOrOpen!0 (select (arr!6360 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6360 a!3325) i!1267 k0!2581) startIndex!26) lt!135952 mask!3868))))

(declare-datatypes ((Unit!8487 0))(
  ( (Unit!8488) )
))
(declare-fun lt!135951 () Unit!8487)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13422 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8487)

(assert (=> b!272786 (= lt!135951 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4141 0))(
  ( (Nil!4138) (Cons!4137 (h!4804 (_ BitVec 64)) (t!9214 List!4141)) )
))
(declare-fun arrayNoDuplicates!0 (array!13422 (_ BitVec 32) List!4141) Bool)

(assert (=> b!272786 (arrayNoDuplicates!0 lt!135952 #b00000000000000000000000000000000 Nil!4138)))

(declare-fun lt!135953 () Unit!8487)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13422 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4141) Unit!8487)

(assert (=> b!272786 (= lt!135953 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4138))))

(declare-fun res!136824 () Bool)

(assert (=> start!26336 (=> (not res!136824) (not e!174929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26336 (= res!136824 (validMask!0 mask!3868))))

(assert (=> start!26336 e!174929))

(declare-fun array_inv!4332 (array!13422) Bool)

(assert (=> start!26336 (array_inv!4332 a!3325)))

(assert (=> start!26336 true))

(declare-fun b!272787 () Bool)

(declare-fun res!136828 () Bool)

(assert (=> b!272787 (=> (not res!136828) (not e!174930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13422 (_ BitVec 32)) Bool)

(assert (=> b!272787 (= res!136828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272788 () Bool)

(declare-fun res!136830 () Bool)

(assert (=> b!272788 (=> (not res!136830) (not e!174929))))

(assert (=> b!272788 (= res!136830 (and (= (size!6713 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6713 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6713 a!3325))))))

(declare-fun b!272789 () Bool)

(declare-fun res!136831 () Bool)

(assert (=> b!272789 (=> (not res!136831) (not e!174929))))

(assert (=> b!272789 (= res!136831 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4138))))

(assert (= (and start!26336 res!136824) b!272788))

(assert (= (and b!272788 res!136830) b!272783))

(assert (= (and b!272783 res!136827) b!272789))

(assert (= (and b!272789 res!136831) b!272785))

(assert (= (and b!272785 res!136826) b!272784))

(assert (= (and b!272784 res!136829) b!272787))

(assert (= (and b!272787 res!136828) b!272781))

(assert (= (and b!272781 res!136823) b!272782))

(assert (= (and b!272782 res!136825) b!272786))

(declare-fun m!287405 () Bool)

(assert (=> b!272783 m!287405))

(declare-fun m!287407 () Bool)

(assert (=> start!26336 m!287407))

(declare-fun m!287409 () Bool)

(assert (=> start!26336 m!287409))

(declare-fun m!287411 () Bool)

(assert (=> b!272784 m!287411))

(declare-fun m!287413 () Bool)

(assert (=> b!272789 m!287413))

(declare-fun m!287415 () Bool)

(assert (=> b!272785 m!287415))

(declare-fun m!287417 () Bool)

(assert (=> b!272787 m!287417))

(declare-fun m!287419 () Bool)

(assert (=> b!272782 m!287419))

(assert (=> b!272782 m!287419))

(declare-fun m!287421 () Bool)

(assert (=> b!272782 m!287421))

(declare-fun m!287423 () Bool)

(assert (=> b!272781 m!287423))

(declare-fun m!287425 () Bool)

(assert (=> b!272786 m!287425))

(assert (=> b!272786 m!287425))

(declare-fun m!287427 () Bool)

(assert (=> b!272786 m!287427))

(assert (=> b!272786 m!287423))

(declare-fun m!287429 () Bool)

(assert (=> b!272786 m!287429))

(assert (=> b!272786 m!287419))

(declare-fun m!287431 () Bool)

(assert (=> b!272786 m!287431))

(declare-fun m!287433 () Bool)

(assert (=> b!272786 m!287433))

(assert (=> b!272786 m!287419))

(declare-fun m!287435 () Bool)

(assert (=> b!272786 m!287435))

(check-sat (not b!272787) (not b!272783) (not b!272782) (not b!272784) (not b!272789) (not b!272785) (not start!26336) (not b!272786))
(check-sat)
