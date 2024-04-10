; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89208 () Bool)

(assert start!89208)

(declare-fun b!1022822 () Bool)

(declare-fun b_free!20249 () Bool)

(declare-fun b_next!20249 () Bool)

(assert (=> b!1022822 (= b_free!20249 (not b_next!20249))))

(declare-fun tp!71781 () Bool)

(declare-fun b_and!32471 () Bool)

(assert (=> b!1022822 (= tp!71781 b_and!32471)))

(declare-fun b!1022816 () Bool)

(declare-fun e!576275 () Bool)

(declare-fun tp_is_empty!23969 () Bool)

(assert (=> b!1022816 (= e!576275 tp_is_empty!23969)))

(declare-fun b!1022817 () Bool)

(declare-fun e!576279 () Bool)

(assert (=> b!1022817 (= e!576279 false)))

(declare-fun lt!450339 () Bool)

(declare-datatypes ((V!36831 0))(
  ( (V!36832 (val!12035 Int)) )
))
(declare-datatypes ((ValueCell!11281 0))(
  ( (ValueCellFull!11281 (v!14604 V!36831)) (EmptyCell!11281) )
))
(declare-datatypes ((array!63982 0))(
  ( (array!63983 (arr!30803 (Array (_ BitVec 32) (_ BitVec 64))) (size!31314 (_ BitVec 32))) )
))
(declare-datatypes ((array!63984 0))(
  ( (array!63985 (arr!30804 (Array (_ BitVec 32) ValueCell!11281)) (size!31315 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5156 0))(
  ( (LongMapFixedSize!5157 (defaultEntry!5930 Int) (mask!29535 (_ BitVec 32)) (extraKeys!5662 (_ BitVec 32)) (zeroValue!5766 V!36831) (minValue!5766 V!36831) (_size!2633 (_ BitVec 32)) (_keys!11075 array!63982) (_values!5953 array!63984) (_vacant!2633 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5156)

(declare-datatypes ((List!21695 0))(
  ( (Nil!21692) (Cons!21691 (h!22889 (_ BitVec 64)) (t!30733 List!21695)) )
))
(declare-fun arrayNoDuplicates!0 (array!63982 (_ BitVec 32) List!21695) Bool)

(assert (=> b!1022817 (= lt!450339 (arrayNoDuplicates!0 (_keys!11075 thiss!1427) #b00000000000000000000000000000000 Nil!21692))))

(declare-fun res!685087 () Bool)

(assert (=> start!89208 (=> (not res!685087) (not e!576279))))

(declare-fun valid!1965 (LongMapFixedSize!5156) Bool)

(assert (=> start!89208 (= res!685087 (valid!1965 thiss!1427))))

(assert (=> start!89208 e!576279))

(declare-fun e!576276 () Bool)

(assert (=> start!89208 e!576276))

(assert (=> start!89208 true))

(declare-fun b!1022818 () Bool)

(declare-fun res!685084 () Bool)

(assert (=> b!1022818 (=> (not res!685084) (not e!576279))))

(assert (=> b!1022818 (= res!685084 (and (= (size!31315 (_values!5953 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29535 thiss!1427))) (= (size!31314 (_keys!11075 thiss!1427)) (size!31315 (_values!5953 thiss!1427))) (bvsge (mask!29535 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5662 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5662 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5662 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5662 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5662 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5662 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5662 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022819 () Bool)

(declare-fun res!685088 () Bool)

(assert (=> b!1022819 (=> (not res!685088) (not e!576279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022819 (= res!685088 (validMask!0 (mask!29535 thiss!1427)))))

(declare-fun b!1022820 () Bool)

(declare-fun e!576278 () Bool)

(declare-fun e!576277 () Bool)

(declare-fun mapRes!37371 () Bool)

(assert (=> b!1022820 (= e!576278 (and e!576277 mapRes!37371))))

(declare-fun condMapEmpty!37371 () Bool)

(declare-fun mapDefault!37371 () ValueCell!11281)

