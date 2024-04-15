; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119966 () Bool)

(assert start!119966)

(declare-fun b!1396474 () Bool)

(declare-fun res!935445 () Bool)

(declare-fun e!790601 () Bool)

(assert (=> b!1396474 (=> (not res!935445) (not e!790601))))

(declare-datatypes ((array!95448 0))(
  ( (array!95449 (arr!46078 (Array (_ BitVec 32) (_ BitVec 64))) (size!46630 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95448)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396474 (= res!935445 (validKeyInArray!0 (select (arr!46078 a!2901) j!112)))))

(declare-fun b!1396475 () Bool)

(declare-fun res!935442 () Bool)

(assert (=> b!1396475 (=> (not res!935442) (not e!790601))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396475 (= res!935442 (and (= (size!46630 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46630 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46630 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396476 () Bool)

(declare-fun e!790602 () Bool)

(assert (=> b!1396476 (= e!790602 true)))

(declare-fun lt!613331 () array!95448)

(declare-fun lt!613329 () (_ BitVec 32))

(declare-fun lt!613328 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10421 0))(
  ( (MissingZero!10421 (index!44055 (_ BitVec 32))) (Found!10421 (index!44056 (_ BitVec 32))) (Intermediate!10421 (undefined!11233 Bool) (index!44057 (_ BitVec 32)) (x!125720 (_ BitVec 32))) (Undefined!10421) (MissingVacant!10421 (index!44058 (_ BitVec 32))) )
))
(declare-fun lt!613325 () SeekEntryResult!10421)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95448 (_ BitVec 32)) SeekEntryResult!10421)

(assert (=> b!1396476 (= lt!613325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613329 lt!613328 lt!613331 mask!2840))))

(declare-fun e!790600 () Bool)

(declare-fun b!1396477 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95448 (_ BitVec 32)) SeekEntryResult!10421)

(assert (=> b!1396477 (= e!790600 (= (seekEntryOrOpen!0 (select (arr!46078 a!2901) j!112) a!2901 mask!2840) (Found!10421 j!112)))))

(declare-fun b!1396478 () Bool)

(declare-fun e!790603 () Bool)

(assert (=> b!1396478 (= e!790601 (not e!790603))))

(declare-fun res!935444 () Bool)

(assert (=> b!1396478 (=> res!935444 e!790603)))

(declare-fun lt!613330 () SeekEntryResult!10421)

(get-info :version)

(assert (=> b!1396478 (= res!935444 (or (not ((_ is Intermediate!10421) lt!613330)) (undefined!11233 lt!613330)))))

(assert (=> b!1396478 e!790600))

(declare-fun res!935443 () Bool)

(assert (=> b!1396478 (=> (not res!935443) (not e!790600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95448 (_ BitVec 32)) Bool)

(assert (=> b!1396478 (= res!935443 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46689 0))(
  ( (Unit!46690) )
))
(declare-fun lt!613326 () Unit!46689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46689)

(assert (=> b!1396478 (= lt!613326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396478 (= lt!613330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613329 (select (arr!46078 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396478 (= lt!613329 (toIndex!0 (select (arr!46078 a!2901) j!112) mask!2840))))

(declare-fun b!1396479 () Bool)

(declare-fun res!935439 () Bool)

(assert (=> b!1396479 (=> (not res!935439) (not e!790601))))

(assert (=> b!1396479 (= res!935439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396480 () Bool)

(declare-fun res!935438 () Bool)

(assert (=> b!1396480 (=> (not res!935438) (not e!790601))))

(assert (=> b!1396480 (= res!935438 (validKeyInArray!0 (select (arr!46078 a!2901) i!1037)))))

(declare-fun res!935441 () Bool)

(assert (=> start!119966 (=> (not res!935441) (not e!790601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119966 (= res!935441 (validMask!0 mask!2840))))

(assert (=> start!119966 e!790601))

(assert (=> start!119966 true))

(declare-fun array_inv!35311 (array!95448) Bool)

(assert (=> start!119966 (array_inv!35311 a!2901)))

(declare-fun b!1396481 () Bool)

(assert (=> b!1396481 (= e!790603 e!790602)))

(declare-fun res!935440 () Bool)

(assert (=> b!1396481 (=> res!935440 e!790602)))

(declare-fun lt!613327 () SeekEntryResult!10421)

(assert (=> b!1396481 (= res!935440 (or (= lt!613330 lt!613327) (not ((_ is Intermediate!10421) lt!613327)) (bvslt (x!125720 lt!613330) #b00000000000000000000000000000000) (bvsgt (x!125720 lt!613330) #b01111111111111111111111111111110) (bvslt lt!613329 #b00000000000000000000000000000000) (bvsge lt!613329 (size!46630 a!2901)) (bvslt (index!44057 lt!613330) #b00000000000000000000000000000000) (bvsge (index!44057 lt!613330) (size!46630 a!2901)) (not (= lt!613330 (Intermediate!10421 false (index!44057 lt!613330) (x!125720 lt!613330)))) (not (= lt!613327 (Intermediate!10421 (undefined!11233 lt!613327) (index!44057 lt!613327) (x!125720 lt!613327))))))))

(assert (=> b!1396481 (= lt!613327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613328 mask!2840) lt!613328 lt!613331 mask!2840))))

(assert (=> b!1396481 (= lt!613328 (select (store (arr!46078 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396481 (= lt!613331 (array!95449 (store (arr!46078 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46630 a!2901)))))

(declare-fun b!1396482 () Bool)

(declare-fun res!935446 () Bool)

(assert (=> b!1396482 (=> (not res!935446) (not e!790601))))

(declare-datatypes ((List!32675 0))(
  ( (Nil!32672) (Cons!32671 (h!33913 (_ BitVec 64)) (t!47361 List!32675)) )
))
(declare-fun arrayNoDuplicates!0 (array!95448 (_ BitVec 32) List!32675) Bool)

(assert (=> b!1396482 (= res!935446 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32672))))

(assert (= (and start!119966 res!935441) b!1396475))

(assert (= (and b!1396475 res!935442) b!1396480))

(assert (= (and b!1396480 res!935438) b!1396474))

(assert (= (and b!1396474 res!935445) b!1396479))

(assert (= (and b!1396479 res!935439) b!1396482))

(assert (= (and b!1396482 res!935446) b!1396478))

(assert (= (and b!1396478 res!935443) b!1396477))

(assert (= (and b!1396478 (not res!935444)) b!1396481))

(assert (= (and b!1396481 (not res!935440)) b!1396476))

(declare-fun m!1282495 () Bool)

(assert (=> b!1396482 m!1282495))

(declare-fun m!1282497 () Bool)

(assert (=> start!119966 m!1282497))

(declare-fun m!1282499 () Bool)

(assert (=> start!119966 m!1282499))

(declare-fun m!1282501 () Bool)

(assert (=> b!1396477 m!1282501))

(assert (=> b!1396477 m!1282501))

(declare-fun m!1282503 () Bool)

(assert (=> b!1396477 m!1282503))

(declare-fun m!1282505 () Bool)

(assert (=> b!1396481 m!1282505))

(assert (=> b!1396481 m!1282505))

(declare-fun m!1282507 () Bool)

(assert (=> b!1396481 m!1282507))

(declare-fun m!1282509 () Bool)

(assert (=> b!1396481 m!1282509))

(declare-fun m!1282511 () Bool)

(assert (=> b!1396481 m!1282511))

(declare-fun m!1282513 () Bool)

(assert (=> b!1396476 m!1282513))

(assert (=> b!1396474 m!1282501))

(assert (=> b!1396474 m!1282501))

(declare-fun m!1282515 () Bool)

(assert (=> b!1396474 m!1282515))

(declare-fun m!1282517 () Bool)

(assert (=> b!1396479 m!1282517))

(assert (=> b!1396478 m!1282501))

(declare-fun m!1282519 () Bool)

(assert (=> b!1396478 m!1282519))

(assert (=> b!1396478 m!1282501))

(declare-fun m!1282521 () Bool)

(assert (=> b!1396478 m!1282521))

(declare-fun m!1282523 () Bool)

(assert (=> b!1396478 m!1282523))

(assert (=> b!1396478 m!1282501))

(declare-fun m!1282525 () Bool)

(assert (=> b!1396478 m!1282525))

(declare-fun m!1282527 () Bool)

(assert (=> b!1396480 m!1282527))

(assert (=> b!1396480 m!1282527))

(declare-fun m!1282529 () Bool)

(assert (=> b!1396480 m!1282529))

(check-sat (not b!1396481) (not b!1396477) (not b!1396476) (not b!1396474) (not start!119966) (not b!1396479) (not b!1396480) (not b!1396482) (not b!1396478))
(check-sat)
