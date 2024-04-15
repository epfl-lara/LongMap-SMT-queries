; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75166 () Bool)

(assert start!75166)

(declare-fun b!885668 () Bool)

(declare-fun res!601434 () Bool)

(declare-fun e!492944 () Bool)

(assert (=> b!885668 (=> (not res!601434) (not e!492944))))

(declare-datatypes ((B!1292 0))(
  ( (B!1293 (val!8952 Int)) )
))
(declare-datatypes ((tuple2!11918 0))(
  ( (tuple2!11919 (_1!5970 (_ BitVec 64)) (_2!5970 B!1292)) )
))
(declare-datatypes ((List!17676 0))(
  ( (Nil!17673) (Cons!17672 (h!18803 tuple2!11918) (t!24944 List!17676)) )
))
(declare-fun l!906 () List!17676)

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885668 (= res!601434 (and ((_ is Cons!17672) l!906) (bvslt (_1!5970 (h!18803 l!906)) key1!49)))))

(declare-fun b!885669 () Bool)

(declare-fun res!601435 () Bool)

(assert (=> b!885669 (=> (not res!601435) (not e!492944))))

(declare-fun isStrictlySorted!482 (List!17676) Bool)

(assert (=> b!885669 (= res!601435 (isStrictlySorted!482 (t!24944 l!906)))))

(declare-fun res!601436 () Bool)

(assert (=> start!75166 (=> (not res!601436) (not e!492944))))

(assert (=> start!75166 (= res!601436 (isStrictlySorted!482 l!906))))

(assert (=> start!75166 e!492944))

(declare-fun e!492943 () Bool)

(assert (=> start!75166 e!492943))

(assert (=> start!75166 true))

(declare-fun b!885671 () Bool)

(declare-fun tp_is_empty!17803 () Bool)

(declare-fun tp!54348 () Bool)

(assert (=> b!885671 (= e!492943 (and tp_is_empty!17803 tp!54348))))

(declare-fun b!885670 () Bool)

(declare-fun ListPrimitiveSize!88 (List!17676) Int)

(assert (=> b!885670 (= e!492944 (>= (ListPrimitiveSize!88 (t!24944 l!906)) (ListPrimitiveSize!88 l!906)))))

(assert (= (and start!75166 res!601436) b!885668))

(assert (= (and b!885668 res!601434) b!885669))

(assert (= (and b!885669 res!601435) b!885670))

(assert (= (and start!75166 ((_ is Cons!17672) l!906)) b!885671))

(declare-fun m!825125 () Bool)

(assert (=> b!885669 m!825125))

(declare-fun m!825127 () Bool)

(assert (=> start!75166 m!825127))

(declare-fun m!825129 () Bool)

(assert (=> b!885670 m!825129))

(declare-fun m!825131 () Bool)

(assert (=> b!885670 m!825131))

(check-sat (not b!885670) tp_is_empty!17803 (not start!75166) (not b!885671) (not b!885669))
(check-sat)
(get-model)

(declare-fun d!109273 () Bool)

(declare-fun res!601459 () Bool)

(declare-fun e!492961 () Bool)

(assert (=> d!109273 (=> res!601459 e!492961)))

(assert (=> d!109273 (= res!601459 (or ((_ is Nil!17673) (t!24944 l!906)) ((_ is Nil!17673) (t!24944 (t!24944 l!906)))))))

(assert (=> d!109273 (= (isStrictlySorted!482 (t!24944 l!906)) e!492961)))

(declare-fun b!885700 () Bool)

(declare-fun e!492962 () Bool)

(assert (=> b!885700 (= e!492961 e!492962)))

(declare-fun res!601460 () Bool)

(assert (=> b!885700 (=> (not res!601460) (not e!492962))))

(assert (=> b!885700 (= res!601460 (bvslt (_1!5970 (h!18803 (t!24944 l!906))) (_1!5970 (h!18803 (t!24944 (t!24944 l!906))))))))

(declare-fun b!885701 () Bool)

(assert (=> b!885701 (= e!492962 (isStrictlySorted!482 (t!24944 (t!24944 l!906))))))

(assert (= (and d!109273 (not res!601459)) b!885700))

(assert (= (and b!885700 res!601460) b!885701))

(declare-fun m!825149 () Bool)

(assert (=> b!885701 m!825149))

(assert (=> b!885669 d!109273))

(declare-fun d!109277 () Bool)

(declare-fun lt!400820 () Int)

(assert (=> d!109277 (>= lt!400820 0)))

(declare-fun e!492969 () Int)

(assert (=> d!109277 (= lt!400820 e!492969)))

(declare-fun c!93300 () Bool)

(assert (=> d!109277 (= c!93300 ((_ is Nil!17673) (t!24944 l!906)))))

(assert (=> d!109277 (= (ListPrimitiveSize!88 (t!24944 l!906)) lt!400820)))

(declare-fun b!885710 () Bool)

(assert (=> b!885710 (= e!492969 0)))

(declare-fun b!885711 () Bool)

(assert (=> b!885711 (= e!492969 (+ 1 (ListPrimitiveSize!88 (t!24944 (t!24944 l!906)))))))

(assert (= (and d!109277 c!93300) b!885710))

(assert (= (and d!109277 (not c!93300)) b!885711))

(declare-fun m!825151 () Bool)

(assert (=> b!885711 m!825151))

(assert (=> b!885670 d!109277))

(declare-fun d!109279 () Bool)

(declare-fun lt!400821 () Int)

(assert (=> d!109279 (>= lt!400821 0)))

(declare-fun e!492972 () Int)

(assert (=> d!109279 (= lt!400821 e!492972)))

(declare-fun c!93301 () Bool)

(assert (=> d!109279 (= c!93301 ((_ is Nil!17673) l!906))))

(assert (=> d!109279 (= (ListPrimitiveSize!88 l!906) lt!400821)))

(declare-fun b!885714 () Bool)

(assert (=> b!885714 (= e!492972 0)))

(declare-fun b!885715 () Bool)

(assert (=> b!885715 (= e!492972 (+ 1 (ListPrimitiveSize!88 (t!24944 l!906))))))

(assert (= (and d!109279 c!93301) b!885714))

(assert (= (and d!109279 (not c!93301)) b!885715))

(assert (=> b!885715 m!825129))

(assert (=> b!885670 d!109279))

(declare-fun d!109283 () Bool)

(declare-fun res!601467 () Bool)

(declare-fun e!492973 () Bool)

(assert (=> d!109283 (=> res!601467 e!492973)))

(assert (=> d!109283 (= res!601467 (or ((_ is Nil!17673) l!906) ((_ is Nil!17673) (t!24944 l!906))))))

(assert (=> d!109283 (= (isStrictlySorted!482 l!906) e!492973)))

(declare-fun b!885716 () Bool)

(declare-fun e!492974 () Bool)

(assert (=> b!885716 (= e!492973 e!492974)))

(declare-fun res!601468 () Bool)

(assert (=> b!885716 (=> (not res!601468) (not e!492974))))

(assert (=> b!885716 (= res!601468 (bvslt (_1!5970 (h!18803 l!906)) (_1!5970 (h!18803 (t!24944 l!906)))))))

(declare-fun b!885717 () Bool)

(assert (=> b!885717 (= e!492974 (isStrictlySorted!482 (t!24944 l!906)))))

(assert (= (and d!109283 (not res!601467)) b!885716))

(assert (= (and b!885716 res!601468) b!885717))

(assert (=> b!885717 m!825125))

(assert (=> start!75166 d!109283))

(declare-fun b!885722 () Bool)

(declare-fun e!492977 () Bool)

(declare-fun tp!54357 () Bool)

(assert (=> b!885722 (= e!492977 (and tp_is_empty!17803 tp!54357))))

(assert (=> b!885671 (= tp!54348 e!492977)))

(assert (= (and b!885671 ((_ is Cons!17672) (t!24944 l!906))) b!885722))

(check-sat tp_is_empty!17803 (not b!885711) (not b!885701) (not b!885717) (not b!885722) (not b!885715))
(check-sat)
