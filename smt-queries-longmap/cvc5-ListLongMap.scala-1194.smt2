; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25630 () Bool)

(assert start!25630)

(declare-fun b!265824 () Bool)

(declare-fun res!130122 () Bool)

(declare-fun e!172114 () Bool)

(assert (=> b!265824 (=> (not res!130122) (not e!172114))))

(declare-datatypes ((array!12809 0))(
  ( (array!12810 (arr!6059 (Array (_ BitVec 32) (_ BitVec 64))) (size!6411 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12809)

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!265824 (= res!130122 (and (= (size!6411 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6411 a!3436))))))

(declare-fun b!265825 () Bool)

(declare-fun e!172115 () Bool)

(assert (=> b!265825 (= e!172114 e!172115)))

(declare-fun res!130125 () Bool)

(assert (=> b!265825 (=> (not res!130125) (not e!172115))))

(declare-datatypes ((SeekEntryResult!1250 0))(
  ( (MissingZero!1250 (index!7170 (_ BitVec 32))) (Found!1250 (index!7171 (_ BitVec 32))) (Intermediate!1250 (undefined!2062 Bool) (index!7172 (_ BitVec 32)) (x!25487 (_ BitVec 32))) (Undefined!1250) (MissingVacant!1250 (index!7173 (_ BitVec 32))) )
))
(declare-fun lt!134235 () SeekEntryResult!1250)

(assert (=> b!265825 (= res!130125 (or (= lt!134235 (MissingZero!1250 i!1355)) (= lt!134235 (MissingVacant!1250 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12809 (_ BitVec 32)) SeekEntryResult!1250)

(assert (=> b!265825 (= lt!134235 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265826 () Bool)

(declare-fun res!130120 () Bool)

(assert (=> b!265826 (=> (not res!130120) (not e!172114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265826 (= res!130120 (validKeyInArray!0 k!2698))))

(declare-fun res!130123 () Bool)

(assert (=> start!25630 (=> (not res!130123) (not e!172114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25630 (= res!130123 (validMask!0 mask!4002))))

(assert (=> start!25630 e!172114))

(assert (=> start!25630 true))

(declare-fun array_inv!4022 (array!12809) Bool)

(assert (=> start!25630 (array_inv!4022 a!3436)))

(declare-fun b!265827 () Bool)

(declare-fun res!130121 () Bool)

(assert (=> b!265827 (=> (not res!130121) (not e!172114))))

(declare-fun arrayContainsKey!0 (array!12809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265827 (= res!130121 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265828 () Bool)

(declare-fun res!130124 () Bool)

(assert (=> b!265828 (=> (not res!130124) (not e!172115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12809 (_ BitVec 32)) Bool)

(assert (=> b!265828 (= res!130124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265829 () Bool)

(assert (=> b!265829 (= e!172115 false)))

(declare-fun lt!134236 () Bool)

(declare-datatypes ((List!3873 0))(
  ( (Nil!3870) (Cons!3869 (h!4536 (_ BitVec 64)) (t!8955 List!3873)) )
))
(declare-fun arrayNoDuplicates!0 (array!12809 (_ BitVec 32) List!3873) Bool)

(assert (=> b!265829 (= lt!134236 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3870))))

(assert (= (and start!25630 res!130123) b!265824))

(assert (= (and b!265824 res!130122) b!265826))

(assert (= (and b!265826 res!130120) b!265827))

(assert (= (and b!265827 res!130121) b!265825))

(assert (= (and b!265825 res!130125) b!265828))

(assert (= (and b!265828 res!130124) b!265829))

(declare-fun m!282543 () Bool)

(assert (=> start!25630 m!282543))

(declare-fun m!282545 () Bool)

(assert (=> start!25630 m!282545))

(declare-fun m!282547 () Bool)

(assert (=> b!265825 m!282547))

(declare-fun m!282549 () Bool)

(assert (=> b!265828 m!282549))

(declare-fun m!282551 () Bool)

(assert (=> b!265829 m!282551))

(declare-fun m!282553 () Bool)

(assert (=> b!265827 m!282553))

(declare-fun m!282555 () Bool)

(assert (=> b!265826 m!282555))

(push 1)

(assert (not b!265828))

(assert (not b!265827))

(assert (not start!25630))

(assert (not b!265825))

(assert (not b!265829))

(assert (not b!265826))

(check-sat)

