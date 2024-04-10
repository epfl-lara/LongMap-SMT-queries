; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132000 () Bool)

(assert start!132000)

(declare-fun b_free!31713 () Bool)

(declare-fun b_next!31713 () Bool)

(assert (=> start!132000 (= b_free!31713 (not b_next!31713))))

(declare-fun tp!111391 () Bool)

(declare-fun b_and!51123 () Bool)

(assert (=> start!132000 (= tp!111391 b_and!51123)))

(declare-fun bm!69572 () Bool)

(declare-datatypes ((V!59095 0))(
  ( (V!59096 (val!19072 Int)) )
))
(declare-datatypes ((tuple2!24526 0))(
  ( (tuple2!24527 (_1!12274 (_ BitVec 64)) (_2!12274 V!59095)) )
))
(declare-datatypes ((List!36031 0))(
  ( (Nil!36028) (Cons!36027 (h!37472 tuple2!24526) (t!50725 List!36031)) )
))
(declare-datatypes ((ListLongMap!22135 0))(
  ( (ListLongMap!22136 (toList!11083 List!36031)) )
))
(declare-fun call!69575 () ListLongMap!22135)

(declare-fun call!69579 () ListLongMap!22135)

(assert (=> bm!69572 (= call!69575 call!69579)))

(declare-fun bm!69573 () Bool)

(declare-fun call!69576 () ListLongMap!22135)

(declare-fun call!69578 () ListLongMap!22135)

(assert (=> bm!69573 (= call!69576 call!69578)))

(declare-fun mapIsEmpty!58687 () Bool)

(declare-fun mapRes!58687 () Bool)

(assert (=> mapIsEmpty!58687 mapRes!58687))

(declare-fun bm!69574 () Bool)

(declare-fun call!69577 () ListLongMap!22135)

(assert (=> bm!69574 (= call!69577 call!69576)))

(declare-fun b!1546553 () Bool)

(declare-fun e!860850 () Bool)

(declare-fun e!860856 () Bool)

(assert (=> b!1546553 (= e!860850 e!860856)))

(declare-fun res!1060296 () Bool)

(assert (=> b!1546553 (=> (not res!1060296) (not e!860856))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103184 0))(
  ( (array!103185 (arr!49794 (Array (_ BitVec 32) (_ BitVec 64))) (size!50344 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103184)

(assert (=> b!1546553 (= res!1060296 (bvslt from!762 (size!50344 _keys!618)))))

(declare-fun lt!666599 () ListLongMap!22135)

(declare-fun e!860853 () ListLongMap!22135)

(assert (=> b!1546553 (= lt!666599 e!860853)))

(declare-fun c!141839 () Bool)

(declare-fun lt!666598 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546553 (= c!141839 (and (not lt!666598) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546553 (= lt!666598 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546554 () Bool)

(declare-fun res!1060299 () Bool)

(assert (=> b!1546554 (=> (not res!1060299) (not e!860850))))

(assert (=> b!1546554 (= res!1060299 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50344 _keys!618))))))

(declare-fun b!1546555 () Bool)

(declare-fun res!1060298 () Bool)

(assert (=> b!1546555 (=> (not res!1060298) (not e!860850))))

(declare-datatypes ((List!36032 0))(
  ( (Nil!36029) (Cons!36028 (h!37473 (_ BitVec 64)) (t!50726 List!36032)) )
))
(declare-fun arrayNoDuplicates!0 (array!103184 (_ BitVec 32) List!36032) Bool)

(assert (=> b!1546555 (= res!1060298 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36029))))

(declare-fun b!1546556 () Bool)

(declare-fun res!1060293 () Bool)

(assert (=> b!1546556 (=> (not res!1060293) (not e!860850))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18084 0))(
  ( (ValueCellFull!18084 (v!21873 V!59095)) (EmptyCell!18084) )
))
(declare-datatypes ((array!103186 0))(
  ( (array!103187 (arr!49795 (Array (_ BitVec 32) ValueCell!18084)) (size!50345 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103186)

(assert (=> b!1546556 (= res!1060293 (and (= (size!50345 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50344 _keys!618) (size!50345 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1060294 () Bool)

(assert (=> start!132000 (=> (not res!1060294) (not e!860850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132000 (= res!1060294 (validMask!0 mask!926))))

(assert (=> start!132000 e!860850))

(declare-fun array_inv!38729 (array!103184) Bool)

(assert (=> start!132000 (array_inv!38729 _keys!618)))

(declare-fun tp_is_empty!37989 () Bool)

(assert (=> start!132000 tp_is_empty!37989))

(assert (=> start!132000 true))

(assert (=> start!132000 tp!111391))

(declare-fun e!860854 () Bool)

(declare-fun array_inv!38730 (array!103186) Bool)

(assert (=> start!132000 (and (array_inv!38730 _values!470) e!860854)))

(declare-fun b!1546557 () Bool)

(declare-fun minValue!436 () V!59095)

(declare-fun +!4917 (ListLongMap!22135 tuple2!24526) ListLongMap!22135)

(assert (=> b!1546557 (= e!860853 (+!4917 call!69579 (tuple2!24527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546558 () Bool)

(declare-fun e!860848 () Bool)

(assert (=> b!1546558 (= e!860854 (and e!860848 mapRes!58687))))

(declare-fun condMapEmpty!58687 () Bool)

(declare-fun mapDefault!58687 () ValueCell!18084)

(assert (=> b!1546558 (= condMapEmpty!58687 (= (arr!49795 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18084)) mapDefault!58687)))))

(declare-fun b!1546559 () Bool)

(assert (=> b!1546559 (= e!860848 tp_is_empty!37989)))

(declare-fun b!1546560 () Bool)

(declare-fun e!860855 () ListLongMap!22135)

(assert (=> b!1546560 (= e!860853 e!860855)))

(declare-fun c!141838 () Bool)

(assert (=> b!1546560 (= c!141838 (and (not lt!666598) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546561 () Bool)

(declare-fun res!1060297 () Bool)

(assert (=> b!1546561 (=> (not res!1060297) (not e!860850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103184 (_ BitVec 32)) Bool)

(assert (=> b!1546561 (= res!1060297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58687 () Bool)

(declare-fun tp!111390 () Bool)

(declare-fun e!860852 () Bool)

(assert (=> mapNonEmpty!58687 (= mapRes!58687 (and tp!111390 e!860852))))

(declare-fun mapValue!58687 () ValueCell!18084)

(declare-fun mapKey!58687 () (_ BitVec 32))

(declare-fun mapRest!58687 () (Array (_ BitVec 32) ValueCell!18084))

(assert (=> mapNonEmpty!58687 (= (arr!49795 _values!470) (store mapRest!58687 mapKey!58687 mapValue!58687))))

(declare-fun b!1546562 () Bool)

(declare-fun c!141837 () Bool)

(assert (=> b!1546562 (= c!141837 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666598))))

(declare-fun e!860851 () ListLongMap!22135)

(assert (=> b!1546562 (= e!860855 e!860851)))

(declare-fun b!1546563 () Bool)

(assert (=> b!1546563 (= e!860851 call!69575)))

(declare-fun zeroValue!436 () V!59095)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69575 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6547 (array!103184 array!103186 (_ BitVec 32) (_ BitVec 32) V!59095 V!59095 (_ BitVec 32) Int) ListLongMap!22135)

(assert (=> bm!69575 (= call!69578 (getCurrentListMapNoExtraKeys!6547 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546564 () Bool)

(assert (=> b!1546564 (= e!860852 tp_is_empty!37989)))

(declare-fun b!1546565 () Bool)

(assert (=> b!1546565 (= e!860856 (not true))))

(declare-fun lt!666600 () Bool)

(declare-fun lt!666601 () ListLongMap!22135)

(declare-fun contains!10048 (ListLongMap!22135 (_ BitVec 64)) Bool)

(assert (=> b!1546565 (= lt!666600 (contains!10048 lt!666601 (select (arr!49794 _keys!618) from!762)))))

(assert (=> b!1546565 (contains!10048 (+!4917 lt!666601 (tuple2!24527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49794 _keys!618) from!762))))

(declare-datatypes ((Unit!51532 0))(
  ( (Unit!51533) )
))
(declare-fun lt!666602 () Unit!51532)

(declare-fun addStillContains!1236 (ListLongMap!22135 (_ BitVec 64) V!59095 (_ BitVec 64)) Unit!51532)

(assert (=> b!1546565 (= lt!666602 (addStillContains!1236 lt!666601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49794 _keys!618) from!762)))))

(assert (=> b!1546565 (= lt!666601 (getCurrentListMapNoExtraKeys!6547 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546566 () Bool)

(assert (=> b!1546566 (= e!860855 call!69575)))

(declare-fun bm!69576 () Bool)

(assert (=> bm!69576 (= call!69579 (+!4917 (ite c!141839 call!69578 (ite c!141838 call!69576 call!69577)) (ite (or c!141839 c!141838) (tuple2!24527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546567 () Bool)

(assert (=> b!1546567 (= e!860851 call!69577)))

(declare-fun b!1546568 () Bool)

(declare-fun res!1060295 () Bool)

(assert (=> b!1546568 (=> (not res!1060295) (not e!860856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546568 (= res!1060295 (validKeyInArray!0 (select (arr!49794 _keys!618) from!762)))))

(assert (= (and start!132000 res!1060294) b!1546556))

(assert (= (and b!1546556 res!1060293) b!1546561))

(assert (= (and b!1546561 res!1060297) b!1546555))

(assert (= (and b!1546555 res!1060298) b!1546554))

(assert (= (and b!1546554 res!1060299) b!1546553))

(assert (= (and b!1546553 c!141839) b!1546557))

(assert (= (and b!1546553 (not c!141839)) b!1546560))

(assert (= (and b!1546560 c!141838) b!1546566))

(assert (= (and b!1546560 (not c!141838)) b!1546562))

(assert (= (and b!1546562 c!141837) b!1546563))

(assert (= (and b!1546562 (not c!141837)) b!1546567))

(assert (= (or b!1546563 b!1546567) bm!69574))

(assert (= (or b!1546566 bm!69574) bm!69573))

(assert (= (or b!1546566 b!1546563) bm!69572))

(assert (= (or b!1546557 bm!69573) bm!69575))

(assert (= (or b!1546557 bm!69572) bm!69576))

(assert (= (and b!1546553 res!1060296) b!1546568))

(assert (= (and b!1546568 res!1060295) b!1546565))

(assert (= (and b!1546558 condMapEmpty!58687) mapIsEmpty!58687))

(assert (= (and b!1546558 (not condMapEmpty!58687)) mapNonEmpty!58687))

(get-info :version)

(assert (= (and mapNonEmpty!58687 ((_ is ValueCellFull!18084) mapValue!58687)) b!1546564))

(assert (= (and b!1546558 ((_ is ValueCellFull!18084) mapDefault!58687)) b!1546559))

(assert (= start!132000 b!1546558))

(declare-fun m!1426405 () Bool)

(assert (=> bm!69576 m!1426405))

(declare-fun m!1426407 () Bool)

(assert (=> mapNonEmpty!58687 m!1426407))

(declare-fun m!1426409 () Bool)

(assert (=> b!1546555 m!1426409))

(declare-fun m!1426411 () Bool)

(assert (=> b!1546568 m!1426411))

(assert (=> b!1546568 m!1426411))

(declare-fun m!1426413 () Bool)

(assert (=> b!1546568 m!1426413))

(declare-fun m!1426415 () Bool)

(assert (=> start!132000 m!1426415))

(declare-fun m!1426417 () Bool)

(assert (=> start!132000 m!1426417))

(declare-fun m!1426419 () Bool)

(assert (=> start!132000 m!1426419))

(declare-fun m!1426421 () Bool)

(assert (=> b!1546557 m!1426421))

(declare-fun m!1426423 () Bool)

(assert (=> bm!69575 m!1426423))

(declare-fun m!1426425 () Bool)

(assert (=> b!1546561 m!1426425))

(assert (=> b!1546565 m!1426423))

(assert (=> b!1546565 m!1426411))

(declare-fun m!1426427 () Bool)

(assert (=> b!1546565 m!1426427))

(assert (=> b!1546565 m!1426411))

(declare-fun m!1426429 () Bool)

(assert (=> b!1546565 m!1426429))

(assert (=> b!1546565 m!1426411))

(declare-fun m!1426431 () Bool)

(assert (=> b!1546565 m!1426431))

(assert (=> b!1546565 m!1426427))

(assert (=> b!1546565 m!1426411))

(declare-fun m!1426433 () Bool)

(assert (=> b!1546565 m!1426433))

(check-sat (not b!1546568) tp_is_empty!37989 (not bm!69575) (not b!1546565) (not start!132000) b_and!51123 (not bm!69576) (not b!1546555) (not b!1546557) (not mapNonEmpty!58687) (not b_next!31713) (not b!1546561))
(check-sat b_and!51123 (not b_next!31713))
