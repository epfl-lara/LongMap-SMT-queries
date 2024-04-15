; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36476 () Bool)

(assert start!36476)

(declare-fun res!203806 () Bool)

(declare-fun e!223116 () Bool)

(assert (=> start!36476 (=> (not res!203806) (not e!223116))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20752 0))(
  ( (array!20753 (arr!9855 (Array (_ BitVec 32) (_ BitVec 64))) (size!10208 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20752)

(assert (=> start!36476 (= res!203806 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10208 a!4289))))))

(assert (=> start!36476 e!223116))

(assert (=> start!36476 true))

(declare-fun array_inv!7304 (array!20752) Bool)

(assert (=> start!36476 (array_inv!7304 a!4289)))

(declare-fun b!364499 () Bool)

(declare-fun e!223115 () Bool)

(assert (=> b!364499 (= e!223116 e!223115)))

(declare-fun res!203805 () Bool)

(assert (=> b!364499 (=> (not res!203805) (not e!223115))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168586 () (_ BitVec 32))

(declare-fun lt!168587 () (_ BitVec 32))

(assert (=> b!364499 (= res!203805 (and (= lt!168586 (bvadd #b00000000000000000000000000000001 lt!168587)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168583 () array!20752)

(declare-fun arrayCountValidKeys!0 (array!20752 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364499 (= lt!168586 (arrayCountValidKeys!0 lt!168583 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364499 (= lt!168587 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364499 (= lt!168583 (array!20753 (store (arr!9855 a!4289) i!1472 k!2974) (size!10208 a!4289)))))

(declare-fun lt!168588 () (_ BitVec 32))

(declare-fun lt!168585 () (_ BitVec 32))

(declare-fun b!364500 () Bool)

(assert (=> b!364500 (= e!223115 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10208 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (= lt!168585 (bvadd #b00000000000000000000000000000001 lt!168588)))))))

(declare-fun lt!168584 () (_ BitVec 32))

(assert (=> b!364500 (= (bvadd lt!168584 lt!168586) lt!168585)))

(assert (=> b!364500 (= lt!168585 (arrayCountValidKeys!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364500 (= lt!168584 (arrayCountValidKeys!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11340 0))(
  ( (Unit!11341) )
))
(declare-fun lt!168589 () Unit!11340)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11340)

(assert (=> b!364500 (= lt!168589 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168582 () (_ BitVec 32))

(assert (=> b!364500 (= (bvadd lt!168582 lt!168587) lt!168588)))

(assert (=> b!364500 (= lt!168588 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364500 (= lt!168582 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168581 () Unit!11340)

(assert (=> b!364500 (= lt!168581 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364501 () Bool)

(declare-fun res!203802 () Bool)

(assert (=> b!364501 (=> (not res!203802) (not e!223116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364501 (= res!203802 (not (validKeyInArray!0 (select (arr!9855 a!4289) i!1472))))))

(declare-fun b!364502 () Bool)

(declare-fun res!203804 () Bool)

(assert (=> b!364502 (=> (not res!203804) (not e!223116))))

(assert (=> b!364502 (= res!203804 (and (bvslt (size!10208 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10208 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364503 () Bool)

(declare-fun res!203803 () Bool)

(assert (=> b!364503 (=> (not res!203803) (not e!223116))))

(assert (=> b!364503 (= res!203803 (validKeyInArray!0 k!2974))))

(assert (= (and start!36476 res!203806) b!364501))

(assert (= (and b!364501 res!203802) b!364503))

(assert (= (and b!364503 res!203803) b!364502))

(assert (= (and b!364502 res!203804) b!364499))

(assert (= (and b!364499 res!203805) b!364500))

(declare-fun m!361751 () Bool)

(assert (=> start!36476 m!361751))

(declare-fun m!361753 () Bool)

(assert (=> b!364499 m!361753))

(declare-fun m!361755 () Bool)

(assert (=> b!364499 m!361755))

(declare-fun m!361757 () Bool)

(assert (=> b!364499 m!361757))

(declare-fun m!361759 () Bool)

(assert (=> b!364501 m!361759))

(assert (=> b!364501 m!361759))

(declare-fun m!361761 () Bool)

(assert (=> b!364501 m!361761))

(declare-fun m!361763 () Bool)

(assert (=> b!364500 m!361763))

(declare-fun m!361765 () Bool)

(assert (=> b!364500 m!361765))

(declare-fun m!361767 () Bool)

(assert (=> b!364500 m!361767))

(declare-fun m!361769 () Bool)

(assert (=> b!364500 m!361769))

(declare-fun m!361771 () Bool)

(assert (=> b!364500 m!361771))

(declare-fun m!361773 () Bool)

(assert (=> b!364500 m!361773))

(declare-fun m!361775 () Bool)

(assert (=> b!364503 m!361775))

(push 1)

(assert (not b!364501))

(assert (not start!36476))

(assert (not b!364500))

(assert (not b!364499))

(assert (not b!364503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72041 () Bool)

(assert (=> d!72041 (= (validKeyInArray!0 (select (arr!9855 a!4289) i!1472)) (and (not (= (select (arr!9855 a!4289) i!1472) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9855 a!4289) i!1472) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364501 d!72041))

(declare-fun d!72043 () Bool)

(assert (=> d!72043 (= (array_inv!7304 a!4289) (bvsge (size!10208 a!4289) #b00000000000000000000000000000000))))

(assert (=> start!36476 d!72043))

(declare-fun b!364544 () Bool)

(declare-fun e!223138 () (_ BitVec 32))

(assert (=> b!364544 (= e!223138 #b00000000000000000000000000000000)))

(declare-fun d!72045 () Bool)

(declare-fun lt!168604 () (_ BitVec 32))

(assert (=> d!72045 (and (bvsge lt!168604 #b00000000000000000000000000000000) (bvsle lt!168604 (bvsub (size!10208 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72045 (= lt!168604 e!223138)))

(declare-fun c!53788 () Bool)

(assert (=> d!72045 (= c!53788 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72045 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10208 a!4289)))))

(assert (=> d!72045 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168604)))

(declare-fun b!364545 () Bool)

(declare-fun e!223139 () (_ BitVec 32))

(declare-fun call!27231 () (_ BitVec 32))

(assert (=> b!364545 (= e!223139 call!27231)))

(declare-fun b!364546 () Bool)

(assert (=> b!364546 (= e!223139 (bvadd #b00000000000000000000000000000001 call!27231))))

(declare-fun b!364547 () Bool)

(assert (=> b!364547 (= e!223138 e!223139)))

(declare-fun c!53787 () Bool)

(assert (=> b!364547 (= c!53787 (validKeyInArray!0 (select (arr!9855 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun bm!27228 () Bool)

(assert (=> bm!27228 (= call!27231 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(assert (= (and d!72045 c!53788) b!364544))

(assert (= (and d!72045 (not c!53788)) b!364547))

(assert (= (and b!364547 c!53787) b!364546))

(assert (= (and b!364547 (not c!53787)) b!364545))

(assert (= (or b!364546 b!364545) bm!27228))

(declare-fun m!361809 () Bool)

(assert (=> b!364547 m!361809))

(assert (=> b!364547 m!361809))

(declare-fun m!361811 () Bool)

(assert (=> b!364547 m!361811))

(declare-fun m!361813 () Bool)

(assert (=> bm!27228 m!361813))

(assert (=> b!364500 d!72045))

(declare-fun b!364548 () Bool)

(declare-fun e!223140 () (_ BitVec 32))

(assert (=> b!364548 (= e!223140 #b00000000000000000000000000000000)))

(declare-fun d!72047 () Bool)

(declare-fun lt!168605 () (_ BitVec 32))

(assert (=> d!72047 (and (bvsge lt!168605 #b00000000000000000000000000000000) (bvsle lt!168605 (bvsub (size!10208 lt!168583) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72047 (= lt!168605 e!223140)))

(declare-fun c!53790 () Bool)

(assert (=> d!72047 (= c!53790 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72047 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10208 lt!168583)))))

(assert (=> d!72047 (= (arrayCountValidKeys!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168605)))

(declare-fun b!364549 () Bool)

(declare-fun e!223141 () (_ BitVec 32))

(declare-fun call!27232 () (_ BitVec 32))

(assert (=> b!364549 (= e!223141 call!27232)))

(declare-fun b!364550 () Bool)

(assert (=> b!364550 (= e!223141 (bvadd #b00000000000000000000000000000001 call!27232))))

(declare-fun b!364551 () Bool)

(assert (=> b!364551 (= e!223140 e!223141)))

(declare-fun c!53789 () Bool)

(assert (=> b!364551 (= c!53789 (validKeyInArray!0 (select (arr!9855 lt!168583) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun bm!27229 () Bool)

(assert (=> bm!27229 (= call!27232 (arrayCountValidKeys!0 lt!168583 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(assert (= (and d!72047 c!53790) b!364548))

(assert (= (and d!72047 (not c!53790)) b!364551))

(assert (= (and b!364551 c!53789) b!364550))

(assert (= (and b!364551 (not c!53789)) b!364549))

(assert (= (or b!364550 b!364549) bm!27229))

(declare-fun m!361815 () Bool)

(assert (=> b!364551 m!361815))

(assert (=> b!364551 m!361815))

(declare-fun m!361817 () Bool)

(assert (=> b!364551 m!361817))

(declare-fun m!361819 () Bool)

(assert (=> bm!27229 m!361819))

(assert (=> b!364500 d!72047))

(declare-fun b!364552 () Bool)

(declare-fun e!223142 () (_ BitVec 32))

(assert (=> b!364552 (= e!223142 #b00000000000000000000000000000000)))

(declare-fun d!72051 () Bool)

(declare-fun lt!168606 () (_ BitVec 32))

(assert (=> d!72051 (and (bvsge lt!168606 #b00000000000000000000000000000000) (bvsle lt!168606 (bvsub (size!10208 lt!168583) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72051 (= lt!168606 e!223142)))

(declare-fun c!53792 () Bool)

(assert (=> d!72051 (= c!53792 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72051 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10208 lt!168583)))))

(assert (=> d!72051 (= (arrayCountValidKeys!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168606)))

(declare-fun b!364553 () Bool)

(declare-fun e!223143 () (_ BitVec 32))

(declare-fun call!27233 () (_ BitVec 32))

(assert (=> b!364553 (= e!223143 call!27233)))

(declare-fun b!364554 () Bool)

(assert (=> b!364554 (= e!223143 (bvadd #b00000000000000000000000000000001 call!27233))))

(declare-fun b!364555 () Bool)

(assert (=> b!364555 (= e!223142 e!223143)))

(declare-fun c!53791 () Bool)

(assert (=> b!364555 (= c!53791 (validKeyInArray!0 (select (arr!9855 lt!168583) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun bm!27230 () Bool)

(assert (=> bm!27230 (= call!27233 (arrayCountValidKeys!0 lt!168583 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72051 c!53792) b!364552))

(assert (= (and d!72051 (not c!53792)) b!364555))

(assert (= (and b!364555 c!53791) b!364554))

(assert (= (and b!364555 (not c!53791)) b!364553))

(assert (= (or b!364554 b!364553) bm!27230))

(assert (=> b!364555 m!361815))

(assert (=> b!364555 m!361815))

(assert (=> b!364555 m!361817))

(declare-fun m!361821 () Bool)

(assert (=> bm!27230 m!361821))

(assert (=> b!364500 d!72051))

(declare-fun b!364556 () Bool)

(declare-fun e!223144 () (_ BitVec 32))

(assert (=> b!364556 (= e!223144 #b00000000000000000000000000000000)))

(declare-fun d!72055 () Bool)

(declare-fun lt!168607 () (_ BitVec 32))

(assert (=> d!72055 (and (bvsge lt!168607 #b00000000000000000000000000000000) (bvsle lt!168607 (bvsub (size!10208 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72055 (= lt!168607 e!223144)))

(declare-fun c!53794 () Bool)

(assert (=> d!72055 (= c!53794 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72055 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10208 a!4289)))))

(assert (=> d!72055 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168607)))

(declare-fun b!364557 () Bool)

(declare-fun e!223145 () (_ BitVec 32))

(declare-fun call!27234 () (_ BitVec 32))

(assert (=> b!364557 (= e!223145 call!27234)))

(declare-fun b!364558 () Bool)

(assert (=> b!364558 (= e!223145 (bvadd #b00000000000000000000000000000001 call!27234))))

(declare-fun b!364559 () Bool)

(assert (=> b!364559 (= e!223144 e!223145)))

(declare-fun c!53793 () Bool)

(assert (=> b!364559 (= c!53793 (validKeyInArray!0 (select (arr!9855 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun bm!27231 () Bool)

(assert (=> bm!27231 (= call!27234 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72055 c!53794) b!364556))

(assert (= (and d!72055 (not c!53794)) b!364559))

(assert (= (and b!364559 c!53793) b!364558))

(assert (= (and b!364559 (not c!53793)) b!364557))

(assert (= (or b!364558 b!364557) bm!27231))

(assert (=> b!364559 m!361809))

(assert (=> b!364559 m!361809))

(assert (=> b!364559 m!361811))

(declare-fun m!361823 () Bool)

(assert (=> bm!27231 m!361823))

(assert (=> b!364500 d!72055))

(declare-fun d!72057 () Bool)

(assert (=> d!72057 (= (bvadd (arrayCountValidKeys!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 lt!168583 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168612 () Unit!11340)

(declare-fun choose!61 (array!20752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11340)

(assert (=> d!72057 (= lt!168612 (choose!61 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72057 (and (bvslt (size!10208 lt!168583) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10208 lt!168583)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72057 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168583 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168612)))

(declare-fun bs!12492 () Bool)

(assert (= bs!12492 d!72057))

(assert (=> bs!12492 m!361765))

(assert (=> bs!12492 m!361753))

(assert (=> bs!12492 m!361767))

(declare-fun m!361825 () Bool)

(assert (=> bs!12492 m!361825))

(assert (=> b!364500 d!72057))

(declare-fun d!72061 () Bool)

(assert (=> d!72061 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168613 () Unit!11340)

(assert (=> d!72061 (= lt!168613 (choose!61 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72061 (and (bvslt (size!10208 a!4289) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10208 a!4289)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72061 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168613)))

(declare-fun bs!12493 () Bool)

(assert (= bs!12493 d!72061))

(assert (=> bs!12493 m!361773))

(assert (=> bs!12493 m!361755))

(assert (=> bs!12493 m!361771))

(declare-fun m!361827 () Bool)

(assert (=> bs!12493 m!361827))

(assert (=> b!364500 d!72061))

(declare-fun b!364568 () Bool)

(declare-fun e!223150 () (_ BitVec 32))

(assert (=> b!364568 (= e!223150 #b00000000000000000000000000000000)))

(declare-fun d!72063 () Bool)

(declare-fun lt!168614 () (_ BitVec 32))

(assert (=> d!72063 (and (bvsge lt!168614 #b00000000000000000000000000000000) (bvsle lt!168614 (bvsub (size!10208 lt!168583) from!3650)))))

(assert (=> d!72063 (= lt!168614 e!223150)))

(declare-fun c!53800 () Bool)

(assert (=> d!72063 (= c!53800 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72063 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10208 lt!168583)))))

(assert (=> d!72063 (= (arrayCountValidKeys!0 lt!168583 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168614)))

(declare-fun b!364569 () Bool)

(declare-fun e!223151 () (_ BitVec 32))

(declare-fun call!27237 () (_ BitVec 32))

(assert (=> b!364569 (= e!223151 call!27237)))

(declare-fun b!364570 () Bool)

(assert (=> b!364570 (= e!223151 (bvadd #b00000000000000000000000000000001 call!27237))))

(declare-fun b!364571 () Bool)

(assert (=> b!364571 (= e!223150 e!223151)))

(declare-fun c!53799 () Bool)

(assert (=> b!364571 (= c!53799 (validKeyInArray!0 (select (arr!9855 lt!168583) from!3650)))))

(declare-fun bm!27234 () Bool)

(assert (=> bm!27234 (= call!27237 (arrayCountValidKeys!0 lt!168583 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72063 c!53800) b!364568))

(assert (= (and d!72063 (not c!53800)) b!364571))

(assert (= (and b!364571 c!53799) b!364570))

(assert (= (and b!364571 (not c!53799)) b!364569))

(assert (= (or b!364570 b!364569) bm!27234))

(declare-fun m!361829 () Bool)

(assert (=> b!364571 m!361829))

(assert (=> b!364571 m!361829))

(declare-fun m!361831 () Bool)

(assert (=> b!364571 m!361831))

(declare-fun m!361833 () Bool)

(assert (=> bm!27234 m!361833))

(assert (=> b!364499 d!72063))

(declare-fun b!364572 () Bool)

(declare-fun e!223152 () (_ BitVec 32))

(assert (=> b!364572 (= e!223152 #b00000000000000000000000000000000)))

(declare-fun d!72065 () Bool)

(declare-fun lt!168615 () (_ BitVec 32))

(assert (=> d!72065 (and (bvsge lt!168615 #b00000000000000000000000000000000) (bvsle lt!168615 (bvsub (size!10208 a!4289) from!3650)))))

(assert (=> d!72065 (= lt!168615 e!223152)))

(declare-fun c!53802 () Bool)

(assert (=> d!72065 (= c!53802 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72065 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10208 a!4289)))))

(assert (=> d!72065 (= (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168615)))

(declare-fun b!364573 () Bool)

(declare-fun e!223153 () (_ BitVec 32))

(declare-fun call!27238 () (_ BitVec 32))

(assert (=> b!364573 (= e!223153 call!27238)))

(declare-fun b!364574 () Bool)

(assert (=> b!364574 (= e!223153 (bvadd #b00000000000000000000000000000001 call!27238))))

(declare-fun b!364575 () Bool)

(assert (=> b!364575 (= e!223152 e!223153)))

(declare-fun c!53801 () Bool)

(assert (=> b!364575 (= c!53801 (validKeyInArray!0 (select (arr!9855 a!4289) from!3650)))))

(declare-fun bm!27235 () Bool)

(assert (=> bm!27235 (= call!27238 (arrayCountValidKeys!0 a!4289 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and d!72065 c!53802) b!364572))

(assert (= (and d!72065 (not c!53802)) b!364575))

(assert (= (and b!364575 c!53801) b!364574))

(assert (= (and b!364575 (not c!53801)) b!364573))

(assert (= (or b!364574 b!364573) bm!27235))

(declare-fun m!361835 () Bool)

(assert (=> b!364575 m!361835))

(assert (=> b!364575 m!361835))

(declare-fun m!361837 () Bool)

(assert (=> b!364575 m!361837))

(declare-fun m!361839 () Bool)

(assert (=> bm!27235 m!361839))

(assert (=> b!364499 d!72065))

(declare-fun d!72067 () Bool)

(assert (=> d!72067 (= (validKeyInArray!0 k!2974) (and (not (= k!2974 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2974 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364503 d!72067))

(push 1)

(assert (not bm!27234))

(assert (not bm!27230))

(assert (not b!364575))

(assert (not d!72061))

(assert (not b!364555))

(assert (not b!364571))

(assert (not bm!27228))

(assert (not d!72057))

(assert (not b!364559))

(assert (not b!364551))

(assert (not bm!27235))

(assert (not b!364547))

(assert (not bm!27231))

(assert (not bm!27229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

