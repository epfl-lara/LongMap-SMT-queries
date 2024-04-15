; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123158 () Bool)

(assert start!123158)

(declare-fun b!1428084 () Bool)

(declare-fun res!962972 () Bool)

(declare-fun e!806542 () Bool)

(assert (=> b!1428084 (=> (not res!962972) (not e!806542))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97323 0))(
  ( (array!97324 (arr!46975 (Array (_ BitVec 32) (_ BitVec 64))) (size!47527 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97323)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428084 (= res!962972 (and (= (size!47527 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47527 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47527 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428085 () Bool)

(declare-fun res!962977 () Bool)

(assert (=> b!1428085 (=> (not res!962977) (not e!806542))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428085 (= res!962977 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47527 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47527 a!2831))))))

(declare-fun b!1428086 () Bool)

(declare-fun e!806541 () Bool)

(declare-fun e!806543 () Bool)

(assert (=> b!1428086 (= e!806541 e!806543)))

(declare-fun res!962967 () Bool)

(assert (=> b!1428086 (=> (not res!962967) (not e!806543))))

(declare-fun lt!628674 () array!97323)

(declare-datatypes ((SeekEntryResult!11281 0))(
  ( (MissingZero!11281 (index!47516 (_ BitVec 32))) (Found!11281 (index!47517 (_ BitVec 32))) (Intermediate!11281 (undefined!12093 Bool) (index!47518 (_ BitVec 32)) (x!129146 (_ BitVec 32))) (Undefined!11281) (MissingVacant!11281 (index!47519 (_ BitVec 32))) )
))
(declare-fun lt!628673 () SeekEntryResult!11281)

(declare-fun lt!628672 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97323 (_ BitVec 32)) SeekEntryResult!11281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428086 (= res!962967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628672 mask!2608) lt!628672 lt!628674 mask!2608) lt!628673))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428086 (= lt!628673 (Intermediate!11281 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428086 (= lt!628672 (select (store (arr!46975 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428086 (= lt!628674 (array!97324 (store (arr!46975 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47527 a!2831)))))

(declare-fun b!1428087 () Bool)

(declare-fun res!962975 () Bool)

(assert (=> b!1428087 (=> (not res!962975) (not e!806543))))

(assert (=> b!1428087 (= res!962975 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428088 () Bool)

(declare-fun res!962966 () Bool)

(assert (=> b!1428088 (=> (not res!962966) (not e!806542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97323 (_ BitVec 32)) Bool)

(assert (=> b!1428088 (= res!962966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428090 () Bool)

(assert (=> b!1428090 (= e!806543 (not true))))

(declare-fun e!806540 () Bool)

(assert (=> b!1428090 e!806540))

(declare-fun res!962970 () Bool)

(assert (=> b!1428090 (=> (not res!962970) (not e!806540))))

(assert (=> b!1428090 (= res!962970 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48147 0))(
  ( (Unit!48148) )
))
(declare-fun lt!628675 () Unit!48147)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48147)

(assert (=> b!1428090 (= lt!628675 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428091 () Bool)

(assert (=> b!1428091 (= e!806542 e!806541)))

(declare-fun res!962974 () Bool)

(assert (=> b!1428091 (=> (not res!962974) (not e!806541))))

(declare-fun lt!628676 () SeekEntryResult!11281)

(assert (=> b!1428091 (= res!962974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46975 a!2831) j!81) mask!2608) (select (arr!46975 a!2831) j!81) a!2831 mask!2608) lt!628676))))

(assert (=> b!1428091 (= lt!628676 (Intermediate!11281 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428092 () Bool)

(declare-fun res!962973 () Bool)

(assert (=> b!1428092 (=> (not res!962973) (not e!806543))))

(assert (=> b!1428092 (= res!962973 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46975 a!2831) j!81) a!2831 mask!2608) lt!628676))))

(declare-fun b!1428093 () Bool)

(declare-fun res!962971 () Bool)

(assert (=> b!1428093 (=> (not res!962971) (not e!806542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428093 (= res!962971 (validKeyInArray!0 (select (arr!46975 a!2831) j!81)))))

(declare-fun b!1428094 () Bool)

(declare-fun res!962968 () Bool)

(assert (=> b!1428094 (=> (not res!962968) (not e!806542))))

(assert (=> b!1428094 (= res!962968 (validKeyInArray!0 (select (arr!46975 a!2831) i!982)))))

(declare-fun b!1428095 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97323 (_ BitVec 32)) SeekEntryResult!11281)

(assert (=> b!1428095 (= e!806540 (= (seekEntryOrOpen!0 (select (arr!46975 a!2831) j!81) a!2831 mask!2608) (Found!11281 j!81)))))

(declare-fun b!1428096 () Bool)

(declare-fun res!962969 () Bool)

(assert (=> b!1428096 (=> (not res!962969) (not e!806542))))

(declare-datatypes ((List!33563 0))(
  ( (Nil!33560) (Cons!33559 (h!34870 (_ BitVec 64)) (t!48249 List!33563)) )
))
(declare-fun arrayNoDuplicates!0 (array!97323 (_ BitVec 32) List!33563) Bool)

(assert (=> b!1428096 (= res!962969 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33560))))

(declare-fun res!962965 () Bool)

(assert (=> start!123158 (=> (not res!962965) (not e!806542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123158 (= res!962965 (validMask!0 mask!2608))))

(assert (=> start!123158 e!806542))

(assert (=> start!123158 true))

(declare-fun array_inv!36208 (array!97323) Bool)

(assert (=> start!123158 (array_inv!36208 a!2831)))

(declare-fun b!1428089 () Bool)

(declare-fun res!962976 () Bool)

(assert (=> b!1428089 (=> (not res!962976) (not e!806543))))

(assert (=> b!1428089 (= res!962976 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628672 lt!628674 mask!2608) lt!628673))))

(assert (= (and start!123158 res!962965) b!1428084))

(assert (= (and b!1428084 res!962972) b!1428094))

(assert (= (and b!1428094 res!962968) b!1428093))

(assert (= (and b!1428093 res!962971) b!1428088))

(assert (= (and b!1428088 res!962966) b!1428096))

(assert (= (and b!1428096 res!962969) b!1428085))

(assert (= (and b!1428085 res!962977) b!1428091))

(assert (= (and b!1428091 res!962974) b!1428086))

(assert (= (and b!1428086 res!962967) b!1428092))

(assert (= (and b!1428092 res!962973) b!1428089))

(assert (= (and b!1428089 res!962976) b!1428087))

(assert (= (and b!1428087 res!962975) b!1428090))

(assert (= (and b!1428090 res!962970) b!1428095))

(declare-fun m!1317855 () Bool)

(assert (=> b!1428089 m!1317855))

(declare-fun m!1317857 () Bool)

(assert (=> b!1428092 m!1317857))

(assert (=> b!1428092 m!1317857))

(declare-fun m!1317859 () Bool)

(assert (=> b!1428092 m!1317859))

(assert (=> b!1428095 m!1317857))

(assert (=> b!1428095 m!1317857))

(declare-fun m!1317861 () Bool)

(assert (=> b!1428095 m!1317861))

(declare-fun m!1317863 () Bool)

(assert (=> b!1428088 m!1317863))

(declare-fun m!1317865 () Bool)

(assert (=> b!1428094 m!1317865))

(assert (=> b!1428094 m!1317865))

(declare-fun m!1317867 () Bool)

(assert (=> b!1428094 m!1317867))

(declare-fun m!1317869 () Bool)

(assert (=> b!1428090 m!1317869))

(declare-fun m!1317871 () Bool)

(assert (=> b!1428090 m!1317871))

(declare-fun m!1317873 () Bool)

(assert (=> b!1428086 m!1317873))

(assert (=> b!1428086 m!1317873))

(declare-fun m!1317875 () Bool)

(assert (=> b!1428086 m!1317875))

(declare-fun m!1317877 () Bool)

(assert (=> b!1428086 m!1317877))

(declare-fun m!1317879 () Bool)

(assert (=> b!1428086 m!1317879))

(assert (=> b!1428091 m!1317857))

(assert (=> b!1428091 m!1317857))

(declare-fun m!1317881 () Bool)

(assert (=> b!1428091 m!1317881))

(assert (=> b!1428091 m!1317881))

(assert (=> b!1428091 m!1317857))

(declare-fun m!1317883 () Bool)

(assert (=> b!1428091 m!1317883))

(declare-fun m!1317885 () Bool)

(assert (=> start!123158 m!1317885))

(declare-fun m!1317887 () Bool)

(assert (=> start!123158 m!1317887))

(assert (=> b!1428093 m!1317857))

(assert (=> b!1428093 m!1317857))

(declare-fun m!1317889 () Bool)

(assert (=> b!1428093 m!1317889))

(declare-fun m!1317891 () Bool)

(assert (=> b!1428096 m!1317891))

(check-sat (not b!1428086) (not start!123158) (not b!1428089) (not b!1428092) (not b!1428095) (not b!1428093) (not b!1428088) (not b!1428090) (not b!1428091) (not b!1428094) (not b!1428096))
(check-sat)
