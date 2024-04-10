; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25814 () Bool)

(assert start!25814)

(declare-fun b!267407 () Bool)

(declare-fun res!131704 () Bool)

(declare-fun e!172855 () Bool)

(assert (=> b!267407 (=> (not res!131704) (not e!172855))))

(declare-datatypes ((array!12980 0))(
  ( (array!12981 (arr!6144 (Array (_ BitVec 32) (_ BitVec 64))) (size!6496 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12980)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267407 (= res!131704 (and (= (size!6496 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6496 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6496 a!3325))))))

(declare-fun res!131706 () Bool)

(assert (=> start!25814 (=> (not res!131706) (not e!172855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25814 (= res!131706 (validMask!0 mask!3868))))

(assert (=> start!25814 e!172855))

(declare-fun array_inv!4107 (array!12980) Bool)

(assert (=> start!25814 (array_inv!4107 a!3325)))

(assert (=> start!25814 true))

(declare-fun b!267408 () Bool)

(declare-fun res!131703 () Bool)

(assert (=> b!267408 (=> (not res!131703) (not e!172855))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267408 (= res!131703 (validKeyInArray!0 k0!2581))))

(declare-fun b!267409 () Bool)

(declare-fun res!131705 () Bool)

(assert (=> b!267409 (=> (not res!131705) (not e!172855))))

(assert (=> b!267409 (= res!131705 (and (bvsle #b00000000000000000000000000000000 (size!6496 a!3325)) (bvslt (size!6496 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267410 () Bool)

(declare-datatypes ((List!3952 0))(
  ( (Nil!3949) (Cons!3948 (h!4615 (_ BitVec 64)) (t!9034 List!3952)) )
))
(declare-fun noDuplicate!111 (List!3952) Bool)

(assert (=> b!267410 (= e!172855 (not (noDuplicate!111 Nil!3949)))))

(assert (= (and start!25814 res!131706) b!267407))

(assert (= (and b!267407 res!131704) b!267408))

(assert (= (and b!267408 res!131703) b!267409))

(assert (= (and b!267409 res!131705) b!267410))

(declare-fun m!283787 () Bool)

(assert (=> start!25814 m!283787))

(declare-fun m!283789 () Bool)

(assert (=> start!25814 m!283789))

(declare-fun m!283791 () Bool)

(assert (=> b!267408 m!283791))

(declare-fun m!283793 () Bool)

(assert (=> b!267410 m!283793))

(check-sat (not start!25814) (not b!267410) (not b!267408))
(check-sat)
(get-model)

(declare-fun d!64321 () Bool)

(assert (=> d!64321 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25814 d!64321))

(declare-fun d!64331 () Bool)

(assert (=> d!64331 (= (array_inv!4107 a!3325) (bvsge (size!6496 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25814 d!64331))

(declare-fun d!64333 () Bool)

(declare-fun res!131723 () Bool)

(declare-fun e!172867 () Bool)

(assert (=> d!64333 (=> res!131723 e!172867)))

(get-info :version)

(assert (=> d!64333 (= res!131723 ((_ is Nil!3949) Nil!3949))))

(assert (=> d!64333 (= (noDuplicate!111 Nil!3949) e!172867)))

(declare-fun b!267427 () Bool)

(declare-fun e!172868 () Bool)

(assert (=> b!267427 (= e!172867 e!172868)))

(declare-fun res!131724 () Bool)

(assert (=> b!267427 (=> (not res!131724) (not e!172868))))

(declare-fun contains!1922 (List!3952 (_ BitVec 64)) Bool)

(assert (=> b!267427 (= res!131724 (not (contains!1922 (t!9034 Nil!3949) (h!4615 Nil!3949))))))

(declare-fun b!267428 () Bool)

(assert (=> b!267428 (= e!172868 (noDuplicate!111 (t!9034 Nil!3949)))))

(assert (= (and d!64333 (not res!131723)) b!267427))

(assert (= (and b!267427 res!131724) b!267428))

(declare-fun m!283803 () Bool)

(assert (=> b!267427 m!283803))

(declare-fun m!283805 () Bool)

(assert (=> b!267428 m!283805))

(assert (=> b!267410 d!64333))

(declare-fun d!64335 () Bool)

(assert (=> d!64335 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267408 d!64335))

(check-sat (not b!267428) (not b!267427))
(check-sat)
