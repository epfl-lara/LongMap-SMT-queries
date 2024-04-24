; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121350 () Bool)

(assert start!121350)

(declare-fun b!1409930 () Bool)

(declare-fun res!946972 () Bool)

(declare-fun e!798011 () Bool)

(assert (=> b!1409930 (=> (not res!946972) (not e!798011))))

(declare-datatypes ((array!96426 0))(
  ( (array!96427 (arr!46554 (Array (_ BitVec 32) (_ BitVec 64))) (size!47105 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96426)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409930 (= res!946972 (validKeyInArray!0 (select (arr!46554 a!2901) i!1037)))))

(declare-fun b!1409931 () Bool)

(declare-fun e!798010 () Bool)

(assert (=> b!1409931 (= e!798010 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10768 0))(
  ( (MissingZero!10768 (index!45449 (_ BitVec 32))) (Found!10768 (index!45450 (_ BitVec 32))) (Intermediate!10768 (undefined!11580 Bool) (index!45451 (_ BitVec 32)) (x!127196 (_ BitVec 32))) (Undefined!10768) (MissingVacant!10768 (index!45452 (_ BitVec 32))) )
))
(declare-fun lt!620878 () SeekEntryResult!10768)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96426 (_ BitVec 32)) SeekEntryResult!10768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409931 (= lt!620878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46554 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46554 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96427 (store (arr!46554 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47105 a!2901)) mask!2840))))

(declare-fun res!946971 () Bool)

(assert (=> start!121350 (=> (not res!946971) (not e!798011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121350 (= res!946971 (validMask!0 mask!2840))))

(assert (=> start!121350 e!798011))

(assert (=> start!121350 true))

(declare-fun array_inv!35835 (array!96426) Bool)

(assert (=> start!121350 (array_inv!35835 a!2901)))

(declare-fun b!1409932 () Bool)

(declare-fun res!946969 () Bool)

(assert (=> b!1409932 (=> (not res!946969) (not e!798011))))

(declare-datatypes ((List!33060 0))(
  ( (Nil!33057) (Cons!33056 (h!34327 (_ BitVec 64)) (t!47746 List!33060)) )
))
(declare-fun arrayNoDuplicates!0 (array!96426 (_ BitVec 32) List!33060) Bool)

(assert (=> b!1409932 (= res!946969 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33057))))

(declare-fun b!1409933 () Bool)

(declare-fun res!946968 () Bool)

(assert (=> b!1409933 (=> (not res!946968) (not e!798011))))

(assert (=> b!1409933 (= res!946968 (and (= (size!47105 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47105 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47105 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409934 () Bool)

(assert (=> b!1409934 (= e!798011 (not e!798010))))

(declare-fun res!946970 () Bool)

(assert (=> b!1409934 (=> res!946970 e!798010)))

(declare-fun lt!620877 () SeekEntryResult!10768)

(assert (=> b!1409934 (= res!946970 (or (not (is-Intermediate!10768 lt!620877)) (undefined!11580 lt!620877)))))

(declare-fun e!798008 () Bool)

(assert (=> b!1409934 e!798008))

(declare-fun res!946975 () Bool)

(assert (=> b!1409934 (=> (not res!946975) (not e!798008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96426 (_ BitVec 32)) Bool)

(assert (=> b!1409934 (= res!946975 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47537 0))(
  ( (Unit!47538) )
))
(declare-fun lt!620879 () Unit!47537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47537)

(assert (=> b!1409934 (= lt!620879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409934 (= lt!620877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46554 a!2901) j!112) mask!2840) (select (arr!46554 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409935 () Bool)

(declare-fun res!946974 () Bool)

(assert (=> b!1409935 (=> (not res!946974) (not e!798011))))

(assert (=> b!1409935 (= res!946974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409936 () Bool)

(declare-fun res!946973 () Bool)

(assert (=> b!1409936 (=> (not res!946973) (not e!798011))))

(assert (=> b!1409936 (= res!946973 (validKeyInArray!0 (select (arr!46554 a!2901) j!112)))))

(declare-fun b!1409937 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96426 (_ BitVec 32)) SeekEntryResult!10768)

(assert (=> b!1409937 (= e!798008 (= (seekEntryOrOpen!0 (select (arr!46554 a!2901) j!112) a!2901 mask!2840) (Found!10768 j!112)))))

(assert (= (and start!121350 res!946971) b!1409933))

(assert (= (and b!1409933 res!946968) b!1409930))

(assert (= (and b!1409930 res!946972) b!1409936))

(assert (= (and b!1409936 res!946973) b!1409935))

(assert (= (and b!1409935 res!946974) b!1409932))

(assert (= (and b!1409932 res!946969) b!1409934))

(assert (= (and b!1409934 res!946975) b!1409937))

(assert (= (and b!1409934 (not res!946970)) b!1409931))

(declare-fun m!1299609 () Bool)

(assert (=> start!121350 m!1299609))

(declare-fun m!1299611 () Bool)

(assert (=> start!121350 m!1299611))

(declare-fun m!1299613 () Bool)

(assert (=> b!1409930 m!1299613))

(assert (=> b!1409930 m!1299613))

(declare-fun m!1299615 () Bool)

(assert (=> b!1409930 m!1299615))

(declare-fun m!1299617 () Bool)

(assert (=> b!1409935 m!1299617))

(declare-fun m!1299619 () Bool)

(assert (=> b!1409931 m!1299619))

(declare-fun m!1299621 () Bool)

(assert (=> b!1409931 m!1299621))

(assert (=> b!1409931 m!1299621))

(declare-fun m!1299623 () Bool)

(assert (=> b!1409931 m!1299623))

(assert (=> b!1409931 m!1299623))

(assert (=> b!1409931 m!1299621))

(declare-fun m!1299625 () Bool)

(assert (=> b!1409931 m!1299625))

(declare-fun m!1299627 () Bool)

(assert (=> b!1409936 m!1299627))

(assert (=> b!1409936 m!1299627))

(declare-fun m!1299629 () Bool)

(assert (=> b!1409936 m!1299629))

(declare-fun m!1299631 () Bool)

(assert (=> b!1409932 m!1299631))

(assert (=> b!1409937 m!1299627))

(assert (=> b!1409937 m!1299627))

(declare-fun m!1299633 () Bool)

(assert (=> b!1409937 m!1299633))

(assert (=> b!1409934 m!1299627))

(declare-fun m!1299635 () Bool)

(assert (=> b!1409934 m!1299635))

(assert (=> b!1409934 m!1299627))

(declare-fun m!1299637 () Bool)

(assert (=> b!1409934 m!1299637))

(assert (=> b!1409934 m!1299635))

(assert (=> b!1409934 m!1299627))

(declare-fun m!1299639 () Bool)

(assert (=> b!1409934 m!1299639))

(declare-fun m!1299641 () Bool)

(assert (=> b!1409934 m!1299641))

(push 1)

(assert (not b!1409931))

(assert (not b!1409934))

(assert (not b!1409937))

(assert (not b!1409936))

(assert (not b!1409930))

(assert (not b!1409935))

(assert (not b!1409932))

(assert (not start!121350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

