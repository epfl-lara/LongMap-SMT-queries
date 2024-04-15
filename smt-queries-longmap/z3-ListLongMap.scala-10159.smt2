; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119714 () Bool)

(assert start!119714)

(declare-fun b!1394521 () Bool)

(declare-fun e!789536 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394521 (= e!789536 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612413 () (_ BitVec 64))

(declare-datatypes ((array!95349 0))(
  ( (array!95350 (arr!46033 (Array (_ BitVec 32) (_ BitVec 64))) (size!46585 (_ BitVec 32))) )
))
(declare-fun lt!612411 () array!95349)

(declare-datatypes ((SeekEntryResult!10376 0))(
  ( (MissingZero!10376 (index!43875 (_ BitVec 32))) (Found!10376 (index!43876 (_ BitVec 32))) (Intermediate!10376 (undefined!11188 Bool) (index!43877 (_ BitVec 32)) (x!125537 (_ BitVec 32))) (Undefined!10376) (MissingVacant!10376 (index!43878 (_ BitVec 32))) )
))
(declare-fun lt!612408 () SeekEntryResult!10376)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95349 (_ BitVec 32)) SeekEntryResult!10376)

(assert (=> b!1394521 (= lt!612408 (seekEntryOrOpen!0 lt!612413 lt!612411 mask!2840))))

(declare-fun lt!612412 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612410 () SeekEntryResult!10376)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!46599 0))(
  ( (Unit!46600) )
))
(declare-fun lt!612407 () Unit!46599)

(declare-fun a!2901 () array!95349)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46599)

(assert (=> b!1394521 (= lt!612407 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612412 (x!125537 lt!612410) (index!43877 lt!612410) mask!2840))))

(declare-fun res!933981 () Bool)

(declare-fun e!789538 () Bool)

(assert (=> start!119714 (=> (not res!933981) (not e!789538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119714 (= res!933981 (validMask!0 mask!2840))))

(assert (=> start!119714 e!789538))

(assert (=> start!119714 true))

(declare-fun array_inv!35266 (array!95349) Bool)

(assert (=> start!119714 (array_inv!35266 a!2901)))

(declare-fun b!1394522 () Bool)

(declare-fun res!933986 () Bool)

(assert (=> b!1394522 (=> (not res!933986) (not e!789538))))

(declare-datatypes ((List!32630 0))(
  ( (Nil!32627) (Cons!32626 (h!33859 (_ BitVec 64)) (t!47316 List!32630)) )
))
(declare-fun arrayNoDuplicates!0 (array!95349 (_ BitVec 32) List!32630) Bool)

(assert (=> b!1394522 (= res!933986 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32627))))

(declare-fun b!1394523 () Bool)

(declare-fun res!933985 () Bool)

(assert (=> b!1394523 (=> (not res!933985) (not e!789538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394523 (= res!933985 (validKeyInArray!0 (select (arr!46033 a!2901) j!112)))))

(declare-fun b!1394524 () Bool)

(declare-fun res!933980 () Bool)

(assert (=> b!1394524 (=> (not res!933980) (not e!789538))))

(assert (=> b!1394524 (= res!933980 (validKeyInArray!0 (select (arr!46033 a!2901) i!1037)))))

(declare-fun b!1394525 () Bool)

(declare-fun res!933982 () Bool)

(assert (=> b!1394525 (=> (not res!933982) (not e!789538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95349 (_ BitVec 32)) Bool)

(assert (=> b!1394525 (= res!933982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394526 () Bool)

(declare-fun e!789537 () Bool)

(assert (=> b!1394526 (= e!789537 e!789536)))

(declare-fun res!933984 () Bool)

(assert (=> b!1394526 (=> res!933984 e!789536)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95349 (_ BitVec 32)) SeekEntryResult!10376)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394526 (= res!933984 (not (= lt!612410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612413 mask!2840) lt!612413 lt!612411 mask!2840))))))

(assert (=> b!1394526 (= lt!612413 (select (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394526 (= lt!612411 (array!95350 (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46585 a!2901)))))

(declare-fun b!1394527 () Bool)

(declare-fun res!933988 () Bool)

(assert (=> b!1394527 (=> res!933988 e!789536)))

(assert (=> b!1394527 (= res!933988 (or (bvslt (x!125537 lt!612410) #b00000000000000000000000000000000) (bvsgt (x!125537 lt!612410) #b01111111111111111111111111111110) (bvslt lt!612412 #b00000000000000000000000000000000) (bvsge lt!612412 (size!46585 a!2901)) (bvslt (index!43877 lt!612410) #b00000000000000000000000000000000) (bvsge (index!43877 lt!612410) (size!46585 a!2901)) (not (= lt!612410 (Intermediate!10376 false (index!43877 lt!612410) (x!125537 lt!612410))))))))

(declare-fun b!1394528 () Bool)

(declare-fun res!933983 () Bool)

(assert (=> b!1394528 (=> (not res!933983) (not e!789538))))

(assert (=> b!1394528 (= res!933983 (and (= (size!46585 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46585 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46585 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394529 () Bool)

(assert (=> b!1394529 (= e!789538 (not e!789537))))

(declare-fun res!933987 () Bool)

(assert (=> b!1394529 (=> res!933987 e!789537)))

(get-info :version)

(assert (=> b!1394529 (= res!933987 (or (not ((_ is Intermediate!10376) lt!612410)) (undefined!11188 lt!612410)))))

(assert (=> b!1394529 (= lt!612408 (Found!10376 j!112))))

(assert (=> b!1394529 (= lt!612408 (seekEntryOrOpen!0 (select (arr!46033 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394529 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612409 () Unit!46599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46599)

(assert (=> b!1394529 (= lt!612409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394529 (= lt!612410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612412 (select (arr!46033 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394529 (= lt!612412 (toIndex!0 (select (arr!46033 a!2901) j!112) mask!2840))))

(assert (= (and start!119714 res!933981) b!1394528))

(assert (= (and b!1394528 res!933983) b!1394524))

(assert (= (and b!1394524 res!933980) b!1394523))

(assert (= (and b!1394523 res!933985) b!1394525))

(assert (= (and b!1394525 res!933982) b!1394522))

(assert (= (and b!1394522 res!933986) b!1394529))

(assert (= (and b!1394529 (not res!933987)) b!1394526))

(assert (= (and b!1394526 (not res!933984)) b!1394527))

(assert (= (and b!1394527 (not res!933988)) b!1394521))

(declare-fun m!1280455 () Bool)

(assert (=> b!1394529 m!1280455))

(declare-fun m!1280457 () Bool)

(assert (=> b!1394529 m!1280457))

(assert (=> b!1394529 m!1280455))

(assert (=> b!1394529 m!1280455))

(declare-fun m!1280459 () Bool)

(assert (=> b!1394529 m!1280459))

(declare-fun m!1280461 () Bool)

(assert (=> b!1394529 m!1280461))

(assert (=> b!1394529 m!1280455))

(declare-fun m!1280463 () Bool)

(assert (=> b!1394529 m!1280463))

(declare-fun m!1280465 () Bool)

(assert (=> b!1394529 m!1280465))

(declare-fun m!1280467 () Bool)

(assert (=> b!1394522 m!1280467))

(assert (=> b!1394523 m!1280455))

(assert (=> b!1394523 m!1280455))

(declare-fun m!1280469 () Bool)

(assert (=> b!1394523 m!1280469))

(declare-fun m!1280471 () Bool)

(assert (=> b!1394526 m!1280471))

(assert (=> b!1394526 m!1280471))

(declare-fun m!1280473 () Bool)

(assert (=> b!1394526 m!1280473))

(declare-fun m!1280475 () Bool)

(assert (=> b!1394526 m!1280475))

(declare-fun m!1280477 () Bool)

(assert (=> b!1394526 m!1280477))

(declare-fun m!1280479 () Bool)

(assert (=> b!1394525 m!1280479))

(declare-fun m!1280481 () Bool)

(assert (=> b!1394521 m!1280481))

(declare-fun m!1280483 () Bool)

(assert (=> b!1394521 m!1280483))

(declare-fun m!1280485 () Bool)

(assert (=> b!1394524 m!1280485))

(assert (=> b!1394524 m!1280485))

(declare-fun m!1280487 () Bool)

(assert (=> b!1394524 m!1280487))

(declare-fun m!1280489 () Bool)

(assert (=> start!119714 m!1280489))

(declare-fun m!1280491 () Bool)

(assert (=> start!119714 m!1280491))

(check-sat (not b!1394524) (not b!1394523) (not start!119714) (not b!1394525) (not b!1394529) (not b!1394526) (not b!1394522) (not b!1394521))
(check-sat)
