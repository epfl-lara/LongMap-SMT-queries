; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129500 () Bool)

(assert start!129500)

(declare-fun b!1520620 () Bool)

(declare-fun res!1040025 () Bool)

(declare-fun e!848208 () Bool)

(assert (=> b!1520620 (=> (not res!1040025) (not e!848208))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101226 0))(
  ( (array!101227 (arr!48847 (Array (_ BitVec 32) (_ BitVec 64))) (size!49397 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101226)

(assert (=> b!1520620 (= res!1040025 (and (= (size!49397 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49397 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49397 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520621 () Bool)

(declare-fun res!1040028 () Bool)

(declare-fun e!848206 () Bool)

(assert (=> b!1520621 (=> (not res!1040028) (not e!848206))))

(declare-datatypes ((SeekEntryResult!13018 0))(
  ( (MissingZero!13018 (index!54467 (_ BitVec 32))) (Found!13018 (index!54468 (_ BitVec 32))) (Intermediate!13018 (undefined!13830 Bool) (index!54469 (_ BitVec 32)) (x!136144 (_ BitVec 32))) (Undefined!13018) (MissingVacant!13018 (index!54470 (_ BitVec 32))) )
))
(declare-fun lt!659143 () SeekEntryResult!13018)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101226 (_ BitVec 32)) SeekEntryResult!13018)

(assert (=> b!1520621 (= res!1040028 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) lt!659143))))

(declare-fun b!1520622 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520622 (= e!848206 (not (or (not (= (select (arr!48847 a!2804) j!70) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48847 a!2804) index!487) (select (arr!48847 a!2804) j!70)) (= (select (arr!48847 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!848209 () Bool)

(assert (=> b!1520622 e!848209))

(declare-fun res!1040029 () Bool)

(assert (=> b!1520622 (=> (not res!1040029) (not e!848209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101226 (_ BitVec 32)) Bool)

(assert (=> b!1520622 (= res!1040029 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50904 0))(
  ( (Unit!50905) )
))
(declare-fun lt!659141 () Unit!50904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50904)

(assert (=> b!1520622 (= lt!659141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520623 () Bool)

(declare-fun res!1040033 () Bool)

(assert (=> b!1520623 (=> (not res!1040033) (not e!848206))))

(declare-fun lt!659142 () SeekEntryResult!13018)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520623 (= res!1040033 (= lt!659142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804)) mask!2512)))))

(declare-fun b!1520624 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101226 (_ BitVec 32)) SeekEntryResult!13018)

(assert (=> b!1520624 (= e!848209 (= (seekEntry!0 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) (Found!13018 j!70)))))

(declare-fun b!1520625 () Bool)

(assert (=> b!1520625 (= e!848208 e!848206)))

(declare-fun res!1040034 () Bool)

(assert (=> b!1520625 (=> (not res!1040034) (not e!848206))))

(assert (=> b!1520625 (= res!1040034 (= lt!659142 lt!659143))))

(assert (=> b!1520625 (= lt!659143 (Intermediate!13018 false resIndex!21 resX!21))))

(assert (=> b!1520625 (= lt!659142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48847 a!2804) j!70) mask!2512) (select (arr!48847 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520626 () Bool)

(declare-fun res!1040032 () Bool)

(assert (=> b!1520626 (=> (not res!1040032) (not e!848208))))

(assert (=> b!1520626 (= res!1040032 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49397 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49397 a!2804))))))

(declare-fun b!1520627 () Bool)

(declare-fun res!1040035 () Bool)

(assert (=> b!1520627 (=> (not res!1040035) (not e!848208))))

(assert (=> b!1520627 (= res!1040035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520628 () Bool)

(declare-fun res!1040031 () Bool)

(assert (=> b!1520628 (=> (not res!1040031) (not e!848208))))

(declare-datatypes ((List!35330 0))(
  ( (Nil!35327) (Cons!35326 (h!36744 (_ BitVec 64)) (t!50024 List!35330)) )
))
(declare-fun arrayNoDuplicates!0 (array!101226 (_ BitVec 32) List!35330) Bool)

(assert (=> b!1520628 (= res!1040031 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35327))))

(declare-fun b!1520629 () Bool)

(declare-fun res!1040030 () Bool)

(assert (=> b!1520629 (=> (not res!1040030) (not e!848208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520629 (= res!1040030 (validKeyInArray!0 (select (arr!48847 a!2804) i!961)))))

(declare-fun res!1040027 () Bool)

(assert (=> start!129500 (=> (not res!1040027) (not e!848208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129500 (= res!1040027 (validMask!0 mask!2512))))

(assert (=> start!129500 e!848208))

(assert (=> start!129500 true))

(declare-fun array_inv!37875 (array!101226) Bool)

(assert (=> start!129500 (array_inv!37875 a!2804)))

(declare-fun b!1520630 () Bool)

(declare-fun res!1040026 () Bool)

(assert (=> b!1520630 (=> (not res!1040026) (not e!848208))))

(assert (=> b!1520630 (= res!1040026 (validKeyInArray!0 (select (arr!48847 a!2804) j!70)))))

(assert (= (and start!129500 res!1040027) b!1520620))

(assert (= (and b!1520620 res!1040025) b!1520629))

(assert (= (and b!1520629 res!1040030) b!1520630))

(assert (= (and b!1520630 res!1040026) b!1520627))

(assert (= (and b!1520627 res!1040035) b!1520628))

(assert (= (and b!1520628 res!1040031) b!1520626))

(assert (= (and b!1520626 res!1040032) b!1520625))

(assert (= (and b!1520625 res!1040034) b!1520621))

(assert (= (and b!1520621 res!1040028) b!1520623))

(assert (= (and b!1520623 res!1040033) b!1520622))

(assert (= (and b!1520622 res!1040029) b!1520624))

(declare-fun m!1403859 () Bool)

(assert (=> b!1520628 m!1403859))

(declare-fun m!1403861 () Bool)

(assert (=> start!129500 m!1403861))

(declare-fun m!1403863 () Bool)

(assert (=> start!129500 m!1403863))

(declare-fun m!1403865 () Bool)

(assert (=> b!1520630 m!1403865))

(assert (=> b!1520630 m!1403865))

(declare-fun m!1403867 () Bool)

(assert (=> b!1520630 m!1403867))

(assert (=> b!1520625 m!1403865))

(assert (=> b!1520625 m!1403865))

(declare-fun m!1403869 () Bool)

(assert (=> b!1520625 m!1403869))

(assert (=> b!1520625 m!1403869))

(assert (=> b!1520625 m!1403865))

(declare-fun m!1403871 () Bool)

(assert (=> b!1520625 m!1403871))

(assert (=> b!1520621 m!1403865))

(assert (=> b!1520621 m!1403865))

(declare-fun m!1403873 () Bool)

(assert (=> b!1520621 m!1403873))

(declare-fun m!1403875 () Bool)

(assert (=> b!1520623 m!1403875))

(declare-fun m!1403877 () Bool)

(assert (=> b!1520623 m!1403877))

(assert (=> b!1520623 m!1403877))

(declare-fun m!1403879 () Bool)

(assert (=> b!1520623 m!1403879))

(assert (=> b!1520623 m!1403879))

(assert (=> b!1520623 m!1403877))

(declare-fun m!1403881 () Bool)

(assert (=> b!1520623 m!1403881))

(assert (=> b!1520624 m!1403865))

(assert (=> b!1520624 m!1403865))

(declare-fun m!1403883 () Bool)

(assert (=> b!1520624 m!1403883))

(declare-fun m!1403885 () Bool)

(assert (=> b!1520627 m!1403885))

(assert (=> b!1520622 m!1403865))

(declare-fun m!1403887 () Bool)

(assert (=> b!1520622 m!1403887))

(assert (=> b!1520622 m!1403875))

(declare-fun m!1403889 () Bool)

(assert (=> b!1520622 m!1403889))

(assert (=> b!1520622 m!1403877))

(declare-fun m!1403891 () Bool)

(assert (=> b!1520622 m!1403891))

(declare-fun m!1403893 () Bool)

(assert (=> b!1520629 m!1403893))

(assert (=> b!1520629 m!1403893))

(declare-fun m!1403895 () Bool)

(assert (=> b!1520629 m!1403895))

(push 1)

(assert (not b!1520630))

(assert (not b!1520627))

(assert (not b!1520625))

(assert (not b!1520623))

(assert (not start!129500))

(assert (not b!1520622))

(assert (not b!1520624))

(assert (not b!1520621))

(assert (not b!1520628))

(assert (not b!1520629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158959 () Bool)

(assert (=> d!158959 (= (validKeyInArray!0 (select (arr!48847 a!2804) i!961)) (and (not (= (select (arr!48847 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48847 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520629 d!158959))

(declare-fun b!1520706 () Bool)

(declare-fun e!848259 () SeekEntryResult!13018)

(assert (=> b!1520706 (= e!848259 Undefined!13018)))

(declare-fun b!1520707 () Bool)

(declare-fun c!139868 () Bool)

(declare-fun lt!659178 () (_ BitVec 64))

(assert (=> b!1520707 (= c!139868 (= lt!659178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848258 () SeekEntryResult!13018)

(declare-fun e!848257 () SeekEntryResult!13018)

(assert (=> b!1520707 (= e!848258 e!848257)))

(declare-fun b!1520708 () Bool)

(declare-fun lt!659180 () SeekEntryResult!13018)

(assert (=> b!1520708 (= e!848257 (ite (is-MissingVacant!13018 lt!659180) (MissingZero!13018 (index!54470 lt!659180)) lt!659180))))

(declare-fun lt!659177 () SeekEntryResult!13018)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101226 (_ BitVec 32)) SeekEntryResult!13018)

(assert (=> b!1520708 (= lt!659180 (seekKeyOrZeroReturnVacant!0 (x!136144 lt!659177) (index!54469 lt!659177) (index!54469 lt!659177) (select (arr!48847 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520709 () Bool)

(assert (=> b!1520709 (= e!848259 e!848258)))

(assert (=> b!1520709 (= lt!659178 (select (arr!48847 a!2804) (index!54469 lt!659177)))))

(declare-fun c!139866 () Bool)

(assert (=> b!1520709 (= c!139866 (= lt!659178 (select (arr!48847 a!2804) j!70)))))

(declare-fun d!158961 () Bool)

(declare-fun lt!659179 () SeekEntryResult!13018)

(assert (=> d!158961 (and (or (is-MissingVacant!13018 lt!659179) (not (is-Found!13018 lt!659179)) (and (bvsge (index!54468 lt!659179) #b00000000000000000000000000000000) (bvslt (index!54468 lt!659179) (size!49397 a!2804)))) (not (is-MissingVacant!13018 lt!659179)) (or (not (is-Found!13018 lt!659179)) (= (select (arr!48847 a!2804) (index!54468 lt!659179)) (select (arr!48847 a!2804) j!70))))))

(assert (=> d!158961 (= lt!659179 e!848259)))

(declare-fun c!139867 () Bool)

(assert (=> d!158961 (= c!139867 (and (is-Intermediate!13018 lt!659177) (undefined!13830 lt!659177)))))

(assert (=> d!158961 (= lt!659177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48847 a!2804) j!70) mask!2512) (select (arr!48847 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158961 (validMask!0 mask!2512)))

(assert (=> d!158961 (= (seekEntry!0 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) lt!659179)))

(declare-fun b!1520710 () Bool)

(assert (=> b!1520710 (= e!848258 (Found!13018 (index!54469 lt!659177)))))

(declare-fun b!1520711 () Bool)

(assert (=> b!1520711 (= e!848257 (MissingZero!13018 (index!54469 lt!659177)))))

(assert (= (and d!158961 c!139867) b!1520706))

(assert (= (and d!158961 (not c!139867)) b!1520709))

(assert (= (and b!1520709 c!139866) b!1520710))

(assert (= (and b!1520709 (not c!139866)) b!1520707))

(assert (= (and b!1520707 c!139868) b!1520711))

(assert (= (and b!1520707 (not c!139868)) b!1520708))

(assert (=> b!1520708 m!1403865))

(declare-fun m!1403929 () Bool)

(assert (=> b!1520708 m!1403929))

(declare-fun m!1403931 () Bool)

(assert (=> b!1520709 m!1403931))

(declare-fun m!1403933 () Bool)

(assert (=> d!158961 m!1403933))

(assert (=> d!158961 m!1403865))

(assert (=> d!158961 m!1403869))

(assert (=> d!158961 m!1403869))

(assert (=> d!158961 m!1403865))

(assert (=> d!158961 m!1403871))

(assert (=> d!158961 m!1403861))

(assert (=> b!1520624 d!158961))

(declare-fun d!158971 () Bool)

(declare-fun res!1040082 () Bool)

(declare-fun e!848287 () Bool)

(assert (=> d!158971 (=> res!1040082 e!848287)))

(assert (=> d!158971 (= res!1040082 (bvsge j!70 (size!49397 a!2804)))))

(assert (=> d!158971 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848287)))

(declare-fun b!1520756 () Bool)

(declare-fun e!848288 () Bool)

(declare-fun call!68367 () Bool)

(assert (=> b!1520756 (= e!848288 call!68367)))

(declare-fun b!1520757 () Bool)

(declare-fun e!848286 () Bool)

(assert (=> b!1520757 (= e!848286 call!68367)))

(declare-fun b!1520758 () Bool)

(assert (=> b!1520758 (= e!848287 e!848288)))

(declare-fun c!139883 () Bool)

(assert (=> b!1520758 (= c!139883 (validKeyInArray!0 (select (arr!48847 a!2804) j!70)))))

(declare-fun bm!68364 () Bool)

(assert (=> bm!68364 (= call!68367 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520759 () Bool)

(assert (=> b!1520759 (= e!848288 e!848286)))

(declare-fun lt!659199 () (_ BitVec 64))

(assert (=> b!1520759 (= lt!659199 (select (arr!48847 a!2804) j!70))))

(declare-fun lt!659198 () Unit!50904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101226 (_ BitVec 64) (_ BitVec 32)) Unit!50904)

(assert (=> b!1520759 (= lt!659198 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659199 j!70))))

(declare-fun arrayContainsKey!0 (array!101226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520759 (arrayContainsKey!0 a!2804 lt!659199 #b00000000000000000000000000000000)))

(declare-fun lt!659200 () Unit!50904)

(assert (=> b!1520759 (= lt!659200 lt!659198)))

(declare-fun res!1040081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101226 (_ BitVec 32)) SeekEntryResult!13018)

(assert (=> b!1520759 (= res!1040081 (= (seekEntryOrOpen!0 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) (Found!13018 j!70)))))

(assert (=> b!1520759 (=> (not res!1040081) (not e!848286))))

(assert (= (and d!158971 (not res!1040082)) b!1520758))

(assert (= (and b!1520758 c!139883) b!1520759))

(assert (= (and b!1520758 (not c!139883)) b!1520756))

(assert (= (and b!1520759 res!1040081) b!1520757))

(assert (= (or b!1520757 b!1520756) bm!68364))

(assert (=> b!1520758 m!1403865))

(assert (=> b!1520758 m!1403865))

(assert (=> b!1520758 m!1403867))

(declare-fun m!1403951 () Bool)

(assert (=> bm!68364 m!1403951))

(assert (=> b!1520759 m!1403865))

(declare-fun m!1403953 () Bool)

(assert (=> b!1520759 m!1403953))

(declare-fun m!1403955 () Bool)

(assert (=> b!1520759 m!1403955))

(assert (=> b!1520759 m!1403865))

(declare-fun m!1403957 () Bool)

(assert (=> b!1520759 m!1403957))

(assert (=> b!1520622 d!158971))

(declare-fun d!158979 () Bool)

(assert (=> d!158979 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659209 () Unit!50904)

(declare-fun choose!38 (array!101226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50904)

(assert (=> d!158979 (= lt!659209 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158979 (validMask!0 mask!2512)))

(assert (=> d!158979 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659209)))

(declare-fun bs!43640 () Bool)

(assert (= bs!43640 d!158979))

(assert (=> bs!43640 m!1403891))

(declare-fun m!1403959 () Bool)

(assert (=> bs!43640 m!1403959))

(assert (=> bs!43640 m!1403861))

(assert (=> b!1520622 d!158979))

(declare-fun d!158987 () Bool)

(assert (=> d!158987 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129500 d!158987))

(declare-fun d!158991 () Bool)

(assert (=> d!158991 (= (array_inv!37875 a!2804) (bvsge (size!49397 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129500 d!158991))

(declare-fun b!1520840 () Bool)

(declare-fun e!848341 () Bool)

(declare-fun lt!659249 () SeekEntryResult!13018)

(assert (=> b!1520840 (= e!848341 (bvsge (x!136144 lt!659249) #b01111111111111111111111111111110))))

(declare-fun d!158993 () Bool)

(assert (=> d!158993 e!848341))

(declare-fun c!139910 () Bool)

(assert (=> d!158993 (= c!139910 (and (is-Intermediate!13018 lt!659249) (undefined!13830 lt!659249)))))

(declare-fun e!848343 () SeekEntryResult!13018)

(assert (=> d!158993 (= lt!659249 e!848343)))

(declare-fun c!139912 () Bool)

(assert (=> d!158993 (= c!139912 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659248 () (_ BitVec 64))

(assert (=> d!158993 (= lt!659248 (select (arr!48847 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804))) (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158993 (validMask!0 mask!2512)))

(assert (=> d!158993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804)) mask!2512) lt!659249)))

(declare-fun b!1520841 () Bool)

(assert (=> b!1520841 (and (bvsge (index!54469 lt!659249) #b00000000000000000000000000000000) (bvslt (index!54469 lt!659249) (size!49397 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804)))))))

(declare-fun e!848342 () Bool)

(assert (=> b!1520841 (= e!848342 (= (select (arr!48847 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804))) (index!54469 lt!659249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520842 () Bool)

(assert (=> b!1520842 (= e!848343 (Intermediate!13018 true (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520843 () Bool)

(assert (=> b!1520843 (and (bvsge (index!54469 lt!659249) #b00000000000000000000000000000000) (bvslt (index!54469 lt!659249) (size!49397 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804)))))))

(declare-fun res!1040111 () Bool)

(assert (=> b!1520843 (= res!1040111 (= (select (arr!48847 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804))) (index!54469 lt!659249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520843 (=> res!1040111 e!848342)))

(declare-fun b!1520844 () Bool)

(declare-fun e!848340 () Bool)

(assert (=> b!1520844 (= e!848341 e!848340)))

(declare-fun res!1040112 () Bool)

(assert (=> b!1520844 (= res!1040112 (and (is-Intermediate!13018 lt!659249) (not (undefined!13830 lt!659249)) (bvslt (x!136144 lt!659249) #b01111111111111111111111111111110) (bvsge (x!136144 lt!659249) #b00000000000000000000000000000000) (bvsge (x!136144 lt!659249) #b00000000000000000000000000000000)))))

(assert (=> b!1520844 (=> (not res!1040112) (not e!848340))))

(declare-fun b!1520845 () Bool)

(assert (=> b!1520845 (and (bvsge (index!54469 lt!659249) #b00000000000000000000000000000000) (bvslt (index!54469 lt!659249) (size!49397 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804)))))))

(declare-fun res!1040113 () Bool)

(assert (=> b!1520845 (= res!1040113 (= (select (arr!48847 (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804))) (index!54469 lt!659249)) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1520845 (=> res!1040113 e!848342)))

(assert (=> b!1520845 (= e!848340 e!848342)))

(declare-fun e!848344 () SeekEntryResult!13018)

(declare-fun b!1520846 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520846 (= e!848344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101227 (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49397 a!2804)) mask!2512))))

(declare-fun b!1520847 () Bool)

(assert (=> b!1520847 (= e!848344 (Intermediate!13018 false (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520848 () Bool)

(assert (=> b!1520848 (= e!848343 e!848344)))

(declare-fun c!139911 () Bool)

(assert (=> b!1520848 (= c!139911 (or (= lt!659248 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659248 lt!659248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!158993 c!139912) b!1520842))

(assert (= (and d!158993 (not c!139912)) b!1520848))

(assert (= (and b!1520848 c!139911) b!1520847))

(assert (= (and b!1520848 (not c!139911)) b!1520846))

(assert (= (and d!158993 c!139910) b!1520840))

(assert (= (and d!158993 (not c!139910)) b!1520844))

(assert (= (and b!1520844 res!1040112) b!1520845))

(assert (= (and b!1520845 (not res!1040113)) b!1520843))

(assert (= (and b!1520843 (not res!1040111)) b!1520841))

(declare-fun m!1404009 () Bool)

(assert (=> b!1520843 m!1404009))

(assert (=> b!1520846 m!1403879))

(declare-fun m!1404011 () Bool)

(assert (=> b!1520846 m!1404011))

(assert (=> b!1520846 m!1404011))

(assert (=> b!1520846 m!1403877))

(declare-fun m!1404013 () Bool)

(assert (=> b!1520846 m!1404013))

(assert (=> d!158993 m!1403879))

(declare-fun m!1404015 () Bool)

(assert (=> d!158993 m!1404015))

(assert (=> d!158993 m!1403861))

(assert (=> b!1520845 m!1404009))

(assert (=> b!1520841 m!1404009))

(assert (=> b!1520623 d!158993))

(declare-fun d!159017 () Bool)

(declare-fun lt!659255 () (_ BitVec 32))

(declare-fun lt!659254 () (_ BitVec 32))

(assert (=> d!159017 (= lt!659255 (bvmul (bvxor lt!659254 (bvlshr lt!659254 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159017 (= lt!659254 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159017 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040114 (let ((h!36747 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136150 (bvmul (bvxor h!36747 (bvlshr h!36747 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136150 (bvlshr x!136150 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040114 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040114 #b00000000000000000000000000000000))))))

(assert (=> d!159017 (= (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659255 (bvlshr lt!659255 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520623 d!159017))

(declare-fun b!1520871 () Bool)

(declare-fun e!848361 () Bool)

(declare-fun call!68378 () Bool)

(assert (=> b!1520871 (= e!848361 call!68378)))

(declare-fun b!1520872 () Bool)

(declare-fun e!848360 () Bool)

(assert (=> b!1520872 (= e!848360 e!848361)))

(declare-fun c!139921 () Bool)

(assert (=> b!1520872 (= c!139921 (validKeyInArray!0 (select (arr!48847 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68375 () Bool)

(assert (=> bm!68375 (= call!68378 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139921 (Cons!35326 (select (arr!48847 a!2804) #b00000000000000000000000000000000) Nil!35327) Nil!35327)))))

(declare-fun b!1520873 () Bool)

(assert (=> b!1520873 (= e!848361 call!68378)))

(declare-fun d!159019 () Bool)

(declare-fun res!1040123 () Bool)

(declare-fun e!848359 () Bool)

(assert (=> d!159019 (=> res!1040123 e!848359)))

(assert (=> d!159019 (= res!1040123 (bvsge #b00000000000000000000000000000000 (size!49397 a!2804)))))

(assert (=> d!159019 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35327) e!848359)))

(declare-fun b!1520874 () Bool)

(declare-fun e!848362 () Bool)

(declare-fun contains!9984 (List!35330 (_ BitVec 64)) Bool)

(assert (=> b!1520874 (= e!848362 (contains!9984 Nil!35327 (select (arr!48847 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520875 () Bool)

(assert (=> b!1520875 (= e!848359 e!848360)))

(declare-fun res!1040122 () Bool)

(assert (=> b!1520875 (=> (not res!1040122) (not e!848360))))

(assert (=> b!1520875 (= res!1040122 (not e!848362))))

(declare-fun res!1040121 () Bool)

(assert (=> b!1520875 (=> (not res!1040121) (not e!848362))))

(assert (=> b!1520875 (= res!1040121 (validKeyInArray!0 (select (arr!48847 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159019 (not res!1040123)) b!1520875))

(assert (= (and b!1520875 res!1040121) b!1520874))

(assert (= (and b!1520875 res!1040122) b!1520872))

(assert (= (and b!1520872 c!139921) b!1520871))

(assert (= (and b!1520872 (not c!139921)) b!1520873))

(assert (= (or b!1520871 b!1520873) bm!68375))

(declare-fun m!1404017 () Bool)

(assert (=> b!1520872 m!1404017))

(assert (=> b!1520872 m!1404017))

(declare-fun m!1404019 () Bool)

(assert (=> b!1520872 m!1404019))

(assert (=> bm!68375 m!1404017))

(declare-fun m!1404021 () Bool)

(assert (=> bm!68375 m!1404021))

(assert (=> b!1520874 m!1404017))

(assert (=> b!1520874 m!1404017))

(declare-fun m!1404023 () Bool)

(assert (=> b!1520874 m!1404023))

(assert (=> b!1520875 m!1404017))

(assert (=> b!1520875 m!1404017))

(assert (=> b!1520875 m!1404019))

(assert (=> b!1520628 d!159019))

(declare-fun b!1520882 () Bool)

(declare-fun e!848367 () Bool)

(declare-fun lt!659269 () SeekEntryResult!13018)

(assert (=> b!1520882 (= e!848367 (bvsge (x!136144 lt!659269) #b01111111111111111111111111111110))))

(declare-fun d!159021 () Bool)

(assert (=> d!159021 e!848367))

(declare-fun c!139925 () Bool)

(assert (=> d!159021 (= c!139925 (and (is-Intermediate!13018 lt!659269) (undefined!13830 lt!659269)))))

(declare-fun e!848369 () SeekEntryResult!13018)

(assert (=> d!159021 (= lt!659269 e!848369)))

