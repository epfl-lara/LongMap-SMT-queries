; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119712 () Bool)

(assert start!119712)

(declare-fun b!1394521 () Bool)

(declare-fun res!933932 () Bool)

(declare-fun e!789540 () Bool)

(assert (=> b!1394521 (=> res!933932 e!789540)))

(declare-fun lt!612534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10372 0))(
  ( (MissingZero!10372 (index!43859 (_ BitVec 32))) (Found!10372 (index!43860 (_ BitVec 32))) (Intermediate!10372 (undefined!11184 Bool) (index!43861 (_ BitVec 32)) (x!125528 (_ BitVec 32))) (Undefined!10372) (MissingVacant!10372 (index!43862 (_ BitVec 32))) )
))
(declare-fun lt!612538 () SeekEntryResult!10372)

(declare-datatypes ((array!95394 0))(
  ( (array!95395 (arr!46055 (Array (_ BitVec 32) (_ BitVec 64))) (size!46605 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95394)

(assert (=> b!1394521 (= res!933932 (or (bvslt (x!125528 lt!612538) #b00000000000000000000000000000000) (bvsgt (x!125528 lt!612538) #b01111111111111111111111111111110) (bvslt lt!612534 #b00000000000000000000000000000000) (bvsge lt!612534 (size!46605 a!2901)) (bvslt (index!43861 lt!612538) #b00000000000000000000000000000000) (bvsge (index!43861 lt!612538) (size!46605 a!2901)) (not (= lt!612538 (Intermediate!10372 false (index!43861 lt!612538) (x!125528 lt!612538))))))))

(declare-fun b!1394522 () Bool)

(declare-fun res!933935 () Bool)

(declare-fun e!789541 () Bool)

(assert (=> b!1394522 (=> (not res!933935) (not e!789541))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95394 (_ BitVec 32)) Bool)

(assert (=> b!1394522 (= res!933935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394523 () Bool)

(declare-fun res!933930 () Bool)

(assert (=> b!1394523 (=> (not res!933930) (not e!789541))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394523 (= res!933930 (validKeyInArray!0 (select (arr!46055 a!2901) j!112)))))

(declare-fun b!1394524 () Bool)

(declare-fun res!933931 () Bool)

(assert (=> b!1394524 (=> (not res!933931) (not e!789541))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394524 (= res!933931 (validKeyInArray!0 (select (arr!46055 a!2901) i!1037)))))

(declare-fun res!933933 () Bool)

(assert (=> start!119712 (=> (not res!933933) (not e!789541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119712 (= res!933933 (validMask!0 mask!2840))))

(assert (=> start!119712 e!789541))

(assert (=> start!119712 true))

(declare-fun array_inv!35083 (array!95394) Bool)

(assert (=> start!119712 (array_inv!35083 a!2901)))

(declare-fun b!1394525 () Bool)

(declare-fun res!933934 () Bool)

(assert (=> b!1394525 (=> (not res!933934) (not e!789541))))

(assert (=> b!1394525 (= res!933934 (and (= (size!46605 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46605 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46605 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394526 () Bool)

(declare-fun e!789542 () Bool)

(assert (=> b!1394526 (= e!789541 (not e!789542))))

(declare-fun res!933937 () Bool)

(assert (=> b!1394526 (=> res!933937 e!789542)))

(assert (=> b!1394526 (= res!933937 (or (not (is-Intermediate!10372 lt!612538)) (undefined!11184 lt!612538)))))

(declare-fun lt!612535 () SeekEntryResult!10372)

(assert (=> b!1394526 (= lt!612535 (Found!10372 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95394 (_ BitVec 32)) SeekEntryResult!10372)

(assert (=> b!1394526 (= lt!612535 (seekEntryOrOpen!0 (select (arr!46055 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394526 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46748 0))(
  ( (Unit!46749) )
))
(declare-fun lt!612537 () Unit!46748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46748)

(assert (=> b!1394526 (= lt!612537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95394 (_ BitVec 32)) SeekEntryResult!10372)

(assert (=> b!1394526 (= lt!612538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612534 (select (arr!46055 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394526 (= lt!612534 (toIndex!0 (select (arr!46055 a!2901) j!112) mask!2840))))

(declare-fun b!1394527 () Bool)

(assert (=> b!1394527 (= e!789542 e!789540)))

(declare-fun res!933936 () Bool)

(assert (=> b!1394527 (=> res!933936 e!789540)))

(declare-fun lt!612540 () (_ BitVec 64))

(declare-fun lt!612539 () array!95394)

(assert (=> b!1394527 (= res!933936 (not (= lt!612538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612540 mask!2840) lt!612540 lt!612539 mask!2840))))))

(assert (=> b!1394527 (= lt!612540 (select (store (arr!46055 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394527 (= lt!612539 (array!95395 (store (arr!46055 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46605 a!2901)))))

(declare-fun b!1394528 () Bool)

(declare-fun res!933929 () Bool)

(assert (=> b!1394528 (=> (not res!933929) (not e!789541))))

(declare-datatypes ((List!32574 0))(
  ( (Nil!32571) (Cons!32570 (h!33803 (_ BitVec 64)) (t!47268 List!32574)) )
))
(declare-fun arrayNoDuplicates!0 (array!95394 (_ BitVec 32) List!32574) Bool)

(assert (=> b!1394528 (= res!933929 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32571))))

(declare-fun b!1394529 () Bool)

(assert (=> b!1394529 (= e!789540 true)))

(assert (=> b!1394529 (= lt!612535 (seekEntryOrOpen!0 lt!612540 lt!612539 mask!2840))))

(declare-fun lt!612536 () Unit!46748)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46748)

(assert (=> b!1394529 (= lt!612536 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612534 (x!125528 lt!612538) (index!43861 lt!612538) mask!2840))))

(assert (= (and start!119712 res!933933) b!1394525))

(assert (= (and b!1394525 res!933934) b!1394524))

(assert (= (and b!1394524 res!933931) b!1394523))

(assert (= (and b!1394523 res!933930) b!1394522))

(assert (= (and b!1394522 res!933935) b!1394528))

(assert (= (and b!1394528 res!933929) b!1394526))

(assert (= (and b!1394526 (not res!933937)) b!1394527))

(assert (= (and b!1394527 (not res!933936)) b!1394521))

(assert (= (and b!1394521 (not res!933932)) b!1394529))

(declare-fun m!1280877 () Bool)

(assert (=> b!1394523 m!1280877))

(assert (=> b!1394523 m!1280877))

(declare-fun m!1280879 () Bool)

(assert (=> b!1394523 m!1280879))

(declare-fun m!1280881 () Bool)

(assert (=> b!1394528 m!1280881))

(declare-fun m!1280883 () Bool)

(assert (=> b!1394522 m!1280883))

(declare-fun m!1280885 () Bool)

(assert (=> b!1394527 m!1280885))

(assert (=> b!1394527 m!1280885))

(declare-fun m!1280887 () Bool)

(assert (=> b!1394527 m!1280887))

(declare-fun m!1280889 () Bool)

(assert (=> b!1394527 m!1280889))

(declare-fun m!1280891 () Bool)

(assert (=> b!1394527 m!1280891))

(assert (=> b!1394526 m!1280877))

(declare-fun m!1280893 () Bool)

(assert (=> b!1394526 m!1280893))

(assert (=> b!1394526 m!1280877))

(declare-fun m!1280895 () Bool)

(assert (=> b!1394526 m!1280895))

(assert (=> b!1394526 m!1280877))

(declare-fun m!1280897 () Bool)

(assert (=> b!1394526 m!1280897))

(assert (=> b!1394526 m!1280877))

(declare-fun m!1280899 () Bool)

(assert (=> b!1394526 m!1280899))

(declare-fun m!1280901 () Bool)

(assert (=> b!1394526 m!1280901))

(declare-fun m!1280903 () Bool)

(assert (=> b!1394524 m!1280903))

(assert (=> b!1394524 m!1280903))

(declare-fun m!1280905 () Bool)

(assert (=> b!1394524 m!1280905))

(declare-fun m!1280907 () Bool)

(assert (=> start!119712 m!1280907))

(declare-fun m!1280909 () Bool)

(assert (=> start!119712 m!1280909))

(declare-fun m!1280911 () Bool)

(assert (=> b!1394529 m!1280911))

(declare-fun m!1280913 () Bool)

(assert (=> b!1394529 m!1280913))

(push 1)

