; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123286 () Bool)

(assert start!123286)

(declare-fun b!1429839 () Bool)

(declare-fun res!964479 () Bool)

(declare-fun e!807293 () Bool)

(assert (=> b!1429839 (=> (not res!964479) (not e!807293))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11314 0))(
  ( (MissingZero!11314 (index!47648 (_ BitVec 32))) (Found!11314 (index!47649 (_ BitVec 32))) (Intermediate!11314 (undefined!12126 Bool) (index!47650 (_ BitVec 32)) (x!129276 (_ BitVec 32))) (Undefined!11314) (MissingVacant!11314 (index!47651 (_ BitVec 32))) )
))
(declare-fun lt!629522 () SeekEntryResult!11314)

(declare-datatypes ((array!97447 0))(
  ( (array!97448 (arr!47035 (Array (_ BitVec 32) (_ BitVec 64))) (size!47585 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97447)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97447 (_ BitVec 32)) SeekEntryResult!11314)

(assert (=> b!1429839 (= res!964479 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!629522))))

(declare-fun b!1429840 () Bool)

(declare-fun res!964476 () Bool)

(declare-fun e!807295 () Bool)

(assert (=> b!1429840 (=> (not res!964476) (not e!807295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429840 (= res!964476 (validKeyInArray!0 (select (arr!47035 a!2831) j!81)))))

(declare-fun b!1429841 () Bool)

(declare-fun res!964474 () Bool)

(assert (=> b!1429841 (=> (not res!964474) (not e!807295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97447 (_ BitVec 32)) Bool)

(assert (=> b!1429841 (= res!964474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429842 () Bool)

(declare-fun res!964470 () Bool)

(assert (=> b!1429842 (=> (not res!964470) (not e!807295))))

(declare-datatypes ((List!33545 0))(
  ( (Nil!33542) (Cons!33541 (h!34855 (_ BitVec 64)) (t!48239 List!33545)) )
))
(declare-fun arrayNoDuplicates!0 (array!97447 (_ BitVec 32) List!33545) Bool)

(assert (=> b!1429842 (= res!964470 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33542))))

(declare-fun b!1429843 () Bool)

(declare-fun res!964477 () Bool)

(assert (=> b!1429843 (=> (not res!964477) (not e!807295))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429843 (= res!964477 (validKeyInArray!0 (select (arr!47035 a!2831) i!982)))))

(declare-fun b!1429845 () Bool)

(assert (=> b!1429845 (= e!807293 (not true))))

(declare-fun e!807296 () Bool)

(assert (=> b!1429845 e!807296))

(declare-fun res!964475 () Bool)

(assert (=> b!1429845 (=> (not res!964475) (not e!807296))))

(assert (=> b!1429845 (= res!964475 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48374 0))(
  ( (Unit!48375) )
))
(declare-fun lt!629523 () Unit!48374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48374)

(assert (=> b!1429845 (= lt!629523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429846 () Bool)

(declare-fun res!964468 () Bool)

(assert (=> b!1429846 (=> (not res!964468) (not e!807295))))

(assert (=> b!1429846 (= res!964468 (and (= (size!47585 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47585 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47585 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429847 () Bool)

(declare-fun e!807294 () Bool)

(assert (=> b!1429847 (= e!807295 e!807294)))

(declare-fun res!964478 () Bool)

(assert (=> b!1429847 (=> (not res!964478) (not e!807294))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429847 (= res!964478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!629522))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429847 (= lt!629522 (Intermediate!11314 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429848 () Bool)

(declare-fun res!964472 () Bool)

(assert (=> b!1429848 (=> (not res!964472) (not e!807295))))

(assert (=> b!1429848 (= res!964472 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47585 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47585 a!2831))))))

(declare-fun b!1429849 () Bool)

(declare-fun res!964473 () Bool)

(assert (=> b!1429849 (=> (not res!964473) (not e!807293))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429849 (= res!964473 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429850 () Bool)

(declare-fun res!964471 () Bool)

(assert (=> b!1429850 (=> (not res!964471) (not e!807293))))

(declare-fun lt!629521 () (_ BitVec 64))

(declare-fun lt!629520 () array!97447)

(declare-fun lt!629519 () SeekEntryResult!11314)

(assert (=> b!1429850 (= res!964471 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629521 lt!629520 mask!2608) lt!629519))))

(declare-fun b!1429851 () Bool)

(assert (=> b!1429851 (= e!807294 e!807293)))

(declare-fun res!964469 () Bool)

(assert (=> b!1429851 (=> (not res!964469) (not e!807293))))

(assert (=> b!1429851 (= res!964469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629521 mask!2608) lt!629521 lt!629520 mask!2608) lt!629519))))

(assert (=> b!1429851 (= lt!629519 (Intermediate!11314 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429851 (= lt!629521 (select (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429851 (= lt!629520 (array!97448 (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47585 a!2831)))))

(declare-fun res!964480 () Bool)

(assert (=> start!123286 (=> (not res!964480) (not e!807295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123286 (= res!964480 (validMask!0 mask!2608))))

(assert (=> start!123286 e!807295))

(assert (=> start!123286 true))

(declare-fun array_inv!36063 (array!97447) Bool)

(assert (=> start!123286 (array_inv!36063 a!2831)))

(declare-fun b!1429844 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97447 (_ BitVec 32)) SeekEntryResult!11314)

(assert (=> b!1429844 (= e!807296 (= (seekEntryOrOpen!0 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) (Found!11314 j!81)))))

(assert (= (and start!123286 res!964480) b!1429846))

(assert (= (and b!1429846 res!964468) b!1429843))

(assert (= (and b!1429843 res!964477) b!1429840))

(assert (= (and b!1429840 res!964476) b!1429841))

(assert (= (and b!1429841 res!964474) b!1429842))

(assert (= (and b!1429842 res!964470) b!1429848))

(assert (= (and b!1429848 res!964472) b!1429847))

(assert (= (and b!1429847 res!964478) b!1429851))

(assert (= (and b!1429851 res!964469) b!1429839))

(assert (= (and b!1429839 res!964479) b!1429850))

(assert (= (and b!1429850 res!964471) b!1429849))

(assert (= (and b!1429849 res!964473) b!1429845))

(assert (= (and b!1429845 res!964475) b!1429844))

(declare-fun m!1319929 () Bool)

(assert (=> b!1429850 m!1319929))

(declare-fun m!1319931 () Bool)

(assert (=> b!1429845 m!1319931))

(declare-fun m!1319933 () Bool)

(assert (=> b!1429845 m!1319933))

(declare-fun m!1319935 () Bool)

(assert (=> b!1429851 m!1319935))

(assert (=> b!1429851 m!1319935))

(declare-fun m!1319937 () Bool)

(assert (=> b!1429851 m!1319937))

(declare-fun m!1319939 () Bool)

(assert (=> b!1429851 m!1319939))

(declare-fun m!1319941 () Bool)

(assert (=> b!1429851 m!1319941))

(declare-fun m!1319943 () Bool)

(assert (=> b!1429844 m!1319943))

(assert (=> b!1429844 m!1319943))

(declare-fun m!1319945 () Bool)

(assert (=> b!1429844 m!1319945))

(declare-fun m!1319947 () Bool)

(assert (=> b!1429843 m!1319947))

(assert (=> b!1429843 m!1319947))

(declare-fun m!1319949 () Bool)

(assert (=> b!1429843 m!1319949))

(declare-fun m!1319951 () Bool)

(assert (=> start!123286 m!1319951))

(declare-fun m!1319953 () Bool)

(assert (=> start!123286 m!1319953))

(assert (=> b!1429847 m!1319943))

(assert (=> b!1429847 m!1319943))

(declare-fun m!1319955 () Bool)

(assert (=> b!1429847 m!1319955))

(assert (=> b!1429847 m!1319955))

(assert (=> b!1429847 m!1319943))

(declare-fun m!1319957 () Bool)

(assert (=> b!1429847 m!1319957))

(declare-fun m!1319959 () Bool)

(assert (=> b!1429841 m!1319959))

(assert (=> b!1429840 m!1319943))

(assert (=> b!1429840 m!1319943))

(declare-fun m!1319961 () Bool)

(assert (=> b!1429840 m!1319961))

(declare-fun m!1319963 () Bool)

(assert (=> b!1429842 m!1319963))

(assert (=> b!1429839 m!1319943))

(assert (=> b!1429839 m!1319943))

(declare-fun m!1319965 () Bool)

(assert (=> b!1429839 m!1319965))

(push 1)

