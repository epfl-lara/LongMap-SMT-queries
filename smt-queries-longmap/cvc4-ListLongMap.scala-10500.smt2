; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123580 () Bool)

(assert start!123580)

(declare-fun b!1433033 () Bool)

(declare-fun res!966906 () Bool)

(declare-fun e!808857 () Bool)

(assert (=> b!1433033 (=> (not res!966906) (not e!808857))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433033 (= res!966906 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433034 () Bool)

(declare-fun e!808859 () Bool)

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433034 (= e!808859 (and (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110)))))

(declare-fun lt!630849 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433034 (= lt!630849 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433035 () Bool)

(declare-fun res!966910 () Bool)

(declare-fun e!808856 () Bool)

(assert (=> b!1433035 (=> (not res!966910) (not e!808856))))

(declare-datatypes ((array!97552 0))(
  ( (array!97553 (arr!47083 (Array (_ BitVec 32) (_ BitVec 64))) (size!47633 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97552)

(declare-datatypes ((List!33593 0))(
  ( (Nil!33590) (Cons!33589 (h!34912 (_ BitVec 64)) (t!48287 List!33593)) )
))
(declare-fun arrayNoDuplicates!0 (array!97552 (_ BitVec 32) List!33593) Bool)

(assert (=> b!1433035 (= res!966910 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33590))))

(declare-fun b!1433036 () Bool)

(declare-fun res!966905 () Bool)

(assert (=> b!1433036 (=> (not res!966905) (not e!808857))))

(declare-datatypes ((SeekEntryResult!11362 0))(
  ( (MissingZero!11362 (index!47840 (_ BitVec 32))) (Found!11362 (index!47841 (_ BitVec 32))) (Intermediate!11362 (undefined!12174 Bool) (index!47842 (_ BitVec 32)) (x!129476 (_ BitVec 32))) (Undefined!11362) (MissingVacant!11362 (index!47843 (_ BitVec 32))) )
))
(declare-fun lt!630851 () SeekEntryResult!11362)

(declare-fun lt!630847 () array!97552)

(declare-fun lt!630850 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97552 (_ BitVec 32)) SeekEntryResult!11362)

(assert (=> b!1433036 (= res!966905 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630850 lt!630847 mask!2608) lt!630851))))

(declare-fun b!1433037 () Bool)

(declare-fun e!808858 () Bool)

(assert (=> b!1433037 (= e!808856 e!808858)))

(declare-fun res!966901 () Bool)

(assert (=> b!1433037 (=> (not res!966901) (not e!808858))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!630852 () SeekEntryResult!11362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433037 (= res!966901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!630852))))

(assert (=> b!1433037 (= lt!630852 (Intermediate!11362 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433038 () Bool)

(declare-fun res!966902 () Bool)

(assert (=> b!1433038 (=> (not res!966902) (not e!808856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97552 (_ BitVec 32)) Bool)

(assert (=> b!1433038 (= res!966902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433040 () Bool)

(declare-fun res!966904 () Bool)

(assert (=> b!1433040 (=> (not res!966904) (not e!808856))))

(assert (=> b!1433040 (= res!966904 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47633 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47633 a!2831))))))

(declare-fun b!1433041 () Bool)

(declare-fun res!966903 () Bool)

(assert (=> b!1433041 (=> (not res!966903) (not e!808856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433041 (= res!966903 (validKeyInArray!0 (select (arr!47083 a!2831) j!81)))))

(declare-fun b!1433042 () Bool)

(assert (=> b!1433042 (= e!808858 e!808857)))

(declare-fun res!966899 () Bool)

(assert (=> b!1433042 (=> (not res!966899) (not e!808857))))

(assert (=> b!1433042 (= res!966899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630850 mask!2608) lt!630850 lt!630847 mask!2608) lt!630851))))

(assert (=> b!1433042 (= lt!630851 (Intermediate!11362 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433042 (= lt!630850 (select (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433042 (= lt!630847 (array!97553 (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47633 a!2831)))))

(declare-fun b!1433043 () Bool)

(declare-fun res!966907 () Bool)

(assert (=> b!1433043 (=> (not res!966907) (not e!808856))))

(assert (=> b!1433043 (= res!966907 (and (= (size!47633 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47633 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47633 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433044 () Bool)

(assert (=> b!1433044 (= e!808857 (not e!808859))))

(declare-fun res!966909 () Bool)

(assert (=> b!1433044 (=> res!966909 e!808859)))

(assert (=> b!1433044 (= res!966909 (or (= (select (arr!47083 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47083 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47083 a!2831) index!585) (select (arr!47083 a!2831) j!81)) (= (select (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808855 () Bool)

(assert (=> b!1433044 e!808855))

(declare-fun res!966900 () Bool)

(assert (=> b!1433044 (=> (not res!966900) (not e!808855))))

(assert (=> b!1433044 (= res!966900 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48470 0))(
  ( (Unit!48471) )
))
(declare-fun lt!630848 () Unit!48470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48470)

(assert (=> b!1433044 (= lt!630848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433045 () Bool)

(declare-fun res!966897 () Bool)

(assert (=> b!1433045 (=> (not res!966897) (not e!808857))))

(assert (=> b!1433045 (= res!966897 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!630852))))

(declare-fun b!1433046 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97552 (_ BitVec 32)) SeekEntryResult!11362)

(assert (=> b!1433046 (= e!808855 (= (seekEntryOrOpen!0 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) (Found!11362 j!81)))))

(declare-fun b!1433039 () Bool)

(declare-fun res!966898 () Bool)

(assert (=> b!1433039 (=> (not res!966898) (not e!808856))))

(assert (=> b!1433039 (= res!966898 (validKeyInArray!0 (select (arr!47083 a!2831) i!982)))))

(declare-fun res!966908 () Bool)

(assert (=> start!123580 (=> (not res!966908) (not e!808856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123580 (= res!966908 (validMask!0 mask!2608))))

(assert (=> start!123580 e!808856))

(assert (=> start!123580 true))

(declare-fun array_inv!36111 (array!97552) Bool)

(assert (=> start!123580 (array_inv!36111 a!2831)))

(assert (= (and start!123580 res!966908) b!1433043))

(assert (= (and b!1433043 res!966907) b!1433039))

(assert (= (and b!1433039 res!966898) b!1433041))

(assert (= (and b!1433041 res!966903) b!1433038))

(assert (= (and b!1433038 res!966902) b!1433035))

(assert (= (and b!1433035 res!966910) b!1433040))

(assert (= (and b!1433040 res!966904) b!1433037))

(assert (= (and b!1433037 res!966901) b!1433042))

(assert (= (and b!1433042 res!966899) b!1433045))

(assert (= (and b!1433045 res!966897) b!1433036))

(assert (= (and b!1433036 res!966905) b!1433033))

(assert (= (and b!1433033 res!966906) b!1433044))

(assert (= (and b!1433044 res!966900) b!1433046))

(assert (= (and b!1433044 (not res!966909)) b!1433034))

(declare-fun m!1322869 () Bool)

(assert (=> b!1433036 m!1322869))

(declare-fun m!1322871 () Bool)

(assert (=> b!1433035 m!1322871))

(declare-fun m!1322873 () Bool)

(assert (=> b!1433044 m!1322873))

(declare-fun m!1322875 () Bool)

(assert (=> b!1433044 m!1322875))

(declare-fun m!1322877 () Bool)

(assert (=> b!1433044 m!1322877))

(declare-fun m!1322879 () Bool)

(assert (=> b!1433044 m!1322879))

(declare-fun m!1322881 () Bool)

(assert (=> b!1433044 m!1322881))

(declare-fun m!1322883 () Bool)

(assert (=> b!1433044 m!1322883))

(declare-fun m!1322885 () Bool)

(assert (=> b!1433038 m!1322885))

(assert (=> b!1433037 m!1322881))

(assert (=> b!1433037 m!1322881))

(declare-fun m!1322887 () Bool)

(assert (=> b!1433037 m!1322887))

(assert (=> b!1433037 m!1322887))

(assert (=> b!1433037 m!1322881))

(declare-fun m!1322889 () Bool)

(assert (=> b!1433037 m!1322889))

(declare-fun m!1322891 () Bool)

(assert (=> b!1433039 m!1322891))

(assert (=> b!1433039 m!1322891))

(declare-fun m!1322893 () Bool)

(assert (=> b!1433039 m!1322893))

(assert (=> b!1433041 m!1322881))

(assert (=> b!1433041 m!1322881))

(declare-fun m!1322895 () Bool)

(assert (=> b!1433041 m!1322895))

(assert (=> b!1433046 m!1322881))

(assert (=> b!1433046 m!1322881))

(declare-fun m!1322897 () Bool)

(assert (=> b!1433046 m!1322897))

(declare-fun m!1322899 () Bool)

(assert (=> start!123580 m!1322899))

(declare-fun m!1322901 () Bool)

(assert (=> start!123580 m!1322901))

(declare-fun m!1322903 () Bool)

(assert (=> b!1433034 m!1322903))

(assert (=> b!1433045 m!1322881))

(assert (=> b!1433045 m!1322881))

(declare-fun m!1322905 () Bool)

(assert (=> b!1433045 m!1322905))

(declare-fun m!1322907 () Bool)

(assert (=> b!1433042 m!1322907))

(assert (=> b!1433042 m!1322907))

(declare-fun m!1322909 () Bool)

(assert (=> b!1433042 m!1322909))

(assert (=> b!1433042 m!1322873))

(declare-fun m!1322911 () Bool)

(assert (=> b!1433042 m!1322911))

(push 1)

(assert (not b!1433046))

(assert (not b!1433042))

(assert (not b!1433045))

(assert (not start!123580))

(assert (not b!1433034))

(assert (not b!1433038))

(assert (not b!1433036))

(assert (not b!1433037))

(assert (not b!1433041))

(assert (not b!1433035))

(assert (not b!1433039))

(assert (not b!1433044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153993 () Bool)

(assert (=> d!153993 (= (validKeyInArray!0 (select (arr!47083 a!2831) i!982)) (and (not (= (select (arr!47083 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47083 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433039 d!153993))

(declare-fun d!153997 () Bool)

(declare-fun res!966934 () Bool)

(declare-fun e!808904 () Bool)

(assert (=> d!153997 (=> res!966934 e!808904)))

(assert (=> d!153997 (= res!966934 (bvsge #b00000000000000000000000000000000 (size!47633 a!2831)))))

(assert (=> d!153997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808904)))

(declare-fun b!1433121 () Bool)

(declare-fun e!808905 () Bool)

(declare-fun call!67483 () Bool)

(assert (=> b!1433121 (= e!808905 call!67483)))

(declare-fun b!1433122 () Bool)

(declare-fun e!808906 () Bool)

(assert (=> b!1433122 (= e!808906 call!67483)))

(declare-fun bm!67480 () Bool)

(assert (=> bm!67480 (= call!67483 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433123 () Bool)

(assert (=> b!1433123 (= e!808906 e!808905)))

(declare-fun lt!630889 () (_ BitVec 64))

(assert (=> b!1433123 (= lt!630889 (select (arr!47083 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630890 () Unit!48470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97552 (_ BitVec 64) (_ BitVec 32)) Unit!48470)

(assert (=> b!1433123 (= lt!630890 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630889 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433123 (arrayContainsKey!0 a!2831 lt!630889 #b00000000000000000000000000000000)))

(declare-fun lt!630888 () Unit!48470)

(assert (=> b!1433123 (= lt!630888 lt!630890)))

(declare-fun res!966935 () Bool)

(assert (=> b!1433123 (= res!966935 (= (seekEntryOrOpen!0 (select (arr!47083 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11362 #b00000000000000000000000000000000)))))

(assert (=> b!1433123 (=> (not res!966935) (not e!808905))))

(declare-fun b!1433124 () Bool)

(assert (=> b!1433124 (= e!808904 e!808906)))

(declare-fun c!132591 () Bool)

(assert (=> b!1433124 (= c!132591 (validKeyInArray!0 (select (arr!47083 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153997 (not res!966934)) b!1433124))

(assert (= (and b!1433124 c!132591) b!1433123))

(assert (= (and b!1433124 (not c!132591)) b!1433122))

(assert (= (and b!1433123 res!966935) b!1433121))

(assert (= (or b!1433121 b!1433122) bm!67480))

(declare-fun m!1322943 () Bool)

(assert (=> bm!67480 m!1322943))

(declare-fun m!1322945 () Bool)

(assert (=> b!1433123 m!1322945))

(declare-fun m!1322947 () Bool)

(assert (=> b!1433123 m!1322947))

(declare-fun m!1322949 () Bool)

(assert (=> b!1433123 m!1322949))

(assert (=> b!1433123 m!1322945))

(declare-fun m!1322951 () Bool)

(assert (=> b!1433123 m!1322951))

(assert (=> b!1433124 m!1322945))

(assert (=> b!1433124 m!1322945))

(declare-fun m!1322953 () Bool)

(assert (=> b!1433124 m!1322953))

(assert (=> b!1433038 d!153997))

(declare-fun b!1433206 () Bool)

(declare-fun lt!630922 () SeekEntryResult!11362)

(assert (=> b!1433206 (and (bvsge (index!47842 lt!630922) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630922) (size!47633 a!2831)))))

(declare-fun e!808962 () Bool)

(assert (=> b!1433206 (= e!808962 (= (select (arr!47083 a!2831) (index!47842 lt!630922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433207 () Bool)

(declare-fun e!808959 () SeekEntryResult!11362)

(declare-fun e!808961 () SeekEntryResult!11362)

(assert (=> b!1433207 (= e!808959 e!808961)))

(declare-fun lt!630923 () (_ BitVec 64))

(declare-fun c!132616 () Bool)

(assert (=> b!1433207 (= c!132616 (or (= lt!630923 (select (arr!47083 a!2831) j!81)) (= (bvadd lt!630923 lt!630923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433208 () Bool)

(declare-fun e!808958 () Bool)

(assert (=> b!1433208 (= e!808958 (bvsge (x!129476 lt!630922) #b01111111111111111111111111111110))))

(declare-fun b!1433209 () Bool)

(declare-fun e!808960 () Bool)

(assert (=> b!1433209 (= e!808958 e!808960)))

(declare-fun res!966971 () Bool)

(assert (=> b!1433209 (= res!966971 (and (is-Intermediate!11362 lt!630922) (not (undefined!12174 lt!630922)) (bvslt (x!129476 lt!630922) #b01111111111111111111111111111110) (bvsge (x!129476 lt!630922) #b00000000000000000000000000000000) (bvsge (x!129476 lt!630922) #b00000000000000000000000000000000)))))

(assert (=> b!1433209 (=> (not res!966971) (not e!808960))))

(declare-fun b!1433210 () Bool)

(assert (=> b!1433210 (= e!808961 (Intermediate!11362 false (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433211 () Bool)

(assert (=> b!1433211 (= e!808961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47083 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433212 () Bool)

(assert (=> b!1433212 (= e!808959 (Intermediate!11362 true (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154005 () Bool)

(assert (=> d!154005 e!808958))

(declare-fun c!132618 () Bool)

(assert (=> d!154005 (= c!132618 (and (is-Intermediate!11362 lt!630922) (undefined!12174 lt!630922)))))

(assert (=> d!154005 (= lt!630922 e!808959)))

(declare-fun c!132617 () Bool)

(assert (=> d!154005 (= c!132617 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154005 (= lt!630923 (select (arr!47083 a!2831) (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608)))))

(assert (=> d!154005 (validMask!0 mask!2608)))

(assert (=> d!154005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!630922)))

(declare-fun b!1433213 () Bool)

(assert (=> b!1433213 (and (bvsge (index!47842 lt!630922) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630922) (size!47633 a!2831)))))

(declare-fun res!966972 () Bool)

(assert (=> b!1433213 (= res!966972 (= (select (arr!47083 a!2831) (index!47842 lt!630922)) (select (arr!47083 a!2831) j!81)))))

(assert (=> b!1433213 (=> res!966972 e!808962)))

(assert (=> b!1433213 (= e!808960 e!808962)))

(declare-fun b!1433214 () Bool)

(assert (=> b!1433214 (and (bvsge (index!47842 lt!630922) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630922) (size!47633 a!2831)))))

(declare-fun res!966970 () Bool)

(assert (=> b!1433214 (= res!966970 (= (select (arr!47083 a!2831) (index!47842 lt!630922)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433214 (=> res!966970 e!808962)))

(assert (= (and d!154005 c!132617) b!1433212))

(assert (= (and d!154005 (not c!132617)) b!1433207))

(assert (= (and b!1433207 c!132616) b!1433210))

(assert (= (and b!1433207 (not c!132616)) b!1433211))

(assert (= (and d!154005 c!132618) b!1433208))

(assert (= (and d!154005 (not c!132618)) b!1433209))

(assert (= (and b!1433209 res!966971) b!1433213))

(assert (= (and b!1433213 (not res!966972)) b!1433214))

(assert (= (and b!1433214 (not res!966970)) b!1433206))

(declare-fun m!1322983 () Bool)

(assert (=> b!1433213 m!1322983))

(assert (=> b!1433211 m!1322887))

(declare-fun m!1322985 () Bool)

(assert (=> b!1433211 m!1322985))

(assert (=> b!1433211 m!1322985))

(assert (=> b!1433211 m!1322881))

(declare-fun m!1322987 () Bool)

(assert (=> b!1433211 m!1322987))

(assert (=> b!1433206 m!1322983))

(assert (=> b!1433214 m!1322983))

(assert (=> d!154005 m!1322887))

(declare-fun m!1322989 () Bool)

(assert (=> d!154005 m!1322989))

(assert (=> d!154005 m!1322899))

(assert (=> b!1433037 d!154005))

(declare-fun d!154021 () Bool)

(declare-fun lt!630936 () (_ BitVec 32))

(declare-fun lt!630935 () (_ BitVec 32))

(assert (=> d!154021 (= lt!630936 (bvmul (bvxor lt!630935 (bvlshr lt!630935 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154021 (= lt!630935 ((_ extract 31 0) (bvand (bvxor (select (arr!47083 a!2831) j!81) (bvlshr (select (arr!47083 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154021 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966973 (let ((h!34915 ((_ extract 31 0) (bvand (bvxor (select (arr!47083 a!2831) j!81) (bvlshr (select (arr!47083 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129482 (bvmul (bvxor h!34915 (bvlshr h!34915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129482 (bvlshr x!129482 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966973 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966973 #b00000000000000000000000000000000))))))

(assert (=> d!154021 (= (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) (bvand (bvxor lt!630936 (bvlshr lt!630936 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433037 d!154021))

(declare-fun d!154025 () Bool)

(assert (=> d!154025 (= (validKeyInArray!0 (select (arr!47083 a!2831) j!81)) (and (not (= (select (arr!47083 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47083 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433041 d!154025))

(declare-fun d!154029 () Bool)

(declare-fun res!966980 () Bool)

(declare-fun e!808971 () Bool)

(assert (=> d!154029 (=> res!966980 e!808971)))

(assert (=> d!154029 (= res!966980 (bvsge j!81 (size!47633 a!2831)))))

(assert (=> d!154029 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808971)))

(declare-fun b!1433225 () Bool)

(declare-fun e!808972 () Bool)

(declare-fun call!67492 () Bool)

(assert (=> b!1433225 (= e!808972 call!67492)))

(declare-fun b!1433226 () Bool)

(declare-fun e!808973 () Bool)

(assert (=> b!1433226 (= e!808973 call!67492)))

(declare-fun bm!67489 () Bool)

(assert (=> bm!67489 (= call!67492 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433227 () Bool)

(assert (=> b!1433227 (= e!808973 e!808972)))

(declare-fun lt!630939 () (_ BitVec 64))

(assert (=> b!1433227 (= lt!630939 (select (arr!47083 a!2831) j!81))))

(declare-fun lt!630940 () Unit!48470)

(assert (=> b!1433227 (= lt!630940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630939 j!81))))

(assert (=> b!1433227 (arrayContainsKey!0 a!2831 lt!630939 #b00000000000000000000000000000000)))

(declare-fun lt!630938 () Unit!48470)

(assert (=> b!1433227 (= lt!630938 lt!630940)))

(declare-fun res!966981 () Bool)

(assert (=> b!1433227 (= res!966981 (= (seekEntryOrOpen!0 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) (Found!11362 j!81)))))

(assert (=> b!1433227 (=> (not res!966981) (not e!808972))))

(declare-fun b!1433228 () Bool)

(assert (=> b!1433228 (= e!808971 e!808973)))

(declare-fun c!132621 () Bool)

(assert (=> b!1433228 (= c!132621 (validKeyInArray!0 (select (arr!47083 a!2831) j!81)))))

(assert (= (and d!154029 (not res!966980)) b!1433228))

(assert (= (and b!1433228 c!132621) b!1433227))

(assert (= (and b!1433228 (not c!132621)) b!1433226))

(assert (= (and b!1433227 res!966981) b!1433225))

(assert (= (or b!1433225 b!1433226) bm!67489))

(declare-fun m!1322995 () Bool)

(assert (=> bm!67489 m!1322995))

(assert (=> b!1433227 m!1322881))

(declare-fun m!1322997 () Bool)

(assert (=> b!1433227 m!1322997))

(declare-fun m!1322999 () Bool)

(assert (=> b!1433227 m!1322999))

(assert (=> b!1433227 m!1322881))

(assert (=> b!1433227 m!1322897))

(assert (=> b!1433228 m!1322881))

(assert (=> b!1433228 m!1322881))

(assert (=> b!1433228 m!1322895))

(assert (=> b!1433044 d!154029))

(declare-fun d!154031 () Bool)

(assert (=> d!154031 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630943 () Unit!48470)

(declare-fun choose!38 (array!97552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48470)

(assert (=> d!154031 (= lt!630943 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154031 (validMask!0 mask!2608)))

(assert (=> d!154031 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630943)))

(declare-fun bs!41735 () Bool)

(assert (= bs!41735 d!154031))

(assert (=> bs!41735 m!1322879))

(declare-fun m!1323009 () Bool)

(assert (=> bs!41735 m!1323009))

(assert (=> bs!41735 m!1322899))

(assert (=> b!1433044 d!154031))

(declare-fun d!154035 () Bool)

(assert (=> d!154035 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123580 d!154035))

(declare-fun d!154053 () Bool)

(assert (=> d!154053 (= (array_inv!36111 a!2831) (bvsge (size!47633 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123580 d!154053))

(declare-fun b!1433269 () Bool)

(declare-fun lt!630960 () SeekEntryResult!11362)

(assert (=> b!1433269 (and (bvsge (index!47842 lt!630960) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630960) (size!47633 lt!630847)))))

(declare-fun e!809003 () Bool)

(assert (=> b!1433269 (= e!809003 (= (select (arr!47083 lt!630847) (index!47842 lt!630960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433270 () Bool)

(declare-fun e!809000 () SeekEntryResult!11362)

(declare-fun e!809002 () SeekEntryResult!11362)

(assert (=> b!1433270 (= e!809000 e!809002)))

(declare-fun c!132634 () Bool)

(declare-fun lt!630961 () (_ BitVec 64))

(assert (=> b!1433270 (= c!132634 (or (= lt!630961 lt!630850) (= (bvadd lt!630961 lt!630961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433271 () Bool)

(declare-fun e!808999 () Bool)

(assert (=> b!1433271 (= e!808999 (bvsge (x!129476 lt!630960) #b01111111111111111111111111111110))))

(declare-fun b!1433272 () Bool)

(declare-fun e!809001 () Bool)

(assert (=> b!1433272 (= e!808999 e!809001)))

(declare-fun res!966999 () Bool)

(assert (=> b!1433272 (= res!966999 (and (is-Intermediate!11362 lt!630960) (not (undefined!12174 lt!630960)) (bvslt (x!129476 lt!630960) #b01111111111111111111111111111110) (bvsge (x!129476 lt!630960) #b00000000000000000000000000000000) (bvsge (x!129476 lt!630960) #b00000000000000000000000000000000)))))

(assert (=> b!1433272 (=> (not res!966999) (not e!809001))))

(declare-fun b!1433273 () Bool)

(assert (=> b!1433273 (= e!809002 (Intermediate!11362 false (toIndex!0 lt!630850 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433274 () Bool)

(assert (=> b!1433274 (= e!809002 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630850 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630850 lt!630847 mask!2608))))

(declare-fun b!1433275 () Bool)

(assert (=> b!1433275 (= e!809000 (Intermediate!11362 true (toIndex!0 lt!630850 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154059 () Bool)

(assert (=> d!154059 e!808999))

(declare-fun c!132636 () Bool)

(assert (=> d!154059 (= c!132636 (and (is-Intermediate!11362 lt!630960) (undefined!12174 lt!630960)))))

(assert (=> d!154059 (= lt!630960 e!809000)))

(declare-fun c!132635 () Bool)

(assert (=> d!154059 (= c!132635 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154059 (= lt!630961 (select (arr!47083 lt!630847) (toIndex!0 lt!630850 mask!2608)))))

(assert (=> d!154059 (validMask!0 mask!2608)))

(assert (=> d!154059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630850 mask!2608) lt!630850 lt!630847 mask!2608) lt!630960)))

(declare-fun b!1433276 () Bool)

(assert (=> b!1433276 (and (bvsge (index!47842 lt!630960) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630960) (size!47633 lt!630847)))))

(declare-fun res!967000 () Bool)

(assert (=> b!1433276 (= res!967000 (= (select (arr!47083 lt!630847) (index!47842 lt!630960)) lt!630850))))

(assert (=> b!1433276 (=> res!967000 e!809003)))

(assert (=> b!1433276 (= e!809001 e!809003)))

(declare-fun b!1433277 () Bool)

(assert (=> b!1433277 (and (bvsge (index!47842 lt!630960) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630960) (size!47633 lt!630847)))))

(declare-fun res!966998 () Bool)

(assert (=> b!1433277 (= res!966998 (= (select (arr!47083 lt!630847) (index!47842 lt!630960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433277 (=> res!966998 e!809003)))

(assert (= (and d!154059 c!132635) b!1433275))

(assert (= (and d!154059 (not c!132635)) b!1433270))

(assert (= (and b!1433270 c!132634) b!1433273))

(assert (= (and b!1433270 (not c!132634)) b!1433274))

(assert (= (and d!154059 c!132636) b!1433271))

(assert (= (and d!154059 (not c!132636)) b!1433272))

(assert (= (and b!1433272 res!966999) b!1433276))

(assert (= (and b!1433276 (not res!967000)) b!1433277))

(assert (= (and b!1433277 (not res!966998)) b!1433269))

(declare-fun m!1323047 () Bool)

(assert (=> b!1433276 m!1323047))

(assert (=> b!1433274 m!1322907))

(declare-fun m!1323049 () Bool)

(assert (=> b!1433274 m!1323049))

(assert (=> b!1433274 m!1323049))

(declare-fun m!1323051 () Bool)

(assert (=> b!1433274 m!1323051))

(assert (=> b!1433269 m!1323047))

(assert (=> b!1433277 m!1323047))

(assert (=> d!154059 m!1322907))

(declare-fun m!1323053 () Bool)

(assert (=> d!154059 m!1323053))

(assert (=> d!154059 m!1322899))

(assert (=> b!1433042 d!154059))

(declare-fun d!154065 () Bool)

(declare-fun lt!630963 () (_ BitVec 32))

(declare-fun lt!630962 () (_ BitVec 32))

(assert (=> d!154065 (= lt!630963 (bvmul (bvxor lt!630962 (bvlshr lt!630962 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154065 (= lt!630962 ((_ extract 31 0) (bvand (bvxor lt!630850 (bvlshr lt!630850 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154065 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966973 (let ((h!34915 ((_ extract 31 0) (bvand (bvxor lt!630850 (bvlshr lt!630850 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129482 (bvmul (bvxor h!34915 (bvlshr h!34915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129482 (bvlshr x!129482 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966973 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966973 #b00000000000000000000000000000000))))))

(assert (=> d!154065 (= (toIndex!0 lt!630850 mask!2608) (bvand (bvxor lt!630963 (bvlshr lt!630963 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433042 d!154065))

(declare-fun b!1433278 () Bool)

(declare-fun lt!630964 () SeekEntryResult!11362)

(assert (=> b!1433278 (and (bvsge (index!47842 lt!630964) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630964) (size!47633 lt!630847)))))

(declare-fun e!809008 () Bool)

(assert (=> b!1433278 (= e!809008 (= (select (arr!47083 lt!630847) (index!47842 lt!630964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433279 () Bool)

(declare-fun e!809005 () SeekEntryResult!11362)

(declare-fun e!809007 () SeekEntryResult!11362)

(assert (=> b!1433279 (= e!809005 e!809007)))

(declare-fun c!132637 () Bool)

(declare-fun lt!630965 () (_ BitVec 64))

(assert (=> b!1433279 (= c!132637 (or (= lt!630965 lt!630850) (= (bvadd lt!630965 lt!630965) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433280 () Bool)

(declare-fun e!809004 () Bool)

(assert (=> b!1433280 (= e!809004 (bvsge (x!129476 lt!630964) #b01111111111111111111111111111110))))

(declare-fun b!1433281 () Bool)

(declare-fun e!809006 () Bool)

(assert (=> b!1433281 (= e!809004 e!809006)))

(declare-fun res!967002 () Bool)

(assert (=> b!1433281 (= res!967002 (and (is-Intermediate!11362 lt!630964) (not (undefined!12174 lt!630964)) (bvslt (x!129476 lt!630964) #b01111111111111111111111111111110) (bvsge (x!129476 lt!630964) #b00000000000000000000000000000000) (bvsge (x!129476 lt!630964) x!605)))))

(assert (=> b!1433281 (=> (not res!967002) (not e!809006))))

(declare-fun b!1433282 () Bool)

(assert (=> b!1433282 (= e!809007 (Intermediate!11362 false index!585 x!605))))

(declare-fun b!1433283 () Bool)

(assert (=> b!1433283 (= e!809007 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630850 lt!630847 mask!2608))))

(declare-fun b!1433284 () Bool)

(assert (=> b!1433284 (= e!809005 (Intermediate!11362 true index!585 x!605))))

(declare-fun d!154067 () Bool)

(assert (=> d!154067 e!809004))

(declare-fun c!132639 () Bool)

(assert (=> d!154067 (= c!132639 (and (is-Intermediate!11362 lt!630964) (undefined!12174 lt!630964)))))

(assert (=> d!154067 (= lt!630964 e!809005)))

(declare-fun c!132638 () Bool)

(assert (=> d!154067 (= c!132638 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154067 (= lt!630965 (select (arr!47083 lt!630847) index!585))))

(assert (=> d!154067 (validMask!0 mask!2608)))

(assert (=> d!154067 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630850 lt!630847 mask!2608) lt!630964)))

(declare-fun b!1433285 () Bool)

(assert (=> b!1433285 (and (bvsge (index!47842 lt!630964) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630964) (size!47633 lt!630847)))))

(declare-fun res!967003 () Bool)

(assert (=> b!1433285 (= res!967003 (= (select (arr!47083 lt!630847) (index!47842 lt!630964)) lt!630850))))

(assert (=> b!1433285 (=> res!967003 e!809008)))

(assert (=> b!1433285 (= e!809006 e!809008)))

(declare-fun b!1433286 () Bool)

(assert (=> b!1433286 (and (bvsge (index!47842 lt!630964) #b00000000000000000000000000000000) (bvslt (index!47842 lt!630964) (size!47633 lt!630847)))))

(declare-fun res!967001 () Bool)

(assert (=> b!1433286 (= res!967001 (= (select (arr!47083 lt!630847) (index!47842 lt!630964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433286 (=> res!967001 e!809008)))

(assert (= (and d!154067 c!132638) b!1433284))

(assert (= (and d!154067 (not c!132638)) b!1433279))

(assert (= (and b!1433279 c!132637) b!1433282))

(assert (= (and b!1433279 (not c!132637)) b!1433283))

(assert (= (and d!154067 c!132639) b!1433280))

(assert (= (and d!154067 (not c!132639)) b!1433281))

(assert (= (and b!1433281 res!967002) b!1433285))

(assert (= (and b!1433285 (not res!967003)) b!1433286))

(assert (= (and b!1433286 (not res!967001)) b!1433278))

(declare-fun m!1323055 () Bool)

(assert (=> b!1433285 m!1323055))

(assert (=> b!1433283 m!1322903))

(assert (=> b!1433283 m!1322903))

(declare-fun m!1323057 () Bool)

(assert (=> b!1433283 m!1323057))

(assert (=> b!1433278 m!1323055))

(assert (=> b!1433286 m!1323055))

(declare-fun m!1323059 () Bool)

(assert (=> d!154067 m!1323059))

(assert (=> d!154067 m!1322899))

(assert (=> b!1433036 d!154067))

(declare-fun d!154069 () Bool)

(declare-fun lt!630982 () SeekEntryResult!11362)

(assert (=> d!154069 (and (or (is-Undefined!11362 lt!630982) (not (is-Found!11362 lt!630982)) (and (bvsge (index!47841 lt!630982) #b00000000000000000000000000000000) (bvslt (index!47841 lt!630982) (size!47633 a!2831)))) (or (is-Undefined!11362 lt!630982) (is-Found!11362 lt!630982) (not (is-MissingZero!11362 lt!630982)) (and (bvsge (index!47840 lt!630982) #b00000000000000000000000000000000) (bvslt (index!47840 lt!630982) (size!47633 a!2831)))) (or (is-Undefined!11362 lt!630982) (is-Found!11362 lt!630982) (is-MissingZero!11362 lt!630982) (not (is-MissingVacant!11362 lt!630982)) (and (bvsge (index!47843 lt!630982) #b00000000000000000000000000000000) (bvslt (index!47843 lt!630982) (size!47633 a!2831)))) (or (is-Undefined!11362 lt!630982) (ite (is-Found!11362 lt!630982) (= (select (arr!47083 a!2831) (index!47841 lt!630982)) (select (arr!47083 a!2831) j!81)) (ite (is-MissingZero!11362 lt!630982) (= (select (arr!47083 a!2831) (index!47840 lt!630982)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11362 lt!630982) (= (select (arr!47083 a!2831) (index!47843 lt!630982)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!809024 () SeekEntryResult!11362)

(assert (=> d!154069 (= lt!630982 e!809024)))

(declare-fun c!132655 () Bool)

(declare-fun lt!630981 () SeekEntryResult!11362)

(assert (=> d!154069 (= c!132655 (and (is-Intermediate!11362 lt!630981) (undefined!12174 lt!630981)))))

(assert (=> d!154069 (= lt!630981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) (select (arr!47083 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154069 (validMask!0 mask!2608)))

(assert (=> d!154069 (= (seekEntryOrOpen!0 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!630982)))

(declare-fun b!1433317 () Bool)

(declare-fun e!809025 () SeekEntryResult!11362)

(assert (=> b!1433317 (= e!809025 (MissingZero!11362 (index!47842 lt!630981)))))

(declare-fun b!1433318 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97552 (_ BitVec 32)) SeekEntryResult!11362)

(assert (=> b!1433318 (= e!809025 (seekKeyOrZeroReturnVacant!0 (x!129476 lt!630981) (index!47842 lt!630981) (index!47842 lt!630981) (select (arr!47083 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433319 () Bool)

(declare-fun e!809026 () SeekEntryResult!11362)

(assert (=> b!1433319 (= e!809024 e!809026)))

(declare-fun lt!630983 () (_ BitVec 64))

(assert (=> b!1433319 (= lt!630983 (select (arr!47083 a!2831) (index!47842 lt!630981)))))

(declare-fun c!132656 () Bool)

(assert (=> b!1433319 (= c!132656 (= lt!630983 (select (arr!47083 a!2831) j!81)))))

(declare-fun b!1433320 () Bool)

(assert (=> b!1433320 (= e!809026 (Found!11362 (index!47842 lt!630981)))))

(declare-fun b!1433321 () Bool)

(declare-fun c!132657 () Bool)

(assert (=> b!1433321 (= c!132657 (= lt!630983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433321 (= e!809026 e!809025)))

(declare-fun b!1433322 () Bool)

(assert (=> b!1433322 (= e!809024 Undefined!11362)))

(assert (= (and d!154069 c!132655) b!1433322))

(assert (= (and d!154069 (not c!132655)) b!1433319))

(assert (= (and b!1433319 c!132656) b!1433320))

(assert (= (and b!1433319 (not c!132656)) b!1433321))

(assert (= (and b!1433321 c!132657) b!1433317))

(assert (= (and b!1433321 (not c!132657)) b!1433318))

(assert (=> d!154069 m!1322887))

(assert (=> d!154069 m!1322881))

(assert (=> d!154069 m!1322889))

(assert (=> d!154069 m!1322899))

(declare-fun m!1323071 () Bool)

(assert (=> d!154069 m!1323071))

(declare-fun m!1323073 () Bool)

(assert (=> d!154069 m!1323073))

(assert (=> d!154069 m!1322881))

(assert (=> d!154069 m!1322887))

(declare-fun m!1323075 () Bool)

(assert (=> d!154069 m!1323075))

(assert (=> b!1433318 m!1322881))

(declare-fun m!1323077 () Bool)

(assert (=> b!1433318 m!1323077))

(declare-fun m!1323079 () Bool)

(assert (=> b!1433319 m!1323079))

(assert (=> b!1433046 d!154069))

(declare-fun b!1433342 () Bool)

(declare-fun e!809041 () Bool)

