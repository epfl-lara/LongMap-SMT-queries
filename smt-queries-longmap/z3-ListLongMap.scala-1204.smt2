; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25694 () Bool)

(assert start!25694)

(declare-fun b!266451 () Bool)

(declare-fun res!130721 () Bool)

(declare-fun e!172408 () Bool)

(assert (=> b!266451 (=> (not res!130721) (not e!172408))))

(declare-datatypes ((array!12868 0))(
  ( (array!12869 (arr!6088 (Array (_ BitVec 32) (_ BitVec 64))) (size!6440 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12868)

(declare-datatypes ((List!3815 0))(
  ( (Nil!3812) (Cons!3811 (h!4478 (_ BitVec 64)) (t!8889 List!3815)) )
))
(declare-fun arrayNoDuplicates!0 (array!12868 (_ BitVec 32) List!3815) Bool)

(assert (=> b!266451 (= res!130721 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3812))))

(declare-fun res!130725 () Bool)

(declare-fun e!172409 () Bool)

(assert (=> start!25694 (=> (not res!130725) (not e!172409))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25694 (= res!130725 (validMask!0 mask!4002))))

(assert (=> start!25694 e!172409))

(assert (=> start!25694 true))

(declare-fun array_inv!4038 (array!12868) Bool)

(assert (=> start!25694 (array_inv!4038 a!3436)))

(declare-fun b!266452 () Bool)

(assert (=> b!266452 (= e!172409 e!172408)))

(declare-fun res!130727 () Bool)

(assert (=> b!266452 (=> (not res!130727) (not e!172408))))

(declare-datatypes ((SeekEntryResult!1244 0))(
  ( (MissingZero!1244 (index!7146 (_ BitVec 32))) (Found!1244 (index!7147 (_ BitVec 32))) (Intermediate!1244 (undefined!2056 Bool) (index!7148 (_ BitVec 32)) (x!25561 (_ BitVec 32))) (Undefined!1244) (MissingVacant!1244 (index!7149 (_ BitVec 32))) )
))
(declare-fun lt!134474 () SeekEntryResult!1244)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266452 (= res!130727 (or (= lt!134474 (MissingZero!1244 i!1355)) (= lt!134474 (MissingVacant!1244 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12868 (_ BitVec 32)) SeekEntryResult!1244)

(assert (=> b!266452 (= lt!134474 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266453 () Bool)

(declare-fun res!130722 () Bool)

(assert (=> b!266453 (=> (not res!130722) (not e!172409))))

(assert (=> b!266453 (= res!130722 (and (= (size!6440 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6440 a!3436))))))

(declare-fun b!266454 () Bool)

(declare-fun res!130726 () Bool)

(assert (=> b!266454 (=> (not res!130726) (not e!172409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266454 (= res!130726 (validKeyInArray!0 k0!2698))))

(declare-fun b!266455 () Bool)

(declare-fun res!130724 () Bool)

(assert (=> b!266455 (=> (not res!130724) (not e!172408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12868 (_ BitVec 32)) Bool)

(assert (=> b!266455 (= res!130724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266456 () Bool)

(declare-fun res!130728 () Bool)

(assert (=> b!266456 (=> (not res!130728) (not e!172409))))

(declare-fun arrayContainsKey!0 (array!12868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266456 (= res!130728 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266457 () Bool)

(assert (=> b!266457 (= e!172408 (not true))))

(assert (=> b!266457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12869 (store (arr!6088 a!3436) i!1355 k0!2698) (size!6440 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8261 0))(
  ( (Unit!8262) )
))
(declare-fun lt!134475 () Unit!8261)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12868 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8261)

(assert (=> b!266457 (= lt!134475 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266458 () Bool)

(declare-fun res!130723 () Bool)

(assert (=> b!266458 (=> (not res!130723) (not e!172408))))

(assert (=> b!266458 (= res!130723 (bvslt #b00000000000000000000000000000000 (size!6440 a!3436)))))

(assert (= (and start!25694 res!130725) b!266453))

(assert (= (and b!266453 res!130722) b!266454))

(assert (= (and b!266454 res!130726) b!266456))

(assert (= (and b!266456 res!130728) b!266452))

(assert (= (and b!266452 res!130727) b!266455))

(assert (= (and b!266455 res!130724) b!266451))

(assert (= (and b!266451 res!130721) b!266458))

(assert (= (and b!266458 res!130723) b!266457))

(declare-fun m!283205 () Bool)

(assert (=> b!266454 m!283205))

(declare-fun m!283207 () Bool)

(assert (=> b!266452 m!283207))

(declare-fun m!283209 () Bool)

(assert (=> b!266456 m!283209))

(declare-fun m!283211 () Bool)

(assert (=> b!266457 m!283211))

(declare-fun m!283213 () Bool)

(assert (=> b!266457 m!283213))

(declare-fun m!283215 () Bool)

(assert (=> b!266457 m!283215))

(declare-fun m!283217 () Bool)

(assert (=> b!266455 m!283217))

(declare-fun m!283219 () Bool)

(assert (=> start!25694 m!283219))

(declare-fun m!283221 () Bool)

(assert (=> start!25694 m!283221))

(declare-fun m!283223 () Bool)

(assert (=> b!266451 m!283223))

(check-sat (not b!266457) (not b!266452) (not b!266454) (not b!266456) (not start!25694) (not b!266451) (not b!266455))
(check-sat)
