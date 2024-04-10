; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33690 () Bool)

(assert start!33690)

(declare-fun b_free!6925 () Bool)

(declare-fun b_next!6925 () Bool)

(assert (=> start!33690 (= b_free!6925 (not b_next!6925))))

(declare-fun tp!24279 () Bool)

(declare-fun b_and!14105 () Bool)

(assert (=> start!33690 (= tp!24279 b_and!14105)))

(declare-fun res!184616 () Bool)

(declare-fun e!205478 () Bool)

(assert (=> start!33690 (=> (not res!184616) (not e!205478))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33690 (= res!184616 (validMask!0 mask!2385))))

(assert (=> start!33690 e!205478))

(assert (=> start!33690 true))

(declare-fun tp_is_empty!6877 () Bool)

(assert (=> start!33690 tp_is_empty!6877))

(assert (=> start!33690 tp!24279))

(declare-datatypes ((V!10147 0))(
  ( (V!10148 (val!3483 Int)) )
))
(declare-datatypes ((ValueCell!3095 0))(
  ( (ValueCellFull!3095 (v!5645 V!10147)) (EmptyCell!3095) )
))
(declare-datatypes ((array!17347 0))(
  ( (array!17348 (arr!8204 (Array (_ BitVec 32) ValueCell!3095)) (size!8556 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17347)

(declare-fun e!205482 () Bool)

(declare-fun array_inv!6098 (array!17347) Bool)

(assert (=> start!33690 (and (array_inv!6098 _values!1525) e!205482)))

(declare-datatypes ((array!17349 0))(
  ( (array!17350 (arr!8205 (Array (_ BitVec 32) (_ BitVec 64))) (size!8557 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17349)

(declare-fun array_inv!6099 (array!17349) Bool)

(assert (=> start!33690 (array_inv!6099 _keys!1895)))

(declare-fun b!334767 () Bool)

(declare-fun e!205477 () Bool)

(declare-fun mapRes!11712 () Bool)

(assert (=> b!334767 (= e!205482 (and e!205477 mapRes!11712))))

(declare-fun condMapEmpty!11712 () Bool)

(declare-fun mapDefault!11712 () ValueCell!3095)

