; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92930 () Bool)

(assert start!92930)

(declare-fun b!1055072 () Bool)

(declare-fun e!599550 () Bool)

(declare-fun e!599552 () Bool)

(assert (=> b!1055072 (= e!599550 e!599552)))

(declare-fun res!703971 () Bool)

(assert (=> b!1055072 (=> res!703971 e!599552)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66551 0))(
  ( (array!66552 (arr!32006 (Array (_ BitVec 32) (_ BitVec 64))) (size!32542 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66551)

(assert (=> b!1055072 (= res!703971 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32542 a!3488)))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055072 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465661 () (_ BitVec 32))

(declare-datatypes ((Unit!34570 0))(
  ( (Unit!34571) )
))
(declare-fun lt!465662 () Unit!34570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34570)

(assert (=> b!1055072 (= lt!465662 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465661 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22318 0))(
  ( (Nil!22315) (Cons!22314 (h!23523 (_ BitVec 64)) (t!31625 List!22318)) )
))
(declare-fun arrayNoDuplicates!0 (array!66551 (_ BitVec 32) List!22318) Bool)

(assert (=> b!1055072 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22315)))

(declare-fun lt!465663 () Unit!34570)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66551 (_ BitVec 32) (_ BitVec 32)) Unit!34570)

(assert (=> b!1055072 (= lt!465663 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055073 () Bool)

(declare-fun e!599554 () Bool)

(declare-fun e!599548 () Bool)

(assert (=> b!1055073 (= e!599554 e!599548)))

(declare-fun res!703979 () Bool)

(assert (=> b!1055073 (=> res!703979 e!599548)))

(assert (=> b!1055073 (= res!703979 (bvsle lt!465661 i!1381))))

(declare-fun b!1055074 () Bool)

(declare-fun e!599547 () Bool)

(declare-fun e!599549 () Bool)

(assert (=> b!1055074 (= e!599547 e!599549)))

(declare-fun res!703975 () Bool)

(assert (=> b!1055074 (=> (not res!703975) (not e!599549))))

(assert (=> b!1055074 (= res!703975 (not (= lt!465661 i!1381)))))

(declare-fun lt!465660 () array!66551)

(declare-fun arrayScanForKey!0 (array!66551 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055074 (= lt!465661 (arrayScanForKey!0 lt!465660 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055075 () Bool)

(assert (=> b!1055075 (= e!599549 (not e!599550))))

(declare-fun res!703972 () Bool)

(assert (=> b!1055075 (=> res!703972 e!599550)))

(assert (=> b!1055075 (= res!703972 (bvsle lt!465661 i!1381))))

(assert (=> b!1055075 e!599554))

(declare-fun res!703973 () Bool)

(assert (=> b!1055075 (=> (not res!703973) (not e!599554))))

(assert (=> b!1055075 (= res!703973 (= (select (store (arr!32006 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465661) k0!2747))))

(declare-fun b!1055076 () Bool)

(declare-fun res!703976 () Bool)

(declare-fun e!599553 () Bool)

(assert (=> b!1055076 (=> (not res!703976) (not e!599553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055076 (= res!703976 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055077 () Bool)

(declare-fun res!703974 () Bool)

(assert (=> b!1055077 (=> (not res!703974) (not e!599553))))

(assert (=> b!1055077 (= res!703974 (= (select (arr!32006 a!3488) i!1381) k0!2747))))

(declare-fun b!1055078 () Bool)

(assert (=> b!1055078 (= e!599548 (arrayContainsKey!0 a!3488 k0!2747 lt!465661))))

(declare-fun res!703970 () Bool)

(assert (=> start!92930 (=> (not res!703970) (not e!599553))))

(assert (=> start!92930 (= res!703970 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32542 a!3488)) (bvslt (size!32542 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92930 e!599553))

(assert (=> start!92930 true))

(declare-fun array_inv!24786 (array!66551) Bool)

(assert (=> start!92930 (array_inv!24786 a!3488)))

(declare-fun b!1055079 () Bool)

(declare-fun res!703977 () Bool)

(assert (=> b!1055079 (=> (not res!703977) (not e!599553))))

(assert (=> b!1055079 (= res!703977 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22315))))

(declare-fun b!1055080 () Bool)

(assert (=> b!1055080 (= e!599553 e!599547)))

(declare-fun res!703978 () Bool)

(assert (=> b!1055080 (=> (not res!703978) (not e!599547))))

(assert (=> b!1055080 (= res!703978 (arrayContainsKey!0 lt!465660 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055080 (= lt!465660 (array!66552 (store (arr!32006 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32542 a!3488)))))

(declare-fun b!1055081 () Bool)

(declare-fun noDuplicate!1546 (List!22318) Bool)

(assert (=> b!1055081 (= e!599552 (noDuplicate!1546 Nil!22315))))

(assert (= (and start!92930 res!703970) b!1055079))

(assert (= (and b!1055079 res!703977) b!1055076))

(assert (= (and b!1055076 res!703976) b!1055077))

(assert (= (and b!1055077 res!703974) b!1055080))

(assert (= (and b!1055080 res!703978) b!1055074))

(assert (= (and b!1055074 res!703975) b!1055075))

(assert (= (and b!1055075 res!703973) b!1055073))

(assert (= (and b!1055073 (not res!703979)) b!1055078))

(assert (= (and b!1055075 (not res!703972)) b!1055072))

(assert (= (and b!1055072 (not res!703971)) b!1055081))

(declare-fun m!975099 () Bool)

(assert (=> b!1055074 m!975099))

(declare-fun m!975101 () Bool)

(assert (=> b!1055079 m!975101))

(declare-fun m!975103 () Bool)

(assert (=> b!1055072 m!975103))

(declare-fun m!975105 () Bool)

(assert (=> b!1055072 m!975105))

(declare-fun m!975107 () Bool)

(assert (=> b!1055072 m!975107))

(declare-fun m!975109 () Bool)

(assert (=> b!1055072 m!975109))

(declare-fun m!975111 () Bool)

(assert (=> b!1055075 m!975111))

(declare-fun m!975113 () Bool)

(assert (=> b!1055075 m!975113))

(declare-fun m!975115 () Bool)

(assert (=> b!1055076 m!975115))

(declare-fun m!975117 () Bool)

(assert (=> b!1055078 m!975117))

(declare-fun m!975119 () Bool)

(assert (=> b!1055077 m!975119))

(declare-fun m!975121 () Bool)

(assert (=> b!1055081 m!975121))

(declare-fun m!975123 () Bool)

(assert (=> b!1055080 m!975123))

(assert (=> b!1055080 m!975111))

(declare-fun m!975125 () Bool)

(assert (=> start!92930 m!975125))

(check-sat (not b!1055079) (not b!1055078) (not b!1055080) (not b!1055074) (not start!92930) (not b!1055072) (not b!1055076) (not b!1055081))
(check-sat)
(get-model)

(declare-fun d!128081 () Bool)

(declare-fun res!704014 () Bool)

(declare-fun e!599583 () Bool)

(assert (=> d!128081 (=> res!704014 e!599583)))

(assert (=> d!128081 (= res!704014 (= (select (arr!32006 a!3488) lt!465661) k0!2747))))

(assert (=> d!128081 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465661) e!599583)))

(declare-fun b!1055116 () Bool)

(declare-fun e!599584 () Bool)

(assert (=> b!1055116 (= e!599583 e!599584)))

(declare-fun res!704015 () Bool)

(assert (=> b!1055116 (=> (not res!704015) (not e!599584))))

(assert (=> b!1055116 (= res!704015 (bvslt (bvadd lt!465661 #b00000000000000000000000000000001) (size!32542 a!3488)))))

(declare-fun b!1055117 () Bool)

(assert (=> b!1055117 (= e!599584 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465661 #b00000000000000000000000000000001)))))

(assert (= (and d!128081 (not res!704014)) b!1055116))

(assert (= (and b!1055116 res!704015) b!1055117))

(declare-fun m!975155 () Bool)

(assert (=> d!128081 m!975155))

(declare-fun m!975157 () Bool)

(assert (=> b!1055117 m!975157))

(assert (=> b!1055078 d!128081))

(declare-fun d!128083 () Bool)

(declare-fun res!704016 () Bool)

(declare-fun e!599585 () Bool)

(assert (=> d!128083 (=> res!704016 e!599585)))

(assert (=> d!128083 (= res!704016 (= (select (arr!32006 lt!465660) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128083 (= (arrayContainsKey!0 lt!465660 k0!2747 #b00000000000000000000000000000000) e!599585)))

(declare-fun b!1055118 () Bool)

(declare-fun e!599586 () Bool)

(assert (=> b!1055118 (= e!599585 e!599586)))

(declare-fun res!704017 () Bool)

(assert (=> b!1055118 (=> (not res!704017) (not e!599586))))

(assert (=> b!1055118 (= res!704017 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32542 lt!465660)))))

(declare-fun b!1055119 () Bool)

(assert (=> b!1055119 (= e!599586 (arrayContainsKey!0 lt!465660 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128083 (not res!704016)) b!1055118))

(assert (= (and b!1055118 res!704017) b!1055119))

(declare-fun m!975159 () Bool)

(assert (=> d!128083 m!975159))

(declare-fun m!975161 () Bool)

(assert (=> b!1055119 m!975161))

(assert (=> b!1055080 d!128083))

(declare-fun b!1055131 () Bool)

(declare-fun e!599596 () Bool)

(declare-fun e!599598 () Bool)

(assert (=> b!1055131 (= e!599596 e!599598)))

(declare-fun c!107013 () Bool)

(assert (=> b!1055131 (= c!107013 (validKeyInArray!0 (select (arr!32006 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44782 () Bool)

(declare-fun call!44785 () Bool)

(assert (=> bm!44782 (= call!44785 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107013 (Cons!22314 (select (arr!32006 a!3488) #b00000000000000000000000000000000) Nil!22315) Nil!22315)))))

(declare-fun b!1055132 () Bool)

(declare-fun e!599597 () Bool)

(assert (=> b!1055132 (= e!599597 e!599596)))

(declare-fun res!704024 () Bool)

(assert (=> b!1055132 (=> (not res!704024) (not e!599596))))

(declare-fun e!599595 () Bool)

(assert (=> b!1055132 (= res!704024 (not e!599595))))

(declare-fun res!704025 () Bool)

(assert (=> b!1055132 (=> (not res!704025) (not e!599595))))

(assert (=> b!1055132 (= res!704025 (validKeyInArray!0 (select (arr!32006 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128085 () Bool)

(declare-fun res!704026 () Bool)

(assert (=> d!128085 (=> res!704026 e!599597)))

(assert (=> d!128085 (= res!704026 (bvsge #b00000000000000000000000000000000 (size!32542 a!3488)))))

(assert (=> d!128085 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22315) e!599597)))

(declare-fun b!1055130 () Bool)

(assert (=> b!1055130 (= e!599598 call!44785)))

(declare-fun b!1055133 () Bool)

(declare-fun contains!6177 (List!22318 (_ BitVec 64)) Bool)

(assert (=> b!1055133 (= e!599595 (contains!6177 Nil!22315 (select (arr!32006 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055134 () Bool)

(assert (=> b!1055134 (= e!599598 call!44785)))

(assert (= (and d!128085 (not res!704026)) b!1055132))

(assert (= (and b!1055132 res!704025) b!1055133))

(assert (= (and b!1055132 res!704024) b!1055131))

(assert (= (and b!1055131 c!107013) b!1055130))

(assert (= (and b!1055131 (not c!107013)) b!1055134))

(assert (= (or b!1055130 b!1055134) bm!44782))

(declare-fun m!975163 () Bool)

(assert (=> b!1055131 m!975163))

(assert (=> b!1055131 m!975163))

(declare-fun m!975165 () Bool)

(assert (=> b!1055131 m!975165))

(assert (=> bm!44782 m!975163))

(declare-fun m!975167 () Bool)

(assert (=> bm!44782 m!975167))

(assert (=> b!1055132 m!975163))

(assert (=> b!1055132 m!975163))

(assert (=> b!1055132 m!975165))

(assert (=> b!1055133 m!975163))

(assert (=> b!1055133 m!975163))

(declare-fun m!975169 () Bool)

(assert (=> b!1055133 m!975169))

(assert (=> b!1055079 d!128085))

(declare-fun d!128087 () Bool)

(declare-fun lt!465680 () (_ BitVec 32))

(assert (=> d!128087 (and (or (bvslt lt!465680 #b00000000000000000000000000000000) (bvsge lt!465680 (size!32542 lt!465660)) (and (bvsge lt!465680 #b00000000000000000000000000000000) (bvslt lt!465680 (size!32542 lt!465660)))) (bvsge lt!465680 #b00000000000000000000000000000000) (bvslt lt!465680 (size!32542 lt!465660)) (= (select (arr!32006 lt!465660) lt!465680) k0!2747))))

(declare-fun e!599607 () (_ BitVec 32))

(assert (=> d!128087 (= lt!465680 e!599607)))

(declare-fun c!107016 () Bool)

(assert (=> d!128087 (= c!107016 (= (select (arr!32006 lt!465660) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32542 lt!465660)) (bvslt (size!32542 lt!465660) #b01111111111111111111111111111111))))

(assert (=> d!128087 (= (arrayScanForKey!0 lt!465660 k0!2747 #b00000000000000000000000000000000) lt!465680)))

(declare-fun b!1055145 () Bool)

(assert (=> b!1055145 (= e!599607 #b00000000000000000000000000000000)))

(declare-fun b!1055146 () Bool)

(assert (=> b!1055146 (= e!599607 (arrayScanForKey!0 lt!465660 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128087 c!107016) b!1055145))

(assert (= (and d!128087 (not c!107016)) b!1055146))

(declare-fun m!975177 () Bool)

(assert (=> d!128087 m!975177))

(assert (=> d!128087 m!975159))

(declare-fun m!975179 () Bool)

(assert (=> b!1055146 m!975179))

(assert (=> b!1055074 d!128087))

(declare-fun d!128097 () Bool)

(assert (=> d!128097 (= (array_inv!24786 a!3488) (bvsge (size!32542 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92930 d!128097))

(declare-fun d!128099 () Bool)

(declare-fun res!704043 () Bool)

(declare-fun e!599620 () Bool)

(assert (=> d!128099 (=> res!704043 e!599620)))

(get-info :version)

(assert (=> d!128099 (= res!704043 ((_ is Nil!22315) Nil!22315))))

(assert (=> d!128099 (= (noDuplicate!1546 Nil!22315) e!599620)))

(declare-fun b!1055161 () Bool)

(declare-fun e!599621 () Bool)

(assert (=> b!1055161 (= e!599620 e!599621)))

(declare-fun res!704044 () Bool)

(assert (=> b!1055161 (=> (not res!704044) (not e!599621))))

(assert (=> b!1055161 (= res!704044 (not (contains!6177 (t!31625 Nil!22315) (h!23523 Nil!22315))))))

(declare-fun b!1055162 () Bool)

(assert (=> b!1055162 (= e!599621 (noDuplicate!1546 (t!31625 Nil!22315)))))

(assert (= (and d!128099 (not res!704043)) b!1055161))

(assert (= (and b!1055161 res!704044) b!1055162))

(declare-fun m!975181 () Bool)

(assert (=> b!1055161 m!975181))

(declare-fun m!975183 () Bool)

(assert (=> b!1055162 m!975183))

(assert (=> b!1055081 d!128099))

(declare-fun d!128101 () Bool)

(assert (=> d!128101 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055076 d!128101))

(declare-fun d!128103 () Bool)

(declare-fun res!704051 () Bool)

(declare-fun e!599630 () Bool)

(assert (=> d!128103 (=> res!704051 e!599630)))

(assert (=> d!128103 (= res!704051 (= (select (arr!32006 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!128103 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599630)))

(declare-fun b!1055173 () Bool)

(declare-fun e!599631 () Bool)

(assert (=> b!1055173 (= e!599630 e!599631)))

(declare-fun res!704052 () Bool)

(assert (=> b!1055173 (=> (not res!704052) (not e!599631))))

(assert (=> b!1055173 (= res!704052 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32542 a!3488)))))

(declare-fun b!1055174 () Bool)

(assert (=> b!1055174 (= e!599631 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128103 (not res!704051)) b!1055173))

(assert (= (and b!1055173 res!704052) b!1055174))

(declare-fun m!975185 () Bool)

(assert (=> d!128103 m!975185))

(declare-fun m!975187 () Bool)

(assert (=> b!1055174 m!975187))

(assert (=> b!1055072 d!128103))

(declare-fun d!128105 () Bool)

(assert (=> d!128105 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465684 () Unit!34570)

(declare-fun choose!114 (array!66551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34570)

(assert (=> d!128105 (= lt!465684 (choose!114 a!3488 k0!2747 lt!465661 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128105 (bvsge lt!465661 #b00000000000000000000000000000000)))

(assert (=> d!128105 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465661 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465684)))

(declare-fun bs!30926 () Bool)

(assert (= bs!30926 d!128105))

(assert (=> bs!30926 m!975103))

(declare-fun m!975197 () Bool)

(assert (=> bs!30926 m!975197))

(assert (=> b!1055072 d!128105))

(declare-fun b!1055188 () Bool)

(declare-fun e!599645 () Bool)

(declare-fun e!599647 () Bool)

(assert (=> b!1055188 (= e!599645 e!599647)))

(declare-fun c!107023 () Bool)

(assert (=> b!1055188 (= c!107023 (validKeyInArray!0 (select (arr!32006 a!3488) i!1381)))))

(declare-fun bm!44789 () Bool)

(declare-fun call!44792 () Bool)

(assert (=> bm!44789 (= call!44792 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107023 (Cons!22314 (select (arr!32006 a!3488) i!1381) Nil!22315) Nil!22315)))))

(declare-fun b!1055189 () Bool)

(declare-fun e!599646 () Bool)

(assert (=> b!1055189 (= e!599646 e!599645)))

(declare-fun res!704062 () Bool)

(assert (=> b!1055189 (=> (not res!704062) (not e!599645))))

(declare-fun e!599644 () Bool)

(assert (=> b!1055189 (= res!704062 (not e!599644))))

(declare-fun res!704064 () Bool)

(assert (=> b!1055189 (=> (not res!704064) (not e!599644))))

(assert (=> b!1055189 (= res!704064 (validKeyInArray!0 (select (arr!32006 a!3488) i!1381)))))

(declare-fun d!128109 () Bool)

(declare-fun res!704065 () Bool)

(assert (=> d!128109 (=> res!704065 e!599646)))

(assert (=> d!128109 (= res!704065 (bvsge i!1381 (size!32542 a!3488)))))

(assert (=> d!128109 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22315) e!599646)))

(declare-fun b!1055187 () Bool)

(assert (=> b!1055187 (= e!599647 call!44792)))

(declare-fun b!1055190 () Bool)

(assert (=> b!1055190 (= e!599644 (contains!6177 Nil!22315 (select (arr!32006 a!3488) i!1381)))))

(declare-fun b!1055191 () Bool)

(assert (=> b!1055191 (= e!599647 call!44792)))

(assert (= (and d!128109 (not res!704065)) b!1055189))

(assert (= (and b!1055189 res!704064) b!1055190))

(assert (= (and b!1055189 res!704062) b!1055188))

(assert (= (and b!1055188 c!107023) b!1055187))

(assert (= (and b!1055188 (not c!107023)) b!1055191))

(assert (= (or b!1055187 b!1055191) bm!44789))

(assert (=> b!1055188 m!975119))

(assert (=> b!1055188 m!975119))

(declare-fun m!975205 () Bool)

(assert (=> b!1055188 m!975205))

(assert (=> bm!44789 m!975119))

(declare-fun m!975207 () Bool)

(assert (=> bm!44789 m!975207))

(assert (=> b!1055189 m!975119))

(assert (=> b!1055189 m!975119))

(assert (=> b!1055189 m!975205))

(assert (=> b!1055190 m!975119))

(assert (=> b!1055190 m!975119))

(declare-fun m!975209 () Bool)

(assert (=> b!1055190 m!975209))

(assert (=> b!1055072 d!128109))

(declare-fun d!128113 () Bool)

(assert (=> d!128113 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22315)))

(declare-fun lt!465690 () Unit!34570)

(declare-fun choose!39 (array!66551 (_ BitVec 32) (_ BitVec 32)) Unit!34570)

(assert (=> d!128113 (= lt!465690 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128113 (bvslt (size!32542 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128113 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465690)))

(declare-fun bs!30928 () Bool)

(assert (= bs!30928 d!128113))

(assert (=> bs!30928 m!975107))

(declare-fun m!975217 () Bool)

(assert (=> bs!30928 m!975217))

(assert (=> b!1055072 d!128113))

(check-sat (not d!128113) (not bm!44789) (not b!1055162) (not b!1055117) (not b!1055189) (not b!1055146) (not bm!44782) (not b!1055161) (not b!1055132) (not b!1055190) (not b!1055188) (not d!128105) (not b!1055119) (not b!1055174) (not b!1055133) (not b!1055131))
(check-sat)
