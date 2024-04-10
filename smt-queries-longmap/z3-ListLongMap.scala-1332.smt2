; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26552 () Bool)

(assert start!26552)

(declare-fun b!275588 () Bool)

(declare-fun e!176259 () Bool)

(declare-fun e!176261 () Bool)

(assert (=> b!275588 (= e!176259 e!176261)))

(declare-fun res!139580 () Bool)

(assert (=> b!275588 (=> (not res!139580) (not e!176261))))

(declare-datatypes ((SeekEntryResult!1632 0))(
  ( (MissingZero!1632 (index!8698 (_ BitVec 32))) (Found!1632 (index!8699 (_ BitVec 32))) (Intermediate!1632 (undefined!2444 Bool) (index!8700 (_ BitVec 32)) (x!26973 (_ BitVec 32))) (Undefined!1632) (MissingVacant!1632 (index!8701 (_ BitVec 32))) )
))
(declare-fun lt!137431 () SeekEntryResult!1632)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275588 (= res!139580 (or (= lt!137431 (MissingZero!1632 i!1267)) (= lt!137431 (MissingVacant!1632 i!1267))))))

(declare-datatypes ((array!13649 0))(
  ( (array!13650 (arr!6474 (Array (_ BitVec 32) (_ BitVec 64))) (size!6826 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13649)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13649 (_ BitVec 32)) SeekEntryResult!1632)

(assert (=> b!275588 (= lt!137431 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275589 () Bool)

(declare-fun res!139584 () Bool)

(assert (=> b!275589 (=> (not res!139584) (not e!176261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13649 (_ BitVec 32)) Bool)

(assert (=> b!275589 (= res!139584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275590 () Bool)

(declare-fun res!139578 () Bool)

(assert (=> b!275590 (=> (not res!139578) (not e!176259))))

(declare-fun arrayContainsKey!0 (array!13649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275590 (= res!139578 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275591 () Bool)

(declare-fun res!139582 () Bool)

(assert (=> b!275591 (=> (not res!139582) (not e!176259))))

(declare-datatypes ((List!4282 0))(
  ( (Nil!4279) (Cons!4278 (h!4945 (_ BitVec 64)) (t!9364 List!4282)) )
))
(declare-fun arrayNoDuplicates!0 (array!13649 (_ BitVec 32) List!4282) Bool)

(assert (=> b!275591 (= res!139582 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4279))))

(declare-fun b!275592 () Bool)

(declare-fun res!139579 () Bool)

(assert (=> b!275592 (=> (not res!139579) (not e!176259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275592 (= res!139579 (validKeyInArray!0 k0!2581))))

(declare-fun res!139587 () Bool)

(assert (=> start!26552 (=> (not res!139587) (not e!176259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26552 (= res!139587 (validMask!0 mask!3868))))

(assert (=> start!26552 e!176259))

(declare-fun array_inv!4437 (array!13649) Bool)

(assert (=> start!26552 (array_inv!4437 a!3325)))

(assert (=> start!26552 true))

(declare-fun b!275593 () Bool)

(declare-fun res!139583 () Bool)

(assert (=> b!275593 (=> (not res!139583) (not e!176261))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275593 (= res!139583 (not (= startIndex!26 i!1267)))))

(declare-fun b!275594 () Bool)

(assert (=> b!275594 (= e!176261 (not true))))

(assert (=> b!275594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13650 (store (arr!6474 a!3325) i!1267 k0!2581) (size!6826 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8679 0))(
  ( (Unit!8680) )
))
(declare-fun lt!137430 () Unit!8679)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8679)

(assert (=> b!275594 (= lt!137430 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275595 () Bool)

(declare-fun res!139581 () Bool)

(assert (=> b!275595 (=> (not res!139581) (not e!176261))))

(assert (=> b!275595 (= res!139581 (not (validKeyInArray!0 (select (arr!6474 a!3325) startIndex!26))))))

(declare-fun b!275596 () Bool)

(declare-fun res!139585 () Bool)

(assert (=> b!275596 (=> (not res!139585) (not e!176261))))

(assert (=> b!275596 (= res!139585 (and (bvslt startIndex!26 (bvsub (size!6826 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275597 () Bool)

(declare-fun res!139586 () Bool)

(assert (=> b!275597 (=> (not res!139586) (not e!176259))))

(assert (=> b!275597 (= res!139586 (and (= (size!6826 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6826 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6826 a!3325))))))

(assert (= (and start!26552 res!139587) b!275597))

(assert (= (and b!275597 res!139586) b!275592))

(assert (= (and b!275592 res!139579) b!275591))

(assert (= (and b!275591 res!139582) b!275590))

(assert (= (and b!275590 res!139578) b!275588))

(assert (= (and b!275588 res!139580) b!275589))

(assert (= (and b!275589 res!139584) b!275593))

(assert (= (and b!275593 res!139583) b!275595))

(assert (= (and b!275595 res!139581) b!275596))

(assert (= (and b!275596 res!139585) b!275594))

(declare-fun m!291117 () Bool)

(assert (=> b!275594 m!291117))

(declare-fun m!291119 () Bool)

(assert (=> b!275594 m!291119))

(declare-fun m!291121 () Bool)

(assert (=> b!275594 m!291121))

(declare-fun m!291123 () Bool)

(assert (=> b!275592 m!291123))

(declare-fun m!291125 () Bool)

(assert (=> b!275595 m!291125))

(assert (=> b!275595 m!291125))

(declare-fun m!291127 () Bool)

(assert (=> b!275595 m!291127))

(declare-fun m!291129 () Bool)

(assert (=> b!275591 m!291129))

(declare-fun m!291131 () Bool)

(assert (=> b!275589 m!291131))

(declare-fun m!291133 () Bool)

(assert (=> b!275590 m!291133))

(declare-fun m!291135 () Bool)

(assert (=> b!275588 m!291135))

(declare-fun m!291137 () Bool)

(assert (=> start!26552 m!291137))

(declare-fun m!291139 () Bool)

(assert (=> start!26552 m!291139))

(check-sat (not b!275589) (not b!275594) (not b!275591) (not b!275590) (not start!26552) (not b!275595) (not b!275592) (not b!275588))
(check-sat)
