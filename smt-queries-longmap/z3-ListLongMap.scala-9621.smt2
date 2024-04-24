; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114052 () Bool)

(assert start!114052)

(declare-fun b!1351566 () Bool)

(declare-fun res!896244 () Bool)

(declare-fun e!768970 () Bool)

(assert (=> b!1351566 (=> (not res!896244) (not e!768970))))

(declare-datatypes ((array!92155 0))(
  ( (array!92156 (arr!44524 (Array (_ BitVec 32) (_ BitVec 64))) (size!45075 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92155)

(assert (=> b!1351566 (= res!896244 (bvsle #b00000000000000000000000000000000 (size!45075 a!3742)))))

(declare-fun b!1351567 () Bool)

(declare-fun res!896246 () Bool)

(assert (=> b!1351567 (=> (not res!896246) (not e!768970))))

(declare-datatypes ((List!31552 0))(
  ( (Nil!31549) (Cons!31548 (h!32766 (_ BitVec 64)) (t!46202 List!31552)) )
))
(declare-fun acc!759 () List!31552)

(declare-fun noDuplicate!2095 (List!31552) Bool)

(assert (=> b!1351567 (= res!896246 (noDuplicate!2095 acc!759))))

(declare-fun b!1351568 () Bool)

(declare-fun res!896247 () Bool)

(assert (=> b!1351568 (=> (not res!896247) (not e!768970))))

(declare-fun contains!9264 (List!31552 (_ BitVec 64)) Bool)

(assert (=> b!1351568 (= res!896247 (not (contains!9264 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351569 () Bool)

(assert (=> b!1351569 (= e!768970 (not (noDuplicate!2095 Nil!31549)))))

(declare-fun res!896245 () Bool)

(assert (=> start!114052 (=> (not res!896245) (not e!768970))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114052 (= res!896245 (and (bvslt (size!45075 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45075 a!3742))))))

(assert (=> start!114052 e!768970))

(declare-fun array_inv!33805 (array!92155) Bool)

(assert (=> start!114052 (array_inv!33805 a!3742)))

(assert (=> start!114052 true))

(declare-fun b!1351570 () Bool)

(declare-fun res!896243 () Bool)

(assert (=> b!1351570 (=> (not res!896243) (not e!768970))))

(assert (=> b!1351570 (= res!896243 (not (contains!9264 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114052 res!896245) b!1351567))

(assert (= (and b!1351567 res!896246) b!1351568))

(assert (= (and b!1351568 res!896247) b!1351570))

(assert (= (and b!1351570 res!896243) b!1351566))

(assert (= (and b!1351566 res!896244) b!1351569))

(declare-fun m!1239103 () Bool)

(assert (=> start!114052 m!1239103))

(declare-fun m!1239105 () Bool)

(assert (=> b!1351567 m!1239105))

(declare-fun m!1239107 () Bool)

(assert (=> b!1351568 m!1239107))

(declare-fun m!1239109 () Bool)

(assert (=> b!1351569 m!1239109))

(declare-fun m!1239111 () Bool)

(assert (=> b!1351570 m!1239111))

(check-sat (not b!1351569) (not start!114052) (not b!1351570) (not b!1351567) (not b!1351568))
(check-sat)
(get-model)

(declare-fun d!145333 () Bool)

(assert (=> d!145333 (= (array_inv!33805 a!3742) (bvsge (size!45075 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114052 d!145333))

(declare-fun d!145335 () Bool)

(declare-fun lt!597432 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!667 (List!31552) (InoxSet (_ BitVec 64)))

(assert (=> d!145335 (= lt!597432 (select (content!667 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768987 () Bool)

(assert (=> d!145335 (= lt!597432 e!768987)))

(declare-fun res!896282 () Bool)

(assert (=> d!145335 (=> (not res!896282) (not e!768987))))

(get-info :version)

(assert (=> d!145335 (= res!896282 ((_ is Cons!31548) acc!759))))

(assert (=> d!145335 (= (contains!9264 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!597432)))

(declare-fun b!1351605 () Bool)

(declare-fun e!768988 () Bool)

(assert (=> b!1351605 (= e!768987 e!768988)))

(declare-fun res!896283 () Bool)

(assert (=> b!1351605 (=> res!896283 e!768988)))

(assert (=> b!1351605 (= res!896283 (= (h!32766 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351606 () Bool)

(assert (=> b!1351606 (= e!768988 (contains!9264 (t!46202 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145335 res!896282) b!1351605))

(assert (= (and b!1351605 (not res!896283)) b!1351606))

(declare-fun m!1239133 () Bool)

(assert (=> d!145335 m!1239133))

(declare-fun m!1239135 () Bool)

(assert (=> d!145335 m!1239135))

(declare-fun m!1239137 () Bool)

(assert (=> b!1351606 m!1239137))

(assert (=> b!1351568 d!145335))

(declare-fun d!145341 () Bool)

(declare-fun res!896298 () Bool)

(declare-fun e!769003 () Bool)

(assert (=> d!145341 (=> res!896298 e!769003)))

(assert (=> d!145341 (= res!896298 ((_ is Nil!31549) acc!759))))

(assert (=> d!145341 (= (noDuplicate!2095 acc!759) e!769003)))

(declare-fun b!1351621 () Bool)

(declare-fun e!769004 () Bool)

(assert (=> b!1351621 (= e!769003 e!769004)))

(declare-fun res!896299 () Bool)

(assert (=> b!1351621 (=> (not res!896299) (not e!769004))))

(assert (=> b!1351621 (= res!896299 (not (contains!9264 (t!46202 acc!759) (h!32766 acc!759))))))

(declare-fun b!1351622 () Bool)

(assert (=> b!1351622 (= e!769004 (noDuplicate!2095 (t!46202 acc!759)))))

(assert (= (and d!145341 (not res!896298)) b!1351621))

(assert (= (and b!1351621 res!896299) b!1351622))

(declare-fun m!1239145 () Bool)

(assert (=> b!1351621 m!1239145))

(declare-fun m!1239147 () Bool)

(assert (=> b!1351622 m!1239147))

(assert (=> b!1351567 d!145341))

(declare-fun d!145347 () Bool)

(declare-fun res!896302 () Bool)

(declare-fun e!769007 () Bool)

(assert (=> d!145347 (=> res!896302 e!769007)))

(assert (=> d!145347 (= res!896302 ((_ is Nil!31549) Nil!31549))))

(assert (=> d!145347 (= (noDuplicate!2095 Nil!31549) e!769007)))

(declare-fun b!1351625 () Bool)

(declare-fun e!769008 () Bool)

(assert (=> b!1351625 (= e!769007 e!769008)))

(declare-fun res!896303 () Bool)

(assert (=> b!1351625 (=> (not res!896303) (not e!769008))))

(assert (=> b!1351625 (= res!896303 (not (contains!9264 (t!46202 Nil!31549) (h!32766 Nil!31549))))))

(declare-fun b!1351626 () Bool)

(assert (=> b!1351626 (= e!769008 (noDuplicate!2095 (t!46202 Nil!31549)))))

(assert (= (and d!145347 (not res!896302)) b!1351625))

(assert (= (and b!1351625 res!896303) b!1351626))

(declare-fun m!1239155 () Bool)

(assert (=> b!1351625 m!1239155))

(declare-fun m!1239157 () Bool)

(assert (=> b!1351626 m!1239157))

(assert (=> b!1351569 d!145347))

(declare-fun d!145351 () Bool)

(declare-fun lt!597440 () Bool)

(assert (=> d!145351 (= lt!597440 (select (content!667 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!769011 () Bool)

(assert (=> d!145351 (= lt!597440 e!769011)))

(declare-fun res!896306 () Bool)

(assert (=> d!145351 (=> (not res!896306) (not e!769011))))

(assert (=> d!145351 (= res!896306 ((_ is Cons!31548) acc!759))))

(assert (=> d!145351 (= (contains!9264 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!597440)))

(declare-fun b!1351629 () Bool)

(declare-fun e!769012 () Bool)

(assert (=> b!1351629 (= e!769011 e!769012)))

(declare-fun res!896307 () Bool)

(assert (=> b!1351629 (=> res!896307 e!769012)))

(assert (=> b!1351629 (= res!896307 (= (h!32766 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351630 () Bool)

(assert (=> b!1351630 (= e!769012 (contains!9264 (t!46202 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145351 res!896306) b!1351629))

(assert (= (and b!1351629 (not res!896307)) b!1351630))

(assert (=> d!145351 m!1239133))

(declare-fun m!1239163 () Bool)

(assert (=> d!145351 m!1239163))

(declare-fun m!1239165 () Bool)

(assert (=> b!1351630 m!1239165))

(assert (=> b!1351570 d!145351))

(check-sat (not b!1351622) (not d!145351) (not b!1351625) (not b!1351626) (not b!1351621) (not b!1351606) (not b!1351630) (not d!145335))
(check-sat)
