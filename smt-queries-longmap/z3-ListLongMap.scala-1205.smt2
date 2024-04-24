; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25700 () Bool)

(assert start!25700)

(declare-fun b!266523 () Bool)

(declare-fun res!130795 () Bool)

(declare-fun e!172435 () Bool)

(assert (=> b!266523 (=> (not res!130795) (not e!172435))))

(declare-datatypes ((array!12874 0))(
  ( (array!12875 (arr!6091 (Array (_ BitVec 32) (_ BitVec 64))) (size!6443 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12874)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12874 (_ BitVec 32)) Bool)

(assert (=> b!266523 (= res!130795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266524 () Bool)

(declare-fun res!130799 () Bool)

(assert (=> b!266524 (=> (not res!130799) (not e!172435))))

(assert (=> b!266524 (= res!130799 (bvslt #b00000000000000000000000000000000 (size!6443 a!3436)))))

(declare-fun b!266525 () Bool)

(declare-fun e!172434 () Bool)

(assert (=> b!266525 (= e!172434 e!172435)))

(declare-fun res!130798 () Bool)

(assert (=> b!266525 (=> (not res!130798) (not e!172435))))

(declare-datatypes ((SeekEntryResult!1247 0))(
  ( (MissingZero!1247 (index!7158 (_ BitVec 32))) (Found!1247 (index!7159 (_ BitVec 32))) (Intermediate!1247 (undefined!2059 Bool) (index!7160 (_ BitVec 32)) (x!25572 (_ BitVec 32))) (Undefined!1247) (MissingVacant!1247 (index!7161 (_ BitVec 32))) )
))
(declare-fun lt!134493 () SeekEntryResult!1247)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266525 (= res!130798 (or (= lt!134493 (MissingZero!1247 i!1355)) (= lt!134493 (MissingVacant!1247 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12874 (_ BitVec 32)) SeekEntryResult!1247)

(assert (=> b!266525 (= lt!134493 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266526 () Bool)

(declare-fun res!130793 () Bool)

(assert (=> b!266526 (=> (not res!130793) (not e!172435))))

(declare-datatypes ((List!3818 0))(
  ( (Nil!3815) (Cons!3814 (h!4481 (_ BitVec 64)) (t!8892 List!3818)) )
))
(declare-fun arrayNoDuplicates!0 (array!12874 (_ BitVec 32) List!3818) Bool)

(assert (=> b!266526 (= res!130793 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3815))))

(declare-fun b!266527 () Bool)

(declare-fun res!130797 () Bool)

(assert (=> b!266527 (=> (not res!130797) (not e!172434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266527 (= res!130797 (validKeyInArray!0 k0!2698))))

(declare-fun b!266528 () Bool)

(assert (=> b!266528 (= e!172435 (not (bvsle #b00000000000000000000000000000000 (size!6443 a!3436))))))

(assert (=> b!266528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12875 (store (arr!6091 a!3436) i!1355 k0!2698) (size!6443 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8267 0))(
  ( (Unit!8268) )
))
(declare-fun lt!134492 () Unit!8267)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12874 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8267)

(assert (=> b!266528 (= lt!134492 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266529 () Bool)

(declare-fun res!130800 () Bool)

(assert (=> b!266529 (=> (not res!130800) (not e!172434))))

(assert (=> b!266529 (= res!130800 (and (= (size!6443 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6443 a!3436))))))

(declare-fun res!130794 () Bool)

(assert (=> start!25700 (=> (not res!130794) (not e!172434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25700 (= res!130794 (validMask!0 mask!4002))))

(assert (=> start!25700 e!172434))

(assert (=> start!25700 true))

(declare-fun array_inv!4041 (array!12874) Bool)

(assert (=> start!25700 (array_inv!4041 a!3436)))

(declare-fun b!266530 () Bool)

(declare-fun res!130796 () Bool)

(assert (=> b!266530 (=> (not res!130796) (not e!172434))))

(declare-fun arrayContainsKey!0 (array!12874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266530 (= res!130796 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25700 res!130794) b!266529))

(assert (= (and b!266529 res!130800) b!266527))

(assert (= (and b!266527 res!130797) b!266530))

(assert (= (and b!266530 res!130796) b!266525))

(assert (= (and b!266525 res!130798) b!266523))

(assert (= (and b!266523 res!130795) b!266526))

(assert (= (and b!266526 res!130793) b!266524))

(assert (= (and b!266524 res!130799) b!266528))

(declare-fun m!283265 () Bool)

(assert (=> b!266523 m!283265))

(declare-fun m!283267 () Bool)

(assert (=> b!266525 m!283267))

(declare-fun m!283269 () Bool)

(assert (=> b!266528 m!283269))

(declare-fun m!283271 () Bool)

(assert (=> b!266528 m!283271))

(declare-fun m!283273 () Bool)

(assert (=> b!266528 m!283273))

(declare-fun m!283275 () Bool)

(assert (=> b!266526 m!283275))

(declare-fun m!283277 () Bool)

(assert (=> start!25700 m!283277))

(declare-fun m!283279 () Bool)

(assert (=> start!25700 m!283279))

(declare-fun m!283281 () Bool)

(assert (=> b!266527 m!283281))

(declare-fun m!283283 () Bool)

(assert (=> b!266530 m!283283))

(check-sat (not b!266526) (not b!266530) (not b!266527) (not b!266528) (not start!25700) (not b!266523) (not b!266525))
(check-sat)
