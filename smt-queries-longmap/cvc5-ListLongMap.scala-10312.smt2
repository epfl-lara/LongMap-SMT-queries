; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121194 () Bool)

(assert start!121194)

(declare-fun b!1409141 () Bool)

(declare-fun res!946919 () Bool)

(declare-fun e!797450 () Bool)

(assert (=> b!1409141 (=> (not res!946919) (not e!797450))))

(declare-datatypes ((array!96301 0))(
  ( (array!96302 (arr!46494 (Array (_ BitVec 32) (_ BitVec 64))) (size!47046 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96301)

(declare-datatypes ((List!33091 0))(
  ( (Nil!33088) (Cons!33087 (h!34350 (_ BitVec 64)) (t!47777 List!33091)) )
))
(declare-fun arrayNoDuplicates!0 (array!96301 (_ BitVec 32) List!33091) Bool)

(assert (=> b!1409141 (= res!946919 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33088))))

(declare-fun b!1409143 () Bool)

(declare-fun e!797449 () Bool)

(assert (=> b!1409143 (= e!797450 (not e!797449))))

(declare-fun res!946914 () Bool)

(assert (=> b!1409143 (=> res!946914 e!797449)))

(declare-datatypes ((SeekEntryResult!10831 0))(
  ( (MissingZero!10831 (index!45701 (_ BitVec 32))) (Found!10831 (index!45702 (_ BitVec 32))) (Intermediate!10831 (undefined!11643 Bool) (index!45703 (_ BitVec 32)) (x!127285 (_ BitVec 32))) (Undefined!10831) (MissingVacant!10831 (index!45704 (_ BitVec 32))) )
))
(declare-fun lt!620453 () SeekEntryResult!10831)

(assert (=> b!1409143 (= res!946914 (or (not (is-Intermediate!10831 lt!620453)) (undefined!11643 lt!620453)))))

(declare-fun e!797447 () Bool)

(assert (=> b!1409143 e!797447))

(declare-fun res!946920 () Bool)

(assert (=> b!1409143 (=> (not res!946920) (not e!797447))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96301 (_ BitVec 32)) Bool)

(assert (=> b!1409143 (= res!946920 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47479 0))(
  ( (Unit!47480) )
))
(declare-fun lt!620451 () Unit!47479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47479)

(assert (=> b!1409143 (= lt!620451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96301 (_ BitVec 32)) SeekEntryResult!10831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409143 (= lt!620453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46494 a!2901) j!112) mask!2840) (select (arr!46494 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409144 () Bool)

(declare-fun res!946921 () Bool)

(assert (=> b!1409144 (=> (not res!946921) (not e!797450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409144 (= res!946921 (validKeyInArray!0 (select (arr!46494 a!2901) j!112)))))

(declare-fun res!946916 () Bool)

(assert (=> start!121194 (=> (not res!946916) (not e!797450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121194 (= res!946916 (validMask!0 mask!2840))))

(assert (=> start!121194 e!797450))

(assert (=> start!121194 true))

(declare-fun array_inv!35727 (array!96301) Bool)

(assert (=> start!121194 (array_inv!35727 a!2901)))

(declare-fun b!1409142 () Bool)

(assert (=> b!1409142 (= e!797449 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620452 () SeekEntryResult!10831)

(assert (=> b!1409142 (= lt!620452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96302 (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47046 a!2901)) mask!2840))))

(declare-fun b!1409145 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96301 (_ BitVec 32)) SeekEntryResult!10831)

(assert (=> b!1409145 (= e!797447 (= (seekEntryOrOpen!0 (select (arr!46494 a!2901) j!112) a!2901 mask!2840) (Found!10831 j!112)))))

(declare-fun b!1409146 () Bool)

(declare-fun res!946917 () Bool)

(assert (=> b!1409146 (=> (not res!946917) (not e!797450))))

(assert (=> b!1409146 (= res!946917 (and (= (size!47046 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47046 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47046 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409147 () Bool)

(declare-fun res!946915 () Bool)

(assert (=> b!1409147 (=> (not res!946915) (not e!797450))))

(assert (=> b!1409147 (= res!946915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409148 () Bool)

(declare-fun res!946918 () Bool)

(assert (=> b!1409148 (=> (not res!946918) (not e!797450))))

(assert (=> b!1409148 (= res!946918 (validKeyInArray!0 (select (arr!46494 a!2901) i!1037)))))

(assert (= (and start!121194 res!946916) b!1409146))

(assert (= (and b!1409146 res!946917) b!1409148))

(assert (= (and b!1409148 res!946918) b!1409144))

(assert (= (and b!1409144 res!946921) b!1409147))

(assert (= (and b!1409147 res!946915) b!1409141))

(assert (= (and b!1409141 res!946919) b!1409143))

(assert (= (and b!1409143 res!946920) b!1409145))

(assert (= (and b!1409143 (not res!946914)) b!1409142))

(declare-fun m!1298313 () Bool)

(assert (=> b!1409148 m!1298313))

(assert (=> b!1409148 m!1298313))

(declare-fun m!1298315 () Bool)

(assert (=> b!1409148 m!1298315))

(declare-fun m!1298317 () Bool)

(assert (=> b!1409147 m!1298317))

(declare-fun m!1298319 () Bool)

(assert (=> b!1409141 m!1298319))

(declare-fun m!1298321 () Bool)

(assert (=> b!1409143 m!1298321))

(declare-fun m!1298323 () Bool)

(assert (=> b!1409143 m!1298323))

(assert (=> b!1409143 m!1298321))

(declare-fun m!1298325 () Bool)

(assert (=> b!1409143 m!1298325))

(assert (=> b!1409143 m!1298323))

(assert (=> b!1409143 m!1298321))

(declare-fun m!1298327 () Bool)

(assert (=> b!1409143 m!1298327))

(declare-fun m!1298329 () Bool)

(assert (=> b!1409143 m!1298329))

(assert (=> b!1409145 m!1298321))

(assert (=> b!1409145 m!1298321))

(declare-fun m!1298331 () Bool)

(assert (=> b!1409145 m!1298331))

(declare-fun m!1298333 () Bool)

(assert (=> b!1409142 m!1298333))

(declare-fun m!1298335 () Bool)

(assert (=> b!1409142 m!1298335))

(assert (=> b!1409142 m!1298335))

(declare-fun m!1298337 () Bool)

(assert (=> b!1409142 m!1298337))

(assert (=> b!1409142 m!1298337))

(assert (=> b!1409142 m!1298335))

(declare-fun m!1298339 () Bool)

(assert (=> b!1409142 m!1298339))

(assert (=> b!1409144 m!1298321))

(assert (=> b!1409144 m!1298321))

(declare-fun m!1298341 () Bool)

(assert (=> b!1409144 m!1298341))

(declare-fun m!1298343 () Bool)

(assert (=> start!121194 m!1298343))

(declare-fun m!1298345 () Bool)

(assert (=> start!121194 m!1298345))

(push 1)

(assert (not start!121194))

(assert (not b!1409148))

(assert (not b!1409145))

(assert (not b!1409144))

(assert (not b!1409143))

(assert (not b!1409141))

(assert (not b!1409147))

(assert (not b!1409142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

