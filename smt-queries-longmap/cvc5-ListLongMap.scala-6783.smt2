; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85412 () Bool)

(assert start!85412)

(declare-fun res!663844 () Bool)

(declare-fun e!560475 () Bool)

(assert (=> start!85412 (=> (not res!663844) (not e!560475))))

(declare-datatypes ((List!20920 0))(
  ( (Nil!20917) (Cons!20916 (h!22078 (_ BitVec 64)) (t!29921 List!20920)) )
))
(declare-fun l!3519 () List!20920)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5781 (List!20920 (_ BitVec 64)) Bool)

(assert (=> start!85412 (= res!663844 (not (contains!5781 l!3519 e!29)))))

(assert (=> start!85412 e!560475))

(assert (=> start!85412 true))

(declare-fun b!993245 () Bool)

(declare-fun res!663845 () Bool)

(assert (=> b!993245 (=> (not res!663845) (not e!560475))))

(declare-datatypes ((tuple2!15018 0))(
  ( (tuple2!15019 (_1!7520 (_ BitVec 64)) (_2!7520 List!20920)) )
))
(declare-datatypes ((Option!564 0))(
  ( (Some!563 (v!14400 tuple2!15018)) (None!562) )
))
(declare-fun isEmpty!771 (Option!564) Bool)

(declare-fun unapply!43 (List!20920) Option!564)

(assert (=> b!993245 (= res!663845 (isEmpty!771 (unapply!43 l!3519)))))

(declare-fun b!993246 () Bool)

(declare-fun res!663846 () Bool)

(assert (=> b!993246 (=> (not res!663846) (not e!560475))))

(assert (=> b!993246 (= res!663846 (not (is-Nil!20917 l!3519)))))

(declare-fun b!993247 () Bool)

(declare-fun -!456 (List!20920 (_ BitVec 64)) List!20920)

(assert (=> b!993247 (= e!560475 (not (= (-!456 l!3519 e!29) l!3519)))))

(assert (= (and start!85412 res!663844) b!993245))

(assert (= (and b!993245 res!663845) b!993246))

(assert (= (and b!993246 res!663846) b!993247))

(declare-fun m!920995 () Bool)

(assert (=> start!85412 m!920995))

(declare-fun m!920997 () Bool)

(assert (=> b!993245 m!920997))

(assert (=> b!993245 m!920997))

(declare-fun m!920999 () Bool)

(assert (=> b!993245 m!920999))

(declare-fun m!921001 () Bool)

(assert (=> b!993247 m!921001))

(push 1)

(assert (not b!993245))

(assert (not b!993247))

(assert (not start!85412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118507 () Bool)

(assert (=> d!118507 (= (isEmpty!771 (unapply!43 l!3519)) (not (is-Some!563 (unapply!43 l!3519))))))

(assert (=> b!993245 d!118507))

(declare-fun d!118513 () Bool)

(assert (=> d!118513 (= (unapply!43 l!3519) (ite (is-Nil!20917 l!3519) None!562 (Some!563 (tuple2!15019 (h!22078 l!3519) (t!29921 l!3519)))))))

(assert (=> b!993245 d!118513))

(declare-fun b!993305 () Bool)

(declare-fun e!560512 () List!20920)

(declare-fun call!42148 () List!20920)

(assert (=> b!993305 (= e!560512 (Cons!20916 (h!22078 l!3519) call!42148))))

(declare-fun b!993306 () Bool)

(declare-fun e!560510 () List!20920)

(assert (=> b!993306 (= e!560510 Nil!20917)))

(declare-fun b!993307 () Bool)

(assert (=> b!993307 (= e!560512 call!42148)))

(declare-fun lt!440493 () List!20920)

(declare-fun b!993308 () Bool)

(declare-fun e!560511 () Bool)

(declare-fun content!474 (List!20920) (Set (_ BitVec 64)))

(assert (=> b!993308 (= e!560511 (= (content!474 lt!440493) (set.minus (content!474 l!3519) (set.insert e!29 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!993309 () Bool)

(assert (=> b!993309 (= e!560510 e!560512)))

(declare-fun c!100852 () Bool)

(assert (=> b!993309 (= c!100852 (= e!29 (h!22078 l!3519)))))

(declare-fun bm!42145 () Bool)

(assert (=> bm!42145 (= call!42148 (-!456 (t!29921 l!3519) e!29))))

(declare-fun d!118517 () Bool)

(assert (=> d!118517 e!560511))

(declare-fun res!663876 () Bool)

(assert (=> d!118517 (=> (not res!663876) (not e!560511))))

(declare-fun size!30700 (List!20920) Int)

(assert (=> d!118517 (= res!663876 (<= (size!30700 lt!440493) (size!30700 l!3519)))))

(assert (=> d!118517 (= lt!440493 e!560510)))

(declare-fun c!100853 () Bool)

(assert (=> d!118517 (= c!100853 (is-Cons!20916 l!3519))))

(assert (=> d!118517 (= (-!456 l!3519 e!29) lt!440493)))

(assert (= (and d!118517 c!100853) b!993309))

(assert (= (and d!118517 (not c!100853)) b!993306))

(assert (= (and b!993309 c!100852) b!993307))

(assert (= (and b!993309 (not c!100852)) b!993305))

(assert (= (or b!993307 b!993305) bm!42145))

(assert (= (and d!118517 res!663876) b!993308))

(declare-fun m!921037 () Bool)

(assert (=> b!993308 m!921037))

(declare-fun m!921039 () Bool)

(assert (=> b!993308 m!921039))

(declare-fun m!921041 () Bool)

(assert (=> b!993308 m!921041))

(declare-fun m!921043 () Bool)

(assert (=> bm!42145 m!921043))

(declare-fun m!921045 () Bool)

(assert (=> d!118517 m!921045))

(declare-fun m!921047 () Bool)

(assert (=> d!118517 m!921047))

(assert (=> b!993247 d!118517))

(declare-fun d!118523 () Bool)

(declare-fun lt!440500 () Bool)

(assert (=> d!118523 (= lt!440500 (set.member e!29 (content!474 l!3519)))))

(declare-fun e!560529 () Bool)

(assert (=> d!118523 (= lt!440500 e!560529)))

(declare-fun res!663891 () Bool)

(assert (=> d!118523 (=> (not res!663891) (not e!560529))))

(assert (=> d!118523 (= res!663891 (is-Cons!20916 l!3519))))

(assert (=> d!118523 (= (contains!5781 l!3519 e!29) lt!440500)))

(declare-fun b!993327 () Bool)

(declare-fun e!560528 () Bool)

