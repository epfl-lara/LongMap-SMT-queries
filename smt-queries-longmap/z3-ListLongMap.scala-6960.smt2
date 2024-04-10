; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87896 () Bool)

(assert start!87896)

(declare-fun res!681150 () Bool)

(declare-fun e!571260 () Bool)

(assert (=> start!87896 (=> (not res!681150) (not e!571260))))

(declare-datatypes ((B!1468 0))(
  ( (B!1469 (val!11818 Int)) )
))
(declare-datatypes ((tuple2!15182 0))(
  ( (tuple2!15183 (_1!7602 (_ BitVec 64)) (_2!7602 B!1468)) )
))
(declare-datatypes ((List!21467 0))(
  ( (Nil!21464) (Cons!21463 (h!22661 tuple2!15182) (t!30468 List!21467)) )
))
(declare-fun l!412 () List!21467)

(declare-fun isStrictlySorted!592 (List!21467) Bool)

(assert (=> start!87896 (= res!681150 (isStrictlySorted!592 l!412))))

(assert (=> start!87896 e!571260))

(declare-fun e!571261 () Bool)

(assert (=> start!87896 e!571261))

(declare-fun tp_is_empty!23535 () Bool)

(assert (=> start!87896 tp_is_empty!23535))

(declare-fun b!1015465 () Bool)

(declare-fun value!115 () B!1468)

(get-info :version)

(assert (=> b!1015465 (= e!571260 (and (or (not ((_ is Cons!21463) l!412)) (not (= (_2!7602 (h!22661 l!412)) value!115))) (or (not ((_ is Cons!21463) l!412)) (= (_2!7602 (h!22661 l!412)) value!115)) (not ((_ is Nil!21464) l!412))))))

(declare-fun b!1015466 () Bool)

(declare-fun tp!70631 () Bool)

(assert (=> b!1015466 (= e!571261 (and tp_is_empty!23535 tp!70631))))

(assert (= (and start!87896 res!681150) b!1015465))

(assert (= (and start!87896 ((_ is Cons!21463) l!412)) b!1015466))

(declare-fun m!937543 () Bool)

(assert (=> start!87896 m!937543))

(check-sat (not start!87896) (not b!1015466) tp_is_empty!23535)
(check-sat)
