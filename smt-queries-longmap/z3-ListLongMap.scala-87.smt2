; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1248 () Bool)

(assert start!1248)

(declare-fun res!8896 () Bool)

(declare-fun e!6044 () Bool)

(assert (=> start!1248 (=> (not res!8896) (not e!6044))))

(declare-datatypes ((B!326 0))(
  ( (B!327 (val!258 Int)) )
))
(declare-datatypes ((tuple2!312 0))(
  ( (tuple2!313 (_1!156 (_ BitVec 64)) (_2!156 B!326)) )
))
(declare-datatypes ((List!306 0))(
  ( (Nil!303) (Cons!302 (h!868 tuple2!312) (t!2453 List!306)) )
))
(declare-fun l!408 () List!306)

(get-info :version)

(assert (=> start!1248 (= res!8896 ((_ is Cons!302) l!408))))

(assert (=> start!1248 e!6044))

(declare-fun e!6043 () Bool)

(assert (=> start!1248 e!6043))

(declare-fun b!10441 () Bool)

(assert (=> b!10441 (= e!6044 false)))

(declare-fun lt!2580 () (_ BitVec 32))

(declare-fun intSize!4 (List!306) (_ BitVec 32))

(assert (=> b!10441 (= lt!2580 (intSize!4 (t!2453 l!408)))))

(declare-fun b!10442 () Bool)

(declare-fun tp_is_empty!499 () Bool)

(declare-fun tp!1517 () Bool)

(assert (=> b!10442 (= e!6043 (and tp_is_empty!499 tp!1517))))

(assert (= (and start!1248 res!8896) b!10441))

(assert (= (and start!1248 ((_ is Cons!302) l!408)) b!10442))

(declare-fun m!6733 () Bool)

(assert (=> b!10441 m!6733))

(check-sat (not b!10441) (not b!10442) tp_is_empty!499)
(check-sat)
