; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89186 () Bool)

(assert start!89186)

(declare-fun b!1022557 () Bool)

(declare-fun b_free!20227 () Bool)

(declare-fun b_next!20227 () Bool)

(assert (=> b!1022557 (= b_free!20227 (not b_next!20227))))

(declare-fun tp!71715 () Bool)

(declare-fun b_and!32437 () Bool)

(assert (=> b!1022557 (= tp!71715 b_and!32437)))

(declare-fun b!1022555 () Bool)

(declare-fun e!576081 () Bool)

(assert (=> b!1022555 (= e!576081 (not true))))

(declare-fun lt!450276 () Bool)

(declare-datatypes ((V!36803 0))(
  ( (V!36804 (val!12024 Int)) )
))
(declare-datatypes ((ValueCell!11270 0))(
  ( (ValueCellFull!11270 (v!14593 V!36803)) (EmptyCell!11270) )
))
(declare-datatypes ((array!63938 0))(
  ( (array!63939 (arr!30781 (Array (_ BitVec 32) (_ BitVec 64))) (size!31292 (_ BitVec 32))) )
))
(declare-datatypes ((array!63940 0))(
  ( (array!63941 (arr!30782 (Array (_ BitVec 32) ValueCell!11270)) (size!31293 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5134 0))(
  ( (LongMapFixedSize!5135 (defaultEntry!5919 Int) (mask!29518 (_ BitVec 32)) (extraKeys!5651 (_ BitVec 32)) (zeroValue!5755 V!36803) (minValue!5755 V!36803) (_size!2622 (_ BitVec 32)) (_keys!11064 array!63938) (_values!5942 array!63940) (_vacant!2622 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5134)

(declare-fun lt!450274 () V!36803)

(declare-fun valid!1955 (LongMapFixedSize!5134) Bool)

(assert (=> b!1022555 (= lt!450276 (valid!1955 (LongMapFixedSize!5135 (defaultEntry!5919 thiss!1427) (mask!29518 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) lt!450274 (minValue!5755 thiss!1427) (_size!2622 thiss!1427) (_keys!11064 thiss!1427) (_values!5942 thiss!1427) (_vacant!2622 thiss!1427))))))

(declare-datatypes ((tuple2!15502 0))(
  ( (tuple2!15503 (_1!7762 (_ BitVec 64)) (_2!7762 V!36803)) )
))
(declare-datatypes ((List!21685 0))(
  ( (Nil!21682) (Cons!21681 (h!22879 tuple2!15502) (t!30713 List!21685)) )
))
(declare-datatypes ((ListLongMap!13643 0))(
  ( (ListLongMap!13644 (toList!6837 List!21685)) )
))
(declare-fun -!464 (ListLongMap!13643 (_ BitVec 64)) ListLongMap!13643)

(declare-fun getCurrentListMap!3885 (array!63938 array!63940 (_ BitVec 32) (_ BitVec 32) V!36803 V!36803 (_ BitVec 32) Int) ListLongMap!13643)

(assert (=> b!1022555 (= (-!464 (getCurrentListMap!3885 (_keys!11064 thiss!1427) (_values!5942 thiss!1427) (mask!29518 thiss!1427) (extraKeys!5651 thiss!1427) (zeroValue!5755 thiss!1427) (minValue!5755 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5919 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3885 (_keys!11064 thiss!1427) (_values!5942 thiss!1427) (mask!29518 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) lt!450274 (minValue!5755 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5919 thiss!1427)))))

(declare-datatypes ((Unit!33317 0))(
  ( (Unit!33318) )
))
(declare-fun lt!450275 () Unit!33317)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!5 (array!63938 array!63940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36803 V!36803 V!36803 Int) Unit!33317)

(assert (=> b!1022555 (= lt!450275 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!5 (_keys!11064 thiss!1427) (_values!5942 thiss!1427) (mask!29518 thiss!1427) (extraKeys!5651 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5755 thiss!1427) lt!450274 (minValue!5755 thiss!1427) (defaultEntry!5919 thiss!1427)))))

(declare-fun dynLambda!1934 (Int (_ BitVec 64)) V!36803)

(assert (=> b!1022555 (= lt!450274 (dynLambda!1934 (defaultEntry!5919 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37338 () Bool)

(declare-fun mapRes!37338 () Bool)

(declare-fun tp!71716 () Bool)

(declare-fun e!576080 () Bool)

(assert (=> mapNonEmpty!37338 (= mapRes!37338 (and tp!71716 e!576080))))

(declare-fun mapKey!37338 () (_ BitVec 32))

(declare-fun mapRest!37338 () (Array (_ BitVec 32) ValueCell!11270))

(declare-fun mapValue!37338 () ValueCell!11270)

(assert (=> mapNonEmpty!37338 (= (arr!30782 (_values!5942 thiss!1427)) (store mapRest!37338 mapKey!37338 mapValue!37338))))

(declare-fun b!1022556 () Bool)

(declare-fun e!576079 () Bool)

(declare-fun tp_is_empty!23947 () Bool)

(assert (=> b!1022556 (= e!576079 tp_is_empty!23947)))

(declare-fun mapIsEmpty!37338 () Bool)

(assert (=> mapIsEmpty!37338 mapRes!37338))

(declare-fun b!1022558 () Bool)

(declare-fun e!576077 () Bool)

(assert (=> b!1022558 (= e!576077 (and e!576079 mapRes!37338))))

(declare-fun condMapEmpty!37338 () Bool)

(declare-fun mapDefault!37338 () ValueCell!11270)

