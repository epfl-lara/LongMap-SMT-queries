; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2226 () Bool)

(assert start!2226)

(declare-fun b!14868 () Bool)

(assert (=> b!14868 true))

(declare-fun res!11406 () Bool)

(declare-fun e!8951 () Bool)

(assert (=> b!14868 (=> res!11406 e!8951)))

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

(declare-fun lambda!185 () Int)

(declare-fun forall!101 (List!432 Int) Bool)

(assert (=> b!14868 (= res!11406 (not (forall!101 lt!3630 lambda!185)))))

(declare-fun b!14869 () Bool)

(declare-fun e!8949 () Bool)

(declare-fun e!8952 () Bool)

(assert (=> b!14869 (= e!8949 e!8952)))

(declare-fun res!11410 () Bool)

(declare-fun call!452 () Bool)

(assert (=> b!14869 (= res!11410 (not call!452))))

(assert (=> b!14869 (=> (not res!11410) (not e!8952))))

(declare-fun b!14870 () Bool)

(declare-fun e!8953 () Bool)

(declare-fun tp_is_empty!745 () Bool)

(declare-fun tp!2393 () Bool)

(assert (=> b!14870 (= e!8953 (and tp_is_empty!745 tp!2393))))

(declare-fun b!14871 () Bool)

(declare-fun e!8950 () Bool)

(assert (=> b!14871 (= e!8950 e!8951)))

(declare-fun res!11407 () Bool)

(assert (=> b!14871 (=> res!11407 e!8951)))

(declare-fun isStrictlySorted!120 (List!432) Bool)

(assert (=> b!14871 (= res!11407 (not (isStrictlySorted!120 lt!3630)))))

(declare-fun err!27 () List!432)

(assert (=> b!14871 (= lt!3630 err!27)))

(assert (=> b!14871 true))

(assert (=> b!14871 e!8953))

(declare-fun b!14872 () Bool)

(assert (=> b!14872 (= e!8951 e!8949)))

(declare-fun c!1403 () Bool)

(declare-fun l!522 () List!432)

(declare-fun isEmpty!108 (List!432) Bool)

(assert (=> b!14872 (= c!1403 (isEmpty!108 l!522))))

(declare-fun res!11408 () Bool)

(assert (=> start!2226 (=> (not res!11408) (not e!8950))))

(assert (=> start!2226 (= res!11408 (isStrictlySorted!120 l!522))))

(assert (=> start!2226 e!8950))

(declare-fun e!8954 () Bool)

(assert (=> start!2226 e!8954))

(assert (=> start!2226 tp_is_empty!745))

(declare-fun b!14873 () Bool)

(declare-fun res!11409 () Bool)

(assert (=> b!14873 (=> (not res!11409) (not e!8950))))

(declare-fun value!159 () B!566)

(get-info :version)

(assert (=> b!14873 (= res!11409 (and (or (not ((_ is Cons!428) l!522)) (not (= (_2!279 (h!994 l!522)) value!159))) (or (not ((_ is Cons!428) l!522)) (= (_2!279 (h!994 l!522)) value!159)) (not ((_ is Nil!429) l!522))))))

(declare-fun b!14874 () Bool)

(declare-fun head!797 (List!432) tuple2!558)

(assert (=> b!14874 (= e!8952 (bvslt (_1!279 (head!797 lt!3630)) (_1!279 (head!797 l!522))))))

(declare-fun b!14875 () Bool)

(declare-fun tp!2392 () Bool)

(assert (=> b!14875 (= e!8954 (and tp_is_empty!745 tp!2392))))

(declare-fun bm!449 () Bool)

(assert (=> bm!449 (= call!452 (isEmpty!108 lt!3630))))

(declare-fun b!14876 () Bool)

(assert (=> b!14876 (= e!8949 (not call!452))))

(assert (= (and start!2226 res!11408) b!14873))

(assert (= (and b!14873 res!11409) b!14871))

(assert (= (and b!14871 ((_ is Cons!428) err!27)) b!14870))

(assert (= (and b!14871 (not res!11407)) b!14868))

(assert (= (and b!14868 (not res!11406)) b!14872))

(assert (= (and b!14872 c!1403) b!14876))

(assert (= (and b!14872 (not c!1403)) b!14869))

(assert (= (and b!14869 res!11410) b!14874))

(assert (= (or b!14876 b!14869) bm!449))

(assert (= (and start!2226 ((_ is Cons!428) l!522)) b!14875))

(declare-fun m!9897 () Bool)

(assert (=> bm!449 m!9897))

(declare-fun m!9899 () Bool)

(assert (=> b!14874 m!9899))

(declare-fun m!9901 () Bool)

(assert (=> b!14874 m!9901))

(declare-fun m!9903 () Bool)

(assert (=> b!14872 m!9903))

(declare-fun m!9905 () Bool)

(assert (=> b!14868 m!9905))

(declare-fun m!9907 () Bool)

(assert (=> start!2226 m!9907))

(declare-fun m!9909 () Bool)

(assert (=> b!14871 m!9909))

(check-sat (not b!14872) tp_is_empty!745 (not b!14874) (not start!2226) (not b!14868) (not bm!449) (not b!14871) (not b!14870) (not b!14875))
(check-sat)
