; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26564 () Bool)

(assert start!26564)

(declare-fun b!275768 () Bool)

(declare-fun res!139763 () Bool)

(declare-fun e!176313 () Bool)

(assert (=> b!275768 (=> (not res!139763) (not e!176313))))

(declare-datatypes ((array!13661 0))(
  ( (array!13662 (arr!6480 (Array (_ BitVec 32) (_ BitVec 64))) (size!6832 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13661)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275768 (= res!139763 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275769 () Bool)

(declare-fun res!139758 () Bool)

(declare-fun e!176315 () Bool)

(assert (=> b!275769 (=> (not res!139758) (not e!176315))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275769 (= res!139758 (not (= startIndex!26 i!1267)))))

(declare-fun b!275770 () Bool)

(assert (=> b!275770 (= e!176313 e!176315)))

(declare-fun res!139761 () Bool)

(assert (=> b!275770 (=> (not res!139761) (not e!176315))))

(declare-datatypes ((SeekEntryResult!1638 0))(
  ( (MissingZero!1638 (index!8722 (_ BitVec 32))) (Found!1638 (index!8723 (_ BitVec 32))) (Intermediate!1638 (undefined!2450 Bool) (index!8724 (_ BitVec 32)) (x!26995 (_ BitVec 32))) (Undefined!1638) (MissingVacant!1638 (index!8725 (_ BitVec 32))) )
))
(declare-fun lt!137467 () SeekEntryResult!1638)

(assert (=> b!275770 (= res!139761 (or (= lt!137467 (MissingZero!1638 i!1267)) (= lt!137467 (MissingVacant!1638 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13661 (_ BitVec 32)) SeekEntryResult!1638)

(assert (=> b!275770 (= lt!137467 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275771 () Bool)

(declare-fun res!139767 () Bool)

(assert (=> b!275771 (=> (not res!139767) (not e!176315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13661 (_ BitVec 32)) Bool)

(assert (=> b!275771 (= res!139767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275772 () Bool)

(declare-fun res!139766 () Bool)

(assert (=> b!275772 (=> (not res!139766) (not e!176315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275772 (= res!139766 (not (validKeyInArray!0 (select (arr!6480 a!3325) startIndex!26))))))

(declare-fun b!275774 () Bool)

(declare-fun res!139760 () Bool)

(assert (=> b!275774 (=> (not res!139760) (not e!176313))))

(assert (=> b!275774 (= res!139760 (and (= (size!6832 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6832 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6832 a!3325))))))

(declare-fun b!275775 () Bool)

(declare-fun res!139765 () Bool)

(assert (=> b!275775 (=> (not res!139765) (not e!176313))))

(declare-datatypes ((List!4288 0))(
  ( (Nil!4285) (Cons!4284 (h!4951 (_ BitVec 64)) (t!9370 List!4288)) )
))
(declare-fun arrayNoDuplicates!0 (array!13661 (_ BitVec 32) List!4288) Bool)

(assert (=> b!275775 (= res!139765 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4285))))

(declare-fun b!275773 () Bool)

(declare-fun res!139759 () Bool)

(assert (=> b!275773 (=> (not res!139759) (not e!176315))))

(assert (=> b!275773 (= res!139759 (and (bvslt startIndex!26 (bvsub (size!6832 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun res!139762 () Bool)

(assert (=> start!26564 (=> (not res!139762) (not e!176313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26564 (= res!139762 (validMask!0 mask!3868))))

(assert (=> start!26564 e!176313))

(declare-fun array_inv!4443 (array!13661) Bool)

(assert (=> start!26564 (array_inv!4443 a!3325)))

(assert (=> start!26564 true))

(declare-fun b!275776 () Bool)

(declare-fun res!139764 () Bool)

(assert (=> b!275776 (=> (not res!139764) (not e!176313))))

(assert (=> b!275776 (= res!139764 (validKeyInArray!0 k0!2581))))

(declare-fun b!275777 () Bool)

(assert (=> b!275777 (= e!176315 (not true))))

(assert (=> b!275777 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13662 (store (arr!6480 a!3325) i!1267 k0!2581) (size!6832 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8691 0))(
  ( (Unit!8692) )
))
(declare-fun lt!137466 () Unit!8691)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13661 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8691)

(assert (=> b!275777 (= lt!137466 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (= (and start!26564 res!139762) b!275774))

(assert (= (and b!275774 res!139760) b!275776))

(assert (= (and b!275776 res!139764) b!275775))

(assert (= (and b!275775 res!139765) b!275768))

(assert (= (and b!275768 res!139763) b!275770))

(assert (= (and b!275770 res!139761) b!275771))

(assert (= (and b!275771 res!139767) b!275769))

(assert (= (and b!275769 res!139758) b!275772))

(assert (= (and b!275772 res!139766) b!275773))

(assert (= (and b!275773 res!139759) b!275777))

(declare-fun m!291261 () Bool)

(assert (=> start!26564 m!291261))

(declare-fun m!291263 () Bool)

(assert (=> start!26564 m!291263))

(declare-fun m!291265 () Bool)

(assert (=> b!275777 m!291265))

(declare-fun m!291267 () Bool)

(assert (=> b!275777 m!291267))

(declare-fun m!291269 () Bool)

(assert (=> b!275777 m!291269))

(declare-fun m!291271 () Bool)

(assert (=> b!275768 m!291271))

(declare-fun m!291273 () Bool)

(assert (=> b!275775 m!291273))

(declare-fun m!291275 () Bool)

(assert (=> b!275776 m!291275))

(declare-fun m!291277 () Bool)

(assert (=> b!275772 m!291277))

(assert (=> b!275772 m!291277))

(declare-fun m!291279 () Bool)

(assert (=> b!275772 m!291279))

(declare-fun m!291281 () Bool)

(assert (=> b!275771 m!291281))

(declare-fun m!291283 () Bool)

(assert (=> b!275770 m!291283))

(check-sat (not b!275777) (not b!275770) (not start!26564) (not b!275771) (not b!275772) (not b!275768) (not b!275775) (not b!275776))
(check-sat)
