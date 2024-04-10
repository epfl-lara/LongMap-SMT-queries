; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25728 () Bool)

(assert start!25728)

(declare-fun b!266778 () Bool)

(declare-fun res!131074 () Bool)

(declare-fun e!172555 () Bool)

(assert (=> b!266778 (=> (not res!131074) (not e!172555))))

(declare-datatypes ((array!12907 0))(
  ( (array!12908 (arr!6108 (Array (_ BitVec 32) (_ BitVec 64))) (size!6460 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12907)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266778 (= res!131074 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266779 () Bool)

(declare-fun res!131077 () Bool)

(assert (=> b!266779 (=> (not res!131077) (not e!172555))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266779 (= res!131077 (and (= (size!6460 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6460 a!3436))))))

(declare-fun b!266780 () Bool)

(declare-fun e!172554 () Bool)

(assert (=> b!266780 (= e!172554 false)))

(declare-fun lt!134529 () Bool)

(declare-datatypes ((List!3922 0))(
  ( (Nil!3919) (Cons!3918 (h!4585 (_ BitVec 64)) (t!9004 List!3922)) )
))
(declare-fun arrayNoDuplicates!0 (array!12907 (_ BitVec 32) List!3922) Bool)

(assert (=> b!266780 (= lt!134529 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3919))))

(declare-fun b!266781 () Bool)

(assert (=> b!266781 (= e!172555 e!172554)))

(declare-fun res!131079 () Bool)

(assert (=> b!266781 (=> (not res!131079) (not e!172554))))

(declare-datatypes ((SeekEntryResult!1299 0))(
  ( (MissingZero!1299 (index!7366 (_ BitVec 32))) (Found!1299 (index!7367 (_ BitVec 32))) (Intermediate!1299 (undefined!2111 Bool) (index!7368 (_ BitVec 32)) (x!25664 (_ BitVec 32))) (Undefined!1299) (MissingVacant!1299 (index!7369 (_ BitVec 32))) )
))
(declare-fun lt!134530 () SeekEntryResult!1299)

(assert (=> b!266781 (= res!131079 (or (= lt!134530 (MissingZero!1299 i!1355)) (= lt!134530 (MissingVacant!1299 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12907 (_ BitVec 32)) SeekEntryResult!1299)

(assert (=> b!266781 (= lt!134530 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266782 () Bool)

(declare-fun res!131075 () Bool)

(assert (=> b!266782 (=> (not res!131075) (not e!172554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12907 (_ BitVec 32)) Bool)

(assert (=> b!266782 (= res!131075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131076 () Bool)

(assert (=> start!25728 (=> (not res!131076) (not e!172555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25728 (= res!131076 (validMask!0 mask!4002))))

(assert (=> start!25728 e!172555))

(assert (=> start!25728 true))

(declare-fun array_inv!4071 (array!12907) Bool)

(assert (=> start!25728 (array_inv!4071 a!3436)))

(declare-fun b!266783 () Bool)

(declare-fun res!131078 () Bool)

(assert (=> b!266783 (=> (not res!131078) (not e!172555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266783 (= res!131078 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25728 res!131076) b!266779))

(assert (= (and b!266779 res!131077) b!266783))

(assert (= (and b!266783 res!131078) b!266778))

(assert (= (and b!266778 res!131074) b!266781))

(assert (= (and b!266781 res!131079) b!266782))

(assert (= (and b!266782 res!131075) b!266780))

(declare-fun m!283301 () Bool)

(assert (=> b!266781 m!283301))

(declare-fun m!283303 () Bool)

(assert (=> b!266778 m!283303))

(declare-fun m!283305 () Bool)

(assert (=> start!25728 m!283305))

(declare-fun m!283307 () Bool)

(assert (=> start!25728 m!283307))

(declare-fun m!283309 () Bool)

(assert (=> b!266780 m!283309))

(declare-fun m!283311 () Bool)

(assert (=> b!266783 m!283311))

(declare-fun m!283313 () Bool)

(assert (=> b!266782 m!283313))

(check-sat (not b!266783) (not b!266781) (not b!266782) (not b!266778) (not b!266780) (not start!25728))
(check-sat)
