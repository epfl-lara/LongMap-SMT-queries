; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89106 () Bool)

(assert start!89106)

(declare-fun b!1021523 () Bool)

(declare-fun b_free!20147 () Bool)

(declare-fun b_next!20147 () Bool)

(assert (=> b!1021523 (= b_free!20147 (not b_next!20147))))

(declare-fun tp!71475 () Bool)

(declare-fun b_and!32345 () Bool)

(assert (=> b!1021523 (= tp!71475 b_and!32345)))

(declare-fun mapIsEmpty!37218 () Bool)

(declare-fun mapRes!37218 () Bool)

(assert (=> mapIsEmpty!37218 mapRes!37218))

(declare-fun mapNonEmpty!37218 () Bool)

(declare-fun tp!71476 () Bool)

(declare-fun e!575360 () Bool)

(assert (=> mapNonEmpty!37218 (= mapRes!37218 (and tp!71476 e!575360))))

(declare-datatypes ((V!36695 0))(
  ( (V!36696 (val!11984 Int)) )
))
(declare-datatypes ((ValueCell!11230 0))(
  ( (ValueCellFull!11230 (v!14553 V!36695)) (EmptyCell!11230) )
))
(declare-fun mapRest!37218 () (Array (_ BitVec 32) ValueCell!11230))

(declare-datatypes ((array!63778 0))(
  ( (array!63779 (arr!30701 (Array (_ BitVec 32) (_ BitVec 64))) (size!31212 (_ BitVec 32))) )
))
(declare-datatypes ((array!63780 0))(
  ( (array!63781 (arr!30702 (Array (_ BitVec 32) ValueCell!11230)) (size!31213 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5054 0))(
  ( (LongMapFixedSize!5055 (defaultEntry!5879 Int) (mask!29450 (_ BitVec 32)) (extraKeys!5611 (_ BitVec 32)) (zeroValue!5715 V!36695) (minValue!5715 V!36695) (_size!2582 (_ BitVec 32)) (_keys!11024 array!63778) (_values!5902 array!63780) (_vacant!2582 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5054)

(declare-fun mapValue!37218 () ValueCell!11230)

(declare-fun mapKey!37218 () (_ BitVec 32))

(assert (=> mapNonEmpty!37218 (= (arr!30702 (_values!5902 thiss!1427)) (store mapRest!37218 mapKey!37218 mapValue!37218))))

(declare-fun e!575359 () Bool)

(declare-fun e!575357 () Bool)

(declare-fun tp_is_empty!23867 () Bool)

(declare-fun array_inv!23809 (array!63778) Bool)

(declare-fun array_inv!23810 (array!63780) Bool)

(assert (=> b!1021523 (= e!575359 (and tp!71475 tp_is_empty!23867 (array_inv!23809 (_keys!11024 thiss!1427)) (array_inv!23810 (_values!5902 thiss!1427)) e!575357))))

(declare-fun b!1021524 () Bool)

(assert (=> b!1021524 (= e!575360 tp_is_empty!23867)))

(declare-fun b!1021525 () Bool)

(declare-fun e!575358 () Bool)

(assert (=> b!1021525 (= e!575357 (and e!575358 mapRes!37218))))

(declare-fun condMapEmpty!37218 () Bool)

(declare-fun mapDefault!37218 () ValueCell!11230)

