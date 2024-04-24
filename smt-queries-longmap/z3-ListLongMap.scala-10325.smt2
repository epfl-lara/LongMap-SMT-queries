; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121622 () Bool)

(assert start!121622)

(declare-fun b!1412019 () Bool)

(declare-fun e!799149 () Bool)

(declare-fun e!799150 () Bool)

(assert (=> b!1412019 (= e!799149 (not e!799150))))

(declare-fun res!948567 () Bool)

(assert (=> b!1412019 (=> res!948567 e!799150)))

(declare-datatypes ((SeekEntryResult!10823 0))(
  ( (MissingZero!10823 (index!45669 (_ BitVec 32))) (Found!10823 (index!45670 (_ BitVec 32))) (Intermediate!10823 (undefined!11635 Bool) (index!45671 (_ BitVec 32)) (x!127421 (_ BitVec 32))) (Undefined!10823) (MissingVacant!10823 (index!45672 (_ BitVec 32))) )
))
(declare-fun lt!621776 () SeekEntryResult!10823)

(get-info :version)

(assert (=> b!1412019 (= res!948567 (or (not ((_ is Intermediate!10823) lt!621776)) (undefined!11635 lt!621776)))))

(declare-fun e!799151 () Bool)

(assert (=> b!1412019 e!799151))

(declare-fun res!948564 () Bool)

(assert (=> b!1412019 (=> (not res!948564) (not e!799151))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96545 0))(
  ( (array!96546 (arr!46609 (Array (_ BitVec 32) (_ BitVec 64))) (size!47160 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96545)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96545 (_ BitVec 32)) Bool)

(assert (=> b!1412019 (= res!948564 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47647 0))(
  ( (Unit!47648) )
))
(declare-fun lt!621780 () Unit!47647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47647)

(assert (=> b!1412019 (= lt!621780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621778 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96545 (_ BitVec 32)) SeekEntryResult!10823)

(assert (=> b!1412019 (= lt!621776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621778 (select (arr!46609 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412019 (= lt!621778 (toIndex!0 (select (arr!46609 a!2901) j!112) mask!2840))))

(declare-fun b!1412020 () Bool)

(declare-fun res!948569 () Bool)

(assert (=> b!1412020 (=> (not res!948569) (not e!799149))))

(assert (=> b!1412020 (= res!948569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412021 () Bool)

(declare-fun res!948571 () Bool)

(assert (=> b!1412021 (=> (not res!948571) (not e!799149))))

(declare-datatypes ((List!33115 0))(
  ( (Nil!33112) (Cons!33111 (h!34391 (_ BitVec 64)) (t!47801 List!33115)) )
))
(declare-fun arrayNoDuplicates!0 (array!96545 (_ BitVec 32) List!33115) Bool)

(assert (=> b!1412021 (= res!948571 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33112))))

(declare-fun lt!621779 () array!96545)

(declare-fun lt!621781 () SeekEntryResult!10823)

(declare-fun lt!621777 () (_ BitVec 64))

(declare-fun b!1412022 () Bool)

(declare-fun e!799154 () Bool)

(assert (=> b!1412022 (= e!799154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621778 lt!621777 lt!621779 mask!2840) lt!621781))))

(declare-fun b!1412023 () Bool)

(declare-fun e!799152 () Bool)

(assert (=> b!1412023 (= e!799152 e!799154)))

(declare-fun res!948562 () Bool)

(assert (=> b!1412023 (=> res!948562 e!799154)))

(declare-fun lt!621782 () SeekEntryResult!10823)

(assert (=> b!1412023 (= res!948562 (not (= lt!621782 lt!621781)))))

(assert (=> b!1412023 (= lt!621781 (Intermediate!10823 (undefined!11635 lt!621782) (index!45671 lt!621782) (x!127421 lt!621782)))))

(declare-fun b!1412024 () Bool)

(declare-fun res!948565 () Bool)

(assert (=> b!1412024 (=> (not res!948565) (not e!799149))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412024 (= res!948565 (and (= (size!47160 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47160 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47160 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412025 () Bool)

(assert (=> b!1412025 (= e!799150 e!799152)))

(declare-fun res!948563 () Bool)

(assert (=> b!1412025 (=> res!948563 e!799152)))

(assert (=> b!1412025 (= res!948563 (or (= lt!621776 lt!621782) (not ((_ is Intermediate!10823) lt!621782)) (bvslt (x!127421 lt!621776) #b00000000000000000000000000000000) (bvsgt (x!127421 lt!621776) #b01111111111111111111111111111110) (bvslt lt!621778 #b00000000000000000000000000000000) (bvsge lt!621778 (size!47160 a!2901)) (bvslt (index!45671 lt!621776) #b00000000000000000000000000000000) (bvsge (index!45671 lt!621776) (size!47160 a!2901)) (not (= lt!621776 (Intermediate!10823 false (index!45671 lt!621776) (x!127421 lt!621776))))))))

(assert (=> b!1412025 (= lt!621782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621777 mask!2840) lt!621777 lt!621779 mask!2840))))

(assert (=> b!1412025 (= lt!621777 (select (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412025 (= lt!621779 (array!96546 (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47160 a!2901)))))

(declare-fun res!948566 () Bool)

(assert (=> start!121622 (=> (not res!948566) (not e!799149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121622 (= res!948566 (validMask!0 mask!2840))))

(assert (=> start!121622 e!799149))

(assert (=> start!121622 true))

(declare-fun array_inv!35890 (array!96545) Bool)

(assert (=> start!121622 (array_inv!35890 a!2901)))

(declare-fun b!1412026 () Bool)

(declare-fun res!948570 () Bool)

(assert (=> b!1412026 (=> (not res!948570) (not e!799149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412026 (= res!948570 (validKeyInArray!0 (select (arr!46609 a!2901) i!1037)))))

(declare-fun b!1412027 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96545 (_ BitVec 32)) SeekEntryResult!10823)

(assert (=> b!1412027 (= e!799151 (= (seekEntryOrOpen!0 (select (arr!46609 a!2901) j!112) a!2901 mask!2840) (Found!10823 j!112)))))

(declare-fun b!1412028 () Bool)

(declare-fun res!948568 () Bool)

(assert (=> b!1412028 (=> (not res!948568) (not e!799149))))

(assert (=> b!1412028 (= res!948568 (validKeyInArray!0 (select (arr!46609 a!2901) j!112)))))

(assert (= (and start!121622 res!948566) b!1412024))

(assert (= (and b!1412024 res!948565) b!1412026))

(assert (= (and b!1412026 res!948570) b!1412028))

(assert (= (and b!1412028 res!948568) b!1412020))

(assert (= (and b!1412020 res!948569) b!1412021))

(assert (= (and b!1412021 res!948571) b!1412019))

(assert (= (and b!1412019 res!948564) b!1412027))

(assert (= (and b!1412019 (not res!948567)) b!1412025))

(assert (= (and b!1412025 (not res!948563)) b!1412023))

(assert (= (and b!1412023 (not res!948562)) b!1412022))

(declare-fun m!1301941 () Bool)

(assert (=> b!1412026 m!1301941))

(assert (=> b!1412026 m!1301941))

(declare-fun m!1301943 () Bool)

(assert (=> b!1412026 m!1301943))

(declare-fun m!1301945 () Bool)

(assert (=> b!1412027 m!1301945))

(assert (=> b!1412027 m!1301945))

(declare-fun m!1301947 () Bool)

(assert (=> b!1412027 m!1301947))

(assert (=> b!1412028 m!1301945))

(assert (=> b!1412028 m!1301945))

(declare-fun m!1301949 () Bool)

(assert (=> b!1412028 m!1301949))

(declare-fun m!1301951 () Bool)

(assert (=> b!1412025 m!1301951))

(assert (=> b!1412025 m!1301951))

(declare-fun m!1301953 () Bool)

(assert (=> b!1412025 m!1301953))

(declare-fun m!1301955 () Bool)

(assert (=> b!1412025 m!1301955))

(declare-fun m!1301957 () Bool)

(assert (=> b!1412025 m!1301957))

(declare-fun m!1301959 () Bool)

(assert (=> start!121622 m!1301959))

(declare-fun m!1301961 () Bool)

(assert (=> start!121622 m!1301961))

(assert (=> b!1412019 m!1301945))

(declare-fun m!1301963 () Bool)

(assert (=> b!1412019 m!1301963))

(declare-fun m!1301965 () Bool)

(assert (=> b!1412019 m!1301965))

(assert (=> b!1412019 m!1301945))

(declare-fun m!1301967 () Bool)

(assert (=> b!1412019 m!1301967))

(assert (=> b!1412019 m!1301945))

(declare-fun m!1301969 () Bool)

(assert (=> b!1412019 m!1301969))

(declare-fun m!1301971 () Bool)

(assert (=> b!1412021 m!1301971))

(declare-fun m!1301973 () Bool)

(assert (=> b!1412022 m!1301973))

(declare-fun m!1301975 () Bool)

(assert (=> b!1412020 m!1301975))

(check-sat (not b!1412025) (not b!1412020) (not b!1412019) (not start!121622) (not b!1412026) (not b!1412028) (not b!1412027) (not b!1412022) (not b!1412021))
(check-sat)
