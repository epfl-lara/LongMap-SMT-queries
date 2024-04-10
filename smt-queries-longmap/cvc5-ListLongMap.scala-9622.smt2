; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113852 () Bool)

(assert start!113852)

(declare-fun res!895823 () Bool)

(declare-fun e!768196 () Bool)

(assert (=> start!113852 (=> (not res!895823) (not e!768196))))

(declare-datatypes ((array!92049 0))(
  ( (array!92050 (arr!44474 (Array (_ BitVec 32) (_ BitVec 64))) (size!45024 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92049)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113852 (= res!895823 (and (bvslt (size!45024 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45024 a!3742))))))

(assert (=> start!113852 e!768196))

(declare-fun array_inv!33502 (array!92049) Bool)

(assert (=> start!113852 (array_inv!33502 a!3742)))

(assert (=> start!113852 true))

(declare-fun b!1350364 () Bool)

(declare-fun e!768195 () Bool)

(assert (=> b!1350364 (= e!768196 e!768195)))

(declare-fun res!895828 () Bool)

(assert (=> b!1350364 (=> res!895828 e!768195)))

(declare-datatypes ((List!31515 0))(
  ( (Nil!31512) (Cons!31511 (h!32720 (_ BitVec 64)) (t!46173 List!31515)) )
))
(declare-fun contains!9224 (List!31515 (_ BitVec 64)) Bool)

(assert (=> b!1350364 (= res!895828 (contains!9224 Nil!31512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350365 () Bool)

(declare-fun res!895825 () Bool)

(assert (=> b!1350365 (=> (not res!895825) (not e!768196))))

(assert (=> b!1350365 (= res!895825 (bvsle #b00000000000000000000000000000000 (size!45024 a!3742)))))

(declare-fun b!1350366 () Bool)

(declare-fun res!895822 () Bool)

(assert (=> b!1350366 (=> (not res!895822) (not e!768196))))

(declare-fun acc!759 () List!31515)

(assert (=> b!1350366 (= res!895822 (not (contains!9224 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350367 () Bool)

(declare-fun res!895827 () Bool)

(assert (=> b!1350367 (=> (not res!895827) (not e!768196))))

(declare-fun noDuplicate!2081 (List!31515) Bool)

(assert (=> b!1350367 (= res!895827 (noDuplicate!2081 Nil!31512))))

(declare-fun b!1350368 () Bool)

(declare-fun res!895826 () Bool)

(assert (=> b!1350368 (=> (not res!895826) (not e!768196))))

(assert (=> b!1350368 (= res!895826 (noDuplicate!2081 acc!759))))

(declare-fun b!1350369 () Bool)

(assert (=> b!1350369 (= e!768195 (contains!9224 Nil!31512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350370 () Bool)

(declare-fun res!895824 () Bool)

(assert (=> b!1350370 (=> (not res!895824) (not e!768196))))

(assert (=> b!1350370 (= res!895824 (not (contains!9224 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113852 res!895823) b!1350368))

(assert (= (and b!1350368 res!895826) b!1350370))

(assert (= (and b!1350370 res!895824) b!1350366))

(assert (= (and b!1350366 res!895822) b!1350365))

(assert (= (and b!1350365 res!895825) b!1350367))

(assert (= (and b!1350367 res!895827) b!1350364))

(assert (= (and b!1350364 (not res!895828)) b!1350369))

(declare-fun m!1237591 () Bool)

(assert (=> b!1350369 m!1237591))

(declare-fun m!1237593 () Bool)

(assert (=> b!1350370 m!1237593))

(declare-fun m!1237595 () Bool)

(assert (=> start!113852 m!1237595))

(declare-fun m!1237597 () Bool)

(assert (=> b!1350368 m!1237597))

(declare-fun m!1237599 () Bool)

(assert (=> b!1350364 m!1237599))

(declare-fun m!1237601 () Bool)

(assert (=> b!1350367 m!1237601))

(declare-fun m!1237603 () Bool)

(assert (=> b!1350366 m!1237603))

(push 1)

(assert (not b!1350364))

(assert (not b!1350369))

(assert (not b!1350366))

(assert (not b!1350367))

(assert (not b!1350368))

(assert (not b!1350370))

(assert (not start!113852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144929 () Bool)

(declare-fun lt!596979 () Bool)

(declare-fun content!673 (List!31515) (Set (_ BitVec 64)))

(assert (=> d!144929 (= lt!596979 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!673 Nil!31512)))))

(declare-fun e!768254 () Bool)

(assert (=> d!144929 (= lt!596979 e!768254)))

(declare-fun res!895909 () Bool)

(assert (=> d!144929 (=> (not res!895909) (not e!768254))))

(assert (=> d!144929 (= res!895909 (is-Cons!31511 Nil!31512))))

(assert (=> d!144929 (= (contains!9224 Nil!31512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596979)))

(declare-fun b!1350451 () Bool)

(declare-fun e!768253 () Bool)

(assert (=> b!1350451 (= e!768254 e!768253)))

(declare-fun res!895910 () Bool)

(assert (=> b!1350451 (=> res!895910 e!768253)))

(assert (=> b!1350451 (= res!895910 (= (h!32720 Nil!31512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350452 () Bool)

(assert (=> b!1350452 (= e!768253 (contains!9224 (t!46173 Nil!31512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144929 res!895909) b!1350451))

(assert (= (and b!1350451 (not res!895910)) b!1350452))

(declare-fun m!1237677 () Bool)

(assert (=> d!144929 m!1237677))

(declare-fun m!1237679 () Bool)

(assert (=> d!144929 m!1237679))

(declare-fun m!1237681 () Bool)

(assert (=> b!1350452 m!1237681))

(assert (=> b!1350364 d!144929))

(declare-fun d!144945 () Bool)

(declare-fun lt!596980 () Bool)

(assert (=> d!144945 (= lt!596980 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!673 Nil!31512)))))

(declare-fun e!768256 () Bool)

(assert (=> d!144945 (= lt!596980 e!768256)))

(declare-fun res!895911 () Bool)

(assert (=> d!144945 (=> (not res!895911) (not e!768256))))

(assert (=> d!144945 (= res!895911 (is-Cons!31511 Nil!31512))))

(assert (=> d!144945 (= (contains!9224 Nil!31512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596980)))

(declare-fun b!1350453 () Bool)

(declare-fun e!768255 () Bool)

(assert (=> b!1350453 (= e!768256 e!768255)))

(declare-fun res!895912 () Bool)

(assert (=> b!1350453 (=> res!895912 e!768255)))

(assert (=> b!1350453 (= res!895912 (= (h!32720 Nil!31512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350454 () Bool)

(assert (=> b!1350454 (= e!768255 (contains!9224 (t!46173 Nil!31512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144945 res!895911) b!1350453))

(assert (= (and b!1350453 (not res!895912)) b!1350454))

(assert (=> d!144945 m!1237677))

(declare-fun m!1237683 () Bool)

(assert (=> d!144945 m!1237683))

(declare-fun m!1237685 () Bool)

(assert (=> b!1350454 m!1237685))

(assert (=> b!1350369 d!144945))

(declare-fun d!144947 () Bool)

(declare-fun res!895923 () Bool)

(declare-fun e!768267 () Bool)

(assert (=> d!144947 (=> res!895923 e!768267)))

(assert (=> d!144947 (= res!895923 (is-Nil!31512 acc!759))))

(assert (=> d!144947 (= (noDuplicate!2081 acc!759) e!768267)))

(declare-fun b!1350465 () Bool)

(declare-fun e!768268 () Bool)

(assert (=> b!1350465 (= e!768267 e!768268)))

(declare-fun res!895924 () Bool)

(assert (=> b!1350465 (=> (not res!895924) (not e!768268))))

(assert (=> b!1350465 (= res!895924 (not (contains!9224 (t!46173 acc!759) (h!32720 acc!759))))))

(declare-fun b!1350466 () Bool)

(assert (=> b!1350466 (= e!768268 (noDuplicate!2081 (t!46173 acc!759)))))

(assert (= (and d!144947 (not res!895923)) b!1350465))

(assert (= (and b!1350465 res!895924) b!1350466))

(declare-fun m!1237699 () Bool)

(assert (=> b!1350465 m!1237699))

(declare-fun m!1237701 () Bool)

(assert (=> b!1350466 m!1237701))

(assert (=> b!1350368 d!144947))

(declare-fun d!144955 () Bool)

(assert (=> d!144955 (= (array_inv!33502 a!3742) (bvsge (size!45024 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113852 d!144955))

(declare-fun d!144957 () Bool)

(declare-fun res!895925 () Bool)

(declare-fun e!768269 () Bool)

(assert (=> d!144957 (=> res!895925 e!768269)))

(assert (=> d!144957 (= res!895925 (is-Nil!31512 Nil!31512))))

(assert (=> d!144957 (= (noDuplicate!2081 Nil!31512) e!768269)))

(declare-fun b!1350467 () Bool)

(declare-fun e!768270 () Bool)

(assert (=> b!1350467 (= e!768269 e!768270)))

(declare-fun res!895926 () Bool)

(assert (=> b!1350467 (=> (not res!895926) (not e!768270))))

(assert (=> b!1350467 (= res!895926 (not (contains!9224 (t!46173 Nil!31512) (h!32720 Nil!31512))))))

(declare-fun b!1350468 () Bool)

(assert (=> b!1350468 (= e!768270 (noDuplicate!2081 (t!46173 Nil!31512)))))

(assert (= (and d!144957 (not res!895925)) b!1350467))

(assert (= (and b!1350467 res!895926) b!1350468))

(declare-fun m!1237703 () Bool)

(assert (=> b!1350467 m!1237703))

(declare-fun m!1237705 () Bool)

(assert (=> b!1350468 m!1237705))

(assert (=> b!1350367 d!144957))

(declare-fun d!144959 () Bool)

(declare-fun lt!596982 () Bool)

(assert (=> d!144959 (= lt!596982 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!673 acc!759)))))

(declare-fun e!768272 () Bool)

(assert (=> d!144959 (= lt!596982 e!768272)))

(declare-fun res!895927 () Bool)

(assert (=> d!144959 (=> (not res!895927) (not e!768272))))

(assert (=> d!144959 (= res!895927 (is-Cons!31511 acc!759))))

(assert (=> d!144959 (= (contains!9224 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596982)))

(declare-fun b!1350469 () Bool)

