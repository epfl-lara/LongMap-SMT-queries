; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85236 () Bool)

(assert start!85236)

(declare-fun res!663573 () Bool)

(declare-fun e!560163 () Bool)

(assert (=> start!85236 (=> (not res!663573) (not e!560163))))

(declare-datatypes ((List!20904 0))(
  ( (Nil!20901) (Cons!20900 (h!22062 (_ BitVec 64)) (t!29905 List!20904)) )
))
(declare-fun l!3519 () List!20904)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5765 (List!20904 (_ BitVec 64)) Bool)

(assert (=> start!85236 (= res!663573 (not (contains!5765 l!3519 e!29)))))

(assert (=> start!85236 e!560163))

(assert (=> start!85236 true))

(declare-fun b!992848 () Bool)

(declare-fun ListPrimitiveSize!93 (List!20904) Int)

(assert (=> b!992848 (= e!560163 (< (ListPrimitiveSize!93 l!3519) 0))))

(assert (= (and start!85236 res!663573) b!992848))

(declare-fun m!920559 () Bool)

(assert (=> start!85236 m!920559))

(declare-fun m!920561 () Bool)

(assert (=> b!992848 m!920561))

(push 1)

(assert (not b!992848))

(assert (not start!85236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118317 () Bool)

(declare-fun lt!440321 () Int)

(assert (=> d!118317 (>= lt!440321 0)))

(declare-fun e!560172 () Int)

(assert (=> d!118317 (= lt!440321 e!560172)))

(declare-fun c!100777 () Bool)

(assert (=> d!118317 (= c!100777 (is-Nil!20901 l!3519))))

(assert (=> d!118317 (= (ListPrimitiveSize!93 l!3519) lt!440321)))

(declare-fun b!992859 () Bool)

(assert (=> b!992859 (= e!560172 0)))

(declare-fun b!992860 () Bool)

(assert (=> b!992860 (= e!560172 (+ 1 (ListPrimitiveSize!93 (t!29905 l!3519))))))

(assert (= (and d!118317 c!100777) b!992859))

(assert (= (and d!118317 (not c!100777)) b!992860))

(declare-fun m!920563 () Bool)

(assert (=> b!992860 m!920563))

(assert (=> b!992848 d!118317))

(declare-fun d!118321 () Bool)

(declare-fun lt!440330 () Bool)

(declare-fun content!456 (List!20904) (Set (_ BitVec 64)))

(assert (=> d!118321 (= lt!440330 (member e!29 (content!456 l!3519)))))

(declare-fun e!560187 () Bool)

(assert (=> d!118321 (= lt!440330 e!560187)))

(declare-fun res!663590 () Bool)

(assert (=> d!118321 (=> (not res!663590) (not e!560187))))

(assert (=> d!118321 (= res!663590 (is-Cons!20900 l!3519))))

(assert (=> d!118321 (= (contains!5765 l!3519 e!29) lt!440330)))

(declare-fun b!992879 () Bool)

(declare-fun e!560188 () Bool)

(assert (=> b!992879 (= e!560187 e!560188)))

(declare-fun res!663591 () Bool)

(assert (=> b!992879 (=> res!663591 e!560188)))

(assert (=> b!992879 (= res!663591 (= (h!22062 l!3519) e!29))))

(declare-fun b!992880 () Bool)

(assert (=> b!992880 (= e!560188 (contains!5765 (t!29905 l!3519) e!29))))

(assert (= (and d!118321 res!663590) b!992879))

(assert (= (and b!992879 (not res!663591)) b!992880))

(declare-fun m!920577 () Bool)

(assert (=> d!118321 m!920577))

(declare-fun m!920581 () Bool)

