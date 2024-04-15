; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131852 () Bool)

(assert start!131852)

(declare-fun b_free!31615 () Bool)

(declare-fun b_next!31615 () Bool)

(assert (=> start!131852 (= b_free!31615 (not b_next!31615))))

(declare-fun tp!111097 () Bool)

(declare-fun b_and!51007 () Bool)

(assert (=> start!131852 (= tp!111097 b_and!51007)))

(declare-fun bm!68802 () Bool)

(declare-datatypes ((V!58965 0))(
  ( (V!58966 (val!19023 Int)) )
))
(declare-datatypes ((tuple2!24506 0))(
  ( (tuple2!24507 (_1!12264 (_ BitVec 64)) (_2!12264 V!58965)) )
))
(declare-datatypes ((List!35994 0))(
  ( (Nil!35991) (Cons!35990 (h!37436 tuple2!24506) (t!50680 List!35994)) )
))
(declare-datatypes ((ListLongMap!22115 0))(
  ( (ListLongMap!22116 (toList!11073 List!35994)) )
))
(declare-fun call!68808 () ListLongMap!22115)

(declare-fun call!68805 () ListLongMap!22115)

(assert (=> bm!68802 (= call!68808 call!68805)))

(declare-fun b!1543992 () Bool)

(declare-fun e!859386 () ListLongMap!22115)

(declare-fun call!68806 () ListLongMap!22115)

(assert (=> b!1543992 (= e!859386 call!68806)))

(declare-fun b!1543993 () Bool)

(declare-fun e!859380 () ListLongMap!22115)

(assert (=> b!1543993 (= e!859380 call!68806)))

(declare-fun b!1543994 () Bool)

(declare-fun e!859383 () ListLongMap!22115)

(declare-fun call!68809 () ListLongMap!22115)

(declare-fun minValue!436 () V!58965)

(declare-fun +!4906 (ListLongMap!22115 tuple2!24506) ListLongMap!22115)

(assert (=> b!1543994 (= e!859383 (+!4906 call!68809 (tuple2!24507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58540 () Bool)

(declare-fun mapRes!58540 () Bool)

(assert (=> mapIsEmpty!58540 mapRes!58540))

(declare-fun bm!68803 () Bool)

(assert (=> bm!68803 (= call!68806 call!68809)))

(declare-fun b!1543995 () Bool)

(declare-fun e!859379 () Bool)

(declare-fun tp_is_empty!37891 () Bool)

(assert (=> b!1543995 (= e!859379 tp_is_empty!37891)))

(declare-fun b!1543996 () Bool)

(declare-fun res!1059241 () Bool)

(declare-fun e!859381 () Bool)

(assert (=> b!1543996 (=> (not res!1059241) (not e!859381))))

(declare-datatypes ((array!102922 0))(
  ( (array!102923 (arr!49664 (Array (_ BitVec 32) (_ BitVec 64))) (size!50216 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102922)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102922 (_ BitVec 32)) Bool)

(assert (=> b!1543996 (= res!1059241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543998 () Bool)

(declare-fun res!1059242 () Bool)

(assert (=> b!1543998 (=> (not res!1059242) (not e!859381))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18035 0))(
  ( (ValueCellFull!18035 (v!21820 V!58965)) (EmptyCell!18035) )
))
(declare-datatypes ((array!102924 0))(
  ( (array!102925 (arr!49665 (Array (_ BitVec 32) ValueCell!18035)) (size!50217 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102924)

(assert (=> b!1543998 (= res!1059242 (and (= (size!50217 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50216 _keys!618) (size!50217 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!58965)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!68804 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6541 (array!102922 array!102924 (_ BitVec 32) (_ BitVec 32) V!58965 V!58965 (_ BitVec 32) Int) ListLongMap!22115)

(assert (=> bm!68804 (= call!68805 (getCurrentListMapNoExtraKeys!6541 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1543999 () Bool)

(declare-fun res!1059239 () Bool)

(assert (=> b!1543999 (=> (not res!1059239) (not e!859381))))

(assert (=> b!1543999 (= res!1059239 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50216 _keys!618))))))

(declare-fun b!1544000 () Bool)

(declare-fun call!68807 () ListLongMap!22115)

(assert (=> b!1544000 (= e!859386 call!68807)))

(declare-fun b!1544001 () Bool)

(declare-fun e!859382 () Bool)

(assert (=> b!1544001 (= e!859382 tp_is_empty!37891)))

(declare-fun bm!68805 () Bool)

(declare-fun c!141307 () Bool)

(declare-fun c!141308 () Bool)

(assert (=> bm!68805 (= call!68809 (+!4906 (ite c!141307 call!68805 (ite c!141308 call!68808 call!68807)) (ite (or c!141307 c!141308) (tuple2!24507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544002 () Bool)

(declare-fun res!1059243 () Bool)

(assert (=> b!1544002 (=> (not res!1059243) (not e!859381))))

(declare-datatypes ((List!35995 0))(
  ( (Nil!35992) (Cons!35991 (h!37437 (_ BitVec 64)) (t!50681 List!35995)) )
))
(declare-fun arrayNoDuplicates!0 (array!102922 (_ BitVec 32) List!35995) Bool)

(assert (=> b!1544002 (= res!1059243 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35992))))

(declare-fun b!1544003 () Bool)

(declare-fun e!859385 () Bool)

(assert (=> b!1544003 (= e!859385 (and e!859382 mapRes!58540))))

(declare-fun condMapEmpty!58540 () Bool)

(declare-fun mapDefault!58540 () ValueCell!18035)

(assert (=> b!1544003 (= condMapEmpty!58540 (= (arr!49665 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18035)) mapDefault!58540)))))

(declare-fun bm!68806 () Bool)

(assert (=> bm!68806 (= call!68807 call!68808)))

(declare-fun mapNonEmpty!58540 () Bool)

(declare-fun tp!111098 () Bool)

(assert (=> mapNonEmpty!58540 (= mapRes!58540 (and tp!111098 e!859379))))

(declare-fun mapRest!58540 () (Array (_ BitVec 32) ValueCell!18035))

(declare-fun mapValue!58540 () ValueCell!18035)

(declare-fun mapKey!58540 () (_ BitVec 32))

(assert (=> mapNonEmpty!58540 (= (arr!49665 _values!470) (store mapRest!58540 mapKey!58540 mapValue!58540))))

(declare-fun b!1544004 () Bool)

(assert (=> b!1544004 (= e!859381 false)))

(declare-fun lt!665832 () ListLongMap!22115)

(assert (=> b!1544004 (= lt!665832 e!859383)))

(declare-fun lt!665833 () Bool)

(assert (=> b!1544004 (= c!141307 (and (not lt!665833) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544004 (= lt!665833 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544005 () Bool)

(declare-fun c!141309 () Bool)

(assert (=> b!1544005 (= c!141309 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665833))))

(assert (=> b!1544005 (= e!859380 e!859386)))

(declare-fun b!1543997 () Bool)

(assert (=> b!1543997 (= e!859383 e!859380)))

(assert (=> b!1543997 (= c!141308 (and (not lt!665833) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1059240 () Bool)

(assert (=> start!131852 (=> (not res!1059240) (not e!859381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131852 (= res!1059240 (validMask!0 mask!926))))

(assert (=> start!131852 e!859381))

(declare-fun array_inv!38827 (array!102922) Bool)

(assert (=> start!131852 (array_inv!38827 _keys!618)))

(assert (=> start!131852 tp_is_empty!37891))

(assert (=> start!131852 true))

(assert (=> start!131852 tp!111097))

(declare-fun array_inv!38828 (array!102924) Bool)

(assert (=> start!131852 (and (array_inv!38828 _values!470) e!859385)))

(assert (= (and start!131852 res!1059240) b!1543998))

(assert (= (and b!1543998 res!1059242) b!1543996))

(assert (= (and b!1543996 res!1059241) b!1544002))

(assert (= (and b!1544002 res!1059243) b!1543999))

(assert (= (and b!1543999 res!1059239) b!1544004))

(assert (= (and b!1544004 c!141307) b!1543994))

(assert (= (and b!1544004 (not c!141307)) b!1543997))

(assert (= (and b!1543997 c!141308) b!1543993))

(assert (= (and b!1543997 (not c!141308)) b!1544005))

(assert (= (and b!1544005 c!141309) b!1543992))

(assert (= (and b!1544005 (not c!141309)) b!1544000))

(assert (= (or b!1543992 b!1544000) bm!68806))

(assert (= (or b!1543993 bm!68806) bm!68802))

(assert (= (or b!1543993 b!1543992) bm!68803))

(assert (= (or b!1543994 bm!68802) bm!68804))

(assert (= (or b!1543994 bm!68803) bm!68805))

(assert (= (and b!1544003 condMapEmpty!58540) mapIsEmpty!58540))

(assert (= (and b!1544003 (not condMapEmpty!58540)) mapNonEmpty!58540))

(get-info :version)

(assert (= (and mapNonEmpty!58540 ((_ is ValueCellFull!18035) mapValue!58540)) b!1543995))

(assert (= (and b!1544003 ((_ is ValueCellFull!18035) mapDefault!58540)) b!1544001))

(assert (= start!131852 b!1544003))

(declare-fun m!1424331 () Bool)

(assert (=> mapNonEmpty!58540 m!1424331))

(declare-fun m!1424333 () Bool)

(assert (=> start!131852 m!1424333))

(declare-fun m!1424335 () Bool)

(assert (=> start!131852 m!1424335))

(declare-fun m!1424337 () Bool)

(assert (=> start!131852 m!1424337))

(declare-fun m!1424339 () Bool)

(assert (=> b!1543994 m!1424339))

(declare-fun m!1424341 () Bool)

(assert (=> bm!68805 m!1424341))

(declare-fun m!1424343 () Bool)

(assert (=> b!1543996 m!1424343))

(declare-fun m!1424345 () Bool)

(assert (=> b!1544002 m!1424345))

(declare-fun m!1424347 () Bool)

(assert (=> bm!68804 m!1424347))

(check-sat (not b!1543994) (not b_next!31615) (not b!1543996) (not bm!68804) (not start!131852) (not bm!68805) tp_is_empty!37891 b_and!51007 (not mapNonEmpty!58540) (not b!1544002))
(check-sat b_and!51007 (not b_next!31615))
