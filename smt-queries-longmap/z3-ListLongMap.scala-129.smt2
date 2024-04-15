; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2232 () Bool)

(assert start!2232)

(declare-fun res!11443 () Bool)

(declare-fun e!8995 () Bool)

(assert (=> start!2232 (=> (not res!11443) (not e!8995))))

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

(assert (=> start!2232 (= res!11443 (< (size!490 (toList!213 thiss!177)) 2147483647))))

(assert (=> start!2232 e!8995))

(declare-fun e!8996 () Bool)

(declare-fun inv!736 (ListLongMap!395) Bool)

(assert (=> start!2232 (and (inv!736 thiss!177) e!8996)))

(declare-fun b!14941 () Bool)

(declare-fun isStrictlySorted!123 (List!435) Bool)

(assert (=> b!14941 (= e!8995 (not (isStrictlySorted!123 (toList!213 thiss!177))))))

(declare-fun b!14942 () Bool)

(declare-fun tp!2408 () Bool)

(assert (=> b!14942 (= e!8996 tp!2408)))

(assert (= (and start!2232 res!11443) b!14941))

(assert (= start!2232 b!14942))

(declare-fun m!9939 () Bool)

(assert (=> start!2232 m!9939))

(declare-fun m!9941 () Bool)

(assert (=> start!2232 m!9941))

(declare-fun m!9943 () Bool)

(assert (=> b!14941 m!9943))

(check-sat (not start!2232) (not b!14941) (not b!14942))
(check-sat)
(get-model)

(declare-fun d!2437 () Bool)

(declare-fun lt!3643 () Int)

(assert (=> d!2437 (>= lt!3643 0)))

(declare-fun e!9015 () Int)

(assert (=> d!2437 (= lt!3643 e!9015)))

(declare-fun c!1416 () Bool)

(get-info :version)

(assert (=> d!2437 (= c!1416 ((_ is Nil!432) (toList!213 thiss!177)))))

(assert (=> d!2437 (= (size!490 (toList!213 thiss!177)) lt!3643)))

(declare-fun b!14968 () Bool)

(assert (=> b!14968 (= e!9015 0)))

(declare-fun b!14970 () Bool)

(assert (=> b!14970 (= e!9015 (+ 1 (size!490 (t!2837 (toList!213 thiss!177)))))))

(assert (= (and d!2437 c!1416) b!14968))

(assert (= (and d!2437 (not c!1416)) b!14970))

(declare-fun m!9958 () Bool)

(assert (=> b!14970 m!9958))

(assert (=> start!2232 d!2437))

(declare-fun d!2445 () Bool)

(assert (=> d!2445 (= (inv!736 thiss!177) (isStrictlySorted!123 (toList!213 thiss!177)))))

(declare-fun bs!613 () Bool)

(assert (= bs!613 d!2445))

(assert (=> bs!613 m!9943))

(assert (=> start!2232 d!2445))

(declare-fun d!2451 () Bool)

(declare-fun res!11466 () Bool)

(declare-fun e!9034 () Bool)

(assert (=> d!2451 (=> res!11466 e!9034)))

(assert (=> d!2451 (= res!11466 (or ((_ is Nil!432) (toList!213 thiss!177)) ((_ is Nil!432) (t!2837 (toList!213 thiss!177)))))))

(assert (=> d!2451 (= (isStrictlySorted!123 (toList!213 thiss!177)) e!9034)))

(declare-fun b!14989 () Bool)

(declare-fun e!9035 () Bool)

(assert (=> b!14989 (= e!9034 e!9035)))

(declare-fun res!11467 () Bool)

(assert (=> b!14989 (=> (not res!11467) (not e!9035))))

(assert (=> b!14989 (= res!11467 (bvslt (_1!282 (h!997 (toList!213 thiss!177))) (_1!282 (h!997 (t!2837 (toList!213 thiss!177))))))))

(declare-fun b!14990 () Bool)

(assert (=> b!14990 (= e!9035 (isStrictlySorted!123 (t!2837 (toList!213 thiss!177))))))

(assert (= (and d!2451 (not res!11466)) b!14989))

(assert (= (and b!14989 res!11467) b!14990))

(declare-fun m!9967 () Bool)

(assert (=> b!14990 m!9967))

(assert (=> b!14941 d!2451))

(declare-fun b!15005 () Bool)

(declare-fun e!9044 () Bool)

(declare-fun tp_is_empty!755 () Bool)

(declare-fun tp!2423 () Bool)

(assert (=> b!15005 (= e!9044 (and tp_is_empty!755 tp!2423))))

(assert (=> b!14942 (= tp!2408 e!9044)))

(assert (= (and b!14942 ((_ is Cons!431) (toList!213 thiss!177))) b!15005))

(check-sat tp_is_empty!755 (not b!15005) (not b!14970) (not d!2445) (not b!14990))
(check-sat)
