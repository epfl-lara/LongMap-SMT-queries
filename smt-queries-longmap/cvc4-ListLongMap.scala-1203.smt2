; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25688 () Bool)

(assert start!25688)

(declare-fun b!266380 () Bool)

(declare-fun res!130679 () Bool)

(declare-fun e!172376 () Bool)

(assert (=> b!266380 (=> (not res!130679) (not e!172376))))

(declare-datatypes ((array!12867 0))(
  ( (array!12868 (arr!6088 (Array (_ BitVec 32) (_ BitVec 64))) (size!6440 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12867)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266380 (= res!130679 (and (= (size!6440 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6440 a!3436))))))

(declare-fun res!130680 () Bool)

(assert (=> start!25688 (=> (not res!130680) (not e!172376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25688 (= res!130680 (validMask!0 mask!4002))))

(assert (=> start!25688 e!172376))

(assert (=> start!25688 true))

(declare-fun array_inv!4051 (array!12867) Bool)

(assert (=> start!25688 (array_inv!4051 a!3436)))

(declare-fun b!266381 () Bool)

(declare-fun res!130681 () Bool)

(assert (=> b!266381 (=> (not res!130681) (not e!172376))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266381 (= res!130681 (validKeyInArray!0 k!2698))))

(declare-fun b!266382 () Bool)

(declare-fun res!130677 () Bool)

(declare-fun e!172374 () Bool)

(assert (=> b!266382 (=> (not res!130677) (not e!172374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12867 (_ BitVec 32)) Bool)

(assert (=> b!266382 (= res!130677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266383 () Bool)

(declare-fun res!130682 () Bool)

(assert (=> b!266383 (=> (not res!130682) (not e!172376))))

(declare-fun arrayContainsKey!0 (array!12867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266383 (= res!130682 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266384 () Bool)

(declare-fun res!130678 () Bool)

(assert (=> b!266384 (=> (not res!130678) (not e!172374))))

(declare-datatypes ((List!3902 0))(
  ( (Nil!3899) (Cons!3898 (h!4565 (_ BitVec 64)) (t!8984 List!3902)) )
))
(declare-fun arrayNoDuplicates!0 (array!12867 (_ BitVec 32) List!3902) Bool)

(assert (=> b!266384 (= res!130678 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3899))))

(declare-fun b!266385 () Bool)

(declare-fun res!130683 () Bool)

(assert (=> b!266385 (=> (not res!130683) (not e!172374))))

(assert (=> b!266385 (= res!130683 (bvslt #b00000000000000000000000000000000 (size!6440 a!3436)))))

(declare-fun b!266386 () Bool)

(assert (=> b!266386 (= e!172376 e!172374)))

(declare-fun res!130676 () Bool)

(assert (=> b!266386 (=> (not res!130676) (not e!172374))))

(declare-datatypes ((SeekEntryResult!1279 0))(
  ( (MissingZero!1279 (index!7286 (_ BitVec 32))) (Found!1279 (index!7287 (_ BitVec 32))) (Intermediate!1279 (undefined!2091 Bool) (index!7288 (_ BitVec 32)) (x!25588 (_ BitVec 32))) (Undefined!1279) (MissingVacant!1279 (index!7289 (_ BitVec 32))) )
))
(declare-fun lt!134409 () SeekEntryResult!1279)

(assert (=> b!266386 (= res!130676 (or (= lt!134409 (MissingZero!1279 i!1355)) (= lt!134409 (MissingVacant!1279 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12867 (_ BitVec 32)) SeekEntryResult!1279)

(assert (=> b!266386 (= lt!134409 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266387 () Bool)

(assert (=> b!266387 (= e!172374 (not true))))

(assert (=> b!266387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12868 (store (arr!6088 a!3436) i!1355 k!2698) (size!6440 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8279 0))(
  ( (Unit!8280) )
))
(declare-fun lt!134410 () Unit!8279)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8279)

(assert (=> b!266387 (= lt!134410 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(assert (= (and start!25688 res!130680) b!266380))

(assert (= (and b!266380 res!130679) b!266381))

(assert (= (and b!266381 res!130681) b!266383))

(assert (= (and b!266383 res!130682) b!266386))

(assert (= (and b!266386 res!130676) b!266382))

(assert (= (and b!266382 res!130677) b!266384))

(assert (= (and b!266384 res!130678) b!266385))

(assert (= (and b!266385 res!130683) b!266387))

(declare-fun m!282979 () Bool)

(assert (=> b!266387 m!282979))

(declare-fun m!282981 () Bool)

(assert (=> b!266387 m!282981))

(declare-fun m!282983 () Bool)

(assert (=> b!266387 m!282983))

(declare-fun m!282985 () Bool)

(assert (=> b!266381 m!282985))

(declare-fun m!282987 () Bool)

(assert (=> b!266383 m!282987))

(declare-fun m!282989 () Bool)

(assert (=> b!266386 m!282989))

(declare-fun m!282991 () Bool)

(assert (=> b!266384 m!282991))

(declare-fun m!282993 () Bool)

(assert (=> b!266382 m!282993))

(declare-fun m!282995 () Bool)

(assert (=> start!25688 m!282995))

(declare-fun m!282997 () Bool)

(assert (=> start!25688 m!282997))

(push 1)

(assert (not b!266386))

(assert (not b!266383))

(assert (not b!266384))

(assert (not b!266382))

(assert (not start!25688))

(assert (not b!266387))

(assert (not b!266381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

