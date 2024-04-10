; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103858 () Bool)

(assert start!103858)

(declare-fun res!828960 () Bool)

(declare-fun e!704825 () Bool)

(assert (=> start!103858 (=> (not res!828960) (not e!704825))))

(declare-datatypes ((array!79965 0))(
  ( (array!79966 (arr!38577 (Array (_ BitVec 32) (_ BitVec 64))) (size!39113 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79965)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103858 (= res!828960 (and (bvslt (size!39113 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39113 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39113 a!3892))))))

(assert (=> start!103858 e!704825))

(declare-fun array_inv!29425 (array!79965) Bool)

(assert (=> start!103858 (array_inv!29425 a!3892)))

(assert (=> start!103858 true))

(declare-fun b!1243182 () Bool)

(declare-fun res!828961 () Bool)

(assert (=> b!1243182 (=> (not res!828961) (not e!704825))))

(declare-datatypes ((List!27380 0))(
  ( (Nil!27377) (Cons!27376 (h!28585 (_ BitVec 64)) (t!40849 List!27380)) )
))
(declare-fun noDuplicate!1979 (List!27380) Bool)

(assert (=> b!1243182 (= res!828961 (noDuplicate!1979 Nil!27377))))

(declare-fun b!1243183 () Bool)

(declare-fun e!704824 () Bool)

(assert (=> b!1243183 (= e!704825 e!704824)))

(declare-fun res!828959 () Bool)

(assert (=> b!1243183 (=> res!828959 e!704824)))

(declare-fun contains!7401 (List!27380 (_ BitVec 64)) Bool)

(assert (=> b!1243183 (= res!828959 (contains!7401 Nil!27377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243184 () Bool)

(assert (=> b!1243184 (= e!704824 (contains!7401 Nil!27377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103858 res!828960) b!1243182))

(assert (= (and b!1243182 res!828961) b!1243183))

(assert (= (and b!1243183 (not res!828959)) b!1243184))

(declare-fun m!1145809 () Bool)

(assert (=> start!103858 m!1145809))

(declare-fun m!1145811 () Bool)

(assert (=> b!1243182 m!1145811))

(declare-fun m!1145813 () Bool)

(assert (=> b!1243183 m!1145813))

(declare-fun m!1145815 () Bool)

(assert (=> b!1243184 m!1145815))

(check-sat (not b!1243184) (not start!103858) (not b!1243182) (not b!1243183))
(check-sat)
(get-model)

(declare-fun d!137065 () Bool)

(declare-fun lt!562322 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!609 (List!27380) (InoxSet (_ BitVec 64)))

(assert (=> d!137065 (= lt!562322 (select (content!609 Nil!27377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!704841 () Bool)

(assert (=> d!137065 (= lt!562322 e!704841)))

(declare-fun res!828976 () Bool)

(assert (=> d!137065 (=> (not res!828976) (not e!704841))))

(get-info :version)

(assert (=> d!137065 (= res!828976 ((_ is Cons!27376) Nil!27377))))

(assert (=> d!137065 (= (contains!7401 Nil!27377 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562322)))

(declare-fun b!1243198 () Bool)

(declare-fun e!704840 () Bool)

(assert (=> b!1243198 (= e!704841 e!704840)))

(declare-fun res!828975 () Bool)

(assert (=> b!1243198 (=> res!828975 e!704840)))

(assert (=> b!1243198 (= res!828975 (= (h!28585 Nil!27377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243199 () Bool)

(assert (=> b!1243199 (= e!704840 (contains!7401 (t!40849 Nil!27377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137065 res!828976) b!1243198))

(assert (= (and b!1243198 (not res!828975)) b!1243199))

(declare-fun m!1145825 () Bool)

(assert (=> d!137065 m!1145825))

(declare-fun m!1145827 () Bool)

(assert (=> d!137065 m!1145827))

(declare-fun m!1145829 () Bool)

(assert (=> b!1243199 m!1145829))

(assert (=> b!1243184 d!137065))

(declare-fun d!137069 () Bool)

(assert (=> d!137069 (= (array_inv!29425 a!3892) (bvsge (size!39113 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103858 d!137069))

(declare-fun d!137071 () Bool)

(declare-fun res!828995 () Bool)

(declare-fun e!704860 () Bool)

(assert (=> d!137071 (=> res!828995 e!704860)))

(assert (=> d!137071 (= res!828995 ((_ is Nil!27377) Nil!27377))))

(assert (=> d!137071 (= (noDuplicate!1979 Nil!27377) e!704860)))

(declare-fun b!1243218 () Bool)

(declare-fun e!704861 () Bool)

(assert (=> b!1243218 (= e!704860 e!704861)))

(declare-fun res!828996 () Bool)

(assert (=> b!1243218 (=> (not res!828996) (not e!704861))))

(assert (=> b!1243218 (= res!828996 (not (contains!7401 (t!40849 Nil!27377) (h!28585 Nil!27377))))))

(declare-fun b!1243219 () Bool)

(assert (=> b!1243219 (= e!704861 (noDuplicate!1979 (t!40849 Nil!27377)))))

(assert (= (and d!137071 (not res!828995)) b!1243218))

(assert (= (and b!1243218 res!828996) b!1243219))

(declare-fun m!1145845 () Bool)

(assert (=> b!1243218 m!1145845))

(declare-fun m!1145847 () Bool)

(assert (=> b!1243219 m!1145847))

(assert (=> b!1243182 d!137071))

(declare-fun d!137079 () Bool)

(declare-fun lt!562327 () Bool)

(assert (=> d!137079 (= lt!562327 (select (content!609 Nil!27377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!704863 () Bool)

(assert (=> d!137079 (= lt!562327 e!704863)))

(declare-fun res!828998 () Bool)

(assert (=> d!137079 (=> (not res!828998) (not e!704863))))

(assert (=> d!137079 (= res!828998 ((_ is Cons!27376) Nil!27377))))

(assert (=> d!137079 (= (contains!7401 Nil!27377 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562327)))

(declare-fun b!1243220 () Bool)

(declare-fun e!704862 () Bool)

(assert (=> b!1243220 (= e!704863 e!704862)))

(declare-fun res!828997 () Bool)

(assert (=> b!1243220 (=> res!828997 e!704862)))

(assert (=> b!1243220 (= res!828997 (= (h!28585 Nil!27377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243221 () Bool)

(assert (=> b!1243221 (= e!704862 (contains!7401 (t!40849 Nil!27377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137079 res!828998) b!1243220))

(assert (= (and b!1243220 (not res!828997)) b!1243221))

(assert (=> d!137079 m!1145825))

(declare-fun m!1145849 () Bool)

(assert (=> d!137079 m!1145849))

(declare-fun m!1145851 () Bool)

(assert (=> b!1243221 m!1145851))

(assert (=> b!1243183 d!137079))

(check-sat (not b!1243221) (not b!1243219) (not d!137065) (not d!137079) (not b!1243218) (not b!1243199))
(check-sat)
