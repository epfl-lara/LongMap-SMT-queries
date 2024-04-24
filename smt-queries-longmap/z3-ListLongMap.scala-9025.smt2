; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109134 () Bool)

(assert start!109134)

(declare-fun b_free!28423 () Bool)

(declare-fun b_next!28423 () Bool)

(assert (=> start!109134 (= b_free!28423 (not b_next!28423))))

(declare-fun tp!100384 () Bool)

(declare-fun b_and!46509 () Bool)

(assert (=> start!109134 (= tp!100384 b_and!46509)))

(declare-fun b!1287998 () Bool)

(declare-fun res!855176 () Bool)

(declare-fun e!735722 () Bool)

(assert (=> b!1287998 (=> (not res!855176) (not e!735722))))

(declare-datatypes ((array!85211 0))(
  ( (array!85212 (arr!41103 (Array (_ BitVec 32) (_ BitVec 64))) (size!41654 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85211)

(declare-datatypes ((List!29154 0))(
  ( (Nil!29151) (Cons!29150 (h!30368 (_ BitVec 64)) (t!42708 List!29154)) )
))
(declare-fun arrayNoDuplicates!0 (array!85211 (_ BitVec 32) List!29154) Bool)

(assert (=> b!1287998 (= res!855176 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29151))))

(declare-fun b!1287999 () Bool)

(declare-fun call!63073 () Bool)

(assert (=> b!1287999 call!63073))

(declare-datatypes ((Unit!42500 0))(
  ( (Unit!42501) )
))
(declare-fun lt!577925 () Unit!42500)

(declare-fun call!63071 () Unit!42500)

(assert (=> b!1287999 (= lt!577925 call!63071)))

(declare-datatypes ((V!50521 0))(
  ( (V!50522 (val!17106 Int)) )
))
(declare-datatypes ((tuple2!21958 0))(
  ( (tuple2!21959 (_1!10990 (_ BitVec 64)) (_2!10990 V!50521)) )
))
(declare-datatypes ((List!29155 0))(
  ( (Nil!29152) (Cons!29151 (h!30369 tuple2!21958) (t!42709 List!29155)) )
))
(declare-datatypes ((ListLongMap!19623 0))(
  ( (ListLongMap!19624 (toList!9827 List!29155)) )
))
(declare-fun lt!577926 () ListLongMap!19623)

(declare-fun call!63074 () ListLongMap!19623)

(assert (=> b!1287999 (= lt!577926 call!63074)))

(declare-fun e!735726 () Unit!42500)

(assert (=> b!1287999 (= e!735726 lt!577925)))

(declare-fun b!1288000 () Bool)

(declare-fun res!855174 () Bool)

(assert (=> b!1288000 (=> (not res!855174) (not e!735722))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288000 (= res!855174 (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)))))

(declare-fun b!1288001 () Bool)

(declare-fun e!735723 () Unit!42500)

(declare-fun lt!577924 () Unit!42500)

(assert (=> b!1288001 (= e!735723 lt!577924)))

(declare-fun lt!577922 () ListLongMap!19623)

(declare-fun call!63075 () ListLongMap!19623)

(assert (=> b!1288001 (= lt!577922 call!63075)))

(declare-fun lt!577929 () ListLongMap!19623)

(declare-fun zeroValue!1387 () V!50521)

(declare-fun +!4362 (ListLongMap!19623 tuple2!21958) ListLongMap!19623)

(assert (=> b!1288001 (= lt!577929 (+!4362 lt!577922 (tuple2!21959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577921 () Unit!42500)

(declare-fun call!63072 () Unit!42500)

(assert (=> b!1288001 (= lt!577921 call!63072)))

(declare-fun call!63076 () Bool)

(assert (=> b!1288001 call!63076))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!34 ((_ BitVec 64) (_ BitVec 64) V!50521 ListLongMap!19623) Unit!42500)

(assert (=> b!1288001 (= lt!577924 (lemmaInListMapAfterAddingDiffThenInBefore!34 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577922))))

(declare-fun contains!7957 (ListLongMap!19623 (_ BitVec 64)) Bool)

(assert (=> b!1288001 (contains!7957 lt!577922 k0!1205)))

(declare-fun b!1288002 () Bool)

(declare-fun e!735725 () Bool)

(declare-fun tp_is_empty!34063 () Bool)

(assert (=> b!1288002 (= e!735725 tp_is_empty!34063)))

(declare-fun res!855178 () Bool)

(assert (=> start!109134 (=> (not res!855178) (not e!735722))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109134 (= res!855178 (validMask!0 mask!2175))))

(assert (=> start!109134 e!735722))

(assert (=> start!109134 tp_is_empty!34063))

(assert (=> start!109134 true))

(declare-datatypes ((ValueCell!16133 0))(
  ( (ValueCellFull!16133 (v!19703 V!50521)) (EmptyCell!16133) )
))
(declare-datatypes ((array!85213 0))(
  ( (array!85214 (arr!41104 (Array (_ BitVec 32) ValueCell!16133)) (size!41655 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85213)

(declare-fun e!735720 () Bool)

(declare-fun array_inv!31379 (array!85213) Bool)

(assert (=> start!109134 (and (array_inv!31379 _values!1445) e!735720)))

(declare-fun array_inv!31380 (array!85211) Bool)

(assert (=> start!109134 (array_inv!31380 _keys!1741)))

(assert (=> start!109134 tp!100384))

(declare-fun b!1288003 () Bool)

(declare-fun res!855172 () Bool)

(assert (=> b!1288003 (=> (not res!855172) (not e!735722))))

(declare-fun minValue!1387 () V!50521)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4885 (array!85211 array!85213 (_ BitVec 32) (_ BitVec 32) V!50521 V!50521 (_ BitVec 32) Int) ListLongMap!19623)

(assert (=> b!1288003 (= res!855172 (contains!7957 (getCurrentListMap!4885 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288004 () Bool)

(declare-fun res!855171 () Bool)

(assert (=> b!1288004 (=> (not res!855171) (not e!735722))))

(assert (=> b!1288004 (= res!855171 (and (= (size!41655 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41654 _keys!1741) (size!41655 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288005 () Bool)

(declare-fun c!124618 () Bool)

(declare-fun lt!577930 () Bool)

(assert (=> b!1288005 (= c!124618 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577930))))

(declare-fun e!735724 () Unit!42500)

(assert (=> b!1288005 (= e!735726 e!735724)))

(declare-fun bm!63068 () Bool)

(assert (=> bm!63068 (= call!63071 call!63072)))

(declare-fun bm!63069 () Bool)

(assert (=> bm!63069 (= call!63073 call!63076)))

(declare-fun b!1288006 () Bool)

(declare-fun res!855175 () Bool)

(assert (=> b!1288006 (=> (not res!855175) (not e!735722))))

(assert (=> b!1288006 (= res!855175 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41654 _keys!1741))))))

(declare-fun bm!63070 () Bool)

(assert (=> bm!63070 (= call!63074 call!63075)))

(declare-fun b!1288007 () Bool)

(assert (=> b!1288007 (= e!735722 (not true))))

(assert (=> b!1288007 (not (contains!7957 (ListLongMap!19624 Nil!29152) k0!1205))))

(declare-fun lt!577928 () Unit!42500)

(declare-fun emptyContainsNothing!9 ((_ BitVec 64)) Unit!42500)

(assert (=> b!1288007 (= lt!577928 (emptyContainsNothing!9 k0!1205))))

(declare-fun lt!577931 () Unit!42500)

(assert (=> b!1288007 (= lt!577931 e!735723)))

(declare-fun c!124617 () Bool)

(assert (=> b!1288007 (= c!124617 (and (not lt!577930) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1288007 (= lt!577930 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!124619 () Bool)

(declare-fun lt!577927 () ListLongMap!19623)

(declare-fun bm!63071 () Bool)

(assert (=> bm!63071 (= call!63072 (lemmaInListMapAfterAddingDiffThenInBefore!34 k0!1205 (ite c!124617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124619 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124617 minValue!1387 (ite c!124619 zeroValue!1387 minValue!1387)) (ite c!124617 lt!577929 (ite c!124619 lt!577926 lt!577927))))))

(declare-fun b!1288008 () Bool)

(declare-fun e!735719 () Bool)

(assert (=> b!1288008 (= e!735719 tp_is_empty!34063)))

(declare-fun b!1288009 () Bool)

(declare-fun res!855177 () Bool)

(assert (=> b!1288009 (=> (not res!855177) (not e!735722))))

(assert (=> b!1288009 (= res!855177 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41654 _keys!1741))))))

(declare-fun mapIsEmpty!52652 () Bool)

(declare-fun mapRes!52652 () Bool)

(assert (=> mapIsEmpty!52652 mapRes!52652))

(declare-fun mapNonEmpty!52652 () Bool)

(declare-fun tp!100385 () Bool)

(assert (=> mapNonEmpty!52652 (= mapRes!52652 (and tp!100385 e!735725))))

(declare-fun mapKey!52652 () (_ BitVec 32))

(declare-fun mapRest!52652 () (Array (_ BitVec 32) ValueCell!16133))

(declare-fun mapValue!52652 () ValueCell!16133)

(assert (=> mapNonEmpty!52652 (= (arr!41104 _values!1445) (store mapRest!52652 mapKey!52652 mapValue!52652))))

(declare-fun bm!63072 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5997 (array!85211 array!85213 (_ BitVec 32) (_ BitVec 32) V!50521 V!50521 (_ BitVec 32) Int) ListLongMap!19623)

(assert (=> bm!63072 (= call!63075 (getCurrentListMapNoExtraKeys!5997 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288010 () Bool)

(declare-fun Unit!42502 () Unit!42500)

(assert (=> b!1288010 (= e!735724 Unit!42502)))

(declare-fun b!1288011 () Bool)

(assert (=> b!1288011 (= e!735723 e!735726)))

(assert (=> b!1288011 (= c!124619 (and (not lt!577930) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1288012 () Bool)

(declare-fun lt!577923 () Unit!42500)

(assert (=> b!1288012 (= e!735724 lt!577923)))

(assert (=> b!1288012 (= lt!577927 call!63074)))

(assert (=> b!1288012 (= lt!577923 call!63071)))

(assert (=> b!1288012 call!63073))

(declare-fun bm!63073 () Bool)

(assert (=> bm!63073 (= call!63076 (contains!7957 (ite c!124617 lt!577929 (ite c!124619 lt!577926 lt!577927)) k0!1205))))

(declare-fun b!1288013 () Bool)

(assert (=> b!1288013 (= e!735720 (and e!735719 mapRes!52652))))

(declare-fun condMapEmpty!52652 () Bool)

(declare-fun mapDefault!52652 () ValueCell!16133)

(assert (=> b!1288013 (= condMapEmpty!52652 (= (arr!41104 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16133)) mapDefault!52652)))))

(declare-fun b!1288014 () Bool)

(declare-fun res!855173 () Bool)

(assert (=> b!1288014 (=> (not res!855173) (not e!735722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85211 (_ BitVec 32)) Bool)

(assert (=> b!1288014 (= res!855173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109134 res!855178) b!1288004))

(assert (= (and b!1288004 res!855171) b!1288014))

(assert (= (and b!1288014 res!855173) b!1287998))

(assert (= (and b!1287998 res!855176) b!1288006))

(assert (= (and b!1288006 res!855175) b!1288003))

(assert (= (and b!1288003 res!855172) b!1288009))

(assert (= (and b!1288009 res!855177) b!1288000))

(assert (= (and b!1288000 res!855174) b!1288007))

(assert (= (and b!1288007 c!124617) b!1288001))

(assert (= (and b!1288007 (not c!124617)) b!1288011))

(assert (= (and b!1288011 c!124619) b!1287999))

(assert (= (and b!1288011 (not c!124619)) b!1288005))

(assert (= (and b!1288005 c!124618) b!1288012))

(assert (= (and b!1288005 (not c!124618)) b!1288010))

(assert (= (or b!1287999 b!1288012) bm!63070))

(assert (= (or b!1287999 b!1288012) bm!63068))

(assert (= (or b!1287999 b!1288012) bm!63069))

(assert (= (or b!1288001 bm!63070) bm!63072))

(assert (= (or b!1288001 bm!63068) bm!63071))

(assert (= (or b!1288001 bm!63069) bm!63073))

(assert (= (and b!1288013 condMapEmpty!52652) mapIsEmpty!52652))

(assert (= (and b!1288013 (not condMapEmpty!52652)) mapNonEmpty!52652))

(get-info :version)

(assert (= (and mapNonEmpty!52652 ((_ is ValueCellFull!16133) mapValue!52652)) b!1288002))

(assert (= (and b!1288013 ((_ is ValueCellFull!16133) mapDefault!52652)) b!1288008))

(assert (= start!109134 b!1288013))

(declare-fun m!1181341 () Bool)

(assert (=> b!1288007 m!1181341))

(declare-fun m!1181343 () Bool)

(assert (=> b!1288007 m!1181343))

(declare-fun m!1181345 () Bool)

(assert (=> mapNonEmpty!52652 m!1181345))

(declare-fun m!1181347 () Bool)

(assert (=> start!109134 m!1181347))

(declare-fun m!1181349 () Bool)

(assert (=> start!109134 m!1181349))

(declare-fun m!1181351 () Bool)

(assert (=> start!109134 m!1181351))

(declare-fun m!1181353 () Bool)

(assert (=> b!1288000 m!1181353))

(assert (=> b!1288000 m!1181353))

(declare-fun m!1181355 () Bool)

(assert (=> b!1288000 m!1181355))

(declare-fun m!1181357 () Bool)

(assert (=> b!1288014 m!1181357))

(declare-fun m!1181359 () Bool)

(assert (=> bm!63073 m!1181359))

(declare-fun m!1181361 () Bool)

(assert (=> b!1287998 m!1181361))

(declare-fun m!1181363 () Bool)

(assert (=> bm!63071 m!1181363))

(declare-fun m!1181365 () Bool)

(assert (=> bm!63072 m!1181365))

(declare-fun m!1181367 () Bool)

(assert (=> b!1288003 m!1181367))

(assert (=> b!1288003 m!1181367))

(declare-fun m!1181369 () Bool)

(assert (=> b!1288003 m!1181369))

(declare-fun m!1181371 () Bool)

(assert (=> b!1288001 m!1181371))

(declare-fun m!1181373 () Bool)

(assert (=> b!1288001 m!1181373))

(declare-fun m!1181375 () Bool)

(assert (=> b!1288001 m!1181375))

(check-sat (not b!1288014) b_and!46509 (not start!109134) (not b_next!28423) (not bm!63073) (not b!1288007) (not b!1288001) (not mapNonEmpty!52652) (not b!1288000) tp_is_empty!34063 (not bm!63072) (not b!1288003) (not b!1287998) (not bm!63071))
(check-sat b_and!46509 (not b_next!28423))
