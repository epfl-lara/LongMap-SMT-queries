; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11064 () Bool)

(assert start!11064)

(declare-fun b!90005 () Bool)

(declare-fun b_free!2281 () Bool)

(declare-fun b_next!2281 () Bool)

(assert (=> b!90005 (= b_free!2281 (not b_next!2281))))

(declare-fun tp!9089 () Bool)

(declare-fun b_and!5409 () Bool)

(assert (=> b!90005 (= tp!9089 b_and!5409)))

(declare-fun b!89999 () Bool)

(declare-fun b_free!2283 () Bool)

(declare-fun b_next!2283 () Bool)

(assert (=> b!89999 (= b_free!2283 (not b_next!2283))))

(declare-fun tp!9087 () Bool)

(declare-fun b_and!5411 () Bool)

(assert (=> b!89999 (= tp!9087 b_and!5411)))

(declare-fun b!89996 () Bool)

(declare-fun res!45967 () Bool)

(declare-fun e!58597 () Bool)

(assert (=> b!89996 (=> (not res!45967) (not e!58597))))

(declare-datatypes ((V!3057 0))(
  ( (V!3058 (val!1323 Int)) )
))
(declare-datatypes ((array!4065 0))(
  ( (array!4066 (arr!1934 (Array (_ BitVec 32) (_ BitVec 64))) (size!2181 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!935 0))(
  ( (ValueCellFull!935 (v!2694 V!3057)) (EmptyCell!935) )
))
(declare-datatypes ((array!4067 0))(
  ( (array!4068 (arr!1935 (Array (_ BitVec 32) ValueCell!935)) (size!2182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!778 0))(
  ( (LongMapFixedSize!779 (defaultEntry!2387 Int) (mask!6439 (_ BitVec 32)) (extraKeys!2218 (_ BitVec 32)) (zeroValue!2275 V!3057) (minValue!2275 V!3057) (_size!438 (_ BitVec 32)) (_keys!4067 array!4065) (_values!2370 array!4067) (_vacant!438 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!778)

(declare-fun valid!346 (LongMapFixedSize!778) Bool)

(assert (=> b!89996 (= res!45967 (valid!346 newMap!16))))

(declare-fun b!89997 () Bool)

(declare-fun e!58601 () Bool)

(declare-fun e!58598 () Bool)

(assert (=> b!89997 (= e!58601 e!58598)))

(declare-fun res!45970 () Bool)

(assert (=> b!89997 (=> (not res!45970) (not e!58598))))

(declare-datatypes ((tuple2!2218 0))(
  ( (tuple2!2219 (_1!1120 Bool) (_2!1120 LongMapFixedSize!778)) )
))
(declare-fun lt!43382 () tuple2!2218)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!89997 (= res!45970 (and (_1!1120 lt!43382) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2664 0))(
  ( (Unit!2665) )
))
(declare-fun lt!43384 () Unit!2664)

(declare-fun e!58594 () Unit!2664)

(assert (=> b!89997 (= lt!43384 e!58594)))

(declare-datatypes ((Cell!584 0))(
  ( (Cell!585 (v!2695 LongMapFixedSize!778)) )
))
(declare-datatypes ((LongMap!584 0))(
  ( (LongMap!585 (underlying!303 Cell!584)) )
))
(declare-fun thiss!992 () LongMap!584)

(declare-datatypes ((tuple2!2220 0))(
  ( (tuple2!2221 (_1!1121 (_ BitVec 64)) (_2!1121 V!3057)) )
))
(declare-datatypes ((List!1523 0))(
  ( (Nil!1520) (Cons!1519 (h!2111 tuple2!2220) (t!5301 List!1523)) )
))
(declare-datatypes ((ListLongMap!1459 0))(
  ( (ListLongMap!1460 (toList!745 List!1523)) )
))
(declare-fun lt!43394 () ListLongMap!1459)

(declare-fun c!14964 () Bool)

(declare-fun contains!760 (ListLongMap!1459 (_ BitVec 64)) Bool)

(assert (=> b!89997 (= c!14964 (contains!760 lt!43394 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun lt!43391 () V!3057)

(declare-fun update!130 (LongMapFixedSize!778 (_ BitVec 64) V!3057) tuple2!2218)

(assert (=> b!89997 (= lt!43382 (update!130 newMap!16 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391))))

(declare-fun b!89998 () Bool)

(declare-fun Unit!2666 () Unit!2664)

(assert (=> b!89998 (= e!58594 Unit!2666)))

(declare-fun lt!43381 () Unit!2664)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!65 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) (_ BitVec 32) Int) Unit!2664)

(assert (=> b!89998 (= lt!43381 (lemmaListMapContainsThenArrayContainsFrom!65 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!89998 (arrayContainsKey!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43386 () Unit!2664)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4065 (_ BitVec 32) (_ BitVec 32)) Unit!2664)

(assert (=> b!89998 (= lt!43386 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1524 0))(
  ( (Nil!1521) (Cons!1520 (h!2112 (_ BitVec 64)) (t!5302 List!1524)) )
))
(declare-fun arrayNoDuplicates!0 (array!4065 (_ BitVec 32) List!1524) Bool)

(assert (=> b!89998 (arrayNoDuplicates!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) from!355 Nil!1521)))

(declare-fun lt!43383 () Unit!2664)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4065 (_ BitVec 32) (_ BitVec 64) List!1524) Unit!2664)

(assert (=> b!89998 (= lt!43383 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (Cons!1520 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) Nil!1521)))))

(assert (=> b!89998 false))

(declare-fun mapNonEmpty!3485 () Bool)

(declare-fun mapRes!3486 () Bool)

(declare-fun tp!9088 () Bool)

(declare-fun e!58591 () Bool)

(assert (=> mapNonEmpty!3485 (= mapRes!3486 (and tp!9088 e!58591))))

(declare-fun mapKey!3486 () (_ BitVec 32))

(declare-fun mapValue!3485 () ValueCell!935)

(declare-fun mapRest!3485 () (Array (_ BitVec 32) ValueCell!935))

(assert (=> mapNonEmpty!3485 (= (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) (store mapRest!3485 mapKey!3486 mapValue!3485))))

(declare-fun tp_is_empty!2557 () Bool)

(declare-fun e!58595 () Bool)

(declare-fun e!58604 () Bool)

(declare-fun array_inv!1189 (array!4065) Bool)

(declare-fun array_inv!1190 (array!4067) Bool)

(assert (=> b!89999 (= e!58595 (and tp!9087 tp_is_empty!2557 (array_inv!1189 (_keys!4067 newMap!16)) (array_inv!1190 (_values!2370 newMap!16)) e!58604))))

(declare-fun b!90000 () Bool)

(declare-fun e!58603 () Bool)

(declare-fun e!58592 () Bool)

(assert (=> b!90000 (= e!58603 e!58592)))

(declare-fun res!45972 () Bool)

(assert (=> start!11064 (=> (not res!45972) (not e!58597))))

(declare-fun valid!347 (LongMap!584) Bool)

(assert (=> start!11064 (= res!45972 (valid!347 thiss!992))))

(assert (=> start!11064 e!58597))

(assert (=> start!11064 e!58603))

(assert (=> start!11064 true))

(assert (=> start!11064 e!58595))

(declare-fun mapNonEmpty!3486 () Bool)

(declare-fun mapRes!3485 () Bool)

(declare-fun tp!9090 () Bool)

(declare-fun e!58596 () Bool)

(assert (=> mapNonEmpty!3486 (= mapRes!3485 (and tp!9090 e!58596))))

(declare-fun mapRest!3486 () (Array (_ BitVec 32) ValueCell!935))

(declare-fun mapKey!3485 () (_ BitVec 32))

(declare-fun mapValue!3486 () ValueCell!935)

(assert (=> mapNonEmpty!3486 (= (arr!1935 (_values!2370 newMap!16)) (store mapRest!3486 mapKey!3485 mapValue!3486))))

(declare-fun b!90001 () Bool)

(declare-fun e!58593 () Bool)

(declare-fun e!58605 () Bool)

(assert (=> b!90001 (= e!58593 (and e!58605 mapRes!3486))))

(declare-fun condMapEmpty!3485 () Bool)

(declare-fun mapDefault!3486 () ValueCell!935)

(assert (=> b!90001 (= condMapEmpty!3485 (= (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3486)))))

(declare-fun mapIsEmpty!3485 () Bool)

(assert (=> mapIsEmpty!3485 mapRes!3485))

(declare-fun b!90002 () Bool)

(declare-fun e!58590 () Bool)

(assert (=> b!90002 (= e!58592 e!58590)))

(declare-fun b!90003 () Bool)

(declare-fun e!58602 () Bool)

(assert (=> b!90003 (= e!58602 e!58601)))

(declare-fun res!45973 () Bool)

(assert (=> b!90003 (=> (not res!45973) (not e!58601))))

(assert (=> b!90003 (= res!45973 (and (not (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1226 (ValueCell!935 V!3057) V!3057)

(declare-fun dynLambda!349 (Int (_ BitVec 64)) V!3057)

(assert (=> b!90003 (= lt!43391 (get!1226 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) from!355) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3486 () Bool)

(assert (=> mapIsEmpty!3486 mapRes!3486))

(declare-fun b!90004 () Bool)

(assert (=> b!90004 (= e!58605 tp_is_empty!2557)))

(assert (=> b!90005 (= e!58590 (and tp!9089 tp_is_empty!2557 (array_inv!1189 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (array_inv!1190 (_values!2370 (v!2695 (underlying!303 thiss!992)))) e!58593))))

(declare-fun b!90006 () Bool)

(declare-fun res!45968 () Bool)

(assert (=> b!90006 (=> (not res!45968) (not e!58597))))

(assert (=> b!90006 (= res!45968 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992)))))))))

(declare-fun b!90007 () Bool)

(assert (=> b!90007 (= e!58597 e!58602)))

(declare-fun res!45969 () Bool)

(assert (=> b!90007 (=> (not res!45969) (not e!58602))))

(declare-fun lt!43393 () ListLongMap!1459)

(assert (=> b!90007 (= res!45969 (= lt!43393 lt!43394))))

(declare-fun map!1209 (LongMapFixedSize!778) ListLongMap!1459)

(assert (=> b!90007 (= lt!43394 (map!1209 newMap!16))))

(declare-fun getCurrentListMap!435 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) Int) ListLongMap!1459)

(assert (=> b!90007 (= lt!43393 (getCurrentListMap!435 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun b!90008 () Bool)

(assert (=> b!90008 (= e!58596 tp_is_empty!2557)))

(declare-fun b!90009 () Bool)

(declare-fun e!58606 () Bool)

(assert (=> b!90009 (= e!58604 (and e!58606 mapRes!3485))))

(declare-fun condMapEmpty!3486 () Bool)

(declare-fun mapDefault!3485 () ValueCell!935)

(assert (=> b!90009 (= condMapEmpty!3486 (= (arr!1935 (_values!2370 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3485)))))

(declare-fun b!90010 () Bool)

(assert (=> b!90010 (= e!58598 (not (valid!346 (_2!1120 lt!43382))))))

(declare-fun lt!43396 () ListLongMap!1459)

(declare-fun lt!43397 () tuple2!2220)

(declare-fun lt!43389 () tuple2!2220)

(declare-fun lt!43388 () ListLongMap!1459)

(declare-fun +!114 (ListLongMap!1459 tuple2!2220) ListLongMap!1459)

(assert (=> b!90010 (= (+!114 lt!43396 lt!43389) (+!114 (+!114 lt!43388 lt!43389) lt!43397))))

(assert (=> b!90010 (= lt!43389 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun lt!43380 () Unit!2664)

(declare-fun addCommutativeForDiffKeys!34 (ListLongMap!1459 (_ BitVec 64) V!3057 (_ BitVec 64) V!3057) Unit!2664)

(assert (=> b!90010 (= lt!43380 (addCommutativeForDiffKeys!34 lt!43388 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun lt!43385 () ListLongMap!1459)

(assert (=> b!90010 (= lt!43385 lt!43396)))

(assert (=> b!90010 (= lt!43396 (+!114 lt!43388 lt!43397))))

(declare-fun lt!43387 () ListLongMap!1459)

(declare-fun lt!43392 () tuple2!2220)

(assert (=> b!90010 (= lt!43385 (+!114 lt!43387 lt!43392))))

(declare-fun lt!43395 () ListLongMap!1459)

(assert (=> b!90010 (= lt!43388 (+!114 lt!43395 lt!43392))))

(assert (=> b!90010 (= lt!43392 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(assert (=> b!90010 (= lt!43387 (+!114 lt!43395 lt!43397))))

(assert (=> b!90010 (= lt!43397 (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391))))

(declare-fun lt!43390 () Unit!2664)

(assert (=> b!90010 (= lt!43390 (addCommutativeForDiffKeys!34 lt!43395 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!79 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) Int) ListLongMap!1459)

(assert (=> b!90010 (= lt!43395 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun b!90011 () Bool)

(assert (=> b!90011 (= e!58591 tp_is_empty!2557)))

(declare-fun b!90012 () Bool)

(declare-fun Unit!2667 () Unit!2664)

(assert (=> b!90012 (= e!58594 Unit!2667)))

(declare-fun b!90013 () Bool)

(assert (=> b!90013 (= e!58606 tp_is_empty!2557)))

(declare-fun b!90014 () Bool)

(declare-fun res!45971 () Bool)

(assert (=> b!90014 (=> (not res!45971) (not e!58597))))

(assert (=> b!90014 (= res!45971 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6439 newMap!16)) (_size!438 (v!2695 (underlying!303 thiss!992)))))))

(assert (= (and start!11064 res!45972) b!90006))

(assert (= (and b!90006 res!45968) b!89996))

(assert (= (and b!89996 res!45967) b!90014))

(assert (= (and b!90014 res!45971) b!90007))

(assert (= (and b!90007 res!45969) b!90003))

(assert (= (and b!90003 res!45973) b!89997))

(assert (= (and b!89997 c!14964) b!89998))

(assert (= (and b!89997 (not c!14964)) b!90012))

(assert (= (and b!89997 res!45970) b!90010))

(assert (= (and b!90001 condMapEmpty!3485) mapIsEmpty!3486))

(assert (= (and b!90001 (not condMapEmpty!3485)) mapNonEmpty!3485))

(get-info :version)

(assert (= (and mapNonEmpty!3485 ((_ is ValueCellFull!935) mapValue!3485)) b!90011))

(assert (= (and b!90001 ((_ is ValueCellFull!935) mapDefault!3486)) b!90004))

(assert (= b!90005 b!90001))

(assert (= b!90002 b!90005))

(assert (= b!90000 b!90002))

(assert (= start!11064 b!90000))

(assert (= (and b!90009 condMapEmpty!3486) mapIsEmpty!3485))

(assert (= (and b!90009 (not condMapEmpty!3486)) mapNonEmpty!3486))

(assert (= (and mapNonEmpty!3486 ((_ is ValueCellFull!935) mapValue!3486)) b!90008))

(assert (= (and b!90009 ((_ is ValueCellFull!935) mapDefault!3485)) b!90013))

(assert (= b!89999 b!90009))

(assert (= start!11064 b!89999))

(declare-fun b_lambda!3977 () Bool)

(assert (=> (not b_lambda!3977) (not b!90003)))

(declare-fun t!5298 () Bool)

(declare-fun tb!1745 () Bool)

(assert (=> (and b!90005 (= (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))) t!5298) tb!1745))

(declare-fun result!2997 () Bool)

(assert (=> tb!1745 (= result!2997 tp_is_empty!2557)))

(assert (=> b!90003 t!5298))

(declare-fun b_and!5413 () Bool)

(assert (= b_and!5409 (and (=> t!5298 result!2997) b_and!5413)))

(declare-fun t!5300 () Bool)

(declare-fun tb!1747 () Bool)

(assert (=> (and b!89999 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))) t!5300) tb!1747))

(declare-fun result!3001 () Bool)

(assert (= result!3001 result!2997))

(assert (=> b!90003 t!5300))

(declare-fun b_and!5415 () Bool)

(assert (= b_and!5411 (and (=> t!5300 result!3001) b_and!5415)))

(declare-fun m!96647 () Bool)

(assert (=> b!90005 m!96647))

(declare-fun m!96649 () Bool)

(assert (=> b!90005 m!96649))

(declare-fun m!96651 () Bool)

(assert (=> mapNonEmpty!3486 m!96651))

(declare-fun m!96653 () Bool)

(assert (=> b!89996 m!96653))

(declare-fun m!96655 () Bool)

(assert (=> b!90007 m!96655))

(declare-fun m!96657 () Bool)

(assert (=> b!90007 m!96657))

(declare-fun m!96659 () Bool)

(assert (=> b!89999 m!96659))

(declare-fun m!96661 () Bool)

(assert (=> b!89999 m!96661))

(declare-fun m!96663 () Bool)

(assert (=> mapNonEmpty!3485 m!96663))

(declare-fun m!96665 () Bool)

(assert (=> b!89998 m!96665))

(declare-fun m!96667 () Bool)

(assert (=> b!89998 m!96667))

(declare-fun m!96669 () Bool)

(assert (=> b!89998 m!96669))

(declare-fun m!96671 () Bool)

(assert (=> b!89998 m!96671))

(assert (=> b!89998 m!96669))

(assert (=> b!89998 m!96669))

(declare-fun m!96673 () Bool)

(assert (=> b!89998 m!96673))

(assert (=> b!89998 m!96669))

(declare-fun m!96675 () Bool)

(assert (=> b!89998 m!96675))

(declare-fun m!96677 () Bool)

(assert (=> start!11064 m!96677))

(assert (=> b!89997 m!96669))

(assert (=> b!89997 m!96669))

(declare-fun m!96679 () Bool)

(assert (=> b!89997 m!96679))

(assert (=> b!89997 m!96669))

(declare-fun m!96681 () Bool)

(assert (=> b!89997 m!96681))

(declare-fun m!96683 () Bool)

(assert (=> b!90010 m!96683))

(assert (=> b!90010 m!96669))

(declare-fun m!96685 () Bool)

(assert (=> b!90010 m!96685))

(declare-fun m!96687 () Bool)

(assert (=> b!90010 m!96687))

(declare-fun m!96689 () Bool)

(assert (=> b!90010 m!96689))

(declare-fun m!96691 () Bool)

(assert (=> b!90010 m!96691))

(assert (=> b!90010 m!96669))

(declare-fun m!96693 () Bool)

(assert (=> b!90010 m!96693))

(declare-fun m!96695 () Bool)

(assert (=> b!90010 m!96695))

(assert (=> b!90010 m!96669))

(declare-fun m!96697 () Bool)

(assert (=> b!90010 m!96697))

(declare-fun m!96699 () Bool)

(assert (=> b!90010 m!96699))

(declare-fun m!96701 () Bool)

(assert (=> b!90010 m!96701))

(assert (=> b!90010 m!96689))

(declare-fun m!96703 () Bool)

(assert (=> b!90010 m!96703))

(assert (=> b!90003 m!96669))

(declare-fun m!96705 () Bool)

(assert (=> b!90003 m!96705))

(declare-fun m!96707 () Bool)

(assert (=> b!90003 m!96707))

(assert (=> b!90003 m!96705))

(assert (=> b!90003 m!96707))

(declare-fun m!96709 () Bool)

(assert (=> b!90003 m!96709))

(check-sat (not b!89997) (not mapNonEmpty!3486) b_and!5415 (not b!90007) b_and!5413 (not b_next!2281) (not b!89999) (not b_next!2283) (not b_lambda!3977) (not b!90005) (not start!11064) (not b!90010) (not mapNonEmpty!3485) tp_is_empty!2557 (not b!90003) (not b!89998) (not b!89996))
(check-sat b_and!5413 b_and!5415 (not b_next!2281) (not b_next!2283))
(get-model)

(declare-fun b_lambda!3983 () Bool)

(assert (= b_lambda!3977 (or (and b!90005 b_free!2281) (and b!89999 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))))) b_lambda!3983)))

(check-sat (not b!90005) (not b!89997) (not mapNonEmpty!3486) b_and!5415 (not b_lambda!3983) (not b!90007) b_and!5413 (not b_next!2281) (not b!89999) (not b_next!2283) (not start!11064) (not b!90010) (not mapNonEmpty!3485) tp_is_empty!2557 (not b!90003) (not b!89998) (not b!89996))
(check-sat b_and!5413 b_and!5415 (not b_next!2281) (not b_next!2283))
(get-model)

(declare-fun d!23979 () Bool)

(assert (=> d!23979 (= (valid!347 thiss!992) (valid!346 (v!2695 (underlying!303 thiss!992))))))

(declare-fun bs!3779 () Bool)

(assert (= bs!3779 d!23979))

(declare-fun m!96839 () Bool)

(assert (=> bs!3779 m!96839))

(assert (=> start!11064 d!23979))

(declare-fun d!23981 () Bool)

(assert (=> d!23981 (= (array_inv!1189 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvsge (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90005 d!23981))

(declare-fun d!23983 () Bool)

(assert (=> d!23983 (= (array_inv!1190 (_values!2370 (v!2695 (underlying!303 thiss!992)))) (bvsge (size!2182 (_values!2370 (v!2695 (underlying!303 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90005 d!23983))

(declare-fun d!23985 () Bool)

(declare-fun e!58711 () Bool)

(assert (=> d!23985 e!58711))

(declare-fun res!46020 () Bool)

(assert (=> d!23985 (=> (not res!46020) (not e!58711))))

(declare-fun lt!43515 () ListLongMap!1459)

(assert (=> d!23985 (= res!46020 (contains!760 lt!43515 (_1!1121 lt!43389)))))

(declare-fun lt!43516 () List!1523)

(assert (=> d!23985 (= lt!43515 (ListLongMap!1460 lt!43516))))

(declare-fun lt!43514 () Unit!2664)

(declare-fun lt!43517 () Unit!2664)

(assert (=> d!23985 (= lt!43514 lt!43517)))

(declare-datatypes ((Option!150 0))(
  ( (Some!149 (v!2701 V!3057)) (None!148) )
))
(declare-fun getValueByKey!144 (List!1523 (_ BitVec 64)) Option!150)

(assert (=> d!23985 (= (getValueByKey!144 lt!43516 (_1!1121 lt!43389)) (Some!149 (_2!1121 lt!43389)))))

(declare-fun lemmaContainsTupThenGetReturnValue!61 (List!1523 (_ BitVec 64) V!3057) Unit!2664)

(assert (=> d!23985 (= lt!43517 (lemmaContainsTupThenGetReturnValue!61 lt!43516 (_1!1121 lt!43389) (_2!1121 lt!43389)))))

(declare-fun insertStrictlySorted!64 (List!1523 (_ BitVec 64) V!3057) List!1523)

(assert (=> d!23985 (= lt!43516 (insertStrictlySorted!64 (toList!745 lt!43396) (_1!1121 lt!43389) (_2!1121 lt!43389)))))

(assert (=> d!23985 (= (+!114 lt!43396 lt!43389) lt!43515)))

(declare-fun b!90139 () Bool)

(declare-fun res!46021 () Bool)

(assert (=> b!90139 (=> (not res!46021) (not e!58711))))

(assert (=> b!90139 (= res!46021 (= (getValueByKey!144 (toList!745 lt!43515) (_1!1121 lt!43389)) (Some!149 (_2!1121 lt!43389))))))

(declare-fun b!90140 () Bool)

(declare-fun contains!761 (List!1523 tuple2!2220) Bool)

(assert (=> b!90140 (= e!58711 (contains!761 (toList!745 lt!43515) lt!43389))))

(assert (= (and d!23985 res!46020) b!90139))

(assert (= (and b!90139 res!46021) b!90140))

(declare-fun m!96841 () Bool)

(assert (=> d!23985 m!96841))

(declare-fun m!96843 () Bool)

(assert (=> d!23985 m!96843))

(declare-fun m!96845 () Bool)

(assert (=> d!23985 m!96845))

(declare-fun m!96847 () Bool)

(assert (=> d!23985 m!96847))

(declare-fun m!96849 () Bool)

(assert (=> b!90139 m!96849))

(declare-fun m!96851 () Bool)

(assert (=> b!90140 m!96851))

(assert (=> b!90010 d!23985))

(declare-fun b!90165 () Bool)

(declare-fun e!58730 () Bool)

(declare-fun e!58731 () Bool)

(assert (=> b!90165 (= e!58730 e!58731)))

(declare-fun c!14982 () Bool)

(assert (=> b!90165 (= c!14982 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun lt!43532 () ListLongMap!1459)

(declare-fun b!90166 () Bool)

(assert (=> b!90166 (= e!58731 (= lt!43532 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun b!90167 () Bool)

(declare-fun e!58726 () ListLongMap!1459)

(declare-fun call!8710 () ListLongMap!1459)

(assert (=> b!90167 (= e!58726 call!8710)))

(declare-fun b!90168 () Bool)

(declare-fun e!58728 () ListLongMap!1459)

(assert (=> b!90168 (= e!58728 (ListLongMap!1460 Nil!1520))))

(declare-fun b!90169 () Bool)

(declare-fun res!46030 () Bool)

(declare-fun e!58732 () Bool)

(assert (=> b!90169 (=> (not res!46030) (not e!58732))))

(assert (=> b!90169 (= res!46030 (not (contains!760 lt!43532 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90170 () Bool)

(declare-fun lt!43536 () Unit!2664)

(declare-fun lt!43533 () Unit!2664)

(assert (=> b!90170 (= lt!43536 lt!43533)))

(declare-fun lt!43534 () (_ BitVec 64))

(declare-fun lt!43535 () V!3057)

(declare-fun lt!43537 () (_ BitVec 64))

(declare-fun lt!43538 () ListLongMap!1459)

(assert (=> b!90170 (not (contains!760 (+!114 lt!43538 (tuple2!2221 lt!43537 lt!43535)) lt!43534))))

(declare-fun addStillNotContains!36 (ListLongMap!1459 (_ BitVec 64) V!3057 (_ BitVec 64)) Unit!2664)

(assert (=> b!90170 (= lt!43533 (addStillNotContains!36 lt!43538 lt!43537 lt!43535 lt!43534))))

(assert (=> b!90170 (= lt!43534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!90170 (= lt!43535 (get!1226 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90170 (= lt!43537 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!90170 (= lt!43538 call!8710)))

(assert (=> b!90170 (= e!58726 (+!114 call!8710 (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1226 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!90171 () Bool)

(assert (=> b!90171 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(assert (=> b!90171 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2182 (_values!2370 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun e!58729 () Bool)

(declare-fun apply!85 (ListLongMap!1459 (_ BitVec 64)) V!3057)

(assert (=> b!90171 (= e!58729 (= (apply!85 lt!43532 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1226 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!23987 () Bool)

(assert (=> d!23987 e!58732))

(declare-fun res!46032 () Bool)

(assert (=> d!23987 (=> (not res!46032) (not e!58732))))

(assert (=> d!23987 (= res!46032 (not (contains!760 lt!43532 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23987 (= lt!43532 e!58728)))

(declare-fun c!14981 () Bool)

(assert (=> d!23987 (= c!14981 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!23987 (validMask!0 (mask!6439 (v!2695 (underlying!303 thiss!992))))))

(assert (=> d!23987 (= (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))) lt!43532)))

(declare-fun b!90172 () Bool)

(assert (=> b!90172 (= e!58730 e!58729)))

(assert (=> b!90172 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun res!46033 () Bool)

(assert (=> b!90172 (= res!46033 (contains!760 lt!43532 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90172 (=> (not res!46033) (not e!58729))))

(declare-fun bm!8707 () Bool)

(assert (=> bm!8707 (= call!8710 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun b!90173 () Bool)

(assert (=> b!90173 (= e!58728 e!58726)))

(declare-fun c!14980 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!90173 (= c!14980 (validKeyInArray!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90174 () Bool)

(assert (=> b!90174 (= e!58732 e!58730)))

(declare-fun c!14979 () Bool)

(declare-fun e!58727 () Bool)

(assert (=> b!90174 (= c!14979 e!58727)))

(declare-fun res!46031 () Bool)

(assert (=> b!90174 (=> (not res!46031) (not e!58727))))

(assert (=> b!90174 (= res!46031 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun b!90175 () Bool)

(assert (=> b!90175 (= e!58727 (validKeyInArray!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90175 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!90176 () Bool)

(declare-fun isEmpty!350 (ListLongMap!1459) Bool)

(assert (=> b!90176 (= e!58731 (isEmpty!350 lt!43532))))

(assert (= (and d!23987 c!14981) b!90168))

(assert (= (and d!23987 (not c!14981)) b!90173))

(assert (= (and b!90173 c!14980) b!90170))

(assert (= (and b!90173 (not c!14980)) b!90167))

(assert (= (or b!90170 b!90167) bm!8707))

(assert (= (and d!23987 res!46032) b!90169))

(assert (= (and b!90169 res!46030) b!90174))

(assert (= (and b!90174 res!46031) b!90175))

(assert (= (and b!90174 c!14979) b!90172))

(assert (= (and b!90174 (not c!14979)) b!90165))

(assert (= (and b!90172 res!46033) b!90171))

(assert (= (and b!90165 c!14982) b!90166))

(assert (= (and b!90165 (not c!14982)) b!90176))

(declare-fun b_lambda!3985 () Bool)

(assert (=> (not b_lambda!3985) (not b!90170)))

(assert (=> b!90170 t!5298))

(declare-fun b_and!5433 () Bool)

(assert (= b_and!5413 (and (=> t!5298 result!2997) b_and!5433)))

(assert (=> b!90170 t!5300))

(declare-fun b_and!5435 () Bool)

(assert (= b_and!5415 (and (=> t!5300 result!3001) b_and!5435)))

(declare-fun b_lambda!3987 () Bool)

(assert (=> (not b_lambda!3987) (not b!90171)))

(assert (=> b!90171 t!5298))

(declare-fun b_and!5437 () Bool)

(assert (= b_and!5433 (and (=> t!5298 result!2997) b_and!5437)))

(assert (=> b!90171 t!5300))

(declare-fun b_and!5439 () Bool)

(assert (= b_and!5435 (and (=> t!5300 result!3001) b_and!5439)))

(assert (=> b!90170 m!96707))

(declare-fun m!96853 () Bool)

(assert (=> b!90170 m!96853))

(declare-fun m!96855 () Bool)

(assert (=> b!90170 m!96855))

(assert (=> b!90170 m!96855))

(assert (=> b!90170 m!96707))

(declare-fun m!96857 () Bool)

(assert (=> b!90170 m!96857))

(declare-fun m!96859 () Bool)

(assert (=> b!90170 m!96859))

(declare-fun m!96861 () Bool)

(assert (=> b!90170 m!96861))

(assert (=> b!90170 m!96853))

(declare-fun m!96863 () Bool)

(assert (=> b!90170 m!96863))

(declare-fun m!96865 () Bool)

(assert (=> b!90170 m!96865))

(declare-fun m!96867 () Bool)

(assert (=> b!90176 m!96867))

(assert (=> b!90172 m!96859))

(assert (=> b!90172 m!96859))

(declare-fun m!96869 () Bool)

(assert (=> b!90172 m!96869))

(declare-fun m!96871 () Bool)

(assert (=> b!90169 m!96871))

(declare-fun m!96873 () Bool)

(assert (=> bm!8707 m!96873))

(assert (=> b!90166 m!96873))

(assert (=> b!90173 m!96859))

(assert (=> b!90173 m!96859))

(declare-fun m!96875 () Bool)

(assert (=> b!90173 m!96875))

(assert (=> b!90175 m!96859))

(assert (=> b!90175 m!96859))

(assert (=> b!90175 m!96875))

(assert (=> b!90171 m!96707))

(assert (=> b!90171 m!96855))

(assert (=> b!90171 m!96855))

(assert (=> b!90171 m!96707))

(assert (=> b!90171 m!96857))

(assert (=> b!90171 m!96859))

(declare-fun m!96877 () Bool)

(assert (=> b!90171 m!96877))

(assert (=> b!90171 m!96859))

(declare-fun m!96879 () Bool)

(assert (=> d!23987 m!96879))

(declare-fun m!96881 () Bool)

(assert (=> d!23987 m!96881))

(assert (=> b!90010 d!23987))

(declare-fun d!23989 () Bool)

(declare-fun e!58733 () Bool)

(assert (=> d!23989 e!58733))

(declare-fun res!46034 () Bool)

(assert (=> d!23989 (=> (not res!46034) (not e!58733))))

(declare-fun lt!43540 () ListLongMap!1459)

(assert (=> d!23989 (= res!46034 (contains!760 lt!43540 (_1!1121 lt!43397)))))

(declare-fun lt!43541 () List!1523)

(assert (=> d!23989 (= lt!43540 (ListLongMap!1460 lt!43541))))

(declare-fun lt!43539 () Unit!2664)

(declare-fun lt!43542 () Unit!2664)

(assert (=> d!23989 (= lt!43539 lt!43542)))

(assert (=> d!23989 (= (getValueByKey!144 lt!43541 (_1!1121 lt!43397)) (Some!149 (_2!1121 lt!43397)))))

(assert (=> d!23989 (= lt!43542 (lemmaContainsTupThenGetReturnValue!61 lt!43541 (_1!1121 lt!43397) (_2!1121 lt!43397)))))

(assert (=> d!23989 (= lt!43541 (insertStrictlySorted!64 (toList!745 (+!114 lt!43388 lt!43389)) (_1!1121 lt!43397) (_2!1121 lt!43397)))))

(assert (=> d!23989 (= (+!114 (+!114 lt!43388 lt!43389) lt!43397) lt!43540)))

(declare-fun b!90177 () Bool)

(declare-fun res!46035 () Bool)

(assert (=> b!90177 (=> (not res!46035) (not e!58733))))

(assert (=> b!90177 (= res!46035 (= (getValueByKey!144 (toList!745 lt!43540) (_1!1121 lt!43397)) (Some!149 (_2!1121 lt!43397))))))

(declare-fun b!90178 () Bool)

(assert (=> b!90178 (= e!58733 (contains!761 (toList!745 lt!43540) lt!43397))))

(assert (= (and d!23989 res!46034) b!90177))

(assert (= (and b!90177 res!46035) b!90178))

(declare-fun m!96883 () Bool)

(assert (=> d!23989 m!96883))

(declare-fun m!96885 () Bool)

(assert (=> d!23989 m!96885))

(declare-fun m!96887 () Bool)

(assert (=> d!23989 m!96887))

(declare-fun m!96889 () Bool)

(assert (=> d!23989 m!96889))

(declare-fun m!96891 () Bool)

(assert (=> b!90177 m!96891))

(declare-fun m!96893 () Bool)

(assert (=> b!90178 m!96893))

(assert (=> b!90010 d!23989))

(declare-fun d!23991 () Bool)

(declare-fun res!46042 () Bool)

(declare-fun e!58736 () Bool)

(assert (=> d!23991 (=> (not res!46042) (not e!58736))))

(declare-fun simpleValid!61 (LongMapFixedSize!778) Bool)

(assert (=> d!23991 (= res!46042 (simpleValid!61 (_2!1120 lt!43382)))))

(assert (=> d!23991 (= (valid!346 (_2!1120 lt!43382)) e!58736)))

(declare-fun b!90185 () Bool)

(declare-fun res!46043 () Bool)

(assert (=> b!90185 (=> (not res!46043) (not e!58736))))

(declare-fun arrayCountValidKeys!0 (array!4065 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!90185 (= res!46043 (= (arrayCountValidKeys!0 (_keys!4067 (_2!1120 lt!43382)) #b00000000000000000000000000000000 (size!2181 (_keys!4067 (_2!1120 lt!43382)))) (_size!438 (_2!1120 lt!43382))))))

(declare-fun b!90186 () Bool)

(declare-fun res!46044 () Bool)

(assert (=> b!90186 (=> (not res!46044) (not e!58736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4065 (_ BitVec 32)) Bool)

(assert (=> b!90186 (= res!46044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4067 (_2!1120 lt!43382)) (mask!6439 (_2!1120 lt!43382))))))

(declare-fun b!90187 () Bool)

(assert (=> b!90187 (= e!58736 (arrayNoDuplicates!0 (_keys!4067 (_2!1120 lt!43382)) #b00000000000000000000000000000000 Nil!1521))))

(assert (= (and d!23991 res!46042) b!90185))

(assert (= (and b!90185 res!46043) b!90186))

(assert (= (and b!90186 res!46044) b!90187))

(declare-fun m!96895 () Bool)

(assert (=> d!23991 m!96895))

(declare-fun m!96897 () Bool)

(assert (=> b!90185 m!96897))

(declare-fun m!96899 () Bool)

(assert (=> b!90186 m!96899))

(declare-fun m!96901 () Bool)

(assert (=> b!90187 m!96901))

(assert (=> b!90010 d!23991))

(declare-fun d!23993 () Bool)

(assert (=> d!23993 (= (+!114 (+!114 lt!43395 (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391)) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992))))) (+!114 (+!114 lt!43395 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992))))) (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391)))))

(declare-fun lt!43545 () Unit!2664)

(declare-fun choose!546 (ListLongMap!1459 (_ BitVec 64) V!3057 (_ BitVec 64) V!3057) Unit!2664)

(assert (=> d!23993 (= lt!43545 (choose!546 lt!43395 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(assert (=> d!23993 (not (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23993 (= (addCommutativeForDiffKeys!34 lt!43395 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992)))) lt!43545)))

(declare-fun bs!3780 () Bool)

(assert (= bs!3780 d!23993))

(assert (=> bs!3780 m!96669))

(declare-fun m!96903 () Bool)

(assert (=> bs!3780 m!96903))

(declare-fun m!96905 () Bool)

(assert (=> bs!3780 m!96905))

(declare-fun m!96907 () Bool)

(assert (=> bs!3780 m!96907))

(assert (=> bs!3780 m!96905))

(declare-fun m!96909 () Bool)

(assert (=> bs!3780 m!96909))

(assert (=> bs!3780 m!96909))

(declare-fun m!96911 () Bool)

(assert (=> bs!3780 m!96911))

(assert (=> b!90010 d!23993))

(declare-fun d!23995 () Bool)

(declare-fun e!58737 () Bool)

(assert (=> d!23995 e!58737))

(declare-fun res!46045 () Bool)

(assert (=> d!23995 (=> (not res!46045) (not e!58737))))

(declare-fun lt!43547 () ListLongMap!1459)

(assert (=> d!23995 (= res!46045 (contains!760 lt!43547 (_1!1121 lt!43392)))))

(declare-fun lt!43548 () List!1523)

(assert (=> d!23995 (= lt!43547 (ListLongMap!1460 lt!43548))))

(declare-fun lt!43546 () Unit!2664)

(declare-fun lt!43549 () Unit!2664)

(assert (=> d!23995 (= lt!43546 lt!43549)))

(assert (=> d!23995 (= (getValueByKey!144 lt!43548 (_1!1121 lt!43392)) (Some!149 (_2!1121 lt!43392)))))

(assert (=> d!23995 (= lt!43549 (lemmaContainsTupThenGetReturnValue!61 lt!43548 (_1!1121 lt!43392) (_2!1121 lt!43392)))))

(assert (=> d!23995 (= lt!43548 (insertStrictlySorted!64 (toList!745 lt!43387) (_1!1121 lt!43392) (_2!1121 lt!43392)))))

(assert (=> d!23995 (= (+!114 lt!43387 lt!43392) lt!43547)))

(declare-fun b!90188 () Bool)

(declare-fun res!46046 () Bool)

(assert (=> b!90188 (=> (not res!46046) (not e!58737))))

(assert (=> b!90188 (= res!46046 (= (getValueByKey!144 (toList!745 lt!43547) (_1!1121 lt!43392)) (Some!149 (_2!1121 lt!43392))))))

(declare-fun b!90189 () Bool)

(assert (=> b!90189 (= e!58737 (contains!761 (toList!745 lt!43547) lt!43392))))

(assert (= (and d!23995 res!46045) b!90188))

(assert (= (and b!90188 res!46046) b!90189))

(declare-fun m!96913 () Bool)

(assert (=> d!23995 m!96913))

(declare-fun m!96915 () Bool)

(assert (=> d!23995 m!96915))

(declare-fun m!96917 () Bool)

(assert (=> d!23995 m!96917))

(declare-fun m!96919 () Bool)

(assert (=> d!23995 m!96919))

(declare-fun m!96921 () Bool)

(assert (=> b!90188 m!96921))

(declare-fun m!96923 () Bool)

(assert (=> b!90189 m!96923))

(assert (=> b!90010 d!23995))

(declare-fun d!23997 () Bool)

(declare-fun e!58738 () Bool)

(assert (=> d!23997 e!58738))

(declare-fun res!46047 () Bool)

(assert (=> d!23997 (=> (not res!46047) (not e!58738))))

(declare-fun lt!43551 () ListLongMap!1459)

(assert (=> d!23997 (= res!46047 (contains!760 lt!43551 (_1!1121 lt!43389)))))

(declare-fun lt!43552 () List!1523)

(assert (=> d!23997 (= lt!43551 (ListLongMap!1460 lt!43552))))

(declare-fun lt!43550 () Unit!2664)

(declare-fun lt!43553 () Unit!2664)

(assert (=> d!23997 (= lt!43550 lt!43553)))

(assert (=> d!23997 (= (getValueByKey!144 lt!43552 (_1!1121 lt!43389)) (Some!149 (_2!1121 lt!43389)))))

(assert (=> d!23997 (= lt!43553 (lemmaContainsTupThenGetReturnValue!61 lt!43552 (_1!1121 lt!43389) (_2!1121 lt!43389)))))

(assert (=> d!23997 (= lt!43552 (insertStrictlySorted!64 (toList!745 lt!43388) (_1!1121 lt!43389) (_2!1121 lt!43389)))))

(assert (=> d!23997 (= (+!114 lt!43388 lt!43389) lt!43551)))

(declare-fun b!90190 () Bool)

(declare-fun res!46048 () Bool)

(assert (=> b!90190 (=> (not res!46048) (not e!58738))))

(assert (=> b!90190 (= res!46048 (= (getValueByKey!144 (toList!745 lt!43551) (_1!1121 lt!43389)) (Some!149 (_2!1121 lt!43389))))))

(declare-fun b!90191 () Bool)

(assert (=> b!90191 (= e!58738 (contains!761 (toList!745 lt!43551) lt!43389))))

(assert (= (and d!23997 res!46047) b!90190))

(assert (= (and b!90190 res!46048) b!90191))

(declare-fun m!96925 () Bool)

(assert (=> d!23997 m!96925))

(declare-fun m!96927 () Bool)

(assert (=> d!23997 m!96927))

(declare-fun m!96929 () Bool)

(assert (=> d!23997 m!96929))

(declare-fun m!96931 () Bool)

(assert (=> d!23997 m!96931))

(declare-fun m!96933 () Bool)

(assert (=> b!90190 m!96933))

(declare-fun m!96935 () Bool)

(assert (=> b!90191 m!96935))

(assert (=> b!90010 d!23997))

(declare-fun d!23999 () Bool)

(assert (=> d!23999 (= (+!114 (+!114 lt!43388 (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992))))) (+!114 (+!114 lt!43388 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992))))) (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391)))))

(declare-fun lt!43554 () Unit!2664)

(assert (=> d!23999 (= lt!43554 (choose!546 lt!43388 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(assert (=> d!23999 (not (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23999 (= (addCommutativeForDiffKeys!34 lt!43388 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992)))) lt!43554)))

(declare-fun bs!3781 () Bool)

(assert (= bs!3781 d!23999))

(assert (=> bs!3781 m!96669))

(declare-fun m!96937 () Bool)

(assert (=> bs!3781 m!96937))

(declare-fun m!96939 () Bool)

(assert (=> bs!3781 m!96939))

(declare-fun m!96941 () Bool)

(assert (=> bs!3781 m!96941))

(assert (=> bs!3781 m!96939))

(declare-fun m!96943 () Bool)

(assert (=> bs!3781 m!96943))

(assert (=> bs!3781 m!96943))

(declare-fun m!96945 () Bool)

(assert (=> bs!3781 m!96945))

(assert (=> b!90010 d!23999))

(declare-fun d!24001 () Bool)

(declare-fun e!58739 () Bool)

(assert (=> d!24001 e!58739))

(declare-fun res!46049 () Bool)

(assert (=> d!24001 (=> (not res!46049) (not e!58739))))

(declare-fun lt!43556 () ListLongMap!1459)

(assert (=> d!24001 (= res!46049 (contains!760 lt!43556 (_1!1121 lt!43392)))))

(declare-fun lt!43557 () List!1523)

(assert (=> d!24001 (= lt!43556 (ListLongMap!1460 lt!43557))))

(declare-fun lt!43555 () Unit!2664)

(declare-fun lt!43558 () Unit!2664)

(assert (=> d!24001 (= lt!43555 lt!43558)))

(assert (=> d!24001 (= (getValueByKey!144 lt!43557 (_1!1121 lt!43392)) (Some!149 (_2!1121 lt!43392)))))

(assert (=> d!24001 (= lt!43558 (lemmaContainsTupThenGetReturnValue!61 lt!43557 (_1!1121 lt!43392) (_2!1121 lt!43392)))))

(assert (=> d!24001 (= lt!43557 (insertStrictlySorted!64 (toList!745 lt!43395) (_1!1121 lt!43392) (_2!1121 lt!43392)))))

(assert (=> d!24001 (= (+!114 lt!43395 lt!43392) lt!43556)))

(declare-fun b!90192 () Bool)

(declare-fun res!46050 () Bool)

(assert (=> b!90192 (=> (not res!46050) (not e!58739))))

(assert (=> b!90192 (= res!46050 (= (getValueByKey!144 (toList!745 lt!43556) (_1!1121 lt!43392)) (Some!149 (_2!1121 lt!43392))))))

(declare-fun b!90193 () Bool)

(assert (=> b!90193 (= e!58739 (contains!761 (toList!745 lt!43556) lt!43392))))

(assert (= (and d!24001 res!46049) b!90192))

(assert (= (and b!90192 res!46050) b!90193))

(declare-fun m!96947 () Bool)

(assert (=> d!24001 m!96947))

(declare-fun m!96949 () Bool)

(assert (=> d!24001 m!96949))

(declare-fun m!96951 () Bool)

(assert (=> d!24001 m!96951))

(declare-fun m!96953 () Bool)

(assert (=> d!24001 m!96953))

(declare-fun m!96955 () Bool)

(assert (=> b!90192 m!96955))

(declare-fun m!96957 () Bool)

(assert (=> b!90193 m!96957))

(assert (=> b!90010 d!24001))

(declare-fun d!24003 () Bool)

(declare-fun e!58740 () Bool)

(assert (=> d!24003 e!58740))

(declare-fun res!46051 () Bool)

(assert (=> d!24003 (=> (not res!46051) (not e!58740))))

(declare-fun lt!43560 () ListLongMap!1459)

(assert (=> d!24003 (= res!46051 (contains!760 lt!43560 (_1!1121 lt!43397)))))

(declare-fun lt!43561 () List!1523)

(assert (=> d!24003 (= lt!43560 (ListLongMap!1460 lt!43561))))

(declare-fun lt!43559 () Unit!2664)

(declare-fun lt!43562 () Unit!2664)

(assert (=> d!24003 (= lt!43559 lt!43562)))

(assert (=> d!24003 (= (getValueByKey!144 lt!43561 (_1!1121 lt!43397)) (Some!149 (_2!1121 lt!43397)))))

(assert (=> d!24003 (= lt!43562 (lemmaContainsTupThenGetReturnValue!61 lt!43561 (_1!1121 lt!43397) (_2!1121 lt!43397)))))

(assert (=> d!24003 (= lt!43561 (insertStrictlySorted!64 (toList!745 lt!43388) (_1!1121 lt!43397) (_2!1121 lt!43397)))))

(assert (=> d!24003 (= (+!114 lt!43388 lt!43397) lt!43560)))

(declare-fun b!90194 () Bool)

(declare-fun res!46052 () Bool)

(assert (=> b!90194 (=> (not res!46052) (not e!58740))))

(assert (=> b!90194 (= res!46052 (= (getValueByKey!144 (toList!745 lt!43560) (_1!1121 lt!43397)) (Some!149 (_2!1121 lt!43397))))))

(declare-fun b!90195 () Bool)

(assert (=> b!90195 (= e!58740 (contains!761 (toList!745 lt!43560) lt!43397))))

(assert (= (and d!24003 res!46051) b!90194))

(assert (= (and b!90194 res!46052) b!90195))

(declare-fun m!96959 () Bool)

(assert (=> d!24003 m!96959))

(declare-fun m!96961 () Bool)

(assert (=> d!24003 m!96961))

(declare-fun m!96963 () Bool)

(assert (=> d!24003 m!96963))

(declare-fun m!96965 () Bool)

(assert (=> d!24003 m!96965))

(declare-fun m!96967 () Bool)

(assert (=> b!90194 m!96967))

(declare-fun m!96969 () Bool)

(assert (=> b!90195 m!96969))

(assert (=> b!90010 d!24003))

(declare-fun d!24005 () Bool)

(declare-fun e!58741 () Bool)

(assert (=> d!24005 e!58741))

(declare-fun res!46053 () Bool)

(assert (=> d!24005 (=> (not res!46053) (not e!58741))))

(declare-fun lt!43564 () ListLongMap!1459)

(assert (=> d!24005 (= res!46053 (contains!760 lt!43564 (_1!1121 lt!43397)))))

(declare-fun lt!43565 () List!1523)

(assert (=> d!24005 (= lt!43564 (ListLongMap!1460 lt!43565))))

(declare-fun lt!43563 () Unit!2664)

(declare-fun lt!43566 () Unit!2664)

(assert (=> d!24005 (= lt!43563 lt!43566)))

(assert (=> d!24005 (= (getValueByKey!144 lt!43565 (_1!1121 lt!43397)) (Some!149 (_2!1121 lt!43397)))))

(assert (=> d!24005 (= lt!43566 (lemmaContainsTupThenGetReturnValue!61 lt!43565 (_1!1121 lt!43397) (_2!1121 lt!43397)))))

(assert (=> d!24005 (= lt!43565 (insertStrictlySorted!64 (toList!745 lt!43395) (_1!1121 lt!43397) (_2!1121 lt!43397)))))

(assert (=> d!24005 (= (+!114 lt!43395 lt!43397) lt!43564)))

(declare-fun b!90196 () Bool)

(declare-fun res!46054 () Bool)

(assert (=> b!90196 (=> (not res!46054) (not e!58741))))

(assert (=> b!90196 (= res!46054 (= (getValueByKey!144 (toList!745 lt!43564) (_1!1121 lt!43397)) (Some!149 (_2!1121 lt!43397))))))

(declare-fun b!90197 () Bool)

(assert (=> b!90197 (= e!58741 (contains!761 (toList!745 lt!43564) lt!43397))))

(assert (= (and d!24005 res!46053) b!90196))

(assert (= (and b!90196 res!46054) b!90197))

(declare-fun m!96971 () Bool)

(assert (=> d!24005 m!96971))

(declare-fun m!96973 () Bool)

(assert (=> d!24005 m!96973))

(declare-fun m!96975 () Bool)

(assert (=> d!24005 m!96975))

(declare-fun m!96977 () Bool)

(assert (=> d!24005 m!96977))

(declare-fun m!96979 () Bool)

(assert (=> b!90196 m!96979))

(declare-fun m!96981 () Bool)

(assert (=> b!90197 m!96981))

(assert (=> b!90010 d!24005))

(declare-fun d!24007 () Bool)

(assert (=> d!24007 (not (arrayContainsKey!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43569 () Unit!2664)

(declare-fun choose!68 (array!4065 (_ BitVec 32) (_ BitVec 64) List!1524) Unit!2664)

(assert (=> d!24007 (= lt!43569 (choose!68 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (Cons!1520 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) Nil!1521)))))

(assert (=> d!24007 (bvslt (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24007 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (Cons!1520 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) Nil!1521)) lt!43569)))

(declare-fun bs!3782 () Bool)

(assert (= bs!3782 d!24007))

(assert (=> bs!3782 m!96669))

(assert (=> bs!3782 m!96673))

(assert (=> bs!3782 m!96669))

(declare-fun m!96983 () Bool)

(assert (=> bs!3782 m!96983))

(assert (=> b!89998 d!24007))

(declare-fun d!24009 () Bool)

(assert (=> d!24009 (arrayNoDuplicates!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) from!355 Nil!1521)))

(declare-fun lt!43572 () Unit!2664)

(declare-fun choose!39 (array!4065 (_ BitVec 32) (_ BitVec 32)) Unit!2664)

(assert (=> d!24009 (= lt!43572 (choose!39 (_keys!4067 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24009 (bvslt (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24009 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000000 from!355) lt!43572)))

(declare-fun bs!3783 () Bool)

(assert (= bs!3783 d!24009))

(assert (=> bs!3783 m!96667))

(declare-fun m!96985 () Bool)

(assert (=> bs!3783 m!96985))

(assert (=> b!89998 d!24009))

(declare-fun d!24011 () Bool)

(declare-fun res!46059 () Bool)

(declare-fun e!58746 () Bool)

(assert (=> d!24011 (=> res!46059 e!58746)))

(assert (=> d!24011 (= res!46059 (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(assert (=> d!24011 (= (arrayContainsKey!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!58746)))

(declare-fun b!90202 () Bool)

(declare-fun e!58747 () Bool)

(assert (=> b!90202 (= e!58746 e!58747)))

(declare-fun res!46060 () Bool)

(assert (=> b!90202 (=> (not res!46060) (not e!58747))))

(assert (=> b!90202 (= res!46060 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun b!90203 () Bool)

(assert (=> b!90203 (= e!58747 (arrayContainsKey!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24011 (not res!46059)) b!90202))

(assert (= (and b!90202 res!46060) b!90203))

(assert (=> d!24011 m!96859))

(assert (=> b!90203 m!96669))

(declare-fun m!96987 () Bool)

(assert (=> b!90203 m!96987))

(assert (=> b!89998 d!24011))

(declare-fun d!24013 () Bool)

(declare-fun e!58750 () Bool)

(assert (=> d!24013 e!58750))

(declare-fun c!14985 () Bool)

(assert (=> d!24013 (= c!14985 (and (not (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43575 () Unit!2664)

(declare-fun choose!547 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) (_ BitVec 32) Int) Unit!2664)

(assert (=> d!24013 (= lt!43575 (choose!547 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(assert (=> d!24013 (validMask!0 (mask!6439 (v!2695 (underlying!303 thiss!992))))))

(assert (=> d!24013 (= (lemmaListMapContainsThenArrayContainsFrom!65 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))) lt!43575)))

(declare-fun b!90208 () Bool)

(assert (=> b!90208 (= e!58750 (arrayContainsKey!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!90209 () Bool)

(assert (=> b!90209 (= e!58750 (ite (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24013 c!14985) b!90208))

(assert (= (and d!24013 (not c!14985)) b!90209))

(assert (=> d!24013 m!96669))

(declare-fun m!96989 () Bool)

(assert (=> d!24013 m!96989))

(assert (=> d!24013 m!96881))

(assert (=> b!90208 m!96669))

(assert (=> b!90208 m!96673))

(assert (=> b!89998 d!24013))

(declare-fun b!90220 () Bool)

(declare-fun e!58761 () Bool)

(declare-fun call!8713 () Bool)

(assert (=> b!90220 (= e!58761 call!8713)))

(declare-fun b!90221 () Bool)

(declare-fun e!58762 () Bool)

(declare-fun contains!762 (List!1524 (_ BitVec 64)) Bool)

(assert (=> b!90221 (= e!58762 (contains!762 Nil!1521 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun b!90222 () Bool)

(declare-fun e!58760 () Bool)

(assert (=> b!90222 (= e!58760 e!58761)))

(declare-fun c!14988 () Bool)

(assert (=> b!90222 (= c!14988 (validKeyInArray!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun d!24015 () Bool)

(declare-fun res!46069 () Bool)

(declare-fun e!58759 () Bool)

(assert (=> d!24015 (=> res!46069 e!58759)))

(assert (=> d!24015 (= res!46069 (bvsge from!355 (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(assert (=> d!24015 (= (arrayNoDuplicates!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) from!355 Nil!1521) e!58759)))

(declare-fun bm!8710 () Bool)

(assert (=> bm!8710 (= call!8713 (arrayNoDuplicates!0 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14988 (Cons!1520 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) Nil!1521) Nil!1521)))))

(declare-fun b!90223 () Bool)

(assert (=> b!90223 (= e!58761 call!8713)))

(declare-fun b!90224 () Bool)

(assert (=> b!90224 (= e!58759 e!58760)))

(declare-fun res!46068 () Bool)

(assert (=> b!90224 (=> (not res!46068) (not e!58760))))

(assert (=> b!90224 (= res!46068 (not e!58762))))

(declare-fun res!46067 () Bool)

(assert (=> b!90224 (=> (not res!46067) (not e!58762))))

(assert (=> b!90224 (= res!46067 (validKeyInArray!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(assert (= (and d!24015 (not res!46069)) b!90224))

(assert (= (and b!90224 res!46067) b!90221))

(assert (= (and b!90224 res!46068) b!90222))

(assert (= (and b!90222 c!14988) b!90220))

(assert (= (and b!90222 (not c!14988)) b!90223))

(assert (= (or b!90220 b!90223) bm!8710))

(assert (=> b!90221 m!96669))

(assert (=> b!90221 m!96669))

(declare-fun m!96991 () Bool)

(assert (=> b!90221 m!96991))

(assert (=> b!90222 m!96669))

(assert (=> b!90222 m!96669))

(declare-fun m!96993 () Bool)

(assert (=> b!90222 m!96993))

(assert (=> bm!8710 m!96669))

(declare-fun m!96995 () Bool)

(assert (=> bm!8710 m!96995))

(assert (=> b!90224 m!96669))

(assert (=> b!90224 m!96669))

(assert (=> b!90224 m!96993))

(assert (=> b!89998 d!24015))

(declare-fun d!24017 () Bool)

(declare-fun res!46070 () Bool)

(declare-fun e!58763 () Bool)

(assert (=> d!24017 (=> (not res!46070) (not e!58763))))

(assert (=> d!24017 (= res!46070 (simpleValid!61 newMap!16))))

(assert (=> d!24017 (= (valid!346 newMap!16) e!58763)))

(declare-fun b!90225 () Bool)

(declare-fun res!46071 () Bool)

(assert (=> b!90225 (=> (not res!46071) (not e!58763))))

(assert (=> b!90225 (= res!46071 (= (arrayCountValidKeys!0 (_keys!4067 newMap!16) #b00000000000000000000000000000000 (size!2181 (_keys!4067 newMap!16))) (_size!438 newMap!16)))))

(declare-fun b!90226 () Bool)

(declare-fun res!46072 () Bool)

(assert (=> b!90226 (=> (not res!46072) (not e!58763))))

(assert (=> b!90226 (= res!46072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4067 newMap!16) (mask!6439 newMap!16)))))

(declare-fun b!90227 () Bool)

(assert (=> b!90227 (= e!58763 (arrayNoDuplicates!0 (_keys!4067 newMap!16) #b00000000000000000000000000000000 Nil!1521))))

(assert (= (and d!24017 res!46070) b!90225))

(assert (= (and b!90225 res!46071) b!90226))

(assert (= (and b!90226 res!46072) b!90227))

(declare-fun m!96997 () Bool)

(assert (=> d!24017 m!96997))

(declare-fun m!96999 () Bool)

(assert (=> b!90225 m!96999))

(declare-fun m!97001 () Bool)

(assert (=> b!90226 m!97001))

(declare-fun m!97003 () Bool)

(assert (=> b!90227 m!97003))

(assert (=> b!89996 d!24017))

(declare-fun d!24019 () Bool)

(declare-fun e!58768 () Bool)

(assert (=> d!24019 e!58768))

(declare-fun res!46075 () Bool)

(assert (=> d!24019 (=> res!46075 e!58768)))

(declare-fun lt!43586 () Bool)

(assert (=> d!24019 (= res!46075 (not lt!43586))))

(declare-fun lt!43587 () Bool)

(assert (=> d!24019 (= lt!43586 lt!43587)))

(declare-fun lt!43584 () Unit!2664)

(declare-fun e!58769 () Unit!2664)

(assert (=> d!24019 (= lt!43584 e!58769)))

(declare-fun c!14991 () Bool)

(assert (=> d!24019 (= c!14991 lt!43587)))

(declare-fun containsKey!147 (List!1523 (_ BitVec 64)) Bool)

(assert (=> d!24019 (= lt!43587 (containsKey!147 (toList!745 lt!43394) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(assert (=> d!24019 (= (contains!760 lt!43394 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)) lt!43586)))

(declare-fun b!90234 () Bool)

(declare-fun lt!43585 () Unit!2664)

(assert (=> b!90234 (= e!58769 lt!43585)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!95 (List!1523 (_ BitVec 64)) Unit!2664)

(assert (=> b!90234 (= lt!43585 (lemmaContainsKeyImpliesGetValueByKeyDefined!95 (toList!745 lt!43394) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun isDefined!96 (Option!150) Bool)

(assert (=> b!90234 (isDefined!96 (getValueByKey!144 (toList!745 lt!43394) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun b!90235 () Bool)

(declare-fun Unit!2668 () Unit!2664)

(assert (=> b!90235 (= e!58769 Unit!2668)))

(declare-fun b!90236 () Bool)

(assert (=> b!90236 (= e!58768 (isDefined!96 (getValueByKey!144 (toList!745 lt!43394) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355))))))

(assert (= (and d!24019 c!14991) b!90234))

(assert (= (and d!24019 (not c!14991)) b!90235))

(assert (= (and d!24019 (not res!46075)) b!90236))

(assert (=> d!24019 m!96669))

(declare-fun m!97005 () Bool)

(assert (=> d!24019 m!97005))

(assert (=> b!90234 m!96669))

(declare-fun m!97007 () Bool)

(assert (=> b!90234 m!97007))

(assert (=> b!90234 m!96669))

(declare-fun m!97009 () Bool)

(assert (=> b!90234 m!97009))

(assert (=> b!90234 m!97009))

(declare-fun m!97011 () Bool)

(assert (=> b!90234 m!97011))

(assert (=> b!90236 m!96669))

(assert (=> b!90236 m!97009))

(assert (=> b!90236 m!97009))

(assert (=> b!90236 m!97011))

(assert (=> b!89997 d!24019))

(declare-fun b!90317 () Bool)

(declare-fun e!58828 () Bool)

(declare-fun e!58818 () Bool)

(assert (=> b!90317 (= e!58828 e!58818)))

(declare-fun res!46109 () Bool)

(declare-fun call!8771 () Bool)

(assert (=> b!90317 (= res!46109 call!8771)))

(assert (=> b!90317 (=> (not res!46109) (not e!58818))))

(declare-fun b!90318 () Bool)

(declare-datatypes ((SeekEntryResult!240 0))(
  ( (MissingZero!240 (index!3100 (_ BitVec 32))) (Found!240 (index!3101 (_ BitVec 32))) (Intermediate!240 (undefined!1052 Bool) (index!3102 (_ BitVec 32)) (x!12329 (_ BitVec 32))) (Undefined!240) (MissingVacant!240 (index!3103 (_ BitVec 32))) )
))
(declare-fun lt!43645 () SeekEntryResult!240)

(assert (=> b!90318 (= e!58828 ((_ is Undefined!240) lt!43645))))

(declare-fun b!90319 () Bool)

(declare-fun e!58832 () Unit!2664)

(declare-fun Unit!2669 () Unit!2664)

(assert (=> b!90319 (= e!58832 Unit!2669)))

(declare-fun lt!43659 () Unit!2664)

(declare-fun call!8784 () Unit!2664)

(assert (=> b!90319 (= lt!43659 call!8784)))

(declare-fun lt!43668 () SeekEntryResult!240)

(declare-fun call!8775 () SeekEntryResult!240)

(assert (=> b!90319 (= lt!43668 call!8775)))

(declare-fun c!15024 () Bool)

(assert (=> b!90319 (= c!15024 ((_ is MissingZero!240) lt!43668))))

(declare-fun e!58821 () Bool)

(assert (=> b!90319 e!58821))

(declare-fun lt!43643 () Unit!2664)

(assert (=> b!90319 (= lt!43643 lt!43659)))

(assert (=> b!90319 false))

(declare-fun b!90320 () Bool)

(declare-fun e!58817 () Bool)

(assert (=> b!90320 (= e!58817 ((_ is Undefined!240) lt!43668))))

(declare-fun b!90321 () Bool)

(declare-fun e!58820 () Unit!2664)

(declare-fun Unit!2670 () Unit!2664)

(assert (=> b!90321 (= e!58820 Unit!2670)))

(declare-fun lt!43651 () Unit!2664)

(declare-fun call!8770 () Unit!2664)

(assert (=> b!90321 (= lt!43651 call!8770)))

(declare-fun lt!43644 () SeekEntryResult!240)

(declare-fun call!8778 () SeekEntryResult!240)

(assert (=> b!90321 (= lt!43644 call!8778)))

(declare-fun res!46112 () Bool)

(assert (=> b!90321 (= res!46112 ((_ is Found!240) lt!43644))))

(declare-fun e!58826 () Bool)

(assert (=> b!90321 (=> (not res!46112) (not e!58826))))

(assert (=> b!90321 e!58826))

(declare-fun lt!43654 () Unit!2664)

(assert (=> b!90321 (= lt!43654 lt!43651)))

(assert (=> b!90321 false))

(declare-fun b!90322 () Bool)

(declare-fun e!58819 () Bool)

(declare-fun e!58816 () Bool)

(assert (=> b!90322 (= e!58819 e!58816)))

(declare-fun call!8779 () ListLongMap!1459)

(declare-fun res!46108 () Bool)

(assert (=> b!90322 (= res!46108 (contains!760 call!8779 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(assert (=> b!90322 (=> (not res!46108) (not e!58816))))

(declare-fun b!90323 () Bool)

(declare-fun e!58813 () Bool)

(assert (=> b!90323 (= e!58817 e!58813)))

(declare-fun res!46104 () Bool)

(declare-fun call!8780 () Bool)

(assert (=> b!90323 (= res!46104 call!8780)))

(assert (=> b!90323 (=> (not res!46104) (not e!58813))))

(declare-fun b!90324 () Bool)

(declare-fun res!46115 () Bool)

(assert (=> b!90324 (= res!46115 (= (select (arr!1934 (_keys!4067 newMap!16)) (index!3103 lt!43668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!90324 (=> (not res!46115) (not e!58813))))

(declare-fun call!8774 () ListLongMap!1459)

(declare-fun b!90325 () Bool)

(assert (=> b!90325 (= e!58816 (= call!8779 (+!114 call!8774 (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391))))))

(declare-fun call!8765 () SeekEntryResult!240)

(declare-fun bm!8759 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4065 (_ BitVec 32)) SeekEntryResult!240)

(assert (=> bm!8759 (= call!8765 (seekEntryOrOpen!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (_keys!4067 newMap!16) (mask!6439 newMap!16)))))

(declare-fun bm!8760 () Bool)

(declare-fun call!8772 () Bool)

(declare-fun call!8783 () Bool)

(assert (=> bm!8760 (= call!8772 call!8783)))

(declare-fun bm!8761 () Bool)

(declare-fun call!8768 () ListLongMap!1459)

(declare-fun call!8766 () ListLongMap!1459)

(assert (=> bm!8761 (= call!8768 call!8766)))

(declare-fun b!90326 () Bool)

(declare-fun res!46116 () Bool)

(declare-fun e!58824 () Bool)

(assert (=> b!90326 (=> (not res!46116) (not e!58824))))

(assert (=> b!90326 (= res!46116 (= (select (arr!1934 (_keys!4067 newMap!16)) (index!3100 lt!43645)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90327 () Bool)

(declare-fun lt!43661 () Unit!2664)

(assert (=> b!90327 (= e!58832 lt!43661)))

(assert (=> b!90327 (= lt!43661 call!8770)))

(declare-fun lt!43663 () SeekEntryResult!240)

(assert (=> b!90327 (= lt!43663 call!8775)))

(declare-fun res!46117 () Bool)

(assert (=> b!90327 (= res!46117 ((_ is Found!240) lt!43663))))

(declare-fun e!58829 () Bool)

(assert (=> b!90327 (=> (not res!46117) (not e!58829))))

(assert (=> b!90327 e!58829))

(declare-fun lt!43660 () (_ BitVec 32))

(declare-fun bm!8762 () Bool)

(declare-fun lt!43657 () (_ BitVec 32))

(declare-fun c!15023 () Bool)

(declare-fun c!15030 () Bool)

(declare-fun c!15027 () Bool)

(declare-fun lt!43662 () array!4067)

(assert (=> bm!8762 (= call!8766 (getCurrentListMap!435 (_keys!4067 newMap!16) (ite (or c!15027 c!15030) (_values!2370 newMap!16) lt!43662) (mask!6439 newMap!16) (ite c!15027 (ite c!15023 lt!43660 lt!43657) (extraKeys!2218 newMap!16)) (ite (and c!15027 c!15023) lt!43391 (zeroValue!2275 newMap!16)) (ite c!15027 (ite c!15023 (minValue!2275 newMap!16) lt!43391) (minValue!2275 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90328 () Bool)

(declare-fun lt!43642 () Unit!2664)

(declare-fun lt!43667 () Unit!2664)

(assert (=> b!90328 (= lt!43642 lt!43667)))

(declare-fun call!8785 () ListLongMap!1459)

(declare-fun call!8776 () ListLongMap!1459)

(assert (=> b!90328 (= call!8785 call!8776)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!34 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 V!3057 Int) Unit!2664)

(assert (=> b!90328 (= lt!43667 (lemmaChangeZeroKeyThenAddPairToListMap!34 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) lt!43660 (zeroValue!2275 newMap!16) lt!43391 (minValue!2275 newMap!16) (defaultEntry!2387 newMap!16)))))

(assert (=> b!90328 (= lt!43660 (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!58812 () tuple2!2218)

(assert (=> b!90328 (= e!58812 (tuple2!2219 true (LongMapFixedSize!779 (defaultEntry!2387 newMap!16) (mask!6439 newMap!16) (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000001) lt!43391 (minValue!2275 newMap!16) (_size!438 newMap!16) (_keys!4067 newMap!16) (_values!2370 newMap!16) (_vacant!438 newMap!16))))))

(declare-fun bm!8763 () Bool)

(declare-fun call!8769 () Bool)

(assert (=> bm!8763 (= call!8769 call!8783)))

(declare-fun d!24021 () Bool)

(declare-fun e!58825 () Bool)

(assert (=> d!24021 e!58825))

(declare-fun res!46106 () Bool)

(assert (=> d!24021 (=> (not res!46106) (not e!58825))))

(declare-fun lt!43648 () tuple2!2218)

(assert (=> d!24021 (= res!46106 (valid!346 (_2!1120 lt!43648)))))

(declare-fun e!58827 () tuple2!2218)

(assert (=> d!24021 (= lt!43648 e!58827)))

(assert (=> d!24021 (= c!15027 (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (bvneg (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355))))))

(assert (=> d!24021 (valid!346 newMap!16)))

(assert (=> d!24021 (= (update!130 newMap!16 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391) lt!43648)))

(declare-fun bm!8764 () Bool)

(declare-fun call!8764 () ListLongMap!1459)

(declare-fun call!8763 () ListLongMap!1459)

(assert (=> bm!8764 (= call!8764 call!8763)))

(declare-fun bm!8765 () Bool)

(assert (=> bm!8765 (= call!8780 call!8769)))

(declare-fun bm!8766 () Bool)

(assert (=> bm!8766 (= call!8778 call!8765)))

(declare-fun bm!8767 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!34 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) Int) Unit!2664)

(assert (=> bm!8767 (= call!8770 (lemmaInListMapThenSeekEntryOrOpenFindsIt!34 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (defaultEntry!2387 newMap!16)))))

(declare-fun b!90329 () Bool)

(declare-fun c!15018 () Bool)

(assert (=> b!90329 (= c!15018 ((_ is MissingVacant!240) lt!43668))))

(assert (=> b!90329 (= e!58821 e!58817)))

(declare-fun b!90330 () Bool)

(declare-fun e!58830 () tuple2!2218)

(assert (=> b!90330 (= e!58827 e!58830)))

(declare-fun lt!43658 () SeekEntryResult!240)

(assert (=> b!90330 (= lt!43658 (seekEntryOrOpen!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (_keys!4067 newMap!16) (mask!6439 newMap!16)))))

(assert (=> b!90330 (= c!15030 ((_ is Undefined!240) lt!43658))))

(declare-fun bm!8768 () Bool)

(assert (=> bm!8768 (= call!8771 call!8772)))

(declare-fun b!90331 () Bool)

(declare-fun e!58815 () ListLongMap!1459)

(assert (=> b!90331 (= e!58815 call!8764)))

(declare-fun b!90332 () Bool)

(declare-fun lt!43655 () Unit!2664)

(declare-fun lt!43656 () Unit!2664)

(assert (=> b!90332 (= lt!43655 lt!43656)))

(assert (=> b!90332 (= call!8785 call!8776)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!34 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 V!3057 Int) Unit!2664)

(assert (=> b!90332 (= lt!43656 (lemmaChangeLongMinValueKeyThenAddPairToListMap!34 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) lt!43657 (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) lt!43391 (defaultEntry!2387 newMap!16)))))

(assert (=> b!90332 (= lt!43657 (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!90332 (= e!58812 (tuple2!2219 true (LongMapFixedSize!779 (defaultEntry!2387 newMap!16) (mask!6439 newMap!16) (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000010) (zeroValue!2275 newMap!16) lt!43391 (_size!438 newMap!16) (_keys!4067 newMap!16) (_values!2370 newMap!16) (_vacant!438 newMap!16))))))

(declare-fun b!90333 () Bool)

(declare-fun lt!43646 () Unit!2664)

(declare-fun lt!43665 () Unit!2664)

(assert (=> b!90333 (= lt!43646 lt!43665)))

(declare-fun call!8767 () Bool)

(assert (=> b!90333 call!8767))

(declare-fun lemmaValidKeyInArrayIsInListMap!94 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) Int) Unit!2664)

(assert (=> b!90333 (= lt!43665 (lemmaValidKeyInArrayIsInListMap!94 (_keys!4067 newMap!16) lt!43662 (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (index!3101 lt!43658) (defaultEntry!2387 newMap!16)))))

(assert (=> b!90333 (= lt!43662 (array!4068 (store (arr!1935 (_values!2370 newMap!16)) (index!3101 lt!43658) (ValueCellFull!935 lt!43391)) (size!2182 (_values!2370 newMap!16))))))

(declare-fun lt!43653 () Unit!2664)

(declare-fun lt!43666 () Unit!2664)

(assert (=> b!90333 (= lt!43653 lt!43666)))

(declare-fun call!8773 () ListLongMap!1459)

(assert (=> b!90333 (= call!8773 call!8763)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!34 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) (_ BitVec 64) V!3057 Int) Unit!2664)

(assert (=> b!90333 (= lt!43666 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!34 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (index!3101 lt!43658) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 (defaultEntry!2387 newMap!16)))))

(declare-fun lt!43649 () Unit!2664)

(assert (=> b!90333 (= lt!43649 e!58832)))

(declare-fun c!15026 () Bool)

(assert (=> b!90333 (= c!15026 (contains!760 (getCurrentListMap!435 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun e!58831 () tuple2!2218)

(assert (=> b!90333 (= e!58831 (tuple2!2219 true (LongMapFixedSize!779 (defaultEntry!2387 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (_size!438 newMap!16) (_keys!4067 newMap!16) (array!4068 (store (arr!1935 (_values!2370 newMap!16)) (index!3101 lt!43658) (ValueCellFull!935 lt!43391)) (size!2182 (_values!2370 newMap!16))) (_vacant!438 newMap!16))))))

(declare-fun b!90334 () Bool)

(declare-fun res!46105 () Bool)

(declare-fun e!58823 () Bool)

(assert (=> b!90334 (=> (not res!46105) (not e!58823))))

(assert (=> b!90334 (= res!46105 (= (select (arr!1934 (_keys!4067 newMap!16)) (index!3100 lt!43668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90335 () Bool)

(declare-fun c!15025 () Bool)

(assert (=> b!90335 (= c!15025 ((_ is MissingVacant!240) lt!43658))))

(declare-fun e!58822 () tuple2!2218)

(assert (=> b!90335 (= e!58830 e!58822)))

(declare-fun bm!8769 () Bool)

(assert (=> bm!8769 (= call!8779 (map!1209 (_2!1120 lt!43648)))))

(declare-fun b!90336 () Bool)

(assert (=> b!90336 (= e!58822 e!58831)))

(declare-fun c!15019 () Bool)

(assert (=> b!90336 (= c!15019 ((_ is MissingZero!240) lt!43658))))

(declare-fun bm!8770 () Bool)

(assert (=> bm!8770 (= call!8773 (+!114 e!58815 (ite c!15027 (ite c!15023 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!43391) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!43391)) (tuple2!2221 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391))))))

(declare-fun c!15022 () Bool)

(assert (=> bm!8770 (= c!15022 c!15027)))

(declare-fun c!15021 () Bool)

(declare-fun bm!8771 () Bool)

(declare-fun c!15029 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8771 (= call!8783 (inRange!0 (ite c!15030 (ite c!15021 (index!3101 lt!43644) (ite c!15029 (index!3100 lt!43645) (index!3103 lt!43645))) (ite c!15026 (index!3101 lt!43663) (ite c!15024 (index!3100 lt!43668) (index!3103 lt!43668)))) (mask!6439 newMap!16)))))

(declare-fun bm!8772 () Bool)

(assert (=> bm!8772 (= call!8763 (getCurrentListMap!435 (_keys!4067 newMap!16) (ite c!15027 (_values!2370 newMap!16) (array!4068 (store (arr!1935 (_values!2370 newMap!16)) (index!3101 lt!43658) (ValueCellFull!935 lt!43391)) (size!2182 (_values!2370 newMap!16)))) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90337 () Bool)

(declare-fun res!46111 () Bool)

(assert (=> b!90337 (= res!46111 call!8772)))

(assert (=> b!90337 (=> (not res!46111) (not e!58826))))

(declare-fun b!90338 () Bool)

(assert (=> b!90338 (= e!58829 (= (select (arr!1934 (_keys!4067 newMap!16)) (index!3101 lt!43663)) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun b!90339 () Bool)

(declare-fun call!8762 () Bool)

(assert (=> b!90339 (= e!58813 (not call!8762))))

(declare-fun bm!8773 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!34 (array!4065 array!4067 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) Int) Unit!2664)

(assert (=> bm!8773 (= call!8784 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!34 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (defaultEntry!2387 newMap!16)))))

(declare-fun b!90340 () Bool)

(assert (=> b!90340 (= e!58819 (= call!8779 call!8774))))

(declare-fun bm!8774 () Bool)

(assert (=> bm!8774 (= call!8776 call!8766)))

(declare-fun b!90341 () Bool)

(declare-fun res!46113 () Bool)

(assert (=> b!90341 (= res!46113 call!8769)))

(assert (=> b!90341 (=> (not res!46113) (not e!58829))))

(declare-fun bm!8775 () Bool)

(declare-fun call!8782 () tuple2!2218)

(declare-fun updateHelperNewKey!34 (LongMapFixedSize!778 (_ BitVec 64) V!3057 (_ BitVec 32)) tuple2!2218)

(assert (=> bm!8775 (= call!8782 (updateHelperNewKey!34 newMap!16 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) lt!43391 (ite c!15025 (index!3103 lt!43658) (index!3100 lt!43658))))))

(declare-fun b!90342 () Bool)

(declare-fun call!8781 () Bool)

(assert (=> b!90342 (= e!58818 (not call!8781))))

(declare-fun bm!8776 () Bool)

(assert (=> bm!8776 (= call!8767 (contains!760 call!8768 (ite c!15030 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) (select (arr!1934 (_keys!4067 newMap!16)) (index!3101 lt!43658)))))))

(declare-fun b!90343 () Bool)

(assert (=> b!90343 (= e!58824 (not call!8781))))

(declare-fun bm!8777 () Bool)

(assert (=> bm!8777 (= call!8785 call!8773)))

(declare-fun b!90344 () Bool)

(declare-fun lt!43652 () Unit!2664)

(assert (=> b!90344 (= e!58820 lt!43652)))

(assert (=> b!90344 (= lt!43652 call!8784)))

(assert (=> b!90344 (= lt!43645 call!8778)))

(assert (=> b!90344 (= c!15029 ((_ is MissingZero!240) lt!43645))))

(declare-fun e!58814 () Bool)

(assert (=> b!90344 e!58814))

(declare-fun b!90345 () Bool)

(declare-fun res!46107 () Bool)

(assert (=> b!90345 (=> (not res!46107) (not e!58824))))

(assert (=> b!90345 (= res!46107 call!8771)))

(assert (=> b!90345 (= e!58814 e!58824)))

(declare-fun bm!8778 () Bool)

(assert (=> bm!8778 (= call!8775 call!8765)))

(declare-fun b!90346 () Bool)

(declare-fun lt!43664 () tuple2!2218)

(assert (=> b!90346 (= lt!43664 call!8782)))

(assert (=> b!90346 (= e!58831 (tuple2!2219 (_1!1120 lt!43664) (_2!1120 lt!43664)))))

(declare-fun b!90347 () Bool)

(declare-fun res!46110 () Bool)

(assert (=> b!90347 (= res!46110 (= (select (arr!1934 (_keys!4067 newMap!16)) (index!3103 lt!43645)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!90347 (=> (not res!46110) (not e!58818))))

(declare-fun b!90348 () Bool)

(declare-fun res!46114 () Bool)

(assert (=> b!90348 (=> (not res!46114) (not e!58823))))

(assert (=> b!90348 (= res!46114 call!8780)))

(assert (=> b!90348 (= e!58821 e!58823)))

(declare-fun bm!8779 () Bool)

(declare-fun call!8777 () Bool)

(assert (=> bm!8779 (= call!8762 call!8777)))

(declare-fun b!90349 () Bool)

(assert (=> b!90349 (= e!58825 e!58819)))

(declare-fun c!15028 () Bool)

(assert (=> b!90349 (= c!15028 (_1!1120 lt!43648))))

(declare-fun b!90350 () Bool)

(assert (=> b!90350 (= e!58827 e!58812)))

(assert (=> b!90350 (= c!15023 (= (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90351 () Bool)

(assert (=> b!90351 (= e!58826 (= (select (arr!1934 (_keys!4067 newMap!16)) (index!3101 lt!43644)) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun b!90352 () Bool)

(declare-fun c!15020 () Bool)

(assert (=> b!90352 (= c!15020 ((_ is MissingVacant!240) lt!43645))))

(assert (=> b!90352 (= e!58814 e!58828)))

(declare-fun bm!8780 () Bool)

(assert (=> bm!8780 (= call!8774 (map!1209 newMap!16))))

(declare-fun b!90353 () Bool)

(assert (=> b!90353 (= e!58823 (not call!8762))))

(declare-fun bm!8781 () Bool)

(assert (=> bm!8781 (= call!8777 (arrayContainsKey!0 (_keys!4067 newMap!16) (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!90354 () Bool)

(assert (=> b!90354 (= e!58815 (getCurrentListMap!435 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90355 () Bool)

(declare-fun lt!43650 () Unit!2664)

(assert (=> b!90355 (= lt!43650 e!58820)))

(assert (=> b!90355 (= c!15021 call!8767)))

(assert (=> b!90355 (= e!58830 (tuple2!2219 false newMap!16))))

(declare-fun bm!8782 () Bool)

(assert (=> bm!8782 (= call!8781 call!8777)))

(declare-fun b!90356 () Bool)

(declare-fun lt!43647 () tuple2!2218)

(assert (=> b!90356 (= e!58822 (tuple2!2219 (_1!1120 lt!43647) (_2!1120 lt!43647)))))

(assert (=> b!90356 (= lt!43647 call!8782)))

(assert (= (and d!24021 c!15027) b!90350))

(assert (= (and d!24021 (not c!15027)) b!90330))

(assert (= (and b!90350 c!15023) b!90328))

(assert (= (and b!90350 (not c!15023)) b!90332))

(assert (= (or b!90328 b!90332) bm!8764))

(assert (= (or b!90328 b!90332) bm!8774))

(assert (= (or b!90328 b!90332) bm!8777))

(assert (= (and b!90330 c!15030) b!90355))

(assert (= (and b!90330 (not c!15030)) b!90335))

(assert (= (and b!90355 c!15021) b!90321))

(assert (= (and b!90355 (not c!15021)) b!90344))

(assert (= (and b!90321 res!46112) b!90337))

(assert (= (and b!90337 res!46111) b!90351))

(assert (= (and b!90344 c!15029) b!90345))

(assert (= (and b!90344 (not c!15029)) b!90352))

(assert (= (and b!90345 res!46107) b!90326))

(assert (= (and b!90326 res!46116) b!90343))

(assert (= (and b!90352 c!15020) b!90317))

(assert (= (and b!90352 (not c!15020)) b!90318))

(assert (= (and b!90317 res!46109) b!90347))

(assert (= (and b!90347 res!46110) b!90342))

(assert (= (or b!90345 b!90317) bm!8768))

(assert (= (or b!90343 b!90342) bm!8782))

(assert (= (or b!90337 bm!8768) bm!8760))

(assert (= (or b!90321 b!90344) bm!8766))

(assert (= (and b!90335 c!15025) b!90356))

(assert (= (and b!90335 (not c!15025)) b!90336))

(assert (= (and b!90336 c!15019) b!90346))

(assert (= (and b!90336 (not c!15019)) b!90333))

(assert (= (and b!90333 c!15026) b!90327))

(assert (= (and b!90333 (not c!15026)) b!90319))

(assert (= (and b!90327 res!46117) b!90341))

(assert (= (and b!90341 res!46113) b!90338))

(assert (= (and b!90319 c!15024) b!90348))

(assert (= (and b!90319 (not c!15024)) b!90329))

(assert (= (and b!90348 res!46114) b!90334))

(assert (= (and b!90334 res!46105) b!90353))

(assert (= (and b!90329 c!15018) b!90323))

(assert (= (and b!90329 (not c!15018)) b!90320))

(assert (= (and b!90323 res!46104) b!90324))

(assert (= (and b!90324 res!46115) b!90339))

(assert (= (or b!90348 b!90323) bm!8765))

(assert (= (or b!90353 b!90339) bm!8779))

(assert (= (or b!90341 bm!8765) bm!8763))

(assert (= (or b!90327 b!90319) bm!8778))

(assert (= (or b!90356 b!90346) bm!8775))

(assert (= (or b!90355 b!90333) bm!8761))

(assert (= (or b!90321 b!90327) bm!8767))

(assert (= (or b!90344 b!90319) bm!8773))

(assert (= (or bm!8766 bm!8778) bm!8759))

(assert (= (or bm!8782 bm!8779) bm!8781))

(assert (= (or bm!8760 bm!8763) bm!8771))

(assert (= (or b!90355 b!90333) bm!8776))

(assert (= (or bm!8764 b!90333) bm!8772))

(assert (= (or bm!8774 bm!8761) bm!8762))

(assert (= (or bm!8777 b!90333) bm!8770))

(assert (= (and bm!8770 c!15022) b!90331))

(assert (= (and bm!8770 (not c!15022)) b!90354))

(assert (= (and d!24021 res!46106) b!90349))

(assert (= (and b!90349 c!15028) b!90322))

(assert (= (and b!90349 (not c!15028)) b!90340))

(assert (= (and b!90322 res!46108) b!90325))

(assert (= (or b!90322 b!90325 b!90340) bm!8769))

(assert (= (or b!90325 b!90340) bm!8780))

(declare-fun m!97013 () Bool)

(assert (=> b!90351 m!97013))

(assert (=> bm!8773 m!96669))

(declare-fun m!97015 () Bool)

(assert (=> bm!8773 m!97015))

(declare-fun m!97017 () Bool)

(assert (=> b!90338 m!97017))

(assert (=> b!90333 m!96669))

(declare-fun m!97019 () Bool)

(assert (=> b!90333 m!97019))

(declare-fun m!97021 () Bool)

(assert (=> b!90333 m!97021))

(assert (=> b!90333 m!96669))

(declare-fun m!97023 () Bool)

(assert (=> b!90333 m!97023))

(declare-fun m!97025 () Bool)

(assert (=> b!90333 m!97025))

(declare-fun m!97027 () Bool)

(assert (=> b!90333 m!97027))

(assert (=> b!90333 m!97021))

(declare-fun m!97029 () Bool)

(assert (=> b!90326 m!97029))

(assert (=> bm!8780 m!96655))

(declare-fun m!97031 () Bool)

(assert (=> b!90325 m!97031))

(declare-fun m!97033 () Bool)

(assert (=> b!90347 m!97033))

(assert (=> bm!8775 m!96669))

(declare-fun m!97035 () Bool)

(assert (=> bm!8775 m!97035))

(declare-fun m!97037 () Bool)

(assert (=> bm!8762 m!97037))

(declare-fun m!97039 () Bool)

(assert (=> b!90328 m!97039))

(assert (=> bm!8767 m!96669))

(declare-fun m!97041 () Bool)

(assert (=> bm!8767 m!97041))

(assert (=> bm!8781 m!96669))

(declare-fun m!97043 () Bool)

(assert (=> bm!8781 m!97043))

(assert (=> bm!8759 m!96669))

(declare-fun m!97045 () Bool)

(assert (=> bm!8759 m!97045))

(declare-fun m!97047 () Bool)

(assert (=> b!90332 m!97047))

(assert (=> bm!8772 m!97025))

(declare-fun m!97049 () Bool)

(assert (=> bm!8772 m!97049))

(assert (=> b!90322 m!96669))

(declare-fun m!97051 () Bool)

(assert (=> b!90322 m!97051))

(declare-fun m!97053 () Bool)

(assert (=> bm!8771 m!97053))

(assert (=> b!90330 m!96669))

(assert (=> b!90330 m!97045))

(declare-fun m!97055 () Bool)

(assert (=> b!90334 m!97055))

(assert (=> b!90354 m!97021))

(declare-fun m!97057 () Bool)

(assert (=> bm!8776 m!97057))

(declare-fun m!97059 () Bool)

(assert (=> bm!8776 m!97059))

(declare-fun m!97061 () Bool)

(assert (=> bm!8769 m!97061))

(declare-fun m!97063 () Bool)

(assert (=> d!24021 m!97063))

(assert (=> d!24021 m!96653))

(declare-fun m!97065 () Bool)

(assert (=> bm!8770 m!97065))

(declare-fun m!97067 () Bool)

(assert (=> b!90324 m!97067))

(assert (=> b!89997 d!24021))

(declare-fun d!24023 () Bool)

(assert (=> d!24023 (= (map!1209 newMap!16) (getCurrentListMap!435 (_keys!4067 newMap!16) (_values!2370 newMap!16) (mask!6439 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun bs!3784 () Bool)

(assert (= bs!3784 d!24023))

(assert (=> bs!3784 m!97021))

(assert (=> b!90007 d!24023))

(declare-fun bm!8797 () Bool)

(declare-fun call!8803 () ListLongMap!1459)

(declare-fun call!8802 () ListLongMap!1459)

(assert (=> bm!8797 (= call!8803 call!8802)))

(declare-fun b!90399 () Bool)

(declare-fun e!58866 () Bool)

(assert (=> b!90399 (= e!58866 (validKeyInArray!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8798 () Bool)

(declare-fun call!8804 () ListLongMap!1459)

(declare-fun call!8801 () ListLongMap!1459)

(assert (=> bm!8798 (= call!8804 call!8801)))

(declare-fun bm!8799 () Bool)

(declare-fun call!8805 () ListLongMap!1459)

(assert (=> bm!8799 (= call!8805 call!8803)))

(declare-fun b!90400 () Bool)

(declare-fun e!58867 () Bool)

(declare-fun e!58870 () Bool)

(assert (=> b!90400 (= e!58867 e!58870)))

(declare-fun res!46137 () Bool)

(assert (=> b!90400 (=> (not res!46137) (not e!58870))))

(declare-fun lt!43728 () ListLongMap!1459)

(assert (=> b!90400 (= res!46137 (contains!760 lt!43728 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90400 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun b!90401 () Bool)

(declare-fun e!58871 () Bool)

(declare-fun e!58865 () Bool)

(assert (=> b!90401 (= e!58871 e!58865)))

(declare-fun c!15048 () Bool)

(assert (=> b!90401 (= c!15048 (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!90402 () Bool)

(declare-fun e!58863 () Unit!2664)

(declare-fun Unit!2671 () Unit!2664)

(assert (=> b!90402 (= e!58863 Unit!2671)))

(declare-fun b!90403 () Bool)

(declare-fun c!15043 () Bool)

(assert (=> b!90403 (= c!15043 (and (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!58868 () ListLongMap!1459)

(declare-fun e!58861 () ListLongMap!1459)

(assert (=> b!90403 (= e!58868 e!58861)))

(declare-fun b!90404 () Bool)

(declare-fun e!58869 () ListLongMap!1459)

(assert (=> b!90404 (= e!58869 e!58868)))

(declare-fun c!15046 () Bool)

(assert (=> b!90404 (= c!15046 (and (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8800 () Bool)

(assert (=> bm!8800 (= call!8802 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun b!90405 () Bool)

(assert (=> b!90405 (= e!58861 call!8805)))

(declare-fun bm!8801 () Bool)

(declare-fun call!8800 () Bool)

(assert (=> bm!8801 (= call!8800 (contains!760 lt!43728 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90406 () Bool)

(declare-fun res!46144 () Bool)

(assert (=> b!90406 (=> (not res!46144) (not e!58871))))

(declare-fun e!58862 () Bool)

(assert (=> b!90406 (= res!46144 e!58862)))

(declare-fun c!15045 () Bool)

(assert (=> b!90406 (= c!15045 (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!90407 () Bool)

(assert (=> b!90407 (= e!58869 (+!114 call!8801 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun b!90408 () Bool)

(declare-fun e!58864 () Bool)

(assert (=> b!90408 (= e!58864 (= (apply!85 lt!43728 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun b!90409 () Bool)

(assert (=> b!90409 (= e!58868 call!8804)))

(declare-fun b!90410 () Bool)

(declare-fun e!58859 () Bool)

(assert (=> b!90410 (= e!58859 (validKeyInArray!0 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90411 () Bool)

(declare-fun e!58860 () Bool)

(assert (=> b!90411 (= e!58865 e!58860)))

(declare-fun res!46141 () Bool)

(assert (=> b!90411 (= res!46141 call!8800)))

(assert (=> b!90411 (=> (not res!46141) (not e!58860))))

(declare-fun b!90412 () Bool)

(declare-fun lt!43714 () Unit!2664)

(assert (=> b!90412 (= e!58863 lt!43714)))

(declare-fun lt!43731 () ListLongMap!1459)

(assert (=> b!90412 (= lt!43731 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun lt!43733 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43729 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43729 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43726 () Unit!2664)

(declare-fun addStillContains!61 (ListLongMap!1459 (_ BitVec 64) V!3057 (_ BitVec 64)) Unit!2664)

(assert (=> b!90412 (= lt!43726 (addStillContains!61 lt!43731 lt!43733 (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) lt!43729))))

(assert (=> b!90412 (contains!760 (+!114 lt!43731 (tuple2!2221 lt!43733 (zeroValue!2275 (v!2695 (underlying!303 thiss!992))))) lt!43729)))

(declare-fun lt!43734 () Unit!2664)

(assert (=> b!90412 (= lt!43734 lt!43726)))

(declare-fun lt!43723 () ListLongMap!1459)

(assert (=> b!90412 (= lt!43723 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun lt!43727 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43727 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43722 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43722 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43720 () Unit!2664)

(declare-fun addApplyDifferent!61 (ListLongMap!1459 (_ BitVec 64) V!3057 (_ BitVec 64)) Unit!2664)

(assert (=> b!90412 (= lt!43720 (addApplyDifferent!61 lt!43723 lt!43727 (minValue!2275 (v!2695 (underlying!303 thiss!992))) lt!43722))))

(assert (=> b!90412 (= (apply!85 (+!114 lt!43723 (tuple2!2221 lt!43727 (minValue!2275 (v!2695 (underlying!303 thiss!992))))) lt!43722) (apply!85 lt!43723 lt!43722))))

(declare-fun lt!43725 () Unit!2664)

(assert (=> b!90412 (= lt!43725 lt!43720)))

(declare-fun lt!43719 () ListLongMap!1459)

(assert (=> b!90412 (= lt!43719 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun lt!43721 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43732 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43732 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43718 () Unit!2664)

(assert (=> b!90412 (= lt!43718 (addApplyDifferent!61 lt!43719 lt!43721 (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) lt!43732))))

(assert (=> b!90412 (= (apply!85 (+!114 lt!43719 (tuple2!2221 lt!43721 (zeroValue!2275 (v!2695 (underlying!303 thiss!992))))) lt!43732) (apply!85 lt!43719 lt!43732))))

(declare-fun lt!43730 () Unit!2664)

(assert (=> b!90412 (= lt!43730 lt!43718)))

(declare-fun lt!43715 () ListLongMap!1459)

(assert (=> b!90412 (= lt!43715 (getCurrentListMapNoExtraKeys!79 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun lt!43716 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43716 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43713 () (_ BitVec 64))

(assert (=> b!90412 (= lt!43713 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!90412 (= lt!43714 (addApplyDifferent!61 lt!43715 lt!43716 (minValue!2275 (v!2695 (underlying!303 thiss!992))) lt!43713))))

(assert (=> b!90412 (= (apply!85 (+!114 lt!43715 (tuple2!2221 lt!43716 (minValue!2275 (v!2695 (underlying!303 thiss!992))))) lt!43713) (apply!85 lt!43715 lt!43713))))

(declare-fun b!90413 () Bool)

(assert (=> b!90413 (= e!58861 call!8804)))

(declare-fun bm!8802 () Bool)

(declare-fun call!8806 () Bool)

(assert (=> bm!8802 (= call!8806 (contains!760 lt!43728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90414 () Bool)

(assert (=> b!90414 (= e!58870 (= (apply!85 lt!43728 (select (arr!1934 (_keys!4067 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1226 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!90414 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2182 (_values!2370 (v!2695 (underlying!303 thiss!992))))))))

(assert (=> b!90414 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun d!24025 () Bool)

(assert (=> d!24025 e!58871))

(declare-fun res!46140 () Bool)

(assert (=> d!24025 (=> (not res!46140) (not e!58871))))

(assert (=> d!24025 (= res!46140 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))))

(declare-fun lt!43724 () ListLongMap!1459)

(assert (=> d!24025 (= lt!43728 lt!43724)))

(declare-fun lt!43717 () Unit!2664)

(assert (=> d!24025 (= lt!43717 e!58863)))

(declare-fun c!15047 () Bool)

(assert (=> d!24025 (= c!15047 e!58866)))

(declare-fun res!46142 () Bool)

(assert (=> d!24025 (=> (not res!46142) (not e!58866))))

(assert (=> d!24025 (= res!46142 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(assert (=> d!24025 (= lt!43724 e!58869)))

(declare-fun c!15044 () Bool)

(assert (=> d!24025 (= c!15044 (and (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24025 (validMask!0 (mask!6439 (v!2695 (underlying!303 thiss!992))))))

(assert (=> d!24025 (= (getCurrentListMap!435 (_keys!4067 (v!2695 (underlying!303 thiss!992))) (_values!2370 (v!2695 (underlying!303 thiss!992))) (mask!6439 (v!2695 (underlying!303 thiss!992))) (extraKeys!2218 (v!2695 (underlying!303 thiss!992))) (zeroValue!2275 (v!2695 (underlying!303 thiss!992))) (minValue!2275 (v!2695 (underlying!303 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992)))) lt!43728)))

(declare-fun b!90415 () Bool)

(declare-fun res!46136 () Bool)

(assert (=> b!90415 (=> (not res!46136) (not e!58871))))

(assert (=> b!90415 (= res!46136 e!58867)))

(declare-fun res!46139 () Bool)

(assert (=> b!90415 (=> res!46139 e!58867)))

(assert (=> b!90415 (= res!46139 (not e!58859))))

(declare-fun res!46143 () Bool)

(assert (=> b!90415 (=> (not res!46143) (not e!58859))))

(assert (=> b!90415 (= res!46143 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2181 (_keys!4067 (v!2695 (underlying!303 thiss!992))))))))

(declare-fun b!90416 () Bool)

(assert (=> b!90416 (= e!58860 (= (apply!85 lt!43728 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2275 (v!2695 (underlying!303 thiss!992)))))))

(declare-fun bm!8803 () Bool)

(assert (=> bm!8803 (= call!8801 (+!114 (ite c!15044 call!8802 (ite c!15046 call!8803 call!8805)) (ite (or c!15044 c!15046) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2695 (underlying!303 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2695 (underlying!303 thiss!992)))))))))

(declare-fun b!90417 () Bool)

(assert (=> b!90417 (= e!58862 e!58864)))

(declare-fun res!46138 () Bool)

(assert (=> b!90417 (= res!46138 call!8806)))

(assert (=> b!90417 (=> (not res!46138) (not e!58864))))

(declare-fun b!90418 () Bool)

(assert (=> b!90418 (= e!58862 (not call!8806))))

(declare-fun b!90419 () Bool)

(assert (=> b!90419 (= e!58865 (not call!8800))))

(assert (= (and d!24025 c!15044) b!90407))

(assert (= (and d!24025 (not c!15044)) b!90404))

(assert (= (and b!90404 c!15046) b!90409))

(assert (= (and b!90404 (not c!15046)) b!90403))

(assert (= (and b!90403 c!15043) b!90413))

(assert (= (and b!90403 (not c!15043)) b!90405))

(assert (= (or b!90413 b!90405) bm!8799))

(assert (= (or b!90409 bm!8799) bm!8797))

(assert (= (or b!90409 b!90413) bm!8798))

(assert (= (or b!90407 bm!8797) bm!8800))

(assert (= (or b!90407 bm!8798) bm!8803))

(assert (= (and d!24025 res!46142) b!90399))

(assert (= (and d!24025 c!15047) b!90412))

(assert (= (and d!24025 (not c!15047)) b!90402))

(assert (= (and d!24025 res!46140) b!90415))

(assert (= (and b!90415 res!46143) b!90410))

(assert (= (and b!90415 (not res!46139)) b!90400))

(assert (= (and b!90400 res!46137) b!90414))

(assert (= (and b!90415 res!46136) b!90406))

(assert (= (and b!90406 c!15045) b!90417))

(assert (= (and b!90406 (not c!15045)) b!90418))

(assert (= (and b!90417 res!46138) b!90408))

(assert (= (or b!90417 b!90418) bm!8802))

(assert (= (and b!90406 res!46144) b!90401))

(assert (= (and b!90401 c!15048) b!90411))

(assert (= (and b!90401 (not c!15048)) b!90419))

(assert (= (and b!90411 res!46141) b!90416))

(assert (= (or b!90411 b!90419) bm!8801))

(declare-fun b_lambda!3989 () Bool)

(assert (=> (not b_lambda!3989) (not b!90414)))

(assert (=> b!90414 t!5298))

(declare-fun b_and!5441 () Bool)

(assert (= b_and!5437 (and (=> t!5298 result!2997) b_and!5441)))

(assert (=> b!90414 t!5300))

(declare-fun b_and!5443 () Bool)

(assert (= b_and!5439 (and (=> t!5300 result!3001) b_and!5443)))

(assert (=> d!24025 m!96881))

(declare-fun m!97069 () Bool)

(assert (=> b!90412 m!97069))

(declare-fun m!97071 () Bool)

(assert (=> b!90412 m!97071))

(assert (=> b!90412 m!96859))

(declare-fun m!97073 () Bool)

(assert (=> b!90412 m!97073))

(declare-fun m!97075 () Bool)

(assert (=> b!90412 m!97075))

(declare-fun m!97077 () Bool)

(assert (=> b!90412 m!97077))

(declare-fun m!97079 () Bool)

(assert (=> b!90412 m!97079))

(declare-fun m!97081 () Bool)

(assert (=> b!90412 m!97081))

(declare-fun m!97083 () Bool)

(assert (=> b!90412 m!97083))

(declare-fun m!97085 () Bool)

(assert (=> b!90412 m!97085))

(assert (=> b!90412 m!97071))

(declare-fun m!97087 () Bool)

(assert (=> b!90412 m!97087))

(declare-fun m!97089 () Bool)

(assert (=> b!90412 m!97089))

(declare-fun m!97091 () Bool)

(assert (=> b!90412 m!97091))

(declare-fun m!97093 () Bool)

(assert (=> b!90412 m!97093))

(assert (=> b!90412 m!97091))

(assert (=> b!90412 m!97077))

(declare-fun m!97095 () Bool)

(assert (=> b!90412 m!97095))

(assert (=> b!90412 m!97081))

(declare-fun m!97097 () Bool)

(assert (=> b!90412 m!97097))

(assert (=> b!90412 m!96701))

(assert (=> b!90414 m!96855))

(assert (=> b!90414 m!96859))

(assert (=> b!90414 m!96855))

(assert (=> b!90414 m!96707))

(assert (=> b!90414 m!96857))

(assert (=> b!90414 m!96859))

(declare-fun m!97099 () Bool)

(assert (=> b!90414 m!97099))

(assert (=> b!90414 m!96707))

(assert (=> bm!8800 m!96701))

(declare-fun m!97101 () Bool)

(assert (=> bm!8802 m!97101))

(assert (=> b!90410 m!96859))

(assert (=> b!90410 m!96859))

(assert (=> b!90410 m!96875))

(declare-fun m!97103 () Bool)

(assert (=> bm!8803 m!97103))

(assert (=> b!90399 m!96859))

(assert (=> b!90399 m!96859))

(assert (=> b!90399 m!96875))

(declare-fun m!97105 () Bool)

(assert (=> b!90416 m!97105))

(assert (=> b!90400 m!96859))

(assert (=> b!90400 m!96859))

(declare-fun m!97107 () Bool)

(assert (=> b!90400 m!97107))

(declare-fun m!97109 () Bool)

(assert (=> b!90407 m!97109))

(declare-fun m!97111 () Bool)

(assert (=> b!90408 m!97111))

(declare-fun m!97113 () Bool)

(assert (=> bm!8801 m!97113))

(assert (=> b!90007 d!24025))

(declare-fun d!24027 () Bool)

(assert (=> d!24027 (= (array_inv!1189 (_keys!4067 newMap!16)) (bvsge (size!2181 (_keys!4067 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89999 d!24027))

(declare-fun d!24029 () Bool)

(assert (=> d!24029 (= (array_inv!1190 (_values!2370 newMap!16)) (bvsge (size!2182 (_values!2370 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89999 d!24029))

(declare-fun d!24031 () Bool)

(declare-fun c!15051 () Bool)

(assert (=> d!24031 (= c!15051 ((_ is ValueCellFull!935) (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) from!355)))))

(declare-fun e!58874 () V!3057)

(assert (=> d!24031 (= (get!1226 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) from!355) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!58874)))

(declare-fun b!90424 () Bool)

(declare-fun get!1227 (ValueCell!935 V!3057) V!3057)

(assert (=> b!90424 (= e!58874 (get!1227 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) from!355) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90425 () Bool)

(declare-fun get!1228 (ValueCell!935 V!3057) V!3057)

(assert (=> b!90425 (= e!58874 (get!1228 (select (arr!1935 (_values!2370 (v!2695 (underlying!303 thiss!992)))) from!355) (dynLambda!349 (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24031 c!15051) b!90424))

(assert (= (and d!24031 (not c!15051)) b!90425))

(assert (=> b!90424 m!96705))

(assert (=> b!90424 m!96707))

(declare-fun m!97115 () Bool)

(assert (=> b!90424 m!97115))

(assert (=> b!90425 m!96705))

(assert (=> b!90425 m!96707))

(declare-fun m!97117 () Bool)

(assert (=> b!90425 m!97117))

(assert (=> b!90003 d!24031))

(declare-fun condMapEmpty!3501 () Bool)

(declare-fun mapDefault!3501 () ValueCell!935)

(assert (=> mapNonEmpty!3485 (= condMapEmpty!3501 (= mapRest!3485 ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3501)))))

(declare-fun e!58879 () Bool)

(declare-fun mapRes!3501 () Bool)

(assert (=> mapNonEmpty!3485 (= tp!9088 (and e!58879 mapRes!3501))))

(declare-fun mapIsEmpty!3501 () Bool)

(assert (=> mapIsEmpty!3501 mapRes!3501))

(declare-fun b!90433 () Bool)

(assert (=> b!90433 (= e!58879 tp_is_empty!2557)))

(declare-fun b!90432 () Bool)

(declare-fun e!58880 () Bool)

(assert (=> b!90432 (= e!58880 tp_is_empty!2557)))

(declare-fun mapNonEmpty!3501 () Bool)

(declare-fun tp!9117 () Bool)

(assert (=> mapNonEmpty!3501 (= mapRes!3501 (and tp!9117 e!58880))))

(declare-fun mapValue!3501 () ValueCell!935)

(declare-fun mapKey!3501 () (_ BitVec 32))

(declare-fun mapRest!3501 () (Array (_ BitVec 32) ValueCell!935))

(assert (=> mapNonEmpty!3501 (= mapRest!3485 (store mapRest!3501 mapKey!3501 mapValue!3501))))

(assert (= (and mapNonEmpty!3485 condMapEmpty!3501) mapIsEmpty!3501))

(assert (= (and mapNonEmpty!3485 (not condMapEmpty!3501)) mapNonEmpty!3501))

(assert (= (and mapNonEmpty!3501 ((_ is ValueCellFull!935) mapValue!3501)) b!90432))

(assert (= (and mapNonEmpty!3485 ((_ is ValueCellFull!935) mapDefault!3501)) b!90433))

(declare-fun m!97119 () Bool)

(assert (=> mapNonEmpty!3501 m!97119))

(declare-fun condMapEmpty!3502 () Bool)

(declare-fun mapDefault!3502 () ValueCell!935)

(assert (=> mapNonEmpty!3486 (= condMapEmpty!3502 (= mapRest!3486 ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3502)))))

(declare-fun e!58881 () Bool)

(declare-fun mapRes!3502 () Bool)

(assert (=> mapNonEmpty!3486 (= tp!9090 (and e!58881 mapRes!3502))))

(declare-fun mapIsEmpty!3502 () Bool)

(assert (=> mapIsEmpty!3502 mapRes!3502))

(declare-fun b!90435 () Bool)

(assert (=> b!90435 (= e!58881 tp_is_empty!2557)))

(declare-fun b!90434 () Bool)

(declare-fun e!58882 () Bool)

(assert (=> b!90434 (= e!58882 tp_is_empty!2557)))

(declare-fun mapNonEmpty!3502 () Bool)

(declare-fun tp!9118 () Bool)

(assert (=> mapNonEmpty!3502 (= mapRes!3502 (and tp!9118 e!58882))))

(declare-fun mapRest!3502 () (Array (_ BitVec 32) ValueCell!935))

(declare-fun mapKey!3502 () (_ BitVec 32))

(declare-fun mapValue!3502 () ValueCell!935)

(assert (=> mapNonEmpty!3502 (= mapRest!3486 (store mapRest!3502 mapKey!3502 mapValue!3502))))

(assert (= (and mapNonEmpty!3486 condMapEmpty!3502) mapIsEmpty!3502))

(assert (= (and mapNonEmpty!3486 (not condMapEmpty!3502)) mapNonEmpty!3502))

(assert (= (and mapNonEmpty!3502 ((_ is ValueCellFull!935) mapValue!3502)) b!90434))

(assert (= (and mapNonEmpty!3486 ((_ is ValueCellFull!935) mapDefault!3502)) b!90435))

(declare-fun m!97121 () Bool)

(assert (=> mapNonEmpty!3502 m!97121))

(declare-fun b_lambda!3991 () Bool)

(assert (= b_lambda!3987 (or (and b!90005 b_free!2281) (and b!89999 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))))) b_lambda!3991)))

(declare-fun b_lambda!3993 () Bool)

(assert (= b_lambda!3985 (or (and b!90005 b_free!2281) (and b!89999 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))))) b_lambda!3993)))

(declare-fun b_lambda!3995 () Bool)

(assert (= b_lambda!3989 (or (and b!90005 b_free!2281) (and b!89999 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2695 (underlying!303 thiss!992))))) b_lambda!3995)))

(check-sat (not b!90173) (not d!23985) (not b!90424) (not bm!8776) (not b!90197) (not b!90195) (not b!90399) (not b!90177) (not d!24021) (not bm!8803) (not b!90354) (not bm!8767) (not b!90169) (not b!90178) (not b!90236) (not b!90330) (not b!90194) (not bm!8801) (not b!90325) (not b!90410) (not b!90400) (not b!90208) (not d!24001) (not b!90328) (not d!23997) (not b!90408) (not bm!8762) (not d!24005) (not bm!8802) (not d!23989) (not d!23987) (not bm!8770) (not d!24007) (not b!90191) (not mapNonEmpty!3501) (not b!90185) (not b_lambda!3993) (not b!90188) (not b!90407) (not b!90322) b_and!5441 (not d!24023) (not bm!8759) (not b!90414) (not bm!8710) (not bm!8771) (not b_lambda!3995) (not b!90224) (not d!23979) (not b!90221) (not b_lambda!3983) (not b!90196) (not d!24009) (not d!23999) (not b!90189) (not mapNonEmpty!3502) (not b!90333) (not b!90140) (not b!90139) (not b!90227) (not b!90203) (not b!90416) (not d!24025) (not d!24019) (not b!90193) (not b!90192) (not b_next!2281) (not b!90190) (not bm!8800) (not b!90412) tp_is_empty!2557 (not b!90226) (not bm!8781) (not d!23991) (not d!24003) (not b!90222) (not b!90172) (not b!90176) (not b!90171) (not b!90425) (not bm!8707) (not d!23995) (not d!24017) (not d!24013) (not b!90187) (not b!90175) (not bm!8780) (not bm!8775) (not b!90186) (not b_next!2283) (not b_lambda!3991) (not d!23993) (not b!90170) (not bm!8773) (not b!90332) b_and!5443 (not b!90225) (not b!90166) (not bm!8772) (not b!90234) (not bm!8769))
(check-sat b_and!5441 b_and!5443 (not b_next!2281) (not b_next!2283))
