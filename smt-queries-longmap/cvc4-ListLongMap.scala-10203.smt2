; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120208 () Bool)

(assert start!120208)

(declare-fun b!1399222 () Bool)

(declare-fun res!937972 () Bool)

(declare-fun e!792142 () Bool)

(assert (=> b!1399222 (=> (not res!937972) (not e!792142))))

(declare-datatypes ((array!95680 0))(
  ( (array!95681 (arr!46192 (Array (_ BitVec 32) (_ BitVec 64))) (size!46742 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95680)

(declare-datatypes ((List!32711 0))(
  ( (Nil!32708) (Cons!32707 (h!33952 (_ BitVec 64)) (t!47405 List!32711)) )
))
(declare-fun arrayNoDuplicates!0 (array!95680 (_ BitVec 32) List!32711) Bool)

(assert (=> b!1399222 (= res!937972 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32708))))

(declare-fun b!1399223 () Bool)

(declare-fun res!937976 () Bool)

(assert (=> b!1399223 (=> (not res!937976) (not e!792142))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399223 (= res!937976 (validKeyInArray!0 (select (arr!46192 a!2901) j!112)))))

(declare-fun b!1399224 () Bool)

(declare-fun e!792146 () Bool)

(assert (=> b!1399224 (= e!792142 (not e!792146))))

(declare-fun res!937977 () Bool)

(assert (=> b!1399224 (=> res!937977 e!792146)))

(declare-datatypes ((SeekEntryResult!10509 0))(
  ( (MissingZero!10509 (index!44410 (_ BitVec 32))) (Found!10509 (index!44411 (_ BitVec 32))) (Intermediate!10509 (undefined!11321 Bool) (index!44412 (_ BitVec 32)) (x!126052 (_ BitVec 32))) (Undefined!10509) (MissingVacant!10509 (index!44413 (_ BitVec 32))) )
))
(declare-fun lt!615406 () SeekEntryResult!10509)

(assert (=> b!1399224 (= res!937977 (or (not (is-Intermediate!10509 lt!615406)) (undefined!11321 lt!615406)))))

(declare-fun e!792145 () Bool)

(assert (=> b!1399224 e!792145))

(declare-fun res!937971 () Bool)

(assert (=> b!1399224 (=> (not res!937971) (not e!792145))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95680 (_ BitVec 32)) Bool)

(assert (=> b!1399224 (= res!937971 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47022 0))(
  ( (Unit!47023) )
))
(declare-fun lt!615408 () Unit!47022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47022)

(assert (=> b!1399224 (= lt!615408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615409 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95680 (_ BitVec 32)) SeekEntryResult!10509)

(assert (=> b!1399224 (= lt!615406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615409 (select (arr!46192 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399224 (= lt!615409 (toIndex!0 (select (arr!46192 a!2901) j!112) mask!2840))))

(declare-fun b!1399225 () Bool)

(declare-fun res!937975 () Bool)

(assert (=> b!1399225 (=> (not res!937975) (not e!792142))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399225 (= res!937975 (and (= (size!46742 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46742 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46742 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399226 () Bool)

(declare-fun res!937978 () Bool)

(assert (=> b!1399226 (=> (not res!937978) (not e!792142))))

(assert (=> b!1399226 (= res!937978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!937973 () Bool)

(assert (=> start!120208 (=> (not res!937973) (not e!792142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120208 (= res!937973 (validMask!0 mask!2840))))

(assert (=> start!120208 e!792142))

(assert (=> start!120208 true))

(declare-fun array_inv!35220 (array!95680) Bool)

(assert (=> start!120208 (array_inv!35220 a!2901)))

(declare-fun b!1399227 () Bool)

(declare-fun res!937974 () Bool)

(assert (=> b!1399227 (=> (not res!937974) (not e!792142))))

(assert (=> b!1399227 (= res!937974 (validKeyInArray!0 (select (arr!46192 a!2901) i!1037)))))

(declare-fun b!1399228 () Bool)

(declare-fun e!792143 () Bool)

(assert (=> b!1399228 (= e!792143 true)))

(declare-fun lt!615411 () SeekEntryResult!10509)

(assert (=> b!1399228 (and (not (undefined!11321 lt!615411)) (= (index!44412 lt!615411) i!1037) (bvslt (x!126052 lt!615411) (x!126052 lt!615406)) (= (select (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44412 lt!615411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615407 () Unit!47022)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47022)

(assert (=> b!1399228 (= lt!615407 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615409 (x!126052 lt!615406) (index!44412 lt!615406) (x!126052 lt!615411) (index!44412 lt!615411) (undefined!11321 lt!615411) mask!2840))))

(declare-fun b!1399229 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95680 (_ BitVec 32)) SeekEntryResult!10509)

(assert (=> b!1399229 (= e!792145 (= (seekEntryOrOpen!0 (select (arr!46192 a!2901) j!112) a!2901 mask!2840) (Found!10509 j!112)))))

(declare-fun b!1399230 () Bool)

(assert (=> b!1399230 (= e!792146 e!792143)))

(declare-fun res!937970 () Bool)

(assert (=> b!1399230 (=> res!937970 e!792143)))

(assert (=> b!1399230 (= res!937970 (or (= lt!615406 lt!615411) (not (is-Intermediate!10509 lt!615411))))))

(declare-fun lt!615410 () (_ BitVec 64))

(assert (=> b!1399230 (= lt!615411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615410 mask!2840) lt!615410 (array!95681 (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46742 a!2901)) mask!2840))))

(assert (=> b!1399230 (= lt!615410 (select (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120208 res!937973) b!1399225))

(assert (= (and b!1399225 res!937975) b!1399227))

(assert (= (and b!1399227 res!937974) b!1399223))

(assert (= (and b!1399223 res!937976) b!1399226))

(assert (= (and b!1399226 res!937978) b!1399222))

(assert (= (and b!1399222 res!937972) b!1399224))

(assert (= (and b!1399224 res!937971) b!1399229))

(assert (= (and b!1399224 (not res!937977)) b!1399230))

(assert (= (and b!1399230 (not res!937970)) b!1399228))

(declare-fun m!1286473 () Bool)

(assert (=> b!1399223 m!1286473))

(assert (=> b!1399223 m!1286473))

(declare-fun m!1286475 () Bool)

(assert (=> b!1399223 m!1286475))

(assert (=> b!1399224 m!1286473))

(declare-fun m!1286477 () Bool)

(assert (=> b!1399224 m!1286477))

(assert (=> b!1399224 m!1286473))

(assert (=> b!1399224 m!1286473))

(declare-fun m!1286479 () Bool)

(assert (=> b!1399224 m!1286479))

(declare-fun m!1286481 () Bool)

(assert (=> b!1399224 m!1286481))

(declare-fun m!1286483 () Bool)

(assert (=> b!1399224 m!1286483))

(declare-fun m!1286485 () Bool)

(assert (=> start!120208 m!1286485))

(declare-fun m!1286487 () Bool)

(assert (=> start!120208 m!1286487))

(declare-fun m!1286489 () Bool)

(assert (=> b!1399222 m!1286489))

(declare-fun m!1286491 () Bool)

(assert (=> b!1399230 m!1286491))

(declare-fun m!1286493 () Bool)

(assert (=> b!1399230 m!1286493))

(assert (=> b!1399230 m!1286491))

(declare-fun m!1286495 () Bool)

(assert (=> b!1399230 m!1286495))

(declare-fun m!1286497 () Bool)

(assert (=> b!1399230 m!1286497))

(assert (=> b!1399228 m!1286493))

(declare-fun m!1286499 () Bool)

(assert (=> b!1399228 m!1286499))

(declare-fun m!1286501 () Bool)

(assert (=> b!1399228 m!1286501))

(declare-fun m!1286503 () Bool)

(assert (=> b!1399226 m!1286503))

(assert (=> b!1399229 m!1286473))

(assert (=> b!1399229 m!1286473))

(declare-fun m!1286505 () Bool)

(assert (=> b!1399229 m!1286505))

(declare-fun m!1286507 () Bool)

(assert (=> b!1399227 m!1286507))

(assert (=> b!1399227 m!1286507))

(declare-fun m!1286509 () Bool)

(assert (=> b!1399227 m!1286509))

(push 1)

