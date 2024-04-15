; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123018 () Bool)

(assert start!123018)

(declare-fun b!1426842 () Bool)

(declare-fun res!962127 () Bool)

(declare-fun e!805924 () Bool)

(assert (=> b!1426842 (=> (not res!962127) (not e!805924))))

(declare-datatypes ((array!97285 0))(
  ( (array!97286 (arr!46959 (Array (_ BitVec 32) (_ BitVec 64))) (size!47511 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97285)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426842 (= res!962127 (validKeyInArray!0 (select (arr!46959 a!2831) j!81)))))

(declare-fun b!1426843 () Bool)

(declare-fun res!962134 () Bool)

(assert (=> b!1426843 (=> (not res!962134) (not e!805924))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426843 (= res!962134 (and (= (size!47511 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47511 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47511 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426844 () Bool)

(declare-fun res!962129 () Bool)

(assert (=> b!1426844 (=> (not res!962129) (not e!805924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97285 (_ BitVec 32)) Bool)

(assert (=> b!1426844 (= res!962129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426845 () Bool)

(declare-fun e!805922 () Bool)

(declare-fun e!805921 () Bool)

(assert (=> b!1426845 (= e!805922 e!805921)))

(declare-fun res!962125 () Bool)

(assert (=> b!1426845 (=> (not res!962125) (not e!805921))))

(declare-fun lt!628170 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11265 0))(
  ( (MissingZero!11265 (index!47452 (_ BitVec 32))) (Found!11265 (index!47453 (_ BitVec 32))) (Intermediate!11265 (undefined!12077 Bool) (index!47454 (_ BitVec 32)) (x!129070 (_ BitVec 32))) (Undefined!11265) (MissingVacant!11265 (index!47455 (_ BitVec 32))) )
))
(declare-fun lt!628168 () SeekEntryResult!11265)

(declare-fun lt!628171 () array!97285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97285 (_ BitVec 32)) SeekEntryResult!11265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426845 (= res!962125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628170 mask!2608) lt!628170 lt!628171 mask!2608) lt!628168))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426845 (= lt!628168 (Intermediate!11265 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426845 (= lt!628170 (select (store (arr!46959 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426845 (= lt!628171 (array!97286 (store (arr!46959 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47511 a!2831)))))

(declare-fun b!1426846 () Bool)

(declare-fun res!962132 () Bool)

(assert (=> b!1426846 (=> (not res!962132) (not e!805921))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1426846 (= res!962132 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426847 () Bool)

(declare-fun res!962137 () Bool)

(assert (=> b!1426847 (=> (not res!962137) (not e!805921))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628169 () SeekEntryResult!11265)

(assert (=> b!1426847 (= res!962137 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!628169))))

(declare-fun b!1426848 () Bool)

(declare-fun res!962136 () Bool)

(assert (=> b!1426848 (=> (not res!962136) (not e!805924))))

(declare-datatypes ((List!33547 0))(
  ( (Nil!33544) (Cons!33543 (h!34848 (_ BitVec 64)) (t!48233 List!33547)) )
))
(declare-fun arrayNoDuplicates!0 (array!97285 (_ BitVec 32) List!33547) Bool)

(assert (=> b!1426848 (= res!962136 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33544))))

(declare-fun b!1426849 () Bool)

(declare-fun res!962128 () Bool)

(assert (=> b!1426849 (=> (not res!962128) (not e!805924))))

(assert (=> b!1426849 (= res!962128 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47511 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47511 a!2831))))))

(declare-fun e!805925 () Bool)

(declare-fun b!1426850 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97285 (_ BitVec 32)) SeekEntryResult!11265)

(assert (=> b!1426850 (= e!805925 (= (seekEntryOrOpen!0 (select (arr!46959 a!2831) j!81) a!2831 mask!2608) (Found!11265 j!81)))))

(declare-fun b!1426851 () Bool)

(assert (=> b!1426851 (= e!805924 e!805922)))

(declare-fun res!962133 () Bool)

(assert (=> b!1426851 (=> (not res!962133) (not e!805922))))

(assert (=> b!1426851 (= res!962133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!628169))))

(assert (=> b!1426851 (= lt!628169 (Intermediate!11265 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426852 () Bool)

(declare-fun res!962130 () Bool)

(assert (=> b!1426852 (=> (not res!962130) (not e!805921))))

(assert (=> b!1426852 (= res!962130 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628170 lt!628171 mask!2608) lt!628168))))

(declare-fun res!962126 () Bool)

(assert (=> start!123018 (=> (not res!962126) (not e!805924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123018 (= res!962126 (validMask!0 mask!2608))))

(assert (=> start!123018 e!805924))

(assert (=> start!123018 true))

(declare-fun array_inv!36192 (array!97285) Bool)

(assert (=> start!123018 (array_inv!36192 a!2831)))

(declare-fun b!1426853 () Bool)

(declare-fun res!962131 () Bool)

(assert (=> b!1426853 (=> (not res!962131) (not e!805924))))

(assert (=> b!1426853 (= res!962131 (validKeyInArray!0 (select (arr!46959 a!2831) i!982)))))

(declare-fun b!1426854 () Bool)

(assert (=> b!1426854 (= e!805921 (not (not (= (select (arr!46959 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426854 e!805925))

(declare-fun res!962135 () Bool)

(assert (=> b!1426854 (=> (not res!962135) (not e!805925))))

(assert (=> b!1426854 (= res!962135 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48115 0))(
  ( (Unit!48116) )
))
(declare-fun lt!628172 () Unit!48115)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48115)

(assert (=> b!1426854 (= lt!628172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123018 res!962126) b!1426843))

(assert (= (and b!1426843 res!962134) b!1426853))

(assert (= (and b!1426853 res!962131) b!1426842))

(assert (= (and b!1426842 res!962127) b!1426844))

(assert (= (and b!1426844 res!962129) b!1426848))

(assert (= (and b!1426848 res!962136) b!1426849))

(assert (= (and b!1426849 res!962128) b!1426851))

(assert (= (and b!1426851 res!962133) b!1426845))

(assert (= (and b!1426845 res!962125) b!1426847))

(assert (= (and b!1426847 res!962137) b!1426852))

(assert (= (and b!1426852 res!962130) b!1426846))

(assert (= (and b!1426846 res!962132) b!1426854))

(assert (= (and b!1426854 res!962135) b!1426850))

(declare-fun m!1316867 () Bool)

(assert (=> b!1426850 m!1316867))

(assert (=> b!1426850 m!1316867))

(declare-fun m!1316869 () Bool)

(assert (=> b!1426850 m!1316869))

(assert (=> b!1426847 m!1316867))

(assert (=> b!1426847 m!1316867))

(declare-fun m!1316871 () Bool)

(assert (=> b!1426847 m!1316871))

(assert (=> b!1426842 m!1316867))

(assert (=> b!1426842 m!1316867))

(declare-fun m!1316873 () Bool)

(assert (=> b!1426842 m!1316873))

(declare-fun m!1316875 () Bool)

(assert (=> b!1426845 m!1316875))

(assert (=> b!1426845 m!1316875))

(declare-fun m!1316877 () Bool)

(assert (=> b!1426845 m!1316877))

(declare-fun m!1316879 () Bool)

(assert (=> b!1426845 m!1316879))

(declare-fun m!1316881 () Bool)

(assert (=> b!1426845 m!1316881))

(declare-fun m!1316883 () Bool)

(assert (=> b!1426853 m!1316883))

(assert (=> b!1426853 m!1316883))

(declare-fun m!1316885 () Bool)

(assert (=> b!1426853 m!1316885))

(declare-fun m!1316887 () Bool)

(assert (=> b!1426848 m!1316887))

(assert (=> b!1426851 m!1316867))

(assert (=> b!1426851 m!1316867))

(declare-fun m!1316889 () Bool)

(assert (=> b!1426851 m!1316889))

(assert (=> b!1426851 m!1316889))

(assert (=> b!1426851 m!1316867))

(declare-fun m!1316891 () Bool)

(assert (=> b!1426851 m!1316891))

(declare-fun m!1316893 () Bool)

(assert (=> start!123018 m!1316893))

(declare-fun m!1316895 () Bool)

(assert (=> start!123018 m!1316895))

(declare-fun m!1316897 () Bool)

(assert (=> b!1426854 m!1316897))

(declare-fun m!1316899 () Bool)

(assert (=> b!1426854 m!1316899))

(declare-fun m!1316901 () Bool)

(assert (=> b!1426854 m!1316901))

(declare-fun m!1316903 () Bool)

(assert (=> b!1426844 m!1316903))

(declare-fun m!1316905 () Bool)

(assert (=> b!1426852 m!1316905))

(push 1)

(assert (not b!1426854))

(assert (not b!1426848))

(assert (not b!1426852))

(assert (not b!1426842))

(assert (not start!123018))

(assert (not b!1426844))

(assert (not b!1426845))

(assert (not b!1426847))

(assert (not b!1426851))

(assert (not b!1426850))

(assert (not b!1426853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153137 () Bool)

(assert (=> d!153137 (= (validKeyInArray!0 (select (arr!46959 a!2831) i!982)) (and (not (= (select (arr!46959 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46959 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426853 d!153137))

(declare-fun b!1426878 () Bool)

(declare-fun e!805944 () Bool)

(declare-fun call!67328 () Bool)

(assert (=> b!1426878 (= e!805944 call!67328)))

(declare-fun d!153141 () Bool)

(declare-fun res!962151 () Bool)

(declare-fun e!805945 () Bool)

(assert (=> d!153141 (=> res!962151 e!805945)))

(assert (=> d!153141 (= res!962151 (bvsge j!81 (size!47511 a!2831)))))

(assert (=> d!153141 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!805945)))

(declare-fun b!1426879 () Bool)

(declare-fun e!805946 () Bool)

(assert (=> b!1426879 (= e!805944 e!805946)))

(declare-fun lt!628179 () (_ BitVec 64))

(assert (=> b!1426879 (= lt!628179 (select (arr!46959 a!2831) j!81))))

(declare-fun lt!628180 () Unit!48115)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97285 (_ BitVec 64) (_ BitVec 32)) Unit!48115)

(assert (=> b!1426879 (= lt!628180 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628179 j!81))))

(declare-fun arrayContainsKey!0 (array!97285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1426879 (arrayContainsKey!0 a!2831 lt!628179 #b00000000000000000000000000000000)))

(declare-fun lt!628181 () Unit!48115)

(assert (=> b!1426879 (= lt!628181 lt!628180)))

(declare-fun res!962152 () Bool)

(assert (=> b!1426879 (= res!962152 (= (seekEntryOrOpen!0 (select (arr!46959 a!2831) j!81) a!2831 mask!2608) (Found!11265 j!81)))))

(assert (=> b!1426879 (=> (not res!962152) (not e!805946))))

(declare-fun b!1426880 () Bool)

(assert (=> b!1426880 (= e!805946 call!67328)))

(declare-fun bm!67325 () Bool)

(assert (=> bm!67325 (= call!67328 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1426881 () Bool)

(assert (=> b!1426881 (= e!805945 e!805944)))

(declare-fun c!131854 () Bool)

(assert (=> b!1426881 (= c!131854 (validKeyInArray!0 (select (arr!46959 a!2831) j!81)))))

(assert (= (and d!153141 (not res!962151)) b!1426881))

(assert (= (and b!1426881 c!131854) b!1426879))

(assert (= (and b!1426881 (not c!131854)) b!1426878))

(assert (= (and b!1426879 res!962152) b!1426880))

(assert (= (or b!1426880 b!1426878) bm!67325))

(assert (=> b!1426879 m!1316867))

(declare-fun m!1316915 () Bool)

(assert (=> b!1426879 m!1316915))

(declare-fun m!1316917 () Bool)

(assert (=> b!1426879 m!1316917))

(assert (=> b!1426879 m!1316867))

(assert (=> b!1426879 m!1316869))

(declare-fun m!1316919 () Bool)

(assert (=> bm!67325 m!1316919))

(assert (=> b!1426881 m!1316867))

(assert (=> b!1426881 m!1316867))

(assert (=> b!1426881 m!1316873))

(assert (=> b!1426854 d!153141))

(declare-fun d!153145 () Bool)

(assert (=> d!153145 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628190 () Unit!48115)

(declare-fun choose!38 (array!97285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48115)

(assert (=> d!153145 (= lt!628190 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153145 (validMask!0 mask!2608)))

(assert (=> d!153145 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628190)))

(declare-fun bs!41569 () Bool)

(assert (= bs!41569 d!153145))

(assert (=> bs!41569 m!1316899))

(declare-fun m!1316921 () Bool)

(assert (=> bs!41569 m!1316921))

(assert (=> bs!41569 m!1316893))

(assert (=> b!1426854 d!153145))

(declare-fun b!1426951 () Bool)

(declare-fun lt!628211 () SeekEntryResult!11265)

(assert (=> b!1426951 (and (bvsge (index!47454 lt!628211) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628211) (size!47511 lt!628171)))))

(declare-fun res!962176 () Bool)

(assert (=> b!1426951 (= res!962176 (= (select (arr!46959 lt!628171) (index!47454 lt!628211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805990 () Bool)

(assert (=> b!1426951 (=> res!962176 e!805990)))

(declare-fun b!1426952 () Bool)

(declare-fun e!805989 () Bool)

(declare-fun e!805988 () Bool)

(assert (=> b!1426952 (= e!805989 e!805988)))

(declare-fun res!962175 () Bool)

(assert (=> b!1426952 (= res!962175 (and (is-Intermediate!11265 lt!628211) (not (undefined!12077 lt!628211)) (bvslt (x!129070 lt!628211) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628211) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628211) x!605)))))

(assert (=> b!1426952 (=> (not res!962175) (not e!805988))))

(declare-fun b!1426953 () Bool)

(assert (=> b!1426953 (= e!805989 (bvsge (x!129070 lt!628211) #b01111111111111111111111111111110))))

(declare-fun b!1426954 () Bool)

(declare-fun e!805987 () SeekEntryResult!11265)

(declare-fun e!805991 () SeekEntryResult!11265)

(assert (=> b!1426954 (= e!805987 e!805991)))

(declare-fun c!131879 () Bool)

(declare-fun lt!628210 () (_ BitVec 64))

(assert (=> b!1426954 (= c!131879 (or (= lt!628210 lt!628170) (= (bvadd lt!628210 lt!628210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426956 () Bool)

(assert (=> b!1426956 (= e!805991 (Intermediate!11265 false index!585 x!605))))

(declare-fun b!1426957 () Bool)

(assert (=> b!1426957 (and (bvsge (index!47454 lt!628211) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628211) (size!47511 lt!628171)))))

(assert (=> b!1426957 (= e!805990 (= (select (arr!46959 lt!628171) (index!47454 lt!628211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426958 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426958 (= e!805991 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628170 lt!628171 mask!2608))))

(declare-fun b!1426959 () Bool)

(assert (=> b!1426959 (= e!805987 (Intermediate!11265 true index!585 x!605))))

(declare-fun b!1426955 () Bool)

(assert (=> b!1426955 (and (bvsge (index!47454 lt!628211) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628211) (size!47511 lt!628171)))))

(declare-fun res!962174 () Bool)

(assert (=> b!1426955 (= res!962174 (= (select (arr!46959 lt!628171) (index!47454 lt!628211)) lt!628170))))

(assert (=> b!1426955 (=> res!962174 e!805990)))

(assert (=> b!1426955 (= e!805988 e!805990)))

(declare-fun d!153149 () Bool)

(assert (=> d!153149 e!805989))

(declare-fun c!131881 () Bool)

(assert (=> d!153149 (= c!131881 (and (is-Intermediate!11265 lt!628211) (undefined!12077 lt!628211)))))

(assert (=> d!153149 (= lt!628211 e!805987)))

(declare-fun c!131880 () Bool)

(assert (=> d!153149 (= c!131880 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153149 (= lt!628210 (select (arr!46959 lt!628171) index!585))))

(assert (=> d!153149 (validMask!0 mask!2608)))

(assert (=> d!153149 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628170 lt!628171 mask!2608) lt!628211)))

(assert (= (and d!153149 c!131880) b!1426959))

(assert (= (and d!153149 (not c!131880)) b!1426954))

(assert (= (and b!1426954 c!131879) b!1426956))

(assert (= (and b!1426954 (not c!131879)) b!1426958))

(assert (= (and d!153149 c!131881) b!1426953))

(assert (= (and d!153149 (not c!131881)) b!1426952))

(assert (= (and b!1426952 res!962175) b!1426955))

(assert (= (and b!1426955 (not res!962174)) b!1426951))

(assert (= (and b!1426951 (not res!962176)) b!1426957))

(declare-fun m!1316939 () Bool)

(assert (=> b!1426955 m!1316939))

(assert (=> b!1426951 m!1316939))

(declare-fun m!1316941 () Bool)

(assert (=> d!153149 m!1316941))

(assert (=> d!153149 m!1316893))

(declare-fun m!1316943 () Bool)

(assert (=> b!1426958 m!1316943))

(assert (=> b!1426958 m!1316943))

(declare-fun m!1316945 () Bool)

(assert (=> b!1426958 m!1316945))

(assert (=> b!1426957 m!1316939))

(assert (=> b!1426852 d!153149))

(declare-fun d!153155 () Bool)

(assert (=> d!153155 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123018 d!153155))

(declare-fun d!153165 () Bool)

(assert (=> d!153165 (= (array_inv!36192 a!2831) (bvsge (size!47511 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123018 d!153165))

(declare-fun d!153167 () Bool)

(assert (=> d!153167 (= (validKeyInArray!0 (select (arr!46959 a!2831) j!81)) (and (not (= (select (arr!46959 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46959 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426842 d!153167))

(declare-fun b!1426987 () Bool)

(declare-fun lt!628227 () SeekEntryResult!11265)

(assert (=> b!1426987 (and (bvsge (index!47454 lt!628227) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628227) (size!47511 lt!628171)))))

(declare-fun res!962189 () Bool)

(assert (=> b!1426987 (= res!962189 (= (select (arr!46959 lt!628171) (index!47454 lt!628227)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806012 () Bool)

(assert (=> b!1426987 (=> res!962189 e!806012)))

(declare-fun b!1426988 () Bool)

(declare-fun e!806011 () Bool)

(declare-fun e!806010 () Bool)

(assert (=> b!1426988 (= e!806011 e!806010)))

(declare-fun res!962188 () Bool)

(assert (=> b!1426988 (= res!962188 (and (is-Intermediate!11265 lt!628227) (not (undefined!12077 lt!628227)) (bvslt (x!129070 lt!628227) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628227) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628227) #b00000000000000000000000000000000)))))

(assert (=> b!1426988 (=> (not res!962188) (not e!806010))))

(declare-fun b!1426989 () Bool)

(assert (=> b!1426989 (= e!806011 (bvsge (x!129070 lt!628227) #b01111111111111111111111111111110))))

(declare-fun b!1426990 () Bool)

(declare-fun e!806009 () SeekEntryResult!11265)

(declare-fun e!806013 () SeekEntryResult!11265)

(assert (=> b!1426990 (= e!806009 e!806013)))

(declare-fun c!131891 () Bool)

(declare-fun lt!628226 () (_ BitVec 64))

(assert (=> b!1426990 (= c!131891 (or (= lt!628226 lt!628170) (= (bvadd lt!628226 lt!628226) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426992 () Bool)

(assert (=> b!1426992 (= e!806013 (Intermediate!11265 false (toIndex!0 lt!628170 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426993 () Bool)

(assert (=> b!1426993 (and (bvsge (index!47454 lt!628227) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628227) (size!47511 lt!628171)))))

(assert (=> b!1426993 (= e!806012 (= (select (arr!46959 lt!628171) (index!47454 lt!628227)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426994 () Bool)

(assert (=> b!1426994 (= e!806013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628170 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628170 lt!628171 mask!2608))))

(declare-fun b!1426995 () Bool)

(assert (=> b!1426995 (= e!806009 (Intermediate!11265 true (toIndex!0 lt!628170 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426991 () Bool)

(assert (=> b!1426991 (and (bvsge (index!47454 lt!628227) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628227) (size!47511 lt!628171)))))

(declare-fun res!962187 () Bool)

(assert (=> b!1426991 (= res!962187 (= (select (arr!46959 lt!628171) (index!47454 lt!628227)) lt!628170))))

(assert (=> b!1426991 (=> res!962187 e!806012)))

(assert (=> b!1426991 (= e!806010 e!806012)))

(declare-fun d!153169 () Bool)

(assert (=> d!153169 e!806011))

(declare-fun c!131893 () Bool)

(assert (=> d!153169 (= c!131893 (and (is-Intermediate!11265 lt!628227) (undefined!12077 lt!628227)))))

(assert (=> d!153169 (= lt!628227 e!806009)))

(declare-fun c!131892 () Bool)

(assert (=> d!153169 (= c!131892 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153169 (= lt!628226 (select (arr!46959 lt!628171) (toIndex!0 lt!628170 mask!2608)))))

(assert (=> d!153169 (validMask!0 mask!2608)))

(assert (=> d!153169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628170 mask!2608) lt!628170 lt!628171 mask!2608) lt!628227)))

(assert (= (and d!153169 c!131892) b!1426995))

(assert (= (and d!153169 (not c!131892)) b!1426990))

(assert (= (and b!1426990 c!131891) b!1426992))

(assert (= (and b!1426990 (not c!131891)) b!1426994))

(assert (= (and d!153169 c!131893) b!1426989))

(assert (= (and d!153169 (not c!131893)) b!1426988))

(assert (= (and b!1426988 res!962188) b!1426991))

(assert (= (and b!1426991 (not res!962187)) b!1426987))

(assert (= (and b!1426987 (not res!962189)) b!1426993))

(declare-fun m!1316977 () Bool)

(assert (=> b!1426991 m!1316977))

(assert (=> b!1426987 m!1316977))

(assert (=> d!153169 m!1316875))

(declare-fun m!1316979 () Bool)

(assert (=> d!153169 m!1316979))

(assert (=> d!153169 m!1316893))

(assert (=> b!1426994 m!1316875))

(declare-fun m!1316981 () Bool)

(assert (=> b!1426994 m!1316981))

(assert (=> b!1426994 m!1316981))

(declare-fun m!1316983 () Bool)

(assert (=> b!1426994 m!1316983))

(assert (=> b!1426993 m!1316977))

(assert (=> b!1426845 d!153169))

(declare-fun d!153171 () Bool)

(declare-fun lt!628246 () (_ BitVec 32))

(declare-fun lt!628245 () (_ BitVec 32))

(assert (=> d!153171 (= lt!628246 (bvmul (bvxor lt!628245 (bvlshr lt!628245 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153171 (= lt!628245 ((_ extract 31 0) (bvand (bvxor lt!628170 (bvlshr lt!628170 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153171 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962190 (let ((h!34850 ((_ extract 31 0) (bvand (bvxor lt!628170 (bvlshr lt!628170 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129074 (bvmul (bvxor h!34850 (bvlshr h!34850 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129074 (bvlshr x!129074 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962190 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962190 #b00000000000000000000000000000000))))))

(assert (=> d!153171 (= (toIndex!0 lt!628170 mask!2608) (bvand (bvxor lt!628246 (bvlshr lt!628246 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426845 d!153171))

(declare-fun b!1427008 () Bool)

(declare-fun e!806021 () Bool)

(declare-fun call!67336 () Bool)

(assert (=> b!1427008 (= e!806021 call!67336)))

(declare-fun d!153177 () Bool)

(declare-fun res!962193 () Bool)

(declare-fun e!806022 () Bool)

(assert (=> d!153177 (=> res!962193 e!806022)))

(assert (=> d!153177 (= res!962193 (bvsge #b00000000000000000000000000000000 (size!47511 a!2831)))))

(assert (=> d!153177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806022)))

(declare-fun b!1427009 () Bool)

(declare-fun e!806023 () Bool)

(assert (=> b!1427009 (= e!806021 e!806023)))

(declare-fun lt!628247 () (_ BitVec 64))

(assert (=> b!1427009 (= lt!628247 (select (arr!46959 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628248 () Unit!48115)

(assert (=> b!1427009 (= lt!628248 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628247 #b00000000000000000000000000000000))))

(assert (=> b!1427009 (arrayContainsKey!0 a!2831 lt!628247 #b00000000000000000000000000000000)))

(declare-fun lt!628249 () Unit!48115)

(assert (=> b!1427009 (= lt!628249 lt!628248)))

(declare-fun res!962194 () Bool)

(assert (=> b!1427009 (= res!962194 (= (seekEntryOrOpen!0 (select (arr!46959 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11265 #b00000000000000000000000000000000)))))

(assert (=> b!1427009 (=> (not res!962194) (not e!806023))))

(declare-fun b!1427010 () Bool)

(assert (=> b!1427010 (= e!806023 call!67336)))

(declare-fun bm!67333 () Bool)

(assert (=> bm!67333 (= call!67336 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427011 () Bool)

(assert (=> b!1427011 (= e!806022 e!806021)))

(declare-fun c!131899 () Bool)

(assert (=> b!1427011 (= c!131899 (validKeyInArray!0 (select (arr!46959 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153177 (not res!962193)) b!1427011))

(assert (= (and b!1427011 c!131899) b!1427009))

(assert (= (and b!1427011 (not c!131899)) b!1427008))

(assert (= (and b!1427009 res!962194) b!1427010))

(assert (= (or b!1427010 b!1427008) bm!67333))

(declare-fun m!1316991 () Bool)

(assert (=> b!1427009 m!1316991))

(declare-fun m!1316993 () Bool)

(assert (=> b!1427009 m!1316993))

(declare-fun m!1316995 () Bool)

(assert (=> b!1427009 m!1316995))

(assert (=> b!1427009 m!1316991))

(declare-fun m!1316997 () Bool)

(assert (=> b!1427009 m!1316997))

(declare-fun m!1316999 () Bool)

(assert (=> bm!67333 m!1316999))

(assert (=> b!1427011 m!1316991))

(assert (=> b!1427011 m!1316991))

(declare-fun m!1317001 () Bool)

(assert (=> b!1427011 m!1317001))

(assert (=> b!1426844 d!153177))

(declare-fun d!153179 () Bool)

(declare-fun res!962216 () Bool)

(declare-fun e!806048 () Bool)

(assert (=> d!153179 (=> res!962216 e!806048)))

(assert (=> d!153179 (= res!962216 (bvsge #b00000000000000000000000000000000 (size!47511 a!2831)))))

(assert (=> d!153179 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33544) e!806048)))

(declare-fun b!1427050 () Bool)

(declare-fun e!806051 () Bool)

(assert (=> b!1427050 (= e!806048 e!806051)))

(declare-fun res!962214 () Bool)

(assert (=> b!1427050 (=> (not res!962214) (not e!806051))))

(declare-fun e!806049 () Bool)

(assert (=> b!1427050 (= res!962214 (not e!806049))))

(declare-fun res!962215 () Bool)

(assert (=> b!1427050 (=> (not res!962215) (not e!806049))))

(assert (=> b!1427050 (= res!962215 (validKeyInArray!0 (select (arr!46959 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427051 () Bool)

(declare-fun e!806050 () Bool)

(declare-fun call!67339 () Bool)

(assert (=> b!1427051 (= e!806050 call!67339)))

(declare-fun b!1427052 () Bool)

(assert (=> b!1427052 (= e!806050 call!67339)))

(declare-fun b!1427053 () Bool)

(declare-fun contains!9811 (List!33547 (_ BitVec 64)) Bool)

(assert (=> b!1427053 (= e!806049 (contains!9811 Nil!33544 (select (arr!46959 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427054 () Bool)

(assert (=> b!1427054 (= e!806051 e!806050)))

(declare-fun c!131910 () Bool)

(assert (=> b!1427054 (= c!131910 (validKeyInArray!0 (select (arr!46959 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67336 () Bool)

(assert (=> bm!67336 (= call!67339 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131910 (Cons!33543 (select (arr!46959 a!2831) #b00000000000000000000000000000000) Nil!33544) Nil!33544)))))

(assert (= (and d!153179 (not res!962216)) b!1427050))

(assert (= (and b!1427050 res!962215) b!1427053))

(assert (= (and b!1427050 res!962214) b!1427054))

(assert (= (and b!1427054 c!131910) b!1427052))

(assert (= (and b!1427054 (not c!131910)) b!1427051))

(assert (= (or b!1427052 b!1427051) bm!67336))

(assert (=> b!1427050 m!1316991))

(assert (=> b!1427050 m!1316991))

(assert (=> b!1427050 m!1317001))

(assert (=> b!1427053 m!1316991))

(assert (=> b!1427053 m!1316991))

(declare-fun m!1317017 () Bool)

(assert (=> b!1427053 m!1317017))

(assert (=> b!1427054 m!1316991))

(assert (=> b!1427054 m!1316991))

(assert (=> b!1427054 m!1317001))

(assert (=> bm!67336 m!1316991))

(declare-fun m!1317019 () Bool)

(assert (=> bm!67336 m!1317019))

(assert (=> b!1426848 d!153179))

(declare-fun b!1427055 () Bool)

(declare-fun lt!628258 () SeekEntryResult!11265)

(assert (=> b!1427055 (and (bvsge (index!47454 lt!628258) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628258) (size!47511 a!2831)))))

(declare-fun res!962219 () Bool)

(assert (=> b!1427055 (= res!962219 (= (select (arr!46959 a!2831) (index!47454 lt!628258)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806055 () Bool)

(assert (=> b!1427055 (=> res!962219 e!806055)))

(declare-fun b!1427056 () Bool)

(declare-fun e!806054 () Bool)

(declare-fun e!806053 () Bool)

(assert (=> b!1427056 (= e!806054 e!806053)))

(declare-fun res!962218 () Bool)

(assert (=> b!1427056 (= res!962218 (and (is-Intermediate!11265 lt!628258) (not (undefined!12077 lt!628258)) (bvslt (x!129070 lt!628258) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628258) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628258) x!605)))))

(assert (=> b!1427056 (=> (not res!962218) (not e!806053))))

(declare-fun b!1427057 () Bool)

(assert (=> b!1427057 (= e!806054 (bvsge (x!129070 lt!628258) #b01111111111111111111111111111110))))

(declare-fun b!1427058 () Bool)

(declare-fun e!806052 () SeekEntryResult!11265)

(declare-fun e!806056 () SeekEntryResult!11265)

(assert (=> b!1427058 (= e!806052 e!806056)))

(declare-fun c!131911 () Bool)

(declare-fun lt!628257 () (_ BitVec 64))

(assert (=> b!1427058 (= c!131911 (or (= lt!628257 (select (arr!46959 a!2831) j!81)) (= (bvadd lt!628257 lt!628257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427060 () Bool)

(assert (=> b!1427060 (= e!806056 (Intermediate!11265 false index!585 x!605))))

(declare-fun b!1427061 () Bool)

(assert (=> b!1427061 (and (bvsge (index!47454 lt!628258) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628258) (size!47511 a!2831)))))

(assert (=> b!1427061 (= e!806055 (= (select (arr!46959 a!2831) (index!47454 lt!628258)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427062 () Bool)

(assert (=> b!1427062 (= e!806056 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46959 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427063 () Bool)

(assert (=> b!1427063 (= e!806052 (Intermediate!11265 true index!585 x!605))))

(declare-fun b!1427059 () Bool)

(assert (=> b!1427059 (and (bvsge (index!47454 lt!628258) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628258) (size!47511 a!2831)))))

(declare-fun res!962217 () Bool)

(assert (=> b!1427059 (= res!962217 (= (select (arr!46959 a!2831) (index!47454 lt!628258)) (select (arr!46959 a!2831) j!81)))))

(assert (=> b!1427059 (=> res!962217 e!806055)))

(assert (=> b!1427059 (= e!806053 e!806055)))

(declare-fun d!153187 () Bool)

(assert (=> d!153187 e!806054))

(declare-fun c!131913 () Bool)

(assert (=> d!153187 (= c!131913 (and (is-Intermediate!11265 lt!628258) (undefined!12077 lt!628258)))))

(assert (=> d!153187 (= lt!628258 e!806052)))

(declare-fun c!131912 () Bool)

(assert (=> d!153187 (= c!131912 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153187 (= lt!628257 (select (arr!46959 a!2831) index!585))))

(assert (=> d!153187 (validMask!0 mask!2608)))

(assert (=> d!153187 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!628258)))

(assert (= (and d!153187 c!131912) b!1427063))

(assert (= (and d!153187 (not c!131912)) b!1427058))

(assert (= (and b!1427058 c!131911) b!1427060))

(assert (= (and b!1427058 (not c!131911)) b!1427062))

(assert (= (and d!153187 c!131913) b!1427057))

(assert (= (and d!153187 (not c!131913)) b!1427056))

(assert (= (and b!1427056 res!962218) b!1427059))

(assert (= (and b!1427059 (not res!962217)) b!1427055))

(assert (= (and b!1427055 (not res!962219)) b!1427061))

(declare-fun m!1317021 () Bool)

(assert (=> b!1427059 m!1317021))

(assert (=> b!1427055 m!1317021))

(assert (=> d!153187 m!1316897))

(assert (=> d!153187 m!1316893))

(assert (=> b!1427062 m!1316943))

(assert (=> b!1427062 m!1316943))

(assert (=> b!1427062 m!1316867))

(declare-fun m!1317023 () Bool)

(assert (=> b!1427062 m!1317023))

(assert (=> b!1427061 m!1317021))

(assert (=> b!1426847 d!153187))

(declare-fun b!1427064 () Bool)

(declare-fun lt!628260 () SeekEntryResult!11265)

(assert (=> b!1427064 (and (bvsge (index!47454 lt!628260) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628260) (size!47511 a!2831)))))

(declare-fun res!962222 () Bool)

(assert (=> b!1427064 (= res!962222 (= (select (arr!46959 a!2831) (index!47454 lt!628260)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806060 () Bool)

(assert (=> b!1427064 (=> res!962222 e!806060)))

(declare-fun b!1427065 () Bool)

(declare-fun e!806059 () Bool)

(declare-fun e!806058 () Bool)

(assert (=> b!1427065 (= e!806059 e!806058)))

(declare-fun res!962221 () Bool)

(assert (=> b!1427065 (= res!962221 (and (is-Intermediate!11265 lt!628260) (not (undefined!12077 lt!628260)) (bvslt (x!129070 lt!628260) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628260) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628260) #b00000000000000000000000000000000)))))

(assert (=> b!1427065 (=> (not res!962221) (not e!806058))))

(declare-fun b!1427066 () Bool)

(assert (=> b!1427066 (= e!806059 (bvsge (x!129070 lt!628260) #b01111111111111111111111111111110))))

(declare-fun b!1427067 () Bool)

(declare-fun e!806057 () SeekEntryResult!11265)

(declare-fun e!806061 () SeekEntryResult!11265)

(assert (=> b!1427067 (= e!806057 e!806061)))

(declare-fun c!131914 () Bool)

(declare-fun lt!628259 () (_ BitVec 64))

(assert (=> b!1427067 (= c!131914 (or (= lt!628259 (select (arr!46959 a!2831) j!81)) (= (bvadd lt!628259 lt!628259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427069 () Bool)

(assert (=> b!1427069 (= e!806061 (Intermediate!11265 false (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427070 () Bool)

(assert (=> b!1427070 (and (bvsge (index!47454 lt!628260) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628260) (size!47511 a!2831)))))

(assert (=> b!1427070 (= e!806060 (= (select (arr!46959 a!2831) (index!47454 lt!628260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427071 () Bool)

(assert (=> b!1427071 (= e!806061 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46959 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427072 () Bool)

(assert (=> b!1427072 (= e!806057 (Intermediate!11265 true (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427068 () Bool)

(assert (=> b!1427068 (and (bvsge (index!47454 lt!628260) #b00000000000000000000000000000000) (bvslt (index!47454 lt!628260) (size!47511 a!2831)))))

(declare-fun res!962220 () Bool)

(assert (=> b!1427068 (= res!962220 (= (select (arr!46959 a!2831) (index!47454 lt!628260)) (select (arr!46959 a!2831) j!81)))))

(assert (=> b!1427068 (=> res!962220 e!806060)))

(assert (=> b!1427068 (= e!806058 e!806060)))

(declare-fun d!153189 () Bool)

(assert (=> d!153189 e!806059))

(declare-fun c!131916 () Bool)

(assert (=> d!153189 (= c!131916 (and (is-Intermediate!11265 lt!628260) (undefined!12077 lt!628260)))))

(assert (=> d!153189 (= lt!628260 e!806057)))

(declare-fun c!131915 () Bool)

(assert (=> d!153189 (= c!131915 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153189 (= lt!628259 (select (arr!46959 a!2831) (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608)))))

(assert (=> d!153189 (validMask!0 mask!2608)))

(assert (=> d!153189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!628260)))

(assert (= (and d!153189 c!131915) b!1427072))

(assert (= (and d!153189 (not c!131915)) b!1427067))

(assert (= (and b!1427067 c!131914) b!1427069))

(assert (= (and b!1427067 (not c!131914)) b!1427071))

(assert (= (and d!153189 c!131916) b!1427066))

(assert (= (and d!153189 (not c!131916)) b!1427065))

(assert (= (and b!1427065 res!962221) b!1427068))

(assert (= (and b!1427068 (not res!962220)) b!1427064))

(assert (= (and b!1427064 (not res!962222)) b!1427070))

(declare-fun m!1317025 () Bool)

(assert (=> b!1427068 m!1317025))

(assert (=> b!1427064 m!1317025))

(assert (=> d!153189 m!1316889))

(declare-fun m!1317027 () Bool)

(assert (=> d!153189 m!1317027))

(assert (=> d!153189 m!1316893))

(assert (=> b!1427071 m!1316889))

(declare-fun m!1317029 () Bool)

(assert (=> b!1427071 m!1317029))

(assert (=> b!1427071 m!1317029))

(assert (=> b!1427071 m!1316867))

(declare-fun m!1317031 () Bool)

(assert (=> b!1427071 m!1317031))

(assert (=> b!1427070 m!1317025))

(assert (=> b!1426851 d!153189))

(declare-fun d!153191 () Bool)

(declare-fun lt!628266 () (_ BitVec 32))

(declare-fun lt!628265 () (_ BitVec 32))

(assert (=> d!153191 (= lt!628266 (bvmul (bvxor lt!628265 (bvlshr lt!628265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153191 (= lt!628265 ((_ extract 31 0) (bvand (bvxor (select (arr!46959 a!2831) j!81) (bvlshr (select (arr!46959 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153191 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962190 (let ((h!34850 ((_ extract 31 0) (bvand (bvxor (select (arr!46959 a!2831) j!81) (bvlshr (select (arr!46959 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129074 (bvmul (bvxor h!34850 (bvlshr h!34850 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129074 (bvlshr x!129074 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962190 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962190 #b00000000000000000000000000000000))))))

(assert (=> d!153191 (= (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) (bvand (bvxor lt!628266 (bvlshr lt!628266 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426851 d!153191))

(declare-fun b!1427134 () Bool)

(declare-fun e!806097 () SeekEntryResult!11265)

(declare-fun lt!628298 () SeekEntryResult!11265)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97285 (_ BitVec 32)) SeekEntryResult!11265)

(assert (=> b!1427134 (= e!806097 (seekKeyOrZeroReturnVacant!0 (x!129070 lt!628298) (index!47454 lt!628298) (index!47454 lt!628298) (select (arr!46959 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427135 () Bool)

(declare-fun c!131943 () Bool)

(declare-fun lt!628299 () (_ BitVec 64))

(assert (=> b!1427135 (= c!131943 (= lt!628299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806095 () SeekEntryResult!11265)

(assert (=> b!1427135 (= e!806095 e!806097)))

(declare-fun b!1427136 () Bool)

(assert (=> b!1427136 (= e!806097 (MissingZero!11265 (index!47454 lt!628298)))))

(declare-fun d!153193 () Bool)

(declare-fun lt!628297 () SeekEntryResult!11265)

(assert (=> d!153193 (and (or (is-Undefined!11265 lt!628297) (not (is-Found!11265 lt!628297)) (and (bvsge (index!47453 lt!628297) #b00000000000000000000000000000000) (bvslt (index!47453 lt!628297) (size!47511 a!2831)))) (or (is-Undefined!11265 lt!628297) (is-Found!11265 lt!628297) (not (is-MissingZero!11265 lt!628297)) (and (bvsge (index!47452 lt!628297) #b00000000000000000000000000000000) (bvslt (index!47452 lt!628297) (size!47511 a!2831)))) (or (is-Undefined!11265 lt!628297) (is-Found!11265 lt!628297) (is-MissingZero!11265 lt!628297) (not (is-MissingVacant!11265 lt!628297)) (and (bvsge (index!47455 lt!628297) #b00000000000000000000000000000000) (bvslt (index!47455 lt!628297) (size!47511 a!2831)))) (or (is-Undefined!11265 lt!628297) (ite (is-Found!11265 lt!628297) (= (select (arr!46959 a!2831) (index!47453 lt!628297)) (select (arr!46959 a!2831) j!81)) (ite (is-MissingZero!11265 lt!628297) (= (select (arr!46959 a!2831) (index!47452 lt!628297)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11265 lt!628297) (= (select (arr!46959 a!2831) (index!47455 lt!628297)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!806096 () SeekEntryResult!11265)

(assert (=> d!153193 (= lt!628297 e!806096)))

(declare-fun c!131942 () Bool)

(assert (=> d!153193 (= c!131942 (and (is-Intermediate!11265 lt!628298) (undefined!12077 lt!628298)))))

(assert (=> d!153193 (= lt!628298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46959 a!2831) j!81) mask!2608) (select (arr!46959 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153193 (validMask!0 mask!2608)))

(assert (=> d!153193 (= (seekEntryOrOpen!0 (select (arr!46959 a!2831) j!81) a!2831 mask!2608) lt!628297)))

(declare-fun b!1427137 () Bool)

(assert (=> b!1427137 (= e!806096 e!806095)))

(assert (=> b!1427137 (= lt!628299 (select (arr!46959 a!2831) (index!47454 lt!628298)))))

(declare-fun c!131944 () Bool)

(assert (=> b!1427137 (= c!131944 (= lt!628299 (select (arr!46959 a!2831) j!81)))))

(declare-fun b!1427138 () Bool)

(assert (=> b!1427138 (= e!806095 (Found!11265 (index!47454 lt!628298)))))

(declare-fun b!1427139 () Bool)

(assert (=> b!1427139 (= e!806096 Undefined!11265)))

(assert (= (and d!153193 c!131942) b!1427139))

(assert (= (and d!153193 (not c!131942)) b!1427137))

(assert (= (and b!1427137 c!131944) b!1427138))

(assert (= (and b!1427137 (not c!131944)) b!1427135))

(assert (= (and b!1427135 c!131943) b!1427136))

(assert (= (and b!1427135 (not c!131943)) b!1427134))

(assert (=> b!1427134 m!1316867))

(declare-fun m!1317071 () Bool)

(assert (=> b!1427134 m!1317071))

(assert (=> d!153193 m!1316889))

(assert (=> d!153193 m!1316867))

(assert (=> d!153193 m!1316891))

(assert (=> d!153193 m!1316893))

(declare-fun m!1317073 () Bool)

(assert (=> d!153193 m!1317073))

(declare-fun m!1317075 () Bool)

(assert (=> d!153193 m!1317075))

(assert (=> d!153193 m!1316867))

(assert (=> d!153193 m!1316889))

(declare-fun m!1317077 () Bool)

(assert (=> d!153193 m!1317077))

(declare-fun m!1317079 () Bool)

(assert (=> b!1427137 m!1317079))

(assert (=> b!1426850 d!153193))

(push 1)

(assert (not b!1427009))

(assert (not b!1427011))

(assert (not b!1426881))

(assert (not d!153189))

(assert (not d!153149))

(assert (not bm!67336))

(assert (not d!153193))

(assert (not b!1427054))

(assert (not b!1426879))

(assert (not b!1427062))

(assert (not b!1426994))

(assert (not bm!67333))

(assert (not d!153169))

(assert (not b!1426958))

(assert (not bm!67325))

(assert (not d!153145))

(assert (not b!1427071))

(assert (not d!153187))

(assert (not b!1427050))

(assert (not b!1427053))

(assert (not b!1427134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

