; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108086 () Bool)

(assert start!108086)

(declare-fun res!848006 () Bool)

(declare-fun e!728510 () Bool)

(assert (=> start!108086 (=> (not res!848006) (not e!728510))))

(declare-datatypes ((B!2172 0))(
  ( (B!2173 (val!16682 Int)) )
))
(declare-datatypes ((tuple2!21454 0))(
  ( (tuple2!21455 (_1!10738 (_ BitVec 64)) (_2!10738 B!2172)) )
))
(declare-datatypes ((List!28636 0))(
  ( (Nil!28633) (Cons!28632 (h!29850 tuple2!21454) (t!42161 List!28636)) )
))
(declare-fun l!595 () List!28636)

(declare-fun isStrictlySorted!849 (List!28636) Bool)

(assert (=> start!108086 (= res!848006 (isStrictlySorted!849 l!595))))

(assert (=> start!108086 e!728510))

(declare-fun e!728508 () Bool)

(assert (=> start!108086 e!728508))

(assert (=> start!108086 true))

(declare-fun b!1276236 () Bool)

(declare-fun tp_is_empty!33215 () Bool)

(declare-fun tp!98063 () Bool)

(assert (=> b!1276236 (= e!728508 (and tp_is_empty!33215 tp!98063))))

(declare-fun b!1276233 () Bool)

(declare-fun res!848004 () Bool)

(assert (=> b!1276233 (=> (not res!848004) (not e!728510))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1276233 (= res!848004 (and (not (= (_1!10738 (h!29850 l!595)) key!173)) (is-Cons!28632 l!595)))))

(declare-fun b!1276235 () Bool)

(declare-fun e!728509 () Bool)

(declare-fun lt!575794 () List!28636)

(declare-fun containsKey!705 (List!28636 (_ BitVec 64)) Bool)

(assert (=> b!1276235 (= e!728509 (containsKey!705 lt!575794 key!173))))

(declare-fun b!1276234 () Bool)

(assert (=> b!1276234 (= e!728510 e!728509)))

(declare-fun res!848005 () Bool)

(assert (=> b!1276234 (=> res!848005 e!728509)))

(assert (=> b!1276234 (= res!848005 (not (isStrictlySorted!849 lt!575794)))))

(declare-fun $colon$colon!665 (List!28636 tuple2!21454) List!28636)

(declare-fun removeStrictlySorted!183 (List!28636 (_ BitVec 64)) List!28636)

(assert (=> b!1276234 (= lt!575794 ($colon$colon!665 (removeStrictlySorted!183 (t!42161 l!595) key!173) (h!29850 l!595)))))

(assert (= (and start!108086 res!848006) b!1276233))

(assert (= (and b!1276233 res!848004) b!1276234))

(assert (= (and b!1276234 (not res!848005)) b!1276235))

(assert (= (and start!108086 (is-Cons!28632 l!595)) b!1276236))

(declare-fun m!1173025 () Bool)

(assert (=> start!108086 m!1173025))

(declare-fun m!1173027 () Bool)

(assert (=> b!1276235 m!1173027))

(declare-fun m!1173029 () Bool)

(assert (=> b!1276234 m!1173029))

(declare-fun m!1173031 () Bool)

(assert (=> b!1276234 m!1173031))

(assert (=> b!1276234 m!1173031))

(declare-fun m!1173033 () Bool)

(assert (=> b!1276234 m!1173033))

(push 1)

(assert (not b!1276234))

(assert (not b!1276235))

(assert tp_is_empty!33215)

(assert (not b!1276236))

(assert (not start!108086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140699 () Bool)

(declare-fun res!848023 () Bool)

(declare-fun e!728527 () Bool)

(assert (=> d!140699 (=> res!848023 e!728527)))

(assert (=> d!140699 (= res!848023 (or (is-Nil!28633 l!595) (is-Nil!28633 (t!42161 l!595))))))

(assert (=> d!140699 (= (isStrictlySorted!849 l!595) e!728527)))

(declare-fun b!1276253 () Bool)

(declare-fun e!728528 () Bool)

(assert (=> b!1276253 (= e!728527 e!728528)))

(declare-fun res!848024 () Bool)

(assert (=> b!1276253 (=> (not res!848024) (not e!728528))))

(assert (=> b!1276253 (= res!848024 (bvslt (_1!10738 (h!29850 l!595)) (_1!10738 (h!29850 (t!42161 l!595)))))))

(declare-fun b!1276254 () Bool)

(assert (=> b!1276254 (= e!728528 (isStrictlySorted!849 (t!42161 l!595)))))

(assert (= (and d!140699 (not res!848023)) b!1276253))

(assert (= (and b!1276253 res!848024) b!1276254))

(declare-fun m!1173039 () Bool)

(assert (=> b!1276254 m!1173039))

(assert (=> start!108086 d!140699))

(declare-fun d!140705 () Bool)

(declare-fun res!848039 () Bool)

(declare-fun e!728547 () Bool)

(assert (=> d!140705 (=> res!848039 e!728547)))

(assert (=> d!140705 (= res!848039 (and (is-Cons!28632 lt!575794) (= (_1!10738 (h!29850 lt!575794)) key!173)))))

(assert (=> d!140705 (= (containsKey!705 lt!575794 key!173) e!728547)))

(declare-fun b!1276277 () Bool)

(declare-fun e!728548 () Bool)

(assert (=> b!1276277 (= e!728547 e!728548)))

(declare-fun res!848040 () Bool)

(assert (=> b!1276277 (=> (not res!848040) (not e!728548))))

(assert (=> b!1276277 (= res!848040 (and (or (not (is-Cons!28632 lt!575794)) (bvsle (_1!10738 (h!29850 lt!575794)) key!173)) (is-Cons!28632 lt!575794) (bvslt (_1!10738 (h!29850 lt!575794)) key!173)))))

(declare-fun b!1276278 () Bool)

(assert (=> b!1276278 (= e!728548 (containsKey!705 (t!42161 lt!575794) key!173))))

(assert (= (and d!140705 (not res!848039)) b!1276277))

(assert (= (and b!1276277 res!848040) b!1276278))

(declare-fun m!1173045 () Bool)

(assert (=> b!1276278 m!1173045))

(assert (=> b!1276235 d!140705))

(declare-fun d!140713 () Bool)

(declare-fun res!848041 () Bool)

(declare-fun e!728549 () Bool)

(assert (=> d!140713 (=> res!848041 e!728549)))

(assert (=> d!140713 (= res!848041 (or (is-Nil!28633 lt!575794) (is-Nil!28633 (t!42161 lt!575794))))))

(assert (=> d!140713 (= (isStrictlySorted!849 lt!575794) e!728549)))

(declare-fun b!1276279 () Bool)

(declare-fun e!728550 () Bool)

(assert (=> b!1276279 (= e!728549 e!728550)))

(declare-fun res!848042 () Bool)

(assert (=> b!1276279 (=> (not res!848042) (not e!728550))))

(assert (=> b!1276279 (= res!848042 (bvslt (_1!10738 (h!29850 lt!575794)) (_1!10738 (h!29850 (t!42161 lt!575794)))))))

(declare-fun b!1276280 () Bool)

(assert (=> b!1276280 (= e!728550 (isStrictlySorted!849 (t!42161 lt!575794)))))

(assert (= (and d!140713 (not res!848041)) b!1276279))

(assert (= (and b!1276279 res!848042) b!1276280))

(declare-fun m!1173047 () Bool)

(assert (=> b!1276280 m!1173047))

(assert (=> b!1276234 d!140713))

(declare-fun d!140715 () Bool)

(assert (=> d!140715 (= ($colon$colon!665 (removeStrictlySorted!183 (t!42161 l!595) key!173) (h!29850 l!595)) (Cons!28632 (h!29850 l!595) (removeStrictlySorted!183 (t!42161 l!595) key!173)))))

(assert (=> b!1276234 d!140715))

(declare-fun d!140717 () Bool)

(declare-fun e!728583 () Bool)

(assert (=> d!140717 e!728583))

(declare-fun res!848057 () Bool)

(assert (=> d!140717 (=> (not res!848057) (not e!728583))))

(declare-fun lt!575803 () List!28636)

(assert (=> d!140717 (= res!848057 (isStrictlySorted!849 lt!575803))))

(declare-fun e!728584 () List!28636)

(assert (=> d!140717 (= lt!575803 e!728584)))

(declare-fun c!124309 () Bool)

(assert (=> d!140717 (= c!124309 (and (is-Cons!28632 (t!42161 l!595)) (= (_1!10738 (h!29850 (t!42161 l!595))) key!173)))))

(assert (=> d!140717 (isStrictlySorted!849 (t!42161 l!595))))

(assert (=> d!140717 (= (removeStrictlySorted!183 (t!42161 l!595) key!173) lt!575803)))

(declare-fun b!1276329 () Bool)

(assert (=> b!1276329 (= e!728583 (not (containsKey!705 lt!575803 key!173)))))

(declare-fun b!1276330 () Bool)

(declare-fun e!728585 () List!28636)

(assert (=> b!1276330 (= e!728585 ($colon$colon!665 (removeStrictlySorted!183 (t!42161 (t!42161 l!595)) key!173) (h!29850 (t!42161 l!595))))))

(declare-fun b!1276331 () Bool)

(assert (=> b!1276331 (= e!728584 (t!42161 (t!42161 l!595)))))

(declare-fun b!1276332 () Bool)

(assert (=> b!1276332 (= e!728585 Nil!28633)))

(declare-fun b!1276333 () Bool)

(assert (=> b!1276333 (= e!728584 e!728585)))

(declare-fun c!124308 () Bool)

(assert (=> b!1276333 (= c!124308 (and (is-Cons!28632 (t!42161 l!595)) (not (= (_1!10738 (h!29850 (t!42161 l!595))) key!173))))))

(assert (= (and d!140717 c!124309) b!1276331))

(assert (= (and d!140717 (not c!124309)) b!1276333))

(assert (= (and b!1276333 c!124308) b!1276330))

(assert (= (and b!1276333 (not c!124308)) b!1276332))

(assert (= (and d!140717 res!848057) b!1276329))

(declare-fun m!1173069 () Bool)

(assert (=> d!140717 m!1173069))

(assert (=> d!140717 m!1173039))

(declare-fun m!1173071 () Bool)

(assert (=> b!1276329 m!1173071))

(declare-fun m!1173073 () Bool)

(assert (=> b!1276330 m!1173073))

(assert (=> b!1276330 m!1173073))

(declare-fun m!1173075 () Bool)

(assert (=> b!1276330 m!1173075))

(assert (=> b!1276234 d!140717))

(declare-fun b!1276338 () Bool)

(declare-fun e!728588 () Bool)

(declare-fun tp!98072 () Bool)

(assert (=> b!1276338 (= e!728588 (and tp_is_empty!33215 tp!98072))))

(assert (=> b!1276236 (= tp!98063 e!728588)))

(assert (= (and b!1276236 (is-Cons!28632 (t!42161 l!595))) b!1276338))

(push 1)

(assert (not b!1276338))

(assert (not b!1276329))

(assert tp_is_empty!33215)

(assert (not d!140717))

(assert (not b!1276330))

(assert (not b!1276254))

(assert (not b!1276280))

(assert (not b!1276278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140737 () Bool)

(declare-fun res!848069 () Bool)

(declare-fun e!728603 () Bool)

(assert (=> d!140737 (=> res!848069 e!728603)))

(assert (=> d!140737 (= res!848069 (and (is-Cons!28632 (t!42161 lt!575794)) (= (_1!10738 (h!29850 (t!42161 lt!575794))) key!173)))))

(assert (=> d!140737 (= (containsKey!705 (t!42161 lt!575794) key!173) e!728603)))

(declare-fun b!1276355 () Bool)

(declare-fun e!728604 () Bool)

(assert (=> b!1276355 (= e!728603 e!728604)))

(declare-fun res!848070 () Bool)

(assert (=> b!1276355 (=> (not res!848070) (not e!728604))))

(assert (=> b!1276355 (= res!848070 (and (or (not (is-Cons!28632 (t!42161 lt!575794))) (bvsle (_1!10738 (h!29850 (t!42161 lt!575794))) key!173)) (is-Cons!28632 (t!42161 lt!575794)) (bvslt (_1!10738 (h!29850 (t!42161 lt!575794))) key!173)))))

(declare-fun b!1276356 () Bool)

(assert (=> b!1276356 (= e!728604 (containsKey!705 (t!42161 (t!42161 lt!575794)) key!173))))

(assert (= (and d!140737 (not res!848069)) b!1276355))

(assert (= (and b!1276355 res!848070) b!1276356))

(declare-fun m!1173095 () Bool)

(assert (=> b!1276356 m!1173095))

(assert (=> b!1276278 d!140737))

(declare-fun d!140739 () Bool)

(declare-fun res!848071 () Bool)

(declare-fun e!728605 () Bool)

(assert (=> d!140739 (=> res!848071 e!728605)))

(assert (=> d!140739 (= res!848071 (or (is-Nil!28633 lt!575803) (is-Nil!28633 (t!42161 lt!575803))))))

(assert (=> d!140739 (= (isStrictlySorted!849 lt!575803) e!728605)))

(declare-fun b!1276357 () Bool)

(declare-fun e!728606 () Bool)

(assert (=> b!1276357 (= e!728605 e!728606)))

(declare-fun res!848072 () Bool)

(assert (=> b!1276357 (=> (not res!848072) (not e!728606))))

(assert (=> b!1276357 (= res!848072 (bvslt (_1!10738 (h!29850 lt!575803)) (_1!10738 (h!29850 (t!42161 lt!575803)))))))

(declare-fun b!1276358 () Bool)

(assert (=> b!1276358 (= e!728606 (isStrictlySorted!849 (t!42161 lt!575803)))))

(assert (= (and d!140739 (not res!848071)) b!1276357))

(assert (= (and b!1276357 res!848072) b!1276358))

(declare-fun m!1173097 () Bool)

(assert (=> b!1276358 m!1173097))

(assert (=> d!140717 d!140739))

(declare-fun d!140741 () Bool)

(declare-fun res!848073 () Bool)

(declare-fun e!728607 () Bool)

(assert (=> d!140741 (=> res!848073 e!728607)))

(assert (=> d!140741 (= res!848073 (or (is-Nil!28633 (t!42161 l!595)) (is-Nil!28633 (t!42161 (t!42161 l!595)))))))

(assert (=> d!140741 (= (isStrictlySorted!849 (t!42161 l!595)) e!728607)))

(declare-fun b!1276359 () Bool)

(declare-fun e!728608 () Bool)

(assert (=> b!1276359 (= e!728607 e!728608)))

(declare-fun res!848074 () Bool)

(assert (=> b!1276359 (=> (not res!848074) (not e!728608))))

(assert (=> b!1276359 (= res!848074 (bvslt (_1!10738 (h!29850 (t!42161 l!595))) (_1!10738 (h!29850 (t!42161 (t!42161 l!595))))))))

(declare-fun b!1276360 () Bool)

(assert (=> b!1276360 (= e!728608 (isStrictlySorted!849 (t!42161 (t!42161 l!595))))))

(assert (= (and d!140741 (not res!848073)) b!1276359))

(assert (= (and b!1276359 res!848074) b!1276360))

(declare-fun m!1173099 () Bool)

(assert (=> b!1276360 m!1173099))

(assert (=> d!140717 d!140741))

(declare-fun d!140743 () Bool)

(assert (=> d!140743 (= ($colon$colon!665 (removeStrictlySorted!183 (t!42161 (t!42161 l!595)) key!173) (h!29850 (t!42161 l!595))) (Cons!28632 (h!29850 (t!42161 l!595)) (removeStrictlySorted!183 (t!42161 (t!42161 l!595)) key!173)))))

(assert (=> b!1276330 d!140743))

(declare-fun d!140745 () Bool)

(declare-fun e!728609 () Bool)

(assert (=> d!140745 e!728609))

(declare-fun res!848075 () Bool)

(assert (=> d!140745 (=> (not res!848075) (not e!728609))))

(declare-fun lt!575805 () List!28636)

(assert (=> d!140745 (= res!848075 (isStrictlySorted!849 lt!575805))))

(declare-fun e!728610 () List!28636)

(assert (=> d!140745 (= lt!575805 e!728610)))

(declare-fun c!124313 () Bool)

(assert (=> d!140745 (= c!124313 (and (is-Cons!28632 (t!42161 (t!42161 l!595))) (= (_1!10738 (h!29850 (t!42161 (t!42161 l!595)))) key!173)))))

(assert (=> d!140745 (isStrictlySorted!849 (t!42161 (t!42161 l!595)))))

(assert (=> d!140745 (= (removeStrictlySorted!183 (t!42161 (t!42161 l!595)) key!173) lt!575805)))

(declare-fun b!1276361 () Bool)

(assert (=> b!1276361 (= e!728609 (not (containsKey!705 lt!575805 key!173)))))

(declare-fun b!1276362 () Bool)

(declare-fun e!728611 () List!28636)

(assert (=> b!1276362 (= e!728611 ($colon$colon!665 (removeStrictlySorted!183 (t!42161 (t!42161 (t!42161 l!595))) key!173) (h!29850 (t!42161 (t!42161 l!595)))))))

(declare-fun b!1276363 () Bool)

(assert (=> b!1276363 (= e!728610 (t!42161 (t!42161 (t!42161 l!595))))))

(declare-fun b!1276364 () Bool)

(assert (=> b!1276364 (= e!728611 Nil!28633)))

(declare-fun b!1276365 () Bool)

(assert (=> b!1276365 (= e!728610 e!728611)))

(declare-fun c!124312 () Bool)

(assert (=> b!1276365 (= c!124312 (and (is-Cons!28632 (t!42161 (t!42161 l!595))) (not (= (_1!10738 (h!29850 (t!42161 (t!42161 l!595)))) key!173))))))

(assert (= (and d!140745 c!124313) b!1276363))

(assert (= (and d!140745 (not c!124313)) b!1276365))

(assert (= (and b!1276365 c!124312) b!1276362))

(assert (= (and b!1276365 (not c!124312)) b!1276364))

(assert (= (and d!140745 res!848075) b!1276361))

(declare-fun m!1173101 () Bool)

(assert (=> d!140745 m!1173101))

(assert (=> d!140745 m!1173099))

(declare-fun m!1173103 () Bool)

(assert (=> b!1276361 m!1173103))

(declare-fun m!1173105 () Bool)

(assert (=> b!1276362 m!1173105))

(assert (=> b!1276362 m!1173105))

(declare-fun m!1173107 () Bool)

(assert (=> b!1276362 m!1173107))

(assert (=> b!1276330 d!140745))

(assert (=> b!1276254 d!140741))

(declare-fun d!140747 () Bool)

(declare-fun res!848076 () Bool)

(declare-fun e!728612 () Bool)

(assert (=> d!140747 (=> res!848076 e!728612)))

(assert (=> d!140747 (= res!848076 (or (is-Nil!28633 (t!42161 lt!575794)) (is-Nil!28633 (t!42161 (t!42161 lt!575794)))))))

(assert (=> d!140747 (= (isStrictlySorted!849 (t!42161 lt!575794)) e!728612)))

(declare-fun b!1276366 () Bool)

(declare-fun e!728613 () Bool)

(assert (=> b!1276366 (= e!728612 e!728613)))

(declare-fun res!848077 () Bool)

(assert (=> b!1276366 (=> (not res!848077) (not e!728613))))

(assert (=> b!1276366 (= res!848077 (bvslt (_1!10738 (h!29850 (t!42161 lt!575794))) (_1!10738 (h!29850 (t!42161 (t!42161 lt!575794))))))))

(declare-fun b!1276367 () Bool)

(assert (=> b!1276367 (= e!728613 (isStrictlySorted!849 (t!42161 (t!42161 lt!575794))))))

(assert (= (and d!140747 (not res!848076)) b!1276366))

(assert (= (and b!1276366 res!848077) b!1276367))

(declare-fun m!1173109 () Bool)

(assert (=> b!1276367 m!1173109))

(assert (=> b!1276280 d!140747))

(declare-fun d!140749 () Bool)

(declare-fun res!848078 () Bool)

(declare-fun e!728614 () Bool)

(assert (=> d!140749 (=> res!848078 e!728614)))

(assert (=> d!140749 (= res!848078 (and (is-Cons!28632 lt!575803) (= (_1!10738 (h!29850 lt!575803)) key!173)))))

(assert (=> d!140749 (= (containsKey!705 lt!575803 key!173) e!728614)))

(declare-fun b!1276368 () Bool)

(declare-fun e!728615 () Bool)

(assert (=> b!1276368 (= e!728614 e!728615)))

(declare-fun res!848079 () Bool)

(assert (=> b!1276368 (=> (not res!848079) (not e!728615))))

(assert (=> b!1276368 (= res!848079 (and (or (not (is-Cons!28632 lt!575803)) (bvsle (_1!10738 (h!29850 lt!575803)) key!173)) (is-Cons!28632 lt!575803) (bvslt (_1!10738 (h!29850 lt!575803)) key!173)))))

(declare-fun b!1276369 () Bool)

(assert (=> b!1276369 (= e!728615 (containsKey!705 (t!42161 lt!575803) key!173))))

(assert (= (and d!140749 (not res!848078)) b!1276368))

(assert (= (and b!1276368 res!848079) b!1276369))

(declare-fun m!1173111 () Bool)

(assert (=> b!1276369 m!1173111))

(assert (=> b!1276329 d!140749))

(declare-fun b!1276370 () Bool)

(declare-fun e!728616 () Bool)

(declare-fun tp!98074 () Bool)

(assert (=> b!1276370 (= e!728616 (and tp_is_empty!33215 tp!98074))))

(assert (=> b!1276338 (= tp!98072 e!728616)))

(assert (= (and b!1276338 (is-Cons!28632 (t!42161 (t!42161 l!595)))) b!1276370))

(push 1)

(assert (not b!1276361))

(assert (not b!1276369))

(assert (not b!1276360))

(assert (not d!140745))

(assert (not b!1276367))

(assert (not b!1276370))

(assert (not b!1276356))

(assert (not b!1276358))

(assert (not b!1276362))

(assert tp_is_empty!33215)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

