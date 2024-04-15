; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121952 () Bool)

(assert start!121952)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96591 0))(
  ( (array!96592 (arr!46627 (Array (_ BitVec 32) (_ BitVec 64))) (size!47179 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96591)

(declare-fun e!800978 () Bool)

(declare-fun b!1415223 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10964 0))(
  ( (MissingZero!10964 (index!46248 (_ BitVec 32))) (Found!10964 (index!46249 (_ BitVec 32))) (Intermediate!10964 (undefined!11776 Bool) (index!46250 (_ BitVec 32)) (x!127856 (_ BitVec 32))) (Undefined!10964) (MissingVacant!10964 (index!46251 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96591 (_ BitVec 32)) SeekEntryResult!10964)

(assert (=> b!1415223 (= e!800978 (= (seekEntryOrOpen!0 (select (arr!46627 a!2901) j!112) a!2901 mask!2840) (Found!10964 j!112)))))

(declare-fun b!1415224 () Bool)

(declare-fun res!951319 () Bool)

(declare-fun e!800981 () Bool)

(assert (=> b!1415224 (=> (not res!951319) (not e!800981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96591 (_ BitVec 32)) Bool)

(assert (=> b!1415224 (= res!951319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415225 () Bool)

(declare-fun res!951322 () Bool)

(assert (=> b!1415225 (=> (not res!951322) (not e!800981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415225 (= res!951322 (validKeyInArray!0 (select (arr!46627 a!2901) j!112)))))

(declare-fun b!1415226 () Bool)

(declare-fun e!800977 () Bool)

(assert (=> b!1415226 (= e!800977 true)))

(declare-fun e!800979 () Bool)

(assert (=> b!1415226 e!800979))

(declare-fun res!951317 () Bool)

(assert (=> b!1415226 (=> (not res!951317) (not e!800979))))

(declare-fun lt!623860 () SeekEntryResult!10964)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!623863 () SeekEntryResult!10964)

(assert (=> b!1415226 (= res!951317 (and (not (undefined!11776 lt!623863)) (= (index!46250 lt!623863) i!1037) (bvslt (x!127856 lt!623863) (x!127856 lt!623860)) (= (select (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46250 lt!623863)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47745 0))(
  ( (Unit!47746) )
))
(declare-fun lt!623864 () Unit!47745)

(declare-fun lt!623861 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47745)

(assert (=> b!1415226 (= lt!623864 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623861 (x!127856 lt!623860) (index!46250 lt!623860) (x!127856 lt!623863) (index!46250 lt!623863) (undefined!11776 lt!623863) mask!2840))))

(declare-fun b!1415227 () Bool)

(declare-fun e!800980 () Bool)

(assert (=> b!1415227 (= e!800981 (not e!800980))))

(declare-fun res!951321 () Bool)

(assert (=> b!1415227 (=> res!951321 e!800980)))

(get-info :version)

(assert (=> b!1415227 (= res!951321 (or (not ((_ is Intermediate!10964) lt!623860)) (undefined!11776 lt!623860)))))

(assert (=> b!1415227 e!800978))

(declare-fun res!951324 () Bool)

(assert (=> b!1415227 (=> (not res!951324) (not e!800978))))

(assert (=> b!1415227 (= res!951324 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623859 () Unit!47745)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47745)

(assert (=> b!1415227 (= lt!623859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96591 (_ BitVec 32)) SeekEntryResult!10964)

(assert (=> b!1415227 (= lt!623860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623861 (select (arr!46627 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415227 (= lt!623861 (toIndex!0 (select (arr!46627 a!2901) j!112) mask!2840))))

(declare-fun b!1415228 () Bool)

(assert (=> b!1415228 (= e!800980 e!800977)))

(declare-fun res!951316 () Bool)

(assert (=> b!1415228 (=> res!951316 e!800977)))

(assert (=> b!1415228 (= res!951316 (or (= lt!623860 lt!623863) (not ((_ is Intermediate!10964) lt!623863))))))

(declare-fun lt!623862 () array!96591)

(declare-fun lt!623858 () (_ BitVec 64))

(assert (=> b!1415228 (= lt!623863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623858 mask!2840) lt!623858 lt!623862 mask!2840))))

(assert (=> b!1415228 (= lt!623858 (select (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415228 (= lt!623862 (array!96592 (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47179 a!2901)))))

(declare-fun res!951318 () Bool)

(assert (=> start!121952 (=> (not res!951318) (not e!800981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121952 (= res!951318 (validMask!0 mask!2840))))

(assert (=> start!121952 e!800981))

(assert (=> start!121952 true))

(declare-fun array_inv!35860 (array!96591) Bool)

(assert (=> start!121952 (array_inv!35860 a!2901)))

(declare-fun b!1415229 () Bool)

(declare-fun res!951325 () Bool)

(assert (=> b!1415229 (=> (not res!951325) (not e!800981))))

(assert (=> b!1415229 (= res!951325 (and (= (size!47179 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47179 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47179 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415230 () Bool)

(declare-fun res!951323 () Bool)

(assert (=> b!1415230 (=> (not res!951323) (not e!800981))))

(declare-datatypes ((List!33224 0))(
  ( (Nil!33221) (Cons!33220 (h!34507 (_ BitVec 64)) (t!47910 List!33224)) )
))
(declare-fun arrayNoDuplicates!0 (array!96591 (_ BitVec 32) List!33224) Bool)

(assert (=> b!1415230 (= res!951323 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33221))))

(declare-fun b!1415231 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96591 (_ BitVec 32)) SeekEntryResult!10964)

(assert (=> b!1415231 (= e!800979 (= (seekEntryOrOpen!0 lt!623858 lt!623862 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127856 lt!623863) (index!46250 lt!623863) (index!46250 lt!623863) (select (arr!46627 a!2901) j!112) lt!623862 mask!2840)))))

(declare-fun b!1415232 () Bool)

(declare-fun res!951320 () Bool)

(assert (=> b!1415232 (=> (not res!951320) (not e!800981))))

(assert (=> b!1415232 (= res!951320 (validKeyInArray!0 (select (arr!46627 a!2901) i!1037)))))

(assert (= (and start!121952 res!951318) b!1415229))

(assert (= (and b!1415229 res!951325) b!1415232))

(assert (= (and b!1415232 res!951320) b!1415225))

(assert (= (and b!1415225 res!951322) b!1415224))

(assert (= (and b!1415224 res!951319) b!1415230))

(assert (= (and b!1415230 res!951323) b!1415227))

(assert (= (and b!1415227 res!951324) b!1415223))

(assert (= (and b!1415227 (not res!951321)) b!1415228))

(assert (= (and b!1415228 (not res!951316)) b!1415226))

(assert (= (and b!1415226 res!951317) b!1415231))

(declare-fun m!1304995 () Bool)

(assert (=> b!1415230 m!1304995))

(declare-fun m!1304997 () Bool)

(assert (=> b!1415224 m!1304997))

(declare-fun m!1304999 () Bool)

(assert (=> b!1415227 m!1304999))

(declare-fun m!1305001 () Bool)

(assert (=> b!1415227 m!1305001))

(assert (=> b!1415227 m!1304999))

(assert (=> b!1415227 m!1304999))

(declare-fun m!1305003 () Bool)

(assert (=> b!1415227 m!1305003))

(declare-fun m!1305005 () Bool)

(assert (=> b!1415227 m!1305005))

(declare-fun m!1305007 () Bool)

(assert (=> b!1415227 m!1305007))

(declare-fun m!1305009 () Bool)

(assert (=> b!1415226 m!1305009))

(declare-fun m!1305011 () Bool)

(assert (=> b!1415226 m!1305011))

(declare-fun m!1305013 () Bool)

(assert (=> b!1415226 m!1305013))

(declare-fun m!1305015 () Bool)

(assert (=> b!1415231 m!1305015))

(assert (=> b!1415231 m!1304999))

(assert (=> b!1415231 m!1304999))

(declare-fun m!1305017 () Bool)

(assert (=> b!1415231 m!1305017))

(declare-fun m!1305019 () Bool)

(assert (=> b!1415232 m!1305019))

(assert (=> b!1415232 m!1305019))

(declare-fun m!1305021 () Bool)

(assert (=> b!1415232 m!1305021))

(assert (=> b!1415223 m!1304999))

(assert (=> b!1415223 m!1304999))

(declare-fun m!1305023 () Bool)

(assert (=> b!1415223 m!1305023))

(declare-fun m!1305025 () Bool)

(assert (=> b!1415228 m!1305025))

(assert (=> b!1415228 m!1305025))

(declare-fun m!1305027 () Bool)

(assert (=> b!1415228 m!1305027))

(assert (=> b!1415228 m!1305009))

(declare-fun m!1305029 () Bool)

(assert (=> b!1415228 m!1305029))

(assert (=> b!1415225 m!1304999))

(assert (=> b!1415225 m!1304999))

(declare-fun m!1305031 () Bool)

(assert (=> b!1415225 m!1305031))

(declare-fun m!1305033 () Bool)

(assert (=> start!121952 m!1305033))

(declare-fun m!1305035 () Bool)

(assert (=> start!121952 m!1305035))

(check-sat (not b!1415227) (not b!1415228) (not start!121952) (not b!1415232) (not b!1415231) (not b!1415225) (not b!1415230) (not b!1415223) (not b!1415226) (not b!1415224))
(check-sat)
