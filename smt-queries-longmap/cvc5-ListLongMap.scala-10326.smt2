; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121440 () Bool)

(assert start!121440)

(declare-fun b!1410971 () Bool)

(declare-fun res!948203 () Bool)

(declare-fun e!798468 () Bool)

(assert (=> b!1410971 (=> (not res!948203) (not e!798468))))

(declare-datatypes ((array!96441 0))(
  ( (array!96442 (arr!46559 (Array (_ BitVec 32) (_ BitVec 64))) (size!47109 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96441)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96441 (_ BitVec 32)) Bool)

(assert (=> b!1410971 (= res!948203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410972 () Bool)

(declare-fun res!948208 () Bool)

(declare-fun e!798469 () Bool)

(assert (=> b!1410972 (=> res!948208 e!798469)))

(declare-fun lt!621445 () (_ BitVec 32))

(declare-fun lt!621444 () array!96441)

(declare-datatypes ((SeekEntryResult!10870 0))(
  ( (MissingZero!10870 (index!45857 (_ BitVec 32))) (Found!10870 (index!45858 (_ BitVec 32))) (Intermediate!10870 (undefined!11682 Bool) (index!45859 (_ BitVec 32)) (x!127457 (_ BitVec 32))) (Undefined!10870) (MissingVacant!10870 (index!45860 (_ BitVec 32))) )
))
(declare-fun lt!621446 () SeekEntryResult!10870)

(declare-fun lt!621443 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96441 (_ BitVec 32)) SeekEntryResult!10870)

(assert (=> b!1410972 (= res!948208 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621445 lt!621443 lt!621444 mask!2840) lt!621446)))))

(declare-fun b!1410974 () Bool)

(declare-fun lt!621442 () SeekEntryResult!10870)

(declare-fun lt!621441 () SeekEntryResult!10870)

(assert (=> b!1410974 (= e!798469 (or (undefined!11682 lt!621442) (not (= (index!45859 lt!621441) (index!45859 lt!621442))) (not (= (x!127457 lt!621441) (x!127457 lt!621442)))))))

(declare-fun b!1410975 () Bool)

(declare-fun res!948198 () Bool)

(assert (=> b!1410975 (=> (not res!948198) (not e!798468))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410975 (= res!948198 (validKeyInArray!0 (select (arr!46559 a!2901) j!112)))))

(declare-fun b!1410976 () Bool)

(declare-fun e!798470 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96441 (_ BitVec 32)) SeekEntryResult!10870)

(assert (=> b!1410976 (= e!798470 (= (seekEntryOrOpen!0 (select (arr!46559 a!2901) j!112) a!2901 mask!2840) (Found!10870 j!112)))))

(declare-fun res!948205 () Bool)

(assert (=> start!121440 (=> (not res!948205) (not e!798468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121440 (= res!948205 (validMask!0 mask!2840))))

(assert (=> start!121440 e!798468))

(assert (=> start!121440 true))

(declare-fun array_inv!35587 (array!96441) Bool)

(assert (=> start!121440 (array_inv!35587 a!2901)))

(declare-fun b!1410973 () Bool)

(declare-fun e!798465 () Bool)

(assert (=> b!1410973 (= e!798465 e!798469)))

(declare-fun res!948202 () Bool)

(assert (=> b!1410973 (=> res!948202 e!798469)))

(assert (=> b!1410973 (= res!948202 (not (= lt!621442 lt!621446)))))

(assert (=> b!1410973 (= lt!621446 (Intermediate!10870 (undefined!11682 lt!621442) (index!45859 lt!621442) (x!127457 lt!621442)))))

(declare-fun b!1410977 () Bool)

(declare-fun e!798467 () Bool)

(assert (=> b!1410977 (= e!798467 e!798465)))

(declare-fun res!948200 () Bool)

(assert (=> b!1410977 (=> res!948200 e!798465)))

(assert (=> b!1410977 (= res!948200 (or (= lt!621441 lt!621442) (not (is-Intermediate!10870 lt!621442)) (bvslt (x!127457 lt!621441) #b00000000000000000000000000000000) (bvsgt (x!127457 lt!621441) #b01111111111111111111111111111110) (bvslt lt!621445 #b00000000000000000000000000000000) (bvsge lt!621445 (size!47109 a!2901)) (bvslt (index!45859 lt!621441) #b00000000000000000000000000000000) (bvsge (index!45859 lt!621441) (size!47109 a!2901)) (not (= lt!621441 (Intermediate!10870 false (index!45859 lt!621441) (x!127457 lt!621441))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410977 (= lt!621442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621443 mask!2840) lt!621443 lt!621444 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410977 (= lt!621443 (select (store (arr!46559 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1410977 (= lt!621444 (array!96442 (store (arr!46559 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47109 a!2901)))))

(declare-fun b!1410978 () Bool)

(assert (=> b!1410978 (= e!798468 (not e!798467))))

(declare-fun res!948204 () Bool)

(assert (=> b!1410978 (=> res!948204 e!798467)))

(assert (=> b!1410978 (= res!948204 (or (not (is-Intermediate!10870 lt!621441)) (undefined!11682 lt!621441)))))

(assert (=> b!1410978 e!798470))

(declare-fun res!948201 () Bool)

(assert (=> b!1410978 (=> (not res!948201) (not e!798470))))

(assert (=> b!1410978 (= res!948201 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47714 0))(
  ( (Unit!47715) )
))
(declare-fun lt!621447 () Unit!47714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47714)

(assert (=> b!1410978 (= lt!621447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410978 (= lt!621441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621445 (select (arr!46559 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410978 (= lt!621445 (toIndex!0 (select (arr!46559 a!2901) j!112) mask!2840))))

(declare-fun b!1410979 () Bool)

(declare-fun res!948207 () Bool)

(assert (=> b!1410979 (=> (not res!948207) (not e!798468))))

(assert (=> b!1410979 (= res!948207 (and (= (size!47109 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47109 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47109 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410980 () Bool)

(declare-fun res!948199 () Bool)

(assert (=> b!1410980 (=> (not res!948199) (not e!798468))))

(declare-datatypes ((List!33078 0))(
  ( (Nil!33075) (Cons!33074 (h!34346 (_ BitVec 64)) (t!47772 List!33078)) )
))
(declare-fun arrayNoDuplicates!0 (array!96441 (_ BitVec 32) List!33078) Bool)

(assert (=> b!1410980 (= res!948199 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33075))))

(declare-fun b!1410981 () Bool)

(declare-fun res!948206 () Bool)

(assert (=> b!1410981 (=> (not res!948206) (not e!798468))))

(assert (=> b!1410981 (= res!948206 (validKeyInArray!0 (select (arr!46559 a!2901) i!1037)))))

(assert (= (and start!121440 res!948205) b!1410979))

(assert (= (and b!1410979 res!948207) b!1410981))

(assert (= (and b!1410981 res!948206) b!1410975))

(assert (= (and b!1410975 res!948198) b!1410971))

(assert (= (and b!1410971 res!948203) b!1410980))

(assert (= (and b!1410980 res!948199) b!1410978))

(assert (= (and b!1410978 res!948201) b!1410976))

(assert (= (and b!1410978 (not res!948204)) b!1410977))

(assert (= (and b!1410977 (not res!948200)) b!1410973))

(assert (= (and b!1410973 (not res!948202)) b!1410972))

(assert (= (and b!1410972 (not res!948208)) b!1410974))

(declare-fun m!1300677 () Bool)

(assert (=> b!1410978 m!1300677))

(declare-fun m!1300679 () Bool)

(assert (=> b!1410978 m!1300679))

(assert (=> b!1410978 m!1300677))

(declare-fun m!1300681 () Bool)

(assert (=> b!1410978 m!1300681))

(assert (=> b!1410978 m!1300677))

(declare-fun m!1300683 () Bool)

(assert (=> b!1410978 m!1300683))

(declare-fun m!1300685 () Bool)

(assert (=> b!1410978 m!1300685))

(declare-fun m!1300687 () Bool)

(assert (=> b!1410972 m!1300687))

(declare-fun m!1300689 () Bool)

(assert (=> start!121440 m!1300689))

(declare-fun m!1300691 () Bool)

(assert (=> start!121440 m!1300691))

(declare-fun m!1300693 () Bool)

(assert (=> b!1410971 m!1300693))

(declare-fun m!1300695 () Bool)

(assert (=> b!1410977 m!1300695))

(assert (=> b!1410977 m!1300695))

(declare-fun m!1300697 () Bool)

(assert (=> b!1410977 m!1300697))

(declare-fun m!1300699 () Bool)

(assert (=> b!1410977 m!1300699))

(declare-fun m!1300701 () Bool)

(assert (=> b!1410977 m!1300701))

(declare-fun m!1300703 () Bool)

(assert (=> b!1410980 m!1300703))

(assert (=> b!1410976 m!1300677))

(assert (=> b!1410976 m!1300677))

(declare-fun m!1300705 () Bool)

(assert (=> b!1410976 m!1300705))

(assert (=> b!1410975 m!1300677))

(assert (=> b!1410975 m!1300677))

(declare-fun m!1300707 () Bool)

(assert (=> b!1410975 m!1300707))

(declare-fun m!1300709 () Bool)

(assert (=> b!1410981 m!1300709))

(assert (=> b!1410981 m!1300709))

(declare-fun m!1300711 () Bool)

(assert (=> b!1410981 m!1300711))

(push 1)

