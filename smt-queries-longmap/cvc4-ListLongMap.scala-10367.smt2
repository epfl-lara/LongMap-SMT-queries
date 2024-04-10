; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122020 () Bool)

(assert start!122020)

(declare-fun b!1416291 () Bool)

(declare-fun res!952341 () Bool)

(declare-fun e!801587 () Bool)

(assert (=> b!1416291 (=> (not res!952341) (not e!801587))))

(declare-datatypes ((array!96706 0))(
  ( (array!96707 (arr!46684 (Array (_ BitVec 32) (_ BitVec 64))) (size!47234 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96706)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416291 (= res!952341 (validKeyInArray!0 (select (arr!46684 a!2901) j!112)))))

(declare-fun b!1416292 () Bool)

(declare-fun e!801585 () Bool)

(assert (=> b!1416292 (= e!801585 true)))

(declare-datatypes ((SeekEntryResult!10995 0))(
  ( (MissingZero!10995 (index!46372 (_ BitVec 32))) (Found!10995 (index!46373 (_ BitVec 32))) (Intermediate!10995 (undefined!11807 Bool) (index!46374 (_ BitVec 32)) (x!127970 (_ BitVec 32))) (Undefined!10995) (MissingVacant!10995 (index!46375 (_ BitVec 32))) )
))
(declare-fun lt!624852 () SeekEntryResult!10995)

(declare-fun lt!624846 () SeekEntryResult!10995)

(assert (=> b!1416292 (= lt!624852 lt!624846)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47964 0))(
  ( (Unit!47965) )
))
(declare-fun lt!624849 () Unit!47964)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!624848 () SeekEntryResult!10995)

(declare-fun lt!624843 () SeekEntryResult!10995)

(declare-fun lt!624851 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47964)

(assert (=> b!1416292 (= lt!624849 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624851 (x!127970 lt!624843) (index!46374 lt!624843) (x!127970 lt!624848) (index!46374 lt!624848) mask!2840))))

(declare-fun b!1416293 () Bool)

(declare-fun res!952342 () Bool)

(assert (=> b!1416293 (=> (not res!952342) (not e!801587))))

(declare-datatypes ((List!33203 0))(
  ( (Nil!33200) (Cons!33199 (h!34486 (_ BitVec 64)) (t!47897 List!33203)) )
))
(declare-fun arrayNoDuplicates!0 (array!96706 (_ BitVec 32) List!33203) Bool)

(assert (=> b!1416293 (= res!952342 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33200))))

(declare-fun b!1416294 () Bool)

(declare-fun e!801583 () Bool)

(assert (=> b!1416294 (= e!801583 e!801585)))

(declare-fun res!952337 () Bool)

(assert (=> b!1416294 (=> res!952337 e!801585)))

(assert (=> b!1416294 (= res!952337 (or (bvslt (x!127970 lt!624843) #b00000000000000000000000000000000) (bvsgt (x!127970 lt!624843) #b01111111111111111111111111111110) (bvslt (x!127970 lt!624848) #b00000000000000000000000000000000) (bvsgt (x!127970 lt!624848) #b01111111111111111111111111111110) (bvslt lt!624851 #b00000000000000000000000000000000) (bvsge lt!624851 (size!47234 a!2901)) (bvslt (index!46374 lt!624843) #b00000000000000000000000000000000) (bvsge (index!46374 lt!624843) (size!47234 a!2901)) (bvslt (index!46374 lt!624848) #b00000000000000000000000000000000) (bvsge (index!46374 lt!624848) (size!47234 a!2901)) (not (= lt!624843 (Intermediate!10995 false (index!46374 lt!624843) (x!127970 lt!624843)))) (not (= lt!624848 (Intermediate!10995 false (index!46374 lt!624848) (x!127970 lt!624848))))))))

(declare-fun lt!624847 () array!96706)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96706 (_ BitVec 32)) SeekEntryResult!10995)

(assert (=> b!1416294 (= lt!624846 (seekKeyOrZeroReturnVacant!0 (x!127970 lt!624848) (index!46374 lt!624848) (index!46374 lt!624848) (select (arr!46684 a!2901) j!112) lt!624847 mask!2840))))

(declare-fun lt!624850 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96706 (_ BitVec 32)) SeekEntryResult!10995)

(assert (=> b!1416294 (= lt!624846 (seekEntryOrOpen!0 lt!624850 lt!624847 mask!2840))))

(assert (=> b!1416294 (and (not (undefined!11807 lt!624848)) (= (index!46374 lt!624848) i!1037) (bvslt (x!127970 lt!624848) (x!127970 lt!624843)) (= (select (store (arr!46684 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46374 lt!624848)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624844 () Unit!47964)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47964)

(assert (=> b!1416294 (= lt!624844 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624851 (x!127970 lt!624843) (index!46374 lt!624843) (x!127970 lt!624848) (index!46374 lt!624848) (undefined!11807 lt!624848) mask!2840))))

(declare-fun b!1416295 () Bool)

(declare-fun res!952340 () Bool)

(assert (=> b!1416295 (=> res!952340 e!801585)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96706 (_ BitVec 32)) SeekEntryResult!10995)

(assert (=> b!1416295 (= res!952340 (not (= lt!624848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624851 lt!624850 lt!624847 mask!2840))))))

(declare-fun b!1416296 () Bool)

(declare-fun res!952334 () Bool)

(assert (=> b!1416296 (=> (not res!952334) (not e!801587))))

(assert (=> b!1416296 (= res!952334 (and (= (size!47234 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47234 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47234 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416297 () Bool)

(declare-fun res!952339 () Bool)

(assert (=> b!1416297 (=> (not res!952339) (not e!801587))))

(assert (=> b!1416297 (= res!952339 (validKeyInArray!0 (select (arr!46684 a!2901) i!1037)))))

(declare-fun b!1416298 () Bool)

(declare-fun e!801584 () Bool)

(assert (=> b!1416298 (= e!801587 (not e!801584))))

(declare-fun res!952336 () Bool)

(assert (=> b!1416298 (=> res!952336 e!801584)))

(assert (=> b!1416298 (= res!952336 (or (not (is-Intermediate!10995 lt!624843)) (undefined!11807 lt!624843)))))

(assert (=> b!1416298 (= lt!624852 (Found!10995 j!112))))

(assert (=> b!1416298 (= lt!624852 (seekEntryOrOpen!0 (select (arr!46684 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96706 (_ BitVec 32)) Bool)

(assert (=> b!1416298 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624845 () Unit!47964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47964)

(assert (=> b!1416298 (= lt!624845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416298 (= lt!624843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624851 (select (arr!46684 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416298 (= lt!624851 (toIndex!0 (select (arr!46684 a!2901) j!112) mask!2840))))

(declare-fun res!952335 () Bool)

(assert (=> start!122020 (=> (not res!952335) (not e!801587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122020 (= res!952335 (validMask!0 mask!2840))))

(assert (=> start!122020 e!801587))

(assert (=> start!122020 true))

(declare-fun array_inv!35712 (array!96706) Bool)

(assert (=> start!122020 (array_inv!35712 a!2901)))

(declare-fun b!1416299 () Bool)

(declare-fun res!952338 () Bool)

(assert (=> b!1416299 (=> (not res!952338) (not e!801587))))

(assert (=> b!1416299 (= res!952338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416300 () Bool)

(assert (=> b!1416300 (= e!801584 e!801583)))

(declare-fun res!952333 () Bool)

(assert (=> b!1416300 (=> res!952333 e!801583)))

(assert (=> b!1416300 (= res!952333 (or (= lt!624843 lt!624848) (not (is-Intermediate!10995 lt!624848))))))

(assert (=> b!1416300 (= lt!624848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624850 mask!2840) lt!624850 lt!624847 mask!2840))))

(assert (=> b!1416300 (= lt!624850 (select (store (arr!46684 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416300 (= lt!624847 (array!96707 (store (arr!46684 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47234 a!2901)))))

(assert (= (and start!122020 res!952335) b!1416296))

(assert (= (and b!1416296 res!952334) b!1416297))

(assert (= (and b!1416297 res!952339) b!1416291))

(assert (= (and b!1416291 res!952341) b!1416299))

(assert (= (and b!1416299 res!952338) b!1416293))

(assert (= (and b!1416293 res!952342) b!1416298))

(assert (= (and b!1416298 (not res!952336)) b!1416300))

(assert (= (and b!1416300 (not res!952333)) b!1416294))

(assert (= (and b!1416294 (not res!952337)) b!1416295))

(assert (= (and b!1416295 (not res!952340)) b!1416292))

(declare-fun m!1306937 () Bool)

(assert (=> b!1416295 m!1306937))

(declare-fun m!1306939 () Bool)

(assert (=> b!1416299 m!1306939))

(declare-fun m!1306941 () Bool)

(assert (=> b!1416292 m!1306941))

(declare-fun m!1306943 () Bool)

(assert (=> b!1416294 m!1306943))

(assert (=> b!1416294 m!1306943))

(declare-fun m!1306945 () Bool)

(assert (=> b!1416294 m!1306945))

(declare-fun m!1306947 () Bool)

(assert (=> b!1416294 m!1306947))

(declare-fun m!1306949 () Bool)

(assert (=> b!1416294 m!1306949))

(declare-fun m!1306951 () Bool)

(assert (=> b!1416294 m!1306951))

(declare-fun m!1306953 () Bool)

(assert (=> b!1416294 m!1306953))

(declare-fun m!1306955 () Bool)

(assert (=> b!1416297 m!1306955))

(assert (=> b!1416297 m!1306955))

(declare-fun m!1306957 () Bool)

(assert (=> b!1416297 m!1306957))

(assert (=> b!1416291 m!1306943))

(assert (=> b!1416291 m!1306943))

(declare-fun m!1306959 () Bool)

(assert (=> b!1416291 m!1306959))

(declare-fun m!1306961 () Bool)

(assert (=> b!1416300 m!1306961))

(assert (=> b!1416300 m!1306961))

(declare-fun m!1306963 () Bool)

(assert (=> b!1416300 m!1306963))

(assert (=> b!1416300 m!1306949))

(declare-fun m!1306965 () Bool)

(assert (=> b!1416300 m!1306965))

(assert (=> b!1416298 m!1306943))

(declare-fun m!1306967 () Bool)

(assert (=> b!1416298 m!1306967))

(assert (=> b!1416298 m!1306943))

(assert (=> b!1416298 m!1306943))

(declare-fun m!1306969 () Bool)

(assert (=> b!1416298 m!1306969))

(declare-fun m!1306971 () Bool)

(assert (=> b!1416298 m!1306971))

(assert (=> b!1416298 m!1306943))

(declare-fun m!1306973 () Bool)

(assert (=> b!1416298 m!1306973))

(declare-fun m!1306975 () Bool)

(assert (=> b!1416298 m!1306975))

(declare-fun m!1306977 () Bool)

(assert (=> start!122020 m!1306977))

(declare-fun m!1306979 () Bool)

(assert (=> start!122020 m!1306979))

(declare-fun m!1306981 () Bool)

(assert (=> b!1416293 m!1306981))

(push 1)

