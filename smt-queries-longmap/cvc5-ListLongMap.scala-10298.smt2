; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121110 () Bool)

(assert start!121110)

(declare-fun b!1408141 () Bool)

(declare-fun res!945868 () Bool)

(declare-fun e!796959 () Bool)

(assert (=> b!1408141 (=> (not res!945868) (not e!796959))))

(declare-datatypes ((array!96264 0))(
  ( (array!96265 (arr!46475 (Array (_ BitVec 32) (_ BitVec 64))) (size!47025 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96264)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96264 (_ BitVec 32)) Bool)

(assert (=> b!1408141 (= res!945868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408142 () Bool)

(declare-fun res!945866 () Bool)

(assert (=> b!1408142 (=> (not res!945866) (not e!796959))))

(declare-datatypes ((List!32994 0))(
  ( (Nil!32991) (Cons!32990 (h!34253 (_ BitVec 64)) (t!47688 List!32994)) )
))
(declare-fun arrayNoDuplicates!0 (array!96264 (_ BitVec 32) List!32994) Bool)

(assert (=> b!1408142 (= res!945866 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32991))))

(declare-fun b!1408143 () Bool)

(declare-fun res!945864 () Bool)

(assert (=> b!1408143 (=> (not res!945864) (not e!796959))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408143 (= res!945864 (validKeyInArray!0 (select (arr!46475 a!2901) j!112)))))

(declare-fun b!1408144 () Bool)

(declare-fun res!945871 () Bool)

(assert (=> b!1408144 (=> (not res!945871) (not e!796959))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408144 (= res!945871 (validKeyInArray!0 (select (arr!46475 a!2901) i!1037)))))

(declare-fun res!945865 () Bool)

(assert (=> start!121110 (=> (not res!945865) (not e!796959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121110 (= res!945865 (validMask!0 mask!2840))))

(assert (=> start!121110 e!796959))

(assert (=> start!121110 true))

(declare-fun array_inv!35503 (array!96264) Bool)

(assert (=> start!121110 (array_inv!35503 a!2901)))

(declare-fun b!1408145 () Bool)

(declare-fun e!796960 () Bool)

(assert (=> b!1408145 (= e!796959 (not e!796960))))

(declare-fun res!945863 () Bool)

(assert (=> b!1408145 (=> res!945863 e!796960)))

(declare-datatypes ((SeekEntryResult!10786 0))(
  ( (MissingZero!10786 (index!45521 (_ BitVec 32))) (Found!10786 (index!45522 (_ BitVec 32))) (Intermediate!10786 (undefined!11598 Bool) (index!45523 (_ BitVec 32)) (x!127131 (_ BitVec 32))) (Undefined!10786) (MissingVacant!10786 (index!45524 (_ BitVec 32))) )
))
(declare-fun lt!620145 () SeekEntryResult!10786)

(assert (=> b!1408145 (= res!945863 (or (not (is-Intermediate!10786 lt!620145)) (undefined!11598 lt!620145)))))

(declare-fun lt!620149 () SeekEntryResult!10786)

(assert (=> b!1408145 (= lt!620149 (Found!10786 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96264 (_ BitVec 32)) SeekEntryResult!10786)

(assert (=> b!1408145 (= lt!620149 (seekEntryOrOpen!0 (select (arr!46475 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408145 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47546 0))(
  ( (Unit!47547) )
))
(declare-fun lt!620148 () Unit!47546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47546)

(assert (=> b!1408145 (= lt!620148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620146 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96264 (_ BitVec 32)) SeekEntryResult!10786)

(assert (=> b!1408145 (= lt!620145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620146 (select (arr!46475 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408145 (= lt!620146 (toIndex!0 (select (arr!46475 a!2901) j!112) mask!2840))))

(declare-fun b!1408146 () Bool)

(declare-fun e!796958 () Bool)

(assert (=> b!1408146 (= e!796960 e!796958)))

(declare-fun res!945869 () Bool)

(assert (=> b!1408146 (=> res!945869 e!796958)))

(declare-fun lt!620151 () array!96264)

(declare-fun lt!620147 () (_ BitVec 64))

(assert (=> b!1408146 (= res!945869 (not (= lt!620145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620147 mask!2840) lt!620147 lt!620151 mask!2840))))))

(assert (=> b!1408146 (= lt!620147 (select (store (arr!46475 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408146 (= lt!620151 (array!96265 (store (arr!46475 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47025 a!2901)))))

(declare-fun b!1408147 () Bool)

(assert (=> b!1408147 (= e!796958 true)))

(assert (=> b!1408147 (= lt!620149 (seekEntryOrOpen!0 lt!620147 lt!620151 mask!2840))))

(declare-fun lt!620150 () Unit!47546)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47546)

(assert (=> b!1408147 (= lt!620150 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620146 (x!127131 lt!620145) (index!45523 lt!620145) mask!2840))))

(declare-fun b!1408148 () Bool)

(declare-fun res!945870 () Bool)

(assert (=> b!1408148 (=> res!945870 e!796958)))

(assert (=> b!1408148 (= res!945870 (or (bvslt (x!127131 lt!620145) #b00000000000000000000000000000000) (bvsgt (x!127131 lt!620145) #b01111111111111111111111111111110) (bvslt lt!620146 #b00000000000000000000000000000000) (bvsge lt!620146 (size!47025 a!2901)) (bvslt (index!45523 lt!620145) #b00000000000000000000000000000000) (bvsge (index!45523 lt!620145) (size!47025 a!2901)) (not (= lt!620145 (Intermediate!10786 false (index!45523 lt!620145) (x!127131 lt!620145))))))))

(declare-fun b!1408149 () Bool)

(declare-fun res!945867 () Bool)

(assert (=> b!1408149 (=> (not res!945867) (not e!796959))))

(assert (=> b!1408149 (= res!945867 (and (= (size!47025 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47025 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47025 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121110 res!945865) b!1408149))

(assert (= (and b!1408149 res!945867) b!1408144))

(assert (= (and b!1408144 res!945871) b!1408143))

(assert (= (and b!1408143 res!945864) b!1408141))

(assert (= (and b!1408141 res!945868) b!1408142))

(assert (= (and b!1408142 res!945866) b!1408145))

(assert (= (and b!1408145 (not res!945863)) b!1408146))

(assert (= (and b!1408146 (not res!945869)) b!1408148))

(assert (= (and b!1408148 (not res!945870)) b!1408147))

(declare-fun m!1297317 () Bool)

(assert (=> start!121110 m!1297317))

(declare-fun m!1297319 () Bool)

(assert (=> start!121110 m!1297319))

(declare-fun m!1297321 () Bool)

(assert (=> b!1408145 m!1297321))

(declare-fun m!1297323 () Bool)

(assert (=> b!1408145 m!1297323))

(assert (=> b!1408145 m!1297321))

(declare-fun m!1297325 () Bool)

(assert (=> b!1408145 m!1297325))

(assert (=> b!1408145 m!1297321))

(declare-fun m!1297327 () Bool)

(assert (=> b!1408145 m!1297327))

(assert (=> b!1408145 m!1297321))

(declare-fun m!1297329 () Bool)

(assert (=> b!1408145 m!1297329))

(declare-fun m!1297331 () Bool)

(assert (=> b!1408145 m!1297331))

(declare-fun m!1297333 () Bool)

(assert (=> b!1408146 m!1297333))

(assert (=> b!1408146 m!1297333))

(declare-fun m!1297335 () Bool)

(assert (=> b!1408146 m!1297335))

(declare-fun m!1297337 () Bool)

(assert (=> b!1408146 m!1297337))

(declare-fun m!1297339 () Bool)

(assert (=> b!1408146 m!1297339))

(declare-fun m!1297341 () Bool)

(assert (=> b!1408144 m!1297341))

(assert (=> b!1408144 m!1297341))

(declare-fun m!1297343 () Bool)

(assert (=> b!1408144 m!1297343))

(declare-fun m!1297345 () Bool)

(assert (=> b!1408147 m!1297345))

(declare-fun m!1297347 () Bool)

(assert (=> b!1408147 m!1297347))

(assert (=> b!1408143 m!1297321))

(assert (=> b!1408143 m!1297321))

(declare-fun m!1297349 () Bool)

(assert (=> b!1408143 m!1297349))

(declare-fun m!1297351 () Bool)

(assert (=> b!1408142 m!1297351))

(declare-fun m!1297353 () Bool)

(assert (=> b!1408141 m!1297353))

(push 1)

(assert (not b!1408141))

(assert (not b!1408147))

(assert (not b!1408142))

(assert (not b!1408144))

(assert (not start!121110))

(assert (not b!1408146))

(assert (not b!1408145))

(assert (not b!1408143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

