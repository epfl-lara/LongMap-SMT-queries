; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85232 () Bool)

(assert start!85232)

(declare-fun res!663567 () Bool)

(declare-fun e!560157 () Bool)

(assert (=> start!85232 (=> (not res!663567) (not e!560157))))

(declare-datatypes ((List!20902 0))(
  ( (Nil!20899) (Cons!20898 (h!22060 (_ BitVec 64)) (t!29903 List!20902)) )
))
(declare-fun l!3519 () List!20902)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5763 (List!20902 (_ BitVec 64)) Bool)

(assert (=> start!85232 (= res!663567 (not (contains!5763 l!3519 e!29)))))

(assert (=> start!85232 e!560157))

(assert (=> start!85232 true))

(declare-fun b!992842 () Bool)

(declare-fun ListPrimitiveSize!91 (List!20902) Int)

(assert (=> b!992842 (= e!560157 (< (ListPrimitiveSize!91 l!3519) 0))))

(assert (= (and start!85232 res!663567) b!992842))

(declare-fun m!920551 () Bool)

(assert (=> start!85232 m!920551))

(declare-fun m!920553 () Bool)

(assert (=> b!992842 m!920553))

(push 1)

(assert (not start!85232))

(assert (not b!992842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118315 () Bool)

(declare-fun lt!440322 () Bool)

(declare-fun content!454 (List!20902) (Set (_ BitVec 64)))

(assert (=> d!118315 (= lt!440322 (set.member e!29 (content!454 l!3519)))))

(declare-fun e!560176 () Bool)

(assert (=> d!118315 (= lt!440322 e!560176)))

(declare-fun res!663582 () Bool)

(assert (=> d!118315 (=> (not res!663582) (not e!560176))))

(assert (=> d!118315 (= res!663582 (is-Cons!20898 l!3519))))

(assert (=> d!118315 (= (contains!5763 l!3519 e!29) lt!440322)))

(declare-fun b!992863 () Bool)

(declare-fun e!560175 () Bool)

(assert (=> b!992863 (= e!560176 e!560175)))

(declare-fun res!663583 () Bool)

(assert (=> b!992863 (=> res!663583 e!560175)))

(assert (=> b!992863 (= res!663583 (= (h!22060 l!3519) e!29))))

(declare-fun b!992864 () Bool)

(assert (=> b!992864 (= e!560175 (contains!5763 (t!29903 l!3519) e!29))))

(assert (= (and d!118315 res!663582) b!992863))

(assert (= (and b!992863 (not res!663583)) b!992864))

(declare-fun m!920565 () Bool)

(assert (=> d!118315 m!920565))

(declare-fun m!920567 () Bool)

(assert (=> d!118315 m!920567))

(declare-fun m!920569 () Bool)

(assert (=> b!992864 m!920569))

(assert (=> start!85232 d!118315))

(declare-fun d!118323 () Bool)

(declare-fun lt!440331 () Int)

(assert (=> d!118323 (>= lt!440331 0)))

(declare-fun e!560189 () Int)

(assert (=> d!118323 (= lt!440331 e!560189)))

(declare-fun c!100782 () Bool)

(assert (=> d!118323 (= c!100782 (is-Nil!20899 l!3519))))

(assert (=> d!118323 (= (ListPrimitiveSize!91 l!3519) lt!440331)))

(declare-fun b!992881 () Bool)

(assert (=> b!992881 (= e!560189 0)))

(declare-fun b!992882 () Bool)

(assert (=> b!992882 (= e!560189 (+ 1 (ListPrimitiveSize!91 (t!29903 l!3519))))))

(assert (= (and d!118323 c!100782) b!992881))

(assert (= (and d!118323 (not c!100782)) b!992882))

(declare-fun m!920579 () Bool)

(assert (=> b!992882 m!920579))

(assert (=> b!992842 d!118323))

(push 1)

