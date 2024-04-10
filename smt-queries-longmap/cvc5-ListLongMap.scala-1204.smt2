; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25690 () Bool)

(assert start!25690)

(declare-fun b!266404 () Bool)

(declare-fun res!130704 () Bool)

(declare-fun e!172383 () Bool)

(assert (=> b!266404 (=> (not res!130704) (not e!172383))))

(declare-datatypes ((array!12869 0))(
  ( (array!12870 (arr!6089 (Array (_ BitVec 32) (_ BitVec 64))) (size!6441 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12869)

(declare-datatypes ((List!3903 0))(
  ( (Nil!3900) (Cons!3899 (h!4566 (_ BitVec 64)) (t!8985 List!3903)) )
))
(declare-fun arrayNoDuplicates!0 (array!12869 (_ BitVec 32) List!3903) Bool)

(assert (=> b!266404 (= res!130704 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3900))))

(declare-fun b!266405 () Bool)

(declare-fun e!172384 () Bool)

(assert (=> b!266405 (= e!172384 e!172383)))

(declare-fun res!130701 () Bool)

(assert (=> b!266405 (=> (not res!130701) (not e!172383))))

(declare-datatypes ((SeekEntryResult!1280 0))(
  ( (MissingZero!1280 (index!7290 (_ BitVec 32))) (Found!1280 (index!7291 (_ BitVec 32))) (Intermediate!1280 (undefined!2092 Bool) (index!7292 (_ BitVec 32)) (x!25597 (_ BitVec 32))) (Undefined!1280) (MissingVacant!1280 (index!7293 (_ BitVec 32))) )
))
(declare-fun lt!134416 () SeekEntryResult!1280)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266405 (= res!130701 (or (= lt!134416 (MissingZero!1280 i!1355)) (= lt!134416 (MissingVacant!1280 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12869 (_ BitVec 32)) SeekEntryResult!1280)

(assert (=> b!266405 (= lt!134416 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266406 () Bool)

(declare-fun res!130706 () Bool)

(assert (=> b!266406 (=> (not res!130706) (not e!172384))))

(declare-fun arrayContainsKey!0 (array!12869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266406 (= res!130706 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130703 () Bool)

(assert (=> start!25690 (=> (not res!130703) (not e!172384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25690 (= res!130703 (validMask!0 mask!4002))))

(assert (=> start!25690 e!172384))

(assert (=> start!25690 true))

(declare-fun array_inv!4052 (array!12869) Bool)

(assert (=> start!25690 (array_inv!4052 a!3436)))

(declare-fun b!266407 () Bool)

(declare-fun res!130705 () Bool)

(assert (=> b!266407 (=> (not res!130705) (not e!172384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266407 (= res!130705 (validKeyInArray!0 k!2698))))

(declare-fun b!266408 () Bool)

(assert (=> b!266408 (= e!172383 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12869 (_ BitVec 32)) Bool)

(assert (=> b!266408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12870 (store (arr!6089 a!3436) i!1355 k!2698) (size!6441 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8281 0))(
  ( (Unit!8282) )
))
(declare-fun lt!134415 () Unit!8281)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12869 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8281)

(assert (=> b!266408 (= lt!134415 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266409 () Bool)

(declare-fun res!130702 () Bool)

(assert (=> b!266409 (=> (not res!130702) (not e!172383))))

(assert (=> b!266409 (= res!130702 (bvslt #b00000000000000000000000000000000 (size!6441 a!3436)))))

(declare-fun b!266410 () Bool)

(declare-fun res!130700 () Bool)

(assert (=> b!266410 (=> (not res!130700) (not e!172383))))

(assert (=> b!266410 (= res!130700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266411 () Bool)

(declare-fun res!130707 () Bool)

(assert (=> b!266411 (=> (not res!130707) (not e!172384))))

(assert (=> b!266411 (= res!130707 (and (= (size!6441 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6441 a!3436))))))

(assert (= (and start!25690 res!130703) b!266411))

(assert (= (and b!266411 res!130707) b!266407))

(assert (= (and b!266407 res!130705) b!266406))

(assert (= (and b!266406 res!130706) b!266405))

(assert (= (and b!266405 res!130701) b!266410))

(assert (= (and b!266410 res!130700) b!266404))

(assert (= (and b!266404 res!130704) b!266409))

(assert (= (and b!266409 res!130702) b!266408))

(declare-fun m!282999 () Bool)

(assert (=> b!266406 m!282999))

(declare-fun m!283001 () Bool)

(assert (=> b!266404 m!283001))

(declare-fun m!283003 () Bool)

(assert (=> b!266408 m!283003))

(declare-fun m!283005 () Bool)

(assert (=> b!266408 m!283005))

(declare-fun m!283007 () Bool)

(assert (=> b!266408 m!283007))

(declare-fun m!283009 () Bool)

(assert (=> b!266407 m!283009))

(declare-fun m!283011 () Bool)

(assert (=> b!266405 m!283011))

(declare-fun m!283013 () Bool)

(assert (=> start!25690 m!283013))

(declare-fun m!283015 () Bool)

(assert (=> start!25690 m!283015))

(declare-fun m!283017 () Bool)

(assert (=> b!266410 m!283017))

(push 1)

(assert (not b!266407))

(assert (not b!266408))

(assert (not b!266410))

(assert (not start!25690))

(assert (not b!266406))

(assert (not b!266404))

(assert (not b!266405))

(check-sat)

