; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129444 () Bool)

(assert start!129444)

(declare-fun e!847968 () Bool)

(declare-fun b!1520214 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101170 0))(
  ( (array!101171 (arr!48820 (Array (_ BitVec 32) (_ BitVec 64))) (size!49372 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101170)

(declare-datatypes ((SeekEntryResult!13014 0))(
  ( (MissingZero!13014 (index!54451 (_ BitVec 32))) (Found!13014 (index!54452 (_ BitVec 32))) (Intermediate!13014 (undefined!13826 Bool) (index!54453 (_ BitVec 32)) (x!136134 (_ BitVec 32))) (Undefined!13014) (MissingVacant!13014 (index!54454 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520214 (= e!847968 (= (seekEntry!0 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) (Found!13014 j!70)))))

(declare-fun b!1520215 () Bool)

(declare-fun res!1039829 () Bool)

(declare-fun e!847971 () Bool)

(assert (=> b!1520215 (=> (not res!1039829) (not e!847971))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658829 () SeekEntryResult!13014)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520215 (= res!1039829 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658829))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1520216 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520216 (= e!847971 (not (or (not (= (select (arr!48820 a!2804) j!70) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48820 a!2804) index!487) (select (arr!48820 a!2804) j!70)) (= (select (arr!48820 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520216 e!847968))

(declare-fun res!1039832 () Bool)

(assert (=> b!1520216 (=> (not res!1039832) (not e!847968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101170 (_ BitVec 32)) Bool)

(assert (=> b!1520216 (= res!1039832 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50735 0))(
  ( (Unit!50736) )
))
(declare-fun lt!658830 () Unit!50735)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50735)

(assert (=> b!1520216 (= lt!658830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520217 () Bool)

(declare-fun e!847970 () Bool)

(assert (=> b!1520217 (= e!847970 e!847971)))

(declare-fun res!1039826 () Bool)

(assert (=> b!1520217 (=> (not res!1039826) (not e!847971))))

(declare-fun lt!658828 () SeekEntryResult!13014)

(assert (=> b!1520217 (= res!1039826 (= lt!658828 lt!658829))))

(assert (=> b!1520217 (= lt!658829 (Intermediate!13014 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520217 (= lt!658828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520218 () Bool)

(declare-fun res!1039830 () Bool)

(assert (=> b!1520218 (=> (not res!1039830) (not e!847970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520218 (= res!1039830 (validKeyInArray!0 (select (arr!48820 a!2804) i!961)))))

(declare-fun b!1520219 () Bool)

(declare-fun res!1039828 () Bool)

(assert (=> b!1520219 (=> (not res!1039828) (not e!847970))))

(assert (=> b!1520219 (= res!1039828 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49372 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49372 a!2804))))))

(declare-fun b!1520220 () Bool)

(declare-fun res!1039834 () Bool)

(assert (=> b!1520220 (=> (not res!1039834) (not e!847970))))

(assert (=> b!1520220 (= res!1039834 (validKeyInArray!0 (select (arr!48820 a!2804) j!70)))))

(declare-fun res!1039827 () Bool)

(assert (=> start!129444 (=> (not res!1039827) (not e!847970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129444 (= res!1039827 (validMask!0 mask!2512))))

(assert (=> start!129444 e!847970))

(assert (=> start!129444 true))

(declare-fun array_inv!38053 (array!101170) Bool)

(assert (=> start!129444 (array_inv!38053 a!2804)))

(declare-fun b!1520221 () Bool)

(declare-fun res!1039833 () Bool)

(assert (=> b!1520221 (=> (not res!1039833) (not e!847971))))

(assert (=> b!1520221 (= res!1039833 (= lt!658828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)) mask!2512)))))

(declare-fun b!1520222 () Bool)

(declare-fun res!1039835 () Bool)

(assert (=> b!1520222 (=> (not res!1039835) (not e!847970))))

(assert (=> b!1520222 (= res!1039835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520223 () Bool)

(declare-fun res!1039825 () Bool)

(assert (=> b!1520223 (=> (not res!1039825) (not e!847970))))

(assert (=> b!1520223 (= res!1039825 (and (= (size!49372 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49372 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49372 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520224 () Bool)

(declare-fun res!1039831 () Bool)

(assert (=> b!1520224 (=> (not res!1039831) (not e!847970))))

(declare-datatypes ((List!35381 0))(
  ( (Nil!35378) (Cons!35377 (h!36796 (_ BitVec 64)) (t!50067 List!35381)) )
))
(declare-fun arrayNoDuplicates!0 (array!101170 (_ BitVec 32) List!35381) Bool)

(assert (=> b!1520224 (= res!1039831 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35378))))

(assert (= (and start!129444 res!1039827) b!1520223))

(assert (= (and b!1520223 res!1039825) b!1520218))

(assert (= (and b!1520218 res!1039830) b!1520220))

(assert (= (and b!1520220 res!1039834) b!1520222))

(assert (= (and b!1520222 res!1039835) b!1520224))

(assert (= (and b!1520224 res!1039831) b!1520219))

(assert (= (and b!1520219 res!1039828) b!1520217))

(assert (= (and b!1520217 res!1039826) b!1520215))

(assert (= (and b!1520215 res!1039829) b!1520221))

(assert (= (and b!1520221 res!1039833) b!1520216))

(assert (= (and b!1520216 res!1039832) b!1520214))

(declare-fun m!1402875 () Bool)

(assert (=> b!1520222 m!1402875))

(declare-fun m!1402877 () Bool)

(assert (=> start!129444 m!1402877))

(declare-fun m!1402879 () Bool)

(assert (=> start!129444 m!1402879))

(declare-fun m!1402881 () Bool)

(assert (=> b!1520216 m!1402881))

(declare-fun m!1402883 () Bool)

(assert (=> b!1520216 m!1402883))

(declare-fun m!1402885 () Bool)

(assert (=> b!1520216 m!1402885))

(declare-fun m!1402887 () Bool)

(assert (=> b!1520216 m!1402887))

(declare-fun m!1402889 () Bool)

(assert (=> b!1520216 m!1402889))

(declare-fun m!1402891 () Bool)

(assert (=> b!1520216 m!1402891))

(declare-fun m!1402893 () Bool)

(assert (=> b!1520218 m!1402893))

(assert (=> b!1520218 m!1402893))

(declare-fun m!1402895 () Bool)

(assert (=> b!1520218 m!1402895))

(assert (=> b!1520214 m!1402881))

(assert (=> b!1520214 m!1402881))

(declare-fun m!1402897 () Bool)

(assert (=> b!1520214 m!1402897))

(assert (=> b!1520217 m!1402881))

(assert (=> b!1520217 m!1402881))

(declare-fun m!1402899 () Bool)

(assert (=> b!1520217 m!1402899))

(assert (=> b!1520217 m!1402899))

(assert (=> b!1520217 m!1402881))

(declare-fun m!1402901 () Bool)

(assert (=> b!1520217 m!1402901))

(assert (=> b!1520215 m!1402881))

(assert (=> b!1520215 m!1402881))

(declare-fun m!1402903 () Bool)

(assert (=> b!1520215 m!1402903))

(assert (=> b!1520220 m!1402881))

(assert (=> b!1520220 m!1402881))

(declare-fun m!1402905 () Bool)

(assert (=> b!1520220 m!1402905))

(assert (=> b!1520221 m!1402885))

(assert (=> b!1520221 m!1402889))

(assert (=> b!1520221 m!1402889))

(declare-fun m!1402907 () Bool)

(assert (=> b!1520221 m!1402907))

(assert (=> b!1520221 m!1402907))

(assert (=> b!1520221 m!1402889))

(declare-fun m!1402909 () Bool)

(assert (=> b!1520221 m!1402909))

(declare-fun m!1402911 () Bool)

(assert (=> b!1520224 m!1402911))

(check-sat (not b!1520217) (not b!1520218) (not start!129444) (not b!1520215) (not b!1520221) (not b!1520220) (not b!1520216) (not b!1520224) (not b!1520222) (not b!1520214))
(check-sat)
(get-model)

(declare-fun b!1520303 () Bool)

(declare-fun e!848003 () SeekEntryResult!13014)

(assert (=> b!1520303 (= e!848003 Undefined!13014)))

(declare-fun b!1520304 () Bool)

(declare-fun e!848002 () SeekEntryResult!13014)

(declare-fun lt!658859 () SeekEntryResult!13014)

(assert (=> b!1520304 (= e!848002 (Found!13014 (index!54453 lt!658859)))))

(declare-fun b!1520305 () Bool)

(declare-fun e!848004 () SeekEntryResult!13014)

(assert (=> b!1520305 (= e!848004 (MissingZero!13014 (index!54453 lt!658859)))))

(declare-fun b!1520306 () Bool)

(declare-fun lt!658860 () SeekEntryResult!13014)

(get-info :version)

(assert (=> b!1520306 (= e!848004 (ite ((_ is MissingVacant!13014) lt!658860) (MissingZero!13014 (index!54454 lt!658860)) lt!658860))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520306 (= lt!658860 (seekKeyOrZeroReturnVacant!0 (x!136134 lt!658859) (index!54453 lt!658859) (index!54453 lt!658859) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520308 () Bool)

(assert (=> b!1520308 (= e!848003 e!848002)))

(declare-fun lt!658858 () (_ BitVec 64))

(assert (=> b!1520308 (= lt!658858 (select (arr!48820 a!2804) (index!54453 lt!658859)))))

(declare-fun c!139750 () Bool)

(assert (=> b!1520308 (= c!139750 (= lt!658858 (select (arr!48820 a!2804) j!70)))))

(declare-fun d!158687 () Bool)

(declare-fun lt!658857 () SeekEntryResult!13014)

(assert (=> d!158687 (and (or ((_ is MissingVacant!13014) lt!658857) (not ((_ is Found!13014) lt!658857)) (and (bvsge (index!54452 lt!658857) #b00000000000000000000000000000000) (bvslt (index!54452 lt!658857) (size!49372 a!2804)))) (not ((_ is MissingVacant!13014) lt!658857)) (or (not ((_ is Found!13014) lt!658857)) (= (select (arr!48820 a!2804) (index!54452 lt!658857)) (select (arr!48820 a!2804) j!70))))))

(assert (=> d!158687 (= lt!658857 e!848003)))

(declare-fun c!139749 () Bool)

(assert (=> d!158687 (= c!139749 (and ((_ is Intermediate!13014) lt!658859) (undefined!13826 lt!658859)))))

(assert (=> d!158687 (= lt!658859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158687 (validMask!0 mask!2512)))

(assert (=> d!158687 (= (seekEntry!0 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658857)))

(declare-fun b!1520307 () Bool)

(declare-fun c!139748 () Bool)

(assert (=> b!1520307 (= c!139748 (= lt!658858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520307 (= e!848002 e!848004)))

(assert (= (and d!158687 c!139749) b!1520303))

(assert (= (and d!158687 (not c!139749)) b!1520308))

(assert (= (and b!1520308 c!139750) b!1520304))

(assert (= (and b!1520308 (not c!139750)) b!1520307))

(assert (= (and b!1520307 c!139748) b!1520305))

(assert (= (and b!1520307 (not c!139748)) b!1520306))

(assert (=> b!1520306 m!1402881))

(declare-fun m!1402989 () Bool)

(assert (=> b!1520306 m!1402989))

(declare-fun m!1402991 () Bool)

(assert (=> b!1520308 m!1402991))

(declare-fun m!1402993 () Bool)

(assert (=> d!158687 m!1402993))

(assert (=> d!158687 m!1402881))

(assert (=> d!158687 m!1402899))

(assert (=> d!158687 m!1402899))

(assert (=> d!158687 m!1402881))

(assert (=> d!158687 m!1402901))

(assert (=> d!158687 m!1402877))

(assert (=> b!1520214 d!158687))

(declare-fun d!158689 () Bool)

(declare-fun res!1039909 () Bool)

(declare-fun e!848014 () Bool)

(assert (=> d!158689 (=> res!1039909 e!848014)))

(assert (=> d!158689 (= res!1039909 (bvsge #b00000000000000000000000000000000 (size!49372 a!2804)))))

(assert (=> d!158689 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35378) e!848014)))

(declare-fun b!1520319 () Bool)

(declare-fun e!848013 () Bool)

(assert (=> b!1520319 (= e!848014 e!848013)))

(declare-fun res!1039910 () Bool)

(assert (=> b!1520319 (=> (not res!1039910) (not e!848013))))

(declare-fun e!848016 () Bool)

(assert (=> b!1520319 (= res!1039910 (not e!848016))))

(declare-fun res!1039908 () Bool)

(assert (=> b!1520319 (=> (not res!1039908) (not e!848016))))

(assert (=> b!1520319 (= res!1039908 (validKeyInArray!0 (select (arr!48820 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520320 () Bool)

(declare-fun e!848015 () Bool)

(declare-fun call!68324 () Bool)

(assert (=> b!1520320 (= e!848015 call!68324)))

(declare-fun bm!68321 () Bool)

(declare-fun c!139753 () Bool)

(assert (=> bm!68321 (= call!68324 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139753 (Cons!35377 (select (arr!48820 a!2804) #b00000000000000000000000000000000) Nil!35378) Nil!35378)))))

(declare-fun b!1520321 () Bool)

(assert (=> b!1520321 (= e!848015 call!68324)))

(declare-fun b!1520322 () Bool)

(declare-fun contains!9947 (List!35381 (_ BitVec 64)) Bool)

(assert (=> b!1520322 (= e!848016 (contains!9947 Nil!35378 (select (arr!48820 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520323 () Bool)

(assert (=> b!1520323 (= e!848013 e!848015)))

(assert (=> b!1520323 (= c!139753 (validKeyInArray!0 (select (arr!48820 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158689 (not res!1039909)) b!1520319))

(assert (= (and b!1520319 res!1039908) b!1520322))

(assert (= (and b!1520319 res!1039910) b!1520323))

(assert (= (and b!1520323 c!139753) b!1520321))

(assert (= (and b!1520323 (not c!139753)) b!1520320))

(assert (= (or b!1520321 b!1520320) bm!68321))

(declare-fun m!1402995 () Bool)

(assert (=> b!1520319 m!1402995))

(assert (=> b!1520319 m!1402995))

(declare-fun m!1402997 () Bool)

(assert (=> b!1520319 m!1402997))

(assert (=> bm!68321 m!1402995))

(declare-fun m!1402999 () Bool)

(assert (=> bm!68321 m!1402999))

(assert (=> b!1520322 m!1402995))

(assert (=> b!1520322 m!1402995))

(declare-fun m!1403001 () Bool)

(assert (=> b!1520322 m!1403001))

(assert (=> b!1520323 m!1402995))

(assert (=> b!1520323 m!1402995))

(assert (=> b!1520323 m!1402997))

(assert (=> b!1520224 d!158689))

(declare-fun d!158693 () Bool)

(assert (=> d!158693 (= (validKeyInArray!0 (select (arr!48820 a!2804) i!961)) (and (not (= (select (arr!48820 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48820 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520218 d!158693))

(declare-fun d!158695 () Bool)

(assert (=> d!158695 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129444 d!158695))

(declare-fun d!158699 () Bool)

(assert (=> d!158699 (= (array_inv!38053 a!2804) (bvsge (size!49372 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129444 d!158699))

(declare-fun b!1520422 () Bool)

(declare-fun e!848073 () SeekEntryResult!13014)

(assert (=> b!1520422 (= e!848073 (Intermediate!13014 false (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520423 () Bool)

(declare-fun e!848074 () Bool)

(declare-fun lt!658902 () SeekEntryResult!13014)

(assert (=> b!1520423 (= e!848074 (bvsge (x!136134 lt!658902) #b01111111111111111111111111111110))))

(declare-fun d!158701 () Bool)

(assert (=> d!158701 e!848074))

(declare-fun c!139790 () Bool)

(assert (=> d!158701 (= c!139790 (and ((_ is Intermediate!13014) lt!658902) (undefined!13826 lt!658902)))))

(declare-fun e!848076 () SeekEntryResult!13014)

(assert (=> d!158701 (= lt!658902 e!848076)))

(declare-fun c!139791 () Bool)

(assert (=> d!158701 (= c!139791 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!658901 () (_ BitVec 64))

(assert (=> d!158701 (= lt!658901 (select (arr!48820 a!2804) (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512)))))

(assert (=> d!158701 (validMask!0 mask!2512)))

(assert (=> d!158701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658902)))

(declare-fun b!1520424 () Bool)

(assert (=> b!1520424 (= e!848076 e!848073)))

(declare-fun c!139789 () Bool)

(assert (=> b!1520424 (= c!139789 (or (= lt!658901 (select (arr!48820 a!2804) j!70)) (= (bvadd lt!658901 lt!658901) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520425 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520425 (= e!848073 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520426 () Bool)

(assert (=> b!1520426 (and (bvsge (index!54453 lt!658902) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658902) (size!49372 a!2804)))))

(declare-fun e!848072 () Bool)

(assert (=> b!1520426 (= e!848072 (= (select (arr!48820 a!2804) (index!54453 lt!658902)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520427 () Bool)

(assert (=> b!1520427 (= e!848076 (Intermediate!13014 true (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520428 () Bool)

(assert (=> b!1520428 (and (bvsge (index!54453 lt!658902) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658902) (size!49372 a!2804)))))

(declare-fun res!1039941 () Bool)

(assert (=> b!1520428 (= res!1039941 (= (select (arr!48820 a!2804) (index!54453 lt!658902)) (select (arr!48820 a!2804) j!70)))))

(assert (=> b!1520428 (=> res!1039941 e!848072)))

(declare-fun e!848075 () Bool)

(assert (=> b!1520428 (= e!848075 e!848072)))

(declare-fun b!1520429 () Bool)

(assert (=> b!1520429 (and (bvsge (index!54453 lt!658902) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658902) (size!49372 a!2804)))))

(declare-fun res!1039942 () Bool)

(assert (=> b!1520429 (= res!1039942 (= (select (arr!48820 a!2804) (index!54453 lt!658902)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520429 (=> res!1039942 e!848072)))

(declare-fun b!1520430 () Bool)

(assert (=> b!1520430 (= e!848074 e!848075)))

(declare-fun res!1039940 () Bool)

(assert (=> b!1520430 (= res!1039940 (and ((_ is Intermediate!13014) lt!658902) (not (undefined!13826 lt!658902)) (bvslt (x!136134 lt!658902) #b01111111111111111111111111111110) (bvsge (x!136134 lt!658902) #b00000000000000000000000000000000) (bvsge (x!136134 lt!658902) #b00000000000000000000000000000000)))))

(assert (=> b!1520430 (=> (not res!1039940) (not e!848075))))

(assert (= (and d!158701 c!139791) b!1520427))

(assert (= (and d!158701 (not c!139791)) b!1520424))

(assert (= (and b!1520424 c!139789) b!1520422))

(assert (= (and b!1520424 (not c!139789)) b!1520425))

(assert (= (and d!158701 c!139790) b!1520423))

(assert (= (and d!158701 (not c!139790)) b!1520430))

(assert (= (and b!1520430 res!1039940) b!1520428))

(assert (= (and b!1520428 (not res!1039941)) b!1520429))

(assert (= (and b!1520429 (not res!1039942)) b!1520426))

(declare-fun m!1403023 () Bool)

(assert (=> b!1520428 m!1403023))

(assert (=> b!1520429 m!1403023))

(assert (=> b!1520425 m!1402899))

(declare-fun m!1403025 () Bool)

(assert (=> b!1520425 m!1403025))

(assert (=> b!1520425 m!1403025))

(assert (=> b!1520425 m!1402881))

(declare-fun m!1403027 () Bool)

(assert (=> b!1520425 m!1403027))

(assert (=> b!1520426 m!1403023))

(assert (=> d!158701 m!1402899))

(declare-fun m!1403029 () Bool)

(assert (=> d!158701 m!1403029))

(assert (=> d!158701 m!1402877))

(assert (=> b!1520217 d!158701))

(declare-fun d!158715 () Bool)

(declare-fun lt!658921 () (_ BitVec 32))

(declare-fun lt!658920 () (_ BitVec 32))

(assert (=> d!158715 (= lt!658921 (bvmul (bvxor lt!658920 (bvlshr lt!658920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158715 (= lt!658920 ((_ extract 31 0) (bvand (bvxor (select (arr!48820 a!2804) j!70) (bvlshr (select (arr!48820 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158715 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039943 (let ((h!36800 ((_ extract 31 0) (bvand (bvxor (select (arr!48820 a!2804) j!70) (bvlshr (select (arr!48820 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136141 (bvmul (bvxor h!36800 (bvlshr h!36800 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136141 (bvlshr x!136141 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039943 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039943 #b00000000000000000000000000000000))))))

(assert (=> d!158715 (= (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) (bvand (bvxor lt!658921 (bvlshr lt!658921 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520217 d!158715))

(declare-fun bm!68334 () Bool)

(declare-fun call!68337 () Bool)

(assert (=> bm!68334 (= call!68337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520492 () Bool)

(declare-fun e!848122 () Bool)

(assert (=> b!1520492 (= e!848122 call!68337)))

(declare-fun b!1520493 () Bool)

(declare-fun e!848120 () Bool)

(assert (=> b!1520493 (= e!848120 call!68337)))

(declare-fun b!1520494 () Bool)

(assert (=> b!1520494 (= e!848120 e!848122)))

(declare-fun lt!658944 () (_ BitVec 64))

(assert (=> b!1520494 (= lt!658944 (select (arr!48820 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658945 () Unit!50735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101170 (_ BitVec 64) (_ BitVec 32)) Unit!50735)

(assert (=> b!1520494 (= lt!658945 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658944 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520494 (arrayContainsKey!0 a!2804 lt!658944 #b00000000000000000000000000000000)))

(declare-fun lt!658943 () Unit!50735)

(assert (=> b!1520494 (= lt!658943 lt!658945)))

(declare-fun res!1039975 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520494 (= res!1039975 (= (seekEntryOrOpen!0 (select (arr!48820 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13014 #b00000000000000000000000000000000)))))

(assert (=> b!1520494 (=> (not res!1039975) (not e!848122))))

(declare-fun d!158725 () Bool)

(declare-fun res!1039974 () Bool)

(declare-fun e!848121 () Bool)

(assert (=> d!158725 (=> res!1039974 e!848121)))

(assert (=> d!158725 (= res!1039974 (bvsge #b00000000000000000000000000000000 (size!49372 a!2804)))))

(assert (=> d!158725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848121)))

(declare-fun b!1520495 () Bool)

(assert (=> b!1520495 (= e!848121 e!848120)))

(declare-fun c!139808 () Bool)

(assert (=> b!1520495 (= c!139808 (validKeyInArray!0 (select (arr!48820 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158725 (not res!1039974)) b!1520495))

(assert (= (and b!1520495 c!139808) b!1520494))

(assert (= (and b!1520495 (not c!139808)) b!1520493))

(assert (= (and b!1520494 res!1039975) b!1520492))

(assert (= (or b!1520492 b!1520493) bm!68334))

(declare-fun m!1403087 () Bool)

(assert (=> bm!68334 m!1403087))

(assert (=> b!1520494 m!1402995))

(declare-fun m!1403093 () Bool)

(assert (=> b!1520494 m!1403093))

(declare-fun m!1403095 () Bool)

(assert (=> b!1520494 m!1403095))

(assert (=> b!1520494 m!1402995))

(declare-fun m!1403097 () Bool)

(assert (=> b!1520494 m!1403097))

(assert (=> b!1520495 m!1402995))

(assert (=> b!1520495 m!1402995))

(assert (=> b!1520495 m!1402997))

(assert (=> b!1520222 d!158725))

(declare-fun call!68339 () Bool)

(declare-fun bm!68336 () Bool)

(assert (=> bm!68336 (= call!68339 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520509 () Bool)

(declare-fun e!848133 () Bool)

(assert (=> b!1520509 (= e!848133 call!68339)))

(declare-fun b!1520510 () Bool)

(declare-fun e!848131 () Bool)

(assert (=> b!1520510 (= e!848131 call!68339)))

(declare-fun b!1520511 () Bool)

(assert (=> b!1520511 (= e!848131 e!848133)))

(declare-fun lt!658952 () (_ BitVec 64))

(assert (=> b!1520511 (= lt!658952 (select (arr!48820 a!2804) j!70))))

(declare-fun lt!658953 () Unit!50735)

(assert (=> b!1520511 (= lt!658953 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658952 j!70))))

(assert (=> b!1520511 (arrayContainsKey!0 a!2804 lt!658952 #b00000000000000000000000000000000)))

(declare-fun lt!658951 () Unit!50735)

(assert (=> b!1520511 (= lt!658951 lt!658953)))

(declare-fun res!1039982 () Bool)

(assert (=> b!1520511 (= res!1039982 (= (seekEntryOrOpen!0 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) (Found!13014 j!70)))))

(assert (=> b!1520511 (=> (not res!1039982) (not e!848133))))

(declare-fun d!158739 () Bool)

(declare-fun res!1039981 () Bool)

(declare-fun e!848132 () Bool)

(assert (=> d!158739 (=> res!1039981 e!848132)))

(assert (=> d!158739 (= res!1039981 (bvsge j!70 (size!49372 a!2804)))))

(assert (=> d!158739 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848132)))

(declare-fun b!1520512 () Bool)

(assert (=> b!1520512 (= e!848132 e!848131)))

(declare-fun c!139813 () Bool)

(assert (=> b!1520512 (= c!139813 (validKeyInArray!0 (select (arr!48820 a!2804) j!70)))))

(assert (= (and d!158739 (not res!1039981)) b!1520512))

(assert (= (and b!1520512 c!139813) b!1520511))

(assert (= (and b!1520512 (not c!139813)) b!1520510))

(assert (= (and b!1520511 res!1039982) b!1520509))

(assert (= (or b!1520509 b!1520510) bm!68336))

(declare-fun m!1403101 () Bool)

(assert (=> bm!68336 m!1403101))

(assert (=> b!1520511 m!1402881))

(declare-fun m!1403107 () Bool)

(assert (=> b!1520511 m!1403107))

(declare-fun m!1403111 () Bool)

(assert (=> b!1520511 m!1403111))

(assert (=> b!1520511 m!1402881))

(declare-fun m!1403113 () Bool)

(assert (=> b!1520511 m!1403113))

(assert (=> b!1520512 m!1402881))

(assert (=> b!1520512 m!1402881))

(assert (=> b!1520512 m!1402905))

(assert (=> b!1520216 d!158739))

(declare-fun d!158743 () Bool)

(assert (=> d!158743 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658961 () Unit!50735)

(declare-fun choose!38 (array!101170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50735)

(assert (=> d!158743 (= lt!658961 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158743 (validMask!0 mask!2512)))

(assert (=> d!158743 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658961)))

(declare-fun bs!43595 () Bool)

(assert (= bs!43595 d!158743))

(assert (=> bs!43595 m!1402891))

(declare-fun m!1403117 () Bool)

(assert (=> bs!43595 m!1403117))

(assert (=> bs!43595 m!1402877))

(assert (=> b!1520216 d!158743))

(declare-fun e!848147 () SeekEntryResult!13014)

(declare-fun b!1520528 () Bool)

(assert (=> b!1520528 (= e!848147 (Intermediate!13014 false (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520529 () Bool)

(declare-fun e!848148 () Bool)

(declare-fun lt!658963 () SeekEntryResult!13014)

(assert (=> b!1520529 (= e!848148 (bvsge (x!136134 lt!658963) #b01111111111111111111111111111110))))

(declare-fun d!158751 () Bool)

(assert (=> d!158751 e!848148))

(declare-fun c!139818 () Bool)

(assert (=> d!158751 (= c!139818 (and ((_ is Intermediate!13014) lt!658963) (undefined!13826 lt!658963)))))

(declare-fun e!848150 () SeekEntryResult!13014)

(assert (=> d!158751 (= lt!658963 e!848150)))

(declare-fun c!139819 () Bool)

(assert (=> d!158751 (= c!139819 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!658962 () (_ BitVec 64))

(assert (=> d!158751 (= lt!658962 (select (arr!48820 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804))) (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158751 (validMask!0 mask!2512)))

(assert (=> d!158751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)) mask!2512) lt!658963)))

(declare-fun b!1520530 () Bool)

(assert (=> b!1520530 (= e!848150 e!848147)))

(declare-fun c!139817 () Bool)

(assert (=> b!1520530 (= c!139817 (or (= lt!658962 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658962 lt!658962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520531 () Bool)

(assert (=> b!1520531 (= e!848147 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)) mask!2512))))

(declare-fun b!1520532 () Bool)

(assert (=> b!1520532 (and (bvsge (index!54453 lt!658963) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658963) (size!49372 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)))))))

(declare-fun e!848146 () Bool)

(assert (=> b!1520532 (= e!848146 (= (select (arr!48820 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804))) (index!54453 lt!658963)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520533 () Bool)

(assert (=> b!1520533 (= e!848150 (Intermediate!13014 true (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520534 () Bool)

(assert (=> b!1520534 (and (bvsge (index!54453 lt!658963) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658963) (size!49372 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)))))))

(declare-fun res!1039993 () Bool)

(assert (=> b!1520534 (= res!1039993 (= (select (arr!48820 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804))) (index!54453 lt!658963)) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1520534 (=> res!1039993 e!848146)))

(declare-fun e!848149 () Bool)

(assert (=> b!1520534 (= e!848149 e!848146)))

(declare-fun b!1520535 () Bool)

(assert (=> b!1520535 (and (bvsge (index!54453 lt!658963) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658963) (size!49372 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)))))))

(declare-fun res!1039994 () Bool)

(assert (=> b!1520535 (= res!1039994 (= (select (arr!48820 (array!101171 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804))) (index!54453 lt!658963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520535 (=> res!1039994 e!848146)))

(declare-fun b!1520536 () Bool)

(assert (=> b!1520536 (= e!848148 e!848149)))

(declare-fun res!1039992 () Bool)

(assert (=> b!1520536 (= res!1039992 (and ((_ is Intermediate!13014) lt!658963) (not (undefined!13826 lt!658963)) (bvslt (x!136134 lt!658963) #b01111111111111111111111111111110) (bvsge (x!136134 lt!658963) #b00000000000000000000000000000000) (bvsge (x!136134 lt!658963) #b00000000000000000000000000000000)))))

(assert (=> b!1520536 (=> (not res!1039992) (not e!848149))))

(assert (= (and d!158751 c!139819) b!1520533))

(assert (= (and d!158751 (not c!139819)) b!1520530))

(assert (= (and b!1520530 c!139817) b!1520528))

(assert (= (and b!1520530 (not c!139817)) b!1520531))

(assert (= (and d!158751 c!139818) b!1520529))

(assert (= (and d!158751 (not c!139818)) b!1520536))

(assert (= (and b!1520536 res!1039992) b!1520534))

(assert (= (and b!1520534 (not res!1039993)) b!1520535))

(assert (= (and b!1520535 (not res!1039994)) b!1520532))

(declare-fun m!1403123 () Bool)

(assert (=> b!1520534 m!1403123))

(assert (=> b!1520535 m!1403123))

(assert (=> b!1520531 m!1402907))

(declare-fun m!1403125 () Bool)

(assert (=> b!1520531 m!1403125))

(assert (=> b!1520531 m!1403125))

(assert (=> b!1520531 m!1402889))

(declare-fun m!1403127 () Bool)

(assert (=> b!1520531 m!1403127))

(assert (=> b!1520532 m!1403123))

(assert (=> d!158751 m!1402907))

(declare-fun m!1403129 () Bool)

(assert (=> d!158751 m!1403129))

(assert (=> d!158751 m!1402877))

(assert (=> b!1520221 d!158751))

(declare-fun d!158755 () Bool)

(declare-fun lt!658965 () (_ BitVec 32))

(declare-fun lt!658964 () (_ BitVec 32))

(assert (=> d!158755 (= lt!658965 (bvmul (bvxor lt!658964 (bvlshr lt!658964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158755 (= lt!658964 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158755 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039943 (let ((h!36800 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136141 (bvmul (bvxor h!36800 (bvlshr h!36800 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136141 (bvlshr x!136141 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039943 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039943 #b00000000000000000000000000000000))))))

(assert (=> d!158755 (= (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658965 (bvlshr lt!658965 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520221 d!158755))

(declare-fun b!1520537 () Bool)

(declare-fun e!848152 () SeekEntryResult!13014)

(assert (=> b!1520537 (= e!848152 (Intermediate!13014 false index!487 x!534))))

(declare-fun b!1520538 () Bool)

(declare-fun e!848153 () Bool)

(declare-fun lt!658967 () SeekEntryResult!13014)

(assert (=> b!1520538 (= e!848153 (bvsge (x!136134 lt!658967) #b01111111111111111111111111111110))))

(declare-fun d!158757 () Bool)

(assert (=> d!158757 e!848153))

(declare-fun c!139821 () Bool)

(assert (=> d!158757 (= c!139821 (and ((_ is Intermediate!13014) lt!658967) (undefined!13826 lt!658967)))))

(declare-fun e!848155 () SeekEntryResult!13014)

(assert (=> d!158757 (= lt!658967 e!848155)))

(declare-fun c!139822 () Bool)

(assert (=> d!158757 (= c!139822 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!658966 () (_ BitVec 64))

(assert (=> d!158757 (= lt!658966 (select (arr!48820 a!2804) index!487))))

(assert (=> d!158757 (validMask!0 mask!2512)))

(assert (=> d!158757 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658967)))

(declare-fun b!1520539 () Bool)

(assert (=> b!1520539 (= e!848155 e!848152)))

(declare-fun c!139820 () Bool)

(assert (=> b!1520539 (= c!139820 (or (= lt!658966 (select (arr!48820 a!2804) j!70)) (= (bvadd lt!658966 lt!658966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520540 () Bool)

(assert (=> b!1520540 (= e!848152 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520541 () Bool)

(assert (=> b!1520541 (and (bvsge (index!54453 lt!658967) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658967) (size!49372 a!2804)))))

(declare-fun e!848151 () Bool)

(assert (=> b!1520541 (= e!848151 (= (select (arr!48820 a!2804) (index!54453 lt!658967)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520542 () Bool)

(assert (=> b!1520542 (= e!848155 (Intermediate!13014 true index!487 x!534))))

(declare-fun b!1520543 () Bool)

(assert (=> b!1520543 (and (bvsge (index!54453 lt!658967) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658967) (size!49372 a!2804)))))

(declare-fun res!1039996 () Bool)

(assert (=> b!1520543 (= res!1039996 (= (select (arr!48820 a!2804) (index!54453 lt!658967)) (select (arr!48820 a!2804) j!70)))))

(assert (=> b!1520543 (=> res!1039996 e!848151)))

(declare-fun e!848154 () Bool)

(assert (=> b!1520543 (= e!848154 e!848151)))

(declare-fun b!1520544 () Bool)

(assert (=> b!1520544 (and (bvsge (index!54453 lt!658967) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658967) (size!49372 a!2804)))))

(declare-fun res!1039997 () Bool)

(assert (=> b!1520544 (= res!1039997 (= (select (arr!48820 a!2804) (index!54453 lt!658967)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520544 (=> res!1039997 e!848151)))

(declare-fun b!1520545 () Bool)

(assert (=> b!1520545 (= e!848153 e!848154)))

(declare-fun res!1039995 () Bool)

(assert (=> b!1520545 (= res!1039995 (and ((_ is Intermediate!13014) lt!658967) (not (undefined!13826 lt!658967)) (bvslt (x!136134 lt!658967) #b01111111111111111111111111111110) (bvsge (x!136134 lt!658967) #b00000000000000000000000000000000) (bvsge (x!136134 lt!658967) x!534)))))

(assert (=> b!1520545 (=> (not res!1039995) (not e!848154))))

(assert (= (and d!158757 c!139822) b!1520542))

(assert (= (and d!158757 (not c!139822)) b!1520539))

(assert (= (and b!1520539 c!139820) b!1520537))

(assert (= (and b!1520539 (not c!139820)) b!1520540))

(assert (= (and d!158757 c!139821) b!1520538))

(assert (= (and d!158757 (not c!139821)) b!1520545))

(assert (= (and b!1520545 res!1039995) b!1520543))

(assert (= (and b!1520543 (not res!1039996)) b!1520544))

(assert (= (and b!1520544 (not res!1039997)) b!1520541))

(declare-fun m!1403131 () Bool)

(assert (=> b!1520543 m!1403131))

(assert (=> b!1520544 m!1403131))

(declare-fun m!1403133 () Bool)

(assert (=> b!1520540 m!1403133))

(assert (=> b!1520540 m!1403133))

(assert (=> b!1520540 m!1402881))

(declare-fun m!1403135 () Bool)

(assert (=> b!1520540 m!1403135))

(assert (=> b!1520541 m!1403131))

(assert (=> d!158757 m!1402887))

(assert (=> d!158757 m!1402877))

(assert (=> b!1520215 d!158757))

(declare-fun d!158759 () Bool)

(assert (=> d!158759 (= (validKeyInArray!0 (select (arr!48820 a!2804) j!70)) (and (not (= (select (arr!48820 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48820 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520220 d!158759))

(check-sat (not b!1520425) (not d!158701) (not b!1520495) (not d!158743) (not b!1520531) (not b!1520512) (not b!1520319) (not b!1520322) (not d!158751) (not b!1520540) (not bm!68321) (not bm!68336) (not d!158687) (not b!1520323) (not b!1520511) (not bm!68334) (not b!1520306) (not b!1520494) (not d!158757))
(check-sat)
