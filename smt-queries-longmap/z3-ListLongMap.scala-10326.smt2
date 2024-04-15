; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121436 () Bool)

(assert start!121436)

(declare-fun b!1410890 () Bool)

(declare-fun res!948172 () Bool)

(declare-fun e!798428 () Bool)

(assert (=> b!1410890 (=> (not res!948172) (not e!798428))))

(declare-datatypes ((array!96390 0))(
  ( (array!96391 (arr!46534 (Array (_ BitVec 32) (_ BitVec 64))) (size!47086 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96390)

(declare-datatypes ((List!33131 0))(
  ( (Nil!33128) (Cons!33127 (h!34399 (_ BitVec 64)) (t!47817 List!33131)) )
))
(declare-fun arrayNoDuplicates!0 (array!96390 (_ BitVec 32) List!33131) Bool)

(assert (=> b!1410890 (= res!948172 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33128))))

(declare-fun b!1410891 () Bool)

(declare-fun res!948175 () Bool)

(assert (=> b!1410891 (=> (not res!948175) (not e!798428))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410891 (= res!948175 (validKeyInArray!0 (select (arr!46534 a!2901) i!1037)))))

(declare-fun b!1410892 () Bool)

(declare-fun e!798429 () Bool)

(declare-datatypes ((SeekEntryResult!10871 0))(
  ( (MissingZero!10871 (index!45861 (_ BitVec 32))) (Found!10871 (index!45862 (_ BitVec 32))) (Intermediate!10871 (undefined!11683 Bool) (index!45863 (_ BitVec 32)) (x!127455 (_ BitVec 32))) (Undefined!10871) (MissingVacant!10871 (index!45864 (_ BitVec 32))) )
))
(declare-fun lt!621254 () SeekEntryResult!10871)

(declare-fun lt!621257 () SeekEntryResult!10871)

(assert (=> b!1410892 (= e!798429 (or (undefined!11683 lt!621254) (not (= (index!45863 lt!621257) (index!45863 lt!621254))) (not (= (x!127455 lt!621257) (x!127455 lt!621254)))))))

(declare-fun b!1410893 () Bool)

(declare-fun res!948169 () Bool)

(assert (=> b!1410893 (=> (not res!948169) (not e!798428))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410893 (= res!948169 (and (= (size!47086 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47086 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47086 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410894 () Bool)

(declare-fun e!798427 () Bool)

(assert (=> b!1410894 (= e!798428 (not e!798427))))

(declare-fun res!948173 () Bool)

(assert (=> b!1410894 (=> res!948173 e!798427)))

(get-info :version)

(assert (=> b!1410894 (= res!948173 (or (not ((_ is Intermediate!10871) lt!621257)) (undefined!11683 lt!621257)))))

(declare-fun e!798426 () Bool)

(assert (=> b!1410894 e!798426))

(declare-fun res!948177 () Bool)

(assert (=> b!1410894 (=> (not res!948177) (not e!798426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96390 (_ BitVec 32)) Bool)

(assert (=> b!1410894 (= res!948177 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47559 0))(
  ( (Unit!47560) )
))
(declare-fun lt!621253 () Unit!47559)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47559)

(assert (=> b!1410894 (= lt!621253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621252 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96390 (_ BitVec 32)) SeekEntryResult!10871)

(assert (=> b!1410894 (= lt!621257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621252 (select (arr!46534 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410894 (= lt!621252 (toIndex!0 (select (arr!46534 a!2901) j!112) mask!2840))))

(declare-fun b!1410895 () Bool)

(declare-fun res!948174 () Bool)

(assert (=> b!1410895 (=> (not res!948174) (not e!798428))))

(assert (=> b!1410895 (= res!948174 (validKeyInArray!0 (select (arr!46534 a!2901) j!112)))))

(declare-fun b!1410896 () Bool)

(declare-fun e!798431 () Bool)

(assert (=> b!1410896 (= e!798431 e!798429)))

(declare-fun res!948170 () Bool)

(assert (=> b!1410896 (=> res!948170 e!798429)))

(declare-fun lt!621256 () SeekEntryResult!10871)

(assert (=> b!1410896 (= res!948170 (not (= lt!621254 lt!621256)))))

(assert (=> b!1410896 (= lt!621256 (Intermediate!10871 (undefined!11683 lt!621254) (index!45863 lt!621254) (x!127455 lt!621254)))))

(declare-fun b!1410897 () Bool)

(declare-fun res!948168 () Bool)

(assert (=> b!1410897 (=> (not res!948168) (not e!798428))))

(assert (=> b!1410897 (= res!948168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410898 () Bool)

(declare-fun res!948176 () Bool)

(assert (=> b!1410898 (=> res!948176 e!798429)))

(declare-fun lt!621255 () (_ BitVec 64))

(declare-fun lt!621251 () array!96390)

(assert (=> b!1410898 (= res!948176 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621252 lt!621255 lt!621251 mask!2840) lt!621256)))))

(declare-fun res!948171 () Bool)

(assert (=> start!121436 (=> (not res!948171) (not e!798428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121436 (= res!948171 (validMask!0 mask!2840))))

(assert (=> start!121436 e!798428))

(assert (=> start!121436 true))

(declare-fun array_inv!35767 (array!96390) Bool)

(assert (=> start!121436 (array_inv!35767 a!2901)))

(declare-fun b!1410899 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96390 (_ BitVec 32)) SeekEntryResult!10871)

(assert (=> b!1410899 (= e!798426 (= (seekEntryOrOpen!0 (select (arr!46534 a!2901) j!112) a!2901 mask!2840) (Found!10871 j!112)))))

(declare-fun b!1410900 () Bool)

(assert (=> b!1410900 (= e!798427 e!798431)))

(declare-fun res!948178 () Bool)

(assert (=> b!1410900 (=> res!948178 e!798431)))

(assert (=> b!1410900 (= res!948178 (or (= lt!621257 lt!621254) (not ((_ is Intermediate!10871) lt!621254)) (bvslt (x!127455 lt!621257) #b00000000000000000000000000000000) (bvsgt (x!127455 lt!621257) #b01111111111111111111111111111110) (bvslt lt!621252 #b00000000000000000000000000000000) (bvsge lt!621252 (size!47086 a!2901)) (bvslt (index!45863 lt!621257) #b00000000000000000000000000000000) (bvsge (index!45863 lt!621257) (size!47086 a!2901)) (not (= lt!621257 (Intermediate!10871 false (index!45863 lt!621257) (x!127455 lt!621257))))))))

(assert (=> b!1410900 (= lt!621254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621255 mask!2840) lt!621255 lt!621251 mask!2840))))

(assert (=> b!1410900 (= lt!621255 (select (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1410900 (= lt!621251 (array!96391 (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47086 a!2901)))))

(assert (= (and start!121436 res!948171) b!1410893))

(assert (= (and b!1410893 res!948169) b!1410891))

(assert (= (and b!1410891 res!948175) b!1410895))

(assert (= (and b!1410895 res!948174) b!1410897))

(assert (= (and b!1410897 res!948168) b!1410890))

(assert (= (and b!1410890 res!948172) b!1410894))

(assert (= (and b!1410894 res!948177) b!1410899))

(assert (= (and b!1410894 (not res!948173)) b!1410900))

(assert (= (and b!1410900 (not res!948178)) b!1410896))

(assert (= (and b!1410896 (not res!948170)) b!1410898))

(assert (= (and b!1410898 (not res!948176)) b!1410892))

(declare-fun m!1300141 () Bool)

(assert (=> b!1410891 m!1300141))

(assert (=> b!1410891 m!1300141))

(declare-fun m!1300143 () Bool)

(assert (=> b!1410891 m!1300143))

(declare-fun m!1300145 () Bool)

(assert (=> b!1410890 m!1300145))

(declare-fun m!1300147 () Bool)

(assert (=> b!1410900 m!1300147))

(assert (=> b!1410900 m!1300147))

(declare-fun m!1300149 () Bool)

(assert (=> b!1410900 m!1300149))

(declare-fun m!1300151 () Bool)

(assert (=> b!1410900 m!1300151))

(declare-fun m!1300153 () Bool)

(assert (=> b!1410900 m!1300153))

(declare-fun m!1300155 () Bool)

(assert (=> b!1410899 m!1300155))

(assert (=> b!1410899 m!1300155))

(declare-fun m!1300157 () Bool)

(assert (=> b!1410899 m!1300157))

(declare-fun m!1300159 () Bool)

(assert (=> start!121436 m!1300159))

(declare-fun m!1300161 () Bool)

(assert (=> start!121436 m!1300161))

(assert (=> b!1410894 m!1300155))

(declare-fun m!1300163 () Bool)

(assert (=> b!1410894 m!1300163))

(assert (=> b!1410894 m!1300155))

(declare-fun m!1300165 () Bool)

(assert (=> b!1410894 m!1300165))

(declare-fun m!1300167 () Bool)

(assert (=> b!1410894 m!1300167))

(assert (=> b!1410894 m!1300155))

(declare-fun m!1300169 () Bool)

(assert (=> b!1410894 m!1300169))

(declare-fun m!1300171 () Bool)

(assert (=> b!1410897 m!1300171))

(assert (=> b!1410895 m!1300155))

(assert (=> b!1410895 m!1300155))

(declare-fun m!1300173 () Bool)

(assert (=> b!1410895 m!1300173))

(declare-fun m!1300175 () Bool)

(assert (=> b!1410898 m!1300175))

(check-sat (not b!1410900) (not b!1410898) (not start!121436) (not b!1410894) (not b!1410899) (not b!1410891) (not b!1410897) (not b!1410895) (not b!1410890))
(check-sat)
