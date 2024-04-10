; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2234 () Bool)

(assert start!2234)

(declare-fun res!11446 () Bool)

(declare-fun e!9001 () Bool)

(assert (=> start!2234 (=> (not res!11446) (not e!9001))))

(declare-datatypes ((B!574 0))(
  ( (B!575 (val!385 Int)) )
))
(declare-datatypes ((tuple2!570 0))(
  ( (tuple2!571 (_1!285 (_ BitVec 64)) (_2!285 B!574)) )
))
(declare-datatypes ((List!440 0))(
  ( (Nil!437) (Cons!436 (h!1002 tuple2!570) (t!2842 List!440)) )
))
(declare-datatypes ((ListLongMap!401 0))(
  ( (ListLongMap!402 (toList!216 List!440)) )
))
(declare-fun thiss!177 () ListLongMap!401)

(declare-fun size!500 (List!440) Int)

(assert (=> start!2234 (= res!11446 (< (size!500 (toList!216 thiss!177)) 2147483647))))

(assert (=> start!2234 e!9001))

(declare-fun e!9002 () Bool)

(declare-fun inv!737 (ListLongMap!401) Bool)

(assert (=> start!2234 (and (inv!737 thiss!177) e!9002)))

(declare-fun b!14947 () Bool)

(declare-fun isStrictlySorted!127 (List!440) Bool)

(assert (=> b!14947 (= e!9001 (not (isStrictlySorted!127 (toList!216 thiss!177))))))

(declare-fun b!14948 () Bool)

(declare-fun tp!2411 () Bool)

(assert (=> b!14948 (= e!9002 tp!2411)))

(assert (= (and start!2234 res!11446) b!14947))

(assert (= start!2234 b!14948))

(declare-fun m!9953 () Bool)

(assert (=> start!2234 m!9953))

(declare-fun m!9955 () Bool)

(assert (=> start!2234 m!9955))

(declare-fun m!9957 () Bool)

(assert (=> b!14947 m!9957))

(check-sat (not start!2234) (not b!14947) (not b!14948))
(check-sat)
(get-model)

(declare-fun d!2437 () Bool)

(declare-fun lt!3643 () Int)

(assert (=> d!2437 (>= lt!3643 0)))

(declare-fun e!9015 () Int)

(assert (=> d!2437 (= lt!3643 e!9015)))

(declare-fun c!1416 () Bool)

(get-info :version)

(assert (=> d!2437 (= c!1416 ((_ is Nil!437) (toList!216 thiss!177)))))

(assert (=> d!2437 (= (size!500 (toList!216 thiss!177)) lt!3643)))

(declare-fun b!14967 () Bool)

(assert (=> b!14967 (= e!9015 0)))

(declare-fun b!14968 () Bool)

(assert (=> b!14968 (= e!9015 (+ 1 (size!500 (t!2842 (toList!216 thiss!177)))))))

(assert (= (and d!2437 c!1416) b!14967))

(assert (= (and d!2437 (not c!1416)) b!14968))

(declare-fun m!9965 () Bool)

(assert (=> b!14968 m!9965))

(assert (=> start!2234 d!2437))

(declare-fun d!2443 () Bool)

(assert (=> d!2443 (= (inv!737 thiss!177) (isStrictlySorted!127 (toList!216 thiss!177)))))

(declare-fun bs!612 () Bool)

(assert (= bs!612 d!2443))

(assert (=> bs!612 m!9957))

(assert (=> start!2234 d!2443))

(declare-fun d!2449 () Bool)

(declare-fun res!11462 () Bool)

(declare-fun e!9030 () Bool)

(assert (=> d!2449 (=> res!11462 e!9030)))

(assert (=> d!2449 (= res!11462 (or ((_ is Nil!437) (toList!216 thiss!177)) ((_ is Nil!437) (t!2842 (toList!216 thiss!177)))))))

(assert (=> d!2449 (= (isStrictlySorted!127 (toList!216 thiss!177)) e!9030)))

(declare-fun b!14985 () Bool)

(declare-fun e!9031 () Bool)

(assert (=> b!14985 (= e!9030 e!9031)))

(declare-fun res!11463 () Bool)

(assert (=> b!14985 (=> (not res!11463) (not e!9031))))

(assert (=> b!14985 (= res!11463 (bvslt (_1!285 (h!1002 (toList!216 thiss!177))) (_1!285 (h!1002 (t!2842 (toList!216 thiss!177))))))))

(declare-fun b!14986 () Bool)

(assert (=> b!14986 (= e!9031 (isStrictlySorted!127 (t!2842 (toList!216 thiss!177))))))

(assert (= (and d!2449 (not res!11462)) b!14985))

(assert (= (and b!14985 res!11463) b!14986))

(declare-fun m!9971 () Bool)

(assert (=> b!14986 m!9971))

(assert (=> b!14947 d!2449))

(declare-fun b!15003 () Bool)

(declare-fun e!9042 () Bool)

(declare-fun tp_is_empty!753 () Bool)

(declare-fun tp!2421 () Bool)

(assert (=> b!15003 (= e!9042 (and tp_is_empty!753 tp!2421))))

(assert (=> b!14948 (= tp!2411 e!9042)))

(assert (= (and b!14948 ((_ is Cons!436) (toList!216 thiss!177))) b!15003))

(check-sat (not b!15003) (not b!14968) (not d!2443) (not b!14986) tp_is_empty!753)
(check-sat)
