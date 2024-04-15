; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131954 () Bool)

(assert start!131954)

(declare-fun b_free!31717 () Bool)

(declare-fun b_next!31717 () Bool)

(assert (=> start!131954 (= b_free!31717 (not b_next!31717))))

(declare-fun tp!111403 () Bool)

(declare-fun b_and!51109 () Bool)

(assert (=> start!131954 (= tp!111403 b_and!51109)))

(declare-fun bm!69567 () Bool)

(declare-datatypes ((V!59101 0))(
  ( (V!59102 (val!19074 Int)) )
))
(declare-datatypes ((tuple2!24606 0))(
  ( (tuple2!24607 (_1!12314 (_ BitVec 64)) (_2!12314 V!59101)) )
))
(declare-datatypes ((List!36078 0))(
  ( (Nil!36075) (Cons!36074 (h!37520 tuple2!24606) (t!50764 List!36078)) )
))
(declare-datatypes ((ListLongMap!22215 0))(
  ( (ListLongMap!22216 (toList!11123 List!36078)) )
))
(declare-fun call!69574 () ListLongMap!22215)

(declare-fun call!69570 () ListLongMap!22215)

(assert (=> bm!69567 (= call!69574 call!69570)))

(declare-fun b!1546336 () Bool)

(declare-fun e!860707 () ListLongMap!22215)

(assert (=> b!1546336 (= e!860707 call!69574)))

(declare-fun b!1546337 () Bool)

(declare-fun e!860710 () Bool)

(declare-fun e!860712 () Bool)

(assert (=> b!1546337 (= e!860710 e!860712)))

(declare-fun res!1060211 () Bool)

(assert (=> b!1546337 (=> (not res!1060211) (not e!860712))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103120 0))(
  ( (array!103121 (arr!49763 (Array (_ BitVec 32) (_ BitVec 64))) (size!50315 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103120)

(assert (=> b!1546337 (= res!1060211 (bvslt from!762 (size!50315 _keys!618)))))

(declare-fun lt!666342 () ListLongMap!22215)

(declare-fun e!860709 () ListLongMap!22215)

(assert (=> b!1546337 (= lt!666342 e!860709)))

(declare-fun c!141767 () Bool)

(declare-fun lt!666346 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546337 (= c!141767 (and (not lt!666346) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546337 (= lt!666346 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!59101)

(declare-fun minValue!436 () V!59101)

(declare-fun call!69572 () ListLongMap!22215)

(declare-fun c!141768 () Bool)

(declare-fun bm!69568 () Bool)

(declare-fun call!69571 () ListLongMap!22215)

(declare-fun +!4950 (ListLongMap!22215 tuple2!24606) ListLongMap!22215)

(assert (=> bm!69568 (= call!69572 (+!4950 (ite c!141767 call!69571 (ite c!141768 call!69570 call!69574)) (ite (or c!141767 c!141768) (tuple2!24607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546338 () Bool)

(declare-fun res!1060212 () Bool)

(assert (=> b!1546338 (=> (not res!1060212) (not e!860710))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18086 0))(
  ( (ValueCellFull!18086 (v!21871 V!59101)) (EmptyCell!18086) )
))
(declare-datatypes ((array!103122 0))(
  ( (array!103123 (arr!49764 (Array (_ BitVec 32) ValueCell!18086)) (size!50316 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103122)

(assert (=> b!1546338 (= res!1060212 (and (= (size!50316 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50315 _keys!618) (size!50316 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69569 () Bool)

(assert (=> bm!69569 (= call!69570 call!69571)))

(declare-fun b!1546339 () Bool)

(declare-fun res!1060209 () Bool)

(assert (=> b!1546339 (=> (not res!1060209) (not e!860712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546339 (= res!1060209 (validKeyInArray!0 (select (arr!49763 _keys!618) from!762)))))

(declare-fun b!1546340 () Bool)

(declare-fun call!69573 () ListLongMap!22215)

(assert (=> b!1546340 (= e!860707 call!69573)))

(declare-fun b!1546341 () Bool)

(declare-fun res!1060206 () Bool)

(assert (=> b!1546341 (=> (not res!1060206) (not e!860710))))

(declare-datatypes ((List!36079 0))(
  ( (Nil!36076) (Cons!36075 (h!37521 (_ BitVec 64)) (t!50765 List!36079)) )
))
(declare-fun arrayNoDuplicates!0 (array!103120 (_ BitVec 32) List!36079) Bool)

(assert (=> b!1546341 (= res!1060206 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36076))))

(declare-fun b!1546342 () Bool)

(declare-fun e!860711 () Bool)

(declare-fun e!860704 () Bool)

(declare-fun mapRes!58693 () Bool)

(assert (=> b!1546342 (= e!860711 (and e!860704 mapRes!58693))))

(declare-fun condMapEmpty!58693 () Bool)

(declare-fun mapDefault!58693 () ValueCell!18086)

(assert (=> b!1546342 (= condMapEmpty!58693 (= (arr!49764 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18086)) mapDefault!58693)))))

(declare-fun b!1546343 () Bool)

(declare-fun e!860705 () ListLongMap!22215)

(assert (=> b!1546343 (= e!860709 e!860705)))

(assert (=> b!1546343 (= c!141768 (and (not lt!666346) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546344 () Bool)

(declare-fun e!860708 () Bool)

(declare-fun tp_is_empty!37993 () Bool)

(assert (=> b!1546344 (= e!860708 tp_is_empty!37993)))

(declare-fun b!1546345 () Bool)

(assert (=> b!1546345 (= e!860712 (not true))))

(declare-fun lt!666343 () ListLongMap!22215)

(declare-fun apply!1035 (ListLongMap!22215 (_ BitVec 64)) V!59101)

(assert (=> b!1546345 (= (apply!1035 (+!4950 lt!666343 (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49763 _keys!618) from!762)) (apply!1035 lt!666343 (select (arr!49763 _keys!618) from!762)))))

(declare-datatypes ((Unit!51367 0))(
  ( (Unit!51368) )
))
(declare-fun lt!666344 () Unit!51367)

(declare-fun addApplyDifferent!573 (ListLongMap!22215 (_ BitVec 64) V!59101 (_ BitVec 64)) Unit!51367)

(assert (=> b!1546345 (= lt!666344 (addApplyDifferent!573 lt!666343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49763 _keys!618) from!762)))))

(declare-fun contains!10010 (ListLongMap!22215 (_ BitVec 64)) Bool)

(assert (=> b!1546345 (contains!10010 (+!4950 lt!666343 (tuple2!24607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49763 _keys!618) from!762))))

(declare-fun lt!666345 () Unit!51367)

(declare-fun addStillContains!1233 (ListLongMap!22215 (_ BitVec 64) V!59101 (_ BitVec 64)) Unit!51367)

(assert (=> b!1546345 (= lt!666345 (addStillContains!1233 lt!666343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49763 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6578 (array!103120 array!103122 (_ BitVec 32) (_ BitVec 32) V!59101 V!59101 (_ BitVec 32) Int) ListLongMap!22215)

(assert (=> b!1546345 (= lt!666343 (getCurrentListMapNoExtraKeys!6578 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58693 () Bool)

(declare-fun tp!111404 () Bool)

(assert (=> mapNonEmpty!58693 (= mapRes!58693 (and tp!111404 e!860708))))

(declare-fun mapRest!58693 () (Array (_ BitVec 32) ValueCell!18086))

(declare-fun mapKey!58693 () (_ BitVec 32))

(declare-fun mapValue!58693 () ValueCell!18086)

(assert (=> mapNonEmpty!58693 (= (arr!49764 _values!470) (store mapRest!58693 mapKey!58693 mapValue!58693))))

(declare-fun res!1060208 () Bool)

(assert (=> start!131954 (=> (not res!1060208) (not e!860710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131954 (= res!1060208 (validMask!0 mask!926))))

(assert (=> start!131954 e!860710))

(declare-fun array_inv!38899 (array!103120) Bool)

(assert (=> start!131954 (array_inv!38899 _keys!618)))

(assert (=> start!131954 tp_is_empty!37993))

(assert (=> start!131954 true))

(assert (=> start!131954 tp!111403))

(declare-fun array_inv!38900 (array!103122) Bool)

(assert (=> start!131954 (and (array_inv!38900 _values!470) e!860711)))

(declare-fun b!1546346 () Bool)

(assert (=> b!1546346 (= e!860704 tp_is_empty!37993)))

(declare-fun bm!69570 () Bool)

(assert (=> bm!69570 (= call!69573 call!69572)))

(declare-fun bm!69571 () Bool)

(assert (=> bm!69571 (= call!69571 (getCurrentListMapNoExtraKeys!6578 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546347 () Bool)

(assert (=> b!1546347 (= e!860705 call!69573)))

(declare-fun b!1546348 () Bool)

(declare-fun c!141766 () Bool)

(assert (=> b!1546348 (= c!141766 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666346))))

(assert (=> b!1546348 (= e!860705 e!860707)))

(declare-fun mapIsEmpty!58693 () Bool)

(assert (=> mapIsEmpty!58693 mapRes!58693))

(declare-fun b!1546349 () Bool)

(declare-fun res!1060207 () Bool)

(assert (=> b!1546349 (=> (not res!1060207) (not e!860710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103120 (_ BitVec 32)) Bool)

(assert (=> b!1546349 (= res!1060207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546350 () Bool)

(declare-fun res!1060210 () Bool)

(assert (=> b!1546350 (=> (not res!1060210) (not e!860710))))

(assert (=> b!1546350 (= res!1060210 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50315 _keys!618))))))

(declare-fun b!1546351 () Bool)

(assert (=> b!1546351 (= e!860709 (+!4950 call!69572 (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!131954 res!1060208) b!1546338))

(assert (= (and b!1546338 res!1060212) b!1546349))

(assert (= (and b!1546349 res!1060207) b!1546341))

(assert (= (and b!1546341 res!1060206) b!1546350))

(assert (= (and b!1546350 res!1060210) b!1546337))

(assert (= (and b!1546337 c!141767) b!1546351))

(assert (= (and b!1546337 (not c!141767)) b!1546343))

(assert (= (and b!1546343 c!141768) b!1546347))

(assert (= (and b!1546343 (not c!141768)) b!1546348))

(assert (= (and b!1546348 c!141766) b!1546340))

(assert (= (and b!1546348 (not c!141766)) b!1546336))

(assert (= (or b!1546340 b!1546336) bm!69567))

(assert (= (or b!1546347 bm!69567) bm!69569))

(assert (= (or b!1546347 b!1546340) bm!69570))

(assert (= (or b!1546351 bm!69569) bm!69571))

(assert (= (or b!1546351 bm!69570) bm!69568))

(assert (= (and b!1546337 res!1060211) b!1546339))

(assert (= (and b!1546339 res!1060209) b!1546345))

(assert (= (and b!1546342 condMapEmpty!58693) mapIsEmpty!58693))

(assert (= (and b!1546342 (not condMapEmpty!58693)) mapNonEmpty!58693))

(get-info :version)

(assert (= (and mapNonEmpty!58693 ((_ is ValueCellFull!18086) mapValue!58693)) b!1546344))

(assert (= (and b!1546342 ((_ is ValueCellFull!18086) mapDefault!58693)) b!1546346))

(assert (= start!131954 b!1546342))

(declare-fun m!1425573 () Bool)

(assert (=> b!1546351 m!1425573))

(declare-fun m!1425575 () Bool)

(assert (=> b!1546341 m!1425575))

(declare-fun m!1425577 () Bool)

(assert (=> mapNonEmpty!58693 m!1425577))

(declare-fun m!1425579 () Bool)

(assert (=> b!1546339 m!1425579))

(assert (=> b!1546339 m!1425579))

(declare-fun m!1425581 () Bool)

(assert (=> b!1546339 m!1425581))

(declare-fun m!1425583 () Bool)

(assert (=> b!1546349 m!1425583))

(declare-fun m!1425585 () Bool)

(assert (=> bm!69571 m!1425585))

(declare-fun m!1425587 () Bool)

(assert (=> bm!69568 m!1425587))

(declare-fun m!1425589 () Bool)

(assert (=> start!131954 m!1425589))

(declare-fun m!1425591 () Bool)

(assert (=> start!131954 m!1425591))

(declare-fun m!1425593 () Bool)

(assert (=> start!131954 m!1425593))

(declare-fun m!1425595 () Bool)

(assert (=> b!1546345 m!1425595))

(assert (=> b!1546345 m!1425579))

(declare-fun m!1425597 () Bool)

(assert (=> b!1546345 m!1425597))

(assert (=> b!1546345 m!1425595))

(assert (=> b!1546345 m!1425579))

(declare-fun m!1425599 () Bool)

(assert (=> b!1546345 m!1425599))

(assert (=> b!1546345 m!1425579))

(declare-fun m!1425601 () Bool)

(assert (=> b!1546345 m!1425601))

(assert (=> b!1546345 m!1425599))

(assert (=> b!1546345 m!1425579))

(declare-fun m!1425603 () Bool)

(assert (=> b!1546345 m!1425603))

(assert (=> b!1546345 m!1425579))

(declare-fun m!1425605 () Bool)

(assert (=> b!1546345 m!1425605))

(assert (=> b!1546345 m!1425585))

(assert (=> b!1546345 m!1425579))

(declare-fun m!1425607 () Bool)

(assert (=> b!1546345 m!1425607))

(check-sat (not b!1546351) (not b!1546345) b_and!51109 (not b_next!31717) (not bm!69568) (not mapNonEmpty!58693) tp_is_empty!37993 (not b!1546339) (not start!131954) (not b!1546349) (not bm!69571) (not b!1546341))
(check-sat b_and!51109 (not b_next!31717))
