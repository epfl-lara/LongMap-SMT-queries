; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7620 () Bool)

(assert start!7620)

(assert (=> start!7620 false))

(declare-fun e!31201 () Bool)

(assert (=> start!7620 e!31201))

(assert (=> start!7620 true))

(declare-fun b!48602 () Bool)

(declare-fun tp_is_empty!2115 () Bool)

(declare-fun tp!6431 () Bool)

(assert (=> b!48602 (= e!31201 (and tp_is_empty!2115 tp!6431))))

(declare-datatypes ((B!964 0))(
  ( (B!965 (val!1102 Int)) )
))
(declare-datatypes ((tuple2!1786 0))(
  ( (tuple2!1787 (_1!904 (_ BitVec 64)) (_2!904 B!964)) )
))
(declare-datatypes ((List!1299 0))(
  ( (Nil!1296) (Cons!1295 (h!1875 tuple2!1786) (t!4327 List!1299)) )
))
(declare-fun l!1333 () List!1299)

(get-info :version)

(assert (= (and start!7620 ((_ is Cons!1295) l!1333)) b!48602))

(check-sat (not b!48602) tp_is_empty!2115)
(check-sat)
