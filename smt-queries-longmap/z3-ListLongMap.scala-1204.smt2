; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25692 () Bool)

(assert start!25692)

(declare-fun b!266428 () Bool)

(declare-fun res!130725 () Bool)

(declare-fun e!172393 () Bool)

(assert (=> b!266428 (=> (not res!130725) (not e!172393))))

(declare-datatypes ((array!12871 0))(
  ( (array!12872 (arr!6090 (Array (_ BitVec 32) (_ BitVec 64))) (size!6442 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12871)

(assert (=> b!266428 (= res!130725 (bvslt #b00000000000000000000000000000000 (size!6442 a!3436)))))

(declare-fun b!266429 () Bool)

(declare-fun res!130726 () Bool)

(declare-fun e!172392 () Bool)

(assert (=> b!266429 (=> (not res!130726) (not e!172392))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266429 (= res!130726 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266430 () Bool)

(declare-fun res!130731 () Bool)

(assert (=> b!266430 (=> (not res!130731) (not e!172392))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266430 (= res!130731 (and (= (size!6442 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6442 a!3436))))))

(declare-fun b!266431 () Bool)

(assert (=> b!266431 (= e!172393 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12871 (_ BitVec 32)) Bool)

(assert (=> b!266431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12872 (store (arr!6090 a!3436) i!1355 k0!2698) (size!6442 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8283 0))(
  ( (Unit!8284) )
))
(declare-fun lt!134422 () Unit!8283)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12871 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8283)

(assert (=> b!266431 (= lt!134422 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun res!130727 () Bool)

(assert (=> start!25692 (=> (not res!130727) (not e!172392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25692 (= res!130727 (validMask!0 mask!4002))))

(assert (=> start!25692 e!172392))

(assert (=> start!25692 true))

(declare-fun array_inv!4053 (array!12871) Bool)

(assert (=> start!25692 (array_inv!4053 a!3436)))

(declare-fun b!266432 () Bool)

(assert (=> b!266432 (= e!172392 e!172393)))

(declare-fun res!130729 () Bool)

(assert (=> b!266432 (=> (not res!130729) (not e!172393))))

(declare-datatypes ((SeekEntryResult!1281 0))(
  ( (MissingZero!1281 (index!7294 (_ BitVec 32))) (Found!1281 (index!7295 (_ BitVec 32))) (Intermediate!1281 (undefined!2093 Bool) (index!7296 (_ BitVec 32)) (x!25598 (_ BitVec 32))) (Undefined!1281) (MissingVacant!1281 (index!7297 (_ BitVec 32))) )
))
(declare-fun lt!134421 () SeekEntryResult!1281)

(assert (=> b!266432 (= res!130729 (or (= lt!134421 (MissingZero!1281 i!1355)) (= lt!134421 (MissingVacant!1281 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12871 (_ BitVec 32)) SeekEntryResult!1281)

(assert (=> b!266432 (= lt!134421 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266433 () Bool)

(declare-fun res!130730 () Bool)

(assert (=> b!266433 (=> (not res!130730) (not e!172393))))

(declare-datatypes ((List!3904 0))(
  ( (Nil!3901) (Cons!3900 (h!4567 (_ BitVec 64)) (t!8986 List!3904)) )
))
(declare-fun arrayNoDuplicates!0 (array!12871 (_ BitVec 32) List!3904) Bool)

(assert (=> b!266433 (= res!130730 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3901))))

(declare-fun b!266434 () Bool)

(declare-fun res!130724 () Bool)

(assert (=> b!266434 (=> (not res!130724) (not e!172393))))

(assert (=> b!266434 (= res!130724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266435 () Bool)

(declare-fun res!130728 () Bool)

(assert (=> b!266435 (=> (not res!130728) (not e!172392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266435 (= res!130728 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25692 res!130727) b!266430))

(assert (= (and b!266430 res!130731) b!266435))

(assert (= (and b!266435 res!130728) b!266429))

(assert (= (and b!266429 res!130726) b!266432))

(assert (= (and b!266432 res!130729) b!266434))

(assert (= (and b!266434 res!130724) b!266433))

(assert (= (and b!266433 res!130730) b!266428))

(assert (= (and b!266428 res!130725) b!266431))

(declare-fun m!283019 () Bool)

(assert (=> b!266429 m!283019))

(declare-fun m!283021 () Bool)

(assert (=> b!266431 m!283021))

(declare-fun m!283023 () Bool)

(assert (=> b!266431 m!283023))

(declare-fun m!283025 () Bool)

(assert (=> b!266431 m!283025))

(declare-fun m!283027 () Bool)

(assert (=> b!266433 m!283027))

(declare-fun m!283029 () Bool)

(assert (=> b!266432 m!283029))

(declare-fun m!283031 () Bool)

(assert (=> b!266434 m!283031))

(declare-fun m!283033 () Bool)

(assert (=> b!266435 m!283033))

(declare-fun m!283035 () Bool)

(assert (=> start!25692 m!283035))

(declare-fun m!283037 () Bool)

(assert (=> start!25692 m!283037))

(check-sat (not b!266432) (not b!266434) (not b!266433) (not b!266435) (not b!266431) (not start!25692) (not b!266429))
