; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129440 () Bool)

(assert start!129440)

(declare-fun b!1520239 () Bool)

(declare-fun res!1039831 () Bool)

(declare-fun e!847999 () Bool)

(assert (=> b!1520239 (=> (not res!1039831) (not e!847999))))

(declare-datatypes ((array!101217 0))(
  ( (array!101218 (arr!48844 (Array (_ BitVec 32) (_ BitVec 64))) (size!49394 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101217)

(declare-datatypes ((List!35327 0))(
  ( (Nil!35324) (Cons!35323 (h!36738 (_ BitVec 64)) (t!50021 List!35327)) )
))
(declare-fun arrayNoDuplicates!0 (array!101217 (_ BitVec 32) List!35327) Bool)

(assert (=> b!1520239 (= res!1039831 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35324))))

(declare-fun b!1520240 () Bool)

(declare-fun res!1039833 () Bool)

(assert (=> b!1520240 (=> (not res!1039833) (not e!847999))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520240 (= res!1039833 (validKeyInArray!0 (select (arr!48844 a!2804) i!961)))))

(declare-fun b!1520242 () Bool)

(declare-fun res!1039834 () Bool)

(assert (=> b!1520242 (=> (not res!1039834) (not e!847999))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1520242 (= res!1039834 (and (= (size!49394 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49394 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49394 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520243 () Bool)

(declare-fun res!1039837 () Bool)

(assert (=> b!1520243 (=> (not res!1039837) (not e!847999))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520243 (= res!1039837 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49394 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49394 a!2804))))))

(declare-fun b!1520244 () Bool)

(declare-fun res!1039827 () Bool)

(declare-fun e!847997 () Bool)

(assert (=> b!1520244 (=> (not res!1039827) (not e!847997))))

(declare-datatypes ((SeekEntryResult!13015 0))(
  ( (MissingZero!13015 (index!54455 (_ BitVec 32))) (Found!13015 (index!54456 (_ BitVec 32))) (Intermediate!13015 (undefined!13827 Bool) (index!54457 (_ BitVec 32)) (x!136127 (_ BitVec 32))) (Undefined!13015) (MissingVacant!13015 (index!54458 (_ BitVec 32))) )
))
(declare-fun lt!658980 () SeekEntryResult!13015)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101217 (_ BitVec 32)) SeekEntryResult!13015)

(assert (=> b!1520244 (= res!1039827 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48844 a!2804) j!70) a!2804 mask!2512) lt!658980))))

(declare-fun b!1520245 () Bool)

(declare-fun res!1039830 () Bool)

(assert (=> b!1520245 (=> (not res!1039830) (not e!847997))))

(declare-fun lt!658979 () SeekEntryResult!13015)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520245 (= res!1039830 (= lt!658979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101218 (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49394 a!2804)) mask!2512)))))

(declare-fun e!847998 () Bool)

(declare-fun b!1520246 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101217 (_ BitVec 32)) SeekEntryResult!13015)

(assert (=> b!1520246 (= e!847998 (= (seekEntry!0 (select (arr!48844 a!2804) j!70) a!2804 mask!2512) (Found!13015 j!70)))))

(declare-fun res!1039835 () Bool)

(assert (=> start!129440 (=> (not res!1039835) (not e!847999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129440 (= res!1039835 (validMask!0 mask!2512))))

(assert (=> start!129440 e!847999))

(assert (=> start!129440 true))

(declare-fun array_inv!37872 (array!101217) Bool)

(assert (=> start!129440 (array_inv!37872 a!2804)))

(declare-fun b!1520241 () Bool)

(assert (=> b!1520241 (= e!847999 e!847997)))

(declare-fun res!1039828 () Bool)

(assert (=> b!1520241 (=> (not res!1039828) (not e!847997))))

(assert (=> b!1520241 (= res!1039828 (= lt!658979 lt!658980))))

(assert (=> b!1520241 (= lt!658980 (Intermediate!13015 false resIndex!21 resX!21))))

(assert (=> b!1520241 (= lt!658979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) (select (arr!48844 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520247 () Bool)

(assert (=> b!1520247 (= e!847997 (not (or (not (= (select (arr!48844 a!2804) j!70) (select (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48844 a!2804) index!487) (select (arr!48844 a!2804) j!70))) (= j!70 index!487))))))

(assert (=> b!1520247 e!847998))

(declare-fun res!1039832 () Bool)

(assert (=> b!1520247 (=> (not res!1039832) (not e!847998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101217 (_ BitVec 32)) Bool)

(assert (=> b!1520247 (= res!1039832 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50898 0))(
  ( (Unit!50899) )
))
(declare-fun lt!658981 () Unit!50898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50898)

(assert (=> b!1520247 (= lt!658981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520248 () Bool)

(declare-fun res!1039829 () Bool)

(assert (=> b!1520248 (=> (not res!1039829) (not e!847999))))

(assert (=> b!1520248 (= res!1039829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520249 () Bool)

(declare-fun res!1039836 () Bool)

(assert (=> b!1520249 (=> (not res!1039836) (not e!847999))))

(assert (=> b!1520249 (= res!1039836 (validKeyInArray!0 (select (arr!48844 a!2804) j!70)))))

(assert (= (and start!129440 res!1039835) b!1520242))

(assert (= (and b!1520242 res!1039834) b!1520240))

(assert (= (and b!1520240 res!1039833) b!1520249))

(assert (= (and b!1520249 res!1039836) b!1520248))

(assert (= (and b!1520248 res!1039829) b!1520239))

(assert (= (and b!1520239 res!1039831) b!1520243))

(assert (= (and b!1520243 res!1039837) b!1520241))

(assert (= (and b!1520241 res!1039828) b!1520244))

(assert (= (and b!1520244 res!1039827) b!1520245))

(assert (= (and b!1520245 res!1039830) b!1520247))

(assert (= (and b!1520247 res!1039832) b!1520246))

(declare-fun m!1403583 () Bool)

(assert (=> b!1520247 m!1403583))

(declare-fun m!1403585 () Bool)

(assert (=> b!1520247 m!1403585))

(declare-fun m!1403587 () Bool)

(assert (=> b!1520247 m!1403587))

(declare-fun m!1403589 () Bool)

(assert (=> b!1520247 m!1403589))

(declare-fun m!1403591 () Bool)

(assert (=> b!1520247 m!1403591))

(declare-fun m!1403593 () Bool)

(assert (=> b!1520247 m!1403593))

(declare-fun m!1403595 () Bool)

(assert (=> b!1520239 m!1403595))

(assert (=> b!1520249 m!1403583))

(assert (=> b!1520249 m!1403583))

(declare-fun m!1403597 () Bool)

(assert (=> b!1520249 m!1403597))

(assert (=> b!1520246 m!1403583))

(assert (=> b!1520246 m!1403583))

(declare-fun m!1403599 () Bool)

(assert (=> b!1520246 m!1403599))

(assert (=> b!1520241 m!1403583))

(assert (=> b!1520241 m!1403583))

(declare-fun m!1403601 () Bool)

(assert (=> b!1520241 m!1403601))

(assert (=> b!1520241 m!1403601))

(assert (=> b!1520241 m!1403583))

(declare-fun m!1403603 () Bool)

(assert (=> b!1520241 m!1403603))

(assert (=> b!1520244 m!1403583))

(assert (=> b!1520244 m!1403583))

(declare-fun m!1403605 () Bool)

(assert (=> b!1520244 m!1403605))

(assert (=> b!1520245 m!1403587))

(assert (=> b!1520245 m!1403591))

(assert (=> b!1520245 m!1403591))

(declare-fun m!1403607 () Bool)

(assert (=> b!1520245 m!1403607))

(assert (=> b!1520245 m!1403607))

(assert (=> b!1520245 m!1403591))

(declare-fun m!1403609 () Bool)

(assert (=> b!1520245 m!1403609))

(declare-fun m!1403611 () Bool)

(assert (=> b!1520240 m!1403611))

(assert (=> b!1520240 m!1403611))

(declare-fun m!1403613 () Bool)

(assert (=> b!1520240 m!1403613))

(declare-fun m!1403615 () Bool)

(assert (=> start!129440 m!1403615))

(declare-fun m!1403617 () Bool)

(assert (=> start!129440 m!1403617))

(declare-fun m!1403619 () Bool)

(assert (=> b!1520248 m!1403619))

(push 1)

(assert (not b!1520244))

(assert (not b!1520248))

(assert (not b!1520241))

(assert (not b!1520249))

(assert (not b!1520245))

(assert (not b!1520247))

(assert (not start!129440))

(assert (not b!1520240))

(assert (not b!1520239))

(assert (not b!1520246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1520310 () Bool)

(declare-fun e!848043 () Bool)

(declare-fun call!68345 () Bool)

(assert (=> b!1520310 (= e!848043 call!68345)))

(declare-fun bm!68342 () Bool)

(declare-fun c!139765 () Bool)

(assert (=> bm!68342 (= call!68345 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139765 (Cons!35323 (select (arr!48844 a!2804) #b00000000000000000000000000000000) Nil!35324) Nil!35324)))))

(declare-fun d!158871 () Bool)

(declare-fun res!1039867 () Bool)

(declare-fun e!848044 () Bool)

(assert (=> d!158871 (=> res!1039867 e!848044)))

(assert (=> d!158871 (= res!1039867 (bvsge #b00000000000000000000000000000000 (size!49394 a!2804)))))

(assert (=> d!158871 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35324) e!848044)))

(declare-fun b!1520311 () Bool)

(declare-fun e!848042 () Bool)

(assert (=> b!1520311 (= e!848042 e!848043)))

(assert (=> b!1520311 (= c!139765 (validKeyInArray!0 (select (arr!48844 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520312 () Bool)

(assert (=> b!1520312 (= e!848043 call!68345)))

(declare-fun b!1520313 () Bool)

(assert (=> b!1520313 (= e!848044 e!848042)))

(declare-fun res!1039868 () Bool)

(assert (=> b!1520313 (=> (not res!1039868) (not e!848042))))

(declare-fun e!848041 () Bool)

(assert (=> b!1520313 (= res!1039868 (not e!848041))))

(declare-fun res!1039866 () Bool)

(assert (=> b!1520313 (=> (not res!1039866) (not e!848041))))

(assert (=> b!1520313 (= res!1039866 (validKeyInArray!0 (select (arr!48844 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520314 () Bool)

(declare-fun contains!9980 (List!35327 (_ BitVec 64)) Bool)

(assert (=> b!1520314 (= e!848041 (contains!9980 Nil!35324 (select (arr!48844 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158871 (not res!1039867)) b!1520313))

(assert (= (and b!1520313 res!1039866) b!1520314))

(assert (= (and b!1520313 res!1039868) b!1520311))

(assert (= (and b!1520311 c!139765) b!1520310))

(assert (= (and b!1520311 (not c!139765)) b!1520312))

(assert (= (or b!1520310 b!1520312) bm!68342))

(declare-fun m!1403635 () Bool)

(assert (=> bm!68342 m!1403635))

(declare-fun m!1403637 () Bool)

(assert (=> bm!68342 m!1403637))

(assert (=> b!1520311 m!1403635))

(assert (=> b!1520311 m!1403635))

(declare-fun m!1403639 () Bool)

(assert (=> b!1520311 m!1403639))

(assert (=> b!1520313 m!1403635))

(assert (=> b!1520313 m!1403635))

(assert (=> b!1520313 m!1403639))

(assert (=> b!1520314 m!1403635))

(assert (=> b!1520314 m!1403635))

(declare-fun m!1403641 () Bool)

(assert (=> b!1520314 m!1403641))

(assert (=> b!1520239 d!158871))

(declare-fun b!1520382 () Bool)

(declare-fun e!848085 () SeekEntryResult!13015)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520382 (= e!848085 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48844 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520383 () Bool)

(declare-fun e!848084 () Bool)

(declare-fun e!848087 () Bool)

(assert (=> b!1520383 (= e!848084 e!848087)))

(declare-fun res!1039895 () Bool)

(declare-fun lt!659022 () SeekEntryResult!13015)

(assert (=> b!1520383 (= res!1039895 (and (is-Intermediate!13015 lt!659022) (not (undefined!13827 lt!659022)) (bvslt (x!136127 lt!659022) #b01111111111111111111111111111110) (bvsge (x!136127 lt!659022) #b00000000000000000000000000000000) (bvsge (x!136127 lt!659022) x!534)))))

(assert (=> b!1520383 (=> (not res!1039895) (not e!848087))))

(declare-fun b!1520384 () Bool)

(declare-fun e!848083 () SeekEntryResult!13015)

(assert (=> b!1520384 (= e!848083 e!848085)))

(declare-fun lt!659023 () (_ BitVec 64))

(declare-fun c!139790 () Bool)

(assert (=> b!1520384 (= c!139790 (or (= lt!659023 (select (arr!48844 a!2804) j!70)) (= (bvadd lt!659023 lt!659023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520385 () Bool)

(assert (=> b!1520385 (and (bvsge (index!54457 lt!659022) #b00000000000000000000000000000000) (bvslt (index!54457 lt!659022) (size!49394 a!2804)))))

(declare-fun res!1039893 () Bool)

(assert (=> b!1520385 (= res!1039893 (= (select (arr!48844 a!2804) (index!54457 lt!659022)) (select (arr!48844 a!2804) j!70)))))

(declare-fun e!848086 () Bool)

(assert (=> b!1520385 (=> res!1039893 e!848086)))

(assert (=> b!1520385 (= e!848087 e!848086)))

(declare-fun b!1520386 () Bool)

(assert (=> b!1520386 (= e!848084 (bvsge (x!136127 lt!659022) #b01111111111111111111111111111110))))

(declare-fun b!1520387 () Bool)

(assert (=> b!1520387 (= e!848085 (Intermediate!13015 false index!487 x!534))))

(declare-fun b!1520388 () Bool)

(assert (=> b!1520388 (and (bvsge (index!54457 lt!659022) #b00000000000000000000000000000000) (bvslt (index!54457 lt!659022) (size!49394 a!2804)))))

(assert (=> b!1520388 (= e!848086 (= (select (arr!48844 a!2804) (index!54457 lt!659022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!158877 () Bool)

(assert (=> d!158877 e!848084))

(declare-fun c!139789 () Bool)

(assert (=> d!158877 (= c!139789 (and (is-Intermediate!13015 lt!659022) (undefined!13827 lt!659022)))))

(assert (=> d!158877 (= lt!659022 e!848083)))

(declare-fun c!139788 () Bool)

(assert (=> d!158877 (= c!139788 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158877 (= lt!659023 (select (arr!48844 a!2804) index!487))))

(assert (=> d!158877 (validMask!0 mask!2512)))

(assert (=> d!158877 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48844 a!2804) j!70) a!2804 mask!2512) lt!659022)))

(declare-fun b!1520389 () Bool)

(assert (=> b!1520389 (= e!848083 (Intermediate!13015 true index!487 x!534))))

(declare-fun b!1520390 () Bool)

(assert (=> b!1520390 (and (bvsge (index!54457 lt!659022) #b00000000000000000000000000000000) (bvslt (index!54457 lt!659022) (size!49394 a!2804)))))

(declare-fun res!1039894 () Bool)

(assert (=> b!1520390 (= res!1039894 (= (select (arr!48844 a!2804) (index!54457 lt!659022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520390 (=> res!1039894 e!848086)))

(assert (= (and d!158877 c!139788) b!1520389))

(assert (= (and d!158877 (not c!139788)) b!1520384))

(assert (= (and b!1520384 c!139790) b!1520387))

(assert (= (and b!1520384 (not c!139790)) b!1520382))

(assert (= (and d!158877 c!139789) b!1520386))

(assert (= (and d!158877 (not c!139789)) b!1520383))

(assert (= (and b!1520383 res!1039895) b!1520385))

(assert (= (and b!1520385 (not res!1039893)) b!1520390))

(assert (= (and b!1520390 (not res!1039894)) b!1520388))

(declare-fun m!1403675 () Bool)

(assert (=> b!1520388 m!1403675))

(declare-fun m!1403677 () Bool)

(assert (=> b!1520382 m!1403677))

(assert (=> b!1520382 m!1403677))

(assert (=> b!1520382 m!1403583))

(declare-fun m!1403679 () Bool)

(assert (=> b!1520382 m!1403679))

(assert (=> b!1520385 m!1403675))

(assert (=> b!1520390 m!1403675))

(assert (=> d!158877 m!1403589))

(assert (=> d!158877 m!1403615))

(assert (=> b!1520244 d!158877))

(declare-fun d!158899 () Bool)

(assert (=> d!158899 (= (validKeyInArray!0 (select (arr!48844 a!2804) j!70)) (and (not (= (select (arr!48844 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48844 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520249 d!158899))

(declare-fun d!158901 () Bool)

(declare-fun res!1039906 () Bool)

(declare-fun e!848114 () Bool)

(assert (=> d!158901 (=> res!1039906 e!848114)))

(assert (=> d!158901 (= res!1039906 (bvsge #b00000000000000000000000000000000 (size!49394 a!2804)))))

(assert (=> d!158901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848114)))

(declare-fun b!1520429 () Bool)

(declare-fun e!848113 () Bool)

(declare-fun call!68352 () Bool)

(assert (=> b!1520429 (= e!848113 call!68352)))

(declare-fun bm!68349 () Bool)

(assert (=> bm!68349 (= call!68352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520430 () Bool)

(declare-fun e!848112 () Bool)

(assert (=> b!1520430 (= e!848113 e!848112)))

(declare-fun lt!659051 () (_ BitVec 64))

(assert (=> b!1520430 (= lt!659051 (select (arr!48844 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659052 () Unit!50898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101217 (_ BitVec 64) (_ BitVec 32)) Unit!50898)

(assert (=> b!1520430 (= lt!659052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659051 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520430 (arrayContainsKey!0 a!2804 lt!659051 #b00000000000000000000000000000000)))

(declare-fun lt!659053 () Unit!50898)

(assert (=> b!1520430 (= lt!659053 lt!659052)))

(declare-fun res!1039907 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101217 (_ BitVec 32)) SeekEntryResult!13015)

(assert (=> b!1520430 (= res!1039907 (= (seekEntryOrOpen!0 (select (arr!48844 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13015 #b00000000000000000000000000000000)))))

(assert (=> b!1520430 (=> (not res!1039907) (not e!848112))))

(declare-fun b!1520431 () Bool)

(assert (=> b!1520431 (= e!848114 e!848113)))

(declare-fun c!139805 () Bool)

(assert (=> b!1520431 (= c!139805 (validKeyInArray!0 (select (arr!48844 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520432 () Bool)

(assert (=> b!1520432 (= e!848112 call!68352)))

(assert (= (and d!158901 (not res!1039906)) b!1520431))

(assert (= (and b!1520431 c!139805) b!1520430))

(assert (= (and b!1520431 (not c!139805)) b!1520429))

(assert (= (and b!1520430 res!1039907) b!1520432))

(assert (= (or b!1520432 b!1520429) bm!68349))

(declare-fun m!1403695 () Bool)

(assert (=> bm!68349 m!1403695))

(assert (=> b!1520430 m!1403635))

(declare-fun m!1403697 () Bool)

(assert (=> b!1520430 m!1403697))

(declare-fun m!1403699 () Bool)

(assert (=> b!1520430 m!1403699))

(assert (=> b!1520430 m!1403635))

(declare-fun m!1403701 () Bool)

(assert (=> b!1520430 m!1403701))

(assert (=> b!1520431 m!1403635))

(assert (=> b!1520431 m!1403635))

(assert (=> b!1520431 m!1403639))

(assert (=> b!1520248 d!158901))

(declare-fun d!158907 () Bool)

(assert (=> d!158907 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129440 d!158907))

(declare-fun d!158915 () Bool)

(assert (=> d!158915 (= (array_inv!37872 a!2804) (bvsge (size!49394 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129440 d!158915))

(declare-fun d!158917 () Bool)

(declare-fun res!1039910 () Bool)

(declare-fun e!848120 () Bool)

(assert (=> d!158917 (=> res!1039910 e!848120)))

(assert (=> d!158917 (= res!1039910 (bvsge j!70 (size!49394 a!2804)))))

(assert (=> d!158917 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848120)))

(declare-fun b!1520437 () Bool)

(declare-fun e!848119 () Bool)

(declare-fun call!68354 () Bool)

(assert (=> b!1520437 (= e!848119 call!68354)))

(declare-fun bm!68351 () Bool)

(assert (=> bm!68351 (= call!68354 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520438 () Bool)

(declare-fun e!848118 () Bool)

(assert (=> b!1520438 (= e!848119 e!848118)))

(declare-fun lt!659060 () (_ BitVec 64))

(assert (=> b!1520438 (= lt!659060 (select (arr!48844 a!2804) j!70))))

(declare-fun lt!659061 () Unit!50898)

(assert (=> b!1520438 (= lt!659061 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659060 j!70))))

(assert (=> b!1520438 (arrayContainsKey!0 a!2804 lt!659060 #b00000000000000000000000000000000)))

(declare-fun lt!659062 () Unit!50898)

(assert (=> b!1520438 (= lt!659062 lt!659061)))

(declare-fun res!1039911 () Bool)

(assert (=> b!1520438 (= res!1039911 (= (seekEntryOrOpen!0 (select (arr!48844 a!2804) j!70) a!2804 mask!2512) (Found!13015 j!70)))))

(assert (=> b!1520438 (=> (not res!1039911) (not e!848118))))

(declare-fun b!1520439 () Bool)

(assert (=> b!1520439 (= e!848120 e!848119)))

(declare-fun c!139807 () Bool)

(assert (=> b!1520439 (= c!139807 (validKeyInArray!0 (select (arr!48844 a!2804) j!70)))))

(declare-fun b!1520440 () Bool)

(assert (=> b!1520440 (= e!848118 call!68354)))

(assert (= (and d!158917 (not res!1039910)) b!1520439))

(assert (= (and b!1520439 c!139807) b!1520438))

(assert (= (and b!1520439 (not c!139807)) b!1520437))

(assert (= (and b!1520438 res!1039911) b!1520440))

(assert (= (or b!1520440 b!1520437) bm!68351))

(declare-fun m!1403713 () Bool)

(assert (=> bm!68351 m!1403713))

(assert (=> b!1520438 m!1403583))

(declare-fun m!1403715 () Bool)

(assert (=> b!1520438 m!1403715))

(declare-fun m!1403717 () Bool)

(assert (=> b!1520438 m!1403717))

(assert (=> b!1520438 m!1403583))

(declare-fun m!1403719 () Bool)

(assert (=> b!1520438 m!1403719))

(assert (=> b!1520439 m!1403583))

(assert (=> b!1520439 m!1403583))

(assert (=> b!1520439 m!1403597))

(assert (=> b!1520247 d!158917))

(declare-fun d!158919 () Bool)

(assert (=> d!158919 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659073 () Unit!50898)

(declare-fun choose!38 (array!101217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50898)

(assert (=> d!158919 (= lt!659073 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158919 (validMask!0 mask!2512)))

(assert (=> d!158919 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659073)))

(declare-fun bs!43635 () Bool)

(assert (= bs!43635 d!158919))

(assert (=> bs!43635 m!1403593))

(declare-fun m!1403721 () Bool)

(assert (=> bs!43635 m!1403721))

(assert (=> bs!43635 m!1403615))

(assert (=> b!1520247 d!158919))

(declare-fun b!1520453 () Bool)

(declare-fun e!848129 () SeekEntryResult!13015)

(assert (=> b!1520453 (= e!848129 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48844 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520454 () Bool)

(declare-fun e!848128 () Bool)

(declare-fun e!848131 () Bool)

(assert (=> b!1520454 (= e!848128 e!848131)))

(declare-fun res!1039914 () Bool)

(declare-fun lt!659074 () SeekEntryResult!13015)

(assert (=> b!1520454 (= res!1039914 (and (is-Intermediate!13015 lt!659074) (not (undefined!13827 lt!659074)) (bvslt (x!136127 lt!659074) #b01111111111111111111111111111110) (bvsge (x!136127 lt!659074) #b00000000000000000000000000000000) (bvsge (x!136127 lt!659074) #b00000000000000000000000000000000)))))

(assert (=> b!1520454 (=> (not res!1039914) (not e!848131))))

(declare-fun b!1520455 () Bool)

(declare-fun e!848127 () SeekEntryResult!13015)

(assert (=> b!1520455 (= e!848127 e!848129)))

(declare-fun c!139816 () Bool)

(declare-fun lt!659075 () (_ BitVec 64))

(assert (=> b!1520455 (= c!139816 (or (= lt!659075 (select (arr!48844 a!2804) j!70)) (= (bvadd lt!659075 lt!659075) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520456 () Bool)

(assert (=> b!1520456 (and (bvsge (index!54457 lt!659074) #b00000000000000000000000000000000) (bvslt (index!54457 lt!659074) (size!49394 a!2804)))))

(declare-fun res!1039912 () Bool)

(assert (=> b!1520456 (= res!1039912 (= (select (arr!48844 a!2804) (index!54457 lt!659074)) (select (arr!48844 a!2804) j!70)))))

(declare-fun e!848130 () Bool)

(assert (=> b!1520456 (=> res!1039912 e!848130)))

(assert (=> b!1520456 (= e!848131 e!848130)))

(declare-fun b!1520457 () Bool)

(assert (=> b!1520457 (= e!848128 (bvsge (x!136127 lt!659074) #b01111111111111111111111111111110))))

(declare-fun b!1520458 () Bool)

(assert (=> b!1520458 (= e!848129 (Intermediate!13015 false (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520459 () Bool)

(assert (=> b!1520459 (and (bvsge (index!54457 lt!659074) #b00000000000000000000000000000000) (bvslt (index!54457 lt!659074) (size!49394 a!2804)))))

(assert (=> b!1520459 (= e!848130 (= (select (arr!48844 a!2804) (index!54457 lt!659074)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!158921 () Bool)

(assert (=> d!158921 e!848128))

(declare-fun c!139815 () Bool)

(assert (=> d!158921 (= c!139815 (and (is-Intermediate!13015 lt!659074) (undefined!13827 lt!659074)))))

(assert (=> d!158921 (= lt!659074 e!848127)))

(declare-fun c!139814 () Bool)

(assert (=> d!158921 (= c!139814 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158921 (= lt!659075 (select (arr!48844 a!2804) (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512)))))

(assert (=> d!158921 (validMask!0 mask!2512)))

(assert (=> d!158921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) (select (arr!48844 a!2804) j!70) a!2804 mask!2512) lt!659074)))

(declare-fun b!1520460 () Bool)

(assert (=> b!1520460 (= e!848127 (Intermediate!13015 true (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520461 () Bool)

(assert (=> b!1520461 (and (bvsge (index!54457 lt!659074) #b00000000000000000000000000000000) (bvslt (index!54457 lt!659074) (size!49394 a!2804)))))

(declare-fun res!1039913 () Bool)

(assert (=> b!1520461 (= res!1039913 (= (select (arr!48844 a!2804) (index!54457 lt!659074)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520461 (=> res!1039913 e!848130)))

(assert (= (and d!158921 c!139814) b!1520460))

(assert (= (and d!158921 (not c!139814)) b!1520455))

(assert (= (and b!1520455 c!139816) b!1520458))

(assert (= (and b!1520455 (not c!139816)) b!1520453))

(assert (= (and d!158921 c!139815) b!1520457))

(assert (= (and d!158921 (not c!139815)) b!1520454))

(assert (= (and b!1520454 res!1039914) b!1520456))

(assert (= (and b!1520456 (not res!1039912)) b!1520461))

(assert (= (and b!1520461 (not res!1039913)) b!1520459))

(declare-fun m!1403723 () Bool)

(assert (=> b!1520459 m!1403723))

(assert (=> b!1520453 m!1403601))

(declare-fun m!1403725 () Bool)

(assert (=> b!1520453 m!1403725))

(assert (=> b!1520453 m!1403725))

(assert (=> b!1520453 m!1403583))

(declare-fun m!1403727 () Bool)

(assert (=> b!1520453 m!1403727))

(assert (=> b!1520456 m!1403723))

(assert (=> b!1520461 m!1403723))

(assert (=> d!158921 m!1403601))

(declare-fun m!1403729 () Bool)

(assert (=> d!158921 m!1403729))

(assert (=> d!158921 m!1403615))

(assert (=> b!1520241 d!158921))

(declare-fun d!158923 () Bool)

(declare-fun lt!659087 () (_ BitVec 32))

(declare-fun lt!659086 () (_ BitVec 32))

(assert (=> d!158923 (= lt!659087 (bvmul (bvxor lt!659086 (bvlshr lt!659086 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158923 (= lt!659086 ((_ extract 31 0) (bvand (bvxor (select (arr!48844 a!2804) j!70) (bvlshr (select (arr!48844 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158923 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039915 (let ((h!36740 ((_ extract 31 0) (bvand (bvxor (select (arr!48844 a!2804) j!70) (bvlshr (select (arr!48844 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136132 (bvmul (bvxor h!36740 (bvlshr h!36740 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136132 (bvlshr x!136132 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039915 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039915 #b00000000000000000000000000000000))))))

(assert (=> d!158923 (= (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) (bvand (bvxor lt!659087 (bvlshr lt!659087 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520241 d!158923))

(declare-fun b!1520517 () Bool)

(declare-fun e!848167 () SeekEntryResult!13015)

(assert (=> b!1520517 (= e!848167 Undefined!13015)))

(declare-fun b!1520518 () Bool)

(declare-fun e!848166 () SeekEntryResult!13015)

(declare-fun lt!659111 () SeekEntryResult!13015)

(assert (=> b!1520518 (= e!848166 (Found!13015 (index!54457 lt!659111)))))

(declare-fun b!1520519 () Bool)

(declare-fun e!848168 () SeekEntryResult!13015)

(declare-fun lt!659109 () SeekEntryResult!13015)

(assert (=> b!1520519 (= e!848168 (ite (is-MissingVacant!13015 lt!659109) (MissingZero!13015 (index!54458 lt!659109)) lt!659109))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101217 (_ BitVec 32)) SeekEntryResult!13015)

(assert (=> b!1520519 (= lt!659109 (seekKeyOrZeroReturnVacant!0 (x!136127 lt!659111) (index!54457 lt!659111) (index!54457 lt!659111) (select (arr!48844 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520520 () Bool)

(assert (=> b!1520520 (= e!848168 (MissingZero!13015 (index!54457 lt!659111)))))

(declare-fun d!158931 () Bool)

(declare-fun lt!659110 () SeekEntryResult!13015)

