; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25644 () Bool)

(assert start!25644)

(declare-fun b!265950 () Bool)

(declare-fun res!130247 () Bool)

(declare-fun e!172176 () Bool)

(assert (=> b!265950 (=> (not res!130247) (not e!172176))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265950 (= res!130247 (validKeyInArray!0 k0!2698))))

(declare-fun b!265951 () Bool)

(declare-fun e!172177 () Bool)

(assert (=> b!265951 (= e!172177 false)))

(declare-fun lt!134277 () Bool)

(declare-datatypes ((array!12823 0))(
  ( (array!12824 (arr!6066 (Array (_ BitVec 32) (_ BitVec 64))) (size!6418 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12823)

(declare-datatypes ((List!3880 0))(
  ( (Nil!3877) (Cons!3876 (h!4543 (_ BitVec 64)) (t!8962 List!3880)) )
))
(declare-fun arrayNoDuplicates!0 (array!12823 (_ BitVec 32) List!3880) Bool)

(assert (=> b!265951 (= lt!134277 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3877))))

(declare-fun b!265952 () Bool)

(declare-fun res!130246 () Bool)

(assert (=> b!265952 (=> (not res!130246) (not e!172177))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12823 (_ BitVec 32)) Bool)

(assert (=> b!265952 (= res!130246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130248 () Bool)

(assert (=> start!25644 (=> (not res!130248) (not e!172176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25644 (= res!130248 (validMask!0 mask!4002))))

(assert (=> start!25644 e!172176))

(assert (=> start!25644 true))

(declare-fun array_inv!4029 (array!12823) Bool)

(assert (=> start!25644 (array_inv!4029 a!3436)))

(declare-fun b!265953 () Bool)

(assert (=> b!265953 (= e!172176 e!172177)))

(declare-fun res!130249 () Bool)

(assert (=> b!265953 (=> (not res!130249) (not e!172177))))

(declare-datatypes ((SeekEntryResult!1257 0))(
  ( (MissingZero!1257 (index!7198 (_ BitVec 32))) (Found!1257 (index!7199 (_ BitVec 32))) (Intermediate!1257 (undefined!2069 Bool) (index!7200 (_ BitVec 32)) (x!25510 (_ BitVec 32))) (Undefined!1257) (MissingVacant!1257 (index!7201 (_ BitVec 32))) )
))
(declare-fun lt!134278 () SeekEntryResult!1257)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265953 (= res!130249 (or (= lt!134278 (MissingZero!1257 i!1355)) (= lt!134278 (MissingVacant!1257 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12823 (_ BitVec 32)) SeekEntryResult!1257)

(assert (=> b!265953 (= lt!134278 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265954 () Bool)

(declare-fun res!130251 () Bool)

(assert (=> b!265954 (=> (not res!130251) (not e!172176))))

(assert (=> b!265954 (= res!130251 (and (= (size!6418 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6418 a!3436))))))

(declare-fun b!265955 () Bool)

(declare-fun res!130250 () Bool)

(assert (=> b!265955 (=> (not res!130250) (not e!172176))))

(declare-fun arrayContainsKey!0 (array!12823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265955 (= res!130250 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25644 res!130248) b!265954))

(assert (= (and b!265954 res!130251) b!265950))

(assert (= (and b!265950 res!130247) b!265955))

(assert (= (and b!265955 res!130250) b!265953))

(assert (= (and b!265953 res!130249) b!265952))

(assert (= (and b!265952 res!130246) b!265951))

(declare-fun m!282641 () Bool)

(assert (=> b!265952 m!282641))

(declare-fun m!282643 () Bool)

(assert (=> start!25644 m!282643))

(declare-fun m!282645 () Bool)

(assert (=> start!25644 m!282645))

(declare-fun m!282647 () Bool)

(assert (=> b!265950 m!282647))

(declare-fun m!282649 () Bool)

(assert (=> b!265951 m!282649))

(declare-fun m!282651 () Bool)

(assert (=> b!265953 m!282651))

(declare-fun m!282653 () Bool)

(assert (=> b!265955 m!282653))

(check-sat (not b!265951) (not start!25644) (not b!265952) (not b!265953) (not b!265955) (not b!265950))
(check-sat)
