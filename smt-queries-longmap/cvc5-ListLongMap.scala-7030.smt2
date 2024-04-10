; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89192 () Bool)

(assert start!89192)

(declare-fun b!1022617 () Bool)

(declare-fun b_free!20233 () Bool)

(declare-fun b_next!20233 () Bool)

(assert (=> b!1022617 (= b_free!20233 (not b_next!20233))))

(declare-fun tp!71734 () Bool)

(declare-fun b_and!32449 () Bool)

(assert (=> b!1022617 (= tp!71734 b_and!32449)))

(declare-fun res!684986 () Bool)

(declare-fun e!576133 () Bool)

(assert (=> start!89192 (=> (not res!684986) (not e!576133))))

(declare-datatypes ((V!36811 0))(
  ( (V!36812 (val!12027 Int)) )
))
(declare-datatypes ((ValueCell!11273 0))(
  ( (ValueCellFull!11273 (v!14596 V!36811)) (EmptyCell!11273) )
))
(declare-datatypes ((array!63950 0))(
  ( (array!63951 (arr!30787 (Array (_ BitVec 32) (_ BitVec 64))) (size!31298 (_ BitVec 32))) )
))
(declare-datatypes ((array!63952 0))(
  ( (array!63953 (arr!30788 (Array (_ BitVec 32) ValueCell!11273)) (size!31299 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5140 0))(
  ( (LongMapFixedSize!5141 (defaultEntry!5922 Int) (mask!29523 (_ BitVec 32)) (extraKeys!5654 (_ BitVec 32)) (zeroValue!5758 V!36811) (minValue!5758 V!36811) (_size!2625 (_ BitVec 32)) (_keys!11067 array!63950) (_values!5945 array!63952) (_vacant!2625 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5140)

(declare-fun valid!1958 (LongMapFixedSize!5140) Bool)

(assert (=> start!89192 (= res!684986 (valid!1958 thiss!1427))))

(assert (=> start!89192 e!576133))

(declare-fun e!576130 () Bool)

(assert (=> start!89192 e!576130))

(assert (=> start!89192 true))

(declare-fun b!1022615 () Bool)

(assert (=> b!1022615 (= e!576133 (not true))))

(declare-fun lt!450303 () Bool)

(declare-fun lt!450301 () V!36811)

(assert (=> b!1022615 (= lt!450303 (valid!1958 (LongMapFixedSize!5141 (defaultEntry!5922 thiss!1427) (mask!29523 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) lt!450301 (minValue!5758 thiss!1427) (_size!2625 thiss!1427) (_keys!11067 thiss!1427) (_values!5945 thiss!1427) (_vacant!2625 thiss!1427))))))

(declare-datatypes ((tuple2!15508 0))(
  ( (tuple2!15509 (_1!7765 (_ BitVec 64)) (_2!7765 V!36811)) )
))
(declare-datatypes ((List!21688 0))(
  ( (Nil!21685) (Cons!21684 (h!22882 tuple2!15508) (t!30722 List!21688)) )
))
(declare-datatypes ((ListLongMap!13649 0))(
  ( (ListLongMap!13650 (toList!6840 List!21688)) )
))
(declare-fun -!467 (ListLongMap!13649 (_ BitVec 64)) ListLongMap!13649)

(declare-fun getCurrentListMap!3888 (array!63950 array!63952 (_ BitVec 32) (_ BitVec 32) V!36811 V!36811 (_ BitVec 32) Int) ListLongMap!13649)

(assert (=> b!1022615 (= (-!467 (getCurrentListMap!3888 (_keys!11067 thiss!1427) (_values!5945 thiss!1427) (mask!29523 thiss!1427) (extraKeys!5654 thiss!1427) (zeroValue!5758 thiss!1427) (minValue!5758 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5922 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3888 (_keys!11067 thiss!1427) (_values!5945 thiss!1427) (mask!29523 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) lt!450301 (minValue!5758 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5922 thiss!1427)))))

(declare-datatypes ((Unit!33323 0))(
  ( (Unit!33324) )
))
(declare-fun lt!450302 () Unit!33323)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!8 (array!63950 array!63952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36811 V!36811 V!36811 Int) Unit!33323)

(assert (=> b!1022615 (= lt!450302 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!8 (_keys!11067 thiss!1427) (_values!5945 thiss!1427) (mask!29523 thiss!1427) (extraKeys!5654 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5758 thiss!1427) lt!450301 (minValue!5758 thiss!1427) (defaultEntry!5922 thiss!1427)))))

(declare-fun dynLambda!1937 (Int (_ BitVec 64)) V!36811)

(assert (=> b!1022615 (= lt!450301 (dynLambda!1937 (defaultEntry!5922 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1022616 () Bool)

(declare-fun res!684985 () Bool)

(assert (=> b!1022616 (=> (not res!684985) (not e!576133))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022616 (= res!684985 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!576131 () Bool)

(declare-fun tp_is_empty!23953 () Bool)

(declare-fun array_inv!23861 (array!63950) Bool)

(declare-fun array_inv!23862 (array!63952) Bool)

(assert (=> b!1022617 (= e!576130 (and tp!71734 tp_is_empty!23953 (array_inv!23861 (_keys!11067 thiss!1427)) (array_inv!23862 (_values!5945 thiss!1427)) e!576131))))

(declare-fun b!1022618 () Bool)

(declare-fun e!576132 () Bool)

(assert (=> b!1022618 (= e!576132 tp_is_empty!23953)))

(declare-fun mapNonEmpty!37347 () Bool)

(declare-fun mapRes!37347 () Bool)

(declare-fun tp!71733 () Bool)

(declare-fun e!576135 () Bool)

(assert (=> mapNonEmpty!37347 (= mapRes!37347 (and tp!71733 e!576135))))

(declare-fun mapRest!37347 () (Array (_ BitVec 32) ValueCell!11273))

(declare-fun mapKey!37347 () (_ BitVec 32))

(declare-fun mapValue!37347 () ValueCell!11273)

(assert (=> mapNonEmpty!37347 (= (arr!30788 (_values!5945 thiss!1427)) (store mapRest!37347 mapKey!37347 mapValue!37347))))

(declare-fun mapIsEmpty!37347 () Bool)

(assert (=> mapIsEmpty!37347 mapRes!37347))

(declare-fun b!1022619 () Bool)

(assert (=> b!1022619 (= e!576135 tp_is_empty!23953)))

(declare-fun b!1022620 () Bool)

(assert (=> b!1022620 (= e!576131 (and e!576132 mapRes!37347))))

(declare-fun condMapEmpty!37347 () Bool)

(declare-fun mapDefault!37347 () ValueCell!11273)

