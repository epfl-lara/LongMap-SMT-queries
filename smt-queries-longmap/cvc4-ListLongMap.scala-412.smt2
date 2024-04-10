; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7718 () Bool)

(assert start!7718)

(declare-fun b!49136 () Bool)

(declare-fun e!31554 () Bool)

(declare-fun tp_is_empty!2141 () Bool)

(declare-fun tp!6500 () Bool)

(assert (=> b!49136 (= e!31554 (and tp_is_empty!2141 tp!6500))))

(declare-fun res!28491 () Bool)

(declare-fun e!31555 () Bool)

(assert (=> start!7718 (=> (not res!28491) (not e!31555))))

(declare-datatypes ((B!990 0))(
  ( (B!991 (val!1115 Int)) )
))
(declare-datatypes ((tuple2!1812 0))(
  ( (tuple2!1813 (_1!917 (_ BitVec 64)) (_2!917 B!990)) )
))
(declare-datatypes ((List!1312 0))(
  ( (Nil!1309) (Cons!1308 (h!1888 tuple2!1812) (t!4343 List!1312)) )
))
(declare-fun l!1333 () List!1312)

(declare-fun isStrictlySorted!276 (List!1312) Bool)

(assert (=> start!7718 (= res!28491 (isStrictlySorted!276 l!1333))))

(assert (=> start!7718 e!31555))

(assert (=> start!7718 e!31554))

(assert (=> start!7718 true))

(assert (=> start!7718 tp_is_empty!2141))

(declare-fun b!49133 () Bool)

(declare-fun res!28493 () Bool)

(assert (=> b!49133 (=> (not res!28493) (not e!31555))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!125 (List!1312 (_ BitVec 64)) Bool)

(assert (=> b!49133 (= res!28493 (not (containsKey!125 l!1333 newKey!147)))))

(declare-fun b!49134 () Bool)

(declare-fun res!28492 () Bool)

(assert (=> b!49134 (=> (not res!28492) (not e!31555))))

(assert (=> b!49134 (= res!28492 (not (is-Nil!1309 l!1333)))))

(declare-fun b!49135 () Bool)

(declare-fun newValue!147 () B!990)

(declare-fun content!54 (List!1312) (Set tuple2!1812))

(declare-fun insertStrictlySorted!39 (List!1312 (_ BitVec 64) B!990) List!1312)

(assert (=> b!49135 (= e!31555 (not (= (union (content!54 l!1333) (insert (tuple2!1813 newKey!147 newValue!147) (as emptyset (Set tuple2!1812)))) (content!54 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147)))))))

(declare-datatypes ((Unit!1373 0))(
  ( (Unit!1374) )
))
(declare-fun lt!20723 () Unit!1373)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!9 (List!1312 (_ BitVec 64) B!990) Unit!1373)

(assert (=> b!49135 (= lt!20723 (lemmaInsertStrictlySortedNotContainedContent!9 (t!4343 l!1333) newKey!147 newValue!147))))

(assert (= (and start!7718 res!28491) b!49133))

(assert (= (and b!49133 res!28493) b!49134))

(assert (= (and b!49134 res!28492) b!49135))

(assert (= (and start!7718 (is-Cons!1308 l!1333)) b!49136))

(declare-fun m!42637 () Bool)

(assert (=> start!7718 m!42637))

(declare-fun m!42639 () Bool)

(assert (=> b!49133 m!42639))

(declare-fun m!42641 () Bool)

(assert (=> b!49135 m!42641))

(declare-fun m!42643 () Bool)

(assert (=> b!49135 m!42643))

(declare-fun m!42645 () Bool)

(assert (=> b!49135 m!42645))

(assert (=> b!49135 m!42645))

(declare-fun m!42647 () Bool)

(assert (=> b!49135 m!42647))

(declare-fun m!42649 () Bool)

(assert (=> b!49135 m!42649))

(push 1)

(assert (not b!49133))

(assert (not start!7718))

(assert (not b!49135))

(assert tp_is_empty!2141)

(assert (not b!49136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9789 () Bool)

(declare-fun c!6614 () Bool)

(assert (=> d!9789 (= c!6614 (is-Nil!1309 l!1333))))

(declare-fun e!31563 () (Set tuple2!1812))

(assert (=> d!9789 (= (content!54 l!1333) e!31563)))

(declare-fun b!49151 () Bool)

(assert (=> b!49151 (= e!31563 (as emptyset (Set tuple2!1812)))))

(declare-fun b!49152 () Bool)

(assert (=> b!49152 (= e!31563 (union (insert (h!1888 l!1333) (as emptyset (Set tuple2!1812))) (content!54 (t!4343 l!1333))))))

(assert (= (and d!9789 c!6614) b!49151))

(assert (= (and d!9789 (not c!6614)) b!49152))

(declare-fun m!42655 () Bool)

(assert (=> b!49152 m!42655))

(declare-fun m!42657 () Bool)

(assert (=> b!49152 m!42657))

(assert (=> b!49135 d!9789))

(declare-fun d!9795 () Bool)

(declare-fun c!6617 () Bool)

(assert (=> d!9795 (= c!6617 (is-Nil!1309 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31566 () (Set tuple2!1812))

(assert (=> d!9795 (= (content!54 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147)) e!31566)))

(declare-fun b!49157 () Bool)

(assert (=> b!49157 (= e!31566 (as emptyset (Set tuple2!1812)))))

(declare-fun b!49158 () Bool)

(assert (=> b!49158 (= e!31566 (union (insert (h!1888 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147)) (as emptyset (Set tuple2!1812))) (content!54 (t!4343 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9795 c!6617) b!49157))

(assert (= (and d!9795 (not c!6617)) b!49158))

(declare-fun m!42667 () Bool)

(assert (=> b!49158 m!42667))

(declare-fun m!42669 () Bool)

(assert (=> b!49158 m!42669))

(assert (=> b!49135 d!9795))

(declare-fun bm!3827 () Bool)

(declare-fun e!31605 () List!1312)

(declare-fun c!6649 () Bool)

(declare-fun call!3830 () List!1312)

(declare-fun $colon$colon!56 (List!1312 tuple2!1812) List!1312)

(assert (=> bm!3827 (= call!3830 ($colon$colon!56 e!31605 (ite c!6649 (h!1888 l!1333) (tuple2!1813 newKey!147 newValue!147))))))

(declare-fun c!6647 () Bool)

(assert (=> bm!3827 (= c!6647 c!6649)))

(declare-fun b!49231 () Bool)

(declare-fun e!31603 () List!1312)

(declare-fun call!3831 () List!1312)

(assert (=> b!49231 (= e!31603 call!3831)))

(declare-fun b!49232 () Bool)

(declare-fun e!31607 () List!1312)

(declare-fun call!3832 () List!1312)

(assert (=> b!49232 (= e!31607 call!3832)))

(declare-fun d!9801 () Bool)

(declare-fun e!31604 () Bool)

(assert (=> d!9801 e!31604))

(declare-fun res!28508 () Bool)

(assert (=> d!9801 (=> (not res!28508) (not e!31604))))

(declare-fun lt!20731 () List!1312)

(assert (=> d!9801 (= res!28508 (isStrictlySorted!276 lt!20731))))

(declare-fun e!31606 () List!1312)

(assert (=> d!9801 (= lt!20731 e!31606)))

(assert (=> d!9801 (= c!6649 (and (is-Cons!1308 l!1333) (bvslt (_1!917 (h!1888 l!1333)) newKey!147)))))

(assert (=> d!9801 (isStrictlySorted!276 l!1333)))

(assert (=> d!9801 (= (insertStrictlySorted!39 l!1333 newKey!147 newValue!147) lt!20731)))

(declare-fun b!49233 () Bool)

(declare-fun c!6648 () Bool)

(assert (=> b!49233 (= c!6648 (and (is-Cons!1308 l!1333) (bvsgt (_1!917 (h!1888 l!1333)) newKey!147)))))

(assert (=> b!49233 (= e!31603 e!31607)))

(declare-fun b!49234 () Bool)

(declare-fun res!28509 () Bool)

(assert (=> b!49234 (=> (not res!28509) (not e!31604))))

(assert (=> b!49234 (= res!28509 (containsKey!125 lt!20731 newKey!147))))

(declare-fun bm!3828 () Bool)

(assert (=> bm!3828 (= call!3831 call!3830)))

(declare-fun b!49235 () Bool)

(assert (=> b!49235 (= e!31607 call!3832)))

(declare-fun b!49236 () Bool)

(assert (=> b!49236 (= e!31606 call!3830)))

(declare-fun b!49237 () Bool)

(declare-fun contains!611 (List!1312 tuple2!1812) Bool)

(assert (=> b!49237 (= e!31604 (contains!611 lt!20731 (tuple2!1813 newKey!147 newValue!147)))))

(declare-fun bm!3829 () Bool)

(assert (=> bm!3829 (= call!3832 call!3831)))

(declare-fun b!49238 () Bool)

(assert (=> b!49238 (= e!31606 e!31603)))

(declare-fun c!6650 () Bool)

(assert (=> b!49238 (= c!6650 (and (is-Cons!1308 l!1333) (= (_1!917 (h!1888 l!1333)) newKey!147)))))

(declare-fun b!49239 () Bool)

(assert (=> b!49239 (= e!31605 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147))))

(declare-fun b!49240 () Bool)

(assert (=> b!49240 (= e!31605 (ite c!6650 (t!4343 l!1333) (ite c!6648 (Cons!1308 (h!1888 l!1333) (t!4343 l!1333)) Nil!1309)))))

(assert (= (and d!9801 c!6649) b!49236))

(assert (= (and d!9801 (not c!6649)) b!49238))

(assert (= (and b!49238 c!6650) b!49231))

(assert (= (and b!49238 (not c!6650)) b!49233))

(assert (= (and b!49233 c!6648) b!49235))

(assert (= (and b!49233 (not c!6648)) b!49232))

(assert (= (or b!49235 b!49232) bm!3829))

(assert (= (or b!49231 bm!3829) bm!3828))

(assert (= (or b!49236 bm!3828) bm!3827))

(assert (= (and bm!3827 c!6647) b!49239))

(assert (= (and bm!3827 (not c!6647)) b!49240))

(assert (= (and d!9801 res!28508) b!49234))

(assert (= (and b!49234 res!28509) b!49237))

(declare-fun m!42681 () Bool)

(assert (=> bm!3827 m!42681))

(declare-fun m!42685 () Bool)

(assert (=> d!9801 m!42685))

(assert (=> d!9801 m!42637))

(declare-fun m!42691 () Bool)

(assert (=> b!49234 m!42691))

(declare-fun m!42694 () Bool)

(assert (=> b!49237 m!42694))

(declare-fun m!42697 () Bool)

(assert (=> b!49239 m!42697))

(assert (=> b!49135 d!9801))

(declare-fun d!9807 () Bool)

(assert (=> d!9807 (= (union (content!54 (t!4343 l!1333)) (insert (tuple2!1813 newKey!147 newValue!147) (as emptyset (Set tuple2!1812)))) (content!54 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147)))))

(declare-fun lt!20739 () Unit!1373)

(declare-fun choose!285 (List!1312 (_ BitVec 64) B!990) Unit!1373)

(assert (=> d!9807 (= lt!20739 (choose!285 (t!4343 l!1333) newKey!147 newValue!147))))

(assert (=> d!9807 (isStrictlySorted!276 (t!4343 l!1333))))

(assert (=> d!9807 (= (lemmaInsertStrictlySortedNotContainedContent!9 (t!4343 l!1333) newKey!147 newValue!147) lt!20739)))

(declare-fun bs!2282 () Bool)

(assert (= bs!2282 d!9807))

(assert (=> bs!2282 m!42697))

(assert (=> bs!2282 m!42697))

(declare-fun m!42707 () Bool)

(assert (=> bs!2282 m!42707))

(declare-fun m!42711 () Bool)

(assert (=> bs!2282 m!42711))

(declare-fun m!42715 () Bool)

(assert (=> bs!2282 m!42715))

(assert (=> bs!2282 m!42657))

(assert (=> bs!2282 m!42641))

(assert (=> b!49135 d!9807))

(declare-fun d!9811 () Bool)

(declare-fun res!28527 () Bool)

(declare-fun e!31628 () Bool)

(assert (=> d!9811 (=> res!28527 e!31628)))

(assert (=> d!9811 (= res!28527 (and (is-Cons!1308 l!1333) (= (_1!917 (h!1888 l!1333)) newKey!147)))))

(assert (=> d!9811 (= (containsKey!125 l!1333 newKey!147) e!31628)))

(declare-fun b!49267 () Bool)

(declare-fun e!31630 () Bool)

(assert (=> b!49267 (= e!31628 e!31630)))

(declare-fun res!28529 () Bool)

(assert (=> b!49267 (=> (not res!28529) (not e!31630))))

(assert (=> b!49267 (= res!28529 (and (or (not (is-Cons!1308 l!1333)) (bvsle (_1!917 (h!1888 l!1333)) newKey!147)) (is-Cons!1308 l!1333) (bvslt (_1!917 (h!1888 l!1333)) newKey!147)))))

(declare-fun b!49268 () Bool)

(assert (=> b!49268 (= e!31630 (containsKey!125 (t!4343 l!1333) newKey!147))))

(assert (= (and d!9811 (not res!28527)) b!49267))

(assert (= (and b!49267 res!28529) b!49268))

(declare-fun m!42725 () Bool)

(assert (=> b!49268 m!42725))

(assert (=> b!49133 d!9811))

(declare-fun d!9821 () Bool)

(declare-fun res!28546 () Bool)

(declare-fun e!31647 () Bool)

(assert (=> d!9821 (=> res!28546 e!31647)))

(assert (=> d!9821 (= res!28546 (or (is-Nil!1309 l!1333) (is-Nil!1309 (t!4343 l!1333))))))

(assert (=> d!9821 (= (isStrictlySorted!276 l!1333) e!31647)))

(declare-fun b!49285 () Bool)

(declare-fun e!31648 () Bool)

(assert (=> b!49285 (= e!31647 e!31648)))

(declare-fun res!28547 () Bool)

(assert (=> b!49285 (=> (not res!28547) (not e!31648))))

(assert (=> b!49285 (= res!28547 (bvslt (_1!917 (h!1888 l!1333)) (_1!917 (h!1888 (t!4343 l!1333)))))))

(declare-fun b!49286 () Bool)

(assert (=> b!49286 (= e!31648 (isStrictlySorted!276 (t!4343 l!1333)))))

(assert (= (and d!9821 (not res!28546)) b!49285))

(assert (= (and b!49285 res!28547) b!49286))

(assert (=> b!49286 m!42715))

(assert (=> start!7718 d!9821))

(declare-fun b!49301 () Bool)

(declare-fun e!31657 () Bool)

(declare-fun tp!6509 () Bool)

(assert (=> b!49301 (= e!31657 (and tp_is_empty!2141 tp!6509))))

(assert (=> b!49136 (= tp!6500 e!31657)))

(assert (= (and b!49136 (is-Cons!1308 (t!4343 l!1333))) b!49301))

(push 1)

(assert (not b!49239))

(assert (not b!49234))

(assert (not b!49158))

(assert (not bm!3827))

(assert tp_is_empty!2141)

(assert (not b!49237))

(assert (not b!49152))

(assert (not d!9807))

(assert (not b!49268))

(assert (not d!9801))

(assert (not b!49301))

(assert (not b!49286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9867 () Bool)

(declare-fun res!28580 () Bool)

(declare-fun e!31704 () Bool)

(assert (=> d!9867 (=> res!28580 e!31704)))

(assert (=> d!9867 (= res!28580 (or (is-Nil!1309 lt!20731) (is-Nil!1309 (t!4343 lt!20731))))))

(assert (=> d!9867 (= (isStrictlySorted!276 lt!20731) e!31704)))

(declare-fun b!49364 () Bool)

(declare-fun e!31705 () Bool)

(assert (=> b!49364 (= e!31704 e!31705)))

(declare-fun res!28581 () Bool)

(assert (=> b!49364 (=> (not res!28581) (not e!31705))))

(assert (=> b!49364 (= res!28581 (bvslt (_1!917 (h!1888 lt!20731)) (_1!917 (h!1888 (t!4343 lt!20731)))))))

(declare-fun b!49365 () Bool)

(assert (=> b!49365 (= e!31705 (isStrictlySorted!276 (t!4343 lt!20731)))))

(assert (= (and d!9867 (not res!28580)) b!49364))

(assert (= (and b!49364 res!28581) b!49365))

(declare-fun m!42801 () Bool)

(assert (=> b!49365 m!42801))

(assert (=> d!9801 d!9867))

(assert (=> d!9801 d!9821))

(declare-fun d!9869 () Bool)

(declare-fun res!28582 () Bool)

(declare-fun e!31706 () Bool)

(assert (=> d!9869 (=> res!28582 e!31706)))

(assert (=> d!9869 (= res!28582 (and (is-Cons!1308 (t!4343 l!1333)) (= (_1!917 (h!1888 (t!4343 l!1333))) newKey!147)))))

(assert (=> d!9869 (= (containsKey!125 (t!4343 l!1333) newKey!147) e!31706)))

(declare-fun b!49366 () Bool)

(declare-fun e!31707 () Bool)

(assert (=> b!49366 (= e!31706 e!31707)))

(declare-fun res!28583 () Bool)

(assert (=> b!49366 (=> (not res!28583) (not e!31707))))

(assert (=> b!49366 (= res!28583 (and (or (not (is-Cons!1308 (t!4343 l!1333))) (bvsle (_1!917 (h!1888 (t!4343 l!1333))) newKey!147)) (is-Cons!1308 (t!4343 l!1333)) (bvslt (_1!917 (h!1888 (t!4343 l!1333))) newKey!147)))))

(declare-fun b!49367 () Bool)

(assert (=> b!49367 (= e!31707 (containsKey!125 (t!4343 (t!4343 l!1333)) newKey!147))))

(assert (= (and d!9869 (not res!28582)) b!49366))

(assert (= (and b!49366 res!28583) b!49367))

(declare-fun m!42803 () Bool)

(assert (=> b!49367 m!42803))

(assert (=> b!49268 d!9869))

(declare-fun lt!20752 () Bool)

(declare-fun d!9871 () Bool)

(assert (=> d!9871 (= lt!20752 (member (tuple2!1813 newKey!147 newValue!147) (content!54 lt!20731)))))

(declare-fun e!31713 () Bool)

(assert (=> d!9871 (= lt!20752 e!31713)))

(declare-fun res!28588 () Bool)

(assert (=> d!9871 (=> (not res!28588) (not e!31713))))

(assert (=> d!9871 (= res!28588 (is-Cons!1308 lt!20731))))

(assert (=> d!9871 (= (contains!611 lt!20731 (tuple2!1813 newKey!147 newValue!147)) lt!20752)))

(declare-fun b!49372 () Bool)

(declare-fun e!31712 () Bool)

(assert (=> b!49372 (= e!31713 e!31712)))

(declare-fun res!28589 () Bool)

(assert (=> b!49372 (=> res!28589 e!31712)))

(assert (=> b!49372 (= res!28589 (= (h!1888 lt!20731) (tuple2!1813 newKey!147 newValue!147)))))

(declare-fun b!49373 () Bool)

(assert (=> b!49373 (= e!31712 (contains!611 (t!4343 lt!20731) (tuple2!1813 newKey!147 newValue!147)))))

(assert (= (and d!9871 res!28588) b!49372))

(assert (= (and b!49372 (not res!28589)) b!49373))

(declare-fun m!42805 () Bool)

(assert (=> d!9871 m!42805))

(declare-fun m!42807 () Bool)

(assert (=> d!9871 m!42807))

(declare-fun m!42809 () Bool)

(assert (=> b!49373 m!42809))

(assert (=> b!49237 d!9871))

(declare-fun d!9873 () Bool)

(declare-fun c!6669 () Bool)

(assert (=> d!9873 (= c!6669 (is-Nil!1309 (t!4343 l!1333)))))

(declare-fun e!31714 () (Set tuple2!1812))

(assert (=> d!9873 (= (content!54 (t!4343 l!1333)) e!31714)))

(declare-fun b!49374 () Bool)

(assert (=> b!49374 (= e!31714 (as emptyset (Set tuple2!1812)))))

(declare-fun b!49375 () Bool)

(assert (=> b!49375 (= e!31714 (union (insert (h!1888 (t!4343 l!1333)) (as emptyset (Set tuple2!1812))) (content!54 (t!4343 (t!4343 l!1333)))))))

(assert (= (and d!9873 c!6669) b!49374))

(assert (= (and d!9873 (not c!6669)) b!49375))

(declare-fun m!42811 () Bool)

(assert (=> b!49375 m!42811))

(declare-fun m!42813 () Bool)

(assert (=> b!49375 m!42813))

(assert (=> b!49152 d!9873))

(declare-fun d!9875 () Bool)

(declare-fun res!28590 () Bool)

(declare-fun e!31715 () Bool)

(assert (=> d!9875 (=> res!28590 e!31715)))

(assert (=> d!9875 (= res!28590 (and (is-Cons!1308 lt!20731) (= (_1!917 (h!1888 lt!20731)) newKey!147)))))

(assert (=> d!9875 (= (containsKey!125 lt!20731 newKey!147) e!31715)))

(declare-fun b!49376 () Bool)

(declare-fun e!31716 () Bool)

(assert (=> b!49376 (= e!31715 e!31716)))

(declare-fun res!28591 () Bool)

(assert (=> b!49376 (=> (not res!28591) (not e!31716))))

(assert (=> b!49376 (= res!28591 (and (or (not (is-Cons!1308 lt!20731)) (bvsle (_1!917 (h!1888 lt!20731)) newKey!147)) (is-Cons!1308 lt!20731) (bvslt (_1!917 (h!1888 lt!20731)) newKey!147)))))

(declare-fun b!49377 () Bool)

(assert (=> b!49377 (= e!31716 (containsKey!125 (t!4343 lt!20731) newKey!147))))

(assert (= (and d!9875 (not res!28590)) b!49376))

(assert (= (and b!49376 res!28591) b!49377))

(declare-fun m!42815 () Bool)

(assert (=> b!49377 m!42815))

(assert (=> b!49234 d!9875))

(declare-fun d!9877 () Bool)

(declare-fun res!28592 () Bool)

(declare-fun e!31717 () Bool)

(assert (=> d!9877 (=> res!28592 e!31717)))

(assert (=> d!9877 (= res!28592 (or (is-Nil!1309 (t!4343 l!1333)) (is-Nil!1309 (t!4343 (t!4343 l!1333)))))))

(assert (=> d!9877 (= (isStrictlySorted!276 (t!4343 l!1333)) e!31717)))

(declare-fun b!49378 () Bool)

(declare-fun e!31718 () Bool)

(assert (=> b!49378 (= e!31717 e!31718)))

(declare-fun res!28593 () Bool)

(assert (=> b!49378 (=> (not res!28593) (not e!31718))))

(assert (=> b!49378 (= res!28593 (bvslt (_1!917 (h!1888 (t!4343 l!1333))) (_1!917 (h!1888 (t!4343 (t!4343 l!1333))))))))

(declare-fun b!49379 () Bool)

(assert (=> b!49379 (= e!31718 (isStrictlySorted!276 (t!4343 (t!4343 l!1333))))))

(assert (= (and d!9877 (not res!28592)) b!49378))

(assert (= (and b!49378 res!28593) b!49379))

(declare-fun m!42817 () Bool)

(assert (=> b!49379 m!42817))

(assert (=> b!49286 d!9877))

(declare-fun d!9879 () Bool)

(assert (=> d!9879 (= ($colon$colon!56 e!31605 (ite c!6649 (h!1888 l!1333) (tuple2!1813 newKey!147 newValue!147))) (Cons!1308 (ite c!6649 (h!1888 l!1333) (tuple2!1813 newKey!147 newValue!147)) e!31605))))

(assert (=> bm!3827 d!9879))

(declare-fun c!6670 () Bool)

(declare-fun d!9881 () Bool)

(assert (=> d!9881 (= c!6670 (is-Nil!1309 (t!4343 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31719 () (Set tuple2!1812))

(assert (=> d!9881 (= (content!54 (t!4343 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147))) e!31719)))

(declare-fun b!49380 () Bool)

(assert (=> b!49380 (= e!31719 (as emptyset (Set tuple2!1812)))))

(declare-fun b!49381 () Bool)

(assert (=> b!49381 (= e!31719 (union (insert (h!1888 (t!4343 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147))) (as emptyset (Set tuple2!1812))) (content!54 (t!4343 (t!4343 (insertStrictlySorted!39 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9881 c!6670) b!49380))

(assert (= (and d!9881 (not c!6670)) b!49381))

(declare-fun m!42819 () Bool)

(assert (=> b!49381 m!42819))

(declare-fun m!42821 () Bool)

(assert (=> b!49381 m!42821))

(assert (=> b!49158 d!9881))

(declare-fun d!9883 () Bool)

(assert (=> d!9883 (= (union (content!54 (t!4343 l!1333)) (insert (tuple2!1813 newKey!147 newValue!147) (as emptyset (Set tuple2!1812)))) (content!54 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147)))))

(assert (=> d!9883 true))

(declare-fun _$19!29 () Unit!1373)

(assert (=> d!9883 (= (choose!285 (t!4343 l!1333) newKey!147 newValue!147) _$19!29)))

(declare-fun bs!2286 () Bool)

(assert (= bs!2286 d!9883))

(assert (=> bs!2286 m!42657))

(assert (=> bs!2286 m!42641))

(assert (=> bs!2286 m!42697))

(assert (=> bs!2286 m!42697))

(assert (=> bs!2286 m!42707))

(assert (=> d!9807 d!9883))

(assert (=> d!9807 d!9873))

(declare-fun call!3842 () List!1312)

(declare-fun bm!3839 () Bool)

(declare-fun e!31722 () List!1312)

(declare-fun c!6673 () Bool)

(assert (=> bm!3839 (= call!3842 ($colon$colon!56 e!31722 (ite c!6673 (h!1888 (t!4343 l!1333)) (tuple2!1813 newKey!147 newValue!147))))))

(declare-fun c!6671 () Bool)

(assert (=> bm!3839 (= c!6671 c!6673)))

(declare-fun b!49382 () Bool)

(declare-fun e!31720 () List!1312)

(declare-fun call!3843 () List!1312)

(assert (=> b!49382 (= e!31720 call!3843)))

(declare-fun b!49383 () Bool)

(declare-fun e!31724 () List!1312)

(declare-fun call!3844 () List!1312)

(assert (=> b!49383 (= e!31724 call!3844)))

(declare-fun d!9885 () Bool)

(declare-fun e!31721 () Bool)

(assert (=> d!9885 e!31721))

(declare-fun res!28594 () Bool)

(assert (=> d!9885 (=> (not res!28594) (not e!31721))))

(declare-fun lt!20753 () List!1312)

(assert (=> d!9885 (= res!28594 (isStrictlySorted!276 lt!20753))))

(declare-fun e!31723 () List!1312)

(assert (=> d!9885 (= lt!20753 e!31723)))

(assert (=> d!9885 (= c!6673 (and (is-Cons!1308 (t!4343 l!1333)) (bvslt (_1!917 (h!1888 (t!4343 l!1333))) newKey!147)))))

(assert (=> d!9885 (isStrictlySorted!276 (t!4343 l!1333))))

(assert (=> d!9885 (= (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147) lt!20753)))

(declare-fun b!49384 () Bool)

(declare-fun c!6672 () Bool)

(assert (=> b!49384 (= c!6672 (and (is-Cons!1308 (t!4343 l!1333)) (bvsgt (_1!917 (h!1888 (t!4343 l!1333))) newKey!147)))))

(assert (=> b!49384 (= e!31720 e!31724)))

(declare-fun b!49385 () Bool)

(declare-fun res!28595 () Bool)

(assert (=> b!49385 (=> (not res!28595) (not e!31721))))

(assert (=> b!49385 (= res!28595 (containsKey!125 lt!20753 newKey!147))))

(declare-fun bm!3840 () Bool)

(assert (=> bm!3840 (= call!3843 call!3842)))

(declare-fun b!49386 () Bool)

(assert (=> b!49386 (= e!31724 call!3844)))

(declare-fun b!49387 () Bool)

(assert (=> b!49387 (= e!31723 call!3842)))

(declare-fun b!49388 () Bool)

(assert (=> b!49388 (= e!31721 (contains!611 lt!20753 (tuple2!1813 newKey!147 newValue!147)))))

(declare-fun bm!3841 () Bool)

(assert (=> bm!3841 (= call!3844 call!3843)))

(declare-fun b!49389 () Bool)

(assert (=> b!49389 (= e!31723 e!31720)))

(declare-fun c!6674 () Bool)

(assert (=> b!49389 (= c!6674 (and (is-Cons!1308 (t!4343 l!1333)) (= (_1!917 (h!1888 (t!4343 l!1333))) newKey!147)))))

(declare-fun b!49390 () Bool)

(assert (=> b!49390 (= e!31722 (insertStrictlySorted!39 (t!4343 (t!4343 l!1333)) newKey!147 newValue!147))))

(declare-fun b!49391 () Bool)

(assert (=> b!49391 (= e!31722 (ite c!6674 (t!4343 (t!4343 l!1333)) (ite c!6672 (Cons!1308 (h!1888 (t!4343 l!1333)) (t!4343 (t!4343 l!1333))) Nil!1309)))))

(assert (= (and d!9885 c!6673) b!49387))

(assert (= (and d!9885 (not c!6673)) b!49389))

(assert (= (and b!49389 c!6674) b!49382))

(assert (= (and b!49389 (not c!6674)) b!49384))

(assert (= (and b!49384 c!6672) b!49386))

(assert (= (and b!49384 (not c!6672)) b!49383))

(assert (= (or b!49386 b!49383) bm!3841))

(assert (= (or b!49382 bm!3841) bm!3840))

(assert (= (or b!49387 bm!3840) bm!3839))

(assert (= (and bm!3839 c!6671) b!49390))

(assert (= (and bm!3839 (not c!6671)) b!49391))

(assert (= (and d!9885 res!28594) b!49385))

(assert (= (and b!49385 res!28595) b!49388))

(declare-fun m!42823 () Bool)

(assert (=> bm!3839 m!42823))

(declare-fun m!42825 () Bool)

(assert (=> d!9885 m!42825))

(assert (=> d!9885 m!42715))

(declare-fun m!42827 () Bool)

(assert (=> b!49385 m!42827))

(declare-fun m!42829 () Bool)

(assert (=> b!49388 m!42829))

(declare-fun m!42831 () Bool)

(assert (=> b!49390 m!42831))

(assert (=> d!9807 d!9885))

(declare-fun c!6675 () Bool)

(declare-fun d!9887 () Bool)

(assert (=> d!9887 (= c!6675 (is-Nil!1309 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147)))))

(declare-fun e!31725 () (Set tuple2!1812))

(assert (=> d!9887 (= (content!54 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147)) e!31725)))

(declare-fun b!49392 () Bool)

(assert (=> b!49392 (= e!31725 (as emptyset (Set tuple2!1812)))))

(declare-fun b!49393 () Bool)

(assert (=> b!49393 (= e!31725 (union (insert (h!1888 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147)) (as emptyset (Set tuple2!1812))) (content!54 (t!4343 (insertStrictlySorted!39 (t!4343 l!1333) newKey!147 newValue!147)))))))

(assert (= (and d!9887 c!6675) b!49392))

(assert (= (and d!9887 (not c!6675)) b!49393))

(declare-fun m!42833 () Bool)

(assert (=> b!49393 m!42833))

(declare-fun m!42835 () Bool)

(assert (=> b!49393 m!42835))

(assert (=> d!9807 d!9887))

(assert (=> d!9807 d!9877))

(assert (=> b!49239 d!9885))

(declare-fun b!49394 () Bool)

(declare-fun e!31726 () Bool)

(declare-fun tp!6512 () Bool)

(assert (=> b!49394 (= e!31726 (and tp_is_empty!2141 tp!6512))))

(assert (=> b!49301 (= tp!6509 e!31726)))

(assert (= (and b!49301 (is-Cons!1308 (t!4343 (t!4343 l!1333)))) b!49394))

(push 1)

(assert (not d!9883))

(assert (not b!49365))

(assert (not b!49367))

(assert (not b!49379))

(assert (not b!49390))

(assert (not b!49385))

(assert (not b!49393))

(assert (not bm!3839))

(assert (not b!49375))

(assert (not b!49388))

(assert tp_is_empty!2141)

(assert (not b!49381))

(assert (not b!49373))

(assert (not b!49377))

(assert (not d!9871))

(assert (not d!9885))

(assert (not b!49394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

