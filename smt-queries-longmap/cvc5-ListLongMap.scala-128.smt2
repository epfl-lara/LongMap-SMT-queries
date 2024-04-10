; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2226 () Bool)

(assert start!2226)

(declare-fun b!14868 () Bool)

(assert (=> b!14868 true))

(declare-fun res!11409 () Bool)

(declare-fun e!8950 () Bool)

(assert (=> b!14868 (=> res!11409 e!8950)))

(declare-datatypes ((B!566 0))(
  ( (B!567 (val!381 Int)) )
))
(declare-datatypes ((tuple2!562 0))(
  ( (tuple2!563 (_1!281 (_ BitVec 64)) (_2!281 B!566)) )
))
(declare-datatypes ((List!436 0))(
  ( (Nil!433) (Cons!432 (h!998 tuple2!562) (t!2838 List!436)) )
))
(declare-fun lt!3630 () List!436)

(declare-fun lambda!185 () Int)

(declare-fun forall!101 (List!436 Int) Bool)

(assert (=> b!14868 (= res!11409 (not (forall!101 lt!3630 lambda!185)))))

(declare-fun b!14869 () Bool)

(declare-fun e!8953 () Bool)

(declare-fun tp_is_empty!745 () Bool)

(declare-fun tp!2392 () Bool)

(assert (=> b!14869 (= e!8953 (and tp_is_empty!745 tp!2392))))

(declare-fun bm!449 () Bool)

(declare-fun call!452 () Bool)

(declare-fun isEmpty!108 (List!436) Bool)

(assert (=> bm!449 (= call!452 (isEmpty!108 lt!3630))))

(declare-fun b!14870 () Bool)

(declare-fun e!8954 () Bool)

(assert (=> b!14870 (= e!8954 (not call!452))))

(declare-fun b!14871 () Bool)

(declare-fun e!8952 () Bool)

(assert (=> b!14871 (= e!8954 e!8952)))

(declare-fun res!11410 () Bool)

(assert (=> b!14871 (= res!11410 (not call!452))))

(assert (=> b!14871 (=> (not res!11410) (not e!8952))))

(declare-fun b!14872 () Bool)

(assert (=> b!14872 (= e!8950 e!8954)))

(declare-fun c!1403 () Bool)

(declare-fun l!522 () List!436)

(assert (=> b!14872 (= c!1403 (isEmpty!108 l!522))))

(declare-fun b!14874 () Bool)

(declare-fun head!797 (List!436) tuple2!562)

(assert (=> b!14874 (= e!8952 (bvslt (_1!281 (head!797 lt!3630)) (_1!281 (head!797 l!522))))))

(declare-fun b!14873 () Bool)

(declare-fun e!8951 () Bool)

(assert (=> b!14873 (= e!8951 e!8950)))

(declare-fun res!11406 () Bool)

(assert (=> b!14873 (=> res!11406 e!8950)))

(declare-fun isStrictlySorted!123 (List!436) Bool)

(assert (=> b!14873 (= res!11406 (not (isStrictlySorted!123 lt!3630)))))

(declare-fun err!27 () List!436)

(assert (=> b!14873 (= lt!3630 err!27)))

(assert (=> b!14873 true))

(assert (=> b!14873 e!8953))

(declare-fun res!11408 () Bool)

(assert (=> start!2226 (=> (not res!11408) (not e!8951))))

(assert (=> start!2226 (= res!11408 (isStrictlySorted!123 l!522))))

(assert (=> start!2226 e!8951))

(declare-fun e!8949 () Bool)

(assert (=> start!2226 e!8949))

(assert (=> start!2226 tp_is_empty!745))

(declare-fun b!14875 () Bool)

(declare-fun tp!2393 () Bool)

(assert (=> b!14875 (= e!8949 (and tp_is_empty!745 tp!2393))))

(declare-fun b!14876 () Bool)

(declare-fun res!11407 () Bool)

(assert (=> b!14876 (=> (not res!11407) (not e!8951))))

(declare-fun value!159 () B!566)

(assert (=> b!14876 (= res!11407 (and (or (not (is-Cons!432 l!522)) (not (= (_2!281 (h!998 l!522)) value!159))) (or (not (is-Cons!432 l!522)) (= (_2!281 (h!998 l!522)) value!159)) (not (is-Nil!433 l!522))))))

(assert (= (and start!2226 res!11408) b!14876))

(assert (= (and b!14876 res!11407) b!14873))

(assert (= (and b!14873 (is-Cons!432 err!27)) b!14869))

(assert (= (and b!14873 (not res!11406)) b!14868))

(assert (= (and b!14868 (not res!11409)) b!14872))

(assert (= (and b!14872 c!1403) b!14870))

(assert (= (and b!14872 (not c!1403)) b!14871))

(assert (= (and b!14871 res!11410) b!14874))

(assert (= (or b!14870 b!14871) bm!449))

(assert (= (and start!2226 (is-Cons!432 l!522)) b!14875))

(declare-fun m!9905 () Bool)

(assert (=> b!14874 m!9905))

(declare-fun m!9907 () Bool)

(assert (=> b!14874 m!9907))

(declare-fun m!9909 () Bool)

(assert (=> b!14872 m!9909))

(declare-fun m!9911 () Bool)

(assert (=> b!14873 m!9911))

(declare-fun m!9913 () Bool)

(assert (=> start!2226 m!9913))

(declare-fun m!9915 () Bool)

(assert (=> b!14868 m!9915))

(declare-fun m!9917 () Bool)

(assert (=> bm!449 m!9917))

(push 1)

(assert (not b!14873))

(assert (not b!14869))

(assert (not bm!449))

(assert (not b!14874))

(assert (not b!14875))

(assert (not b!14868))

(assert (not b!14872))

(assert (not start!2226))

(assert tp_is_empty!745)

(check-sat)

(pop 1)

