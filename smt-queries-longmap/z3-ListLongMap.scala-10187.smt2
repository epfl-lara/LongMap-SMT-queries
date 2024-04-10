; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120050 () Bool)

(assert start!120050)

(declare-fun b!1397635 () Bool)

(declare-fun res!936555 () Bool)

(declare-fun e!791243 () Bool)

(assert (=> b!1397635 (=> (not res!936555) (not e!791243))))

(declare-datatypes ((array!95579 0))(
  ( (array!95580 (arr!46143 (Array (_ BitVec 32) (_ BitVec 64))) (size!46693 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95579)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397635 (= res!936555 (validKeyInArray!0 (select (arr!46143 a!2901) i!1037)))))

(declare-fun res!936552 () Bool)

(assert (=> start!120050 (=> (not res!936552) (not e!791243))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120050 (= res!936552 (validMask!0 mask!2840))))

(assert (=> start!120050 e!791243))

(assert (=> start!120050 true))

(declare-fun array_inv!35171 (array!95579) Bool)

(assert (=> start!120050 (array_inv!35171 a!2901)))

(declare-fun b!1397636 () Bool)

(declare-fun res!936549 () Bool)

(assert (=> b!1397636 (=> (not res!936549) (not e!791243))))

(declare-datatypes ((List!32662 0))(
  ( (Nil!32659) (Cons!32658 (h!33900 (_ BitVec 64)) (t!47356 List!32662)) )
))
(declare-fun arrayNoDuplicates!0 (array!95579 (_ BitVec 32) List!32662) Bool)

(assert (=> b!1397636 (= res!936549 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32659))))

(declare-fun b!1397637 () Bool)

(declare-fun res!936551 () Bool)

(assert (=> b!1397637 (=> (not res!936551) (not e!791243))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397637 (= res!936551 (validKeyInArray!0 (select (arr!46143 a!2901) j!112)))))

(declare-fun b!1397638 () Bool)

(declare-fun res!936553 () Bool)

(assert (=> b!1397638 (=> (not res!936553) (not e!791243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95579 (_ BitVec 32)) Bool)

(assert (=> b!1397638 (= res!936553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397639 () Bool)

(declare-fun e!791241 () Bool)

(assert (=> b!1397639 (= e!791241 true)))

(declare-fun lt!614359 () (_ BitVec 64))

(declare-fun lt!614355 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10460 0))(
  ( (MissingZero!10460 (index!44211 (_ BitVec 32))) (Found!10460 (index!44212 (_ BitVec 32))) (Intermediate!10460 (undefined!11272 Bool) (index!44213 (_ BitVec 32)) (x!125866 (_ BitVec 32))) (Undefined!10460) (MissingVacant!10460 (index!44214 (_ BitVec 32))) )
))
(declare-fun lt!614358 () SeekEntryResult!10460)

(declare-fun lt!614360 () array!95579)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95579 (_ BitVec 32)) SeekEntryResult!10460)

(assert (=> b!1397639 (= lt!614358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614355 lt!614359 lt!614360 mask!2840))))

(declare-fun e!791240 () Bool)

(declare-fun b!1397640 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95579 (_ BitVec 32)) SeekEntryResult!10460)

(assert (=> b!1397640 (= e!791240 (= (seekEntryOrOpen!0 (select (arr!46143 a!2901) j!112) a!2901 mask!2840) (Found!10460 j!112)))))

(declare-fun b!1397641 () Bool)

(declare-fun res!936550 () Bool)

(assert (=> b!1397641 (=> (not res!936550) (not e!791243))))

(assert (=> b!1397641 (= res!936550 (and (= (size!46693 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46693 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46693 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397642 () Bool)

(declare-fun e!791239 () Bool)

(assert (=> b!1397642 (= e!791239 e!791241)))

(declare-fun res!936548 () Bool)

(assert (=> b!1397642 (=> res!936548 e!791241)))

(declare-fun lt!614361 () SeekEntryResult!10460)

(declare-fun lt!614357 () SeekEntryResult!10460)

(get-info :version)

(assert (=> b!1397642 (= res!936548 (or (= lt!614357 lt!614361) (not ((_ is Intermediate!10460) lt!614361)) (bvslt (x!125866 lt!614357) #b00000000000000000000000000000000) (bvsgt (x!125866 lt!614357) #b01111111111111111111111111111110) (bvslt lt!614355 #b00000000000000000000000000000000) (bvsge lt!614355 (size!46693 a!2901)) (bvslt (index!44213 lt!614357) #b00000000000000000000000000000000) (bvsge (index!44213 lt!614357) (size!46693 a!2901)) (not (= lt!614357 (Intermediate!10460 false (index!44213 lt!614357) (x!125866 lt!614357)))) (not (= lt!614361 (Intermediate!10460 (undefined!11272 lt!614361) (index!44213 lt!614361) (x!125866 lt!614361))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397642 (= lt!614361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614359 mask!2840) lt!614359 lt!614360 mask!2840))))

(assert (=> b!1397642 (= lt!614359 (select (store (arr!46143 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397642 (= lt!614360 (array!95580 (store (arr!46143 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46693 a!2901)))))

(declare-fun b!1397643 () Bool)

(assert (=> b!1397643 (= e!791243 (not e!791239))))

(declare-fun res!936556 () Bool)

(assert (=> b!1397643 (=> res!936556 e!791239)))

(assert (=> b!1397643 (= res!936556 (or (not ((_ is Intermediate!10460) lt!614357)) (undefined!11272 lt!614357)))))

(assert (=> b!1397643 e!791240))

(declare-fun res!936554 () Bool)

(assert (=> b!1397643 (=> (not res!936554) (not e!791240))))

(assert (=> b!1397643 (= res!936554 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46924 0))(
  ( (Unit!46925) )
))
(declare-fun lt!614356 () Unit!46924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46924)

(assert (=> b!1397643 (= lt!614356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397643 (= lt!614357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614355 (select (arr!46143 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397643 (= lt!614355 (toIndex!0 (select (arr!46143 a!2901) j!112) mask!2840))))

(assert (= (and start!120050 res!936552) b!1397641))

(assert (= (and b!1397641 res!936550) b!1397635))

(assert (= (and b!1397635 res!936555) b!1397637))

(assert (= (and b!1397637 res!936551) b!1397638))

(assert (= (and b!1397638 res!936553) b!1397636))

(assert (= (and b!1397636 res!936549) b!1397643))

(assert (= (and b!1397643 res!936554) b!1397640))

(assert (= (and b!1397643 (not res!936556)) b!1397642))

(assert (= (and b!1397642 (not res!936548)) b!1397639))

(declare-fun m!1284471 () Bool)

(assert (=> b!1397640 m!1284471))

(assert (=> b!1397640 m!1284471))

(declare-fun m!1284473 () Bool)

(assert (=> b!1397640 m!1284473))

(declare-fun m!1284475 () Bool)

(assert (=> start!120050 m!1284475))

(declare-fun m!1284477 () Bool)

(assert (=> start!120050 m!1284477))

(declare-fun m!1284479 () Bool)

(assert (=> b!1397636 m!1284479))

(declare-fun m!1284481 () Bool)

(assert (=> b!1397639 m!1284481))

(assert (=> b!1397643 m!1284471))

(declare-fun m!1284483 () Bool)

(assert (=> b!1397643 m!1284483))

(assert (=> b!1397643 m!1284471))

(declare-fun m!1284485 () Bool)

(assert (=> b!1397643 m!1284485))

(assert (=> b!1397643 m!1284471))

(declare-fun m!1284487 () Bool)

(assert (=> b!1397643 m!1284487))

(declare-fun m!1284489 () Bool)

(assert (=> b!1397643 m!1284489))

(declare-fun m!1284491 () Bool)

(assert (=> b!1397635 m!1284491))

(assert (=> b!1397635 m!1284491))

(declare-fun m!1284493 () Bool)

(assert (=> b!1397635 m!1284493))

(declare-fun m!1284495 () Bool)

(assert (=> b!1397638 m!1284495))

(declare-fun m!1284497 () Bool)

(assert (=> b!1397642 m!1284497))

(assert (=> b!1397642 m!1284497))

(declare-fun m!1284499 () Bool)

(assert (=> b!1397642 m!1284499))

(declare-fun m!1284501 () Bool)

(assert (=> b!1397642 m!1284501))

(declare-fun m!1284503 () Bool)

(assert (=> b!1397642 m!1284503))

(assert (=> b!1397637 m!1284471))

(assert (=> b!1397637 m!1284471))

(declare-fun m!1284505 () Bool)

(assert (=> b!1397637 m!1284505))

(check-sat (not b!1397637) (not b!1397643) (not b!1397636) (not b!1397635) (not b!1397642) (not start!120050) (not b!1397638) (not b!1397639) (not b!1397640))
(check-sat)
