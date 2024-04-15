; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25628 () Bool)

(assert start!25628)

(declare-fun b!265623 () Bool)

(declare-fun res!129971 () Bool)

(declare-fun e!171985 () Bool)

(assert (=> b!265623 (=> (not res!129971) (not e!171985))))

(declare-datatypes ((array!12795 0))(
  ( (array!12796 (arr!6051 (Array (_ BitVec 32) (_ BitVec 64))) (size!6404 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12795)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265623 (= res!129971 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265624 () Bool)

(declare-fun e!171986 () Bool)

(assert (=> b!265624 (= e!171986 false)))

(declare-fun lt!134036 () Bool)

(declare-datatypes ((List!3838 0))(
  ( (Nil!3835) (Cons!3834 (h!4501 (_ BitVec 64)) (t!8911 List!3838)) )
))
(declare-fun arrayNoDuplicates!0 (array!12795 (_ BitVec 32) List!3838) Bool)

(assert (=> b!265624 (= lt!134036 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3835))))

(declare-fun b!265625 () Bool)

(declare-fun res!129973 () Bool)

(assert (=> b!265625 (=> (not res!129973) (not e!171985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265625 (= res!129973 (validKeyInArray!0 k0!2698))))

(declare-fun res!129976 () Bool)

(assert (=> start!25628 (=> (not res!129976) (not e!171985))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25628 (= res!129976 (validMask!0 mask!4002))))

(assert (=> start!25628 e!171985))

(assert (=> start!25628 true))

(declare-fun array_inv!4023 (array!12795) Bool)

(assert (=> start!25628 (array_inv!4023 a!3436)))

(declare-fun b!265626 () Bool)

(assert (=> b!265626 (= e!171985 e!171986)))

(declare-fun res!129975 () Bool)

(assert (=> b!265626 (=> (not res!129975) (not e!171986))))

(declare-datatypes ((SeekEntryResult!1241 0))(
  ( (MissingZero!1241 (index!7134 (_ BitVec 32))) (Found!1241 (index!7135 (_ BitVec 32))) (Intermediate!1241 (undefined!2053 Bool) (index!7136 (_ BitVec 32)) (x!25469 (_ BitVec 32))) (Undefined!1241) (MissingVacant!1241 (index!7137 (_ BitVec 32))) )
))
(declare-fun lt!134037 () SeekEntryResult!1241)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265626 (= res!129975 (or (= lt!134037 (MissingZero!1241 i!1355)) (= lt!134037 (MissingVacant!1241 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12795 (_ BitVec 32)) SeekEntryResult!1241)

(assert (=> b!265626 (= lt!134037 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265627 () Bool)

(declare-fun res!129974 () Bool)

(assert (=> b!265627 (=> (not res!129974) (not e!171985))))

(assert (=> b!265627 (= res!129974 (and (= (size!6404 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6404 a!3436))))))

(declare-fun b!265628 () Bool)

(declare-fun res!129972 () Bool)

(assert (=> b!265628 (=> (not res!129972) (not e!171986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12795 (_ BitVec 32)) Bool)

(assert (=> b!265628 (= res!129972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25628 res!129976) b!265627))

(assert (= (and b!265627 res!129974) b!265625))

(assert (= (and b!265625 res!129973) b!265623))

(assert (= (and b!265623 res!129971) b!265626))

(assert (= (and b!265626 res!129975) b!265628))

(assert (= (and b!265628 res!129972) b!265624))

(declare-fun m!281909 () Bool)

(assert (=> b!265625 m!281909))

(declare-fun m!281911 () Bool)

(assert (=> b!265624 m!281911))

(declare-fun m!281913 () Bool)

(assert (=> b!265626 m!281913))

(declare-fun m!281915 () Bool)

(assert (=> b!265623 m!281915))

(declare-fun m!281917 () Bool)

(assert (=> start!25628 m!281917))

(declare-fun m!281919 () Bool)

(assert (=> start!25628 m!281919))

(declare-fun m!281921 () Bool)

(assert (=> b!265628 m!281921))

(check-sat (not b!265623) (not b!265628) (not start!25628) (not b!265625) (not b!265624) (not b!265626))
(check-sat)
