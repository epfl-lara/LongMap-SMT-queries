; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132314 () Bool)

(assert start!132314)

(declare-fun b_free!31615 () Bool)

(declare-fun b_next!31615 () Bool)

(assert (=> start!132314 (= b_free!31615 (not b_next!31615))))

(declare-fun tp!111096 () Bool)

(declare-fun b_and!51027 () Bool)

(assert (=> start!132314 (= tp!111096 b_and!51027)))

(declare-fun b!1546741 () Bool)

(declare-datatypes ((V!58965 0))(
  ( (V!58966 (val!19023 Int)) )
))
(declare-datatypes ((tuple2!24492 0))(
  ( (tuple2!24493 (_1!12257 (_ BitVec 64)) (_2!12257 V!58965)) )
))
(declare-datatypes ((List!35987 0))(
  ( (Nil!35984) (Cons!35983 (h!37446 tuple2!24492) (t!50673 List!35987)) )
))
(declare-datatypes ((ListLongMap!22109 0))(
  ( (ListLongMap!22110 (toList!11070 List!35987)) )
))
(declare-fun e!861093 () ListLongMap!22109)

(declare-fun call!68992 () ListLongMap!22109)

(assert (=> b!1546741 (= e!861093 call!68992)))

(declare-fun b!1546742 () Bool)

(declare-fun res!1060232 () Bool)

(declare-fun e!861086 () Bool)

(assert (=> b!1546742 (=> (not res!1060232) (not e!861086))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103114 0))(
  ( (array!103115 (arr!49752 (Array (_ BitVec 32) (_ BitVec 64))) (size!50303 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103114)

(assert (=> b!1546742 (= res!1060232 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50303 _keys!618))))))

(declare-fun b!1546743 () Bool)

(declare-fun e!861088 () ListLongMap!22109)

(assert (=> b!1546743 (= e!861088 call!68992)))

(declare-fun bm!68987 () Bool)

(declare-fun call!68991 () ListLongMap!22109)

(assert (=> bm!68987 (= call!68992 call!68991)))

(declare-fun res!1060230 () Bool)

(assert (=> start!132314 (=> (not res!1060230) (not e!861086))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132314 (= res!1060230 (validMask!0 mask!926))))

(assert (=> start!132314 e!861086))

(declare-fun array_inv!38963 (array!103114) Bool)

(assert (=> start!132314 (array_inv!38963 _keys!618)))

(declare-fun tp_is_empty!37891 () Bool)

(assert (=> start!132314 tp_is_empty!37891))

(assert (=> start!132314 true))

(assert (=> start!132314 tp!111096))

(declare-datatypes ((ValueCell!18035 0))(
  ( (ValueCellFull!18035 (v!21816 V!58965)) (EmptyCell!18035) )
))
(declare-datatypes ((array!103116 0))(
  ( (array!103117 (arr!49753 (Array (_ BitVec 32) ValueCell!18035)) (size!50304 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103116)

(declare-fun e!861092 () Bool)

(declare-fun array_inv!38964 (array!103116) Bool)

(assert (=> start!132314 (and (array_inv!38964 _values!470) e!861092)))

(declare-fun b!1546744 () Bool)

(declare-fun res!1060231 () Bool)

(assert (=> b!1546744 (=> (not res!1060231) (not e!861086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103114 (_ BitVec 32)) Bool)

(assert (=> b!1546744 (= res!1060231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546745 () Bool)

(declare-fun res!1060229 () Bool)

(assert (=> b!1546745 (=> (not res!1060229) (not e!861086))))

(declare-datatypes ((List!35988 0))(
  ( (Nil!35985) (Cons!35984 (h!37447 (_ BitVec 64)) (t!50674 List!35988)) )
))
(declare-fun arrayNoDuplicates!0 (array!103114 (_ BitVec 32) List!35988) Bool)

(assert (=> b!1546745 (= res!1060229 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35985))))

(declare-fun zeroValue!436 () V!58965)

(declare-fun call!68990 () ListLongMap!22109)

(declare-fun call!68993 () ListLongMap!22109)

(declare-fun bm!68988 () Bool)

(declare-fun c!142198 () Bool)

(declare-fun call!68994 () ListLongMap!22109)

(declare-fun minValue!436 () V!58965)

(declare-fun c!142196 () Bool)

(declare-fun +!4917 (ListLongMap!22109 tuple2!24492) ListLongMap!22109)

(assert (=> bm!68988 (= call!68991 (+!4917 (ite c!142198 call!68993 (ite c!142196 call!68990 call!68994)) (ite (or c!142198 c!142196) (tuple2!24493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!68989 () Bool)

(assert (=> bm!68989 (= call!68990 call!68993)))

(declare-fun b!1546746 () Bool)

(assert (=> b!1546746 (= e!861086 false)))

(declare-fun lt!667026 () ListLongMap!22109)

(declare-fun e!861091 () ListLongMap!22109)

(assert (=> b!1546746 (= lt!667026 e!861091)))

(declare-fun lt!667027 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546746 (= c!142198 (and (not lt!667027) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546746 (= lt!667027 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546747 () Bool)

(declare-fun e!861087 () Bool)

(declare-fun mapRes!58540 () Bool)

(assert (=> b!1546747 (= e!861092 (and e!861087 mapRes!58540))))

(declare-fun condMapEmpty!58540 () Bool)

(declare-fun mapDefault!58540 () ValueCell!18035)

(assert (=> b!1546747 (= condMapEmpty!58540 (= (arr!49753 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18035)) mapDefault!58540)))))

(declare-fun b!1546748 () Bool)

(declare-fun c!142197 () Bool)

(assert (=> b!1546748 (= c!142197 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667027))))

(assert (=> b!1546748 (= e!861088 e!861093)))

(declare-fun bm!68990 () Bool)

(assert (=> bm!68990 (= call!68994 call!68990)))

(declare-fun b!1546749 () Bool)

(assert (=> b!1546749 (= e!861091 e!861088)))

(assert (=> b!1546749 (= c!142196 (and (not lt!667027) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!68991 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6558 (array!103114 array!103116 (_ BitVec 32) (_ BitVec 32) V!58965 V!58965 (_ BitVec 32) Int) ListLongMap!22109)

(assert (=> bm!68991 (= call!68993 (getCurrentListMapNoExtraKeys!6558 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546750 () Bool)

(declare-fun res!1060228 () Bool)

(assert (=> b!1546750 (=> (not res!1060228) (not e!861086))))

(assert (=> b!1546750 (= res!1060228 (and (= (size!50304 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50303 _keys!618) (size!50304 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546751 () Bool)

(assert (=> b!1546751 (= e!861091 (+!4917 call!68991 (tuple2!24493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546752 () Bool)

(assert (=> b!1546752 (= e!861093 call!68994)))

(declare-fun b!1546753 () Bool)

(declare-fun e!861089 () Bool)

(assert (=> b!1546753 (= e!861089 tp_is_empty!37891)))

(declare-fun mapIsEmpty!58540 () Bool)

(assert (=> mapIsEmpty!58540 mapRes!58540))

(declare-fun mapNonEmpty!58540 () Bool)

(declare-fun tp!111097 () Bool)

(assert (=> mapNonEmpty!58540 (= mapRes!58540 (and tp!111097 e!861089))))

(declare-fun mapValue!58540 () ValueCell!18035)

(declare-fun mapRest!58540 () (Array (_ BitVec 32) ValueCell!18035))

(declare-fun mapKey!58540 () (_ BitVec 32))

(assert (=> mapNonEmpty!58540 (= (arr!49753 _values!470) (store mapRest!58540 mapKey!58540 mapValue!58540))))

(declare-fun b!1546754 () Bool)

(assert (=> b!1546754 (= e!861087 tp_is_empty!37891)))

(assert (= (and start!132314 res!1060230) b!1546750))

(assert (= (and b!1546750 res!1060228) b!1546744))

(assert (= (and b!1546744 res!1060231) b!1546745))

(assert (= (and b!1546745 res!1060229) b!1546742))

(assert (= (and b!1546742 res!1060232) b!1546746))

(assert (= (and b!1546746 c!142198) b!1546751))

(assert (= (and b!1546746 (not c!142198)) b!1546749))

(assert (= (and b!1546749 c!142196) b!1546743))

(assert (= (and b!1546749 (not c!142196)) b!1546748))

(assert (= (and b!1546748 c!142197) b!1546741))

(assert (= (and b!1546748 (not c!142197)) b!1546752))

(assert (= (or b!1546741 b!1546752) bm!68990))

(assert (= (or b!1546743 bm!68990) bm!68989))

(assert (= (or b!1546743 b!1546741) bm!68987))

(assert (= (or b!1546751 bm!68989) bm!68991))

(assert (= (or b!1546751 bm!68987) bm!68988))

(assert (= (and b!1546747 condMapEmpty!58540) mapIsEmpty!58540))

(assert (= (and b!1546747 (not condMapEmpty!58540)) mapNonEmpty!58540))

(get-info :version)

(assert (= (and mapNonEmpty!58540 ((_ is ValueCellFull!18035) mapValue!58540)) b!1546753))

(assert (= (and b!1546747 ((_ is ValueCellFull!18035) mapDefault!58540)) b!1546754))

(assert (= start!132314 b!1546747))

(declare-fun m!1427481 () Bool)

(assert (=> bm!68988 m!1427481))

(declare-fun m!1427483 () Bool)

(assert (=> bm!68991 m!1427483))

(declare-fun m!1427485 () Bool)

(assert (=> start!132314 m!1427485))

(declare-fun m!1427487 () Bool)

(assert (=> start!132314 m!1427487))

(declare-fun m!1427489 () Bool)

(assert (=> start!132314 m!1427489))

(declare-fun m!1427491 () Bool)

(assert (=> mapNonEmpty!58540 m!1427491))

(declare-fun m!1427493 () Bool)

(assert (=> b!1546751 m!1427493))

(declare-fun m!1427495 () Bool)

(assert (=> b!1546744 m!1427495))

(declare-fun m!1427497 () Bool)

(assert (=> b!1546745 m!1427497))

(check-sat b_and!51027 (not mapNonEmpty!58540) (not bm!68988) (not start!132314) (not b!1546751) tp_is_empty!37891 (not b!1546744) (not b!1546745) (not bm!68991) (not b_next!31615))
(check-sat b_and!51027 (not b_next!31615))
