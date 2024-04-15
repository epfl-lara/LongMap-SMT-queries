; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25784 () Bool)

(assert start!25784)

(declare-fun b!267130 () Bool)

(declare-fun res!131485 () Bool)

(declare-fun e!172687 () Bool)

(assert (=> b!267130 (=> (not res!131485) (not e!172687))))

(declare-datatypes ((array!12951 0))(
  ( (array!12952 (arr!6129 (Array (_ BitVec 32) (_ BitVec 64))) (size!6482 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12951)

(declare-datatypes ((List!3916 0))(
  ( (Nil!3913) (Cons!3912 (h!4579 (_ BitVec 64)) (t!8989 List!3916)) )
))
(declare-fun arrayNoDuplicates!0 (array!12951 (_ BitVec 32) List!3916) Bool)

(assert (=> b!267130 (= res!131485 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3913))))

(declare-fun b!267131 () Bool)

(declare-fun res!131483 () Bool)

(assert (=> b!267131 (=> (not res!131483) (not e!172687))))

(assert (=> b!267131 (= res!131483 (bvslt #b00000000000000000000000000000000 (size!6482 a!3436)))))

(declare-fun b!267132 () Bool)

(declare-fun res!131481 () Bool)

(declare-fun e!172688 () Bool)

(assert (=> b!267132 (=> (not res!131481) (not e!172688))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267132 (= res!131481 (validKeyInArray!0 k0!2698))))

(declare-fun b!267133 () Bool)

(declare-fun res!131482 () Bool)

(assert (=> b!267133 (=> (not res!131482) (not e!172688))))

(declare-fun arrayContainsKey!0 (array!12951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267133 (= res!131482 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267134 () Bool)

(declare-fun res!131480 () Bool)

(assert (=> b!267134 (=> (not res!131480) (not e!172688))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267134 (= res!131480 (and (= (size!6482 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6482 a!3436))))))

(declare-fun b!267135 () Bool)

(assert (=> b!267135 (= e!172687 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12951 (_ BitVec 32)) Bool)

(assert (=> b!267135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12952 (store (arr!6129 a!3436) i!1355 k0!2698) (size!6482 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8253 0))(
  ( (Unit!8254) )
))
(declare-fun lt!134495 () Unit!8253)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12951 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8253)

(assert (=> b!267135 (= lt!134495 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun res!131484 () Bool)

(assert (=> start!25784 (=> (not res!131484) (not e!172688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25784 (= res!131484 (validMask!0 mask!4002))))

(assert (=> start!25784 e!172688))

(assert (=> start!25784 true))

(declare-fun array_inv!4101 (array!12951) Bool)

(assert (=> start!25784 (array_inv!4101 a!3436)))

(declare-fun b!267136 () Bool)

(declare-fun res!131478 () Bool)

(assert (=> b!267136 (=> (not res!131478) (not e!172687))))

(assert (=> b!267136 (= res!131478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267137 () Bool)

(assert (=> b!267137 (= e!172688 e!172687)))

(declare-fun res!131479 () Bool)

(assert (=> b!267137 (=> (not res!131479) (not e!172687))))

(declare-datatypes ((SeekEntryResult!1319 0))(
  ( (MissingZero!1319 (index!7446 (_ BitVec 32))) (Found!1319 (index!7447 (_ BitVec 32))) (Intermediate!1319 (undefined!2131 Bool) (index!7448 (_ BitVec 32)) (x!25755 (_ BitVec 32))) (Undefined!1319) (MissingVacant!1319 (index!7449 (_ BitVec 32))) )
))
(declare-fun lt!134496 () SeekEntryResult!1319)

(assert (=> b!267137 (= res!131479 (or (= lt!134496 (MissingZero!1319 i!1355)) (= lt!134496 (MissingVacant!1319 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12951 (_ BitVec 32)) SeekEntryResult!1319)

(assert (=> b!267137 (= lt!134496 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25784 res!131484) b!267134))

(assert (= (and b!267134 res!131480) b!267132))

(assert (= (and b!267132 res!131481) b!267133))

(assert (= (and b!267133 res!131482) b!267137))

(assert (= (and b!267137 res!131479) b!267136))

(assert (= (and b!267136 res!131478) b!267130))

(assert (= (and b!267130 res!131485) b!267131))

(assert (= (and b!267131 res!131483) b!267135))

(declare-fun m!283091 () Bool)

(assert (=> b!267130 m!283091))

(declare-fun m!283093 () Bool)

(assert (=> b!267132 m!283093))

(declare-fun m!283095 () Bool)

(assert (=> start!25784 m!283095))

(declare-fun m!283097 () Bool)

(assert (=> start!25784 m!283097))

(declare-fun m!283099 () Bool)

(assert (=> b!267133 m!283099))

(declare-fun m!283101 () Bool)

(assert (=> b!267137 m!283101))

(declare-fun m!283103 () Bool)

(assert (=> b!267136 m!283103))

(declare-fun m!283105 () Bool)

(assert (=> b!267135 m!283105))

(declare-fun m!283107 () Bool)

(assert (=> b!267135 m!283107))

(declare-fun m!283109 () Bool)

(assert (=> b!267135 m!283109))

(check-sat (not start!25784) (not b!267136) (not b!267130) (not b!267133) (not b!267132) (not b!267137) (not b!267135))
(check-sat)
