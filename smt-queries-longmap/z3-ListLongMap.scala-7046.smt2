; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89522 () Bool)

(assert start!89522)

(declare-fun b!1025146 () Bool)

(declare-fun b_free!20329 () Bool)

(declare-fun b_next!20329 () Bool)

(assert (=> b!1025146 (= b_free!20329 (not b_next!20329))))

(declare-fun tp!72021 () Bool)

(declare-fun b_and!32579 () Bool)

(assert (=> b!1025146 (= tp!72021 b_and!32579)))

(declare-fun b!1025142 () Bool)

(declare-fun e!577838 () Bool)

(declare-fun tp_is_empty!24049 () Bool)

(assert (=> b!1025142 (= e!577838 tp_is_empty!24049)))

(declare-fun b!1025143 () Bool)

(declare-fun e!577842 () Bool)

(assert (=> b!1025143 (= e!577842 (not true))))

(declare-fun lt!451032 () Bool)

(declare-datatypes ((V!36939 0))(
  ( (V!36940 (val!12075 Int)) )
))
(declare-datatypes ((ValueCell!11321 0))(
  ( (ValueCellFull!11321 (v!14640 V!36939)) (EmptyCell!11321) )
))
(declare-datatypes ((array!64191 0))(
  ( (array!64192 (arr!30901 (Array (_ BitVec 32) (_ BitVec 64))) (size!31413 (_ BitVec 32))) )
))
(declare-datatypes ((array!64193 0))(
  ( (array!64194 (arr!30902 (Array (_ BitVec 32) ValueCell!11321)) (size!31414 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5236 0))(
  ( (LongMapFixedSize!5237 (defaultEntry!5970 Int) (mask!29663 (_ BitVec 32)) (extraKeys!5702 (_ BitVec 32)) (zeroValue!5806 V!36939) (minValue!5806 V!36939) (_size!2673 (_ BitVec 32)) (_keys!11153 array!64191) (_values!5993 array!64193) (_vacant!2673 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5236)

(declare-fun lt!451033 () V!36939)

(declare-fun valid!2000 (LongMapFixedSize!5236) Bool)

(assert (=> b!1025143 (= lt!451032 (valid!2000 (LongMapFixedSize!5237 (defaultEntry!5970 thiss!1427) (mask!29663 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) lt!451033 (_size!2673 thiss!1427) (_keys!11153 thiss!1427) (_values!5993 thiss!1427) (_vacant!2673 thiss!1427))))))

(declare-datatypes ((tuple2!15526 0))(
  ( (tuple2!15527 (_1!7774 (_ BitVec 64)) (_2!7774 V!36939)) )
))
(declare-datatypes ((List!21707 0))(
  ( (Nil!21704) (Cons!21703 (h!22910 tuple2!15526) (t!30757 List!21707)) )
))
(declare-datatypes ((ListLongMap!13671 0))(
  ( (ListLongMap!13672 (toList!6851 List!21707)) )
))
(declare-fun -!474 (ListLongMap!13671 (_ BitVec 64)) ListLongMap!13671)

(declare-fun getCurrentListMap!3897 (array!64191 array!64193 (_ BitVec 32) (_ BitVec 32) V!36939 V!36939 (_ BitVec 32) Int) ListLongMap!13671)

(assert (=> b!1025143 (= (-!474 (getCurrentListMap!3897 (_keys!11153 thiss!1427) (_values!5993 thiss!1427) (mask!29663 thiss!1427) (extraKeys!5702 thiss!1427) (zeroValue!5806 thiss!1427) (minValue!5806 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5970 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3897 (_keys!11153 thiss!1427) (_values!5993 thiss!1427) (mask!29663 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) lt!451033 #b00000000000000000000000000000000 (defaultEntry!5970 thiss!1427)))))

(declare-datatypes ((Unit!33342 0))(
  ( (Unit!33343) )
))
(declare-fun lt!451034 () Unit!33342)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (array!64191 array!64193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36939 V!36939 V!36939 Int) Unit!33342)

(assert (=> b!1025143 (= lt!451034 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (_keys!11153 thiss!1427) (_values!5993 thiss!1427) (mask!29663 thiss!1427) (extraKeys!5702 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) (minValue!5806 thiss!1427) lt!451033 (defaultEntry!5970 thiss!1427)))))

(declare-fun dynLambda!1968 (Int (_ BitVec 64)) V!36939)

(assert (=> b!1025143 (= lt!451033 (dynLambda!1968 (defaultEntry!5970 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37491 () Bool)

(declare-fun mapRes!37491 () Bool)

(declare-fun tp!72022 () Bool)

(declare-fun e!577840 () Bool)

(assert (=> mapNonEmpty!37491 (= mapRes!37491 (and tp!72022 e!577840))))

(declare-fun mapKey!37491 () (_ BitVec 32))

(declare-fun mapValue!37491 () ValueCell!11321)

(declare-fun mapRest!37491 () (Array (_ BitVec 32) ValueCell!11321))

(assert (=> mapNonEmpty!37491 (= (arr!30902 (_values!5993 thiss!1427)) (store mapRest!37491 mapKey!37491 mapValue!37491))))

(declare-fun res!686108 () Bool)

(assert (=> start!89522 (=> (not res!686108) (not e!577842))))

(assert (=> start!89522 (= res!686108 (valid!2000 thiss!1427))))

(assert (=> start!89522 e!577842))

(declare-fun e!577839 () Bool)

(assert (=> start!89522 e!577839))

(assert (=> start!89522 true))

(declare-fun mapIsEmpty!37491 () Bool)

(assert (=> mapIsEmpty!37491 mapRes!37491))

(declare-fun b!1025144 () Bool)

(declare-fun res!686107 () Bool)

(assert (=> b!1025144 (=> (not res!686107) (not e!577842))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025144 (= res!686107 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1025145 () Bool)

(declare-fun e!577841 () Bool)

(assert (=> b!1025145 (= e!577841 (and e!577838 mapRes!37491))))

(declare-fun condMapEmpty!37491 () Bool)

(declare-fun mapDefault!37491 () ValueCell!11321)

(assert (=> b!1025145 (= condMapEmpty!37491 (= (arr!30902 (_values!5993 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11321)) mapDefault!37491)))))

(declare-fun array_inv!23959 (array!64191) Bool)

(declare-fun array_inv!23960 (array!64193) Bool)

(assert (=> b!1025146 (= e!577839 (and tp!72021 tp_is_empty!24049 (array_inv!23959 (_keys!11153 thiss!1427)) (array_inv!23960 (_values!5993 thiss!1427)) e!577841))))

(declare-fun b!1025147 () Bool)

(assert (=> b!1025147 (= e!577840 tp_is_empty!24049)))

(assert (= (and start!89522 res!686108) b!1025144))

(assert (= (and b!1025144 res!686107) b!1025143))

(assert (= (and b!1025145 condMapEmpty!37491) mapIsEmpty!37491))

(assert (= (and b!1025145 (not condMapEmpty!37491)) mapNonEmpty!37491))

(get-info :version)

(assert (= (and mapNonEmpty!37491 ((_ is ValueCellFull!11321) mapValue!37491)) b!1025147))

(assert (= (and b!1025145 ((_ is ValueCellFull!11321) mapDefault!37491)) b!1025142))

(assert (= b!1025146 b!1025145))

(assert (= start!89522 b!1025146))

(declare-fun b_lambda!15723 () Bool)

(assert (=> (not b_lambda!15723) (not b!1025143)))

(declare-fun t!30756 () Bool)

(declare-fun tb!6873 () Bool)

(assert (=> (and b!1025146 (= (defaultEntry!5970 thiss!1427) (defaultEntry!5970 thiss!1427)) t!30756) tb!6873))

(declare-fun result!14063 () Bool)

(assert (=> tb!6873 (= result!14063 tp_is_empty!24049)))

(assert (=> b!1025143 t!30756))

(declare-fun b_and!32581 () Bool)

(assert (= b_and!32579 (and (=> t!30756 result!14063) b_and!32581)))

(declare-fun m!944077 () Bool)

(assert (=> b!1025143 m!944077))

(declare-fun m!944079 () Bool)

(assert (=> b!1025143 m!944079))

(declare-fun m!944081 () Bool)

(assert (=> b!1025143 m!944081))

(declare-fun m!944083 () Bool)

(assert (=> b!1025143 m!944083))

(declare-fun m!944085 () Bool)

(assert (=> b!1025143 m!944085))

(declare-fun m!944087 () Bool)

(assert (=> b!1025143 m!944087))

(assert (=> b!1025143 m!944081))

(declare-fun m!944089 () Bool)

(assert (=> mapNonEmpty!37491 m!944089))

(declare-fun m!944091 () Bool)

(assert (=> start!89522 m!944091))

(declare-fun m!944093 () Bool)

(assert (=> b!1025146 m!944093))

(declare-fun m!944095 () Bool)

(assert (=> b!1025146 m!944095))

(check-sat b_and!32581 tp_is_empty!24049 (not b_lambda!15723) (not b_next!20329) (not b!1025146) (not start!89522) (not mapNonEmpty!37491) (not b!1025143))
(check-sat b_and!32581 (not b_next!20329))
