; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120048 () Bool)

(assert start!120048)

(declare-fun b!1397608 () Bool)

(declare-fun res!936521 () Bool)

(declare-fun e!791224 () Bool)

(assert (=> b!1397608 (=> (not res!936521) (not e!791224))))

(declare-datatypes ((array!95577 0))(
  ( (array!95578 (arr!46142 (Array (_ BitVec 32) (_ BitVec 64))) (size!46692 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95577)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95577 (_ BitVec 32)) Bool)

(assert (=> b!1397608 (= res!936521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397609 () Bool)

(declare-fun e!791226 () Bool)

(assert (=> b!1397609 (= e!791226 true)))

(declare-fun lt!614338 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10459 0))(
  ( (MissingZero!10459 (index!44207 (_ BitVec 32))) (Found!10459 (index!44208 (_ BitVec 32))) (Intermediate!10459 (undefined!11271 Bool) (index!44209 (_ BitVec 32)) (x!125865 (_ BitVec 32))) (Undefined!10459) (MissingVacant!10459 (index!44210 (_ BitVec 32))) )
))
(declare-fun lt!614339 () SeekEntryResult!10459)

(declare-fun lt!614340 () (_ BitVec 32))

(declare-fun lt!614334 () array!95577)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95577 (_ BitVec 32)) SeekEntryResult!10459)

(assert (=> b!1397609 (= lt!614339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614340 lt!614338 lt!614334 mask!2840))))

(declare-fun b!1397610 () Bool)

(declare-fun res!936528 () Bool)

(assert (=> b!1397610 (=> (not res!936528) (not e!791224))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397610 (= res!936528 (validKeyInArray!0 (select (arr!46142 a!2901) i!1037)))))

(declare-fun b!1397611 () Bool)

(declare-fun res!936523 () Bool)

(assert (=> b!1397611 (=> (not res!936523) (not e!791224))))

(declare-datatypes ((List!32661 0))(
  ( (Nil!32658) (Cons!32657 (h!33899 (_ BitVec 64)) (t!47355 List!32661)) )
))
(declare-fun arrayNoDuplicates!0 (array!95577 (_ BitVec 32) List!32661) Bool)

(assert (=> b!1397611 (= res!936523 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32658))))

(declare-fun res!936529 () Bool)

(assert (=> start!120048 (=> (not res!936529) (not e!791224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120048 (= res!936529 (validMask!0 mask!2840))))

(assert (=> start!120048 e!791224))

(assert (=> start!120048 true))

(declare-fun array_inv!35170 (array!95577) Bool)

(assert (=> start!120048 (array_inv!35170 a!2901)))

(declare-fun b!1397612 () Bool)

(declare-fun res!936527 () Bool)

(assert (=> b!1397612 (=> (not res!936527) (not e!791224))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397612 (= res!936527 (and (= (size!46692 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46692 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46692 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397613 () Bool)

(declare-fun e!791225 () Bool)

(assert (=> b!1397613 (= e!791224 (not e!791225))))

(declare-fun res!936526 () Bool)

(assert (=> b!1397613 (=> res!936526 e!791225)))

(declare-fun lt!614337 () SeekEntryResult!10459)

(assert (=> b!1397613 (= res!936526 (or (not (is-Intermediate!10459 lt!614337)) (undefined!11271 lt!614337)))))

(declare-fun e!791228 () Bool)

(assert (=> b!1397613 e!791228))

(declare-fun res!936522 () Bool)

(assert (=> b!1397613 (=> (not res!936522) (not e!791228))))

(assert (=> b!1397613 (= res!936522 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46922 0))(
  ( (Unit!46923) )
))
(declare-fun lt!614335 () Unit!46922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46922)

(assert (=> b!1397613 (= lt!614335 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397613 (= lt!614337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614340 (select (arr!46142 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397613 (= lt!614340 (toIndex!0 (select (arr!46142 a!2901) j!112) mask!2840))))

(declare-fun b!1397614 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95577 (_ BitVec 32)) SeekEntryResult!10459)

(assert (=> b!1397614 (= e!791228 (= (seekEntryOrOpen!0 (select (arr!46142 a!2901) j!112) a!2901 mask!2840) (Found!10459 j!112)))))

(declare-fun b!1397615 () Bool)

(assert (=> b!1397615 (= e!791225 e!791226)))

(declare-fun res!936525 () Bool)

(assert (=> b!1397615 (=> res!936525 e!791226)))

(declare-fun lt!614336 () SeekEntryResult!10459)

(assert (=> b!1397615 (= res!936525 (or (= lt!614337 lt!614336) (not (is-Intermediate!10459 lt!614336)) (bvslt (x!125865 lt!614337) #b00000000000000000000000000000000) (bvsgt (x!125865 lt!614337) #b01111111111111111111111111111110) (bvslt lt!614340 #b00000000000000000000000000000000) (bvsge lt!614340 (size!46692 a!2901)) (bvslt (index!44209 lt!614337) #b00000000000000000000000000000000) (bvsge (index!44209 lt!614337) (size!46692 a!2901)) (not (= lt!614337 (Intermediate!10459 false (index!44209 lt!614337) (x!125865 lt!614337)))) (not (= lt!614336 (Intermediate!10459 (undefined!11271 lt!614336) (index!44209 lt!614336) (x!125865 lt!614336))))))))

(assert (=> b!1397615 (= lt!614336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614338 mask!2840) lt!614338 lt!614334 mask!2840))))

(assert (=> b!1397615 (= lt!614338 (select (store (arr!46142 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397615 (= lt!614334 (array!95578 (store (arr!46142 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46692 a!2901)))))

(declare-fun b!1397616 () Bool)

(declare-fun res!936524 () Bool)

(assert (=> b!1397616 (=> (not res!936524) (not e!791224))))

(assert (=> b!1397616 (= res!936524 (validKeyInArray!0 (select (arr!46142 a!2901) j!112)))))

(assert (= (and start!120048 res!936529) b!1397612))

(assert (= (and b!1397612 res!936527) b!1397610))

(assert (= (and b!1397610 res!936528) b!1397616))

(assert (= (and b!1397616 res!936524) b!1397608))

(assert (= (and b!1397608 res!936521) b!1397611))

(assert (= (and b!1397611 res!936523) b!1397613))

(assert (= (and b!1397613 res!936522) b!1397614))

(assert (= (and b!1397613 (not res!936526)) b!1397615))

(assert (= (and b!1397615 (not res!936525)) b!1397609))

(declare-fun m!1284435 () Bool)

(assert (=> b!1397609 m!1284435))

(declare-fun m!1284437 () Bool)

(assert (=> b!1397610 m!1284437))

(assert (=> b!1397610 m!1284437))

(declare-fun m!1284439 () Bool)

(assert (=> b!1397610 m!1284439))

(declare-fun m!1284441 () Bool)

(assert (=> b!1397611 m!1284441))

(declare-fun m!1284443 () Bool)

(assert (=> b!1397608 m!1284443))

(declare-fun m!1284445 () Bool)

(assert (=> b!1397613 m!1284445))

(declare-fun m!1284447 () Bool)

(assert (=> b!1397613 m!1284447))

(assert (=> b!1397613 m!1284445))

(assert (=> b!1397613 m!1284445))

(declare-fun m!1284449 () Bool)

(assert (=> b!1397613 m!1284449))

(declare-fun m!1284451 () Bool)

(assert (=> b!1397613 m!1284451))

(declare-fun m!1284453 () Bool)

(assert (=> b!1397613 m!1284453))

(declare-fun m!1284455 () Bool)

(assert (=> b!1397615 m!1284455))

(assert (=> b!1397615 m!1284455))

(declare-fun m!1284457 () Bool)

(assert (=> b!1397615 m!1284457))

(declare-fun m!1284459 () Bool)

(assert (=> b!1397615 m!1284459))

(declare-fun m!1284461 () Bool)

(assert (=> b!1397615 m!1284461))

(assert (=> b!1397616 m!1284445))

(assert (=> b!1397616 m!1284445))

(declare-fun m!1284463 () Bool)

(assert (=> b!1397616 m!1284463))

(declare-fun m!1284465 () Bool)

(assert (=> start!120048 m!1284465))

(declare-fun m!1284467 () Bool)

(assert (=> start!120048 m!1284467))

(assert (=> b!1397614 m!1284445))

(assert (=> b!1397614 m!1284445))

(declare-fun m!1284469 () Bool)

(assert (=> b!1397614 m!1284469))

(push 1)

