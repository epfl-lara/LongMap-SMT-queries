; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119352 () Bool)

(assert start!119352)

(declare-fun b!1391355 () Bool)

(declare-fun res!931275 () Bool)

(declare-fun e!787900 () Bool)

(assert (=> b!1391355 (=> (not res!931275) (not e!787900))))

(declare-datatypes ((array!95140 0))(
  ( (array!95141 (arr!45933 (Array (_ BitVec 32) (_ BitVec 64))) (size!46485 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95140)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391355 (= res!931275 (validKeyInArray!0 (select (arr!45933 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1391356 () Bool)

(declare-fun e!787901 () Bool)

(declare-datatypes ((SeekEntryResult!10276 0))(
  ( (MissingZero!10276 (index!43475 (_ BitVec 32))) (Found!10276 (index!43476 (_ BitVec 32))) (Intermediate!10276 (undefined!11088 Bool) (index!43477 (_ BitVec 32)) (x!125147 (_ BitVec 32))) (Undefined!10276) (MissingVacant!10276 (index!43478 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95140 (_ BitVec 32)) SeekEntryResult!10276)

(assert (=> b!1391356 (= e!787901 (= (seekEntryOrOpen!0 (select (arr!45933 a!2901) j!112) a!2901 mask!2840) (Found!10276 j!112)))))

(declare-fun b!1391357 () Bool)

(declare-fun res!931277 () Bool)

(assert (=> b!1391357 (=> (not res!931277) (not e!787900))))

(declare-datatypes ((List!32530 0))(
  ( (Nil!32527) (Cons!32526 (h!33750 (_ BitVec 64)) (t!47216 List!32530)) )
))
(declare-fun arrayNoDuplicates!0 (array!95140 (_ BitVec 32) List!32530) Bool)

(assert (=> b!1391357 (= res!931277 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32527))))

(declare-fun b!1391358 () Bool)

(assert (=> b!1391358 (= e!787900 (not true))))

(assert (=> b!1391358 e!787901))

(declare-fun res!931279 () Bool)

(assert (=> b!1391358 (=> (not res!931279) (not e!787901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95140 (_ BitVec 32)) Bool)

(assert (=> b!1391358 (= res!931279 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46399 0))(
  ( (Unit!46400) )
))
(declare-fun lt!611014 () Unit!46399)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46399)

(assert (=> b!1391358 (= lt!611014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611015 () SeekEntryResult!10276)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95140 (_ BitVec 32)) SeekEntryResult!10276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391358 (= lt!611015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45933 a!2901) j!112) mask!2840) (select (arr!45933 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391359 () Bool)

(declare-fun res!931274 () Bool)

(assert (=> b!1391359 (=> (not res!931274) (not e!787900))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391359 (= res!931274 (and (= (size!46485 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46485 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46485 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391361 () Bool)

(declare-fun res!931273 () Bool)

(assert (=> b!1391361 (=> (not res!931273) (not e!787900))))

(assert (=> b!1391361 (= res!931273 (validKeyInArray!0 (select (arr!45933 a!2901) i!1037)))))

(declare-fun b!1391360 () Bool)

(declare-fun res!931276 () Bool)

(assert (=> b!1391360 (=> (not res!931276) (not e!787900))))

(assert (=> b!1391360 (= res!931276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931278 () Bool)

(assert (=> start!119352 (=> (not res!931278) (not e!787900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119352 (= res!931278 (validMask!0 mask!2840))))

(assert (=> start!119352 e!787900))

(assert (=> start!119352 true))

(declare-fun array_inv!35166 (array!95140) Bool)

(assert (=> start!119352 (array_inv!35166 a!2901)))

(assert (= (and start!119352 res!931278) b!1391359))

(assert (= (and b!1391359 res!931274) b!1391361))

(assert (= (and b!1391361 res!931273) b!1391355))

(assert (= (and b!1391355 res!931275) b!1391360))

(assert (= (and b!1391360 res!931276) b!1391357))

(assert (= (and b!1391357 res!931277) b!1391358))

(assert (= (and b!1391358 res!931279) b!1391356))

(declare-fun m!1276679 () Bool)

(assert (=> b!1391358 m!1276679))

(declare-fun m!1276681 () Bool)

(assert (=> b!1391358 m!1276681))

(assert (=> b!1391358 m!1276679))

(declare-fun m!1276683 () Bool)

(assert (=> b!1391358 m!1276683))

(assert (=> b!1391358 m!1276681))

(assert (=> b!1391358 m!1276679))

(declare-fun m!1276685 () Bool)

(assert (=> b!1391358 m!1276685))

(declare-fun m!1276687 () Bool)

(assert (=> b!1391358 m!1276687))

(declare-fun m!1276689 () Bool)

(assert (=> b!1391361 m!1276689))

(assert (=> b!1391361 m!1276689))

(declare-fun m!1276691 () Bool)

(assert (=> b!1391361 m!1276691))

(declare-fun m!1276693 () Bool)

(assert (=> start!119352 m!1276693))

(declare-fun m!1276695 () Bool)

(assert (=> start!119352 m!1276695))

(assert (=> b!1391355 m!1276679))

(assert (=> b!1391355 m!1276679))

(declare-fun m!1276697 () Bool)

(assert (=> b!1391355 m!1276697))

(assert (=> b!1391356 m!1276679))

(assert (=> b!1391356 m!1276679))

(declare-fun m!1276699 () Bool)

(assert (=> b!1391356 m!1276699))

(declare-fun m!1276701 () Bool)

(assert (=> b!1391357 m!1276701))

(declare-fun m!1276703 () Bool)

(assert (=> b!1391360 m!1276703))

(push 1)

(assert (not b!1391361))

(assert (not b!1391357))

(assert (not b!1391358))

(assert (not b!1391356))

(assert (not b!1391360))

(assert (not b!1391355))

(assert (not start!119352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

