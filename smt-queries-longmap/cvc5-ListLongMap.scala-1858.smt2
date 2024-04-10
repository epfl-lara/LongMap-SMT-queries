; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33528 () Bool)

(assert start!33528)

(declare-fun b_free!6817 () Bool)

(declare-fun b_next!6817 () Bool)

(assert (=> start!33528 (= b_free!6817 (not b_next!6817))))

(declare-fun tp!23946 () Bool)

(declare-fun b_and!13991 () Bool)

(assert (=> start!33528 (= tp!23946 b_and!13991)))

(declare-fun b!332751 () Bool)

(declare-fun e!204329 () Bool)

(declare-fun tp_is_empty!6769 () Bool)

(assert (=> b!332751 (= e!204329 tp_is_empty!6769)))

(declare-fun b!332752 () Bool)

(declare-fun res!183330 () Bool)

(declare-fun e!204332 () Bool)

(assert (=> b!332752 (=> (not res!183330) (not e!204332))))

(declare-datatypes ((array!17133 0))(
  ( (array!17134 (arr!8100 (Array (_ BitVec 32) (_ BitVec 64))) (size!8452 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17133)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17133 (_ BitVec 32)) Bool)

(assert (=> b!332752 (= res!183330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11541 () Bool)

(declare-fun mapRes!11541 () Bool)

(declare-fun tp!23945 () Bool)

(assert (=> mapNonEmpty!11541 (= mapRes!11541 (and tp!23945 e!204329))))

(declare-datatypes ((V!10003 0))(
  ( (V!10004 (val!3429 Int)) )
))
(declare-datatypes ((ValueCell!3041 0))(
  ( (ValueCellFull!3041 (v!5588 V!10003)) (EmptyCell!3041) )
))
(declare-datatypes ((array!17135 0))(
  ( (array!17136 (arr!8101 (Array (_ BitVec 32) ValueCell!3041)) (size!8453 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17135)

(declare-fun mapRest!11541 () (Array (_ BitVec 32) ValueCell!3041))

(declare-fun mapValue!11541 () ValueCell!3041)

(declare-fun mapKey!11541 () (_ BitVec 32))

(assert (=> mapNonEmpty!11541 (= (arr!8101 _values!1525) (store mapRest!11541 mapKey!11541 mapValue!11541))))

(declare-fun b!332753 () Bool)

(declare-fun e!204333 () Bool)

(declare-fun e!204331 () Bool)

(assert (=> b!332753 (= e!204333 (and e!204331 mapRes!11541))))

(declare-fun condMapEmpty!11541 () Bool)

(declare-fun mapDefault!11541 () ValueCell!3041)

