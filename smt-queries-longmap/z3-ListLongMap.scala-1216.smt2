; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25764 () Bool)

(assert start!25764)

(declare-fun b!267111 () Bool)

(declare-fun e!172716 () Bool)

(declare-fun e!172717 () Bool)

(assert (=> b!267111 (= e!172716 e!172717)))

(declare-fun res!131408 () Bool)

(assert (=> b!267111 (=> (not res!131408) (not e!172717))))

(declare-datatypes ((SeekEntryResult!1317 0))(
  ( (MissingZero!1317 (index!7438 (_ BitVec 32))) (Found!1317 (index!7439 (_ BitVec 32))) (Intermediate!1317 (undefined!2129 Bool) (index!7440 (_ BitVec 32)) (x!25730 (_ BitVec 32))) (Undefined!1317) (MissingVacant!1317 (index!7441 (_ BitVec 32))) )
))
(declare-fun lt!134629 () SeekEntryResult!1317)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267111 (= res!131408 (or (= lt!134629 (MissingZero!1317 i!1355)) (= lt!134629 (MissingVacant!1317 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12943 0))(
  ( (array!12944 (arr!6126 (Array (_ BitVec 32) (_ BitVec 64))) (size!6478 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12943)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12943 (_ BitVec 32)) SeekEntryResult!1317)

(assert (=> b!267111 (= lt!134629 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!131409 () Bool)

(assert (=> start!25764 (=> (not res!131409) (not e!172716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25764 (= res!131409 (validMask!0 mask!4002))))

(assert (=> start!25764 e!172716))

(assert (=> start!25764 true))

(declare-fun array_inv!4089 (array!12943) Bool)

(assert (=> start!25764 (array_inv!4089 a!3436)))

(declare-fun b!267112 () Bool)

(declare-fun res!131410 () Bool)

(assert (=> b!267112 (=> (not res!131410) (not e!172716))))

(declare-fun arrayContainsKey!0 (array!12943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267112 (= res!131410 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267113 () Bool)

(declare-fun res!131407 () Bool)

(assert (=> b!267113 (=> (not res!131407) (not e!172716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267113 (= res!131407 (validKeyInArray!0 k0!2698))))

(declare-fun b!267114 () Bool)

(assert (=> b!267114 (= e!172717 false)))

(declare-fun lt!134628 () Bool)

(declare-datatypes ((List!3940 0))(
  ( (Nil!3937) (Cons!3936 (h!4603 (_ BitVec 64)) (t!9022 List!3940)) )
))
(declare-fun arrayNoDuplicates!0 (array!12943 (_ BitVec 32) List!3940) Bool)

(assert (=> b!267114 (= lt!134628 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3937))))

(declare-fun b!267115 () Bool)

(declare-fun res!131412 () Bool)

(assert (=> b!267115 (=> (not res!131412) (not e!172716))))

(assert (=> b!267115 (= res!131412 (and (= (size!6478 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6478 a!3436))))))

(declare-fun b!267116 () Bool)

(declare-fun res!131411 () Bool)

(assert (=> b!267116 (=> (not res!131411) (not e!172717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12943 (_ BitVec 32)) Bool)

(assert (=> b!267116 (= res!131411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25764 res!131409) b!267115))

(assert (= (and b!267115 res!131412) b!267113))

(assert (= (and b!267113 res!131407) b!267112))

(assert (= (and b!267112 res!131410) b!267111))

(assert (= (and b!267111 res!131408) b!267116))

(assert (= (and b!267116 res!131411) b!267114))

(declare-fun m!283553 () Bool)

(assert (=> b!267116 m!283553))

(declare-fun m!283555 () Bool)

(assert (=> b!267113 m!283555))

(declare-fun m!283557 () Bool)

(assert (=> b!267114 m!283557))

(declare-fun m!283559 () Bool)

(assert (=> start!25764 m!283559))

(declare-fun m!283561 () Bool)

(assert (=> start!25764 m!283561))

(declare-fun m!283563 () Bool)

(assert (=> b!267112 m!283563))

(declare-fun m!283565 () Bool)

(assert (=> b!267111 m!283565))

(check-sat (not b!267114) (not b!267113) (not b!267111) (not b!267112) (not start!25764) (not b!267116))
(check-sat)
