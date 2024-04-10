; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121180 () Bool)

(assert start!121180)

(declare-fun b!1409006 () Bool)

(declare-fun res!946733 () Bool)

(declare-fun e!797380 () Bool)

(assert (=> b!1409006 (=> (not res!946733) (not e!797380))))

(declare-datatypes ((array!96334 0))(
  ( (array!96335 (arr!46510 (Array (_ BitVec 32) (_ BitVec 64))) (size!47060 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96334)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409006 (= res!946733 (validKeyInArray!0 (select (arr!46510 a!2901) i!1037)))))

(declare-fun res!946731 () Bool)

(assert (=> start!121180 (=> (not res!946731) (not e!797380))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121180 (= res!946731 (validMask!0 mask!2840))))

(assert (=> start!121180 e!797380))

(assert (=> start!121180 true))

(declare-fun array_inv!35538 (array!96334) Bool)

(assert (=> start!121180 (array_inv!35538 a!2901)))

(declare-fun b!1409007 () Bool)

(declare-fun res!946728 () Bool)

(assert (=> b!1409007 (=> (not res!946728) (not e!797380))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409007 (= res!946728 (and (= (size!47060 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47060 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47060 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!797379 () Bool)

(declare-fun b!1409008 () Bool)

(declare-datatypes ((SeekEntryResult!10821 0))(
  ( (MissingZero!10821 (index!45661 (_ BitVec 32))) (Found!10821 (index!45662 (_ BitVec 32))) (Intermediate!10821 (undefined!11633 Bool) (index!45663 (_ BitVec 32)) (x!127254 (_ BitVec 32))) (Undefined!10821) (MissingVacant!10821 (index!45664 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96334 (_ BitVec 32)) SeekEntryResult!10821)

(assert (=> b!1409008 (= e!797379 (= (seekEntryOrOpen!0 (select (arr!46510 a!2901) j!112) a!2901 mask!2840) (Found!10821 j!112)))))

(declare-fun b!1409009 () Bool)

(declare-fun res!946730 () Bool)

(assert (=> b!1409009 (=> (not res!946730) (not e!797380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96334 (_ BitVec 32)) Bool)

(assert (=> b!1409009 (= res!946730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409010 () Bool)

(declare-fun res!946734 () Bool)

(assert (=> b!1409010 (=> (not res!946734) (not e!797380))))

(declare-datatypes ((List!33029 0))(
  ( (Nil!33026) (Cons!33025 (h!34288 (_ BitVec 64)) (t!47723 List!33029)) )
))
(declare-fun arrayNoDuplicates!0 (array!96334 (_ BitVec 32) List!33029) Bool)

(assert (=> b!1409010 (= res!946734 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33026))))

(declare-fun b!1409011 () Bool)

(declare-fun e!797378 () Bool)

(assert (=> b!1409011 (= e!797378 true)))

(declare-fun lt!620560 () SeekEntryResult!10821)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96334 (_ BitVec 32)) SeekEntryResult!10821)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409011 (= lt!620560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96335 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47060 a!2901)) mask!2840))))

(declare-fun b!1409012 () Bool)

(assert (=> b!1409012 (= e!797380 (not e!797378))))

(declare-fun res!946732 () Bool)

(assert (=> b!1409012 (=> res!946732 e!797378)))

(declare-fun lt!620561 () SeekEntryResult!10821)

(assert (=> b!1409012 (= res!946732 (or (not (is-Intermediate!10821 lt!620561)) (undefined!11633 lt!620561)))))

(assert (=> b!1409012 e!797379))

(declare-fun res!946735 () Bool)

(assert (=> b!1409012 (=> (not res!946735) (not e!797379))))

(assert (=> b!1409012 (= res!946735 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47616 0))(
  ( (Unit!47617) )
))
(declare-fun lt!620562 () Unit!47616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47616)

(assert (=> b!1409012 (= lt!620562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409012 (= lt!620561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46510 a!2901) j!112) mask!2840) (select (arr!46510 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409013 () Bool)

(declare-fun res!946729 () Bool)

(assert (=> b!1409013 (=> (not res!946729) (not e!797380))))

(assert (=> b!1409013 (= res!946729 (validKeyInArray!0 (select (arr!46510 a!2901) j!112)))))

(assert (= (and start!121180 res!946731) b!1409007))

(assert (= (and b!1409007 res!946728) b!1409006))

(assert (= (and b!1409006 res!946733) b!1409013))

(assert (= (and b!1409013 res!946729) b!1409009))

(assert (= (and b!1409009 res!946730) b!1409010))

(assert (= (and b!1409010 res!946734) b!1409012))

(assert (= (and b!1409012 res!946735) b!1409008))

(assert (= (and b!1409012 (not res!946732)) b!1409011))

(declare-fun m!1298543 () Bool)

(assert (=> b!1409009 m!1298543))

(declare-fun m!1298545 () Bool)

(assert (=> b!1409008 m!1298545))

(assert (=> b!1409008 m!1298545))

(declare-fun m!1298547 () Bool)

(assert (=> b!1409008 m!1298547))

(declare-fun m!1298549 () Bool)

(assert (=> start!121180 m!1298549))

(declare-fun m!1298551 () Bool)

(assert (=> start!121180 m!1298551))

(declare-fun m!1298553 () Bool)

(assert (=> b!1409011 m!1298553))

(declare-fun m!1298555 () Bool)

(assert (=> b!1409011 m!1298555))

(assert (=> b!1409011 m!1298555))

(declare-fun m!1298557 () Bool)

(assert (=> b!1409011 m!1298557))

(assert (=> b!1409011 m!1298557))

(assert (=> b!1409011 m!1298555))

(declare-fun m!1298559 () Bool)

(assert (=> b!1409011 m!1298559))

(declare-fun m!1298561 () Bool)

(assert (=> b!1409010 m!1298561))

(assert (=> b!1409012 m!1298545))

(declare-fun m!1298563 () Bool)

(assert (=> b!1409012 m!1298563))

(assert (=> b!1409012 m!1298545))

(declare-fun m!1298565 () Bool)

(assert (=> b!1409012 m!1298565))

(assert (=> b!1409012 m!1298563))

(assert (=> b!1409012 m!1298545))

(declare-fun m!1298567 () Bool)

(assert (=> b!1409012 m!1298567))

(declare-fun m!1298569 () Bool)

(assert (=> b!1409012 m!1298569))

(assert (=> b!1409013 m!1298545))

(assert (=> b!1409013 m!1298545))

(declare-fun m!1298571 () Bool)

(assert (=> b!1409013 m!1298571))

(declare-fun m!1298573 () Bool)

(assert (=> b!1409006 m!1298573))

(assert (=> b!1409006 m!1298573))

(declare-fun m!1298575 () Bool)

(assert (=> b!1409006 m!1298575))

(push 1)

(assert (not b!1409006))

(assert (not b!1409010))

(assert (not b!1409009))

(assert (not b!1409011))

(assert (not b!1409012))

(assert (not b!1409008))

(assert (not start!121180))

(assert (not b!1409013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

