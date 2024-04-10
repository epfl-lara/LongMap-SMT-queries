; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110054 () Bool)

(assert start!110054)

(declare-fun b_free!29253 () Bool)

(declare-fun b_next!29253 () Bool)

(assert (=> start!110054 (= b_free!29253 (not b_next!29253))))

(declare-fun tp!102910 () Bool)

(declare-fun b_and!47417 () Bool)

(assert (=> start!110054 (= tp!102910 b_and!47417)))

(declare-fun b!1303298 () Bool)

(declare-fun e!743403 () Bool)

(declare-fun e!743399 () Bool)

(assert (=> b!1303298 (= e!743403 (not e!743399))))

(declare-fun res!865619 () Bool)

(assert (=> b!1303298 (=> res!865619 e!743399)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303298 (= res!865619 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51627 0))(
  ( (V!51628 (val!17521 Int)) )
))
(declare-datatypes ((tuple2!22610 0))(
  ( (tuple2!22611 (_1!11316 (_ BitVec 64)) (_2!11316 V!51627)) )
))
(declare-datatypes ((List!29736 0))(
  ( (Nil!29733) (Cons!29732 (h!30941 tuple2!22610) (t!43330 List!29736)) )
))
(declare-datatypes ((ListLongMap!20267 0))(
  ( (ListLongMap!20268 (toList!10149 List!29736)) )
))
(declare-fun contains!8285 (ListLongMap!20267 (_ BitVec 64)) Bool)

(assert (=> b!1303298 (not (contains!8285 (ListLongMap!20268 Nil!29733) k0!1205))))

(declare-datatypes ((Unit!43152 0))(
  ( (Unit!43153) )
))
(declare-fun lt!583215 () Unit!43152)

(declare-fun emptyContainsNothing!214 ((_ BitVec 64)) Unit!43152)

(assert (=> b!1303298 (= lt!583215 (emptyContainsNothing!214 k0!1205))))

(declare-fun b!1303299 () Bool)

(declare-fun res!865615 () Bool)

(assert (=> b!1303299 (=> (not res!865615) (not e!743403))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86802 0))(
  ( (array!86803 (arr!41892 (Array (_ BitVec 32) (_ BitVec 64))) (size!42442 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86802)

(assert (=> b!1303299 (= res!865615 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42442 _keys!1741))))))

(declare-fun b!1303300 () Bool)

(declare-fun res!865614 () Bool)

(assert (=> b!1303300 (=> (not res!865614) (not e!743403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303300 (= res!865614 (not (validKeyInArray!0 (select (arr!41892 _keys!1741) from!2144))))))

(declare-fun b!1303301 () Bool)

(declare-fun e!743402 () Bool)

(declare-fun tp_is_empty!34893 () Bool)

(assert (=> b!1303301 (= e!743402 tp_is_empty!34893)))

(declare-fun mapIsEmpty!53932 () Bool)

(declare-fun mapRes!53932 () Bool)

(assert (=> mapIsEmpty!53932 mapRes!53932))

(declare-fun b!1303302 () Bool)

(declare-fun res!865618 () Bool)

(assert (=> b!1303302 (=> (not res!865618) (not e!743403))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16548 0))(
  ( (ValueCellFull!16548 (v!20137 V!51627)) (EmptyCell!16548) )
))
(declare-datatypes ((array!86804 0))(
  ( (array!86805 (arr!41893 (Array (_ BitVec 32) ValueCell!16548)) (size!42443 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86804)

(assert (=> b!1303302 (= res!865618 (and (= (size!42443 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42442 _keys!1741) (size!42443 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!865616 () Bool)

(assert (=> start!110054 (=> (not res!865616) (not e!743403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110054 (= res!865616 (validMask!0 mask!2175))))

(assert (=> start!110054 e!743403))

(assert (=> start!110054 tp_is_empty!34893))

(assert (=> start!110054 true))

(declare-fun e!743404 () Bool)

(declare-fun array_inv!31685 (array!86804) Bool)

(assert (=> start!110054 (and (array_inv!31685 _values!1445) e!743404)))

(declare-fun array_inv!31686 (array!86802) Bool)

(assert (=> start!110054 (array_inv!31686 _keys!1741)))

(assert (=> start!110054 tp!102910))

(declare-fun b!1303303 () Bool)

(declare-fun res!865612 () Bool)

(assert (=> b!1303303 (=> (not res!865612) (not e!743403))))

(declare-fun minValue!1387 () V!51627)

(declare-fun zeroValue!1387 () V!51627)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5172 (array!86802 array!86804 (_ BitVec 32) (_ BitVec 32) V!51627 V!51627 (_ BitVec 32) Int) ListLongMap!20267)

(assert (=> b!1303303 (= res!865612 (contains!8285 (getCurrentListMap!5172 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303304 () Bool)

(assert (=> b!1303304 (= e!743399 true)))

(declare-fun lt!583216 () tuple2!22610)

(declare-fun lt!583218 () Bool)

(declare-fun lt!583217 () ListLongMap!20267)

(declare-fun +!4474 (ListLongMap!20267 tuple2!22610) ListLongMap!20267)

(assert (=> b!1303304 (= lt!583218 (contains!8285 (+!4474 lt!583217 lt!583216) k0!1205))))

(declare-fun lt!583213 () ListLongMap!20267)

(assert (=> b!1303304 (not (contains!8285 (+!4474 lt!583213 lt!583216) k0!1205))))

(assert (=> b!1303304 (= lt!583216 (tuple2!22611 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!583214 () Unit!43152)

(declare-fun addStillNotContains!471 (ListLongMap!20267 (_ BitVec 64) V!51627 (_ BitVec 64)) Unit!43152)

(assert (=> b!1303304 (= lt!583214 (addStillNotContains!471 lt!583213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303304 (not (contains!8285 lt!583217 k0!1205))))

(assert (=> b!1303304 (= lt!583217 (+!4474 lt!583213 (tuple2!22611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583212 () Unit!43152)

(assert (=> b!1303304 (= lt!583212 (addStillNotContains!471 lt!583213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6107 (array!86802 array!86804 (_ BitVec 32) (_ BitVec 32) V!51627 V!51627 (_ BitVec 32) Int) ListLongMap!20267)

(assert (=> b!1303304 (= lt!583213 (getCurrentListMapNoExtraKeys!6107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303305 () Bool)

(declare-fun res!865613 () Bool)

(assert (=> b!1303305 (=> (not res!865613) (not e!743403))))

(declare-datatypes ((List!29737 0))(
  ( (Nil!29734) (Cons!29733 (h!30942 (_ BitVec 64)) (t!43331 List!29737)) )
))
(declare-fun arrayNoDuplicates!0 (array!86802 (_ BitVec 32) List!29737) Bool)

(assert (=> b!1303305 (= res!865613 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29734))))

(declare-fun b!1303306 () Bool)

(declare-fun res!865620 () Bool)

(assert (=> b!1303306 (=> (not res!865620) (not e!743403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86802 (_ BitVec 32)) Bool)

(assert (=> b!1303306 (= res!865620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303307 () Bool)

(declare-fun res!865617 () Bool)

(assert (=> b!1303307 (=> (not res!865617) (not e!743403))))

(assert (=> b!1303307 (= res!865617 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42442 _keys!1741))))))

(declare-fun b!1303308 () Bool)

(declare-fun e!743401 () Bool)

(assert (=> b!1303308 (= e!743401 tp_is_empty!34893)))

(declare-fun b!1303309 () Bool)

(assert (=> b!1303309 (= e!743404 (and e!743401 mapRes!53932))))

(declare-fun condMapEmpty!53932 () Bool)

(declare-fun mapDefault!53932 () ValueCell!16548)

(assert (=> b!1303309 (= condMapEmpty!53932 (= (arr!41893 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16548)) mapDefault!53932)))))

(declare-fun mapNonEmpty!53932 () Bool)

(declare-fun tp!102909 () Bool)

(assert (=> mapNonEmpty!53932 (= mapRes!53932 (and tp!102909 e!743402))))

(declare-fun mapKey!53932 () (_ BitVec 32))

(declare-fun mapValue!53932 () ValueCell!16548)

(declare-fun mapRest!53932 () (Array (_ BitVec 32) ValueCell!16548))

(assert (=> mapNonEmpty!53932 (= (arr!41893 _values!1445) (store mapRest!53932 mapKey!53932 mapValue!53932))))

(assert (= (and start!110054 res!865616) b!1303302))

(assert (= (and b!1303302 res!865618) b!1303306))

(assert (= (and b!1303306 res!865620) b!1303305))

(assert (= (and b!1303305 res!865613) b!1303299))

(assert (= (and b!1303299 res!865615) b!1303303))

(assert (= (and b!1303303 res!865612) b!1303307))

(assert (= (and b!1303307 res!865617) b!1303300))

(assert (= (and b!1303300 res!865614) b!1303298))

(assert (= (and b!1303298 (not res!865619)) b!1303304))

(assert (= (and b!1303309 condMapEmpty!53932) mapIsEmpty!53932))

(assert (= (and b!1303309 (not condMapEmpty!53932)) mapNonEmpty!53932))

(get-info :version)

(assert (= (and mapNonEmpty!53932 ((_ is ValueCellFull!16548) mapValue!53932)) b!1303301))

(assert (= (and b!1303309 ((_ is ValueCellFull!16548) mapDefault!53932)) b!1303308))

(assert (= start!110054 b!1303309))

(declare-fun m!1194187 () Bool)

(assert (=> mapNonEmpty!53932 m!1194187))

(declare-fun m!1194189 () Bool)

(assert (=> b!1303300 m!1194189))

(assert (=> b!1303300 m!1194189))

(declare-fun m!1194191 () Bool)

(assert (=> b!1303300 m!1194191))

(declare-fun m!1194193 () Bool)

(assert (=> b!1303304 m!1194193))

(declare-fun m!1194195 () Bool)

(assert (=> b!1303304 m!1194195))

(declare-fun m!1194197 () Bool)

(assert (=> b!1303304 m!1194197))

(declare-fun m!1194199 () Bool)

(assert (=> b!1303304 m!1194199))

(assert (=> b!1303304 m!1194197))

(declare-fun m!1194201 () Bool)

(assert (=> b!1303304 m!1194201))

(declare-fun m!1194203 () Bool)

(assert (=> b!1303304 m!1194203))

(declare-fun m!1194205 () Bool)

(assert (=> b!1303304 m!1194205))

(declare-fun m!1194207 () Bool)

(assert (=> b!1303304 m!1194207))

(assert (=> b!1303304 m!1194205))

(declare-fun m!1194209 () Bool)

(assert (=> b!1303304 m!1194209))

(declare-fun m!1194211 () Bool)

(assert (=> start!110054 m!1194211))

(declare-fun m!1194213 () Bool)

(assert (=> start!110054 m!1194213))

(declare-fun m!1194215 () Bool)

(assert (=> start!110054 m!1194215))

(declare-fun m!1194217 () Bool)

(assert (=> b!1303305 m!1194217))

(declare-fun m!1194219 () Bool)

(assert (=> b!1303298 m!1194219))

(declare-fun m!1194221 () Bool)

(assert (=> b!1303298 m!1194221))

(declare-fun m!1194223 () Bool)

(assert (=> b!1303306 m!1194223))

(declare-fun m!1194225 () Bool)

(assert (=> b!1303303 m!1194225))

(assert (=> b!1303303 m!1194225))

(declare-fun m!1194227 () Bool)

(assert (=> b!1303303 m!1194227))

(check-sat tp_is_empty!34893 (not mapNonEmpty!53932) (not b!1303305) b_and!47417 (not b_next!29253) (not start!110054) (not b!1303298) (not b!1303304) (not b!1303300) (not b!1303306) (not b!1303303))
(check-sat b_and!47417 (not b_next!29253))
