; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2256 () Bool)

(assert start!2256)

(declare-fun res!11470 () Bool)

(declare-fun e!9049 () Bool)

(assert (=> start!2256 (=> (not res!11470) (not e!9049))))

(declare-datatypes ((B!578 0))(
  ( (B!579 (val!387 Int)) )
))
(declare-datatypes ((tuple2!574 0))(
  ( (tuple2!575 (_1!287 (_ BitVec 64)) (_2!287 B!578)) )
))
(declare-datatypes ((List!442 0))(
  ( (Nil!439) (Cons!438 (h!1004 tuple2!574) (t!2844 List!442)) )
))
(declare-datatypes ((ListLongMap!405 0))(
  ( (ListLongMap!406 (toList!218 List!442)) )
))
(declare-fun thiss!177 () ListLongMap!405)

(declare-fun size!502 (List!442) Int)

(assert (=> start!2256 (= res!11470 (< (size!502 (toList!218 thiss!177)) 2147483647))))

(assert (=> start!2256 e!9049))

(declare-fun e!9050 () Bool)

(declare-fun inv!744 (ListLongMap!405) Bool)

(assert (=> start!2256 (and (inv!744 thiss!177) e!9050)))

(declare-fun b!15010 () Bool)

(declare-datatypes ((List!443 0))(
  ( (Nil!440) (Cons!439 (h!1005 (_ BitVec 64)) (t!2845 List!443)) )
))
(declare-fun length!2 (List!443) Int)

(declare-fun getKeysList!1 (List!442) List!443)

(assert (=> b!15010 (= e!9049 (>= (length!2 (getKeysList!1 (toList!218 thiss!177))) 2147483647))))

(declare-fun b!15011 () Bool)

(declare-fun tp!2426 () Bool)

(assert (=> b!15011 (= e!9050 tp!2426)))

(assert (= (and start!2256 res!11470) b!15010))

(assert (= start!2256 b!15011))

(declare-fun m!9977 () Bool)

(assert (=> start!2256 m!9977))

(declare-fun m!9979 () Bool)

(assert (=> start!2256 m!9979))

(declare-fun m!9981 () Bool)

(assert (=> b!15010 m!9981))

(assert (=> b!15010 m!9981))

(declare-fun m!9983 () Bool)

(assert (=> b!15010 m!9983))

(push 1)

(assert (not start!2256))

(assert (not b!15010))

(assert (not b!15011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2459 () Bool)

(declare-fun lt!3650 () Int)

(assert (=> d!2459 (>= lt!3650 0)))

(declare-fun e!9067 () Int)

(assert (=> d!2459 (= lt!3650 e!9067)))

(declare-fun c!1423 () Bool)

(assert (=> d!2459 (= c!1423 (is-Nil!439 (toList!218 thiss!177)))))

(assert (=> d!2459 (= (size!502 (toList!218 thiss!177)) lt!3650)))

(declare-fun b!15032 () Bool)

(assert (=> b!15032 (= e!9067 0)))

(declare-fun b!15033 () Bool)

(assert (=> b!15033 (= e!9067 (+ 1 (size!502 (t!2844 (toList!218 thiss!177)))))))

(assert (= (and d!2459 c!1423) b!15032))

(assert (= (and d!2459 (not c!1423)) b!15033))

(declare-fun m!10003 () Bool)

(assert (=> b!15033 m!10003))

(assert (=> start!2256 d!2459))

(declare-fun d!2465 () Bool)

(declare-fun isStrictlySorted!129 (List!442) Bool)

(assert (=> d!2465 (= (inv!744 thiss!177) (isStrictlySorted!129 (toList!218 thiss!177)))))

(declare-fun bs!619 () Bool)

(assert (= bs!619 d!2465))

(declare-fun m!10007 () Bool)

(assert (=> bs!619 m!10007))

(assert (=> start!2256 d!2465))

(declare-fun d!2469 () Bool)

(declare-fun size!506 (List!443) Int)

(assert (=> d!2469 (= (length!2 (getKeysList!1 (toList!218 thiss!177))) (size!506 (getKeysList!1 (toList!218 thiss!177))))))

(declare-fun bs!621 () Bool)

(assert (= bs!621 d!2469))

(assert (=> bs!621 m!9981))

(declare-fun m!10011 () Bool)

(assert (=> bs!621 m!10011))

(assert (=> b!15010 d!2469))

(declare-fun d!2473 () Bool)

(declare-fun e!9087 () Bool)

(assert (=> d!2473 e!9087))

(declare-fun res!11484 () Bool)

(assert (=> d!2473 (=> (not res!11484) (not e!9087))))

(declare-fun lt!3662 () List!443)

(declare-fun isStrictlySortedLong!0 (List!443) Bool)

(assert (=> d!2473 (= res!11484 (isStrictlySortedLong!0 lt!3662))))

(declare-fun e!9086 () List!443)

(assert (=> d!2473 (= lt!3662 e!9086)))

(declare-fun c!1435 () Bool)

(assert (=> d!2473 (= c!1435 (is-Cons!438 (toList!218 thiss!177)))))

(assert (=> d!2473 (isStrictlySorted!129 (toList!218 thiss!177))))

(assert (=> d!2473 (= (getKeysList!1 (toList!218 thiss!177)) lt!3662)))

(declare-fun b!15063 () Bool)

(assert (=> b!15063 (= e!9086 (Cons!439 (_1!287 (h!1004 (toList!218 thiss!177))) (getKeysList!1 (t!2844 (toList!218 thiss!177)))))))

(declare-fun b!15064 () Bool)

(assert (=> b!15064 (= e!9086 Nil!440)))

(declare-fun b!15065 () Bool)

(declare-fun length!6 (List!442) Int)

(assert (=> b!15065 (= e!9087 (= (length!2 lt!3662) (length!6 (toList!218 thiss!177))))))

(assert (= (and d!2473 c!1435) b!15063))

(assert (= (and d!2473 (not c!1435)) b!15064))

(assert (= (and d!2473 res!11484) b!15065))

(declare-fun m!10027 () Bool)

(assert (=> d!2473 m!10027))

(assert (=> d!2473 m!10007))

(declare-fun m!10029 () Bool)

(assert (=> b!15063 m!10029))

(declare-fun m!10031 () Bool)

(assert (=> b!15065 m!10031))

(declare-fun m!10033 () Bool)

(assert (=> b!15065 m!10033))

(assert (=> b!15010 d!2473))

(declare-fun b!15078 () Bool)

(declare-fun e!9095 () Bool)

(declare-fun tp_is_empty!758 () Bool)

(declare-fun tp!2438 () Bool)

(assert (=> b!15078 (= e!9095 (and tp_is_empty!758 tp!2438))))

(assert (=> b!15011 (= tp!2426 e!9095)))

(assert (= (and b!15011 (is-Cons!438 (toList!218 thiss!177))) b!15078))

(push 1)

(assert (not d!2465))

(assert (not d!2469))

(assert tp_is_empty!758)

(assert (not b!15033))

(assert (not d!2473))

(assert (not b!15078))

(assert (not b!15063))

(assert (not b!15065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2489 () Bool)

(declare-fun e!9112 () Bool)

(assert (=> d!2489 e!9112))

(declare-fun res!11493 () Bool)

(assert (=> d!2489 (=> (not res!11493) (not e!9112))))

(declare-fun lt!3669 () List!443)

(assert (=> d!2489 (= res!11493 (isStrictlySortedLong!0 lt!3669))))

(declare-fun e!9111 () List!443)

(assert (=> d!2489 (= lt!3669 e!9111)))

(declare-fun c!1442 () Bool)

(assert (=> d!2489 (= c!1442 (is-Cons!438 (t!2844 (toList!218 thiss!177))))))

(assert (=> d!2489 (isStrictlySorted!129 (t!2844 (toList!218 thiss!177)))))

(assert (=> d!2489 (= (getKeysList!1 (t!2844 (toList!218 thiss!177))) lt!3669)))

(declare-fun b!15101 () Bool)

(assert (=> b!15101 (= e!9111 (Cons!439 (_1!287 (h!1004 (t!2844 (toList!218 thiss!177)))) (getKeysList!1 (t!2844 (t!2844 (toList!218 thiss!177))))))))

(declare-fun b!15102 () Bool)

(assert (=> b!15102 (= e!9111 Nil!440)))

(declare-fun b!15103 () Bool)

(assert (=> b!15103 (= e!9112 (= (length!2 lt!3669) (length!6 (t!2844 (toList!218 thiss!177)))))))

(assert (= (and d!2489 c!1442) b!15101))

(assert (= (and d!2489 (not c!1442)) b!15102))

(assert (= (and d!2489 res!11493) b!15103))

(declare-fun m!10057 () Bool)

(assert (=> d!2489 m!10057))

(declare-fun m!10059 () Bool)

(assert (=> d!2489 m!10059))

(declare-fun m!10061 () Bool)

(assert (=> b!15101 m!10061))

(declare-fun m!10063 () Bool)

(assert (=> b!15103 m!10063))

(declare-fun m!10065 () Bool)

(assert (=> b!15103 m!10065))

(assert (=> b!15063 d!2489))

(declare-fun d!2493 () Bool)

(declare-fun res!11504 () Bool)

(declare-fun e!9123 () Bool)

(assert (=> d!2493 (=> res!11504 e!9123)))

(assert (=> d!2493 (= res!11504 (or (is-Nil!439 (toList!218 thiss!177)) (is-Nil!439 (t!2844 (toList!218 thiss!177)))))))

(assert (=> d!2493 (= (isStrictlySorted!129 (toList!218 thiss!177)) e!9123)))

(declare-fun b!15114 () Bool)

(declare-fun e!9124 () Bool)

(assert (=> b!15114 (= e!9123 e!9124)))

(declare-fun res!11505 () Bool)

(assert (=> b!15114 (=> (not res!11505) (not e!9124))))

(assert (=> b!15114 (= res!11505 (bvslt (_1!287 (h!1004 (toList!218 thiss!177))) (_1!287 (h!1004 (t!2844 (toList!218 thiss!177))))))))

(declare-fun b!15115 () Bool)

(assert (=> b!15115 (= e!9124 (isStrictlySorted!129 (t!2844 (toList!218 thiss!177))))))

(assert (= (and d!2493 (not res!11504)) b!15114))

(assert (= (and b!15114 res!11505) b!15115))

(assert (=> b!15115 m!10059))

(assert (=> d!2465 d!2493))

(declare-fun d!2499 () Bool)

(declare-fun lt!3670 () Int)

(assert (=> d!2499 (>= lt!3670 0)))

(declare-fun e!9125 () Int)

(assert (=> d!2499 (= lt!3670 e!9125)))

(declare-fun c!1443 () Bool)

(assert (=> d!2499 (= c!1443 (is-Nil!439 (t!2844 (toList!218 thiss!177))))))

(assert (=> d!2499 (= (size!502 (t!2844 (toList!218 thiss!177))) lt!3670)))

(declare-fun b!15116 () Bool)

(assert (=> b!15116 (= e!9125 0)))

(declare-fun b!15117 () Bool)

(assert (=> b!15117 (= e!9125 (+ 1 (size!502 (t!2844 (t!2844 (toList!218 thiss!177))))))))

(assert (= (and d!2499 c!1443) b!15116))

(assert (= (and d!2499 (not c!1443)) b!15117))

(declare-fun m!10071 () Bool)

(assert (=> b!15117 m!10071))

(assert (=> b!15033 d!2499))

(declare-fun d!2501 () Bool)

(assert (=> d!2501 (= (length!2 lt!3662) (size!506 lt!3662))))

(declare-fun bs!626 () Bool)

(assert (= bs!626 d!2501))

(declare-fun m!10073 () Bool)

(assert (=> bs!626 m!10073))

(assert (=> b!15065 d!2501))

(declare-fun d!2503 () Bool)

(assert (=> d!2503 (= (length!6 (toList!218 thiss!177)) (size!502 (toList!218 thiss!177)))))

(declare-fun bs!627 () Bool)

(assert (= bs!627 d!2503))

(assert (=> bs!627 m!9977))

(assert (=> b!15065 d!2503))

(declare-fun d!2505 () Bool)

(declare-fun lt!3673 () Int)

(assert (=> d!2505 (>= lt!3673 0)))

(declare-fun e!9129 () Int)

(assert (=> d!2505 (= lt!3673 e!9129)))

(declare-fun c!1446 () Bool)

(assert (=> d!2505 (= c!1446 (is-Nil!440 (getKeysList!1 (toList!218 thiss!177))))))

(assert (=> d!2505 (= (size!506 (getKeysList!1 (toList!218 thiss!177))) lt!3673)))

(declare-fun b!15123 () Bool)

(assert (=> b!15123 (= e!9129 0)))

(declare-fun b!15124 () Bool)

(assert (=> b!15124 (= e!9129 (+ 1 (size!506 (t!2845 (getKeysList!1 (toList!218 thiss!177))))))))

(assert (= (and d!2505 c!1446) b!15123))

(assert (= (and d!2505 (not c!1446)) b!15124))

