; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15204 () Bool)

(assert start!15204)

(declare-fun b!146232 () Bool)

(declare-fun b_free!3113 () Bool)

(declare-fun b_next!3113 () Bool)

(assert (=> b!146232 (= b_free!3113 (not b_next!3113))))

(declare-fun tp!11841 () Bool)

(declare-fun b_and!9143 () Bool)

(assert (=> b!146232 (= tp!11841 b_and!9143)))

(declare-fun b!146233 () Bool)

(declare-fun b_free!3115 () Bool)

(declare-fun b_next!3115 () Bool)

(assert (=> b!146233 (= b_free!3115 (not b_next!3115))))

(declare-fun tp!11842 () Bool)

(declare-fun b_and!9145 () Bool)

(assert (=> b!146233 (= tp!11842 b_and!9145)))

(declare-datatypes ((V!3611 0))(
  ( (V!3612 (val!1531 Int)) )
))
(declare-datatypes ((array!4991 0))(
  ( (array!4992 (arr!2357 (Array (_ BitVec 32) (_ BitVec 64))) (size!2633 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1143 0))(
  ( (ValueCellFull!1143 (v!3352 V!3611)) (EmptyCell!1143) )
))
(declare-datatypes ((array!4993 0))(
  ( (array!4994 (arr!2358 (Array (_ BitVec 32) ValueCell!1143)) (size!2634 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1194 0))(
  ( (LongMapFixedSize!1195 (defaultEntry!3013 Int) (mask!7389 (_ BitVec 32)) (extraKeys!2758 (_ BitVec 32)) (zeroValue!2858 V!3611) (minValue!2858 V!3611) (_size!646 (_ BitVec 32)) (_keys!4782 array!4991) (_values!2996 array!4993) (_vacant!646 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!978 0))(
  ( (Cell!979 (v!3353 LongMapFixedSize!1194)) )
))
(declare-datatypes ((LongMap!978 0))(
  ( (LongMap!979 (underlying!500 Cell!978)) )
))
(declare-fun thiss!992 () LongMap!978)

(declare-fun tp_is_empty!2973 () Bool)

(declare-fun e!95390 () Bool)

(declare-fun e!95385 () Bool)

(declare-fun array_inv!1483 (array!4991) Bool)

(declare-fun array_inv!1484 (array!4993) Bool)

(assert (=> b!146232 (= e!95390 (and tp!11841 tp_is_empty!2973 (array_inv!1483 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) (array_inv!1484 (_values!2996 (v!3353 (underlying!500 thiss!992)))) e!95385))))

(declare-fun res!69592 () Bool)

(declare-fun e!95388 () Bool)

(assert (=> start!15204 (=> (not res!69592) (not e!95388))))

(declare-fun valid!580 (LongMap!978) Bool)

(assert (=> start!15204 (= res!69592 (valid!580 thiss!992))))

(assert (=> start!15204 e!95388))

(declare-fun e!95392 () Bool)

(assert (=> start!15204 e!95392))

(assert (=> start!15204 true))

(declare-fun e!95382 () Bool)

(assert (=> start!15204 e!95382))

(declare-fun newMap!16 () LongMapFixedSize!1194)

(declare-fun e!95391 () Bool)

(assert (=> b!146233 (= e!95382 (and tp!11842 tp_is_empty!2973 (array_inv!1483 (_keys!4782 newMap!16)) (array_inv!1484 (_values!2996 newMap!16)) e!95391))))

(declare-fun mapIsEmpty!4991 () Bool)

(declare-fun mapRes!4992 () Bool)

(assert (=> mapIsEmpty!4991 mapRes!4992))

(declare-fun b!146234 () Bool)

(declare-fun res!69591 () Bool)

(assert (=> b!146234 (=> (not res!69591) (not e!95388))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146234 (= res!69591 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2633 (_keys!4782 (v!3353 (underlying!500 thiss!992)))))))))

(declare-fun b!146235 () Bool)

(declare-fun e!95395 () Bool)

(assert (=> b!146235 (= e!95395 e!95390)))

(declare-fun b!146236 () Bool)

(declare-datatypes ((Unit!4619 0))(
  ( (Unit!4620) )
))
(declare-fun e!95389 () Unit!4619)

(declare-fun Unit!4621 () Unit!4619)

(assert (=> b!146236 (= e!95389 Unit!4621)))

(declare-fun lt!76890 () Unit!4619)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!153 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3611 V!3611 (_ BitVec 64) (_ BitVec 32) Int) Unit!4619)

(assert (=> b!146236 (= lt!76890 (lemmaListMapContainsThenArrayContainsFrom!153 (_keys!4782 (v!3353 (underlying!500 thiss!992))) (_values!2996 (v!3353 (underlying!500 thiss!992))) (mask!7389 (v!3353 (underlying!500 thiss!992))) (extraKeys!2758 (v!3353 (underlying!500 thiss!992))) (zeroValue!2858 (v!3353 (underlying!500 thiss!992))) (minValue!2858 (v!3353 (underlying!500 thiss!992))) (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3013 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146236 (arrayContainsKey!0 (_keys!4782 (v!3353 (underlying!500 thiss!992))) (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76886 () Unit!4619)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4991 (_ BitVec 32) (_ BitVec 32)) Unit!4619)

(assert (=> b!146236 (= lt!76886 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4782 (v!3353 (underlying!500 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1777 0))(
  ( (Nil!1774) (Cons!1773 (h!2381 (_ BitVec 64)) (t!6474 List!1777)) )
))
(declare-fun arrayNoDuplicates!0 (array!4991 (_ BitVec 32) List!1777) Bool)

(assert (=> b!146236 (arrayNoDuplicates!0 (_keys!4782 (v!3353 (underlying!500 thiss!992))) from!355 Nil!1774)))

(declare-fun lt!76887 () Unit!4619)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4991 (_ BitVec 32) (_ BitVec 64) List!1777) Unit!4619)

(assert (=> b!146236 (= lt!76887 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4782 (v!3353 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) (Cons!1773 (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) Nil!1774)))))

(assert (=> b!146236 false))

(declare-fun b!146237 () Bool)

(declare-fun e!95379 () Bool)

(assert (=> b!146237 (= e!95388 e!95379)))

(declare-fun res!69588 () Bool)

(assert (=> b!146237 (=> (not res!69588) (not e!95379))))

(declare-datatypes ((tuple2!2758 0))(
  ( (tuple2!2759 (_1!1390 (_ BitVec 64)) (_2!1390 V!3611)) )
))
(declare-datatypes ((List!1778 0))(
  ( (Nil!1775) (Cons!1774 (h!2382 tuple2!2758) (t!6475 List!1778)) )
))
(declare-datatypes ((ListLongMap!1777 0))(
  ( (ListLongMap!1778 (toList!904 List!1778)) )
))
(declare-fun lt!76892 () ListLongMap!1777)

(declare-fun lt!76893 () ListLongMap!1777)

(assert (=> b!146237 (= res!69588 (= lt!76892 lt!76893))))

(declare-fun map!1468 (LongMapFixedSize!1194) ListLongMap!1777)

(assert (=> b!146237 (= lt!76893 (map!1468 newMap!16))))

(declare-fun getCurrentListMap!573 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3611 V!3611 (_ BitVec 32) Int) ListLongMap!1777)

(assert (=> b!146237 (= lt!76892 (getCurrentListMap!573 (_keys!4782 (v!3353 (underlying!500 thiss!992))) (_values!2996 (v!3353 (underlying!500 thiss!992))) (mask!7389 (v!3353 (underlying!500 thiss!992))) (extraKeys!2758 (v!3353 (underlying!500 thiss!992))) (zeroValue!2858 (v!3353 (underlying!500 thiss!992))) (minValue!2858 (v!3353 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3013 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun b!146238 () Bool)

(declare-fun e!95393 () Bool)

(declare-fun mapRes!4991 () Bool)

(assert (=> b!146238 (= e!95385 (and e!95393 mapRes!4991))))

(declare-fun condMapEmpty!4992 () Bool)

(declare-fun mapDefault!4991 () ValueCell!1143)

(assert (=> b!146238 (= condMapEmpty!4992 (= (arr!2358 (_values!2996 (v!3353 (underlying!500 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1143)) mapDefault!4991)))))

(declare-fun b!146239 () Bool)

(declare-fun e!95387 () Bool)

(assert (=> b!146239 (= e!95387 tp_is_empty!2973)))

(declare-fun mapIsEmpty!4992 () Bool)

(assert (=> mapIsEmpty!4992 mapRes!4991))

(declare-fun b!146240 () Bool)

(declare-fun e!95394 () Bool)

(assert (=> b!146240 (= e!95394 tp_is_empty!2973)))

(declare-fun b!146241 () Bool)

(assert (=> b!146241 (= e!95393 tp_is_empty!2973)))

(declare-fun mapNonEmpty!4991 () Bool)

(declare-fun tp!11843 () Bool)

(assert (=> mapNonEmpty!4991 (= mapRes!4991 (and tp!11843 e!95394))))

(declare-fun mapKey!4991 () (_ BitVec 32))

(declare-fun mapRest!4991 () (Array (_ BitVec 32) ValueCell!1143))

(declare-fun mapValue!4991 () ValueCell!1143)

(assert (=> mapNonEmpty!4991 (= (arr!2358 (_values!2996 (v!3353 (underlying!500 thiss!992)))) (store mapRest!4991 mapKey!4991 mapValue!4991))))

(declare-fun b!146242 () Bool)

(declare-fun e!95383 () Bool)

(assert (=> b!146242 (= e!95383 (not true))))

(declare-fun lt!76891 () ListLongMap!1777)

(declare-fun lt!76885 () tuple2!2758)

(declare-fun lt!76894 () tuple2!2758)

(declare-fun +!184 (ListLongMap!1777 tuple2!2758) ListLongMap!1777)

(assert (=> b!146242 (= (+!184 (+!184 lt!76891 lt!76885) lt!76894) (+!184 (+!184 lt!76891 lt!76894) lt!76885))))

(assert (=> b!146242 (= lt!76894 (tuple2!2759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2858 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun lt!76888 () V!3611)

(assert (=> b!146242 (= lt!76885 (tuple2!2759 (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) lt!76888))))

(declare-fun lt!76889 () Unit!4619)

(declare-fun addCommutativeForDiffKeys!77 (ListLongMap!1777 (_ BitVec 64) V!3611 (_ BitVec 64) V!3611) Unit!4619)

(assert (=> b!146242 (= lt!76889 (addCommutativeForDiffKeys!77 lt!76891 (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) lt!76888 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2858 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!152 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3611 V!3611 (_ BitVec 32) Int) ListLongMap!1777)

(assert (=> b!146242 (= lt!76891 (getCurrentListMapNoExtraKeys!152 (_keys!4782 (v!3353 (underlying!500 thiss!992))) (_values!2996 (v!3353 (underlying!500 thiss!992))) (mask!7389 (v!3353 (underlying!500 thiss!992))) (extraKeys!2758 (v!3353 (underlying!500 thiss!992))) (zeroValue!2858 (v!3353 (underlying!500 thiss!992))) (minValue!2858 (v!3353 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3013 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun b!146243 () Bool)

(declare-fun Unit!4622 () Unit!4619)

(assert (=> b!146243 (= e!95389 Unit!4622)))

(declare-fun b!146244 () Bool)

(declare-fun e!95381 () Bool)

(assert (=> b!146244 (= e!95391 (and e!95381 mapRes!4992))))

(declare-fun condMapEmpty!4991 () Bool)

(declare-fun mapDefault!4992 () ValueCell!1143)

(assert (=> b!146244 (= condMapEmpty!4991 (= (arr!2358 (_values!2996 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1143)) mapDefault!4992)))))

(declare-fun b!146245 () Bool)

(declare-fun e!95384 () Bool)

(assert (=> b!146245 (= e!95379 e!95384)))

(declare-fun res!69593 () Bool)

(assert (=> b!146245 (=> (not res!69593) (not e!95384))))

(assert (=> b!146245 (= res!69593 (and (not (= (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1570 (ValueCell!1143 V!3611) V!3611)

(declare-fun dynLambda!456 (Int (_ BitVec 64)) V!3611)

(assert (=> b!146245 (= lt!76888 (get!1570 (select (arr!2358 (_values!2996 (v!3353 (underlying!500 thiss!992)))) from!355) (dynLambda!456 (defaultEntry!3013 (v!3353 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146246 () Bool)

(assert (=> b!146246 (= e!95384 e!95383)))

(declare-fun res!69589 () Bool)

(assert (=> b!146246 (=> (not res!69589) (not e!95383))))

(declare-datatypes ((tuple2!2760 0))(
  ( (tuple2!2761 (_1!1391 Bool) (_2!1391 LongMapFixedSize!1194)) )
))
(declare-fun lt!76895 () tuple2!2760)

(assert (=> b!146246 (= res!69589 (and (_1!1391 lt!76895) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!76884 () Unit!4619)

(assert (=> b!146246 (= lt!76884 e!95389)))

(declare-fun c!27626 () Bool)

(declare-fun contains!950 (ListLongMap!1777 (_ BitVec 64)) Bool)

(assert (=> b!146246 (= c!27626 (contains!950 lt!76893 (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355)))))

(declare-fun update!225 (LongMapFixedSize!1194 (_ BitVec 64) V!3611) tuple2!2760)

(assert (=> b!146246 (= lt!76895 (update!225 newMap!16 (select (arr!2357 (_keys!4782 (v!3353 (underlying!500 thiss!992)))) from!355) lt!76888))))

(declare-fun b!146247 () Bool)

(declare-fun res!69590 () Bool)

(assert (=> b!146247 (=> (not res!69590) (not e!95388))))

(assert (=> b!146247 (= res!69590 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7389 newMap!16)) (_size!646 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun b!146248 () Bool)

(declare-fun res!69594 () Bool)

(assert (=> b!146248 (=> (not res!69594) (not e!95388))))

(declare-fun valid!581 (LongMapFixedSize!1194) Bool)

(assert (=> b!146248 (= res!69594 (valid!581 newMap!16))))

(declare-fun mapNonEmpty!4992 () Bool)

(declare-fun tp!11844 () Bool)

(assert (=> mapNonEmpty!4992 (= mapRes!4992 (and tp!11844 e!95387))))

(declare-fun mapRest!4992 () (Array (_ BitVec 32) ValueCell!1143))

(declare-fun mapKey!4992 () (_ BitVec 32))

(declare-fun mapValue!4992 () ValueCell!1143)

(assert (=> mapNonEmpty!4992 (= (arr!2358 (_values!2996 newMap!16)) (store mapRest!4992 mapKey!4992 mapValue!4992))))

(declare-fun b!146249 () Bool)

(assert (=> b!146249 (= e!95381 tp_is_empty!2973)))

(declare-fun b!146250 () Bool)

(assert (=> b!146250 (= e!95392 e!95395)))

(assert (= (and start!15204 res!69592) b!146234))

(assert (= (and b!146234 res!69591) b!146248))

(assert (= (and b!146248 res!69594) b!146247))

(assert (= (and b!146247 res!69590) b!146237))

(assert (= (and b!146237 res!69588) b!146245))

(assert (= (and b!146245 res!69593) b!146246))

(assert (= (and b!146246 c!27626) b!146236))

(assert (= (and b!146246 (not c!27626)) b!146243))

(assert (= (and b!146246 res!69589) b!146242))

(assert (= (and b!146238 condMapEmpty!4992) mapIsEmpty!4992))

(assert (= (and b!146238 (not condMapEmpty!4992)) mapNonEmpty!4991))

(get-info :version)

(assert (= (and mapNonEmpty!4991 ((_ is ValueCellFull!1143) mapValue!4991)) b!146240))

(assert (= (and b!146238 ((_ is ValueCellFull!1143) mapDefault!4991)) b!146241))

(assert (= b!146232 b!146238))

(assert (= b!146235 b!146232))

(assert (= b!146250 b!146235))

(assert (= start!15204 b!146250))

(assert (= (and b!146244 condMapEmpty!4991) mapIsEmpty!4991))

(assert (= (and b!146244 (not condMapEmpty!4991)) mapNonEmpty!4992))

(assert (= (and mapNonEmpty!4992 ((_ is ValueCellFull!1143) mapValue!4992)) b!146239))

(assert (= (and b!146244 ((_ is ValueCellFull!1143) mapDefault!4992)) b!146249))

(assert (= b!146233 b!146244))

(assert (= start!15204 b!146233))

(declare-fun b_lambda!6549 () Bool)

(assert (=> (not b_lambda!6549) (not b!146245)))

(declare-fun t!6471 () Bool)

(declare-fun tb!2657 () Bool)

(assert (=> (and b!146232 (= (defaultEntry!3013 (v!3353 (underlying!500 thiss!992))) (defaultEntry!3013 (v!3353 (underlying!500 thiss!992)))) t!6471) tb!2657))

(declare-fun result!4341 () Bool)

(assert (=> tb!2657 (= result!4341 tp_is_empty!2973)))

(assert (=> b!146245 t!6471))

(declare-fun b_and!9147 () Bool)

(assert (= b_and!9143 (and (=> t!6471 result!4341) b_and!9147)))

(declare-fun tb!2659 () Bool)

(declare-fun t!6473 () Bool)

(assert (=> (and b!146233 (= (defaultEntry!3013 newMap!16) (defaultEntry!3013 (v!3353 (underlying!500 thiss!992)))) t!6473) tb!2659))

(declare-fun result!4345 () Bool)

(assert (= result!4345 result!4341))

(assert (=> b!146245 t!6473))

(declare-fun b_and!9149 () Bool)

(assert (= b_and!9145 (and (=> t!6473 result!4345) b_and!9149)))

(declare-fun m!176009 () Bool)

(assert (=> b!146233 m!176009))

(declare-fun m!176011 () Bool)

(assert (=> b!146233 m!176011))

(declare-fun m!176013 () Bool)

(assert (=> b!146245 m!176013))

(declare-fun m!176015 () Bool)

(assert (=> b!146245 m!176015))

(declare-fun m!176017 () Bool)

(assert (=> b!146245 m!176017))

(assert (=> b!146245 m!176015))

(assert (=> b!146245 m!176017))

(declare-fun m!176019 () Bool)

(assert (=> b!146245 m!176019))

(declare-fun m!176021 () Bool)

(assert (=> mapNonEmpty!4992 m!176021))

(declare-fun m!176023 () Bool)

(assert (=> b!146242 m!176023))

(declare-fun m!176025 () Bool)

(assert (=> b!146242 m!176025))

(declare-fun m!176027 () Bool)

(assert (=> b!146242 m!176027))

(assert (=> b!146242 m!176023))

(declare-fun m!176029 () Bool)

(assert (=> b!146242 m!176029))

(assert (=> b!146242 m!176013))

(assert (=> b!146242 m!176013))

(declare-fun m!176031 () Bool)

(assert (=> b!146242 m!176031))

(assert (=> b!146242 m!176025))

(declare-fun m!176033 () Bool)

(assert (=> b!146242 m!176033))

(declare-fun m!176035 () Bool)

(assert (=> b!146236 m!176035))

(declare-fun m!176037 () Bool)

(assert (=> b!146236 m!176037))

(assert (=> b!146236 m!176013))

(declare-fun m!176039 () Bool)

(assert (=> b!146236 m!176039))

(assert (=> b!146236 m!176013))

(assert (=> b!146236 m!176013))

(declare-fun m!176041 () Bool)

(assert (=> b!146236 m!176041))

(assert (=> b!146236 m!176013))

(declare-fun m!176043 () Bool)

(assert (=> b!146236 m!176043))

(assert (=> b!146246 m!176013))

(assert (=> b!146246 m!176013))

(declare-fun m!176045 () Bool)

(assert (=> b!146246 m!176045))

(assert (=> b!146246 m!176013))

(declare-fun m!176047 () Bool)

(assert (=> b!146246 m!176047))

(declare-fun m!176049 () Bool)

(assert (=> mapNonEmpty!4991 m!176049))

(declare-fun m!176051 () Bool)

(assert (=> b!146237 m!176051))

(declare-fun m!176053 () Bool)

(assert (=> b!146237 m!176053))

(declare-fun m!176055 () Bool)

(assert (=> b!146232 m!176055))

(declare-fun m!176057 () Bool)

(assert (=> b!146232 m!176057))

(declare-fun m!176059 () Bool)

(assert (=> start!15204 m!176059))

(declare-fun m!176061 () Bool)

(assert (=> b!146248 m!176061))

(check-sat (not b!146232) (not b!146233) (not b!146236) (not b_next!3113) tp_is_empty!2973 b_and!9149 (not b!146237) (not mapNonEmpty!4992) (not b!146245) (not b!146248) b_and!9147 (not mapNonEmpty!4991) (not start!15204) (not b_lambda!6549) (not b_next!3115) (not b!146242) (not b!146246))
(check-sat b_and!9147 b_and!9149 (not b_next!3113) (not b_next!3115))
