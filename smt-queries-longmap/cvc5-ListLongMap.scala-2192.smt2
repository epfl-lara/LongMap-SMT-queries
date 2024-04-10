; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36486 () Bool)

(assert start!36486)

(declare-fun lt!168763 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun b!364740 () Bool)

(declare-fun lt!168765 () (_ BitVec 32))

(declare-fun e!223272 () Bool)

(declare-datatypes ((array!20766 0))(
  ( (array!20767 (arr!9862 (Array (_ BitVec 32) (_ BitVec 64))) (size!10214 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20766)

(assert (=> b!364740 (= e!223272 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10214 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (= lt!168763 (bvadd #b00000000000000000000000000000001 lt!168765)))))))

(declare-fun lt!168768 () (_ BitVec 32))

(declare-fun lt!168762 () (_ BitVec 32))

(assert (=> b!364740 (= (bvadd lt!168768 lt!168762) lt!168763)))

(declare-fun lt!168761 () array!20766)

(declare-fun arrayCountValidKeys!0 (array!20766 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364740 (= lt!168763 (arrayCountValidKeys!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364740 (= lt!168768 (arrayCountValidKeys!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11358 0))(
  ( (Unit!11359) )
))
(declare-fun lt!168766 () Unit!11358)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11358)

(assert (=> b!364740 (= lt!168766 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168764 () (_ BitVec 32))

(declare-fun lt!168769 () (_ BitVec 32))

(assert (=> b!364740 (= (bvadd lt!168764 lt!168769) lt!168765)))

(assert (=> b!364740 (= lt!168765 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364740 (= lt!168764 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168767 () Unit!11358)

(assert (=> b!364740 (= lt!168767 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364741 () Bool)

(declare-fun res!203904 () Bool)

(declare-fun e!223271 () Bool)

(assert (=> b!364741 (=> (not res!203904) (not e!223271))))

(assert (=> b!364741 (= res!203904 (and (bvslt (size!10214 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10214 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203903 () Bool)

(assert (=> start!36486 (=> (not res!203903) (not e!223271))))

(assert (=> start!36486 (= res!203903 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10214 a!4289))))))

(assert (=> start!36486 e!223271))

(assert (=> start!36486 true))

(declare-fun array_inv!7304 (array!20766) Bool)

(assert (=> start!36486 (array_inv!7304 a!4289)))

(declare-fun b!364742 () Bool)

(declare-fun res!203905 () Bool)

(assert (=> b!364742 (=> (not res!203905) (not e!223271))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364742 (= res!203905 (validKeyInArray!0 k!2974))))

(declare-fun b!364743 () Bool)

(declare-fun res!203902 () Bool)

(assert (=> b!364743 (=> (not res!203902) (not e!223271))))

(assert (=> b!364743 (= res!203902 (not (validKeyInArray!0 (select (arr!9862 a!4289) i!1472))))))

(declare-fun b!364744 () Bool)

(assert (=> b!364744 (= e!223271 e!223272)))

(declare-fun res!203901 () Bool)

(assert (=> b!364744 (=> (not res!203901) (not e!223272))))

(assert (=> b!364744 (= res!203901 (and (= lt!168762 (bvadd #b00000000000000000000000000000001 lt!168769)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364744 (= lt!168762 (arrayCountValidKeys!0 lt!168761 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364744 (= lt!168769 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364744 (= lt!168761 (array!20767 (store (arr!9862 a!4289) i!1472 k!2974) (size!10214 a!4289)))))

(assert (= (and start!36486 res!203903) b!364743))

(assert (= (and b!364743 res!203902) b!364742))

(assert (= (and b!364742 res!203905) b!364741))

(assert (= (and b!364741 res!203904) b!364744))

(assert (= (and b!364744 res!203901) b!364740))

(declare-fun m!362423 () Bool)

(assert (=> start!36486 m!362423))

(declare-fun m!362425 () Bool)

(assert (=> b!364744 m!362425))

(declare-fun m!362427 () Bool)

(assert (=> b!364744 m!362427))

(declare-fun m!362429 () Bool)

(assert (=> b!364744 m!362429))

(declare-fun m!362431 () Bool)

(assert (=> b!364740 m!362431))

(declare-fun m!362433 () Bool)

(assert (=> b!364740 m!362433))

(declare-fun m!362435 () Bool)

(assert (=> b!364740 m!362435))

(declare-fun m!362437 () Bool)

(assert (=> b!364740 m!362437))

(declare-fun m!362439 () Bool)

(assert (=> b!364740 m!362439))

(declare-fun m!362441 () Bool)

(assert (=> b!364740 m!362441))

(declare-fun m!362443 () Bool)

(assert (=> b!364742 m!362443))

(declare-fun m!362445 () Bool)

(assert (=> b!364743 m!362445))

(assert (=> b!364743 m!362445))

(declare-fun m!362447 () Bool)

(assert (=> b!364743 m!362447))

(push 1)

(assert (not b!364740))

(assert (not b!364743))

(assert (not b!364744))

(assert (not b!364742))

(assert (not start!36486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72241 () Bool)

(assert (=> d!72241 (= (validKeyInArray!0 (select (arr!9862 a!4289) i!1472)) (and (not (= (select (arr!9862 a!4289) i!1472) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9862 a!4289) i!1472) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364743 d!72241))

(declare-fun b!364815 () Bool)

(declare-fun e!223313 () (_ BitVec 32))

(declare-fun call!27256 () (_ BitVec 32))

(assert (=> b!364815 (= e!223313 (bvadd #b00000000000000000000000000000001 call!27256))))

(declare-fun b!364816 () Bool)

(declare-fun e!223312 () (_ BitVec 32))

(assert (=> b!364816 (= e!223312 #b00000000000000000000000000000000)))

(declare-fun d!72243 () Bool)

(declare-fun lt!168838 () (_ BitVec 32))

(assert (=> d!72243 (and (bvsge lt!168838 #b00000000000000000000000000000000) (bvsle lt!168838 (bvsub (size!10214 lt!168761) from!3650)))))

(assert (=> d!72243 (= lt!168838 e!223312)))

(declare-fun c!53858 () Bool)

(assert (=> d!72243 (= c!53858 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72243 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10214 lt!168761)))))

(assert (=> d!72243 (= (arrayCountValidKeys!0 lt!168761 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168838)))

(declare-fun b!364817 () Bool)

(assert (=> b!364817 (= e!223312 e!223313)))

(declare-fun c!53859 () Bool)

(assert (=> b!364817 (= c!53859 (validKeyInArray!0 (select (arr!9862 lt!168761) from!3650)))))

(declare-fun b!364818 () Bool)

(assert (=> b!364818 (= e!223313 call!27256)))

(declare-fun bm!27253 () Bool)

(assert (=> bm!27253 (= call!27256 (arrayCountValidKeys!0 lt!168761 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72243 c!53858) b!364816))

(assert (= (and d!72243 (not c!53858)) b!364817))

(assert (= (and b!364817 c!53859) b!364815))

(assert (= (and b!364817 (not c!53859)) b!364818))

(assert (= (or b!364815 b!364818) bm!27253))

(declare-fun m!362533 () Bool)

(assert (=> b!364817 m!362533))

(assert (=> b!364817 m!362533))

(declare-fun m!362535 () Bool)

(assert (=> b!364817 m!362535))

(declare-fun m!362537 () Bool)

(assert (=> bm!27253 m!362537))

(assert (=> b!364744 d!72243))

(declare-fun b!364819 () Bool)

(declare-fun e!223315 () (_ BitVec 32))

(declare-fun call!27257 () (_ BitVec 32))

(assert (=> b!364819 (= e!223315 (bvadd #b00000000000000000000000000000001 call!27257))))

(declare-fun b!364820 () Bool)

(declare-fun e!223314 () (_ BitVec 32))

(assert (=> b!364820 (= e!223314 #b00000000000000000000000000000000)))

(declare-fun d!72249 () Bool)

(declare-fun lt!168839 () (_ BitVec 32))

(assert (=> d!72249 (and (bvsge lt!168839 #b00000000000000000000000000000000) (bvsle lt!168839 (bvsub (size!10214 a!4289) from!3650)))))

(assert (=> d!72249 (= lt!168839 e!223314)))

(declare-fun c!53860 () Bool)

(assert (=> d!72249 (= c!53860 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72249 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10214 a!4289)))))

(assert (=> d!72249 (= (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168839)))

(declare-fun b!364821 () Bool)

(assert (=> b!364821 (= e!223314 e!223315)))

(declare-fun c!53861 () Bool)

(assert (=> b!364821 (= c!53861 (validKeyInArray!0 (select (arr!9862 a!4289) from!3650)))))

(declare-fun b!364822 () Bool)

(assert (=> b!364822 (= e!223315 call!27257)))

(declare-fun bm!27254 () Bool)

(assert (=> bm!27254 (= call!27257 (arrayCountValidKeys!0 a!4289 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72249 c!53860) b!364820))

(assert (= (and d!72249 (not c!53860)) b!364821))

(assert (= (and b!364821 c!53861) b!364819))

(assert (= (and b!364821 (not c!53861)) b!364822))

(assert (= (or b!364819 b!364822) bm!27254))

(declare-fun m!362539 () Bool)

(assert (=> b!364821 m!362539))

(assert (=> b!364821 m!362539))

(declare-fun m!362541 () Bool)

(assert (=> b!364821 m!362541))

(declare-fun m!362543 () Bool)

(assert (=> bm!27254 m!362543))

(assert (=> b!364744 d!72249))

(declare-fun b!364823 () Bool)

(declare-fun e!223317 () (_ BitVec 32))

(declare-fun call!27258 () (_ BitVec 32))

(assert (=> b!364823 (= e!223317 (bvadd #b00000000000000000000000000000001 call!27258))))

(declare-fun b!364824 () Bool)

(declare-fun e!223316 () (_ BitVec 32))

(assert (=> b!364824 (= e!223316 #b00000000000000000000000000000000)))

(declare-fun d!72251 () Bool)

(declare-fun lt!168840 () (_ BitVec 32))

(assert (=> d!72251 (and (bvsge lt!168840 #b00000000000000000000000000000000) (bvsle lt!168840 (bvsub (size!10214 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72251 (= lt!168840 e!223316)))

(declare-fun c!53862 () Bool)

(assert (=> d!72251 (= c!53862 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72251 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10214 a!4289)))))

(assert (=> d!72251 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168840)))

(declare-fun b!364825 () Bool)

(assert (=> b!364825 (= e!223316 e!223317)))

(declare-fun c!53863 () Bool)

(assert (=> b!364825 (= c!53863 (validKeyInArray!0 (select (arr!9862 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364826 () Bool)

(assert (=> b!364826 (= e!223317 call!27258)))

(declare-fun bm!27255 () Bool)

(assert (=> bm!27255 (= call!27258 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(assert (= (and d!72251 c!53862) b!364824))

(assert (= (and d!72251 (not c!53862)) b!364825))

(assert (= (and b!364825 c!53863) b!364823))

(assert (= (and b!364825 (not c!53863)) b!364826))

(assert (= (or b!364823 b!364826) bm!27255))

(declare-fun m!362545 () Bool)

(assert (=> b!364825 m!362545))

(assert (=> b!364825 m!362545))

(declare-fun m!362547 () Bool)

(assert (=> b!364825 m!362547))

(declare-fun m!362549 () Bool)

(assert (=> bm!27255 m!362549))

(assert (=> b!364740 d!72251))

(declare-fun b!364827 () Bool)

(declare-fun e!223319 () (_ BitVec 32))

(declare-fun call!27259 () (_ BitVec 32))

(assert (=> b!364827 (= e!223319 (bvadd #b00000000000000000000000000000001 call!27259))))

(declare-fun b!364828 () Bool)

(declare-fun e!223318 () (_ BitVec 32))

(assert (=> b!364828 (= e!223318 #b00000000000000000000000000000000)))

(declare-fun d!72253 () Bool)

(declare-fun lt!168841 () (_ BitVec 32))

(assert (=> d!72253 (and (bvsge lt!168841 #b00000000000000000000000000000000) (bvsle lt!168841 (bvsub (size!10214 lt!168761) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72253 (= lt!168841 e!223318)))

(declare-fun c!53864 () Bool)

(assert (=> d!72253 (= c!53864 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72253 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10214 lt!168761)))))

(assert (=> d!72253 (= (arrayCountValidKeys!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168841)))

(declare-fun b!364829 () Bool)

(assert (=> b!364829 (= e!223318 e!223319)))

(declare-fun c!53865 () Bool)

(assert (=> b!364829 (= c!53865 (validKeyInArray!0 (select (arr!9862 lt!168761) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364830 () Bool)

(assert (=> b!364830 (= e!223319 call!27259)))

(declare-fun bm!27256 () Bool)

(assert (=> bm!27256 (= call!27259 (arrayCountValidKeys!0 lt!168761 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72253 c!53864) b!364828))

(assert (= (and d!72253 (not c!53864)) b!364829))

(assert (= (and b!364829 c!53865) b!364827))

(assert (= (and b!364829 (not c!53865)) b!364830))

(assert (= (or b!364827 b!364830) bm!27256))

(declare-fun m!362551 () Bool)

(assert (=> b!364829 m!362551))

(assert (=> b!364829 m!362551))

(declare-fun m!362553 () Bool)

(assert (=> b!364829 m!362553))

(declare-fun m!362555 () Bool)

(assert (=> bm!27256 m!362555))

(assert (=> b!364740 d!72253))

(declare-fun b!364831 () Bool)

(declare-fun e!223321 () (_ BitVec 32))

(declare-fun call!27260 () (_ BitVec 32))

(assert (=> b!364831 (= e!223321 (bvadd #b00000000000000000000000000000001 call!27260))))

(declare-fun b!364832 () Bool)

(declare-fun e!223320 () (_ BitVec 32))

(assert (=> b!364832 (= e!223320 #b00000000000000000000000000000000)))

(declare-fun d!72255 () Bool)

(declare-fun lt!168842 () (_ BitVec 32))

(assert (=> d!72255 (and (bvsge lt!168842 #b00000000000000000000000000000000) (bvsle lt!168842 (bvsub (size!10214 lt!168761) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72255 (= lt!168842 e!223320)))

(declare-fun c!53866 () Bool)

(assert (=> d!72255 (= c!53866 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72255 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10214 lt!168761)))))

(assert (=> d!72255 (= (arrayCountValidKeys!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168842)))

(declare-fun b!364833 () Bool)

(assert (=> b!364833 (= e!223320 e!223321)))

(declare-fun c!53867 () Bool)

(assert (=> b!364833 (= c!53867 (validKeyInArray!0 (select (arr!9862 lt!168761) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364834 () Bool)

(assert (=> b!364834 (= e!223321 call!27260)))

(declare-fun bm!27257 () Bool)

(assert (=> bm!27257 (= call!27260 (arrayCountValidKeys!0 lt!168761 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(assert (= (and d!72255 c!53866) b!364832))

(assert (= (and d!72255 (not c!53866)) b!364833))

(assert (= (and b!364833 c!53867) b!364831))

(assert (= (and b!364833 (not c!53867)) b!364834))

(assert (= (or b!364831 b!364834) bm!27257))

(assert (=> b!364833 m!362551))

(assert (=> b!364833 m!362551))

(assert (=> b!364833 m!362553))

(declare-fun m!362557 () Bool)

(assert (=> bm!27257 m!362557))

(assert (=> b!364740 d!72255))

(declare-fun d!72257 () Bool)

(assert (=> d!72257 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168845 () Unit!11358)

(declare-fun choose!61 (array!20766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11358)

(assert (=> d!72257 (= lt!168845 (choose!61 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72257 (and (bvslt (size!10214 a!4289) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10214 a!4289)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72257 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168845)))

(declare-fun bs!12522 () Bool)

(assert (= bs!12522 d!72257))

(assert (=> bs!12522 m!362441))

(assert (=> bs!12522 m!362427))

(assert (=> bs!12522 m!362439))

(declare-fun m!362559 () Bool)

(assert (=> bs!12522 m!362559))

(assert (=> b!364740 d!72257))

(declare-fun d!72259 () Bool)

(assert (=> d!72259 (= (bvadd (arrayCountValidKeys!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 lt!168761 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168846 () Unit!11358)

(assert (=> d!72259 (= lt!168846 (choose!61 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72259 (and (bvslt (size!10214 lt!168761) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10214 lt!168761)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72259 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168761 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168846)))

(declare-fun bs!12523 () Bool)

(assert (= bs!12523 d!72259))

(assert (=> bs!12523 m!362435))

(assert (=> bs!12523 m!362425))

(assert (=> bs!12523 m!362431))

(declare-fun m!362561 () Bool)

(assert (=> bs!12523 m!362561))

(assert (=> b!364740 d!72259))

(declare-fun b!364835 () Bool)

(declare-fun e!223323 () (_ BitVec 32))

(declare-fun call!27261 () (_ BitVec 32))

(assert (=> b!364835 (= e!223323 (bvadd #b00000000000000000000000000000001 call!27261))))

(declare-fun b!364836 () Bool)

(declare-fun e!223322 () (_ BitVec 32))

(assert (=> b!364836 (= e!223322 #b00000000000000000000000000000000)))

(declare-fun d!72261 () Bool)

(declare-fun lt!168847 () (_ BitVec 32))

(assert (=> d!72261 (and (bvsge lt!168847 #b00000000000000000000000000000000) (bvsle lt!168847 (bvsub (size!10214 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72261 (= lt!168847 e!223322)))

(declare-fun c!53868 () Bool)

(assert (=> d!72261 (= c!53868 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72261 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10214 a!4289)))))

(assert (=> d!72261 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168847)))

(declare-fun b!364837 () Bool)

(assert (=> b!364837 (= e!223322 e!223323)))

(declare-fun c!53869 () Bool)

(assert (=> b!364837 (= c!53869 (validKeyInArray!0 (select (arr!9862 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364838 () Bool)

(assert (=> b!364838 (= e!223323 call!27261)))

(declare-fun bm!27258 () Bool)

(assert (=> bm!27258 (= call!27261 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72261 c!53868) b!364836))

(assert (= (and d!72261 (not c!53868)) b!364837))

(assert (= (and b!364837 c!53869) b!364835))

(assert (= (and b!364837 (not c!53869)) b!364838))

(assert (= (or b!364835 b!364838) bm!27258))

(assert (=> b!364837 m!362545))

(assert (=> b!364837 m!362545))

(assert (=> b!364837 m!362547))

(declare-fun m!362563 () Bool)

(assert (=> bm!27258 m!362563))

(assert (=> b!364740 d!72261))

(declare-fun d!72263 () Bool)

(assert (=> d!72263 (= (validKeyInArray!0 k!2974) (and (not (= k!2974 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2974 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364742 d!72263))

(declare-fun d!72265 () Bool)

(assert (=> d!72265 (= (array_inv!7304 a!4289) (bvsge (size!10214 a!4289) #b00000000000000000000000000000000))))

(assert (=> start!36486 d!72265))

(push 1)

(assert (not b!364821))

(assert (not b!364837))

(assert (not bm!27253))

(assert (not d!72257))

(assert (not bm!27254))

(assert (not bm!27258))

(assert (not bm!27255))

(assert (not b!364829))

(assert (not bm!27257))

(assert (not b!364833))

(assert (not b!364817))

(assert (not d!72259))

(assert (not b!364825))

(assert (not bm!27256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

