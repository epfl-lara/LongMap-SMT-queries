; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25622 () Bool)

(assert start!25622)

(declare-fun b!265763 () Bool)

(declare-fun res!130033 () Bool)

(declare-fun e!172083 () Bool)

(assert (=> b!265763 (=> (not res!130033) (not e!172083))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265763 (= res!130033 (validKeyInArray!0 k0!2698))))

(declare-fun res!130035 () Bool)

(assert (=> start!25622 (=> (not res!130035) (not e!172083))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25622 (= res!130035 (validMask!0 mask!4002))))

(assert (=> start!25622 e!172083))

(assert (=> start!25622 true))

(declare-datatypes ((array!12796 0))(
  ( (array!12797 (arr!6052 (Array (_ BitVec 32) (_ BitVec 64))) (size!6404 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12796)

(declare-fun array_inv!4002 (array!12796) Bool)

(assert (=> start!25622 (array_inv!4002 a!3436)))

(declare-fun b!265764 () Bool)

(declare-fun res!130036 () Bool)

(declare-fun e!172085 () Bool)

(assert (=> b!265764 (=> (not res!130036) (not e!172085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12796 (_ BitVec 32)) Bool)

(assert (=> b!265764 (= res!130036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265765 () Bool)

(declare-fun res!130037 () Bool)

(assert (=> b!265765 (=> (not res!130037) (not e!172083))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265765 (= res!130037 (and (= (size!6404 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6404 a!3436))))))

(declare-fun b!265766 () Bool)

(declare-fun res!130034 () Bool)

(assert (=> b!265766 (=> (not res!130034) (not e!172083))))

(declare-fun arrayContainsKey!0 (array!12796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265766 (= res!130034 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265767 () Bool)

(assert (=> b!265767 (= e!172083 e!172085)))

(declare-fun res!130038 () Bool)

(assert (=> b!265767 (=> (not res!130038) (not e!172085))))

(declare-datatypes ((SeekEntryResult!1208 0))(
  ( (MissingZero!1208 (index!7002 (_ BitVec 32))) (Found!1208 (index!7003 (_ BitVec 32))) (Intermediate!1208 (undefined!2020 Bool) (index!7004 (_ BitVec 32)) (x!25429 (_ BitVec 32))) (Undefined!1208) (MissingVacant!1208 (index!7005 (_ BitVec 32))) )
))
(declare-fun lt!134259 () SeekEntryResult!1208)

(assert (=> b!265767 (= res!130038 (or (= lt!134259 (MissingZero!1208 i!1355)) (= lt!134259 (MissingVacant!1208 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12796 (_ BitVec 32)) SeekEntryResult!1208)

(assert (=> b!265767 (= lt!134259 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265768 () Bool)

(assert (=> b!265768 (= e!172085 false)))

(declare-fun lt!134258 () Bool)

(declare-datatypes ((List!3779 0))(
  ( (Nil!3776) (Cons!3775 (h!4442 (_ BitVec 64)) (t!8853 List!3779)) )
))
(declare-fun arrayNoDuplicates!0 (array!12796 (_ BitVec 32) List!3779) Bool)

(assert (=> b!265768 (= lt!134258 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3776))))

(assert (= (and start!25622 res!130035) b!265765))

(assert (= (and b!265765 res!130037) b!265763))

(assert (= (and b!265763 res!130033) b!265766))

(assert (= (and b!265766 res!130034) b!265767))

(assert (= (and b!265767 res!130038) b!265764))

(assert (= (and b!265764 res!130036) b!265768))

(declare-fun m!282665 () Bool)

(assert (=> b!265766 m!282665))

(declare-fun m!282667 () Bool)

(assert (=> b!265767 m!282667))

(declare-fun m!282669 () Bool)

(assert (=> b!265764 m!282669))

(declare-fun m!282671 () Bool)

(assert (=> b!265763 m!282671))

(declare-fun m!282673 () Bool)

(assert (=> start!25622 m!282673))

(declare-fun m!282675 () Bool)

(assert (=> start!25622 m!282675))

(declare-fun m!282677 () Bool)

(assert (=> b!265768 m!282677))

(check-sat (not b!265768) (not b!265764) (not b!265766) (not b!265767) (not start!25622) (not b!265763))
(check-sat)
