; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36476 () Bool)

(assert start!36476)

(declare-fun b!364721 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168835 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun e!223257 () Bool)

(declare-fun lt!168837 () (_ BitVec 32))

(declare-datatypes ((array!20751 0))(
  ( (array!20752 (arr!9854 (Array (_ BitVec 32) (_ BitVec 64))) (size!10206 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20751)

(assert (=> b!364721 (= e!223257 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10206 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (= lt!168837 (bvadd #b00000000000000000000000000000001 lt!168835)))))))

(declare-fun lt!168839 () (_ BitVec 32))

(declare-fun lt!168840 () (_ BitVec 32))

(assert (=> b!364721 (= (bvadd lt!168839 lt!168840) lt!168837)))

(declare-fun lt!168836 () array!20751)

(declare-fun arrayCountValidKeys!0 (array!20751 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364721 (= lt!168837 (arrayCountValidKeys!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364721 (= lt!168839 (arrayCountValidKeys!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11351 0))(
  ( (Unit!11352) )
))
(declare-fun lt!168842 () Unit!11351)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11351)

(assert (=> b!364721 (= lt!168842 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168838 () (_ BitVec 32))

(declare-fun lt!168841 () (_ BitVec 32))

(assert (=> b!364721 (= (bvadd lt!168838 lt!168841) lt!168835)))

(assert (=> b!364721 (= lt!168835 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364721 (= lt!168838 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168834 () Unit!11351)

(assert (=> b!364721 (= lt!168834 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364722 () Bool)

(declare-fun e!223258 () Bool)

(assert (=> b!364722 (= e!223258 e!223257)))

(declare-fun res!203929 () Bool)

(assert (=> b!364722 (=> (not res!203929) (not e!223257))))

(assert (=> b!364722 (= res!203929 (and (= lt!168840 (bvadd #b00000000000000000000000000000001 lt!168841)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364722 (= lt!168840 (arrayCountValidKeys!0 lt!168836 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364722 (= lt!168841 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364722 (= lt!168836 (array!20752 (store (arr!9854 a!4289) i!1472 k!2974) (size!10206 a!4289)))))

(declare-fun res!203930 () Bool)

(assert (=> start!36476 (=> (not res!203930) (not e!223258))))

(assert (=> start!36476 (= res!203930 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10206 a!4289))))))

(assert (=> start!36476 e!223258))

(assert (=> start!36476 true))

(declare-fun array_inv!7326 (array!20751) Bool)

(assert (=> start!36476 (array_inv!7326 a!4289)))

(declare-fun b!364723 () Bool)

(declare-fun res!203932 () Bool)

(assert (=> b!364723 (=> (not res!203932) (not e!223258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364723 (= res!203932 (not (validKeyInArray!0 (select (arr!9854 a!4289) i!1472))))))

(declare-fun b!364724 () Bool)

(declare-fun res!203928 () Bool)

(assert (=> b!364724 (=> (not res!203928) (not e!223258))))

(assert (=> b!364724 (= res!203928 (and (bvslt (size!10206 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10206 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364725 () Bool)

(declare-fun res!203931 () Bool)

(assert (=> b!364725 (=> (not res!203931) (not e!223258))))

(assert (=> b!364725 (= res!203931 (validKeyInArray!0 k!2974))))

(assert (= (and start!36476 res!203930) b!364723))

(assert (= (and b!364723 res!203932) b!364725))

(assert (= (and b!364725 res!203931) b!364724))

(assert (= (and b!364724 res!203928) b!364722))

(assert (= (and b!364722 res!203929) b!364721))

(declare-fun m!362705 () Bool)

(assert (=> start!36476 m!362705))

(declare-fun m!362707 () Bool)

(assert (=> b!364725 m!362707))

(declare-fun m!362709 () Bool)

(assert (=> b!364721 m!362709))

(declare-fun m!362711 () Bool)

(assert (=> b!364721 m!362711))

(declare-fun m!362713 () Bool)

(assert (=> b!364721 m!362713))

(declare-fun m!362715 () Bool)

(assert (=> b!364721 m!362715))

(declare-fun m!362717 () Bool)

(assert (=> b!364721 m!362717))

(declare-fun m!362719 () Bool)

(assert (=> b!364721 m!362719))

(declare-fun m!362721 () Bool)

(assert (=> b!364722 m!362721))

(declare-fun m!362723 () Bool)

(assert (=> b!364722 m!362723))

(declare-fun m!362725 () Bool)

(assert (=> b!364722 m!362725))

(declare-fun m!362727 () Bool)

(assert (=> b!364723 m!362727))

(assert (=> b!364723 m!362727))

(declare-fun m!362729 () Bool)

(assert (=> b!364723 m!362729))

(push 1)

(assert (not start!36476))

(assert (not b!364725))

(assert (not b!364721))

(assert (not b!364722))

(assert (not b!364723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72275 () Bool)

(assert (=> d!72275 (= (validKeyInArray!0 k!2974) (and (not (= k!2974 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2974 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364725 d!72275))

(declare-fun d!72277 () Bool)

(assert (=> d!72277 (= (validKeyInArray!0 (select (arr!9854 a!4289) i!1472)) (and (not (= (select (arr!9854 a!4289) i!1472) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9854 a!4289) i!1472) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364723 d!72277))

(declare-fun d!72279 () Bool)

(assert (=> d!72279 (= (array_inv!7326 a!4289) (bvsge (size!10206 a!4289) #b00000000000000000000000000000000))))

(assert (=> start!36476 d!72279))

(declare-fun d!72281 () Bool)

(declare-fun lt!168857 () (_ BitVec 32))

(assert (=> d!72281 (and (bvsge lt!168857 #b00000000000000000000000000000000) (bvsle lt!168857 (bvsub (size!10206 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223280 () (_ BitVec 32))

(assert (=> d!72281 (= lt!168857 e!223280)))

(declare-fun c!53835 () Bool)

(assert (=> d!72281 (= c!53835 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72281 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10206 a!4289)))))

(assert (=> d!72281 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168857)))

(declare-fun b!364766 () Bool)

(declare-fun e!223281 () (_ BitVec 32))

(declare-fun call!27243 () (_ BitVec 32))

(assert (=> b!364766 (= e!223281 call!27243)))

(declare-fun bm!27240 () Bool)

(assert (=> bm!27240 (= call!27243 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(declare-fun b!364767 () Bool)

(assert (=> b!364767 (= e!223280 #b00000000000000000000000000000000)))

(declare-fun b!364768 () Bool)

(assert (=> b!364768 (= e!223281 (bvadd #b00000000000000000000000000000001 call!27243))))

(declare-fun b!364769 () Bool)

(assert (=> b!364769 (= e!223280 e!223281)))

(declare-fun c!53836 () Bool)

(assert (=> b!364769 (= c!53836 (validKeyInArray!0 (select (arr!9854 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (= (and d!72281 c!53835) b!364767))

(assert (= (and d!72281 (not c!53835)) b!364769))

(assert (= (and b!364769 c!53836) b!364768))

(assert (= (and b!364769 (not c!53836)) b!364766))

(assert (= (or b!364768 b!364766) bm!27240))

(declare-fun m!362763 () Bool)

(assert (=> bm!27240 m!362763))

(declare-fun m!362765 () Bool)

(assert (=> b!364769 m!362765))

(assert (=> b!364769 m!362765))

(declare-fun m!362767 () Bool)

(assert (=> b!364769 m!362767))

(assert (=> b!364721 d!72281))

(declare-fun d!72283 () Bool)

(declare-fun lt!168858 () (_ BitVec 32))

(assert (=> d!72283 (and (bvsge lt!168858 #b00000000000000000000000000000000) (bvsle lt!168858 (bvsub (size!10206 lt!168836) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223282 () (_ BitVec 32))

(assert (=> d!72283 (= lt!168858 e!223282)))

(declare-fun c!53837 () Bool)

(assert (=> d!72283 (= c!53837 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72283 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10206 lt!168836)))))

(assert (=> d!72283 (= (arrayCountValidKeys!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168858)))

(declare-fun b!364770 () Bool)

(declare-fun e!223283 () (_ BitVec 32))

(declare-fun call!27244 () (_ BitVec 32))

(assert (=> b!364770 (= e!223283 call!27244)))

(declare-fun bm!27241 () Bool)

(assert (=> bm!27241 (= call!27244 (arrayCountValidKeys!0 lt!168836 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364771 () Bool)

(assert (=> b!364771 (= e!223282 #b00000000000000000000000000000000)))

(declare-fun b!364772 () Bool)

(assert (=> b!364772 (= e!223283 (bvadd #b00000000000000000000000000000001 call!27244))))

(declare-fun b!364773 () Bool)

(assert (=> b!364773 (= e!223282 e!223283)))

(declare-fun c!53838 () Bool)

(assert (=> b!364773 (= c!53838 (validKeyInArray!0 (select (arr!9854 lt!168836) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (= (and d!72283 c!53837) b!364771))

(assert (= (and d!72283 (not c!53837)) b!364773))

(assert (= (and b!364773 c!53838) b!364772))

(assert (= (and b!364773 (not c!53838)) b!364770))

(assert (= (or b!364772 b!364770) bm!27241))

(declare-fun m!362769 () Bool)

(assert (=> bm!27241 m!362769))

(declare-fun m!362771 () Bool)

(assert (=> b!364773 m!362771))

(assert (=> b!364773 m!362771))

(declare-fun m!362773 () Bool)

(assert (=> b!364773 m!362773))

(assert (=> b!364721 d!72283))

(declare-fun d!72285 () Bool)

(declare-fun lt!168859 () (_ BitVec 32))

(assert (=> d!72285 (and (bvsge lt!168859 #b00000000000000000000000000000000) (bvsle lt!168859 (bvsub (size!10206 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223284 () (_ BitVec 32))

(assert (=> d!72285 (= lt!168859 e!223284)))

(declare-fun c!53839 () Bool)

(assert (=> d!72285 (= c!53839 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72285 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10206 a!4289)))))

(assert (=> d!72285 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168859)))

(declare-fun b!364774 () Bool)

(declare-fun e!223285 () (_ BitVec 32))

(declare-fun call!27245 () (_ BitVec 32))

(assert (=> b!364774 (= e!223285 call!27245)))

(declare-fun bm!27242 () Bool)

(assert (=> bm!27242 (= call!27245 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364775 () Bool)

(assert (=> b!364775 (= e!223284 #b00000000000000000000000000000000)))

(declare-fun b!364776 () Bool)

(assert (=> b!364776 (= e!223285 (bvadd #b00000000000000000000000000000001 call!27245))))

(declare-fun b!364777 () Bool)

(assert (=> b!364777 (= e!223284 e!223285)))

(declare-fun c!53840 () Bool)

(assert (=> b!364777 (= c!53840 (validKeyInArray!0 (select (arr!9854 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (= (and d!72285 c!53839) b!364775))

(assert (= (and d!72285 (not c!53839)) b!364777))

(assert (= (and b!364777 c!53840) b!364776))

(assert (= (and b!364777 (not c!53840)) b!364774))

(assert (= (or b!364776 b!364774) bm!27242))

(declare-fun m!362775 () Bool)

(assert (=> bm!27242 m!362775))

(assert (=> b!364777 m!362765))

(assert (=> b!364777 m!362765))

(assert (=> b!364777 m!362767))

(assert (=> b!364721 d!72285))

(declare-fun d!72289 () Bool)

(assert (=> d!72289 (= (bvadd (arrayCountValidKeys!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 lt!168836 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168864 () Unit!11351)

(declare-fun choose!61 (array!20751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11351)

(assert (=> d!72289 (= lt!168864 (choose!61 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72289 (and (bvslt (size!10206 lt!168836) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10206 lt!168836)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72289 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168864)))

(declare-fun bs!12538 () Bool)

(assert (= bs!12538 d!72289))

(assert (=> bs!12538 m!362709))

(assert (=> bs!12538 m!362721))

(assert (=> bs!12538 m!362711))

(declare-fun m!362777 () Bool)

(assert (=> bs!12538 m!362777))

(assert (=> b!364721 d!72289))

(declare-fun d!72291 () Bool)

(declare-fun lt!168865 () (_ BitVec 32))

(assert (=> d!72291 (and (bvsge lt!168865 #b00000000000000000000000000000000) (bvsle lt!168865 (bvsub (size!10206 lt!168836) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223290 () (_ BitVec 32))

(assert (=> d!72291 (= lt!168865 e!223290)))

(declare-fun c!53845 () Bool)

(assert (=> d!72291 (= c!53845 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72291 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10206 lt!168836)))))

(assert (=> d!72291 (= (arrayCountValidKeys!0 lt!168836 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168865)))

(declare-fun b!364786 () Bool)

(declare-fun e!223291 () (_ BitVec 32))

(declare-fun call!27248 () (_ BitVec 32))

(assert (=> b!364786 (= e!223291 call!27248)))

(declare-fun bm!27245 () Bool)

(assert (=> bm!27245 (= call!27248 (arrayCountValidKeys!0 lt!168836 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(declare-fun b!364787 () Bool)

(assert (=> b!364787 (= e!223290 #b00000000000000000000000000000000)))

(declare-fun b!364788 () Bool)

(assert (=> b!364788 (= e!223291 (bvadd #b00000000000000000000000000000001 call!27248))))

(declare-fun b!364789 () Bool)

(assert (=> b!364789 (= e!223290 e!223291)))

(declare-fun c!53846 () Bool)

(assert (=> b!364789 (= c!53846 (validKeyInArray!0 (select (arr!9854 lt!168836) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (= (and d!72291 c!53845) b!364787))

(assert (= (and d!72291 (not c!53845)) b!364789))

(assert (= (and b!364789 c!53846) b!364788))

(assert (= (and b!364789 (not c!53846)) b!364786))

(assert (= (or b!364788 b!364786) bm!27245))

(declare-fun m!362779 () Bool)

(assert (=> bm!27245 m!362779))

(assert (=> b!364789 m!362771))

(assert (=> b!364789 m!362771))

(assert (=> b!364789 m!362773))

(assert (=> b!364721 d!72291))

(declare-fun d!72293 () Bool)

(assert (=> d!72293 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168866 () Unit!11351)

(assert (=> d!72293 (= lt!168866 (choose!61 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72293 (and (bvslt (size!10206 a!4289) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10206 a!4289)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72293 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168866)))

(declare-fun bs!12539 () Bool)

(assert (= bs!12539 d!72293))

(assert (=> bs!12539 m!362719))

(assert (=> bs!12539 m!362723))

(assert (=> bs!12539 m!362717))

(declare-fun m!362781 () Bool)

(assert (=> bs!12539 m!362781))

(assert (=> b!364721 d!72293))

(declare-fun d!72295 () Bool)

(declare-fun lt!168867 () (_ BitVec 32))

(assert (=> d!72295 (and (bvsge lt!168867 #b00000000000000000000000000000000) (bvsle lt!168867 (bvsub (size!10206 lt!168836) from!3650)))))

(declare-fun e!223292 () (_ BitVec 32))

(assert (=> d!72295 (= lt!168867 e!223292)))

(declare-fun c!53847 () Bool)

(assert (=> d!72295 (= c!53847 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72295 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10206 lt!168836)))))

(assert (=> d!72295 (= (arrayCountValidKeys!0 lt!168836 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168867)))

(declare-fun b!364790 () Bool)

(declare-fun e!223293 () (_ BitVec 32))

(declare-fun call!27249 () (_ BitVec 32))

(assert (=> b!364790 (= e!223293 call!27249)))

(declare-fun bm!27246 () Bool)

(assert (=> bm!27246 (= call!27249 (arrayCountValidKeys!0 lt!168836 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364791 () Bool)

(assert (=> b!364791 (= e!223292 #b00000000000000000000000000000000)))

(declare-fun b!364792 () Bool)

(assert (=> b!364792 (= e!223293 (bvadd #b00000000000000000000000000000001 call!27249))))

(declare-fun b!364793 () Bool)

(assert (=> b!364793 (= e!223292 e!223293)))

(declare-fun c!53848 () Bool)

(assert (=> b!364793 (= c!53848 (validKeyInArray!0 (select (arr!9854 lt!168836) from!3650)))))

(assert (= (and d!72295 c!53847) b!364791))

(assert (= (and d!72295 (not c!53847)) b!364793))

(assert (= (and b!364793 c!53848) b!364792))

(assert (= (and b!364793 (not c!53848)) b!364790))

(assert (= (or b!364792 b!364790) bm!27246))

(declare-fun m!362783 () Bool)

(assert (=> bm!27246 m!362783))

(declare-fun m!362785 () Bool)

(assert (=> b!364793 m!362785))

(assert (=> b!364793 m!362785))

(declare-fun m!362787 () Bool)

(assert (=> b!364793 m!362787))

(assert (=> b!364722 d!72295))

(declare-fun d!72297 () Bool)

(declare-fun lt!168869 () (_ BitVec 32))

(assert (=> d!72297 (and (bvsge lt!168869 #b00000000000000000000000000000000) (bvsle lt!168869 (bvsub (size!10206 a!4289) from!3650)))))

(declare-fun e!223296 () (_ BitVec 32))

(assert (=> d!72297 (= lt!168869 e!223296)))

(declare-fun c!53851 () Bool)

(assert (=> d!72297 (= c!53851 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72297 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10206 a!4289)))))

(assert (=> d!72297 (= (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168869)))

(declare-fun b!364798 () Bool)

(declare-fun e!223297 () (_ BitVec 32))

(declare-fun call!27251 () (_ BitVec 32))

(assert (=> b!364798 (= e!223297 call!27251)))

(declare-fun bm!27248 () Bool)

(assert (=> bm!27248 (= call!27251 (arrayCountValidKeys!0 a!4289 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364799 () Bool)

(assert (=> b!364799 (= e!223296 #b00000000000000000000000000000000)))

(declare-fun b!364800 () Bool)

(assert (=> b!364800 (= e!223297 (bvadd #b00000000000000000000000000000001 call!27251))))

(declare-fun b!364801 () Bool)

(assert (=> b!364801 (= e!223296 e!223297)))

(declare-fun c!53852 () Bool)

(assert (=> b!364801 (= c!53852 (validKeyInArray!0 (select (arr!9854 a!4289) from!3650)))))

(assert (= (and d!72297 c!53851) b!364799))

(assert (= (and d!72297 (not c!53851)) b!364801))

(assert (= (and b!364801 c!53852) b!364800))

(assert (= (and b!364801 (not c!53852)) b!364798))

(assert (= (or b!364800 b!364798) bm!27248))

(declare-fun m!362795 () Bool)

(assert (=> bm!27248 m!362795))

(declare-fun m!362797 () Bool)

(assert (=> b!364801 m!362797))

(assert (=> b!364801 m!362797))

(declare-fun m!362799 () Bool)

(assert (=> b!364801 m!362799))

(assert (=> b!364722 d!72297))

(push 1)

(assert (not bm!27241))

(assert (not b!364789))

(assert (not bm!27242))

(assert (not d!72289))

(assert (not b!364793))

(assert (not b!364769))

(assert (not d!72293))

(assert (not bm!27240))

(assert (not bm!27246))

(assert (not bm!27245))

(assert (not b!364801))

(assert (not b!364777))

(assert (not bm!27248))

(assert (not b!364773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

