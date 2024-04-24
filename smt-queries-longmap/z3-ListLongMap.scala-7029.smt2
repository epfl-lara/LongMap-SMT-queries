; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89420 () Bool)

(assert start!89420)

(declare-fun b!1023874 () Bool)

(declare-fun b_free!20227 () Bool)

(declare-fun b_next!20227 () Bool)

(assert (=> b!1023874 (= b_free!20227 (not b_next!20227))))

(declare-fun tp!71715 () Bool)

(declare-fun b_and!32447 () Bool)

(assert (=> b!1023874 (= tp!71715 b_and!32447)))

(declare-fun b!1023871 () Bool)

(declare-fun e!576919 () Bool)

(assert (=> b!1023871 (= e!576919 (not true))))

(declare-fun lt!450790 () Bool)

(declare-datatypes ((V!36803 0))(
  ( (V!36804 (val!12024 Int)) )
))
(declare-datatypes ((ValueCell!11270 0))(
  ( (ValueCellFull!11270 (v!14589 V!36803)) (EmptyCell!11270) )
))
(declare-datatypes ((array!63987 0))(
  ( (array!63988 (arr!30799 (Array (_ BitVec 32) (_ BitVec 64))) (size!31311 (_ BitVec 32))) )
))
(declare-datatypes ((array!63989 0))(
  ( (array!63990 (arr!30800 (Array (_ BitVec 32) ValueCell!11270)) (size!31312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5134 0))(
  ( (LongMapFixedSize!5135 (defaultEntry!5919 Int) (mask!29578 (_ BitVec 32)) (extraKeys!5651 (_ BitVec 32)) (zeroValue!5755 V!36803) (minValue!5755 V!36803) (_size!2622 (_ BitVec 32)) (_keys!11102 array!63987) (_values!5942 array!63989) (_vacant!2622 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5134)

(declare-fun lt!450789 () V!36803)

(declare-fun valid!1962 (LongMapFixedSize!5134) Bool)

(assert (=> b!1023871 (= lt!450790 (valid!1962 (LongMapFixedSize!5135 (defaultEntry!5919 thiss!1427) (mask!29578 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) lt!450789 (minValue!5755 thiss!1427) (_size!2622 thiss!1427) (_keys!11102 thiss!1427) (_values!5942 thiss!1427) (_vacant!2622 thiss!1427))))))

(declare-datatypes ((tuple2!15506 0))(
  ( (tuple2!15507 (_1!7764 (_ BitVec 64)) (_2!7764 V!36803)) )
))
(declare-datatypes ((List!21674 0))(
  ( (Nil!21671) (Cons!21670 (h!22877 tuple2!15506) (t!30694 List!21674)) )
))
(declare-datatypes ((ListLongMap!13651 0))(
  ( (ListLongMap!13652 (toList!6841 List!21674)) )
))
(declare-fun -!464 (ListLongMap!13651 (_ BitVec 64)) ListLongMap!13651)

(declare-fun getCurrentListMap!3887 (array!63987 array!63989 (_ BitVec 32) (_ BitVec 32) V!36803 V!36803 (_ BitVec 32) Int) ListLongMap!13651)

(assert (=> b!1023871 (= (-!464 (getCurrentListMap!3887 (_keys!11102 thiss!1427) (_values!5942 thiss!1427) (mask!29578 thiss!1427) (extraKeys!5651 thiss!1427) (zeroValue!5755 thiss!1427) (minValue!5755 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5919 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3887 (_keys!11102 thiss!1427) (_values!5942 thiss!1427) (mask!29578 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) lt!450789 (minValue!5755 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5919 thiss!1427)))))

(declare-datatypes ((Unit!33322 0))(
  ( (Unit!33323) )
))
(declare-fun lt!450791 () Unit!33322)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!7 (array!63987 array!63989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36803 V!36803 V!36803 Int) Unit!33322)

(assert (=> b!1023871 (= lt!450791 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!7 (_keys!11102 thiss!1427) (_values!5942 thiss!1427) (mask!29578 thiss!1427) (extraKeys!5651 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5755 thiss!1427) lt!450789 (minValue!5755 thiss!1427) (defaultEntry!5919 thiss!1427)))))

(declare-fun dynLambda!1958 (Int (_ BitVec 64)) V!36803)

(assert (=> b!1023871 (= lt!450789 (dynLambda!1958 (defaultEntry!5919 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37338 () Bool)

(declare-fun mapRes!37338 () Bool)

(declare-fun tp!71716 () Bool)

(declare-fun e!576921 () Bool)

(assert (=> mapNonEmpty!37338 (= mapRes!37338 (and tp!71716 e!576921))))

(declare-fun mapKey!37338 () (_ BitVec 32))

(declare-fun mapRest!37338 () (Array (_ BitVec 32) ValueCell!11270))

(declare-fun mapValue!37338 () ValueCell!11270)

(assert (=> mapNonEmpty!37338 (= (arr!30800 (_values!5942 thiss!1427)) (store mapRest!37338 mapKey!37338 mapValue!37338))))

(declare-fun b!1023872 () Bool)

(declare-fun res!685477 () Bool)

(assert (=> b!1023872 (=> (not res!685477) (not e!576919))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023872 (= res!685477 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023873 () Bool)

(declare-fun tp_is_empty!23947 () Bool)

(assert (=> b!1023873 (= e!576921 tp_is_empty!23947)))

(declare-fun mapIsEmpty!37338 () Bool)

(assert (=> mapIsEmpty!37338 mapRes!37338))

(declare-fun e!576922 () Bool)

(declare-fun e!576923 () Bool)

(declare-fun array_inv!23891 (array!63987) Bool)

(declare-fun array_inv!23892 (array!63989) Bool)

(assert (=> b!1023874 (= e!576922 (and tp!71715 tp_is_empty!23947 (array_inv!23891 (_keys!11102 thiss!1427)) (array_inv!23892 (_values!5942 thiss!1427)) e!576923))))

(declare-fun b!1023875 () Bool)

(declare-fun e!576924 () Bool)

(assert (=> b!1023875 (= e!576923 (and e!576924 mapRes!37338))))

(declare-fun condMapEmpty!37338 () Bool)

(declare-fun mapDefault!37338 () ValueCell!11270)

(assert (=> b!1023875 (= condMapEmpty!37338 (= (arr!30800 (_values!5942 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11270)) mapDefault!37338)))))

(declare-fun b!1023870 () Bool)

(assert (=> b!1023870 (= e!576924 tp_is_empty!23947)))

(declare-fun res!685478 () Bool)

(assert (=> start!89420 (=> (not res!685478) (not e!576919))))

(assert (=> start!89420 (= res!685478 (valid!1962 thiss!1427))))

(assert (=> start!89420 e!576919))

(assert (=> start!89420 e!576922))

(assert (=> start!89420 true))

(assert (= (and start!89420 res!685478) b!1023872))

(assert (= (and b!1023872 res!685477) b!1023871))

(assert (= (and b!1023875 condMapEmpty!37338) mapIsEmpty!37338))

(assert (= (and b!1023875 (not condMapEmpty!37338)) mapNonEmpty!37338))

(get-info :version)

(assert (= (and mapNonEmpty!37338 ((_ is ValueCellFull!11270) mapValue!37338)) b!1023873))

(assert (= (and b!1023875 ((_ is ValueCellFull!11270) mapDefault!37338)) b!1023870))

(assert (= b!1023874 b!1023875))

(assert (= start!89420 b!1023874))

(declare-fun b_lambda!15693 () Bool)

(assert (=> (not b_lambda!15693) (not b!1023871)))

(declare-fun t!30693 () Bool)

(declare-fun tb!6843 () Bool)

(assert (=> (and b!1023874 (= (defaultEntry!5919 thiss!1427) (defaultEntry!5919 thiss!1427)) t!30693) tb!6843))

(declare-fun result!14003 () Bool)

(assert (=> tb!6843 (= result!14003 tp_is_empty!23947)))

(assert (=> b!1023871 t!30693))

(declare-fun b_and!32449 () Bool)

(assert (= b_and!32447 (and (=> t!30693 result!14003) b_and!32449)))

(declare-fun m!943273 () Bool)

(assert (=> b!1023871 m!943273))

(declare-fun m!943275 () Bool)

(assert (=> b!1023871 m!943275))

(declare-fun m!943277 () Bool)

(assert (=> b!1023871 m!943277))

(declare-fun m!943279 () Bool)

(assert (=> b!1023871 m!943279))

(declare-fun m!943281 () Bool)

(assert (=> b!1023871 m!943281))

(declare-fun m!943283 () Bool)

(assert (=> b!1023871 m!943283))

(assert (=> b!1023871 m!943281))

(declare-fun m!943285 () Bool)

(assert (=> mapNonEmpty!37338 m!943285))

(declare-fun m!943287 () Bool)

(assert (=> b!1023874 m!943287))

(declare-fun m!943289 () Bool)

(assert (=> b!1023874 m!943289))

(declare-fun m!943291 () Bool)

(assert (=> start!89420 m!943291))

(check-sat (not b_next!20227) (not b_lambda!15693) (not b!1023871) b_and!32449 (not mapNonEmpty!37338) (not b!1023874) tp_is_empty!23947 (not start!89420))
(check-sat b_and!32449 (not b_next!20227))
