; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127114 () Bool)

(assert start!127114)

(declare-fun b!1494088 () Bool)

(declare-fun e!836914 () Bool)

(assert (=> b!1494088 (= e!836914 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!651243 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494088 (= lt!651243 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494089 () Bool)

(declare-fun e!836915 () Bool)

(declare-fun e!836918 () Bool)

(assert (=> b!1494089 (= e!836915 e!836918)))

(declare-fun res!1016509 () Bool)

(assert (=> b!1494089 (=> (not res!1016509) (not e!836918))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99761 0))(
  ( (array!99762 (arr!48149 (Array (_ BitVec 32) (_ BitVec 64))) (size!48699 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99761)

(assert (=> b!1494089 (= res!1016509 (= (select (store (arr!48149 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651241 () array!99761)

(assert (=> b!1494089 (= lt!651241 (array!99762 (store (arr!48149 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48699 a!2862)))))

(declare-fun b!1494090 () Bool)

(declare-fun res!1016502 () Bool)

(assert (=> b!1494090 (=> (not res!1016502) (not e!836915))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494090 (= res!1016502 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48699 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48699 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48699 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494091 () Bool)

(declare-fun e!836919 () Bool)

(declare-fun e!836920 () Bool)

(assert (=> b!1494091 (= e!836919 e!836920)))

(declare-fun res!1016507 () Bool)

(assert (=> b!1494091 (=> (not res!1016507) (not e!836920))))

(declare-datatypes ((SeekEntryResult!12389 0))(
  ( (MissingZero!12389 (index!51948 (_ BitVec 32))) (Found!12389 (index!51949 (_ BitVec 32))) (Intermediate!12389 (undefined!13201 Bool) (index!51950 (_ BitVec 32)) (x!133549 (_ BitVec 32))) (Undefined!12389) (MissingVacant!12389 (index!51951 (_ BitVec 32))) )
))
(declare-fun lt!651245 () SeekEntryResult!12389)

(assert (=> b!1494091 (= res!1016507 (= lt!651245 (Intermediate!12389 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651244 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99761 (_ BitVec 32)) SeekEntryResult!12389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494091 (= lt!651245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651244 mask!2687) lt!651244 lt!651241 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1494091 (= lt!651244 (select (store (arr!48149 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494092 () Bool)

(declare-fun res!1016511 () Bool)

(assert (=> b!1494092 (=> (not res!1016511) (not e!836915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99761 (_ BitVec 32)) Bool)

(assert (=> b!1494092 (= res!1016511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494093 () Bool)

(declare-fun res!1016500 () Bool)

(assert (=> b!1494093 (=> (not res!1016500) (not e!836920))))

(declare-fun e!836917 () Bool)

(assert (=> b!1494093 (= res!1016500 e!836917)))

(declare-fun c!138324 () Bool)

(assert (=> b!1494093 (= c!138324 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494094 () Bool)

(declare-fun e!836921 () Bool)

(assert (=> b!1494094 (= e!836921 (or (= (select (arr!48149 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48149 a!2862) intermediateBeforeIndex!19) (select (arr!48149 a!2862) j!93))))))

(declare-fun b!1494095 () Bool)

(declare-fun res!1016503 () Bool)

(assert (=> b!1494095 (=> (not res!1016503) (not e!836915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494095 (= res!1016503 (validKeyInArray!0 (select (arr!48149 a!2862) j!93)))))

(declare-fun b!1494096 () Bool)

(assert (=> b!1494096 (= e!836920 (not e!836914))))

(declare-fun res!1016514 () Bool)

(assert (=> b!1494096 (=> res!1016514 e!836914)))

(assert (=> b!1494096 (= res!1016514 (or (and (= (select (arr!48149 a!2862) index!646) (select (store (arr!48149 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48149 a!2862) index!646) (select (arr!48149 a!2862) j!93))) (= (select (arr!48149 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494096 e!836921))

(declare-fun res!1016512 () Bool)

(assert (=> b!1494096 (=> (not res!1016512) (not e!836921))))

(assert (=> b!1494096 (= res!1016512 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50118 0))(
  ( (Unit!50119) )
))
(declare-fun lt!651242 () Unit!50118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50118)

(assert (=> b!1494096 (= lt!651242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494097 () Bool)

(declare-fun res!1016515 () Bool)

(assert (=> b!1494097 (=> (not res!1016515) (not e!836915))))

(assert (=> b!1494097 (= res!1016515 (and (= (size!48699 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48699 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48699 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494098 () Bool)

(declare-fun res!1016508 () Bool)

(assert (=> b!1494098 (=> (not res!1016508) (not e!836915))))

(declare-datatypes ((List!34650 0))(
  ( (Nil!34647) (Cons!34646 (h!36035 (_ BitVec 64)) (t!49344 List!34650)) )
))
(declare-fun arrayNoDuplicates!0 (array!99761 (_ BitVec 32) List!34650) Bool)

(assert (=> b!1494098 (= res!1016508 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34647))))

(declare-fun b!1494099 () Bool)

(declare-fun res!1016510 () Bool)

(assert (=> b!1494099 (=> (not res!1016510) (not e!836921))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99761 (_ BitVec 32)) SeekEntryResult!12389)

(assert (=> b!1494099 (= res!1016510 (= (seekEntryOrOpen!0 (select (arr!48149 a!2862) j!93) a!2862 mask!2687) (Found!12389 j!93)))))

(declare-fun b!1494100 () Bool)

(declare-fun res!1016504 () Bool)

(assert (=> b!1494100 (=> (not res!1016504) (not e!836920))))

(assert (=> b!1494100 (= res!1016504 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494101 () Bool)

(declare-fun res!1016513 () Bool)

(assert (=> b!1494101 (=> (not res!1016513) (not e!836915))))

(assert (=> b!1494101 (= res!1016513 (validKeyInArray!0 (select (arr!48149 a!2862) i!1006)))))

(declare-fun b!1494102 () Bool)

(declare-fun res!1016506 () Bool)

(assert (=> b!1494102 (=> (not res!1016506) (not e!836919))))

(declare-fun lt!651246 () SeekEntryResult!12389)

(assert (=> b!1494102 (= res!1016506 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48149 a!2862) j!93) a!2862 mask!2687) lt!651246))))

(declare-fun b!1494103 () Bool)

(assert (=> b!1494103 (= e!836917 (= lt!651245 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651244 lt!651241 mask!2687)))))

(declare-fun b!1494104 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99761 (_ BitVec 32)) SeekEntryResult!12389)

(assert (=> b!1494104 (= e!836917 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651244 lt!651241 mask!2687) (seekEntryOrOpen!0 lt!651244 lt!651241 mask!2687)))))

(declare-fun res!1016505 () Bool)

(assert (=> start!127114 (=> (not res!1016505) (not e!836915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127114 (= res!1016505 (validMask!0 mask!2687))))

(assert (=> start!127114 e!836915))

(assert (=> start!127114 true))

(declare-fun array_inv!37177 (array!99761) Bool)

(assert (=> start!127114 (array_inv!37177 a!2862)))

(declare-fun b!1494105 () Bool)

(assert (=> b!1494105 (= e!836918 e!836919)))

(declare-fun res!1016501 () Bool)

(assert (=> b!1494105 (=> (not res!1016501) (not e!836919))))

(assert (=> b!1494105 (= res!1016501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48149 a!2862) j!93) mask!2687) (select (arr!48149 a!2862) j!93) a!2862 mask!2687) lt!651246))))

(assert (=> b!1494105 (= lt!651246 (Intermediate!12389 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!127114 res!1016505) b!1494097))

(assert (= (and b!1494097 res!1016515) b!1494101))

(assert (= (and b!1494101 res!1016513) b!1494095))

(assert (= (and b!1494095 res!1016503) b!1494092))

(assert (= (and b!1494092 res!1016511) b!1494098))

(assert (= (and b!1494098 res!1016508) b!1494090))

(assert (= (and b!1494090 res!1016502) b!1494089))

(assert (= (and b!1494089 res!1016509) b!1494105))

(assert (= (and b!1494105 res!1016501) b!1494102))

(assert (= (and b!1494102 res!1016506) b!1494091))

(assert (= (and b!1494091 res!1016507) b!1494093))

(assert (= (and b!1494093 c!138324) b!1494103))

(assert (= (and b!1494093 (not c!138324)) b!1494104))

(assert (= (and b!1494093 res!1016500) b!1494100))

(assert (= (and b!1494100 res!1016504) b!1494096))

(assert (= (and b!1494096 res!1016512) b!1494099))

(assert (= (and b!1494099 res!1016510) b!1494094))

(assert (= (and b!1494096 (not res!1016514)) b!1494088))

(declare-fun m!1377847 () Bool)

(assert (=> b!1494088 m!1377847))

(declare-fun m!1377849 () Bool)

(assert (=> b!1494102 m!1377849))

(assert (=> b!1494102 m!1377849))

(declare-fun m!1377851 () Bool)

(assert (=> b!1494102 m!1377851))

(declare-fun m!1377853 () Bool)

(assert (=> b!1494104 m!1377853))

(declare-fun m!1377855 () Bool)

(assert (=> b!1494104 m!1377855))

(declare-fun m!1377857 () Bool)

(assert (=> b!1494096 m!1377857))

(declare-fun m!1377859 () Bool)

(assert (=> b!1494096 m!1377859))

(declare-fun m!1377861 () Bool)

(assert (=> b!1494096 m!1377861))

(declare-fun m!1377863 () Bool)

(assert (=> b!1494096 m!1377863))

(declare-fun m!1377865 () Bool)

(assert (=> b!1494096 m!1377865))

(assert (=> b!1494096 m!1377849))

(assert (=> b!1494105 m!1377849))

(assert (=> b!1494105 m!1377849))

(declare-fun m!1377867 () Bool)

(assert (=> b!1494105 m!1377867))

(assert (=> b!1494105 m!1377867))

(assert (=> b!1494105 m!1377849))

(declare-fun m!1377869 () Bool)

(assert (=> b!1494105 m!1377869))

(assert (=> b!1494095 m!1377849))

(assert (=> b!1494095 m!1377849))

(declare-fun m!1377871 () Bool)

(assert (=> b!1494095 m!1377871))

(declare-fun m!1377873 () Bool)

(assert (=> b!1494091 m!1377873))

(assert (=> b!1494091 m!1377873))

(declare-fun m!1377875 () Bool)

(assert (=> b!1494091 m!1377875))

(assert (=> b!1494091 m!1377859))

(declare-fun m!1377877 () Bool)

(assert (=> b!1494091 m!1377877))

(assert (=> b!1494089 m!1377859))

(declare-fun m!1377879 () Bool)

(assert (=> b!1494089 m!1377879))

(declare-fun m!1377881 () Bool)

(assert (=> b!1494103 m!1377881))

(assert (=> b!1494099 m!1377849))

(assert (=> b!1494099 m!1377849))

(declare-fun m!1377883 () Bool)

(assert (=> b!1494099 m!1377883))

(declare-fun m!1377885 () Bool)

(assert (=> start!127114 m!1377885))

(declare-fun m!1377887 () Bool)

(assert (=> start!127114 m!1377887))

(declare-fun m!1377889 () Bool)

(assert (=> b!1494098 m!1377889))

(declare-fun m!1377891 () Bool)

(assert (=> b!1494092 m!1377891))

(declare-fun m!1377893 () Bool)

(assert (=> b!1494094 m!1377893))

(assert (=> b!1494094 m!1377849))

(declare-fun m!1377895 () Bool)

(assert (=> b!1494101 m!1377895))

(assert (=> b!1494101 m!1377895))

(declare-fun m!1377897 () Bool)

(assert (=> b!1494101 m!1377897))

(push 1)

