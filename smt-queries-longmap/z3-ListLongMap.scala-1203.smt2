; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25688 () Bool)

(assert start!25688)

(declare-fun b!266185 () Bool)

(declare-fun res!130537 () Bool)

(declare-fun e!172255 () Bool)

(assert (=> b!266185 (=> (not res!130537) (not e!172255))))

(declare-datatypes ((array!12855 0))(
  ( (array!12856 (arr!6081 (Array (_ BitVec 32) (_ BitVec 64))) (size!6434 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12855)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266185 (= res!130537 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266186 () Bool)

(declare-fun res!130539 () Bool)

(assert (=> b!266186 (=> (not res!130539) (not e!172255))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266186 (= res!130539 (and (= (size!6434 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6434 a!3436))))))

(declare-fun b!266187 () Bool)

(declare-fun res!130540 () Bool)

(declare-fun e!172257 () Bool)

(assert (=> b!266187 (=> (not res!130540) (not e!172257))))

(declare-datatypes ((List!3868 0))(
  ( (Nil!3865) (Cons!3864 (h!4531 (_ BitVec 64)) (t!8941 List!3868)) )
))
(declare-fun arrayNoDuplicates!0 (array!12855 (_ BitVec 32) List!3868) Bool)

(assert (=> b!266187 (= res!130540 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3865))))

(declare-fun b!266188 () Bool)

(assert (=> b!266188 (= e!172257 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12855 (_ BitVec 32)) Bool)

(assert (=> b!266188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12856 (store (arr!6081 a!3436) i!1355 k0!2698) (size!6434 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8229 0))(
  ( (Unit!8230) )
))
(declare-fun lt!134216 () Unit!8229)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12855 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8229)

(assert (=> b!266188 (= lt!134216 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun res!130535 () Bool)

(assert (=> start!25688 (=> (not res!130535) (not e!172255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25688 (= res!130535 (validMask!0 mask!4002))))

(assert (=> start!25688 e!172255))

(assert (=> start!25688 true))

(declare-fun array_inv!4053 (array!12855) Bool)

(assert (=> start!25688 (array_inv!4053 a!3436)))

(declare-fun b!266189 () Bool)

(assert (=> b!266189 (= e!172255 e!172257)))

(declare-fun res!130534 () Bool)

(assert (=> b!266189 (=> (not res!130534) (not e!172257))))

(declare-datatypes ((SeekEntryResult!1271 0))(
  ( (MissingZero!1271 (index!7254 (_ BitVec 32))) (Found!1271 (index!7255 (_ BitVec 32))) (Intermediate!1271 (undefined!2083 Bool) (index!7256 (_ BitVec 32)) (x!25579 (_ BitVec 32))) (Undefined!1271) (MissingVacant!1271 (index!7257 (_ BitVec 32))) )
))
(declare-fun lt!134217 () SeekEntryResult!1271)

(assert (=> b!266189 (= res!130534 (or (= lt!134217 (MissingZero!1271 i!1355)) (= lt!134217 (MissingVacant!1271 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12855 (_ BitVec 32)) SeekEntryResult!1271)

(assert (=> b!266189 (= lt!134217 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266190 () Bool)

(declare-fun res!130536 () Bool)

(assert (=> b!266190 (=> (not res!130536) (not e!172255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266190 (= res!130536 (validKeyInArray!0 k0!2698))))

(declare-fun b!266191 () Bool)

(declare-fun res!130538 () Bool)

(assert (=> b!266191 (=> (not res!130538) (not e!172257))))

(assert (=> b!266191 (= res!130538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266192 () Bool)

(declare-fun res!130533 () Bool)

(assert (=> b!266192 (=> (not res!130533) (not e!172257))))

(assert (=> b!266192 (= res!130533 (bvslt #b00000000000000000000000000000000 (size!6434 a!3436)))))

(assert (= (and start!25688 res!130535) b!266186))

(assert (= (and b!266186 res!130539) b!266190))

(assert (= (and b!266190 res!130536) b!266185))

(assert (= (and b!266185 res!130537) b!266189))

(assert (= (and b!266189 res!130534) b!266191))

(assert (= (and b!266191 res!130538) b!266187))

(assert (= (and b!266187 res!130540) b!266192))

(assert (= (and b!266192 res!130533) b!266188))

(declare-fun m!282347 () Bool)

(assert (=> start!25688 m!282347))

(declare-fun m!282349 () Bool)

(assert (=> start!25688 m!282349))

(declare-fun m!282351 () Bool)

(assert (=> b!266189 m!282351))

(declare-fun m!282353 () Bool)

(assert (=> b!266190 m!282353))

(declare-fun m!282355 () Bool)

(assert (=> b!266185 m!282355))

(declare-fun m!282357 () Bool)

(assert (=> b!266187 m!282357))

(declare-fun m!282359 () Bool)

(assert (=> b!266188 m!282359))

(declare-fun m!282361 () Bool)

(assert (=> b!266188 m!282361))

(declare-fun m!282363 () Bool)

(assert (=> b!266188 m!282363))

(declare-fun m!282365 () Bool)

(assert (=> b!266191 m!282365))

(check-sat (not start!25688) (not b!266185) (not b!266190) (not b!266189) (not b!266191) (not b!266188) (not b!266187))
(check-sat)
