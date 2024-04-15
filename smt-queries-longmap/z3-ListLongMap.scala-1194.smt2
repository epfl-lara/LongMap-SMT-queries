; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25634 () Bool)

(assert start!25634)

(declare-fun b!265677 () Bool)

(declare-fun e!172012 () Bool)

(declare-fun e!172014 () Bool)

(assert (=> b!265677 (= e!172012 e!172014)))

(declare-fun res!130030 () Bool)

(assert (=> b!265677 (=> (not res!130030) (not e!172014))))

(declare-datatypes ((SeekEntryResult!1244 0))(
  ( (MissingZero!1244 (index!7146 (_ BitVec 32))) (Found!1244 (index!7147 (_ BitVec 32))) (Intermediate!1244 (undefined!2056 Bool) (index!7148 (_ BitVec 32)) (x!25480 (_ BitVec 32))) (Undefined!1244) (MissingVacant!1244 (index!7149 (_ BitVec 32))) )
))
(declare-fun lt!134055 () SeekEntryResult!1244)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265677 (= res!130030 (or (= lt!134055 (MissingZero!1244 i!1355)) (= lt!134055 (MissingVacant!1244 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12801 0))(
  ( (array!12802 (arr!6054 (Array (_ BitVec 32) (_ BitVec 64))) (size!6407 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12801)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12801 (_ BitVec 32)) SeekEntryResult!1244)

(assert (=> b!265677 (= lt!134055 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265678 () Bool)

(assert (=> b!265678 (= e!172014 false)))

(declare-fun lt!134054 () Bool)

(declare-datatypes ((List!3841 0))(
  ( (Nil!3838) (Cons!3837 (h!4504 (_ BitVec 64)) (t!8914 List!3841)) )
))
(declare-fun arrayNoDuplicates!0 (array!12801 (_ BitVec 32) List!3841) Bool)

(assert (=> b!265678 (= lt!134054 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3838))))

(declare-fun b!265679 () Bool)

(declare-fun res!130029 () Bool)

(assert (=> b!265679 (=> (not res!130029) (not e!172012))))

(declare-fun arrayContainsKey!0 (array!12801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265679 (= res!130029 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265681 () Bool)

(declare-fun res!130025 () Bool)

(assert (=> b!265681 (=> (not res!130025) (not e!172012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265681 (= res!130025 (validKeyInArray!0 k0!2698))))

(declare-fun b!265682 () Bool)

(declare-fun res!130026 () Bool)

(assert (=> b!265682 (=> (not res!130026) (not e!172012))))

(assert (=> b!265682 (= res!130026 (and (= (size!6407 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6407 a!3436))))))

(declare-fun b!265680 () Bool)

(declare-fun res!130027 () Bool)

(assert (=> b!265680 (=> (not res!130027) (not e!172014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12801 (_ BitVec 32)) Bool)

(assert (=> b!265680 (= res!130027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130028 () Bool)

(assert (=> start!25634 (=> (not res!130028) (not e!172012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25634 (= res!130028 (validMask!0 mask!4002))))

(assert (=> start!25634 e!172012))

(assert (=> start!25634 true))

(declare-fun array_inv!4026 (array!12801) Bool)

(assert (=> start!25634 (array_inv!4026 a!3436)))

(assert (= (and start!25634 res!130028) b!265682))

(assert (= (and b!265682 res!130026) b!265681))

(assert (= (and b!265681 res!130025) b!265679))

(assert (= (and b!265679 res!130029) b!265677))

(assert (= (and b!265677 res!130030) b!265680))

(assert (= (and b!265680 res!130027) b!265678))

(declare-fun m!281951 () Bool)

(assert (=> b!265681 m!281951))

(declare-fun m!281953 () Bool)

(assert (=> b!265679 m!281953))

(declare-fun m!281955 () Bool)

(assert (=> b!265678 m!281955))

(declare-fun m!281957 () Bool)

(assert (=> b!265680 m!281957))

(declare-fun m!281959 () Bool)

(assert (=> b!265677 m!281959))

(declare-fun m!281961 () Bool)

(assert (=> start!25634 m!281961))

(declare-fun m!281963 () Bool)

(assert (=> start!25634 m!281963))

(check-sat (not b!265681) (not b!265679) (not b!265678) (not b!265680) (not start!25634) (not b!265677))
(check-sat)
