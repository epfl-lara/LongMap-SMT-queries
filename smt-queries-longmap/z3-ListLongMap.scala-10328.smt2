; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121454 () Bool)

(assert start!121454)

(declare-fun res!948407 () Bool)

(declare-fun e!798579 () Bool)

(assert (=> start!121454 (=> (not res!948407) (not e!798579))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121454 (= res!948407 (validMask!0 mask!2840))))

(assert (=> start!121454 e!798579))

(assert (=> start!121454 true))

(declare-datatypes ((array!96455 0))(
  ( (array!96456 (arr!46566 (Array (_ BitVec 32) (_ BitVec 64))) (size!47116 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96455)

(declare-fun array_inv!35594 (array!96455) Bool)

(assert (=> start!121454 (array_inv!35594 a!2901)))

(declare-fun b!1411174 () Bool)

(declare-fun res!948409 () Bool)

(assert (=> b!1411174 (=> (not res!948409) (not e!798579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96455 (_ BitVec 32)) Bool)

(assert (=> b!1411174 (= res!948409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411175 () Bool)

(declare-fun res!948403 () Bool)

(assert (=> b!1411175 (=> (not res!948403) (not e!798579))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411175 (= res!948403 (and (= (size!47116 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47116 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47116 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411176 () Bool)

(declare-fun e!798577 () Bool)

(assert (=> b!1411176 (= e!798579 (not e!798577))))

(declare-fun res!948406 () Bool)

(assert (=> b!1411176 (=> res!948406 e!798577)))

(declare-datatypes ((SeekEntryResult!10877 0))(
  ( (MissingZero!10877 (index!45885 (_ BitVec 32))) (Found!10877 (index!45886 (_ BitVec 32))) (Intermediate!10877 (undefined!11689 Bool) (index!45887 (_ BitVec 32)) (x!127480 (_ BitVec 32))) (Undefined!10877) (MissingVacant!10877 (index!45888 (_ BitVec 32))) )
))
(declare-fun lt!621562 () SeekEntryResult!10877)

(get-info :version)

(assert (=> b!1411176 (= res!948406 (or (not ((_ is Intermediate!10877) lt!621562)) (undefined!11689 lt!621562)))))

(declare-fun e!798581 () Bool)

(assert (=> b!1411176 e!798581))

(declare-fun res!948402 () Bool)

(assert (=> b!1411176 (=> (not res!948402) (not e!798581))))

(assert (=> b!1411176 (= res!948402 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47728 0))(
  ( (Unit!47729) )
))
(declare-fun lt!621561 () Unit!47728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47728)

(assert (=> b!1411176 (= lt!621561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621564 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96455 (_ BitVec 32)) SeekEntryResult!10877)

(assert (=> b!1411176 (= lt!621562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621564 (select (arr!46566 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411176 (= lt!621564 (toIndex!0 (select (arr!46566 a!2901) j!112) mask!2840))))

(declare-fun b!1411177 () Bool)

(declare-fun res!948404 () Bool)

(assert (=> b!1411177 (=> (not res!948404) (not e!798579))))

(declare-datatypes ((List!33085 0))(
  ( (Nil!33082) (Cons!33081 (h!34353 (_ BitVec 64)) (t!47779 List!33085)) )
))
(declare-fun arrayNoDuplicates!0 (array!96455 (_ BitVec 32) List!33085) Bool)

(assert (=> b!1411177 (= res!948404 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33082))))

(declare-fun b!1411178 () Bool)

(declare-fun res!948405 () Bool)

(assert (=> b!1411178 (=> (not res!948405) (not e!798579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411178 (= res!948405 (validKeyInArray!0 (select (arr!46566 a!2901) j!112)))))

(declare-fun b!1411179 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96455 (_ BitVec 32)) SeekEntryResult!10877)

(assert (=> b!1411179 (= e!798581 (= (seekEntryOrOpen!0 (select (arr!46566 a!2901) j!112) a!2901 mask!2840) (Found!10877 j!112)))))

(declare-fun b!1411180 () Bool)

(declare-fun e!798580 () Bool)

(assert (=> b!1411180 (= e!798580 true)))

(declare-fun lt!621560 () SeekEntryResult!10877)

(assert (=> b!1411180 (and (not (undefined!11689 lt!621560)) (= (index!45887 lt!621560) i!1037) (bvslt (x!127480 lt!621560) (x!127480 lt!621562)))))

(declare-fun lt!621563 () Unit!47728)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47728)

(assert (=> b!1411180 (= lt!621563 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621564 (x!127480 lt!621562) (index!45887 lt!621562) (x!127480 lt!621560) (index!45887 lt!621560) (undefined!11689 lt!621560) mask!2840))))

(declare-fun b!1411181 () Bool)

(assert (=> b!1411181 (= e!798577 e!798580)))

(declare-fun res!948408 () Bool)

(assert (=> b!1411181 (=> res!948408 e!798580)))

(assert (=> b!1411181 (= res!948408 (or (= lt!621562 lt!621560) (not ((_ is Intermediate!10877) lt!621560))))))

(assert (=> b!1411181 (= lt!621560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46566 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46566 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96456 (store (arr!46566 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47116 a!2901)) mask!2840))))

(declare-fun b!1411182 () Bool)

(declare-fun res!948401 () Bool)

(assert (=> b!1411182 (=> (not res!948401) (not e!798579))))

(assert (=> b!1411182 (= res!948401 (validKeyInArray!0 (select (arr!46566 a!2901) i!1037)))))

(assert (= (and start!121454 res!948407) b!1411175))

(assert (= (and b!1411175 res!948403) b!1411182))

(assert (= (and b!1411182 res!948401) b!1411178))

(assert (= (and b!1411178 res!948405) b!1411174))

(assert (= (and b!1411174 res!948409) b!1411177))

(assert (= (and b!1411177 res!948404) b!1411176))

(assert (= (and b!1411176 res!948402) b!1411179))

(assert (= (and b!1411176 (not res!948406)) b!1411181))

(assert (= (and b!1411181 (not res!948408)) b!1411180))

(declare-fun m!1300929 () Bool)

(assert (=> start!121454 m!1300929))

(declare-fun m!1300931 () Bool)

(assert (=> start!121454 m!1300931))

(declare-fun m!1300933 () Bool)

(assert (=> b!1411180 m!1300933))

(declare-fun m!1300935 () Bool)

(assert (=> b!1411178 m!1300935))

(assert (=> b!1411178 m!1300935))

(declare-fun m!1300937 () Bool)

(assert (=> b!1411178 m!1300937))

(declare-fun m!1300939 () Bool)

(assert (=> b!1411181 m!1300939))

(declare-fun m!1300941 () Bool)

(assert (=> b!1411181 m!1300941))

(assert (=> b!1411181 m!1300941))

(declare-fun m!1300943 () Bool)

(assert (=> b!1411181 m!1300943))

(assert (=> b!1411181 m!1300943))

(assert (=> b!1411181 m!1300941))

(declare-fun m!1300945 () Bool)

(assert (=> b!1411181 m!1300945))

(declare-fun m!1300947 () Bool)

(assert (=> b!1411177 m!1300947))

(declare-fun m!1300949 () Bool)

(assert (=> b!1411182 m!1300949))

(assert (=> b!1411182 m!1300949))

(declare-fun m!1300951 () Bool)

(assert (=> b!1411182 m!1300951))

(assert (=> b!1411179 m!1300935))

(assert (=> b!1411179 m!1300935))

(declare-fun m!1300953 () Bool)

(assert (=> b!1411179 m!1300953))

(assert (=> b!1411176 m!1300935))

(declare-fun m!1300955 () Bool)

(assert (=> b!1411176 m!1300955))

(declare-fun m!1300957 () Bool)

(assert (=> b!1411176 m!1300957))

(declare-fun m!1300959 () Bool)

(assert (=> b!1411176 m!1300959))

(assert (=> b!1411176 m!1300935))

(declare-fun m!1300961 () Bool)

(assert (=> b!1411176 m!1300961))

(assert (=> b!1411176 m!1300935))

(declare-fun m!1300963 () Bool)

(assert (=> b!1411174 m!1300963))

(check-sat (not b!1411177) (not b!1411182) (not b!1411180) (not b!1411179) (not b!1411174) (not b!1411178) (not b!1411181) (not b!1411176) (not start!121454))
(check-sat)
