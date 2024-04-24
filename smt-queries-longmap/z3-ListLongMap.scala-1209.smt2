; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25724 () Bool)

(assert start!25724)

(declare-fun b!266753 () Bool)

(declare-fun res!131027 () Bool)

(declare-fun e!172543 () Bool)

(assert (=> b!266753 (=> (not res!131027) (not e!172543))))

(declare-datatypes ((array!12898 0))(
  ( (array!12899 (arr!6103 (Array (_ BitVec 32) (_ BitVec 64))) (size!6455 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12898)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12898 (_ BitVec 32)) Bool)

(assert (=> b!266753 (= res!131027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266754 () Bool)

(declare-fun res!131023 () Bool)

(declare-fun e!172542 () Bool)

(assert (=> b!266754 (=> (not res!131023) (not e!172542))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266754 (= res!131023 (validKeyInArray!0 k0!2698))))

(declare-fun b!266755 () Bool)

(assert (=> b!266755 (= e!172543 false)))

(declare-fun lt!134564 () Bool)

(declare-datatypes ((List!3830 0))(
  ( (Nil!3827) (Cons!3826 (h!4493 (_ BitVec 64)) (t!8904 List!3830)) )
))
(declare-fun arrayNoDuplicates!0 (array!12898 (_ BitVec 32) List!3830) Bool)

(assert (=> b!266755 (= lt!134564 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3827))))

(declare-fun b!266756 () Bool)

(declare-fun res!131024 () Bool)

(assert (=> b!266756 (=> (not res!131024) (not e!172542))))

(declare-fun arrayContainsKey!0 (array!12898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266756 (= res!131024 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266757 () Bool)

(declare-fun res!131026 () Bool)

(assert (=> b!266757 (=> (not res!131026) (not e!172542))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266757 (= res!131026 (and (= (size!6455 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6455 a!3436))))))

(declare-fun res!131025 () Bool)

(assert (=> start!25724 (=> (not res!131025) (not e!172542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25724 (= res!131025 (validMask!0 mask!4002))))

(assert (=> start!25724 e!172542))

(assert (=> start!25724 true))

(declare-fun array_inv!4053 (array!12898) Bool)

(assert (=> start!25724 (array_inv!4053 a!3436)))

(declare-fun b!266758 () Bool)

(assert (=> b!266758 (= e!172542 e!172543)))

(declare-fun res!131028 () Bool)

(assert (=> b!266758 (=> (not res!131028) (not e!172543))))

(declare-datatypes ((SeekEntryResult!1259 0))(
  ( (MissingZero!1259 (index!7206 (_ BitVec 32))) (Found!1259 (index!7207 (_ BitVec 32))) (Intermediate!1259 (undefined!2071 Bool) (index!7208 (_ BitVec 32)) (x!25616 (_ BitVec 32))) (Undefined!1259) (MissingVacant!1259 (index!7209 (_ BitVec 32))) )
))
(declare-fun lt!134565 () SeekEntryResult!1259)

(assert (=> b!266758 (= res!131028 (or (= lt!134565 (MissingZero!1259 i!1355)) (= lt!134565 (MissingVacant!1259 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12898 (_ BitVec 32)) SeekEntryResult!1259)

(assert (=> b!266758 (= lt!134565 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25724 res!131025) b!266757))

(assert (= (and b!266757 res!131026) b!266754))

(assert (= (and b!266754 res!131023) b!266756))

(assert (= (and b!266756 res!131024) b!266758))

(assert (= (and b!266758 res!131028) b!266753))

(assert (= (and b!266753 res!131027) b!266755))

(declare-fun m!283451 () Bool)

(assert (=> b!266753 m!283451))

(declare-fun m!283453 () Bool)

(assert (=> b!266755 m!283453))

(declare-fun m!283455 () Bool)

(assert (=> b!266754 m!283455))

(declare-fun m!283457 () Bool)

(assert (=> b!266756 m!283457))

(declare-fun m!283459 () Bool)

(assert (=> start!25724 m!283459))

(declare-fun m!283461 () Bool)

(assert (=> start!25724 m!283461))

(declare-fun m!283463 () Bool)

(assert (=> b!266758 m!283463))

(check-sat (not b!266755) (not start!25724) (not b!266753) (not b!266754) (not b!266756) (not b!266758))
(check-sat)
