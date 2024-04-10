; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119698 () Bool)

(assert start!119698)

(declare-fun b!1394332 () Bool)

(declare-fun res!933747 () Bool)

(declare-fun e!789458 () Bool)

(assert (=> b!1394332 (=> (not res!933747) (not e!789458))))

(declare-datatypes ((array!95380 0))(
  ( (array!95381 (arr!46048 (Array (_ BitVec 32) (_ BitVec 64))) (size!46598 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95380)

(declare-datatypes ((List!32567 0))(
  ( (Nil!32564) (Cons!32563 (h!33796 (_ BitVec 64)) (t!47261 List!32567)) )
))
(declare-fun arrayNoDuplicates!0 (array!95380 (_ BitVec 32) List!32567) Bool)

(assert (=> b!1394332 (= res!933747 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32564))))

(declare-fun b!1394333 () Bool)

(declare-fun e!789456 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394333 (= e!789456 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10365 0))(
  ( (MissingZero!10365 (index!43831 (_ BitVec 32))) (Found!10365 (index!43832 (_ BitVec 32))) (Intermediate!10365 (undefined!11177 Bool) (index!43833 (_ BitVec 32)) (x!125497 (_ BitVec 32))) (Undefined!10365) (MissingVacant!10365 (index!43834 (_ BitVec 32))) )
))
(declare-fun lt!612390 () SeekEntryResult!10365)

(declare-fun lt!612393 () array!95380)

(declare-fun lt!612389 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95380 (_ BitVec 32)) SeekEntryResult!10365)

(assert (=> b!1394333 (= lt!612390 (seekEntryOrOpen!0 lt!612389 lt!612393 mask!2840))))

(declare-fun lt!612392 () SeekEntryResult!10365)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!612388 () (_ BitVec 32))

(declare-datatypes ((Unit!46734 0))(
  ( (Unit!46735) )
))
(declare-fun lt!612387 () Unit!46734)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46734)

(assert (=> b!1394333 (= lt!612387 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612388 (x!125497 lt!612392) (index!43833 lt!612392) mask!2840))))

(declare-fun res!933745 () Bool)

(assert (=> start!119698 (=> (not res!933745) (not e!789458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119698 (= res!933745 (validMask!0 mask!2840))))

(assert (=> start!119698 e!789458))

(assert (=> start!119698 true))

(declare-fun array_inv!35076 (array!95380) Bool)

(assert (=> start!119698 (array_inv!35076 a!2901)))

(declare-fun b!1394334 () Bool)

(declare-fun res!933746 () Bool)

(assert (=> b!1394334 (=> (not res!933746) (not e!789458))))

(assert (=> b!1394334 (= res!933746 (and (= (size!46598 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46598 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46598 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394335 () Bool)

(declare-fun res!933748 () Bool)

(assert (=> b!1394335 (=> (not res!933748) (not e!789458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394335 (= res!933748 (validKeyInArray!0 (select (arr!46048 a!2901) j!112)))))

(declare-fun b!1394336 () Bool)

(declare-fun res!933744 () Bool)

(assert (=> b!1394336 (=> res!933744 e!789456)))

(assert (=> b!1394336 (= res!933744 (or (bvslt (x!125497 lt!612392) #b00000000000000000000000000000000) (bvsgt (x!125497 lt!612392) #b01111111111111111111111111111110) (bvslt lt!612388 #b00000000000000000000000000000000) (bvsge lt!612388 (size!46598 a!2901)) (bvslt (index!43833 lt!612392) #b00000000000000000000000000000000) (bvsge (index!43833 lt!612392) (size!46598 a!2901)) (not (= lt!612392 (Intermediate!10365 false (index!43833 lt!612392) (x!125497 lt!612392))))))))

(declare-fun b!1394337 () Bool)

(declare-fun res!933740 () Bool)

(assert (=> b!1394337 (=> (not res!933740) (not e!789458))))

(assert (=> b!1394337 (= res!933740 (validKeyInArray!0 (select (arr!46048 a!2901) i!1037)))))

(declare-fun b!1394338 () Bool)

(declare-fun res!933741 () Bool)

(assert (=> b!1394338 (=> (not res!933741) (not e!789458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95380 (_ BitVec 32)) Bool)

(assert (=> b!1394338 (= res!933741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394339 () Bool)

(declare-fun e!789457 () Bool)

(assert (=> b!1394339 (= e!789458 (not e!789457))))

(declare-fun res!933742 () Bool)

(assert (=> b!1394339 (=> res!933742 e!789457)))

(assert (=> b!1394339 (= res!933742 (or (not (is-Intermediate!10365 lt!612392)) (undefined!11177 lt!612392)))))

(assert (=> b!1394339 (= lt!612390 (Found!10365 j!112))))

(assert (=> b!1394339 (= lt!612390 (seekEntryOrOpen!0 (select (arr!46048 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394339 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612391 () Unit!46734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46734)

(assert (=> b!1394339 (= lt!612391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95380 (_ BitVec 32)) SeekEntryResult!10365)

(assert (=> b!1394339 (= lt!612392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612388 (select (arr!46048 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394339 (= lt!612388 (toIndex!0 (select (arr!46048 a!2901) j!112) mask!2840))))

(declare-fun b!1394340 () Bool)

(assert (=> b!1394340 (= e!789457 e!789456)))

(declare-fun res!933743 () Bool)

(assert (=> b!1394340 (=> res!933743 e!789456)))

(assert (=> b!1394340 (= res!933743 (not (= lt!612392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612389 mask!2840) lt!612389 lt!612393 mask!2840))))))

(assert (=> b!1394340 (= lt!612389 (select (store (arr!46048 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394340 (= lt!612393 (array!95381 (store (arr!46048 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46598 a!2901)))))

(assert (= (and start!119698 res!933745) b!1394334))

(assert (= (and b!1394334 res!933746) b!1394337))

(assert (= (and b!1394337 res!933740) b!1394335))

(assert (= (and b!1394335 res!933748) b!1394338))

(assert (= (and b!1394338 res!933741) b!1394332))

(assert (= (and b!1394332 res!933747) b!1394339))

(assert (= (and b!1394339 (not res!933742)) b!1394340))

(assert (= (and b!1394340 (not res!933743)) b!1394336))

(assert (= (and b!1394336 (not res!933744)) b!1394333))

(declare-fun m!1280611 () Bool)

(assert (=> b!1394332 m!1280611))

(declare-fun m!1280613 () Bool)

(assert (=> b!1394333 m!1280613))

(declare-fun m!1280615 () Bool)

(assert (=> b!1394333 m!1280615))

(declare-fun m!1280617 () Bool)

(assert (=> b!1394338 m!1280617))

(declare-fun m!1280619 () Bool)

(assert (=> b!1394340 m!1280619))

(assert (=> b!1394340 m!1280619))

(declare-fun m!1280621 () Bool)

(assert (=> b!1394340 m!1280621))

(declare-fun m!1280623 () Bool)

(assert (=> b!1394340 m!1280623))

(declare-fun m!1280625 () Bool)

(assert (=> b!1394340 m!1280625))

(declare-fun m!1280627 () Bool)

(assert (=> start!119698 m!1280627))

(declare-fun m!1280629 () Bool)

(assert (=> start!119698 m!1280629))

(declare-fun m!1280631 () Bool)

(assert (=> b!1394339 m!1280631))

(declare-fun m!1280633 () Bool)

(assert (=> b!1394339 m!1280633))

(assert (=> b!1394339 m!1280631))

(declare-fun m!1280635 () Bool)

(assert (=> b!1394339 m!1280635))

(assert (=> b!1394339 m!1280631))

(declare-fun m!1280637 () Bool)

(assert (=> b!1394339 m!1280637))

(assert (=> b!1394339 m!1280631))

(declare-fun m!1280639 () Bool)

(assert (=> b!1394339 m!1280639))

(declare-fun m!1280641 () Bool)

(assert (=> b!1394339 m!1280641))

(assert (=> b!1394335 m!1280631))

(assert (=> b!1394335 m!1280631))

(declare-fun m!1280643 () Bool)

(assert (=> b!1394335 m!1280643))

(declare-fun m!1280645 () Bool)

(assert (=> b!1394337 m!1280645))

(assert (=> b!1394337 m!1280645))

(declare-fun m!1280647 () Bool)

(assert (=> b!1394337 m!1280647))

(push 1)

(assert (not start!119698))

(assert (not b!1394338))

(assert (not b!1394335))

(assert (not b!1394339))

