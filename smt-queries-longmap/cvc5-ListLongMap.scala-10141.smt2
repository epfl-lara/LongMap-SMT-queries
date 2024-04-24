; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119802 () Bool)

(assert start!119802)

(declare-fun b!1394447 () Bool)

(declare-fun e!789691 () Bool)

(assert (=> b!1394447 (= e!789691 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95406 0))(
  ( (array!95407 (arr!46059 (Array (_ BitVec 32) (_ BitVec 64))) (size!46610 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95406)

(declare-datatypes ((SeekEntryResult!10279 0))(
  ( (MissingZero!10279 (index!43487 (_ BitVec 32))) (Found!10279 (index!43488 (_ BitVec 32))) (Intermediate!10279 (undefined!11091 Bool) (index!43489 (_ BitVec 32)) (x!125318 (_ BitVec 32))) (Undefined!10279) (MissingVacant!10279 (index!43490 (_ BitVec 32))) )
))
(declare-fun lt!612339 () SeekEntryResult!10279)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95406 (_ BitVec 32)) SeekEntryResult!10279)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394447 (= lt!612339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46059 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46059 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95407 (store (arr!46059 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46610 a!2901)) mask!2840))))

(declare-fun b!1394448 () Bool)

(declare-fun res!933177 () Bool)

(declare-fun e!789690 () Bool)

(assert (=> b!1394448 (=> (not res!933177) (not e!789690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95406 (_ BitVec 32)) Bool)

(assert (=> b!1394448 (= res!933177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394449 () Bool)

(declare-fun res!933171 () Bool)

(assert (=> b!1394449 (=> (not res!933171) (not e!789690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394449 (= res!933171 (validKeyInArray!0 (select (arr!46059 a!2901) j!112)))))

(declare-fun b!1394450 () Bool)

(declare-fun res!933178 () Bool)

(assert (=> b!1394450 (=> (not res!933178) (not e!789690))))

(declare-datatypes ((List!32565 0))(
  ( (Nil!32562) (Cons!32561 (h!33802 (_ BitVec 64)) (t!47251 List!32565)) )
))
(declare-fun arrayNoDuplicates!0 (array!95406 (_ BitVec 32) List!32565) Bool)

(assert (=> b!1394450 (= res!933178 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32562))))

(declare-fun b!1394451 () Bool)

(assert (=> b!1394451 (= e!789690 (not e!789691))))

(declare-fun res!933172 () Bool)

(assert (=> b!1394451 (=> res!933172 e!789691)))

(declare-fun lt!612340 () SeekEntryResult!10279)

(assert (=> b!1394451 (= res!933172 (or (not (is-Intermediate!10279 lt!612340)) (undefined!11091 lt!612340)))))

(declare-fun e!789689 () Bool)

(assert (=> b!1394451 e!789689))

(declare-fun res!933173 () Bool)

(assert (=> b!1394451 (=> (not res!933173) (not e!789689))))

(assert (=> b!1394451 (= res!933173 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46589 0))(
  ( (Unit!46590) )
))
(declare-fun lt!612341 () Unit!46589)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46589)

(assert (=> b!1394451 (= lt!612341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394451 (= lt!612340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46059 a!2901) j!112) mask!2840) (select (arr!46059 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394452 () Bool)

(declare-fun res!933174 () Bool)

(assert (=> b!1394452 (=> (not res!933174) (not e!789690))))

(assert (=> b!1394452 (= res!933174 (validKeyInArray!0 (select (arr!46059 a!2901) i!1037)))))

(declare-fun res!933176 () Bool)

(assert (=> start!119802 (=> (not res!933176) (not e!789690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119802 (= res!933176 (validMask!0 mask!2840))))

(assert (=> start!119802 e!789690))

(assert (=> start!119802 true))

(declare-fun array_inv!35340 (array!95406) Bool)

(assert (=> start!119802 (array_inv!35340 a!2901)))

(declare-fun b!1394453 () Bool)

(declare-fun res!933175 () Bool)

(assert (=> b!1394453 (=> (not res!933175) (not e!789690))))

(assert (=> b!1394453 (= res!933175 (and (= (size!46610 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46610 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46610 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394454 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95406 (_ BitVec 32)) SeekEntryResult!10279)

(assert (=> b!1394454 (= e!789689 (= (seekEntryOrOpen!0 (select (arr!46059 a!2901) j!112) a!2901 mask!2840) (Found!10279 j!112)))))

(assert (= (and start!119802 res!933176) b!1394453))

(assert (= (and b!1394453 res!933175) b!1394452))

(assert (= (and b!1394452 res!933174) b!1394449))

(assert (= (and b!1394449 res!933171) b!1394448))

(assert (= (and b!1394448 res!933177) b!1394450))

(assert (= (and b!1394450 res!933178) b!1394451))

(assert (= (and b!1394451 res!933173) b!1394454))

(assert (= (and b!1394451 (not res!933172)) b!1394447))

(declare-fun m!1280535 () Bool)

(assert (=> b!1394452 m!1280535))

(assert (=> b!1394452 m!1280535))

(declare-fun m!1280537 () Bool)

(assert (=> b!1394452 m!1280537))

(declare-fun m!1280539 () Bool)

(assert (=> b!1394454 m!1280539))

(assert (=> b!1394454 m!1280539))

(declare-fun m!1280541 () Bool)

(assert (=> b!1394454 m!1280541))

(assert (=> b!1394449 m!1280539))

(assert (=> b!1394449 m!1280539))

(declare-fun m!1280543 () Bool)

(assert (=> b!1394449 m!1280543))

(assert (=> b!1394451 m!1280539))

(declare-fun m!1280545 () Bool)

(assert (=> b!1394451 m!1280545))

(assert (=> b!1394451 m!1280539))

(declare-fun m!1280547 () Bool)

(assert (=> b!1394451 m!1280547))

(assert (=> b!1394451 m!1280545))

(assert (=> b!1394451 m!1280539))

(declare-fun m!1280549 () Bool)

(assert (=> b!1394451 m!1280549))

(declare-fun m!1280551 () Bool)

(assert (=> b!1394451 m!1280551))

(declare-fun m!1280553 () Bool)

(assert (=> b!1394448 m!1280553))

(declare-fun m!1280555 () Bool)

(assert (=> start!119802 m!1280555))

(declare-fun m!1280557 () Bool)

(assert (=> start!119802 m!1280557))

(declare-fun m!1280559 () Bool)

(assert (=> b!1394447 m!1280559))

(declare-fun m!1280561 () Bool)

(assert (=> b!1394447 m!1280561))

(assert (=> b!1394447 m!1280561))

(declare-fun m!1280563 () Bool)

(assert (=> b!1394447 m!1280563))

(assert (=> b!1394447 m!1280563))

(assert (=> b!1394447 m!1280561))

(declare-fun m!1280565 () Bool)

(assert (=> b!1394447 m!1280565))

(declare-fun m!1280567 () Bool)

(assert (=> b!1394450 m!1280567))

(push 1)

(assert (not b!1394452))

(assert (not b!1394449))

(assert (not b!1394447))

(assert (not b!1394451))

(assert (not b!1394450))

(assert (not b!1394454))

(assert (not start!119802))

(assert (not b!1394448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

