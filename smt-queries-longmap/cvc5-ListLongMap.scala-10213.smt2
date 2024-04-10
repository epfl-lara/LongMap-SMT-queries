; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120330 () Bool)

(assert start!120330)

(declare-fun b!1400453 () Bool)

(declare-fun e!792907 () Bool)

(declare-fun e!792908 () Bool)

(assert (=> b!1400453 (= e!792907 (not e!792908))))

(declare-fun res!938965 () Bool)

(assert (=> b!1400453 (=> res!938965 e!792908)))

(declare-datatypes ((SeekEntryResult!10537 0))(
  ( (MissingZero!10537 (index!44525 (_ BitVec 32))) (Found!10537 (index!44526 (_ BitVec 32))) (Intermediate!10537 (undefined!11349 Bool) (index!44527 (_ BitVec 32)) (x!126172 (_ BitVec 32))) (Undefined!10537) (MissingVacant!10537 (index!44528 (_ BitVec 32))) )
))
(declare-fun lt!616216 () SeekEntryResult!10537)

(assert (=> b!1400453 (= res!938965 (or (not (is-Intermediate!10537 lt!616216)) (undefined!11349 lt!616216)))))

(declare-fun e!792909 () Bool)

(assert (=> b!1400453 e!792909))

(declare-fun res!938964 () Bool)

(assert (=> b!1400453 (=> (not res!938964) (not e!792909))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95739 0))(
  ( (array!95740 (arr!46220 (Array (_ BitVec 32) (_ BitVec 64))) (size!46770 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95739)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95739 (_ BitVec 32)) Bool)

(assert (=> b!1400453 (= res!938964 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47078 0))(
  ( (Unit!47079) )
))
(declare-fun lt!616217 () Unit!47078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47078)

(assert (=> b!1400453 (= lt!616217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616219 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95739 (_ BitVec 32)) SeekEntryResult!10537)

(assert (=> b!1400453 (= lt!616216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616219 (select (arr!46220 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400453 (= lt!616219 (toIndex!0 (select (arr!46220 a!2901) j!112) mask!2840))))

(declare-fun b!1400455 () Bool)

(declare-fun res!938974 () Bool)

(assert (=> b!1400455 (=> (not res!938974) (not e!792907))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400455 (= res!938974 (and (= (size!46770 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46770 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46770 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400456 () Bool)

(declare-fun res!938973 () Bool)

(assert (=> b!1400456 (=> (not res!938973) (not e!792907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400456 (= res!938973 (validKeyInArray!0 (select (arr!46220 a!2901) j!112)))))

(declare-fun b!1400457 () Bool)

(declare-fun e!792910 () Bool)

(assert (=> b!1400457 (= e!792910 true)))

(declare-fun lt!616220 () SeekEntryResult!10537)

(declare-fun lt!616214 () array!95739)

(declare-fun lt!616218 () (_ BitVec 64))

(assert (=> b!1400457 (= lt!616220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616219 lt!616218 lt!616214 mask!2840))))

(declare-fun b!1400458 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95739 (_ BitVec 32)) SeekEntryResult!10537)

(assert (=> b!1400458 (= e!792909 (= (seekEntryOrOpen!0 (select (arr!46220 a!2901) j!112) a!2901 mask!2840) (Found!10537 j!112)))))

(declare-fun b!1400459 () Bool)

(declare-fun e!792911 () Bool)

(assert (=> b!1400459 (= e!792911 e!792910)))

(declare-fun res!938970 () Bool)

(assert (=> b!1400459 (=> res!938970 e!792910)))

(declare-fun lt!616221 () SeekEntryResult!10537)

(assert (=> b!1400459 (= res!938970 (or (bvslt (x!126172 lt!616216) #b00000000000000000000000000000000) (bvsgt (x!126172 lt!616216) #b01111111111111111111111111111110) (bvslt (x!126172 lt!616221) #b00000000000000000000000000000000) (bvsgt (x!126172 lt!616221) #b01111111111111111111111111111110) (bvslt lt!616219 #b00000000000000000000000000000000) (bvsge lt!616219 (size!46770 a!2901)) (bvslt (index!44527 lt!616216) #b00000000000000000000000000000000) (bvsge (index!44527 lt!616216) (size!46770 a!2901)) (bvslt (index!44527 lt!616221) #b00000000000000000000000000000000) (bvsge (index!44527 lt!616221) (size!46770 a!2901)) (not (= lt!616216 (Intermediate!10537 false (index!44527 lt!616216) (x!126172 lt!616216)))) (not (= lt!616221 (Intermediate!10537 false (index!44527 lt!616221) (x!126172 lt!616221))))))))

(declare-fun e!792905 () Bool)

(assert (=> b!1400459 e!792905))

(declare-fun res!938971 () Bool)

(assert (=> b!1400459 (=> (not res!938971) (not e!792905))))

(assert (=> b!1400459 (= res!938971 (and (not (undefined!11349 lt!616221)) (= (index!44527 lt!616221) i!1037) (bvslt (x!126172 lt!616221) (x!126172 lt!616216)) (= (select (store (arr!46220 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44527 lt!616221)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616215 () Unit!47078)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47078)

(assert (=> b!1400459 (= lt!616215 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616219 (x!126172 lt!616216) (index!44527 lt!616216) (x!126172 lt!616221) (index!44527 lt!616221) (undefined!11349 lt!616221) mask!2840))))

(declare-fun b!1400454 () Bool)

(declare-fun res!938968 () Bool)

(assert (=> b!1400454 (=> (not res!938968) (not e!792907))))

(declare-datatypes ((List!32739 0))(
  ( (Nil!32736) (Cons!32735 (h!33983 (_ BitVec 64)) (t!47433 List!32739)) )
))
(declare-fun arrayNoDuplicates!0 (array!95739 (_ BitVec 32) List!32739) Bool)

(assert (=> b!1400454 (= res!938968 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32736))))

(declare-fun res!938972 () Bool)

(assert (=> start!120330 (=> (not res!938972) (not e!792907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120330 (= res!938972 (validMask!0 mask!2840))))

(assert (=> start!120330 e!792907))

(assert (=> start!120330 true))

(declare-fun array_inv!35248 (array!95739) Bool)

(assert (=> start!120330 (array_inv!35248 a!2901)))

(declare-fun b!1400460 () Bool)

(assert (=> b!1400460 (= e!792908 e!792911)))

(declare-fun res!938966 () Bool)

(assert (=> b!1400460 (=> res!938966 e!792911)))

(assert (=> b!1400460 (= res!938966 (or (= lt!616216 lt!616221) (not (is-Intermediate!10537 lt!616221))))))

(assert (=> b!1400460 (= lt!616221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616218 mask!2840) lt!616218 lt!616214 mask!2840))))

(assert (=> b!1400460 (= lt!616218 (select (store (arr!46220 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400460 (= lt!616214 (array!95740 (store (arr!46220 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46770 a!2901)))))

(declare-fun b!1400461 () Bool)

(declare-fun res!938967 () Bool)

(assert (=> b!1400461 (=> (not res!938967) (not e!792907))))

(assert (=> b!1400461 (= res!938967 (validKeyInArray!0 (select (arr!46220 a!2901) i!1037)))))

(declare-fun b!1400462 () Bool)

(declare-fun res!938969 () Bool)

(assert (=> b!1400462 (=> (not res!938969) (not e!792907))))

(assert (=> b!1400462 (= res!938969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400463 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95739 (_ BitVec 32)) SeekEntryResult!10537)

(assert (=> b!1400463 (= e!792905 (= (seekEntryOrOpen!0 lt!616218 lt!616214 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126172 lt!616221) (index!44527 lt!616221) (index!44527 lt!616221) (select (arr!46220 a!2901) j!112) lt!616214 mask!2840)))))

(assert (= (and start!120330 res!938972) b!1400455))

(assert (= (and b!1400455 res!938974) b!1400461))

(assert (= (and b!1400461 res!938967) b!1400456))

(assert (= (and b!1400456 res!938973) b!1400462))

(assert (= (and b!1400462 res!938969) b!1400454))

(assert (= (and b!1400454 res!938968) b!1400453))

(assert (= (and b!1400453 res!938964) b!1400458))

(assert (= (and b!1400453 (not res!938965)) b!1400460))

(assert (= (and b!1400460 (not res!938966)) b!1400459))

(assert (= (and b!1400459 res!938971) b!1400463))

(assert (= (and b!1400459 (not res!938970)) b!1400457))

(declare-fun m!1287909 () Bool)

(assert (=> b!1400454 m!1287909))

(declare-fun m!1287911 () Bool)

(assert (=> b!1400458 m!1287911))

(assert (=> b!1400458 m!1287911))

(declare-fun m!1287913 () Bool)

(assert (=> b!1400458 m!1287913))

(declare-fun m!1287915 () Bool)

(assert (=> b!1400457 m!1287915))

(declare-fun m!1287917 () Bool)

(assert (=> b!1400463 m!1287917))

(assert (=> b!1400463 m!1287911))

(assert (=> b!1400463 m!1287911))

(declare-fun m!1287919 () Bool)

(assert (=> b!1400463 m!1287919))

(declare-fun m!1287921 () Bool)

(assert (=> b!1400460 m!1287921))

(assert (=> b!1400460 m!1287921))

(declare-fun m!1287923 () Bool)

(assert (=> b!1400460 m!1287923))

(declare-fun m!1287925 () Bool)

(assert (=> b!1400460 m!1287925))

(declare-fun m!1287927 () Bool)

(assert (=> b!1400460 m!1287927))

(declare-fun m!1287929 () Bool)

(assert (=> start!120330 m!1287929))

(declare-fun m!1287931 () Bool)

(assert (=> start!120330 m!1287931))

(declare-fun m!1287933 () Bool)

(assert (=> b!1400462 m!1287933))

(assert (=> b!1400456 m!1287911))

(assert (=> b!1400456 m!1287911))

(declare-fun m!1287935 () Bool)

(assert (=> b!1400456 m!1287935))

(assert (=> b!1400453 m!1287911))

(declare-fun m!1287937 () Bool)

(assert (=> b!1400453 m!1287937))

(assert (=> b!1400453 m!1287911))

(assert (=> b!1400453 m!1287911))

(declare-fun m!1287939 () Bool)

(assert (=> b!1400453 m!1287939))

(declare-fun m!1287941 () Bool)

(assert (=> b!1400453 m!1287941))

(declare-fun m!1287943 () Bool)

(assert (=> b!1400453 m!1287943))

(declare-fun m!1287945 () Bool)

(assert (=> b!1400461 m!1287945))

(assert (=> b!1400461 m!1287945))

(declare-fun m!1287947 () Bool)

(assert (=> b!1400461 m!1287947))

(assert (=> b!1400459 m!1287925))

(declare-fun m!1287949 () Bool)

(assert (=> b!1400459 m!1287949))

(declare-fun m!1287951 () Bool)

(assert (=> b!1400459 m!1287951))

(push 1)

