; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11102 () Bool)

(assert start!11102)

(declare-fun b!90592 () Bool)

(declare-fun b_free!2297 () Bool)

(declare-fun b_next!2297 () Bool)

(assert (=> b!90592 (= b_free!2297 (not b_next!2297))))

(declare-fun tp!9139 () Bool)

(declare-fun b_and!5459 () Bool)

(assert (=> b!90592 (= tp!9139 b_and!5459)))

(declare-fun b!90597 () Bool)

(declare-fun b_free!2299 () Bool)

(declare-fun b_next!2299 () Bool)

(assert (=> b!90597 (= b_free!2299 (not b_next!2299))))

(declare-fun tp!9141 () Bool)

(declare-fun b_and!5461 () Bool)

(assert (=> b!90597 (= tp!9141 b_and!5461)))

(declare-fun b!90587 () Bool)

(declare-fun e!59015 () Bool)

(declare-fun e!59018 () Bool)

(declare-fun mapRes!3514 () Bool)

(assert (=> b!90587 (= e!59015 (and e!59018 mapRes!3514))))

(declare-fun condMapEmpty!3514 () Bool)

(declare-datatypes ((V!3067 0))(
  ( (V!3068 (val!1327 Int)) )
))
(declare-datatypes ((array!4097 0))(
  ( (array!4098 (arr!1949 (Array (_ BitVec 32) (_ BitVec 64))) (size!2196 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!939 0))(
  ( (ValueCellFull!939 (v!2700 V!3067)) (EmptyCell!939) )
))
(declare-datatypes ((array!4099 0))(
  ( (array!4100 (arr!1950 (Array (_ BitVec 32) ValueCell!939)) (size!2197 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!786 0))(
  ( (LongMapFixedSize!787 (defaultEntry!2394 Int) (mask!6448 (_ BitVec 32)) (extraKeys!2225 (_ BitVec 32)) (zeroValue!2282 V!3067) (minValue!2282 V!3067) (_size!442 (_ BitVec 32)) (_keys!4074 array!4097) (_values!2377 array!4099) (_vacant!442 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!586 0))(
  ( (Cell!587 (v!2701 LongMapFixedSize!786)) )
))
(declare-datatypes ((LongMap!586 0))(
  ( (LongMap!587 (underlying!304 Cell!586)) )
))
(declare-fun thiss!992 () LongMap!586)

(declare-fun mapDefault!3513 () ValueCell!939)

(assert (=> b!90587 (= condMapEmpty!3514 (= (arr!1950 (_values!2377 (v!2701 (underlying!304 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!939)) mapDefault!3513)))))

(declare-fun b!90588 () Bool)

(declare-fun e!59010 () Bool)

(assert (=> b!90588 (= e!59010 (not true))))

(declare-datatypes ((tuple2!2230 0))(
  ( (tuple2!2231 (_1!1126 (_ BitVec 64)) (_2!1126 V!3067)) )
))
(declare-datatypes ((List!1537 0))(
  ( (Nil!1534) (Cons!1533 (h!2125 tuple2!2230) (t!5335 List!1537)) )
))
(declare-datatypes ((ListLongMap!1481 0))(
  ( (ListLongMap!1482 (toList!756 List!1537)) )
))
(declare-fun lt!43908 () ListLongMap!1481)

(declare-datatypes ((tuple2!2232 0))(
  ( (tuple2!2233 (_1!1127 Bool) (_2!1127 LongMapFixedSize!786)) )
))
(declare-fun lt!43892 () tuple2!2232)

(declare-fun map!1207 (LongMapFixedSize!786) ListLongMap!1481)

(assert (=> b!90588 (= lt!43908 (map!1207 (_2!1127 lt!43892)))))

(declare-fun lt!43904 () ListLongMap!1481)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!448 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3067 V!3067 (_ BitVec 32) Int) ListLongMap!1481)

(assert (=> b!90588 (= lt!43904 (getCurrentListMap!448 (_keys!4074 (v!2701 (underlying!304 thiss!992))) (_values!2377 (v!2701 (underlying!304 thiss!992))) (mask!6448 (v!2701 (underlying!304 thiss!992))) (extraKeys!2225 (v!2701 (underlying!304 thiss!992))) (zeroValue!2282 (v!2701 (underlying!304 thiss!992))) (minValue!2282 (v!2701 (underlying!304 thiss!992))) from!355 (defaultEntry!2394 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun lt!43899 () tuple2!2230)

(declare-fun lt!43894 () tuple2!2230)

(declare-fun lt!43911 () ListLongMap!1481)

(declare-fun lt!43900 () ListLongMap!1481)

(declare-fun +!118 (ListLongMap!1481 tuple2!2230) ListLongMap!1481)

(assert (=> b!90588 (= (+!118 lt!43900 lt!43894) (+!118 (+!118 lt!43911 lt!43894) lt!43899))))

(assert (=> b!90588 (= lt!43894 (tuple2!2231 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2282 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun lt!43909 () V!3067)

(declare-datatypes ((Unit!2687 0))(
  ( (Unit!2688) )
))
(declare-fun lt!43903 () Unit!2687)

(declare-fun addCommutativeForDiffKeys!37 (ListLongMap!1481 (_ BitVec 64) V!3067 (_ BitVec 64) V!3067) Unit!2687)

(assert (=> b!90588 (= lt!43903 (addCommutativeForDiffKeys!37 lt!43911 (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) lt!43909 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2282 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun lt!43907 () ListLongMap!1481)

(assert (=> b!90588 (= lt!43907 lt!43900)))

(assert (=> b!90588 (= lt!43900 (+!118 lt!43911 lt!43899))))

(declare-fun lt!43910 () ListLongMap!1481)

(declare-fun lt!43897 () tuple2!2230)

(assert (=> b!90588 (= lt!43907 (+!118 lt!43910 lt!43897))))

(declare-fun lt!43895 () ListLongMap!1481)

(assert (=> b!90588 (= lt!43911 (+!118 lt!43895 lt!43897))))

(assert (=> b!90588 (= lt!43897 (tuple2!2231 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2282 (v!2701 (underlying!304 thiss!992)))))))

(assert (=> b!90588 (= lt!43910 (+!118 lt!43895 lt!43899))))

(assert (=> b!90588 (= lt!43899 (tuple2!2231 (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) lt!43909))))

(declare-fun lt!43906 () Unit!2687)

(assert (=> b!90588 (= lt!43906 (addCommutativeForDiffKeys!37 lt!43895 (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) lt!43909 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2282 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!83 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3067 V!3067 (_ BitVec 32) Int) ListLongMap!1481)

(assert (=> b!90588 (= lt!43895 (getCurrentListMapNoExtraKeys!83 (_keys!4074 (v!2701 (underlying!304 thiss!992))) (_values!2377 (v!2701 (underlying!304 thiss!992))) (mask!6448 (v!2701 (underlying!304 thiss!992))) (extraKeys!2225 (v!2701 (underlying!304 thiss!992))) (zeroValue!2282 (v!2701 (underlying!304 thiss!992))) (minValue!2282 (v!2701 (underlying!304 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2394 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun b!90589 () Bool)

(declare-fun e!59009 () Bool)

(declare-fun tp_is_empty!2565 () Bool)

(assert (=> b!90589 (= e!59009 tp_is_empty!2565)))

(declare-fun b!90590 () Bool)

(declare-fun e!59014 () Bool)

(assert (=> b!90590 (= e!59014 e!59010)))

(declare-fun res!46218 () Bool)

(assert (=> b!90590 (=> (not res!46218) (not e!59010))))

(assert (=> b!90590 (= res!46218 (and (_1!1127 lt!43892) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43905 () Unit!2687)

(declare-fun e!59006 () Unit!2687)

(assert (=> b!90590 (= lt!43905 e!59006)))

(declare-fun lt!43896 () ListLongMap!1481)

(declare-fun c!15068 () Bool)

(declare-fun contains!768 (ListLongMap!1481 (_ BitVec 64)) Bool)

(assert (=> b!90590 (= c!15068 (contains!768 lt!43896 (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!786)

(declare-fun update!119 (LongMapFixedSize!786 (_ BitVec 64) V!3067) tuple2!2232)

(assert (=> b!90590 (= lt!43892 (update!119 newMap!16 (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) lt!43909))))

(declare-fun b!90591 () Bool)

(declare-fun e!59019 () Bool)

(declare-fun e!59017 () Bool)

(assert (=> b!90591 (= e!59019 e!59017)))

(declare-fun res!46216 () Bool)

(assert (=> b!90591 (=> (not res!46216) (not e!59017))))

(declare-fun lt!43901 () ListLongMap!1481)

(assert (=> b!90591 (= res!46216 (= lt!43901 lt!43896))))

(assert (=> b!90591 (= lt!43896 (map!1207 newMap!16))))

(assert (=> b!90591 (= lt!43901 (getCurrentListMap!448 (_keys!4074 (v!2701 (underlying!304 thiss!992))) (_values!2377 (v!2701 (underlying!304 thiss!992))) (mask!6448 (v!2701 (underlying!304 thiss!992))) (extraKeys!2225 (v!2701 (underlying!304 thiss!992))) (zeroValue!2282 (v!2701 (underlying!304 thiss!992))) (minValue!2282 (v!2701 (underlying!304 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2394 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun e!59008 () Bool)

(declare-fun array_inv!1205 (array!4097) Bool)

(declare-fun array_inv!1206 (array!4099) Bool)

(assert (=> b!90592 (= e!59008 (and tp!9139 tp_is_empty!2565 (array_inv!1205 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) (array_inv!1206 (_values!2377 (v!2701 (underlying!304 thiss!992)))) e!59015))))

(declare-fun b!90593 () Bool)

(declare-fun e!59011 () Bool)

(assert (=> b!90593 (= e!59011 e!59008)))

(declare-fun b!90594 () Bool)

(assert (=> b!90594 (= e!59017 e!59014)))

(declare-fun res!46215 () Bool)

(assert (=> b!90594 (=> (not res!46215) (not e!59014))))

(assert (=> b!90594 (= res!46215 (and (not (= (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1223 (ValueCell!939 V!3067) V!3067)

(declare-fun dynLambda!348 (Int (_ BitVec 64)) V!3067)

(assert (=> b!90594 (= lt!43909 (get!1223 (select (arr!1950 (_values!2377 (v!2701 (underlying!304 thiss!992)))) from!355) (dynLambda!348 (defaultEntry!2394 (v!2701 (underlying!304 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90595 () Bool)

(declare-fun res!46217 () Bool)

(assert (=> b!90595 (=> (not res!46217) (not e!59019))))

(declare-fun valid!340 (LongMapFixedSize!786) Bool)

(assert (=> b!90595 (= res!46217 (valid!340 newMap!16))))

(declare-fun mapNonEmpty!3513 () Bool)

(declare-fun tp!9142 () Bool)

(declare-fun e!59013 () Bool)

(assert (=> mapNonEmpty!3513 (= mapRes!3514 (and tp!9142 e!59013))))

(declare-fun mapKey!3513 () (_ BitVec 32))

(declare-fun mapRest!3514 () (Array (_ BitVec 32) ValueCell!939))

(declare-fun mapValue!3513 () ValueCell!939)

(assert (=> mapNonEmpty!3513 (= (arr!1950 (_values!2377 (v!2701 (underlying!304 thiss!992)))) (store mapRest!3514 mapKey!3513 mapValue!3513))))

(declare-fun mapNonEmpty!3514 () Bool)

(declare-fun mapRes!3513 () Bool)

(declare-fun tp!9140 () Bool)

(declare-fun e!59005 () Bool)

(assert (=> mapNonEmpty!3514 (= mapRes!3513 (and tp!9140 e!59005))))

(declare-fun mapRest!3513 () (Array (_ BitVec 32) ValueCell!939))

(declare-fun mapKey!3514 () (_ BitVec 32))

(declare-fun mapValue!3514 () ValueCell!939)

(assert (=> mapNonEmpty!3514 (= (arr!1950 (_values!2377 newMap!16)) (store mapRest!3513 mapKey!3514 mapValue!3514))))

(declare-fun mapIsEmpty!3513 () Bool)

(assert (=> mapIsEmpty!3513 mapRes!3513))

(declare-fun b!90596 () Bool)

(assert (=> b!90596 (= e!59013 tp_is_empty!2565)))

(declare-fun e!59020 () Bool)

(declare-fun e!59021 () Bool)

(assert (=> b!90597 (= e!59020 (and tp!9141 tp_is_empty!2565 (array_inv!1205 (_keys!4074 newMap!16)) (array_inv!1206 (_values!2377 newMap!16)) e!59021))))

(declare-fun b!90598 () Bool)

(assert (=> b!90598 (= e!59005 tp_is_empty!2565)))

(declare-fun b!90599 () Bool)

(assert (=> b!90599 (= e!59018 tp_is_empty!2565)))

(declare-fun b!90600 () Bool)

(assert (=> b!90600 (= e!59021 (and e!59009 mapRes!3513))))

(declare-fun condMapEmpty!3513 () Bool)

(declare-fun mapDefault!3514 () ValueCell!939)

(assert (=> b!90600 (= condMapEmpty!3513 (= (arr!1950 (_values!2377 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!939)) mapDefault!3514)))))

(declare-fun res!46212 () Bool)

(assert (=> start!11102 (=> (not res!46212) (not e!59019))))

(declare-fun valid!341 (LongMap!586) Bool)

(assert (=> start!11102 (= res!46212 (valid!341 thiss!992))))

(assert (=> start!11102 e!59019))

(declare-fun e!59007 () Bool)

(assert (=> start!11102 e!59007))

(assert (=> start!11102 true))

(assert (=> start!11102 e!59020))

(declare-fun b!90601 () Bool)

(declare-fun Unit!2689 () Unit!2687)

(assert (=> b!90601 (= e!59006 Unit!2689)))

(declare-fun b!90602 () Bool)

(declare-fun res!46214 () Bool)

(assert (=> b!90602 (=> (not res!46214) (not e!59019))))

(assert (=> b!90602 (= res!46214 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2196 (_keys!4074 (v!2701 (underlying!304 thiss!992)))))))))

(declare-fun b!90603 () Bool)

(assert (=> b!90603 (= e!59007 e!59011)))

(declare-fun mapIsEmpty!3514 () Bool)

(assert (=> mapIsEmpty!3514 mapRes!3514))

(declare-fun b!90604 () Bool)

(declare-fun Unit!2690 () Unit!2687)

(assert (=> b!90604 (= e!59006 Unit!2690)))

(declare-fun lt!43902 () Unit!2687)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!73 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3067 V!3067 (_ BitVec 64) (_ BitVec 32) Int) Unit!2687)

(assert (=> b!90604 (= lt!43902 (lemmaListMapContainsThenArrayContainsFrom!73 (_keys!4074 (v!2701 (underlying!304 thiss!992))) (_values!2377 (v!2701 (underlying!304 thiss!992))) (mask!6448 (v!2701 (underlying!304 thiss!992))) (extraKeys!2225 (v!2701 (underlying!304 thiss!992))) (zeroValue!2282 (v!2701 (underlying!304 thiss!992))) (minValue!2282 (v!2701 (underlying!304 thiss!992))) (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2394 (v!2701 (underlying!304 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90604 (arrayContainsKey!0 (_keys!4074 (v!2701 (underlying!304 thiss!992))) (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43898 () Unit!2687)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4097 (_ BitVec 32) (_ BitVec 32)) Unit!2687)

(assert (=> b!90604 (= lt!43898 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4074 (v!2701 (underlying!304 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1538 0))(
  ( (Nil!1535) (Cons!1534 (h!2126 (_ BitVec 64)) (t!5336 List!1538)) )
))
(declare-fun arrayNoDuplicates!0 (array!4097 (_ BitVec 32) List!1538) Bool)

(assert (=> b!90604 (arrayNoDuplicates!0 (_keys!4074 (v!2701 (underlying!304 thiss!992))) from!355 Nil!1535)))

(declare-fun lt!43893 () Unit!2687)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4097 (_ BitVec 32) (_ BitVec 64) List!1538) Unit!2687)

(assert (=> b!90604 (= lt!43893 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4074 (v!2701 (underlying!304 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) (Cons!1534 (select (arr!1949 (_keys!4074 (v!2701 (underlying!304 thiss!992)))) from!355) Nil!1535)))))

(assert (=> b!90604 false))

(declare-fun b!90605 () Bool)

(declare-fun res!46213 () Bool)

(assert (=> b!90605 (=> (not res!46213) (not e!59019))))

(assert (=> b!90605 (= res!46213 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6448 newMap!16)) (_size!442 (v!2701 (underlying!304 thiss!992)))))))

(assert (= (and start!11102 res!46212) b!90602))

(assert (= (and b!90602 res!46214) b!90595))

(assert (= (and b!90595 res!46217) b!90605))

(assert (= (and b!90605 res!46213) b!90591))

(assert (= (and b!90591 res!46216) b!90594))

(assert (= (and b!90594 res!46215) b!90590))

(assert (= (and b!90590 c!15068) b!90604))

(assert (= (and b!90590 (not c!15068)) b!90601))

(assert (= (and b!90590 res!46218) b!90588))

(assert (= (and b!90587 condMapEmpty!3514) mapIsEmpty!3514))

(assert (= (and b!90587 (not condMapEmpty!3514)) mapNonEmpty!3513))

(get-info :version)

(assert (= (and mapNonEmpty!3513 ((_ is ValueCellFull!939) mapValue!3513)) b!90596))

(assert (= (and b!90587 ((_ is ValueCellFull!939) mapDefault!3513)) b!90599))

(assert (= b!90592 b!90587))

(assert (= b!90593 b!90592))

(assert (= b!90603 b!90593))

(assert (= start!11102 b!90603))

(assert (= (and b!90600 condMapEmpty!3513) mapIsEmpty!3513))

(assert (= (and b!90600 (not condMapEmpty!3513)) mapNonEmpty!3514))

(assert (= (and mapNonEmpty!3514 ((_ is ValueCellFull!939) mapValue!3514)) b!90598))

(assert (= (and b!90600 ((_ is ValueCellFull!939) mapDefault!3514)) b!90589))

(assert (= b!90597 b!90600))

(assert (= start!11102 b!90597))

(declare-fun b_lambda!4001 () Bool)

(assert (=> (not b_lambda!4001) (not b!90594)))

(declare-fun t!5332 () Bool)

(declare-fun tb!1765 () Bool)

(assert (=> (and b!90592 (= (defaultEntry!2394 (v!2701 (underlying!304 thiss!992))) (defaultEntry!2394 (v!2701 (underlying!304 thiss!992)))) t!5332) tb!1765))

(declare-fun result!3027 () Bool)

(assert (=> tb!1765 (= result!3027 tp_is_empty!2565)))

(assert (=> b!90594 t!5332))

(declare-fun b_and!5463 () Bool)

(assert (= b_and!5459 (and (=> t!5332 result!3027) b_and!5463)))

(declare-fun t!5334 () Bool)

(declare-fun tb!1767 () Bool)

(assert (=> (and b!90597 (= (defaultEntry!2394 newMap!16) (defaultEntry!2394 (v!2701 (underlying!304 thiss!992)))) t!5334) tb!1767))

(declare-fun result!3031 () Bool)

(assert (= result!3031 result!3027))

(assert (=> b!90594 t!5334))

(declare-fun b_and!5465 () Bool)

(assert (= b_and!5461 (and (=> t!5334 result!3031) b_and!5465)))

(declare-fun m!97369 () Bool)

(assert (=> b!90590 m!97369))

(assert (=> b!90590 m!97369))

(declare-fun m!97371 () Bool)

(assert (=> b!90590 m!97371))

(assert (=> b!90590 m!97369))

(declare-fun m!97373 () Bool)

(assert (=> b!90590 m!97373))

(declare-fun m!97375 () Bool)

(assert (=> mapNonEmpty!3513 m!97375))

(assert (=> b!90588 m!97369))

(declare-fun m!97377 () Bool)

(assert (=> b!90588 m!97377))

(declare-fun m!97379 () Bool)

(assert (=> b!90588 m!97379))

(declare-fun m!97381 () Bool)

(assert (=> b!90588 m!97381))

(declare-fun m!97383 () Bool)

(assert (=> b!90588 m!97383))

(declare-fun m!97385 () Bool)

(assert (=> b!90588 m!97385))

(declare-fun m!97387 () Bool)

(assert (=> b!90588 m!97387))

(assert (=> b!90588 m!97383))

(assert (=> b!90588 m!97369))

(declare-fun m!97389 () Bool)

(assert (=> b!90588 m!97389))

(declare-fun m!97391 () Bool)

(assert (=> b!90588 m!97391))

(declare-fun m!97393 () Bool)

(assert (=> b!90588 m!97393))

(assert (=> b!90588 m!97369))

(declare-fun m!97395 () Bool)

(assert (=> b!90588 m!97395))

(declare-fun m!97397 () Bool)

(assert (=> b!90588 m!97397))

(declare-fun m!97399 () Bool)

(assert (=> b!90588 m!97399))

(declare-fun m!97401 () Bool)

(assert (=> b!90597 m!97401))

(declare-fun m!97403 () Bool)

(assert (=> b!90597 m!97403))

(declare-fun m!97405 () Bool)

(assert (=> start!11102 m!97405))

(declare-fun m!97407 () Bool)

(assert (=> b!90591 m!97407))

(declare-fun m!97409 () Bool)

(assert (=> b!90591 m!97409))

(declare-fun m!97411 () Bool)

(assert (=> mapNonEmpty!3514 m!97411))

(assert (=> b!90594 m!97369))

(declare-fun m!97413 () Bool)

(assert (=> b!90594 m!97413))

(declare-fun m!97415 () Bool)

(assert (=> b!90594 m!97415))

(assert (=> b!90594 m!97413))

(assert (=> b!90594 m!97415))

(declare-fun m!97417 () Bool)

(assert (=> b!90594 m!97417))

(declare-fun m!97419 () Bool)

(assert (=> b!90592 m!97419))

(declare-fun m!97421 () Bool)

(assert (=> b!90592 m!97421))

(declare-fun m!97423 () Bool)

(assert (=> b!90604 m!97423))

(declare-fun m!97425 () Bool)

(assert (=> b!90604 m!97425))

(assert (=> b!90604 m!97369))

(declare-fun m!97427 () Bool)

(assert (=> b!90604 m!97427))

(assert (=> b!90604 m!97369))

(assert (=> b!90604 m!97369))

(declare-fun m!97429 () Bool)

(assert (=> b!90604 m!97429))

(assert (=> b!90604 m!97369))

(declare-fun m!97431 () Bool)

(assert (=> b!90604 m!97431))

(declare-fun m!97433 () Bool)

(assert (=> b!90595 m!97433))

(check-sat tp_is_empty!2565 (not b!90588) (not b!90591) (not b!90594) (not b!90592) (not start!11102) (not b_next!2297) (not b_next!2299) (not b!90595) (not mapNonEmpty!3513) (not b!90604) (not b!90590) (not b_lambda!4001) (not mapNonEmpty!3514) b_and!5465 b_and!5463 (not b!90597))
(check-sat b_and!5463 b_and!5465 (not b_next!2297) (not b_next!2299))
