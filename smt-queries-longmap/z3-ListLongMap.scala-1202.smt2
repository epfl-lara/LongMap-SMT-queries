; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25680 () Bool)

(assert start!25680)

(declare-fun b!266284 () Bool)

(declare-fun res!130580 () Bool)

(declare-fun e!172338 () Bool)

(assert (=> b!266284 (=> (not res!130580) (not e!172338))))

(declare-datatypes ((array!12859 0))(
  ( (array!12860 (arr!6084 (Array (_ BitVec 32) (_ BitVec 64))) (size!6436 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12859)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266284 (= res!130580 (and (= (size!6436 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6436 a!3436))))))

(declare-fun b!266285 () Bool)

(declare-fun e!172339 () Bool)

(assert (=> b!266285 (= e!172338 e!172339)))

(declare-fun res!130584 () Bool)

(assert (=> b!266285 (=> (not res!130584) (not e!172339))))

(declare-datatypes ((SeekEntryResult!1275 0))(
  ( (MissingZero!1275 (index!7270 (_ BitVec 32))) (Found!1275 (index!7271 (_ BitVec 32))) (Intermediate!1275 (undefined!2087 Bool) (index!7272 (_ BitVec 32)) (x!25576 (_ BitVec 32))) (Undefined!1275) (MissingVacant!1275 (index!7273 (_ BitVec 32))) )
))
(declare-fun lt!134385 () SeekEntryResult!1275)

(assert (=> b!266285 (= res!130584 (or (= lt!134385 (MissingZero!1275 i!1355)) (= lt!134385 (MissingVacant!1275 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12859 (_ BitVec 32)) SeekEntryResult!1275)

(assert (=> b!266285 (= lt!134385 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266286 () Bool)

(assert (=> b!266286 (= e!172339 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12859 (_ BitVec 32)) Bool)

(assert (=> b!266286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12860 (store (arr!6084 a!3436) i!1355 k0!2698) (size!6436 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8271 0))(
  ( (Unit!8272) )
))
(declare-fun lt!134386 () Unit!8271)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8271)

(assert (=> b!266286 (= lt!134386 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266287 () Bool)

(declare-fun res!130583 () Bool)

(assert (=> b!266287 (=> (not res!130583) (not e!172339))))

(declare-datatypes ((List!3898 0))(
  ( (Nil!3895) (Cons!3894 (h!4561 (_ BitVec 64)) (t!8980 List!3898)) )
))
(declare-fun arrayNoDuplicates!0 (array!12859 (_ BitVec 32) List!3898) Bool)

(assert (=> b!266287 (= res!130583 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3895))))

(declare-fun res!130586 () Bool)

(assert (=> start!25680 (=> (not res!130586) (not e!172338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25680 (= res!130586 (validMask!0 mask!4002))))

(assert (=> start!25680 e!172338))

(assert (=> start!25680 true))

(declare-fun array_inv!4047 (array!12859) Bool)

(assert (=> start!25680 (array_inv!4047 a!3436)))

(declare-fun b!266288 () Bool)

(declare-fun res!130582 () Bool)

(assert (=> b!266288 (=> (not res!130582) (not e!172339))))

(assert (=> b!266288 (= res!130582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266289 () Bool)

(declare-fun res!130587 () Bool)

(assert (=> b!266289 (=> (not res!130587) (not e!172338))))

(declare-fun arrayContainsKey!0 (array!12859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266289 (= res!130587 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266290 () Bool)

(declare-fun res!130581 () Bool)

(assert (=> b!266290 (=> (not res!130581) (not e!172339))))

(assert (=> b!266290 (= res!130581 (bvslt #b00000000000000000000000000000000 (size!6436 a!3436)))))

(declare-fun b!266291 () Bool)

(declare-fun res!130585 () Bool)

(assert (=> b!266291 (=> (not res!130585) (not e!172338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266291 (= res!130585 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25680 res!130586) b!266284))

(assert (= (and b!266284 res!130580) b!266291))

(assert (= (and b!266291 res!130585) b!266289))

(assert (= (and b!266289 res!130587) b!266285))

(assert (= (and b!266285 res!130584) b!266288))

(assert (= (and b!266288 res!130582) b!266287))

(assert (= (and b!266287 res!130583) b!266290))

(assert (= (and b!266290 res!130581) b!266286))

(declare-fun m!282899 () Bool)

(assert (=> b!266285 m!282899))

(declare-fun m!282901 () Bool)

(assert (=> b!266288 m!282901))

(declare-fun m!282903 () Bool)

(assert (=> b!266287 m!282903))

(declare-fun m!282905 () Bool)

(assert (=> start!25680 m!282905))

(declare-fun m!282907 () Bool)

(assert (=> start!25680 m!282907))

(declare-fun m!282909 () Bool)

(assert (=> b!266286 m!282909))

(declare-fun m!282911 () Bool)

(assert (=> b!266286 m!282911))

(declare-fun m!282913 () Bool)

(assert (=> b!266286 m!282913))

(declare-fun m!282915 () Bool)

(assert (=> b!266289 m!282915))

(declare-fun m!282917 () Bool)

(assert (=> b!266291 m!282917))

(check-sat (not b!266285) (not start!25680) (not b!266288) (not b!266291) (not b!266287) (not b!266286) (not b!266289))
