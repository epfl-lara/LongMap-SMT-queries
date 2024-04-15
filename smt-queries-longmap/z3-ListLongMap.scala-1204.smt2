; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25694 () Bool)

(assert start!25694)

(declare-fun b!266257 () Bool)

(declare-fun res!130607 () Bool)

(declare-fun e!172284 () Bool)

(assert (=> b!266257 (=> (not res!130607) (not e!172284))))

(declare-datatypes ((array!12861 0))(
  ( (array!12862 (arr!6084 (Array (_ BitVec 32) (_ BitVec 64))) (size!6437 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12861)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12861 (_ BitVec 32)) Bool)

(assert (=> b!266257 (= res!130607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266258 () Bool)

(declare-fun res!130610 () Bool)

(declare-fun e!172282 () Bool)

(assert (=> b!266258 (=> (not res!130610) (not e!172282))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266258 (= res!130610 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266259 () Bool)

(declare-fun res!130609 () Bool)

(assert (=> b!266259 (=> (not res!130609) (not e!172282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266259 (= res!130609 (validKeyInArray!0 k0!2698))))

(declare-fun res!130605 () Bool)

(assert (=> start!25694 (=> (not res!130605) (not e!172282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25694 (= res!130605 (validMask!0 mask!4002))))

(assert (=> start!25694 e!172282))

(assert (=> start!25694 true))

(declare-fun array_inv!4056 (array!12861) Bool)

(assert (=> start!25694 (array_inv!4056 a!3436)))

(declare-fun b!266260 () Bool)

(declare-fun res!130606 () Bool)

(assert (=> b!266260 (=> (not res!130606) (not e!172284))))

(declare-datatypes ((List!3871 0))(
  ( (Nil!3868) (Cons!3867 (h!4534 (_ BitVec 64)) (t!8944 List!3871)) )
))
(declare-fun arrayNoDuplicates!0 (array!12861 (_ BitVec 32) List!3871) Bool)

(assert (=> b!266260 (= res!130606 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3868))))

(declare-fun b!266261 () Bool)

(assert (=> b!266261 (= e!172282 e!172284)))

(declare-fun res!130611 () Bool)

(assert (=> b!266261 (=> (not res!130611) (not e!172284))))

(declare-datatypes ((SeekEntryResult!1274 0))(
  ( (MissingZero!1274 (index!7266 (_ BitVec 32))) (Found!1274 (index!7267 (_ BitVec 32))) (Intermediate!1274 (undefined!2086 Bool) (index!7268 (_ BitVec 32)) (x!25590 (_ BitVec 32))) (Undefined!1274) (MissingVacant!1274 (index!7269 (_ BitVec 32))) )
))
(declare-fun lt!134234 () SeekEntryResult!1274)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266261 (= res!130611 (or (= lt!134234 (MissingZero!1274 i!1355)) (= lt!134234 (MissingVacant!1274 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12861 (_ BitVec 32)) SeekEntryResult!1274)

(assert (=> b!266261 (= lt!134234 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266262 () Bool)

(declare-fun res!130608 () Bool)

(assert (=> b!266262 (=> (not res!130608) (not e!172284))))

(assert (=> b!266262 (= res!130608 (bvslt #b00000000000000000000000000000000 (size!6437 a!3436)))))

(declare-fun b!266263 () Bool)

(declare-fun res!130612 () Bool)

(assert (=> b!266263 (=> (not res!130612) (not e!172282))))

(assert (=> b!266263 (= res!130612 (and (= (size!6437 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6437 a!3436))))))

(declare-fun b!266264 () Bool)

(assert (=> b!266264 (= e!172284 (not true))))

(assert (=> b!266264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12862 (store (arr!6084 a!3436) i!1355 k0!2698) (size!6437 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8235 0))(
  ( (Unit!8236) )
))
(declare-fun lt!134235 () Unit!8235)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8235)

(assert (=> b!266264 (= lt!134235 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(assert (= (and start!25694 res!130605) b!266263))

(assert (= (and b!266263 res!130612) b!266259))

(assert (= (and b!266259 res!130609) b!266258))

(assert (= (and b!266258 res!130610) b!266261))

(assert (= (and b!266261 res!130611) b!266257))

(assert (= (and b!266257 res!130607) b!266260))

(assert (= (and b!266260 res!130606) b!266262))

(assert (= (and b!266262 res!130608) b!266264))

(declare-fun m!282407 () Bool)

(assert (=> b!266258 m!282407))

(declare-fun m!282409 () Bool)

(assert (=> b!266257 m!282409))

(declare-fun m!282411 () Bool)

(assert (=> b!266261 m!282411))

(declare-fun m!282413 () Bool)

(assert (=> start!25694 m!282413))

(declare-fun m!282415 () Bool)

(assert (=> start!25694 m!282415))

(declare-fun m!282417 () Bool)

(assert (=> b!266260 m!282417))

(declare-fun m!282419 () Bool)

(assert (=> b!266259 m!282419))

(declare-fun m!282421 () Bool)

(assert (=> b!266264 m!282421))

(declare-fun m!282423 () Bool)

(assert (=> b!266264 m!282423))

(declare-fun m!282425 () Bool)

(assert (=> b!266264 m!282425))

(check-sat (not b!266258) (not b!266260) (not b!266259) (not b!266261) (not b!266264) (not b!266257) (not start!25694))
(check-sat)
