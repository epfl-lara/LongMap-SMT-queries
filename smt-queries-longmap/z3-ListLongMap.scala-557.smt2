; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15158 () Bool)

(assert start!15158)

(declare-fun b!145391 () Bool)

(declare-fun b_free!3073 () Bool)

(declare-fun b_next!3073 () Bool)

(assert (=> b!145391 (= b_free!3073 (not b_next!3073))))

(declare-fun tp!11719 () Bool)

(declare-fun b_and!9061 () Bool)

(assert (=> b!145391 (= tp!11719 b_and!9061)))

(declare-fun b!145388 () Bool)

(declare-fun b_free!3075 () Bool)

(declare-fun b_next!3075 () Bool)

(assert (=> b!145388 (= b_free!3075 (not b_next!3075))))

(declare-fun tp!11717 () Bool)

(declare-fun b_and!9063 () Bool)

(assert (=> b!145388 (= tp!11717 b_and!9063)))

(declare-fun b!145384 () Bool)

(declare-fun e!94732 () Bool)

(declare-fun e!94734 () Bool)

(declare-fun mapRes!4928 () Bool)

(assert (=> b!145384 (= e!94732 (and e!94734 mapRes!4928))))

(declare-fun condMapEmpty!4927 () Bool)

(declare-datatypes ((V!3585 0))(
  ( (V!3586 (val!1521 Int)) )
))
(declare-datatypes ((array!4935 0))(
  ( (array!4936 (arr!2330 (Array (_ BitVec 32) (_ BitVec 64))) (size!2606 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1133 0))(
  ( (ValueCellFull!1133 (v!3331 V!3585)) (EmptyCell!1133) )
))
(declare-datatypes ((array!4937 0))(
  ( (array!4938 (arr!2331 (Array (_ BitVec 32) ValueCell!1133)) (size!2607 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1174 0))(
  ( (LongMapFixedSize!1175 (defaultEntry!3001 Int) (mask!7371 (_ BitVec 32)) (extraKeys!2746 (_ BitVec 32)) (zeroValue!2846 V!3585) (minValue!2846 V!3585) (_size!636 (_ BitVec 32)) (_keys!4770 array!4935) (_values!2984 array!4937) (_vacant!636 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1174)

(declare-fun mapDefault!4927 () ValueCell!1133)

(assert (=> b!145384 (= condMapEmpty!4927 (= (arr!2331 (_values!2984 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4927)))))

(declare-fun b!145385 () Bool)

(declare-fun tp_is_empty!2953 () Bool)

(assert (=> b!145385 (= e!94734 tp_is_empty!2953)))

(declare-fun b!145386 () Bool)

(declare-fun e!94738 () Bool)

(declare-fun e!94728 () Bool)

(assert (=> b!145386 (= e!94738 e!94728)))

(declare-fun res!69246 () Bool)

(assert (=> b!145386 (=> (not res!69246) (not e!94728))))

(declare-datatypes ((tuple2!2654 0))(
  ( (tuple2!2655 (_1!1338 (_ BitVec 64)) (_2!1338 V!3585)) )
))
(declare-datatypes ((List!1739 0))(
  ( (Nil!1736) (Cons!1735 (h!2343 tuple2!2654) (t!6388 List!1739)) )
))
(declare-datatypes ((ListLongMap!1701 0))(
  ( (ListLongMap!1702 (toList!866 List!1739)) )
))
(declare-fun lt!76477 () ListLongMap!1701)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!76475 () ListLongMap!1701)

(declare-datatypes ((Cell!960 0))(
  ( (Cell!961 (v!3332 LongMapFixedSize!1174)) )
))
(declare-datatypes ((LongMap!960 0))(
  ( (LongMap!961 (underlying!491 Cell!960)) )
))
(declare-fun thiss!992 () LongMap!960)

(assert (=> b!145386 (= res!69246 (and (= lt!76475 lt!76477) (not (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1444 (LongMapFixedSize!1174) ListLongMap!1701)

(assert (=> b!145386 (= lt!76477 (map!1444 newMap!16))))

(declare-fun getCurrentListMap!538 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) ListLongMap!1701)

(assert (=> b!145386 (= lt!76475 (getCurrentListMap!538 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145387 () Bool)

(declare-fun e!94733 () Bool)

(declare-fun e!94740 () Bool)

(assert (=> b!145387 (= e!94733 e!94740)))

(declare-fun e!94731 () Bool)

(declare-fun array_inv!1455 (array!4935) Bool)

(declare-fun array_inv!1456 (array!4937) Bool)

(assert (=> b!145388 (= e!94731 (and tp!11717 tp_is_empty!2953 (array_inv!1455 (_keys!4770 newMap!16)) (array_inv!1456 (_values!2984 newMap!16)) e!94732))))

(declare-fun b!145390 () Bool)

(declare-fun res!69250 () Bool)

(declare-fun e!94736 () Bool)

(assert (=> b!145390 (=> res!69250 e!94736)))

(declare-datatypes ((List!1740 0))(
  ( (Nil!1737) (Cons!1736 (h!2344 (_ BitVec 64)) (t!6389 List!1740)) )
))
(declare-fun lt!76473 () List!1740)

(declare-fun noDuplicate!56 (List!1740) Bool)

(assert (=> b!145390 (= res!69250 (not (noDuplicate!56 lt!76473)))))

(declare-fun e!94737 () Bool)

(declare-fun e!94730 () Bool)

(assert (=> b!145391 (= e!94730 (and tp!11719 tp_is_empty!2953 (array_inv!1455 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (array_inv!1456 (_values!2984 (v!3332 (underlying!491 thiss!992)))) e!94737))))

(declare-fun b!145392 () Bool)

(declare-fun res!69247 () Bool)

(assert (=> b!145392 (=> res!69247 e!94736)))

(declare-fun contains!922 (List!1740 (_ BitVec 64)) Bool)

(assert (=> b!145392 (= res!69247 (contains!922 lt!76473 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145393 () Bool)

(declare-fun res!69242 () Bool)

(assert (=> b!145393 (=> (not res!69242) (not e!94738))))

(declare-fun valid!583 (LongMapFixedSize!1174) Bool)

(assert (=> b!145393 (= res!69242 (valid!583 newMap!16))))

(declare-fun b!145394 () Bool)

(declare-fun res!69248 () Bool)

(assert (=> b!145394 (=> (not res!69248) (not e!94738))))

(assert (=> b!145394 (= res!69248 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992)))))))))

(declare-fun b!145395 () Bool)

(declare-fun e!94739 () Bool)

(assert (=> b!145395 (= e!94739 tp_is_empty!2953)))

(declare-fun b!145396 () Bool)

(declare-fun e!94735 () Bool)

(assert (=> b!145396 (= e!94735 (not e!94736))))

(declare-fun res!69249 () Bool)

(assert (=> b!145396 (=> res!69249 e!94736)))

(assert (=> b!145396 (= res!69249 (or (bvsge (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992)))))))))

(assert (=> b!145396 (= lt!76473 (Cons!1736 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) Nil!1737))))

(declare-fun arrayNoDuplicates!0 (array!4935 (_ BitVec 32) List!1740) Bool)

(assert (=> b!145396 (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) from!355 Nil!1737)))

(declare-datatypes ((Unit!4593 0))(
  ( (Unit!4594) )
))
(declare-fun lt!76476 () Unit!4593)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4935 (_ BitVec 32) (_ BitVec 32)) Unit!4593)

(assert (=> b!145396 (= lt!76476 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145396 (arrayContainsKey!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76472 () Unit!4593)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!147 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) (_ BitVec 32) Int) Unit!4593)

(assert (=> b!145396 (= lt!76472 (lemmaListMapContainsThenArrayContainsFrom!147 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145397 () Bool)

(assert (=> b!145397 (= e!94740 e!94730)))

(declare-fun b!145398 () Bool)

(assert (=> b!145398 (= e!94728 e!94735)))

(declare-fun res!69251 () Bool)

(assert (=> b!145398 (=> (not res!69251) (not e!94735))))

(declare-fun contains!923 (ListLongMap!1701 (_ BitVec 64)) Bool)

(assert (=> b!145398 (= res!69251 (contains!923 lt!76477 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2656 0))(
  ( (tuple2!2657 (_1!1339 Bool) (_2!1339 LongMapFixedSize!1174)) )
))
(declare-fun lt!76474 () tuple2!2656)

(declare-fun update!217 (LongMapFixedSize!1174 (_ BitVec 64) V!3585) tuple2!2656)

(declare-fun get!1559 (ValueCell!1133 V!3585) V!3585)

(declare-fun dynLambda!447 (Int (_ BitVec 64)) V!3585)

(assert (=> b!145398 (= lt!76474 (update!217 newMap!16 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145399 () Bool)

(declare-fun res!69245 () Bool)

(assert (=> b!145399 (=> res!69245 e!94736)))

(assert (=> b!145399 (= res!69245 (contains!922 lt!76473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145400 () Bool)

(declare-fun res!69243 () Bool)

(assert (=> b!145400 (=> res!69243 e!94736)))

(assert (=> b!145400 (= res!69243 (not (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!76473)))))

(declare-fun mapNonEmpty!4927 () Bool)

(declare-fun tp!11720 () Bool)

(assert (=> mapNonEmpty!4927 (= mapRes!4928 (and tp!11720 e!94739))))

(declare-fun mapRest!4927 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapKey!4927 () (_ BitVec 32))

(declare-fun mapValue!4928 () ValueCell!1133)

(assert (=> mapNonEmpty!4927 (= (arr!2331 (_values!2984 newMap!16)) (store mapRest!4927 mapKey!4927 mapValue!4928))))

(declare-fun mapIsEmpty!4927 () Bool)

(assert (=> mapIsEmpty!4927 mapRes!4928))

(declare-fun b!145401 () Bool)

(declare-fun e!94741 () Bool)

(declare-fun mapRes!4927 () Bool)

(assert (=> b!145401 (= e!94737 (and e!94741 mapRes!4927))))

(declare-fun condMapEmpty!4928 () Bool)

(declare-fun mapDefault!4928 () ValueCell!1133)

(assert (=> b!145401 (= condMapEmpty!4928 (= (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4928)))))

(declare-fun b!145402 () Bool)

(assert (=> b!145402 (= e!94736 (contains!922 lt!76473 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145403 () Bool)

(declare-fun res!69244 () Bool)

(assert (=> b!145403 (=> (not res!69244) (not e!94738))))

(assert (=> b!145403 (= res!69244 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7371 newMap!16)) (_size!636 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145404 () Bool)

(declare-fun e!94727 () Bool)

(assert (=> b!145404 (= e!94727 tp_is_empty!2953)))

(declare-fun res!69252 () Bool)

(assert (=> start!15158 (=> (not res!69252) (not e!94738))))

(declare-fun valid!584 (LongMap!960) Bool)

(assert (=> start!15158 (= res!69252 (valid!584 thiss!992))))

(assert (=> start!15158 e!94738))

(assert (=> start!15158 e!94733))

(assert (=> start!15158 true))

(assert (=> start!15158 e!94731))

(declare-fun b!145389 () Bool)

(assert (=> b!145389 (= e!94741 tp_is_empty!2953)))

(declare-fun mapNonEmpty!4928 () Bool)

(declare-fun tp!11718 () Bool)

(assert (=> mapNonEmpty!4928 (= mapRes!4927 (and tp!11718 e!94727))))

(declare-fun mapValue!4927 () ValueCell!1133)

(declare-fun mapRest!4928 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapKey!4928 () (_ BitVec 32))

(assert (=> mapNonEmpty!4928 (= (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) (store mapRest!4928 mapKey!4928 mapValue!4927))))

(declare-fun mapIsEmpty!4928 () Bool)

(assert (=> mapIsEmpty!4928 mapRes!4927))

(assert (= (and start!15158 res!69252) b!145394))

(assert (= (and b!145394 res!69248) b!145393))

(assert (= (and b!145393 res!69242) b!145403))

(assert (= (and b!145403 res!69244) b!145386))

(assert (= (and b!145386 res!69246) b!145398))

(assert (= (and b!145398 res!69251) b!145396))

(assert (= (and b!145396 (not res!69249)) b!145390))

(assert (= (and b!145390 (not res!69250)) b!145399))

(assert (= (and b!145399 (not res!69245)) b!145392))

(assert (= (and b!145392 (not res!69247)) b!145400))

(assert (= (and b!145400 (not res!69243)) b!145402))

(assert (= (and b!145401 condMapEmpty!4928) mapIsEmpty!4928))

(assert (= (and b!145401 (not condMapEmpty!4928)) mapNonEmpty!4928))

(get-info :version)

(assert (= (and mapNonEmpty!4928 ((_ is ValueCellFull!1133) mapValue!4927)) b!145404))

(assert (= (and b!145401 ((_ is ValueCellFull!1133) mapDefault!4928)) b!145389))

(assert (= b!145391 b!145401))

(assert (= b!145397 b!145391))

(assert (= b!145387 b!145397))

(assert (= start!15158 b!145387))

(assert (= (and b!145384 condMapEmpty!4927) mapIsEmpty!4927))

(assert (= (and b!145384 (not condMapEmpty!4927)) mapNonEmpty!4927))

(assert (= (and mapNonEmpty!4927 ((_ is ValueCellFull!1133) mapValue!4928)) b!145395))

(assert (= (and b!145384 ((_ is ValueCellFull!1133) mapDefault!4927)) b!145385))

(assert (= b!145388 b!145384))

(assert (= start!15158 b!145388))

(declare-fun b_lambda!6533 () Bool)

(assert (=> (not b_lambda!6533) (not b!145398)))

(declare-fun t!6385 () Bool)

(declare-fun tb!2609 () Bool)

(assert (=> (and b!145391 (= (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))) t!6385) tb!2609))

(declare-fun result!4271 () Bool)

(assert (=> tb!2609 (= result!4271 tp_is_empty!2953)))

(assert (=> b!145398 t!6385))

(declare-fun b_and!9065 () Bool)

(assert (= b_and!9061 (and (=> t!6385 result!4271) b_and!9065)))

(declare-fun t!6387 () Bool)

(declare-fun tb!2611 () Bool)

(assert (=> (and b!145388 (= (defaultEntry!3001 newMap!16) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))) t!6387) tb!2611))

(declare-fun result!4275 () Bool)

(assert (= result!4275 result!4271))

(assert (=> b!145398 t!6387))

(declare-fun b_and!9067 () Bool)

(assert (= b_and!9063 (and (=> t!6387 result!4275) b_and!9067)))

(declare-fun m!175325 () Bool)

(assert (=> start!15158 m!175325))

(declare-fun m!175327 () Bool)

(assert (=> b!145400 m!175327))

(declare-fun m!175329 () Bool)

(assert (=> b!145392 m!175329))

(declare-fun m!175331 () Bool)

(assert (=> mapNonEmpty!4927 m!175331))

(declare-fun m!175333 () Bool)

(assert (=> b!145386 m!175333))

(declare-fun m!175335 () Bool)

(assert (=> b!145386 m!175335))

(declare-fun m!175337 () Bool)

(assert (=> b!145386 m!175337))

(declare-fun m!175339 () Bool)

(assert (=> b!145388 m!175339))

(declare-fun m!175341 () Bool)

(assert (=> b!145388 m!175341))

(declare-fun m!175343 () Bool)

(assert (=> b!145391 m!175343))

(declare-fun m!175345 () Bool)

(assert (=> b!145391 m!175345))

(declare-fun m!175347 () Bool)

(assert (=> b!145399 m!175347))

(declare-fun m!175349 () Bool)

(assert (=> b!145398 m!175349))

(declare-fun m!175351 () Bool)

(assert (=> b!145398 m!175351))

(declare-fun m!175353 () Bool)

(assert (=> b!145398 m!175353))

(assert (=> b!145398 m!175333))

(declare-fun m!175355 () Bool)

(assert (=> b!145398 m!175355))

(assert (=> b!145398 m!175333))

(assert (=> b!145398 m!175351))

(assert (=> b!145398 m!175333))

(assert (=> b!145398 m!175353))

(declare-fun m!175357 () Bool)

(assert (=> b!145398 m!175357))

(assert (=> b!145398 m!175349))

(assert (=> b!145402 m!175333))

(assert (=> b!145402 m!175333))

(declare-fun m!175359 () Bool)

(assert (=> b!145402 m!175359))

(declare-fun m!175361 () Bool)

(assert (=> b!145396 m!175361))

(declare-fun m!175363 () Bool)

(assert (=> b!145396 m!175363))

(assert (=> b!145396 m!175333))

(declare-fun m!175365 () Bool)

(assert (=> b!145396 m!175365))

(assert (=> b!145396 m!175333))

(assert (=> b!145396 m!175333))

(declare-fun m!175367 () Bool)

(assert (=> b!145396 m!175367))

(declare-fun m!175369 () Bool)

(assert (=> b!145393 m!175369))

(declare-fun m!175371 () Bool)

(assert (=> mapNonEmpty!4928 m!175371))

(declare-fun m!175373 () Bool)

(assert (=> b!145390 m!175373))

(check-sat (not b!145392) (not b!145393) (not b!145399) (not b!145391) (not b_next!3073) (not b!145402) (not b_next!3075) (not b!145388) (not b!145390) (not b!145396) (not mapNonEmpty!4928) (not start!15158) b_and!9067 (not b!145398) (not b_lambda!6533) b_and!9065 (not b!145386) tp_is_empty!2953 (not mapNonEmpty!4927) (not b!145400))
(check-sat b_and!9065 b_and!9067 (not b_next!3073) (not b_next!3075))
(get-model)

(declare-fun b_lambda!6539 () Bool)

(assert (= b_lambda!6533 (or (and b!145391 b_free!3073) (and b!145388 b_free!3075 (= (defaultEntry!3001 newMap!16) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))))) b_lambda!6539)))

(check-sat (not b!145392) (not b!145393) (not b!145399) (not b!145391) (not b_next!3073) (not b!145402) (not b_next!3075) (not b!145388) (not b!145390) (not b!145396) (not mapNonEmpty!4928) (not start!15158) b_and!9067 (not b!145398) (not b_lambda!6539) b_and!9065 (not b!145386) tp_is_empty!2953 (not mapNonEmpty!4927) (not b!145400))
(check-sat b_and!9065 b_and!9067 (not b_next!3073) (not b_next!3075))
(get-model)

(declare-fun d!46299 () Bool)

(assert (=> d!46299 (= (array_inv!1455 (_keys!4770 newMap!16)) (bvsge (size!2606 (_keys!4770 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145388 d!46299))

(declare-fun d!46301 () Bool)

(assert (=> d!46301 (= (array_inv!1456 (_values!2984 newMap!16)) (bvsge (size!2607 (_values!2984 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145388 d!46301))

(declare-fun d!46303 () Bool)

(declare-fun e!94843 () Bool)

(assert (=> d!46303 e!94843))

(declare-fun res!69321 () Bool)

(assert (=> d!46303 (=> res!69321 e!94843)))

(declare-fun lt!76524 () Bool)

(assert (=> d!46303 (= res!69321 (not lt!76524))))

(declare-fun lt!76522 () Bool)

(assert (=> d!46303 (= lt!76524 lt!76522)))

(declare-fun lt!76525 () Unit!4593)

(declare-fun e!94842 () Unit!4593)

(assert (=> d!46303 (= lt!76525 e!94842)))

(declare-fun c!27542 () Bool)

(assert (=> d!46303 (= c!27542 lt!76522)))

(declare-fun containsKey!184 (List!1739 (_ BitVec 64)) Bool)

(assert (=> d!46303 (= lt!76522 (containsKey!184 (toList!866 lt!76477) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> d!46303 (= (contains!923 lt!76477 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)) lt!76524)))

(declare-fun b!145543 () Bool)

(declare-fun lt!76523 () Unit!4593)

(assert (=> b!145543 (= e!94842 lt!76523)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!132 (List!1739 (_ BitVec 64)) Unit!4593)

(assert (=> b!145543 (= lt!76523 (lemmaContainsKeyImpliesGetValueByKeyDefined!132 (toList!866 lt!76477) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-datatypes ((Option!187 0))(
  ( (Some!186 (v!3339 V!3585)) (None!185) )
))
(declare-fun isDefined!133 (Option!187) Bool)

(declare-fun getValueByKey!181 (List!1739 (_ BitVec 64)) Option!187)

(assert (=> b!145543 (isDefined!133 (getValueByKey!181 (toList!866 lt!76477) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145544 () Bool)

(declare-fun Unit!4595 () Unit!4593)

(assert (=> b!145544 (= e!94842 Unit!4595)))

(declare-fun b!145545 () Bool)

(assert (=> b!145545 (= e!94843 (isDefined!133 (getValueByKey!181 (toList!866 lt!76477) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355))))))

(assert (= (and d!46303 c!27542) b!145543))

(assert (= (and d!46303 (not c!27542)) b!145544))

(assert (= (and d!46303 (not res!69321)) b!145545))

(assert (=> d!46303 m!175333))

(declare-fun m!175475 () Bool)

(assert (=> d!46303 m!175475))

(assert (=> b!145543 m!175333))

(declare-fun m!175477 () Bool)

(assert (=> b!145543 m!175477))

(assert (=> b!145543 m!175333))

(declare-fun m!175479 () Bool)

(assert (=> b!145543 m!175479))

(assert (=> b!145543 m!175479))

(declare-fun m!175481 () Bool)

(assert (=> b!145543 m!175481))

(assert (=> b!145545 m!175333))

(assert (=> b!145545 m!175479))

(assert (=> b!145545 m!175479))

(assert (=> b!145545 m!175481))

(assert (=> b!145398 d!46303))

(declare-fun e!94900 () Bool)

(declare-fun b!145626 () Bool)

(declare-datatypes ((SeekEntryResult!277 0))(
  ( (MissingZero!277 (index!3275 (_ BitVec 32))) (Found!277 (index!3276 (_ BitVec 32))) (Intermediate!277 (undefined!1089 Bool) (index!3277 (_ BitVec 32)) (x!16598 (_ BitVec 32))) (Undefined!277) (MissingVacant!277 (index!3278 (_ BitVec 32))) )
))
(declare-fun lt!76588 () SeekEntryResult!277)

(assert (=> b!145626 (= e!94900 (= (select (arr!2330 (_keys!4770 newMap!16)) (index!3276 lt!76588)) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145627 () Bool)

(declare-fun e!94904 () Bool)

(declare-fun lt!76595 () SeekEntryResult!277)

(assert (=> b!145627 (= e!94904 ((_ is Undefined!277) lt!76595))))

(declare-fun d!46305 () Bool)

(declare-fun e!94897 () Bool)

(assert (=> d!46305 e!94897))

(declare-fun res!69361 () Bool)

(assert (=> d!46305 (=> (not res!69361) (not e!94897))))

(declare-fun lt!76594 () tuple2!2656)

(assert (=> d!46305 (= res!69361 (valid!583 (_2!1339 lt!76594)))))

(declare-fun e!94903 () tuple2!2656)

(assert (=> d!46305 (= lt!76594 e!94903)))

(declare-fun c!27572 () Bool)

(assert (=> d!46305 (= c!27572 (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvneg (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355))))))

(assert (=> d!46305 (valid!583 newMap!16)))

(assert (=> d!46305 (= (update!217 newMap!16 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!76594)))

(declare-fun call!16298 () ListLongMap!1701)

(declare-fun c!27581 () Bool)

(declare-fun bm!16273 () Bool)

(assert (=> bm!16273 (= call!16298 (map!1444 (ite c!27581 (_2!1339 lt!76594) newMap!16)))))

(declare-fun b!145628 () Bool)

(declare-fun c!27579 () Bool)

(declare-fun lt!76601 () SeekEntryResult!277)

(assert (=> b!145628 (= c!27579 ((_ is MissingVacant!277) lt!76601))))

(declare-fun e!94902 () Bool)

(declare-fun e!94889 () Bool)

(assert (=> b!145628 (= e!94902 e!94889)))

(declare-fun b!145629 () Bool)

(declare-fun res!69352 () Bool)

(declare-fun call!16287 () Bool)

(assert (=> b!145629 (= res!69352 call!16287)))

(declare-fun e!94888 () Bool)

(assert (=> b!145629 (=> (not res!69352) (not e!94888))))

(declare-fun b!145630 () Bool)

(declare-fun lt!76583 () Unit!4593)

(declare-fun lt!76592 () Unit!4593)

(assert (=> b!145630 (= lt!76583 lt!76592)))

(declare-fun call!16299 () ListLongMap!1701)

(declare-fun call!16280 () ListLongMap!1701)

(assert (=> b!145630 (= call!16299 call!16280)))

(declare-fun lt!76604 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!69 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 V!3585 Int) Unit!4593)

(assert (=> b!145630 (= lt!76592 (lemmaChangeZeroKeyThenAddPairToListMap!69 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) lt!76604 (zeroValue!2846 newMap!16) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2846 newMap!16) (defaultEntry!3001 newMap!16)))))

(assert (=> b!145630 (= lt!76604 (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!94905 () tuple2!2656)

(assert (=> b!145630 (= e!94905 (tuple2!2657 true (LongMapFixedSize!1175 (defaultEntry!3001 newMap!16) (mask!7371 newMap!16) (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000001) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2846 newMap!16) (_size!636 newMap!16) (_keys!4770 newMap!16) (_values!2984 newMap!16) (_vacant!636 newMap!16))))))

(declare-fun call!16277 () ListLongMap!1701)

(declare-fun bm!16274 () Bool)

(declare-fun lt!76586 () (_ BitVec 32))

(declare-fun lt!76598 () array!4937)

(declare-fun c!27573 () Bool)

(assert (=> bm!16274 (= call!16277 (getCurrentListMap!538 (_keys!4770 newMap!16) (ite c!27572 (_values!2984 newMap!16) lt!76598) (mask!7371 newMap!16) (ite c!27572 (ite c!27573 (extraKeys!2746 newMap!16) lt!76586) (extraKeys!2746 newMap!16)) (zeroValue!2846 newMap!16) (ite c!27572 (ite c!27573 (minValue!2846 newMap!16) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2846 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun bm!16275 () Bool)

(declare-fun call!16281 () SeekEntryResult!277)

(declare-fun call!16285 () SeekEntryResult!277)

(assert (=> bm!16275 (= call!16281 call!16285)))

(declare-fun b!145631 () Bool)

(declare-fun c!27578 () Bool)

(assert (=> b!145631 (= c!27578 ((_ is MissingVacant!277) lt!76595))))

(declare-fun e!94894 () Bool)

(assert (=> b!145631 (= e!94894 e!94904)))

(declare-fun b!145632 () Bool)

(declare-fun e!94893 () ListLongMap!1701)

(declare-fun call!16284 () ListLongMap!1701)

(assert (=> b!145632 (= e!94893 call!16284)))

(declare-fun b!145633 () Bool)

(declare-fun e!94901 () Unit!4593)

(declare-fun Unit!4596 () Unit!4593)

(assert (=> b!145633 (= e!94901 Unit!4596)))

(declare-fun lt!76582 () Unit!4593)

(declare-fun call!16295 () Unit!4593)

(assert (=> b!145633 (= lt!76582 call!16295)))

(declare-fun lt!76602 () SeekEntryResult!277)

(assert (=> b!145633 (= lt!76602 call!16281)))

(declare-fun res!69362 () Bool)

(assert (=> b!145633 (= res!69362 ((_ is Found!277) lt!76602))))

(assert (=> b!145633 (=> (not res!69362) (not e!94888))))

(assert (=> b!145633 e!94888))

(declare-fun lt!76585 () Unit!4593)

(assert (=> b!145633 (= lt!76585 lt!76582)))

(assert (=> b!145633 false))

(declare-fun b!145634 () Bool)

(declare-fun e!94895 () Bool)

(declare-fun call!16288 () Bool)

(assert (=> b!145634 (= e!94895 (not call!16288))))

(declare-fun b!145635 () Bool)

(declare-fun e!94899 () Bool)

(declare-fun call!16293 () ListLongMap!1701)

(assert (=> b!145635 (= e!94899 (= call!16293 call!16298))))

(declare-fun b!145636 () Bool)

(assert (=> b!145636 (= e!94897 e!94899)))

(assert (=> b!145636 (= c!27581 (_1!1339 lt!76594))))

(declare-fun b!145637 () Bool)

(declare-fun e!94886 () Bool)

(declare-fun +!177 (ListLongMap!1701 tuple2!2654) ListLongMap!1701)

(assert (=> b!145637 (= e!94886 (= call!16298 (+!177 call!16293 (tuple2!2655 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!16276 () Bool)

(declare-fun c!27571 () Bool)

(declare-fun c!27580 () Bool)

(assert (=> bm!16276 (= c!27571 c!27580)))

(declare-fun call!16291 () Bool)

(assert (=> bm!16276 (= call!16291 (contains!923 e!94893 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145638 () Bool)

(declare-fun res!69354 () Bool)

(assert (=> b!145638 (=> (not res!69354) (not e!94895))))

(declare-fun call!16290 () Bool)

(assert (=> b!145638 (= res!69354 call!16290)))

(assert (=> b!145638 (= e!94902 e!94895)))

(declare-fun b!145639 () Bool)

(declare-fun lt!76580 () Unit!4593)

(assert (=> b!145639 (= lt!76580 e!94901)))

(declare-fun c!27575 () Bool)

(assert (=> b!145639 (= c!27575 call!16291)))

(declare-fun e!94887 () tuple2!2656)

(assert (=> b!145639 (= e!94887 (tuple2!2657 false newMap!16))))

(declare-fun bm!16277 () Bool)

(declare-fun call!16276 () Bool)

(assert (=> bm!16277 (= call!16276 call!16287)))

(declare-fun b!145640 () Bool)

(declare-fun res!69357 () Bool)

(declare-fun e!94898 () Bool)

(assert (=> b!145640 (=> (not res!69357) (not e!94898))))

(assert (=> b!145640 (= res!69357 call!16276)))

(assert (=> b!145640 (= e!94894 e!94898)))

(declare-fun b!145641 () Bool)

(assert (=> b!145641 (= e!94888 (= (select (arr!2330 (_keys!4770 newMap!16)) (index!3276 lt!76602)) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145642 () Bool)

(declare-fun e!94892 () Bool)

(assert (=> b!145642 (= e!94889 e!94892)))

(declare-fun res!69356 () Bool)

(assert (=> b!145642 (= res!69356 call!16290)))

(assert (=> b!145642 (=> (not res!69356) (not e!94892))))

(declare-fun c!27576 () Bool)

(declare-fun c!27574 () Bool)

(declare-fun c!27577 () Bool)

(declare-fun bm!16278 () Bool)

(declare-fun call!16283 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16278 (= call!16283 (inRange!0 (ite c!27580 (ite c!27575 (index!3276 lt!76602) (ite c!27574 (index!3275 lt!76595) (index!3278 lt!76595))) (ite c!27577 (index!3276 lt!76588) (ite c!27576 (index!3275 lt!76601) (index!3278 lt!76601)))) (mask!7371 newMap!16)))))

(declare-fun b!145643 () Bool)

(declare-fun e!94891 () Unit!4593)

(declare-fun lt!76591 () Unit!4593)

(assert (=> b!145643 (= e!94891 lt!76591)))

(assert (=> b!145643 (= lt!76591 call!16295)))

(declare-fun call!16294 () SeekEntryResult!277)

(assert (=> b!145643 (= lt!76588 call!16294)))

(declare-fun res!69359 () Bool)

(assert (=> b!145643 (= res!69359 ((_ is Found!277) lt!76588))))

(assert (=> b!145643 (=> (not res!69359) (not e!94900))))

(assert (=> b!145643 e!94900))

(declare-fun b!145644 () Bool)

(assert (=> b!145644 (= e!94892 (not call!16288))))

(declare-fun bm!16279 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4935 (_ BitVec 32)) SeekEntryResult!277)

(assert (=> bm!16279 (= call!16285 (seekEntryOrOpen!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (_keys!4770 newMap!16) (mask!7371 newMap!16)))))

(declare-fun b!145645 () Bool)

(declare-fun lt!76596 () Unit!4593)

(declare-fun lt!76587 () Unit!4593)

(assert (=> b!145645 (= lt!76596 lt!76587)))

(declare-fun lt!76589 () SeekEntryResult!277)

(assert (=> b!145645 (contains!923 call!16277 (select (arr!2330 (_keys!4770 newMap!16)) (index!3276 lt!76589)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!129 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) Unit!4593)

(assert (=> b!145645 (= lt!76587 (lemmaValidKeyInArrayIsInListMap!129 (_keys!4770 newMap!16) lt!76598 (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (index!3276 lt!76589) (defaultEntry!3001 newMap!16)))))

(assert (=> b!145645 (= lt!76598 (array!4938 (store (arr!2331 (_values!2984 newMap!16)) (index!3276 lt!76589) (ValueCellFull!1133 (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2607 (_values!2984 newMap!16))))))

(declare-fun lt!76600 () Unit!4593)

(declare-fun lt!76606 () Unit!4593)

(assert (=> b!145645 (= lt!76600 lt!76606)))

(declare-fun call!16289 () ListLongMap!1701)

(declare-fun call!16279 () ListLongMap!1701)

(assert (=> b!145645 (= call!16289 call!16279)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!69 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) (_ BitVec 64) V!3585 Int) Unit!4593)

(assert (=> b!145645 (= lt!76606 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!69 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (index!3276 lt!76589) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!3001 newMap!16)))))

(declare-fun lt!76599 () Unit!4593)

(assert (=> b!145645 (= lt!76599 e!94891)))

(assert (=> b!145645 (= c!27577 call!16291)))

(declare-fun e!94906 () tuple2!2656)

(assert (=> b!145645 (= e!94906 (tuple2!2657 true (LongMapFixedSize!1175 (defaultEntry!3001 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (_size!636 newMap!16) (_keys!4770 newMap!16) (array!4938 (store (arr!2331 (_values!2984 newMap!16)) (index!3276 lt!76589) (ValueCellFull!1133 (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2607 (_values!2984 newMap!16))) (_vacant!636 newMap!16))))))

(declare-fun b!145646 () Bool)

(assert (=> b!145646 (= e!94889 ((_ is Undefined!277) lt!76601))))

(declare-fun bm!16280 () Bool)

(assert (=> bm!16280 (= call!16293 (map!1444 (ite c!27581 newMap!16 (_2!1339 lt!76594))))))

(declare-fun bm!16281 () Bool)

(declare-fun call!16297 () Unit!4593)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!69 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) Int) Unit!4593)

(assert (=> bm!16281 (= call!16297 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!69 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (defaultEntry!3001 newMap!16)))))

(declare-fun bm!16282 () Bool)

(assert (=> bm!16282 (= call!16284 (getCurrentListMap!538 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (ite (and c!27572 c!27573) lt!76604 (extraKeys!2746 newMap!16)) (ite (and c!27572 c!27573) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2846 newMap!16)) (minValue!2846 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun b!145647 () Bool)

(declare-fun call!16286 () Bool)

(assert (=> b!145647 (= e!94898 (not call!16286))))

(declare-fun bm!16283 () Bool)

(declare-fun call!16296 () ListLongMap!1701)

(assert (=> bm!16283 (= call!16289 (+!177 (ite c!27572 (ite c!27573 call!16296 call!16280) call!16284) (ite c!27572 (ite c!27573 (tuple2!2655 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2655 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2655 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!145648 () Bool)

(declare-fun e!94896 () Bool)

(assert (=> b!145648 (= e!94904 e!94896)))

(declare-fun res!69350 () Bool)

(assert (=> b!145648 (= res!69350 call!16276)))

(assert (=> b!145648 (=> (not res!69350) (not e!94896))))

(declare-fun bm!16284 () Bool)

(declare-fun c!27570 () Bool)

(declare-fun call!16282 () tuple2!2656)

(declare-fun updateHelperNewKey!69 (LongMapFixedSize!1174 (_ BitVec 64) V!3585 (_ BitVec 32)) tuple2!2656)

(assert (=> bm!16284 (= call!16282 (updateHelperNewKey!69 newMap!16 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27570 (index!3278 lt!76589) (index!3275 lt!76589))))))

(declare-fun b!145649 () Bool)

(assert (=> b!145649 (= e!94903 e!94887)))

(assert (=> b!145649 (= lt!76589 (seekEntryOrOpen!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (_keys!4770 newMap!16) (mask!7371 newMap!16)))))

(assert (=> b!145649 (= c!27580 ((_ is Undefined!277) lt!76589))))

(declare-fun b!145650 () Bool)

(declare-fun res!69353 () Bool)

(assert (=> b!145650 (= res!69353 (= (select (arr!2330 (_keys!4770 newMap!16)) (index!3278 lt!76595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145650 (=> (not res!69353) (not e!94896))))

(declare-fun bm!16285 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!69 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) Int) Unit!4593)

(assert (=> bm!16285 (= call!16295 (lemmaInListMapThenSeekEntryOrOpenFindsIt!69 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (defaultEntry!3001 newMap!16)))))

(declare-fun bm!16286 () Bool)

(declare-fun call!16278 () Bool)

(assert (=> bm!16286 (= call!16286 call!16278)))

(declare-fun bm!16287 () Bool)

(assert (=> bm!16287 (= call!16294 call!16285)))

(declare-fun b!145651 () Bool)

(assert (=> b!145651 (= e!94903 e!94905)))

(assert (=> b!145651 (= c!27573 (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16288 () Bool)

(assert (=> bm!16288 (= call!16288 call!16278)))

(declare-fun b!145652 () Bool)

(declare-fun Unit!4597 () Unit!4593)

(assert (=> b!145652 (= e!94891 Unit!4597)))

(declare-fun lt!76597 () Unit!4593)

(assert (=> b!145652 (= lt!76597 call!16297)))

(assert (=> b!145652 (= lt!76601 call!16294)))

(assert (=> b!145652 (= c!27576 ((_ is MissingZero!277) lt!76601))))

(assert (=> b!145652 e!94902))

(declare-fun lt!76590 () Unit!4593)

(assert (=> b!145652 (= lt!76590 lt!76597)))

(assert (=> b!145652 false))

(declare-fun bm!16289 () Bool)

(declare-fun call!16292 () Bool)

(assert (=> bm!16289 (= call!16290 call!16292)))

(declare-fun bm!16290 () Bool)

(assert (=> bm!16290 (= call!16296 call!16277)))

(declare-fun b!145653 () Bool)

(declare-fun res!69358 () Bool)

(assert (=> b!145653 (=> (not res!69358) (not e!94895))))

(assert (=> b!145653 (= res!69358 (= (select (arr!2330 (_keys!4770 newMap!16)) (index!3275 lt!76601)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145654 () Bool)

(declare-fun lt!76581 () tuple2!2656)

(assert (=> b!145654 (= lt!76581 call!16282)))

(assert (=> b!145654 (= e!94906 (tuple2!2657 (_1!1339 lt!76581) (_2!1339 lt!76581)))))

(declare-fun b!145655 () Bool)

(declare-fun e!94890 () tuple2!2656)

(assert (=> b!145655 (= e!94890 e!94906)))

(declare-fun c!27569 () Bool)

(assert (=> b!145655 (= c!27569 ((_ is MissingZero!277) lt!76589))))

(declare-fun b!145656 () Bool)

(declare-fun res!69363 () Bool)

(assert (=> b!145656 (=> (not res!69363) (not e!94898))))

(assert (=> b!145656 (= res!69363 (= (select (arr!2330 (_keys!4770 newMap!16)) (index!3275 lt!76595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145657 () Bool)

(assert (=> b!145657 (= e!94896 (not call!16286))))

(declare-fun bm!16291 () Bool)

(assert (=> bm!16291 (= call!16278 (arrayContainsKey!0 (_keys!4770 newMap!16) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!16292 () Bool)

(assert (=> bm!16292 (= call!16287 call!16283)))

(declare-fun bm!16293 () Bool)

(assert (=> bm!16293 (= call!16279 (getCurrentListMap!538 (_keys!4770 newMap!16) (ite c!27580 (_values!2984 newMap!16) (array!4938 (store (arr!2331 (_values!2984 newMap!16)) (index!3276 lt!76589) (ValueCellFull!1133 (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2607 (_values!2984 newMap!16)))) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun b!145658 () Bool)

(declare-fun res!69351 () Bool)

(assert (=> b!145658 (= res!69351 (= (select (arr!2330 (_keys!4770 newMap!16)) (index!3278 lt!76601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145658 (=> (not res!69351) (not e!94892))))

(declare-fun b!145659 () Bool)

(declare-fun lt!76605 () Unit!4593)

(declare-fun lt!76603 () Unit!4593)

(assert (=> b!145659 (= lt!76605 lt!76603)))

(assert (=> b!145659 (= call!16299 call!16296)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!69 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 V!3585 Int) Unit!4593)

(assert (=> b!145659 (= lt!76603 (lemmaChangeLongMinValueKeyThenAddPairToListMap!69 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) lt!76586 (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!3001 newMap!16)))))

(assert (=> b!145659 (= lt!76586 (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!145659 (= e!94905 (tuple2!2657 true (LongMapFixedSize!1175 (defaultEntry!3001 newMap!16) (mask!7371 newMap!16) (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000010) (zeroValue!2846 newMap!16) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!636 newMap!16) (_keys!4770 newMap!16) (_values!2984 newMap!16) (_vacant!636 newMap!16))))))

(declare-fun b!145660 () Bool)

(declare-fun lt!76584 () Unit!4593)

(assert (=> b!145660 (= e!94901 lt!76584)))

(assert (=> b!145660 (= lt!76584 call!16297)))

(assert (=> b!145660 (= lt!76595 call!16281)))

(assert (=> b!145660 (= c!27574 ((_ is MissingZero!277) lt!76595))))

(assert (=> b!145660 e!94894))

(declare-fun bm!16294 () Bool)

(assert (=> bm!16294 (= call!16280 call!16284)))

(declare-fun b!145661 () Bool)

(assert (=> b!145661 (= e!94899 e!94886)))

(declare-fun res!69360 () Bool)

(assert (=> b!145661 (= res!69360 (contains!923 call!16298 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> b!145661 (=> (not res!69360) (not e!94886))))

(declare-fun bm!16295 () Bool)

(assert (=> bm!16295 (= call!16292 call!16283)))

(declare-fun b!145662 () Bool)

(assert (=> b!145662 (= c!27570 ((_ is MissingVacant!277) lt!76589))))

(assert (=> b!145662 (= e!94887 e!94890)))

(declare-fun b!145663 () Bool)

(assert (=> b!145663 (= e!94893 call!16279)))

(declare-fun b!145664 () Bool)

(declare-fun res!69355 () Bool)

(assert (=> b!145664 (= res!69355 call!16292)))

(assert (=> b!145664 (=> (not res!69355) (not e!94900))))

(declare-fun b!145665 () Bool)

(declare-fun lt!76593 () tuple2!2656)

(assert (=> b!145665 (= e!94890 (tuple2!2657 (_1!1339 lt!76593) (_2!1339 lt!76593)))))

(assert (=> b!145665 (= lt!76593 call!16282)))

(declare-fun bm!16296 () Bool)

(assert (=> bm!16296 (= call!16299 call!16289)))

(assert (= (and d!46305 c!27572) b!145651))

(assert (= (and d!46305 (not c!27572)) b!145649))

(assert (= (and b!145651 c!27573) b!145630))

(assert (= (and b!145651 (not c!27573)) b!145659))

(assert (= (or b!145630 b!145659) bm!16290))

(assert (= (or b!145630 b!145659) bm!16294))

(assert (= (or b!145630 b!145659) bm!16296))

(assert (= (and b!145649 c!27580) b!145639))

(assert (= (and b!145649 (not c!27580)) b!145662))

(assert (= (and b!145639 c!27575) b!145633))

(assert (= (and b!145639 (not c!27575)) b!145660))

(assert (= (and b!145633 res!69362) b!145629))

(assert (= (and b!145629 res!69352) b!145641))

(assert (= (and b!145660 c!27574) b!145640))

(assert (= (and b!145660 (not c!27574)) b!145631))

(assert (= (and b!145640 res!69357) b!145656))

(assert (= (and b!145656 res!69363) b!145647))

(assert (= (and b!145631 c!27578) b!145648))

(assert (= (and b!145631 (not c!27578)) b!145627))

(assert (= (and b!145648 res!69350) b!145650))

(assert (= (and b!145650 res!69353) b!145657))

(assert (= (or b!145640 b!145648) bm!16277))

(assert (= (or b!145647 b!145657) bm!16286))

(assert (= (or b!145629 bm!16277) bm!16292))

(assert (= (or b!145633 b!145660) bm!16275))

(assert (= (and b!145662 c!27570) b!145665))

(assert (= (and b!145662 (not c!27570)) b!145655))

(assert (= (and b!145655 c!27569) b!145654))

(assert (= (and b!145655 (not c!27569)) b!145645))

(assert (= (and b!145645 c!27577) b!145643))

(assert (= (and b!145645 (not c!27577)) b!145652))

(assert (= (and b!145643 res!69359) b!145664))

(assert (= (and b!145664 res!69355) b!145626))

(assert (= (and b!145652 c!27576) b!145638))

(assert (= (and b!145652 (not c!27576)) b!145628))

(assert (= (and b!145638 res!69354) b!145653))

(assert (= (and b!145653 res!69358) b!145634))

(assert (= (and b!145628 c!27579) b!145642))

(assert (= (and b!145628 (not c!27579)) b!145646))

(assert (= (and b!145642 res!69356) b!145658))

(assert (= (and b!145658 res!69351) b!145644))

(assert (= (or b!145638 b!145642) bm!16289))

(assert (= (or b!145634 b!145644) bm!16288))

(assert (= (or b!145664 bm!16289) bm!16295))

(assert (= (or b!145643 b!145652) bm!16287))

(assert (= (or b!145665 b!145654) bm!16284))

(assert (= (or b!145660 b!145652) bm!16281))

(assert (= (or b!145633 b!145643) bm!16285))

(assert (= (or bm!16275 bm!16287) bm!16279))

(assert (= (or bm!16292 bm!16295) bm!16278))

(assert (= (or b!145639 b!145645) bm!16293))

(assert (= (or bm!16286 bm!16288) bm!16291))

(assert (= (or b!145639 b!145645) bm!16276))

(assert (= (and bm!16276 c!27571) b!145663))

(assert (= (and bm!16276 (not c!27571)) b!145632))

(assert (= (or bm!16290 b!145645) bm!16274))

(assert (= (or bm!16294 b!145632 b!145645) bm!16282))

(assert (= (or bm!16296 b!145645) bm!16283))

(assert (= (and d!46305 res!69361) b!145636))

(assert (= (and b!145636 c!27581) b!145661))

(assert (= (and b!145636 (not c!27581)) b!145635))

(assert (= (and b!145661 res!69360) b!145637))

(assert (= (or b!145637 b!145635) bm!16280))

(assert (= (or b!145661 b!145637 b!145635) bm!16273))

(declare-fun m!175483 () Bool)

(assert (=> bm!16273 m!175483))

(declare-fun m!175485 () Bool)

(assert (=> b!145626 m!175485))

(declare-fun m!175487 () Bool)

(assert (=> bm!16274 m!175487))

(declare-fun m!175489 () Bool)

(assert (=> b!145637 m!175489))

(declare-fun m!175491 () Bool)

(assert (=> bm!16280 m!175491))

(assert (=> bm!16284 m!175333))

(assert (=> bm!16284 m!175353))

(declare-fun m!175493 () Bool)

(assert (=> bm!16284 m!175493))

(declare-fun m!175495 () Bool)

(assert (=> bm!16283 m!175495))

(declare-fun m!175497 () Bool)

(assert (=> b!145641 m!175497))

(assert (=> b!145630 m!175353))

(declare-fun m!175499 () Bool)

(assert (=> b!145630 m!175499))

(declare-fun m!175501 () Bool)

(assert (=> bm!16278 m!175501))

(assert (=> bm!16285 m!175333))

(declare-fun m!175503 () Bool)

(assert (=> bm!16285 m!175503))

(declare-fun m!175505 () Bool)

(assert (=> b!145650 m!175505))

(assert (=> bm!16276 m!175333))

(declare-fun m!175507 () Bool)

(assert (=> bm!16276 m!175507))

(declare-fun m!175509 () Bool)

(assert (=> bm!16282 m!175509))

(declare-fun m!175511 () Bool)

(assert (=> bm!16293 m!175511))

(declare-fun m!175513 () Bool)

(assert (=> bm!16293 m!175513))

(assert (=> b!145661 m!175333))

(declare-fun m!175515 () Bool)

(assert (=> b!145661 m!175515))

(declare-fun m!175517 () Bool)

(assert (=> b!145656 m!175517))

(assert (=> bm!16291 m!175333))

(declare-fun m!175519 () Bool)

(assert (=> bm!16291 m!175519))

(declare-fun m!175521 () Bool)

(assert (=> b!145653 m!175521))

(declare-fun m!175523 () Bool)

(assert (=> b!145658 m!175523))

(declare-fun m!175525 () Bool)

(assert (=> d!46305 m!175525))

(assert (=> d!46305 m!175369))

(assert (=> b!145649 m!175333))

(declare-fun m!175527 () Bool)

(assert (=> b!145649 m!175527))

(assert (=> bm!16281 m!175333))

(declare-fun m!175529 () Bool)

(assert (=> bm!16281 m!175529))

(declare-fun m!175531 () Bool)

(assert (=> b!145645 m!175531))

(declare-fun m!175533 () Bool)

(assert (=> b!145645 m!175533))

(declare-fun m!175535 () Bool)

(assert (=> b!145645 m!175535))

(assert (=> b!145645 m!175533))

(assert (=> b!145645 m!175333))

(assert (=> b!145645 m!175353))

(declare-fun m!175537 () Bool)

(assert (=> b!145645 m!175537))

(assert (=> b!145645 m!175511))

(assert (=> b!145659 m!175353))

(declare-fun m!175539 () Bool)

(assert (=> b!145659 m!175539))

(assert (=> bm!16279 m!175333))

(assert (=> bm!16279 m!175527))

(assert (=> b!145398 d!46305))

(declare-fun d!46307 () Bool)

(declare-fun c!27584 () Bool)

(assert (=> d!46307 (= c!27584 ((_ is ValueCellFull!1133) (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun e!94909 () V!3585)

(assert (=> d!46307 (= (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94909)))

(declare-fun b!145670 () Bool)

(declare-fun get!1561 (ValueCell!1133 V!3585) V!3585)

(assert (=> b!145670 (= e!94909 (get!1561 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145671 () Bool)

(declare-fun get!1562 (ValueCell!1133 V!3585) V!3585)

(assert (=> b!145671 (= e!94909 (get!1562 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46307 c!27584) b!145670))

(assert (= (and d!46307 (not c!27584)) b!145671))

(assert (=> b!145670 m!175349))

(assert (=> b!145670 m!175351))

(declare-fun m!175541 () Bool)

(assert (=> b!145670 m!175541))

(assert (=> b!145671 m!175349))

(assert (=> b!145671 m!175351))

(declare-fun m!175543 () Bool)

(assert (=> b!145671 m!175543))

(assert (=> b!145398 d!46307))

(declare-fun call!16302 () Bool)

(declare-fun bm!16299 () Bool)

(declare-fun c!27587 () Bool)

(assert (=> bm!16299 (= call!16302 (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27587 (Cons!1736 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!76473) lt!76473)))))

(declare-fun b!145682 () Bool)

(declare-fun e!94921 () Bool)

(assert (=> b!145682 (= e!94921 call!16302)))

(declare-fun b!145683 () Bool)

(declare-fun e!94919 () Bool)

(assert (=> b!145683 (= e!94919 e!94921)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!145683 (= c!27587 (validKeyInArray!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145685 () Bool)

(declare-fun e!94918 () Bool)

(assert (=> b!145685 (= e!94918 (contains!922 lt!76473 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145686 () Bool)

(declare-fun e!94920 () Bool)

(assert (=> b!145686 (= e!94920 e!94919)))

(declare-fun res!69370 () Bool)

(assert (=> b!145686 (=> (not res!69370) (not e!94919))))

(assert (=> b!145686 (= res!69370 (not e!94918))))

(declare-fun res!69372 () Bool)

(assert (=> b!145686 (=> (not res!69372) (not e!94918))))

(assert (=> b!145686 (= res!69372 (validKeyInArray!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145684 () Bool)

(assert (=> b!145684 (= e!94921 call!16302)))

(declare-fun d!46309 () Bool)

(declare-fun res!69371 () Bool)

(assert (=> d!46309 (=> res!69371 e!94920)))

(assert (=> d!46309 (= res!69371 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> d!46309 (= (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!76473) e!94920)))

(assert (= (and d!46309 (not res!69371)) b!145686))

(assert (= (and b!145686 res!69372) b!145685))

(assert (= (and b!145686 res!69370) b!145683))

(assert (= (and b!145683 c!27587) b!145684))

(assert (= (and b!145683 (not c!27587)) b!145682))

(assert (= (or b!145684 b!145682) bm!16299))

(declare-fun m!175545 () Bool)

(assert (=> bm!16299 m!175545))

(declare-fun m!175547 () Bool)

(assert (=> bm!16299 m!175547))

(assert (=> b!145683 m!175545))

(assert (=> b!145683 m!175545))

(declare-fun m!175549 () Bool)

(assert (=> b!145683 m!175549))

(assert (=> b!145685 m!175545))

(assert (=> b!145685 m!175545))

(declare-fun m!175551 () Bool)

(assert (=> b!145685 m!175551))

(assert (=> b!145686 m!175545))

(assert (=> b!145686 m!175545))

(assert (=> b!145686 m!175549))

(assert (=> b!145400 d!46309))

(declare-fun d!46311 () Bool)

(declare-fun lt!76609 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!143 (List!1740) (InoxSet (_ BitVec 64)))

(assert (=> d!46311 (= lt!76609 (select (content!143 lt!76473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94926 () Bool)

(assert (=> d!46311 (= lt!76609 e!94926)))

(declare-fun res!69377 () Bool)

(assert (=> d!46311 (=> (not res!69377) (not e!94926))))

(assert (=> d!46311 (= res!69377 ((_ is Cons!1736) lt!76473))))

(assert (=> d!46311 (= (contains!922 lt!76473 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76609)))

(declare-fun b!145691 () Bool)

(declare-fun e!94927 () Bool)

(assert (=> b!145691 (= e!94926 e!94927)))

(declare-fun res!69378 () Bool)

(assert (=> b!145691 (=> res!69378 e!94927)))

(assert (=> b!145691 (= res!69378 (= (h!2344 lt!76473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145692 () Bool)

(assert (=> b!145692 (= e!94927 (contains!922 (t!6389 lt!76473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46311 res!69377) b!145691))

(assert (= (and b!145691 (not res!69378)) b!145692))

(declare-fun m!175553 () Bool)

(assert (=> d!46311 m!175553))

(declare-fun m!175555 () Bool)

(assert (=> d!46311 m!175555))

(declare-fun m!175557 () Bool)

(assert (=> b!145692 m!175557))

(assert (=> b!145399 d!46311))

(declare-fun call!16303 () Bool)

(declare-fun bm!16300 () Bool)

(declare-fun c!27588 () Bool)

(assert (=> bm!16300 (= call!16303 (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27588 (Cons!1736 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) Nil!1737) Nil!1737)))))

(declare-fun b!145693 () Bool)

(declare-fun e!94931 () Bool)

(assert (=> b!145693 (= e!94931 call!16303)))

(declare-fun b!145694 () Bool)

(declare-fun e!94929 () Bool)

(assert (=> b!145694 (= e!94929 e!94931)))

(assert (=> b!145694 (= c!27588 (validKeyInArray!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145696 () Bool)

(declare-fun e!94928 () Bool)

(assert (=> b!145696 (= e!94928 (contains!922 Nil!1737 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145697 () Bool)

(declare-fun e!94930 () Bool)

(assert (=> b!145697 (= e!94930 e!94929)))

(declare-fun res!69379 () Bool)

(assert (=> b!145697 (=> (not res!69379) (not e!94929))))

(assert (=> b!145697 (= res!69379 (not e!94928))))

(declare-fun res!69381 () Bool)

(assert (=> b!145697 (=> (not res!69381) (not e!94928))))

(assert (=> b!145697 (= res!69381 (validKeyInArray!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145695 () Bool)

(assert (=> b!145695 (= e!94931 call!16303)))

(declare-fun d!46313 () Bool)

(declare-fun res!69380 () Bool)

(assert (=> d!46313 (=> res!69380 e!94930)))

(assert (=> d!46313 (= res!69380 (bvsge from!355 (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> d!46313 (= (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) from!355 Nil!1737) e!94930)))

(assert (= (and d!46313 (not res!69380)) b!145697))

(assert (= (and b!145697 res!69381) b!145696))

(assert (= (and b!145697 res!69379) b!145694))

(assert (= (and b!145694 c!27588) b!145695))

(assert (= (and b!145694 (not c!27588)) b!145693))

(assert (= (or b!145695 b!145693) bm!16300))

(assert (=> bm!16300 m!175333))

(declare-fun m!175559 () Bool)

(assert (=> bm!16300 m!175559))

(assert (=> b!145694 m!175333))

(assert (=> b!145694 m!175333))

(declare-fun m!175561 () Bool)

(assert (=> b!145694 m!175561))

(assert (=> b!145696 m!175333))

(assert (=> b!145696 m!175333))

(declare-fun m!175563 () Bool)

(assert (=> b!145696 m!175563))

(assert (=> b!145697 m!175333))

(assert (=> b!145697 m!175333))

(assert (=> b!145697 m!175561))

(assert (=> b!145396 d!46313))

(declare-fun d!46315 () Bool)

(assert (=> d!46315 (arrayNoDuplicates!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) from!355 Nil!1737)))

(declare-fun lt!76612 () Unit!4593)

(declare-fun choose!39 (array!4935 (_ BitVec 32) (_ BitVec 32)) Unit!4593)

(assert (=> d!46315 (= lt!76612 (choose!39 (_keys!4770 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46315 (bvslt (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46315 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000000 from!355) lt!76612)))

(declare-fun bs!6134 () Bool)

(assert (= bs!6134 d!46315))

(assert (=> bs!6134 m!175363))

(declare-fun m!175565 () Bool)

(assert (=> bs!6134 m!175565))

(assert (=> b!145396 d!46315))

(declare-fun d!46317 () Bool)

(declare-fun res!69386 () Bool)

(declare-fun e!94936 () Bool)

(assert (=> d!46317 (=> res!69386 e!94936)))

(assert (=> d!46317 (= res!69386 (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> d!46317 (= (arrayContainsKey!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!94936)))

(declare-fun b!145702 () Bool)

(declare-fun e!94937 () Bool)

(assert (=> b!145702 (= e!94936 e!94937)))

(declare-fun res!69387 () Bool)

(assert (=> b!145702 (=> (not res!69387) (not e!94937))))

(assert (=> b!145702 (= res!69387 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145703 () Bool)

(assert (=> b!145703 (= e!94937 (arrayContainsKey!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46317 (not res!69386)) b!145702))

(assert (= (and b!145702 res!69387) b!145703))

(assert (=> d!46317 m!175545))

(assert (=> b!145703 m!175333))

(declare-fun m!175567 () Bool)

(assert (=> b!145703 m!175567))

(assert (=> b!145396 d!46317))

(declare-fun d!46319 () Bool)

(declare-fun e!94940 () Bool)

(assert (=> d!46319 e!94940))

(declare-fun c!27591 () Bool)

(assert (=> d!46319 (= c!27591 (and (not (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76615 () Unit!4593)

(declare-fun choose!906 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) (_ BitVec 32) Int) Unit!4593)

(assert (=> d!46319 (= lt!76615 (choose!906 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46319 (validMask!0 (mask!7371 (v!3332 (underlying!491 thiss!992))))))

(assert (=> d!46319 (= (lemmaListMapContainsThenArrayContainsFrom!147 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))) lt!76615)))

(declare-fun b!145708 () Bool)

(assert (=> b!145708 (= e!94940 (arrayContainsKey!0 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!145709 () Bool)

(assert (=> b!145709 (= e!94940 (ite (= (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46319 c!27591) b!145708))

(assert (= (and d!46319 (not c!27591)) b!145709))

(assert (=> d!46319 m!175333))

(declare-fun m!175569 () Bool)

(assert (=> d!46319 m!175569))

(declare-fun m!175571 () Bool)

(assert (=> d!46319 m!175571))

(assert (=> b!145708 m!175333))

(assert (=> b!145708 m!175367))

(assert (=> b!145396 d!46319))

(declare-fun d!46321 () Bool)

(assert (=> d!46321 (= (valid!584 thiss!992) (valid!583 (v!3332 (underlying!491 thiss!992))))))

(declare-fun bs!6135 () Bool)

(assert (= bs!6135 d!46321))

(declare-fun m!175573 () Bool)

(assert (=> bs!6135 m!175573))

(assert (=> start!15158 d!46321))

(declare-fun d!46323 () Bool)

(assert (=> d!46323 (= (map!1444 newMap!16) (getCurrentListMap!538 (_keys!4770 newMap!16) (_values!2984 newMap!16) (mask!7371 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun bs!6136 () Bool)

(assert (= bs!6136 d!46323))

(declare-fun m!175575 () Bool)

(assert (=> bs!6136 m!175575))

(assert (=> b!145386 d!46323))

(declare-fun bm!16315 () Bool)

(declare-fun call!16324 () ListLongMap!1701)

(declare-fun call!16322 () ListLongMap!1701)

(assert (=> bm!16315 (= call!16324 call!16322)))

(declare-fun e!94972 () Bool)

(declare-fun lt!76661 () ListLongMap!1701)

(declare-fun b!145752 () Bool)

(declare-fun apply!124 (ListLongMap!1701 (_ BitVec 64)) V!3585)

(assert (=> b!145752 (= e!94972 (= (apply!124 lt!76661 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1559 (select (arr!2331 (_values!2984 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!447 (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145752 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2607 (_values!2984 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> b!145752 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145753 () Bool)

(declare-fun e!94979 () Bool)

(assert (=> b!145753 (= e!94979 (= (apply!124 lt!76661 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2846 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145754 () Bool)

(declare-fun e!94969 () Bool)

(assert (=> b!145754 (= e!94969 (validKeyInArray!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16316 () Bool)

(declare-fun call!16319 () ListLongMap!1701)

(assert (=> bm!16316 (= call!16322 call!16319)))

(declare-fun b!145755 () Bool)

(declare-fun e!94968 () ListLongMap!1701)

(assert (=> b!145755 (= e!94968 call!16324)))

(declare-fun bm!16317 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!144 (array!4935 array!4937 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) ListLongMap!1701)

(assert (=> bm!16317 (= call!16319 (getCurrentListMapNoExtraKeys!144 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145756 () Bool)

(declare-fun res!69411 () Bool)

(declare-fun e!94978 () Bool)

(assert (=> b!145756 (=> (not res!69411) (not e!94978))))

(declare-fun e!94977 () Bool)

(assert (=> b!145756 (= res!69411 e!94977)))

(declare-fun c!27605 () Bool)

(assert (=> b!145756 (= c!27605 (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!16318 () Bool)

(declare-fun call!16318 () ListLongMap!1701)

(declare-fun call!16323 () ListLongMap!1701)

(assert (=> bm!16318 (= call!16318 call!16323)))

(declare-fun b!145757 () Bool)

(declare-fun e!94967 () Bool)

(declare-fun call!16320 () Bool)

(assert (=> b!145757 (= e!94967 (not call!16320))))

(declare-fun d!46325 () Bool)

(assert (=> d!46325 e!94978))

(declare-fun res!69408 () Bool)

(assert (=> d!46325 (=> (not res!69408) (not e!94978))))

(assert (=> d!46325 (= res!69408 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))))

(declare-fun lt!76669 () ListLongMap!1701)

(assert (=> d!46325 (= lt!76661 lt!76669)))

(declare-fun lt!76663 () Unit!4593)

(declare-fun e!94975 () Unit!4593)

(assert (=> d!46325 (= lt!76663 e!94975)))

(declare-fun c!27608 () Bool)

(declare-fun e!94976 () Bool)

(assert (=> d!46325 (= c!27608 e!94976)))

(declare-fun res!69412 () Bool)

(assert (=> d!46325 (=> (not res!69412) (not e!94976))))

(assert (=> d!46325 (= res!69412 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun e!94971 () ListLongMap!1701)

(assert (=> d!46325 (= lt!76669 e!94971)))

(declare-fun c!27609 () Bool)

(assert (=> d!46325 (= c!27609 (and (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46325 (validMask!0 (mask!7371 (v!3332 (underlying!491 thiss!992))))))

(assert (=> d!46325 (= (getCurrentListMap!538 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))) lt!76661)))

(declare-fun b!145758 () Bool)

(declare-fun c!27607 () Bool)

(assert (=> b!145758 (= c!27607 (and (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94974 () ListLongMap!1701)

(assert (=> b!145758 (= e!94974 e!94968)))

(declare-fun b!145759 () Bool)

(assert (=> b!145759 (= e!94968 call!16318)))

(declare-fun b!145760 () Bool)

(assert (=> b!145760 (= e!94974 call!16318)))

(declare-fun b!145761 () Bool)

(assert (=> b!145761 (= e!94971 e!94974)))

(declare-fun c!27604 () Bool)

(assert (=> b!145761 (= c!27604 (and (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145762 () Bool)

(assert (=> b!145762 (= e!94976 (validKeyInArray!0 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145763 () Bool)

(assert (=> b!145763 (= e!94978 e!94967)))

(declare-fun c!27606 () Bool)

(assert (=> b!145763 (= c!27606 (not (= (bvand (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16319 () Bool)

(declare-fun call!16321 () Bool)

(assert (=> bm!16319 (= call!16321 (contains!923 lt!76661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145764 () Bool)

(declare-fun e!94970 () Bool)

(assert (=> b!145764 (= e!94970 e!94972)))

(declare-fun res!69413 () Bool)

(assert (=> b!145764 (=> (not res!69413) (not e!94972))))

(assert (=> b!145764 (= res!69413 (contains!923 lt!76661 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145764 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145765 () Bool)

(declare-fun res!69410 () Bool)

(assert (=> b!145765 (=> (not res!69410) (not e!94978))))

(assert (=> b!145765 (= res!69410 e!94970)))

(declare-fun res!69414 () Bool)

(assert (=> b!145765 (=> res!69414 e!94970)))

(assert (=> b!145765 (= res!69414 (not e!94969))))

(declare-fun res!69409 () Bool)

(assert (=> b!145765 (=> (not res!69409) (not e!94969))))

(assert (=> b!145765 (= res!69409 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145766 () Bool)

(declare-fun lt!76672 () Unit!4593)

(assert (=> b!145766 (= e!94975 lt!76672)))

(declare-fun lt!76677 () ListLongMap!1701)

(assert (=> b!145766 (= lt!76677 (getCurrentListMapNoExtraKeys!144 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76673 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76679 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76679 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76674 () Unit!4593)

(declare-fun addStillContains!100 (ListLongMap!1701 (_ BitVec 64) V!3585 (_ BitVec 64)) Unit!4593)

(assert (=> b!145766 (= lt!76674 (addStillContains!100 lt!76677 lt!76673 (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) lt!76679))))

(assert (=> b!145766 (contains!923 (+!177 lt!76677 (tuple2!2655 lt!76673 (zeroValue!2846 (v!3332 (underlying!491 thiss!992))))) lt!76679)))

(declare-fun lt!76670 () Unit!4593)

(assert (=> b!145766 (= lt!76670 lt!76674)))

(declare-fun lt!76667 () ListLongMap!1701)

(assert (=> b!145766 (= lt!76667 (getCurrentListMapNoExtraKeys!144 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76678 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76678 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76676 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76676 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76681 () Unit!4593)

(declare-fun addApplyDifferent!100 (ListLongMap!1701 (_ BitVec 64) V!3585 (_ BitVec 64)) Unit!4593)

(assert (=> b!145766 (= lt!76681 (addApplyDifferent!100 lt!76667 lt!76678 (minValue!2846 (v!3332 (underlying!491 thiss!992))) lt!76676))))

(assert (=> b!145766 (= (apply!124 (+!177 lt!76667 (tuple2!2655 lt!76678 (minValue!2846 (v!3332 (underlying!491 thiss!992))))) lt!76676) (apply!124 lt!76667 lt!76676))))

(declare-fun lt!76666 () Unit!4593)

(assert (=> b!145766 (= lt!76666 lt!76681)))

(declare-fun lt!76664 () ListLongMap!1701)

(assert (=> b!145766 (= lt!76664 (getCurrentListMapNoExtraKeys!144 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76680 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76671 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76671 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76660 () Unit!4593)

(assert (=> b!145766 (= lt!76660 (addApplyDifferent!100 lt!76664 lt!76680 (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) lt!76671))))

(assert (=> b!145766 (= (apply!124 (+!177 lt!76664 (tuple2!2655 lt!76680 (zeroValue!2846 (v!3332 (underlying!491 thiss!992))))) lt!76671) (apply!124 lt!76664 lt!76671))))

(declare-fun lt!76668 () Unit!4593)

(assert (=> b!145766 (= lt!76668 lt!76660)))

(declare-fun lt!76662 () ListLongMap!1701)

(assert (=> b!145766 (= lt!76662 (getCurrentListMapNoExtraKeys!144 (_keys!4770 (v!3332 (underlying!491 thiss!992))) (_values!2984 (v!3332 (underlying!491 thiss!992))) (mask!7371 (v!3332 (underlying!491 thiss!992))) (extraKeys!2746 (v!3332 (underlying!491 thiss!992))) (zeroValue!2846 (v!3332 (underlying!491 thiss!992))) (minValue!2846 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76675 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76675 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76665 () (_ BitVec 64))

(assert (=> b!145766 (= lt!76665 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!145766 (= lt!76672 (addApplyDifferent!100 lt!76662 lt!76675 (minValue!2846 (v!3332 (underlying!491 thiss!992))) lt!76665))))

(assert (=> b!145766 (= (apply!124 (+!177 lt!76662 (tuple2!2655 lt!76675 (minValue!2846 (v!3332 (underlying!491 thiss!992))))) lt!76665) (apply!124 lt!76662 lt!76665))))

(declare-fun b!145767 () Bool)

(assert (=> b!145767 (= e!94967 e!94979)))

(declare-fun res!69407 () Bool)

(assert (=> b!145767 (= res!69407 call!16320)))

(assert (=> b!145767 (=> (not res!69407) (not e!94979))))

(declare-fun b!145768 () Bool)

(declare-fun Unit!4598 () Unit!4593)

(assert (=> b!145768 (= e!94975 Unit!4598)))

(declare-fun b!145769 () Bool)

(assert (=> b!145769 (= e!94971 (+!177 call!16323 (tuple2!2655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2846 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun bm!16320 () Bool)

(assert (=> bm!16320 (= call!16320 (contains!923 lt!76661 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145770 () Bool)

(declare-fun e!94973 () Bool)

(assert (=> b!145770 (= e!94977 e!94973)))

(declare-fun res!69406 () Bool)

(assert (=> b!145770 (= res!69406 call!16321)))

(assert (=> b!145770 (=> (not res!69406) (not e!94973))))

(declare-fun b!145771 () Bool)

(assert (=> b!145771 (= e!94977 (not call!16321))))

(declare-fun bm!16321 () Bool)

(assert (=> bm!16321 (= call!16323 (+!177 (ite c!27609 call!16319 (ite c!27604 call!16322 call!16324)) (ite (or c!27609 c!27604) (tuple2!2655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2846 (v!3332 (underlying!491 thiss!992)))) (tuple2!2655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2846 (v!3332 (underlying!491 thiss!992)))))))))

(declare-fun b!145772 () Bool)

(assert (=> b!145772 (= e!94973 (= (apply!124 lt!76661 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2846 (v!3332 (underlying!491 thiss!992)))))))

(assert (= (and d!46325 c!27609) b!145769))

(assert (= (and d!46325 (not c!27609)) b!145761))

(assert (= (and b!145761 c!27604) b!145760))

(assert (= (and b!145761 (not c!27604)) b!145758))

(assert (= (and b!145758 c!27607) b!145759))

(assert (= (and b!145758 (not c!27607)) b!145755))

(assert (= (or b!145759 b!145755) bm!16315))

(assert (= (or b!145760 bm!16315) bm!16316))

(assert (= (or b!145760 b!145759) bm!16318))

(assert (= (or b!145769 bm!16316) bm!16317))

(assert (= (or b!145769 bm!16318) bm!16321))

(assert (= (and d!46325 res!69412) b!145762))

(assert (= (and d!46325 c!27608) b!145766))

(assert (= (and d!46325 (not c!27608)) b!145768))

(assert (= (and d!46325 res!69408) b!145765))

(assert (= (and b!145765 res!69409) b!145754))

(assert (= (and b!145765 (not res!69414)) b!145764))

(assert (= (and b!145764 res!69413) b!145752))

(assert (= (and b!145765 res!69410) b!145756))

(assert (= (and b!145756 c!27605) b!145770))

(assert (= (and b!145756 (not c!27605)) b!145771))

(assert (= (and b!145770 res!69406) b!145772))

(assert (= (or b!145770 b!145771) bm!16319))

(assert (= (and b!145756 res!69411) b!145763))

(assert (= (and b!145763 c!27606) b!145767))

(assert (= (and b!145763 (not c!27606)) b!145757))

(assert (= (and b!145767 res!69407) b!145753))

(assert (= (or b!145767 b!145757) bm!16320))

(declare-fun b_lambda!6541 () Bool)

(assert (=> (not b_lambda!6541) (not b!145752)))

(assert (=> b!145752 t!6385))

(declare-fun b_and!9085 () Bool)

(assert (= b_and!9065 (and (=> t!6385 result!4271) b_and!9085)))

(assert (=> b!145752 t!6387))

(declare-fun b_and!9087 () Bool)

(assert (= b_and!9067 (and (=> t!6387 result!4275) b_and!9087)))

(declare-fun m!175577 () Bool)

(assert (=> bm!16321 m!175577))

(assert (=> b!145762 m!175545))

(assert (=> b!145762 m!175545))

(assert (=> b!145762 m!175549))

(declare-fun m!175579 () Bool)

(assert (=> bm!16319 m!175579))

(declare-fun m!175581 () Bool)

(assert (=> bm!16320 m!175581))

(declare-fun m!175583 () Bool)

(assert (=> b!145772 m!175583))

(assert (=> d!46325 m!175571))

(assert (=> b!145754 m!175545))

(assert (=> b!145754 m!175545))

(assert (=> b!145754 m!175549))

(declare-fun m!175585 () Bool)

(assert (=> b!145766 m!175585))

(declare-fun m!175587 () Bool)

(assert (=> b!145766 m!175587))

(declare-fun m!175589 () Bool)

(assert (=> b!145766 m!175589))

(assert (=> b!145766 m!175587))

(declare-fun m!175591 () Bool)

(assert (=> b!145766 m!175591))

(declare-fun m!175593 () Bool)

(assert (=> b!145766 m!175593))

(declare-fun m!175595 () Bool)

(assert (=> b!145766 m!175595))

(declare-fun m!175597 () Bool)

(assert (=> b!145766 m!175597))

(declare-fun m!175599 () Bool)

(assert (=> b!145766 m!175599))

(declare-fun m!175601 () Bool)

(assert (=> b!145766 m!175601))

(assert (=> b!145766 m!175599))

(declare-fun m!175603 () Bool)

(assert (=> b!145766 m!175603))

(declare-fun m!175605 () Bool)

(assert (=> b!145766 m!175605))

(declare-fun m!175607 () Bool)

(assert (=> b!145766 m!175607))

(declare-fun m!175609 () Bool)

(assert (=> b!145766 m!175609))

(assert (=> b!145766 m!175545))

(declare-fun m!175611 () Bool)

(assert (=> b!145766 m!175611))

(declare-fun m!175613 () Bool)

(assert (=> b!145766 m!175613))

(assert (=> b!145766 m!175595))

(declare-fun m!175615 () Bool)

(assert (=> b!145766 m!175615))

(assert (=> b!145766 m!175591))

(declare-fun m!175617 () Bool)

(assert (=> b!145752 m!175617))

(assert (=> b!145752 m!175545))

(declare-fun m!175619 () Bool)

(assert (=> b!145752 m!175619))

(assert (=> b!145752 m!175545))

(assert (=> b!145752 m!175617))

(assert (=> b!145752 m!175351))

(declare-fun m!175621 () Bool)

(assert (=> b!145752 m!175621))

(assert (=> b!145752 m!175351))

(assert (=> bm!16317 m!175601))

(declare-fun m!175623 () Bool)

(assert (=> b!145769 m!175623))

(declare-fun m!175625 () Bool)

(assert (=> b!145753 m!175625))

(assert (=> b!145764 m!175545))

(assert (=> b!145764 m!175545))

(declare-fun m!175627 () Bool)

(assert (=> b!145764 m!175627))

(assert (=> b!145386 d!46325))

(declare-fun d!46327 () Bool)

(declare-fun lt!76682 () Bool)

(assert (=> d!46327 (= lt!76682 (select (content!143 lt!76473) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun e!94980 () Bool)

(assert (=> d!46327 (= lt!76682 e!94980)))

(declare-fun res!69415 () Bool)

(assert (=> d!46327 (=> (not res!69415) (not e!94980))))

(assert (=> d!46327 (= res!69415 ((_ is Cons!1736) lt!76473))))

(assert (=> d!46327 (= (contains!922 lt!76473 (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)) lt!76682)))

(declare-fun b!145773 () Bool)

(declare-fun e!94981 () Bool)

(assert (=> b!145773 (= e!94980 e!94981)))

(declare-fun res!69416 () Bool)

(assert (=> b!145773 (=> res!69416 e!94981)))

(assert (=> b!145773 (= res!69416 (= (h!2344 lt!76473) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145774 () Bool)

(assert (=> b!145774 (= e!94981 (contains!922 (t!6389 lt!76473) (select (arr!2330 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (= (and d!46327 res!69415) b!145773))

(assert (= (and b!145773 (not res!69416)) b!145774))

(assert (=> d!46327 m!175553))

(assert (=> d!46327 m!175333))

(declare-fun m!175629 () Bool)

(assert (=> d!46327 m!175629))

(assert (=> b!145774 m!175333))

(declare-fun m!175631 () Bool)

(assert (=> b!145774 m!175631))

(assert (=> b!145402 d!46327))

(declare-fun d!46329 () Bool)

(declare-fun res!69423 () Bool)

(declare-fun e!94984 () Bool)

(assert (=> d!46329 (=> (not res!69423) (not e!94984))))

(declare-fun simpleValid!100 (LongMapFixedSize!1174) Bool)

(assert (=> d!46329 (= res!69423 (simpleValid!100 newMap!16))))

(assert (=> d!46329 (= (valid!583 newMap!16) e!94984)))

(declare-fun b!145781 () Bool)

(declare-fun res!69424 () Bool)

(assert (=> b!145781 (=> (not res!69424) (not e!94984))))

(declare-fun arrayCountValidKeys!0 (array!4935 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!145781 (= res!69424 (= (arrayCountValidKeys!0 (_keys!4770 newMap!16) #b00000000000000000000000000000000 (size!2606 (_keys!4770 newMap!16))) (_size!636 newMap!16)))))

(declare-fun b!145782 () Bool)

(declare-fun res!69425 () Bool)

(assert (=> b!145782 (=> (not res!69425) (not e!94984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4935 (_ BitVec 32)) Bool)

(assert (=> b!145782 (= res!69425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4770 newMap!16) (mask!7371 newMap!16)))))

(declare-fun b!145783 () Bool)

(assert (=> b!145783 (= e!94984 (arrayNoDuplicates!0 (_keys!4770 newMap!16) #b00000000000000000000000000000000 Nil!1737))))

(assert (= (and d!46329 res!69423) b!145781))

(assert (= (and b!145781 res!69424) b!145782))

(assert (= (and b!145782 res!69425) b!145783))

(declare-fun m!175633 () Bool)

(assert (=> d!46329 m!175633))

(declare-fun m!175635 () Bool)

(assert (=> b!145781 m!175635))

(declare-fun m!175637 () Bool)

(assert (=> b!145782 m!175637))

(declare-fun m!175639 () Bool)

(assert (=> b!145783 m!175639))

(assert (=> b!145393 d!46329))

(declare-fun d!46331 () Bool)

(declare-fun res!69430 () Bool)

(declare-fun e!94989 () Bool)

(assert (=> d!46331 (=> res!69430 e!94989)))

(assert (=> d!46331 (= res!69430 ((_ is Nil!1737) lt!76473))))

(assert (=> d!46331 (= (noDuplicate!56 lt!76473) e!94989)))

(declare-fun b!145788 () Bool)

(declare-fun e!94990 () Bool)

(assert (=> b!145788 (= e!94989 e!94990)))

(declare-fun res!69431 () Bool)

(assert (=> b!145788 (=> (not res!69431) (not e!94990))))

(assert (=> b!145788 (= res!69431 (not (contains!922 (t!6389 lt!76473) (h!2344 lt!76473))))))

(declare-fun b!145789 () Bool)

(assert (=> b!145789 (= e!94990 (noDuplicate!56 (t!6389 lt!76473)))))

(assert (= (and d!46331 (not res!69430)) b!145788))

(assert (= (and b!145788 res!69431) b!145789))

(declare-fun m!175641 () Bool)

(assert (=> b!145788 m!175641))

(declare-fun m!175643 () Bool)

(assert (=> b!145789 m!175643))

(assert (=> b!145390 d!46331))

(declare-fun d!46333 () Bool)

(declare-fun lt!76683 () Bool)

(assert (=> d!46333 (= lt!76683 (select (content!143 lt!76473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94991 () Bool)

(assert (=> d!46333 (= lt!76683 e!94991)))

(declare-fun res!69432 () Bool)

(assert (=> d!46333 (=> (not res!69432) (not e!94991))))

(assert (=> d!46333 (= res!69432 ((_ is Cons!1736) lt!76473))))

(assert (=> d!46333 (= (contains!922 lt!76473 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76683)))

(declare-fun b!145790 () Bool)

(declare-fun e!94992 () Bool)

(assert (=> b!145790 (= e!94991 e!94992)))

(declare-fun res!69433 () Bool)

(assert (=> b!145790 (=> res!69433 e!94992)))

(assert (=> b!145790 (= res!69433 (= (h!2344 lt!76473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145791 () Bool)

(assert (=> b!145791 (= e!94992 (contains!922 (t!6389 lt!76473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46333 res!69432) b!145790))

(assert (= (and b!145790 (not res!69433)) b!145791))

(assert (=> d!46333 m!175553))

(declare-fun m!175645 () Bool)

(assert (=> d!46333 m!175645))

(declare-fun m!175647 () Bool)

(assert (=> b!145791 m!175647))

(assert (=> b!145392 d!46333))

(declare-fun d!46335 () Bool)

(assert (=> d!46335 (= (array_inv!1455 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) (bvsge (size!2606 (_keys!4770 (v!3332 (underlying!491 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!145391 d!46335))

(declare-fun d!46337 () Bool)

(assert (=> d!46337 (= (array_inv!1456 (_values!2984 (v!3332 (underlying!491 thiss!992)))) (bvsge (size!2607 (_values!2984 (v!3332 (underlying!491 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!145391 d!46337))

(declare-fun mapIsEmpty!4943 () Bool)

(declare-fun mapRes!4943 () Bool)

(assert (=> mapIsEmpty!4943 mapRes!4943))

(declare-fun b!145799 () Bool)

(declare-fun e!94997 () Bool)

(assert (=> b!145799 (= e!94997 tp_is_empty!2953)))

(declare-fun condMapEmpty!4943 () Bool)

(declare-fun mapDefault!4943 () ValueCell!1133)

(assert (=> mapNonEmpty!4927 (= condMapEmpty!4943 (= mapRest!4927 ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4943)))))

(assert (=> mapNonEmpty!4927 (= tp!11720 (and e!94997 mapRes!4943))))

(declare-fun b!145798 () Bool)

(declare-fun e!94998 () Bool)

(assert (=> b!145798 (= e!94998 tp_is_empty!2953)))

(declare-fun mapNonEmpty!4943 () Bool)

(declare-fun tp!11747 () Bool)

(assert (=> mapNonEmpty!4943 (= mapRes!4943 (and tp!11747 e!94998))))

(declare-fun mapValue!4943 () ValueCell!1133)

(declare-fun mapKey!4943 () (_ BitVec 32))

(declare-fun mapRest!4943 () (Array (_ BitVec 32) ValueCell!1133))

(assert (=> mapNonEmpty!4943 (= mapRest!4927 (store mapRest!4943 mapKey!4943 mapValue!4943))))

(assert (= (and mapNonEmpty!4927 condMapEmpty!4943) mapIsEmpty!4943))

(assert (= (and mapNonEmpty!4927 (not condMapEmpty!4943)) mapNonEmpty!4943))

(assert (= (and mapNonEmpty!4943 ((_ is ValueCellFull!1133) mapValue!4943)) b!145798))

(assert (= (and mapNonEmpty!4927 ((_ is ValueCellFull!1133) mapDefault!4943)) b!145799))

(declare-fun m!175649 () Bool)

(assert (=> mapNonEmpty!4943 m!175649))

(declare-fun mapIsEmpty!4944 () Bool)

(declare-fun mapRes!4944 () Bool)

(assert (=> mapIsEmpty!4944 mapRes!4944))

(declare-fun b!145801 () Bool)

(declare-fun e!94999 () Bool)

(assert (=> b!145801 (= e!94999 tp_is_empty!2953)))

(declare-fun condMapEmpty!4944 () Bool)

(declare-fun mapDefault!4944 () ValueCell!1133)

(assert (=> mapNonEmpty!4928 (= condMapEmpty!4944 (= mapRest!4928 ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4944)))))

(assert (=> mapNonEmpty!4928 (= tp!11718 (and e!94999 mapRes!4944))))

(declare-fun b!145800 () Bool)

(declare-fun e!95000 () Bool)

(assert (=> b!145800 (= e!95000 tp_is_empty!2953)))

(declare-fun mapNonEmpty!4944 () Bool)

(declare-fun tp!11748 () Bool)

(assert (=> mapNonEmpty!4944 (= mapRes!4944 (and tp!11748 e!95000))))

(declare-fun mapKey!4944 () (_ BitVec 32))

(declare-fun mapRest!4944 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapValue!4944 () ValueCell!1133)

(assert (=> mapNonEmpty!4944 (= mapRest!4928 (store mapRest!4944 mapKey!4944 mapValue!4944))))

(assert (= (and mapNonEmpty!4928 condMapEmpty!4944) mapIsEmpty!4944))

(assert (= (and mapNonEmpty!4928 (not condMapEmpty!4944)) mapNonEmpty!4944))

(assert (= (and mapNonEmpty!4944 ((_ is ValueCellFull!1133) mapValue!4944)) b!145800))

(assert (= (and mapNonEmpty!4928 ((_ is ValueCellFull!1133) mapDefault!4944)) b!145801))

(declare-fun m!175651 () Bool)

(assert (=> mapNonEmpty!4944 m!175651))

(declare-fun b_lambda!6543 () Bool)

(assert (= b_lambda!6541 (or (and b!145391 b_free!3073) (and b!145388 b_free!3075 (= (defaultEntry!3001 newMap!16) (defaultEntry!3001 (v!3332 (underlying!491 thiss!992))))) b_lambda!6543)))

(check-sat (not bm!16273) (not b!145782) (not d!46329) (not b!145659) (not bm!16321) (not bm!16317) (not d!46325) (not bm!16283) (not b!145543) (not d!46319) (not bm!16285) (not d!46305) (not b_lambda!6543) (not b!145762) (not bm!16284) (not b!145692) (not d!46315) (not b_next!3073) (not b!145766) (not b!145630) (not b!145661) (not b!145769) (not d!46303) (not bm!16293) (not b_next!3075) b_and!9087 (not b!145703) (not b!145696) (not b!145545) (not b!145752) (not mapNonEmpty!4943) b_and!9085 (not bm!16280) (not b!145670) (not bm!16279) (not b!145781) (not d!46333) (not b!145708) (not b_lambda!6539) (not d!46327) (not b!145772) (not b!145637) (not b!145649) (not b!145764) (not b!145685) (not b!145645) (not bm!16319) (not bm!16320) (not bm!16291) (not b!145788) (not d!46311) (not bm!16282) (not b!145694) (not d!46323) (not bm!16300) (not b!145697) (not bm!16278) (not bm!16274) (not mapNonEmpty!4944) (not b!145783) (not bm!16299) tp_is_empty!2953 (not b!145791) (not b!145753) (not b!145671) (not b!145686) (not bm!16281) (not bm!16276) (not b!145789) (not b!145774) (not b!145683) (not d!46321) (not b!145754))
(check-sat b_and!9085 b_and!9087 (not b_next!3073) (not b_next!3075))
