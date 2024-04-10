; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89196 () Bool)

(assert start!89196)

(declare-fun b!1022659 () Bool)

(declare-fun b_free!20237 () Bool)

(declare-fun b_next!20237 () Bool)

(assert (=> b!1022659 (= b_free!20237 (not b_next!20237))))

(declare-fun tp!71745 () Bool)

(declare-fun b_and!32457 () Bool)

(assert (=> b!1022659 (= tp!71745 b_and!32457)))

(declare-fun b!1022655 () Bool)

(declare-fun e!576171 () Bool)

(assert (=> b!1022655 (= e!576171 (not true))))

(declare-fun lt!450319 () Bool)

(declare-datatypes ((V!36815 0))(
  ( (V!36816 (val!12029 Int)) )
))
(declare-datatypes ((ValueCell!11275 0))(
  ( (ValueCellFull!11275 (v!14598 V!36815)) (EmptyCell!11275) )
))
(declare-datatypes ((array!63958 0))(
  ( (array!63959 (arr!30791 (Array (_ BitVec 32) (_ BitVec 64))) (size!31302 (_ BitVec 32))) )
))
(declare-datatypes ((array!63960 0))(
  ( (array!63961 (arr!30792 (Array (_ BitVec 32) ValueCell!11275)) (size!31303 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5144 0))(
  ( (LongMapFixedSize!5145 (defaultEntry!5924 Int) (mask!29525 (_ BitVec 32)) (extraKeys!5656 (_ BitVec 32)) (zeroValue!5760 V!36815) (minValue!5760 V!36815) (_size!2627 (_ BitVec 32)) (_keys!11069 array!63958) (_values!5947 array!63960) (_vacant!2627 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5144)

(declare-fun lt!450320 () V!36815)

(declare-fun valid!1960 (LongMapFixedSize!5144) Bool)

(assert (=> b!1022655 (= lt!450319 (valid!1960 (LongMapFixedSize!5145 (defaultEntry!5924 thiss!1427) (mask!29525 thiss!1427) (bvand (extraKeys!5656 thiss!1427) #b00000000000000000000000000000010) lt!450320 (minValue!5760 thiss!1427) (_size!2627 thiss!1427) (_keys!11069 thiss!1427) (_values!5947 thiss!1427) (_vacant!2627 thiss!1427))))))

(declare-datatypes ((tuple2!15512 0))(
  ( (tuple2!15513 (_1!7767 (_ BitVec 64)) (_2!7767 V!36815)) )
))
(declare-datatypes ((List!21690 0))(
  ( (Nil!21687) (Cons!21686 (h!22884 tuple2!15512) (t!30728 List!21690)) )
))
(declare-datatypes ((ListLongMap!13653 0))(
  ( (ListLongMap!13654 (toList!6842 List!21690)) )
))
(declare-fun -!469 (ListLongMap!13653 (_ BitVec 64)) ListLongMap!13653)

(declare-fun getCurrentListMap!3890 (array!63958 array!63960 (_ BitVec 32) (_ BitVec 32) V!36815 V!36815 (_ BitVec 32) Int) ListLongMap!13653)

(assert (=> b!1022655 (= (-!469 (getCurrentListMap!3890 (_keys!11069 thiss!1427) (_values!5947 thiss!1427) (mask!29525 thiss!1427) (extraKeys!5656 thiss!1427) (zeroValue!5760 thiss!1427) (minValue!5760 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5924 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3890 (_keys!11069 thiss!1427) (_values!5947 thiss!1427) (mask!29525 thiss!1427) (bvand (extraKeys!5656 thiss!1427) #b00000000000000000000000000000010) lt!450320 (minValue!5760 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5924 thiss!1427)))))

(declare-datatypes ((Unit!33327 0))(
  ( (Unit!33328) )
))
(declare-fun lt!450321 () Unit!33327)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!10 (array!63958 array!63960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36815 V!36815 V!36815 Int) Unit!33327)

(assert (=> b!1022655 (= lt!450321 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!10 (_keys!11069 thiss!1427) (_values!5947 thiss!1427) (mask!29525 thiss!1427) (extraKeys!5656 thiss!1427) (bvand (extraKeys!5656 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5760 thiss!1427) lt!450320 (minValue!5760 thiss!1427) (defaultEntry!5924 thiss!1427)))))

(declare-fun dynLambda!1939 (Int (_ BitVec 64)) V!36815)

(assert (=> b!1022655 (= lt!450320 (dynLambda!1939 (defaultEntry!5924 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1022656 () Bool)

(declare-fun e!576166 () Bool)

(declare-fun tp_is_empty!23957 () Bool)

(assert (=> b!1022656 (= e!576166 tp_is_empty!23957)))

(declare-fun b!1022657 () Bool)

(declare-fun res!684997 () Bool)

(assert (=> b!1022657 (=> (not res!684997) (not e!576171))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022657 (= res!684997 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37353 () Bool)

(declare-fun mapRes!37353 () Bool)

(assert (=> mapIsEmpty!37353 mapRes!37353))

(declare-fun b!1022658 () Bool)

(declare-fun e!576170 () Bool)

(assert (=> b!1022658 (= e!576170 (and e!576166 mapRes!37353))))

(declare-fun condMapEmpty!37353 () Bool)

(declare-fun mapDefault!37353 () ValueCell!11275)

