; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25688 () Bool)

(assert start!25688)

(declare-fun b!266379 () Bool)

(declare-fun e!172382 () Bool)

(declare-fun e!172381 () Bool)

(assert (=> b!266379 (= e!172382 e!172381)))

(declare-fun res!130652 () Bool)

(assert (=> b!266379 (=> (not res!130652) (not e!172381))))

(declare-datatypes ((SeekEntryResult!1241 0))(
  ( (MissingZero!1241 (index!7134 (_ BitVec 32))) (Found!1241 (index!7135 (_ BitVec 32))) (Intermediate!1241 (undefined!2053 Bool) (index!7136 (_ BitVec 32)) (x!25550 (_ BitVec 32))) (Undefined!1241) (MissingVacant!1241 (index!7137 (_ BitVec 32))) )
))
(declare-fun lt!134456 () SeekEntryResult!1241)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266379 (= res!130652 (or (= lt!134456 (MissingZero!1241 i!1355)) (= lt!134456 (MissingVacant!1241 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12862 0))(
  ( (array!12863 (arr!6085 (Array (_ BitVec 32) (_ BitVec 64))) (size!6437 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12862)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12862 (_ BitVec 32)) SeekEntryResult!1241)

(assert (=> b!266379 (= lt!134456 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266380 () Bool)

(assert (=> b!266380 (= e!172381 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12862 (_ BitVec 32)) Bool)

(assert (=> b!266380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12863 (store (arr!6085 a!3436) i!1355 k0!2698) (size!6437 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8255 0))(
  ( (Unit!8256) )
))
(declare-fun lt!134457 () Unit!8255)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12862 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8255)

(assert (=> b!266380 (= lt!134457 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266381 () Bool)

(declare-fun res!130655 () Bool)

(assert (=> b!266381 (=> (not res!130655) (not e!172382))))

(assert (=> b!266381 (= res!130655 (and (= (size!6437 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6437 a!3436))))))

(declare-fun b!266382 () Bool)

(declare-fun res!130650 () Bool)

(assert (=> b!266382 (=> (not res!130650) (not e!172381))))

(assert (=> b!266382 (= res!130650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266384 () Bool)

(declare-fun res!130654 () Bool)

(assert (=> b!266384 (=> (not res!130654) (not e!172381))))

(assert (=> b!266384 (= res!130654 (bvslt #b00000000000000000000000000000000 (size!6437 a!3436)))))

(declare-fun b!266385 () Bool)

(declare-fun res!130653 () Bool)

(assert (=> b!266385 (=> (not res!130653) (not e!172382))))

(declare-fun arrayContainsKey!0 (array!12862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266385 (= res!130653 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266386 () Bool)

(declare-fun res!130649 () Bool)

(assert (=> b!266386 (=> (not res!130649) (not e!172381))))

(declare-datatypes ((List!3812 0))(
  ( (Nil!3809) (Cons!3808 (h!4475 (_ BitVec 64)) (t!8886 List!3812)) )
))
(declare-fun arrayNoDuplicates!0 (array!12862 (_ BitVec 32) List!3812) Bool)

(assert (=> b!266386 (= res!130649 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3809))))

(declare-fun b!266383 () Bool)

(declare-fun res!130656 () Bool)

(assert (=> b!266383 (=> (not res!130656) (not e!172382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266383 (= res!130656 (validKeyInArray!0 k0!2698))))

(declare-fun res!130651 () Bool)

(assert (=> start!25688 (=> (not res!130651) (not e!172382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25688 (= res!130651 (validMask!0 mask!4002))))

(assert (=> start!25688 e!172382))

(assert (=> start!25688 true))

(declare-fun array_inv!4035 (array!12862) Bool)

(assert (=> start!25688 (array_inv!4035 a!3436)))

(assert (= (and start!25688 res!130651) b!266381))

(assert (= (and b!266381 res!130655) b!266383))

(assert (= (and b!266383 res!130656) b!266385))

(assert (= (and b!266385 res!130653) b!266379))

(assert (= (and b!266379 res!130652) b!266382))

(assert (= (and b!266382 res!130650) b!266386))

(assert (= (and b!266386 res!130649) b!266384))

(assert (= (and b!266384 res!130654) b!266380))

(declare-fun m!283145 () Bool)

(assert (=> b!266382 m!283145))

(declare-fun m!283147 () Bool)

(assert (=> b!266380 m!283147))

(declare-fun m!283149 () Bool)

(assert (=> b!266380 m!283149))

(declare-fun m!283151 () Bool)

(assert (=> b!266380 m!283151))

(declare-fun m!283153 () Bool)

(assert (=> b!266385 m!283153))

(declare-fun m!283155 () Bool)

(assert (=> start!25688 m!283155))

(declare-fun m!283157 () Bool)

(assert (=> start!25688 m!283157))

(declare-fun m!283159 () Bool)

(assert (=> b!266379 m!283159))

(declare-fun m!283161 () Bool)

(assert (=> b!266386 m!283161))

(declare-fun m!283163 () Bool)

(assert (=> b!266383 m!283163))

(check-sat (not b!266379) (not b!266385) (not b!266383) (not b!266380) (not b!266386) (not b!266382) (not start!25688))
(check-sat)
