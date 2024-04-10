; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131958 () Bool)

(assert start!131958)

(declare-fun b_free!31671 () Bool)

(declare-fun b_next!31671 () Bool)

(assert (=> start!131958 (= b_free!31671 (not b_next!31671))))

(declare-fun tp!111264 () Bool)

(declare-fun b_and!51081 () Bool)

(assert (=> start!131958 (= tp!111264 b_and!51081)))

(declare-fun b!1545545 () Bool)

(declare-fun e!860289 () Bool)

(declare-fun tp_is_empty!37947 () Bool)

(assert (=> b!1545545 (= e!860289 tp_is_empty!37947)))

(declare-fun bm!69257 () Bool)

(declare-datatypes ((V!59039 0))(
  ( (V!59040 (val!19051 Int)) )
))
(declare-datatypes ((tuple2!24484 0))(
  ( (tuple2!24485 (_1!12253 (_ BitVec 64)) (_2!12253 V!59039)) )
))
(declare-datatypes ((List!35994 0))(
  ( (Nil!35991) (Cons!35990 (h!37435 tuple2!24484) (t!50688 List!35994)) )
))
(declare-datatypes ((ListLongMap!22093 0))(
  ( (ListLongMap!22094 (toList!11062 List!35994)) )
))
(declare-fun call!69263 () ListLongMap!22093)

(declare-fun call!69260 () ListLongMap!22093)

(assert (=> bm!69257 (= call!69263 call!69260)))

(declare-fun b!1545546 () Bool)

(declare-fun e!860284 () Bool)

(assert (=> b!1545546 (= e!860284 (not true))))

(declare-datatypes ((array!103100 0))(
  ( (array!103101 (arr!49752 (Array (_ BitVec 32) (_ BitVec 64))) (size!50302 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103100)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666341 () ListLongMap!22093)

(declare-fun zeroValue!436 () V!59039)

(declare-fun contains!10033 (ListLongMap!22093 (_ BitVec 64)) Bool)

(declare-fun +!4898 (ListLongMap!22093 tuple2!24484) ListLongMap!22093)

(assert (=> b!1545546 (contains!10033 (+!4898 lt!666341 (tuple2!24485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49752 _keys!618) from!762))))

(declare-datatypes ((Unit!51502 0))(
  ( (Unit!51503) )
))
(declare-fun lt!666342 () Unit!51502)

(declare-fun addStillContains!1221 (ListLongMap!22093 (_ BitVec 64) V!59039 (_ BitVec 64)) Unit!51502)

(assert (=> b!1545546 (= lt!666342 (addStillContains!1221 lt!666341 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49752 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18063 0))(
  ( (ValueCellFull!18063 (v!21852 V!59039)) (EmptyCell!18063) )
))
(declare-datatypes ((array!103102 0))(
  ( (array!103103 (arr!49753 (Array (_ BitVec 32) ValueCell!18063)) (size!50303 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103102)

(declare-fun minValue!436 () V!59039)

(declare-fun getCurrentListMapNoExtraKeys!6531 (array!103100 array!103102 (_ BitVec 32) (_ BitVec 32) V!59039 V!59039 (_ BitVec 32) Int) ListLongMap!22093)

(assert (=> b!1545546 (= lt!666341 (getCurrentListMapNoExtraKeys!6531 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545547 () Bool)

(declare-fun res!1059852 () Bool)

(declare-fun e!860282 () Bool)

(assert (=> b!1545547 (=> (not res!1059852) (not e!860282))))

(assert (=> b!1545547 (= res!1059852 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50302 _keys!618))))))

(declare-fun b!1545548 () Bool)

(declare-fun e!860285 () ListLongMap!22093)

(declare-fun call!69262 () ListLongMap!22093)

(assert (=> b!1545548 (= e!860285 (+!4898 call!69262 (tuple2!24485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69258 () Bool)

(declare-fun call!69261 () ListLongMap!22093)

(assert (=> bm!69258 (= call!69261 call!69262)))

(declare-fun mapNonEmpty!58624 () Bool)

(declare-fun mapRes!58624 () Bool)

(declare-fun tp!111265 () Bool)

(declare-fun e!860281 () Bool)

(assert (=> mapNonEmpty!58624 (= mapRes!58624 (and tp!111265 e!860281))))

(declare-fun mapValue!58624 () ValueCell!18063)

(declare-fun mapKey!58624 () (_ BitVec 32))

(declare-fun mapRest!58624 () (Array (_ BitVec 32) ValueCell!18063))

(assert (=> mapNonEmpty!58624 (= (arr!49753 _values!470) (store mapRest!58624 mapKey!58624 mapValue!58624))))

(declare-fun c!141648 () Bool)

(declare-fun bm!69259 () Bool)

(declare-fun c!141650 () Bool)

(declare-fun call!69264 () ListLongMap!22093)

(assert (=> bm!69259 (= call!69262 (+!4898 (ite c!141650 call!69260 (ite c!141648 call!69263 call!69264)) (ite (or c!141650 c!141648) (tuple2!24485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1059855 () Bool)

(assert (=> start!131958 (=> (not res!1059855) (not e!860282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131958 (= res!1059855 (validMask!0 mask!926))))

(assert (=> start!131958 e!860282))

(declare-fun array_inv!38697 (array!103100) Bool)

(assert (=> start!131958 (array_inv!38697 _keys!618)))

(assert (=> start!131958 tp_is_empty!37947))

(assert (=> start!131958 true))

(assert (=> start!131958 tp!111264))

(declare-fun e!860283 () Bool)

(declare-fun array_inv!38698 (array!103102) Bool)

(assert (=> start!131958 (and (array_inv!38698 _values!470) e!860283)))

(declare-fun b!1545549 () Bool)

(declare-fun res!1059857 () Bool)

(assert (=> b!1545549 (=> (not res!1059857) (not e!860282))))

(declare-datatypes ((List!35995 0))(
  ( (Nil!35992) (Cons!35991 (h!37436 (_ BitVec 64)) (t!50689 List!35995)) )
))
(declare-fun arrayNoDuplicates!0 (array!103100 (_ BitVec 32) List!35995) Bool)

(assert (=> b!1545549 (= res!1059857 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35992))))

(declare-fun b!1545550 () Bool)

(declare-fun e!860287 () ListLongMap!22093)

(assert (=> b!1545550 (= e!860287 call!69261)))

(declare-fun bm!69260 () Bool)

(assert (=> bm!69260 (= call!69260 (getCurrentListMapNoExtraKeys!6531 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545551 () Bool)

(assert (=> b!1545551 (= e!860282 e!860284)))

(declare-fun res!1059853 () Bool)

(assert (=> b!1545551 (=> (not res!1059853) (not e!860284))))

(assert (=> b!1545551 (= res!1059853 (bvslt from!762 (size!50302 _keys!618)))))

(declare-fun lt!666344 () ListLongMap!22093)

(assert (=> b!1545551 (= lt!666344 e!860285)))

(declare-fun lt!666343 () Bool)

(assert (=> b!1545551 (= c!141650 (and (not lt!666343) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545551 (= lt!666343 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545552 () Bool)

(assert (=> b!1545552 (= e!860283 (and e!860289 mapRes!58624))))

(declare-fun condMapEmpty!58624 () Bool)

(declare-fun mapDefault!58624 () ValueCell!18063)

(assert (=> b!1545552 (= condMapEmpty!58624 (= (arr!49753 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18063)) mapDefault!58624)))))

(declare-fun b!1545553 () Bool)

(declare-fun res!1059856 () Bool)

(assert (=> b!1545553 (=> (not res!1059856) (not e!860282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103100 (_ BitVec 32)) Bool)

(assert (=> b!1545553 (= res!1059856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545554 () Bool)

(declare-fun res!1059858 () Bool)

(assert (=> b!1545554 (=> (not res!1059858) (not e!860284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545554 (= res!1059858 (validKeyInArray!0 (select (arr!49752 _keys!618) from!762)))))

(declare-fun b!1545555 () Bool)

(declare-fun res!1059854 () Bool)

(assert (=> b!1545555 (=> (not res!1059854) (not e!860282))))

(assert (=> b!1545555 (= res!1059854 (and (= (size!50303 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50302 _keys!618) (size!50303 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545556 () Bool)

(declare-fun c!141649 () Bool)

(assert (=> b!1545556 (= c!141649 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666343))))

(declare-fun e!860288 () ListLongMap!22093)

(assert (=> b!1545556 (= e!860288 e!860287)))

(declare-fun mapIsEmpty!58624 () Bool)

(assert (=> mapIsEmpty!58624 mapRes!58624))

(declare-fun b!1545557 () Bool)

(assert (=> b!1545557 (= e!860281 tp_is_empty!37947)))

(declare-fun b!1545558 () Bool)

(assert (=> b!1545558 (= e!860287 call!69264)))

(declare-fun b!1545559 () Bool)

(assert (=> b!1545559 (= e!860285 e!860288)))

(assert (=> b!1545559 (= c!141648 (and (not lt!666343) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545560 () Bool)

(assert (=> b!1545560 (= e!860288 call!69261)))

(declare-fun bm!69261 () Bool)

(assert (=> bm!69261 (= call!69264 call!69263)))

(assert (= (and start!131958 res!1059855) b!1545555))

(assert (= (and b!1545555 res!1059854) b!1545553))

(assert (= (and b!1545553 res!1059856) b!1545549))

(assert (= (and b!1545549 res!1059857) b!1545547))

(assert (= (and b!1545547 res!1059852) b!1545551))

(assert (= (and b!1545551 c!141650) b!1545548))

(assert (= (and b!1545551 (not c!141650)) b!1545559))

(assert (= (and b!1545559 c!141648) b!1545560))

(assert (= (and b!1545559 (not c!141648)) b!1545556))

(assert (= (and b!1545556 c!141649) b!1545550))

(assert (= (and b!1545556 (not c!141649)) b!1545558))

(assert (= (or b!1545550 b!1545558) bm!69261))

(assert (= (or b!1545560 bm!69261) bm!69257))

(assert (= (or b!1545560 b!1545550) bm!69258))

(assert (= (or b!1545548 bm!69257) bm!69260))

(assert (= (or b!1545548 bm!69258) bm!69259))

(assert (= (and b!1545551 res!1059853) b!1545554))

(assert (= (and b!1545554 res!1059858) b!1545546))

(assert (= (and b!1545552 condMapEmpty!58624) mapIsEmpty!58624))

(assert (= (and b!1545552 (not condMapEmpty!58624)) mapNonEmpty!58624))

(get-info :version)

(assert (= (and mapNonEmpty!58624 ((_ is ValueCellFull!18063) mapValue!58624)) b!1545557))

(assert (= (and b!1545552 ((_ is ValueCellFull!18063) mapDefault!58624)) b!1545545))

(assert (= start!131958 b!1545552))

(declare-fun m!1425815 () Bool)

(assert (=> start!131958 m!1425815))

(declare-fun m!1425817 () Bool)

(assert (=> start!131958 m!1425817))

(declare-fun m!1425819 () Bool)

(assert (=> start!131958 m!1425819))

(declare-fun m!1425821 () Bool)

(assert (=> mapNonEmpty!58624 m!1425821))

(declare-fun m!1425823 () Bool)

(assert (=> bm!69260 m!1425823))

(declare-fun m!1425825 () Bool)

(assert (=> b!1545554 m!1425825))

(assert (=> b!1545554 m!1425825))

(declare-fun m!1425827 () Bool)

(assert (=> b!1545554 m!1425827))

(declare-fun m!1425829 () Bool)

(assert (=> bm!69259 m!1425829))

(assert (=> b!1545546 m!1425825))

(declare-fun m!1425831 () Bool)

(assert (=> b!1545546 m!1425831))

(assert (=> b!1545546 m!1425823))

(assert (=> b!1545546 m!1425825))

(declare-fun m!1425833 () Bool)

(assert (=> b!1545546 m!1425833))

(assert (=> b!1545546 m!1425833))

(assert (=> b!1545546 m!1425825))

(declare-fun m!1425835 () Bool)

(assert (=> b!1545546 m!1425835))

(declare-fun m!1425837 () Bool)

(assert (=> b!1545548 m!1425837))

(declare-fun m!1425839 () Bool)

(assert (=> b!1545549 m!1425839))

(declare-fun m!1425841 () Bool)

(assert (=> b!1545553 m!1425841))

(check-sat (not mapNonEmpty!58624) (not b!1545546) (not b!1545554) (not b!1545553) (not b_next!31671) tp_is_empty!37947 (not bm!69259) (not b!1545549) (not b!1545548) (not start!131958) (not bm!69260) b_and!51081)
(check-sat b_and!51081 (not b_next!31671))
