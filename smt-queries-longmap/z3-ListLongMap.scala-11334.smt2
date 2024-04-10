; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131910 () Bool)

(assert start!131910)

(declare-fun b_free!31623 () Bool)

(declare-fun b_next!31623 () Bool)

(assert (=> start!131910 (= b_free!31623 (not b_next!31623))))

(declare-fun tp!111121 () Bool)

(declare-fun b_and!51033 () Bool)

(assert (=> start!131910 (= tp!111121 b_and!51033)))

(declare-fun bm!68897 () Bool)

(declare-datatypes ((V!58975 0))(
  ( (V!58976 (val!19027 Int)) )
))
(declare-datatypes ((tuple2!24442 0))(
  ( (tuple2!24443 (_1!12232 (_ BitVec 64)) (_2!12232 V!58975)) )
))
(declare-datatypes ((List!35958 0))(
  ( (Nil!35955) (Cons!35954 (h!37399 tuple2!24442) (t!50652 List!35958)) )
))
(declare-datatypes ((ListLongMap!22051 0))(
  ( (ListLongMap!22052 (toList!11041 List!35958)) )
))
(declare-fun call!68901 () ListLongMap!22051)

(declare-fun call!68903 () ListLongMap!22051)

(assert (=> bm!68897 (= call!68901 call!68903)))

(declare-fun b!1544473 () Bool)

(declare-fun c!141432 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666143 () Bool)

(assert (=> b!1544473 (= c!141432 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666143))))

(declare-fun e!859679 () ListLongMap!22051)

(declare-fun e!859676 () ListLongMap!22051)

(assert (=> b!1544473 (= e!859679 e!859676)))

(declare-fun b!1544474 () Bool)

(declare-fun res!1059429 () Bool)

(declare-fun e!859674 () Bool)

(assert (=> b!1544474 (=> (not res!1059429) (not e!859674))))

(declare-datatypes ((array!103010 0))(
  ( (array!103011 (arr!49707 (Array (_ BitVec 32) (_ BitVec 64))) (size!50257 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103010)

(declare-datatypes ((List!35959 0))(
  ( (Nil!35956) (Cons!35955 (h!37400 (_ BitVec 64)) (t!50653 List!35959)) )
))
(declare-fun arrayNoDuplicates!0 (array!103010 (_ BitVec 32) List!35959) Bool)

(assert (=> b!1544474 (= res!1059429 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35956))))

(declare-fun b!1544475 () Bool)

(declare-fun e!859677 () ListLongMap!22051)

(assert (=> b!1544475 (= e!859677 e!859679)))

(declare-fun c!141433 () Bool)

(assert (=> b!1544475 (= c!141433 (and (not lt!666143) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544476 () Bool)

(declare-fun call!68900 () ListLongMap!22051)

(assert (=> b!1544476 (= e!859676 call!68900)))

(declare-fun b!1544477 () Bool)

(declare-fun e!859675 () Bool)

(declare-fun tp_is_empty!37899 () Bool)

(assert (=> b!1544477 (= e!859675 tp_is_empty!37899)))

(declare-fun b!1544478 () Bool)

(declare-fun e!859678 () Bool)

(declare-fun e!859673 () Bool)

(declare-fun mapRes!58552 () Bool)

(assert (=> b!1544478 (= e!859678 (and e!859673 mapRes!58552))))

(declare-fun condMapEmpty!58552 () Bool)

(declare-datatypes ((ValueCell!18039 0))(
  ( (ValueCellFull!18039 (v!21828 V!58975)) (EmptyCell!18039) )
))
(declare-datatypes ((array!103012 0))(
  ( (array!103013 (arr!49708 (Array (_ BitVec 32) ValueCell!18039)) (size!50258 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103012)

(declare-fun mapDefault!58552 () ValueCell!18039)

(assert (=> b!1544478 (= condMapEmpty!58552 (= (arr!49708 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18039)) mapDefault!58552)))))

(declare-fun c!141434 () Bool)

(declare-fun bm!68899 () Bool)

(declare-fun minValue!436 () V!58975)

(declare-fun call!68902 () ListLongMap!22051)

(declare-fun zeroValue!436 () V!58975)

(declare-fun call!68904 () ListLongMap!22051)

(declare-fun +!4879 (ListLongMap!22051 tuple2!24442) ListLongMap!22051)

(assert (=> bm!68899 (= call!68903 (+!4879 (ite c!141434 call!68902 (ite c!141433 call!68904 call!68900)) (ite (or c!141434 c!141433) (tuple2!24443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544479 () Bool)

(assert (=> b!1544479 (= e!859674 false)))

(declare-fun lt!666142 () ListLongMap!22051)

(assert (=> b!1544479 (= lt!666142 e!859677)))

(assert (=> b!1544479 (= c!141434 (and (not lt!666143) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544479 (= lt!666143 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544480 () Bool)

(assert (=> b!1544480 (= e!859679 call!68901)))

(declare-fun b!1544481 () Bool)

(assert (=> b!1544481 (= e!859676 call!68901)))

(declare-fun mapNonEmpty!58552 () Bool)

(declare-fun tp!111120 () Bool)

(assert (=> mapNonEmpty!58552 (= mapRes!58552 (and tp!111120 e!859675))))

(declare-fun mapValue!58552 () ValueCell!18039)

(declare-fun mapKey!58552 () (_ BitVec 32))

(declare-fun mapRest!58552 () (Array (_ BitVec 32) ValueCell!18039))

(assert (=> mapNonEmpty!58552 (= (arr!49708 _values!470) (store mapRest!58552 mapKey!58552 mapValue!58552))))

(declare-fun res!1059432 () Bool)

(assert (=> start!131910 (=> (not res!1059432) (not e!859674))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131910 (= res!1059432 (validMask!0 mask!926))))

(assert (=> start!131910 e!859674))

(declare-fun array_inv!38667 (array!103010) Bool)

(assert (=> start!131910 (array_inv!38667 _keys!618)))

(assert (=> start!131910 tp_is_empty!37899))

(assert (=> start!131910 true))

(assert (=> start!131910 tp!111121))

(declare-fun array_inv!38668 (array!103012) Bool)

(assert (=> start!131910 (and (array_inv!38668 _values!470) e!859678)))

(declare-fun bm!68898 () Bool)

(assert (=> bm!68898 (= call!68900 call!68904)))

(declare-fun b!1544482 () Bool)

(declare-fun res!1059431 () Bool)

(assert (=> b!1544482 (=> (not res!1059431) (not e!859674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103010 (_ BitVec 32)) Bool)

(assert (=> b!1544482 (= res!1059431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544483 () Bool)

(assert (=> b!1544483 (= e!859673 tp_is_empty!37899)))

(declare-fun b!1544484 () Bool)

(declare-fun res!1059428 () Bool)

(assert (=> b!1544484 (=> (not res!1059428) (not e!859674))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544484 (= res!1059428 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50257 _keys!618))))))

(declare-fun bm!68900 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6513 (array!103010 array!103012 (_ BitVec 32) (_ BitVec 32) V!58975 V!58975 (_ BitVec 32) Int) ListLongMap!22051)

(assert (=> bm!68900 (= call!68902 (getCurrentListMapNoExtraKeys!6513 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!68901 () Bool)

(assert (=> bm!68901 (= call!68904 call!68902)))

(declare-fun b!1544485 () Bool)

(assert (=> b!1544485 (= e!859677 (+!4879 call!68903 (tuple2!24443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544486 () Bool)

(declare-fun res!1059430 () Bool)

(assert (=> b!1544486 (=> (not res!1059430) (not e!859674))))

(assert (=> b!1544486 (= res!1059430 (and (= (size!50258 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50257 _keys!618) (size!50258 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58552 () Bool)

(assert (=> mapIsEmpty!58552 mapRes!58552))

(assert (= (and start!131910 res!1059432) b!1544486))

(assert (= (and b!1544486 res!1059430) b!1544482))

(assert (= (and b!1544482 res!1059431) b!1544474))

(assert (= (and b!1544474 res!1059429) b!1544484))

(assert (= (and b!1544484 res!1059428) b!1544479))

(assert (= (and b!1544479 c!141434) b!1544485))

(assert (= (and b!1544479 (not c!141434)) b!1544475))

(assert (= (and b!1544475 c!141433) b!1544480))

(assert (= (and b!1544475 (not c!141433)) b!1544473))

(assert (= (and b!1544473 c!141432) b!1544481))

(assert (= (and b!1544473 (not c!141432)) b!1544476))

(assert (= (or b!1544481 b!1544476) bm!68898))

(assert (= (or b!1544480 bm!68898) bm!68901))

(assert (= (or b!1544480 b!1544481) bm!68897))

(assert (= (or b!1544485 bm!68901) bm!68900))

(assert (= (or b!1544485 bm!68897) bm!68899))

(assert (= (and b!1544478 condMapEmpty!58552) mapIsEmpty!58552))

(assert (= (and b!1544478 (not condMapEmpty!58552)) mapNonEmpty!58552))

(get-info :version)

(assert (= (and mapNonEmpty!58552 ((_ is ValueCellFull!18039) mapValue!58552)) b!1544477))

(assert (= (and b!1544478 ((_ is ValueCellFull!18039) mapDefault!58552)) b!1544483))

(assert (= start!131910 b!1544478))

(declare-fun m!1425295 () Bool)

(assert (=> start!131910 m!1425295))

(declare-fun m!1425297 () Bool)

(assert (=> start!131910 m!1425297))

(declare-fun m!1425299 () Bool)

(assert (=> start!131910 m!1425299))

(declare-fun m!1425301 () Bool)

(assert (=> bm!68900 m!1425301))

(declare-fun m!1425303 () Bool)

(assert (=> b!1544474 m!1425303))

(declare-fun m!1425305 () Bool)

(assert (=> b!1544485 m!1425305))

(declare-fun m!1425307 () Bool)

(assert (=> b!1544482 m!1425307))

(declare-fun m!1425309 () Bool)

(assert (=> bm!68899 m!1425309))

(declare-fun m!1425311 () Bool)

(assert (=> mapNonEmpty!58552 m!1425311))

(check-sat (not mapNonEmpty!58552) (not start!131910) (not b!1544474) tp_is_empty!37899 (not b_next!31623) (not bm!68899) (not b!1544485) (not bm!68900) b_and!51033 (not b!1544482))
(check-sat b_and!51033 (not b_next!31623))
