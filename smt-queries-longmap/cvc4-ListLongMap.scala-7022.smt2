; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89148 () Bool)

(assert start!89148)

(declare-fun b!1022091 () Bool)

(declare-fun b_free!20189 () Bool)

(declare-fun b_next!20189 () Bool)

(assert (=> b!1022091 (= b_free!20189 (not b_next!20189))))

(declare-fun tp!71601 () Bool)

(declare-fun b_and!32387 () Bool)

(assert (=> b!1022091 (= tp!71601 b_and!32387)))

(declare-fun b!1022090 () Bool)

(declare-fun e!575737 () Bool)

(declare-fun tp_is_empty!23909 () Bool)

(assert (=> b!1022090 (= e!575737 tp_is_empty!23909)))

(declare-fun e!575736 () Bool)

(declare-datatypes ((V!36751 0))(
  ( (V!36752 (val!12005 Int)) )
))
(declare-datatypes ((ValueCell!11251 0))(
  ( (ValueCellFull!11251 (v!14574 V!36751)) (EmptyCell!11251) )
))
(declare-datatypes ((array!63862 0))(
  ( (array!63863 (arr!30743 (Array (_ BitVec 32) (_ BitVec 64))) (size!31254 (_ BitVec 32))) )
))
(declare-datatypes ((array!63864 0))(
  ( (array!63865 (arr!30744 (Array (_ BitVec 32) ValueCell!11251)) (size!31255 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5096 0))(
  ( (LongMapFixedSize!5097 (defaultEntry!5900 Int) (mask!29485 (_ BitVec 32)) (extraKeys!5632 (_ BitVec 32)) (zeroValue!5736 V!36751) (minValue!5736 V!36751) (_size!2603 (_ BitVec 32)) (_keys!11045 array!63862) (_values!5923 array!63864) (_vacant!2603 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5096)

(declare-fun e!575735 () Bool)

(declare-fun array_inv!23837 (array!63862) Bool)

(declare-fun array_inv!23838 (array!63864) Bool)

(assert (=> b!1022091 (= e!575736 (and tp!71601 tp_is_empty!23909 (array_inv!23837 (_keys!11045 thiss!1427)) (array_inv!23838 (_values!5923 thiss!1427)) e!575735))))

(declare-fun b!1022092 () Bool)

(declare-fun res!684743 () Bool)

(declare-fun e!575738 () Bool)

(assert (=> b!1022092 (=> (not res!684743) (not e!575738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63862 (_ BitVec 32)) Bool)

(assert (=> b!1022092 (= res!684743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11045 thiss!1427) (mask!29485 thiss!1427)))))

(declare-fun b!1022093 () Bool)

(declare-fun e!575739 () Bool)

(assert (=> b!1022093 (= e!575739 tp_is_empty!23909)))

(declare-fun b!1022094 () Bool)

(declare-fun res!684746 () Bool)

(assert (=> b!1022094 (=> (not res!684746) (not e!575738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022094 (= res!684746 (validMask!0 (mask!29485 thiss!1427)))))

(declare-fun mapNonEmpty!37281 () Bool)

(declare-fun mapRes!37281 () Bool)

(declare-fun tp!71602 () Bool)

(assert (=> mapNonEmpty!37281 (= mapRes!37281 (and tp!71602 e!575739))))

(declare-fun mapKey!37281 () (_ BitVec 32))

(declare-fun mapRest!37281 () (Array (_ BitVec 32) ValueCell!11251))

(declare-fun mapValue!37281 () ValueCell!11251)

(assert (=> mapNonEmpty!37281 (= (arr!30744 (_values!5923 thiss!1427)) (store mapRest!37281 mapKey!37281 mapValue!37281))))

(declare-fun b!1022095 () Bool)

(declare-fun res!684745 () Bool)

(assert (=> b!1022095 (=> (not res!684745) (not e!575738))))

(assert (=> b!1022095 (= res!684745 (and (= (size!31255 (_values!5923 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29485 thiss!1427))) (= (size!31254 (_keys!11045 thiss!1427)) (size!31255 (_values!5923 thiss!1427))) (bvsge (mask!29485 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5632 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5632 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5632 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5632 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5632 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5632 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5632 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022096 () Bool)

(assert (=> b!1022096 (= e!575735 (and e!575737 mapRes!37281))))

(declare-fun condMapEmpty!37281 () Bool)

(declare-fun mapDefault!37281 () ValueCell!11251)

