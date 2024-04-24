; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133632 () Bool)

(assert start!133632)

(declare-fun res!1066671 () Bool)

(declare-fun e!869635 () Bool)

(assert (=> start!133632 (=> (not res!1066671) (not e!869635))))

(declare-datatypes ((B!2432 0))(
  ( (B!2433 (val!19302 Int)) )
))
(declare-datatypes ((tuple2!25034 0))(
  ( (tuple2!25035 (_1!12528 (_ BitVec 64)) (_2!12528 B!2432)) )
))
(declare-datatypes ((List!36365 0))(
  ( (Nil!36362) (Cons!36361 (h!37825 tuple2!25034) (t!51084 List!36365)) )
))
(declare-fun l!1292 () List!36365)

(declare-fun isStrictlySorted!963 (List!36365) Bool)

(assert (=> start!133632 (= res!1066671 (isStrictlySorted!963 l!1292))))

(assert (=> start!133632 e!869635))

(declare-fun e!869636 () Bool)

(assert (=> start!133632 e!869636))

(assert (=> start!133632 true))

(declare-fun b!1560795 () Bool)

(declare-fun res!1066667 () Bool)

(assert (=> b!1560795 (=> (not res!1066667) (not e!869635))))

(assert (=> b!1560795 (= res!1066667 (isStrictlySorted!963 (t!51084 l!1292)))))

(declare-fun b!1560796 () Bool)

(declare-fun res!1066668 () Bool)

(assert (=> b!1560796 (=> (not res!1066668) (not e!869635))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1560796 (= res!1066668 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36361) l!1292) (not (= (_1!12528 (h!37825 l!1292)) otherKey!62))))))

(declare-fun b!1560797 () Bool)

(declare-fun tp_is_empty!38437 () Bool)

(declare-fun tp!112638 () Bool)

(assert (=> b!1560797 (= e!869636 (and tp_is_empty!38437 tp!112638))))

(declare-fun b!1560798 () Bool)

(declare-fun res!1066670 () Bool)

(assert (=> b!1560798 (=> (not res!1066670) (not e!869635))))

(declare-fun containsKey!839 (List!36365 (_ BitVec 64)) Bool)

(assert (=> b!1560798 (= res!1066670 (containsKey!839 l!1292 otherKey!62))))

(declare-fun b!1560799 () Bool)

(declare-fun res!1066669 () Bool)

(assert (=> b!1560799 (=> (not res!1066669) (not e!869635))))

(assert (=> b!1560799 (= res!1066669 (containsKey!839 (t!51084 l!1292) otherKey!62))))

(declare-fun b!1560800 () Bool)

(declare-fun ListPrimitiveSize!184 (List!36365) Int)

(assert (=> b!1560800 (= e!869635 (>= (ListPrimitiveSize!184 (t!51084 l!1292)) (ListPrimitiveSize!184 l!1292)))))

(assert (= (and start!133632 res!1066671) b!1560798))

(assert (= (and b!1560798 res!1066670) b!1560796))

(assert (= (and b!1560796 res!1066668) b!1560795))

(assert (= (and b!1560795 res!1066667) b!1560799))

(assert (= (and b!1560799 res!1066669) b!1560800))

(assert (= (and start!133632 ((_ is Cons!36361) l!1292)) b!1560797))

(declare-fun m!1437299 () Bool)

(assert (=> start!133632 m!1437299))

(declare-fun m!1437301 () Bool)

(assert (=> b!1560800 m!1437301))

(declare-fun m!1437303 () Bool)

(assert (=> b!1560800 m!1437303))

(declare-fun m!1437305 () Bool)

(assert (=> b!1560799 m!1437305))

(declare-fun m!1437307 () Bool)

(assert (=> b!1560798 m!1437307))

(declare-fun m!1437309 () Bool)

(assert (=> b!1560795 m!1437309))

(check-sat tp_is_empty!38437 (not b!1560800) (not b!1560799) (not start!133632) (not b!1560795) (not b!1560797) (not b!1560798))
(check-sat)
(get-model)

(declare-fun d!163341 () Bool)

(declare-fun res!1066706 () Bool)

(declare-fun e!869655 () Bool)

(assert (=> d!163341 (=> res!1066706 e!869655)))

(assert (=> d!163341 (= res!1066706 (or ((_ is Nil!36362) (t!51084 l!1292)) ((_ is Nil!36362) (t!51084 (t!51084 l!1292)))))))

(assert (=> d!163341 (= (isStrictlySorted!963 (t!51084 l!1292)) e!869655)))

(declare-fun b!1560845 () Bool)

(declare-fun e!869656 () Bool)

(assert (=> b!1560845 (= e!869655 e!869656)))

(declare-fun res!1066707 () Bool)

(assert (=> b!1560845 (=> (not res!1066707) (not e!869656))))

(assert (=> b!1560845 (= res!1066707 (bvslt (_1!12528 (h!37825 (t!51084 l!1292))) (_1!12528 (h!37825 (t!51084 (t!51084 l!1292))))))))

(declare-fun b!1560846 () Bool)

(assert (=> b!1560846 (= e!869656 (isStrictlySorted!963 (t!51084 (t!51084 l!1292))))))

(assert (= (and d!163341 (not res!1066706)) b!1560845))

(assert (= (and b!1560845 res!1066707) b!1560846))

(declare-fun m!1437335 () Bool)

(assert (=> b!1560846 m!1437335))

(assert (=> b!1560795 d!163341))

(declare-fun d!163345 () Bool)

(declare-fun lt!671687 () Int)

(assert (=> d!163345 (>= lt!671687 0)))

(declare-fun e!869661 () Int)

(assert (=> d!163345 (= lt!671687 e!869661)))

(declare-fun c!144899 () Bool)

(assert (=> d!163345 (= c!144899 ((_ is Nil!36362) (t!51084 l!1292)))))

(assert (=> d!163345 (= (ListPrimitiveSize!184 (t!51084 l!1292)) lt!671687)))

(declare-fun b!1560855 () Bool)

(assert (=> b!1560855 (= e!869661 0)))

(declare-fun b!1560856 () Bool)

(assert (=> b!1560856 (= e!869661 (+ 1 (ListPrimitiveSize!184 (t!51084 (t!51084 l!1292)))))))

(assert (= (and d!163345 c!144899) b!1560855))

(assert (= (and d!163345 (not c!144899)) b!1560856))

(declare-fun m!1437339 () Bool)

(assert (=> b!1560856 m!1437339))

(assert (=> b!1560800 d!163345))

(declare-fun d!163353 () Bool)

(declare-fun lt!671688 () Int)

(assert (=> d!163353 (>= lt!671688 0)))

(declare-fun e!869662 () Int)

(assert (=> d!163353 (= lt!671688 e!869662)))

(declare-fun c!144900 () Bool)

(assert (=> d!163353 (= c!144900 ((_ is Nil!36362) l!1292))))

(assert (=> d!163353 (= (ListPrimitiveSize!184 l!1292) lt!671688)))

(declare-fun b!1560857 () Bool)

(assert (=> b!1560857 (= e!869662 0)))

(declare-fun b!1560858 () Bool)

(assert (=> b!1560858 (= e!869662 (+ 1 (ListPrimitiveSize!184 (t!51084 l!1292))))))

(assert (= (and d!163353 c!144900) b!1560857))

(assert (= (and d!163353 (not c!144900)) b!1560858))

(assert (=> b!1560858 m!1437301))

(assert (=> b!1560800 d!163353))

(declare-fun d!163355 () Bool)

(declare-fun res!1066722 () Bool)

(declare-fun e!869677 () Bool)

(assert (=> d!163355 (=> res!1066722 e!869677)))

(assert (=> d!163355 (= res!1066722 (and ((_ is Cons!36361) l!1292) (= (_1!12528 (h!37825 l!1292)) otherKey!62)))))

(assert (=> d!163355 (= (containsKey!839 l!1292 otherKey!62) e!869677)))

(declare-fun b!1560873 () Bool)

(declare-fun e!869678 () Bool)

(assert (=> b!1560873 (= e!869677 e!869678)))

(declare-fun res!1066723 () Bool)

(assert (=> b!1560873 (=> (not res!1066723) (not e!869678))))

(assert (=> b!1560873 (= res!1066723 (and (or (not ((_ is Cons!36361) l!1292)) (bvsle (_1!12528 (h!37825 l!1292)) otherKey!62)) ((_ is Cons!36361) l!1292) (bvslt (_1!12528 (h!37825 l!1292)) otherKey!62)))))

(declare-fun b!1560874 () Bool)

(assert (=> b!1560874 (= e!869678 (containsKey!839 (t!51084 l!1292) otherKey!62))))

(assert (= (and d!163355 (not res!1066722)) b!1560873))

(assert (= (and b!1560873 res!1066723) b!1560874))

(assert (=> b!1560874 m!1437305))

(assert (=> b!1560798 d!163355))

(declare-fun d!163359 () Bool)

(declare-fun res!1066726 () Bool)

(declare-fun e!869681 () Bool)

(assert (=> d!163359 (=> res!1066726 e!869681)))

(assert (=> d!163359 (= res!1066726 (and ((_ is Cons!36361) (t!51084 l!1292)) (= (_1!12528 (h!37825 (t!51084 l!1292))) otherKey!62)))))

(assert (=> d!163359 (= (containsKey!839 (t!51084 l!1292) otherKey!62) e!869681)))

(declare-fun b!1560877 () Bool)

(declare-fun e!869682 () Bool)

(assert (=> b!1560877 (= e!869681 e!869682)))

(declare-fun res!1066727 () Bool)

(assert (=> b!1560877 (=> (not res!1066727) (not e!869682))))

(assert (=> b!1560877 (= res!1066727 (and (or (not ((_ is Cons!36361) (t!51084 l!1292))) (bvsle (_1!12528 (h!37825 (t!51084 l!1292))) otherKey!62)) ((_ is Cons!36361) (t!51084 l!1292)) (bvslt (_1!12528 (h!37825 (t!51084 l!1292))) otherKey!62)))))

(declare-fun b!1560878 () Bool)

(assert (=> b!1560878 (= e!869682 (containsKey!839 (t!51084 (t!51084 l!1292)) otherKey!62))))

(assert (= (and d!163359 (not res!1066726)) b!1560877))

(assert (= (and b!1560877 res!1066727) b!1560878))

(declare-fun m!1437343 () Bool)

(assert (=> b!1560878 m!1437343))

(assert (=> b!1560799 d!163359))

(declare-fun d!163361 () Bool)

(declare-fun res!1066728 () Bool)

(declare-fun e!869683 () Bool)

(assert (=> d!163361 (=> res!1066728 e!869683)))

(assert (=> d!163361 (= res!1066728 (or ((_ is Nil!36362) l!1292) ((_ is Nil!36362) (t!51084 l!1292))))))

(assert (=> d!163361 (= (isStrictlySorted!963 l!1292) e!869683)))

(declare-fun b!1560879 () Bool)

(declare-fun e!869684 () Bool)

(assert (=> b!1560879 (= e!869683 e!869684)))

(declare-fun res!1066729 () Bool)

(assert (=> b!1560879 (=> (not res!1066729) (not e!869684))))

(assert (=> b!1560879 (= res!1066729 (bvslt (_1!12528 (h!37825 l!1292)) (_1!12528 (h!37825 (t!51084 l!1292)))))))

(declare-fun b!1560880 () Bool)

(assert (=> b!1560880 (= e!869684 (isStrictlySorted!963 (t!51084 l!1292)))))

(assert (= (and d!163361 (not res!1066728)) b!1560879))

(assert (= (and b!1560879 res!1066729) b!1560880))

(assert (=> b!1560880 m!1437309))

(assert (=> start!133632 d!163361))

(declare-fun b!1560887 () Bool)

(declare-fun e!869689 () Bool)

(declare-fun tp!112647 () Bool)

(assert (=> b!1560887 (= e!869689 (and tp_is_empty!38437 tp!112647))))

(assert (=> b!1560797 (= tp!112638 e!869689)))

(assert (= (and b!1560797 ((_ is Cons!36361) (t!51084 l!1292))) b!1560887))

(check-sat (not b!1560874) (not b!1560878) (not b!1560858) tp_is_empty!38437 (not b!1560856) (not b!1560846) (not b!1560887) (not b!1560880))
(check-sat)
