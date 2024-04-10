; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122018 () Bool)

(assert start!122018)

(declare-fun b!1416261 () Bool)

(declare-fun res!952309 () Bool)

(declare-fun e!801571 () Bool)

(assert (=> b!1416261 (=> (not res!952309) (not e!801571))))

(declare-datatypes ((array!96704 0))(
  ( (array!96705 (arr!46683 (Array (_ BitVec 32) (_ BitVec 64))) (size!47233 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96704)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416261 (= res!952309 (validKeyInArray!0 (select (arr!46683 a!2901) i!1037)))))

(declare-fun res!952306 () Bool)

(assert (=> start!122018 (=> (not res!952306) (not e!801571))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122018 (= res!952306 (validMask!0 mask!2840))))

(assert (=> start!122018 e!801571))

(assert (=> start!122018 true))

(declare-fun array_inv!35711 (array!96704) Bool)

(assert (=> start!122018 (array_inv!35711 a!2901)))

(declare-fun b!1416262 () Bool)

(declare-fun res!952311 () Bool)

(declare-fun e!801568 () Bool)

(assert (=> b!1416262 (=> res!952311 e!801568)))

(declare-fun lt!624814 () (_ BitVec 32))

(declare-fun lt!624816 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10994 0))(
  ( (MissingZero!10994 (index!46368 (_ BitVec 32))) (Found!10994 (index!46369 (_ BitVec 32))) (Intermediate!10994 (undefined!11806 Bool) (index!46370 (_ BitVec 32)) (x!127969 (_ BitVec 32))) (Undefined!10994) (MissingVacant!10994 (index!46371 (_ BitVec 32))) )
))
(declare-fun lt!624817 () SeekEntryResult!10994)

(declare-fun lt!624821 () array!96704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96704 (_ BitVec 32)) SeekEntryResult!10994)

(assert (=> b!1416262 (= res!952311 (not (= lt!624817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624814 lt!624816 lt!624821 mask!2840))))))

(declare-fun b!1416263 () Bool)

(declare-fun res!952303 () Bool)

(assert (=> b!1416263 (=> (not res!952303) (not e!801571))))

(declare-datatypes ((List!33202 0))(
  ( (Nil!33199) (Cons!33198 (h!34485 (_ BitVec 64)) (t!47896 List!33202)) )
))
(declare-fun arrayNoDuplicates!0 (array!96704 (_ BitVec 32) List!33202) Bool)

(assert (=> b!1416263 (= res!952303 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33199))))

(declare-fun b!1416264 () Bool)

(declare-fun e!801572 () Bool)

(declare-fun e!801570 () Bool)

(assert (=> b!1416264 (= e!801572 e!801570)))

(declare-fun res!952305 () Bool)

(assert (=> b!1416264 (=> res!952305 e!801570)))

(declare-fun lt!624819 () SeekEntryResult!10994)

(get-info :version)

(assert (=> b!1416264 (= res!952305 (or (= lt!624819 lt!624817) (not ((_ is Intermediate!10994) lt!624817))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416264 (= lt!624817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624816 mask!2840) lt!624816 lt!624821 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416264 (= lt!624816 (select (store (arr!46683 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416264 (= lt!624821 (array!96705 (store (arr!46683 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47233 a!2901)))))

(declare-fun b!1416265 () Bool)

(declare-fun res!952304 () Bool)

(assert (=> b!1416265 (=> (not res!952304) (not e!801571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96704 (_ BitVec 32)) Bool)

(assert (=> b!1416265 (= res!952304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416266 () Bool)

(assert (=> b!1416266 (= e!801570 e!801568)))

(declare-fun res!952312 () Bool)

(assert (=> b!1416266 (=> res!952312 e!801568)))

(assert (=> b!1416266 (= res!952312 (or (bvslt (x!127969 lt!624819) #b00000000000000000000000000000000) (bvsgt (x!127969 lt!624819) #b01111111111111111111111111111110) (bvslt (x!127969 lt!624817) #b00000000000000000000000000000000) (bvsgt (x!127969 lt!624817) #b01111111111111111111111111111110) (bvslt lt!624814 #b00000000000000000000000000000000) (bvsge lt!624814 (size!47233 a!2901)) (bvslt (index!46370 lt!624819) #b00000000000000000000000000000000) (bvsge (index!46370 lt!624819) (size!47233 a!2901)) (bvslt (index!46370 lt!624817) #b00000000000000000000000000000000) (bvsge (index!46370 lt!624817) (size!47233 a!2901)) (not (= lt!624819 (Intermediate!10994 false (index!46370 lt!624819) (x!127969 lt!624819)))) (not (= lt!624817 (Intermediate!10994 false (index!46370 lt!624817) (x!127969 lt!624817))))))))

(declare-fun lt!624813 () SeekEntryResult!10994)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96704 (_ BitVec 32)) SeekEntryResult!10994)

(assert (=> b!1416266 (= lt!624813 (seekKeyOrZeroReturnVacant!0 (x!127969 lt!624817) (index!46370 lt!624817) (index!46370 lt!624817) (select (arr!46683 a!2901) j!112) lt!624821 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96704 (_ BitVec 32)) SeekEntryResult!10994)

(assert (=> b!1416266 (= lt!624813 (seekEntryOrOpen!0 lt!624816 lt!624821 mask!2840))))

(assert (=> b!1416266 (and (not (undefined!11806 lt!624817)) (= (index!46370 lt!624817) i!1037) (bvslt (x!127969 lt!624817) (x!127969 lt!624819)) (= (select (store (arr!46683 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46370 lt!624817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47962 0))(
  ( (Unit!47963) )
))
(declare-fun lt!624820 () Unit!47962)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47962)

(assert (=> b!1416266 (= lt!624820 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624814 (x!127969 lt!624819) (index!46370 lt!624819) (x!127969 lt!624817) (index!46370 lt!624817) (undefined!11806 lt!624817) mask!2840))))

(declare-fun b!1416267 () Bool)

(assert (=> b!1416267 (= e!801568 true)))

(declare-fun lt!624815 () SeekEntryResult!10994)

(assert (=> b!1416267 (= lt!624815 lt!624813)))

(declare-fun lt!624822 () Unit!47962)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47962)

(assert (=> b!1416267 (= lt!624822 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624814 (x!127969 lt!624819) (index!46370 lt!624819) (x!127969 lt!624817) (index!46370 lt!624817) mask!2840))))

(declare-fun b!1416268 () Bool)

(assert (=> b!1416268 (= e!801571 (not e!801572))))

(declare-fun res!952307 () Bool)

(assert (=> b!1416268 (=> res!952307 e!801572)))

(assert (=> b!1416268 (= res!952307 (or (not ((_ is Intermediate!10994) lt!624819)) (undefined!11806 lt!624819)))))

(assert (=> b!1416268 (= lt!624815 (Found!10994 j!112))))

(assert (=> b!1416268 (= lt!624815 (seekEntryOrOpen!0 (select (arr!46683 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416268 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624818 () Unit!47962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47962)

(assert (=> b!1416268 (= lt!624818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416268 (= lt!624819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624814 (select (arr!46683 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416268 (= lt!624814 (toIndex!0 (select (arr!46683 a!2901) j!112) mask!2840))))

(declare-fun b!1416269 () Bool)

(declare-fun res!952308 () Bool)

(assert (=> b!1416269 (=> (not res!952308) (not e!801571))))

(assert (=> b!1416269 (= res!952308 (validKeyInArray!0 (select (arr!46683 a!2901) j!112)))))

(declare-fun b!1416270 () Bool)

(declare-fun res!952310 () Bool)

(assert (=> b!1416270 (=> (not res!952310) (not e!801571))))

(assert (=> b!1416270 (= res!952310 (and (= (size!47233 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47233 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47233 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122018 res!952306) b!1416270))

(assert (= (and b!1416270 res!952310) b!1416261))

(assert (= (and b!1416261 res!952309) b!1416269))

(assert (= (and b!1416269 res!952308) b!1416265))

(assert (= (and b!1416265 res!952304) b!1416263))

(assert (= (and b!1416263 res!952303) b!1416268))

(assert (= (and b!1416268 (not res!952307)) b!1416264))

(assert (= (and b!1416264 (not res!952305)) b!1416266))

(assert (= (and b!1416266 (not res!952312)) b!1416262))

(assert (= (and b!1416262 (not res!952311)) b!1416267))

(declare-fun m!1306891 () Bool)

(assert (=> b!1416263 m!1306891))

(declare-fun m!1306893 () Bool)

(assert (=> b!1416264 m!1306893))

(assert (=> b!1416264 m!1306893))

(declare-fun m!1306895 () Bool)

(assert (=> b!1416264 m!1306895))

(declare-fun m!1306897 () Bool)

(assert (=> b!1416264 m!1306897))

(declare-fun m!1306899 () Bool)

(assert (=> b!1416264 m!1306899))

(declare-fun m!1306901 () Bool)

(assert (=> b!1416261 m!1306901))

(assert (=> b!1416261 m!1306901))

(declare-fun m!1306903 () Bool)

(assert (=> b!1416261 m!1306903))

(declare-fun m!1306905 () Bool)

(assert (=> b!1416266 m!1306905))

(declare-fun m!1306907 () Bool)

(assert (=> b!1416266 m!1306907))

(assert (=> b!1416266 m!1306907))

(declare-fun m!1306909 () Bool)

(assert (=> b!1416266 m!1306909))

(declare-fun m!1306911 () Bool)

(assert (=> b!1416266 m!1306911))

(declare-fun m!1306913 () Bool)

(assert (=> b!1416266 m!1306913))

(assert (=> b!1416266 m!1306897))

(declare-fun m!1306915 () Bool)

(assert (=> b!1416265 m!1306915))

(declare-fun m!1306917 () Bool)

(assert (=> b!1416262 m!1306917))

(assert (=> b!1416269 m!1306907))

(assert (=> b!1416269 m!1306907))

(declare-fun m!1306919 () Bool)

(assert (=> b!1416269 m!1306919))

(declare-fun m!1306921 () Bool)

(assert (=> b!1416267 m!1306921))

(declare-fun m!1306923 () Bool)

(assert (=> start!122018 m!1306923))

(declare-fun m!1306925 () Bool)

(assert (=> start!122018 m!1306925))

(assert (=> b!1416268 m!1306907))

(declare-fun m!1306927 () Bool)

(assert (=> b!1416268 m!1306927))

(assert (=> b!1416268 m!1306907))

(assert (=> b!1416268 m!1306907))

(declare-fun m!1306929 () Bool)

(assert (=> b!1416268 m!1306929))

(declare-fun m!1306931 () Bool)

(assert (=> b!1416268 m!1306931))

(assert (=> b!1416268 m!1306907))

(declare-fun m!1306933 () Bool)

(assert (=> b!1416268 m!1306933))

(declare-fun m!1306935 () Bool)

(assert (=> b!1416268 m!1306935))

(check-sat (not b!1416265) (not b!1416264) (not b!1416267) (not b!1416262) (not b!1416266) (not b!1416261) (not b!1416268) (not b!1416263) (not b!1416269) (not start!122018))
(check-sat)
