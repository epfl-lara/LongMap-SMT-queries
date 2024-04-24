; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119820 () Bool)

(assert start!119820)

(declare-fun b!1394663 () Bool)

(declare-fun res!933394 () Bool)

(declare-fun e!789799 () Bool)

(assert (=> b!1394663 (=> (not res!933394) (not e!789799))))

(declare-datatypes ((array!95424 0))(
  ( (array!95425 (arr!46068 (Array (_ BitVec 32) (_ BitVec 64))) (size!46619 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95424)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394663 (= res!933394 (validKeyInArray!0 (select (arr!46068 a!2901) i!1037)))))

(declare-fun b!1394664 () Bool)

(declare-fun res!933392 () Bool)

(assert (=> b!1394664 (=> (not res!933392) (not e!789799))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394664 (= res!933392 (and (= (size!46619 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46619 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46619 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!789800 () Bool)

(declare-fun b!1394665 () Bool)

(declare-datatypes ((SeekEntryResult!10288 0))(
  ( (MissingZero!10288 (index!43523 (_ BitVec 32))) (Found!10288 (index!43524 (_ BitVec 32))) (Intermediate!10288 (undefined!11100 Bool) (index!43525 (_ BitVec 32)) (x!125351 (_ BitVec 32))) (Undefined!10288) (MissingVacant!10288 (index!43526 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95424 (_ BitVec 32)) SeekEntryResult!10288)

(assert (=> b!1394665 (= e!789800 (= (seekEntryOrOpen!0 (select (arr!46068 a!2901) j!112) a!2901 mask!2840) (Found!10288 j!112)))))

(declare-fun b!1394666 () Bool)

(declare-fun e!789798 () Bool)

(assert (=> b!1394666 (= e!789798 true)))

(declare-fun lt!612422 () SeekEntryResult!10288)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95424 (_ BitVec 32)) SeekEntryResult!10288)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394666 (= lt!612422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46068 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46068 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95425 (store (arr!46068 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46619 a!2901)) mask!2840))))

(declare-fun b!1394667 () Bool)

(declare-fun res!933390 () Bool)

(assert (=> b!1394667 (=> (not res!933390) (not e!789799))))

(assert (=> b!1394667 (= res!933390 (validKeyInArray!0 (select (arr!46068 a!2901) j!112)))))

(declare-fun res!933393 () Bool)

(assert (=> start!119820 (=> (not res!933393) (not e!789799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119820 (= res!933393 (validMask!0 mask!2840))))

(assert (=> start!119820 e!789799))

(assert (=> start!119820 true))

(declare-fun array_inv!35349 (array!95424) Bool)

(assert (=> start!119820 (array_inv!35349 a!2901)))

(declare-fun b!1394668 () Bool)

(declare-fun res!933391 () Bool)

(assert (=> b!1394668 (=> (not res!933391) (not e!789799))))

(declare-datatypes ((List!32574 0))(
  ( (Nil!32571) (Cons!32570 (h!33811 (_ BitVec 64)) (t!47260 List!32574)) )
))
(declare-fun arrayNoDuplicates!0 (array!95424 (_ BitVec 32) List!32574) Bool)

(assert (=> b!1394668 (= res!933391 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32571))))

(declare-fun b!1394669 () Bool)

(declare-fun res!933387 () Bool)

(assert (=> b!1394669 (=> (not res!933387) (not e!789799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95424 (_ BitVec 32)) Bool)

(assert (=> b!1394669 (= res!933387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394670 () Bool)

(assert (=> b!1394670 (= e!789799 (not e!789798))))

(declare-fun res!933388 () Bool)

(assert (=> b!1394670 (=> res!933388 e!789798)))

(declare-fun lt!612420 () SeekEntryResult!10288)

(assert (=> b!1394670 (= res!933388 (or (not (is-Intermediate!10288 lt!612420)) (undefined!11100 lt!612420)))))

(assert (=> b!1394670 e!789800))

(declare-fun res!933389 () Bool)

(assert (=> b!1394670 (=> (not res!933389) (not e!789800))))

(assert (=> b!1394670 (= res!933389 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46607 0))(
  ( (Unit!46608) )
))
(declare-fun lt!612421 () Unit!46607)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46607)

(assert (=> b!1394670 (= lt!612421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394670 (= lt!612420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46068 a!2901) j!112) mask!2840) (select (arr!46068 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119820 res!933393) b!1394664))

(assert (= (and b!1394664 res!933392) b!1394663))

(assert (= (and b!1394663 res!933394) b!1394667))

(assert (= (and b!1394667 res!933390) b!1394669))

(assert (= (and b!1394669 res!933387) b!1394668))

(assert (= (and b!1394668 res!933391) b!1394670))

(assert (= (and b!1394670 res!933389) b!1394665))

(assert (= (and b!1394670 (not res!933388)) b!1394666))

(declare-fun m!1280841 () Bool)

(assert (=> b!1394666 m!1280841))

(declare-fun m!1280843 () Bool)

(assert (=> b!1394666 m!1280843))

(assert (=> b!1394666 m!1280843))

(declare-fun m!1280845 () Bool)

(assert (=> b!1394666 m!1280845))

(assert (=> b!1394666 m!1280845))

(assert (=> b!1394666 m!1280843))

(declare-fun m!1280847 () Bool)

(assert (=> b!1394666 m!1280847))

(declare-fun m!1280849 () Bool)

(assert (=> b!1394665 m!1280849))

(assert (=> b!1394665 m!1280849))

(declare-fun m!1280851 () Bool)

(assert (=> b!1394665 m!1280851))

(declare-fun m!1280853 () Bool)

(assert (=> b!1394663 m!1280853))

(assert (=> b!1394663 m!1280853))

(declare-fun m!1280855 () Bool)

(assert (=> b!1394663 m!1280855))

(assert (=> b!1394670 m!1280849))

(declare-fun m!1280857 () Bool)

(assert (=> b!1394670 m!1280857))

(assert (=> b!1394670 m!1280849))

(declare-fun m!1280859 () Bool)

(assert (=> b!1394670 m!1280859))

(assert (=> b!1394670 m!1280857))

(assert (=> b!1394670 m!1280849))

(declare-fun m!1280861 () Bool)

(assert (=> b!1394670 m!1280861))

(declare-fun m!1280863 () Bool)

(assert (=> b!1394670 m!1280863))

(declare-fun m!1280865 () Bool)

(assert (=> b!1394669 m!1280865))

(declare-fun m!1280867 () Bool)

(assert (=> b!1394668 m!1280867))

(assert (=> b!1394667 m!1280849))

(assert (=> b!1394667 m!1280849))

(declare-fun m!1280869 () Bool)

(assert (=> b!1394667 m!1280869))

(declare-fun m!1280871 () Bool)

(assert (=> start!119820 m!1280871))

(declare-fun m!1280873 () Bool)

(assert (=> start!119820 m!1280873))

(push 1)

(assert (not b!1394670))

(assert (not b!1394666))

(assert (not b!1394663))

(assert (not start!119820))

(assert (not b!1394665))

(assert (not b!1394668))

(assert (not b!1394667))

(assert (not b!1394669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

