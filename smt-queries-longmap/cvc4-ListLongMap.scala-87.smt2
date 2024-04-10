; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1252 () Bool)

(assert start!1252)

(declare-fun res!8902 () Bool)

(declare-fun e!6055 () Bool)

(assert (=> start!1252 (=> (not res!8902) (not e!6055))))

(declare-datatypes ((B!330 0))(
  ( (B!331 (val!260 Int)) )
))
(declare-datatypes ((tuple2!320 0))(
  ( (tuple2!321 (_1!160 (_ BitVec 64)) (_2!160 B!330)) )
))
(declare-datatypes ((List!312 0))(
  ( (Nil!309) (Cons!308 (h!874 tuple2!320) (t!2459 List!312)) )
))
(declare-fun l!408 () List!312)

(assert (=> start!1252 (= res!8902 (is-Cons!308 l!408))))

(assert (=> start!1252 e!6055))

(declare-fun e!6056 () Bool)

(assert (=> start!1252 e!6056))

(declare-fun b!10453 () Bool)

(assert (=> b!10453 (= e!6055 false)))

(declare-fun lt!2586 () (_ BitVec 32))

(declare-fun intSize!6 (List!312) (_ BitVec 32))

(assert (=> b!10453 (= lt!2586 (intSize!6 (t!2459 l!408)))))

(declare-fun b!10454 () Bool)

(declare-fun tp_is_empty!503 () Bool)

(declare-fun tp!1523 () Bool)

(assert (=> b!10454 (= e!6056 (and tp_is_empty!503 tp!1523))))

(assert (= (and start!1252 res!8902) b!10453))

(assert (= (and start!1252 (is-Cons!308 l!408)) b!10454))

(declare-fun m!6741 () Bool)

(assert (=> b!10453 m!6741))

(push 1)

(assert (not b!10453))

(assert (not b!10454))

(assert tp_is_empty!503)

(check-sat)

(pop 1)

