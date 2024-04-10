; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72084 () Bool)

(assert start!72084)

(declare-fun b!836676 () Bool)

(declare-fun e!466835 () Bool)

(declare-fun e!466836 () Bool)

(assert (=> b!836676 (= e!466835 e!466836)))

(declare-fun res!569173 () Bool)

(assert (=> b!836676 (=> res!569173 e!466836)))

(assert (=> b!836676 (= res!569173 false)))

(declare-fun b!836675 () Bool)

(declare-fun res!569172 () Bool)

(assert (=> b!836675 (=> (not res!569172) (not e!466835))))

(declare-datatypes ((B!1204 0))(
  ( (B!1205 (val!7684 Int)) )
))
(declare-datatypes ((tuple2!10228 0))(
  ( (tuple2!10229 (_1!5125 (_ BitVec 64)) (_2!5125 B!1204)) )
))
(declare-datatypes ((List!15993 0))(
  ( (Nil!15990) (Cons!15989 (h!17120 tuple2!10228) (t!22364 List!15993)) )
))
(declare-fun l!390 () List!15993)

(get-info :version)

(assert (=> b!836675 (= res!569172 (not ((_ is Cons!15989) l!390)))))

(declare-fun b!836677 () Bool)

(declare-datatypes ((List!15994 0))(
  ( (Nil!15991) (Cons!15990 (h!17121 (_ BitVec 64)) (t!22365 List!15994)) )
))
(declare-fun length!25 (List!15994) Int)

(declare-fun length!26 (List!15993) Int)

(assert (=> b!836677 (= e!466836 (not (= (length!25 Nil!15991) (length!26 l!390))))))

(declare-fun b!836678 () Bool)

(declare-fun e!466834 () Bool)

(declare-fun tp_is_empty!15273 () Bool)

(declare-fun tp!47483 () Bool)

(assert (=> b!836678 (= e!466834 (and tp_is_empty!15273 tp!47483))))

(declare-fun res!569174 () Bool)

(assert (=> start!72084 (=> (not res!569174) (not e!466835))))

(declare-fun isStrictlySorted!459 (List!15993) Bool)

(assert (=> start!72084 (= res!569174 (isStrictlySorted!459 l!390))))

(assert (=> start!72084 e!466835))

(assert (=> start!72084 e!466834))

(assert (= (and start!72084 res!569174) b!836675))

(assert (= (and b!836675 res!569172) b!836676))

(assert (= (and b!836676 (not res!569173)) b!836677))

(assert (= (and start!72084 ((_ is Cons!15989) l!390)) b!836678))

(declare-fun m!781855 () Bool)

(assert (=> b!836677 m!781855))

(declare-fun m!781857 () Bool)

(assert (=> b!836677 m!781857))

(declare-fun m!781859 () Bool)

(assert (=> start!72084 m!781859))

(check-sat (not b!836677) (not start!72084) (not b!836678) tp_is_empty!15273)
(check-sat)
(get-model)

(declare-fun d!107687 () Bool)

(declare-fun size!22904 (List!15994) Int)

(assert (=> d!107687 (= (length!25 Nil!15991) (size!22904 Nil!15991))))

(declare-fun bs!23503 () Bool)

(assert (= bs!23503 d!107687))

(declare-fun m!781873 () Bool)

(assert (=> bs!23503 m!781873))

(assert (=> b!836677 d!107687))

(declare-fun d!107691 () Bool)

(declare-fun size!22905 (List!15993) Int)

(assert (=> d!107691 (= (length!26 l!390) (size!22905 l!390))))

(declare-fun bs!23506 () Bool)

(assert (= bs!23506 d!107691))

(declare-fun m!781881 () Bool)

(assert (=> bs!23506 m!781881))

(assert (=> b!836677 d!107691))

(declare-fun d!107695 () Bool)

(declare-fun res!569200 () Bool)

(declare-fun e!466868 () Bool)

(assert (=> d!107695 (=> res!569200 e!466868)))

(assert (=> d!107695 (= res!569200 (or ((_ is Nil!15990) l!390) ((_ is Nil!15990) (t!22364 l!390))))))

(assert (=> d!107695 (= (isStrictlySorted!459 l!390) e!466868)))

(declare-fun b!836717 () Bool)

(declare-fun e!466869 () Bool)

(assert (=> b!836717 (= e!466868 e!466869)))

(declare-fun res!569201 () Bool)

(assert (=> b!836717 (=> (not res!569201) (not e!466869))))

(assert (=> b!836717 (= res!569201 (bvslt (_1!5125 (h!17120 l!390)) (_1!5125 (h!17120 (t!22364 l!390)))))))

(declare-fun b!836718 () Bool)

(assert (=> b!836718 (= e!466869 (isStrictlySorted!459 (t!22364 l!390)))))

(assert (= (and d!107695 (not res!569200)) b!836717))

(assert (= (and b!836717 res!569201) b!836718))

(declare-fun m!781883 () Bool)

(assert (=> b!836718 m!781883))

(assert (=> start!72084 d!107695))

(declare-fun b!836723 () Bool)

(declare-fun e!466872 () Bool)

(declare-fun tp!47495 () Bool)

(assert (=> b!836723 (= e!466872 (and tp_is_empty!15273 tp!47495))))

(assert (=> b!836678 (= tp!47483 e!466872)))

(assert (= (and b!836678 ((_ is Cons!15989) (t!22364 l!390))) b!836723))

(check-sat (not b!836723) (not b!836718) (not d!107687) (not d!107691) tp_is_empty!15273)
(check-sat)
(get-model)

