; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120810 () Bool)

(assert start!120810)

(declare-fun b!1405525 () Bool)

(declare-fun res!943354 () Bool)

(declare-fun e!795761 () Bool)

(assert (=> b!1405525 (=> (not res!943354) (not e!795761))))

(declare-datatypes ((array!96141 0))(
  ( (array!96142 (arr!46419 (Array (_ BitVec 32) (_ BitVec 64))) (size!46970 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96141)

(declare-datatypes ((List!32925 0))(
  ( (Nil!32922) (Cons!32921 (h!34177 (_ BitVec 64)) (t!47611 List!32925)) )
))
(declare-fun arrayNoDuplicates!0 (array!96141 (_ BitVec 32) List!32925) Bool)

(assert (=> b!1405525 (= res!943354 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32922))))

(declare-fun b!1405526 () Bool)

(declare-fun res!943356 () Bool)

(assert (=> b!1405526 (=> (not res!943356) (not e!795761))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96141 (_ BitVec 32)) Bool)

(assert (=> b!1405526 (= res!943356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405527 () Bool)

(declare-fun res!943357 () Bool)

(assert (=> b!1405527 (=> (not res!943357) (not e!795761))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405527 (= res!943357 (validKeyInArray!0 (select (arr!46419 a!2901) i!1037)))))

(declare-fun res!943353 () Bool)

(assert (=> start!120810 (=> (not res!943353) (not e!795761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120810 (= res!943353 (validMask!0 mask!2840))))

(assert (=> start!120810 e!795761))

(assert (=> start!120810 true))

(declare-fun array_inv!35700 (array!96141) Bool)

(assert (=> start!120810 (array_inv!35700 a!2901)))

(declare-fun b!1405528 () Bool)

(declare-fun res!943355 () Bool)

(assert (=> b!1405528 (=> (not res!943355) (not e!795761))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405528 (= res!943355 (and (= (size!46970 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46970 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46970 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405529 () Bool)

(declare-fun res!943352 () Bool)

(assert (=> b!1405529 (=> (not res!943352) (not e!795761))))

(assert (=> b!1405529 (= res!943352 (validKeyInArray!0 (select (arr!46419 a!2901) j!112)))))

(declare-fun b!1405530 () Bool)

(assert (=> b!1405530 (= e!795761 false)))

(declare-datatypes ((SeekEntryResult!10633 0))(
  ( (MissingZero!10633 (index!44909 (_ BitVec 32))) (Found!10633 (index!44910 (_ BitVec 32))) (Intermediate!10633 (undefined!11445 Bool) (index!44911 (_ BitVec 32)) (x!126671 (_ BitVec 32))) (Undefined!10633) (MissingVacant!10633 (index!44912 (_ BitVec 32))) )
))
(declare-fun lt!619034 () SeekEntryResult!10633)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96141 (_ BitVec 32)) SeekEntryResult!10633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405530 (= lt!619034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46419 a!2901) j!112) mask!2840) (select (arr!46419 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120810 res!943353) b!1405528))

(assert (= (and b!1405528 res!943355) b!1405527))

(assert (= (and b!1405527 res!943357) b!1405529))

(assert (= (and b!1405529 res!943352) b!1405526))

(assert (= (and b!1405526 res!943356) b!1405525))

(assert (= (and b!1405525 res!943354) b!1405530))

(declare-fun m!1294589 () Bool)

(assert (=> b!1405527 m!1294589))

(assert (=> b!1405527 m!1294589))

(declare-fun m!1294591 () Bool)

(assert (=> b!1405527 m!1294591))

(declare-fun m!1294593 () Bool)

(assert (=> start!120810 m!1294593))

(declare-fun m!1294595 () Bool)

(assert (=> start!120810 m!1294595))

(declare-fun m!1294597 () Bool)

(assert (=> b!1405529 m!1294597))

(assert (=> b!1405529 m!1294597))

(declare-fun m!1294599 () Bool)

(assert (=> b!1405529 m!1294599))

(declare-fun m!1294601 () Bool)

(assert (=> b!1405525 m!1294601))

(declare-fun m!1294603 () Bool)

(assert (=> b!1405526 m!1294603))

(assert (=> b!1405530 m!1294597))

(assert (=> b!1405530 m!1294597))

(declare-fun m!1294605 () Bool)

(assert (=> b!1405530 m!1294605))

(assert (=> b!1405530 m!1294605))

(assert (=> b!1405530 m!1294597))

(declare-fun m!1294607 () Bool)

(assert (=> b!1405530 m!1294607))

(push 1)

(assert (not b!1405530))

(assert (not b!1405529))

(assert (not start!120810))

(assert (not b!1405527))

(assert (not b!1405525))

(assert (not b!1405526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

