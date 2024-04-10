; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109404 () Bool)

(assert start!109404)

(declare-fun b_free!28893 () Bool)

(declare-fun b_next!28893 () Bool)

(assert (=> start!109404 (= b_free!28893 (not b_next!28893))))

(declare-fun tp!101797 () Bool)

(declare-fun b_and!46983 () Bool)

(assert (=> start!109404 (= tp!101797 b_and!46983)))

(declare-fun b!1295195 () Bool)

(declare-fun res!860799 () Bool)

(declare-fun e!739013 () Bool)

(assert (=> b!1295195 (=> (not res!860799) (not e!739013))))

(declare-datatypes ((V!51147 0))(
  ( (V!51148 (val!17341 Int)) )
))
(declare-fun minValue!1387 () V!51147)

(declare-fun zeroValue!1387 () V!51147)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16368 0))(
  ( (ValueCellFull!16368 (v!19944 V!51147)) (EmptyCell!16368) )
))
(declare-datatypes ((array!86086 0))(
  ( (array!86087 (arr!41544 (Array (_ BitVec 32) ValueCell!16368)) (size!42094 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86086)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86088 0))(
  ( (array!86089 (arr!41545 (Array (_ BitVec 32) (_ BitVec 64))) (size!42095 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86088)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22328 0))(
  ( (tuple2!22329 (_1!11175 (_ BitVec 64)) (_2!11175 V!51147)) )
))
(declare-datatypes ((List!29471 0))(
  ( (Nil!29468) (Cons!29467 (h!30676 tuple2!22328) (t!43035 List!29471)) )
))
(declare-datatypes ((ListLongMap!19985 0))(
  ( (ListLongMap!19986 (toList!10008 List!29471)) )
))
(declare-fun contains!8126 (ListLongMap!19985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5044 (array!86088 array!86086 (_ BitVec 32) (_ BitVec 32) V!51147 V!51147 (_ BitVec 32) Int) ListLongMap!19985)

(assert (=> b!1295195 (= res!860799 (contains!8126 (getCurrentListMap!5044 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53360 () Bool)

(declare-fun mapRes!53360 () Bool)

(declare-fun tp!101798 () Bool)

(declare-fun e!739012 () Bool)

(assert (=> mapNonEmpty!53360 (= mapRes!53360 (and tp!101798 e!739012))))

(declare-fun mapRest!53360 () (Array (_ BitVec 32) ValueCell!16368))

(declare-fun mapValue!53360 () ValueCell!16368)

(declare-fun mapKey!53360 () (_ BitVec 32))

(assert (=> mapNonEmpty!53360 (= (arr!41544 _values!1445) (store mapRest!53360 mapKey!53360 mapValue!53360))))

(declare-fun b!1295196 () Bool)

(declare-fun e!739011 () Bool)

(declare-fun e!739014 () Bool)

(assert (=> b!1295196 (= e!739011 (and e!739014 mapRes!53360))))

(declare-fun condMapEmpty!53360 () Bool)

(declare-fun mapDefault!53360 () ValueCell!16368)

(assert (=> b!1295196 (= condMapEmpty!53360 (= (arr!41544 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16368)) mapDefault!53360)))))

(declare-fun res!860802 () Bool)

(assert (=> start!109404 (=> (not res!860802) (not e!739013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109404 (= res!860802 (validMask!0 mask!2175))))

(assert (=> start!109404 e!739013))

(declare-fun tp_is_empty!34533 () Bool)

(assert (=> start!109404 tp_is_empty!34533))

(assert (=> start!109404 true))

(declare-fun array_inv!31459 (array!86086) Bool)

(assert (=> start!109404 (and (array_inv!31459 _values!1445) e!739011)))

(declare-fun array_inv!31460 (array!86088) Bool)

(assert (=> start!109404 (array_inv!31460 _keys!1741)))

(assert (=> start!109404 tp!101797))

(declare-fun b!1295197 () Bool)

(assert (=> b!1295197 (= e!739012 tp_is_empty!34533)))

(declare-fun b!1295198 () Bool)

(declare-fun res!860794 () Bool)

(assert (=> b!1295198 (=> (not res!860794) (not e!739013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86088 (_ BitVec 32)) Bool)

(assert (=> b!1295198 (= res!860794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295199 () Bool)

(assert (=> b!1295199 (= e!739014 tp_is_empty!34533)))

(declare-fun b!1295200 () Bool)

(declare-fun res!860795 () Bool)

(assert (=> b!1295200 (=> (not res!860795) (not e!739013))))

(assert (=> b!1295200 (= res!860795 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42095 _keys!1741))))))

(declare-fun b!1295201 () Bool)

(declare-fun e!739016 () Bool)

(assert (=> b!1295201 (= e!739013 (not e!739016))))

(declare-fun res!860796 () Bool)

(assert (=> b!1295201 (=> res!860796 e!739016)))

(assert (=> b!1295201 (= res!860796 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295201 (not (contains!8126 (ListLongMap!19986 Nil!29468) k0!1205))))

(declare-datatypes ((Unit!42898 0))(
  ( (Unit!42899) )
))
(declare-fun lt!579839 () Unit!42898)

(declare-fun emptyContainsNothing!169 ((_ BitVec 64)) Unit!42898)

(assert (=> b!1295201 (= lt!579839 (emptyContainsNothing!169 k0!1205))))

(declare-fun b!1295202 () Bool)

(declare-fun res!860800 () Bool)

(assert (=> b!1295202 (=> (not res!860800) (not e!739013))))

(declare-datatypes ((List!29472 0))(
  ( (Nil!29469) (Cons!29468 (h!30677 (_ BitVec 64)) (t!43036 List!29472)) )
))
(declare-fun arrayNoDuplicates!0 (array!86088 (_ BitVec 32) List!29472) Bool)

(assert (=> b!1295202 (= res!860800 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29469))))

(declare-fun b!1295203 () Bool)

(declare-fun res!860798 () Bool)

(assert (=> b!1295203 (=> (not res!860798) (not e!739013))))

(assert (=> b!1295203 (= res!860798 (and (= (size!42094 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42095 _keys!1741) (size!42094 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295204 () Bool)

(assert (=> b!1295204 (= e!739016 true)))

(declare-fun lt!579838 () ListLongMap!19985)

(declare-fun +!4415 (ListLongMap!19985 tuple2!22328) ListLongMap!19985)

(assert (=> b!1295204 (not (contains!8126 (+!4415 lt!579838 (tuple2!22329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579837 () Unit!42898)

(declare-fun addStillNotContains!433 (ListLongMap!19985 (_ BitVec 64) V!51147 (_ BitVec 64)) Unit!42898)

(assert (=> b!1295204 (= lt!579837 (addStillNotContains!433 lt!579838 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6048 (array!86088 array!86086 (_ BitVec 32) (_ BitVec 32) V!51147 V!51147 (_ BitVec 32) Int) ListLongMap!19985)

(assert (=> b!1295204 (= lt!579838 (getCurrentListMapNoExtraKeys!6048 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53360 () Bool)

(assert (=> mapIsEmpty!53360 mapRes!53360))

(declare-fun b!1295205 () Bool)

(declare-fun res!860797 () Bool)

(assert (=> b!1295205 (=> (not res!860797) (not e!739013))))

(assert (=> b!1295205 (= res!860797 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42095 _keys!1741))))))

(declare-fun b!1295206 () Bool)

(declare-fun res!860801 () Bool)

(assert (=> b!1295206 (=> (not res!860801) (not e!739013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295206 (= res!860801 (not (validKeyInArray!0 (select (arr!41545 _keys!1741) from!2144))))))

(assert (= (and start!109404 res!860802) b!1295203))

(assert (= (and b!1295203 res!860798) b!1295198))

(assert (= (and b!1295198 res!860794) b!1295202))

(assert (= (and b!1295202 res!860800) b!1295200))

(assert (= (and b!1295200 res!860795) b!1295195))

(assert (= (and b!1295195 res!860799) b!1295205))

(assert (= (and b!1295205 res!860797) b!1295206))

(assert (= (and b!1295206 res!860801) b!1295201))

(assert (= (and b!1295201 (not res!860796)) b!1295204))

(assert (= (and b!1295196 condMapEmpty!53360) mapIsEmpty!53360))

(assert (= (and b!1295196 (not condMapEmpty!53360)) mapNonEmpty!53360))

(get-info :version)

(assert (= (and mapNonEmpty!53360 ((_ is ValueCellFull!16368) mapValue!53360)) b!1295197))

(assert (= (and b!1295196 ((_ is ValueCellFull!16368) mapDefault!53360)) b!1295199))

(assert (= start!109404 b!1295196))

(declare-fun m!1187239 () Bool)

(assert (=> b!1295202 m!1187239))

(declare-fun m!1187241 () Bool)

(assert (=> b!1295206 m!1187241))

(assert (=> b!1295206 m!1187241))

(declare-fun m!1187243 () Bool)

(assert (=> b!1295206 m!1187243))

(declare-fun m!1187245 () Bool)

(assert (=> b!1295195 m!1187245))

(assert (=> b!1295195 m!1187245))

(declare-fun m!1187247 () Bool)

(assert (=> b!1295195 m!1187247))

(declare-fun m!1187249 () Bool)

(assert (=> b!1295198 m!1187249))

(declare-fun m!1187251 () Bool)

(assert (=> mapNonEmpty!53360 m!1187251))

(declare-fun m!1187253 () Bool)

(assert (=> start!109404 m!1187253))

(declare-fun m!1187255 () Bool)

(assert (=> start!109404 m!1187255))

(declare-fun m!1187257 () Bool)

(assert (=> start!109404 m!1187257))

(declare-fun m!1187259 () Bool)

(assert (=> b!1295204 m!1187259))

(assert (=> b!1295204 m!1187259))

(declare-fun m!1187261 () Bool)

(assert (=> b!1295204 m!1187261))

(declare-fun m!1187263 () Bool)

(assert (=> b!1295204 m!1187263))

(declare-fun m!1187265 () Bool)

(assert (=> b!1295204 m!1187265))

(declare-fun m!1187267 () Bool)

(assert (=> b!1295201 m!1187267))

(declare-fun m!1187269 () Bool)

(assert (=> b!1295201 m!1187269))

(check-sat (not b!1295202) (not b!1295206) (not start!109404) (not b_next!28893) (not mapNonEmpty!53360) tp_is_empty!34533 (not b!1295195) b_and!46983 (not b!1295198) (not b!1295204) (not b!1295201))
(check-sat b_and!46983 (not b_next!28893))
