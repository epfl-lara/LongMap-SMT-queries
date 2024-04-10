; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1250 () Bool)

(assert start!1250)

(declare-fun res!8899 () Bool)

(declare-fun e!6050 () Bool)

(assert (=> start!1250 (=> (not res!8899) (not e!6050))))

(declare-datatypes ((B!328 0))(
  ( (B!329 (val!259 Int)) )
))
(declare-datatypes ((tuple2!318 0))(
  ( (tuple2!319 (_1!159 (_ BitVec 64)) (_2!159 B!328)) )
))
(declare-datatypes ((List!311 0))(
  ( (Nil!308) (Cons!307 (h!873 tuple2!318) (t!2458 List!311)) )
))
(declare-fun l!408 () List!311)

(get-info :version)

(assert (=> start!1250 (= res!8899 ((_ is Cons!307) l!408))))

(assert (=> start!1250 e!6050))

(declare-fun e!6049 () Bool)

(assert (=> start!1250 e!6049))

(declare-fun b!10447 () Bool)

(assert (=> b!10447 (= e!6050 false)))

(declare-fun lt!2583 () (_ BitVec 32))

(declare-fun intSize!5 (List!311) (_ BitVec 32))

(assert (=> b!10447 (= lt!2583 (intSize!5 (t!2458 l!408)))))

(declare-fun b!10448 () Bool)

(declare-fun tp_is_empty!501 () Bool)

(declare-fun tp!1520 () Bool)

(assert (=> b!10448 (= e!6049 (and tp_is_empty!501 tp!1520))))

(assert (= (and start!1250 res!8899) b!10447))

(assert (= (and start!1250 ((_ is Cons!307) l!408)) b!10448))

(declare-fun m!6739 () Bool)

(assert (=> b!10447 m!6739))

(check-sat (not b!10447) (not b!10448) tp_is_empty!501)
(check-sat)
