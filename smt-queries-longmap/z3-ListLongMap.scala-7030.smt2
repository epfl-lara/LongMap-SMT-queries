; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89190 () Bool)

(assert start!89190)

(declare-fun b!1022468 () Bool)

(declare-fun b_free!20233 () Bool)

(declare-fun b_next!20233 () Bool)

(assert (=> b!1022468 (= b_free!20233 (not b_next!20233))))

(declare-fun tp!71734 () Bool)

(declare-fun b_and!32423 () Bool)

(assert (=> b!1022468 (= tp!71734 b_and!32423)))

(declare-fun res!684919 () Bool)

(declare-fun e!576043 () Bool)

(assert (=> start!89190 (=> (not res!684919) (not e!576043))))

(declare-datatypes ((V!36811 0))(
  ( (V!36812 (val!12027 Int)) )
))
(declare-datatypes ((ValueCell!11273 0))(
  ( (ValueCellFull!11273 (v!14595 V!36811)) (EmptyCell!11273) )
))
(declare-datatypes ((array!63889 0))(
  ( (array!63890 (arr!30756 (Array (_ BitVec 32) (_ BitVec 64))) (size!31269 (_ BitVec 32))) )
))
(declare-datatypes ((array!63891 0))(
  ( (array!63892 (arr!30757 (Array (_ BitVec 32) ValueCell!11273)) (size!31270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5140 0))(
  ( (LongMapFixedSize!5141 (defaultEntry!5922 Int) (mask!29518 (_ BitVec 32)) (extraKeys!5654 (_ BitVec 32)) (zeroValue!5758 V!36811) (minValue!5758 V!36811) (_size!2625 (_ BitVec 32)) (_keys!11063 array!63889) (_values!5945 array!63891) (_vacant!2625 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5140)

(declare-fun valid!1959 (LongMapFixedSize!5140) Bool)

(assert (=> start!89190 (= res!684919 (valid!1959 thiss!1427))))

(assert (=> start!89190 e!576043))

(declare-fun e!576044 () Bool)

(assert (=> start!89190 e!576044))

(assert (=> start!89190 true))

(declare-fun b!1022464 () Bool)

(declare-fun e!576042 () Bool)

(declare-fun tp_is_empty!23953 () Bool)

(assert (=> b!1022464 (= e!576042 tp_is_empty!23953)))

(declare-fun b!1022465 () Bool)

(declare-fun e!576039 () Bool)

(assert (=> b!1022465 (= e!576039 tp_is_empty!23953)))

(declare-fun b!1022466 () Bool)

(declare-fun res!684918 () Bool)

(assert (=> b!1022466 (=> (not res!684918) (not e!576043))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022466 (= res!684918 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022467 () Bool)

(declare-fun e!576040 () Bool)

(declare-fun mapRes!37347 () Bool)

(assert (=> b!1022467 (= e!576040 (and e!576042 mapRes!37347))))

(declare-fun condMapEmpty!37347 () Bool)

(declare-fun mapDefault!37347 () ValueCell!11273)

(assert (=> b!1022467 (= condMapEmpty!37347 (= (arr!30757 (_values!5945 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11273)) mapDefault!37347)))))

(declare-fun array_inv!23857 (array!63889) Bool)

(declare-fun array_inv!23858 (array!63891) Bool)

(assert (=> b!1022468 (= e!576044 (and tp!71734 tp_is_empty!23953 (array_inv!23857 (_keys!11063 thiss!1427)) (array_inv!23858 (_values!5945 thiss!1427)) e!576040))))

(declare-fun mapNonEmpty!37347 () Bool)

(declare-fun tp!71733 () Bool)

(assert (=> mapNonEmpty!37347 (= mapRes!37347 (and tp!71733 e!576039))))

(declare-fun mapRest!37347 () (Array (_ BitVec 32) ValueCell!11273))

(declare-fun mapKey!37347 () (_ BitVec 32))

(declare-fun mapValue!37347 () ValueCell!11273)

(assert (=> mapNonEmpty!37347 (= (arr!30757 (_values!5945 thiss!1427)) (store mapRest!37347 mapKey!37347 mapValue!37347))))

(declare-fun mapIsEmpty!37347 () Bool)

(assert (=> mapIsEmpty!37347 mapRes!37347))

(declare-fun b!1022469 () Bool)

(assert (=> b!1022469 (= e!576043 (not true))))

(declare-fun lt!450102 () Bool)

(declare-fun lt!450101 () V!36811)

(assert (=> b!1022469 (= lt!450102 (valid!1959 (LongMapFixedSize!5141 (defaultEntry!5922 thiss!1427) (mask!29518 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) lt!450101 (minValue!5758 thiss!1427) (_size!2625 thiss!1427) (_keys!11063 thiss!1427) (_values!5945 thiss!1427) (_vacant!2625 thiss!1427))))))

(declare-datatypes ((tuple2!15588 0))(
  ( (tuple2!15589 (_1!7805 (_ BitVec 64)) (_2!7805 V!36811)) )
))
(declare-datatypes ((List!21721 0))(
  ( (Nil!21718) (Cons!21717 (h!22915 tuple2!15588) (t!30746 List!21721)) )
))
(declare-datatypes ((ListLongMap!13721 0))(
  ( (ListLongMap!13722 (toList!6876 List!21721)) )
))
(declare-fun -!468 (ListLongMap!13721 (_ BitVec 64)) ListLongMap!13721)

(declare-fun getCurrentListMap!3843 (array!63889 array!63891 (_ BitVec 32) (_ BitVec 32) V!36811 V!36811 (_ BitVec 32) Int) ListLongMap!13721)

(assert (=> b!1022469 (= (-!468 (getCurrentListMap!3843 (_keys!11063 thiss!1427) (_values!5945 thiss!1427) (mask!29518 thiss!1427) (extraKeys!5654 thiss!1427) (zeroValue!5758 thiss!1427) (minValue!5758 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5922 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3843 (_keys!11063 thiss!1427) (_values!5945 thiss!1427) (mask!29518 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) lt!450101 (minValue!5758 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5922 thiss!1427)))))

(declare-datatypes ((Unit!33221 0))(
  ( (Unit!33222) )
))
(declare-fun lt!450103 () Unit!33221)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!9 (array!63889 array!63891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36811 V!36811 V!36811 Int) Unit!33221)

(assert (=> b!1022469 (= lt!450103 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!9 (_keys!11063 thiss!1427) (_values!5945 thiss!1427) (mask!29518 thiss!1427) (extraKeys!5654 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5758 thiss!1427) lt!450101 (minValue!5758 thiss!1427) (defaultEntry!5922 thiss!1427)))))

(declare-fun dynLambda!1930 (Int (_ BitVec 64)) V!36811)

(assert (=> b!1022469 (= lt!450101 (dynLambda!1930 (defaultEntry!5922 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89190 res!684919) b!1022466))

(assert (= (and b!1022466 res!684918) b!1022469))

(assert (= (and b!1022467 condMapEmpty!37347) mapIsEmpty!37347))

(assert (= (and b!1022467 (not condMapEmpty!37347)) mapNonEmpty!37347))

(get-info :version)

(assert (= (and mapNonEmpty!37347 ((_ is ValueCellFull!11273) mapValue!37347)) b!1022465))

(assert (= (and b!1022467 ((_ is ValueCellFull!11273) mapDefault!37347)) b!1022464))

(assert (= b!1022468 b!1022467))

(assert (= start!89190 b!1022468))

(declare-fun b_lambda!15667 () Bool)

(assert (=> (not b_lambda!15667) (not b!1022469)))

(declare-fun t!30745 () Bool)

(declare-fun tb!6849 () Bool)

(assert (=> (and b!1022468 (= (defaultEntry!5922 thiss!1427) (defaultEntry!5922 thiss!1427)) t!30745) tb!6849))

(declare-fun result!14015 () Bool)

(assert (=> tb!6849 (= result!14015 tp_is_empty!23953)))

(assert (=> b!1022469 t!30745))

(declare-fun b_and!32425 () Bool)

(assert (= b_and!32423 (and (=> t!30745 result!14015) b_and!32425)))

(declare-fun m!941049 () Bool)

(assert (=> start!89190 m!941049))

(declare-fun m!941051 () Bool)

(assert (=> b!1022468 m!941051))

(declare-fun m!941053 () Bool)

(assert (=> b!1022468 m!941053))

(declare-fun m!941055 () Bool)

(assert (=> mapNonEmpty!37347 m!941055))

(declare-fun m!941057 () Bool)

(assert (=> b!1022469 m!941057))

(declare-fun m!941059 () Bool)

(assert (=> b!1022469 m!941059))

(declare-fun m!941061 () Bool)

(assert (=> b!1022469 m!941061))

(declare-fun m!941063 () Bool)

(assert (=> b!1022469 m!941063))

(declare-fun m!941065 () Bool)

(assert (=> b!1022469 m!941065))

(declare-fun m!941067 () Bool)

(assert (=> b!1022469 m!941067))

(assert (=> b!1022469 m!941065))

(check-sat tp_is_empty!23953 (not b!1022468) (not b_next!20233) (not b_lambda!15667) b_and!32425 (not start!89190) (not mapNonEmpty!37347) (not b!1022469))
(check-sat b_and!32425 (not b_next!20233))
