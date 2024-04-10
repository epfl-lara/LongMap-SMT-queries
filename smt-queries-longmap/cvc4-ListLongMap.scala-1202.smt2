; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25682 () Bool)

(assert start!25682)

(declare-fun b!266308 () Bool)

(declare-fun res!130604 () Bool)

(declare-fun e!172349 () Bool)

(assert (=> b!266308 (=> (not res!130604) (not e!172349))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266308 (= res!130604 (validKeyInArray!0 k!2698))))

(declare-fun b!266309 () Bool)

(declare-fun res!130608 () Bool)

(assert (=> b!266309 (=> (not res!130608) (not e!172349))))

(declare-datatypes ((array!12861 0))(
  ( (array!12862 (arr!6085 (Array (_ BitVec 32) (_ BitVec 64))) (size!6437 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12861)

(declare-fun arrayContainsKey!0 (array!12861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266309 (= res!130608 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266310 () Bool)

(declare-fun res!130605 () Bool)

(assert (=> b!266310 (=> (not res!130605) (not e!172349))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266310 (= res!130605 (and (= (size!6437 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6437 a!3436))))))

(declare-fun b!266311 () Bool)

(declare-fun res!130610 () Bool)

(declare-fun e!172347 () Bool)

(assert (=> b!266311 (=> (not res!130610) (not e!172347))))

(declare-datatypes ((List!3899 0))(
  ( (Nil!3896) (Cons!3895 (h!4562 (_ BitVec 64)) (t!8981 List!3899)) )
))
(declare-fun arrayNoDuplicates!0 (array!12861 (_ BitVec 32) List!3899) Bool)

(assert (=> b!266311 (= res!130610 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3896))))

(declare-fun b!266312 () Bool)

(declare-fun res!130606 () Bool)

(assert (=> b!266312 (=> (not res!130606) (not e!172347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12861 (_ BitVec 32)) Bool)

(assert (=> b!266312 (= res!130606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266313 () Bool)

(assert (=> b!266313 (= e!172347 (not true))))

(assert (=> b!266313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12862 (store (arr!6085 a!3436) i!1355 k!2698) (size!6437 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8273 0))(
  ( (Unit!8274) )
))
(declare-fun lt!134392 () Unit!8273)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8273)

(assert (=> b!266313 (= lt!134392 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266314 () Bool)

(assert (=> b!266314 (= e!172349 e!172347)))

(declare-fun res!130611 () Bool)

(assert (=> b!266314 (=> (not res!130611) (not e!172347))))

(declare-datatypes ((SeekEntryResult!1276 0))(
  ( (MissingZero!1276 (index!7274 (_ BitVec 32))) (Found!1276 (index!7275 (_ BitVec 32))) (Intermediate!1276 (undefined!2088 Bool) (index!7276 (_ BitVec 32)) (x!25577 (_ BitVec 32))) (Undefined!1276) (MissingVacant!1276 (index!7277 (_ BitVec 32))) )
))
(declare-fun lt!134391 () SeekEntryResult!1276)

(assert (=> b!266314 (= res!130611 (or (= lt!134391 (MissingZero!1276 i!1355)) (= lt!134391 (MissingVacant!1276 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12861 (_ BitVec 32)) SeekEntryResult!1276)

(assert (=> b!266314 (= lt!134391 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266315 () Bool)

(declare-fun res!130609 () Bool)

(assert (=> b!266315 (=> (not res!130609) (not e!172347))))

(assert (=> b!266315 (= res!130609 (bvslt #b00000000000000000000000000000000 (size!6437 a!3436)))))

(declare-fun res!130607 () Bool)

(assert (=> start!25682 (=> (not res!130607) (not e!172349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25682 (= res!130607 (validMask!0 mask!4002))))

(assert (=> start!25682 e!172349))

(assert (=> start!25682 true))

(declare-fun array_inv!4048 (array!12861) Bool)

(assert (=> start!25682 (array_inv!4048 a!3436)))

(assert (= (and start!25682 res!130607) b!266310))

(assert (= (and b!266310 res!130605) b!266308))

(assert (= (and b!266308 res!130604) b!266309))

(assert (= (and b!266309 res!130608) b!266314))

(assert (= (and b!266314 res!130611) b!266312))

(assert (= (and b!266312 res!130606) b!266311))

(assert (= (and b!266311 res!130610) b!266315))

(assert (= (and b!266315 res!130609) b!266313))

(declare-fun m!282919 () Bool)

(assert (=> b!266313 m!282919))

(declare-fun m!282921 () Bool)

(assert (=> b!266313 m!282921))

(declare-fun m!282923 () Bool)

(assert (=> b!266313 m!282923))

(declare-fun m!282925 () Bool)

(assert (=> b!266312 m!282925))

(declare-fun m!282927 () Bool)

(assert (=> b!266309 m!282927))

(declare-fun m!282929 () Bool)

(assert (=> b!266308 m!282929))

(declare-fun m!282931 () Bool)

(assert (=> start!25682 m!282931))

(declare-fun m!282933 () Bool)

(assert (=> start!25682 m!282933))

(declare-fun m!282935 () Bool)

(assert (=> b!266314 m!282935))

(declare-fun m!282937 () Bool)

(assert (=> b!266311 m!282937))

(push 1)

(assert (not start!25682))

(assert (not b!266308))

(assert (not b!266311))

(assert (not b!266314))

(assert (not b!266312))

(assert (not b!266313))

(assert (not b!266309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

