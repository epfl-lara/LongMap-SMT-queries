; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1252 () Bool)

(assert start!1252)

(declare-fun res!8902 () Bool)

(declare-fun e!6056 () Bool)

(assert (=> start!1252 (=> (not res!8902) (not e!6056))))

(declare-datatypes ((B!330 0))(
  ( (B!331 (val!260 Int)) )
))
(declare-datatypes ((tuple2!316 0))(
  ( (tuple2!317 (_1!158 (_ BitVec 64)) (_2!158 B!330)) )
))
(declare-datatypes ((List!308 0))(
  ( (Nil!305) (Cons!304 (h!870 tuple2!316) (t!2455 List!308)) )
))
(declare-fun l!408 () List!308)

(assert (=> start!1252 (= res!8902 (is-Cons!304 l!408))))

(assert (=> start!1252 e!6056))

(declare-fun e!6055 () Bool)

(assert (=> start!1252 e!6055))

(declare-fun b!10453 () Bool)

(assert (=> b!10453 (= e!6056 false)))

(declare-fun lt!2586 () (_ BitVec 32))

(declare-fun intSize!6 (List!308) (_ BitVec 32))

(assert (=> b!10453 (= lt!2586 (intSize!6 (t!2455 l!408)))))

(declare-fun b!10454 () Bool)

(declare-fun tp_is_empty!503 () Bool)

(declare-fun tp!1523 () Bool)

(assert (=> b!10454 (= e!6055 (and tp_is_empty!503 tp!1523))))

(assert (= (and start!1252 res!8902) b!10453))

(assert (= (and start!1252 (is-Cons!304 l!408)) b!10454))

(declare-fun m!6741 () Bool)

(assert (=> b!10453 m!6741))

(push 1)

(assert (not b!10453))

(assert (not b!10454))

(assert tp_is_empty!503)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

