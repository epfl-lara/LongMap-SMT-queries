; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2228 () Bool)

(assert start!2228)

(declare-fun b!14899 () Bool)

(assert (=> b!14899 true))

(declare-fun b!14897 () Bool)

(declare-fun e!8968 () Bool)

(declare-fun call!455 () Bool)

(assert (=> b!14897 (= e!8968 (not call!455))))

(declare-fun b!14898 () Bool)

(declare-fun e!8967 () Bool)

(assert (=> b!14898 (= e!8967 e!8968)))

(declare-fun c!1406 () Bool)

(declare-datatypes ((B!568 0))(
  ( (B!569 (val!382 Int)) )
))
(declare-datatypes ((tuple2!564 0))(
  ( (tuple2!565 (_1!282 (_ BitVec 64)) (_2!282 B!568)) )
))
(declare-datatypes ((List!437 0))(
  ( (Nil!434) (Cons!433 (h!999 tuple2!564) (t!2839 List!437)) )
))
(declare-fun l!522 () List!437)

(declare-fun isEmpty!109 (List!437) Bool)

(assert (=> b!14898 (= c!1406 (isEmpty!109 l!522))))

(declare-fun res!11422 () Bool)

(assert (=> b!14899 (=> res!11422 e!8967)))

(declare-fun lt!3633 () List!437)

(declare-fun lambda!188 () Int)

(declare-fun forall!102 (List!437 Int) Bool)

(assert (=> b!14899 (= res!11422 (not (forall!102 lt!3633 lambda!188)))))

(declare-fun b!14900 () Bool)

(declare-fun e!8970 () Bool)

(declare-fun tp_is_empty!747 () Bool)

(declare-fun tp!2399 () Bool)

(assert (=> b!14900 (= e!8970 (and tp_is_empty!747 tp!2399))))

(declare-fun res!11423 () Bool)

(declare-fun e!8972 () Bool)

(assert (=> start!2228 (=> (not res!11423) (not e!8972))))

(declare-fun isStrictlySorted!124 (List!437) Bool)

(assert (=> start!2228 (= res!11423 (isStrictlySorted!124 l!522))))

(assert (=> start!2228 e!8972))

(declare-fun e!8969 () Bool)

(assert (=> start!2228 e!8969))

(assert (=> start!2228 tp_is_empty!747))

(declare-fun b!14901 () Bool)

(declare-fun tp!2398 () Bool)

(assert (=> b!14901 (= e!8969 (and tp_is_empty!747 tp!2398))))

(declare-fun b!14902 () Bool)

(declare-fun res!11425 () Bool)

(assert (=> b!14902 (=> (not res!11425) (not e!8972))))

(declare-fun value!159 () B!568)

(get-info :version)

(assert (=> b!14902 (= res!11425 (and (or (not ((_ is Cons!433) l!522)) (not (= (_2!282 (h!999 l!522)) value!159))) (or (not ((_ is Cons!433) l!522)) (= (_2!282 (h!999 l!522)) value!159)) (not ((_ is Nil!434) l!522))))))

(declare-fun b!14903 () Bool)

(declare-fun e!8971 () Bool)

(declare-fun head!798 (List!437) tuple2!564)

(assert (=> b!14903 (= e!8971 (bvslt (_1!282 (head!798 lt!3633)) (_1!282 (head!798 l!522))))))

(declare-fun b!14904 () Bool)

(assert (=> b!14904 (= e!8968 e!8971)))

(declare-fun res!11421 () Bool)

(assert (=> b!14904 (= res!11421 (not call!455))))

(assert (=> b!14904 (=> (not res!11421) (not e!8971))))

(declare-fun bm!452 () Bool)

(assert (=> bm!452 (= call!455 (isEmpty!109 lt!3633))))

(declare-fun b!14905 () Bool)

(assert (=> b!14905 (= e!8972 e!8967)))

(declare-fun res!11424 () Bool)

(assert (=> b!14905 (=> res!11424 e!8967)))

(assert (=> b!14905 (= res!11424 (not (isStrictlySorted!124 lt!3633)))))

(declare-fun err!31 () List!437)

(assert (=> b!14905 (= lt!3633 err!31)))

(assert (=> b!14905 true))

(assert (=> b!14905 e!8970))

(assert (= (and start!2228 res!11423) b!14902))

(assert (= (and b!14902 res!11425) b!14905))

(assert (= (and b!14905 ((_ is Cons!433) err!31)) b!14900))

(assert (= (and b!14905 (not res!11424)) b!14899))

(assert (= (and b!14899 (not res!11422)) b!14898))

(assert (= (and b!14898 c!1406) b!14897))

(assert (= (and b!14898 (not c!1406)) b!14904))

(assert (= (and b!14904 res!11421) b!14903))

(assert (= (or b!14897 b!14904) bm!452))

(assert (= (and start!2228 ((_ is Cons!433) l!522)) b!14901))

(declare-fun m!9919 () Bool)

(assert (=> bm!452 m!9919))

(declare-fun m!9921 () Bool)

(assert (=> b!14905 m!9921))

(declare-fun m!9923 () Bool)

(assert (=> b!14899 m!9923))

(declare-fun m!9925 () Bool)

(assert (=> b!14903 m!9925))

(declare-fun m!9927 () Bool)

(assert (=> b!14903 m!9927))

(declare-fun m!9929 () Bool)

(assert (=> start!2228 m!9929))

(declare-fun m!9931 () Bool)

(assert (=> b!14898 m!9931))

(check-sat (not b!14898) (not b!14905) (not b!14903) (not b!14900) (not b!14899) tp_is_empty!747 (not start!2228) (not bm!452) (not b!14901))
(check-sat)
