; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85250 () Bool)

(assert start!85250)

(declare-fun res!663596 () Bool)

(declare-fun e!560196 () Bool)

(assert (=> start!85250 (=> (not res!663596) (not e!560196))))

(declare-datatypes ((List!20905 0))(
  ( (Nil!20902) (Cons!20901 (h!22063 (_ BitVec 64)) (t!29906 List!20905)) )
))
(declare-fun l!3519 () List!20905)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5766 (List!20905 (_ BitVec 64)) Bool)

(assert (=> start!85250 (= res!663596 (not (contains!5766 l!3519 e!29)))))

(assert (=> start!85250 e!560196))

(assert (=> start!85250 true))

(declare-fun b!992889 () Bool)

(declare-fun e!560195 () Bool)

(assert (=> b!992889 (= e!560196 e!560195)))

(declare-fun res!663597 () Bool)

(assert (=> b!992889 (=> (not res!663597) (not e!560195))))

(declare-datatypes ((tuple2!14988 0))(
  ( (tuple2!14989 (_1!7505 (_ BitVec 64)) (_2!7505 List!20905)) )
))
(declare-datatypes ((Option!549 0))(
  ( (Some!548 (v!14370 tuple2!14988)) (None!547) )
))
(declare-fun lt!440335 () Option!549)

(declare-fun isEmpty!756 (Option!549) Bool)

(assert (=> b!992889 (= res!663597 (not (isEmpty!756 lt!440335)))))

(declare-fun unapply!28 (List!20905) Option!549)

(assert (=> b!992889 (= lt!440335 (unapply!28 l!3519))))

(declare-fun b!992890 () Bool)

(declare-fun get!15713 (Option!549) tuple2!14988)

(assert (=> b!992890 (= e!560195 (contains!5766 (_2!7505 (get!15713 lt!440335)) e!29))))

(assert (= (and start!85250 res!663596) b!992889))

(assert (= (and b!992889 res!663597) b!992890))

(declare-fun m!920587 () Bool)

(assert (=> start!85250 m!920587))

(declare-fun m!920589 () Bool)

(assert (=> b!992889 m!920589))

(declare-fun m!920591 () Bool)

(assert (=> b!992889 m!920591))

(declare-fun m!920593 () Bool)

(assert (=> b!992890 m!920593))

(declare-fun m!920595 () Bool)

(assert (=> b!992890 m!920595))

(push 1)

(assert (not b!992890))

(assert (not start!85250))

(assert (not b!992889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118331 () Bool)

(declare-fun lt!440344 () Bool)

(declare-fun content!457 (List!20905) (Set (_ BitVec 64)))

(assert (=> d!118331 (= lt!440344 (set.member e!29 (content!457 (_2!7505 (get!15713 lt!440335)))))))

(declare-fun e!560214 () Bool)

(assert (=> d!118331 (= lt!440344 e!560214)))

(declare-fun res!663614 () Bool)

(assert (=> d!118331 (=> (not res!663614) (not e!560214))))

(assert (=> d!118331 (= res!663614 (is-Cons!20901 (_2!7505 (get!15713 lt!440335))))))

(assert (=> d!118331 (= (contains!5766 (_2!7505 (get!15713 lt!440335)) e!29) lt!440344)))

(declare-fun b!992907 () Bool)

(declare-fun e!560213 () Bool)

(assert (=> b!992907 (= e!560214 e!560213)))

(declare-fun res!663615 () Bool)

(assert (=> b!992907 (=> res!663615 e!560213)))

(assert (=> b!992907 (= res!663615 (= (h!22063 (_2!7505 (get!15713 lt!440335))) e!29))))

(declare-fun b!992908 () Bool)

(assert (=> b!992908 (= e!560213 (contains!5766 (t!29906 (_2!7505 (get!15713 lt!440335))) e!29))))

(assert (= (and d!118331 res!663614) b!992907))

(assert (= (and b!992907 (not res!663615)) b!992908))

(declare-fun m!920617 () Bool)

(assert (=> d!118331 m!920617))

(declare-fun m!920619 () Bool)

(assert (=> d!118331 m!920619))

(declare-fun m!920621 () Bool)

(assert (=> b!992908 m!920621))

(assert (=> b!992890 d!118331))

(declare-fun d!118343 () Bool)

(assert (=> d!118343 (= (get!15713 lt!440335) (v!14370 lt!440335))))

(assert (=> b!992890 d!118343))

(declare-fun d!118345 () Bool)

(declare-fun lt!440349 () Bool)

(assert (=> d!118345 (= lt!440349 (set.member e!29 (content!457 l!3519)))))

(declare-fun e!560224 () Bool)

(assert (=> d!118345 (= lt!440349 e!560224)))

(declare-fun res!663624 () Bool)

(assert (=> d!118345 (=> (not res!663624) (not e!560224))))

(assert (=> d!118345 (= res!663624 (is-Cons!20901 l!3519))))

(assert (=> d!118345 (= (contains!5766 l!3519 e!29) lt!440349)))

(declare-fun b!992917 () Bool)

(declare-fun e!560223 () Bool)

(assert (=> b!992917 (= e!560224 e!560223)))

(declare-fun res!663625 () Bool)

(assert (=> b!992917 (=> res!663625 e!560223)))

(assert (=> b!992917 (= res!663625 (= (h!22063 l!3519) e!29))))

(declare-fun b!992918 () Bool)

(assert (=> b!992918 (= e!560223 (contains!5766 (t!29906 l!3519) e!29))))

(assert (= (and d!118345 res!663624) b!992917))

(assert (= (and b!992917 (not res!663625)) b!992918))

(declare-fun m!920623 () Bool)

(assert (=> d!118345 m!920623))

(declare-fun m!920625 () Bool)

(assert (=> d!118345 m!920625))

(declare-fun m!920627 () Bool)

(assert (=> b!992918 m!920627))

(assert (=> start!85250 d!118345))

(declare-fun d!118347 () Bool)

(assert (=> d!118347 (= (isEmpty!756 lt!440335) (not (is-Some!548 lt!440335)))))

(assert (=> b!992889 d!118347))

(declare-fun d!118349 () Bool)

(assert (=> d!118349 (= (unapply!28 l!3519) (ite (is-Nil!20902 l!3519) None!547 (Some!548 (tuple2!14989 (h!22063 l!3519) (t!29906 l!3519)))))))

(assert (=> b!992889 d!118349))

(push 1)

