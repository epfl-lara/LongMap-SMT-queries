; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85254 () Bool)

(assert start!85254)

(declare-fun res!663608 () Bool)

(declare-fun e!560208 () Bool)

(assert (=> start!85254 (=> (not res!663608) (not e!560208))))

(declare-datatypes ((List!20907 0))(
  ( (Nil!20904) (Cons!20903 (h!22065 (_ BitVec 64)) (t!29908 List!20907)) )
))
(declare-fun l!3519 () List!20907)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5768 (List!20907 (_ BitVec 64)) Bool)

(assert (=> start!85254 (= res!663608 (not (contains!5768 l!3519 e!29)))))

(assert (=> start!85254 e!560208))

(assert (=> start!85254 true))

(declare-fun b!992901 () Bool)

(declare-fun e!560207 () Bool)

(assert (=> b!992901 (= e!560208 e!560207)))

(declare-fun res!663609 () Bool)

(assert (=> b!992901 (=> (not res!663609) (not e!560207))))

(declare-datatypes ((tuple2!14992 0))(
  ( (tuple2!14993 (_1!7507 (_ BitVec 64)) (_2!7507 List!20907)) )
))
(declare-datatypes ((Option!551 0))(
  ( (Some!550 (v!14372 tuple2!14992)) (None!549) )
))
(declare-fun lt!440341 () Option!551)

(declare-fun isEmpty!758 (Option!551) Bool)

(assert (=> b!992901 (= res!663609 (not (isEmpty!758 lt!440341)))))

(declare-fun unapply!30 (List!20907) Option!551)

(assert (=> b!992901 (= lt!440341 (unapply!30 l!3519))))

(declare-fun b!992902 () Bool)

(declare-fun get!15715 (Option!551) tuple2!14992)

(assert (=> b!992902 (= e!560207 (contains!5768 (_2!7507 (get!15715 lt!440341)) e!29))))

(assert (= (and start!85254 res!663608) b!992901))

(assert (= (and b!992901 res!663609) b!992902))

(declare-fun m!920607 () Bool)

(assert (=> start!85254 m!920607))

(declare-fun m!920609 () Bool)

(assert (=> b!992901 m!920609))

(declare-fun m!920611 () Bool)

(assert (=> b!992901 m!920611))

(declare-fun m!920613 () Bool)

(assert (=> b!992902 m!920613))

(declare-fun m!920615 () Bool)

(assert (=> b!992902 m!920615))

(push 1)

(assert (not b!992901))

(assert (not b!992902))

(assert (not start!85254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118333 () Bool)

(assert (=> d!118333 (= (isEmpty!758 lt!440341) (not (is-Some!550 lt!440341)))))

(assert (=> b!992901 d!118333))

(declare-fun d!118337 () Bool)

(assert (=> d!118337 (= (unapply!30 l!3519) (ite (is-Nil!20904 l!3519) None!549 (Some!550 (tuple2!14993 (h!22065 l!3519) (t!29908 l!3519)))))))

(assert (=> b!992901 d!118337))

(declare-fun d!118341 () Bool)

(declare-fun lt!440350 () Bool)

(declare-fun content!459 (List!20907) (Set (_ BitVec 64)))

(assert (=> d!118341 (= lt!440350 (member e!29 (content!459 (_2!7507 (get!15715 lt!440341)))))))

(declare-fun e!560226 () Bool)

(assert (=> d!118341 (= lt!440350 e!560226)))

(declare-fun res!663626 () Bool)

(assert (=> d!118341 (=> (not res!663626) (not e!560226))))

(assert (=> d!118341 (= res!663626 (is-Cons!20903 (_2!7507 (get!15715 lt!440341))))))

(assert (=> d!118341 (= (contains!5768 (_2!7507 (get!15715 lt!440341)) e!29) lt!440350)))

(declare-fun b!992919 () Bool)

(declare-fun e!560225 () Bool)

(assert (=> b!992919 (= e!560226 e!560225)))

(declare-fun res!663627 () Bool)

(assert (=> b!992919 (=> res!663627 e!560225)))

(assert (=> b!992919 (= res!663627 (= (h!22065 (_2!7507 (get!15715 lt!440341))) e!29))))

(declare-fun b!992920 () Bool)

(assert (=> b!992920 (= e!560225 (contains!5768 (t!29908 (_2!7507 (get!15715 lt!440341))) e!29))))

(assert (= (and d!118341 res!663626) b!992919))

(assert (= (and b!992919 (not res!663627)) b!992920))

(declare-fun m!920629 () Bool)

(assert (=> d!118341 m!920629))

(declare-fun m!920633 () Bool)

(assert (=> d!118341 m!920633))

(declare-fun m!920637 () Bool)

(assert (=> b!992920 m!920637))

(assert (=> b!992902 d!118341))

(declare-fun d!118351 () Bool)

(assert (=> d!118351 (= (get!15715 lt!440341) (v!14372 lt!440341))))

(assert (=> b!992902 d!118351))

(declare-fun d!118355 () Bool)

(declare-fun lt!440352 () Bool)

(assert (=> d!118355 (= lt!440352 (member e!29 (content!459 l!3519)))))

(declare-fun e!560230 () Bool)

(assert (=> d!118355 (= lt!440352 e!560230)))

(declare-fun res!663630 () Bool)

(assert (=> d!118355 (=> (not res!663630) (not e!560230))))

(assert (=> d!118355 (= res!663630 (is-Cons!20903 l!3519))))

(assert (=> d!118355 (= (contains!5768 l!3519 e!29) lt!440352)))

(declare-fun b!992923 () Bool)

(declare-fun e!560229 () Bool)

(assert (=> b!992923 (= e!560230 e!560229)))

(declare-fun res!663631 () Bool)

(assert (=> b!992923 (=> res!663631 e!560229)))

(assert (=> b!992923 (= res!663631 (= (h!22065 l!3519) e!29))))

(declare-fun b!992924 () Bool)

