; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75174 () Bool)

(assert start!75174)

(declare-fun res!601507 () Bool)

(declare-fun e!493047 () Bool)

(assert (=> start!75174 (=> (not res!601507) (not e!493047))))

(declare-datatypes ((B!1288 0))(
  ( (B!1289 (val!8950 Int)) )
))
(declare-datatypes ((tuple2!11894 0))(
  ( (tuple2!11895 (_1!5958 (_ BitVec 64)) (_2!5958 B!1288)) )
))
(declare-datatypes ((List!17666 0))(
  ( (Nil!17663) (Cons!17662 (h!18793 tuple2!11894) (t!24943 List!17666)) )
))
(declare-fun l!906 () List!17666)

(declare-fun isStrictlySorted!484 (List!17666) Bool)

(assert (=> start!75174 (= res!601507 (isStrictlySorted!484 l!906))))

(assert (=> start!75174 e!493047))

(declare-fun e!493046 () Bool)

(assert (=> start!75174 e!493046))

(assert (=> start!75174 true))

(declare-fun b!885848 () Bool)

(declare-fun res!601506 () Bool)

(assert (=> b!885848 (=> (not res!601506) (not e!493047))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885848 (= res!601506 (and ((_ is Cons!17662) l!906) (bvslt (_1!5958 (h!18793 l!906)) key1!49)))))

(declare-fun b!885849 () Bool)

(assert (=> b!885849 (= e!493047 (not (isStrictlySorted!484 (t!24943 l!906))))))

(declare-fun b!885850 () Bool)

(declare-fun tp_is_empty!17799 () Bool)

(declare-fun tp!54332 () Bool)

(assert (=> b!885850 (= e!493046 (and tp_is_empty!17799 tp!54332))))

(assert (= (and start!75174 res!601507) b!885848))

(assert (= (and b!885848 res!601506) b!885849))

(assert (= (and start!75174 ((_ is Cons!17662) l!906)) b!885850))

(declare-fun m!825869 () Bool)

(assert (=> start!75174 m!825869))

(declare-fun m!825871 () Bool)

(assert (=> b!885849 m!825871))

(check-sat (not b!885849) (not start!75174) (not b!885850) tp_is_empty!17799)
(check-sat)
(get-model)

(declare-fun d!109457 () Bool)

(declare-fun res!601518 () Bool)

(declare-fun e!493058 () Bool)

(assert (=> d!109457 (=> res!601518 e!493058)))

(assert (=> d!109457 (= res!601518 (or ((_ is Nil!17663) (t!24943 l!906)) ((_ is Nil!17663) (t!24943 (t!24943 l!906)))))))

(assert (=> d!109457 (= (isStrictlySorted!484 (t!24943 l!906)) e!493058)))

(declare-fun b!885864 () Bool)

(declare-fun e!493059 () Bool)

(assert (=> b!885864 (= e!493058 e!493059)))

(declare-fun res!601519 () Bool)

(assert (=> b!885864 (=> (not res!601519) (not e!493059))))

(assert (=> b!885864 (= res!601519 (bvslt (_1!5958 (h!18793 (t!24943 l!906))) (_1!5958 (h!18793 (t!24943 (t!24943 l!906))))))))

(declare-fun b!885865 () Bool)

(assert (=> b!885865 (= e!493059 (isStrictlySorted!484 (t!24943 (t!24943 l!906))))))

(assert (= (and d!109457 (not res!601518)) b!885864))

(assert (= (and b!885864 res!601519) b!885865))

(declare-fun m!825877 () Bool)

(assert (=> b!885865 m!825877))

(assert (=> b!885849 d!109457))

(declare-fun d!109461 () Bool)

(declare-fun res!601520 () Bool)

(declare-fun e!493060 () Bool)

(assert (=> d!109461 (=> res!601520 e!493060)))

(assert (=> d!109461 (= res!601520 (or ((_ is Nil!17663) l!906) ((_ is Nil!17663) (t!24943 l!906))))))

(assert (=> d!109461 (= (isStrictlySorted!484 l!906) e!493060)))

(declare-fun b!885866 () Bool)

(declare-fun e!493061 () Bool)

(assert (=> b!885866 (= e!493060 e!493061)))

(declare-fun res!601521 () Bool)

(assert (=> b!885866 (=> (not res!601521) (not e!493061))))

(assert (=> b!885866 (= res!601521 (bvslt (_1!5958 (h!18793 l!906)) (_1!5958 (h!18793 (t!24943 l!906)))))))

(declare-fun b!885867 () Bool)

(assert (=> b!885867 (= e!493061 (isStrictlySorted!484 (t!24943 l!906)))))

(assert (= (and d!109461 (not res!601520)) b!885866))

(assert (= (and b!885866 res!601521) b!885867))

(assert (=> b!885867 m!825871))

(assert (=> start!75174 d!109461))

(declare-fun b!885872 () Bool)

(declare-fun e!493064 () Bool)

(declare-fun tp!54338 () Bool)

(assert (=> b!885872 (= e!493064 (and tp_is_empty!17799 tp!54338))))

(assert (=> b!885850 (= tp!54332 e!493064)))

(assert (= (and b!885850 ((_ is Cons!17662) (t!24943 l!906))) b!885872))

(check-sat (not b!885867) (not b!885865) (not b!885872) tp_is_empty!17799)
(check-sat)
