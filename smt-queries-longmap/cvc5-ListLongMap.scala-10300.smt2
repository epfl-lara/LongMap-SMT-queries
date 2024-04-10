; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121122 () Bool)

(assert start!121122)

(declare-fun res!946031 () Bool)

(declare-fun e!797031 () Bool)

(assert (=> start!121122 (=> (not res!946031) (not e!797031))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121122 (= res!946031 (validMask!0 mask!2840))))

(assert (=> start!121122 e!797031))

(assert (=> start!121122 true))

(declare-datatypes ((array!96276 0))(
  ( (array!96277 (arr!46481 (Array (_ BitVec 32) (_ BitVec 64))) (size!47031 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96276)

(declare-fun array_inv!35509 (array!96276) Bool)

(assert (=> start!121122 (array_inv!35509 a!2901)))

(declare-fun b!1408303 () Bool)

(declare-fun res!946033 () Bool)

(assert (=> b!1408303 (=> (not res!946033) (not e!797031))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408303 (= res!946033 (and (= (size!47031 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47031 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47031 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408304 () Bool)

(declare-fun e!797030 () Bool)

(assert (=> b!1408304 (= e!797030 true)))

(declare-fun lt!620273 () array!96276)

(declare-fun lt!620277 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10792 0))(
  ( (MissingZero!10792 (index!45545 (_ BitVec 32))) (Found!10792 (index!45546 (_ BitVec 32))) (Intermediate!10792 (undefined!11604 Bool) (index!45547 (_ BitVec 32)) (x!127153 (_ BitVec 32))) (Undefined!10792) (MissingVacant!10792 (index!45548 (_ BitVec 32))) )
))
(declare-fun lt!620275 () SeekEntryResult!10792)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96276 (_ BitVec 32)) SeekEntryResult!10792)

(assert (=> b!1408304 (= lt!620275 (seekEntryOrOpen!0 lt!620277 lt!620273 mask!2840))))

(declare-datatypes ((Unit!47558 0))(
  ( (Unit!47559) )
))
(declare-fun lt!620276 () Unit!47558)

(declare-fun lt!620274 () (_ BitVec 32))

(declare-fun lt!620271 () SeekEntryResult!10792)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47558)

(assert (=> b!1408304 (= lt!620276 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620274 (x!127153 lt!620271) (index!45547 lt!620271) mask!2840))))

(declare-fun b!1408305 () Bool)

(declare-fun e!797033 () Bool)

(assert (=> b!1408305 (= e!797031 (not e!797033))))

(declare-fun res!946025 () Bool)

(assert (=> b!1408305 (=> res!946025 e!797033)))

(assert (=> b!1408305 (= res!946025 (or (not (is-Intermediate!10792 lt!620271)) (undefined!11604 lt!620271)))))

(assert (=> b!1408305 (= lt!620275 (Found!10792 j!112))))

(assert (=> b!1408305 (= lt!620275 (seekEntryOrOpen!0 (select (arr!46481 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96276 (_ BitVec 32)) Bool)

(assert (=> b!1408305 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620272 () Unit!47558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47558)

(assert (=> b!1408305 (= lt!620272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96276 (_ BitVec 32)) SeekEntryResult!10792)

(assert (=> b!1408305 (= lt!620271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620274 (select (arr!46481 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408305 (= lt!620274 (toIndex!0 (select (arr!46481 a!2901) j!112) mask!2840))))

(declare-fun b!1408306 () Bool)

(declare-fun res!946028 () Bool)

(assert (=> b!1408306 (=> (not res!946028) (not e!797031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408306 (= res!946028 (validKeyInArray!0 (select (arr!46481 a!2901) j!112)))))

(declare-fun b!1408307 () Bool)

(declare-fun res!946026 () Bool)

(assert (=> b!1408307 (=> (not res!946026) (not e!797031))))

(assert (=> b!1408307 (= res!946026 (validKeyInArray!0 (select (arr!46481 a!2901) i!1037)))))

(declare-fun b!1408308 () Bool)

(declare-fun res!946030 () Bool)

(assert (=> b!1408308 (=> (not res!946030) (not e!797031))))

(declare-datatypes ((List!33000 0))(
  ( (Nil!32997) (Cons!32996 (h!34259 (_ BitVec 64)) (t!47694 List!33000)) )
))
(declare-fun arrayNoDuplicates!0 (array!96276 (_ BitVec 32) List!33000) Bool)

(assert (=> b!1408308 (= res!946030 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32997))))

(declare-fun b!1408309 () Bool)

(declare-fun res!946032 () Bool)

(assert (=> b!1408309 (=> res!946032 e!797030)))

(assert (=> b!1408309 (= res!946032 (or (bvslt (x!127153 lt!620271) #b00000000000000000000000000000000) (bvsgt (x!127153 lt!620271) #b01111111111111111111111111111110) (bvslt lt!620274 #b00000000000000000000000000000000) (bvsge lt!620274 (size!47031 a!2901)) (bvslt (index!45547 lt!620271) #b00000000000000000000000000000000) (bvsge (index!45547 lt!620271) (size!47031 a!2901)) (not (= lt!620271 (Intermediate!10792 false (index!45547 lt!620271) (x!127153 lt!620271))))))))

(declare-fun b!1408310 () Bool)

(declare-fun res!946029 () Bool)

(assert (=> b!1408310 (=> (not res!946029) (not e!797031))))

(assert (=> b!1408310 (= res!946029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408311 () Bool)

(assert (=> b!1408311 (= e!797033 e!797030)))

(declare-fun res!946027 () Bool)

(assert (=> b!1408311 (=> res!946027 e!797030)))

(assert (=> b!1408311 (= res!946027 (not (= lt!620271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620277 mask!2840) lt!620277 lt!620273 mask!2840))))))

(assert (=> b!1408311 (= lt!620277 (select (store (arr!46481 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408311 (= lt!620273 (array!96277 (store (arr!46481 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47031 a!2901)))))

(assert (= (and start!121122 res!946031) b!1408303))

(assert (= (and b!1408303 res!946033) b!1408307))

(assert (= (and b!1408307 res!946026) b!1408306))

(assert (= (and b!1408306 res!946028) b!1408310))

(assert (= (and b!1408310 res!946029) b!1408308))

(assert (= (and b!1408308 res!946030) b!1408305))

(assert (= (and b!1408305 (not res!946025)) b!1408311))

(assert (= (and b!1408311 (not res!946027)) b!1408309))

(assert (= (and b!1408309 (not res!946032)) b!1408304))

(declare-fun m!1297545 () Bool)

(assert (=> b!1408307 m!1297545))

(assert (=> b!1408307 m!1297545))

(declare-fun m!1297547 () Bool)

(assert (=> b!1408307 m!1297547))

(declare-fun m!1297549 () Bool)

(assert (=> b!1408311 m!1297549))

(assert (=> b!1408311 m!1297549))

(declare-fun m!1297551 () Bool)

(assert (=> b!1408311 m!1297551))

(declare-fun m!1297553 () Bool)

(assert (=> b!1408311 m!1297553))

(declare-fun m!1297555 () Bool)

(assert (=> b!1408311 m!1297555))

(declare-fun m!1297557 () Bool)

(assert (=> b!1408310 m!1297557))

(declare-fun m!1297559 () Bool)

(assert (=> b!1408305 m!1297559))

(declare-fun m!1297561 () Bool)

(assert (=> b!1408305 m!1297561))

(assert (=> b!1408305 m!1297559))

(assert (=> b!1408305 m!1297559))

(declare-fun m!1297563 () Bool)

(assert (=> b!1408305 m!1297563))

(declare-fun m!1297565 () Bool)

(assert (=> b!1408305 m!1297565))

(assert (=> b!1408305 m!1297559))

(declare-fun m!1297567 () Bool)

(assert (=> b!1408305 m!1297567))

(declare-fun m!1297569 () Bool)

(assert (=> b!1408305 m!1297569))

(declare-fun m!1297571 () Bool)

(assert (=> b!1408308 m!1297571))

(declare-fun m!1297573 () Bool)

(assert (=> b!1408304 m!1297573))

(declare-fun m!1297575 () Bool)

(assert (=> b!1408304 m!1297575))

(assert (=> b!1408306 m!1297559))

(assert (=> b!1408306 m!1297559))

(declare-fun m!1297577 () Bool)

(assert (=> b!1408306 m!1297577))

(declare-fun m!1297579 () Bool)

(assert (=> start!121122 m!1297579))

(declare-fun m!1297581 () Bool)

(assert (=> start!121122 m!1297581))

(push 1)

