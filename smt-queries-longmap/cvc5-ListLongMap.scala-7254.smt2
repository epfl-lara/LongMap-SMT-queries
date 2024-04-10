; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92586 () Bool)

(assert start!92586)

(declare-fun res!702098 () Bool)

(declare-fun e!597919 () Bool)

(assert (=> start!92586 (=> (not res!702098) (not e!597919))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66387 0))(
  ( (array!66388 (arr!31933 (Array (_ BitVec 32) (_ BitVec 64))) (size!32469 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66387)

(assert (=> start!92586 (= res!702098 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32469 a!3488)) (bvslt (size!32469 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92586 e!597919))

(assert (=> start!92586 true))

(declare-fun array_inv!24713 (array!66387) Bool)

(assert (=> start!92586 (array_inv!24713 a!3488)))

(declare-fun b!1052971 () Bool)

(declare-fun res!702100 () Bool)

(assert (=> b!1052971 (=> (not res!702100) (not e!597919))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052971 (= res!702100 (validKeyInArray!0 k!2747))))

(declare-fun b!1052972 () Bool)

(declare-fun res!702101 () Bool)

(assert (=> b!1052972 (=> (not res!702101) (not e!597919))))

(declare-datatypes ((List!22245 0))(
  ( (Nil!22242) (Cons!22241 (h!23450 (_ BitVec 64)) (t!31552 List!22245)) )
))
(declare-fun arrayNoDuplicates!0 (array!66387 (_ BitVec 32) List!22245) Bool)

(assert (=> b!1052972 (= res!702101 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22242))))

(declare-fun b!1052973 () Bool)

(declare-fun e!597918 () Bool)

(assert (=> b!1052973 (= e!597919 e!597918)))

(declare-fun res!702097 () Bool)

(assert (=> b!1052973 (=> (not res!702097) (not e!597918))))

(declare-fun lt!465021 () array!66387)

(declare-fun arrayContainsKey!0 (array!66387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052973 (= res!702097 (arrayContainsKey!0 lt!465021 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052973 (= lt!465021 (array!66388 (store (arr!31933 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32469 a!3488)))))

(declare-fun b!1052974 () Bool)

(declare-fun arrayScanForKey!0 (array!66387 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052974 (= e!597918 (= (arrayScanForKey!0 lt!465021 k!2747 #b00000000000000000000000000000000) i!1381))))

(declare-fun b!1052975 () Bool)

(declare-fun res!702099 () Bool)

(assert (=> b!1052975 (=> (not res!702099) (not e!597919))))

(assert (=> b!1052975 (= res!702099 (= (select (arr!31933 a!3488) i!1381) k!2747))))

(assert (= (and start!92586 res!702098) b!1052972))

(assert (= (and b!1052972 res!702101) b!1052971))

(assert (= (and b!1052971 res!702100) b!1052975))

(assert (= (and b!1052975 res!702099) b!1052973))

(assert (= (and b!1052973 res!702097) b!1052974))

(declare-fun m!973361 () Bool)

(assert (=> b!1052973 m!973361))

(declare-fun m!973363 () Bool)

(assert (=> b!1052973 m!973363))

(declare-fun m!973365 () Bool)

(assert (=> b!1052975 m!973365))

(declare-fun m!973367 () Bool)

(assert (=> b!1052971 m!973367))

(declare-fun m!973369 () Bool)

(assert (=> b!1052974 m!973369))

(declare-fun m!973371 () Bool)

(assert (=> start!92586 m!973371))

(declare-fun m!973373 () Bool)

(assert (=> b!1052972 m!973373))

(push 1)

(assert (not b!1052973))

(assert (not b!1052974))

(assert (not start!92586))

(assert (not b!1052972))

(assert (not b!1052971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127801 () Bool)

(declare-fun res!702142 () Bool)

(declare-fun e!597948 () Bool)

(assert (=> d!127801 (=> res!702142 e!597948)))

(assert (=> d!127801 (= res!702142 (= (select (arr!31933 lt!465021) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127801 (= (arrayContainsKey!0 lt!465021 k!2747 #b00000000000000000000000000000000) e!597948)))

(declare-fun b!1053016 () Bool)

(declare-fun e!597949 () Bool)

(assert (=> b!1053016 (= e!597948 e!597949)))

(declare-fun res!702143 () Bool)

(assert (=> b!1053016 (=> (not res!702143) (not e!597949))))

(assert (=> b!1053016 (= res!702143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32469 lt!465021)))))

(declare-fun b!1053017 () Bool)

(assert (=> b!1053017 (= e!597949 (arrayContainsKey!0 lt!465021 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127801 (not res!702142)) b!1053016))

(assert (= (and b!1053016 res!702143) b!1053017))

(declare-fun m!973407 () Bool)

(assert (=> d!127801 m!973407))

(declare-fun m!973409 () Bool)

(assert (=> b!1053017 m!973409))

(assert (=> b!1052973 d!127801))

(declare-fun b!1053053 () Bool)

(declare-fun e!597980 () Bool)

(declare-fun contains!6161 (List!22245 (_ BitVec 64)) Bool)

(assert (=> b!1053053 (= e!597980 (contains!6161 Nil!22242 (select (arr!31933 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053054 () Bool)

(declare-fun e!597978 () Bool)

(declare-fun e!597979 () Bool)

(assert (=> b!1053054 (= e!597978 e!597979)))

(declare-fun res!702166 () Bool)

(assert (=> b!1053054 (=> (not res!702166) (not e!597979))))

(assert (=> b!1053054 (= res!702166 (not e!597980))))

(declare-fun res!702167 () Bool)

(assert (=> b!1053054 (=> (not res!702167) (not e!597980))))

(assert (=> b!1053054 (= res!702167 (validKeyInArray!0 (select (arr!31933 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053056 () Bool)

(declare-fun e!597981 () Bool)

(assert (=> b!1053056 (= e!597979 e!597981)))

(declare-fun c!106904 () Bool)

(assert (=> b!1053056 (= c!106904 (validKeyInArray!0 (select (arr!31933 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053057 () Bool)

(declare-fun call!44728 () Bool)

(assert (=> b!1053057 (= e!597981 call!44728)))

(declare-fun bm!44725 () Bool)

(assert (=> bm!44725 (= call!44728 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106904 (Cons!22241 (select (arr!31933 a!3488) #b00000000000000000000000000000000) Nil!22242) Nil!22242)))))

(declare-fun b!1053055 () Bool)

(assert (=> b!1053055 (= e!597981 call!44728)))

(declare-fun d!127809 () Bool)

(declare-fun res!702165 () Bool)

(assert (=> d!127809 (=> res!702165 e!597978)))

(assert (=> d!127809 (= res!702165 (bvsge #b00000000000000000000000000000000 (size!32469 a!3488)))))

(assert (=> d!127809 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22242) e!597978)))

(assert (= (and d!127809 (not res!702165)) b!1053054))

(assert (= (and b!1053054 res!702167) b!1053053))

(assert (= (and b!1053054 res!702166) b!1053056))

(assert (= (and b!1053056 c!106904) b!1053057))

(assert (= (and b!1053056 (not c!106904)) b!1053055))

(assert (= (or b!1053057 b!1053055) bm!44725))

(declare-fun m!973423 () Bool)

(assert (=> b!1053053 m!973423))

(assert (=> b!1053053 m!973423))

(declare-fun m!973427 () Bool)

(assert (=> b!1053053 m!973427))

(assert (=> b!1053054 m!973423))

(assert (=> b!1053054 m!973423))

(declare-fun m!973431 () Bool)

(assert (=> b!1053054 m!973431))

(assert (=> b!1053056 m!973423))

(assert (=> b!1053056 m!973423))

(assert (=> b!1053056 m!973431))

(assert (=> bm!44725 m!973423))

(declare-fun m!973433 () Bool)

(assert (=> bm!44725 m!973433))

(assert (=> b!1052972 d!127809))

(declare-fun d!127817 () Bool)

(assert (=> d!127817 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1052971 d!127817))

(declare-fun d!127821 () Bool)

(assert (=> d!127821 (= (array_inv!24713 a!3488) (bvsge (size!32469 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92586 d!127821))

(declare-fun d!127823 () Bool)

