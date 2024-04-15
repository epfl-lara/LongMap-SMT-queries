; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121418 () Bool)

(assert start!121418)

(declare-fun b!1410650 () Bool)

(declare-fun res!947930 () Bool)

(declare-fun e!798296 () Bool)

(assert (=> b!1410650 (=> (not res!947930) (not e!798296))))

(declare-datatypes ((array!96372 0))(
  ( (array!96373 (arr!46525 (Array (_ BitVec 32) (_ BitVec 64))) (size!47077 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96372)

(declare-datatypes ((List!33122 0))(
  ( (Nil!33119) (Cons!33118 (h!34390 (_ BitVec 64)) (t!47808 List!33122)) )
))
(declare-fun arrayNoDuplicates!0 (array!96372 (_ BitVec 32) List!33122) Bool)

(assert (=> b!1410650 (= res!947930 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33119))))

(declare-fun e!798298 () Bool)

(declare-fun b!1410651 () Bool)

(declare-fun lt!621121 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10862 0))(
  ( (MissingZero!10862 (index!45825 (_ BitVec 32))) (Found!10862 (index!45826 (_ BitVec 32))) (Intermediate!10862 (undefined!11674 Bool) (index!45827 (_ BitVec 32)) (x!127422 (_ BitVec 32))) (Undefined!10862) (MissingVacant!10862 (index!45828 (_ BitVec 32))) )
))
(declare-fun lt!621119 () SeekEntryResult!10862)

(declare-fun lt!621122 () SeekEntryResult!10862)

(get-info :version)

(assert (=> b!1410651 (= e!798298 (or (= lt!621122 lt!621119) (not ((_ is Intermediate!10862) lt!621119)) (bvslt (x!127422 lt!621122) #b00000000000000000000000000000000) (bvsgt (x!127422 lt!621122) #b01111111111111111111111111111110) (bvslt lt!621121 #b00000000000000000000000000000000) (bvsge lt!621121 (size!47077 a!2901)) (bvslt (index!45827 lt!621122) #b00000000000000000000000000000000) (bvsge (index!45827 lt!621122) (size!47077 a!2901)) (not (= lt!621122 (Intermediate!10862 false (index!45827 lt!621122) (x!127422 lt!621122)))) (= lt!621119 (Intermediate!10862 (undefined!11674 lt!621119) (index!45827 lt!621119) (x!127422 lt!621119)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96372 (_ BitVec 32)) SeekEntryResult!10862)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410651 (= lt!621119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96373 (store (arr!46525 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47077 a!2901)) mask!2840))))

(declare-fun e!798297 () Bool)

(declare-fun b!1410652 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96372 (_ BitVec 32)) SeekEntryResult!10862)

(assert (=> b!1410652 (= e!798297 (= (seekEntryOrOpen!0 (select (arr!46525 a!2901) j!112) a!2901 mask!2840) (Found!10862 j!112)))))

(declare-fun res!947932 () Bool)

(assert (=> start!121418 (=> (not res!947932) (not e!798296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121418 (= res!947932 (validMask!0 mask!2840))))

(assert (=> start!121418 e!798296))

(assert (=> start!121418 true))

(declare-fun array_inv!35758 (array!96372) Bool)

(assert (=> start!121418 (array_inv!35758 a!2901)))

(declare-fun b!1410653 () Bool)

(declare-fun res!947928 () Bool)

(assert (=> b!1410653 (=> (not res!947928) (not e!798296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96372 (_ BitVec 32)) Bool)

(assert (=> b!1410653 (= res!947928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410654 () Bool)

(assert (=> b!1410654 (= e!798296 (not e!798298))))

(declare-fun res!947934 () Bool)

(assert (=> b!1410654 (=> res!947934 e!798298)))

(assert (=> b!1410654 (= res!947934 (or (not ((_ is Intermediate!10862) lt!621122)) (undefined!11674 lt!621122)))))

(assert (=> b!1410654 e!798297))

(declare-fun res!947935 () Bool)

(assert (=> b!1410654 (=> (not res!947935) (not e!798297))))

(assert (=> b!1410654 (= res!947935 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47541 0))(
  ( (Unit!47542) )
))
(declare-fun lt!621120 () Unit!47541)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47541)

(assert (=> b!1410654 (= lt!621120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410654 (= lt!621122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621121 (select (arr!46525 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410654 (= lt!621121 (toIndex!0 (select (arr!46525 a!2901) j!112) mask!2840))))

(declare-fun b!1410655 () Bool)

(declare-fun res!947933 () Bool)

(assert (=> b!1410655 (=> (not res!947933) (not e!798296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410655 (= res!947933 (validKeyInArray!0 (select (arr!46525 a!2901) i!1037)))))

(declare-fun b!1410656 () Bool)

(declare-fun res!947929 () Bool)

(assert (=> b!1410656 (=> (not res!947929) (not e!798296))))

(assert (=> b!1410656 (= res!947929 (validKeyInArray!0 (select (arr!46525 a!2901) j!112)))))

(declare-fun b!1410657 () Bool)

(declare-fun res!947931 () Bool)

(assert (=> b!1410657 (=> (not res!947931) (not e!798296))))

(assert (=> b!1410657 (= res!947931 (and (= (size!47077 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47077 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47077 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121418 res!947932) b!1410657))

(assert (= (and b!1410657 res!947931) b!1410655))

(assert (= (and b!1410655 res!947933) b!1410656))

(assert (= (and b!1410656 res!947929) b!1410653))

(assert (= (and b!1410653 res!947928) b!1410650))

(assert (= (and b!1410650 res!947930) b!1410654))

(assert (= (and b!1410654 res!947935) b!1410652))

(assert (= (and b!1410654 (not res!947934)) b!1410651))

(declare-fun m!1299829 () Bool)

(assert (=> b!1410651 m!1299829))

(declare-fun m!1299831 () Bool)

(assert (=> b!1410651 m!1299831))

(assert (=> b!1410651 m!1299831))

(declare-fun m!1299833 () Bool)

(assert (=> b!1410651 m!1299833))

(assert (=> b!1410651 m!1299833))

(assert (=> b!1410651 m!1299831))

(declare-fun m!1299835 () Bool)

(assert (=> b!1410651 m!1299835))

(declare-fun m!1299837 () Bool)

(assert (=> start!121418 m!1299837))

(declare-fun m!1299839 () Bool)

(assert (=> start!121418 m!1299839))

(declare-fun m!1299841 () Bool)

(assert (=> b!1410652 m!1299841))

(assert (=> b!1410652 m!1299841))

(declare-fun m!1299843 () Bool)

(assert (=> b!1410652 m!1299843))

(declare-fun m!1299845 () Bool)

(assert (=> b!1410653 m!1299845))

(declare-fun m!1299847 () Bool)

(assert (=> b!1410650 m!1299847))

(declare-fun m!1299849 () Bool)

(assert (=> b!1410655 m!1299849))

(assert (=> b!1410655 m!1299849))

(declare-fun m!1299851 () Bool)

(assert (=> b!1410655 m!1299851))

(assert (=> b!1410656 m!1299841))

(assert (=> b!1410656 m!1299841))

(declare-fun m!1299853 () Bool)

(assert (=> b!1410656 m!1299853))

(assert (=> b!1410654 m!1299841))

(declare-fun m!1299855 () Bool)

(assert (=> b!1410654 m!1299855))

(assert (=> b!1410654 m!1299841))

(assert (=> b!1410654 m!1299841))

(declare-fun m!1299857 () Bool)

(assert (=> b!1410654 m!1299857))

(declare-fun m!1299859 () Bool)

(assert (=> b!1410654 m!1299859))

(declare-fun m!1299861 () Bool)

(assert (=> b!1410654 m!1299861))

(check-sat (not b!1410653) (not b!1410655) (not b!1410654) (not b!1410656) (not b!1410652) (not start!121418) (not b!1410651) (not b!1410650))
(check-sat)
