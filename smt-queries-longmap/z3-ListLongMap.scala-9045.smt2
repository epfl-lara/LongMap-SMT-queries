; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109054 () Bool)

(assert start!109054)

(declare-fun b_free!28543 () Bool)

(declare-fun b_next!28543 () Bool)

(assert (=> start!109054 (= b_free!28543 (not b_next!28543))))

(declare-fun tp!100748 () Bool)

(declare-fun b_and!46615 () Bool)

(assert (=> start!109054 (= tp!100748 b_and!46615)))

(declare-fun b!1288993 () Bool)

(declare-fun res!856205 () Bool)

(declare-fun e!735997 () Bool)

(assert (=> b!1288993 (=> (not res!856205) (not e!735997))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85297 0))(
  ( (array!85298 (arr!41150 (Array (_ BitVec 32) (_ BitVec 64))) (size!41702 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85297)

(assert (=> b!1288993 (= res!856205 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41702 _keys!1741))))))

(declare-fun b!1288994 () Bool)

(declare-fun res!856207 () Bool)

(assert (=> b!1288994 (=> (not res!856207) (not e!735997))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288994 (= res!856207 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41702 _keys!1741))))))

(declare-fun b!1288995 () Bool)

(declare-fun e!735998 () Bool)

(declare-fun tp_is_empty!34183 () Bool)

(assert (=> b!1288995 (= e!735998 tp_is_empty!34183)))

(declare-fun b!1288996 () Bool)

(declare-fun e!735995 () Bool)

(declare-fun e!735994 () Bool)

(declare-fun mapRes!52835 () Bool)

(assert (=> b!1288996 (= e!735995 (and e!735994 mapRes!52835))))

(declare-fun condMapEmpty!52835 () Bool)

(declare-datatypes ((V!50681 0))(
  ( (V!50682 (val!17166 Int)) )
))
(declare-datatypes ((ValueCell!16193 0))(
  ( (ValueCellFull!16193 (v!19768 V!50681)) (EmptyCell!16193) )
))
(declare-datatypes ((array!85299 0))(
  ( (array!85300 (arr!41151 (Array (_ BitVec 32) ValueCell!16193)) (size!41703 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85299)

(declare-fun mapDefault!52835 () ValueCell!16193)

(assert (=> b!1288996 (= condMapEmpty!52835 (= (arr!41151 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16193)) mapDefault!52835)))))

(declare-fun mapIsEmpty!52835 () Bool)

(assert (=> mapIsEmpty!52835 mapRes!52835))

(declare-fun b!1288997 () Bool)

(declare-fun res!856212 () Bool)

(assert (=> b!1288997 (=> (not res!856212) (not e!735997))))

(declare-datatypes ((List!29258 0))(
  ( (Nil!29255) (Cons!29254 (h!30463 (_ BitVec 64)) (t!42814 List!29258)) )
))
(declare-fun arrayNoDuplicates!0 (array!85297 (_ BitVec 32) List!29258) Bool)

(assert (=> b!1288997 (= res!856212 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29255))))

(declare-fun b!1288998 () Bool)

(declare-fun res!856211 () Bool)

(assert (=> b!1288998 (=> (not res!856211) (not e!735997))))

(declare-fun minValue!1387 () V!50681)

(declare-fun zeroValue!1387 () V!50681)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22094 0))(
  ( (tuple2!22095 (_1!11058 (_ BitVec 64)) (_2!11058 V!50681)) )
))
(declare-datatypes ((List!29259 0))(
  ( (Nil!29256) (Cons!29255 (h!30464 tuple2!22094) (t!42815 List!29259)) )
))
(declare-datatypes ((ListLongMap!19751 0))(
  ( (ListLongMap!19752 (toList!9891 List!29259)) )
))
(declare-fun contains!7939 (ListLongMap!19751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4845 (array!85297 array!85299 (_ BitVec 32) (_ BitVec 32) V!50681 V!50681 (_ BitVec 32) Int) ListLongMap!19751)

(assert (=> b!1288998 (= res!856211 (contains!7939 (getCurrentListMap!4845 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288999 () Bool)

(assert (=> b!1288999 (= e!735994 tp_is_empty!34183)))

(declare-fun mapNonEmpty!52835 () Bool)

(declare-fun tp!100749 () Bool)

(assert (=> mapNonEmpty!52835 (= mapRes!52835 (and tp!100749 e!735998))))

(declare-fun mapValue!52835 () ValueCell!16193)

(declare-fun mapKey!52835 () (_ BitVec 32))

(declare-fun mapRest!52835 () (Array (_ BitVec 32) ValueCell!16193))

(assert (=> mapNonEmpty!52835 (= (arr!41151 _values!1445) (store mapRest!52835 mapKey!52835 mapValue!52835))))

(declare-fun b!1289000 () Bool)

(declare-fun e!735999 () Bool)

(assert (=> b!1289000 (= e!735997 (not e!735999))))

(declare-fun res!856208 () Bool)

(assert (=> b!1289000 (=> res!856208 e!735999)))

(assert (=> b!1289000 (= res!856208 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289000 (not (contains!7939 (ListLongMap!19752 Nil!29256) k0!1205))))

(declare-datatypes ((Unit!42486 0))(
  ( (Unit!42487) )
))
(declare-fun lt!577969 () Unit!42486)

(declare-fun emptyContainsNothing!45 ((_ BitVec 64)) Unit!42486)

(assert (=> b!1289000 (= lt!577969 (emptyContainsNothing!45 k0!1205))))

(declare-fun b!1289002 () Bool)

(declare-fun res!856210 () Bool)

(assert (=> b!1289002 (=> (not res!856210) (not e!735997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85297 (_ BitVec 32)) Bool)

(assert (=> b!1289002 (= res!856210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289003 () Bool)

(declare-fun res!856209 () Bool)

(assert (=> b!1289003 (=> (not res!856209) (not e!735997))))

(assert (=> b!1289003 (= res!856209 (and (= (size!41703 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41702 _keys!1741) (size!41703 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289004 () Bool)

(declare-fun res!856206 () Bool)

(assert (=> b!1289004 (=> (not res!856206) (not e!735997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289004 (= res!856206 (not (validKeyInArray!0 (select (arr!41150 _keys!1741) from!2144))))))

(declare-fun b!1289001 () Bool)

(assert (=> b!1289001 (= e!735999 true)))

(declare-fun lt!577967 () ListLongMap!19751)

(declare-fun +!4380 (ListLongMap!19751 tuple2!22094) ListLongMap!19751)

(assert (=> b!1289001 (not (contains!7939 (+!4380 lt!577967 (tuple2!22095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577968 () Unit!42486)

(declare-fun addStillNotContains!357 (ListLongMap!19751 (_ BitVec 64) V!50681 (_ BitVec 64)) Unit!42486)

(assert (=> b!1289001 (= lt!577968 (addStillNotContains!357 lt!577967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6011 (array!85297 array!85299 (_ BitVec 32) (_ BitVec 32) V!50681 V!50681 (_ BitVec 32) Int) ListLongMap!19751)

(assert (=> b!1289001 (= lt!577967 (getCurrentListMapNoExtraKeys!6011 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!856204 () Bool)

(assert (=> start!109054 (=> (not res!856204) (not e!735997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109054 (= res!856204 (validMask!0 mask!2175))))

(assert (=> start!109054 e!735997))

(assert (=> start!109054 tp_is_empty!34183))

(assert (=> start!109054 true))

(declare-fun array_inv!31355 (array!85299) Bool)

(assert (=> start!109054 (and (array_inv!31355 _values!1445) e!735995)))

(declare-fun array_inv!31356 (array!85297) Bool)

(assert (=> start!109054 (array_inv!31356 _keys!1741)))

(assert (=> start!109054 tp!100748))

(assert (= (and start!109054 res!856204) b!1289003))

(assert (= (and b!1289003 res!856209) b!1289002))

(assert (= (and b!1289002 res!856210) b!1288997))

(assert (= (and b!1288997 res!856212) b!1288993))

(assert (= (and b!1288993 res!856205) b!1288998))

(assert (= (and b!1288998 res!856211) b!1288994))

(assert (= (and b!1288994 res!856207) b!1289004))

(assert (= (and b!1289004 res!856206) b!1289000))

(assert (= (and b!1289000 (not res!856208)) b!1289001))

(assert (= (and b!1288996 condMapEmpty!52835) mapIsEmpty!52835))

(assert (= (and b!1288996 (not condMapEmpty!52835)) mapNonEmpty!52835))

(get-info :version)

(assert (= (and mapNonEmpty!52835 ((_ is ValueCellFull!16193) mapValue!52835)) b!1288995))

(assert (= (and b!1288996 ((_ is ValueCellFull!16193) mapDefault!52835)) b!1288999))

(assert (= start!109054 b!1288996))

(declare-fun m!1181103 () Bool)

(assert (=> b!1289001 m!1181103))

(assert (=> b!1289001 m!1181103))

(declare-fun m!1181105 () Bool)

(assert (=> b!1289001 m!1181105))

(declare-fun m!1181107 () Bool)

(assert (=> b!1289001 m!1181107))

(declare-fun m!1181109 () Bool)

(assert (=> b!1289001 m!1181109))

(declare-fun m!1181111 () Bool)

(assert (=> mapNonEmpty!52835 m!1181111))

(declare-fun m!1181113 () Bool)

(assert (=> b!1289000 m!1181113))

(declare-fun m!1181115 () Bool)

(assert (=> b!1289000 m!1181115))

(declare-fun m!1181117 () Bool)

(assert (=> b!1289002 m!1181117))

(declare-fun m!1181119 () Bool)

(assert (=> b!1289004 m!1181119))

(assert (=> b!1289004 m!1181119))

(declare-fun m!1181121 () Bool)

(assert (=> b!1289004 m!1181121))

(declare-fun m!1181123 () Bool)

(assert (=> b!1288998 m!1181123))

(assert (=> b!1288998 m!1181123))

(declare-fun m!1181125 () Bool)

(assert (=> b!1288998 m!1181125))

(declare-fun m!1181127 () Bool)

(assert (=> b!1288997 m!1181127))

(declare-fun m!1181129 () Bool)

(assert (=> start!109054 m!1181129))

(declare-fun m!1181131 () Bool)

(assert (=> start!109054 m!1181131))

(declare-fun m!1181133 () Bool)

(assert (=> start!109054 m!1181133))

(check-sat (not b!1289001) (not start!109054) tp_is_empty!34183 (not mapNonEmpty!52835) (not b!1288997) (not b!1289002) (not b!1289000) b_and!46615 (not b!1289004) (not b_next!28543) (not b!1288998))
(check-sat b_and!46615 (not b_next!28543))
