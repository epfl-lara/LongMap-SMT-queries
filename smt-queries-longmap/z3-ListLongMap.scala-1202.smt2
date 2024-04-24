; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25682 () Bool)

(assert start!25682)

(declare-fun res!130582 () Bool)

(declare-fun e!172353 () Bool)

(assert (=> start!25682 (=> (not res!130582) (not e!172353))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25682 (= res!130582 (validMask!0 mask!4002))))

(assert (=> start!25682 e!172353))

(assert (=> start!25682 true))

(declare-datatypes ((array!12856 0))(
  ( (array!12857 (arr!6082 (Array (_ BitVec 32) (_ BitVec 64))) (size!6434 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12856)

(declare-fun array_inv!4032 (array!12856) Bool)

(assert (=> start!25682 (array_inv!4032 a!3436)))

(declare-fun b!266307 () Bool)

(declare-fun res!130579 () Bool)

(assert (=> b!266307 (=> (not res!130579) (not e!172353))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266307 (= res!130579 (validKeyInArray!0 k0!2698))))

(declare-fun b!266308 () Bool)

(declare-fun res!130581 () Bool)

(declare-fun e!172354 () Bool)

(assert (=> b!266308 (=> (not res!130581) (not e!172354))))

(declare-datatypes ((List!3809 0))(
  ( (Nil!3806) (Cons!3805 (h!4472 (_ BitVec 64)) (t!8883 List!3809)) )
))
(declare-fun arrayNoDuplicates!0 (array!12856 (_ BitVec 32) List!3809) Bool)

(assert (=> b!266308 (= res!130581 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3806))))

(declare-fun b!266309 () Bool)

(declare-fun res!130584 () Bool)

(assert (=> b!266309 (=> (not res!130584) (not e!172353))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266309 (= res!130584 (and (= (size!6434 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6434 a!3436))))))

(declare-fun b!266310 () Bool)

(declare-fun res!130580 () Bool)

(assert (=> b!266310 (=> (not res!130580) (not e!172354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12856 (_ BitVec 32)) Bool)

(assert (=> b!266310 (= res!130580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266311 () Bool)

(declare-fun res!130583 () Bool)

(assert (=> b!266311 (=> (not res!130583) (not e!172354))))

(assert (=> b!266311 (= res!130583 (bvslt #b00000000000000000000000000000000 (size!6434 a!3436)))))

(declare-fun b!266312 () Bool)

(assert (=> b!266312 (= e!172353 e!172354)))

(declare-fun res!130578 () Bool)

(assert (=> b!266312 (=> (not res!130578) (not e!172354))))

(declare-datatypes ((SeekEntryResult!1238 0))(
  ( (MissingZero!1238 (index!7122 (_ BitVec 32))) (Found!1238 (index!7123 (_ BitVec 32))) (Intermediate!1238 (undefined!2050 Bool) (index!7124 (_ BitVec 32)) (x!25539 (_ BitVec 32))) (Undefined!1238) (MissingVacant!1238 (index!7125 (_ BitVec 32))) )
))
(declare-fun lt!134438 () SeekEntryResult!1238)

(assert (=> b!266312 (= res!130578 (or (= lt!134438 (MissingZero!1238 i!1355)) (= lt!134438 (MissingVacant!1238 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12856 (_ BitVec 32)) SeekEntryResult!1238)

(assert (=> b!266312 (= lt!134438 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266313 () Bool)

(declare-fun res!130577 () Bool)

(assert (=> b!266313 (=> (not res!130577) (not e!172353))))

(declare-fun arrayContainsKey!0 (array!12856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266313 (= res!130577 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266314 () Bool)

(assert (=> b!266314 (= e!172354 (not true))))

(assert (=> b!266314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12857 (store (arr!6082 a!3436) i!1355 k0!2698) (size!6434 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8249 0))(
  ( (Unit!8250) )
))
(declare-fun lt!134439 () Unit!8249)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12856 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8249)

(assert (=> b!266314 (= lt!134439 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(assert (= (and start!25682 res!130582) b!266309))

(assert (= (and b!266309 res!130584) b!266307))

(assert (= (and b!266307 res!130579) b!266313))

(assert (= (and b!266313 res!130577) b!266312))

(assert (= (and b!266312 res!130578) b!266310))

(assert (= (and b!266310 res!130580) b!266308))

(assert (= (and b!266308 res!130581) b!266311))

(assert (= (and b!266311 res!130583) b!266314))

(declare-fun m!283085 () Bool)

(assert (=> b!266307 m!283085))

(declare-fun m!283087 () Bool)

(assert (=> b!266310 m!283087))

(declare-fun m!283089 () Bool)

(assert (=> b!266313 m!283089))

(declare-fun m!283091 () Bool)

(assert (=> b!266308 m!283091))

(declare-fun m!283093 () Bool)

(assert (=> b!266314 m!283093))

(declare-fun m!283095 () Bool)

(assert (=> b!266314 m!283095))

(declare-fun m!283097 () Bool)

(assert (=> b!266314 m!283097))

(declare-fun m!283099 () Bool)

(assert (=> b!266312 m!283099))

(declare-fun m!283101 () Bool)

(assert (=> start!25682 m!283101))

(declare-fun m!283103 () Bool)

(assert (=> start!25682 m!283103))

(check-sat (not b!266313) (not start!25682) (not b!266314) (not b!266308) (not b!266312) (not b!266307) (not b!266310))
(check-sat)
