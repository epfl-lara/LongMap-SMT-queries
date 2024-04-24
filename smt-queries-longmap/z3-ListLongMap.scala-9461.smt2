; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112598 () Bool)

(assert start!112598)

(declare-fun b_free!30769 () Bool)

(declare-fun b_next!30769 () Bool)

(assert (=> start!112598 (= b_free!30769 (not b_next!30769))))

(declare-fun tp!107944 () Bool)

(declare-fun b_and!49595 () Bool)

(assert (=> start!112598 (= tp!107944 b_and!49595)))

(declare-fun b!1333472 () Bool)

(declare-fun res!884561 () Bool)

(declare-fun e!759814 () Bool)

(assert (=> b!1333472 (=> (not res!884561) (not e!759814))))

(declare-datatypes ((array!90343 0))(
  ( (array!90344 (arr!43633 (Array (_ BitVec 32) (_ BitVec 64))) (size!44184 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90343)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90343 (_ BitVec 32)) Bool)

(assert (=> b!1333472 (= res!884561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333473 () Bool)

(declare-fun res!884560 () Bool)

(assert (=> b!1333473 (=> (not res!884560) (not e!759814))))

(declare-datatypes ((V!54009 0))(
  ( (V!54010 (val!18414 Int)) )
))
(declare-datatypes ((ValueCell!17441 0))(
  ( (ValueCellFull!17441 (v!21046 V!54009)) (EmptyCell!17441) )
))
(declare-datatypes ((array!90345 0))(
  ( (array!90346 (arr!43634 (Array (_ BitVec 32) ValueCell!17441)) (size!44185 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90345)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333473 (= res!884560 (and (= (size!44185 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44184 _keys!1590) (size!44185 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333474 () Bool)

(declare-fun e!759810 () Bool)

(declare-fun tp_is_empty!36679 () Bool)

(assert (=> b!1333474 (= e!759810 tp_is_empty!36679)))

(declare-fun mapIsEmpty!56692 () Bool)

(declare-fun mapRes!56692 () Bool)

(assert (=> mapIsEmpty!56692 mapRes!56692))

(declare-fun b!1333475 () Bool)

(assert (=> b!1333475 (= e!759814 (not true))))

(declare-datatypes ((tuple2!23760 0))(
  ( (tuple2!23761 (_1!11891 (_ BitVec 64)) (_2!11891 V!54009)) )
))
(declare-datatypes ((List!30920 0))(
  ( (Nil!30917) (Cons!30916 (h!32134 tuple2!23760) (t!45094 List!30920)) )
))
(declare-datatypes ((ListLongMap!21425 0))(
  ( (ListLongMap!21426 (toList!10728 List!30920)) )
))
(declare-fun lt!592360 () ListLongMap!21425)

(declare-fun minValue!1262 () V!54009)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8904 (ListLongMap!21425 (_ BitVec 64)) Bool)

(declare-fun +!4736 (ListLongMap!21425 tuple2!23760) ListLongMap!21425)

(assert (=> b!1333475 (contains!8904 (+!4736 lt!592360 (tuple2!23761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43782 0))(
  ( (Unit!43783) )
))
(declare-fun lt!592359 () Unit!43782)

(declare-fun addStillContains!1182 (ListLongMap!21425 (_ BitVec 64) V!54009 (_ BitVec 64)) Unit!43782)

(assert (=> b!1333475 (= lt!592359 (addStillContains!1182 lt!592360 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333475 (contains!8904 lt!592360 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592358 () Unit!43782)

(declare-fun lt!592362 () V!54009)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!279 ((_ BitVec 64) (_ BitVec 64) V!54009 ListLongMap!21425) Unit!43782)

(assert (=> b!1333475 (= lt!592358 (lemmaInListMapAfterAddingDiffThenInBefore!279 k0!1153 (select (arr!43633 _keys!1590) from!1980) lt!592362 lt!592360))))

(declare-fun lt!592361 () ListLongMap!21425)

(assert (=> b!1333475 (contains!8904 lt!592361 k0!1153)))

(declare-fun lt!592357 () Unit!43782)

(assert (=> b!1333475 (= lt!592357 (lemmaInListMapAfterAddingDiffThenInBefore!279 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592361))))

(assert (=> b!1333475 (= lt!592361 (+!4736 lt!592360 (tuple2!23761 (select (arr!43633 _keys!1590) from!1980) lt!592362)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!22025 (ValueCell!17441 V!54009) V!54009)

(declare-fun dynLambda!3690 (Int (_ BitVec 64)) V!54009)

(assert (=> b!1333475 (= lt!592362 (get!22025 (select (arr!43634 _values!1320) from!1980) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!54009)

(declare-fun getCurrentListMapNoExtraKeys!6380 (array!90343 array!90345 (_ BitVec 32) (_ BitVec 32) V!54009 V!54009 (_ BitVec 32) Int) ListLongMap!21425)

(assert (=> b!1333475 (= lt!592360 (getCurrentListMapNoExtraKeys!6380 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!884563 () Bool)

(assert (=> start!112598 (=> (not res!884563) (not e!759814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112598 (= res!884563 (validMask!0 mask!1998))))

(assert (=> start!112598 e!759814))

(declare-fun e!759812 () Bool)

(declare-fun array_inv!33187 (array!90345) Bool)

(assert (=> start!112598 (and (array_inv!33187 _values!1320) e!759812)))

(assert (=> start!112598 true))

(declare-fun array_inv!33188 (array!90343) Bool)

(assert (=> start!112598 (array_inv!33188 _keys!1590)))

(assert (=> start!112598 tp!107944))

(assert (=> start!112598 tp_is_empty!36679))

(declare-fun mapNonEmpty!56692 () Bool)

(declare-fun tp!107943 () Bool)

(assert (=> mapNonEmpty!56692 (= mapRes!56692 (and tp!107943 e!759810))))

(declare-fun mapKey!56692 () (_ BitVec 32))

(declare-fun mapRest!56692 () (Array (_ BitVec 32) ValueCell!17441))

(declare-fun mapValue!56692 () ValueCell!17441)

(assert (=> mapNonEmpty!56692 (= (arr!43634 _values!1320) (store mapRest!56692 mapKey!56692 mapValue!56692))))

(declare-fun b!1333476 () Bool)

(declare-fun res!884556 () Bool)

(assert (=> b!1333476 (=> (not res!884556) (not e!759814))))

(assert (=> b!1333476 (= res!884556 (not (= (select (arr!43633 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333477 () Bool)

(declare-fun res!884558 () Bool)

(assert (=> b!1333477 (=> (not res!884558) (not e!759814))))

(assert (=> b!1333477 (= res!884558 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1333478 () Bool)

(declare-fun res!884564 () Bool)

(assert (=> b!1333478 (=> (not res!884564) (not e!759814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333478 (= res!884564 (validKeyInArray!0 (select (arr!43633 _keys!1590) from!1980)))))

(declare-fun b!1333479 () Bool)

(declare-fun res!884557 () Bool)

(assert (=> b!1333479 (=> (not res!884557) (not e!759814))))

(declare-datatypes ((List!30921 0))(
  ( (Nil!30918) (Cons!30917 (h!32135 (_ BitVec 64)) (t!45095 List!30921)) )
))
(declare-fun arrayNoDuplicates!0 (array!90343 (_ BitVec 32) List!30921) Bool)

(assert (=> b!1333479 (= res!884557 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30918))))

(declare-fun b!1333480 () Bool)

(declare-fun res!884559 () Bool)

(assert (=> b!1333480 (=> (not res!884559) (not e!759814))))

(assert (=> b!1333480 (= res!884559 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44184 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333481 () Bool)

(declare-fun e!759813 () Bool)

(assert (=> b!1333481 (= e!759812 (and e!759813 mapRes!56692))))

(declare-fun condMapEmpty!56692 () Bool)

(declare-fun mapDefault!56692 () ValueCell!17441)

(assert (=> b!1333481 (= condMapEmpty!56692 (= (arr!43634 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17441)) mapDefault!56692)))))

(declare-fun b!1333482 () Bool)

(declare-fun res!884562 () Bool)

(assert (=> b!1333482 (=> (not res!884562) (not e!759814))))

(declare-fun getCurrentListMap!5696 (array!90343 array!90345 (_ BitVec 32) (_ BitVec 32) V!54009 V!54009 (_ BitVec 32) Int) ListLongMap!21425)

(assert (=> b!1333482 (= res!884562 (contains!8904 (getCurrentListMap!5696 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333483 () Bool)

(assert (=> b!1333483 (= e!759813 tp_is_empty!36679)))

(assert (= (and start!112598 res!884563) b!1333473))

(assert (= (and b!1333473 res!884560) b!1333472))

(assert (= (and b!1333472 res!884561) b!1333479))

(assert (= (and b!1333479 res!884557) b!1333480))

(assert (= (and b!1333480 res!884559) b!1333482))

(assert (= (and b!1333482 res!884562) b!1333476))

(assert (= (and b!1333476 res!884556) b!1333478))

(assert (= (and b!1333478 res!884564) b!1333477))

(assert (= (and b!1333477 res!884558) b!1333475))

(assert (= (and b!1333481 condMapEmpty!56692) mapIsEmpty!56692))

(assert (= (and b!1333481 (not condMapEmpty!56692)) mapNonEmpty!56692))

(get-info :version)

(assert (= (and mapNonEmpty!56692 ((_ is ValueCellFull!17441) mapValue!56692)) b!1333474))

(assert (= (and b!1333481 ((_ is ValueCellFull!17441) mapDefault!56692)) b!1333483))

(assert (= start!112598 b!1333481))

(declare-fun b_lambda!24023 () Bool)

(assert (=> (not b_lambda!24023) (not b!1333475)))

(declare-fun t!45093 () Bool)

(declare-fun tb!11977 () Bool)

(assert (=> (and start!112598 (= defaultEntry!1323 defaultEntry!1323) t!45093) tb!11977))

(declare-fun result!25033 () Bool)

(assert (=> tb!11977 (= result!25033 tp_is_empty!36679)))

(assert (=> b!1333475 t!45093))

(declare-fun b_and!49597 () Bool)

(assert (= b_and!49595 (and (=> t!45093 result!25033) b_and!49597)))

(declare-fun m!1222541 () Bool)

(assert (=> b!1333475 m!1222541))

(declare-fun m!1222543 () Bool)

(assert (=> b!1333475 m!1222543))

(declare-fun m!1222545 () Bool)

(assert (=> b!1333475 m!1222545))

(declare-fun m!1222547 () Bool)

(assert (=> b!1333475 m!1222547))

(declare-fun m!1222549 () Bool)

(assert (=> b!1333475 m!1222549))

(assert (=> b!1333475 m!1222547))

(declare-fun m!1222551 () Bool)

(assert (=> b!1333475 m!1222551))

(assert (=> b!1333475 m!1222543))

(declare-fun m!1222553 () Bool)

(assert (=> b!1333475 m!1222553))

(declare-fun m!1222555 () Bool)

(assert (=> b!1333475 m!1222555))

(declare-fun m!1222557 () Bool)

(assert (=> b!1333475 m!1222557))

(declare-fun m!1222559 () Bool)

(assert (=> b!1333475 m!1222559))

(assert (=> b!1333475 m!1222549))

(declare-fun m!1222561 () Bool)

(assert (=> b!1333475 m!1222561))

(declare-fun m!1222563 () Bool)

(assert (=> b!1333475 m!1222563))

(declare-fun m!1222565 () Bool)

(assert (=> b!1333475 m!1222565))

(assert (=> b!1333475 m!1222563))

(declare-fun m!1222567 () Bool)

(assert (=> b!1333479 m!1222567))

(assert (=> b!1333476 m!1222563))

(declare-fun m!1222569 () Bool)

(assert (=> start!112598 m!1222569))

(declare-fun m!1222571 () Bool)

(assert (=> start!112598 m!1222571))

(declare-fun m!1222573 () Bool)

(assert (=> start!112598 m!1222573))

(assert (=> b!1333478 m!1222563))

(assert (=> b!1333478 m!1222563))

(declare-fun m!1222575 () Bool)

(assert (=> b!1333478 m!1222575))

(declare-fun m!1222577 () Bool)

(assert (=> b!1333482 m!1222577))

(assert (=> b!1333482 m!1222577))

(declare-fun m!1222579 () Bool)

(assert (=> b!1333482 m!1222579))

(declare-fun m!1222581 () Bool)

(assert (=> b!1333472 m!1222581))

(declare-fun m!1222583 () Bool)

(assert (=> mapNonEmpty!56692 m!1222583))

(check-sat (not b!1333482) (not b!1333475) (not b_next!30769) (not b!1333479) tp_is_empty!36679 (not mapNonEmpty!56692) (not b_lambda!24023) b_and!49597 (not b!1333478) (not start!112598) (not b!1333472))
(check-sat b_and!49597 (not b_next!30769))
