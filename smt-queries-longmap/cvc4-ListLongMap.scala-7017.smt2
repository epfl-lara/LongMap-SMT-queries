; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89118 () Bool)

(assert start!89118)

(declare-fun b!1021687 () Bool)

(declare-fun b_free!20159 () Bool)

(declare-fun b_next!20159 () Bool)

(assert (=> b!1021687 (= b_free!20159 (not b_next!20159))))

(declare-fun tp!71511 () Bool)

(declare-fun b_and!32357 () Bool)

(assert (=> b!1021687 (= tp!71511 b_and!32357)))

(declare-fun b!1021685 () Bool)

(declare-fun res!684520 () Bool)

(declare-fun e!575466 () Bool)

(assert (=> b!1021685 (=> (not res!684520) (not e!575466))))

(declare-datatypes ((V!36711 0))(
  ( (V!36712 (val!11990 Int)) )
))
(declare-datatypes ((ValueCell!11236 0))(
  ( (ValueCellFull!11236 (v!14559 V!36711)) (EmptyCell!11236) )
))
(declare-datatypes ((array!63802 0))(
  ( (array!63803 (arr!30713 (Array (_ BitVec 32) (_ BitVec 64))) (size!31224 (_ BitVec 32))) )
))
(declare-datatypes ((array!63804 0))(
  ( (array!63805 (arr!30714 (Array (_ BitVec 32) ValueCell!11236)) (size!31225 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5066 0))(
  ( (LongMapFixedSize!5067 (defaultEntry!5885 Int) (mask!29460 (_ BitVec 32)) (extraKeys!5617 (_ BitVec 32)) (zeroValue!5721 V!36711) (minValue!5721 V!36711) (_size!2588 (_ BitVec 32)) (_keys!11030 array!63802) (_values!5908 array!63804) (_vacant!2588 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5066)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63802 (_ BitVec 32)) Bool)

(assert (=> b!1021685 (= res!684520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11030 thiss!1427) (mask!29460 thiss!1427)))))

(declare-fun b!1021686 () Bool)

(declare-fun e!575465 () Bool)

(declare-fun tp_is_empty!23879 () Bool)

(assert (=> b!1021686 (= e!575465 tp_is_empty!23879)))

(declare-fun mapNonEmpty!37236 () Bool)

(declare-fun mapRes!37236 () Bool)

(declare-fun tp!71512 () Bool)

(assert (=> mapNonEmpty!37236 (= mapRes!37236 (and tp!71512 e!575465))))

(declare-fun mapKey!37236 () (_ BitVec 32))

(declare-fun mapValue!37236 () ValueCell!11236)

(declare-fun mapRest!37236 () (Array (_ BitVec 32) ValueCell!11236))

(assert (=> mapNonEmpty!37236 (= (arr!30714 (_values!5908 thiss!1427)) (store mapRest!37236 mapKey!37236 mapValue!37236))))

(declare-fun e!575467 () Bool)

(declare-fun e!575468 () Bool)

(declare-fun array_inv!23815 (array!63802) Bool)

(declare-fun array_inv!23816 (array!63804) Bool)

(assert (=> b!1021687 (= e!575468 (and tp!71511 tp_is_empty!23879 (array_inv!23815 (_keys!11030 thiss!1427)) (array_inv!23816 (_values!5908 thiss!1427)) e!575467))))

(declare-fun b!1021688 () Bool)

(declare-fun e!575469 () Bool)

(assert (=> b!1021688 (= e!575467 (and e!575469 mapRes!37236))))

(declare-fun condMapEmpty!37236 () Bool)

(declare-fun mapDefault!37236 () ValueCell!11236)

