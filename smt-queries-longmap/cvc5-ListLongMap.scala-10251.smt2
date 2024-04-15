; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120558 () Bool)

(assert start!120558)

(declare-fun b!1403745 () Bool)

(declare-fun res!942312 () Bool)

(declare-fun e!794777 () Bool)

(assert (=> b!1403745 (=> (not res!942312) (not e!794777))))

(declare-datatypes ((array!95920 0))(
  ( (array!95921 (arr!46311 (Array (_ BitVec 32) (_ BitVec 64))) (size!46863 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95920)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403745 (= res!942312 (validKeyInArray!0 (select (arr!46311 a!2901) j!112)))))

(declare-fun b!1403746 () Bool)

(declare-fun res!942308 () Bool)

(assert (=> b!1403746 (=> (not res!942308) (not e!794777))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403746 (= res!942308 (and (= (size!46863 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46863 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46863 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403747 () Bool)

(declare-fun res!942311 () Bool)

(assert (=> b!1403747 (=> (not res!942311) (not e!794777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95920 (_ BitVec 32)) Bool)

(assert (=> b!1403747 (= res!942311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942313 () Bool)

(assert (=> start!120558 (=> (not res!942313) (not e!794777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120558 (= res!942313 (validMask!0 mask!2840))))

(assert (=> start!120558 e!794777))

(assert (=> start!120558 true))

(declare-fun array_inv!35544 (array!95920) Bool)

(assert (=> start!120558 (array_inv!35544 a!2901)))

(declare-fun b!1403748 () Bool)

(assert (=> b!1403748 (= e!794777 (not true))))

(declare-fun e!794775 () Bool)

(assert (=> b!1403748 e!794775))

(declare-fun res!942309 () Bool)

(assert (=> b!1403748 (=> (not res!942309) (not e!794775))))

(assert (=> b!1403748 (= res!942309 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47155 0))(
  ( (Unit!47156) )
))
(declare-fun lt!618329 () Unit!47155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47155)

(assert (=> b!1403748 (= lt!618329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10654 0))(
  ( (MissingZero!10654 (index!44993 (_ BitVec 32))) (Found!10654 (index!44994 (_ BitVec 32))) (Intermediate!10654 (undefined!11466 Bool) (index!44995 (_ BitVec 32)) (x!126590 (_ BitVec 32))) (Undefined!10654) (MissingVacant!10654 (index!44996 (_ BitVec 32))) )
))
(declare-fun lt!618328 () SeekEntryResult!10654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95920 (_ BitVec 32)) SeekEntryResult!10654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403748 (= lt!618328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46311 a!2901) j!112) mask!2840) (select (arr!46311 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403749 () Bool)

(declare-fun res!942307 () Bool)

(assert (=> b!1403749 (=> (not res!942307) (not e!794777))))

(assert (=> b!1403749 (= res!942307 (validKeyInArray!0 (select (arr!46311 a!2901) i!1037)))))

(declare-fun b!1403750 () Bool)

(declare-fun res!942310 () Bool)

(assert (=> b!1403750 (=> (not res!942310) (not e!794777))))

(declare-datatypes ((List!32908 0))(
  ( (Nil!32905) (Cons!32904 (h!34152 (_ BitVec 64)) (t!47594 List!32908)) )
))
(declare-fun arrayNoDuplicates!0 (array!95920 (_ BitVec 32) List!32908) Bool)

(assert (=> b!1403750 (= res!942310 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32905))))

(declare-fun b!1403751 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95920 (_ BitVec 32)) SeekEntryResult!10654)

(assert (=> b!1403751 (= e!794775 (= (seekEntryOrOpen!0 (select (arr!46311 a!2901) j!112) a!2901 mask!2840) (Found!10654 j!112)))))

(assert (= (and start!120558 res!942313) b!1403746))

(assert (= (and b!1403746 res!942308) b!1403749))

(assert (= (and b!1403749 res!942307) b!1403745))

(assert (= (and b!1403745 res!942312) b!1403747))

(assert (= (and b!1403747 res!942311) b!1403750))

(assert (= (and b!1403750 res!942310) b!1403748))

(assert (= (and b!1403748 res!942309) b!1403751))

(declare-fun m!1292039 () Bool)

(assert (=> b!1403749 m!1292039))

(assert (=> b!1403749 m!1292039))

(declare-fun m!1292041 () Bool)

(assert (=> b!1403749 m!1292041))

(declare-fun m!1292043 () Bool)

(assert (=> b!1403750 m!1292043))

(declare-fun m!1292045 () Bool)

(assert (=> b!1403748 m!1292045))

(declare-fun m!1292047 () Bool)

(assert (=> b!1403748 m!1292047))

(assert (=> b!1403748 m!1292045))

(declare-fun m!1292049 () Bool)

(assert (=> b!1403748 m!1292049))

(assert (=> b!1403748 m!1292047))

(assert (=> b!1403748 m!1292045))

(declare-fun m!1292051 () Bool)

(assert (=> b!1403748 m!1292051))

(declare-fun m!1292053 () Bool)

(assert (=> b!1403748 m!1292053))

(declare-fun m!1292055 () Bool)

(assert (=> start!120558 m!1292055))

(declare-fun m!1292057 () Bool)

(assert (=> start!120558 m!1292057))

(assert (=> b!1403751 m!1292045))

(assert (=> b!1403751 m!1292045))

(declare-fun m!1292059 () Bool)

(assert (=> b!1403751 m!1292059))

(assert (=> b!1403745 m!1292045))

(assert (=> b!1403745 m!1292045))

(declare-fun m!1292061 () Bool)

(assert (=> b!1403745 m!1292061))

(declare-fun m!1292063 () Bool)

(assert (=> b!1403747 m!1292063))

(push 1)

(assert (not b!1403751))

(assert (not b!1403750))

(assert (not start!120558))

(assert (not b!1403747))

(assert (not b!1403748))

(assert (not b!1403749))

(assert (not b!1403745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

