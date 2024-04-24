; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108028 () Bool)

(assert start!108028)

(declare-fun res!847850 () Bool)

(declare-fun e!728299 () Bool)

(assert (=> start!108028 (=> (not res!847850) (not e!728299))))

(declare-datatypes ((B!2150 0))(
  ( (B!2151 (val!16671 Int)) )
))
(declare-datatypes ((tuple2!21432 0))(
  ( (tuple2!21433 (_1!10727 (_ BitVec 64)) (_2!10727 B!2150)) )
))
(declare-datatypes ((List!28625 0))(
  ( (Nil!28622) (Cons!28621 (h!29839 tuple2!21432) (t!42150 List!28625)) )
))
(declare-fun l!595 () List!28625)

(declare-fun isStrictlySorted!838 (List!28625) Bool)

(assert (=> start!108028 (= res!847850 (isStrictlySorted!838 l!595))))

(assert (=> start!108028 e!728299))

(declare-fun e!728300 () Bool)

(assert (=> start!108028 e!728300))

(declare-fun b!1275959 () Bool)

(declare-fun ListPrimitiveSize!163 (List!28625) Int)

(assert (=> b!1275959 (= e!728299 (< (ListPrimitiveSize!163 l!595) 0))))

(declare-fun b!1275960 () Bool)

(declare-fun tp_is_empty!33193 () Bool)

(declare-fun tp!98003 () Bool)

(assert (=> b!1275960 (= e!728300 (and tp_is_empty!33193 tp!98003))))

(assert (= (and start!108028 res!847850) b!1275959))

(get-info :version)

(assert (= (and start!108028 ((_ is Cons!28621) l!595)) b!1275960))

(declare-fun m!1172921 () Bool)

(assert (=> start!108028 m!1172921))

(declare-fun m!1172923 () Bool)

(assert (=> b!1275959 m!1172923))

(check-sat (not start!108028) (not b!1275959) (not b!1275960) tp_is_empty!33193)
(check-sat)
(get-model)

(declare-fun d!140639 () Bool)

(declare-fun res!847865 () Bool)

(declare-fun e!728323 () Bool)

(assert (=> d!140639 (=> res!847865 e!728323)))

(assert (=> d!140639 (= res!847865 (or ((_ is Nil!28622) l!595) ((_ is Nil!28622) (t!42150 l!595))))))

(assert (=> d!140639 (= (isStrictlySorted!838 l!595) e!728323)))

(declare-fun b!1275985 () Bool)

(declare-fun e!728324 () Bool)

(assert (=> b!1275985 (= e!728323 e!728324)))

(declare-fun res!847866 () Bool)

(assert (=> b!1275985 (=> (not res!847866) (not e!728324))))

(assert (=> b!1275985 (= res!847866 (bvslt (_1!10727 (h!29839 l!595)) (_1!10727 (h!29839 (t!42150 l!595)))))))

(declare-fun b!1275986 () Bool)

(assert (=> b!1275986 (= e!728324 (isStrictlySorted!838 (t!42150 l!595)))))

(assert (= (and d!140639 (not res!847865)) b!1275985))

(assert (= (and b!1275985 res!847866) b!1275986))

(declare-fun m!1172933 () Bool)

(assert (=> b!1275986 m!1172933))

(assert (=> start!108028 d!140639))

(declare-fun d!140645 () Bool)

(declare-fun lt!575772 () Int)

(assert (=> d!140645 (>= lt!575772 0)))

(declare-fun e!728336 () Int)

(assert (=> d!140645 (= lt!575772 e!728336)))

(declare-fun c!124278 () Bool)

(assert (=> d!140645 (= c!124278 ((_ is Nil!28622) l!595))))

(assert (=> d!140645 (= (ListPrimitiveSize!163 l!595) lt!575772)))

(declare-fun b!1276003 () Bool)

(assert (=> b!1276003 (= e!728336 0)))

(declare-fun b!1276004 () Bool)

(assert (=> b!1276004 (= e!728336 (+ 1 (ListPrimitiveSize!163 (t!42150 l!595))))))

(assert (= (and d!140645 c!124278) b!1276003))

(assert (= (and d!140645 (not c!124278)) b!1276004))

(declare-fun m!1172939 () Bool)

(assert (=> b!1276004 m!1172939))

(assert (=> b!1275959 d!140645))

(declare-fun b!1276011 () Bool)

(declare-fun e!728340 () Bool)

(declare-fun tp!98012 () Bool)

(assert (=> b!1276011 (= e!728340 (and tp_is_empty!33193 tp!98012))))

(assert (=> b!1275960 (= tp!98003 e!728340)))

(assert (= (and b!1275960 ((_ is Cons!28621) (t!42150 l!595))) b!1276011))

(check-sat (not b!1276004) (not b!1275986) (not b!1276011) tp_is_empty!33193)
(check-sat)
