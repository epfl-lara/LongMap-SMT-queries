; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132060 () Bool)

(assert start!132060)

(declare-fun b_free!31773 () Bool)

(declare-fun b_next!31773 () Bool)

(assert (=> start!132060 (= b_free!31773 (not b_next!31773))))

(declare-fun tp!111570 () Bool)

(declare-fun b_and!51183 () Bool)

(assert (=> start!132060 (= tp!111570 b_and!51183)))

(declare-fun b!1547993 () Bool)

(declare-fun res!1060927 () Bool)

(declare-fun e!861662 () Bool)

(assert (=> b!1547993 (=> (not res!1060927) (not e!861662))))

(declare-datatypes ((array!103298 0))(
  ( (array!103299 (arr!49851 (Array (_ BitVec 32) (_ BitVec 64))) (size!50401 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103298)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103298 (_ BitVec 32)) Bool)

(assert (=> b!1547993 (= res!1060927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1060926 () Bool)

(assert (=> start!132060 (=> (not res!1060926) (not e!861662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132060 (= res!1060926 (validMask!0 mask!926))))

(assert (=> start!132060 e!861662))

(declare-fun array_inv!38765 (array!103298) Bool)

(assert (=> start!132060 (array_inv!38765 _keys!618)))

(declare-fun tp_is_empty!38049 () Bool)

(assert (=> start!132060 tp_is_empty!38049))

(assert (=> start!132060 true))

(assert (=> start!132060 tp!111570))

(declare-datatypes ((V!59175 0))(
  ( (V!59176 (val!19102 Int)) )
))
(declare-datatypes ((ValueCell!18114 0))(
  ( (ValueCellFull!18114 (v!21903 V!59175)) (EmptyCell!18114) )
))
(declare-datatypes ((array!103300 0))(
  ( (array!103301 (arr!49852 (Array (_ BitVec 32) ValueCell!18114)) (size!50402 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103300)

(declare-fun e!861665 () Bool)

(declare-fun array_inv!38766 (array!103300) Bool)

(assert (=> start!132060 (and (array_inv!38766 _values!470) e!861665)))

(declare-datatypes ((tuple2!24584 0))(
  ( (tuple2!24585 (_1!12303 (_ BitVec 64)) (_2!12303 V!59175)) )
))
(declare-datatypes ((List!36078 0))(
  ( (Nil!36075) (Cons!36074 (h!37519 tuple2!24584) (t!50772 List!36078)) )
))
(declare-datatypes ((ListLongMap!22193 0))(
  ( (ListLongMap!22194 (toList!11112 List!36078)) )
))
(declare-fun call!70029 () ListLongMap!22193)

(declare-fun zeroValue!436 () V!59175)

(declare-fun bm!70022 () Bool)

(declare-fun c!142107 () Bool)

(declare-fun call!70028 () ListLongMap!22193)

(declare-fun minValue!436 () V!59175)

(declare-fun call!70025 () ListLongMap!22193)

(declare-fun c!142108 () Bool)

(declare-fun call!70027 () ListLongMap!22193)

(declare-fun +!4943 (ListLongMap!22193 tuple2!24584) ListLongMap!22193)

(assert (=> bm!70022 (= call!70028 (+!4943 (ite c!142107 call!70029 (ite c!142108 call!70027 call!70025)) (ite (or c!142107 c!142108) (tuple2!24585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547994 () Bool)

(declare-fun e!861659 () Bool)

(assert (=> b!1547994 (= e!861662 e!861659)))

(declare-fun res!1060925 () Bool)

(assert (=> b!1547994 (=> (not res!1060925) (not e!861659))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547994 (= res!1060925 (bvslt from!762 (size!50401 _keys!618)))))

(declare-fun lt!667057 () ListLongMap!22193)

(declare-fun e!861664 () ListLongMap!22193)

(assert (=> b!1547994 (= lt!667057 e!861664)))

(declare-fun lt!667055 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547994 (= c!142107 (and (not lt!667055) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547994 (= lt!667055 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70023 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6569 (array!103298 array!103300 (_ BitVec 32) (_ BitVec 32) V!59175 V!59175 (_ BitVec 32) Int) ListLongMap!22193)

(assert (=> bm!70023 (= call!70029 (getCurrentListMapNoExtraKeys!6569 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547995 () Bool)

(declare-fun res!1060924 () Bool)

(assert (=> b!1547995 (=> (not res!1060924) (not e!861662))))

(assert (=> b!1547995 (= res!1060924 (and (= (size!50402 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50401 _keys!618) (size!50402 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58777 () Bool)

(declare-fun mapRes!58777 () Bool)

(declare-fun tp!111571 () Bool)

(declare-fun e!861658 () Bool)

(assert (=> mapNonEmpty!58777 (= mapRes!58777 (and tp!111571 e!861658))))

(declare-fun mapKey!58777 () (_ BitVec 32))

(declare-fun mapValue!58777 () ValueCell!18114)

(declare-fun mapRest!58777 () (Array (_ BitVec 32) ValueCell!18114))

(assert (=> mapNonEmpty!58777 (= (arr!49852 _values!470) (store mapRest!58777 mapKey!58777 mapValue!58777))))

(declare-fun b!1547996 () Bool)

(declare-fun e!861660 () ListLongMap!22193)

(declare-fun call!70026 () ListLongMap!22193)

(assert (=> b!1547996 (= e!861660 call!70026)))

(declare-fun b!1547997 () Bool)

(declare-fun e!861663 () ListLongMap!22193)

(assert (=> b!1547997 (= e!861663 call!70026)))

(declare-fun b!1547998 () Bool)

(assert (=> b!1547998 (= e!861660 call!70025)))

(declare-fun mapIsEmpty!58777 () Bool)

(assert (=> mapIsEmpty!58777 mapRes!58777))

(declare-fun b!1547999 () Bool)

(assert (=> b!1547999 (= e!861658 tp_is_empty!38049)))

(declare-fun b!1548000 () Bool)

(declare-fun res!1060929 () Bool)

(assert (=> b!1548000 (=> (not res!1060929) (not e!861662))))

(declare-datatypes ((List!36079 0))(
  ( (Nil!36076) (Cons!36075 (h!37520 (_ BitVec 64)) (t!50773 List!36079)) )
))
(declare-fun arrayNoDuplicates!0 (array!103298 (_ BitVec 32) List!36079) Bool)

(assert (=> b!1548000 (= res!1060929 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36076))))

(declare-fun bm!70024 () Bool)

(assert (=> bm!70024 (= call!70027 call!70029)))

(declare-fun b!1548001 () Bool)

(declare-fun res!1060923 () Bool)

(assert (=> b!1548001 (=> (not res!1060923) (not e!861662))))

(assert (=> b!1548001 (= res!1060923 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50401 _keys!618))))))

(declare-fun b!1548002 () Bool)

(declare-fun e!861661 () Bool)

(assert (=> b!1548002 (= e!861661 tp_is_empty!38049)))

(declare-fun b!1548003 () Bool)

(assert (=> b!1548003 (= e!861665 (and e!861661 mapRes!58777))))

(declare-fun condMapEmpty!58777 () Bool)

(declare-fun mapDefault!58777 () ValueCell!18114)

(assert (=> b!1548003 (= condMapEmpty!58777 (= (arr!49852 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18114)) mapDefault!58777)))))

(declare-fun b!1548004 () Bool)

(declare-fun res!1060928 () Bool)

(assert (=> b!1548004 (=> (not res!1060928) (not e!861659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548004 (= res!1060928 (validKeyInArray!0 (select (arr!49851 _keys!618) from!762)))))

(declare-fun b!1548005 () Bool)

(assert (=> b!1548005 (= e!861664 (+!4943 call!70028 (tuple2!24585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548006 () Bool)

(declare-fun c!142109 () Bool)

(assert (=> b!1548006 (= c!142109 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667055))))

(assert (=> b!1548006 (= e!861663 e!861660)))

(declare-fun b!1548007 () Bool)

(assert (=> b!1548007 (= e!861664 e!861663)))

(assert (=> b!1548007 (= c!142108 (and (not lt!667055) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70025 () Bool)

(assert (=> bm!70025 (= call!70026 call!70028)))

(declare-fun b!1548008 () Bool)

(assert (=> b!1548008 (= e!861659 (not true))))

(declare-fun lt!667056 () ListLongMap!22193)

(declare-fun lt!667054 () Bool)

(declare-fun contains!10068 (ListLongMap!22193 (_ BitVec 64)) Bool)

(assert (=> b!1548008 (= lt!667054 (contains!10068 lt!667056 (select (arr!49851 _keys!618) from!762)))))

(declare-fun apply!1061 (ListLongMap!22193 (_ BitVec 64)) V!59175)

(assert (=> b!1548008 (= (apply!1061 (+!4943 lt!667056 (tuple2!24585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49851 _keys!618) from!762)) (apply!1061 lt!667056 (select (arr!49851 _keys!618) from!762)))))

(declare-datatypes ((Unit!51572 0))(
  ( (Unit!51573) )
))
(declare-fun lt!667053 () Unit!51572)

(declare-fun addApplyDifferent!603 (ListLongMap!22193 (_ BitVec 64) V!59175 (_ BitVec 64)) Unit!51572)

(assert (=> b!1548008 (= lt!667053 (addApplyDifferent!603 lt!667056 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49851 _keys!618) from!762)))))

(assert (=> b!1548008 (contains!10068 (+!4943 lt!667056 (tuple2!24585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49851 _keys!618) from!762))))

(declare-fun lt!667058 () Unit!51572)

(declare-fun addStillContains!1256 (ListLongMap!22193 (_ BitVec 64) V!59175 (_ BitVec 64)) Unit!51572)

(assert (=> b!1548008 (= lt!667058 (addStillContains!1256 lt!667056 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49851 _keys!618) from!762)))))

(assert (=> b!1548008 (= lt!667056 (getCurrentListMapNoExtraKeys!6569 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70026 () Bool)

(assert (=> bm!70026 (= call!70025 call!70027)))

(assert (= (and start!132060 res!1060926) b!1547995))

(assert (= (and b!1547995 res!1060924) b!1547993))

(assert (= (and b!1547993 res!1060927) b!1548000))

(assert (= (and b!1548000 res!1060929) b!1548001))

(assert (= (and b!1548001 res!1060923) b!1547994))

(assert (= (and b!1547994 c!142107) b!1548005))

(assert (= (and b!1547994 (not c!142107)) b!1548007))

(assert (= (and b!1548007 c!142108) b!1547997))

(assert (= (and b!1548007 (not c!142108)) b!1548006))

(assert (= (and b!1548006 c!142109) b!1547996))

(assert (= (and b!1548006 (not c!142109)) b!1547998))

(assert (= (or b!1547996 b!1547998) bm!70026))

(assert (= (or b!1547997 bm!70026) bm!70024))

(assert (= (or b!1547997 b!1547996) bm!70025))

(assert (= (or b!1548005 bm!70024) bm!70023))

(assert (= (or b!1548005 bm!70025) bm!70022))

(assert (= (and b!1547994 res!1060925) b!1548004))

(assert (= (and b!1548004 res!1060928) b!1548008))

(assert (= (and b!1548003 condMapEmpty!58777) mapIsEmpty!58777))

(assert (= (and b!1548003 (not condMapEmpty!58777)) mapNonEmpty!58777))

(get-info :version)

(assert (= (and mapNonEmpty!58777 ((_ is ValueCellFull!18114) mapValue!58777)) b!1547999))

(assert (= (and b!1548003 ((_ is ValueCellFull!18114) mapDefault!58777)) b!1548002))

(assert (= start!132060 b!1548003))

(declare-fun m!1427475 () Bool)

(assert (=> b!1548005 m!1427475))

(declare-fun m!1427477 () Bool)

(assert (=> b!1548004 m!1427477))

(assert (=> b!1548004 m!1427477))

(declare-fun m!1427479 () Bool)

(assert (=> b!1548004 m!1427479))

(declare-fun m!1427481 () Bool)

(assert (=> bm!70023 m!1427481))

(declare-fun m!1427483 () Bool)

(assert (=> b!1548000 m!1427483))

(declare-fun m!1427485 () Bool)

(assert (=> b!1548008 m!1427485))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427487 () Bool)

(assert (=> b!1548008 m!1427487))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427489 () Bool)

(assert (=> b!1548008 m!1427489))

(assert (=> b!1548008 m!1427481))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427491 () Bool)

(assert (=> b!1548008 m!1427491))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427493 () Bool)

(assert (=> b!1548008 m!1427493))

(assert (=> b!1548008 m!1427491))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427495 () Bool)

(assert (=> b!1548008 m!1427495))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427497 () Bool)

(assert (=> b!1548008 m!1427497))

(assert (=> b!1548008 m!1427485))

(assert (=> b!1548008 m!1427477))

(declare-fun m!1427499 () Bool)

(assert (=> b!1548008 m!1427499))

(declare-fun m!1427501 () Bool)

(assert (=> mapNonEmpty!58777 m!1427501))

(declare-fun m!1427503 () Bool)

(assert (=> bm!70022 m!1427503))

(declare-fun m!1427505 () Bool)

(assert (=> b!1547993 m!1427505))

(declare-fun m!1427507 () Bool)

(assert (=> start!132060 m!1427507))

(declare-fun m!1427509 () Bool)

(assert (=> start!132060 m!1427509))

(declare-fun m!1427511 () Bool)

(assert (=> start!132060 m!1427511))

(check-sat (not start!132060) (not bm!70022) tp_is_empty!38049 (not mapNonEmpty!58777) (not bm!70023) (not b!1548004) (not b_next!31773) (not b!1547993) (not b!1548008) b_and!51183 (not b!1548005) (not b!1548000))
(check-sat b_and!51183 (not b_next!31773))
