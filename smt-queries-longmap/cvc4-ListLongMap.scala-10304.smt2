; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121150 () Bool)

(assert start!121150)

(declare-fun res!946370 () Bool)

(declare-fun e!797198 () Bool)

(assert (=> start!121150 (=> (not res!946370) (not e!797198))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121150 (= res!946370 (validMask!0 mask!2840))))

(assert (=> start!121150 e!797198))

(assert (=> start!121150 true))

(declare-datatypes ((array!96304 0))(
  ( (array!96305 (arr!46495 (Array (_ BitVec 32) (_ BitVec 64))) (size!47045 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96304)

(declare-fun array_inv!35523 (array!96304) Bool)

(assert (=> start!121150 (array_inv!35523 a!2901)))

(declare-fun b!1408646 () Bool)

(declare-fun res!946375 () Bool)

(assert (=> b!1408646 (=> (not res!946375) (not e!797198))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408646 (= res!946375 (validKeyInArray!0 (select (arr!46495 a!2901) i!1037)))))

(declare-fun b!1408647 () Bool)

(declare-fun e!797199 () Bool)

(assert (=> b!1408647 (= e!797199 true)))

(declare-datatypes ((SeekEntryResult!10806 0))(
  ( (MissingZero!10806 (index!45601 (_ BitVec 32))) (Found!10806 (index!45602 (_ BitVec 32))) (Intermediate!10806 (undefined!11618 Bool) (index!45603 (_ BitVec 32)) (x!127199 (_ BitVec 32))) (Undefined!10806) (MissingVacant!10806 (index!45604 (_ BitVec 32))) )
))
(declare-fun lt!620427 () SeekEntryResult!10806)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96304 (_ BitVec 32)) SeekEntryResult!10806)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408647 (= lt!620427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46495 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46495 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96305 (store (arr!46495 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47045 a!2901)) mask!2840))))

(declare-fun b!1408648 () Bool)

(declare-fun res!946368 () Bool)

(assert (=> b!1408648 (=> (not res!946368) (not e!797198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96304 (_ BitVec 32)) Bool)

(assert (=> b!1408648 (= res!946368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408649 () Bool)

(declare-fun res!946373 () Bool)

(assert (=> b!1408649 (=> (not res!946373) (not e!797198))))

(declare-datatypes ((List!33014 0))(
  ( (Nil!33011) (Cons!33010 (h!34273 (_ BitVec 64)) (t!47708 List!33014)) )
))
(declare-fun arrayNoDuplicates!0 (array!96304 (_ BitVec 32) List!33014) Bool)

(assert (=> b!1408649 (= res!946373 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33011))))

(declare-fun b!1408650 () Bool)

(declare-fun res!946369 () Bool)

(assert (=> b!1408650 (=> (not res!946369) (not e!797198))))

(assert (=> b!1408650 (= res!946369 (validKeyInArray!0 (select (arr!46495 a!2901) j!112)))))

(declare-fun b!1408651 () Bool)

(assert (=> b!1408651 (= e!797198 (not e!797199))))

(declare-fun res!946374 () Bool)

(assert (=> b!1408651 (=> res!946374 e!797199)))

(declare-fun lt!620425 () SeekEntryResult!10806)

(assert (=> b!1408651 (= res!946374 (or (not (is-Intermediate!10806 lt!620425)) (undefined!11618 lt!620425)))))

(declare-fun e!797200 () Bool)

(assert (=> b!1408651 e!797200))

(declare-fun res!946371 () Bool)

(assert (=> b!1408651 (=> (not res!946371) (not e!797200))))

(assert (=> b!1408651 (= res!946371 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47586 0))(
  ( (Unit!47587) )
))
(declare-fun lt!620426 () Unit!47586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47586)

(assert (=> b!1408651 (= lt!620426 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408651 (= lt!620425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46495 a!2901) j!112) mask!2840) (select (arr!46495 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408652 () Bool)

(declare-fun res!946372 () Bool)

(assert (=> b!1408652 (=> (not res!946372) (not e!797198))))

(assert (=> b!1408652 (= res!946372 (and (= (size!47045 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47045 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47045 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408653 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96304 (_ BitVec 32)) SeekEntryResult!10806)

(assert (=> b!1408653 (= e!797200 (= (seekEntryOrOpen!0 (select (arr!46495 a!2901) j!112) a!2901 mask!2840) (Found!10806 j!112)))))

(assert (= (and start!121150 res!946370) b!1408652))

(assert (= (and b!1408652 res!946372) b!1408646))

(assert (= (and b!1408646 res!946375) b!1408650))

(assert (= (and b!1408650 res!946369) b!1408648))

(assert (= (and b!1408648 res!946368) b!1408649))

(assert (= (and b!1408649 res!946373) b!1408651))

(assert (= (and b!1408651 res!946371) b!1408653))

(assert (= (and b!1408651 (not res!946374)) b!1408647))

(declare-fun m!1298033 () Bool)

(assert (=> b!1408651 m!1298033))

(declare-fun m!1298035 () Bool)

(assert (=> b!1408651 m!1298035))

(assert (=> b!1408651 m!1298033))

(declare-fun m!1298037 () Bool)

(assert (=> b!1408651 m!1298037))

(assert (=> b!1408651 m!1298035))

(assert (=> b!1408651 m!1298033))

(declare-fun m!1298039 () Bool)

(assert (=> b!1408651 m!1298039))

(declare-fun m!1298041 () Bool)

(assert (=> b!1408651 m!1298041))

(assert (=> b!1408650 m!1298033))

(assert (=> b!1408650 m!1298033))

(declare-fun m!1298043 () Bool)

(assert (=> b!1408650 m!1298043))

(declare-fun m!1298045 () Bool)

(assert (=> start!121150 m!1298045))

(declare-fun m!1298047 () Bool)

(assert (=> start!121150 m!1298047))

(declare-fun m!1298049 () Bool)

(assert (=> b!1408648 m!1298049))

(declare-fun m!1298051 () Bool)

(assert (=> b!1408649 m!1298051))

(declare-fun m!1298053 () Bool)

(assert (=> b!1408646 m!1298053))

(assert (=> b!1408646 m!1298053))

(declare-fun m!1298055 () Bool)

(assert (=> b!1408646 m!1298055))

(declare-fun m!1298057 () Bool)

(assert (=> b!1408647 m!1298057))

(declare-fun m!1298059 () Bool)

(assert (=> b!1408647 m!1298059))

(assert (=> b!1408647 m!1298059))

(declare-fun m!1298061 () Bool)

(assert (=> b!1408647 m!1298061))

(assert (=> b!1408647 m!1298061))

(assert (=> b!1408647 m!1298059))

(declare-fun m!1298063 () Bool)

(assert (=> b!1408647 m!1298063))

(assert (=> b!1408653 m!1298033))

(assert (=> b!1408653 m!1298033))

(declare-fun m!1298065 () Bool)

(assert (=> b!1408653 m!1298065))

(push 1)

(assert (not b!1408647))

(assert (not b!1408651))

(assert (not b!1408650))

(assert (not b!1408648))

(assert (not b!1408653))

(assert (not start!121150))

(assert (not b!1408649))

(assert (not b!1408646))

(check-sat)

