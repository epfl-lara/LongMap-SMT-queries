; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123790 () Bool)

(assert start!123790)

(declare-fun res!966974 () Bool)

(declare-fun e!809533 () Bool)

(assert (=> start!123790 (=> (not res!966974) (not e!809533))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123790 (= res!966974 (validMask!0 mask!2608))))

(assert (=> start!123790 e!809533))

(assert (=> start!123790 true))

(declare-datatypes ((array!97643 0))(
  ( (array!97644 (arr!47125 (Array (_ BitVec 32) (_ BitVec 64))) (size!47676 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97643)

(declare-fun array_inv!36406 (array!97643) Bool)

(assert (=> start!123790 (array_inv!36406 a!2831)))

(declare-fun b!1433942 () Bool)

(declare-fun res!966975 () Bool)

(declare-fun e!809535 () Bool)

(assert (=> b!1433942 (=> (not res!966975) (not e!809535))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433942 (= res!966975 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433943 () Bool)

(declare-fun e!809532 () Bool)

(assert (=> b!1433943 (= e!809532 e!809535)))

(declare-fun res!966970 () Bool)

(assert (=> b!1433943 (=> (not res!966970) (not e!809535))))

(declare-fun lt!631149 () (_ BitVec 64))

(declare-fun lt!631151 () array!97643)

(declare-datatypes ((SeekEntryResult!11306 0))(
  ( (MissingZero!11306 (index!47616 (_ BitVec 32))) (Found!11306 (index!47617 (_ BitVec 32))) (Intermediate!11306 (undefined!12118 Bool) (index!47618 (_ BitVec 32)) (x!129420 (_ BitVec 32))) (Undefined!11306) (MissingVacant!11306 (index!47619 (_ BitVec 32))) )
))
(declare-fun lt!631154 () SeekEntryResult!11306)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97643 (_ BitVec 32)) SeekEntryResult!11306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433943 (= res!966970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631149 mask!2608) lt!631149 lt!631151 mask!2608) lt!631154))))

(assert (=> b!1433943 (= lt!631154 (Intermediate!11306 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433943 (= lt!631149 (select (store (arr!47125 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433943 (= lt!631151 (array!97644 (store (arr!47125 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47676 a!2831)))))

(declare-fun b!1433944 () Bool)

(declare-fun res!966972 () Bool)

(assert (=> b!1433944 (=> (not res!966972) (not e!809535))))

(declare-fun lt!631152 () SeekEntryResult!11306)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433944 (= res!966972 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47125 a!2831) j!81) a!2831 mask!2608) lt!631152))))

(declare-fun b!1433945 () Bool)

(declare-fun res!966981 () Bool)

(assert (=> b!1433945 (=> (not res!966981) (not e!809533))))

(assert (=> b!1433945 (= res!966981 (and (= (size!47676 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47676 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47676 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433946 () Bool)

(declare-fun res!966971 () Bool)

(assert (=> b!1433946 (=> (not res!966971) (not e!809533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433946 (= res!966971 (validKeyInArray!0 (select (arr!47125 a!2831) j!81)))))

(declare-fun b!1433947 () Bool)

(declare-fun res!966982 () Bool)

(assert (=> b!1433947 (=> (not res!966982) (not e!809533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97643 (_ BitVec 32)) Bool)

(assert (=> b!1433947 (= res!966982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433948 () Bool)

(declare-fun e!809536 () Bool)

(assert (=> b!1433948 (= e!809536 true)))

(declare-fun lt!631150 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433948 (= lt!631150 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433949 () Bool)

(declare-fun res!966979 () Bool)

(assert (=> b!1433949 (=> (not res!966979) (not e!809535))))

(assert (=> b!1433949 (= res!966979 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631149 lt!631151 mask!2608) lt!631154))))

(declare-fun e!809534 () Bool)

(declare-fun b!1433950 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97643 (_ BitVec 32)) SeekEntryResult!11306)

(assert (=> b!1433950 (= e!809534 (= (seekEntryOrOpen!0 (select (arr!47125 a!2831) j!81) a!2831 mask!2608) (Found!11306 j!81)))))

(declare-fun b!1433951 () Bool)

(declare-fun res!966980 () Bool)

(assert (=> b!1433951 (=> (not res!966980) (not e!809533))))

(assert (=> b!1433951 (= res!966980 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47676 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47676 a!2831))))))

(declare-fun b!1433952 () Bool)

(declare-fun res!966978 () Bool)

(assert (=> b!1433952 (=> (not res!966978) (not e!809533))))

(declare-datatypes ((List!33622 0))(
  ( (Nil!33619) (Cons!33618 (h!34952 (_ BitVec 64)) (t!48308 List!33622)) )
))
(declare-fun arrayNoDuplicates!0 (array!97643 (_ BitVec 32) List!33622) Bool)

(assert (=> b!1433952 (= res!966978 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33619))))

(declare-fun b!1433953 () Bool)

(assert (=> b!1433953 (= e!809535 (not e!809536))))

(declare-fun res!966977 () Bool)

(assert (=> b!1433953 (=> res!966977 e!809536)))

(assert (=> b!1433953 (= res!966977 (or (= (select (arr!47125 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47125 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47125 a!2831) index!585) (select (arr!47125 a!2831) j!81)) (= (select (store (arr!47125 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433953 e!809534))

(declare-fun res!966969 () Bool)

(assert (=> b!1433953 (=> (not res!966969) (not e!809534))))

(assert (=> b!1433953 (= res!966969 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48389 0))(
  ( (Unit!48390) )
))
(declare-fun lt!631153 () Unit!48389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48389)

(assert (=> b!1433953 (= lt!631153 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433954 () Bool)

(declare-fun res!966976 () Bool)

(assert (=> b!1433954 (=> (not res!966976) (not e!809533))))

(assert (=> b!1433954 (= res!966976 (validKeyInArray!0 (select (arr!47125 a!2831) i!982)))))

(declare-fun b!1433955 () Bool)

(assert (=> b!1433955 (= e!809533 e!809532)))

(declare-fun res!966973 () Bool)

(assert (=> b!1433955 (=> (not res!966973) (not e!809532))))

(assert (=> b!1433955 (= res!966973 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47125 a!2831) j!81) mask!2608) (select (arr!47125 a!2831) j!81) a!2831 mask!2608) lt!631152))))

(assert (=> b!1433955 (= lt!631152 (Intermediate!11306 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123790 res!966974) b!1433945))

(assert (= (and b!1433945 res!966981) b!1433954))

(assert (= (and b!1433954 res!966976) b!1433946))

(assert (= (and b!1433946 res!966971) b!1433947))

(assert (= (and b!1433947 res!966982) b!1433952))

(assert (= (and b!1433952 res!966978) b!1433951))

(assert (= (and b!1433951 res!966980) b!1433955))

(assert (= (and b!1433955 res!966973) b!1433943))

(assert (= (and b!1433943 res!966970) b!1433944))

(assert (= (and b!1433944 res!966972) b!1433949))

(assert (= (and b!1433949 res!966979) b!1433942))

(assert (= (and b!1433942 res!966975) b!1433953))

(assert (= (and b!1433953 res!966969) b!1433950))

(assert (= (and b!1433953 (not res!966977)) b!1433948))

(declare-fun m!1323859 () Bool)

(assert (=> b!1433954 m!1323859))

(assert (=> b!1433954 m!1323859))

(declare-fun m!1323861 () Bool)

(assert (=> b!1433954 m!1323861))

(declare-fun m!1323863 () Bool)

(assert (=> b!1433946 m!1323863))

(assert (=> b!1433946 m!1323863))

(declare-fun m!1323865 () Bool)

(assert (=> b!1433946 m!1323865))

(declare-fun m!1323867 () Bool)

(assert (=> b!1433952 m!1323867))

(assert (=> b!1433944 m!1323863))

(assert (=> b!1433944 m!1323863))

(declare-fun m!1323869 () Bool)

(assert (=> b!1433944 m!1323869))

(declare-fun m!1323871 () Bool)

(assert (=> b!1433948 m!1323871))

(declare-fun m!1323873 () Bool)

(assert (=> b!1433949 m!1323873))

(declare-fun m!1323875 () Bool)

(assert (=> b!1433943 m!1323875))

(assert (=> b!1433943 m!1323875))

(declare-fun m!1323877 () Bool)

(assert (=> b!1433943 m!1323877))

(declare-fun m!1323879 () Bool)

(assert (=> b!1433943 m!1323879))

(declare-fun m!1323881 () Bool)

(assert (=> b!1433943 m!1323881))

(assert (=> b!1433953 m!1323879))

(declare-fun m!1323883 () Bool)

(assert (=> b!1433953 m!1323883))

(declare-fun m!1323885 () Bool)

(assert (=> b!1433953 m!1323885))

(declare-fun m!1323887 () Bool)

(assert (=> b!1433953 m!1323887))

(assert (=> b!1433953 m!1323863))

(declare-fun m!1323889 () Bool)

(assert (=> b!1433953 m!1323889))

(declare-fun m!1323891 () Bool)

(assert (=> start!123790 m!1323891))

(declare-fun m!1323893 () Bool)

(assert (=> start!123790 m!1323893))

(assert (=> b!1433950 m!1323863))

(assert (=> b!1433950 m!1323863))

(declare-fun m!1323895 () Bool)

(assert (=> b!1433950 m!1323895))

(declare-fun m!1323897 () Bool)

(assert (=> b!1433947 m!1323897))

(assert (=> b!1433955 m!1323863))

(assert (=> b!1433955 m!1323863))

(declare-fun m!1323899 () Bool)

(assert (=> b!1433955 m!1323899))

(assert (=> b!1433955 m!1323899))

(assert (=> b!1433955 m!1323863))

(declare-fun m!1323901 () Bool)

(assert (=> b!1433955 m!1323901))

(check-sat (not b!1433949) (not b!1433948) (not b!1433953) (not b!1433944) (not b!1433943) (not b!1433954) (not start!123790) (not b!1433955) (not b!1433952) (not b!1433947) (not b!1433950) (not b!1433946))
(check-sat)
