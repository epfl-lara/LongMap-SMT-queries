; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25706 () Bool)

(assert start!25706)

(declare-fun b!266397 () Bool)

(declare-fun res!130750 () Bool)

(declare-fun e!172337 () Bool)

(assert (=> b!266397 (=> (not res!130750) (not e!172337))))

(declare-datatypes ((array!12873 0))(
  ( (array!12874 (arr!6090 (Array (_ BitVec 32) (_ BitVec 64))) (size!6443 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12873)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12873 (_ BitVec 32)) Bool)

(assert (=> b!266397 (= res!130750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266398 () Bool)

(declare-fun res!130745 () Bool)

(declare-fun e!172338 () Bool)

(assert (=> b!266398 (=> (not res!130745) (not e!172338))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266398 (= res!130745 (and (= (size!6443 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6443 a!3436))))))

(declare-fun res!130746 () Bool)

(assert (=> start!25706 (=> (not res!130746) (not e!172338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25706 (= res!130746 (validMask!0 mask!4002))))

(assert (=> start!25706 e!172338))

(assert (=> start!25706 true))

(declare-fun array_inv!4062 (array!12873) Bool)

(assert (=> start!25706 (array_inv!4062 a!3436)))

(declare-fun b!266399 () Bool)

(assert (=> b!266399 (= e!172337 false)))

(declare-fun lt!134271 () Bool)

(declare-datatypes ((List!3877 0))(
  ( (Nil!3874) (Cons!3873 (h!4540 (_ BitVec 64)) (t!8950 List!3877)) )
))
(declare-fun arrayNoDuplicates!0 (array!12873 (_ BitVec 32) List!3877) Bool)

(assert (=> b!266399 (= lt!134271 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3874))))

(declare-fun b!266400 () Bool)

(declare-fun res!130748 () Bool)

(assert (=> b!266400 (=> (not res!130748) (not e!172338))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266400 (= res!130748 (validKeyInArray!0 k0!2698))))

(declare-fun b!266401 () Bool)

(assert (=> b!266401 (= e!172338 e!172337)))

(declare-fun res!130749 () Bool)

(assert (=> b!266401 (=> (not res!130749) (not e!172337))))

(declare-datatypes ((SeekEntryResult!1280 0))(
  ( (MissingZero!1280 (index!7290 (_ BitVec 32))) (Found!1280 (index!7291 (_ BitVec 32))) (Intermediate!1280 (undefined!2092 Bool) (index!7292 (_ BitVec 32)) (x!25612 (_ BitVec 32))) (Undefined!1280) (MissingVacant!1280 (index!7293 (_ BitVec 32))) )
))
(declare-fun lt!134270 () SeekEntryResult!1280)

(assert (=> b!266401 (= res!130749 (or (= lt!134270 (MissingZero!1280 i!1355)) (= lt!134270 (MissingVacant!1280 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12873 (_ BitVec 32)) SeekEntryResult!1280)

(assert (=> b!266401 (= lt!134270 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266402 () Bool)

(declare-fun res!130747 () Bool)

(assert (=> b!266402 (=> (not res!130747) (not e!172338))))

(declare-fun arrayContainsKey!0 (array!12873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266402 (= res!130747 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25706 res!130746) b!266398))

(assert (= (and b!266398 res!130745) b!266400))

(assert (= (and b!266400 res!130748) b!266402))

(assert (= (and b!266402 res!130747) b!266401))

(assert (= (and b!266401 res!130749) b!266397))

(assert (= (and b!266397 res!130750) b!266399))

(declare-fun m!282527 () Bool)

(assert (=> b!266399 m!282527))

(declare-fun m!282529 () Bool)

(assert (=> b!266401 m!282529))

(declare-fun m!282531 () Bool)

(assert (=> b!266400 m!282531))

(declare-fun m!282533 () Bool)

(assert (=> b!266397 m!282533))

(declare-fun m!282535 () Bool)

(assert (=> start!25706 m!282535))

(declare-fun m!282537 () Bool)

(assert (=> start!25706 m!282537))

(declare-fun m!282539 () Bool)

(assert (=> b!266402 m!282539))

(check-sat (not b!266397) (not b!266402) (not b!266401) (not start!25706) (not b!266399) (not b!266400))
(check-sat)
