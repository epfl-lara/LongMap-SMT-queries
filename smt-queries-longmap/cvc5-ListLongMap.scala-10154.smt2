; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119688 () Bool)

(assert start!119688)

(declare-fun b!1394197 () Bool)

(declare-fun res!933613 () Bool)

(declare-fun e!789397 () Bool)

(assert (=> b!1394197 (=> (not res!933613) (not e!789397))))

(declare-datatypes ((array!95370 0))(
  ( (array!95371 (arr!46043 (Array (_ BitVec 32) (_ BitVec 64))) (size!46593 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95370)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95370 (_ BitVec 32)) Bool)

(assert (=> b!1394197 (= res!933613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394199 () Bool)

(declare-fun res!933612 () Bool)

(assert (=> b!1394199 (=> (not res!933612) (not e!789397))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394199 (= res!933612 (validKeyInArray!0 (select (arr!46043 a!2901) i!1037)))))

(declare-fun b!1394200 () Bool)

(declare-fun e!789398 () Bool)

(declare-fun e!789396 () Bool)

(assert (=> b!1394200 (= e!789398 e!789396)))

(declare-fun res!933606 () Bool)

(assert (=> b!1394200 (=> res!933606 e!789396)))

(declare-fun lt!612283 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10360 0))(
  ( (MissingZero!10360 (index!43811 (_ BitVec 32))) (Found!10360 (index!43812 (_ BitVec 32))) (Intermediate!10360 (undefined!11172 Bool) (index!43813 (_ BitVec 32)) (x!125484 (_ BitVec 32))) (Undefined!10360) (MissingVacant!10360 (index!43814 (_ BitVec 32))) )
))
(declare-fun lt!612288 () SeekEntryResult!10360)

(declare-fun lt!612287 () array!95370)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95370 (_ BitVec 32)) SeekEntryResult!10360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394200 (= res!933606 (not (= lt!612288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612283 mask!2840) lt!612283 lt!612287 mask!2840))))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394200 (= lt!612283 (select (store (arr!46043 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394200 (= lt!612287 (array!95371 (store (arr!46043 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46593 a!2901)))))

(declare-fun b!1394201 () Bool)

(assert (=> b!1394201 (= e!789397 (not e!789398))))

(declare-fun res!933611 () Bool)

(assert (=> b!1394201 (=> res!933611 e!789398)))

(assert (=> b!1394201 (= res!933611 (or (not (is-Intermediate!10360 lt!612288)) (undefined!11172 lt!612288)))))

(declare-fun lt!612282 () SeekEntryResult!10360)

(assert (=> b!1394201 (= lt!612282 (Found!10360 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95370 (_ BitVec 32)) SeekEntryResult!10360)

(assert (=> b!1394201 (= lt!612282 (seekEntryOrOpen!0 (select (arr!46043 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394201 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46724 0))(
  ( (Unit!46725) )
))
(declare-fun lt!612284 () Unit!46724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46724)

(assert (=> b!1394201 (= lt!612284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!612285 () (_ BitVec 32))

(assert (=> b!1394201 (= lt!612288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612285 (select (arr!46043 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394201 (= lt!612285 (toIndex!0 (select (arr!46043 a!2901) j!112) mask!2840))))

(declare-fun b!1394202 () Bool)

(declare-fun res!933608 () Bool)

(assert (=> b!1394202 (=> (not res!933608) (not e!789397))))

(assert (=> b!1394202 (= res!933608 (and (= (size!46593 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46593 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46593 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394203 () Bool)

(declare-fun res!933609 () Bool)

(assert (=> b!1394203 (=> res!933609 e!789396)))

(assert (=> b!1394203 (= res!933609 (or (bvslt (x!125484 lt!612288) #b00000000000000000000000000000000) (bvsgt (x!125484 lt!612288) #b01111111111111111111111111111110) (bvslt lt!612285 #b00000000000000000000000000000000) (bvsge lt!612285 (size!46593 a!2901)) (bvslt (index!43813 lt!612288) #b00000000000000000000000000000000) (bvsge (index!43813 lt!612288) (size!46593 a!2901)) (not (= lt!612288 (Intermediate!10360 false (index!43813 lt!612288) (x!125484 lt!612288))))))))

(declare-fun b!1394204 () Bool)

(declare-fun res!933605 () Bool)

(assert (=> b!1394204 (=> (not res!933605) (not e!789397))))

(declare-datatypes ((List!32562 0))(
  ( (Nil!32559) (Cons!32558 (h!33791 (_ BitVec 64)) (t!47256 List!32562)) )
))
(declare-fun arrayNoDuplicates!0 (array!95370 (_ BitVec 32) List!32562) Bool)

(assert (=> b!1394204 (= res!933605 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32559))))

(declare-fun b!1394205 () Bool)

(assert (=> b!1394205 (= e!789396 true)))

(assert (=> b!1394205 (= lt!612282 (seekEntryOrOpen!0 lt!612283 lt!612287 mask!2840))))

(declare-fun lt!612286 () Unit!46724)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46724)

(assert (=> b!1394205 (= lt!612286 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612285 (x!125484 lt!612288) (index!43813 lt!612288) mask!2840))))

(declare-fun b!1394198 () Bool)

(declare-fun res!933607 () Bool)

(assert (=> b!1394198 (=> (not res!933607) (not e!789397))))

(assert (=> b!1394198 (= res!933607 (validKeyInArray!0 (select (arr!46043 a!2901) j!112)))))

(declare-fun res!933610 () Bool)

(assert (=> start!119688 (=> (not res!933610) (not e!789397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119688 (= res!933610 (validMask!0 mask!2840))))

(assert (=> start!119688 e!789397))

(assert (=> start!119688 true))

(declare-fun array_inv!35071 (array!95370) Bool)

(assert (=> start!119688 (array_inv!35071 a!2901)))

(assert (= (and start!119688 res!933610) b!1394202))

(assert (= (and b!1394202 res!933608) b!1394199))

(assert (= (and b!1394199 res!933612) b!1394198))

(assert (= (and b!1394198 res!933607) b!1394197))

(assert (= (and b!1394197 res!933613) b!1394204))

(assert (= (and b!1394204 res!933605) b!1394201))

(assert (= (and b!1394201 (not res!933611)) b!1394200))

(assert (= (and b!1394200 (not res!933606)) b!1394203))

(assert (= (and b!1394203 (not res!933609)) b!1394205))

(declare-fun m!1280421 () Bool)

(assert (=> start!119688 m!1280421))

(declare-fun m!1280423 () Bool)

(assert (=> start!119688 m!1280423))

(declare-fun m!1280425 () Bool)

(assert (=> b!1394197 m!1280425))

(declare-fun m!1280427 () Bool)

(assert (=> b!1394200 m!1280427))

(assert (=> b!1394200 m!1280427))

(declare-fun m!1280429 () Bool)

(assert (=> b!1394200 m!1280429))

(declare-fun m!1280431 () Bool)

(assert (=> b!1394200 m!1280431))

(declare-fun m!1280433 () Bool)

(assert (=> b!1394200 m!1280433))

(declare-fun m!1280435 () Bool)

(assert (=> b!1394198 m!1280435))

(assert (=> b!1394198 m!1280435))

(declare-fun m!1280437 () Bool)

(assert (=> b!1394198 m!1280437))

(declare-fun m!1280439 () Bool)

(assert (=> b!1394199 m!1280439))

(assert (=> b!1394199 m!1280439))

(declare-fun m!1280441 () Bool)

(assert (=> b!1394199 m!1280441))

(declare-fun m!1280443 () Bool)

(assert (=> b!1394205 m!1280443))

(declare-fun m!1280445 () Bool)

(assert (=> b!1394205 m!1280445))

(assert (=> b!1394201 m!1280435))

(declare-fun m!1280447 () Bool)

(assert (=> b!1394201 m!1280447))

(assert (=> b!1394201 m!1280435))

(declare-fun m!1280449 () Bool)

(assert (=> b!1394201 m!1280449))

(assert (=> b!1394201 m!1280435))

(declare-fun m!1280451 () Bool)

(assert (=> b!1394201 m!1280451))

(assert (=> b!1394201 m!1280435))

(declare-fun m!1280453 () Bool)

(assert (=> b!1394201 m!1280453))

(declare-fun m!1280455 () Bool)

(assert (=> b!1394201 m!1280455))

(declare-fun m!1280457 () Bool)

(assert (=> b!1394204 m!1280457))

(push 1)

