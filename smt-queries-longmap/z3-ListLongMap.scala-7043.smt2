; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89268 () Bool)

(assert start!89268)

(declare-fun b!1023498 () Bool)

(declare-fun b_free!20311 () Bool)

(declare-fun b_next!20311 () Bool)

(assert (=> b!1023498 (= b_free!20311 (not b_next!20311))))

(declare-fun tp!71967 () Bool)

(declare-fun b_and!32507 () Bool)

(assert (=> b!1023498 (= tp!71967 b_and!32507)))

(declare-fun b!1023496 () Bool)

(declare-fun e!576745 () Bool)

(declare-fun e!576741 () Bool)

(declare-fun mapRes!37464 () Bool)

(assert (=> b!1023496 (= e!576745 (and e!576741 mapRes!37464))))

(declare-fun condMapEmpty!37464 () Bool)

(declare-datatypes ((V!36915 0))(
  ( (V!36916 (val!12066 Int)) )
))
(declare-datatypes ((ValueCell!11312 0))(
  ( (ValueCellFull!11312 (v!14634 V!36915)) (EmptyCell!11312) )
))
(declare-datatypes ((array!64045 0))(
  ( (array!64046 (arr!30834 (Array (_ BitVec 32) (_ BitVec 64))) (size!31347 (_ BitVec 32))) )
))
(declare-datatypes ((array!64047 0))(
  ( (array!64048 (arr!30835 (Array (_ BitVec 32) ValueCell!11312)) (size!31348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5218 0))(
  ( (LongMapFixedSize!5219 (defaultEntry!5961 Int) (mask!29583 (_ BitVec 32)) (extraKeys!5693 (_ BitVec 32)) (zeroValue!5797 V!36915) (minValue!5797 V!36915) (_size!2664 (_ BitVec 32)) (_keys!11102 array!64045) (_values!5984 array!64047) (_vacant!2664 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5218)

(declare-fun mapDefault!37464 () ValueCell!11312)

(assert (=> b!1023496 (= condMapEmpty!37464 (= (arr!30835 (_values!5984 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11312)) mapDefault!37464)))))

(declare-fun b!1023497 () Bool)

(declare-fun res!685477 () Bool)

(declare-fun e!576744 () Bool)

(assert (=> b!1023497 (=> (not res!685477) (not e!576744))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023497 (= res!685477 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!576743 () Bool)

(declare-fun tp_is_empty!24031 () Bool)

(declare-fun array_inv!23905 (array!64045) Bool)

(declare-fun array_inv!23906 (array!64047) Bool)

(assert (=> b!1023498 (= e!576743 (and tp!71967 tp_is_empty!24031 (array_inv!23905 (_keys!11102 thiss!1427)) (array_inv!23906 (_values!5984 thiss!1427)) e!576745))))

(declare-fun b!1023499 () Bool)

(declare-fun e!576746 () Bool)

(assert (=> b!1023499 (= e!576746 tp_is_empty!24031)))

(declare-fun res!685476 () Bool)

(assert (=> start!89268 (=> (not res!685476) (not e!576744))))

(declare-fun valid!1984 (LongMapFixedSize!5218) Bool)

(assert (=> start!89268 (= res!685476 (valid!1984 thiss!1427))))

(assert (=> start!89268 e!576744))

(assert (=> start!89268 e!576743))

(assert (=> start!89268 true))

(declare-fun b!1023500 () Bool)

(assert (=> b!1023500 (= e!576741 tp_is_empty!24031)))

(declare-fun b!1023501 () Bool)

(assert (=> b!1023501 (= e!576744 (not true))))

(declare-fun lt!450236 () Bool)

(declare-fun lt!450238 () V!36915)

(assert (=> b!1023501 (= lt!450236 (valid!1984 (LongMapFixedSize!5219 (defaultEntry!5961 thiss!1427) (mask!29583 thiss!1427) (bvand (extraKeys!5693 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5797 thiss!1427) lt!450238 (_size!2664 thiss!1427) (_keys!11102 thiss!1427) (_values!5984 thiss!1427) (_vacant!2664 thiss!1427))))))

(declare-datatypes ((tuple2!15592 0))(
  ( (tuple2!15593 (_1!7807 (_ BitVec 64)) (_2!7807 V!36915)) )
))
(declare-datatypes ((List!21747 0))(
  ( (Nil!21744) (Cons!21743 (h!22941 tuple2!15592) (t!30778 List!21747)) )
))
(declare-datatypes ((ListLongMap!13725 0))(
  ( (ListLongMap!13726 (toList!6878 List!21747)) )
))
(declare-fun -!470 (ListLongMap!13725 (_ BitVec 64)) ListLongMap!13725)

(declare-fun getCurrentListMap!3845 (array!64045 array!64047 (_ BitVec 32) (_ BitVec 32) V!36915 V!36915 (_ BitVec 32) Int) ListLongMap!13725)

(assert (=> b!1023501 (= (-!470 (getCurrentListMap!3845 (_keys!11102 thiss!1427) (_values!5984 thiss!1427) (mask!29583 thiss!1427) (extraKeys!5693 thiss!1427) (zeroValue!5797 thiss!1427) (minValue!5797 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5961 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3845 (_keys!11102 thiss!1427) (_values!5984 thiss!1427) (mask!29583 thiss!1427) (bvand (extraKeys!5693 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5797 thiss!1427) lt!450238 #b00000000000000000000000000000000 (defaultEntry!5961 thiss!1427)))))

(declare-datatypes ((Unit!33225 0))(
  ( (Unit!33226) )
))
(declare-fun lt!450237 () Unit!33225)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!2 (array!64045 array!64047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36915 V!36915 V!36915 Int) Unit!33225)

(assert (=> b!1023501 (= lt!450237 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!2 (_keys!11102 thiss!1427) (_values!5984 thiss!1427) (mask!29583 thiss!1427) (extraKeys!5693 thiss!1427) (bvand (extraKeys!5693 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5797 thiss!1427) (minValue!5797 thiss!1427) lt!450238 (defaultEntry!5961 thiss!1427)))))

(declare-fun dynLambda!1932 (Int (_ BitVec 64)) V!36915)

(assert (=> b!1023501 (= lt!450238 (dynLambda!1932 (defaultEntry!5961 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37464 () Bool)

(assert (=> mapIsEmpty!37464 mapRes!37464))

(declare-fun mapNonEmpty!37464 () Bool)

(declare-fun tp!71968 () Bool)

(assert (=> mapNonEmpty!37464 (= mapRes!37464 (and tp!71968 e!576746))))

(declare-fun mapValue!37464 () ValueCell!11312)

(declare-fun mapRest!37464 () (Array (_ BitVec 32) ValueCell!11312))

(declare-fun mapKey!37464 () (_ BitVec 32))

(assert (=> mapNonEmpty!37464 (= (arr!30835 (_values!5984 thiss!1427)) (store mapRest!37464 mapKey!37464 mapValue!37464))))

(assert (= (and start!89268 res!685476) b!1023497))

(assert (= (and b!1023497 res!685477) b!1023501))

(assert (= (and b!1023496 condMapEmpty!37464) mapIsEmpty!37464))

(assert (= (and b!1023496 (not condMapEmpty!37464)) mapNonEmpty!37464))

(get-info :version)

(assert (= (and mapNonEmpty!37464 ((_ is ValueCellFull!11312) mapValue!37464)) b!1023499))

(assert (= (and b!1023496 ((_ is ValueCellFull!11312) mapDefault!37464)) b!1023500))

(assert (= b!1023498 b!1023496))

(assert (= start!89268 b!1023498))

(declare-fun b_lambda!15673 () Bool)

(assert (=> (not b_lambda!15673) (not b!1023501)))

(declare-fun t!30777 () Bool)

(declare-fun tb!6855 () Bool)

(assert (=> (and b!1023498 (= (defaultEntry!5961 thiss!1427) (defaultEntry!5961 thiss!1427)) t!30777) tb!6855))

(declare-fun result!14027 () Bool)

(assert (=> tb!6855 (= result!14027 tp_is_empty!24031)))

(assert (=> b!1023501 t!30777))

(declare-fun b_and!32509 () Bool)

(assert (= b_and!32507 (and (=> t!30777 result!14027) b_and!32509)))

(declare-fun m!941613 () Bool)

(assert (=> b!1023498 m!941613))

(declare-fun m!941615 () Bool)

(assert (=> b!1023498 m!941615))

(declare-fun m!941617 () Bool)

(assert (=> start!89268 m!941617))

(declare-fun m!941619 () Bool)

(assert (=> b!1023501 m!941619))

(declare-fun m!941621 () Bool)

(assert (=> b!1023501 m!941621))

(declare-fun m!941623 () Bool)

(assert (=> b!1023501 m!941623))

(declare-fun m!941625 () Bool)

(assert (=> b!1023501 m!941625))

(declare-fun m!941627 () Bool)

(assert (=> b!1023501 m!941627))

(declare-fun m!941629 () Bool)

(assert (=> b!1023501 m!941629))

(assert (=> b!1023501 m!941623))

(declare-fun m!941631 () Bool)

(assert (=> mapNonEmpty!37464 m!941631))

(check-sat (not start!89268) (not b_next!20311) (not b!1023501) b_and!32509 (not b_lambda!15673) tp_is_empty!24031 (not mapNonEmpty!37464) (not b!1023498))
(check-sat b_and!32509 (not b_next!20311))
