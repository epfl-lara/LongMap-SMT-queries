; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89516 () Bool)

(assert start!89516)

(declare-fun b!1025087 () Bool)

(declare-fun b_free!20323 () Bool)

(declare-fun b_next!20323 () Bool)

(assert (=> b!1025087 (= b_free!20323 (not b_next!20323))))

(declare-fun tp!72004 () Bool)

(declare-fun b_and!32567 () Bool)

(assert (=> b!1025087 (= tp!72004 b_and!32567)))

(declare-fun b!1025082 () Bool)

(declare-fun e!577787 () Bool)

(declare-fun tp_is_empty!24043 () Bool)

(assert (=> b!1025082 (= e!577787 tp_is_empty!24043)))

(declare-fun b!1025083 () Bool)

(declare-fun e!577785 () Bool)

(declare-fun mapRes!37482 () Bool)

(assert (=> b!1025083 (= e!577785 (and e!577787 mapRes!37482))))

(declare-fun condMapEmpty!37482 () Bool)

(declare-datatypes ((V!36931 0))(
  ( (V!36932 (val!12072 Int)) )
))
(declare-datatypes ((ValueCell!11318 0))(
  ( (ValueCellFull!11318 (v!14637 V!36931)) (EmptyCell!11318) )
))
(declare-datatypes ((array!64179 0))(
  ( (array!64180 (arr!30895 (Array (_ BitVec 32) (_ BitVec 64))) (size!31407 (_ BitVec 32))) )
))
(declare-datatypes ((array!64181 0))(
  ( (array!64182 (arr!30896 (Array (_ BitVec 32) ValueCell!11318)) (size!31408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5230 0))(
  ( (LongMapFixedSize!5231 (defaultEntry!5967 Int) (mask!29658 (_ BitVec 32)) (extraKeys!5699 (_ BitVec 32)) (zeroValue!5803 V!36931) (minValue!5803 V!36931) (_size!2670 (_ BitVec 32)) (_keys!11150 array!64179) (_values!5990 array!64181) (_vacant!2670 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5230)

(declare-fun mapDefault!37482 () ValueCell!11318)

(assert (=> b!1025083 (= condMapEmpty!37482 (= (arr!30896 (_values!5990 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11318)) mapDefault!37482)))))

(declare-fun mapNonEmpty!37482 () Bool)

(declare-fun tp!72003 () Bool)

(declare-fun e!577783 () Bool)

(assert (=> mapNonEmpty!37482 (= mapRes!37482 (and tp!72003 e!577783))))

(declare-fun mapKey!37482 () (_ BitVec 32))

(declare-fun mapRest!37482 () (Array (_ BitVec 32) ValueCell!11318))

(declare-fun mapValue!37482 () ValueCell!11318)

(assert (=> mapNonEmpty!37482 (= (arr!30896 (_values!5990 thiss!1427)) (store mapRest!37482 mapKey!37482 mapValue!37482))))

(declare-fun b!1025084 () Bool)

(declare-fun e!577784 () Bool)

(assert (=> b!1025084 (= e!577784 (not true))))

(declare-fun lt!451005 () Bool)

(declare-fun lt!451006 () V!36931)

(declare-fun valid!1997 (LongMapFixedSize!5230) Bool)

(assert (=> b!1025084 (= lt!451005 (valid!1997 (LongMapFixedSize!5231 (defaultEntry!5967 thiss!1427) (mask!29658 thiss!1427) (bvand (extraKeys!5699 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5803 thiss!1427) lt!451006 (_size!2670 thiss!1427) (_keys!11150 thiss!1427) (_values!5990 thiss!1427) (_vacant!2670 thiss!1427))))))

(declare-datatypes ((tuple2!15520 0))(
  ( (tuple2!15521 (_1!7771 (_ BitVec 64)) (_2!7771 V!36931)) )
))
(declare-datatypes ((List!21704 0))(
  ( (Nil!21701) (Cons!21700 (h!22907 tuple2!15520) (t!30748 List!21704)) )
))
(declare-datatypes ((ListLongMap!13665 0))(
  ( (ListLongMap!13666 (toList!6848 List!21704)) )
))
(declare-fun -!471 (ListLongMap!13665 (_ BitVec 64)) ListLongMap!13665)

(declare-fun getCurrentListMap!3894 (array!64179 array!64181 (_ BitVec 32) (_ BitVec 32) V!36931 V!36931 (_ BitVec 32) Int) ListLongMap!13665)

(assert (=> b!1025084 (= (-!471 (getCurrentListMap!3894 (_keys!11150 thiss!1427) (_values!5990 thiss!1427) (mask!29658 thiss!1427) (extraKeys!5699 thiss!1427) (zeroValue!5803 thiss!1427) (minValue!5803 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5967 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3894 (_keys!11150 thiss!1427) (_values!5990 thiss!1427) (mask!29658 thiss!1427) (bvand (extraKeys!5699 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5803 thiss!1427) lt!451006 #b00000000000000000000000000000000 (defaultEntry!5967 thiss!1427)))))

(declare-datatypes ((Unit!33336 0))(
  ( (Unit!33337) )
))
(declare-fun lt!451007 () Unit!33336)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!5 (array!64179 array!64181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36931 V!36931 V!36931 Int) Unit!33336)

(assert (=> b!1025084 (= lt!451007 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!5 (_keys!11150 thiss!1427) (_values!5990 thiss!1427) (mask!29658 thiss!1427) (extraKeys!5699 thiss!1427) (bvand (extraKeys!5699 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5803 thiss!1427) (minValue!5803 thiss!1427) lt!451006 (defaultEntry!5967 thiss!1427)))))

(declare-fun dynLambda!1965 (Int (_ BitVec 64)) V!36931)

(assert (=> b!1025084 (= lt!451006 (dynLambda!1965 (defaultEntry!5967 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37482 () Bool)

(assert (=> mapIsEmpty!37482 mapRes!37482))

(declare-fun b!1025085 () Bool)

(assert (=> b!1025085 (= e!577783 tp_is_empty!24043)))

(declare-fun res!686090 () Bool)

(assert (=> start!89516 (=> (not res!686090) (not e!577784))))

(assert (=> start!89516 (= res!686090 (valid!1997 thiss!1427))))

(assert (=> start!89516 e!577784))

(declare-fun e!577788 () Bool)

(assert (=> start!89516 e!577788))

(assert (=> start!89516 true))

(declare-fun b!1025086 () Bool)

(declare-fun res!686089 () Bool)

(assert (=> b!1025086 (=> (not res!686089) (not e!577784))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025086 (= res!686089 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!23953 (array!64179) Bool)

(declare-fun array_inv!23954 (array!64181) Bool)

(assert (=> b!1025087 (= e!577788 (and tp!72004 tp_is_empty!24043 (array_inv!23953 (_keys!11150 thiss!1427)) (array_inv!23954 (_values!5990 thiss!1427)) e!577785))))

(assert (= (and start!89516 res!686090) b!1025086))

(assert (= (and b!1025086 res!686089) b!1025084))

(assert (= (and b!1025083 condMapEmpty!37482) mapIsEmpty!37482))

(assert (= (and b!1025083 (not condMapEmpty!37482)) mapNonEmpty!37482))

(get-info :version)

(assert (= (and mapNonEmpty!37482 ((_ is ValueCellFull!11318) mapValue!37482)) b!1025085))

(assert (= (and b!1025083 ((_ is ValueCellFull!11318) mapDefault!37482)) b!1025082))

(assert (= b!1025087 b!1025083))

(assert (= start!89516 b!1025087))

(declare-fun b_lambda!15717 () Bool)

(assert (=> (not b_lambda!15717) (not b!1025084)))

(declare-fun t!30747 () Bool)

(declare-fun tb!6867 () Bool)

(assert (=> (and b!1025087 (= (defaultEntry!5967 thiss!1427) (defaultEntry!5967 thiss!1427)) t!30747) tb!6867))

(declare-fun result!14051 () Bool)

(assert (=> tb!6867 (= result!14051 tp_is_empty!24043)))

(assert (=> b!1025084 t!30747))

(declare-fun b_and!32569 () Bool)

(assert (= b_and!32567 (and (=> t!30747 result!14051) b_and!32569)))

(declare-fun m!944017 () Bool)

(assert (=> mapNonEmpty!37482 m!944017))

(declare-fun m!944019 () Bool)

(assert (=> b!1025084 m!944019))

(declare-fun m!944021 () Bool)

(assert (=> b!1025084 m!944021))

(declare-fun m!944023 () Bool)

(assert (=> b!1025084 m!944023))

(declare-fun m!944025 () Bool)

(assert (=> b!1025084 m!944025))

(declare-fun m!944027 () Bool)

(assert (=> b!1025084 m!944027))

(declare-fun m!944029 () Bool)

(assert (=> b!1025084 m!944029))

(assert (=> b!1025084 m!944021))

(declare-fun m!944031 () Bool)

(assert (=> start!89516 m!944031))

(declare-fun m!944033 () Bool)

(assert (=> b!1025087 m!944033))

(declare-fun m!944035 () Bool)

(assert (=> b!1025087 m!944035))

(check-sat b_and!32569 (not mapNonEmpty!37482) tp_is_empty!24043 (not start!89516) (not b_next!20323) (not b_lambda!15717) (not b!1025087) (not b!1025084))
(check-sat b_and!32569 (not b_next!20323))
