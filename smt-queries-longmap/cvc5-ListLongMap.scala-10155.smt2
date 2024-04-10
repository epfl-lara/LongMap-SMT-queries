; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119694 () Bool)

(assert start!119694)

(declare-fun b!1394278 () Bool)

(declare-fun res!933694 () Bool)

(declare-fun e!789432 () Bool)

(assert (=> b!1394278 (=> (not res!933694) (not e!789432))))

(declare-datatypes ((array!95376 0))(
  ( (array!95377 (arr!46046 (Array (_ BitVec 32) (_ BitVec 64))) (size!46596 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95376)

(declare-datatypes ((List!32565 0))(
  ( (Nil!32562) (Cons!32561 (h!33794 (_ BitVec 64)) (t!47259 List!32565)) )
))
(declare-fun arrayNoDuplicates!0 (array!95376 (_ BitVec 32) List!32565) Bool)

(assert (=> b!1394278 (= res!933694 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32562))))

(declare-fun b!1394279 () Bool)

(declare-fun res!933686 () Bool)

(assert (=> b!1394279 (=> (not res!933686) (not e!789432))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394279 (= res!933686 (validKeyInArray!0 (select (arr!46046 a!2901) i!1037)))))

(declare-fun b!1394280 () Bool)

(declare-fun res!933688 () Bool)

(assert (=> b!1394280 (=> (not res!933688) (not e!789432))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394280 (= res!933688 (validKeyInArray!0 (select (arr!46046 a!2901) j!112)))))

(declare-fun b!1394281 () Bool)

(declare-fun e!789434 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394281 (= e!789434 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10363 0))(
  ( (MissingZero!10363 (index!43823 (_ BitVec 32))) (Found!10363 (index!43824 (_ BitVec 32))) (Intermediate!10363 (undefined!11175 Bool) (index!43825 (_ BitVec 32)) (x!125495 (_ BitVec 32))) (Undefined!10363) (MissingVacant!10363 (index!43826 (_ BitVec 32))) )
))
(declare-fun lt!612350 () SeekEntryResult!10363)

(declare-fun lt!612346 () (_ BitVec 64))

(declare-fun lt!612351 () array!95376)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95376 (_ BitVec 32)) SeekEntryResult!10363)

(assert (=> b!1394281 (= lt!612350 (seekEntryOrOpen!0 lt!612346 lt!612351 mask!2840))))

(declare-fun lt!612349 () (_ BitVec 32))

(declare-datatypes ((Unit!46730 0))(
  ( (Unit!46731) )
))
(declare-fun lt!612348 () Unit!46730)

(declare-fun lt!612347 () SeekEntryResult!10363)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46730)

(assert (=> b!1394281 (= lt!612348 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612349 (x!125495 lt!612347) (index!43825 lt!612347) mask!2840))))

(declare-fun b!1394282 () Bool)

(declare-fun res!933693 () Bool)

(assert (=> b!1394282 (=> (not res!933693) (not e!789432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95376 (_ BitVec 32)) Bool)

(assert (=> b!1394282 (= res!933693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394283 () Bool)

(declare-fun res!933687 () Bool)

(assert (=> b!1394283 (=> (not res!933687) (not e!789432))))

(assert (=> b!1394283 (= res!933687 (and (= (size!46596 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46596 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46596 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394284 () Bool)

(declare-fun e!789433 () Bool)

(assert (=> b!1394284 (= e!789432 (not e!789433))))

(declare-fun res!933689 () Bool)

(assert (=> b!1394284 (=> res!933689 e!789433)))

(assert (=> b!1394284 (= res!933689 (or (not (is-Intermediate!10363 lt!612347)) (undefined!11175 lt!612347)))))

(assert (=> b!1394284 (= lt!612350 (Found!10363 j!112))))

(assert (=> b!1394284 (= lt!612350 (seekEntryOrOpen!0 (select (arr!46046 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394284 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612345 () Unit!46730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46730)

(assert (=> b!1394284 (= lt!612345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95376 (_ BitVec 32)) SeekEntryResult!10363)

(assert (=> b!1394284 (= lt!612347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612349 (select (arr!46046 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394284 (= lt!612349 (toIndex!0 (select (arr!46046 a!2901) j!112) mask!2840))))

(declare-fun b!1394285 () Bool)

(assert (=> b!1394285 (= e!789433 e!789434)))

(declare-fun res!933692 () Bool)

(assert (=> b!1394285 (=> res!933692 e!789434)))

(assert (=> b!1394285 (= res!933692 (not (= lt!612347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612346 mask!2840) lt!612346 lt!612351 mask!2840))))))

(assert (=> b!1394285 (= lt!612346 (select (store (arr!46046 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394285 (= lt!612351 (array!95377 (store (arr!46046 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46596 a!2901)))))

(declare-fun res!933691 () Bool)

(assert (=> start!119694 (=> (not res!933691) (not e!789432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119694 (= res!933691 (validMask!0 mask!2840))))

(assert (=> start!119694 e!789432))

(assert (=> start!119694 true))

(declare-fun array_inv!35074 (array!95376) Bool)

(assert (=> start!119694 (array_inv!35074 a!2901)))

(declare-fun b!1394286 () Bool)

(declare-fun res!933690 () Bool)

(assert (=> b!1394286 (=> res!933690 e!789434)))

(assert (=> b!1394286 (= res!933690 (or (bvslt (x!125495 lt!612347) #b00000000000000000000000000000000) (bvsgt (x!125495 lt!612347) #b01111111111111111111111111111110) (bvslt lt!612349 #b00000000000000000000000000000000) (bvsge lt!612349 (size!46596 a!2901)) (bvslt (index!43825 lt!612347) #b00000000000000000000000000000000) (bvsge (index!43825 lt!612347) (size!46596 a!2901)) (not (= lt!612347 (Intermediate!10363 false (index!43825 lt!612347) (x!125495 lt!612347))))))))

(assert (= (and start!119694 res!933691) b!1394283))

(assert (= (and b!1394283 res!933687) b!1394279))

(assert (= (and b!1394279 res!933686) b!1394280))

(assert (= (and b!1394280 res!933688) b!1394282))

(assert (= (and b!1394282 res!933693) b!1394278))

(assert (= (and b!1394278 res!933694) b!1394284))

(assert (= (and b!1394284 (not res!933689)) b!1394285))

(assert (= (and b!1394285 (not res!933692)) b!1394286))

(assert (= (and b!1394286 (not res!933690)) b!1394281))

(declare-fun m!1280535 () Bool)

(assert (=> b!1394281 m!1280535))

(declare-fun m!1280537 () Bool)

(assert (=> b!1394281 m!1280537))

(declare-fun m!1280539 () Bool)

(assert (=> b!1394278 m!1280539))

(declare-fun m!1280541 () Bool)

(assert (=> b!1394284 m!1280541))

(declare-fun m!1280543 () Bool)

(assert (=> b!1394284 m!1280543))

(assert (=> b!1394284 m!1280541))

(declare-fun m!1280545 () Bool)

(assert (=> b!1394284 m!1280545))

(assert (=> b!1394284 m!1280541))

(declare-fun m!1280547 () Bool)

(assert (=> b!1394284 m!1280547))

(assert (=> b!1394284 m!1280541))

(declare-fun m!1280549 () Bool)

(assert (=> b!1394284 m!1280549))

(declare-fun m!1280551 () Bool)

(assert (=> b!1394284 m!1280551))

(declare-fun m!1280553 () Bool)

(assert (=> start!119694 m!1280553))

(declare-fun m!1280555 () Bool)

(assert (=> start!119694 m!1280555))

(declare-fun m!1280557 () Bool)

(assert (=> b!1394279 m!1280557))

(assert (=> b!1394279 m!1280557))

(declare-fun m!1280559 () Bool)

(assert (=> b!1394279 m!1280559))

(assert (=> b!1394280 m!1280541))

(assert (=> b!1394280 m!1280541))

(declare-fun m!1280561 () Bool)

(assert (=> b!1394280 m!1280561))

(declare-fun m!1280563 () Bool)

(assert (=> b!1394282 m!1280563))

(declare-fun m!1280565 () Bool)

(assert (=> b!1394285 m!1280565))

(assert (=> b!1394285 m!1280565))

(declare-fun m!1280567 () Bool)

(assert (=> b!1394285 m!1280567))

(declare-fun m!1280569 () Bool)

(assert (=> b!1394285 m!1280569))

(declare-fun m!1280571 () Bool)

(assert (=> b!1394285 m!1280571))

(push 1)

