; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134598 () Bool)

(assert start!134598)

(declare-fun b!1570187 () Bool)

(declare-fun res!1072303 () Bool)

(declare-fun e!875437 () Bool)

(assert (=> b!1570187 (=> (not res!1072303) (not e!875437))))

(declare-datatypes ((List!36706 0))(
  ( (Nil!36703) (Cons!36702 (h!38167 (_ BitVec 64)) (t!51606 List!36706)) )
))
(declare-fun acc!619 () List!36706)

(declare-fun contains!10421 (List!36706 (_ BitVec 64)) Bool)

(assert (=> b!1570187 (= res!1072303 (not (contains!10421 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570188 () Bool)

(declare-fun e!875438 () Bool)

(assert (=> b!1570188 (= e!875437 e!875438)))

(declare-fun res!1072304 () Bool)

(assert (=> b!1570188 (=> (not res!1072304) (not e!875438))))

(declare-fun e!875435 () Bool)

(assert (=> b!1570188 (= res!1072304 e!875435)))

(declare-fun res!1072302 () Bool)

(assert (=> b!1570188 (=> res!1072302 e!875435)))

(declare-fun lt!673950 () Bool)

(assert (=> b!1570188 (= res!1072302 lt!673950)))

(declare-datatypes ((array!104840 0))(
  ( (array!104841 (arr!50596 (Array (_ BitVec 32) (_ BitVec 64))) (size!51147 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104840)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570188 (= lt!673950 (not (validKeyInArray!0 (select (arr!50596 a!3481) from!2856))))))

(declare-fun b!1570189 () Bool)

(declare-fun noDuplicate!2669 (List!36706) Bool)

(assert (=> b!1570189 (= e!875438 (not (noDuplicate!2669 (Cons!36702 (select (arr!50596 a!3481) from!2856) acc!619))))))

(declare-fun b!1570190 () Bool)

(declare-fun res!1072299 () Bool)

(assert (=> b!1570190 (=> (not res!1072299) (not e!875437))))

(assert (=> b!1570190 (= res!1072299 (bvslt from!2856 (size!51147 a!3481)))))

(declare-fun b!1570191 () Bool)

(declare-fun res!1072297 () Bool)

(assert (=> b!1570191 (=> (not res!1072297) (not e!875438))))

(assert (=> b!1570191 (= res!1072297 (and (not lt!673950) (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun res!1072298 () Bool)

(assert (=> start!134598 (=> (not res!1072298) (not e!875437))))

(assert (=> start!134598 (= res!1072298 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51147 a!3481)) (bvslt (size!51147 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134598 e!875437))

(assert (=> start!134598 true))

(declare-fun array_inv!39551 (array!104840) Bool)

(assert (=> start!134598 (array_inv!39551 a!3481)))

(declare-fun b!1570192 () Bool)

(declare-fun res!1072301 () Bool)

(assert (=> b!1570192 (=> (not res!1072301) (not e!875437))))

(assert (=> b!1570192 (= res!1072301 (noDuplicate!2669 acc!619))))

(declare-fun b!1570193 () Bool)

(declare-fun res!1072300 () Bool)

(assert (=> b!1570193 (=> (not res!1072300) (not e!875437))))

(assert (=> b!1570193 (= res!1072300 (not (contains!10421 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570194 () Bool)

(assert (=> b!1570194 (= e!875435 (not (contains!10421 acc!619 (select (arr!50596 a!3481) from!2856))))))

(assert (= (and start!134598 res!1072298) b!1570192))

(assert (= (and b!1570192 res!1072301) b!1570187))

(assert (= (and b!1570187 res!1072303) b!1570193))

(assert (= (and b!1570193 res!1072300) b!1570190))

(assert (= (and b!1570190 res!1072299) b!1570188))

(assert (= (and b!1570188 (not res!1072302)) b!1570194))

(assert (= (and b!1570188 res!1072304) b!1570191))

(assert (= (and b!1570191 res!1072297) b!1570189))

(declare-fun m!1444779 () Bool)

(assert (=> b!1570188 m!1444779))

(assert (=> b!1570188 m!1444779))

(declare-fun m!1444781 () Bool)

(assert (=> b!1570188 m!1444781))

(assert (=> b!1570194 m!1444779))

(assert (=> b!1570194 m!1444779))

(declare-fun m!1444783 () Bool)

(assert (=> b!1570194 m!1444783))

(declare-fun m!1444785 () Bool)

(assert (=> start!134598 m!1444785))

(declare-fun m!1444787 () Bool)

(assert (=> b!1570193 m!1444787))

(declare-fun m!1444789 () Bool)

(assert (=> b!1570192 m!1444789))

(assert (=> b!1570189 m!1444779))

(declare-fun m!1444791 () Bool)

(assert (=> b!1570189 m!1444791))

(declare-fun m!1444793 () Bool)

(assert (=> b!1570187 m!1444793))

(check-sat (not b!1570189) (not b!1570193) (not b!1570188) (not start!134598) (not b!1570187) (not b!1570194) (not b!1570192))
(check-sat)
(get-model)

(declare-fun d!164333 () Bool)

(assert (=> d!164333 (= (array_inv!39551 a!3481) (bvsge (size!51147 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134598 d!164333))

(declare-fun d!164335 () Bool)

(declare-fun res!1072357 () Bool)

(declare-fun e!875467 () Bool)

(assert (=> d!164335 (=> res!1072357 e!875467)))

(get-info :version)

(assert (=> d!164335 (= res!1072357 ((_ is Nil!36703) (Cons!36702 (select (arr!50596 a!3481) from!2856) acc!619)))))

(assert (=> d!164335 (= (noDuplicate!2669 (Cons!36702 (select (arr!50596 a!3481) from!2856) acc!619)) e!875467)))

(declare-fun b!1570247 () Bool)

(declare-fun e!875468 () Bool)

(assert (=> b!1570247 (= e!875467 e!875468)))

(declare-fun res!1072358 () Bool)

(assert (=> b!1570247 (=> (not res!1072358) (not e!875468))))

(assert (=> b!1570247 (= res!1072358 (not (contains!10421 (t!51606 (Cons!36702 (select (arr!50596 a!3481) from!2856) acc!619)) (h!38167 (Cons!36702 (select (arr!50596 a!3481) from!2856) acc!619)))))))

(declare-fun b!1570248 () Bool)

(assert (=> b!1570248 (= e!875468 (noDuplicate!2669 (t!51606 (Cons!36702 (select (arr!50596 a!3481) from!2856) acc!619))))))

(assert (= (and d!164335 (not res!1072357)) b!1570247))

(assert (= (and b!1570247 res!1072358) b!1570248))

(declare-fun m!1444827 () Bool)

(assert (=> b!1570247 m!1444827))

(declare-fun m!1444829 () Bool)

(assert (=> b!1570248 m!1444829))

(assert (=> b!1570189 d!164335))

(declare-fun d!164337 () Bool)

(declare-fun lt!673959 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!801 (List!36706) (InoxSet (_ BitVec 64)))

(assert (=> d!164337 (= lt!673959 (select (content!801 acc!619) (select (arr!50596 a!3481) from!2856)))))

(declare-fun e!875473 () Bool)

(assert (=> d!164337 (= lt!673959 e!875473)))

(declare-fun res!1072364 () Bool)

(assert (=> d!164337 (=> (not res!1072364) (not e!875473))))

(assert (=> d!164337 (= res!1072364 ((_ is Cons!36702) acc!619))))

(assert (=> d!164337 (= (contains!10421 acc!619 (select (arr!50596 a!3481) from!2856)) lt!673959)))

(declare-fun b!1570253 () Bool)

(declare-fun e!875474 () Bool)

(assert (=> b!1570253 (= e!875473 e!875474)))

(declare-fun res!1072363 () Bool)

(assert (=> b!1570253 (=> res!1072363 e!875474)))

(assert (=> b!1570253 (= res!1072363 (= (h!38167 acc!619) (select (arr!50596 a!3481) from!2856)))))

(declare-fun b!1570254 () Bool)

(assert (=> b!1570254 (= e!875474 (contains!10421 (t!51606 acc!619) (select (arr!50596 a!3481) from!2856)))))

(assert (= (and d!164337 res!1072364) b!1570253))

(assert (= (and b!1570253 (not res!1072363)) b!1570254))

(declare-fun m!1444831 () Bool)

(assert (=> d!164337 m!1444831))

(assert (=> d!164337 m!1444779))

(declare-fun m!1444833 () Bool)

(assert (=> d!164337 m!1444833))

(assert (=> b!1570254 m!1444779))

(declare-fun m!1444835 () Bool)

(assert (=> b!1570254 m!1444835))

(assert (=> b!1570194 d!164337))

(declare-fun d!164343 () Bool)

(assert (=> d!164343 (= (validKeyInArray!0 (select (arr!50596 a!3481) from!2856)) (and (not (= (select (arr!50596 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50596 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1570188 d!164343))

(declare-fun d!164345 () Bool)

(declare-fun lt!673962 () Bool)

(assert (=> d!164345 (= lt!673962 (select (content!801 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!875479 () Bool)

(assert (=> d!164345 (= lt!673962 e!875479)))

(declare-fun res!1072370 () Bool)

(assert (=> d!164345 (=> (not res!1072370) (not e!875479))))

(assert (=> d!164345 (= res!1072370 ((_ is Cons!36702) acc!619))))

(assert (=> d!164345 (= (contains!10421 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673962)))

(declare-fun b!1570259 () Bool)

(declare-fun e!875480 () Bool)

(assert (=> b!1570259 (= e!875479 e!875480)))

(declare-fun res!1072369 () Bool)

(assert (=> b!1570259 (=> res!1072369 e!875480)))

(assert (=> b!1570259 (= res!1072369 (= (h!38167 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570260 () Bool)

(assert (=> b!1570260 (= e!875480 (contains!10421 (t!51606 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164345 res!1072370) b!1570259))

(assert (= (and b!1570259 (not res!1072369)) b!1570260))

(assert (=> d!164345 m!1444831))

(declare-fun m!1444837 () Bool)

(assert (=> d!164345 m!1444837))

(declare-fun m!1444839 () Bool)

(assert (=> b!1570260 m!1444839))

(assert (=> b!1570193 d!164345))

(declare-fun d!164347 () Bool)

(declare-fun lt!673965 () Bool)

(assert (=> d!164347 (= lt!673965 (select (content!801 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!875485 () Bool)

(assert (=> d!164347 (= lt!673965 e!875485)))

(declare-fun res!1072376 () Bool)

(assert (=> d!164347 (=> (not res!1072376) (not e!875485))))

(assert (=> d!164347 (= res!1072376 ((_ is Cons!36702) acc!619))))

(assert (=> d!164347 (= (contains!10421 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673965)))

(declare-fun b!1570265 () Bool)

(declare-fun e!875486 () Bool)

(assert (=> b!1570265 (= e!875485 e!875486)))

(declare-fun res!1072375 () Bool)

(assert (=> b!1570265 (=> res!1072375 e!875486)))

(assert (=> b!1570265 (= res!1072375 (= (h!38167 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1570266 () Bool)

(assert (=> b!1570266 (= e!875486 (contains!10421 (t!51606 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164347 res!1072376) b!1570265))

(assert (= (and b!1570265 (not res!1072375)) b!1570266))

(assert (=> d!164347 m!1444831))

(declare-fun m!1444841 () Bool)

(assert (=> d!164347 m!1444841))

(declare-fun m!1444843 () Bool)

(assert (=> b!1570266 m!1444843))

(assert (=> b!1570187 d!164347))

(declare-fun d!164349 () Bool)

(declare-fun res!1072377 () Bool)

(declare-fun e!875487 () Bool)

(assert (=> d!164349 (=> res!1072377 e!875487)))

(assert (=> d!164349 (= res!1072377 ((_ is Nil!36703) acc!619))))

(assert (=> d!164349 (= (noDuplicate!2669 acc!619) e!875487)))

(declare-fun b!1570267 () Bool)

(declare-fun e!875488 () Bool)

(assert (=> b!1570267 (= e!875487 e!875488)))

(declare-fun res!1072378 () Bool)

(assert (=> b!1570267 (=> (not res!1072378) (not e!875488))))

(assert (=> b!1570267 (= res!1072378 (not (contains!10421 (t!51606 acc!619) (h!38167 acc!619))))))

(declare-fun b!1570268 () Bool)

(assert (=> b!1570268 (= e!875488 (noDuplicate!2669 (t!51606 acc!619)))))

(assert (= (and d!164349 (not res!1072377)) b!1570267))

(assert (= (and b!1570267 res!1072378) b!1570268))

(declare-fun m!1444845 () Bool)

(assert (=> b!1570267 m!1444845))

(declare-fun m!1444847 () Bool)

(assert (=> b!1570268 m!1444847))

(assert (=> b!1570192 d!164349))

(check-sat (not b!1570267) (not b!1570268) (not b!1570266) (not d!164345) (not b!1570248) (not b!1570254) (not d!164337) (not d!164347) (not b!1570247) (not b!1570260))
(check-sat)
