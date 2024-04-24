; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2226 () Bool)

(assert start!2226)

(declare-fun b!14864 () Bool)

(assert (=> b!14864 true))

(declare-fun b!14862 () Bool)

(declare-fun e!8947 () Bool)

(declare-datatypes ((B!566 0))(
  ( (B!567 (val!381 Int)) )
))
(declare-datatypes ((tuple2!558 0))(
  ( (tuple2!559 (_1!279 (_ BitVec 64)) (_2!279 B!566)) )
))
(declare-datatypes ((List!432 0))(
  ( (Nil!429) (Cons!428 (h!994 tuple2!558) (t!2834 List!432)) )
))
(declare-fun lt!3630 () List!432)

(declare-fun l!522 () List!432)

(declare-fun head!795 (List!432) tuple2!558)

(assert (=> b!14862 (= e!8947 (bvslt (_1!279 (head!795 lt!3630)) (_1!279 (head!795 l!522))))))

(declare-fun res!11408 () Bool)

(declare-fun e!8946 () Bool)

(assert (=> b!14864 (=> res!11408 e!8946)))

(declare-fun lambda!185 () Int)

(declare-fun forall!101 (List!432 Int) Bool)

(assert (=> b!14864 (= res!11408 (not (forall!101 lt!3630 lambda!185)))))

(declare-fun b!14865 () Bool)

(declare-fun e!8950 () Bool)

(declare-fun tp_is_empty!745 () Bool)

(declare-fun tp!2392 () Bool)

(assert (=> b!14865 (= e!8950 (and tp_is_empty!745 tp!2392))))

(declare-fun b!14866 () Bool)

(declare-fun e!8949 () Bool)

(declare-fun call!452 () Bool)

(assert (=> b!14866 (= e!8949 (not call!452))))

(declare-fun b!14867 () Bool)

(declare-fun e!8945 () Bool)

(declare-fun tp!2393 () Bool)

(assert (=> b!14867 (= e!8945 (and tp_is_empty!745 tp!2393))))

(declare-fun res!11405 () Bool)

(declare-fun e!8948 () Bool)

(assert (=> start!2226 (=> (not res!11405) (not e!8948))))

(declare-fun isStrictlySorted!117 (List!432) Bool)

(assert (=> start!2226 (= res!11405 (isStrictlySorted!117 l!522))))

(assert (=> start!2226 e!8948))

(assert (=> start!2226 e!8950))

(assert (=> start!2226 tp_is_empty!745))

(declare-fun b!14863 () Bool)

(assert (=> b!14863 (= e!8949 e!8947)))

(declare-fun res!11404 () Bool)

(assert (=> b!14863 (= res!11404 (not call!452))))

(assert (=> b!14863 (=> (not res!11404) (not e!8947))))

(declare-fun b!14868 () Bool)

(assert (=> b!14868 (= e!8948 e!8946)))

(declare-fun res!11406 () Bool)

(assert (=> b!14868 (=> res!11406 e!8946)))

(assert (=> b!14868 (= res!11406 (not (isStrictlySorted!117 lt!3630)))))

(declare-fun err!27 () List!432)

(assert (=> b!14868 (= lt!3630 err!27)))

(assert (=> b!14868 true))

(assert (=> b!14868 e!8945))

(declare-fun b!14869 () Bool)

(assert (=> b!14869 (= e!8946 e!8949)))

(declare-fun c!1401 () Bool)

(declare-fun isEmpty!108 (List!432) Bool)

(assert (=> b!14869 (= c!1401 (isEmpty!108 l!522))))

(declare-fun bm!449 () Bool)

(assert (=> bm!449 (= call!452 (isEmpty!108 lt!3630))))

(declare-fun b!14870 () Bool)

(declare-fun res!11407 () Bool)

(assert (=> b!14870 (=> (not res!11407) (not e!8948))))

(declare-fun value!159 () B!566)

(get-info :version)

(assert (=> b!14870 (= res!11407 (and (or (not ((_ is Cons!428) l!522)) (not (= (_2!279 (h!994 l!522)) value!159))) (or (not ((_ is Cons!428) l!522)) (= (_2!279 (h!994 l!522)) value!159)) (not ((_ is Nil!429) l!522))))))

(assert (= (and start!2226 res!11405) b!14870))

(assert (= (and b!14870 res!11407) b!14868))

(assert (= (and b!14868 ((_ is Cons!428) err!27)) b!14867))

(assert (= (and b!14868 (not res!11406)) b!14864))

(assert (= (and b!14864 (not res!11408)) b!14869))

(assert (= (and b!14869 c!1401) b!14866))

(assert (= (and b!14869 (not c!1401)) b!14863))

(assert (= (and b!14863 res!11404) b!14862))

(assert (= (or b!14866 b!14863) bm!449))

(assert (= (and start!2226 ((_ is Cons!428) l!522)) b!14865))

(declare-fun m!9897 () Bool)

(assert (=> b!14862 m!9897))

(declare-fun m!9899 () Bool)

(assert (=> b!14862 m!9899))

(declare-fun m!9901 () Bool)

(assert (=> start!2226 m!9901))

(declare-fun m!9903 () Bool)

(assert (=> b!14864 m!9903))

(declare-fun m!9905 () Bool)

(assert (=> b!14868 m!9905))

(declare-fun m!9907 () Bool)

(assert (=> b!14869 m!9907))

(declare-fun m!9909 () Bool)

(assert (=> bm!449 m!9909))

(check-sat (not bm!449) (not b!14864) tp_is_empty!745 (not b!14867) (not b!14868) (not b!14869) (not b!14865) (not b!14862) (not start!2226))
(check-sat)
