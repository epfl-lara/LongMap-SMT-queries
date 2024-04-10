; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25740 () Bool)

(assert start!25740)

(declare-fun b!266895 () Bool)

(declare-fun res!131195 () Bool)

(declare-fun e!172609 () Bool)

(assert (=> b!266895 (=> (not res!131195) (not e!172609))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266895 (= res!131195 (validKeyInArray!0 k0!2698))))

(declare-fun b!266896 () Bool)

(declare-fun res!131196 () Bool)

(assert (=> b!266896 (=> (not res!131196) (not e!172609))))

(declare-datatypes ((array!12919 0))(
  ( (array!12920 (arr!6114 (Array (_ BitVec 32) (_ BitVec 64))) (size!6466 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12919)

(declare-fun arrayContainsKey!0 (array!12919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266896 (= res!131196 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266897 () Bool)

(declare-fun e!172608 () Bool)

(assert (=> b!266897 (= e!172609 e!172608)))

(declare-fun res!131192 () Bool)

(assert (=> b!266897 (=> (not res!131192) (not e!172608))))

(declare-datatypes ((SeekEntryResult!1305 0))(
  ( (MissingZero!1305 (index!7390 (_ BitVec 32))) (Found!1305 (index!7391 (_ BitVec 32))) (Intermediate!1305 (undefined!2117 Bool) (index!7392 (_ BitVec 32)) (x!25686 (_ BitVec 32))) (Undefined!1305) (MissingVacant!1305 (index!7393 (_ BitVec 32))) )
))
(declare-fun lt!134557 () SeekEntryResult!1305)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266897 (= res!131192 (or (= lt!134557 (MissingZero!1305 i!1355)) (= lt!134557 (MissingVacant!1305 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12919 (_ BitVec 32)) SeekEntryResult!1305)

(assert (=> b!266897 (= lt!134557 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266898 () Bool)

(declare-fun res!131194 () Bool)

(assert (=> b!266898 (=> (not res!131194) (not e!172609))))

(assert (=> b!266898 (= res!131194 (and (= (size!6466 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6466 a!3436))))))

(declare-fun b!266899 () Bool)

(assert (=> b!266899 (= e!172608 false)))

(declare-fun lt!134556 () Bool)

(declare-datatypes ((List!3928 0))(
  ( (Nil!3925) (Cons!3924 (h!4591 (_ BitVec 64)) (t!9010 List!3928)) )
))
(declare-fun arrayNoDuplicates!0 (array!12919 (_ BitVec 32) List!3928) Bool)

(assert (=> b!266899 (= lt!134556 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3925))))

(declare-fun b!266900 () Bool)

(declare-fun res!131191 () Bool)

(assert (=> b!266900 (=> (not res!131191) (not e!172608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12919 (_ BitVec 32)) Bool)

(assert (=> b!266900 (= res!131191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131193 () Bool)

(assert (=> start!25740 (=> (not res!131193) (not e!172609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25740 (= res!131193 (validMask!0 mask!4002))))

(assert (=> start!25740 e!172609))

(assert (=> start!25740 true))

(declare-fun array_inv!4077 (array!12919) Bool)

(assert (=> start!25740 (array_inv!4077 a!3436)))

(assert (= (and start!25740 res!131193) b!266898))

(assert (= (and b!266898 res!131194) b!266895))

(assert (= (and b!266895 res!131195) b!266896))

(assert (= (and b!266896 res!131196) b!266897))

(assert (= (and b!266897 res!131192) b!266900))

(assert (= (and b!266900 res!131191) b!266899))

(declare-fun m!283385 () Bool)

(assert (=> b!266897 m!283385))

(declare-fun m!283387 () Bool)

(assert (=> b!266900 m!283387))

(declare-fun m!283389 () Bool)

(assert (=> b!266896 m!283389))

(declare-fun m!283391 () Bool)

(assert (=> start!25740 m!283391))

(declare-fun m!283393 () Bool)

(assert (=> start!25740 m!283393))

(declare-fun m!283395 () Bool)

(assert (=> b!266899 m!283395))

(declare-fun m!283397 () Bool)

(assert (=> b!266895 m!283397))

(check-sat (not b!266900) (not b!266895) (not b!266896) (not b!266899) (not start!25740) (not b!266897))
(check-sat)
