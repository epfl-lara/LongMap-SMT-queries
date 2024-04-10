; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101872 () Bool)

(assert start!101872)

(declare-fun b!1226887 () Bool)

(declare-fun res!815539 () Bool)

(declare-fun e!696685 () Bool)

(assert (=> b!1226887 (=> (not res!815539) (not e!696685))))

(declare-datatypes ((List!27004 0))(
  ( (Nil!27001) (Cons!27000 (h!28209 (_ BitVec 64)) (t!40467 List!27004)) )
))
(declare-fun acc!823 () List!27004)

(declare-fun noDuplicate!1663 (List!27004) Bool)

(assert (=> b!1226887 (= res!815539 (noDuplicate!1663 acc!823))))

(declare-fun res!815536 () Bool)

(assert (=> start!101872 (=> (not res!815536) (not e!696685))))

(declare-datatypes ((array!79211 0))(
  ( (array!79212 (arr!38231 (Array (_ BitVec 32) (_ BitVec 64))) (size!38767 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79211)

(assert (=> start!101872 (= res!815536 (bvslt (size!38767 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101872 e!696685))

(declare-fun array_inv!29079 (array!79211) Bool)

(assert (=> start!101872 (array_inv!29079 a!3806)))

(assert (=> start!101872 true))

(declare-fun b!1226888 () Bool)

(declare-fun res!815535 () Bool)

(assert (=> b!1226888 (=> (not res!815535) (not e!696685))))

(declare-fun contains!7066 (List!27004 (_ BitVec 64)) Bool)

(assert (=> b!1226888 (= res!815535 (not (contains!7066 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226889 () Bool)

(declare-fun res!815540 () Bool)

(assert (=> b!1226889 (=> (not res!815540) (not e!696685))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226889 (= res!815540 (validKeyInArray!0 k!2913))))

(declare-fun b!1226890 () Bool)

(declare-fun res!815543 () Bool)

(assert (=> b!1226890 (=> (not res!815543) (not e!696685))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79211 (_ BitVec 32) List!27004) Bool)

(assert (=> b!1226890 (= res!815543 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226891 () Bool)

(declare-fun res!815542 () Bool)

(assert (=> b!1226891 (=> (not res!815542) (not e!696685))))

(declare-fun arrayContainsKey!0 (array!79211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226891 (= res!815542 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226892 () Bool)

(declare-fun res!815541 () Bool)

(assert (=> b!1226892 (=> (not res!815541) (not e!696685))))

(assert (=> b!1226892 (= res!815541 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1226893 () Bool)

(declare-fun res!815544 () Bool)

(assert (=> b!1226893 (=> (not res!815544) (not e!696685))))

(assert (=> b!1226893 (= res!815544 (not (contains!7066 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226894 () Bool)

(declare-fun res!815537 () Bool)

(assert (=> b!1226894 (=> (not res!815537) (not e!696685))))

(assert (=> b!1226894 (= res!815537 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38767 a!3806)) (bvslt from!3184 (size!38767 a!3806))))))

(declare-fun b!1226895 () Bool)

(declare-fun res!815538 () Bool)

(assert (=> b!1226895 (=> (not res!815538) (not e!696685))))

(assert (=> b!1226895 (= res!815538 (validKeyInArray!0 (select (arr!38231 a!3806) from!3184)))))

(declare-fun b!1226896 () Bool)

(assert (=> b!1226896 (= e!696685 (not (noDuplicate!1663 (Cons!27000 (select (arr!38231 a!3806) from!3184) acc!823))))))

(assert (= (and start!101872 res!815536) b!1226889))

(assert (= (and b!1226889 res!815540) b!1226894))

(assert (= (and b!1226894 res!815537) b!1226887))

(assert (= (and b!1226887 res!815539) b!1226893))

(assert (= (and b!1226893 res!815544) b!1226888))

(assert (= (and b!1226888 res!815535) b!1226891))

(assert (= (and b!1226891 res!815542) b!1226890))

(assert (= (and b!1226890 res!815543) b!1226895))

(assert (= (and b!1226895 res!815538) b!1226892))

(assert (= (and b!1226892 res!815541) b!1226896))

(declare-fun m!1131825 () Bool)

(assert (=> b!1226893 m!1131825))

(declare-fun m!1131827 () Bool)

(assert (=> b!1226888 m!1131827))

(declare-fun m!1131829 () Bool)

(assert (=> b!1226889 m!1131829))

(declare-fun m!1131831 () Bool)

(assert (=> b!1226890 m!1131831))

(declare-fun m!1131833 () Bool)

(assert (=> b!1226895 m!1131833))

(assert (=> b!1226895 m!1131833))

(declare-fun m!1131835 () Bool)

(assert (=> b!1226895 m!1131835))

(assert (=> b!1226896 m!1131833))

(declare-fun m!1131837 () Bool)

(assert (=> b!1226896 m!1131837))

(declare-fun m!1131839 () Bool)

(assert (=> b!1226891 m!1131839))

(declare-fun m!1131841 () Bool)

(assert (=> b!1226887 m!1131841))

(declare-fun m!1131843 () Bool)

(assert (=> start!101872 m!1131843))

(push 1)

(assert (not b!1226893))

(assert (not start!101872))

(assert (not b!1226895))

(assert (not b!1226888))

(assert (not b!1226891))

(assert (not b!1226896))

(assert (not b!1226890))

(assert (not b!1226887))

(assert (not b!1226889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134067 () Bool)

(declare-fun lt!558870 () Bool)

(declare-fun content!548 (List!27004) (Set (_ BitVec 64)))

(assert (=> d!134067 (= lt!558870 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!548 acc!823)))))

(declare-fun e!696722 () Bool)

(assert (=> d!134067 (= lt!558870 e!696722)))

(declare-fun res!815624 () Bool)

(assert (=> d!134067 (=> (not res!815624) (not e!696722))))

(assert (=> d!134067 (= res!815624 (is-Cons!27000 acc!823))))

(assert (=> d!134067 (= (contains!7066 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558870)))

(declare-fun b!1226982 () Bool)

(declare-fun e!696721 () Bool)

(assert (=> b!1226982 (= e!696722 e!696721)))

(declare-fun res!815625 () Bool)

(assert (=> b!1226982 (=> res!815625 e!696721)))

(assert (=> b!1226982 (= res!815625 (= (h!28209 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226983 () Bool)

(assert (=> b!1226983 (= e!696721 (contains!7066 (t!40467 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134067 res!815624) b!1226982))

(assert (= (and b!1226982 (not res!815625)) b!1226983))

(declare-fun m!1131891 () Bool)

(assert (=> d!134067 m!1131891))

(declare-fun m!1131893 () Bool)

(assert (=> d!134067 m!1131893))

(declare-fun m!1131895 () Bool)

(assert (=> b!1226983 m!1131895))

(assert (=> b!1226893 d!134067))

(declare-fun d!134073 () Bool)

(declare-fun res!815640 () Bool)

(declare-fun e!696739 () Bool)

(assert (=> d!134073 (=> res!815640 e!696739)))

(assert (=> d!134073 (= res!815640 (is-Nil!27001 acc!823))))

(assert (=> d!134073 (= (noDuplicate!1663 acc!823) e!696739)))

(declare-fun b!1227002 () Bool)

(declare-fun e!696740 () Bool)

(assert (=> b!1227002 (= e!696739 e!696740)))

(declare-fun res!815641 () Bool)

(assert (=> b!1227002 (=> (not res!815641) (not e!696740))))

(assert (=> b!1227002 (= res!815641 (not (contains!7066 (t!40467 acc!823) (h!28209 acc!823))))))

(declare-fun b!1227003 () Bool)

(assert (=> b!1227003 (= e!696740 (noDuplicate!1663 (t!40467 acc!823)))))

(assert (= (and d!134073 (not res!815640)) b!1227002))

(assert (= (and b!1227002 res!815641) b!1227003))

(declare-fun m!1131901 () Bool)

(assert (=> b!1227002 m!1131901))

(declare-fun m!1131903 () Bool)

(assert (=> b!1227003 m!1131903))

(assert (=> b!1226887 d!134073))

(declare-fun d!134077 () Bool)

(declare-fun res!815642 () Bool)

(declare-fun e!696741 () Bool)

(assert (=> d!134077 (=> res!815642 e!696741)))

(assert (=> d!134077 (= res!815642 (is-Nil!27001 (Cons!27000 (select (arr!38231 a!3806) from!3184) acc!823)))))

(assert (=> d!134077 (= (noDuplicate!1663 (Cons!27000 (select (arr!38231 a!3806) from!3184) acc!823)) e!696741)))

(declare-fun b!1227004 () Bool)

(declare-fun e!696742 () Bool)

(assert (=> b!1227004 (= e!696741 e!696742)))

(declare-fun res!815643 () Bool)

(assert (=> b!1227004 (=> (not res!815643) (not e!696742))))

(assert (=> b!1227004 (= res!815643 (not (contains!7066 (t!40467 (Cons!27000 (select (arr!38231 a!3806) from!3184) acc!823)) (h!28209 (Cons!27000 (select (arr!38231 a!3806) from!3184) acc!823)))))))

(declare-fun b!1227005 () Bool)

(assert (=> b!1227005 (= e!696742 (noDuplicate!1663 (t!40467 (Cons!27000 (select (arr!38231 a!3806) from!3184) acc!823))))))

(assert (= (and d!134077 (not res!815642)) b!1227004))

(assert (= (and b!1227004 res!815643) b!1227005))

(declare-fun m!1131905 () Bool)

(assert (=> b!1227004 m!1131905))

(declare-fun m!1131907 () Bool)

(assert (=> b!1227005 m!1131907))

(assert (=> b!1226896 d!134077))

(declare-fun d!134079 () Bool)

(declare-fun res!815657 () Bool)

(declare-fun e!696757 () Bool)

(assert (=> d!134079 (=> res!815657 e!696757)))

(assert (=> d!134079 (= res!815657 (= (select (arr!38231 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134079 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!696757)))

(declare-fun b!1227021 () Bool)

(declare-fun e!696758 () Bool)

(assert (=> b!1227021 (= e!696757 e!696758)))

(declare-fun res!815658 () Bool)

(assert (=> b!1227021 (=> (not res!815658) (not e!696758))))

(assert (=> b!1227021 (= res!815658 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38767 a!3806)))))

(declare-fun b!1227022 () Bool)

(assert (=> b!1227022 (= e!696758 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

