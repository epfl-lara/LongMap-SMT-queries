; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132350 () Bool)

(assert start!132350)

(declare-fun b_free!31651 () Bool)

(declare-fun b_next!31651 () Bool)

(assert (=> start!132350 (= b_free!31651 (not b_next!31651))))

(declare-fun tp!111205 () Bool)

(declare-fun b_and!51063 () Bool)

(assert (=> start!132350 (= tp!111205 b_and!51063)))

(declare-fun bm!69257 () Bool)

(declare-datatypes ((V!59013 0))(
  ( (V!59014 (val!19041 Int)) )
))
(declare-datatypes ((tuple2!24524 0))(
  ( (tuple2!24525 (_1!12273 (_ BitVec 64)) (_2!12273 V!59013)) )
))
(declare-datatypes ((List!36018 0))(
  ( (Nil!36015) (Cons!36014 (h!37477 tuple2!24524) (t!50704 List!36018)) )
))
(declare-datatypes ((ListLongMap!22141 0))(
  ( (ListLongMap!22142 (toList!11086 List!36018)) )
))
(declare-fun call!69261 () ListLongMap!22141)

(declare-fun zeroValue!436 () V!59013)

(declare-fun c!142359 () Bool)

(declare-fun call!69264 () ListLongMap!22141)

(declare-fun call!69262 () ListLongMap!22141)

(declare-fun call!69263 () ListLongMap!22141)

(declare-fun minValue!436 () V!59013)

(declare-fun c!142358 () Bool)

(declare-fun +!4933 (ListLongMap!22141 tuple2!24524) ListLongMap!22141)

(assert (=> bm!69257 (= call!69263 (+!4933 (ite c!142359 call!69264 (ite c!142358 call!69262 call!69261)) (ite (or c!142359 c!142358) (tuple2!24525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547501 () Bool)

(declare-fun res!1060507 () Bool)

(declare-fun e!861520 () Bool)

(assert (=> b!1547501 (=> (not res!1060507) (not e!861520))))

(declare-datatypes ((array!103182 0))(
  ( (array!103183 (arr!49786 (Array (_ BitVec 32) (_ BitVec 64))) (size!50337 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103182)

(declare-datatypes ((List!36019 0))(
  ( (Nil!36016) (Cons!36015 (h!37478 (_ BitVec 64)) (t!50705 List!36019)) )
))
(declare-fun arrayNoDuplicates!0 (array!103182 (_ BitVec 32) List!36019) Bool)

(assert (=> b!1547501 (= res!1060507 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36016))))

(declare-fun b!1547502 () Bool)

(declare-fun e!861524 () ListLongMap!22141)

(declare-fun call!69260 () ListLongMap!22141)

(assert (=> b!1547502 (= e!861524 call!69260)))

(declare-fun b!1547503 () Bool)

(declare-fun e!861528 () Bool)

(declare-fun e!861521 () Bool)

(declare-fun mapRes!58594 () Bool)

(assert (=> b!1547503 (= e!861528 (and e!861521 mapRes!58594))))

(declare-fun condMapEmpty!58594 () Bool)

(declare-datatypes ((ValueCell!18053 0))(
  ( (ValueCellFull!18053 (v!21834 V!59013)) (EmptyCell!18053) )
))
(declare-datatypes ((array!103184 0))(
  ( (array!103185 (arr!49787 (Array (_ BitVec 32) ValueCell!18053)) (size!50338 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103184)

(declare-fun mapDefault!58594 () ValueCell!18053)

(assert (=> b!1547503 (= condMapEmpty!58594 (= (arr!49787 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18053)) mapDefault!58594)))))

(declare-fun b!1547504 () Bool)

(declare-fun c!142360 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667137 () Bool)

(assert (=> b!1547504 (= c!142360 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667137))))

(declare-fun e!861525 () ListLongMap!22141)

(assert (=> b!1547504 (= e!861525 e!861524)))

(declare-fun b!1547505 () Bool)

(declare-fun res!1060508 () Bool)

(assert (=> b!1547505 (=> (not res!1060508) (not e!861520))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103182 (_ BitVec 32)) Bool)

(assert (=> b!1547505 (= res!1060508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69258 () Bool)

(assert (=> bm!69258 (= call!69260 call!69263)))

(declare-fun b!1547506 () Bool)

(declare-fun tp_is_empty!37927 () Bool)

(assert (=> b!1547506 (= e!861521 tp_is_empty!37927)))

(declare-fun b!1547507 () Bool)

(assert (=> b!1547507 (= e!861525 call!69260)))

(declare-fun b!1547508 () Bool)

(assert (=> b!1547508 (= e!861524 call!69261)))

(declare-fun b!1547509 () Bool)

(declare-fun e!861523 () Bool)

(assert (=> b!1547509 (= e!861523 tp_is_empty!37927)))

(declare-fun bm!69259 () Bool)

(assert (=> bm!69259 (= call!69262 call!69264)))

(declare-fun bm!69260 () Bool)

(assert (=> bm!69260 (= call!69261 call!69262)))

(declare-fun b!1547510 () Bool)

(declare-fun e!861527 () ListLongMap!22141)

(assert (=> b!1547510 (= e!861527 (+!4933 call!69263 (tuple2!24525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1060503 () Bool)

(assert (=> start!132350 (=> (not res!1060503) (not e!861520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132350 (= res!1060503 (validMask!0 mask!926))))

(assert (=> start!132350 e!861520))

(declare-fun array_inv!38989 (array!103182) Bool)

(assert (=> start!132350 (array_inv!38989 _keys!618)))

(assert (=> start!132350 tp_is_empty!37927))

(assert (=> start!132350 true))

(assert (=> start!132350 tp!111205))

(declare-fun array_inv!38990 (array!103184) Bool)

(assert (=> start!132350 (and (array_inv!38990 _values!470) e!861528)))

(declare-fun mapIsEmpty!58594 () Bool)

(assert (=> mapIsEmpty!58594 mapRes!58594))

(declare-fun b!1547511 () Bool)

(declare-fun e!861522 () Bool)

(assert (=> b!1547511 (= e!861520 e!861522)))

(declare-fun res!1060502 () Bool)

(assert (=> b!1547511 (=> (not res!1060502) (not e!861522))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547511 (= res!1060502 (bvslt from!762 (size!50337 _keys!618)))))

(declare-fun lt!667136 () ListLongMap!22141)

(assert (=> b!1547511 (= lt!667136 e!861527)))

(assert (=> b!1547511 (= c!142359 (and (not lt!667137) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547511 (= lt!667137 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547512 () Bool)

(declare-fun res!1060506 () Bool)

(assert (=> b!1547512 (=> (not res!1060506) (not e!861520))))

(assert (=> b!1547512 (= res!1060506 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50337 _keys!618))))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69261 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6570 (array!103182 array!103184 (_ BitVec 32) (_ BitVec 32) V!59013 V!59013 (_ BitVec 32) Int) ListLongMap!22141)

(assert (=> bm!69261 (= call!69264 (getCurrentListMapNoExtraKeys!6570 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547513 () Bool)

(assert (=> b!1547513 (= e!861522 false)))

(declare-fun lt!667138 () Bool)

(declare-fun contains!10074 (ListLongMap!22141 (_ BitVec 64)) Bool)

(assert (=> b!1547513 (= lt!667138 (contains!10074 (getCurrentListMapNoExtraKeys!6570 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49786 _keys!618) from!762)))))

(declare-fun b!1547514 () Bool)

(declare-fun res!1060504 () Bool)

(assert (=> b!1547514 (=> (not res!1060504) (not e!861522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547514 (= res!1060504 (validKeyInArray!0 (select (arr!49786 _keys!618) from!762)))))

(declare-fun b!1547515 () Bool)

(assert (=> b!1547515 (= e!861527 e!861525)))

(assert (=> b!1547515 (= c!142358 (and (not lt!667137) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547516 () Bool)

(declare-fun res!1060505 () Bool)

(assert (=> b!1547516 (=> (not res!1060505) (not e!861520))))

(assert (=> b!1547516 (= res!1060505 (and (= (size!50338 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50337 _keys!618) (size!50338 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58594 () Bool)

(declare-fun tp!111204 () Bool)

(assert (=> mapNonEmpty!58594 (= mapRes!58594 (and tp!111204 e!861523))))

(declare-fun mapKey!58594 () (_ BitVec 32))

(declare-fun mapRest!58594 () (Array (_ BitVec 32) ValueCell!18053))

(declare-fun mapValue!58594 () ValueCell!18053)

(assert (=> mapNonEmpty!58594 (= (arr!49787 _values!470) (store mapRest!58594 mapKey!58594 mapValue!58594))))

(assert (= (and start!132350 res!1060503) b!1547516))

(assert (= (and b!1547516 res!1060505) b!1547505))

(assert (= (and b!1547505 res!1060508) b!1547501))

(assert (= (and b!1547501 res!1060507) b!1547512))

(assert (= (and b!1547512 res!1060506) b!1547511))

(assert (= (and b!1547511 c!142359) b!1547510))

(assert (= (and b!1547511 (not c!142359)) b!1547515))

(assert (= (and b!1547515 c!142358) b!1547507))

(assert (= (and b!1547515 (not c!142358)) b!1547504))

(assert (= (and b!1547504 c!142360) b!1547502))

(assert (= (and b!1547504 (not c!142360)) b!1547508))

(assert (= (or b!1547502 b!1547508) bm!69260))

(assert (= (or b!1547507 bm!69260) bm!69259))

(assert (= (or b!1547507 b!1547502) bm!69258))

(assert (= (or b!1547510 bm!69259) bm!69261))

(assert (= (or b!1547510 bm!69258) bm!69257))

(assert (= (and b!1547511 res!1060502) b!1547514))

(assert (= (and b!1547514 res!1060504) b!1547513))

(assert (= (and b!1547503 condMapEmpty!58594) mapIsEmpty!58594))

(assert (= (and b!1547503 (not condMapEmpty!58594)) mapNonEmpty!58594))

(get-info :version)

(assert (= (and mapNonEmpty!58594 ((_ is ValueCellFull!18053) mapValue!58594)) b!1547509))

(assert (= (and b!1547503 ((_ is ValueCellFull!18053) mapDefault!58594)) b!1547506))

(assert (= start!132350 b!1547503))

(declare-fun m!1427805 () Bool)

(assert (=> b!1547505 m!1427805))

(declare-fun m!1427807 () Bool)

(assert (=> b!1547501 m!1427807))

(declare-fun m!1427809 () Bool)

(assert (=> start!132350 m!1427809))

(declare-fun m!1427811 () Bool)

(assert (=> start!132350 m!1427811))

(declare-fun m!1427813 () Bool)

(assert (=> start!132350 m!1427813))

(declare-fun m!1427815 () Bool)

(assert (=> b!1547510 m!1427815))

(declare-fun m!1427817 () Bool)

(assert (=> bm!69261 m!1427817))

(declare-fun m!1427819 () Bool)

(assert (=> mapNonEmpty!58594 m!1427819))

(declare-fun m!1427821 () Bool)

(assert (=> b!1547514 m!1427821))

(assert (=> b!1547514 m!1427821))

(declare-fun m!1427823 () Bool)

(assert (=> b!1547514 m!1427823))

(declare-fun m!1427825 () Bool)

(assert (=> bm!69257 m!1427825))

(assert (=> b!1547513 m!1427817))

(assert (=> b!1547513 m!1427821))

(assert (=> b!1547513 m!1427817))

(assert (=> b!1547513 m!1427821))

(declare-fun m!1427827 () Bool)

(assert (=> b!1547513 m!1427827))

(check-sat (not b_next!31651) (not b!1547501) (not start!132350) (not bm!69261) (not bm!69257) (not b!1547514) (not b!1547513) tp_is_empty!37927 (not b!1547505) b_and!51063 (not mapNonEmpty!58594) (not b!1547510))
(check-sat b_and!51063 (not b_next!31651))
