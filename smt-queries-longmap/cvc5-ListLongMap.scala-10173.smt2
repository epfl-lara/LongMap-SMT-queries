; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119964 () Bool)

(assert start!119964)

(declare-fun b!1396475 () Bool)

(declare-fun e!790594 () Bool)

(declare-fun e!790597 () Bool)

(assert (=> b!1396475 (= e!790594 (not e!790597))))

(declare-fun res!935393 () Bool)

(assert (=> b!1396475 (=> res!935393 e!790597)))

(declare-datatypes ((SeekEntryResult!10417 0))(
  ( (MissingZero!10417 (index!44039 (_ BitVec 32))) (Found!10417 (index!44040 (_ BitVec 32))) (Intermediate!10417 (undefined!11229 Bool) (index!44041 (_ BitVec 32)) (x!125711 (_ BitVec 32))) (Undefined!10417) (MissingVacant!10417 (index!44042 (_ BitVec 32))) )
))
(declare-fun lt!613458 () SeekEntryResult!10417)

(assert (=> b!1396475 (= res!935393 (or (not (is-Intermediate!10417 lt!613458)) (undefined!11229 lt!613458)))))

(declare-fun e!790598 () Bool)

(assert (=> b!1396475 e!790598))

(declare-fun res!935387 () Bool)

(assert (=> b!1396475 (=> (not res!935387) (not e!790598))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95493 0))(
  ( (array!95494 (arr!46100 (Array (_ BitVec 32) (_ BitVec 64))) (size!46650 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95493)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95493 (_ BitVec 32)) Bool)

(assert (=> b!1396475 (= res!935387 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46838 0))(
  ( (Unit!46839) )
))
(declare-fun lt!613455 () Unit!46838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46838)

(assert (=> b!1396475 (= lt!613455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613453 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95493 (_ BitVec 32)) SeekEntryResult!10417)

(assert (=> b!1396475 (= lt!613458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613453 (select (arr!46100 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396475 (= lt!613453 (toIndex!0 (select (arr!46100 a!2901) j!112) mask!2840))))

(declare-fun b!1396476 () Bool)

(declare-fun res!935395 () Bool)

(assert (=> b!1396476 (=> (not res!935395) (not e!790594))))

(declare-datatypes ((List!32619 0))(
  ( (Nil!32616) (Cons!32615 (h!33857 (_ BitVec 64)) (t!47313 List!32619)) )
))
(declare-fun arrayNoDuplicates!0 (array!95493 (_ BitVec 32) List!32619) Bool)

(assert (=> b!1396476 (= res!935395 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32616))))

(declare-fun b!1396477 () Bool)

(declare-fun res!935388 () Bool)

(assert (=> b!1396477 (=> (not res!935388) (not e!790594))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396477 (= res!935388 (and (= (size!46650 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46650 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46650 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396478 () Bool)

(declare-fun res!935391 () Bool)

(assert (=> b!1396478 (=> (not res!935391) (not e!790594))))

(assert (=> b!1396478 (= res!935391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396479 () Bool)

(declare-fun res!935390 () Bool)

(assert (=> b!1396479 (=> (not res!935390) (not e!790594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396479 (= res!935390 (validKeyInArray!0 (select (arr!46100 a!2901) i!1037)))))

(declare-fun b!1396480 () Bool)

(declare-fun e!790595 () Bool)

(assert (=> b!1396480 (= e!790595 true)))

(declare-fun lt!613457 () SeekEntryResult!10417)

(declare-fun lt!613452 () array!95493)

(declare-fun lt!613454 () (_ BitVec 64))

(assert (=> b!1396480 (= lt!613457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613453 lt!613454 lt!613452 mask!2840))))

(declare-fun b!1396481 () Bool)

(assert (=> b!1396481 (= e!790597 e!790595)))

(declare-fun res!935389 () Bool)

(assert (=> b!1396481 (=> res!935389 e!790595)))

(declare-fun lt!613456 () SeekEntryResult!10417)

(assert (=> b!1396481 (= res!935389 (or (= lt!613458 lt!613456) (not (is-Intermediate!10417 lt!613456)) (bvslt (x!125711 lt!613458) #b00000000000000000000000000000000) (bvsgt (x!125711 lt!613458) #b01111111111111111111111111111110) (bvslt lt!613453 #b00000000000000000000000000000000) (bvsge lt!613453 (size!46650 a!2901)) (bvslt (index!44041 lt!613458) #b00000000000000000000000000000000) (bvsge (index!44041 lt!613458) (size!46650 a!2901)) (not (= lt!613458 (Intermediate!10417 false (index!44041 lt!613458) (x!125711 lt!613458)))) (not (= lt!613456 (Intermediate!10417 (undefined!11229 lt!613456) (index!44041 lt!613456) (x!125711 lt!613456))))))))

(assert (=> b!1396481 (= lt!613456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613454 mask!2840) lt!613454 lt!613452 mask!2840))))

(assert (=> b!1396481 (= lt!613454 (select (store (arr!46100 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396481 (= lt!613452 (array!95494 (store (arr!46100 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46650 a!2901)))))

(declare-fun b!1396482 () Bool)

(declare-fun res!935394 () Bool)

(assert (=> b!1396482 (=> (not res!935394) (not e!790594))))

(assert (=> b!1396482 (= res!935394 (validKeyInArray!0 (select (arr!46100 a!2901) j!112)))))

(declare-fun b!1396474 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95493 (_ BitVec 32)) SeekEntryResult!10417)

(assert (=> b!1396474 (= e!790598 (= (seekEntryOrOpen!0 (select (arr!46100 a!2901) j!112) a!2901 mask!2840) (Found!10417 j!112)))))

(declare-fun res!935392 () Bool)

(assert (=> start!119964 (=> (not res!935392) (not e!790594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119964 (= res!935392 (validMask!0 mask!2840))))

(assert (=> start!119964 e!790594))

(assert (=> start!119964 true))

(declare-fun array_inv!35128 (array!95493) Bool)

(assert (=> start!119964 (array_inv!35128 a!2901)))

(assert (= (and start!119964 res!935392) b!1396477))

(assert (= (and b!1396477 res!935388) b!1396479))

(assert (= (and b!1396479 res!935390) b!1396482))

(assert (= (and b!1396482 res!935394) b!1396478))

(assert (= (and b!1396478 res!935391) b!1396476))

(assert (= (and b!1396476 res!935395) b!1396475))

(assert (= (and b!1396475 res!935387) b!1396474))

(assert (= (and b!1396475 (not res!935393)) b!1396481))

(assert (= (and b!1396481 (not res!935389)) b!1396480))

(declare-fun m!1282923 () Bool)

(assert (=> b!1396480 m!1282923))

(declare-fun m!1282925 () Bool)

(assert (=> b!1396474 m!1282925))

(assert (=> b!1396474 m!1282925))

(declare-fun m!1282927 () Bool)

(assert (=> b!1396474 m!1282927))

(declare-fun m!1282929 () Bool)

(assert (=> b!1396478 m!1282929))

(assert (=> b!1396475 m!1282925))

(declare-fun m!1282931 () Bool)

(assert (=> b!1396475 m!1282931))

(assert (=> b!1396475 m!1282925))

(declare-fun m!1282933 () Bool)

(assert (=> b!1396475 m!1282933))

(declare-fun m!1282935 () Bool)

(assert (=> b!1396475 m!1282935))

(assert (=> b!1396475 m!1282925))

(declare-fun m!1282937 () Bool)

(assert (=> b!1396475 m!1282937))

(declare-fun m!1282939 () Bool)

(assert (=> start!119964 m!1282939))

(declare-fun m!1282941 () Bool)

(assert (=> start!119964 m!1282941))

(assert (=> b!1396482 m!1282925))

(assert (=> b!1396482 m!1282925))

(declare-fun m!1282943 () Bool)

(assert (=> b!1396482 m!1282943))

(declare-fun m!1282945 () Bool)

(assert (=> b!1396476 m!1282945))

(declare-fun m!1282947 () Bool)

(assert (=> b!1396481 m!1282947))

(assert (=> b!1396481 m!1282947))

(declare-fun m!1282949 () Bool)

(assert (=> b!1396481 m!1282949))

(declare-fun m!1282951 () Bool)

(assert (=> b!1396481 m!1282951))

(declare-fun m!1282953 () Bool)

(assert (=> b!1396481 m!1282953))

(declare-fun m!1282955 () Bool)

(assert (=> b!1396479 m!1282955))

(assert (=> b!1396479 m!1282955))

(declare-fun m!1282957 () Bool)

(assert (=> b!1396479 m!1282957))

(push 1)

