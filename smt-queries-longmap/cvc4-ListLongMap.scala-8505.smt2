; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103678 () Bool)

(assert start!103678)

(declare-datatypes ((B!1860 0))(
  ( (B!1861 (val!15692 Int)) )
))
(declare-datatypes ((tuple2!20256 0))(
  ( (tuple2!20257 (_1!10139 (_ BitVec 64)) (_2!10139 B!1860)) )
))
(declare-datatypes ((List!27357 0))(
  ( (Nil!27354) (Cons!27353 (h!28562 tuple2!20256) (t!40820 List!27357)) )
))
(declare-fun l!644 () List!27357)

(declare-fun v1!20 () B!1860)

(declare-fun b!1241635 () Bool)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun e!703785 () Bool)

(declare-fun isStrictlySorted!753 (List!27357) Bool)

(declare-fun insertStrictlySorted!436 (List!27357 (_ BitVec 64) B!1860) List!27357)

(assert (=> b!1241635 (= e!703785 (not (isStrictlySorted!753 (insertStrictlySorted!436 l!644 key1!25 v1!20))))))

(declare-fun b!1241633 () Bool)

(declare-fun res!828215 () Bool)

(assert (=> b!1241633 (=> (not res!828215) (not e!703785))))

(assert (=> b!1241633 (= res!828215 (isStrictlySorted!753 l!644))))

(declare-fun b!1241634 () Bool)

(declare-fun res!828217 () Bool)

(assert (=> b!1241634 (=> (not res!828217) (not e!703785))))

(assert (=> b!1241634 (= res!828217 (not (is-Cons!27353 l!644)))))

(declare-fun b!1241636 () Bool)

(declare-fun e!703784 () Bool)

(declare-fun tp_is_empty!31259 () Bool)

(declare-fun tp!92669 () Bool)

(assert (=> b!1241636 (= e!703784 (and tp_is_empty!31259 tp!92669))))

(declare-fun res!828216 () Bool)

(assert (=> start!103678 (=> (not res!828216) (not e!703785))))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103678 (= res!828216 (not (= key1!25 key2!15)))))

(assert (=> start!103678 e!703785))

(assert (=> start!103678 true))

(assert (=> start!103678 e!703784))

(assert (=> start!103678 tp_is_empty!31259))

(assert (= (and start!103678 res!828216) b!1241633))

(assert (= (and b!1241633 res!828215) b!1241634))

(assert (= (and b!1241634 res!828217) b!1241635))

(assert (= (and start!103678 (is-Cons!27353 l!644)) b!1241636))

(declare-fun m!1144627 () Bool)

(assert (=> b!1241635 m!1144627))

(assert (=> b!1241635 m!1144627))

(declare-fun m!1144629 () Bool)

(assert (=> b!1241635 m!1144629))

(declare-fun m!1144631 () Bool)

(assert (=> b!1241633 m!1144631))

(push 1)

(assert (not b!1241635))

(assert (not b!1241633))

(assert (not b!1241636))

(assert tp_is_empty!31259)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136513 () Bool)

(declare-fun res!828222 () Bool)

(declare-fun e!703790 () Bool)

(assert (=> d!136513 (=> res!828222 e!703790)))

(assert (=> d!136513 (= res!828222 (or (is-Nil!27354 (insertStrictlySorted!436 l!644 key1!25 v1!20)) (is-Nil!27354 (t!40820 (insertStrictlySorted!436 l!644 key1!25 v1!20)))))))

(assert (=> d!136513 (= (isStrictlySorted!753 (insertStrictlySorted!436 l!644 key1!25 v1!20)) e!703790)))

(declare-fun b!1241641 () Bool)

(declare-fun e!703791 () Bool)

(assert (=> b!1241641 (= e!703790 e!703791)))

(declare-fun res!828223 () Bool)

(assert (=> b!1241641 (=> (not res!828223) (not e!703791))))

(assert (=> b!1241641 (= res!828223 (bvslt (_1!10139 (h!28562 (insertStrictlySorted!436 l!644 key1!25 v1!20))) (_1!10139 (h!28562 (t!40820 (insertStrictlySorted!436 l!644 key1!25 v1!20))))))))

(declare-fun b!1241642 () Bool)

(assert (=> b!1241642 (= e!703791 (isStrictlySorted!753 (t!40820 (insertStrictlySorted!436 l!644 key1!25 v1!20))))))

(assert (= (and d!136513 (not res!828222)) b!1241641))

(assert (= (and b!1241641 res!828223) b!1241642))

(declare-fun m!1144633 () Bool)

(assert (=> b!1241642 m!1144633))

(assert (=> b!1241635 d!136513))

(declare-fun b!1241699 () Bool)

(declare-fun e!703830 () List!27357)

(declare-fun call!61259 () List!27357)

(assert (=> b!1241699 (= e!703830 call!61259)))

(declare-fun b!1241700 () Bool)

(declare-fun e!703831 () List!27357)

(declare-fun call!61261 () List!27357)

(assert (=> b!1241700 (= e!703831 call!61261)))

(declare-fun b!1241701 () Bool)

(declare-fun res!828249 () Bool)

(declare-fun e!703832 () Bool)

(assert (=> b!1241701 (=> (not res!828249) (not e!703832))))

(declare-fun lt!562156 () List!27357)

(declare-fun containsKey!609 (List!27357 (_ BitVec 64)) Bool)

(assert (=> b!1241701 (= res!828249 (containsKey!609 lt!562156 key1!25))))

(declare-fun bm!61256 () Bool)

(declare-fun call!61260 () List!27357)

(assert (=> bm!61256 (= call!61260 call!61259)))

(declare-fun c!121487 () Bool)

(declare-fun c!121486 () Bool)

(declare-fun b!1241702 () Bool)

(declare-fun e!703829 () List!27357)

(assert (=> b!1241702 (= e!703829 (ite c!121486 (t!40820 l!644) (ite c!121487 (Cons!27353 (h!28562 l!644) (t!40820 l!644)) Nil!27354)))))

(declare-fun b!1241703 () Bool)

(assert (=> b!1241703 (= e!703831 call!61261)))

(declare-fun b!1241705 () Bool)

(declare-fun e!703828 () List!27357)

(assert (=> b!1241705 (= e!703830 e!703828)))

(assert (=> b!1241705 (= c!121486 (and (is-Cons!27353 l!644) (= (_1!10139 (h!28562 l!644)) key1!25)))))

(declare-fun bm!61257 () Bool)

(assert (=> bm!61257 (= call!61261 call!61260)))

(declare-fun b!1241706 () Bool)

(declare-fun contains!7390 (List!27357 tuple2!20256) Bool)

(assert (=> b!1241706 (= e!703832 (contains!7390 lt!562156 (tuple2!20257 key1!25 v1!20)))))

(declare-fun b!1241707 () Bool)

(assert (=> b!1241707 (= e!703828 call!61260)))

(declare-fun b!1241708 () Bool)

(assert (=> b!1241708 (= c!121487 (and (is-Cons!27353 l!644) (bvsgt (_1!10139 (h!28562 l!644)) key1!25)))))

(assert (=> b!1241708 (= e!703828 e!703831)))

(declare-fun bm!61258 () Bool)

(declare-fun c!121488 () Bool)

(declare-fun $colon$colon!623 (List!27357 tuple2!20256) List!27357)

(assert (=> bm!61258 (= call!61259 ($colon$colon!623 e!703829 (ite c!121488 (h!28562 l!644) (tuple2!20257 key1!25 v1!20))))))

(declare-fun c!121485 () Bool)

(assert (=> bm!61258 (= c!121485 c!121488)))

(declare-fun b!1241704 () Bool)

(assert (=> b!1241704 (= e!703829 (insertStrictlySorted!436 (t!40820 l!644) key1!25 v1!20))))

(declare-fun d!136517 () Bool)

(assert (=> d!136517 e!703832))

(declare-fun res!828248 () Bool)

(assert (=> d!136517 (=> (not res!828248) (not e!703832))))

(assert (=> d!136517 (= res!828248 (isStrictlySorted!753 lt!562156))))

(assert (=> d!136517 (= lt!562156 e!703830)))

(assert (=> d!136517 (= c!121488 (and (is-Cons!27353 l!644) (bvslt (_1!10139 (h!28562 l!644)) key1!25)))))

(assert (=> d!136517 (isStrictlySorted!753 l!644)))

(assert (=> d!136517 (= (insertStrictlySorted!436 l!644 key1!25 v1!20) lt!562156)))

(assert (= (and d!136517 c!121488) b!1241699))

(assert (= (and d!136517 (not c!121488)) b!1241705))

(assert (= (and b!1241705 c!121486) b!1241707))

(assert (= (and b!1241705 (not c!121486)) b!1241708))

(assert (= (and b!1241708 c!121487) b!1241703))

(assert (= (and b!1241708 (not c!121487)) b!1241700))

(assert (= (or b!1241703 b!1241700) bm!61257))

(assert (= (or b!1241707 bm!61257) bm!61256))

(assert (= (or b!1241699 bm!61256) bm!61258))

(assert (= (and bm!61258 c!121485) b!1241704))

(assert (= (and bm!61258 (not c!121485)) b!1241702))

(assert (= (and d!136517 res!828248) b!1241701))

(assert (= (and b!1241701 res!828249) b!1241706))

(declare-fun m!1144643 () Bool)

(assert (=> b!1241701 m!1144643))

(declare-fun m!1144645 () Bool)

(assert (=> bm!61258 m!1144645))

(declare-fun m!1144647 () Bool)

(assert (=> b!1241706 m!1144647))

(declare-fun m!1144649 () Bool)

(assert (=> b!1241704 m!1144649))

(declare-fun m!1144651 () Bool)

(assert (=> d!136517 m!1144651))

(assert (=> d!136517 m!1144631))

(assert (=> b!1241635 d!136517))

(declare-fun d!136529 () Bool)

(declare-fun res!828250 () Bool)

(declare-fun e!703833 () Bool)

(assert (=> d!136529 (=> res!828250 e!703833)))

(assert (=> d!136529 (= res!828250 (or (is-Nil!27354 l!644) (is-Nil!27354 (t!40820 l!644))))))

(assert (=> d!136529 (= (isStrictlySorted!753 l!644) e!703833)))

(declare-fun b!1241709 () Bool)

(declare-fun e!703834 () Bool)

(assert (=> b!1241709 (= e!703833 e!703834)))

(declare-fun res!828251 () Bool)

(assert (=> b!1241709 (=> (not res!828251) (not e!703834))))

(assert (=> b!1241709 (= res!828251 (bvslt (_1!10139 (h!28562 l!644)) (_1!10139 (h!28562 (t!40820 l!644)))))))

(declare-fun b!1241710 () Bool)

(assert (=> b!1241710 (= e!703834 (isStrictlySorted!753 (t!40820 l!644)))))

(assert (= (and d!136529 (not res!828250)) b!1241709))

(assert (= (and b!1241709 res!828251) b!1241710))

(declare-fun m!1144653 () Bool)

(assert (=> b!1241710 m!1144653))

(assert (=> b!1241633 d!136529))

(declare-fun b!1241723 () Bool)

(declare-fun e!703841 () Bool)

(declare-fun tp!92672 () Bool)

(assert (=> b!1241723 (= e!703841 (and tp_is_empty!31259 tp!92672))))

(assert (=> b!1241636 (= tp!92669 e!703841)))

(assert (= (and b!1241636 (is-Cons!27353 (t!40820 l!644))) b!1241723))

(push 1)

(assert (not b!1241706))

(assert (not b!1241704))

(assert (not b!1241701))

