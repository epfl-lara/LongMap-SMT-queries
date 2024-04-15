; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11064 () Bool)

(assert start!11064)

(declare-fun b!89920 () Bool)

(declare-fun b_free!2281 () Bool)

(declare-fun b_next!2281 () Bool)

(assert (=> b!89920 (= b_free!2281 (not b_next!2281))))

(declare-fun tp!9087 () Bool)

(declare-fun b_and!5401 () Bool)

(assert (=> b!89920 (= tp!9087 b_and!5401)))

(declare-fun b!89914 () Bool)

(declare-fun b_free!2283 () Bool)

(declare-fun b_next!2283 () Bool)

(assert (=> b!89914 (= b_free!2283 (not b_next!2283))))

(declare-fun tp!9089 () Bool)

(declare-fun b_and!5403 () Bool)

(assert (=> b!89914 (= tp!9089 b_and!5403)))

(declare-fun b!89906 () Bool)

(declare-fun e!58546 () Bool)

(declare-fun e!58543 () Bool)

(assert (=> b!89906 (= e!58546 e!58543)))

(declare-fun res!45944 () Bool)

(assert (=> b!89906 (=> (not res!45944) (not e!58543))))

(declare-datatypes ((V!3057 0))(
  ( (V!3058 (val!1323 Int)) )
))
(declare-datatypes ((array!4059 0))(
  ( (array!4060 (arr!1930 (Array (_ BitVec 32) (_ BitVec 64))) (size!2178 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!935 0))(
  ( (ValueCellFull!935 (v!2684 V!3057)) (EmptyCell!935) )
))
(declare-datatypes ((array!4061 0))(
  ( (array!4062 (arr!1931 (Array (_ BitVec 32) ValueCell!935)) (size!2179 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!778 0))(
  ( (LongMapFixedSize!779 (defaultEntry!2387 Int) (mask!6438 (_ BitVec 32)) (extraKeys!2218 (_ BitVec 32)) (zeroValue!2275 V!3057) (minValue!2275 V!3057) (_size!438 (_ BitVec 32)) (_keys!4066 array!4059) (_values!2370 array!4061) (_vacant!438 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!570 0))(
  ( (Cell!571 (v!2685 LongMapFixedSize!778)) )
))
(declare-datatypes ((LongMap!570 0))(
  ( (LongMap!571 (underlying!296 Cell!570)) )
))
(declare-fun thiss!992 () LongMap!570)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!89906 (= res!45944 (and (not (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43338 () V!3057)

(declare-fun get!1224 (ValueCell!935 V!3057) V!3057)

(declare-fun dynLambda!350 (Int (_ BitVec 64)) V!3057)

(assert (=> b!89906 (= lt!43338 (get!1224 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) from!355) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89907 () Bool)

(declare-fun e!58549 () Bool)

(declare-fun tp_is_empty!2557 () Bool)

(assert (=> b!89907 (= e!58549 tp_is_empty!2557)))

(declare-fun mapIsEmpty!3485 () Bool)

(declare-fun mapRes!3485 () Bool)

(assert (=> mapIsEmpty!3485 mapRes!3485))

(declare-fun res!45941 () Bool)

(declare-fun e!58541 () Bool)

(assert (=> start!11064 (=> (not res!45941) (not e!58541))))

(declare-fun valid!349 (LongMap!570) Bool)

(assert (=> start!11064 (= res!45941 (valid!349 thiss!992))))

(assert (=> start!11064 e!58541))

(declare-fun e!58538 () Bool)

(assert (=> start!11064 e!58538))

(assert (=> start!11064 true))

(declare-fun e!58540 () Bool)

(assert (=> start!11064 e!58540))

(declare-fun b!89908 () Bool)

(declare-fun e!58539 () Bool)

(assert (=> b!89908 (= e!58538 e!58539)))

(declare-fun b!89909 () Bool)

(declare-fun e!58552 () Bool)

(assert (=> b!89909 (= e!58552 tp_is_empty!2557)))

(declare-fun b!89910 () Bool)

(declare-fun e!58551 () Bool)

(assert (=> b!89910 (= e!58543 e!58551)))

(declare-fun res!45946 () Bool)

(assert (=> b!89910 (=> (not res!45946) (not e!58551))))

(declare-datatypes ((tuple2!2232 0))(
  ( (tuple2!2233 (_1!1127 Bool) (_2!1127 LongMapFixedSize!778)) )
))
(declare-fun lt!43340 () tuple2!2232)

(assert (=> b!89910 (= res!45946 (and (_1!1127 lt!43340) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2679 0))(
  ( (Unit!2680) )
))
(declare-fun lt!43348 () Unit!2679)

(declare-fun e!58550 () Unit!2679)

(assert (=> b!89910 (= lt!43348 e!58550)))

(declare-datatypes ((tuple2!2234 0))(
  ( (tuple2!2235 (_1!1128 (_ BitVec 64)) (_2!1128 V!3057)) )
))
(declare-datatypes ((List!1542 0))(
  ( (Nil!1539) (Cons!1538 (h!2130 tuple2!2234) (t!5319 List!1542)) )
))
(declare-datatypes ((ListLongMap!1467 0))(
  ( (ListLongMap!1468 (toList!749 List!1542)) )
))
(declare-fun lt!43342 () ListLongMap!1467)

(declare-fun c!14932 () Bool)

(declare-fun contains!763 (ListLongMap!1467 (_ BitVec 64)) Bool)

(assert (=> b!89910 (= c!14932 (contains!763 lt!43342 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!778)

(declare-fun update!127 (LongMapFixedSize!778 (_ BitVec 64) V!3057) tuple2!2232)

(assert (=> b!89910 (= lt!43340 (update!127 newMap!16 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338))))

(declare-fun b!89911 () Bool)

(declare-fun Unit!2681 () Unit!2679)

(assert (=> b!89911 (= e!58550 Unit!2681)))

(declare-fun lt!43351 () Unit!2679)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!74 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) (_ BitVec 32) Int) Unit!2679)

(assert (=> b!89911 (= lt!43351 (lemmaListMapContainsThenArrayContainsFrom!74 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!89911 (arrayContainsKey!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43346 () Unit!2679)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4059 (_ BitVec 32) (_ BitVec 32)) Unit!2679)

(assert (=> b!89911 (= lt!43346 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1543 0))(
  ( (Nil!1540) (Cons!1539 (h!2131 (_ BitVec 64)) (t!5320 List!1543)) )
))
(declare-fun arrayNoDuplicates!0 (array!4059 (_ BitVec 32) List!1543) Bool)

(assert (=> b!89911 (arrayNoDuplicates!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) from!355 Nil!1540)))

(declare-fun lt!43345 () Unit!2679)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4059 (_ BitVec 32) (_ BitVec 64) List!1543) Unit!2679)

(assert (=> b!89911 (= lt!43345 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (Cons!1539 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) Nil!1540)))))

(assert (=> b!89911 false))

(declare-fun b!89912 () Bool)

(declare-fun res!45942 () Bool)

(assert (=> b!89912 (=> (not res!45942) (not e!58541))))

(assert (=> b!89912 (= res!45942 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6438 newMap!16)) (_size!438 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun mapIsEmpty!3486 () Bool)

(declare-fun mapRes!3486 () Bool)

(assert (=> mapIsEmpty!3486 mapRes!3486))

(declare-fun b!89913 () Bool)

(declare-fun e!58544 () Bool)

(assert (=> b!89913 (= e!58544 tp_is_empty!2557)))

(declare-fun e!58553 () Bool)

(declare-fun array_inv!1209 (array!4059) Bool)

(declare-fun array_inv!1210 (array!4061) Bool)

(assert (=> b!89914 (= e!58540 (and tp!9089 tp_is_empty!2557 (array_inv!1209 (_keys!4066 newMap!16)) (array_inv!1210 (_values!2370 newMap!16)) e!58553))))

(declare-fun b!89915 () Bool)

(declare-fun Unit!2682 () Unit!2679)

(assert (=> b!89915 (= e!58550 Unit!2682)))

(declare-fun b!89916 () Bool)

(declare-fun res!45947 () Bool)

(assert (=> b!89916 (=> (not res!45947) (not e!58541))))

(declare-fun valid!350 (LongMapFixedSize!778) Bool)

(assert (=> b!89916 (= res!45947 (valid!350 newMap!16))))

(declare-fun b!89917 () Bool)

(declare-fun res!45943 () Bool)

(assert (=> b!89917 (=> (not res!45943) (not e!58541))))

(assert (=> b!89917 (= res!45943 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992)))))))))

(declare-fun b!89918 () Bool)

(declare-fun e!58547 () Bool)

(assert (=> b!89918 (= e!58539 e!58547)))

(declare-fun mapNonEmpty!3485 () Bool)

(declare-fun tp!9088 () Bool)

(declare-fun e!58548 () Bool)

(assert (=> mapNonEmpty!3485 (= mapRes!3485 (and tp!9088 e!58548))))

(declare-fun mapRest!3485 () (Array (_ BitVec 32) ValueCell!935))

(declare-fun mapValue!3486 () ValueCell!935)

(declare-fun mapKey!3486 () (_ BitVec 32))

(assert (=> mapNonEmpty!3485 (= (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) (store mapRest!3485 mapKey!3486 mapValue!3486))))

(declare-fun b!89919 () Bool)

(declare-fun e!58537 () Bool)

(assert (=> b!89919 (= e!58537 (and e!58552 mapRes!3485))))

(declare-fun condMapEmpty!3485 () Bool)

(declare-fun mapDefault!3486 () ValueCell!935)

(assert (=> b!89919 (= condMapEmpty!3485 (= (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3486)))))

(assert (=> b!89920 (= e!58547 (and tp!9087 tp_is_empty!2557 (array_inv!1209 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (array_inv!1210 (_values!2370 (v!2685 (underlying!296 thiss!992)))) e!58537))))

(declare-fun b!89921 () Bool)

(assert (=> b!89921 (= e!58548 tp_is_empty!2557)))

(declare-fun b!89922 () Bool)

(assert (=> b!89922 (= e!58553 (and e!58544 mapRes!3486))))

(declare-fun condMapEmpty!3486 () Bool)

(declare-fun mapDefault!3485 () ValueCell!935)

(assert (=> b!89922 (= condMapEmpty!3486 (= (arr!1931 (_values!2370 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3485)))))

(declare-fun b!89923 () Bool)

(assert (=> b!89923 (= e!58541 e!58546)))

(declare-fun res!45945 () Bool)

(assert (=> b!89923 (=> (not res!45945) (not e!58546))))

(declare-fun lt!43354 () ListLongMap!1467)

(assert (=> b!89923 (= res!45945 (= lt!43354 lt!43342))))

(declare-fun map!1200 (LongMapFixedSize!778) ListLongMap!1467)

(assert (=> b!89923 (= lt!43342 (map!1200 newMap!16))))

(declare-fun getCurrentListMap!432 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) Int) ListLongMap!1467)

(assert (=> b!89923 (= lt!43354 (getCurrentListMap!432 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun b!89924 () Bool)

(assert (=> b!89924 (= e!58551 (not (valid!350 (_2!1127 lt!43340))))))

(declare-fun lt!43352 () ListLongMap!1467)

(declare-fun lt!43343 () tuple2!2234)

(declare-fun lt!43347 () tuple2!2234)

(declare-fun lt!43344 () ListLongMap!1467)

(declare-fun +!114 (ListLongMap!1467 tuple2!2234) ListLongMap!1467)

(assert (=> b!89924 (= (+!114 lt!43344 lt!43343) (+!114 (+!114 lt!43352 lt!43343) lt!43347))))

(assert (=> b!89924 (= lt!43343 (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun lt!43355 () Unit!2679)

(declare-fun addCommutativeForDiffKeys!33 (ListLongMap!1467 (_ BitVec 64) V!3057 (_ BitVec 64) V!3057) Unit!2679)

(assert (=> b!89924 (= lt!43355 (addCommutativeForDiffKeys!33 lt!43352 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun lt!43350 () ListLongMap!1467)

(assert (=> b!89924 (= lt!43350 lt!43344)))

(assert (=> b!89924 (= lt!43344 (+!114 lt!43352 lt!43347))))

(declare-fun lt!43349 () ListLongMap!1467)

(declare-fun lt!43353 () tuple2!2234)

(assert (=> b!89924 (= lt!43350 (+!114 lt!43349 lt!43353))))

(declare-fun lt!43339 () ListLongMap!1467)

(assert (=> b!89924 (= lt!43352 (+!114 lt!43339 lt!43353))))

(assert (=> b!89924 (= lt!43353 (tuple2!2235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(assert (=> b!89924 (= lt!43349 (+!114 lt!43339 lt!43347))))

(assert (=> b!89924 (= lt!43347 (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338))))

(declare-fun lt!43341 () Unit!2679)

(assert (=> b!89924 (= lt!43341 (addCommutativeForDiffKeys!33 lt!43339 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!78 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) Int) ListLongMap!1467)

(assert (=> b!89924 (= lt!43339 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun mapNonEmpty!3486 () Bool)

(declare-fun tp!9090 () Bool)

(assert (=> mapNonEmpty!3486 (= mapRes!3486 (and tp!9090 e!58549))))

(declare-fun mapKey!3485 () (_ BitVec 32))

(declare-fun mapRest!3486 () (Array (_ BitVec 32) ValueCell!935))

(declare-fun mapValue!3485 () ValueCell!935)

(assert (=> mapNonEmpty!3486 (= (arr!1931 (_values!2370 newMap!16)) (store mapRest!3486 mapKey!3485 mapValue!3485))))

(assert (= (and start!11064 res!45941) b!89917))

(assert (= (and b!89917 res!45943) b!89916))

(assert (= (and b!89916 res!45947) b!89912))

(assert (= (and b!89912 res!45942) b!89923))

(assert (= (and b!89923 res!45945) b!89906))

(assert (= (and b!89906 res!45944) b!89910))

(assert (= (and b!89910 c!14932) b!89911))

(assert (= (and b!89910 (not c!14932)) b!89915))

(assert (= (and b!89910 res!45946) b!89924))

(assert (= (and b!89919 condMapEmpty!3485) mapIsEmpty!3485))

(assert (= (and b!89919 (not condMapEmpty!3485)) mapNonEmpty!3485))

(get-info :version)

(assert (= (and mapNonEmpty!3485 ((_ is ValueCellFull!935) mapValue!3486)) b!89921))

(assert (= (and b!89919 ((_ is ValueCellFull!935) mapDefault!3486)) b!89909))

(assert (= b!89920 b!89919))

(assert (= b!89918 b!89920))

(assert (= b!89908 b!89918))

(assert (= start!11064 b!89908))

(assert (= (and b!89922 condMapEmpty!3486) mapIsEmpty!3486))

(assert (= (and b!89922 (not condMapEmpty!3486)) mapNonEmpty!3486))

(assert (= (and mapNonEmpty!3486 ((_ is ValueCellFull!935) mapValue!3485)) b!89907))

(assert (= (and b!89922 ((_ is ValueCellFull!935) mapDefault!3485)) b!89913))

(assert (= b!89914 b!89922))

(assert (= start!11064 b!89914))

(declare-fun b_lambda!3969 () Bool)

(assert (=> (not b_lambda!3969) (not b!89906)))

(declare-fun t!5316 () Bool)

(declare-fun tb!1745 () Bool)

(assert (=> (and b!89920 (= (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))) t!5316) tb!1745))

(declare-fun result!2997 () Bool)

(assert (=> tb!1745 (= result!2997 tp_is_empty!2557)))

(assert (=> b!89906 t!5316))

(declare-fun b_and!5405 () Bool)

(assert (= b_and!5401 (and (=> t!5316 result!2997) b_and!5405)))

(declare-fun t!5318 () Bool)

(declare-fun tb!1747 () Bool)

(assert (=> (and b!89914 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))) t!5318) tb!1747))

(declare-fun result!3001 () Bool)

(assert (= result!3001 result!2997))

(assert (=> b!89906 t!5318))

(declare-fun b_and!5407 () Bool)

(assert (= b_and!5403 (and (=> t!5318 result!3001) b_and!5407)))

(declare-fun m!96485 () Bool)

(assert (=> b!89906 m!96485))

(declare-fun m!96487 () Bool)

(assert (=> b!89906 m!96487))

(declare-fun m!96489 () Bool)

(assert (=> b!89906 m!96489))

(assert (=> b!89906 m!96487))

(assert (=> b!89906 m!96489))

(declare-fun m!96491 () Bool)

(assert (=> b!89906 m!96491))

(declare-fun m!96493 () Bool)

(assert (=> b!89914 m!96493))

(declare-fun m!96495 () Bool)

(assert (=> b!89914 m!96495))

(assert (=> b!89910 m!96485))

(assert (=> b!89910 m!96485))

(declare-fun m!96497 () Bool)

(assert (=> b!89910 m!96497))

(assert (=> b!89910 m!96485))

(declare-fun m!96499 () Bool)

(assert (=> b!89910 m!96499))

(declare-fun m!96501 () Bool)

(assert (=> b!89923 m!96501))

(declare-fun m!96503 () Bool)

(assert (=> b!89923 m!96503))

(declare-fun m!96505 () Bool)

(assert (=> mapNonEmpty!3485 m!96505))

(declare-fun m!96507 () Bool)

(assert (=> b!89924 m!96507))

(declare-fun m!96509 () Bool)

(assert (=> b!89924 m!96509))

(declare-fun m!96511 () Bool)

(assert (=> b!89924 m!96511))

(assert (=> b!89924 m!96485))

(declare-fun m!96513 () Bool)

(assert (=> b!89924 m!96513))

(declare-fun m!96515 () Bool)

(assert (=> b!89924 m!96515))

(assert (=> b!89924 m!96485))

(declare-fun m!96517 () Bool)

(assert (=> b!89924 m!96517))

(declare-fun m!96519 () Bool)

(assert (=> b!89924 m!96519))

(declare-fun m!96521 () Bool)

(assert (=> b!89924 m!96521))

(assert (=> b!89924 m!96485))

(declare-fun m!96523 () Bool)

(assert (=> b!89924 m!96523))

(assert (=> b!89924 m!96511))

(declare-fun m!96525 () Bool)

(assert (=> b!89924 m!96525))

(declare-fun m!96527 () Bool)

(assert (=> b!89924 m!96527))

(declare-fun m!96529 () Bool)

(assert (=> b!89916 m!96529))

(declare-fun m!96531 () Bool)

(assert (=> start!11064 m!96531))

(declare-fun m!96533 () Bool)

(assert (=> b!89920 m!96533))

(declare-fun m!96535 () Bool)

(assert (=> b!89920 m!96535))

(declare-fun m!96537 () Bool)

(assert (=> b!89911 m!96537))

(declare-fun m!96539 () Bool)

(assert (=> b!89911 m!96539))

(assert (=> b!89911 m!96485))

(declare-fun m!96541 () Bool)

(assert (=> b!89911 m!96541))

(assert (=> b!89911 m!96485))

(assert (=> b!89911 m!96485))

(declare-fun m!96543 () Bool)

(assert (=> b!89911 m!96543))

(assert (=> b!89911 m!96485))

(declare-fun m!96545 () Bool)

(assert (=> b!89911 m!96545))

(declare-fun m!96547 () Bool)

(assert (=> mapNonEmpty!3486 m!96547))

(check-sat tp_is_empty!2557 b_and!5405 (not b_next!2281) (not mapNonEmpty!3486) (not b!89920) (not start!11064) (not b!89923) (not b!89911) (not mapNonEmpty!3485) (not b!89924) (not b!89910) b_and!5407 (not b!89916) (not b_next!2283) (not b!89914) (not b!89906) (not b_lambda!3969))
(check-sat b_and!5405 b_and!5407 (not b_next!2281) (not b_next!2283))
(get-model)

(declare-fun b_lambda!3975 () Bool)

(assert (= b_lambda!3969 (or (and b!89920 b_free!2281) (and b!89914 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))))) b_lambda!3975)))

(check-sat b_and!5405 (not b_next!2281) (not mapNonEmpty!3486) (not b!89920) (not start!11064) (not b!89923) (not b!89906) tp_is_empty!2557 (not b_lambda!3975) (not b!89911) (not mapNonEmpty!3485) (not b!89924) (not b!89910) b_and!5407 (not b!89916) (not b_next!2283) (not b!89914))
(check-sat b_and!5405 b_and!5407 (not b_next!2281) (not b_next!2283))
(get-model)

(declare-fun d!23921 () Bool)

(assert (=> d!23921 (= (valid!349 thiss!992) (valid!350 (v!2685 (underlying!296 thiss!992))))))

(declare-fun bs!3768 () Bool)

(assert (= bs!3768 d!23921))

(declare-fun m!96677 () Bool)

(assert (=> bs!3768 m!96677))

(assert (=> start!11064 d!23921))

(declare-fun d!23923 () Bool)

(declare-fun res!45996 () Bool)

(declare-fun e!58658 () Bool)

(assert (=> d!23923 (=> (not res!45996) (not e!58658))))

(declare-fun simpleValid!61 (LongMapFixedSize!778) Bool)

(assert (=> d!23923 (= res!45996 (simpleValid!61 newMap!16))))

(assert (=> d!23923 (= (valid!350 newMap!16) e!58658)))

(declare-fun b!90051 () Bool)

(declare-fun res!45997 () Bool)

(assert (=> b!90051 (=> (not res!45997) (not e!58658))))

(declare-fun arrayCountValidKeys!0 (array!4059 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!90051 (= res!45997 (= (arrayCountValidKeys!0 (_keys!4066 newMap!16) #b00000000000000000000000000000000 (size!2178 (_keys!4066 newMap!16))) (_size!438 newMap!16)))))

(declare-fun b!90052 () Bool)

(declare-fun res!45998 () Bool)

(assert (=> b!90052 (=> (not res!45998) (not e!58658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4059 (_ BitVec 32)) Bool)

(assert (=> b!90052 (= res!45998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4066 newMap!16) (mask!6438 newMap!16)))))

(declare-fun b!90053 () Bool)

(assert (=> b!90053 (= e!58658 (arrayNoDuplicates!0 (_keys!4066 newMap!16) #b00000000000000000000000000000000 Nil!1540))))

(assert (= (and d!23923 res!45996) b!90051))

(assert (= (and b!90051 res!45997) b!90052))

(assert (= (and b!90052 res!45998) b!90053))

(declare-fun m!96679 () Bool)

(assert (=> d!23923 m!96679))

(declare-fun m!96681 () Bool)

(assert (=> b!90051 m!96681))

(declare-fun m!96683 () Bool)

(assert (=> b!90052 m!96683))

(declare-fun m!96685 () Bool)

(assert (=> b!90053 m!96685))

(assert (=> b!89916 d!23923))

(declare-fun d!23925 () Bool)

(assert (=> d!23925 (= (array_inv!1209 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvsge (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!89920 d!23925))

(declare-fun d!23927 () Bool)

(assert (=> d!23927 (= (array_inv!1210 (_values!2370 (v!2685 (underlying!296 thiss!992)))) (bvsge (size!2179 (_values!2370 (v!2685 (underlying!296 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!89920 d!23927))

(declare-fun d!23929 () Bool)

(declare-fun c!14941 () Bool)

(assert (=> d!23929 (= c!14941 ((_ is ValueCellFull!935) (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun e!58661 () V!3057)

(assert (=> d!23929 (= (get!1224 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) from!355) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!58661)))

(declare-fun b!90058 () Bool)

(declare-fun get!1226 (ValueCell!935 V!3057) V!3057)

(assert (=> b!90058 (= e!58661 (get!1226 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) from!355) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90059 () Bool)

(declare-fun get!1227 (ValueCell!935 V!3057) V!3057)

(assert (=> b!90059 (= e!58661 (get!1227 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) from!355) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23929 c!14941) b!90058))

(assert (= (and d!23929 (not c!14941)) b!90059))

(assert (=> b!90058 m!96487))

(assert (=> b!90058 m!96489))

(declare-fun m!96687 () Bool)

(assert (=> b!90058 m!96687))

(assert (=> b!90059 m!96487))

(assert (=> b!90059 m!96489))

(declare-fun m!96689 () Bool)

(assert (=> b!90059 m!96689))

(assert (=> b!89906 d!23929))

(declare-fun d!23931 () Bool)

(declare-fun e!58664 () Bool)

(assert (=> d!23931 e!58664))

(declare-fun res!46003 () Bool)

(assert (=> d!23931 (=> (not res!46003) (not e!58664))))

(declare-fun lt!43473 () ListLongMap!1467)

(assert (=> d!23931 (= res!46003 (contains!763 lt!43473 (_1!1128 lt!43353)))))

(declare-fun lt!43474 () List!1542)

(assert (=> d!23931 (= lt!43473 (ListLongMap!1468 lt!43474))))

(declare-fun lt!43472 () Unit!2679)

(declare-fun lt!43475 () Unit!2679)

(assert (=> d!23931 (= lt!43472 lt!43475)))

(declare-datatypes ((Option!147 0))(
  ( (Some!146 (v!2691 V!3057)) (None!145) )
))
(declare-fun getValueByKey!141 (List!1542 (_ BitVec 64)) Option!147)

(assert (=> d!23931 (= (getValueByKey!141 lt!43474 (_1!1128 lt!43353)) (Some!146 (_2!1128 lt!43353)))))

(declare-fun lemmaContainsTupThenGetReturnValue!61 (List!1542 (_ BitVec 64) V!3057) Unit!2679)

(assert (=> d!23931 (= lt!43475 (lemmaContainsTupThenGetReturnValue!61 lt!43474 (_1!1128 lt!43353) (_2!1128 lt!43353)))))

(declare-fun insertStrictlySorted!64 (List!1542 (_ BitVec 64) V!3057) List!1542)

(assert (=> d!23931 (= lt!43474 (insertStrictlySorted!64 (toList!749 lt!43339) (_1!1128 lt!43353) (_2!1128 lt!43353)))))

(assert (=> d!23931 (= (+!114 lt!43339 lt!43353) lt!43473)))

(declare-fun b!90064 () Bool)

(declare-fun res!46004 () Bool)

(assert (=> b!90064 (=> (not res!46004) (not e!58664))))

(assert (=> b!90064 (= res!46004 (= (getValueByKey!141 (toList!749 lt!43473) (_1!1128 lt!43353)) (Some!146 (_2!1128 lt!43353))))))

(declare-fun b!90065 () Bool)

(declare-fun contains!765 (List!1542 tuple2!2234) Bool)

(assert (=> b!90065 (= e!58664 (contains!765 (toList!749 lt!43473) lt!43353))))

(assert (= (and d!23931 res!46003) b!90064))

(assert (= (and b!90064 res!46004) b!90065))

(declare-fun m!96691 () Bool)

(assert (=> d!23931 m!96691))

(declare-fun m!96693 () Bool)

(assert (=> d!23931 m!96693))

(declare-fun m!96695 () Bool)

(assert (=> d!23931 m!96695))

(declare-fun m!96697 () Bool)

(assert (=> d!23931 m!96697))

(declare-fun m!96699 () Bool)

(assert (=> b!90064 m!96699))

(declare-fun m!96701 () Bool)

(assert (=> b!90065 m!96701))

(assert (=> b!89924 d!23931))

(declare-fun d!23933 () Bool)

(declare-fun res!46005 () Bool)

(declare-fun e!58665 () Bool)

(assert (=> d!23933 (=> (not res!46005) (not e!58665))))

(assert (=> d!23933 (= res!46005 (simpleValid!61 (_2!1127 lt!43340)))))

(assert (=> d!23933 (= (valid!350 (_2!1127 lt!43340)) e!58665)))

(declare-fun b!90066 () Bool)

(declare-fun res!46006 () Bool)

(assert (=> b!90066 (=> (not res!46006) (not e!58665))))

(assert (=> b!90066 (= res!46006 (= (arrayCountValidKeys!0 (_keys!4066 (_2!1127 lt!43340)) #b00000000000000000000000000000000 (size!2178 (_keys!4066 (_2!1127 lt!43340)))) (_size!438 (_2!1127 lt!43340))))))

(declare-fun b!90067 () Bool)

(declare-fun res!46007 () Bool)

(assert (=> b!90067 (=> (not res!46007) (not e!58665))))

(assert (=> b!90067 (= res!46007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4066 (_2!1127 lt!43340)) (mask!6438 (_2!1127 lt!43340))))))

(declare-fun b!90068 () Bool)

(assert (=> b!90068 (= e!58665 (arrayNoDuplicates!0 (_keys!4066 (_2!1127 lt!43340)) #b00000000000000000000000000000000 Nil!1540))))

(assert (= (and d!23933 res!46005) b!90066))

(assert (= (and b!90066 res!46006) b!90067))

(assert (= (and b!90067 res!46007) b!90068))

(declare-fun m!96703 () Bool)

(assert (=> d!23933 m!96703))

(declare-fun m!96705 () Bool)

(assert (=> b!90066 m!96705))

(declare-fun m!96707 () Bool)

(assert (=> b!90067 m!96707))

(declare-fun m!96709 () Bool)

(assert (=> b!90068 m!96709))

(assert (=> b!89924 d!23933))

(declare-fun d!23935 () Bool)

(declare-fun e!58666 () Bool)

(assert (=> d!23935 e!58666))

(declare-fun res!46008 () Bool)

(assert (=> d!23935 (=> (not res!46008) (not e!58666))))

(declare-fun lt!43477 () ListLongMap!1467)

(assert (=> d!23935 (= res!46008 (contains!763 lt!43477 (_1!1128 lt!43353)))))

(declare-fun lt!43478 () List!1542)

(assert (=> d!23935 (= lt!43477 (ListLongMap!1468 lt!43478))))

(declare-fun lt!43476 () Unit!2679)

(declare-fun lt!43479 () Unit!2679)

(assert (=> d!23935 (= lt!43476 lt!43479)))

(assert (=> d!23935 (= (getValueByKey!141 lt!43478 (_1!1128 lt!43353)) (Some!146 (_2!1128 lt!43353)))))

(assert (=> d!23935 (= lt!43479 (lemmaContainsTupThenGetReturnValue!61 lt!43478 (_1!1128 lt!43353) (_2!1128 lt!43353)))))

(assert (=> d!23935 (= lt!43478 (insertStrictlySorted!64 (toList!749 lt!43349) (_1!1128 lt!43353) (_2!1128 lt!43353)))))

(assert (=> d!23935 (= (+!114 lt!43349 lt!43353) lt!43477)))

(declare-fun b!90069 () Bool)

(declare-fun res!46009 () Bool)

(assert (=> b!90069 (=> (not res!46009) (not e!58666))))

(assert (=> b!90069 (= res!46009 (= (getValueByKey!141 (toList!749 lt!43477) (_1!1128 lt!43353)) (Some!146 (_2!1128 lt!43353))))))

(declare-fun b!90070 () Bool)

(assert (=> b!90070 (= e!58666 (contains!765 (toList!749 lt!43477) lt!43353))))

(assert (= (and d!23935 res!46008) b!90069))

(assert (= (and b!90069 res!46009) b!90070))

(declare-fun m!96711 () Bool)

(assert (=> d!23935 m!96711))

(declare-fun m!96713 () Bool)

(assert (=> d!23935 m!96713))

(declare-fun m!96715 () Bool)

(assert (=> d!23935 m!96715))

(declare-fun m!96717 () Bool)

(assert (=> d!23935 m!96717))

(declare-fun m!96719 () Bool)

(assert (=> b!90069 m!96719))

(declare-fun m!96721 () Bool)

(assert (=> b!90070 m!96721))

(assert (=> b!89924 d!23935))

(declare-fun d!23937 () Bool)

(declare-fun e!58667 () Bool)

(assert (=> d!23937 e!58667))

(declare-fun res!46010 () Bool)

(assert (=> d!23937 (=> (not res!46010) (not e!58667))))

(declare-fun lt!43481 () ListLongMap!1467)

(assert (=> d!23937 (= res!46010 (contains!763 lt!43481 (_1!1128 lt!43347)))))

(declare-fun lt!43482 () List!1542)

(assert (=> d!23937 (= lt!43481 (ListLongMap!1468 lt!43482))))

(declare-fun lt!43480 () Unit!2679)

(declare-fun lt!43483 () Unit!2679)

(assert (=> d!23937 (= lt!43480 lt!43483)))

(assert (=> d!23937 (= (getValueByKey!141 lt!43482 (_1!1128 lt!43347)) (Some!146 (_2!1128 lt!43347)))))

(assert (=> d!23937 (= lt!43483 (lemmaContainsTupThenGetReturnValue!61 lt!43482 (_1!1128 lt!43347) (_2!1128 lt!43347)))))

(assert (=> d!23937 (= lt!43482 (insertStrictlySorted!64 (toList!749 (+!114 lt!43352 lt!43343)) (_1!1128 lt!43347) (_2!1128 lt!43347)))))

(assert (=> d!23937 (= (+!114 (+!114 lt!43352 lt!43343) lt!43347) lt!43481)))

(declare-fun b!90071 () Bool)

(declare-fun res!46011 () Bool)

(assert (=> b!90071 (=> (not res!46011) (not e!58667))))

(assert (=> b!90071 (= res!46011 (= (getValueByKey!141 (toList!749 lt!43481) (_1!1128 lt!43347)) (Some!146 (_2!1128 lt!43347))))))

(declare-fun b!90072 () Bool)

(assert (=> b!90072 (= e!58667 (contains!765 (toList!749 lt!43481) lt!43347))))

(assert (= (and d!23937 res!46010) b!90071))

(assert (= (and b!90071 res!46011) b!90072))

(declare-fun m!96723 () Bool)

(assert (=> d!23937 m!96723))

(declare-fun m!96725 () Bool)

(assert (=> d!23937 m!96725))

(declare-fun m!96727 () Bool)

(assert (=> d!23937 m!96727))

(declare-fun m!96729 () Bool)

(assert (=> d!23937 m!96729))

(declare-fun m!96731 () Bool)

(assert (=> b!90071 m!96731))

(declare-fun m!96733 () Bool)

(assert (=> b!90072 m!96733))

(assert (=> b!89924 d!23937))

(declare-fun d!23939 () Bool)

(declare-fun e!58668 () Bool)

(assert (=> d!23939 e!58668))

(declare-fun res!46012 () Bool)

(assert (=> d!23939 (=> (not res!46012) (not e!58668))))

(declare-fun lt!43485 () ListLongMap!1467)

(assert (=> d!23939 (= res!46012 (contains!763 lt!43485 (_1!1128 lt!43347)))))

(declare-fun lt!43486 () List!1542)

(assert (=> d!23939 (= lt!43485 (ListLongMap!1468 lt!43486))))

(declare-fun lt!43484 () Unit!2679)

(declare-fun lt!43487 () Unit!2679)

(assert (=> d!23939 (= lt!43484 lt!43487)))

(assert (=> d!23939 (= (getValueByKey!141 lt!43486 (_1!1128 lt!43347)) (Some!146 (_2!1128 lt!43347)))))

(assert (=> d!23939 (= lt!43487 (lemmaContainsTupThenGetReturnValue!61 lt!43486 (_1!1128 lt!43347) (_2!1128 lt!43347)))))

(assert (=> d!23939 (= lt!43486 (insertStrictlySorted!64 (toList!749 lt!43339) (_1!1128 lt!43347) (_2!1128 lt!43347)))))

(assert (=> d!23939 (= (+!114 lt!43339 lt!43347) lt!43485)))

(declare-fun b!90073 () Bool)

(declare-fun res!46013 () Bool)

(assert (=> b!90073 (=> (not res!46013) (not e!58668))))

(assert (=> b!90073 (= res!46013 (= (getValueByKey!141 (toList!749 lt!43485) (_1!1128 lt!43347)) (Some!146 (_2!1128 lt!43347))))))

(declare-fun b!90074 () Bool)

(assert (=> b!90074 (= e!58668 (contains!765 (toList!749 lt!43485) lt!43347))))

(assert (= (and d!23939 res!46012) b!90073))

(assert (= (and b!90073 res!46013) b!90074))

(declare-fun m!96735 () Bool)

(assert (=> d!23939 m!96735))

(declare-fun m!96737 () Bool)

(assert (=> d!23939 m!96737))

(declare-fun m!96739 () Bool)

(assert (=> d!23939 m!96739))

(declare-fun m!96741 () Bool)

(assert (=> d!23939 m!96741))

(declare-fun m!96743 () Bool)

(assert (=> b!90073 m!96743))

(declare-fun m!96745 () Bool)

(assert (=> b!90074 m!96745))

(assert (=> b!89924 d!23939))

(declare-fun d!23941 () Bool)

(assert (=> d!23941 (= (+!114 (+!114 lt!43352 (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338)) (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992))))) (+!114 (+!114 lt!43352 (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992))))) (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338)))))

(declare-fun lt!43490 () Unit!2679)

(declare-fun choose!546 (ListLongMap!1467 (_ BitVec 64) V!3057 (_ BitVec 64) V!3057) Unit!2679)

(assert (=> d!23941 (= lt!43490 (choose!546 lt!43352 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(assert (=> d!23941 (not (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23941 (= (addCommutativeForDiffKeys!33 lt!43352 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992)))) lt!43490)))

(declare-fun bs!3769 () Bool)

(assert (= bs!3769 d!23941))

(assert (=> bs!3769 m!96485))

(declare-fun m!96747 () Bool)

(assert (=> bs!3769 m!96747))

(declare-fun m!96749 () Bool)

(assert (=> bs!3769 m!96749))

(declare-fun m!96751 () Bool)

(assert (=> bs!3769 m!96751))

(declare-fun m!96753 () Bool)

(assert (=> bs!3769 m!96753))

(assert (=> bs!3769 m!96753))

(declare-fun m!96755 () Bool)

(assert (=> bs!3769 m!96755))

(assert (=> bs!3769 m!96749))

(assert (=> b!89924 d!23941))

(declare-fun d!23943 () Bool)

(declare-fun e!58669 () Bool)

(assert (=> d!23943 e!58669))

(declare-fun res!46014 () Bool)

(assert (=> d!23943 (=> (not res!46014) (not e!58669))))

(declare-fun lt!43492 () ListLongMap!1467)

(assert (=> d!23943 (= res!46014 (contains!763 lt!43492 (_1!1128 lt!43343)))))

(declare-fun lt!43493 () List!1542)

(assert (=> d!23943 (= lt!43492 (ListLongMap!1468 lt!43493))))

(declare-fun lt!43491 () Unit!2679)

(declare-fun lt!43494 () Unit!2679)

(assert (=> d!23943 (= lt!43491 lt!43494)))

(assert (=> d!23943 (= (getValueByKey!141 lt!43493 (_1!1128 lt!43343)) (Some!146 (_2!1128 lt!43343)))))

(assert (=> d!23943 (= lt!43494 (lemmaContainsTupThenGetReturnValue!61 lt!43493 (_1!1128 lt!43343) (_2!1128 lt!43343)))))

(assert (=> d!23943 (= lt!43493 (insertStrictlySorted!64 (toList!749 lt!43344) (_1!1128 lt!43343) (_2!1128 lt!43343)))))

(assert (=> d!23943 (= (+!114 lt!43344 lt!43343) lt!43492)))

(declare-fun b!90075 () Bool)

(declare-fun res!46015 () Bool)

(assert (=> b!90075 (=> (not res!46015) (not e!58669))))

(assert (=> b!90075 (= res!46015 (= (getValueByKey!141 (toList!749 lt!43492) (_1!1128 lt!43343)) (Some!146 (_2!1128 lt!43343))))))

(declare-fun b!90076 () Bool)

(assert (=> b!90076 (= e!58669 (contains!765 (toList!749 lt!43492) lt!43343))))

(assert (= (and d!23943 res!46014) b!90075))

(assert (= (and b!90075 res!46015) b!90076))

(declare-fun m!96757 () Bool)

(assert (=> d!23943 m!96757))

(declare-fun m!96759 () Bool)

(assert (=> d!23943 m!96759))

(declare-fun m!96761 () Bool)

(assert (=> d!23943 m!96761))

(declare-fun m!96763 () Bool)

(assert (=> d!23943 m!96763))

(declare-fun m!96765 () Bool)

(assert (=> b!90075 m!96765))

(declare-fun m!96767 () Bool)

(assert (=> b!90076 m!96767))

(assert (=> b!89924 d!23943))

(declare-fun d!23945 () Bool)

(declare-fun e!58670 () Bool)

(assert (=> d!23945 e!58670))

(declare-fun res!46016 () Bool)

(assert (=> d!23945 (=> (not res!46016) (not e!58670))))

(declare-fun lt!43496 () ListLongMap!1467)

(assert (=> d!23945 (= res!46016 (contains!763 lt!43496 (_1!1128 lt!43347)))))

(declare-fun lt!43497 () List!1542)

(assert (=> d!23945 (= lt!43496 (ListLongMap!1468 lt!43497))))

(declare-fun lt!43495 () Unit!2679)

(declare-fun lt!43498 () Unit!2679)

(assert (=> d!23945 (= lt!43495 lt!43498)))

(assert (=> d!23945 (= (getValueByKey!141 lt!43497 (_1!1128 lt!43347)) (Some!146 (_2!1128 lt!43347)))))

(assert (=> d!23945 (= lt!43498 (lemmaContainsTupThenGetReturnValue!61 lt!43497 (_1!1128 lt!43347) (_2!1128 lt!43347)))))

(assert (=> d!23945 (= lt!43497 (insertStrictlySorted!64 (toList!749 lt!43352) (_1!1128 lt!43347) (_2!1128 lt!43347)))))

(assert (=> d!23945 (= (+!114 lt!43352 lt!43347) lt!43496)))

(declare-fun b!90077 () Bool)

(declare-fun res!46017 () Bool)

(assert (=> b!90077 (=> (not res!46017) (not e!58670))))

(assert (=> b!90077 (= res!46017 (= (getValueByKey!141 (toList!749 lt!43496) (_1!1128 lt!43347)) (Some!146 (_2!1128 lt!43347))))))

(declare-fun b!90078 () Bool)

(assert (=> b!90078 (= e!58670 (contains!765 (toList!749 lt!43496) lt!43347))))

(assert (= (and d!23945 res!46016) b!90077))

(assert (= (and b!90077 res!46017) b!90078))

(declare-fun m!96769 () Bool)

(assert (=> d!23945 m!96769))

(declare-fun m!96771 () Bool)

(assert (=> d!23945 m!96771))

(declare-fun m!96773 () Bool)

(assert (=> d!23945 m!96773))

(declare-fun m!96775 () Bool)

(assert (=> d!23945 m!96775))

(declare-fun m!96777 () Bool)

(assert (=> b!90077 m!96777))

(declare-fun m!96779 () Bool)

(assert (=> b!90078 m!96779))

(assert (=> b!89924 d!23945))

(declare-fun b!90103 () Bool)

(declare-fun res!46026 () Bool)

(declare-fun e!58688 () Bool)

(assert (=> b!90103 (=> (not res!46026) (not e!58688))))

(declare-fun lt!43519 () ListLongMap!1467)

(assert (=> b!90103 (= res!46026 (not (contains!763 lt!43519 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90104 () Bool)

(assert (=> b!90104 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(assert (=> b!90104 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2179 (_values!2370 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun e!58689 () Bool)

(declare-fun apply!85 (ListLongMap!1467 (_ BitVec 64)) V!3057)

(assert (=> b!90104 (= e!58689 (= (apply!85 lt!43519 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1224 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!58687 () Bool)

(declare-fun b!90105 () Bool)

(assert (=> b!90105 (= e!58687 (= lt!43519 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun b!90106 () Bool)

(declare-fun e!58686 () Bool)

(assert (=> b!90106 (= e!58686 e!58689)))

(assert (=> b!90106 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun res!46028 () Bool)

(assert (=> b!90106 (= res!46028 (contains!763 lt!43519 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90106 (=> (not res!46028) (not e!58689))))

(declare-fun d!23947 () Bool)

(assert (=> d!23947 e!58688))

(declare-fun res!46027 () Bool)

(assert (=> d!23947 (=> (not res!46027) (not e!58688))))

(assert (=> d!23947 (= res!46027 (not (contains!763 lt!43519 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!58691 () ListLongMap!1467)

(assert (=> d!23947 (= lt!43519 e!58691)))

(declare-fun c!14951 () Bool)

(assert (=> d!23947 (= c!14951 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!23947 (validMask!0 (mask!6438 (v!2685 (underlying!296 thiss!992))))))

(assert (=> d!23947 (= (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))) lt!43519)))

(declare-fun b!90107 () Bool)

(declare-fun e!58690 () ListLongMap!1467)

(assert (=> b!90107 (= e!58691 e!58690)))

(declare-fun c!14953 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!90107 (= c!14953 (validKeyInArray!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90108 () Bool)

(declare-fun isEmpty!348 (ListLongMap!1467) Bool)

(assert (=> b!90108 (= e!58687 (isEmpty!348 lt!43519))))

(declare-fun b!90109 () Bool)

(assert (=> b!90109 (= e!58686 e!58687)))

(declare-fun c!14950 () Bool)

(assert (=> b!90109 (= c!14950 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun b!90110 () Bool)

(declare-fun lt!43516 () Unit!2679)

(declare-fun lt!43513 () Unit!2679)

(assert (=> b!90110 (= lt!43516 lt!43513)))

(declare-fun lt!43518 () (_ BitVec 64))

(declare-fun lt!43515 () (_ BitVec 64))

(declare-fun lt!43514 () ListLongMap!1467)

(declare-fun lt!43517 () V!3057)

(assert (=> b!90110 (not (contains!763 (+!114 lt!43514 (tuple2!2235 lt!43515 lt!43517)) lt!43518))))

(declare-fun addStillNotContains!35 (ListLongMap!1467 (_ BitVec 64) V!3057 (_ BitVec 64)) Unit!2679)

(assert (=> b!90110 (= lt!43513 (addStillNotContains!35 lt!43514 lt!43515 lt!43517 lt!43518))))

(assert (=> b!90110 (= lt!43518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!90110 (= lt!43517 (get!1224 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90110 (= lt!43515 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!8715 () ListLongMap!1467)

(assert (=> b!90110 (= lt!43514 call!8715)))

(assert (=> b!90110 (= e!58690 (+!114 call!8715 (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1224 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!90111 () Bool)

(assert (=> b!90111 (= e!58688 e!58686)))

(declare-fun c!14952 () Bool)

(declare-fun e!58685 () Bool)

(assert (=> b!90111 (= c!14952 e!58685)))

(declare-fun res!46029 () Bool)

(assert (=> b!90111 (=> (not res!46029) (not e!58685))))

(assert (=> b!90111 (= res!46029 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun b!90112 () Bool)

(assert (=> b!90112 (= e!58691 (ListLongMap!1468 Nil!1539))))

(declare-fun b!90113 () Bool)

(assert (=> b!90113 (= e!58685 (validKeyInArray!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90113 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!90114 () Bool)

(assert (=> b!90114 (= e!58690 call!8715)))

(declare-fun bm!8712 () Bool)

(assert (=> bm!8712 (= call!8715 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(assert (= (and d!23947 c!14951) b!90112))

(assert (= (and d!23947 (not c!14951)) b!90107))

(assert (= (and b!90107 c!14953) b!90110))

(assert (= (and b!90107 (not c!14953)) b!90114))

(assert (= (or b!90110 b!90114) bm!8712))

(assert (= (and d!23947 res!46027) b!90103))

(assert (= (and b!90103 res!46026) b!90111))

(assert (= (and b!90111 res!46029) b!90113))

(assert (= (and b!90111 c!14952) b!90106))

(assert (= (and b!90111 (not c!14952)) b!90109))

(assert (= (and b!90106 res!46028) b!90104))

(assert (= (and b!90109 c!14950) b!90105))

(assert (= (and b!90109 (not c!14950)) b!90108))

(declare-fun b_lambda!3977 () Bool)

(assert (=> (not b_lambda!3977) (not b!90104)))

(assert (=> b!90104 t!5316))

(declare-fun b_and!5425 () Bool)

(assert (= b_and!5405 (and (=> t!5316 result!2997) b_and!5425)))

(assert (=> b!90104 t!5318))

(declare-fun b_and!5427 () Bool)

(assert (= b_and!5407 (and (=> t!5318 result!3001) b_and!5427)))

(declare-fun b_lambda!3979 () Bool)

(assert (=> (not b_lambda!3979) (not b!90110)))

(assert (=> b!90110 t!5316))

(declare-fun b_and!5429 () Bool)

(assert (= b_and!5425 (and (=> t!5316 result!2997) b_and!5429)))

(assert (=> b!90110 t!5318))

(declare-fun b_and!5431 () Bool)

(assert (= b_and!5427 (and (=> t!5318 result!3001) b_and!5431)))

(declare-fun m!96781 () Bool)

(assert (=> b!90104 m!96781))

(declare-fun m!96783 () Bool)

(assert (=> b!90104 m!96783))

(assert (=> b!90104 m!96781))

(declare-fun m!96785 () Bool)

(assert (=> b!90104 m!96785))

(assert (=> b!90104 m!96489))

(declare-fun m!96787 () Bool)

(assert (=> b!90104 m!96787))

(assert (=> b!90104 m!96785))

(assert (=> b!90104 m!96489))

(assert (=> b!90110 m!96781))

(declare-fun m!96789 () Bool)

(assert (=> b!90110 m!96789))

(declare-fun m!96791 () Bool)

(assert (=> b!90110 m!96791))

(declare-fun m!96793 () Bool)

(assert (=> b!90110 m!96793))

(assert (=> b!90110 m!96789))

(declare-fun m!96795 () Bool)

(assert (=> b!90110 m!96795))

(assert (=> b!90110 m!96785))

(assert (=> b!90110 m!96489))

(assert (=> b!90110 m!96787))

(assert (=> b!90110 m!96785))

(assert (=> b!90110 m!96489))

(assert (=> b!90107 m!96781))

(assert (=> b!90107 m!96781))

(declare-fun m!96797 () Bool)

(assert (=> b!90107 m!96797))

(declare-fun m!96799 () Bool)

(assert (=> b!90103 m!96799))

(declare-fun m!96801 () Bool)

(assert (=> b!90108 m!96801))

(declare-fun m!96803 () Bool)

(assert (=> d!23947 m!96803))

(declare-fun m!96805 () Bool)

(assert (=> d!23947 m!96805))

(assert (=> b!90106 m!96781))

(assert (=> b!90106 m!96781))

(declare-fun m!96807 () Bool)

(assert (=> b!90106 m!96807))

(assert (=> b!90113 m!96781))

(assert (=> b!90113 m!96781))

(assert (=> b!90113 m!96797))

(declare-fun m!96809 () Bool)

(assert (=> b!90105 m!96809))

(assert (=> bm!8712 m!96809))

(assert (=> b!89924 d!23947))

(declare-fun d!23949 () Bool)

(assert (=> d!23949 (= (+!114 (+!114 lt!43339 (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338)) (tuple2!2235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992))))) (+!114 (+!114 lt!43339 (tuple2!2235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992))))) (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338)))))

(declare-fun lt!43520 () Unit!2679)

(assert (=> d!23949 (= lt!43520 (choose!546 lt!43339 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(assert (=> d!23949 (not (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23949 (= (addCommutativeForDiffKeys!33 lt!43339 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992)))) lt!43520)))

(declare-fun bs!3770 () Bool)

(assert (= bs!3770 d!23949))

(assert (=> bs!3770 m!96485))

(declare-fun m!96811 () Bool)

(assert (=> bs!3770 m!96811))

(declare-fun m!96813 () Bool)

(assert (=> bs!3770 m!96813))

(declare-fun m!96815 () Bool)

(assert (=> bs!3770 m!96815))

(declare-fun m!96817 () Bool)

(assert (=> bs!3770 m!96817))

(assert (=> bs!3770 m!96817))

(declare-fun m!96819 () Bool)

(assert (=> bs!3770 m!96819))

(assert (=> bs!3770 m!96813))

(assert (=> b!89924 d!23949))

(declare-fun d!23951 () Bool)

(declare-fun e!58692 () Bool)

(assert (=> d!23951 e!58692))

(declare-fun res!46030 () Bool)

(assert (=> d!23951 (=> (not res!46030) (not e!58692))))

(declare-fun lt!43522 () ListLongMap!1467)

(assert (=> d!23951 (= res!46030 (contains!763 lt!43522 (_1!1128 lt!43343)))))

(declare-fun lt!43523 () List!1542)

(assert (=> d!23951 (= lt!43522 (ListLongMap!1468 lt!43523))))

(declare-fun lt!43521 () Unit!2679)

(declare-fun lt!43524 () Unit!2679)

(assert (=> d!23951 (= lt!43521 lt!43524)))

(assert (=> d!23951 (= (getValueByKey!141 lt!43523 (_1!1128 lt!43343)) (Some!146 (_2!1128 lt!43343)))))

(assert (=> d!23951 (= lt!43524 (lemmaContainsTupThenGetReturnValue!61 lt!43523 (_1!1128 lt!43343) (_2!1128 lt!43343)))))

(assert (=> d!23951 (= lt!43523 (insertStrictlySorted!64 (toList!749 lt!43352) (_1!1128 lt!43343) (_2!1128 lt!43343)))))

(assert (=> d!23951 (= (+!114 lt!43352 lt!43343) lt!43522)))

(declare-fun b!90115 () Bool)

(declare-fun res!46031 () Bool)

(assert (=> b!90115 (=> (not res!46031) (not e!58692))))

(assert (=> b!90115 (= res!46031 (= (getValueByKey!141 (toList!749 lt!43522) (_1!1128 lt!43343)) (Some!146 (_2!1128 lt!43343))))))

(declare-fun b!90116 () Bool)

(assert (=> b!90116 (= e!58692 (contains!765 (toList!749 lt!43522) lt!43343))))

(assert (= (and d!23951 res!46030) b!90115))

(assert (= (and b!90115 res!46031) b!90116))

(declare-fun m!96821 () Bool)

(assert (=> d!23951 m!96821))

(declare-fun m!96823 () Bool)

(assert (=> d!23951 m!96823))

(declare-fun m!96825 () Bool)

(assert (=> d!23951 m!96825))

(declare-fun m!96827 () Bool)

(assert (=> d!23951 m!96827))

(declare-fun m!96829 () Bool)

(assert (=> b!90115 m!96829))

(declare-fun m!96831 () Bool)

(assert (=> b!90116 m!96831))

(assert (=> b!89924 d!23951))

(declare-fun d!23953 () Bool)

(declare-fun e!58697 () Bool)

(assert (=> d!23953 e!58697))

(declare-fun res!46034 () Bool)

(assert (=> d!23953 (=> res!46034 e!58697)))

(declare-fun lt!43536 () Bool)

(assert (=> d!23953 (= res!46034 (not lt!43536))))

(declare-fun lt!43535 () Bool)

(assert (=> d!23953 (= lt!43536 lt!43535)))

(declare-fun lt!43534 () Unit!2679)

(declare-fun e!58698 () Unit!2679)

(assert (=> d!23953 (= lt!43534 e!58698)))

(declare-fun c!14956 () Bool)

(assert (=> d!23953 (= c!14956 lt!43535)))

(declare-fun containsKey!145 (List!1542 (_ BitVec 64)) Bool)

(assert (=> d!23953 (= lt!43535 (containsKey!145 (toList!749 lt!43342) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(assert (=> d!23953 (= (contains!763 lt!43342 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)) lt!43536)))

(declare-fun b!90123 () Bool)

(declare-fun lt!43533 () Unit!2679)

(assert (=> b!90123 (= e!58698 lt!43533)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!94 (List!1542 (_ BitVec 64)) Unit!2679)

(assert (=> b!90123 (= lt!43533 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!749 lt!43342) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun isDefined!95 (Option!147) Bool)

(assert (=> b!90123 (isDefined!95 (getValueByKey!141 (toList!749 lt!43342) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun b!90124 () Bool)

(declare-fun Unit!2687 () Unit!2679)

(assert (=> b!90124 (= e!58698 Unit!2687)))

(declare-fun b!90125 () Bool)

(assert (=> b!90125 (= e!58697 (isDefined!95 (getValueByKey!141 (toList!749 lt!43342) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355))))))

(assert (= (and d!23953 c!14956) b!90123))

(assert (= (and d!23953 (not c!14956)) b!90124))

(assert (= (and d!23953 (not res!46034)) b!90125))

(assert (=> d!23953 m!96485))

(declare-fun m!96833 () Bool)

(assert (=> d!23953 m!96833))

(assert (=> b!90123 m!96485))

(declare-fun m!96835 () Bool)

(assert (=> b!90123 m!96835))

(assert (=> b!90123 m!96485))

(declare-fun m!96837 () Bool)

(assert (=> b!90123 m!96837))

(assert (=> b!90123 m!96837))

(declare-fun m!96839 () Bool)

(assert (=> b!90123 m!96839))

(assert (=> b!90125 m!96485))

(assert (=> b!90125 m!96837))

(assert (=> b!90125 m!96837))

(assert (=> b!90125 m!96839))

(assert (=> b!89910 d!23953))

(declare-fun b!90210 () Bool)

(declare-fun e!58749 () tuple2!2232)

(declare-fun e!58760 () tuple2!2232)

(assert (=> b!90210 (= e!58749 e!58760)))

(declare-fun c!14992 () Bool)

(declare-datatypes ((SeekEntryResult!249 0))(
  ( (MissingZero!249 (index!3136 (_ BitVec 32))) (Found!249 (index!3137 (_ BitVec 32))) (Intermediate!249 (undefined!1061 Bool) (index!3138 (_ BitVec 32)) (x!12337 (_ BitVec 32))) (Undefined!249) (MissingVacant!249 (index!3139 (_ BitVec 32))) )
))
(declare-fun lt!43601 () SeekEntryResult!249)

(assert (=> b!90210 (= c!14992 ((_ is MissingZero!249) lt!43601))))

(declare-fun b!90211 () Bool)

(declare-fun e!58761 () Bool)

(declare-fun call!8779 () Bool)

(assert (=> b!90211 (= e!58761 (not call!8779))))

(declare-fun call!8769 () Bool)

(declare-fun bm!8761 () Bool)

(assert (=> bm!8761 (= call!8769 (arrayContainsKey!0 (_keys!4066 newMap!16) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!8762 () Bool)

(declare-fun call!8775 () Unit!2679)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!34 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) Int) Unit!2679)

(assert (=> bm!8762 (= call!8775 (lemmaInListMapThenSeekEntryOrOpenFindsIt!34 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (defaultEntry!2387 newMap!16)))))

(declare-fun d!23955 () Bool)

(declare-fun e!58763 () Bool)

(assert (=> d!23955 e!58763))

(declare-fun res!46066 () Bool)

(assert (=> d!23955 (=> (not res!46066) (not e!58763))))

(declare-fun lt!43593 () tuple2!2232)

(assert (=> d!23955 (= res!46066 (valid!350 (_2!1127 lt!43593)))))

(declare-fun e!58753 () tuple2!2232)

(assert (=> d!23955 (= lt!43593 e!58753)))

(declare-fun c!14997 () Bool)

(assert (=> d!23955 (= c!14997 (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvneg (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355))))))

(assert (=> d!23955 (valid!350 newMap!16)))

(assert (=> d!23955 (= (update!127 newMap!16 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338) lt!43593)))

(declare-fun b!90212 () Bool)

(declare-fun e!58758 () Unit!2679)

(declare-fun lt!43604 () Unit!2679)

(assert (=> b!90212 (= e!58758 lt!43604)))

(assert (=> b!90212 (= lt!43604 call!8775)))

(declare-fun lt!43598 () SeekEntryResult!249)

(declare-fun call!8778 () SeekEntryResult!249)

(assert (=> b!90212 (= lt!43598 call!8778)))

(declare-fun res!46076 () Bool)

(assert (=> b!90212 (= res!46076 ((_ is Found!249) lt!43598))))

(declare-fun e!58745 () Bool)

(assert (=> b!90212 (=> (not res!46076) (not e!58745))))

(assert (=> b!90212 e!58745))

(declare-fun bm!8763 () Bool)

(declare-fun lt!43600 () (_ BitVec 32))

(declare-fun c!14996 () Bool)

(declare-fun call!8781 () ListLongMap!1467)

(declare-fun lt!43614 () (_ BitVec 32))

(assert (=> bm!8763 (= call!8781 (getCurrentListMap!432 (_keys!4066 newMap!16) (ite c!14997 (_values!2370 newMap!16) (array!4062 (store (arr!1931 (_values!2370 newMap!16)) (index!3137 lt!43601) (ValueCellFull!935 lt!43338)) (size!2179 (_values!2370 newMap!16)))) (mask!6438 newMap!16) (ite c!14997 (ite c!14996 lt!43600 lt!43614) (extraKeys!2218 newMap!16)) (ite (and c!14997 c!14996) lt!43338 (zeroValue!2275 newMap!16)) (ite c!14997 (ite c!14996 (minValue!2275 newMap!16) lt!43338) (minValue!2275 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90213 () Bool)

(declare-fun lt!43595 () Unit!2679)

(declare-fun lt!43609 () Unit!2679)

(assert (=> b!90213 (= lt!43595 lt!43609)))

(declare-fun call!8783 () ListLongMap!1467)

(assert (=> b!90213 (contains!763 call!8783 (select (arr!1930 (_keys!4066 newMap!16)) (index!3137 lt!43601)))))

(declare-fun lt!43594 () array!4061)

(declare-fun lemmaValidKeyInArrayIsInListMap!93 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) Int) Unit!2679)

(assert (=> b!90213 (= lt!43609 (lemmaValidKeyInArrayIsInListMap!93 (_keys!4066 newMap!16) lt!43594 (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (index!3137 lt!43601) (defaultEntry!2387 newMap!16)))))

(assert (=> b!90213 (= lt!43594 (array!4062 (store (arr!1931 (_values!2370 newMap!16)) (index!3137 lt!43601) (ValueCellFull!935 lt!43338)) (size!2179 (_values!2370 newMap!16))))))

(declare-fun lt!43607 () Unit!2679)

(declare-fun lt!43592 () Unit!2679)

(assert (=> b!90213 (= lt!43607 lt!43592)))

(declare-fun call!8768 () ListLongMap!1467)

(assert (=> b!90213 (= call!8768 call!8781)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!34 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 32) (_ BitVec 64) V!3057 Int) Unit!2679)

(assert (=> b!90213 (= lt!43592 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!34 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (index!3137 lt!43601) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 (defaultEntry!2387 newMap!16)))))

(declare-fun lt!43605 () Unit!2679)

(assert (=> b!90213 (= lt!43605 e!58758)))

(declare-fun c!14985 () Bool)

(declare-fun call!8786 () Bool)

(assert (=> b!90213 (= c!14985 call!8786)))

(assert (=> b!90213 (= e!58760 (tuple2!2233 true (LongMapFixedSize!779 (defaultEntry!2387 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (_size!438 newMap!16) (_keys!4066 newMap!16) (array!4062 (store (arr!1931 (_values!2370 newMap!16)) (index!3137 lt!43601) (ValueCellFull!935 lt!43338)) (size!2179 (_values!2370 newMap!16))) (_vacant!438 newMap!16))))))

(declare-fun b!90214 () Bool)

(declare-fun e!58755 () Bool)

(assert (=> b!90214 (= e!58755 e!58761)))

(declare-fun res!46064 () Bool)

(declare-fun call!8780 () Bool)

(assert (=> b!90214 (= res!46064 call!8780)))

(assert (=> b!90214 (=> (not res!46064) (not e!58761))))

(declare-fun b!90215 () Bool)

(declare-fun e!58752 () Bool)

(assert (=> b!90215 (= e!58752 (not call!8779))))

(declare-fun bm!8764 () Bool)

(declare-fun call!8764 () ListLongMap!1467)

(assert (=> bm!8764 (= call!8764 call!8781)))

(declare-fun b!90216 () Bool)

(declare-fun e!58751 () Bool)

(declare-fun call!8787 () Bool)

(assert (=> b!90216 (= e!58751 (not call!8787))))

(declare-fun bm!8765 () Bool)

(assert (=> bm!8765 (= call!8779 call!8769)))

(declare-fun call!8782 () ListLongMap!1467)

(declare-fun e!58764 () Bool)

(declare-fun b!90217 () Bool)

(declare-fun call!8776 () ListLongMap!1467)

(assert (=> b!90217 (= e!58764 (= call!8776 (+!114 call!8782 (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338))))))

(declare-fun b!90218 () Bool)

(declare-fun lt!43617 () SeekEntryResult!249)

(assert (=> b!90218 (= e!58755 ((_ is Undefined!249) lt!43617))))

(declare-fun b!90219 () Bool)

(declare-fun e!58744 () tuple2!2232)

(assert (=> b!90219 (= e!58753 e!58744)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4059 (_ BitVec 32)) SeekEntryResult!249)

(assert (=> b!90219 (= lt!43601 (seekEntryOrOpen!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (_keys!4066 newMap!16) (mask!6438 newMap!16)))))

(declare-fun c!14989 () Bool)

(assert (=> b!90219 (= c!14989 ((_ is Undefined!249) lt!43601))))

(declare-fun b!90220 () Bool)

(declare-fun res!46070 () Bool)

(declare-fun e!58746 () Bool)

(assert (=> b!90220 (=> (not res!46070) (not e!58746))))

(declare-fun lt!43599 () SeekEntryResult!249)

(assert (=> b!90220 (= res!46070 (= (select (arr!1930 (_keys!4066 newMap!16)) (index!3136 lt!43599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8766 () Bool)

(declare-fun call!8772 () ListLongMap!1467)

(assert (=> bm!8766 (= call!8772 call!8768)))

(declare-fun bm!8767 () Bool)

(declare-fun call!8785 () Bool)

(declare-fun call!8774 () Bool)

(assert (=> bm!8767 (= call!8785 call!8774)))

(declare-fun b!90221 () Bool)

(declare-fun e!58747 () ListLongMap!1467)

(assert (=> b!90221 (= e!58747 call!8783)))

(declare-fun b!90222 () Bool)

(declare-fun e!58743 () Bool)

(assert (=> b!90222 (= e!58743 ((_ is Undefined!249) lt!43599))))

(declare-fun bm!8768 () Bool)

(assert (=> bm!8768 (= call!8787 call!8769)))

(declare-fun b!90223 () Bool)

(declare-fun Unit!2688 () Unit!2679)

(assert (=> b!90223 (= e!58758 Unit!2688)))

(declare-fun lt!43611 () Unit!2679)

(declare-fun call!8770 () Unit!2679)

(assert (=> b!90223 (= lt!43611 call!8770)))

(assert (=> b!90223 (= lt!43617 call!8778)))

(declare-fun c!14994 () Bool)

(assert (=> b!90223 (= c!14994 ((_ is MissingZero!249) lt!43617))))

(declare-fun e!58756 () Bool)

(assert (=> b!90223 e!58756))

(declare-fun lt!43612 () Unit!2679)

(assert (=> b!90223 (= lt!43612 lt!43611)))

(assert (=> b!90223 false))

(declare-fun bm!8769 () Bool)

(declare-fun call!8771 () Bool)

(assert (=> bm!8769 (= call!8771 call!8785)))

(declare-fun b!90224 () Bool)

(declare-fun c!14987 () Bool)

(assert (=> b!90224 (= c!14987 ((_ is MissingVacant!249) lt!43617))))

(assert (=> b!90224 (= e!58756 e!58755)))

(declare-fun b!90225 () Bool)

(declare-fun e!58762 () Unit!2679)

(declare-fun lt!43613 () Unit!2679)

(assert (=> b!90225 (= e!58762 lt!43613)))

(assert (=> b!90225 (= lt!43613 call!8770)))

(declare-fun call!8784 () SeekEntryResult!249)

(assert (=> b!90225 (= lt!43599 call!8784)))

(declare-fun c!14993 () Bool)

(assert (=> b!90225 (= c!14993 ((_ is MissingZero!249) lt!43599))))

(declare-fun e!58757 () Bool)

(assert (=> b!90225 e!58757))

(declare-fun b!90226 () Bool)

(assert (=> b!90226 (= e!58745 (= (select (arr!1930 (_keys!4066 newMap!16)) (index!3137 lt!43598)) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun b!90227 () Bool)

(assert (=> b!90227 (= e!58747 (getCurrentListMap!432 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90228 () Bool)

(declare-fun e!58759 () Bool)

(declare-fun lt!43603 () SeekEntryResult!249)

(assert (=> b!90228 (= e!58759 (= (select (arr!1930 (_keys!4066 newMap!16)) (index!3137 lt!43603)) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun c!14986 () Bool)

(declare-fun bm!8770 () Bool)

(declare-fun call!8766 () tuple2!2232)

(declare-fun updateHelperNewKey!34 (LongMapFixedSize!778 (_ BitVec 64) V!3057 (_ BitVec 32)) tuple2!2232)

(assert (=> bm!8770 (= call!8766 (updateHelperNewKey!34 newMap!16 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338 (ite c!14986 (index!3139 lt!43601) (index!3136 lt!43601))))))

(declare-fun b!90229 () Bool)

(declare-fun lt!43602 () Unit!2679)

(assert (=> b!90229 (= lt!43602 e!58762)))

(declare-fun c!14998 () Bool)

(assert (=> b!90229 (= c!14998 call!8786)))

(assert (=> b!90229 (= e!58744 (tuple2!2233 false newMap!16))))

(declare-fun b!90230 () Bool)

(declare-fun Unit!2689 () Unit!2679)

(assert (=> b!90230 (= e!58762 Unit!2689)))

(declare-fun lt!43615 () Unit!2679)

(assert (=> b!90230 (= lt!43615 call!8775)))

(assert (=> b!90230 (= lt!43603 call!8784)))

(declare-fun res!46071 () Bool)

(assert (=> b!90230 (= res!46071 ((_ is Found!249) lt!43603))))

(assert (=> b!90230 (=> (not res!46071) (not e!58759))))

(assert (=> b!90230 e!58759))

(declare-fun lt!43597 () Unit!2679)

(assert (=> b!90230 (= lt!43597 lt!43615)))

(assert (=> b!90230 false))

(declare-fun bm!8771 () Bool)

(declare-fun call!8767 () SeekEntryResult!249)

(assert (=> bm!8771 (= call!8784 call!8767)))

(declare-fun bm!8772 () Bool)

(declare-fun call!8765 () Bool)

(assert (=> bm!8772 (= call!8780 call!8765)))

(declare-fun b!90231 () Bool)

(declare-fun res!46075 () Bool)

(assert (=> b!90231 (=> (not res!46075) (not e!58752))))

(assert (=> b!90231 (= res!46075 call!8780)))

(assert (=> b!90231 (= e!58756 e!58752)))

(declare-fun b!90232 () Bool)

(declare-fun e!58748 () Bool)

(assert (=> b!90232 (= e!58763 e!58748)))

(declare-fun c!14988 () Bool)

(assert (=> b!90232 (= c!14988 (_1!1127 lt!43593))))

(declare-fun bm!8773 () Bool)

(assert (=> bm!8773 (= call!8782 (map!1200 newMap!16))))

(declare-fun b!90233 () Bool)

(declare-fun e!58754 () ListLongMap!1467)

(assert (=> b!90233 (= e!58754 (getCurrentListMap!432 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90234 () Bool)

(declare-fun res!46072 () Bool)

(assert (=> b!90234 (=> (not res!46072) (not e!58752))))

(assert (=> b!90234 (= res!46072 (= (select (arr!1930 (_keys!4066 newMap!16)) (index!3136 lt!43617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!8777 () ListLongMap!1467)

(declare-fun bm!8774 () Bool)

(assert (=> bm!8774 (= call!8777 (getCurrentListMap!432 (_keys!4066 newMap!16) (ite (or c!14997 c!14989) (_values!2370 newMap!16) lt!43594) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun b!90235 () Bool)

(declare-fun lt!43606 () tuple2!2232)

(assert (=> b!90235 (= lt!43606 call!8766)))

(assert (=> b!90235 (= e!58760 (tuple2!2233 (_1!1127 lt!43606) (_2!1127 lt!43606)))))

(declare-fun b!90236 () Bool)

(declare-fun e!58750 () tuple2!2232)

(assert (=> b!90236 (= e!58753 e!58750)))

(assert (=> b!90236 (= c!14996 (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90237 () Bool)

(assert (=> b!90237 (= e!58743 e!58751)))

(declare-fun res!46063 () Bool)

(assert (=> b!90237 (= res!46063 call!8771)))

(assert (=> b!90237 (=> (not res!46063) (not e!58751))))

(declare-fun bm!8775 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!34 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) Int) Unit!2679)

(assert (=> bm!8775 (= call!8770 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!34 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (defaultEntry!2387 newMap!16)))))

(declare-fun b!90238 () Bool)

(declare-fun call!8773 () ListLongMap!1467)

(assert (=> b!90238 (= e!58754 call!8773)))

(declare-fun b!90239 () Bool)

(assert (=> b!90239 (= e!58748 e!58764)))

(declare-fun res!46074 () Bool)

(assert (=> b!90239 (= res!46074 (contains!763 call!8776 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(assert (=> b!90239 (=> (not res!46074) (not e!58764))))

(declare-fun b!90240 () Bool)

(declare-fun res!46067 () Bool)

(assert (=> b!90240 (= res!46067 (= (select (arr!1930 (_keys!4066 newMap!16)) (index!3139 lt!43599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!90240 (=> (not res!46067) (not e!58751))))

(declare-fun bm!8776 () Bool)

(assert (=> bm!8776 (= call!8773 call!8777)))

(declare-fun bm!8777 () Bool)

(assert (=> bm!8777 (= call!8767 (seekEntryOrOpen!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (_keys!4066 newMap!16) (mask!6438 newMap!16)))))

(declare-fun bm!8778 () Bool)

(assert (=> bm!8778 (= call!8765 call!8774)))

(declare-fun b!90241 () Bool)

(declare-fun lt!43591 () Unit!2679)

(declare-fun lt!43610 () Unit!2679)

(assert (=> b!90241 (= lt!43591 lt!43610)))

(assert (=> b!90241 (= call!8772 call!8764)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!34 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 V!3057 Int) Unit!2679)

(assert (=> b!90241 (= lt!43610 (lemmaChangeZeroKeyThenAddPairToListMap!34 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) lt!43600 (zeroValue!2275 newMap!16) lt!43338 (minValue!2275 newMap!16) (defaultEntry!2387 newMap!16)))))

(assert (=> b!90241 (= lt!43600 (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!90241 (= e!58750 (tuple2!2233 true (LongMapFixedSize!779 (defaultEntry!2387 newMap!16) (mask!6438 newMap!16) (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000001) lt!43338 (minValue!2275 newMap!16) (_size!438 newMap!16) (_keys!4066 newMap!16) (_values!2370 newMap!16) (_vacant!438 newMap!16))))))

(declare-fun bm!8779 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8779 (= call!8774 (inRange!0 (ite c!14989 (ite c!14998 (index!3137 lt!43603) (ite c!14993 (index!3136 lt!43599) (index!3139 lt!43599))) (ite c!14985 (index!3137 lt!43598) (ite c!14994 (index!3136 lt!43617) (index!3139 lt!43617)))) (mask!6438 newMap!16)))))

(declare-fun b!90242 () Bool)

(assert (=> b!90242 (= c!14986 ((_ is MissingVacant!249) lt!43601))))

(assert (=> b!90242 (= e!58744 e!58749)))

(declare-fun bm!8780 () Bool)

(declare-fun c!14991 () Bool)

(assert (=> bm!8780 (= c!14991 c!14989)))

(assert (=> bm!8780 (= call!8786 (contains!763 e!58747 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun b!90243 () Bool)

(declare-fun lt!43608 () Unit!2679)

(declare-fun lt!43616 () Unit!2679)

(assert (=> b!90243 (= lt!43608 lt!43616)))

(assert (=> b!90243 (= call!8772 call!8764)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!34 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 V!3057 Int) Unit!2679)

(assert (=> b!90243 (= lt!43616 (lemmaChangeLongMinValueKeyThenAddPairToListMap!34 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) lt!43614 (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) lt!43338 (defaultEntry!2387 newMap!16)))))

(assert (=> b!90243 (= lt!43614 (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!90243 (= e!58750 (tuple2!2233 true (LongMapFixedSize!779 (defaultEntry!2387 newMap!16) (mask!6438 newMap!16) (bvor (extraKeys!2218 newMap!16) #b00000000000000000000000000000010) (zeroValue!2275 newMap!16) lt!43338 (_size!438 newMap!16) (_keys!4066 newMap!16) (_values!2370 newMap!16) (_vacant!438 newMap!16))))))

(declare-fun b!90244 () Bool)

(declare-fun res!46073 () Bool)

(assert (=> b!90244 (= res!46073 (= (select (arr!1930 (_keys!4066 newMap!16)) (index!3139 lt!43617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!90244 (=> (not res!46073) (not e!58761))))

(declare-fun b!90245 () Bool)

(declare-fun res!46069 () Bool)

(assert (=> b!90245 (= res!46069 call!8785)))

(assert (=> b!90245 (=> (not res!46069) (not e!58759))))

(declare-fun b!90246 () Bool)

(assert (=> b!90246 (= e!58746 (not call!8787))))

(declare-fun b!90247 () Bool)

(declare-fun res!46068 () Bool)

(assert (=> b!90247 (=> (not res!46068) (not e!58746))))

(assert (=> b!90247 (= res!46068 call!8771)))

(assert (=> b!90247 (= e!58757 e!58746)))

(declare-fun bm!8781 () Bool)

(assert (=> bm!8781 (= call!8768 (+!114 e!58754 (ite c!14997 (ite c!14996 (tuple2!2235 #b0000000000000000000000000000000000000000000000000000000000000000 lt!43338) (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 lt!43338)) (tuple2!2235 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) lt!43338))))))

(declare-fun c!14995 () Bool)

(assert (=> bm!8781 (= c!14995 c!14997)))

(declare-fun b!90248 () Bool)

(assert (=> b!90248 (= e!58748 (= call!8776 call!8782))))

(declare-fun bm!8782 () Bool)

(assert (=> bm!8782 (= call!8776 (map!1200 (_2!1127 lt!43593)))))

(declare-fun b!90249 () Bool)

(declare-fun lt!43596 () tuple2!2232)

(assert (=> b!90249 (= e!58749 (tuple2!2233 (_1!1127 lt!43596) (_2!1127 lt!43596)))))

(assert (=> b!90249 (= lt!43596 call!8766)))

(declare-fun bm!8783 () Bool)

(assert (=> bm!8783 (= call!8783 call!8777)))

(declare-fun bm!8784 () Bool)

(assert (=> bm!8784 (= call!8778 call!8767)))

(declare-fun b!90250 () Bool)

(declare-fun c!14990 () Bool)

(assert (=> b!90250 (= c!14990 ((_ is MissingVacant!249) lt!43599))))

(assert (=> b!90250 (= e!58757 e!58743)))

(declare-fun b!90251 () Bool)

(declare-fun res!46065 () Bool)

(assert (=> b!90251 (= res!46065 call!8765)))

(assert (=> b!90251 (=> (not res!46065) (not e!58745))))

(assert (= (and d!23955 c!14997) b!90236))

(assert (= (and d!23955 (not c!14997)) b!90219))

(assert (= (and b!90236 c!14996) b!90241))

(assert (= (and b!90236 (not c!14996)) b!90243))

(assert (= (or b!90241 b!90243) bm!8764))

(assert (= (or b!90241 b!90243) bm!8776))

(assert (= (or b!90241 b!90243) bm!8766))

(assert (= (and b!90219 c!14989) b!90229))

(assert (= (and b!90219 (not c!14989)) b!90242))

(assert (= (and b!90229 c!14998) b!90230))

(assert (= (and b!90229 (not c!14998)) b!90225))

(assert (= (and b!90230 res!46071) b!90245))

(assert (= (and b!90245 res!46069) b!90228))

(assert (= (and b!90225 c!14993) b!90247))

(assert (= (and b!90225 (not c!14993)) b!90250))

(assert (= (and b!90247 res!46068) b!90220))

(assert (= (and b!90220 res!46070) b!90246))

(assert (= (and b!90250 c!14990) b!90237))

(assert (= (and b!90250 (not c!14990)) b!90222))

(assert (= (and b!90237 res!46063) b!90240))

(assert (= (and b!90240 res!46067) b!90216))

(assert (= (or b!90247 b!90237) bm!8769))

(assert (= (or b!90246 b!90216) bm!8768))

(assert (= (or b!90245 bm!8769) bm!8767))

(assert (= (or b!90230 b!90225) bm!8771))

(assert (= (and b!90242 c!14986) b!90249))

(assert (= (and b!90242 (not c!14986)) b!90210))

(assert (= (and b!90210 c!14992) b!90235))

(assert (= (and b!90210 (not c!14992)) b!90213))

(assert (= (and b!90213 c!14985) b!90212))

(assert (= (and b!90213 (not c!14985)) b!90223))

(assert (= (and b!90212 res!46076) b!90251))

(assert (= (and b!90251 res!46065) b!90226))

(assert (= (and b!90223 c!14994) b!90231))

(assert (= (and b!90223 (not c!14994)) b!90224))

(assert (= (and b!90231 res!46075) b!90234))

(assert (= (and b!90234 res!46072) b!90215))

(assert (= (and b!90224 c!14987) b!90214))

(assert (= (and b!90224 (not c!14987)) b!90218))

(assert (= (and b!90214 res!46064) b!90244))

(assert (= (and b!90244 res!46073) b!90211))

(assert (= (or b!90231 b!90214) bm!8772))

(assert (= (or b!90215 b!90211) bm!8765))

(assert (= (or b!90251 bm!8772) bm!8778))

(assert (= (or b!90212 b!90223) bm!8784))

(assert (= (or b!90249 b!90235) bm!8770))

(assert (= (or b!90225 b!90223) bm!8775))

(assert (= (or bm!8767 bm!8778) bm!8779))

(assert (= (or b!90230 b!90212) bm!8762))

(assert (= (or bm!8771 bm!8784) bm!8777))

(assert (= (or b!90229 b!90213) bm!8783))

(assert (= (or bm!8768 bm!8765) bm!8761))

(assert (= (or b!90229 b!90213) bm!8780))

(assert (= (and bm!8780 c!14991) b!90221))

(assert (= (and bm!8780 (not c!14991)) b!90227))

(assert (= (or bm!8764 b!90213) bm!8763))

(assert (= (or bm!8776 bm!8783) bm!8774))

(assert (= (or bm!8766 b!90213) bm!8781))

(assert (= (and bm!8781 c!14995) b!90238))

(assert (= (and bm!8781 (not c!14995)) b!90233))

(assert (= (and d!23955 res!46066) b!90232))

(assert (= (and b!90232 c!14988) b!90239))

(assert (= (and b!90232 (not c!14988)) b!90248))

(assert (= (and b!90239 res!46074) b!90217))

(assert (= (or b!90239 b!90217 b!90248) bm!8782))

(assert (= (or b!90217 b!90248) bm!8773))

(assert (=> b!90219 m!96485))

(declare-fun m!96841 () Bool)

(assert (=> b!90219 m!96841))

(declare-fun m!96843 () Bool)

(assert (=> b!90244 m!96843))

(declare-fun m!96845 () Bool)

(assert (=> b!90227 m!96845))

(assert (=> bm!8777 m!96485))

(assert (=> bm!8777 m!96841))

(declare-fun m!96847 () Bool)

(assert (=> bm!8779 m!96847))

(declare-fun m!96849 () Bool)

(assert (=> bm!8774 m!96849))

(assert (=> bm!8770 m!96485))

(declare-fun m!96851 () Bool)

(assert (=> bm!8770 m!96851))

(declare-fun m!96853 () Bool)

(assert (=> b!90226 m!96853))

(declare-fun m!96855 () Bool)

(assert (=> b!90217 m!96855))

(declare-fun m!96857 () Bool)

(assert (=> bm!8782 m!96857))

(assert (=> b!90233 m!96845))

(assert (=> bm!8780 m!96485))

(declare-fun m!96859 () Bool)

(assert (=> bm!8780 m!96859))

(declare-fun m!96861 () Bool)

(assert (=> b!90234 m!96861))

(assert (=> bm!8761 m!96485))

(declare-fun m!96863 () Bool)

(assert (=> bm!8761 m!96863))

(declare-fun m!96865 () Bool)

(assert (=> bm!8763 m!96865))

(declare-fun m!96867 () Bool)

(assert (=> bm!8763 m!96867))

(assert (=> bm!8762 m!96485))

(declare-fun m!96869 () Bool)

(assert (=> bm!8762 m!96869))

(declare-fun m!96871 () Bool)

(assert (=> b!90241 m!96871))

(declare-fun m!96873 () Bool)

(assert (=> b!90220 m!96873))

(assert (=> bm!8773 m!96501))

(declare-fun m!96875 () Bool)

(assert (=> d!23955 m!96875))

(assert (=> d!23955 m!96529))

(declare-fun m!96877 () Bool)

(assert (=> b!90228 m!96877))

(declare-fun m!96879 () Bool)

(assert (=> b!90213 m!96879))

(assert (=> b!90213 m!96865))

(declare-fun m!96881 () Bool)

(assert (=> b!90213 m!96881))

(assert (=> b!90213 m!96485))

(declare-fun m!96883 () Bool)

(assert (=> b!90213 m!96883))

(assert (=> b!90213 m!96881))

(declare-fun m!96885 () Bool)

(assert (=> b!90213 m!96885))

(assert (=> b!90239 m!96485))

(declare-fun m!96887 () Bool)

(assert (=> b!90239 m!96887))

(assert (=> bm!8775 m!96485))

(declare-fun m!96889 () Bool)

(assert (=> bm!8775 m!96889))

(declare-fun m!96891 () Bool)

(assert (=> b!90243 m!96891))

(declare-fun m!96893 () Bool)

(assert (=> bm!8781 m!96893))

(declare-fun m!96895 () Bool)

(assert (=> b!90240 m!96895))

(assert (=> b!89910 d!23955))

(declare-fun d!23957 () Bool)

(assert (=> d!23957 (not (arrayContainsKey!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43620 () Unit!2679)

(declare-fun choose!68 (array!4059 (_ BitVec 32) (_ BitVec 64) List!1543) Unit!2679)

(assert (=> d!23957 (= lt!43620 (choose!68 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (Cons!1539 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) Nil!1540)))))

(assert (=> d!23957 (bvslt (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23957 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (Cons!1539 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) Nil!1540)) lt!43620)))

(declare-fun bs!3771 () Bool)

(assert (= bs!3771 d!23957))

(assert (=> bs!3771 m!96485))

(assert (=> bs!3771 m!96543))

(assert (=> bs!3771 m!96485))

(declare-fun m!96897 () Bool)

(assert (=> bs!3771 m!96897))

(assert (=> b!89911 d!23957))

(declare-fun d!23959 () Bool)

(assert (=> d!23959 (arrayNoDuplicates!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) from!355 Nil!1540)))

(declare-fun lt!43623 () Unit!2679)

(declare-fun choose!39 (array!4059 (_ BitVec 32) (_ BitVec 32)) Unit!2679)

(assert (=> d!23959 (= lt!43623 (choose!39 (_keys!4066 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23959 (bvslt (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23959 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000000 from!355) lt!43623)))

(declare-fun bs!3772 () Bool)

(assert (= bs!3772 d!23959))

(assert (=> bs!3772 m!96539))

(declare-fun m!96899 () Bool)

(assert (=> bs!3772 m!96899))

(assert (=> b!89911 d!23959))

(declare-fun d!23961 () Bool)

(declare-fun res!46081 () Bool)

(declare-fun e!58769 () Bool)

(assert (=> d!23961 (=> res!46081 e!58769)))

(assert (=> d!23961 (= res!46081 (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(assert (=> d!23961 (= (arrayContainsKey!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!58769)))

(declare-fun b!90256 () Bool)

(declare-fun e!58770 () Bool)

(assert (=> b!90256 (= e!58769 e!58770)))

(declare-fun res!46082 () Bool)

(assert (=> b!90256 (=> (not res!46082) (not e!58770))))

(assert (=> b!90256 (= res!46082 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun b!90257 () Bool)

(assert (=> b!90257 (= e!58770 (arrayContainsKey!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23961 (not res!46081)) b!90256))

(assert (= (and b!90256 res!46082) b!90257))

(assert (=> d!23961 m!96781))

(assert (=> b!90257 m!96485))

(declare-fun m!96901 () Bool)

(assert (=> b!90257 m!96901))

(assert (=> b!89911 d!23961))

(declare-fun d!23963 () Bool)

(declare-fun e!58773 () Bool)

(assert (=> d!23963 e!58773))

(declare-fun c!15001 () Bool)

(assert (=> d!23963 (= c!15001 (and (not (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43626 () Unit!2679)

(declare-fun choose!547 (array!4059 array!4061 (_ BitVec 32) (_ BitVec 32) V!3057 V!3057 (_ BitVec 64) (_ BitVec 32) Int) Unit!2679)

(assert (=> d!23963 (= lt!43626 (choose!547 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(assert (=> d!23963 (validMask!0 (mask!6438 (v!2685 (underlying!296 thiss!992))))))

(assert (=> d!23963 (= (lemmaListMapContainsThenArrayContainsFrom!74 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))) lt!43626)))

(declare-fun b!90262 () Bool)

(assert (=> b!90262 (= e!58773 (arrayContainsKey!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!90263 () Bool)

(assert (=> b!90263 (= e!58773 (ite (= (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23963 c!15001) b!90262))

(assert (= (and d!23963 (not c!15001)) b!90263))

(assert (=> d!23963 m!96485))

(declare-fun m!96903 () Bool)

(assert (=> d!23963 m!96903))

(assert (=> d!23963 m!96805))

(assert (=> b!90262 m!96485))

(assert (=> b!90262 m!96543))

(assert (=> b!89911 d!23963))

(declare-fun b!90274 () Bool)

(declare-fun e!58782 () Bool)

(declare-fun call!8790 () Bool)

(assert (=> b!90274 (= e!58782 call!8790)))

(declare-fun d!23965 () Bool)

(declare-fun res!46091 () Bool)

(declare-fun e!58784 () Bool)

(assert (=> d!23965 (=> res!46091 e!58784)))

(assert (=> d!23965 (= res!46091 (bvsge from!355 (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(assert (=> d!23965 (= (arrayNoDuplicates!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) from!355 Nil!1540) e!58784)))

(declare-fun b!90275 () Bool)

(declare-fun e!58785 () Bool)

(assert (=> b!90275 (= e!58784 e!58785)))

(declare-fun res!46090 () Bool)

(assert (=> b!90275 (=> (not res!46090) (not e!58785))))

(declare-fun e!58783 () Bool)

(assert (=> b!90275 (= res!46090 (not e!58783))))

(declare-fun res!46089 () Bool)

(assert (=> b!90275 (=> (not res!46089) (not e!58783))))

(assert (=> b!90275 (= res!46089 (validKeyInArray!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun c!15004 () Bool)

(declare-fun bm!8787 () Bool)

(assert (=> bm!8787 (= call!8790 (arrayNoDuplicates!0 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15004 (Cons!1539 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355) Nil!1540) Nil!1540)))))

(declare-fun b!90276 () Bool)

(assert (=> b!90276 (= e!58782 call!8790)))

(declare-fun b!90277 () Bool)

(assert (=> b!90277 (= e!58785 e!58782)))

(assert (=> b!90277 (= c!15004 (validKeyInArray!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(declare-fun b!90278 () Bool)

(declare-fun contains!766 (List!1543 (_ BitVec 64)) Bool)

(assert (=> b!90278 (= e!58783 (contains!766 Nil!1540 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) from!355)))))

(assert (= (and d!23965 (not res!46091)) b!90275))

(assert (= (and b!90275 res!46089) b!90278))

(assert (= (and b!90275 res!46090) b!90277))

(assert (= (and b!90277 c!15004) b!90274))

(assert (= (and b!90277 (not c!15004)) b!90276))

(assert (= (or b!90274 b!90276) bm!8787))

(assert (=> b!90275 m!96485))

(assert (=> b!90275 m!96485))

(declare-fun m!96905 () Bool)

(assert (=> b!90275 m!96905))

(assert (=> bm!8787 m!96485))

(declare-fun m!96907 () Bool)

(assert (=> bm!8787 m!96907))

(assert (=> b!90277 m!96485))

(assert (=> b!90277 m!96485))

(assert (=> b!90277 m!96905))

(assert (=> b!90278 m!96485))

(assert (=> b!90278 m!96485))

(declare-fun m!96909 () Bool)

(assert (=> b!90278 m!96909))

(assert (=> b!89911 d!23965))

(declare-fun d!23967 () Bool)

(assert (=> d!23967 (= (map!1200 newMap!16) (getCurrentListMap!432 (_keys!4066 newMap!16) (_values!2370 newMap!16) (mask!6438 newMap!16) (extraKeys!2218 newMap!16) (zeroValue!2275 newMap!16) (minValue!2275 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2387 newMap!16)))))

(declare-fun bs!3773 () Bool)

(assert (= bs!3773 d!23967))

(assert (=> bs!3773 m!96845))

(assert (=> b!89923 d!23967))

(declare-fun b!90321 () Bool)

(declare-fun res!46111 () Bool)

(declare-fun e!58816 () Bool)

(assert (=> b!90321 (=> (not res!46111) (not e!58816))))

(declare-fun e!58823 () Bool)

(assert (=> b!90321 (= res!46111 e!58823)))

(declare-fun res!46116 () Bool)

(assert (=> b!90321 (=> res!46116 e!58823)))

(declare-fun e!58824 () Bool)

(assert (=> b!90321 (= res!46116 (not e!58824))))

(declare-fun res!46115 () Bool)

(assert (=> b!90321 (=> (not res!46115) (not e!58824))))

(assert (=> b!90321 (= res!46115 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun b!90322 () Bool)

(declare-fun e!58818 () ListLongMap!1467)

(declare-fun call!8811 () ListLongMap!1467)

(assert (=> b!90322 (= e!58818 (+!114 call!8811 (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun b!90323 () Bool)

(declare-fun e!58821 () Bool)

(declare-fun call!8807 () Bool)

(assert (=> b!90323 (= e!58821 (not call!8807))))

(declare-fun b!90324 () Bool)

(declare-fun e!58813 () Unit!2679)

(declare-fun Unit!2690 () Unit!2679)

(assert (=> b!90324 (= e!58813 Unit!2690)))

(declare-fun b!90326 () Bool)

(declare-fun e!58815 () Bool)

(declare-fun call!8809 () Bool)

(assert (=> b!90326 (= e!58815 (not call!8809))))

(declare-fun call!8810 () ListLongMap!1467)

(declare-fun call!8808 () ListLongMap!1467)

(declare-fun c!15022 () Bool)

(declare-fun c!15017 () Bool)

(declare-fun bm!8802 () Bool)

(declare-fun call!8805 () ListLongMap!1467)

(assert (=> bm!8802 (= call!8811 (+!114 (ite c!15022 call!8810 (ite c!15017 call!8805 call!8808)) (ite (or c!15022 c!15017) (tuple2!2235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2275 (v!2685 (underlying!296 thiss!992)))) (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2275 (v!2685 (underlying!296 thiss!992)))))))))

(declare-fun b!90327 () Bool)

(declare-fun e!58820 () ListLongMap!1467)

(assert (=> b!90327 (= e!58818 e!58820)))

(assert (=> b!90327 (= c!15017 (and (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!90328 () Bool)

(declare-fun e!58817 () Bool)

(declare-fun lt!43671 () ListLongMap!1467)

(assert (=> b!90328 (= e!58817 (= (apply!85 lt!43671 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun bm!8803 () Bool)

(declare-fun call!8806 () ListLongMap!1467)

(assert (=> bm!8803 (= call!8806 call!8811)))

(declare-fun b!90329 () Bool)

(declare-fun e!58814 () Bool)

(assert (=> b!90329 (= e!58823 e!58814)))

(declare-fun res!46110 () Bool)

(assert (=> b!90329 (=> (not res!46110) (not e!58814))))

(assert (=> b!90329 (= res!46110 (contains!763 lt!43671 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90329 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun bm!8804 () Bool)

(assert (=> bm!8804 (= call!8805 call!8810)))

(declare-fun bm!8805 () Bool)

(assert (=> bm!8805 (= call!8807 (contains!763 lt!43671 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90330 () Bool)

(declare-fun e!58812 () ListLongMap!1467)

(assert (=> b!90330 (= e!58812 call!8806)))

(declare-fun b!90331 () Bool)

(assert (=> b!90331 (= e!58824 (validKeyInArray!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90332 () Bool)

(assert (=> b!90332 (= e!58816 e!58821)))

(declare-fun c!15021 () Bool)

(assert (=> b!90332 (= c!15021 (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!90333 () Bool)

(assert (=> b!90333 (= e!58812 call!8808)))

(declare-fun bm!8806 () Bool)

(assert (=> bm!8806 (= call!8808 call!8805)))

(declare-fun b!90334 () Bool)

(assert (=> b!90334 (= e!58820 call!8806)))

(declare-fun b!90335 () Bool)

(declare-fun e!58822 () Bool)

(assert (=> b!90335 (= e!58822 (= (apply!85 lt!43671 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2275 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun bm!8807 () Bool)

(assert (=> bm!8807 (= call!8809 (contains!763 lt!43671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90325 () Bool)

(assert (=> b!90325 (= e!58814 (= (apply!85 lt!43671 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1224 (select (arr!1931 (_values!2370 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!350 (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!90325 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2179 (_values!2370 (v!2685 (underlying!296 thiss!992))))))))

(assert (=> b!90325 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(declare-fun d!23969 () Bool)

(assert (=> d!23969 e!58816))

(declare-fun res!46114 () Bool)

(assert (=> d!23969 (=> (not res!46114) (not e!58816))))

(assert (=> d!23969 (= res!46114 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))))

(declare-fun lt!43679 () ListLongMap!1467)

(assert (=> d!23969 (= lt!43671 lt!43679)))

(declare-fun lt!43686 () Unit!2679)

(assert (=> d!23969 (= lt!43686 e!58813)))

(declare-fun c!15018 () Bool)

(declare-fun e!58819 () Bool)

(assert (=> d!23969 (= c!15018 e!58819)))

(declare-fun res!46112 () Bool)

(assert (=> d!23969 (=> (not res!46112) (not e!58819))))

(assert (=> d!23969 (= res!46112 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_keys!4066 (v!2685 (underlying!296 thiss!992))))))))

(assert (=> d!23969 (= lt!43679 e!58818)))

(assert (=> d!23969 (= c!15022 (and (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23969 (validMask!0 (mask!6438 (v!2685 (underlying!296 thiss!992))))))

(assert (=> d!23969 (= (getCurrentListMap!432 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))) lt!43671)))

(declare-fun b!90336 () Bool)

(assert (=> b!90336 (= e!58821 e!58822)))

(declare-fun res!46113 () Bool)

(assert (=> b!90336 (= res!46113 call!8807)))

(assert (=> b!90336 (=> (not res!46113) (not e!58822))))

(declare-fun b!90337 () Bool)

(assert (=> b!90337 (= e!58815 e!58817)))

(declare-fun res!46117 () Bool)

(assert (=> b!90337 (= res!46117 call!8809)))

(assert (=> b!90337 (=> (not res!46117) (not e!58817))))

(declare-fun b!90338 () Bool)

(declare-fun res!46118 () Bool)

(assert (=> b!90338 (=> (not res!46118) (not e!58816))))

(assert (=> b!90338 (= res!46118 e!58815)))

(declare-fun c!15019 () Bool)

(assert (=> b!90338 (= c!15019 (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!90339 () Bool)

(assert (=> b!90339 (= e!58819 (validKeyInArray!0 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90340 () Bool)

(declare-fun lt!43684 () Unit!2679)

(assert (=> b!90340 (= e!58813 lt!43684)))

(declare-fun lt!43677 () ListLongMap!1467)

(assert (=> b!90340 (= lt!43677 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun lt!43688 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43692 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43692 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43681 () Unit!2679)

(declare-fun addStillContains!61 (ListLongMap!1467 (_ BitVec 64) V!3057 (_ BitVec 64)) Unit!2679)

(assert (=> b!90340 (= lt!43681 (addStillContains!61 lt!43677 lt!43688 (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) lt!43692))))

(assert (=> b!90340 (contains!763 (+!114 lt!43677 (tuple2!2235 lt!43688 (zeroValue!2275 (v!2685 (underlying!296 thiss!992))))) lt!43692)))

(declare-fun lt!43673 () Unit!2679)

(assert (=> b!90340 (= lt!43673 lt!43681)))

(declare-fun lt!43690 () ListLongMap!1467)

(assert (=> b!90340 (= lt!43690 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun lt!43674 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43674 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43689 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43689 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43680 () Unit!2679)

(declare-fun addApplyDifferent!61 (ListLongMap!1467 (_ BitVec 64) V!3057 (_ BitVec 64)) Unit!2679)

(assert (=> b!90340 (= lt!43680 (addApplyDifferent!61 lt!43690 lt!43674 (minValue!2275 (v!2685 (underlying!296 thiss!992))) lt!43689))))

(assert (=> b!90340 (= (apply!85 (+!114 lt!43690 (tuple2!2235 lt!43674 (minValue!2275 (v!2685 (underlying!296 thiss!992))))) lt!43689) (apply!85 lt!43690 lt!43689))))

(declare-fun lt!43687 () Unit!2679)

(assert (=> b!90340 (= lt!43687 lt!43680)))

(declare-fun lt!43685 () ListLongMap!1467)

(assert (=> b!90340 (= lt!43685 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun lt!43678 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43675 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43675 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43683 () Unit!2679)

(assert (=> b!90340 (= lt!43683 (addApplyDifferent!61 lt!43685 lt!43678 (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) lt!43675))))

(assert (=> b!90340 (= (apply!85 (+!114 lt!43685 (tuple2!2235 lt!43678 (zeroValue!2275 (v!2685 (underlying!296 thiss!992))))) lt!43675) (apply!85 lt!43685 lt!43675))))

(declare-fun lt!43691 () Unit!2679)

(assert (=> b!90340 (= lt!43691 lt!43683)))

(declare-fun lt!43672 () ListLongMap!1467)

(assert (=> b!90340 (= lt!43672 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(declare-fun lt!43682 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43682 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43676 () (_ BitVec 64))

(assert (=> b!90340 (= lt!43676 (select (arr!1930 (_keys!4066 (v!2685 (underlying!296 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!90340 (= lt!43684 (addApplyDifferent!61 lt!43672 lt!43682 (minValue!2275 (v!2685 (underlying!296 thiss!992))) lt!43676))))

(assert (=> b!90340 (= (apply!85 (+!114 lt!43672 (tuple2!2235 lt!43682 (minValue!2275 (v!2685 (underlying!296 thiss!992))))) lt!43676) (apply!85 lt!43672 lt!43676))))

(declare-fun b!90341 () Bool)

(declare-fun c!15020 () Bool)

(assert (=> b!90341 (= c!15020 (and (not (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!90341 (= e!58820 e!58812)))

(declare-fun bm!8808 () Bool)

(assert (=> bm!8808 (= call!8810 (getCurrentListMapNoExtraKeys!78 (_keys!4066 (v!2685 (underlying!296 thiss!992))) (_values!2370 (v!2685 (underlying!296 thiss!992))) (mask!6438 (v!2685 (underlying!296 thiss!992))) (extraKeys!2218 (v!2685 (underlying!296 thiss!992))) (zeroValue!2275 (v!2685 (underlying!296 thiss!992))) (minValue!2275 (v!2685 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992)))))))

(assert (= (and d!23969 c!15022) b!90322))

(assert (= (and d!23969 (not c!15022)) b!90327))

(assert (= (and b!90327 c!15017) b!90334))

(assert (= (and b!90327 (not c!15017)) b!90341))

(assert (= (and b!90341 c!15020) b!90330))

(assert (= (and b!90341 (not c!15020)) b!90333))

(assert (= (or b!90330 b!90333) bm!8806))

(assert (= (or b!90334 bm!8806) bm!8804))

(assert (= (or b!90334 b!90330) bm!8803))

(assert (= (or b!90322 bm!8804) bm!8808))

(assert (= (or b!90322 bm!8803) bm!8802))

(assert (= (and d!23969 res!46112) b!90339))

(assert (= (and d!23969 c!15018) b!90340))

(assert (= (and d!23969 (not c!15018)) b!90324))

(assert (= (and d!23969 res!46114) b!90321))

(assert (= (and b!90321 res!46115) b!90331))

(assert (= (and b!90321 (not res!46116)) b!90329))

(assert (= (and b!90329 res!46110) b!90325))

(assert (= (and b!90321 res!46111) b!90338))

(assert (= (and b!90338 c!15019) b!90337))

(assert (= (and b!90338 (not c!15019)) b!90326))

(assert (= (and b!90337 res!46117) b!90328))

(assert (= (or b!90337 b!90326) bm!8807))

(assert (= (and b!90338 res!46118) b!90332))

(assert (= (and b!90332 c!15021) b!90336))

(assert (= (and b!90332 (not c!15021)) b!90323))

(assert (= (and b!90336 res!46113) b!90335))

(assert (= (or b!90336 b!90323) bm!8805))

(declare-fun b_lambda!3981 () Bool)

(assert (=> (not b_lambda!3981) (not b!90325)))

(assert (=> b!90325 t!5316))

(declare-fun b_and!5433 () Bool)

(assert (= b_and!5429 (and (=> t!5316 result!2997) b_and!5433)))

(assert (=> b!90325 t!5318))

(declare-fun b_and!5435 () Bool)

(assert (= b_and!5431 (and (=> t!5318 result!3001) b_and!5435)))

(assert (=> b!90329 m!96781))

(assert (=> b!90329 m!96781))

(declare-fun m!96911 () Bool)

(assert (=> b!90329 m!96911))

(declare-fun m!96913 () Bool)

(assert (=> b!90335 m!96913))

(declare-fun m!96915 () Bool)

(assert (=> bm!8807 m!96915))

(declare-fun m!96917 () Bool)

(assert (=> b!90328 m!96917))

(assert (=> d!23969 m!96805))

(declare-fun m!96919 () Bool)

(assert (=> b!90340 m!96919))

(declare-fun m!96921 () Bool)

(assert (=> b!90340 m!96921))

(declare-fun m!96923 () Bool)

(assert (=> b!90340 m!96923))

(assert (=> b!90340 m!96781))

(declare-fun m!96925 () Bool)

(assert (=> b!90340 m!96925))

(declare-fun m!96927 () Bool)

(assert (=> b!90340 m!96927))

(assert (=> b!90340 m!96927))

(declare-fun m!96929 () Bool)

(assert (=> b!90340 m!96929))

(declare-fun m!96931 () Bool)

(assert (=> b!90340 m!96931))

(declare-fun m!96933 () Bool)

(assert (=> b!90340 m!96933))

(declare-fun m!96935 () Bool)

(assert (=> b!90340 m!96935))

(declare-fun m!96937 () Bool)

(assert (=> b!90340 m!96937))

(declare-fun m!96939 () Bool)

(assert (=> b!90340 m!96939))

(declare-fun m!96941 () Bool)

(assert (=> b!90340 m!96941))

(assert (=> b!90340 m!96527))

(assert (=> b!90340 m!96931))

(declare-fun m!96943 () Bool)

(assert (=> b!90340 m!96943))

(assert (=> b!90340 m!96939))

(declare-fun m!96945 () Bool)

(assert (=> b!90340 m!96945))

(assert (=> b!90340 m!96921))

(declare-fun m!96947 () Bool)

(assert (=> b!90340 m!96947))

(assert (=> b!90325 m!96781))

(assert (=> b!90325 m!96785))

(assert (=> b!90325 m!96489))

(assert (=> b!90325 m!96787))

(assert (=> b!90325 m!96489))

(assert (=> b!90325 m!96781))

(declare-fun m!96949 () Bool)

(assert (=> b!90325 m!96949))

(assert (=> b!90325 m!96785))

(declare-fun m!96951 () Bool)

(assert (=> bm!8802 m!96951))

(declare-fun m!96953 () Bool)

(assert (=> b!90322 m!96953))

(declare-fun m!96955 () Bool)

(assert (=> bm!8805 m!96955))

(assert (=> b!90339 m!96781))

(assert (=> b!90339 m!96781))

(assert (=> b!90339 m!96797))

(assert (=> b!90331 m!96781))

(assert (=> b!90331 m!96781))

(assert (=> b!90331 m!96797))

(assert (=> bm!8808 m!96527))

(assert (=> b!89923 d!23969))

(declare-fun d!23971 () Bool)

(assert (=> d!23971 (= (array_inv!1209 (_keys!4066 newMap!16)) (bvsge (size!2178 (_keys!4066 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89914 d!23971))

(declare-fun d!23973 () Bool)

(assert (=> d!23973 (= (array_inv!1210 (_values!2370 newMap!16)) (bvsge (size!2179 (_values!2370 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89914 d!23973))

(declare-fun condMapEmpty!3501 () Bool)

(declare-fun mapDefault!3501 () ValueCell!935)

(assert (=> mapNonEmpty!3486 (= condMapEmpty!3501 (= mapRest!3486 ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3501)))))

(declare-fun e!58829 () Bool)

(declare-fun mapRes!3501 () Bool)

(assert (=> mapNonEmpty!3486 (= tp!9090 (and e!58829 mapRes!3501))))

(declare-fun mapIsEmpty!3501 () Bool)

(assert (=> mapIsEmpty!3501 mapRes!3501))

(declare-fun b!90348 () Bool)

(declare-fun e!58830 () Bool)

(assert (=> b!90348 (= e!58830 tp_is_empty!2557)))

(declare-fun mapNonEmpty!3501 () Bool)

(declare-fun tp!9117 () Bool)

(assert (=> mapNonEmpty!3501 (= mapRes!3501 (and tp!9117 e!58830))))

(declare-fun mapKey!3501 () (_ BitVec 32))

(declare-fun mapValue!3501 () ValueCell!935)

(declare-fun mapRest!3501 () (Array (_ BitVec 32) ValueCell!935))

(assert (=> mapNonEmpty!3501 (= mapRest!3486 (store mapRest!3501 mapKey!3501 mapValue!3501))))

(declare-fun b!90349 () Bool)

(assert (=> b!90349 (= e!58829 tp_is_empty!2557)))

(assert (= (and mapNonEmpty!3486 condMapEmpty!3501) mapIsEmpty!3501))

(assert (= (and mapNonEmpty!3486 (not condMapEmpty!3501)) mapNonEmpty!3501))

(assert (= (and mapNonEmpty!3501 ((_ is ValueCellFull!935) mapValue!3501)) b!90348))

(assert (= (and mapNonEmpty!3486 ((_ is ValueCellFull!935) mapDefault!3501)) b!90349))

(declare-fun m!96957 () Bool)

(assert (=> mapNonEmpty!3501 m!96957))

(declare-fun condMapEmpty!3502 () Bool)

(declare-fun mapDefault!3502 () ValueCell!935)

(assert (=> mapNonEmpty!3485 (= condMapEmpty!3502 (= mapRest!3485 ((as const (Array (_ BitVec 32) ValueCell!935)) mapDefault!3502)))))

(declare-fun e!58831 () Bool)

(declare-fun mapRes!3502 () Bool)

(assert (=> mapNonEmpty!3485 (= tp!9088 (and e!58831 mapRes!3502))))

(declare-fun mapIsEmpty!3502 () Bool)

(assert (=> mapIsEmpty!3502 mapRes!3502))

(declare-fun b!90350 () Bool)

(declare-fun e!58832 () Bool)

(assert (=> b!90350 (= e!58832 tp_is_empty!2557)))

(declare-fun mapNonEmpty!3502 () Bool)

(declare-fun tp!9118 () Bool)

(assert (=> mapNonEmpty!3502 (= mapRes!3502 (and tp!9118 e!58832))))

(declare-fun mapValue!3502 () ValueCell!935)

(declare-fun mapRest!3502 () (Array (_ BitVec 32) ValueCell!935))

(declare-fun mapKey!3502 () (_ BitVec 32))

(assert (=> mapNonEmpty!3502 (= mapRest!3485 (store mapRest!3502 mapKey!3502 mapValue!3502))))

(declare-fun b!90351 () Bool)

(assert (=> b!90351 (= e!58831 tp_is_empty!2557)))

(assert (= (and mapNonEmpty!3485 condMapEmpty!3502) mapIsEmpty!3502))

(assert (= (and mapNonEmpty!3485 (not condMapEmpty!3502)) mapNonEmpty!3502))

(assert (= (and mapNonEmpty!3502 ((_ is ValueCellFull!935) mapValue!3502)) b!90350))

(assert (= (and mapNonEmpty!3485 ((_ is ValueCellFull!935) mapDefault!3502)) b!90351))

(declare-fun m!96959 () Bool)

(assert (=> mapNonEmpty!3502 m!96959))

(declare-fun b_lambda!3983 () Bool)

(assert (= b_lambda!3979 (or (and b!89920 b_free!2281) (and b!89914 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))))) b_lambda!3983)))

(declare-fun b_lambda!3985 () Bool)

(assert (= b_lambda!3977 (or (and b!89920 b_free!2281) (and b!89914 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))))) b_lambda!3985)))

(declare-fun b_lambda!3987 () Bool)

(assert (= b_lambda!3981 (or (and b!89920 b_free!2281) (and b!89914 b_free!2283 (= (defaultEntry!2387 newMap!16) (defaultEntry!2387 (v!2685 (underlying!296 thiss!992))))) b_lambda!3987)))

(check-sat (not b!90262) (not b!90219) (not b!90076) (not b!90116) (not b!90052) (not b!90113) (not b!90278) (not d!23963) (not bm!8802) (not b!90125) (not d!23945) (not b_lambda!3983) (not b!90064) (not b!90066) tp_is_empty!2557 (not b_lambda!3975) (not bm!8787) (not b!90072) (not b!90213) (not b!90068) (not d!23923) (not d!23939) (not mapNonEmpty!3502) (not d!23955) (not d!23949) (not b!90257) (not b!90105) (not b!90331) (not bm!8774) (not b!90073) (not bm!8775) (not d!23969) (not b!90243) (not b!90275) (not d!23953) (not b!90067) (not bm!8773) (not bm!8761) (not b!90277) (not b!90329) (not b!90071) (not b!90328) (not bm!8763) (not b!90104) (not bm!8777) (not b!90239) (not b!90106) (not b!90340) (not bm!8782) (not b_lambda!3985) (not b!90107) (not bm!8808) (not d!23947) (not b!90059) (not b!90069) (not b!90241) (not d!23943) b_and!5433 (not b!90075) (not bm!8807) (not b_next!2281) (not b!90051) (not b!90108) (not b!90053) (not d!23951) (not b!90233) (not mapNonEmpty!3501) (not b!90110) (not b_next!2283) (not bm!8770) (not b!90217) (not b_lambda!3987) (not b!90077) (not b!90074) (not b!90115) (not d!23935) (not d!23931) (not d!23921) (not b!90227) (not bm!8780) (not b!90065) (not d!23933) (not b!90103) (not b!90058) (not d!23967) (not b!90325) (not b!90335) (not d!23959) (not b!90078) (not d!23941) b_and!5435 (not bm!8779) (not b!90123) (not d!23957) (not bm!8762) (not d!23937) (not b!90070) (not bm!8805) (not b!90322) (not bm!8781) (not bm!8712) (not b!90339))
(check-sat b_and!5433 b_and!5435 (not b_next!2281) (not b_next!2283))
