; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89144 () Bool)

(assert start!89144)

(declare-fun b!1022036 () Bool)

(declare-fun b_free!20185 () Bool)

(declare-fun b_next!20185 () Bool)

(assert (=> b!1022036 (= b_free!20185 (not b_next!20185))))

(declare-fun tp!71590 () Bool)

(declare-fun b_and!32383 () Bool)

(assert (=> b!1022036 (= tp!71590 b_and!32383)))

(declare-fun mapNonEmpty!37275 () Bool)

(declare-fun mapRes!37275 () Bool)

(declare-fun tp!71589 () Bool)

(declare-fun e!575698 () Bool)

(assert (=> mapNonEmpty!37275 (= mapRes!37275 (and tp!71589 e!575698))))

(declare-fun mapKey!37275 () (_ BitVec 32))

(declare-datatypes ((V!36747 0))(
  ( (V!36748 (val!12003 Int)) )
))
(declare-datatypes ((ValueCell!11249 0))(
  ( (ValueCellFull!11249 (v!14572 V!36747)) (EmptyCell!11249) )
))
(declare-fun mapRest!37275 () (Array (_ BitVec 32) ValueCell!11249))

(declare-fun mapValue!37275 () ValueCell!11249)

(declare-datatypes ((array!63854 0))(
  ( (array!63855 (arr!30739 (Array (_ BitVec 32) (_ BitVec 64))) (size!31250 (_ BitVec 32))) )
))
(declare-datatypes ((array!63856 0))(
  ( (array!63857 (arr!30740 (Array (_ BitVec 32) ValueCell!11249)) (size!31251 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5092 0))(
  ( (LongMapFixedSize!5093 (defaultEntry!5898 Int) (mask!29483 (_ BitVec 32)) (extraKeys!5630 (_ BitVec 32)) (zeroValue!5734 V!36747) (minValue!5734 V!36747) (_size!2601 (_ BitVec 32)) (_keys!11043 array!63854) (_values!5921 array!63856) (_vacant!2601 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5092)

(assert (=> mapNonEmpty!37275 (= (arr!30740 (_values!5921 thiss!1427)) (store mapRest!37275 mapKey!37275 mapValue!37275))))

(declare-fun e!575702 () Bool)

(declare-fun tp_is_empty!23905 () Bool)

(declare-fun e!575699 () Bool)

(declare-fun array_inv!23833 (array!63854) Bool)

(declare-fun array_inv!23834 (array!63856) Bool)

(assert (=> b!1022036 (= e!575699 (and tp!71590 tp_is_empty!23905 (array_inv!23833 (_keys!11043 thiss!1427)) (array_inv!23834 (_values!5921 thiss!1427)) e!575702))))

(declare-fun b!1022037 () Bool)

(declare-fun e!575700 () Bool)

(assert (=> b!1022037 (= e!575702 (and e!575700 mapRes!37275))))

(declare-fun condMapEmpty!37275 () Bool)

(declare-fun mapDefault!37275 () ValueCell!11249)

