; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132690 () Bool)

(assert start!132690)

(declare-fun b!1554923 () Bool)

(declare-fun res!1064073 () Bool)

(declare-fun e!865877 () Bool)

(assert (=> b!1554923 (=> (not res!1064073) (not e!865877))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2282 0))(
  ( (B!2283 (val!19227 Int)) )
))
(declare-datatypes ((tuple2!24902 0))(
  ( (tuple2!24903 (_1!12462 (_ BitVec 64)) (_2!12462 B!2282)) )
))
(declare-datatypes ((List!36306 0))(
  ( (Nil!36303) (Cons!36302 (h!37749 tuple2!24902) (t!51019 List!36306)) )
))
(declare-fun l!1177 () List!36306)

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1554923 (= res!1064073 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36302) l!1177) (not (= (_1!12462 (h!37749 l!1177)) otherKey!50))))))

(declare-fun b!1554924 () Bool)

(declare-fun e!865880 () Bool)

(declare-fun lt!669973 () List!36306)

(declare-datatypes ((Option!847 0))(
  ( (Some!846 (v!22025 B!2282)) (None!845) )
))
(declare-fun getValueByKey!772 (List!36306 (_ BitVec 64)) Option!847)

(assert (=> b!1554924 (= e!865880 (= (getValueByKey!772 lt!669973 otherKey!50) (getValueByKey!772 (t!51019 l!1177) otherKey!50)))))

(declare-fun b!1554925 () Bool)

(declare-fun e!865878 () Bool)

(assert (=> b!1554925 (= e!865877 (not e!865878))))

(declare-fun res!1064075 () Bool)

(assert (=> b!1554925 (=> res!1064075 e!865878)))

(declare-fun lt!669972 () List!36306)

(declare-fun containsKey!789 (List!36306 (_ BitVec 64)) Bool)

(assert (=> b!1554925 (= res!1064075 (not (= (containsKey!789 lt!669972 otherKey!50) (containsKey!789 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2282)

(declare-fun insertStrictlySorted!532 (List!36306 (_ BitVec 64) B!2282) List!36306)

(assert (=> b!1554925 (= lt!669972 (insertStrictlySorted!532 l!1177 newKey!105 newValue!105))))

(assert (=> b!1554925 e!865880))

(declare-fun res!1064074 () Bool)

(assert (=> b!1554925 (=> (not res!1064074) (not e!865880))))

(assert (=> b!1554925 (= res!1064074 (= (containsKey!789 lt!669973 otherKey!50) (containsKey!789 (t!51019 l!1177) otherKey!50)))))

(assert (=> b!1554925 (= lt!669973 (insertStrictlySorted!532 (t!51019 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51642 0))(
  ( (Unit!51643) )
))
(declare-fun lt!669971 () Unit!51642)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (List!36306 (_ BitVec 64) B!2282 (_ BitVec 64)) Unit!51642)

(assert (=> b!1554925 (= lt!669971 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (t!51019 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554926 () Bool)

(declare-fun res!1064077 () Bool)

(assert (=> b!1554926 (=> (not res!1064077) (not e!865877))))

(declare-fun isStrictlySorted!918 (List!36306) Bool)

(assert (=> b!1554926 (= res!1064077 (isStrictlySorted!918 (t!51019 l!1177)))))

(declare-fun b!1554927 () Bool)

(declare-fun e!865879 () Bool)

(declare-fun tp_is_empty!38293 () Bool)

(declare-fun tp!112273 () Bool)

(assert (=> b!1554927 (= e!865879 (and tp_is_empty!38293 tp!112273))))

(declare-fun res!1064076 () Bool)

(assert (=> start!132690 (=> (not res!1064076) (not e!865877))))

(assert (=> start!132690 (= res!1064076 (isStrictlySorted!918 l!1177))))

(assert (=> start!132690 e!865877))

(assert (=> start!132690 e!865879))

(assert (=> start!132690 true))

(assert (=> start!132690 tp_is_empty!38293))

(declare-fun b!1554928 () Bool)

(assert (=> b!1554928 (= e!865878 (isStrictlySorted!918 lt!669972))))

(assert (= (and start!132690 res!1064076) b!1554923))

(assert (= (and b!1554923 res!1064073) b!1554926))

(assert (= (and b!1554926 res!1064077) b!1554925))

(assert (= (and b!1554925 res!1064074) b!1554924))

(assert (= (and b!1554925 (not res!1064075)) b!1554928))

(assert (= (and start!132690 ((_ is Cons!36302) l!1177)) b!1554927))

(declare-fun m!1432433 () Bool)

(assert (=> b!1554925 m!1432433))

(declare-fun m!1432435 () Bool)

(assert (=> b!1554925 m!1432435))

(declare-fun m!1432437 () Bool)

(assert (=> b!1554925 m!1432437))

(declare-fun m!1432439 () Bool)

(assert (=> b!1554925 m!1432439))

(declare-fun m!1432441 () Bool)

(assert (=> b!1554925 m!1432441))

(declare-fun m!1432443 () Bool)

(assert (=> b!1554925 m!1432443))

(declare-fun m!1432445 () Bool)

(assert (=> b!1554925 m!1432445))

(declare-fun m!1432447 () Bool)

(assert (=> b!1554926 m!1432447))

(declare-fun m!1432449 () Bool)

(assert (=> start!132690 m!1432449))

(declare-fun m!1432451 () Bool)

(assert (=> b!1554928 m!1432451))

(declare-fun m!1432453 () Bool)

(assert (=> b!1554924 m!1432453))

(declare-fun m!1432455 () Bool)

(assert (=> b!1554924 m!1432455))

(check-sat (not b!1554928) (not b!1554926) (not b!1554924) (not start!132690) (not b!1554925) tp_is_empty!38293 (not b!1554927))
(check-sat)
(get-model)

(declare-fun d!161659 () Bool)

(declare-fun res!1064112 () Bool)

(declare-fun e!865909 () Bool)

(assert (=> d!161659 (=> res!1064112 e!865909)))

(assert (=> d!161659 (= res!1064112 (or ((_ is Nil!36303) (t!51019 l!1177)) ((_ is Nil!36303) (t!51019 (t!51019 l!1177)))))))

(assert (=> d!161659 (= (isStrictlySorted!918 (t!51019 l!1177)) e!865909)))

(declare-fun b!1554969 () Bool)

(declare-fun e!865910 () Bool)

(assert (=> b!1554969 (= e!865909 e!865910)))

(declare-fun res!1064113 () Bool)

(assert (=> b!1554969 (=> (not res!1064113) (not e!865910))))

(assert (=> b!1554969 (= res!1064113 (bvslt (_1!12462 (h!37749 (t!51019 l!1177))) (_1!12462 (h!37749 (t!51019 (t!51019 l!1177))))))))

(declare-fun b!1554970 () Bool)

(assert (=> b!1554970 (= e!865910 (isStrictlySorted!918 (t!51019 (t!51019 l!1177))))))

(assert (= (and d!161659 (not res!1064112)) b!1554969))

(assert (= (and b!1554969 res!1064113) b!1554970))

(declare-fun m!1432505 () Bool)

(assert (=> b!1554970 m!1432505))

(assert (=> b!1554926 d!161659))

(declare-fun d!161661 () Bool)

(declare-fun res!1064114 () Bool)

(declare-fun e!865911 () Bool)

(assert (=> d!161661 (=> res!1064114 e!865911)))

(assert (=> d!161661 (= res!1064114 (or ((_ is Nil!36303) lt!669972) ((_ is Nil!36303) (t!51019 lt!669972))))))

(assert (=> d!161661 (= (isStrictlySorted!918 lt!669972) e!865911)))

(declare-fun b!1554971 () Bool)

(declare-fun e!865912 () Bool)

(assert (=> b!1554971 (= e!865911 e!865912)))

(declare-fun res!1064115 () Bool)

(assert (=> b!1554971 (=> (not res!1064115) (not e!865912))))

(assert (=> b!1554971 (= res!1064115 (bvslt (_1!12462 (h!37749 lt!669972)) (_1!12462 (h!37749 (t!51019 lt!669972)))))))

(declare-fun b!1554972 () Bool)

(assert (=> b!1554972 (= e!865912 (isStrictlySorted!918 (t!51019 lt!669972)))))

(assert (= (and d!161661 (not res!1064114)) b!1554971))

(assert (= (and b!1554971 res!1064115) b!1554972))

(declare-fun m!1432507 () Bool)

(assert (=> b!1554972 m!1432507))

(assert (=> b!1554928 d!161661))

(declare-fun d!161663 () Bool)

(declare-fun res!1064116 () Bool)

(declare-fun e!865913 () Bool)

(assert (=> d!161663 (=> res!1064116 e!865913)))

(assert (=> d!161663 (= res!1064116 (or ((_ is Nil!36303) l!1177) ((_ is Nil!36303) (t!51019 l!1177))))))

(assert (=> d!161663 (= (isStrictlySorted!918 l!1177) e!865913)))

(declare-fun b!1554973 () Bool)

(declare-fun e!865914 () Bool)

(assert (=> b!1554973 (= e!865913 e!865914)))

(declare-fun res!1064117 () Bool)

(assert (=> b!1554973 (=> (not res!1064117) (not e!865914))))

(assert (=> b!1554973 (= res!1064117 (bvslt (_1!12462 (h!37749 l!1177)) (_1!12462 (h!37749 (t!51019 l!1177)))))))

(declare-fun b!1554974 () Bool)

(assert (=> b!1554974 (= e!865914 (isStrictlySorted!918 (t!51019 l!1177)))))

(assert (= (and d!161663 (not res!1064116)) b!1554973))

(assert (= (and b!1554973 res!1064117) b!1554974))

(assert (=> b!1554974 m!1432447))

(assert (=> start!132690 d!161663))

(declare-fun b!1554984 () Bool)

(declare-fun e!865919 () Option!847)

(declare-fun e!865920 () Option!847)

(assert (=> b!1554984 (= e!865919 e!865920)))

(declare-fun c!143478 () Bool)

(assert (=> b!1554984 (= c!143478 (and ((_ is Cons!36302) lt!669973) (not (= (_1!12462 (h!37749 lt!669973)) otherKey!50))))))

(declare-fun b!1554985 () Bool)

(assert (=> b!1554985 (= e!865920 (getValueByKey!772 (t!51019 lt!669973) otherKey!50))))

(declare-fun d!161665 () Bool)

(declare-fun c!143477 () Bool)

(assert (=> d!161665 (= c!143477 (and ((_ is Cons!36302) lt!669973) (= (_1!12462 (h!37749 lt!669973)) otherKey!50)))))

(assert (=> d!161665 (= (getValueByKey!772 lt!669973 otherKey!50) e!865919)))

(declare-fun b!1554983 () Bool)

(assert (=> b!1554983 (= e!865919 (Some!846 (_2!12462 (h!37749 lt!669973))))))

(declare-fun b!1554986 () Bool)

(assert (=> b!1554986 (= e!865920 None!845)))

(assert (= (and d!161665 c!143477) b!1554983))

(assert (= (and d!161665 (not c!143477)) b!1554984))

(assert (= (and b!1554984 c!143478) b!1554985))

(assert (= (and b!1554984 (not c!143478)) b!1554986))

(declare-fun m!1432509 () Bool)

(assert (=> b!1554985 m!1432509))

(assert (=> b!1554924 d!161665))

(declare-fun b!1554988 () Bool)

(declare-fun e!865921 () Option!847)

(declare-fun e!865922 () Option!847)

(assert (=> b!1554988 (= e!865921 e!865922)))

(declare-fun c!143480 () Bool)

(assert (=> b!1554988 (= c!143480 (and ((_ is Cons!36302) (t!51019 l!1177)) (not (= (_1!12462 (h!37749 (t!51019 l!1177))) otherKey!50))))))

(declare-fun b!1554989 () Bool)

(assert (=> b!1554989 (= e!865922 (getValueByKey!772 (t!51019 (t!51019 l!1177)) otherKey!50))))

(declare-fun d!161671 () Bool)

(declare-fun c!143479 () Bool)

(assert (=> d!161671 (= c!143479 (and ((_ is Cons!36302) (t!51019 l!1177)) (= (_1!12462 (h!37749 (t!51019 l!1177))) otherKey!50)))))

(assert (=> d!161671 (= (getValueByKey!772 (t!51019 l!1177) otherKey!50) e!865921)))

(declare-fun b!1554987 () Bool)

(assert (=> b!1554987 (= e!865921 (Some!846 (_2!12462 (h!37749 (t!51019 l!1177)))))))

(declare-fun b!1554990 () Bool)

(assert (=> b!1554990 (= e!865922 None!845)))

(assert (= (and d!161671 c!143479) b!1554987))

(assert (= (and d!161671 (not c!143479)) b!1554988))

(assert (= (and b!1554988 c!143480) b!1554989))

(assert (= (and b!1554988 (not c!143480)) b!1554990))

(declare-fun m!1432511 () Bool)

(assert (=> b!1554989 m!1432511))

(assert (=> b!1554924 d!161671))

(declare-fun bm!71477 () Bool)

(declare-fun call!71482 () List!36306)

(declare-fun call!71481 () List!36306)

(assert (=> bm!71477 (= call!71482 call!71481)))

(declare-fun b!1555071 () Bool)

(declare-fun e!865965 () List!36306)

(declare-fun e!865967 () List!36306)

(assert (=> b!1555071 (= e!865965 e!865967)))

(declare-fun c!143515 () Bool)

(assert (=> b!1555071 (= c!143515 (and ((_ is Cons!36302) l!1177) (= (_1!12462 (h!37749 l!1177)) newKey!105)))))

(declare-fun b!1555072 () Bool)

(declare-fun call!71480 () List!36306)

(assert (=> b!1555072 (= e!865965 call!71480)))

(declare-fun c!143513 () Bool)

(declare-fun e!865963 () List!36306)

(declare-fun bm!71478 () Bool)

(declare-fun $colon$colon!961 (List!36306 tuple2!24902) List!36306)

(assert (=> bm!71478 (= call!71480 ($colon$colon!961 e!865963 (ite c!143513 (h!37749 l!1177) (tuple2!24903 newKey!105 newValue!105))))))

(declare-fun c!143516 () Bool)

(assert (=> bm!71478 (= c!143516 c!143513)))

(declare-fun b!1555073 () Bool)

(assert (=> b!1555073 (= e!865967 call!71481)))

(declare-fun c!143514 () Bool)

(declare-fun b!1555074 () Bool)

(assert (=> b!1555074 (= e!865963 (ite c!143515 (t!51019 l!1177) (ite c!143514 (Cons!36302 (h!37749 l!1177) (t!51019 l!1177)) Nil!36303)))))

(declare-fun d!161673 () Bool)

(declare-fun e!865964 () Bool)

(assert (=> d!161673 e!865964))

(declare-fun res!1064135 () Bool)

(assert (=> d!161673 (=> (not res!1064135) (not e!865964))))

(declare-fun lt!670000 () List!36306)

(assert (=> d!161673 (= res!1064135 (isStrictlySorted!918 lt!670000))))

(assert (=> d!161673 (= lt!670000 e!865965)))

(assert (=> d!161673 (= c!143513 (and ((_ is Cons!36302) l!1177) (bvslt (_1!12462 (h!37749 l!1177)) newKey!105)))))

(assert (=> d!161673 (isStrictlySorted!918 l!1177)))

(assert (=> d!161673 (= (insertStrictlySorted!532 l!1177 newKey!105 newValue!105) lt!670000)))

(declare-fun b!1555075 () Bool)

(declare-fun contains!10133 (List!36306 tuple2!24902) Bool)

(assert (=> b!1555075 (= e!865964 (contains!10133 lt!670000 (tuple2!24903 newKey!105 newValue!105)))))

(declare-fun bm!71479 () Bool)

(assert (=> bm!71479 (= call!71481 call!71480)))

(declare-fun b!1555076 () Bool)

(assert (=> b!1555076 (= c!143514 (and ((_ is Cons!36302) l!1177) (bvsgt (_1!12462 (h!37749 l!1177)) newKey!105)))))

(declare-fun e!865966 () List!36306)

(assert (=> b!1555076 (= e!865967 e!865966)))

(declare-fun b!1555077 () Bool)

(assert (=> b!1555077 (= e!865966 call!71482)))

(declare-fun b!1555078 () Bool)

(assert (=> b!1555078 (= e!865966 call!71482)))

(declare-fun b!1555079 () Bool)

(assert (=> b!1555079 (= e!865963 (insertStrictlySorted!532 (t!51019 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555080 () Bool)

(declare-fun res!1064134 () Bool)

(assert (=> b!1555080 (=> (not res!1064134) (not e!865964))))

(assert (=> b!1555080 (= res!1064134 (containsKey!789 lt!670000 newKey!105))))

(assert (= (and d!161673 c!143513) b!1555072))

(assert (= (and d!161673 (not c!143513)) b!1555071))

(assert (= (and b!1555071 c!143515) b!1555073))

(assert (= (and b!1555071 (not c!143515)) b!1555076))

(assert (= (and b!1555076 c!143514) b!1555077))

(assert (= (and b!1555076 (not c!143514)) b!1555078))

(assert (= (or b!1555077 b!1555078) bm!71477))

(assert (= (or b!1555073 bm!71477) bm!71479))

(assert (= (or b!1555072 bm!71479) bm!71478))

(assert (= (and bm!71478 c!143516) b!1555079))

(assert (= (and bm!71478 (not c!143516)) b!1555074))

(assert (= (and d!161673 res!1064135) b!1555080))

(assert (= (and b!1555080 res!1064134) b!1555075))

(declare-fun m!1432529 () Bool)

(assert (=> bm!71478 m!1432529))

(declare-fun m!1432531 () Bool)

(assert (=> b!1555080 m!1432531))

(declare-fun m!1432533 () Bool)

(assert (=> d!161673 m!1432533))

(assert (=> d!161673 m!1432449))

(assert (=> b!1555079 m!1432441))

(declare-fun m!1432535 () Bool)

(assert (=> b!1555075 m!1432535))

(assert (=> b!1554925 d!161673))

(declare-fun d!161679 () Bool)

(declare-fun res!1064150 () Bool)

(declare-fun e!865982 () Bool)

(assert (=> d!161679 (=> res!1064150 e!865982)))

(assert (=> d!161679 (= res!1064150 (and ((_ is Cons!36302) lt!669973) (= (_1!12462 (h!37749 lt!669973)) otherKey!50)))))

(assert (=> d!161679 (= (containsKey!789 lt!669973 otherKey!50) e!865982)))

(declare-fun b!1555095 () Bool)

(declare-fun e!865983 () Bool)

(assert (=> b!1555095 (= e!865982 e!865983)))

(declare-fun res!1064151 () Bool)

(assert (=> b!1555095 (=> (not res!1064151) (not e!865983))))

(assert (=> b!1555095 (= res!1064151 (and (or (not ((_ is Cons!36302) lt!669973)) (bvsle (_1!12462 (h!37749 lt!669973)) otherKey!50)) ((_ is Cons!36302) lt!669973) (bvslt (_1!12462 (h!37749 lt!669973)) otherKey!50)))))

(declare-fun b!1555096 () Bool)

(assert (=> b!1555096 (= e!865983 (containsKey!789 (t!51019 lt!669973) otherKey!50))))

(assert (= (and d!161679 (not res!1064150)) b!1555095))

(assert (= (and b!1555095 res!1064151) b!1555096))

(declare-fun m!1432539 () Bool)

(assert (=> b!1555096 m!1432539))

(assert (=> b!1554925 d!161679))

(declare-fun d!161683 () Bool)

(declare-fun res!1064152 () Bool)

(declare-fun e!865984 () Bool)

(assert (=> d!161683 (=> res!1064152 e!865984)))

(assert (=> d!161683 (= res!1064152 (and ((_ is Cons!36302) l!1177) (= (_1!12462 (h!37749 l!1177)) otherKey!50)))))

(assert (=> d!161683 (= (containsKey!789 l!1177 otherKey!50) e!865984)))

(declare-fun b!1555097 () Bool)

(declare-fun e!865985 () Bool)

(assert (=> b!1555097 (= e!865984 e!865985)))

(declare-fun res!1064153 () Bool)

(assert (=> b!1555097 (=> (not res!1064153) (not e!865985))))

(assert (=> b!1555097 (= res!1064153 (and (or (not ((_ is Cons!36302) l!1177)) (bvsle (_1!12462 (h!37749 l!1177)) otherKey!50)) ((_ is Cons!36302) l!1177) (bvslt (_1!12462 (h!37749 l!1177)) otherKey!50)))))

(declare-fun b!1555098 () Bool)

(assert (=> b!1555098 (= e!865985 (containsKey!789 (t!51019 l!1177) otherKey!50))))

(assert (= (and d!161683 (not res!1064152)) b!1555097))

(assert (= (and b!1555097 res!1064153) b!1555098))

(assert (=> b!1555098 m!1432443))

(assert (=> b!1554925 d!161683))

(declare-fun bm!71480 () Bool)

(declare-fun call!71485 () List!36306)

(declare-fun call!71484 () List!36306)

(assert (=> bm!71480 (= call!71485 call!71484)))

(declare-fun b!1555101 () Bool)

(declare-fun e!865990 () List!36306)

(declare-fun e!865992 () List!36306)

(assert (=> b!1555101 (= e!865990 e!865992)))

(declare-fun c!143519 () Bool)

(assert (=> b!1555101 (= c!143519 (and ((_ is Cons!36302) (t!51019 l!1177)) (= (_1!12462 (h!37749 (t!51019 l!1177))) newKey!105)))))

(declare-fun b!1555102 () Bool)

(declare-fun call!71483 () List!36306)

(assert (=> b!1555102 (= e!865990 call!71483)))

(declare-fun e!865988 () List!36306)

(declare-fun bm!71481 () Bool)

(declare-fun c!143517 () Bool)

(assert (=> bm!71481 (= call!71483 ($colon$colon!961 e!865988 (ite c!143517 (h!37749 (t!51019 l!1177)) (tuple2!24903 newKey!105 newValue!105))))))

(declare-fun c!143520 () Bool)

(assert (=> bm!71481 (= c!143520 c!143517)))

(declare-fun b!1555103 () Bool)

(assert (=> b!1555103 (= e!865992 call!71484)))

(declare-fun b!1555104 () Bool)

(declare-fun c!143518 () Bool)

(assert (=> b!1555104 (= e!865988 (ite c!143519 (t!51019 (t!51019 l!1177)) (ite c!143518 (Cons!36302 (h!37749 (t!51019 l!1177)) (t!51019 (t!51019 l!1177))) Nil!36303)))))

(declare-fun d!161685 () Bool)

(declare-fun e!865989 () Bool)

(assert (=> d!161685 e!865989))

(declare-fun res!1064157 () Bool)

(assert (=> d!161685 (=> (not res!1064157) (not e!865989))))

(declare-fun lt!670004 () List!36306)

(assert (=> d!161685 (= res!1064157 (isStrictlySorted!918 lt!670004))))

(assert (=> d!161685 (= lt!670004 e!865990)))

(assert (=> d!161685 (= c!143517 (and ((_ is Cons!36302) (t!51019 l!1177)) (bvslt (_1!12462 (h!37749 (t!51019 l!1177))) newKey!105)))))

(assert (=> d!161685 (isStrictlySorted!918 (t!51019 l!1177))))

(assert (=> d!161685 (= (insertStrictlySorted!532 (t!51019 l!1177) newKey!105 newValue!105) lt!670004)))

(declare-fun b!1555105 () Bool)

(assert (=> b!1555105 (= e!865989 (contains!10133 lt!670004 (tuple2!24903 newKey!105 newValue!105)))))

(declare-fun bm!71482 () Bool)

(assert (=> bm!71482 (= call!71484 call!71483)))

(declare-fun b!1555106 () Bool)

(assert (=> b!1555106 (= c!143518 (and ((_ is Cons!36302) (t!51019 l!1177)) (bvsgt (_1!12462 (h!37749 (t!51019 l!1177))) newKey!105)))))

(declare-fun e!865991 () List!36306)

(assert (=> b!1555106 (= e!865992 e!865991)))

(declare-fun b!1555107 () Bool)

(assert (=> b!1555107 (= e!865991 call!71485)))

(declare-fun b!1555108 () Bool)

(assert (=> b!1555108 (= e!865991 call!71485)))

(declare-fun b!1555109 () Bool)

(assert (=> b!1555109 (= e!865988 (insertStrictlySorted!532 (t!51019 (t!51019 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1555110 () Bool)

(declare-fun res!1064156 () Bool)

(assert (=> b!1555110 (=> (not res!1064156) (not e!865989))))

(assert (=> b!1555110 (= res!1064156 (containsKey!789 lt!670004 newKey!105))))

(assert (= (and d!161685 c!143517) b!1555102))

(assert (= (and d!161685 (not c!143517)) b!1555101))

(assert (= (and b!1555101 c!143519) b!1555103))

(assert (= (and b!1555101 (not c!143519)) b!1555106))

(assert (= (and b!1555106 c!143518) b!1555107))

(assert (= (and b!1555106 (not c!143518)) b!1555108))

(assert (= (or b!1555107 b!1555108) bm!71480))

(assert (= (or b!1555103 bm!71480) bm!71482))

(assert (= (or b!1555102 bm!71482) bm!71481))

(assert (= (and bm!71481 c!143520) b!1555109))

(assert (= (and bm!71481 (not c!143520)) b!1555104))

(assert (= (and d!161685 res!1064157) b!1555110))

(assert (= (and b!1555110 res!1064156) b!1555105))

(declare-fun m!1432547 () Bool)

(assert (=> bm!71481 m!1432547))

(declare-fun m!1432549 () Bool)

(assert (=> b!1555110 m!1432549))

(declare-fun m!1432551 () Bool)

(assert (=> d!161685 m!1432551))

(assert (=> d!161685 m!1432447))

(declare-fun m!1432553 () Bool)

(assert (=> b!1555109 m!1432553))

(declare-fun m!1432555 () Bool)

(assert (=> b!1555105 m!1432555))

(assert (=> b!1554925 d!161685))

(declare-fun d!161689 () Bool)

(declare-fun res!1064158 () Bool)

(declare-fun e!865993 () Bool)

(assert (=> d!161689 (=> res!1064158 e!865993)))

(assert (=> d!161689 (= res!1064158 (and ((_ is Cons!36302) (t!51019 l!1177)) (= (_1!12462 (h!37749 (t!51019 l!1177))) otherKey!50)))))

(assert (=> d!161689 (= (containsKey!789 (t!51019 l!1177) otherKey!50) e!865993)))

(declare-fun b!1555111 () Bool)

(declare-fun e!865994 () Bool)

(assert (=> b!1555111 (= e!865993 e!865994)))

(declare-fun res!1064159 () Bool)

(assert (=> b!1555111 (=> (not res!1064159) (not e!865994))))

(assert (=> b!1555111 (= res!1064159 (and (or (not ((_ is Cons!36302) (t!51019 l!1177))) (bvsle (_1!12462 (h!37749 (t!51019 l!1177))) otherKey!50)) ((_ is Cons!36302) (t!51019 l!1177)) (bvslt (_1!12462 (h!37749 (t!51019 l!1177))) otherKey!50)))))

(declare-fun b!1555112 () Bool)

(assert (=> b!1555112 (= e!865994 (containsKey!789 (t!51019 (t!51019 l!1177)) otherKey!50))))

(assert (= (and d!161689 (not res!1064158)) b!1555111))

(assert (= (and b!1555111 res!1064159) b!1555112))

(declare-fun m!1432557 () Bool)

(assert (=> b!1555112 m!1432557))

(assert (=> b!1554925 d!161689))

(declare-fun d!161691 () Bool)

(declare-fun e!866034 () Bool)

(assert (=> d!161691 e!866034))

(declare-fun res!1064192 () Bool)

(assert (=> d!161691 (=> (not res!1064192) (not e!866034))))

(assert (=> d!161691 (= res!1064192 (= (containsKey!789 (insertStrictlySorted!532 (t!51019 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!789 (t!51019 l!1177) otherKey!50)))))

(declare-fun lt!670012 () Unit!51642)

(declare-fun choose!2069 (List!36306 (_ BitVec 64) B!2282 (_ BitVec 64)) Unit!51642)

(assert (=> d!161691 (= lt!670012 (choose!2069 (t!51019 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866033 () Bool)

(assert (=> d!161691 e!866033))

(declare-fun res!1064193 () Bool)

(assert (=> d!161691 (=> (not res!1064193) (not e!866033))))

(assert (=> d!161691 (= res!1064193 (isStrictlySorted!918 (t!51019 l!1177)))))

(assert (=> d!161691 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (t!51019 l!1177) newKey!105 newValue!105 otherKey!50) lt!670012)))

(declare-fun b!1555161 () Bool)

(assert (=> b!1555161 (= e!866033 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555162 () Bool)

(assert (=> b!1555162 (= e!866034 (= (getValueByKey!772 (insertStrictlySorted!532 (t!51019 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!772 (t!51019 l!1177) otherKey!50)))))

(assert (= (and d!161691 res!1064193) b!1555161))

(assert (= (and d!161691 res!1064192) b!1555162))

(assert (=> d!161691 m!1432441))

(declare-fun m!1432595 () Bool)

(assert (=> d!161691 m!1432595))

(assert (=> d!161691 m!1432441))

(assert (=> d!161691 m!1432443))

(assert (=> d!161691 m!1432447))

(declare-fun m!1432597 () Bool)

(assert (=> d!161691 m!1432597))

(assert (=> b!1555162 m!1432441))

(assert (=> b!1555162 m!1432441))

(declare-fun m!1432599 () Bool)

(assert (=> b!1555162 m!1432599))

(assert (=> b!1555162 m!1432455))

(assert (=> b!1554925 d!161691))

(declare-fun d!161713 () Bool)

(declare-fun res!1064194 () Bool)

(declare-fun e!866039 () Bool)

(assert (=> d!161713 (=> res!1064194 e!866039)))

(assert (=> d!161713 (= res!1064194 (and ((_ is Cons!36302) lt!669972) (= (_1!12462 (h!37749 lt!669972)) otherKey!50)))))

(assert (=> d!161713 (= (containsKey!789 lt!669972 otherKey!50) e!866039)))

(declare-fun b!1555171 () Bool)

(declare-fun e!866040 () Bool)

(assert (=> b!1555171 (= e!866039 e!866040)))

(declare-fun res!1064195 () Bool)

(assert (=> b!1555171 (=> (not res!1064195) (not e!866040))))

(assert (=> b!1555171 (= res!1064195 (and (or (not ((_ is Cons!36302) lt!669972)) (bvsle (_1!12462 (h!37749 lt!669972)) otherKey!50)) ((_ is Cons!36302) lt!669972) (bvslt (_1!12462 (h!37749 lt!669972)) otherKey!50)))))

(declare-fun b!1555172 () Bool)

(assert (=> b!1555172 (= e!866040 (containsKey!789 (t!51019 lt!669972) otherKey!50))))

(assert (= (and d!161713 (not res!1064194)) b!1555171))

(assert (= (and b!1555171 res!1064195) b!1555172))

(declare-fun m!1432601 () Bool)

(assert (=> b!1555172 m!1432601))

(assert (=> b!1554925 d!161713))

(declare-fun b!1555181 () Bool)

(declare-fun e!866047 () Bool)

(declare-fun tp!112282 () Bool)

(assert (=> b!1555181 (= e!866047 (and tp_is_empty!38293 tp!112282))))

(assert (=> b!1554927 (= tp!112273 e!866047)))

(assert (= (and b!1554927 ((_ is Cons!36302) (t!51019 l!1177))) b!1555181))

(check-sat (not b!1555109) (not b!1555105) (not b!1555075) (not b!1554985) (not b!1554972) (not b!1555096) (not bm!71478) (not b!1554970) (not d!161673) (not b!1554989) (not b!1555112) (not b!1554974) (not b!1555162) (not b!1555110) (not bm!71481) tp_is_empty!38293 (not d!161685) (not b!1555079) (not b!1555098) (not b!1555080) (not d!161691) (not b!1555181) (not b!1555172))
(check-sat)
