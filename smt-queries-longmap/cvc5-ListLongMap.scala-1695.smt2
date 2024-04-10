; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31058 () Bool)

(assert start!31058)

(declare-fun res!168870 () Bool)

(declare-fun e!194804 () Bool)

(assert (=> start!31058 (=> (not res!168870) (not e!194804))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31058 (= res!168870 (validMask!0 mask!3709))))

(assert (=> start!31058 e!194804))

(declare-datatypes ((array!15960 0))(
  ( (array!15961 (arr!7562 (Array (_ BitVec 32) (_ BitVec 64))) (size!7914 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15960)

(declare-fun array_inv!5525 (array!15960) Bool)

(assert (=> start!31058 (array_inv!5525 a!3293)))

(assert (=> start!31058 true))

(declare-fun b!312407 () Bool)

(declare-fun e!194803 () Bool)

(assert (=> b!312407 (= e!194803 (bvsge mask!3709 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!2702 0))(
  ( (MissingZero!2702 (index!12984 (_ BitVec 32))) (Found!2702 (index!12985 (_ BitVec 32))) (Intermediate!2702 (undefined!3514 Bool) (index!12986 (_ BitVec 32)) (x!31195 (_ BitVec 32))) (Undefined!2702) (MissingVacant!2702 (index!12987 (_ BitVec 32))) )
))
(declare-fun lt!153002 () SeekEntryResult!2702)

(declare-fun lt!153006 () SeekEntryResult!2702)

(assert (=> b!312407 (= lt!153002 lt!153006)))

(declare-fun lt!153005 () (_ BitVec 32))

(declare-datatypes ((Unit!9635 0))(
  ( (Unit!9636) )
))
(declare-fun lt!153008 () Unit!9635)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15960 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9635)

(assert (=> b!312407 (= lt!153008 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153005 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312408 () Bool)

(declare-fun res!168864 () Bool)

(assert (=> b!312408 (=> (not res!168864) (not e!194804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15960 (_ BitVec 32)) Bool)

(assert (=> b!312408 (= res!168864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312409 () Bool)

(declare-fun e!194802 () Bool)

(declare-fun e!194806 () Bool)

(assert (=> b!312409 (= e!194802 e!194806)))

(declare-fun res!168861 () Bool)

(assert (=> b!312409 (=> (not res!168861) (not e!194806))))

(declare-fun lt!153004 () SeekEntryResult!2702)

(declare-fun lt!153007 () SeekEntryResult!2702)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312409 (= res!168861 (and (= lt!153007 lt!153004) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7562 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15960 (_ BitVec 32)) SeekEntryResult!2702)

(assert (=> b!312409 (= lt!153007 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312410 () Bool)

(declare-fun res!168866 () Bool)

(assert (=> b!312410 (=> (not res!168866) (not e!194804))))

(declare-fun arrayContainsKey!0 (array!15960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312410 (= res!168866 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312411 () Bool)

(assert (=> b!312411 (= e!194806 (not e!194803))))

(declare-fun res!168863 () Bool)

(assert (=> b!312411 (=> res!168863 e!194803)))

(assert (=> b!312411 (= res!168863 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153005 #b00000000000000000000000000000000) (bvsge lt!153005 (size!7914 a!3293)) (not (= lt!153006 lt!153004))))))

(declare-fun lt!153009 () SeekEntryResult!2702)

(assert (=> b!312411 (= lt!153009 lt!153002)))

(declare-fun lt!153003 () array!15960)

(assert (=> b!312411 (= lt!153002 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153005 k!2441 lt!153003 mask!3709))))

(assert (=> b!312411 (= lt!153009 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153003 mask!3709))))

(assert (=> b!312411 (= lt!153003 (array!15961 (store (arr!7562 a!3293) i!1240 k!2441) (size!7914 a!3293)))))

(assert (=> b!312411 (= lt!153007 lt!153006)))

(assert (=> b!312411 (= lt!153006 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153005 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312411 (= lt!153005 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312412 () Bool)

(assert (=> b!312412 (= e!194804 e!194802)))

(declare-fun res!168865 () Bool)

(assert (=> b!312412 (=> (not res!168865) (not e!194802))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312412 (= res!168865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153004))))

(assert (=> b!312412 (= lt!153004 (Intermediate!2702 false resIndex!52 resX!52))))

(declare-fun b!312413 () Bool)

(declare-fun res!168868 () Bool)

(assert (=> b!312413 (=> (not res!168868) (not e!194804))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15960 (_ BitVec 32)) SeekEntryResult!2702)

(assert (=> b!312413 (= res!168868 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2702 i!1240)))))

(declare-fun b!312414 () Bool)

(declare-fun res!168862 () Bool)

(assert (=> b!312414 (=> (not res!168862) (not e!194804))))

(assert (=> b!312414 (= res!168862 (and (= (size!7914 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7914 a!3293))))))

(declare-fun b!312415 () Bool)

(declare-fun res!168867 () Bool)

(assert (=> b!312415 (=> (not res!168867) (not e!194802))))

(assert (=> b!312415 (= res!168867 (and (= (select (arr!7562 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7914 a!3293))))))

(declare-fun b!312416 () Bool)

(declare-fun res!168869 () Bool)

(assert (=> b!312416 (=> (not res!168869) (not e!194804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312416 (= res!168869 (validKeyInArray!0 k!2441))))

(assert (= (and start!31058 res!168870) b!312414))

(assert (= (and b!312414 res!168862) b!312416))

(assert (= (and b!312416 res!168869) b!312410))

(assert (= (and b!312410 res!168866) b!312413))

(assert (= (and b!312413 res!168868) b!312408))

(assert (= (and b!312408 res!168864) b!312412))

(assert (= (and b!312412 res!168865) b!312415))

(assert (= (and b!312415 res!168867) b!312409))

(assert (= (and b!312409 res!168861) b!312411))

(assert (= (and b!312411 (not res!168863)) b!312407))

(declare-fun m!322487 () Bool)

(assert (=> b!312410 m!322487))

(declare-fun m!322489 () Bool)

(assert (=> b!312411 m!322489))

(declare-fun m!322491 () Bool)

(assert (=> b!312411 m!322491))

(declare-fun m!322493 () Bool)

(assert (=> b!312411 m!322493))

(declare-fun m!322495 () Bool)

(assert (=> b!312411 m!322495))

(declare-fun m!322497 () Bool)

(assert (=> b!312411 m!322497))

(declare-fun m!322499 () Bool)

(assert (=> b!312409 m!322499))

(declare-fun m!322501 () Bool)

(assert (=> b!312409 m!322501))

(declare-fun m!322503 () Bool)

(assert (=> b!312416 m!322503))

(declare-fun m!322505 () Bool)

(assert (=> start!31058 m!322505))

(declare-fun m!322507 () Bool)

(assert (=> start!31058 m!322507))

(declare-fun m!322509 () Bool)

(assert (=> b!312415 m!322509))

(declare-fun m!322511 () Bool)

(assert (=> b!312408 m!322511))

(declare-fun m!322513 () Bool)

(assert (=> b!312412 m!322513))

(assert (=> b!312412 m!322513))

(declare-fun m!322515 () Bool)

(assert (=> b!312412 m!322515))

(declare-fun m!322517 () Bool)

(assert (=> b!312407 m!322517))

(declare-fun m!322519 () Bool)

(assert (=> b!312413 m!322519))

(push 1)

