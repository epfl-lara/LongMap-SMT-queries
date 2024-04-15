; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119622 () Bool)

(assert start!119622)

(declare-fun b!1393370 () Bool)

(declare-fun res!932831 () Bool)

(declare-fun e!788986 () Bool)

(assert (=> b!1393370 (=> (not res!932831) (not e!788986))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95257 0))(
  ( (array!95258 (arr!45987 (Array (_ BitVec 32) (_ BitVec 64))) (size!46539 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95257)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393370 (= res!932831 (and (= (size!46539 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46539 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46539 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393371 () Bool)

(declare-fun e!788985 () Bool)

(assert (=> b!1393371 (= e!788986 (not e!788985))))

(declare-fun res!932836 () Bool)

(assert (=> b!1393371 (=> res!932836 e!788985)))

(declare-datatypes ((SeekEntryResult!10330 0))(
  ( (MissingZero!10330 (index!43691 (_ BitVec 32))) (Found!10330 (index!43692 (_ BitVec 32))) (Intermediate!10330 (undefined!11142 Bool) (index!43693 (_ BitVec 32)) (x!125363 (_ BitVec 32))) (Undefined!10330) (MissingVacant!10330 (index!43694 (_ BitVec 32))) )
))
(declare-fun lt!611805 () SeekEntryResult!10330)

(assert (=> b!1393371 (= res!932836 (or (not (is-Intermediate!10330 lt!611805)) (undefined!11142 lt!611805)))))

(declare-fun e!788984 () Bool)

(assert (=> b!1393371 e!788984))

(declare-fun res!932832 () Bool)

(assert (=> b!1393371 (=> (not res!932832) (not e!788984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95257 (_ BitVec 32)) Bool)

(assert (=> b!1393371 (= res!932832 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46507 0))(
  ( (Unit!46508) )
))
(declare-fun lt!611807 () Unit!46507)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46507)

(assert (=> b!1393371 (= lt!611807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95257 (_ BitVec 32)) SeekEntryResult!10330)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393371 (= lt!611805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) (select (arr!45987 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393372 () Bool)

(declare-fun res!932829 () Bool)

(assert (=> b!1393372 (=> (not res!932829) (not e!788986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393372 (= res!932829 (validKeyInArray!0 (select (arr!45987 a!2901) j!112)))))

(declare-fun res!932835 () Bool)

(assert (=> start!119622 (=> (not res!932835) (not e!788986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119622 (= res!932835 (validMask!0 mask!2840))))

(assert (=> start!119622 e!788986))

(assert (=> start!119622 true))

(declare-fun array_inv!35220 (array!95257) Bool)

(assert (=> start!119622 (array_inv!35220 a!2901)))

(declare-fun b!1393373 () Bool)

(declare-fun res!932830 () Bool)

(assert (=> b!1393373 (=> (not res!932830) (not e!788986))))

(assert (=> b!1393373 (= res!932830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393374 () Bool)

(declare-fun res!932833 () Bool)

(assert (=> b!1393374 (=> (not res!932833) (not e!788986))))

(declare-datatypes ((List!32584 0))(
  ( (Nil!32581) (Cons!32580 (h!33813 (_ BitVec 64)) (t!47270 List!32584)) )
))
(declare-fun arrayNoDuplicates!0 (array!95257 (_ BitVec 32) List!32584) Bool)

(assert (=> b!1393374 (= res!932833 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32581))))

(declare-fun b!1393375 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95257 (_ BitVec 32)) SeekEntryResult!10330)

(assert (=> b!1393375 (= e!788984 (= (seekEntryOrOpen!0 (select (arr!45987 a!2901) j!112) a!2901 mask!2840) (Found!10330 j!112)))))

(declare-fun b!1393376 () Bool)

(declare-fun res!932834 () Bool)

(assert (=> b!1393376 (=> (not res!932834) (not e!788986))))

(assert (=> b!1393376 (= res!932834 (validKeyInArray!0 (select (arr!45987 a!2901) i!1037)))))

(declare-fun b!1393377 () Bool)

(assert (=> b!1393377 (= e!788985 true)))

(declare-fun lt!611806 () SeekEntryResult!10330)

(assert (=> b!1393377 (= lt!611806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95258 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46539 a!2901)) mask!2840))))

(assert (= (and start!119622 res!932835) b!1393370))

(assert (= (and b!1393370 res!932831) b!1393376))

(assert (= (and b!1393376 res!932834) b!1393372))

(assert (= (and b!1393372 res!932829) b!1393373))

(assert (= (and b!1393373 res!932830) b!1393374))

(assert (= (and b!1393374 res!932833) b!1393371))

(assert (= (and b!1393371 res!932832) b!1393375))

(assert (= (and b!1393371 (not res!932836)) b!1393377))

(declare-fun m!1278831 () Bool)

(assert (=> b!1393376 m!1278831))

(assert (=> b!1393376 m!1278831))

(declare-fun m!1278833 () Bool)

(assert (=> b!1393376 m!1278833))

(declare-fun m!1278835 () Bool)

(assert (=> b!1393373 m!1278835))

(declare-fun m!1278837 () Bool)

(assert (=> start!119622 m!1278837))

(declare-fun m!1278839 () Bool)

(assert (=> start!119622 m!1278839))

(declare-fun m!1278841 () Bool)

(assert (=> b!1393371 m!1278841))

(declare-fun m!1278843 () Bool)

(assert (=> b!1393371 m!1278843))

(assert (=> b!1393371 m!1278841))

(declare-fun m!1278845 () Bool)

(assert (=> b!1393371 m!1278845))

(assert (=> b!1393371 m!1278843))

(assert (=> b!1393371 m!1278841))

(declare-fun m!1278847 () Bool)

(assert (=> b!1393371 m!1278847))

(declare-fun m!1278849 () Bool)

(assert (=> b!1393371 m!1278849))

(declare-fun m!1278851 () Bool)

(assert (=> b!1393377 m!1278851))

(declare-fun m!1278853 () Bool)

(assert (=> b!1393377 m!1278853))

(assert (=> b!1393377 m!1278853))

(declare-fun m!1278855 () Bool)

(assert (=> b!1393377 m!1278855))

(assert (=> b!1393377 m!1278855))

(assert (=> b!1393377 m!1278853))

(declare-fun m!1278857 () Bool)

(assert (=> b!1393377 m!1278857))

(declare-fun m!1278859 () Bool)

(assert (=> b!1393374 m!1278859))

(assert (=> b!1393372 m!1278841))

(assert (=> b!1393372 m!1278841))

(declare-fun m!1278861 () Bool)

(assert (=> b!1393372 m!1278861))

(assert (=> b!1393375 m!1278841))

(assert (=> b!1393375 m!1278841))

(declare-fun m!1278863 () Bool)

(assert (=> b!1393375 m!1278863))

(push 1)

(assert (not b!1393376))

(assert (not b!1393371))

(assert (not b!1393373))

(assert (not b!1393377))

(assert (not start!119622))

(assert (not b!1393372))

(assert (not b!1393375))

(assert (not b!1393374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

