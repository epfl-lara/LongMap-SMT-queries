; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121610 () Bool)

(assert start!121610)

(declare-fun b!1412766 () Bool)

(declare-fun res!949757 () Bool)

(declare-fun e!799501 () Bool)

(assert (=> b!1412766 (=> (not res!949757) (not e!799501))))

(declare-datatypes ((array!96548 0))(
  ( (array!96549 (arr!46611 (Array (_ BitVec 32) (_ BitVec 64))) (size!47161 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96548)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412766 (= res!949757 (validKeyInArray!0 (select (arr!46611 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622566 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10922 0))(
  ( (MissingZero!10922 (index!46068 (_ BitVec 32))) (Found!10922 (index!46069 (_ BitVec 32))) (Intermediate!10922 (undefined!11734 Bool) (index!46070 (_ BitVec 32)) (x!127657 (_ BitVec 32))) (Undefined!10922) (MissingVacant!10922 (index!46071 (_ BitVec 32))) )
))
(declare-fun lt!622565 () SeekEntryResult!10922)

(declare-fun b!1412767 () Bool)

(declare-fun e!799498 () Bool)

(declare-fun lt!622564 () array!96548)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96548 (_ BitVec 32)) SeekEntryResult!10922)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96548 (_ BitVec 32)) SeekEntryResult!10922)

(assert (=> b!1412767 (= e!799498 (= (seekEntryOrOpen!0 lt!622566 lt!622564 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127657 lt!622565) (index!46070 lt!622565) (index!46070 lt!622565) (select (arr!46611 a!2901) j!112) lt!622564 mask!2840)))))

(declare-fun b!1412768 () Bool)

(declare-fun res!949765 () Bool)

(assert (=> b!1412768 (=> (not res!949765) (not e!799501))))

(declare-datatypes ((List!33130 0))(
  ( (Nil!33127) (Cons!33126 (h!34401 (_ BitVec 64)) (t!47824 List!33130)) )
))
(declare-fun arrayNoDuplicates!0 (array!96548 (_ BitVec 32) List!33130) Bool)

(assert (=> b!1412768 (= res!949765 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33127))))

(declare-fun b!1412769 () Bool)

(declare-fun e!799499 () Bool)

(assert (=> b!1412769 (= e!799499 (= (seekEntryOrOpen!0 (select (arr!46611 a!2901) j!112) a!2901 mask!2840) (Found!10922 j!112)))))

(declare-fun res!949759 () Bool)

(assert (=> start!121610 (=> (not res!949759) (not e!799501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121610 (= res!949759 (validMask!0 mask!2840))))

(assert (=> start!121610 e!799501))

(assert (=> start!121610 true))

(declare-fun array_inv!35639 (array!96548) Bool)

(assert (=> start!121610 (array_inv!35639 a!2901)))

(declare-fun b!1412770 () Bool)

(declare-fun e!799497 () Bool)

(assert (=> b!1412770 (= e!799501 (not e!799497))))

(declare-fun res!949760 () Bool)

(assert (=> b!1412770 (=> res!949760 e!799497)))

(declare-fun lt!622569 () SeekEntryResult!10922)

(get-info :version)

(assert (=> b!1412770 (= res!949760 (or (not ((_ is Intermediate!10922) lt!622569)) (undefined!11734 lt!622569)))))

(assert (=> b!1412770 e!799499))

(declare-fun res!949761 () Bool)

(assert (=> b!1412770 (=> (not res!949761) (not e!799499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96548 (_ BitVec 32)) Bool)

(assert (=> b!1412770 (= res!949761 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47818 0))(
  ( (Unit!47819) )
))
(declare-fun lt!622568 () Unit!47818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47818)

(assert (=> b!1412770 (= lt!622568 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622567 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96548 (_ BitVec 32)) SeekEntryResult!10922)

(assert (=> b!1412770 (= lt!622569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622567 (select (arr!46611 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412770 (= lt!622567 (toIndex!0 (select (arr!46611 a!2901) j!112) mask!2840))))

(declare-fun b!1412771 () Bool)

(declare-fun res!949756 () Bool)

(assert (=> b!1412771 (=> (not res!949756) (not e!799501))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412771 (= res!949756 (validKeyInArray!0 (select (arr!46611 a!2901) i!1037)))))

(declare-fun b!1412772 () Bool)

(declare-fun res!949763 () Bool)

(assert (=> b!1412772 (=> (not res!949763) (not e!799501))))

(assert (=> b!1412772 (= res!949763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412773 () Bool)

(declare-fun e!799502 () Bool)

(assert (=> b!1412773 (= e!799502 true)))

(assert (=> b!1412773 e!799498))

(declare-fun res!949764 () Bool)

(assert (=> b!1412773 (=> (not res!949764) (not e!799498))))

(assert (=> b!1412773 (= res!949764 (and (not (undefined!11734 lt!622565)) (= (index!46070 lt!622565) i!1037) (bvslt (x!127657 lt!622565) (x!127657 lt!622569)) (= (select (store (arr!46611 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46070 lt!622565)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622563 () Unit!47818)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47818)

(assert (=> b!1412773 (= lt!622563 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622567 (x!127657 lt!622569) (index!46070 lt!622569) (x!127657 lt!622565) (index!46070 lt!622565) (undefined!11734 lt!622565) mask!2840))))

(declare-fun b!1412774 () Bool)

(assert (=> b!1412774 (= e!799497 e!799502)))

(declare-fun res!949762 () Bool)

(assert (=> b!1412774 (=> res!949762 e!799502)))

(assert (=> b!1412774 (= res!949762 (or (= lt!622569 lt!622565) (not ((_ is Intermediate!10922) lt!622565))))))

(assert (=> b!1412774 (= lt!622565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622566 mask!2840) lt!622566 lt!622564 mask!2840))))

(assert (=> b!1412774 (= lt!622566 (select (store (arr!46611 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412774 (= lt!622564 (array!96549 (store (arr!46611 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47161 a!2901)))))

(declare-fun b!1412775 () Bool)

(declare-fun res!949758 () Bool)

(assert (=> b!1412775 (=> (not res!949758) (not e!799501))))

(assert (=> b!1412775 (= res!949758 (and (= (size!47161 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47161 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47161 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121610 res!949759) b!1412775))

(assert (= (and b!1412775 res!949758) b!1412771))

(assert (= (and b!1412771 res!949756) b!1412766))

(assert (= (and b!1412766 res!949757) b!1412772))

(assert (= (and b!1412772 res!949763) b!1412768))

(assert (= (and b!1412768 res!949765) b!1412770))

(assert (= (and b!1412770 res!949761) b!1412769))

(assert (= (and b!1412770 (not res!949760)) b!1412774))

(assert (= (and b!1412774 (not res!949762)) b!1412773))

(assert (= (and b!1412773 res!949764) b!1412767))

(declare-fun m!1302921 () Bool)

(assert (=> b!1412770 m!1302921))

(declare-fun m!1302923 () Bool)

(assert (=> b!1412770 m!1302923))

(assert (=> b!1412770 m!1302921))

(declare-fun m!1302925 () Bool)

(assert (=> b!1412770 m!1302925))

(assert (=> b!1412770 m!1302921))

(declare-fun m!1302927 () Bool)

(assert (=> b!1412770 m!1302927))

(declare-fun m!1302929 () Bool)

(assert (=> b!1412770 m!1302929))

(assert (=> b!1412769 m!1302921))

(assert (=> b!1412769 m!1302921))

(declare-fun m!1302931 () Bool)

(assert (=> b!1412769 m!1302931))

(declare-fun m!1302933 () Bool)

(assert (=> b!1412767 m!1302933))

(assert (=> b!1412767 m!1302921))

(assert (=> b!1412767 m!1302921))

(declare-fun m!1302935 () Bool)

(assert (=> b!1412767 m!1302935))

(declare-fun m!1302937 () Bool)

(assert (=> start!121610 m!1302937))

(declare-fun m!1302939 () Bool)

(assert (=> start!121610 m!1302939))

(declare-fun m!1302941 () Bool)

(assert (=> b!1412768 m!1302941))

(declare-fun m!1302943 () Bool)

(assert (=> b!1412774 m!1302943))

(assert (=> b!1412774 m!1302943))

(declare-fun m!1302945 () Bool)

(assert (=> b!1412774 m!1302945))

(declare-fun m!1302947 () Bool)

(assert (=> b!1412774 m!1302947))

(declare-fun m!1302949 () Bool)

(assert (=> b!1412774 m!1302949))

(assert (=> b!1412766 m!1302921))

(assert (=> b!1412766 m!1302921))

(declare-fun m!1302951 () Bool)

(assert (=> b!1412766 m!1302951))

(declare-fun m!1302953 () Bool)

(assert (=> b!1412771 m!1302953))

(assert (=> b!1412771 m!1302953))

(declare-fun m!1302955 () Bool)

(assert (=> b!1412771 m!1302955))

(assert (=> b!1412773 m!1302947))

(declare-fun m!1302957 () Bool)

(assert (=> b!1412773 m!1302957))

(declare-fun m!1302959 () Bool)

(assert (=> b!1412773 m!1302959))

(declare-fun m!1302961 () Bool)

(assert (=> b!1412772 m!1302961))

(check-sat (not b!1412767) (not b!1412769) (not b!1412766) (not b!1412770) (not start!121610) (not b!1412773) (not b!1412771) (not b!1412768) (not b!1412774) (not b!1412772))
(check-sat)
