; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75352 () Bool)

(assert start!75352)

(declare-fun b!886812 () Bool)

(declare-fun e!493673 () Bool)

(declare-datatypes ((B!1292 0))(
  ( (B!1293 (val!8952 Int)) )
))
(declare-datatypes ((tuple2!11828 0))(
  ( (tuple2!11829 (_1!5925 (_ BitVec 64)) (_2!5925 B!1292)) )
))
(declare-datatypes ((List!17623 0))(
  ( (Nil!17620) (Cons!17619 (h!18756 tuple2!11828) (t!24892 List!17623)) )
))
(declare-fun l!906 () List!17623)

(declare-fun ListPrimitiveSize!88 (List!17623) Int)

(assert (=> b!886812 (= e!493673 (>= (ListPrimitiveSize!88 (t!24892 l!906)) (ListPrimitiveSize!88 l!906)))))

(declare-fun b!886811 () Bool)

(declare-fun res!601890 () Bool)

(assert (=> b!886811 (=> (not res!601890) (not e!493673))))

(declare-fun isStrictlySorted!474 (List!17623) Bool)

(assert (=> b!886811 (= res!601890 (isStrictlySorted!474 (t!24892 l!906)))))

(declare-fun b!886810 () Bool)

(declare-fun res!601889 () Bool)

(assert (=> b!886810 (=> (not res!601889) (not e!493673))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886810 (= res!601889 (and ((_ is Cons!17619) l!906) (bvslt (_1!5925 (h!18756 l!906)) key1!49)))))

(declare-fun b!886813 () Bool)

(declare-fun e!493674 () Bool)

(declare-fun tp_is_empty!17803 () Bool)

(declare-fun tp!54348 () Bool)

(assert (=> b!886813 (= e!493674 (and tp_is_empty!17803 tp!54348))))

(declare-fun res!601888 () Bool)

(assert (=> start!75352 (=> (not res!601888) (not e!493673))))

(assert (=> start!75352 (= res!601888 (isStrictlySorted!474 l!906))))

(assert (=> start!75352 e!493673))

(assert (=> start!75352 e!493674))

(assert (=> start!75352 true))

(assert (= (and start!75352 res!601888) b!886810))

(assert (= (and b!886810 res!601889) b!886811))

(assert (= (and b!886811 res!601890) b!886812))

(assert (= (and start!75352 ((_ is Cons!17619) l!906)) b!886813))

(declare-fun m!827177 () Bool)

(assert (=> b!886812 m!827177))

(declare-fun m!827179 () Bool)

(assert (=> b!886812 m!827179))

(declare-fun m!827181 () Bool)

(assert (=> b!886811 m!827181))

(declare-fun m!827183 () Bool)

(assert (=> start!75352 m!827183))

(check-sat tp_is_empty!17803 (not b!886813) (not b!886811) (not start!75352) (not b!886812))
(check-sat)
(get-model)

(declare-fun d!109793 () Bool)

(declare-fun res!601913 () Bool)

(declare-fun e!493691 () Bool)

(assert (=> d!109793 (=> res!601913 e!493691)))

(assert (=> d!109793 (= res!601913 (or ((_ is Nil!17620) (t!24892 l!906)) ((_ is Nil!17620) (t!24892 (t!24892 l!906)))))))

(assert (=> d!109793 (= (isStrictlySorted!474 (t!24892 l!906)) e!493691)))

(declare-fun b!886842 () Bool)

(declare-fun e!493692 () Bool)

(assert (=> b!886842 (= e!493691 e!493692)))

(declare-fun res!601914 () Bool)

(assert (=> b!886842 (=> (not res!601914) (not e!493692))))

(assert (=> b!886842 (= res!601914 (bvslt (_1!5925 (h!18756 (t!24892 l!906))) (_1!5925 (h!18756 (t!24892 (t!24892 l!906))))))))

(declare-fun b!886843 () Bool)

(assert (=> b!886843 (= e!493692 (isStrictlySorted!474 (t!24892 (t!24892 l!906))))))

(assert (= (and d!109793 (not res!601913)) b!886842))

(assert (= (and b!886842 res!601914) b!886843))

(declare-fun m!827201 () Bool)

(assert (=> b!886843 m!827201))

(assert (=> b!886811 d!109793))

(declare-fun d!109797 () Bool)

(declare-fun res!601915 () Bool)

(declare-fun e!493693 () Bool)

(assert (=> d!109797 (=> res!601915 e!493693)))

(assert (=> d!109797 (= res!601915 (or ((_ is Nil!17620) l!906) ((_ is Nil!17620) (t!24892 l!906))))))

(assert (=> d!109797 (= (isStrictlySorted!474 l!906) e!493693)))

(declare-fun b!886844 () Bool)

(declare-fun e!493694 () Bool)

(assert (=> b!886844 (= e!493693 e!493694)))

(declare-fun res!601916 () Bool)

(assert (=> b!886844 (=> (not res!601916) (not e!493694))))

(assert (=> b!886844 (= res!601916 (bvslt (_1!5925 (h!18756 l!906)) (_1!5925 (h!18756 (t!24892 l!906)))))))

(declare-fun b!886845 () Bool)

(assert (=> b!886845 (= e!493694 (isStrictlySorted!474 (t!24892 l!906)))))

(assert (= (and d!109797 (not res!601915)) b!886844))

(assert (= (and b!886844 res!601916) b!886845))

(assert (=> b!886845 m!827181))

(assert (=> start!75352 d!109797))

(declare-fun d!109799 () Bool)

(declare-fun lt!401417 () Int)

(assert (=> d!109799 (>= lt!401417 0)))

(declare-fun e!493703 () Int)

(assert (=> d!109799 (= lt!401417 e!493703)))

(declare-fun c!93647 () Bool)

(assert (=> d!109799 (= c!93647 ((_ is Nil!17620) (t!24892 l!906)))))

(assert (=> d!109799 (= (ListPrimitiveSize!88 (t!24892 l!906)) lt!401417)))

(declare-fun b!886856 () Bool)

(assert (=> b!886856 (= e!493703 0)))

(declare-fun b!886857 () Bool)

(assert (=> b!886857 (= e!493703 (+ 1 (ListPrimitiveSize!88 (t!24892 (t!24892 l!906)))))))

(assert (= (and d!109799 c!93647) b!886856))

(assert (= (and d!109799 (not c!93647)) b!886857))

(declare-fun m!827205 () Bool)

(assert (=> b!886857 m!827205))

(assert (=> b!886812 d!109799))

(declare-fun d!109803 () Bool)

(declare-fun lt!401418 () Int)

(assert (=> d!109803 (>= lt!401418 0)))

(declare-fun e!493706 () Int)

(assert (=> d!109803 (= lt!401418 e!493706)))

(declare-fun c!93648 () Bool)

(assert (=> d!109803 (= c!93648 ((_ is Nil!17620) l!906))))

(assert (=> d!109803 (= (ListPrimitiveSize!88 l!906) lt!401418)))

(declare-fun b!886860 () Bool)

(assert (=> b!886860 (= e!493706 0)))

(declare-fun b!886861 () Bool)

(assert (=> b!886861 (= e!493706 (+ 1 (ListPrimitiveSize!88 (t!24892 l!906))))))

(assert (= (and d!109803 c!93648) b!886860))

(assert (= (and d!109803 (not c!93648)) b!886861))

(assert (=> b!886861 m!827177))

(assert (=> b!886812 d!109803))

(declare-fun b!886866 () Bool)

(declare-fun e!493709 () Bool)

(declare-fun tp!54357 () Bool)

(assert (=> b!886866 (= e!493709 (and tp_is_empty!17803 tp!54357))))

(assert (=> b!886813 (= tp!54348 e!493709)))

(assert (= (and b!886813 ((_ is Cons!17619) (t!24892 l!906))) b!886866))

(check-sat (not b!886845) (not b!886861) (not b!886857) (not b!886866) tp_is_empty!17803 (not b!886843))
(check-sat)
