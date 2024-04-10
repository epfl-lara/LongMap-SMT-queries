; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75156 () Bool)

(assert start!75156)

(declare-fun res!601474 () Bool)

(declare-fun e!492992 () Bool)

(assert (=> start!75156 (=> (not res!601474) (not e!492992))))

(declare-datatypes ((B!1282 0))(
  ( (B!1283 (val!8947 Int)) )
))
(declare-datatypes ((tuple2!11888 0))(
  ( (tuple2!11889 (_1!5955 (_ BitVec 64)) (_2!5955 B!1282)) )
))
(declare-datatypes ((List!17663 0))(
  ( (Nil!17660) (Cons!17659 (h!18790 tuple2!11888) (t!24940 List!17663)) )
))
(declare-fun l!906 () List!17663)

(declare-fun isStrictlySorted!481 (List!17663) Bool)

(assert (=> start!75156 (= res!601474 (isStrictlySorted!481 l!906))))

(assert (=> start!75156 e!492992))

(declare-fun e!492993 () Bool)

(assert (=> start!75156 e!492993))

(declare-fun b!885774 () Bool)

(declare-fun ListPrimitiveSize!86 (List!17663) Int)

(assert (=> b!885774 (= e!492992 (< (ListPrimitiveSize!86 l!906) 0))))

(declare-fun b!885775 () Bool)

(declare-fun tp_is_empty!17793 () Bool)

(declare-fun tp!54314 () Bool)

(assert (=> b!885775 (= e!492993 (and tp_is_empty!17793 tp!54314))))

(assert (= (and start!75156 res!601474) b!885774))

(get-info :version)

(assert (= (and start!75156 ((_ is Cons!17659) l!906)) b!885775))

(declare-fun m!825845 () Bool)

(assert (=> start!75156 m!825845))

(declare-fun m!825847 () Bool)

(assert (=> b!885774 m!825847))

(check-sat (not b!885774) (not start!75156) (not b!885775) tp_is_empty!17793)
(check-sat)
(get-model)

(declare-fun d!109443 () Bool)

(declare-fun lt!401051 () Int)

(assert (=> d!109443 (>= lt!401051 0)))

(declare-fun e!493006 () Int)

(assert (=> d!109443 (= lt!401051 e!493006)))

(declare-fun c!93360 () Bool)

(assert (=> d!109443 (= c!93360 ((_ is Nil!17660) l!906))))

(assert (=> d!109443 (= (ListPrimitiveSize!86 l!906) lt!401051)))

(declare-fun b!885794 () Bool)

(assert (=> b!885794 (= e!493006 0)))

(declare-fun b!885795 () Bool)

(assert (=> b!885795 (= e!493006 (+ 1 (ListPrimitiveSize!86 (t!24940 l!906))))))

(assert (= (and d!109443 c!93360) b!885794))

(assert (= (and d!109443 (not c!93360)) b!885795))

(declare-fun m!825853 () Bool)

(assert (=> b!885795 m!825853))

(assert (=> b!885774 d!109443))

(declare-fun d!109449 () Bool)

(declare-fun res!601490 () Bool)

(declare-fun e!493021 () Bool)

(assert (=> d!109449 (=> res!601490 e!493021)))

(assert (=> d!109449 (= res!601490 (or ((_ is Nil!17660) l!906) ((_ is Nil!17660) (t!24940 l!906))))))

(assert (=> d!109449 (= (isStrictlySorted!481 l!906) e!493021)))

(declare-fun b!885812 () Bool)

(declare-fun e!493022 () Bool)

(assert (=> b!885812 (= e!493021 e!493022)))

(declare-fun res!601491 () Bool)

(assert (=> b!885812 (=> (not res!601491) (not e!493022))))

(assert (=> b!885812 (= res!601491 (bvslt (_1!5955 (h!18790 l!906)) (_1!5955 (h!18790 (t!24940 l!906)))))))

(declare-fun b!885813 () Bool)

(assert (=> b!885813 (= e!493022 (isStrictlySorted!481 (t!24940 l!906)))))

(assert (= (and d!109449 (not res!601490)) b!885812))

(assert (= (and b!885812 res!601491) b!885813))

(declare-fun m!825859 () Bool)

(assert (=> b!885813 m!825859))

(assert (=> start!75156 d!109449))

(declare-fun b!885822 () Bool)

(declare-fun e!493029 () Bool)

(declare-fun tp!54320 () Bool)

(assert (=> b!885822 (= e!493029 (and tp_is_empty!17793 tp!54320))))

(assert (=> b!885775 (= tp!54314 e!493029)))

(assert (= (and b!885775 ((_ is Cons!17659) (t!24940 l!906))) b!885822))

(check-sat (not b!885813) (not b!885795) (not b!885822) tp_is_empty!17793)
(check-sat)
