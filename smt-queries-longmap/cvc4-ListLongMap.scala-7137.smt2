; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90578 () Bool)

(assert start!90578)

(declare-fun b!1035928 () Bool)

(declare-fun b_free!20879 () Bool)

(declare-fun b_next!20879 () Bool)

(assert (=> b!1035928 (= b_free!20879 (not b_next!20879))))

(declare-fun tp!73770 () Bool)

(declare-fun b_and!33383 () Bool)

(assert (=> b!1035928 (= tp!73770 b_and!33383)))

(declare-fun b!1035924 () Bool)

(declare-fun res!691587 () Bool)

(declare-fun e!585862 () Bool)

(assert (=> b!1035924 (=> (not res!691587) (not e!585862))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035924 (= res!691587 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035925 () Bool)

(declare-fun e!585860 () Bool)

(assert (=> b!1035925 (= e!585862 (not e!585860))))

(declare-fun res!691588 () Bool)

(assert (=> b!1035925 (=> (not res!691588) (not e!585860))))

(declare-datatypes ((V!37671 0))(
  ( (V!37672 (val!12350 Int)) )
))
(declare-datatypes ((ValueCell!11596 0))(
  ( (ValueCellFull!11596 (v!14930 V!37671)) (EmptyCell!11596) )
))
(declare-datatypes ((array!65296 0))(
  ( (array!65297 (arr!31433 (Array (_ BitVec 32) (_ BitVec 64))) (size!31961 (_ BitVec 32))) )
))
(declare-datatypes ((array!65298 0))(
  ( (array!65299 (arr!31434 (Array (_ BitVec 32) ValueCell!11596)) (size!31962 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5786 0))(
  ( (LongMapFixedSize!5787 (defaultEntry!6271 Int) (mask!30172 (_ BitVec 32)) (extraKeys!6001 (_ BitVec 32)) (zeroValue!6105 V!37671) (minValue!6107 V!37671) (_size!2948 (_ BitVec 32)) (_keys!11460 array!65296) (_values!6294 array!65298) (_vacant!2948 (_ BitVec 32))) )
))
(declare-fun lt!456799 () LongMapFixedSize!5786)

(declare-fun valid!2182 (LongMapFixedSize!5786) Bool)

(assert (=> b!1035925 (= res!691588 (valid!2182 lt!456799))))

(declare-fun thiss!1427 () LongMapFixedSize!5786)

(declare-fun lt!456800 () V!37671)

(assert (=> b!1035925 (= lt!456799 (LongMapFixedSize!5787 (defaultEntry!6271 thiss!1427) (mask!30172 thiss!1427) (bvand (extraKeys!6001 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6105 thiss!1427) lt!456800 (_size!2948 thiss!1427) (_keys!11460 thiss!1427) (_values!6294 thiss!1427) (_vacant!2948 thiss!1427)))))

(declare-datatypes ((tuple2!15732 0))(
  ( (tuple2!15733 (_1!7877 (_ BitVec 64)) (_2!7877 V!37671)) )
))
(declare-datatypes ((List!21919 0))(
  ( (Nil!21916) (Cons!21915 (h!23117 tuple2!15732) (t!31128 List!21919)) )
))
(declare-datatypes ((ListLongMap!13761 0))(
  ( (ListLongMap!13762 (toList!6896 List!21919)) )
))
(declare-fun -!523 (ListLongMap!13761 (_ BitVec 64)) ListLongMap!13761)

(declare-fun getCurrentListMap!3944 (array!65296 array!65298 (_ BitVec 32) (_ BitVec 32) V!37671 V!37671 (_ BitVec 32) Int) ListLongMap!13761)

(assert (=> b!1035925 (= (-!523 (getCurrentListMap!3944 (_keys!11460 thiss!1427) (_values!6294 thiss!1427) (mask!30172 thiss!1427) (extraKeys!6001 thiss!1427) (zeroValue!6105 thiss!1427) (minValue!6107 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6271 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3944 (_keys!11460 thiss!1427) (_values!6294 thiss!1427) (mask!30172 thiss!1427) (bvand (extraKeys!6001 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6105 thiss!1427) lt!456800 #b00000000000000000000000000000000 (defaultEntry!6271 thiss!1427)))))

(declare-datatypes ((Unit!33896 0))(
  ( (Unit!33897) )
))
(declare-fun lt!456801 () Unit!33896)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!9 (array!65296 array!65298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37671 V!37671 V!37671 Int) Unit!33896)

(assert (=> b!1035925 (= lt!456801 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!9 (_keys!11460 thiss!1427) (_values!6294 thiss!1427) (mask!30172 thiss!1427) (extraKeys!6001 thiss!1427) (bvand (extraKeys!6001 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6105 thiss!1427) (minValue!6107 thiss!1427) lt!456800 (defaultEntry!6271 thiss!1427)))))

(declare-fun dynLambda!1993 (Int (_ BitVec 64)) V!37671)

(assert (=> b!1035925 (= lt!456800 (dynLambda!1993 (defaultEntry!6271 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38415 () Bool)

(declare-fun mapRes!38415 () Bool)

(declare-fun tp!73771 () Bool)

(declare-fun e!585858 () Bool)

(assert (=> mapNonEmpty!38415 (= mapRes!38415 (and tp!73771 e!585858))))

(declare-fun mapKey!38415 () (_ BitVec 32))

(declare-fun mapValue!38415 () ValueCell!11596)

(declare-fun mapRest!38415 () (Array (_ BitVec 32) ValueCell!11596))

(assert (=> mapNonEmpty!38415 (= (arr!31434 (_values!6294 thiss!1427)) (store mapRest!38415 mapKey!38415 mapValue!38415))))

(declare-fun mapIsEmpty!38415 () Bool)

(assert (=> mapIsEmpty!38415 mapRes!38415))

(declare-fun b!1035926 () Bool)

(declare-fun e!585857 () Bool)

(declare-fun e!585859 () Bool)

(assert (=> b!1035926 (= e!585857 (and e!585859 mapRes!38415))))

(declare-fun condMapEmpty!38415 () Bool)

(declare-fun mapDefault!38415 () ValueCell!11596)

