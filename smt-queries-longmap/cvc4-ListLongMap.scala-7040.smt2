; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89256 () Bool)

(assert start!89256)

(declare-fun b!1023464 () Bool)

(declare-fun b_free!20297 () Bool)

(declare-fun b_next!20297 () Bool)

(assert (=> b!1023464 (= b_free!20297 (not b_next!20297))))

(declare-fun tp!71925 () Bool)

(declare-fun b_and!32519 () Bool)

(assert (=> b!1023464 (= tp!71925 b_and!32519)))

(declare-fun e!576707 () Bool)

(declare-datatypes ((V!36895 0))(
  ( (V!36896 (val!12059 Int)) )
))
(declare-datatypes ((ValueCell!11305 0))(
  ( (ValueCellFull!11305 (v!14628 V!36895)) (EmptyCell!11305) )
))
(declare-datatypes ((array!64078 0))(
  ( (array!64079 (arr!30851 (Array (_ BitVec 32) (_ BitVec 64))) (size!31362 (_ BitVec 32))) )
))
(declare-datatypes ((array!64080 0))(
  ( (array!64081 (arr!30852 (Array (_ BitVec 32) ValueCell!11305)) (size!31363 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5204 0))(
  ( (LongMapFixedSize!5205 (defaultEntry!5954 Int) (mask!29575 (_ BitVec 32)) (extraKeys!5686 (_ BitVec 32)) (zeroValue!5790 V!36895) (minValue!5790 V!36895) (_size!2657 (_ BitVec 32)) (_keys!11099 array!64078) (_values!5977 array!64080) (_vacant!2657 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5204)

(declare-fun tp_is_empty!24017 () Bool)

(declare-fun e!576709 () Bool)

(declare-fun array_inv!23905 (array!64078) Bool)

(declare-fun array_inv!23906 (array!64080) Bool)

(assert (=> b!1023464 (= e!576709 (and tp!71925 tp_is_empty!24017 (array_inv!23905 (_keys!11099 thiss!1427)) (array_inv!23906 (_values!5977 thiss!1427)) e!576707))))

(declare-fun b!1023465 () Bool)

(declare-fun e!576706 () Bool)

(assert (=> b!1023465 (= e!576706 tp_is_empty!24017)))

(declare-fun b!1023466 () Bool)

(declare-fun e!576710 () Bool)

(assert (=> b!1023466 (= e!576710 false)))

(declare-fun lt!450411 () Bool)

(declare-datatypes ((List!21714 0))(
  ( (Nil!21711) (Cons!21710 (h!22908 (_ BitVec 64)) (t!30752 List!21714)) )
))
(declare-fun arrayNoDuplicates!0 (array!64078 (_ BitVec 32) List!21714) Bool)

(assert (=> b!1023466 (= lt!450411 (arrayNoDuplicates!0 (_keys!11099 thiss!1427) #b00000000000000000000000000000000 Nil!21711))))

(declare-fun b!1023467 () Bool)

(declare-fun e!576711 () Bool)

(assert (=> b!1023467 (= e!576711 tp_is_empty!24017)))

(declare-fun b!1023468 () Bool)

(declare-fun res!685446 () Bool)

(assert (=> b!1023468 (=> (not res!685446) (not e!576710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023468 (= res!685446 (validMask!0 (mask!29575 thiss!1427)))))

(declare-fun b!1023469 () Bool)

(declare-fun res!685444 () Bool)

(assert (=> b!1023469 (=> (not res!685444) (not e!576710))))

(assert (=> b!1023469 (= res!685444 (and (= (size!31363 (_values!5977 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29575 thiss!1427))) (= (size!31362 (_keys!11099 thiss!1427)) (size!31363 (_values!5977 thiss!1427))) (bvsge (mask!29575 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5686 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5686 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5686 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5686 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5686 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5686 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5686 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023470 () Bool)

(declare-fun mapRes!37443 () Bool)

(assert (=> b!1023470 (= e!576707 (and e!576706 mapRes!37443))))

(declare-fun condMapEmpty!37443 () Bool)

(declare-fun mapDefault!37443 () ValueCell!11305)

