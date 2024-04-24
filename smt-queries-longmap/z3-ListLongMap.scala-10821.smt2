; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126918 () Bool)

(assert start!126918)

(declare-fun b!1487960 () Bool)

(declare-fun e!834254 () Bool)

(assert (=> b!1487960 (= e!834254 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649048 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487960 (= lt!649048 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun res!1011244 () Bool)

(declare-fun e!834249 () Bool)

(assert (=> start!126918 (=> (not res!1011244) (not e!834249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126918 (= res!1011244 (validMask!0 mask!2687))))

(assert (=> start!126918 e!834249))

(assert (=> start!126918 true))

(declare-datatypes ((array!99655 0))(
  ( (array!99656 (arr!48097 (Array (_ BitVec 32) (_ BitVec 64))) (size!48648 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99655)

(declare-fun array_inv!37378 (array!99655) Bool)

(assert (=> start!126918 (array_inv!37378 a!2862)))

(declare-fun b!1487961 () Bool)

(declare-fun res!1011248 () Bool)

(assert (=> b!1487961 (=> (not res!1011248) (not e!834249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99655 (_ BitVec 32)) Bool)

(assert (=> b!1487961 (= res!1011248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487962 () Bool)

(declare-fun res!1011234 () Bool)

(declare-fun e!834252 () Bool)

(assert (=> b!1487962 (=> (not res!1011234) (not e!834252))))

(declare-fun e!834246 () Bool)

(assert (=> b!1487962 (= res!1011234 e!834246)))

(declare-fun c!137899 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1487962 (= c!137899 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487963 () Bool)

(declare-fun res!1011245 () Bool)

(assert (=> b!1487963 (=> (not res!1011245) (not e!834249))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487963 (= res!1011245 (validKeyInArray!0 (select (arr!48097 a!2862) j!93)))))

(declare-fun b!1487964 () Bool)

(declare-fun res!1011243 () Bool)

(assert (=> b!1487964 (=> (not res!1011243) (not e!834249))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487964 (= res!1011243 (and (= (size!48648 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48648 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48648 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487965 () Bool)

(declare-fun lt!649043 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12234 0))(
  ( (MissingZero!12234 (index!51328 (_ BitVec 32))) (Found!12234 (index!51329 (_ BitVec 32))) (Intermediate!12234 (undefined!13046 Bool) (index!51330 (_ BitVec 32)) (x!133099 (_ BitVec 32))) (Undefined!12234) (MissingVacant!12234 (index!51331 (_ BitVec 32))) )
))
(declare-fun lt!649042 () SeekEntryResult!12234)

(declare-fun lt!649044 () array!99655)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12234)

(assert (=> b!1487965 (= e!834246 (= lt!649042 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649043 lt!649044 mask!2687)))))

(declare-fun b!1487966 () Bool)

(declare-fun e!834247 () Bool)

(assert (=> b!1487966 (= e!834249 e!834247)))

(declare-fun res!1011231 () Bool)

(assert (=> b!1487966 (=> (not res!1011231) (not e!834247))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487966 (= res!1011231 (= (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487966 (= lt!649044 (array!99656 (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48648 a!2862)))))

(declare-fun b!1487967 () Bool)

(declare-fun e!834248 () Bool)

(assert (=> b!1487967 (= e!834247 e!834248)))

(declare-fun res!1011237 () Bool)

(assert (=> b!1487967 (=> (not res!1011237) (not e!834248))))

(declare-fun lt!649045 () SeekEntryResult!12234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487967 (= res!1011237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48097 a!2862) j!93) mask!2687) (select (arr!48097 a!2862) j!93) a!2862 mask!2687) lt!649045))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487967 (= lt!649045 (Intermediate!12234 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487968 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12234)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12234)

(assert (=> b!1487968 (= e!834246 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649043 lt!649044 mask!2687) (seekEntryOrOpen!0 lt!649043 lt!649044 mask!2687)))))

(declare-fun b!1487969 () Bool)

(declare-fun res!1011230 () Bool)

(declare-fun e!834250 () Bool)

(assert (=> b!1487969 (=> (not res!1011230) (not e!834250))))

(assert (=> b!1487969 (= res!1011230 (or (= (select (arr!48097 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48097 a!2862) intermediateBeforeIndex!19) (select (arr!48097 a!2862) j!93))))))

(declare-fun b!1487970 () Bool)

(declare-fun e!834253 () Bool)

(assert (=> b!1487970 (= e!834253 (= (seekEntryOrOpen!0 lt!649043 lt!649044 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649043 lt!649044 mask!2687)))))

(declare-fun b!1487971 () Bool)

(declare-fun res!1011232 () Bool)

(assert (=> b!1487971 (=> (not res!1011232) (not e!834249))))

(assert (=> b!1487971 (= res!1011232 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48648 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48648 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48648 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487972 () Bool)

(assert (=> b!1487972 (= e!834252 (not e!834254))))

(declare-fun res!1011239 () Bool)

(assert (=> b!1487972 (=> res!1011239 e!834254)))

(assert (=> b!1487972 (= res!1011239 (or (and (= (select (arr!48097 a!2862) index!646) (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48097 a!2862) index!646) (select (arr!48097 a!2862) j!93))) (= (select (arr!48097 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487972 e!834250))

(declare-fun res!1011235 () Bool)

(assert (=> b!1487972 (=> (not res!1011235) (not e!834250))))

(assert (=> b!1487972 (= res!1011235 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49841 0))(
  ( (Unit!49842) )
))
(declare-fun lt!649046 () Unit!49841)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49841)

(assert (=> b!1487972 (= lt!649046 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487973 () Bool)

(declare-fun e!834251 () Bool)

(assert (=> b!1487973 (= e!834251 e!834253)))

(declare-fun res!1011242 () Bool)

(assert (=> b!1487973 (=> (not res!1011242) (not e!834253))))

(declare-fun lt!649047 () (_ BitVec 64))

(assert (=> b!1487973 (= res!1011242 (and (= index!646 intermediateAfterIndex!19) (= lt!649047 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487974 () Bool)

(declare-fun res!1011236 () Bool)

(assert (=> b!1487974 (=> (not res!1011236) (not e!834250))))

(assert (=> b!1487974 (= res!1011236 (= (seekEntryOrOpen!0 (select (arr!48097 a!2862) j!93) a!2862 mask!2687) (Found!12234 j!93)))))

(declare-fun b!1487975 () Bool)

(declare-fun res!1011241 () Bool)

(assert (=> b!1487975 (=> (not res!1011241) (not e!834249))))

(declare-datatypes ((List!34585 0))(
  ( (Nil!34582) (Cons!34581 (h!35972 (_ BitVec 64)) (t!49271 List!34585)) )
))
(declare-fun arrayNoDuplicates!0 (array!99655 (_ BitVec 32) List!34585) Bool)

(assert (=> b!1487975 (= res!1011241 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34582))))

(declare-fun b!1487976 () Bool)

(declare-fun res!1011247 () Bool)

(assert (=> b!1487976 (=> (not res!1011247) (not e!834252))))

(assert (=> b!1487976 (= res!1011247 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487977 () Bool)

(assert (=> b!1487977 (= e!834248 e!834252)))

(declare-fun res!1011238 () Bool)

(assert (=> b!1487977 (=> (not res!1011238) (not e!834252))))

(assert (=> b!1487977 (= res!1011238 (= lt!649042 (Intermediate!12234 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1487977 (= lt!649042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649043 mask!2687) lt!649043 lt!649044 mask!2687))))

(assert (=> b!1487977 (= lt!649043 (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487978 () Bool)

(declare-fun res!1011246 () Bool)

(assert (=> b!1487978 (=> (not res!1011246) (not e!834248))))

(assert (=> b!1487978 (= res!1011246 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48097 a!2862) j!93) a!2862 mask!2687) lt!649045))))

(declare-fun b!1487979 () Bool)

(declare-fun res!1011240 () Bool)

(assert (=> b!1487979 (=> (not res!1011240) (not e!834249))))

(assert (=> b!1487979 (= res!1011240 (validKeyInArray!0 (select (arr!48097 a!2862) i!1006)))))

(declare-fun b!1487980 () Bool)

(assert (=> b!1487980 (= e!834250 e!834251)))

(declare-fun res!1011233 () Bool)

(assert (=> b!1487980 (=> res!1011233 e!834251)))

(assert (=> b!1487980 (= res!1011233 (or (and (= (select (arr!48097 a!2862) index!646) lt!649047) (= (select (arr!48097 a!2862) index!646) (select (arr!48097 a!2862) j!93))) (= (select (arr!48097 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487980 (= lt!649047 (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(assert (= (and start!126918 res!1011244) b!1487964))

(assert (= (and b!1487964 res!1011243) b!1487979))

(assert (= (and b!1487979 res!1011240) b!1487963))

(assert (= (and b!1487963 res!1011245) b!1487961))

(assert (= (and b!1487961 res!1011248) b!1487975))

(assert (= (and b!1487975 res!1011241) b!1487971))

(assert (= (and b!1487971 res!1011232) b!1487966))

(assert (= (and b!1487966 res!1011231) b!1487967))

(assert (= (and b!1487967 res!1011237) b!1487978))

(assert (= (and b!1487978 res!1011246) b!1487977))

(assert (= (and b!1487977 res!1011238) b!1487962))

(assert (= (and b!1487962 c!137899) b!1487965))

(assert (= (and b!1487962 (not c!137899)) b!1487968))

(assert (= (and b!1487962 res!1011234) b!1487976))

(assert (= (and b!1487976 res!1011247) b!1487972))

(assert (= (and b!1487972 res!1011235) b!1487974))

(assert (= (and b!1487974 res!1011236) b!1487969))

(assert (= (and b!1487969 res!1011230) b!1487980))

(assert (= (and b!1487980 (not res!1011233)) b!1487973))

(assert (= (and b!1487973 res!1011242) b!1487970))

(assert (= (and b!1487972 (not res!1011239)) b!1487960))

(declare-fun m!1372855 () Bool)

(assert (=> b!1487972 m!1372855))

(declare-fun m!1372857 () Bool)

(assert (=> b!1487972 m!1372857))

(declare-fun m!1372859 () Bool)

(assert (=> b!1487972 m!1372859))

(declare-fun m!1372861 () Bool)

(assert (=> b!1487972 m!1372861))

(declare-fun m!1372863 () Bool)

(assert (=> b!1487972 m!1372863))

(declare-fun m!1372865 () Bool)

(assert (=> b!1487972 m!1372865))

(declare-fun m!1372867 () Bool)

(assert (=> b!1487969 m!1372867))

(assert (=> b!1487969 m!1372865))

(declare-fun m!1372869 () Bool)

(assert (=> b!1487960 m!1372869))

(assert (=> b!1487978 m!1372865))

(assert (=> b!1487978 m!1372865))

(declare-fun m!1372871 () Bool)

(assert (=> b!1487978 m!1372871))

(assert (=> b!1487980 m!1372861))

(assert (=> b!1487980 m!1372865))

(assert (=> b!1487980 m!1372857))

(assert (=> b!1487980 m!1372859))

(assert (=> b!1487974 m!1372865))

(assert (=> b!1487974 m!1372865))

(declare-fun m!1372873 () Bool)

(assert (=> b!1487974 m!1372873))

(assert (=> b!1487967 m!1372865))

(assert (=> b!1487967 m!1372865))

(declare-fun m!1372875 () Bool)

(assert (=> b!1487967 m!1372875))

(assert (=> b!1487967 m!1372875))

(assert (=> b!1487967 m!1372865))

(declare-fun m!1372877 () Bool)

(assert (=> b!1487967 m!1372877))

(declare-fun m!1372879 () Bool)

(assert (=> b!1487970 m!1372879))

(declare-fun m!1372881 () Bool)

(assert (=> b!1487970 m!1372881))

(assert (=> b!1487966 m!1372857))

(declare-fun m!1372883 () Bool)

(assert (=> b!1487966 m!1372883))

(declare-fun m!1372885 () Bool)

(assert (=> b!1487979 m!1372885))

(assert (=> b!1487979 m!1372885))

(declare-fun m!1372887 () Bool)

(assert (=> b!1487979 m!1372887))

(declare-fun m!1372889 () Bool)

(assert (=> b!1487965 m!1372889))

(declare-fun m!1372891 () Bool)

(assert (=> b!1487961 m!1372891))

(assert (=> b!1487968 m!1372881))

(assert (=> b!1487968 m!1372879))

(assert (=> b!1487963 m!1372865))

(assert (=> b!1487963 m!1372865))

(declare-fun m!1372893 () Bool)

(assert (=> b!1487963 m!1372893))

(declare-fun m!1372895 () Bool)

(assert (=> b!1487977 m!1372895))

(assert (=> b!1487977 m!1372895))

(declare-fun m!1372897 () Bool)

(assert (=> b!1487977 m!1372897))

(assert (=> b!1487977 m!1372857))

(declare-fun m!1372899 () Bool)

(assert (=> b!1487977 m!1372899))

(declare-fun m!1372901 () Bool)

(assert (=> b!1487975 m!1372901))

(declare-fun m!1372903 () Bool)

(assert (=> start!126918 m!1372903))

(declare-fun m!1372905 () Bool)

(assert (=> start!126918 m!1372905))

(check-sat (not b!1487978) (not b!1487970) (not b!1487965) (not b!1487975) (not b!1487961) (not b!1487972) (not b!1487967) (not b!1487960) (not b!1487968) (not b!1487963) (not b!1487977) (not start!126918) (not b!1487974) (not b!1487979))
(check-sat)
