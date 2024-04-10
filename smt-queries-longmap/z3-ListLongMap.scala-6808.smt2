; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85634 () Bool)

(assert start!85634)

(declare-fun b!994259 () Bool)

(declare-fun res!664786 () Bool)

(declare-fun e!561100 () Bool)

(assert (=> b!994259 (=> (not res!664786) (not e!561100))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994259 (= res!664786 (bvsge from!3778 size!36))))

(declare-fun res!664787 () Bool)

(assert (=> start!85634 (=> (not res!664787) (not e!561100))))

(declare-datatypes ((array!62874 0))(
  ( (array!62875 (arr!30278 (Array (_ BitVec 32) (_ BitVec 64))) (size!30780 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62874)

(assert (=> start!85634 (= res!664787 (and (= (size!30780 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62875 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30780 a!4424))))))

(assert (=> start!85634 e!561100))

(declare-fun array_inv!23402 (array!62874) Bool)

(assert (=> start!85634 (array_inv!23402 a!4424)))

(assert (=> start!85634 true))

(declare-fun b!994260 () Bool)

(declare-fun res!664784 () Bool)

(assert (=> b!994260 (=> (not res!664784) (not e!561100))))

(declare-datatypes ((List!20993 0))(
  ( (Nil!20990) (Cons!20989 (h!22151 (_ BitVec 64)) (t!29994 List!20993)) )
))
(declare-fun acc!919 () List!20993)

(declare-fun noDuplicate!1452 (List!20993) Bool)

(assert (=> b!994260 (= res!664784 (noDuplicate!1452 acc!919))))

(declare-fun b!994261 () Bool)

(declare-fun res!664788 () Bool)

(assert (=> b!994261 (=> (not res!664788) (not e!561100))))

(declare-fun contains!5854 (List!20993 (_ BitVec 64)) Bool)

(assert (=> b!994261 (= res!664788 (not (contains!5854 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994262 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62874 (_ BitVec 32) List!20993) Bool)

(assert (=> b!994262 (= e!561100 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(declare-fun b!994263 () Bool)

(declare-fun res!664785 () Bool)

(assert (=> b!994263 (=> (not res!664785) (not e!561100))))

(assert (=> b!994263 (= res!664785 (not (contains!5854 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85634 res!664787) b!994261))

(assert (= (and b!994261 res!664788) b!994263))

(assert (= (and b!994263 res!664785) b!994260))

(assert (= (and b!994260 res!664784) b!994259))

(assert (= (and b!994259 res!664786) b!994262))

(declare-fun m!921885 () Bool)

(assert (=> b!994260 m!921885))

(declare-fun m!921887 () Bool)

(assert (=> start!85634 m!921887))

(declare-fun m!921889 () Bool)

(assert (=> b!994261 m!921889))

(declare-fun m!921891 () Bool)

(assert (=> b!994262 m!921891))

(declare-fun m!921893 () Bool)

(assert (=> b!994263 m!921893))

(check-sat (not b!994262) (not b!994260) (not b!994263) (not b!994261) (not start!85634))
(check-sat)
(get-model)

(declare-fun d!118669 () Bool)

(assert (=> d!118669 (= (array_inv!23402 a!4424) (bvsge (size!30780 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85634 d!118669))

(declare-fun d!118671 () Bool)

(declare-fun lt!440705 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!479 (List!20993) (InoxSet (_ BitVec 64)))

(assert (=> d!118671 (= lt!440705 (select (content!479 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561111 () Bool)

(assert (=> d!118671 (= lt!440705 e!561111)))

(declare-fun res!664809 () Bool)

(assert (=> d!118671 (=> (not res!664809) (not e!561111))))

(get-info :version)

(assert (=> d!118671 (= res!664809 ((_ is Cons!20989) acc!919))))

(assert (=> d!118671 (= (contains!5854 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440705)))

(declare-fun b!994283 () Bool)

(declare-fun e!561112 () Bool)

(assert (=> b!994283 (= e!561111 e!561112)))

(declare-fun res!664808 () Bool)

(assert (=> b!994283 (=> res!664808 e!561112)))

(assert (=> b!994283 (= res!664808 (= (h!22151 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994284 () Bool)

(assert (=> b!994284 (= e!561112 (contains!5854 (t!29994 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118671 res!664809) b!994283))

(assert (= (and b!994283 (not res!664808)) b!994284))

(declare-fun m!921905 () Bool)

(assert (=> d!118671 m!921905))

(declare-fun m!921907 () Bool)

(assert (=> d!118671 m!921907))

(declare-fun m!921909 () Bool)

(assert (=> b!994284 m!921909))

(assert (=> b!994263 d!118671))

(declare-fun b!994323 () Bool)

(declare-fun e!561145 () Bool)

(declare-fun call!42174 () Bool)

(assert (=> b!994323 (= e!561145 call!42174)))

(declare-fun b!994324 () Bool)

(declare-fun e!561148 () Bool)

(declare-fun e!561146 () Bool)

(assert (=> b!994324 (= e!561148 e!561146)))

(declare-fun res!664837 () Bool)

(assert (=> b!994324 (=> (not res!664837) (not e!561146))))

(declare-fun e!561147 () Bool)

(assert (=> b!994324 (= res!664837 (not e!561147))))

(declare-fun res!664836 () Bool)

(assert (=> b!994324 (=> (not res!664836) (not e!561147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994324 (= res!664836 (validKeyInArray!0 (select (arr!30278 a!4424) from!3778)))))

(declare-fun b!994325 () Bool)

(assert (=> b!994325 (= e!561146 e!561145)))

(declare-fun c!100884 () Bool)

(assert (=> b!994325 (= c!100884 (validKeyInArray!0 (select (arr!30278 a!4424) from!3778)))))

(declare-fun b!994326 () Bool)

(assert (=> b!994326 (= e!561147 (contains!5854 acc!919 (select (arr!30278 a!4424) from!3778)))))

(declare-fun d!118677 () Bool)

(declare-fun res!664838 () Bool)

(assert (=> d!118677 (=> res!664838 e!561148)))

(assert (=> d!118677 (= res!664838 (bvsge from!3778 (size!30780 a!4424)))))

(assert (=> d!118677 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561148)))

(declare-fun bm!42171 () Bool)

(assert (=> bm!42171 (= call!42174 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100884 (Cons!20989 (select (arr!30278 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!994327 () Bool)

(assert (=> b!994327 (= e!561145 call!42174)))

(assert (= (and d!118677 (not res!664838)) b!994324))

(assert (= (and b!994324 res!664836) b!994326))

(assert (= (and b!994324 res!664837) b!994325))

(assert (= (and b!994325 c!100884) b!994323))

(assert (= (and b!994325 (not c!100884)) b!994327))

(assert (= (or b!994323 b!994327) bm!42171))

(declare-fun m!921923 () Bool)

(assert (=> b!994324 m!921923))

(assert (=> b!994324 m!921923))

(declare-fun m!921926 () Bool)

(assert (=> b!994324 m!921926))

(assert (=> b!994325 m!921923))

(assert (=> b!994325 m!921923))

(assert (=> b!994325 m!921926))

(assert (=> b!994326 m!921923))

(assert (=> b!994326 m!921923))

(declare-fun m!921931 () Bool)

(assert (=> b!994326 m!921931))

(assert (=> bm!42171 m!921923))

(declare-fun m!921937 () Bool)

(assert (=> bm!42171 m!921937))

(assert (=> b!994262 d!118677))

(declare-fun d!118684 () Bool)

(declare-fun lt!440710 () Bool)

(assert (=> d!118684 (= lt!440710 (select (content!479 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561157 () Bool)

(assert (=> d!118684 (= lt!440710 e!561157)))

(declare-fun res!664846 () Bool)

(assert (=> d!118684 (=> (not res!664846) (not e!561157))))

(assert (=> d!118684 (= res!664846 ((_ is Cons!20989) acc!919))))

(assert (=> d!118684 (= (contains!5854 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440710)))

(declare-fun b!994338 () Bool)

(declare-fun e!561158 () Bool)

(assert (=> b!994338 (= e!561157 e!561158)))

(declare-fun res!664845 () Bool)

(assert (=> b!994338 (=> res!664845 e!561158)))

(assert (=> b!994338 (= res!664845 (= (h!22151 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994339 () Bool)

(assert (=> b!994339 (= e!561158 (contains!5854 (t!29994 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118684 res!664846) b!994338))

(assert (= (and b!994338 (not res!664845)) b!994339))

(assert (=> d!118684 m!921905))

(declare-fun m!921945 () Bool)

(assert (=> d!118684 m!921945))

(declare-fun m!921947 () Bool)

(assert (=> b!994339 m!921947))

(assert (=> b!994261 d!118684))

(declare-fun d!118689 () Bool)

(declare-fun res!664861 () Bool)

(declare-fun e!561173 () Bool)

(assert (=> d!118689 (=> res!664861 e!561173)))

(assert (=> d!118689 (= res!664861 ((_ is Nil!20990) acc!919))))

(assert (=> d!118689 (= (noDuplicate!1452 acc!919) e!561173)))

(declare-fun b!994354 () Bool)

(declare-fun e!561174 () Bool)

(assert (=> b!994354 (= e!561173 e!561174)))

(declare-fun res!664862 () Bool)

(assert (=> b!994354 (=> (not res!664862) (not e!561174))))

(assert (=> b!994354 (= res!664862 (not (contains!5854 (t!29994 acc!919) (h!22151 acc!919))))))

(declare-fun b!994355 () Bool)

(assert (=> b!994355 (= e!561174 (noDuplicate!1452 (t!29994 acc!919)))))

(assert (= (and d!118689 (not res!664861)) b!994354))

(assert (= (and b!994354 res!664862) b!994355))

(declare-fun m!921953 () Bool)

(assert (=> b!994354 m!921953))

(declare-fun m!921955 () Bool)

(assert (=> b!994355 m!921955))

(assert (=> b!994260 d!118689))

(check-sat (not b!994339) (not d!118684) (not b!994325) (not b!994355) (not bm!42171) (not b!994354) (not d!118671) (not b!994326) (not b!994284) (not b!994324))
(check-sat)
