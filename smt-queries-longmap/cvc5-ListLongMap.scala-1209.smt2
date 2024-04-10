; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25720 () Bool)

(assert start!25720)

(declare-fun b!266706 () Bool)

(declare-fun res!131002 () Bool)

(declare-fun e!172518 () Bool)

(assert (=> b!266706 (=> (not res!131002) (not e!172518))))

(declare-datatypes ((array!12899 0))(
  ( (array!12900 (arr!6104 (Array (_ BitVec 32) (_ BitVec 64))) (size!6456 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12899)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266706 (= res!131002 (and (= (size!6456 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6456 a!3436))))))

(declare-fun b!266707 () Bool)

(declare-fun e!172519 () Bool)

(assert (=> b!266707 (= e!172518 e!172519)))

(declare-fun res!131003 () Bool)

(assert (=> b!266707 (=> (not res!131003) (not e!172519))))

(declare-datatypes ((SeekEntryResult!1295 0))(
  ( (MissingZero!1295 (index!7350 (_ BitVec 32))) (Found!1295 (index!7351 (_ BitVec 32))) (Intermediate!1295 (undefined!2107 Bool) (index!7352 (_ BitVec 32)) (x!25652 (_ BitVec 32))) (Undefined!1295) (MissingVacant!1295 (index!7353 (_ BitVec 32))) )
))
(declare-fun lt!134506 () SeekEntryResult!1295)

(assert (=> b!266707 (= res!131003 (or (= lt!134506 (MissingZero!1295 i!1355)) (= lt!134506 (MissingVacant!1295 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12899 (_ BitVec 32)) SeekEntryResult!1295)

(assert (=> b!266707 (= lt!134506 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266708 () Bool)

(assert (=> b!266708 (= e!172519 false)))

(declare-fun lt!134505 () Bool)

(declare-datatypes ((List!3918 0))(
  ( (Nil!3915) (Cons!3914 (h!4581 (_ BitVec 64)) (t!9000 List!3918)) )
))
(declare-fun arrayNoDuplicates!0 (array!12899 (_ BitVec 32) List!3918) Bool)

(assert (=> b!266708 (= lt!134505 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3915))))

(declare-fun res!131005 () Bool)

(assert (=> start!25720 (=> (not res!131005) (not e!172518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25720 (= res!131005 (validMask!0 mask!4002))))

(assert (=> start!25720 e!172518))

(assert (=> start!25720 true))

(declare-fun array_inv!4067 (array!12899) Bool)

(assert (=> start!25720 (array_inv!4067 a!3436)))

(declare-fun b!266709 () Bool)

(declare-fun res!131006 () Bool)

(assert (=> b!266709 (=> (not res!131006) (not e!172519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12899 (_ BitVec 32)) Bool)

(assert (=> b!266709 (= res!131006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266710 () Bool)

(declare-fun res!131007 () Bool)

(assert (=> b!266710 (=> (not res!131007) (not e!172518))))

(declare-fun arrayContainsKey!0 (array!12899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266710 (= res!131007 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266711 () Bool)

(declare-fun res!131004 () Bool)

(assert (=> b!266711 (=> (not res!131004) (not e!172518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266711 (= res!131004 (validKeyInArray!0 k!2698))))

(assert (= (and start!25720 res!131005) b!266706))

(assert (= (and b!266706 res!131002) b!266711))

(assert (= (and b!266711 res!131004) b!266710))

(assert (= (and b!266710 res!131007) b!266707))

(assert (= (and b!266707 res!131003) b!266709))

(assert (= (and b!266709 res!131006) b!266708))

(declare-fun m!283245 () Bool)

(assert (=> b!266711 m!283245))

(declare-fun m!283247 () Bool)

(assert (=> b!266707 m!283247))

(declare-fun m!283249 () Bool)

(assert (=> b!266708 m!283249))

(declare-fun m!283251 () Bool)

(assert (=> start!25720 m!283251))

(declare-fun m!283253 () Bool)

(assert (=> start!25720 m!283253))

(declare-fun m!283255 () Bool)

(assert (=> b!266709 m!283255))

(declare-fun m!283257 () Bool)

(assert (=> b!266710 m!283257))

(push 1)

