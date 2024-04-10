; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119446 () Bool)

(assert start!119446)

(declare-fun b!1392077 () Bool)

(declare-fun res!931802 () Bool)

(declare-fun e!788282 () Bool)

(assert (=> b!1392077 (=> (not res!931802) (not e!788282))))

(declare-datatypes ((array!95230 0))(
  ( (array!95231 (arr!45976 (Array (_ BitVec 32) (_ BitVec 64))) (size!46526 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95230)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392077 (= res!931802 (validKeyInArray!0 (select (arr!45976 a!2901) i!1037)))))

(declare-fun b!1392078 () Bool)

(declare-fun res!931797 () Bool)

(assert (=> b!1392078 (=> (not res!931797) (not e!788282))))

(declare-datatypes ((List!32495 0))(
  ( (Nil!32492) (Cons!32491 (h!33718 (_ BitVec 64)) (t!47189 List!32495)) )
))
(declare-fun arrayNoDuplicates!0 (array!95230 (_ BitVec 32) List!32495) Bool)

(assert (=> b!1392078 (= res!931797 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32492))))

(declare-fun res!931801 () Bool)

(assert (=> start!119446 (=> (not res!931801) (not e!788282))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119446 (= res!931801 (validMask!0 mask!2840))))

(assert (=> start!119446 e!788282))

(assert (=> start!119446 true))

(declare-fun array_inv!35004 (array!95230) Bool)

(assert (=> start!119446 (array_inv!35004 a!2901)))

(declare-fun b!1392079 () Bool)

(declare-fun e!788280 () Bool)

(assert (=> b!1392079 (= e!788282 (not e!788280))))

(declare-fun res!931799 () Bool)

(assert (=> b!1392079 (=> res!931799 e!788280)))

(declare-datatypes ((SeekEntryResult!10293 0))(
  ( (MissingZero!10293 (index!43543 (_ BitVec 32))) (Found!10293 (index!43544 (_ BitVec 32))) (Intermediate!10293 (undefined!11105 Bool) (index!43545 (_ BitVec 32)) (x!125221 (_ BitVec 32))) (Undefined!10293) (MissingVacant!10293 (index!43546 (_ BitVec 32))) )
))
(declare-fun lt!611457 () SeekEntryResult!10293)

(assert (=> b!1392079 (= res!931799 (or (not (is-Intermediate!10293 lt!611457)) (undefined!11105 lt!611457)))))

(declare-fun e!788279 () Bool)

(assert (=> b!1392079 e!788279))

(declare-fun res!931800 () Bool)

(assert (=> b!1392079 (=> (not res!931800) (not e!788279))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95230 (_ BitVec 32)) Bool)

(assert (=> b!1392079 (= res!931800 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46590 0))(
  ( (Unit!46591) )
))
(declare-fun lt!611455 () Unit!46590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46590)

(assert (=> b!1392079 (= lt!611455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95230 (_ BitVec 32)) SeekEntryResult!10293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392079 (= lt!611457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) (select (arr!45976 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392080 () Bool)

(declare-fun res!931804 () Bool)

(assert (=> b!1392080 (=> (not res!931804) (not e!788282))))

(assert (=> b!1392080 (= res!931804 (and (= (size!46526 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46526 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46526 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95230 (_ BitVec 32)) SeekEntryResult!10293)

(assert (=> b!1392081 (= e!788279 (= (seekEntryOrOpen!0 (select (arr!45976 a!2901) j!112) a!2901 mask!2840) (Found!10293 j!112)))))

(declare-fun b!1392082 () Bool)

(declare-fun res!931798 () Bool)

(assert (=> b!1392082 (=> (not res!931798) (not e!788282))))

(assert (=> b!1392082 (= res!931798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392083 () Bool)

(declare-fun lt!611456 () (_ BitVec 32))

(assert (=> b!1392083 (= e!788280 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611456 #b00000000000000000000000000000000) (bvslt lt!611456 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(assert (=> b!1392083 (= lt!611456 (toIndex!0 (select (store (arr!45976 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392084 () Bool)

(declare-fun res!931803 () Bool)

(assert (=> b!1392084 (=> (not res!931803) (not e!788282))))

(assert (=> b!1392084 (= res!931803 (validKeyInArray!0 (select (arr!45976 a!2901) j!112)))))

(assert (= (and start!119446 res!931801) b!1392080))

(assert (= (and b!1392080 res!931804) b!1392077))

(assert (= (and b!1392077 res!931802) b!1392084))

(assert (= (and b!1392084 res!931803) b!1392082))

(assert (= (and b!1392082 res!931798) b!1392078))

(assert (= (and b!1392078 res!931797) b!1392079))

(assert (= (and b!1392079 res!931800) b!1392081))

(assert (= (and b!1392079 (not res!931799)) b!1392083))

(declare-fun m!1277875 () Bool)

(assert (=> b!1392077 m!1277875))

(assert (=> b!1392077 m!1277875))

(declare-fun m!1277877 () Bool)

(assert (=> b!1392077 m!1277877))

(declare-fun m!1277879 () Bool)

(assert (=> b!1392084 m!1277879))

(assert (=> b!1392084 m!1277879))

(declare-fun m!1277881 () Bool)

(assert (=> b!1392084 m!1277881))

(declare-fun m!1277883 () Bool)

(assert (=> b!1392078 m!1277883))

(declare-fun m!1277885 () Bool)

(assert (=> start!119446 m!1277885))

(declare-fun m!1277887 () Bool)

(assert (=> start!119446 m!1277887))

(assert (=> b!1392081 m!1277879))

(assert (=> b!1392081 m!1277879))

(declare-fun m!1277889 () Bool)

(assert (=> b!1392081 m!1277889))

(declare-fun m!1277891 () Bool)

(assert (=> b!1392083 m!1277891))

(declare-fun m!1277893 () Bool)

(assert (=> b!1392083 m!1277893))

(assert (=> b!1392083 m!1277893))

(declare-fun m!1277895 () Bool)

(assert (=> b!1392083 m!1277895))

(assert (=> b!1392079 m!1277879))

(declare-fun m!1277897 () Bool)

(assert (=> b!1392079 m!1277897))

(assert (=> b!1392079 m!1277879))

(declare-fun m!1277899 () Bool)

(assert (=> b!1392079 m!1277899))

(assert (=> b!1392079 m!1277897))

(assert (=> b!1392079 m!1277879))

(declare-fun m!1277901 () Bool)

(assert (=> b!1392079 m!1277901))

(declare-fun m!1277903 () Bool)

(assert (=> b!1392079 m!1277903))

(declare-fun m!1277905 () Bool)

(assert (=> b!1392082 m!1277905))

(push 1)

(assert (not b!1392082))

(assert (not b!1392083))

(assert (not b!1392079))

(assert (not b!1392081))

(assert (not b!1392084))

(assert (not start!119446))

(assert (not b!1392078))

(assert (not b!1392077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66760 () Bool)

(declare-fun call!66763 () Bool)

(declare-fun c!129593 () Bool)

(assert (=> bm!66760 (= call!66763 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129593 (Cons!32491 (select (arr!45976 a!2901) #b00000000000000000000000000000000) Nil!32492) Nil!32492)))))

(declare-fun b!1392103 () Bool)

(declare-fun e!788299 () Bool)

(declare-fun e!788298 () Bool)

(assert (=> b!1392103 (= e!788299 e!788298)))

(declare-fun res!931816 () Bool)

(assert (=> b!1392103 (=> (not res!931816) (not e!788298))))

(declare-fun e!788297 () Bool)

(assert (=> b!1392103 (= res!931816 (not e!788297))))

(declare-fun res!931818 () Bool)

(assert (=> b!1392103 (=> (not res!931818) (not e!788297))))

(assert (=> b!1392103 (= res!931818 (validKeyInArray!0 (select (arr!45976 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392104 () Bool)

(declare-fun contains!9768 (List!32495 (_ BitVec 64)) Bool)

(assert (=> b!1392104 (= e!788297 (contains!9768 Nil!32492 (select (arr!45976 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150423 () Bool)

(declare-fun res!931817 () Bool)

(assert (=> d!150423 (=> res!931817 e!788299)))

(assert (=> d!150423 (= res!931817 (bvsge #b00000000000000000000000000000000 (size!46526 a!2901)))))

(assert (=> d!150423 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32492) e!788299)))

(declare-fun b!1392105 () Bool)

(declare-fun e!788300 () Bool)

(assert (=> b!1392105 (= e!788300 call!66763)))

(declare-fun b!1392106 () Bool)

(assert (=> b!1392106 (= e!788300 call!66763)))

(declare-fun b!1392107 () Bool)

(assert (=> b!1392107 (= e!788298 e!788300)))

(assert (=> b!1392107 (= c!129593 (validKeyInArray!0 (select (arr!45976 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150423 (not res!931817)) b!1392103))

(assert (= (and b!1392103 res!931818) b!1392104))

(assert (= (and b!1392103 res!931816) b!1392107))

(assert (= (and b!1392107 c!129593) b!1392106))

(assert (= (and b!1392107 (not c!129593)) b!1392105))

(assert (= (or b!1392106 b!1392105) bm!66760))

(declare-fun m!1277907 () Bool)

(assert (=> bm!66760 m!1277907))

(declare-fun m!1277909 () Bool)

(assert (=> bm!66760 m!1277909))

(assert (=> b!1392103 m!1277907))

(assert (=> b!1392103 m!1277907))

(declare-fun m!1277911 () Bool)

(assert (=> b!1392103 m!1277911))

(assert (=> b!1392104 m!1277907))

(assert (=> b!1392104 m!1277907))

(declare-fun m!1277913 () Bool)

(assert (=> b!1392104 m!1277913))

(assert (=> b!1392107 m!1277907))

(assert (=> b!1392107 m!1277907))

(assert (=> b!1392107 m!1277911))

(assert (=> b!1392078 d!150423))

(declare-fun d!150429 () Bool)

(declare-fun lt!611478 () (_ BitVec 32))

(declare-fun lt!611477 () (_ BitVec 32))

(assert (=> d!150429 (= lt!611478 (bvmul (bvxor lt!611477 (bvlshr lt!611477 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150429 (= lt!611477 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45976 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45976 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150429 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931819 (let ((h!33720 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45976 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45976 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125223 (bvmul (bvxor h!33720 (bvlshr h!33720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125223 (bvlshr x!125223 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931819 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931819 #b00000000000000000000000000000000))))))

(assert (=> d!150429 (= (toIndex!0 (select (store (arr!45976 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611478 (bvlshr lt!611478 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392083 d!150429))

(declare-fun d!150435 () Bool)

(assert (=> d!150435 (= (validKeyInArray!0 (select (arr!45976 a!2901) i!1037)) (and (not (= (select (arr!45976 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45976 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392077 d!150435))

(declare-fun d!150437 () Bool)

(assert (=> d!150437 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119446 d!150437))

(declare-fun d!150443 () Bool)

(assert (=> d!150443 (= (array_inv!35004 a!2901) (bvsge (size!46526 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119446 d!150443))

(declare-fun bm!66768 () Bool)

(declare-fun call!66771 () Bool)

(assert (=> bm!66768 (= call!66771 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392146 () Bool)

(declare-fun e!788325 () Bool)

(assert (=> b!1392146 (= e!788325 call!66771)))

(declare-fun d!150445 () Bool)

(declare-fun res!931831 () Bool)

(declare-fun e!788327 () Bool)

(assert (=> d!150445 (=> res!931831 e!788327)))

(assert (=> d!150445 (= res!931831 (bvsge j!112 (size!46526 a!2901)))))

(assert (=> d!150445 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788327)))

(declare-fun b!1392147 () Bool)

(declare-fun e!788326 () Bool)

(assert (=> b!1392147 (= e!788325 e!788326)))

(declare-fun lt!611500 () (_ BitVec 64))

(assert (=> b!1392147 (= lt!611500 (select (arr!45976 a!2901) j!112))))

(declare-fun lt!611502 () Unit!46590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95230 (_ BitVec 64) (_ BitVec 32)) Unit!46590)

(assert (=> b!1392147 (= lt!611502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611500 j!112))))

(declare-fun arrayContainsKey!0 (array!95230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392147 (arrayContainsKey!0 a!2901 lt!611500 #b00000000000000000000000000000000)))

(declare-fun lt!611501 () Unit!46590)

(assert (=> b!1392147 (= lt!611501 lt!611502)))

(declare-fun res!931830 () Bool)

(assert (=> b!1392147 (= res!931830 (= (seekEntryOrOpen!0 (select (arr!45976 a!2901) j!112) a!2901 mask!2840) (Found!10293 j!112)))))

(assert (=> b!1392147 (=> (not res!931830) (not e!788326))))

(declare-fun b!1392148 () Bool)

(assert (=> b!1392148 (= e!788326 call!66771)))

(declare-fun b!1392149 () Bool)

(assert (=> b!1392149 (= e!788327 e!788325)))

(declare-fun c!129608 () Bool)

(assert (=> b!1392149 (= c!129608 (validKeyInArray!0 (select (arr!45976 a!2901) j!112)))))

(assert (= (and d!150445 (not res!931831)) b!1392149))

(assert (= (and b!1392149 c!129608) b!1392147))

(assert (= (and b!1392149 (not c!129608)) b!1392146))

(assert (= (and b!1392147 res!931830) b!1392148))

(assert (= (or b!1392148 b!1392146) bm!66768))

(declare-fun m!1277937 () Bool)

(assert (=> bm!66768 m!1277937))

(assert (=> b!1392147 m!1277879))

(declare-fun m!1277939 () Bool)

(assert (=> b!1392147 m!1277939))

(declare-fun m!1277941 () Bool)

(assert (=> b!1392147 m!1277941))

(assert (=> b!1392147 m!1277879))

(assert (=> b!1392147 m!1277889))

(assert (=> b!1392149 m!1277879))

(assert (=> b!1392149 m!1277879))

(assert (=> b!1392149 m!1277881))

(assert (=> b!1392079 d!150445))

(declare-fun d!150453 () Bool)

(assert (=> d!150453 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611514 () Unit!46590)

(declare-fun choose!38 (array!95230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46590)

(assert (=> d!150453 (= lt!611514 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150453 (validMask!0 mask!2840)))

(assert (=> d!150453 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611514)))

(declare-fun bs!40499 () Bool)

(assert (= bs!40499 d!150453))

(assert (=> bs!40499 m!1277903))

(declare-fun m!1277949 () Bool)

(assert (=> bs!40499 m!1277949))

(assert (=> bs!40499 m!1277885))

(assert (=> b!1392079 d!150453))

(declare-fun b!1392212 () Bool)

(declare-fun lt!611535 () SeekEntryResult!10293)

(assert (=> b!1392212 (and (bvsge (index!43545 lt!611535) #b00000000000000000000000000000000) (bvslt (index!43545 lt!611535) (size!46526 a!2901)))))

(declare-fun e!788367 () Bool)

(assert (=> b!1392212 (= e!788367 (= (select (arr!45976 a!2901) (index!43545 lt!611535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392213 () Bool)

(assert (=> b!1392213 (and (bvsge (index!43545 lt!611535) #b00000000000000000000000000000000) (bvslt (index!43545 lt!611535) (size!46526 a!2901)))))

(declare-fun res!931850 () Bool)

(assert (=> b!1392213 (= res!931850 (= (select (arr!45976 a!2901) (index!43545 lt!611535)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392213 (=> res!931850 e!788367)))

(declare-fun b!1392214 () Bool)

(declare-fun e!788363 () SeekEntryResult!10293)

(declare-fun e!788365 () SeekEntryResult!10293)

(assert (=> b!1392214 (= e!788363 e!788365)))

(declare-fun c!129633 () Bool)

(declare-fun lt!611536 () (_ BitVec 64))

(assert (=> b!1392214 (= c!129633 (or (= lt!611536 (select (arr!45976 a!2901) j!112)) (= (bvadd lt!611536 lt!611536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392215 () Bool)

(assert (=> b!1392215 (and (bvsge (index!43545 lt!611535) #b00000000000000000000000000000000) (bvslt (index!43545 lt!611535) (size!46526 a!2901)))))

(declare-fun res!931849 () Bool)

(assert (=> b!1392215 (= res!931849 (= (select (arr!45976 a!2901) (index!43545 lt!611535)) (select (arr!45976 a!2901) j!112)))))

(assert (=> b!1392215 (=> res!931849 e!788367)))

(declare-fun e!788366 () Bool)

(assert (=> b!1392215 (= e!788366 e!788367)))

(declare-fun b!1392216 () Bool)

(declare-fun e!788364 () Bool)

(assert (=> b!1392216 (= e!788364 (bvsge (x!125221 lt!611535) #b01111111111111111111111111111110))))

(declare-fun d!150457 () Bool)

(assert (=> d!150457 e!788364))

(declare-fun c!129634 () Bool)

(assert (=> d!150457 (= c!129634 (and (is-Intermediate!10293 lt!611535) (undefined!11105 lt!611535)))))

(assert (=> d!150457 (= lt!611535 e!788363)))

(declare-fun c!129632 () Bool)

(assert (=> d!150457 (= c!129632 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150457 (= lt!611536 (select (arr!45976 a!2901) (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840)))))

(assert (=> d!150457 (validMask!0 mask!2840)))

(assert (=> d!150457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) (select (arr!45976 a!2901) j!112) a!2901 mask!2840) lt!611535)))

(declare-fun b!1392217 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392217 (= e!788365 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45976 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392218 () Bool)

(assert (=> b!1392218 (= e!788363 (Intermediate!10293 true (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392219 () Bool)

(assert (=> b!1392219 (= e!788365 (Intermediate!10293 false (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392220 () Bool)

(assert (=> b!1392220 (= e!788364 e!788366)))

(declare-fun res!931848 () Bool)

(assert (=> b!1392220 (= res!931848 (and (is-Intermediate!10293 lt!611535) (not (undefined!11105 lt!611535)) (bvslt (x!125221 lt!611535) #b01111111111111111111111111111110) (bvsge (x!125221 lt!611535) #b00000000000000000000000000000000) (bvsge (x!125221 lt!611535) #b00000000000000000000000000000000)))))

(assert (=> b!1392220 (=> (not res!931848) (not e!788366))))

(assert (= (and d!150457 c!129632) b!1392218))

(assert (= (and d!150457 (not c!129632)) b!1392214))

(assert (= (and b!1392214 c!129633) b!1392219))

(assert (= (and b!1392214 (not c!129633)) b!1392217))

(assert (= (and d!150457 c!129634) b!1392216))

(assert (= (and d!150457 (not c!129634)) b!1392220))

(assert (= (and b!1392220 res!931848) b!1392215))

(assert (= (and b!1392215 (not res!931849)) b!1392213))

(assert (= (and b!1392213 (not res!931850)) b!1392212))

(declare-fun m!1277971 () Bool)

(assert (=> b!1392213 m!1277971))

(assert (=> b!1392217 m!1277897))

(declare-fun m!1277973 () Bool)

(assert (=> b!1392217 m!1277973))

(assert (=> b!1392217 m!1277973))

(assert (=> b!1392217 m!1277879))

(declare-fun m!1277975 () Bool)

(assert (=> b!1392217 m!1277975))

(assert (=> b!1392215 m!1277971))

(assert (=> b!1392212 m!1277971))

(assert (=> d!150457 m!1277897))

(declare-fun m!1277977 () Bool)

(assert (=> d!150457 m!1277977))

(assert (=> d!150457 m!1277885))

(assert (=> b!1392079 d!150457))

(declare-fun d!150467 () Bool)

(declare-fun lt!611538 () (_ BitVec 32))

(declare-fun lt!611537 () (_ BitVec 32))

(assert (=> d!150467 (= lt!611538 (bvmul (bvxor lt!611537 (bvlshr lt!611537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150467 (= lt!611537 ((_ extract 31 0) (bvand (bvxor (select (arr!45976 a!2901) j!112) (bvlshr (select (arr!45976 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150467 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931819 (let ((h!33720 ((_ extract 31 0) (bvand (bvxor (select (arr!45976 a!2901) j!112) (bvlshr (select (arr!45976 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125223 (bvmul (bvxor h!33720 (bvlshr h!33720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125223 (bvlshr x!125223 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931819 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931819 #b00000000000000000000000000000000))))))

(assert (=> d!150467 (= (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) (bvand (bvxor lt!611538 (bvlshr lt!611538 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392079 d!150467))

(declare-fun d!150469 () Bool)

(assert (=> d!150469 (= (validKeyInArray!0 (select (arr!45976 a!2901) j!112)) (and (not (= (select (arr!45976 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45976 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392084 d!150469))

(declare-fun bm!66771 () Bool)

(declare-fun call!66774 () Bool)

(assert (=> bm!66771 (= call!66774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392221 () Bool)

(declare-fun e!788368 () Bool)

(assert (=> b!1392221 (= e!788368 call!66774)))

(declare-fun d!150471 () Bool)

(declare-fun res!931852 () Bool)

(declare-fun e!788370 () Bool)

(assert (=> d!150471 (=> res!931852 e!788370)))

(assert (=> d!150471 (= res!931852 (bvsge #b00000000000000000000000000000000 (size!46526 a!2901)))))

(assert (=> d!150471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788370)))

(declare-fun b!1392222 () Bool)

(declare-fun e!788369 () Bool)

(assert (=> b!1392222 (= e!788368 e!788369)))

(declare-fun lt!611539 () (_ BitVec 64))

(assert (=> b!1392222 (= lt!611539 (select (arr!45976 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611541 () Unit!46590)

(assert (=> b!1392222 (= lt!611541 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611539 #b00000000000000000000000000000000))))

(assert (=> b!1392222 (arrayContainsKey!0 a!2901 lt!611539 #b00000000000000000000000000000000)))

(declare-fun lt!611540 () Unit!46590)

(assert (=> b!1392222 (= lt!611540 lt!611541)))

(declare-fun res!931851 () Bool)

(assert (=> b!1392222 (= res!931851 (= (seekEntryOrOpen!0 (select (arr!45976 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10293 #b00000000000000000000000000000000)))))

(assert (=> b!1392222 (=> (not res!931851) (not e!788369))))

(declare-fun b!1392223 () Bool)

(assert (=> b!1392223 (= e!788369 call!66774)))

(declare-fun b!1392224 () Bool)

(assert (=> b!1392224 (= e!788370 e!788368)))

(declare-fun c!129635 () Bool)

(assert (=> b!1392224 (= c!129635 (validKeyInArray!0 (select (arr!45976 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150471 (not res!931852)) b!1392224))

(assert (= (and b!1392224 c!129635) b!1392222))

(assert (= (and b!1392224 (not c!129635)) b!1392221))

(assert (= (and b!1392222 res!931851) b!1392223))

(assert (= (or b!1392223 b!1392221) bm!66771))

(declare-fun m!1277979 () Bool)

(assert (=> bm!66771 m!1277979))

(assert (=> b!1392222 m!1277907))

(declare-fun m!1277981 () Bool)

(assert (=> b!1392222 m!1277981))

(declare-fun m!1277983 () Bool)

(assert (=> b!1392222 m!1277983))

(assert (=> b!1392222 m!1277907))

(declare-fun m!1277985 () Bool)

(assert (=> b!1392222 m!1277985))

(assert (=> b!1392224 m!1277907))

(assert (=> b!1392224 m!1277907))

(assert (=> b!1392224 m!1277911))

(assert (=> b!1392082 d!150471))

(declare-fun b!1392303 () Bool)

(declare-fun lt!611567 () SeekEntryResult!10293)

(declare-fun e!788423 () SeekEntryResult!10293)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95230 (_ BitVec 32)) SeekEntryResult!10293)

(assert (=> b!1392303 (= e!788423 (seekKeyOrZeroReturnVacant!0 (x!125221 lt!611567) (index!43545 lt!611567) (index!43545 lt!611567) (select (arr!45976 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392304 () Bool)

(declare-fun e!788422 () SeekEntryResult!10293)

(assert (=> b!1392304 (= e!788422 Undefined!10293)))

(declare-fun d!150473 () Bool)

(declare-fun lt!611568 () SeekEntryResult!10293)

(assert (=> d!150473 (and (or (is-Undefined!10293 lt!611568) (not (is-Found!10293 lt!611568)) (and (bvsge (index!43544 lt!611568) #b00000000000000000000000000000000) (bvslt (index!43544 lt!611568) (size!46526 a!2901)))) (or (is-Undefined!10293 lt!611568) (is-Found!10293 lt!611568) (not (is-MissingZero!10293 lt!611568)) (and (bvsge (index!43543 lt!611568) #b00000000000000000000000000000000) (bvslt (index!43543 lt!611568) (size!46526 a!2901)))) (or (is-Undefined!10293 lt!611568) (is-Found!10293 lt!611568) (is-MissingZero!10293 lt!611568) (not (is-MissingVacant!10293 lt!611568)) (and (bvsge (index!43546 lt!611568) #b00000000000000000000000000000000) (bvslt (index!43546 lt!611568) (size!46526 a!2901)))) (or (is-Undefined!10293 lt!611568) (ite (is-Found!10293 lt!611568) (= (select (arr!45976 a!2901) (index!43544 lt!611568)) (select (arr!45976 a!2901) j!112)) (ite (is-MissingZero!10293 lt!611568) (= (select (arr!45976 a!2901) (index!43543 lt!611568)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10293 lt!611568) (= (select (arr!45976 a!2901) (index!43546 lt!611568)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150473 (= lt!611568 e!788422)))

(declare-fun c!129662 () Bool)

(assert (=> d!150473 (= c!129662 (and (is-Intermediate!10293 lt!611567) (undefined!11105 lt!611567)))))

(assert (=> d!150473 (= lt!611567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45976 a!2901) j!112) mask!2840) (select (arr!45976 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150473 (validMask!0 mask!2840)))

(assert (=> d!150473 (= (seekEntryOrOpen!0 (select (arr!45976 a!2901) j!112) a!2901 mask!2840) lt!611568)))

(declare-fun b!1392305 () Bool)

(assert (=> b!1392305 (= e!788423 (MissingZero!10293 (index!43545 lt!611567)))))

(declare-fun b!1392306 () Bool)

(declare-fun c!129661 () Bool)

(declare-fun lt!611566 () (_ BitVec 64))

(assert (=> b!1392306 (= c!129661 (= lt!611566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788421 () SeekEntryResult!10293)

(assert (=> b!1392306 (= e!788421 e!788423)))

(declare-fun b!1392307 () Bool)

(assert (=> b!1392307 (= e!788422 e!788421)))

(assert (=> b!1392307 (= lt!611566 (select (arr!45976 a!2901) (index!43545 lt!611567)))))

(declare-fun c!129660 () Bool)

(assert (=> b!1392307 (= c!129660 (= lt!611566 (select (arr!45976 a!2901) j!112)))))

(declare-fun b!1392308 () Bool)

(assert (=> b!1392308 (= e!788421 (Found!10293 (index!43545 lt!611567)))))

(assert (= (and d!150473 c!129662) b!1392304))

(assert (= (and d!150473 (not c!129662)) b!1392307))

(assert (= (and b!1392307 c!129660) b!1392308))

(assert (= (and b!1392307 (not c!129660)) b!1392306))

(assert (= (and b!1392306 c!129661) b!1392305))

(assert (= (and b!1392306 (not c!129661)) b!1392303))

(assert (=> b!1392303 m!1277879))

(declare-fun m!1278015 () Bool)

(assert (=> b!1392303 m!1278015))

(declare-fun m!1278017 () Bool)

(assert (=> d!150473 m!1278017))

(assert (=> d!150473 m!1277897))

(assert (=> d!150473 m!1277879))

(assert (=> d!150473 m!1277901))

(declare-fun m!1278019 () Bool)

(assert (=> d!150473 m!1278019))

(assert (=> d!150473 m!1277885))

(assert (=> d!150473 m!1277879))

(assert (=> d!150473 m!1277897))

(declare-fun m!1278021 () Bool)

(assert (=> d!150473 m!1278021))

(declare-fun m!1278023 () Bool)

(assert (=> b!1392307 m!1278023))

(assert (=> b!1392081 d!150473))

(push 1)

(assert (not b!1392217))

(assert (not b!1392149))

(assert (not bm!66768))

(assert (not b!1392107))

(assert (not d!150457))

(assert (not bm!66760))

(assert (not b!1392104))

(assert (not b!1392222))

(assert (not b!1392103))

(assert (not bm!66771))

(assert (not b!1392303))

(assert (not b!1392224))

(assert (not d!150453))

(assert (not b!1392147))

(assert (not d!150473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

