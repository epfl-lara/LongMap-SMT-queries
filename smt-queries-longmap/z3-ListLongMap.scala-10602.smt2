; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124968 () Bool)

(assert start!124968)

(declare-fun b!1447930 () Bool)

(declare-fun res!978845 () Bool)

(declare-fun e!815587 () Bool)

(assert (=> b!1447930 (=> (not res!978845) (not e!815587))))

(declare-datatypes ((array!98311 0))(
  ( (array!98312 (arr!47440 (Array (_ BitVec 32) (_ BitVec 64))) (size!47991 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98311)

(declare-datatypes ((List!33928 0))(
  ( (Nil!33925) (Cons!33924 (h!35285 (_ BitVec 64)) (t!48614 List!33928)) )
))
(declare-fun arrayNoDuplicates!0 (array!98311 (_ BitVec 32) List!33928) Bool)

(assert (=> b!1447930 (= res!978845 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33925))))

(declare-datatypes ((SeekEntryResult!11589 0))(
  ( (MissingZero!11589 (index!48748 (_ BitVec 32))) (Found!11589 (index!48749 (_ BitVec 32))) (Intermediate!11589 (undefined!12401 Bool) (index!48750 (_ BitVec 32)) (x!130606 (_ BitVec 32))) (Undefined!11589) (MissingVacant!11589 (index!48751 (_ BitVec 32))) )
))
(declare-fun lt!635335 () SeekEntryResult!11589)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1447931 () Bool)

(declare-fun e!815591 () Bool)

(declare-fun lt!635338 () (_ BitVec 64))

(declare-fun lt!635337 () array!98311)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98311 (_ BitVec 32)) SeekEntryResult!11589)

(assert (=> b!1447931 (= e!815591 (= lt!635335 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635338 lt!635337 mask!2687)))))

(declare-fun b!1447932 () Bool)

(declare-fun res!978857 () Bool)

(declare-fun e!815585 () Bool)

(assert (=> b!1447932 (=> (not res!978857) (not e!815585))))

(declare-fun lt!635334 () SeekEntryResult!11589)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447932 (= res!978857 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47440 a!2862) j!93) a!2862 mask!2687) lt!635334))))

(declare-fun b!1447933 () Bool)

(declare-fun e!815590 () Bool)

(declare-fun e!815584 () Bool)

(assert (=> b!1447933 (= e!815590 (not e!815584))))

(declare-fun res!978851 () Bool)

(assert (=> b!1447933 (=> res!978851 e!815584)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447933 (= res!978851 (or (and (= (select (arr!47440 a!2862) index!646) (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47440 a!2862) index!646) (select (arr!47440 a!2862) j!93))) (not (= (select (arr!47440 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815586 () Bool)

(assert (=> b!1447933 e!815586))

(declare-fun res!978855 () Bool)

(assert (=> b!1447933 (=> (not res!978855) (not e!815586))))

(declare-fun lt!635333 () SeekEntryResult!11589)

(assert (=> b!1447933 (= res!978855 (and (= lt!635333 (Found!11589 j!93)) (or (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) (select (arr!47440 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98311 (_ BitVec 32)) SeekEntryResult!11589)

(assert (=> b!1447933 (= lt!635333 (seekEntryOrOpen!0 (select (arr!47440 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98311 (_ BitVec 32)) Bool)

(assert (=> b!1447933 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48707 0))(
  ( (Unit!48708) )
))
(declare-fun lt!635332 () Unit!48707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48707)

(assert (=> b!1447933 (= lt!635332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447934 () Bool)

(declare-fun res!978852 () Bool)

(assert (=> b!1447934 (=> (not res!978852) (not e!815590))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447934 (= res!978852 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447935 () Bool)

(declare-fun e!815589 () Bool)

(assert (=> b!1447935 (= e!815587 e!815589)))

(declare-fun res!978848 () Bool)

(assert (=> b!1447935 (=> (not res!978848) (not e!815589))))

(assert (=> b!1447935 (= res!978848 (= (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447935 (= lt!635337 (array!98312 (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47991 a!2862)))))

(declare-fun b!1447936 () Bool)

(declare-fun e!815583 () Bool)

(assert (=> b!1447936 (= e!815586 e!815583)))

(declare-fun res!978847 () Bool)

(assert (=> b!1447936 (=> res!978847 e!815583)))

(assert (=> b!1447936 (= res!978847 (or (and (= (select (arr!47440 a!2862) index!646) (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47440 a!2862) index!646) (select (arr!47440 a!2862) j!93))) (not (= (select (arr!47440 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447937 () Bool)

(declare-fun res!978856 () Bool)

(assert (=> b!1447937 (=> (not res!978856) (not e!815587))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447937 (= res!978856 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47991 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47991 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47991 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447938 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98311 (_ BitVec 32)) SeekEntryResult!11589)

(assert (=> b!1447938 (= e!815591 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635338 lt!635337 mask!2687) (seekEntryOrOpen!0 lt!635338 lt!635337 mask!2687)))))

(declare-fun b!1447939 () Bool)

(declare-fun res!978846 () Bool)

(assert (=> b!1447939 (=> (not res!978846) (not e!815587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447939 (= res!978846 (validKeyInArray!0 (select (arr!47440 a!2862) i!1006)))))

(declare-fun b!1447940 () Bool)

(declare-fun res!978853 () Bool)

(assert (=> b!1447940 (=> (not res!978853) (not e!815587))))

(assert (=> b!1447940 (= res!978853 (and (= (size!47991 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47991 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47991 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447941 () Bool)

(declare-fun res!978860 () Bool)

(assert (=> b!1447941 (=> (not res!978860) (not e!815587))))

(assert (=> b!1447941 (= res!978860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447942 () Bool)

(assert (=> b!1447942 (= e!815589 e!815585)))

(declare-fun res!978844 () Bool)

(assert (=> b!1447942 (=> (not res!978844) (not e!815585))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447942 (= res!978844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47440 a!2862) j!93) mask!2687) (select (arr!47440 a!2862) j!93) a!2862 mask!2687) lt!635334))))

(assert (=> b!1447942 (= lt!635334 (Intermediate!11589 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447943 () Bool)

(declare-fun res!978849 () Bool)

(assert (=> b!1447943 (=> (not res!978849) (not e!815587))))

(assert (=> b!1447943 (= res!978849 (validKeyInArray!0 (select (arr!47440 a!2862) j!93)))))

(declare-fun b!1447944 () Bool)

(assert (=> b!1447944 (= e!815584 true)))

(declare-fun lt!635336 () SeekEntryResult!11589)

(assert (=> b!1447944 (= lt!635336 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47440 a!2862) j!93) a!2862 mask!2687))))

(declare-fun e!815592 () Bool)

(declare-fun b!1447945 () Bool)

(assert (=> b!1447945 (= e!815592 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447946 () Bool)

(assert (=> b!1447946 (= e!815585 e!815590)))

(declare-fun res!978859 () Bool)

(assert (=> b!1447946 (=> (not res!978859) (not e!815590))))

(assert (=> b!1447946 (= res!978859 (= lt!635335 (Intermediate!11589 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447946 (= lt!635335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635338 mask!2687) lt!635338 lt!635337 mask!2687))))

(assert (=> b!1447946 (= lt!635338 (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!978850 () Bool)

(assert (=> start!124968 (=> (not res!978850) (not e!815587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124968 (= res!978850 (validMask!0 mask!2687))))

(assert (=> start!124968 e!815587))

(assert (=> start!124968 true))

(declare-fun array_inv!36721 (array!98311) Bool)

(assert (=> start!124968 (array_inv!36721 a!2862)))

(declare-fun b!1447947 () Bool)

(assert (=> b!1447947 (= e!815583 e!815592)))

(declare-fun res!978858 () Bool)

(assert (=> b!1447947 (=> (not res!978858) (not e!815592))))

(assert (=> b!1447947 (= res!978858 (= lt!635333 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47440 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447948 () Bool)

(declare-fun res!978854 () Bool)

(assert (=> b!1447948 (=> (not res!978854) (not e!815590))))

(assert (=> b!1447948 (= res!978854 e!815591)))

(declare-fun c!134062 () Bool)

(assert (=> b!1447948 (= c!134062 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124968 res!978850) b!1447940))

(assert (= (and b!1447940 res!978853) b!1447939))

(assert (= (and b!1447939 res!978846) b!1447943))

(assert (= (and b!1447943 res!978849) b!1447941))

(assert (= (and b!1447941 res!978860) b!1447930))

(assert (= (and b!1447930 res!978845) b!1447937))

(assert (= (and b!1447937 res!978856) b!1447935))

(assert (= (and b!1447935 res!978848) b!1447942))

(assert (= (and b!1447942 res!978844) b!1447932))

(assert (= (and b!1447932 res!978857) b!1447946))

(assert (= (and b!1447946 res!978859) b!1447948))

(assert (= (and b!1447948 c!134062) b!1447931))

(assert (= (and b!1447948 (not c!134062)) b!1447938))

(assert (= (and b!1447948 res!978854) b!1447934))

(assert (= (and b!1447934 res!978852) b!1447933))

(assert (= (and b!1447933 res!978855) b!1447936))

(assert (= (and b!1447936 (not res!978847)) b!1447947))

(assert (= (and b!1447947 res!978858) b!1447945))

(assert (= (and b!1447933 (not res!978851)) b!1447944))

(declare-fun m!1336903 () Bool)

(assert (=> b!1447936 m!1336903))

(declare-fun m!1336905 () Bool)

(assert (=> b!1447936 m!1336905))

(declare-fun m!1336907 () Bool)

(assert (=> b!1447936 m!1336907))

(declare-fun m!1336909 () Bool)

(assert (=> b!1447936 m!1336909))

(declare-fun m!1336911 () Bool)

(assert (=> b!1447933 m!1336911))

(assert (=> b!1447933 m!1336905))

(declare-fun m!1336913 () Bool)

(assert (=> b!1447933 m!1336913))

(assert (=> b!1447933 m!1336907))

(assert (=> b!1447933 m!1336903))

(assert (=> b!1447933 m!1336909))

(declare-fun m!1336915 () Bool)

(assert (=> b!1447933 m!1336915))

(declare-fun m!1336917 () Bool)

(assert (=> b!1447933 m!1336917))

(assert (=> b!1447933 m!1336909))

(declare-fun m!1336919 () Bool)

(assert (=> b!1447930 m!1336919))

(declare-fun m!1336921 () Bool)

(assert (=> b!1447931 m!1336921))

(assert (=> b!1447932 m!1336909))

(assert (=> b!1447932 m!1336909))

(declare-fun m!1336923 () Bool)

(assert (=> b!1447932 m!1336923))

(declare-fun m!1336925 () Bool)

(assert (=> b!1447946 m!1336925))

(assert (=> b!1447946 m!1336925))

(declare-fun m!1336927 () Bool)

(assert (=> b!1447946 m!1336927))

(assert (=> b!1447946 m!1336905))

(declare-fun m!1336929 () Bool)

(assert (=> b!1447946 m!1336929))

(assert (=> b!1447943 m!1336909))

(assert (=> b!1447943 m!1336909))

(declare-fun m!1336931 () Bool)

(assert (=> b!1447943 m!1336931))

(assert (=> b!1447935 m!1336905))

(declare-fun m!1336933 () Bool)

(assert (=> b!1447935 m!1336933))

(assert (=> b!1447942 m!1336909))

(assert (=> b!1447942 m!1336909))

(declare-fun m!1336935 () Bool)

(assert (=> b!1447942 m!1336935))

(assert (=> b!1447942 m!1336935))

(assert (=> b!1447942 m!1336909))

(declare-fun m!1336937 () Bool)

(assert (=> b!1447942 m!1336937))

(declare-fun m!1336939 () Bool)

(assert (=> b!1447941 m!1336939))

(assert (=> b!1447944 m!1336909))

(assert (=> b!1447944 m!1336909))

(declare-fun m!1336941 () Bool)

(assert (=> b!1447944 m!1336941))

(declare-fun m!1336943 () Bool)

(assert (=> b!1447938 m!1336943))

(declare-fun m!1336945 () Bool)

(assert (=> b!1447938 m!1336945))

(assert (=> b!1447947 m!1336909))

(assert (=> b!1447947 m!1336909))

(declare-fun m!1336947 () Bool)

(assert (=> b!1447947 m!1336947))

(declare-fun m!1336949 () Bool)

(assert (=> b!1447939 m!1336949))

(assert (=> b!1447939 m!1336949))

(declare-fun m!1336951 () Bool)

(assert (=> b!1447939 m!1336951))

(declare-fun m!1336953 () Bool)

(assert (=> start!124968 m!1336953))

(declare-fun m!1336955 () Bool)

(assert (=> start!124968 m!1336955))

(check-sat (not b!1447947) (not b!1447938) (not b!1447944) (not b!1447933) (not b!1447931) (not b!1447932) (not b!1447946) (not b!1447930) (not b!1447941) (not b!1447943) (not b!1447939) (not start!124968) (not b!1447942))
(check-sat)
