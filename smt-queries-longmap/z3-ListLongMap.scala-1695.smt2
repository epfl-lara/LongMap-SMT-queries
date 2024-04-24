; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31044 () Bool)

(assert start!31044)

(declare-fun res!168864 () Bool)

(declare-fun e!194771 () Bool)

(assert (=> start!31044 (=> (not res!168864) (not e!194771))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31044 (= res!168864 (validMask!0 mask!3709))))

(assert (=> start!31044 e!194771))

(declare-datatypes ((array!15959 0))(
  ( (array!15960 (arr!7561 (Array (_ BitVec 32) (_ BitVec 64))) (size!7913 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15959)

(declare-fun array_inv!5511 (array!15959) Bool)

(assert (=> start!31044 (array_inv!5511 a!3293)))

(assert (=> start!31044 true))

(declare-fun b!312354 () Bool)

(declare-fun res!168859 () Bool)

(declare-fun e!194768 () Bool)

(assert (=> b!312354 (=> (not res!168859) (not e!194768))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!312354 (= res!168859 (and (= (select (arr!7561 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7913 a!3293))))))

(declare-fun b!312355 () Bool)

(declare-fun e!194769 () Bool)

(assert (=> b!312355 (= e!194768 e!194769)))

(declare-fun res!168862 () Bool)

(assert (=> b!312355 (=> (not res!168862) (not e!194769))))

(declare-datatypes ((SeekEntryResult!2666 0))(
  ( (MissingZero!2666 (index!12840 (_ BitVec 32))) (Found!2666 (index!12841 (_ BitVec 32))) (Intermediate!2666 (undefined!3478 Bool) (index!12842 (_ BitVec 32)) (x!31156 (_ BitVec 32))) (Undefined!2666) (MissingVacant!2666 (index!12843 (_ BitVec 32))) )
))
(declare-fun lt!153026 () SeekEntryResult!2666)

(declare-fun lt!153020 () SeekEntryResult!2666)

(declare-fun k0!2441 () (_ BitVec 64))

(assert (=> b!312355 (= res!168862 (and (= lt!153026 lt!153020) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7561 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15959 (_ BitVec 32)) SeekEntryResult!2666)

(assert (=> b!312355 (= lt!153026 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312356 () Bool)

(declare-fun res!168858 () Bool)

(assert (=> b!312356 (=> (not res!168858) (not e!194771))))

(assert (=> b!312356 (= res!168858 (and (= (size!7913 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7913 a!3293))))))

(declare-fun b!312357 () Bool)

(declare-fun res!168863 () Bool)

(assert (=> b!312357 (=> (not res!168863) (not e!194771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312357 (= res!168863 (validKeyInArray!0 k0!2441))))

(declare-fun b!312358 () Bool)

(assert (=> b!312358 (= e!194771 e!194768)))

(declare-fun res!168865 () Bool)

(assert (=> b!312358 (=> (not res!168865) (not e!194768))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312358 (= res!168865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153020))))

(assert (=> b!312358 (= lt!153020 (Intermediate!2666 false resIndex!52 resX!52))))

(declare-fun b!312359 () Bool)

(declare-fun res!168861 () Bool)

(assert (=> b!312359 (=> (not res!168861) (not e!194771))))

(declare-fun arrayContainsKey!0 (array!15959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312359 (= res!168861 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312360 () Bool)

(declare-fun e!194772 () Bool)

(assert (=> b!312360 (= e!194772 (bvsge mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!153025 () SeekEntryResult!2666)

(declare-fun lt!153021 () SeekEntryResult!2666)

(assert (=> b!312360 (= lt!153025 lt!153021)))

(declare-fun lt!153027 () (_ BitVec 32))

(declare-datatypes ((Unit!9593 0))(
  ( (Unit!9594) )
))
(declare-fun lt!153023 () Unit!9593)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15959 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9593)

(assert (=> b!312360 (= lt!153023 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153027 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312361 () Bool)

(assert (=> b!312361 (= e!194769 (not e!194772))))

(declare-fun res!168860 () Bool)

(assert (=> b!312361 (=> res!168860 e!194772)))

(assert (=> b!312361 (= res!168860 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153027 #b00000000000000000000000000000000) (bvsge lt!153027 (size!7913 a!3293)) (not (= lt!153021 lt!153020))))))

(declare-fun lt!153022 () SeekEntryResult!2666)

(assert (=> b!312361 (= lt!153022 lt!153025)))

(declare-fun lt!153024 () array!15959)

(assert (=> b!312361 (= lt!153025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153027 k0!2441 lt!153024 mask!3709))))

(assert (=> b!312361 (= lt!153022 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153024 mask!3709))))

(assert (=> b!312361 (= lt!153024 (array!15960 (store (arr!7561 a!3293) i!1240 k0!2441) (size!7913 a!3293)))))

(assert (=> b!312361 (= lt!153026 lt!153021)))

(assert (=> b!312361 (= lt!153021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153027 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312361 (= lt!153027 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!312362 () Bool)

(declare-fun res!168866 () Bool)

(assert (=> b!312362 (=> (not res!168866) (not e!194771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15959 (_ BitVec 32)) Bool)

(assert (=> b!312362 (= res!168866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312363 () Bool)

(declare-fun res!168867 () Bool)

(assert (=> b!312363 (=> (not res!168867) (not e!194771))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15959 (_ BitVec 32)) SeekEntryResult!2666)

(assert (=> b!312363 (= res!168867 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2666 i!1240)))))

(assert (= (and start!31044 res!168864) b!312356))

(assert (= (and b!312356 res!168858) b!312357))

(assert (= (and b!312357 res!168863) b!312359))

(assert (= (and b!312359 res!168861) b!312363))

(assert (= (and b!312363 res!168867) b!312362))

(assert (= (and b!312362 res!168866) b!312358))

(assert (= (and b!312358 res!168865) b!312354))

(assert (= (and b!312354 res!168859) b!312355))

(assert (= (and b!312355 res!168862) b!312361))

(assert (= (and b!312361 (not res!168860)) b!312360))

(declare-fun m!322621 () Bool)

(assert (=> b!312354 m!322621))

(declare-fun m!322623 () Bool)

(assert (=> start!31044 m!322623))

(declare-fun m!322625 () Bool)

(assert (=> start!31044 m!322625))

(declare-fun m!322627 () Bool)

(assert (=> b!312358 m!322627))

(assert (=> b!312358 m!322627))

(declare-fun m!322629 () Bool)

(assert (=> b!312358 m!322629))

(declare-fun m!322631 () Bool)

(assert (=> b!312363 m!322631))

(declare-fun m!322633 () Bool)

(assert (=> b!312362 m!322633))

(declare-fun m!322635 () Bool)

(assert (=> b!312359 m!322635))

(declare-fun m!322637 () Bool)

(assert (=> b!312357 m!322637))

(declare-fun m!322639 () Bool)

(assert (=> b!312355 m!322639))

(declare-fun m!322641 () Bool)

(assert (=> b!312355 m!322641))

(declare-fun m!322643 () Bool)

(assert (=> b!312361 m!322643))

(declare-fun m!322645 () Bool)

(assert (=> b!312361 m!322645))

(declare-fun m!322647 () Bool)

(assert (=> b!312361 m!322647))

(declare-fun m!322649 () Bool)

(assert (=> b!312361 m!322649))

(declare-fun m!322651 () Bool)

(assert (=> b!312361 m!322651))

(declare-fun m!322653 () Bool)

(assert (=> b!312360 m!322653))

(check-sat (not b!312363) (not b!312362) (not b!312358) (not b!312361) (not start!31044) (not b!312357) (not b!312360) (not b!312355) (not b!312359))
(check-sat)
