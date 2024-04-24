; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121628 () Bool)

(assert start!121628)

(declare-fun b!1412111 () Bool)

(declare-fun res!948659 () Bool)

(declare-fun e!799205 () Bool)

(assert (=> b!1412111 (=> (not res!948659) (not e!799205))))

(declare-datatypes ((array!96551 0))(
  ( (array!96552 (arr!46612 (Array (_ BitVec 32) (_ BitVec 64))) (size!47163 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96551)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412111 (= res!948659 (validKeyInArray!0 (select (arr!46612 a!2901) i!1037)))))

(declare-fun b!1412113 () Bool)

(declare-fun res!948664 () Bool)

(declare-fun e!799203 () Bool)

(assert (=> b!1412113 (=> res!948664 e!799203)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621840 () (_ BitVec 64))

(declare-fun lt!621841 () array!96551)

(declare-fun lt!621844 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10826 0))(
  ( (MissingZero!10826 (index!45681 (_ BitVec 32))) (Found!10826 (index!45682 (_ BitVec 32))) (Intermediate!10826 (undefined!11638 Bool) (index!45683 (_ BitVec 32)) (x!127432 (_ BitVec 32))) (Undefined!10826) (MissingVacant!10826 (index!45684 (_ BitVec 32))) )
))
(declare-fun lt!621843 () SeekEntryResult!10826)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96551 (_ BitVec 32)) SeekEntryResult!10826)

(assert (=> b!1412113 (= res!948664 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621844 lt!621840 lt!621841 mask!2840) lt!621843)))))

(declare-fun b!1412114 () Bool)

(declare-fun res!948658 () Bool)

(assert (=> b!1412114 (=> (not res!948658) (not e!799205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96551 (_ BitVec 32)) Bool)

(assert (=> b!1412114 (= res!948658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412115 () Bool)

(declare-fun e!799207 () Bool)

(declare-fun e!799204 () Bool)

(assert (=> b!1412115 (= e!799207 e!799204)))

(declare-fun res!948654 () Bool)

(assert (=> b!1412115 (=> res!948654 e!799204)))

(declare-fun lt!621839 () SeekEntryResult!10826)

(declare-fun lt!621842 () SeekEntryResult!10826)

(get-info :version)

(assert (=> b!1412115 (= res!948654 (or (= lt!621839 lt!621842) (not ((_ is Intermediate!10826) lt!621842)) (bvslt (x!127432 lt!621839) #b00000000000000000000000000000000) (bvsgt (x!127432 lt!621839) #b01111111111111111111111111111110) (bvslt lt!621844 #b00000000000000000000000000000000) (bvsge lt!621844 (size!47163 a!2901)) (bvslt (index!45683 lt!621839) #b00000000000000000000000000000000) (bvsge (index!45683 lt!621839) (size!47163 a!2901)) (not (= lt!621839 (Intermediate!10826 false (index!45683 lt!621839) (x!127432 lt!621839))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412115 (= lt!621842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621840 mask!2840) lt!621840 lt!621841 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412115 (= lt!621840 (select (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412115 (= lt!621841 (array!96552 (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47163 a!2901)))))

(declare-fun e!799208 () Bool)

(declare-fun b!1412116 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96551 (_ BitVec 32)) SeekEntryResult!10826)

(assert (=> b!1412116 (= e!799208 (= (seekEntryOrOpen!0 (select (arr!46612 a!2901) j!112) a!2901 mask!2840) (Found!10826 j!112)))))

(declare-fun b!1412117 () Bool)

(declare-fun res!948656 () Bool)

(assert (=> b!1412117 (=> (not res!948656) (not e!799205))))

(assert (=> b!1412117 (= res!948656 (and (= (size!47163 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47163 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47163 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412118 () Bool)

(assert (=> b!1412118 (= e!799203 (or (undefined!11638 lt!621842) (not (= (index!45683 lt!621839) (index!45683 lt!621842))) (not (= (x!127432 lt!621839) (x!127432 lt!621842)))))))

(declare-fun b!1412119 () Bool)

(declare-fun res!948657 () Bool)

(assert (=> b!1412119 (=> (not res!948657) (not e!799205))))

(declare-datatypes ((List!33118 0))(
  ( (Nil!33115) (Cons!33114 (h!34394 (_ BitVec 64)) (t!47804 List!33118)) )
))
(declare-fun arrayNoDuplicates!0 (array!96551 (_ BitVec 32) List!33118) Bool)

(assert (=> b!1412119 (= res!948657 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33115))))

(declare-fun b!1412120 () Bool)

(assert (=> b!1412120 (= e!799204 e!799203)))

(declare-fun res!948661 () Bool)

(assert (=> b!1412120 (=> res!948661 e!799203)))

(assert (=> b!1412120 (= res!948661 (not (= lt!621842 lt!621843)))))

(assert (=> b!1412120 (= lt!621843 (Intermediate!10826 (undefined!11638 lt!621842) (index!45683 lt!621842) (x!127432 lt!621842)))))

(declare-fun b!1412121 () Bool)

(assert (=> b!1412121 (= e!799205 (not e!799207))))

(declare-fun res!948660 () Bool)

(assert (=> b!1412121 (=> res!948660 e!799207)))

(assert (=> b!1412121 (= res!948660 (or (not ((_ is Intermediate!10826) lt!621839)) (undefined!11638 lt!621839)))))

(assert (=> b!1412121 e!799208))

(declare-fun res!948663 () Bool)

(assert (=> b!1412121 (=> (not res!948663) (not e!799208))))

(assert (=> b!1412121 (= res!948663 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47653 0))(
  ( (Unit!47654) )
))
(declare-fun lt!621845 () Unit!47653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47653)

(assert (=> b!1412121 (= lt!621845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412121 (= lt!621839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621844 (select (arr!46612 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412121 (= lt!621844 (toIndex!0 (select (arr!46612 a!2901) j!112) mask!2840))))

(declare-fun b!1412112 () Bool)

(declare-fun res!948662 () Bool)

(assert (=> b!1412112 (=> (not res!948662) (not e!799205))))

(assert (=> b!1412112 (= res!948662 (validKeyInArray!0 (select (arr!46612 a!2901) j!112)))))

(declare-fun res!948655 () Bool)

(assert (=> start!121628 (=> (not res!948655) (not e!799205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121628 (= res!948655 (validMask!0 mask!2840))))

(assert (=> start!121628 e!799205))

(assert (=> start!121628 true))

(declare-fun array_inv!35893 (array!96551) Bool)

(assert (=> start!121628 (array_inv!35893 a!2901)))

(assert (= (and start!121628 res!948655) b!1412117))

(assert (= (and b!1412117 res!948656) b!1412111))

(assert (= (and b!1412111 res!948659) b!1412112))

(assert (= (and b!1412112 res!948662) b!1412114))

(assert (= (and b!1412114 res!948658) b!1412119))

(assert (= (and b!1412119 res!948657) b!1412121))

(assert (= (and b!1412121 res!948663) b!1412116))

(assert (= (and b!1412121 (not res!948660)) b!1412115))

(assert (= (and b!1412115 (not res!948654)) b!1412120))

(assert (= (and b!1412120 (not res!948661)) b!1412113))

(assert (= (and b!1412113 (not res!948664)) b!1412118))

(declare-fun m!1302049 () Bool)

(assert (=> b!1412119 m!1302049))

(declare-fun m!1302051 () Bool)

(assert (=> b!1412121 m!1302051))

(declare-fun m!1302053 () Bool)

(assert (=> b!1412121 m!1302053))

(assert (=> b!1412121 m!1302051))

(declare-fun m!1302055 () Bool)

(assert (=> b!1412121 m!1302055))

(assert (=> b!1412121 m!1302051))

(declare-fun m!1302057 () Bool)

(assert (=> b!1412121 m!1302057))

(declare-fun m!1302059 () Bool)

(assert (=> b!1412121 m!1302059))

(declare-fun m!1302061 () Bool)

(assert (=> b!1412113 m!1302061))

(declare-fun m!1302063 () Bool)

(assert (=> start!121628 m!1302063))

(declare-fun m!1302065 () Bool)

(assert (=> start!121628 m!1302065))

(assert (=> b!1412116 m!1302051))

(assert (=> b!1412116 m!1302051))

(declare-fun m!1302067 () Bool)

(assert (=> b!1412116 m!1302067))

(declare-fun m!1302069 () Bool)

(assert (=> b!1412111 m!1302069))

(assert (=> b!1412111 m!1302069))

(declare-fun m!1302071 () Bool)

(assert (=> b!1412111 m!1302071))

(declare-fun m!1302073 () Bool)

(assert (=> b!1412114 m!1302073))

(assert (=> b!1412112 m!1302051))

(assert (=> b!1412112 m!1302051))

(declare-fun m!1302075 () Bool)

(assert (=> b!1412112 m!1302075))

(declare-fun m!1302077 () Bool)

(assert (=> b!1412115 m!1302077))

(assert (=> b!1412115 m!1302077))

(declare-fun m!1302079 () Bool)

(assert (=> b!1412115 m!1302079))

(declare-fun m!1302081 () Bool)

(assert (=> b!1412115 m!1302081))

(declare-fun m!1302083 () Bool)

(assert (=> b!1412115 m!1302083))

(check-sat (not b!1412113) (not b!1412112) (not b!1412116) (not b!1412121) (not b!1412114) (not start!121628) (not b!1412111) (not b!1412115) (not b!1412119))
(check-sat)
