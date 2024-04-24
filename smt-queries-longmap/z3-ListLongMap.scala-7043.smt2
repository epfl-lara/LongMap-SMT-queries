; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89504 () Bool)

(assert start!89504)

(declare-fun b!1024962 () Bool)

(declare-fun b_free!20311 () Bool)

(declare-fun b_next!20311 () Bool)

(assert (=> b!1024962 (= b_free!20311 (not b_next!20311))))

(declare-fun tp!71967 () Bool)

(declare-fun b_and!32543 () Bool)

(assert (=> b!1024962 (= tp!71967 b_and!32543)))

(declare-fun e!577676 () Bool)

(declare-fun tp_is_empty!24031 () Bool)

(declare-fun e!577678 () Bool)

(declare-datatypes ((V!36915 0))(
  ( (V!36916 (val!12066 Int)) )
))
(declare-datatypes ((ValueCell!11312 0))(
  ( (ValueCellFull!11312 (v!14631 V!36915)) (EmptyCell!11312) )
))
(declare-datatypes ((array!64155 0))(
  ( (array!64156 (arr!30883 (Array (_ BitVec 32) (_ BitVec 64))) (size!31395 (_ BitVec 32))) )
))
(declare-datatypes ((array!64157 0))(
  ( (array!64158 (arr!30884 (Array (_ BitVec 32) ValueCell!11312)) (size!31396 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5218 0))(
  ( (LongMapFixedSize!5219 (defaultEntry!5961 Int) (mask!29648 (_ BitVec 32)) (extraKeys!5693 (_ BitVec 32)) (zeroValue!5797 V!36915) (minValue!5797 V!36915) (_size!2664 (_ BitVec 32)) (_keys!11144 array!64155) (_values!5984 array!64157) (_vacant!2664 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5218)

(declare-fun array_inv!23945 (array!64155) Bool)

(declare-fun array_inv!23946 (array!64157) Bool)

(assert (=> b!1024962 (= e!577676 (and tp!71967 tp_is_empty!24031 (array_inv!23945 (_keys!11144 thiss!1427)) (array_inv!23946 (_values!5984 thiss!1427)) e!577678))))

(declare-fun b!1024963 () Bool)

(declare-fun e!577680 () Bool)

(declare-fun mapRes!37464 () Bool)

(assert (=> b!1024963 (= e!577678 (and e!577680 mapRes!37464))))

(declare-fun condMapEmpty!37464 () Bool)

(declare-fun mapDefault!37464 () ValueCell!11312)

(assert (=> b!1024963 (= condMapEmpty!37464 (= (arr!30884 (_values!5984 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11312)) mapDefault!37464)))))

(declare-fun b!1024964 () Bool)

(declare-fun res!686054 () Bool)

(declare-fun e!577679 () Bool)

(assert (=> b!1024964 (=> (not res!686054) (not e!577679))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024964 (= res!686054 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024965 () Bool)

(assert (=> b!1024965 (= e!577679 (not true))))

(declare-fun lt!450953 () Bool)

(declare-fun lt!450951 () V!36915)

(declare-fun valid!1992 (LongMapFixedSize!5218) Bool)

(assert (=> b!1024965 (= lt!450953 (valid!1992 (LongMapFixedSize!5219 (defaultEntry!5961 thiss!1427) (mask!29648 thiss!1427) (bvand (extraKeys!5693 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5797 thiss!1427) lt!450951 (_size!2664 thiss!1427) (_keys!11144 thiss!1427) (_values!5984 thiss!1427) (_vacant!2664 thiss!1427))))))

(declare-datatypes ((tuple2!15514 0))(
  ( (tuple2!15515 (_1!7768 (_ BitVec 64)) (_2!7768 V!36915)) )
))
(declare-datatypes ((List!21701 0))(
  ( (Nil!21698) (Cons!21697 (h!22904 tuple2!15514) (t!30733 List!21701)) )
))
(declare-datatypes ((ListLongMap!13659 0))(
  ( (ListLongMap!13660 (toList!6845 List!21701)) )
))
(declare-fun -!468 (ListLongMap!13659 (_ BitVec 64)) ListLongMap!13659)

(declare-fun getCurrentListMap!3891 (array!64155 array!64157 (_ BitVec 32) (_ BitVec 32) V!36915 V!36915 (_ BitVec 32) Int) ListLongMap!13659)

(assert (=> b!1024965 (= (-!468 (getCurrentListMap!3891 (_keys!11144 thiss!1427) (_values!5984 thiss!1427) (mask!29648 thiss!1427) (extraKeys!5693 thiss!1427) (zeroValue!5797 thiss!1427) (minValue!5797 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5961 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3891 (_keys!11144 thiss!1427) (_values!5984 thiss!1427) (mask!29648 thiss!1427) (bvand (extraKeys!5693 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5797 thiss!1427) lt!450951 #b00000000000000000000000000000000 (defaultEntry!5961 thiss!1427)))))

(declare-datatypes ((Unit!33330 0))(
  ( (Unit!33331) )
))
(declare-fun lt!450952 () Unit!33330)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!2 (array!64155 array!64157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36915 V!36915 V!36915 Int) Unit!33330)

(assert (=> b!1024965 (= lt!450952 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!2 (_keys!11144 thiss!1427) (_values!5984 thiss!1427) (mask!29648 thiss!1427) (extraKeys!5693 thiss!1427) (bvand (extraKeys!5693 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5797 thiss!1427) (minValue!5797 thiss!1427) lt!450951 (defaultEntry!5961 thiss!1427)))))

(declare-fun dynLambda!1962 (Int (_ BitVec 64)) V!36915)

(assert (=> b!1024965 (= lt!450951 (dynLambda!1962 (defaultEntry!5961 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37464 () Bool)

(assert (=> mapIsEmpty!37464 mapRes!37464))

(declare-fun b!1024966 () Bool)

(assert (=> b!1024966 (= e!577680 tp_is_empty!24031)))

(declare-fun b!1024967 () Bool)

(declare-fun e!577675 () Bool)

(assert (=> b!1024967 (= e!577675 tp_is_empty!24031)))

(declare-fun mapNonEmpty!37464 () Bool)

(declare-fun tp!71968 () Bool)

(assert (=> mapNonEmpty!37464 (= mapRes!37464 (and tp!71968 e!577675))))

(declare-fun mapRest!37464 () (Array (_ BitVec 32) ValueCell!11312))

(declare-fun mapValue!37464 () ValueCell!11312)

(declare-fun mapKey!37464 () (_ BitVec 32))

(assert (=> mapNonEmpty!37464 (= (arr!30884 (_values!5984 thiss!1427)) (store mapRest!37464 mapKey!37464 mapValue!37464))))

(declare-fun res!686053 () Bool)

(assert (=> start!89504 (=> (not res!686053) (not e!577679))))

(assert (=> start!89504 (= res!686053 (valid!1992 thiss!1427))))

(assert (=> start!89504 e!577679))

(assert (=> start!89504 e!577676))

(assert (=> start!89504 true))

(assert (= (and start!89504 res!686053) b!1024964))

(assert (= (and b!1024964 res!686054) b!1024965))

(assert (= (and b!1024963 condMapEmpty!37464) mapIsEmpty!37464))

(assert (= (and b!1024963 (not condMapEmpty!37464)) mapNonEmpty!37464))

(get-info :version)

(assert (= (and mapNonEmpty!37464 ((_ is ValueCellFull!11312) mapValue!37464)) b!1024967))

(assert (= (and b!1024963 ((_ is ValueCellFull!11312) mapDefault!37464)) b!1024966))

(assert (= b!1024962 b!1024963))

(assert (= start!89504 b!1024962))

(declare-fun b_lambda!15705 () Bool)

(assert (=> (not b_lambda!15705) (not b!1024965)))

(declare-fun t!30732 () Bool)

(declare-fun tb!6855 () Bool)

(assert (=> (and b!1024962 (= (defaultEntry!5961 thiss!1427) (defaultEntry!5961 thiss!1427)) t!30732) tb!6855))

(declare-fun result!14027 () Bool)

(assert (=> tb!6855 (= result!14027 tp_is_empty!24031)))

(assert (=> b!1024965 t!30732))

(declare-fun b_and!32545 () Bool)

(assert (= b_and!32543 (and (=> t!30732 result!14027) b_and!32545)))

(declare-fun m!943897 () Bool)

(assert (=> b!1024962 m!943897))

(declare-fun m!943899 () Bool)

(assert (=> b!1024962 m!943899))

(declare-fun m!943901 () Bool)

(assert (=> b!1024965 m!943901))

(declare-fun m!943903 () Bool)

(assert (=> b!1024965 m!943903))

(declare-fun m!943905 () Bool)

(assert (=> b!1024965 m!943905))

(declare-fun m!943907 () Bool)

(assert (=> b!1024965 m!943907))

(declare-fun m!943909 () Bool)

(assert (=> b!1024965 m!943909))

(assert (=> b!1024965 m!943907))

(declare-fun m!943911 () Bool)

(assert (=> b!1024965 m!943911))

(declare-fun m!943913 () Bool)

(assert (=> mapNonEmpty!37464 m!943913))

(declare-fun m!943915 () Bool)

(assert (=> start!89504 m!943915))

(check-sat (not b!1024962) (not b_next!20311) (not mapNonEmpty!37464) b_and!32545 tp_is_empty!24031 (not b_lambda!15705) (not start!89504) (not b!1024965))
(check-sat b_and!32545 (not b_next!20311))
