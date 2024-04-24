; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114076 () Bool)

(assert start!114076)

(declare-fun b!1351663 () Bool)

(declare-fun res!896340 () Bool)

(declare-fun e!769038 () Bool)

(assert (=> b!1351663 (=> (not res!896340) (not e!769038))))

(declare-datatypes ((array!92164 0))(
  ( (array!92165 (arr!44527 (Array (_ BitVec 32) (_ BitVec 64))) (size!45078 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92164)

(assert (=> b!1351663 (= res!896340 (bvsle #b00000000000000000000000000000000 (size!45078 a!3742)))))

(declare-fun b!1351664 () Bool)

(declare-fun e!769039 () Bool)

(declare-datatypes ((List!31555 0))(
  ( (Nil!31552) (Cons!31551 (h!32769 (_ BitVec 64)) (t!46205 List!31555)) )
))
(declare-fun contains!9267 (List!31555 (_ BitVec 64)) Bool)

(assert (=> b!1351664 (= e!769039 (contains!9267 Nil!31552 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351665 () Bool)

(declare-fun res!896342 () Bool)

(assert (=> b!1351665 (=> (not res!896342) (not e!769038))))

(declare-fun acc!759 () List!31555)

(assert (=> b!1351665 (= res!896342 (not (contains!9267 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351666 () Bool)

(declare-fun res!896346 () Bool)

(assert (=> b!1351666 (=> (not res!896346) (not e!769038))))

(declare-fun noDuplicate!2098 (List!31555) Bool)

(assert (=> b!1351666 (= res!896346 (noDuplicate!2098 Nil!31552))))

(declare-fun b!1351667 () Bool)

(declare-fun res!896343 () Bool)

(assert (=> b!1351667 (=> (not res!896343) (not e!769038))))

(assert (=> b!1351667 (= res!896343 (not (contains!9267 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896341 () Bool)

(assert (=> start!114076 (=> (not res!896341) (not e!769038))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114076 (= res!896341 (and (bvslt (size!45078 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45078 a!3742))))))

(assert (=> start!114076 e!769038))

(declare-fun array_inv!33808 (array!92164) Bool)

(assert (=> start!114076 (array_inv!33808 a!3742)))

(assert (=> start!114076 true))

(declare-fun b!1351668 () Bool)

(assert (=> b!1351668 (= e!769038 e!769039)))

(declare-fun res!896345 () Bool)

(assert (=> b!1351668 (=> res!896345 e!769039)))

(assert (=> b!1351668 (= res!896345 (contains!9267 Nil!31552 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351669 () Bool)

(declare-fun res!896344 () Bool)

(assert (=> b!1351669 (=> (not res!896344) (not e!769038))))

(assert (=> b!1351669 (= res!896344 (noDuplicate!2098 acc!759))))

(assert (= (and start!114076 res!896341) b!1351669))

(assert (= (and b!1351669 res!896344) b!1351667))

(assert (= (and b!1351667 res!896343) b!1351665))

(assert (= (and b!1351665 res!896342) b!1351663))

(assert (= (and b!1351663 res!896340) b!1351666))

(assert (= (and b!1351666 res!896346) b!1351668))

(assert (= (and b!1351668 (not res!896345)) b!1351664))

(declare-fun m!1239187 () Bool)

(assert (=> b!1351664 m!1239187))

(declare-fun m!1239189 () Bool)

(assert (=> b!1351666 m!1239189))

(declare-fun m!1239191 () Bool)

(assert (=> b!1351669 m!1239191))

(declare-fun m!1239193 () Bool)

(assert (=> b!1351668 m!1239193))

(declare-fun m!1239195 () Bool)

(assert (=> b!1351665 m!1239195))

(declare-fun m!1239197 () Bool)

(assert (=> start!114076 m!1239197))

(declare-fun m!1239199 () Bool)

(assert (=> b!1351667 m!1239199))

(check-sat (not b!1351665) (not b!1351667) (not b!1351664) (not start!114076) (not b!1351669) (not b!1351666) (not b!1351668))
(check-sat)
(get-model)

(declare-fun d!145365 () Bool)

(declare-fun lt!597444 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!670 (List!31555) (InoxSet (_ BitVec 64)))

(assert (=> d!145365 (= lt!597444 (select (content!670 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!769063 () Bool)

(assert (=> d!145365 (= lt!597444 e!769063)))

(declare-fun res!896394 () Bool)

(assert (=> d!145365 (=> (not res!896394) (not e!769063))))

(get-info :version)

(assert (=> d!145365 (= res!896394 ((_ is Cons!31551) acc!759))))

(assert (=> d!145365 (= (contains!9267 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!597444)))

(declare-fun b!1351716 () Bool)

(declare-fun e!769062 () Bool)

(assert (=> b!1351716 (= e!769063 e!769062)))

(declare-fun res!896393 () Bool)

(assert (=> b!1351716 (=> res!896393 e!769062)))

(assert (=> b!1351716 (= res!896393 (= (h!32769 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351717 () Bool)

(assert (=> b!1351717 (= e!769062 (contains!9267 (t!46205 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145365 res!896394) b!1351716))

(assert (= (and b!1351716 (not res!896393)) b!1351717))

(declare-fun m!1239229 () Bool)

(assert (=> d!145365 m!1239229))

(declare-fun m!1239231 () Bool)

(assert (=> d!145365 m!1239231))

(declare-fun m!1239233 () Bool)

(assert (=> b!1351717 m!1239233))

(assert (=> b!1351667 d!145365))

(declare-fun d!145367 () Bool)

(declare-fun lt!597445 () Bool)

(assert (=> d!145367 (= lt!597445 (select (content!670 Nil!31552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!769065 () Bool)

(assert (=> d!145367 (= lt!597445 e!769065)))

(declare-fun res!896396 () Bool)

(assert (=> d!145367 (=> (not res!896396) (not e!769065))))

(assert (=> d!145367 (= res!896396 ((_ is Cons!31551) Nil!31552))))

(assert (=> d!145367 (= (contains!9267 Nil!31552 #b0000000000000000000000000000000000000000000000000000000000000000) lt!597445)))

(declare-fun b!1351718 () Bool)

(declare-fun e!769064 () Bool)

(assert (=> b!1351718 (= e!769065 e!769064)))

(declare-fun res!896395 () Bool)

(assert (=> b!1351718 (=> res!896395 e!769064)))

(assert (=> b!1351718 (= res!896395 (= (h!32769 Nil!31552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351719 () Bool)

(assert (=> b!1351719 (= e!769064 (contains!9267 (t!46205 Nil!31552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145367 res!896396) b!1351718))

(assert (= (and b!1351718 (not res!896395)) b!1351719))

(declare-fun m!1239235 () Bool)

(assert (=> d!145367 m!1239235))

(declare-fun m!1239237 () Bool)

(assert (=> d!145367 m!1239237))

(declare-fun m!1239239 () Bool)

(assert (=> b!1351719 m!1239239))

(assert (=> b!1351668 d!145367))

(declare-fun d!145369 () Bool)

(declare-fun res!896401 () Bool)

(declare-fun e!769070 () Bool)

(assert (=> d!145369 (=> res!896401 e!769070)))

(assert (=> d!145369 (= res!896401 ((_ is Nil!31552) acc!759))))

(assert (=> d!145369 (= (noDuplicate!2098 acc!759) e!769070)))

(declare-fun b!1351724 () Bool)

(declare-fun e!769071 () Bool)

(assert (=> b!1351724 (= e!769070 e!769071)))

(declare-fun res!896402 () Bool)

(assert (=> b!1351724 (=> (not res!896402) (not e!769071))))

(assert (=> b!1351724 (= res!896402 (not (contains!9267 (t!46205 acc!759) (h!32769 acc!759))))))

(declare-fun b!1351725 () Bool)

(assert (=> b!1351725 (= e!769071 (noDuplicate!2098 (t!46205 acc!759)))))

(assert (= (and d!145369 (not res!896401)) b!1351724))

(assert (= (and b!1351724 res!896402) b!1351725))

(declare-fun m!1239241 () Bool)

(assert (=> b!1351724 m!1239241))

(declare-fun m!1239243 () Bool)

(assert (=> b!1351725 m!1239243))

(assert (=> b!1351669 d!145369))

(declare-fun d!145375 () Bool)

(declare-fun lt!597446 () Bool)

(assert (=> d!145375 (= lt!597446 (select (content!670 Nil!31552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!769073 () Bool)

(assert (=> d!145375 (= lt!597446 e!769073)))

(declare-fun res!896404 () Bool)

(assert (=> d!145375 (=> (not res!896404) (not e!769073))))

(assert (=> d!145375 (= res!896404 ((_ is Cons!31551) Nil!31552))))

(assert (=> d!145375 (= (contains!9267 Nil!31552 #b1000000000000000000000000000000000000000000000000000000000000000) lt!597446)))

(declare-fun b!1351726 () Bool)

(declare-fun e!769072 () Bool)

(assert (=> b!1351726 (= e!769073 e!769072)))

(declare-fun res!896403 () Bool)

(assert (=> b!1351726 (=> res!896403 e!769072)))

(assert (=> b!1351726 (= res!896403 (= (h!32769 Nil!31552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351727 () Bool)

(assert (=> b!1351727 (= e!769072 (contains!9267 (t!46205 Nil!31552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145375 res!896404) b!1351726))

(assert (= (and b!1351726 (not res!896403)) b!1351727))

(assert (=> d!145375 m!1239235))

(declare-fun m!1239245 () Bool)

(assert (=> d!145375 m!1239245))

(declare-fun m!1239247 () Bool)

(assert (=> b!1351727 m!1239247))

(assert (=> b!1351664 d!145375))

(declare-fun d!145377 () Bool)

(declare-fun lt!597447 () Bool)

(assert (=> d!145377 (= lt!597447 (select (content!670 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!769079 () Bool)

(assert (=> d!145377 (= lt!597447 e!769079)))

(declare-fun res!896410 () Bool)

(assert (=> d!145377 (=> (not res!896410) (not e!769079))))

(assert (=> d!145377 (= res!896410 ((_ is Cons!31551) acc!759))))

(assert (=> d!145377 (= (contains!9267 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!597447)))

(declare-fun b!1351732 () Bool)

(declare-fun e!769078 () Bool)

(assert (=> b!1351732 (= e!769079 e!769078)))

(declare-fun res!896409 () Bool)

(assert (=> b!1351732 (=> res!896409 e!769078)))

(assert (=> b!1351732 (= res!896409 (= (h!32769 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351733 () Bool)

(assert (=> b!1351733 (= e!769078 (contains!9267 (t!46205 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145377 res!896410) b!1351732))

(assert (= (and b!1351732 (not res!896409)) b!1351733))

(assert (=> d!145377 m!1239229))

(declare-fun m!1239249 () Bool)

(assert (=> d!145377 m!1239249))

(declare-fun m!1239251 () Bool)

(assert (=> b!1351733 m!1239251))

(assert (=> b!1351665 d!145377))

(declare-fun d!145379 () Bool)

(assert (=> d!145379 (= (array_inv!33808 a!3742) (bvsge (size!45078 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114076 d!145379))

(declare-fun d!145381 () Bool)

(declare-fun res!896417 () Bool)

(declare-fun e!769086 () Bool)

(assert (=> d!145381 (=> res!896417 e!769086)))

(assert (=> d!145381 (= res!896417 ((_ is Nil!31552) Nil!31552))))

(assert (=> d!145381 (= (noDuplicate!2098 Nil!31552) e!769086)))

(declare-fun b!1351740 () Bool)

(declare-fun e!769087 () Bool)

(assert (=> b!1351740 (= e!769086 e!769087)))

(declare-fun res!896418 () Bool)

(assert (=> b!1351740 (=> (not res!896418) (not e!769087))))

(assert (=> b!1351740 (= res!896418 (not (contains!9267 (t!46205 Nil!31552) (h!32769 Nil!31552))))))

(declare-fun b!1351741 () Bool)

(assert (=> b!1351741 (= e!769087 (noDuplicate!2098 (t!46205 Nil!31552)))))

(assert (= (and d!145381 (not res!896417)) b!1351740))

(assert (= (and b!1351740 res!896418) b!1351741))

(declare-fun m!1239255 () Bool)

(assert (=> b!1351740 m!1239255))

(declare-fun m!1239259 () Bool)

(assert (=> b!1351741 m!1239259))

(assert (=> b!1351666 d!145381))

(check-sat (not d!145367) (not b!1351725) (not b!1351741) (not b!1351724) (not d!145377) (not b!1351719) (not d!145365) (not b!1351733) (not d!145375) (not b!1351717) (not b!1351740) (not b!1351727))
(check-sat)
