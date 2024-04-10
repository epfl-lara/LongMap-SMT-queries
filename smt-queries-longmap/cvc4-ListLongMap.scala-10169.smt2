; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119890 () Bool)

(assert start!119890)

(declare-fun b!1395966 () Bool)

(declare-fun res!935048 () Bool)

(declare-fun e!790306 () Bool)

(assert (=> b!1395966 (=> (not res!935048) (not e!790306))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95470 0))(
  ( (array!95471 (arr!46090 (Array (_ BitVec 32) (_ BitVec 64))) (size!46640 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95470)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395966 (= res!935048 (and (= (size!46640 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46640 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46640 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395967 () Bool)

(declare-fun e!790307 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395967 (= e!790307 (validKeyInArray!0 (select (store (arr!46090 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1395968 () Bool)

(declare-fun res!935045 () Bool)

(assert (=> b!1395968 (=> (not res!935045) (not e!790306))))

(declare-datatypes ((List!32609 0))(
  ( (Nil!32606) (Cons!32605 (h!33844 (_ BitVec 64)) (t!47303 List!32609)) )
))
(declare-fun arrayNoDuplicates!0 (array!95470 (_ BitVec 32) List!32609) Bool)

(assert (=> b!1395968 (= res!935045 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32606))))

(declare-fun b!1395969 () Bool)

(declare-fun res!935047 () Bool)

(assert (=> b!1395969 (=> (not res!935047) (not e!790306))))

(assert (=> b!1395969 (= res!935047 (validKeyInArray!0 (select (arr!46090 a!2901) i!1037)))))

(declare-fun b!1395970 () Bool)

(declare-fun e!790303 () Bool)

(assert (=> b!1395970 (= e!790303 e!790307)))

(declare-fun res!935053 () Bool)

(assert (=> b!1395970 (=> res!935053 e!790307)))

(declare-fun lt!613199 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10407 0))(
  ( (MissingZero!10407 (index!43999 (_ BitVec 32))) (Found!10407 (index!44000 (_ BitVec 32))) (Intermediate!10407 (undefined!11219 Bool) (index!44001 (_ BitVec 32)) (x!125663 (_ BitVec 32))) (Undefined!10407) (MissingVacant!10407 (index!44002 (_ BitVec 32))) )
))
(declare-fun lt!613200 () SeekEntryResult!10407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95470 (_ BitVec 32)) SeekEntryResult!10407)

(assert (=> b!1395970 (= res!935053 (= lt!613200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613199 (select (store (arr!46090 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95471 (store (arr!46090 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46640 a!2901)) mask!2840)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395970 (= lt!613199 (toIndex!0 (select (store (arr!46090 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun e!790304 () Bool)

(declare-fun b!1395971 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95470 (_ BitVec 32)) SeekEntryResult!10407)

(assert (=> b!1395971 (= e!790304 (= (seekEntryOrOpen!0 (select (arr!46090 a!2901) j!112) a!2901 mask!2840) (Found!10407 j!112)))))

(declare-fun res!935051 () Bool)

(assert (=> start!119890 (=> (not res!935051) (not e!790306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119890 (= res!935051 (validMask!0 mask!2840))))

(assert (=> start!119890 e!790306))

(assert (=> start!119890 true))

(declare-fun array_inv!35118 (array!95470) Bool)

(assert (=> start!119890 (array_inv!35118 a!2901)))

(declare-fun b!1395972 () Bool)

(assert (=> b!1395972 (= e!790306 (not e!790303))))

(declare-fun res!935046 () Bool)

(assert (=> b!1395972 (=> res!935046 e!790303)))

(assert (=> b!1395972 (= res!935046 (or (not (is-Intermediate!10407 lt!613200)) (undefined!11219 lt!613200)))))

(assert (=> b!1395972 e!790304))

(declare-fun res!935052 () Bool)

(assert (=> b!1395972 (=> (not res!935052) (not e!790304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95470 (_ BitVec 32)) Bool)

(assert (=> b!1395972 (= res!935052 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46818 0))(
  ( (Unit!46819) )
))
(declare-fun lt!613198 () Unit!46818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46818)

(assert (=> b!1395972 (= lt!613198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395972 (= lt!613200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46090 a!2901) j!112) mask!2840) (select (arr!46090 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395973 () Bool)

(declare-fun res!935050 () Bool)

(assert (=> b!1395973 (=> (not res!935050) (not e!790306))))

(assert (=> b!1395973 (= res!935050 (validKeyInArray!0 (select (arr!46090 a!2901) j!112)))))

(declare-fun b!1395974 () Bool)

(declare-fun res!935049 () Bool)

(assert (=> b!1395974 (=> (not res!935049) (not e!790306))))

(assert (=> b!1395974 (= res!935049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395975 () Bool)

(declare-fun res!935044 () Bool)

(assert (=> b!1395975 (=> res!935044 e!790307)))

(assert (=> b!1395975 (= res!935044 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!613199 #b00000000000000000000000000000000) (bvsge lt!613199 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(assert (= (and start!119890 res!935051) b!1395966))

(assert (= (and b!1395966 res!935048) b!1395969))

(assert (= (and b!1395969 res!935047) b!1395973))

(assert (= (and b!1395973 res!935050) b!1395974))

(assert (= (and b!1395974 res!935049) b!1395968))

(assert (= (and b!1395968 res!935045) b!1395972))

(assert (= (and b!1395972 res!935052) b!1395971))

(assert (= (and b!1395972 (not res!935046)) b!1395970))

(assert (= (and b!1395970 (not res!935053)) b!1395975))

(assert (= (and b!1395975 (not res!935044)) b!1395967))

(declare-fun m!1282425 () Bool)

(assert (=> b!1395970 m!1282425))

(declare-fun m!1282427 () Bool)

(assert (=> b!1395970 m!1282427))

(assert (=> b!1395970 m!1282427))

(declare-fun m!1282429 () Bool)

(assert (=> b!1395970 m!1282429))

(assert (=> b!1395970 m!1282427))

(declare-fun m!1282431 () Bool)

(assert (=> b!1395970 m!1282431))

(assert (=> b!1395967 m!1282425))

(assert (=> b!1395967 m!1282427))

(assert (=> b!1395967 m!1282427))

(declare-fun m!1282433 () Bool)

(assert (=> b!1395967 m!1282433))

(declare-fun m!1282435 () Bool)

(assert (=> b!1395968 m!1282435))

(declare-fun m!1282437 () Bool)

(assert (=> b!1395971 m!1282437))

(assert (=> b!1395971 m!1282437))

(declare-fun m!1282439 () Bool)

(assert (=> b!1395971 m!1282439))

(assert (=> b!1395972 m!1282437))

(declare-fun m!1282441 () Bool)

(assert (=> b!1395972 m!1282441))

(assert (=> b!1395972 m!1282437))

(declare-fun m!1282443 () Bool)

(assert (=> b!1395972 m!1282443))

(assert (=> b!1395972 m!1282441))

(assert (=> b!1395972 m!1282437))

(declare-fun m!1282445 () Bool)

(assert (=> b!1395972 m!1282445))

(declare-fun m!1282447 () Bool)

(assert (=> b!1395972 m!1282447))

(assert (=> b!1395973 m!1282437))

(assert (=> b!1395973 m!1282437))

(declare-fun m!1282449 () Bool)

(assert (=> b!1395973 m!1282449))

(declare-fun m!1282451 () Bool)

(assert (=> start!119890 m!1282451))

(declare-fun m!1282453 () Bool)

(assert (=> start!119890 m!1282453))

(declare-fun m!1282455 () Bool)

(assert (=> b!1395974 m!1282455))

(declare-fun m!1282457 () Bool)

(assert (=> b!1395969 m!1282457))

(assert (=> b!1395969 m!1282457))

(declare-fun m!1282459 () Bool)

(assert (=> b!1395969 m!1282459))

(push 1)

(assert (not b!1395970))

(assert (not b!1395968))

(assert (not b!1395974))

(assert (not b!1395971))

(assert (not b!1395973))

