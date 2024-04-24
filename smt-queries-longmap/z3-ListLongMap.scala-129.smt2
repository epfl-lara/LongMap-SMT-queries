; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2232 () Bool)

(assert start!2232)

(declare-fun res!11441 () Bool)

(declare-fun e!8991 () Bool)

(assert (=> start!2232 (=> (not res!11441) (not e!8991))))

(declare-datatypes ((B!572 0))(
  ( (B!573 (val!384 Int)) )
))
(declare-datatypes ((tuple2!564 0))(
  ( (tuple2!565 (_1!282 (_ BitVec 64)) (_2!282 B!572)) )
))
(declare-datatypes ((List!435 0))(
  ( (Nil!432) (Cons!431 (h!997 tuple2!564) (t!2837 List!435)) )
))
(declare-datatypes ((ListLongMap!395 0))(
  ( (ListLongMap!396 (toList!213 List!435)) )
))
(declare-fun thiss!177 () ListLongMap!395)

(declare-fun size!490 (List!435) Int)

(assert (=> start!2232 (= res!11441 (< (size!490 (toList!213 thiss!177)) 2147483647))))

(assert (=> start!2232 e!8991))

(declare-fun e!8992 () Bool)

(declare-fun inv!736 (ListLongMap!395) Bool)

(assert (=> start!2232 (and (inv!736 thiss!177) e!8992)))

(declare-fun b!14935 () Bool)

(declare-fun isStrictlySorted!120 (List!435) Bool)

(assert (=> b!14935 (= e!8991 (not (isStrictlySorted!120 (toList!213 thiss!177))))))

(declare-fun b!14936 () Bool)

(declare-fun tp!2408 () Bool)

(assert (=> b!14936 (= e!8992 tp!2408)))

(assert (= (and start!2232 res!11441) b!14935))

(assert (= start!2232 b!14936))

(declare-fun m!9939 () Bool)

(assert (=> start!2232 m!9939))

(declare-fun m!9941 () Bool)

(assert (=> start!2232 m!9941))

(declare-fun m!9943 () Bool)

(assert (=> b!14935 m!9943))

(check-sat (not b!14935) (not start!2232) (not b!14936))
(check-sat)
(get-model)

(declare-fun d!2433 () Bool)

(declare-fun res!11452 () Bool)

(declare-fun e!9009 () Bool)

(assert (=> d!2433 (=> res!11452 e!9009)))

(get-info :version)

(assert (=> d!2433 (= res!11452 (or ((_ is Nil!432) (toList!213 thiss!177)) ((_ is Nil!432) (t!2837 (toList!213 thiss!177)))))))

(assert (=> d!2433 (= (isStrictlySorted!120 (toList!213 thiss!177)) e!9009)))

(declare-fun b!14953 () Bool)

(declare-fun e!9010 () Bool)

(assert (=> b!14953 (= e!9009 e!9010)))

(declare-fun res!11453 () Bool)

(assert (=> b!14953 (=> (not res!11453) (not e!9010))))

(assert (=> b!14953 (= res!11453 (bvslt (_1!282 (h!997 (toList!213 thiss!177))) (_1!282 (h!997 (t!2837 (toList!213 thiss!177))))))))

(declare-fun b!14954 () Bool)

(assert (=> b!14954 (= e!9010 (isStrictlySorted!120 (t!2837 (toList!213 thiss!177))))))

(assert (= (and d!2433 (not res!11452)) b!14953))

(assert (= (and b!14953 res!11453) b!14954))

(declare-fun m!9957 () Bool)

(assert (=> b!14954 m!9957))

(assert (=> b!14935 d!2433))

(declare-fun d!2439 () Bool)

(declare-fun lt!3645 () Int)

(assert (=> d!2439 (>= lt!3645 0)))

(declare-fun e!9019 () Int)

(assert (=> d!2439 (= lt!3645 e!9019)))

(declare-fun c!1416 () Bool)

(assert (=> d!2439 (= c!1416 ((_ is Nil!432) (toList!213 thiss!177)))))

(assert (=> d!2439 (= (size!490 (toList!213 thiss!177)) lt!3645)))

(declare-fun b!14971 () Bool)

(assert (=> b!14971 (= e!9019 0)))

(declare-fun b!14972 () Bool)

(assert (=> b!14972 (= e!9019 (+ 1 (size!490 (t!2837 (toList!213 thiss!177)))))))

(assert (= (and d!2439 c!1416) b!14971))

(assert (= (and d!2439 (not c!1416)) b!14972))

(declare-fun m!9963 () Bool)

(assert (=> b!14972 m!9963))

(assert (=> start!2232 d!2439))

(declare-fun d!2445 () Bool)

(assert (=> d!2445 (= (inv!736 thiss!177) (isStrictlySorted!120 (toList!213 thiss!177)))))

(declare-fun bs!612 () Bool)

(assert (= bs!612 d!2445))

(assert (=> bs!612 m!9943))

(assert (=> start!2232 d!2445))

(declare-fun b!14977 () Bool)

(declare-fun e!9022 () Bool)

(declare-fun tp_is_empty!751 () Bool)

(declare-fun tp!2417 () Bool)

(assert (=> b!14977 (= e!9022 (and tp_is_empty!751 tp!2417))))

(assert (=> b!14936 (= tp!2408 e!9022)))

(assert (= (and b!14936 ((_ is Cons!431) (toList!213 thiss!177))) b!14977))

(check-sat (not b!14954) (not b!14972) (not d!2445) (not b!14977) tp_is_empty!751)
(check-sat)
