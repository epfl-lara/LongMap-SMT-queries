; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33688 () Bool)

(assert start!33688)

(declare-fun b_free!6923 () Bool)

(declare-fun b_next!6923 () Bool)

(assert (=> start!33688 (= b_free!6923 (not b_next!6923))))

(declare-fun tp!24273 () Bool)

(declare-fun b_and!14103 () Bool)

(assert (=> start!33688 (= tp!24273 b_and!14103)))

(declare-fun b!334734 () Bool)

(declare-fun res!184589 () Bool)

(declare-fun e!205458 () Bool)

(assert (=> b!334734 (=> (not res!184589) (not e!205458))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10143 0))(
  ( (V!10144 (val!3482 Int)) )
))
(declare-datatypes ((ValueCell!3094 0))(
  ( (ValueCellFull!3094 (v!5644 V!10143)) (EmptyCell!3094) )
))
(declare-datatypes ((array!17343 0))(
  ( (array!17344 (arr!8202 (Array (_ BitVec 32) ValueCell!3094)) (size!8554 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17343)

(declare-datatypes ((array!17345 0))(
  ( (array!17346 (arr!8203 (Array (_ BitVec 32) (_ BitVec 64))) (size!8555 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17345)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334734 (= res!184589 (and (= (size!8554 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8555 _keys!1895) (size!8554 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334735 () Bool)

(declare-fun e!205459 () Bool)

(declare-fun tp_is_empty!6875 () Bool)

(assert (=> b!334735 (= e!205459 tp_is_empty!6875)))

(declare-fun mapIsEmpty!11709 () Bool)

(declare-fun mapRes!11709 () Bool)

(assert (=> mapIsEmpty!11709 mapRes!11709))

(declare-fun b!334736 () Bool)

(declare-fun e!205460 () Bool)

(declare-fun e!205457 () Bool)

(assert (=> b!334736 (= e!205460 (and e!205457 mapRes!11709))))

(declare-fun condMapEmpty!11709 () Bool)

(declare-fun mapDefault!11709 () ValueCell!3094)

