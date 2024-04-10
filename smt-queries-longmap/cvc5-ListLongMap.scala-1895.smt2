; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33860 () Bool)

(assert start!33860)

(declare-fun b_free!7039 () Bool)

(declare-fun b_next!7039 () Bool)

(assert (=> start!33860 (= b_free!7039 (not b_next!7039))))

(declare-fun tp!24629 () Bool)

(declare-fun b_and!14225 () Bool)

(assert (=> start!33860 (= tp!24629 b_and!14225)))

(declare-fun mapIsEmpty!11892 () Bool)

(declare-fun mapRes!11892 () Bool)

(assert (=> mapIsEmpty!11892 mapRes!11892))

(declare-fun b!336963 () Bool)

(declare-fun e!206805 () Bool)

(declare-fun tp_is_empty!6991 () Bool)

(assert (=> b!336963 (= e!206805 tp_is_empty!6991)))

(declare-fun mapNonEmpty!11892 () Bool)

(declare-fun tp!24630 () Bool)

(declare-fun e!206808 () Bool)

(assert (=> mapNonEmpty!11892 (= mapRes!11892 (and tp!24630 e!206808))))

(declare-fun mapKey!11892 () (_ BitVec 32))

(declare-datatypes ((V!10299 0))(
  ( (V!10300 (val!3540 Int)) )
))
(declare-datatypes ((ValueCell!3152 0))(
  ( (ValueCellFull!3152 (v!5705 V!10299)) (EmptyCell!3152) )
))
(declare-fun mapValue!11892 () ValueCell!3152)

(declare-datatypes ((array!17577 0))(
  ( (array!17578 (arr!8316 (Array (_ BitVec 32) ValueCell!3152)) (size!8668 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17577)

(declare-fun mapRest!11892 () (Array (_ BitVec 32) ValueCell!3152))

(assert (=> mapNonEmpty!11892 (= (arr!8316 _values!1525) (store mapRest!11892 mapKey!11892 mapValue!11892))))

(declare-fun res!186050 () Bool)

(declare-fun e!206807 () Bool)

(assert (=> start!33860 (=> (not res!186050) (not e!206807))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33860 (= res!186050 (validMask!0 mask!2385))))

(assert (=> start!33860 e!206807))

(assert (=> start!33860 true))

(assert (=> start!33860 tp_is_empty!6991))

(assert (=> start!33860 tp!24629))

(declare-fun e!206803 () Bool)

(declare-fun array_inv!6174 (array!17577) Bool)

(assert (=> start!33860 (and (array_inv!6174 _values!1525) e!206803)))

(declare-datatypes ((array!17579 0))(
  ( (array!17580 (arr!8317 (Array (_ BitVec 32) (_ BitVec 64))) (size!8669 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17579)

(declare-fun array_inv!6175 (array!17579) Bool)

(assert (=> start!33860 (array_inv!6175 _keys!1895)))

(declare-fun b!336964 () Bool)

(declare-fun res!186051 () Bool)

(assert (=> b!336964 (=> (not res!186051) (not e!206807))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336964 (= res!186051 (validKeyInArray!0 k!1348))))

(declare-fun b!336965 () Bool)

(assert (=> b!336965 (= e!206803 (and e!206805 mapRes!11892))))

(declare-fun condMapEmpty!11892 () Bool)

(declare-fun mapDefault!11892 () ValueCell!3152)

