; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77772 () Bool)

(assert start!77772)

(declare-fun b_free!16189 () Bool)

(declare-fun b_next!16189 () Bool)

(assert (=> start!77772 (= b_free!16189 (not b_next!16189))))

(declare-fun tp!56829 () Bool)

(declare-fun b_and!26565 () Bool)

(assert (=> start!77772 (= tp!56829 b_and!26565)))

(declare-fun b!905346 () Bool)

(declare-fun e!507379 () Bool)

(declare-fun e!507384 () Bool)

(declare-fun mapRes!29623 () Bool)

(assert (=> b!905346 (= e!507379 (and e!507384 mapRes!29623))))

(declare-fun condMapEmpty!29623 () Bool)

(declare-datatypes ((V!29775 0))(
  ( (V!29776 (val!9354 Int)) )
))
(declare-datatypes ((ValueCell!8822 0))(
  ( (ValueCellFull!8822 (v!11856 V!29775)) (EmptyCell!8822) )
))
(declare-datatypes ((array!53305 0))(
  ( (array!53306 (arr!25607 (Array (_ BitVec 32) ValueCell!8822)) (size!26067 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53305)

(declare-fun mapDefault!29623 () ValueCell!8822)

(assert (=> b!905346 (= condMapEmpty!29623 (= (arr!25607 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8822)) mapDefault!29623)))))

(declare-fun b!905347 () Bool)

(declare-fun res!610606 () Bool)

(declare-fun e!507383 () Bool)

(assert (=> b!905347 (=> (not res!610606) (not e!507383))))

(declare-datatypes ((array!53307 0))(
  ( (array!53308 (arr!25608 (Array (_ BitVec 32) (_ BitVec 64))) (size!26068 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53307)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53307 (_ BitVec 32)) Bool)

(assert (=> b!905347 (= res!610606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905348 () Bool)

(declare-fun res!610603 () Bool)

(assert (=> b!905348 (=> (not res!610603) (not e!507383))))

(declare-datatypes ((List!17934 0))(
  ( (Nil!17931) (Cons!17930 (h!19082 (_ BitVec 64)) (t!25309 List!17934)) )
))
(declare-fun arrayNoDuplicates!0 (array!53307 (_ BitVec 32) List!17934) Bool)

(assert (=> b!905348 (= res!610603 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17931))))

(declare-fun b!905349 () Bool)

(declare-fun res!610598 () Bool)

(assert (=> b!905349 (=> (not res!610598) (not e!507383))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!905349 (= res!610598 (and (= (size!26067 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26068 _keys!1386) (size!26067 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905350 () Bool)

(declare-fun e!507380 () Bool)

(assert (=> b!905350 (= e!507383 (not e!507380))))

(declare-fun res!610604 () Bool)

(assert (=> b!905350 (=> res!610604 e!507380)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905350 (= res!610604 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26068 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905350 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29775)

(declare-datatypes ((Unit!30678 0))(
  ( (Unit!30679) )
))
(declare-fun lt!408598 () Unit!30678)

(declare-fun minValue!1094 () V!29775)

(declare-fun lemmaKeyInListMapIsInArray!186 (array!53307 array!53305 (_ BitVec 32) (_ BitVec 32) V!29775 V!29775 (_ BitVec 64) Int) Unit!30678)

(assert (=> b!905350 (= lt!408598 (lemmaKeyInListMapIsInArray!186 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!610605 () Bool)

(assert (=> start!77772 (=> (not res!610605) (not e!507383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77772 (= res!610605 (validMask!0 mask!1756))))

(assert (=> start!77772 e!507383))

(declare-fun array_inv!20124 (array!53305) Bool)

(assert (=> start!77772 (and (array_inv!20124 _values!1152) e!507379)))

(assert (=> start!77772 tp!56829))

(assert (=> start!77772 true))

(declare-fun tp_is_empty!18607 () Bool)

(assert (=> start!77772 tp_is_empty!18607))

(declare-fun array_inv!20125 (array!53307) Bool)

(assert (=> start!77772 (array_inv!20125 _keys!1386)))

(declare-fun b!905351 () Bool)

(declare-fun res!610602 () Bool)

(assert (=> b!905351 (=> (not res!610602) (not e!507383))))

(assert (=> b!905351 (= res!610602 (and (= (select (arr!25608 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905352 () Bool)

(declare-fun res!610600 () Bool)

(assert (=> b!905352 (=> (not res!610600) (not e!507383))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905352 (= res!610600 (inRange!0 i!717 mask!1756))))

(declare-fun b!905353 () Bool)

(declare-fun e!507382 () Bool)

(assert (=> b!905353 (= e!507382 tp_is_empty!18607)))

(declare-fun mapNonEmpty!29623 () Bool)

(declare-fun tp!56830 () Bool)

(assert (=> mapNonEmpty!29623 (= mapRes!29623 (and tp!56830 e!507382))))

(declare-fun mapValue!29623 () ValueCell!8822)

(declare-fun mapKey!29623 () (_ BitVec 32))

(declare-fun mapRest!29623 () (Array (_ BitVec 32) ValueCell!8822))

(assert (=> mapNonEmpty!29623 (= (arr!25607 _values!1152) (store mapRest!29623 mapKey!29623 mapValue!29623))))

(declare-fun b!905354 () Bool)

(declare-fun res!610599 () Bool)

(assert (=> b!905354 (=> (not res!610599) (not e!507383))))

(declare-datatypes ((tuple2!12086 0))(
  ( (tuple2!12087 (_1!6054 (_ BitVec 64)) (_2!6054 V!29775)) )
))
(declare-datatypes ((List!17935 0))(
  ( (Nil!17932) (Cons!17931 (h!19083 tuple2!12086) (t!25310 List!17935)) )
))
(declare-datatypes ((ListLongMap!10785 0))(
  ( (ListLongMap!10786 (toList!5408 List!17935)) )
))
(declare-fun contains!4465 (ListLongMap!10785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2676 (array!53307 array!53305 (_ BitVec 32) (_ BitVec 32) V!29775 V!29775 (_ BitVec 32) Int) ListLongMap!10785)

(assert (=> b!905354 (= res!610599 (contains!4465 (getCurrentListMap!2676 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!905355 () Bool)

(assert (=> b!905355 (= e!507384 tp_is_empty!18607)))

(declare-fun b!905356 () Bool)

(declare-fun e!507381 () Bool)

(assert (=> b!905356 (= e!507381 true)))

(declare-fun lt!408597 () V!29775)

(declare-fun lt!408596 () ListLongMap!10785)

(declare-fun apply!434 (ListLongMap!10785 (_ BitVec 64)) V!29775)

(assert (=> b!905356 (= lt!408597 (apply!434 lt!408596 k0!1033))))

(declare-fun b!905357 () Bool)

(assert (=> b!905357 (= e!507380 e!507381)))

(declare-fun res!610601 () Bool)

(assert (=> b!905357 (=> res!610601 e!507381)))

(assert (=> b!905357 (= res!610601 (not (contains!4465 lt!408596 k0!1033)))))

(assert (=> b!905357 (= lt!408596 (getCurrentListMap!2676 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29623 () Bool)

(assert (=> mapIsEmpty!29623 mapRes!29623))

(assert (= (and start!77772 res!610605) b!905349))

(assert (= (and b!905349 res!610598) b!905347))

(assert (= (and b!905347 res!610606) b!905348))

(assert (= (and b!905348 res!610603) b!905354))

(assert (= (and b!905354 res!610599) b!905352))

(assert (= (and b!905352 res!610600) b!905351))

(assert (= (and b!905351 res!610602) b!905350))

(assert (= (and b!905350 (not res!610604)) b!905357))

(assert (= (and b!905357 (not res!610601)) b!905356))

(assert (= (and b!905346 condMapEmpty!29623) mapIsEmpty!29623))

(assert (= (and b!905346 (not condMapEmpty!29623)) mapNonEmpty!29623))

(get-info :version)

(assert (= (and mapNonEmpty!29623 ((_ is ValueCellFull!8822) mapValue!29623)) b!905353))

(assert (= (and b!905346 ((_ is ValueCellFull!8822) mapDefault!29623)) b!905355))

(assert (= start!77772 b!905346))

(declare-fun m!841229 () Bool)

(assert (=> b!905356 m!841229))

(declare-fun m!841231 () Bool)

(assert (=> b!905352 m!841231))

(declare-fun m!841233 () Bool)

(assert (=> b!905350 m!841233))

(declare-fun m!841235 () Bool)

(assert (=> b!905350 m!841235))

(declare-fun m!841237 () Bool)

(assert (=> b!905351 m!841237))

(declare-fun m!841239 () Bool)

(assert (=> start!77772 m!841239))

(declare-fun m!841241 () Bool)

(assert (=> start!77772 m!841241))

(declare-fun m!841243 () Bool)

(assert (=> start!77772 m!841243))

(declare-fun m!841245 () Bool)

(assert (=> mapNonEmpty!29623 m!841245))

(declare-fun m!841247 () Bool)

(assert (=> b!905354 m!841247))

(assert (=> b!905354 m!841247))

(declare-fun m!841249 () Bool)

(assert (=> b!905354 m!841249))

(declare-fun m!841251 () Bool)

(assert (=> b!905348 m!841251))

(declare-fun m!841253 () Bool)

(assert (=> b!905347 m!841253))

(declare-fun m!841255 () Bool)

(assert (=> b!905357 m!841255))

(declare-fun m!841257 () Bool)

(assert (=> b!905357 m!841257))

(check-sat (not b_next!16189) (not b!905347) b_and!26565 tp_is_empty!18607 (not b!905356) (not b!905348) (not start!77772) (not b!905352) (not b!905354) (not b!905350) (not b!905357) (not mapNonEmpty!29623))
(check-sat b_and!26565 (not b_next!16189))
