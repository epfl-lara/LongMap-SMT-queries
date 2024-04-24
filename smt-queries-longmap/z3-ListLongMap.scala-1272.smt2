; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26190 () Bool)

(assert start!26190)

(declare-fun b!270680 () Bool)

(declare-fun res!134648 () Bool)

(declare-fun e!174395 () Bool)

(assert (=> b!270680 (=> (not res!134648) (not e!174395))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13286 0))(
  ( (array!13287 (arr!6292 (Array (_ BitVec 32) (_ BitVec 64))) (size!6644 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13286)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270680 (= res!134648 (and (= (size!6644 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6644 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6644 a!3325))))))

(declare-fun b!270681 () Bool)

(declare-fun res!134651 () Bool)

(declare-fun e!174394 () Bool)

(assert (=> b!270681 (=> (not res!134651) (not e!174394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13286 (_ BitVec 32)) Bool)

(assert (=> b!270681 (= res!134651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270682 () Bool)

(declare-fun res!134644 () Bool)

(assert (=> b!270682 (=> (not res!134644) (not e!174394))))

(declare-datatypes ((List!4013 0))(
  ( (Nil!4010) (Cons!4009 (h!4676 (_ BitVec 64)) (t!9087 List!4013)) )
))
(declare-fun contains!1906 (List!4013 (_ BitVec 64)) Bool)

(assert (=> b!270682 (= res!134644 (not (contains!1906 Nil!4010 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270683 () Bool)

(declare-fun res!134649 () Bool)

(assert (=> b!270683 (=> (not res!134649) (not e!174394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270683 (= res!134649 (validKeyInArray!0 (select (arr!6292 a!3325) startIndex!26)))))

(declare-fun b!270684 () Bool)

(assert (=> b!270684 (= e!174394 false)))

(declare-fun lt!135738 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!270684 (= lt!135738 (contains!1906 Nil!4010 k0!2581))))

(declare-fun b!270685 () Bool)

(declare-fun res!134655 () Bool)

(assert (=> b!270685 (=> (not res!134655) (not e!174395))))

(declare-fun arrayNoDuplicates!0 (array!13286 (_ BitVec 32) List!4013) Bool)

(assert (=> b!270685 (= res!134655 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4010))))

(declare-fun b!270686 () Bool)

(declare-fun res!134653 () Bool)

(assert (=> b!270686 (=> (not res!134653) (not e!174394))))

(declare-fun noDuplicate!122 (List!4013) Bool)

(assert (=> b!270686 (= res!134653 (noDuplicate!122 Nil!4010))))

(declare-fun b!270687 () Bool)

(declare-fun res!134646 () Bool)

(assert (=> b!270687 (=> (not res!134646) (not e!174395))))

(declare-fun arrayContainsKey!0 (array!13286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270687 (= res!134646 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270688 () Bool)

(declare-fun res!134647 () Bool)

(assert (=> b!270688 (=> (not res!134647) (not e!174395))))

(assert (=> b!270688 (= res!134647 (validKeyInArray!0 k0!2581))))

(declare-fun b!270689 () Bool)

(declare-fun res!134645 () Bool)

(assert (=> b!270689 (=> (not res!134645) (not e!174394))))

(assert (=> b!270689 (= res!134645 (not (= startIndex!26 i!1267)))))

(declare-fun res!134643 () Bool)

(assert (=> start!26190 (=> (not res!134643) (not e!174395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26190 (= res!134643 (validMask!0 mask!3868))))

(assert (=> start!26190 e!174395))

(declare-fun array_inv!4242 (array!13286) Bool)

(assert (=> start!26190 (array_inv!4242 a!3325)))

(assert (=> start!26190 true))

(declare-fun b!270679 () Bool)

(assert (=> b!270679 (= e!174395 e!174394)))

(declare-fun res!134650 () Bool)

(assert (=> b!270679 (=> (not res!134650) (not e!174394))))

(declare-datatypes ((SeekEntryResult!1415 0))(
  ( (MissingZero!1415 (index!7830 (_ BitVec 32))) (Found!1415 (index!7831 (_ BitVec 32))) (Intermediate!1415 (undefined!2227 Bool) (index!7832 (_ BitVec 32)) (x!26276 (_ BitVec 32))) (Undefined!1415) (MissingVacant!1415 (index!7833 (_ BitVec 32))) )
))
(declare-fun lt!135737 () SeekEntryResult!1415)

(assert (=> b!270679 (= res!134650 (or (= lt!135737 (MissingZero!1415 i!1267)) (= lt!135737 (MissingVacant!1415 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13286 (_ BitVec 32)) SeekEntryResult!1415)

(assert (=> b!270679 (= lt!135737 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270690 () Bool)

(declare-fun res!134652 () Bool)

(assert (=> b!270690 (=> (not res!134652) (not e!174394))))

(assert (=> b!270690 (= res!134652 (not (contains!1906 Nil!4010 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270691 () Bool)

(declare-fun res!134654 () Bool)

(assert (=> b!270691 (=> (not res!134654) (not e!174394))))

(assert (=> b!270691 (= res!134654 (and (bvslt (size!6644 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6644 a!3325))))))

(assert (= (and start!26190 res!134643) b!270680))

(assert (= (and b!270680 res!134648) b!270688))

(assert (= (and b!270688 res!134647) b!270685))

(assert (= (and b!270685 res!134655) b!270687))

(assert (= (and b!270687 res!134646) b!270679))

(assert (= (and b!270679 res!134650) b!270681))

(assert (= (and b!270681 res!134651) b!270689))

(assert (= (and b!270689 res!134645) b!270683))

(assert (= (and b!270683 res!134649) b!270691))

(assert (= (and b!270691 res!134654) b!270686))

(assert (= (and b!270686 res!134653) b!270682))

(assert (= (and b!270682 res!134644) b!270690))

(assert (= (and b!270690 res!134652) b!270684))

(declare-fun m!286391 () Bool)

(assert (=> b!270684 m!286391))

(declare-fun m!286393 () Bool)

(assert (=> b!270681 m!286393))

(declare-fun m!286395 () Bool)

(assert (=> b!270687 m!286395))

(declare-fun m!286397 () Bool)

(assert (=> b!270682 m!286397))

(declare-fun m!286399 () Bool)

(assert (=> b!270683 m!286399))

(assert (=> b!270683 m!286399))

(declare-fun m!286401 () Bool)

(assert (=> b!270683 m!286401))

(declare-fun m!286403 () Bool)

(assert (=> b!270690 m!286403))

(declare-fun m!286405 () Bool)

(assert (=> b!270686 m!286405))

(declare-fun m!286407 () Bool)

(assert (=> b!270688 m!286407))

(declare-fun m!286409 () Bool)

(assert (=> b!270679 m!286409))

(declare-fun m!286411 () Bool)

(assert (=> b!270685 m!286411))

(declare-fun m!286413 () Bool)

(assert (=> start!26190 m!286413))

(declare-fun m!286415 () Bool)

(assert (=> start!26190 m!286415))

(check-sat (not start!26190) (not b!270685) (not b!270681) (not b!270688) (not b!270679) (not b!270687) (not b!270690) (not b!270686) (not b!270682) (not b!270683) (not b!270684))
(check-sat)
