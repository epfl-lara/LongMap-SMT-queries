; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72082 () Bool)

(assert start!72082)

(declare-fun b!836666 () Bool)

(declare-fun e!466826 () Bool)

(declare-fun tp_is_empty!15271 () Bool)

(declare-fun tp!47480 () Bool)

(assert (=> b!836666 (= e!466826 (and tp_is_empty!15271 tp!47480))))

(declare-fun b!836663 () Bool)

(declare-fun res!569165 () Bool)

(declare-fun e!466825 () Bool)

(assert (=> b!836663 (=> (not res!569165) (not e!466825))))

(declare-datatypes ((B!1202 0))(
  ( (B!1203 (val!7683 Int)) )
))
(declare-datatypes ((tuple2!10226 0))(
  ( (tuple2!10227 (_1!5124 (_ BitVec 64)) (_2!5124 B!1202)) )
))
(declare-datatypes ((List!15991 0))(
  ( (Nil!15988) (Cons!15987 (h!17118 tuple2!10226) (t!22362 List!15991)) )
))
(declare-fun l!390 () List!15991)

(assert (=> b!836663 (= res!569165 (not (is-Cons!15987 l!390)))))

(declare-fun res!569163 () Bool)

(assert (=> start!72082 (=> (not res!569163) (not e!466825))))

(declare-fun isStrictlySorted!458 (List!15991) Bool)

(assert (=> start!72082 (= res!569163 (isStrictlySorted!458 l!390))))

(assert (=> start!72082 e!466825))

(assert (=> start!72082 e!466826))

(declare-fun b!836665 () Bool)

(declare-fun e!466827 () Bool)

(declare-datatypes ((List!15992 0))(
  ( (Nil!15989) (Cons!15988 (h!17119 (_ BitVec 64)) (t!22363 List!15992)) )
))
(declare-fun length!23 (List!15992) Int)

(declare-fun length!24 (List!15991) Int)

(assert (=> b!836665 (= e!466827 (not (= (length!23 Nil!15989) (length!24 l!390))))))

(declare-fun b!836664 () Bool)

(assert (=> b!836664 (= e!466825 e!466827)))

(declare-fun res!569164 () Bool)

(assert (=> b!836664 (=> res!569164 e!466827)))

(assert (=> b!836664 (= res!569164 false)))

(assert (= (and start!72082 res!569163) b!836663))

(assert (= (and b!836663 res!569165) b!836664))

(assert (= (and b!836664 (not res!569164)) b!836665))

(assert (= (and start!72082 (is-Cons!15987 l!390)) b!836666))

(declare-fun m!781849 () Bool)

(assert (=> start!72082 m!781849))

(declare-fun m!781851 () Bool)

(assert (=> b!836665 m!781851))

(declare-fun m!781853 () Bool)

(assert (=> b!836665 m!781853))

(push 1)

(assert (not start!72082))

(assert (not b!836665))

(assert (not b!836666))

(assert tp_is_empty!15271)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107681 () Bool)

(declare-fun res!569188 () Bool)

(declare-fun e!466850 () Bool)

(assert (=> d!107681 (=> res!569188 e!466850)))

(assert (=> d!107681 (= res!569188 (or (is-Nil!15988 l!390) (is-Nil!15988 (t!22362 l!390))))))

(assert (=> d!107681 (= (isStrictlySorted!458 l!390) e!466850)))

(declare-fun b!836695 () Bool)

(declare-fun e!466851 () Bool)

(assert (=> b!836695 (= e!466850 e!466851)))

(declare-fun res!569189 () Bool)

(assert (=> b!836695 (=> (not res!569189) (not e!466851))))

(assert (=> b!836695 (= res!569189 (bvslt (_1!5124 (h!17118 l!390)) (_1!5124 (h!17118 (t!22362 l!390)))))))

(declare-fun b!836696 () Bool)

(assert (=> b!836696 (= e!466851 (isStrictlySorted!458 (t!22362 l!390)))))

(assert (= (and d!107681 (not res!569188)) b!836695))

(assert (= (and b!836695 res!569189) b!836696))

(declare-fun m!781871 () Bool)

(assert (=> b!836696 m!781871))

(assert (=> start!72082 d!107681))

(declare-fun d!107689 () Bool)

(declare-fun size!22902 (List!15992) Int)

(assert (=> d!107689 (= (length!23 Nil!15989) (size!22902 Nil!15989))))

(declare-fun bs!23504 () Bool)

(assert (= bs!23504 d!107689))

(declare-fun m!781875 () Bool)

(assert (=> bs!23504 m!781875))

(assert (=> b!836665 d!107689))

(declare-fun d!107693 () Bool)

(declare-fun size!22903 (List!15991) Int)

(assert (=> d!107693 (= (length!24 l!390) (size!22903 l!390))))

(declare-fun bs!23505 () Bool)

(assert (= bs!23505 d!107693))

(declare-fun m!781879 () Bool)

(assert (=> bs!23505 m!781879))

(assert (=> b!836665 d!107693))

(declare-fun b!836712 () Bool)

(declare-fun e!466863 () Bool)

(declare-fun tp!47492 () Bool)

(assert (=> b!836712 (= e!466863 (and tp_is_empty!15271 tp!47492))))

(assert (=> b!836666 (= tp!47480 e!466863)))

(assert (= (and b!836666 (is-Cons!15987 (t!22362 l!390))) b!836712))

(push 1)

(assert (not d!107693))

(assert (not b!836696))

(assert tp_is_empty!15271)

(assert (not b!836712))

(assert (not d!107689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107697 () Bool)

(declare-fun res!569202 () Bool)

(declare-fun e!466873 () Bool)

(assert (=> d!107697 (=> res!569202 e!466873)))

(assert (=> d!107697 (= res!569202 (or (is-Nil!15988 (t!22362 l!390)) (is-Nil!15988 (t!22362 (t!22362 l!390)))))))

(assert (=> d!107697 (= (isStrictlySorted!458 (t!22362 l!390)) e!466873)))

(declare-fun b!836724 () Bool)

(declare-fun e!466874 () Bool)

(assert (=> b!836724 (= e!466873 e!466874)))

(declare-fun res!569203 () Bool)

(assert (=> b!836724 (=> (not res!569203) (not e!466874))))

(assert (=> b!836724 (= res!569203 (bvslt (_1!5124 (h!17118 (t!22362 l!390))) (_1!5124 (h!17118 (t!22362 (t!22362 l!390))))))))

(declare-fun b!836725 () Bool)

(assert (=> b!836725 (= e!466874 (isStrictlySorted!458 (t!22362 (t!22362 l!390))))))

(assert (= (and d!107697 (not res!569202)) b!836724))

(assert (= (and b!836724 res!569203) b!836725))

(declare-fun m!781885 () Bool)

(assert (=> b!836725 m!781885))

(assert (=> b!836696 d!107697))

(declare-fun d!107699 () Bool)

(declare-fun lt!380452 () Int)

(assert (=> d!107699 (>= lt!380452 0)))

(declare-fun e!466877 () Int)

(assert (=> d!107699 (= lt!380452 e!466877)))

(declare-fun c!91085 () Bool)

(assert (=> d!107699 (= c!91085 (is-Nil!15988 l!390))))

(assert (=> d!107699 (= (size!22903 l!390) lt!380452)))

(declare-fun b!836730 () Bool)

(assert (=> b!836730 (= e!466877 0)))

(declare-fun b!836731 () Bool)

(assert (=> b!836731 (= e!466877 (+ 1 (size!22903 (t!22362 l!390))))))

(assert (= (and d!107699 c!91085) b!836730))

(assert (= (and d!107699 (not c!91085)) b!836731))

(declare-fun m!781887 () Bool)

(assert (=> b!836731 m!781887))

(assert (=> d!107693 d!107699))

(declare-fun d!107701 () Bool)

(declare-fun lt!380457 () Int)

(assert (=> d!107701 (>= lt!380457 0)))

(declare-fun e!466882 () Int)

(assert (=> d!107701 (= lt!380457 e!466882)))

(declare-fun c!91090 () Bool)

(assert (=> d!107701 (= c!91090 (is-Nil!15989 Nil!15989))))

(assert (=> d!107701 (= (size!22902 Nil!15989) lt!380457)))

(declare-fun b!836740 () Bool)

(assert (=> b!836740 (= e!466882 0)))

(declare-fun b!836741 () Bool)

(assert (=> b!836741 (= e!466882 (+ 1 (size!22902 (t!22363 Nil!15989))))))

(assert (= (and d!107701 c!91090) b!836740))

(assert (= (and d!107701 (not c!91090)) b!836741))

(declare-fun m!781889 () Bool)

(assert (=> b!836741 m!781889))

(assert (=> d!107689 d!107701))

(declare-fun b!836742 () Bool)

(declare-fun e!466883 () Bool)

(declare-fun tp!47496 () Bool)

(assert (=> b!836742 (= e!466883 (and tp_is_empty!15271 tp!47496))))

(assert (=> b!836712 (= tp!47492 e!466883)))

(assert (= (and b!836712 (is-Cons!15987 (t!22362 (t!22362 l!390)))) b!836742))

(push 1)

(assert (not b!836741))

(assert (not b!836731))

(assert (not b!836742))

(assert (not b!836725))

(assert tp_is_empty!15271)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

