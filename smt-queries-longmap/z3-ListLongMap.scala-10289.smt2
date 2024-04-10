; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120896 () Bool)

(assert start!120896)

(declare-fun b!1406696 () Bool)

(declare-fun res!944920 () Bool)

(declare-fun e!796169 () Bool)

(assert (=> b!1406696 (=> (not res!944920) (not e!796169))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96203 0))(
  ( (array!96204 (arr!46449 (Array (_ BitVec 32) (_ BitVec 64))) (size!46999 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96203)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406696 (= res!944920 (and (= (size!46999 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46999 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46999 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406697 () Bool)

(declare-fun res!944918 () Bool)

(assert (=> b!1406697 (=> (not res!944918) (not e!796169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96203 (_ BitVec 32)) Bool)

(assert (=> b!1406697 (= res!944918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406698 () Bool)

(declare-fun e!796170 () Bool)

(assert (=> b!1406698 (= e!796170 true)))

(declare-datatypes ((SeekEntryResult!10760 0))(
  ( (MissingZero!10760 (index!45417 (_ BitVec 32))) (Found!10760 (index!45418 (_ BitVec 32))) (Intermediate!10760 (undefined!11572 Bool) (index!45419 (_ BitVec 32)) (x!127015 (_ BitVec 32))) (Undefined!10760) (MissingVacant!10760 (index!45420 (_ BitVec 32))) )
))
(declare-fun lt!619482 () SeekEntryResult!10760)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96203 (_ BitVec 32)) SeekEntryResult!10760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406698 (= lt!619482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46449 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46449 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96204 (store (arr!46449 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46999 a!2901)) mask!2840))))

(declare-fun b!1406700 () Bool)

(assert (=> b!1406700 (= e!796169 (not e!796170))))

(declare-fun res!944916 () Bool)

(assert (=> b!1406700 (=> res!944916 e!796170)))

(declare-fun lt!619480 () SeekEntryResult!10760)

(get-info :version)

(assert (=> b!1406700 (= res!944916 (or (not ((_ is Intermediate!10760) lt!619480)) (undefined!11572 lt!619480)))))

(declare-fun e!796171 () Bool)

(assert (=> b!1406700 e!796171))

(declare-fun res!944915 () Bool)

(assert (=> b!1406700 (=> (not res!944915) (not e!796171))))

(assert (=> b!1406700 (= res!944915 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47494 0))(
  ( (Unit!47495) )
))
(declare-fun lt!619481 () Unit!47494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47494)

(assert (=> b!1406700 (= lt!619481 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406700 (= lt!619480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46449 a!2901) j!112) mask!2840) (select (arr!46449 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406701 () Bool)

(declare-fun res!944919 () Bool)

(assert (=> b!1406701 (=> (not res!944919) (not e!796169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406701 (= res!944919 (validKeyInArray!0 (select (arr!46449 a!2901) j!112)))))

(declare-fun b!1406702 () Bool)

(declare-fun res!944917 () Bool)

(assert (=> b!1406702 (=> (not res!944917) (not e!796169))))

(assert (=> b!1406702 (= res!944917 (validKeyInArray!0 (select (arr!46449 a!2901) i!1037)))))

(declare-fun b!1406703 () Bool)

(declare-fun res!944913 () Bool)

(assert (=> b!1406703 (=> (not res!944913) (not e!796169))))

(declare-datatypes ((List!32968 0))(
  ( (Nil!32965) (Cons!32964 (h!34218 (_ BitVec 64)) (t!47662 List!32968)) )
))
(declare-fun arrayNoDuplicates!0 (array!96203 (_ BitVec 32) List!32968) Bool)

(assert (=> b!1406703 (= res!944913 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32965))))

(declare-fun res!944914 () Bool)

(assert (=> start!120896 (=> (not res!944914) (not e!796169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120896 (= res!944914 (validMask!0 mask!2840))))

(assert (=> start!120896 e!796169))

(assert (=> start!120896 true))

(declare-fun array_inv!35477 (array!96203) Bool)

(assert (=> start!120896 (array_inv!35477 a!2901)))

(declare-fun b!1406699 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96203 (_ BitVec 32)) SeekEntryResult!10760)

(assert (=> b!1406699 (= e!796171 (= (seekEntryOrOpen!0 (select (arr!46449 a!2901) j!112) a!2901 mask!2840) (Found!10760 j!112)))))

(assert (= (and start!120896 res!944914) b!1406696))

(assert (= (and b!1406696 res!944920) b!1406702))

(assert (= (and b!1406702 res!944917) b!1406701))

(assert (= (and b!1406701 res!944919) b!1406697))

(assert (= (and b!1406697 res!944918) b!1406703))

(assert (= (and b!1406703 res!944913) b!1406700))

(assert (= (and b!1406700 res!944915) b!1406699))

(assert (= (and b!1406700 (not res!944916)) b!1406698))

(declare-fun m!1295947 () Bool)

(assert (=> b!1406702 m!1295947))

(assert (=> b!1406702 m!1295947))

(declare-fun m!1295949 () Bool)

(assert (=> b!1406702 m!1295949))

(declare-fun m!1295951 () Bool)

(assert (=> b!1406701 m!1295951))

(assert (=> b!1406701 m!1295951))

(declare-fun m!1295953 () Bool)

(assert (=> b!1406701 m!1295953))

(declare-fun m!1295955 () Bool)

(assert (=> b!1406698 m!1295955))

(declare-fun m!1295957 () Bool)

(assert (=> b!1406698 m!1295957))

(assert (=> b!1406698 m!1295957))

(declare-fun m!1295959 () Bool)

(assert (=> b!1406698 m!1295959))

(assert (=> b!1406698 m!1295959))

(assert (=> b!1406698 m!1295957))

(declare-fun m!1295961 () Bool)

(assert (=> b!1406698 m!1295961))

(assert (=> b!1406700 m!1295951))

(declare-fun m!1295963 () Bool)

(assert (=> b!1406700 m!1295963))

(assert (=> b!1406700 m!1295951))

(declare-fun m!1295965 () Bool)

(assert (=> b!1406700 m!1295965))

(assert (=> b!1406700 m!1295963))

(assert (=> b!1406700 m!1295951))

(declare-fun m!1295967 () Bool)

(assert (=> b!1406700 m!1295967))

(declare-fun m!1295969 () Bool)

(assert (=> b!1406700 m!1295969))

(assert (=> b!1406699 m!1295951))

(assert (=> b!1406699 m!1295951))

(declare-fun m!1295971 () Bool)

(assert (=> b!1406699 m!1295971))

(declare-fun m!1295973 () Bool)

(assert (=> start!120896 m!1295973))

(declare-fun m!1295975 () Bool)

(assert (=> start!120896 m!1295975))

(declare-fun m!1295977 () Bool)

(assert (=> b!1406703 m!1295977))

(declare-fun m!1295979 () Bool)

(assert (=> b!1406697 m!1295979))

(check-sat (not start!120896) (not b!1406702) (not b!1406703) (not b!1406697) (not b!1406701) (not b!1406699) (not b!1406698) (not b!1406700))
