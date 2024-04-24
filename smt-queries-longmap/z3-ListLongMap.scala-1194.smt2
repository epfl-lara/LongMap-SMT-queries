; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25634 () Bool)

(assert start!25634)

(declare-fun res!130146 () Bool)

(declare-fun e!172139 () Bool)

(assert (=> start!25634 (=> (not res!130146) (not e!172139))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25634 (= res!130146 (validMask!0 mask!4002))))

(assert (=> start!25634 e!172139))

(assert (=> start!25634 true))

(declare-datatypes ((array!12808 0))(
  ( (array!12809 (arr!6058 (Array (_ BitVec 32) (_ BitVec 64))) (size!6410 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12808)

(declare-fun array_inv!4008 (array!12808) Bool)

(assert (=> start!25634 (array_inv!4008 a!3436)))

(declare-fun b!265871 () Bool)

(declare-fun res!130145 () Bool)

(declare-fun e!172137 () Bool)

(assert (=> b!265871 (=> (not res!130145) (not e!172137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12808 (_ BitVec 32)) Bool)

(assert (=> b!265871 (= res!130145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265872 () Bool)

(assert (=> b!265872 (= e!172137 false)))

(declare-fun lt!134295 () Bool)

(declare-datatypes ((List!3785 0))(
  ( (Nil!3782) (Cons!3781 (h!4448 (_ BitVec 64)) (t!8859 List!3785)) )
))
(declare-fun arrayNoDuplicates!0 (array!12808 (_ BitVec 32) List!3785) Bool)

(assert (=> b!265872 (= lt!134295 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3782))))

(declare-fun b!265873 () Bool)

(assert (=> b!265873 (= e!172139 e!172137)))

(declare-fun res!130141 () Bool)

(assert (=> b!265873 (=> (not res!130141) (not e!172137))))

(declare-datatypes ((SeekEntryResult!1214 0))(
  ( (MissingZero!1214 (index!7026 (_ BitVec 32))) (Found!1214 (index!7027 (_ BitVec 32))) (Intermediate!1214 (undefined!2026 Bool) (index!7028 (_ BitVec 32)) (x!25451 (_ BitVec 32))) (Undefined!1214) (MissingVacant!1214 (index!7029 (_ BitVec 32))) )
))
(declare-fun lt!134294 () SeekEntryResult!1214)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265873 (= res!130141 (or (= lt!134294 (MissingZero!1214 i!1355)) (= lt!134294 (MissingVacant!1214 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12808 (_ BitVec 32)) SeekEntryResult!1214)

(assert (=> b!265873 (= lt!134294 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265874 () Bool)

(declare-fun res!130144 () Bool)

(assert (=> b!265874 (=> (not res!130144) (not e!172139))))

(assert (=> b!265874 (= res!130144 (and (= (size!6410 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6410 a!3436))))))

(declare-fun b!265875 () Bool)

(declare-fun res!130142 () Bool)

(assert (=> b!265875 (=> (not res!130142) (not e!172139))))

(declare-fun arrayContainsKey!0 (array!12808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265875 (= res!130142 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265876 () Bool)

(declare-fun res!130143 () Bool)

(assert (=> b!265876 (=> (not res!130143) (not e!172139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265876 (= res!130143 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25634 res!130146) b!265874))

(assert (= (and b!265874 res!130144) b!265876))

(assert (= (and b!265876 res!130143) b!265875))

(assert (= (and b!265875 res!130142) b!265873))

(assert (= (and b!265873 res!130141) b!265871))

(assert (= (and b!265871 res!130145) b!265872))

(declare-fun m!282749 () Bool)

(assert (=> b!265873 m!282749))

(declare-fun m!282751 () Bool)

(assert (=> b!265871 m!282751))

(declare-fun m!282753 () Bool)

(assert (=> start!25634 m!282753))

(declare-fun m!282755 () Bool)

(assert (=> start!25634 m!282755))

(declare-fun m!282757 () Bool)

(assert (=> b!265872 m!282757))

(declare-fun m!282759 () Bool)

(assert (=> b!265875 m!282759))

(declare-fun m!282761 () Bool)

(assert (=> b!265876 m!282761))

(check-sat (not b!265871) (not b!265876) (not b!265872) (not start!25634) (not b!265875) (not b!265873))
(check-sat)
