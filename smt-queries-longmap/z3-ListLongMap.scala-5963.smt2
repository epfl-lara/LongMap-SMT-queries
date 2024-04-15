; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77586 () Bool)

(assert start!77586)

(declare-fun b_free!16189 () Bool)

(declare-fun b_next!16189 () Bool)

(assert (=> start!77586 (= b_free!16189 (not b_next!16189))))

(declare-fun tp!56829 () Bool)

(declare-fun b_and!26529 () Bool)

(assert (=> start!77586 (= tp!56829 b_and!26529)))

(declare-fun b!904204 () Bool)

(declare-fun e!506650 () Bool)

(assert (=> b!904204 (= e!506650 true)))

(declare-datatypes ((V!29775 0))(
  ( (V!29776 (val!9354 Int)) )
))
(declare-fun lt!408001 () V!29775)

(declare-datatypes ((tuple2!12178 0))(
  ( (tuple2!12179 (_1!6100 (_ BitVec 64)) (_2!6100 V!29775)) )
))
(declare-datatypes ((List!17980 0))(
  ( (Nil!17977) (Cons!17976 (h!19122 tuple2!12178) (t!25354 List!17980)) )
))
(declare-datatypes ((ListLongMap!10865 0))(
  ( (ListLongMap!10866 (toList!5448 List!17980)) )
))
(declare-fun lt!408000 () ListLongMap!10865)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!430 (ListLongMap!10865 (_ BitVec 64)) V!29775)

(assert (=> b!904204 (= lt!408001 (apply!430 lt!408000 k0!1033))))

(declare-fun b!904205 () Bool)

(declare-fun res!610151 () Bool)

(declare-fun e!506651 () Bool)

(assert (=> b!904205 (=> (not res!610151) (not e!506651))))

(declare-datatypes ((ValueCell!8822 0))(
  ( (ValueCellFull!8822 (v!11858 V!29775)) (EmptyCell!8822) )
))
(declare-datatypes ((array!53241 0))(
  ( (array!53242 (arr!25580 (Array (_ BitVec 32) ValueCell!8822)) (size!26041 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53241)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29775)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29775)

(declare-datatypes ((array!53243 0))(
  ( (array!53244 (arr!25581 (Array (_ BitVec 32) (_ BitVec 64))) (size!26042 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53243)

(declare-fun contains!4458 (ListLongMap!10865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2662 (array!53243 array!53241 (_ BitVec 32) (_ BitVec 32) V!29775 V!29775 (_ BitVec 32) Int) ListLongMap!10865)

(assert (=> b!904205 (= res!610151 (contains!4458 (getCurrentListMap!2662 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904206 () Bool)

(declare-fun res!610145 () Bool)

(assert (=> b!904206 (=> (not res!610145) (not e!506651))))

(assert (=> b!904206 (= res!610145 (and (= (size!26041 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26042 _keys!1386) (size!26041 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904208 () Bool)

(declare-fun res!610144 () Bool)

(assert (=> b!904208 (=> (not res!610144) (not e!506651))))

(declare-datatypes ((List!17981 0))(
  ( (Nil!17978) (Cons!17977 (h!19123 (_ BitVec 64)) (t!25355 List!17981)) )
))
(declare-fun arrayNoDuplicates!0 (array!53243 (_ BitVec 32) List!17981) Bool)

(assert (=> b!904208 (= res!610144 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17978))))

(declare-fun b!904209 () Bool)

(declare-fun res!610147 () Bool)

(assert (=> b!904209 (=> (not res!610147) (not e!506651))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904209 (= res!610147 (inRange!0 i!717 mask!1756))))

(declare-fun b!904210 () Bool)

(declare-fun e!506653 () Bool)

(assert (=> b!904210 (= e!506653 e!506650)))

(declare-fun res!610149 () Bool)

(assert (=> b!904210 (=> res!610149 e!506650)))

(assert (=> b!904210 (= res!610149 (not (contains!4458 lt!408000 k0!1033)))))

(assert (=> b!904210 (= lt!408000 (getCurrentListMap!2662 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904211 () Bool)

(declare-fun e!506652 () Bool)

(declare-fun e!506654 () Bool)

(declare-fun mapRes!29623 () Bool)

(assert (=> b!904211 (= e!506652 (and e!506654 mapRes!29623))))

(declare-fun condMapEmpty!29623 () Bool)

(declare-fun mapDefault!29623 () ValueCell!8822)

(assert (=> b!904211 (= condMapEmpty!29623 (= (arr!25580 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8822)) mapDefault!29623)))))

(declare-fun b!904212 () Bool)

(declare-fun e!506649 () Bool)

(declare-fun tp_is_empty!18607 () Bool)

(assert (=> b!904212 (= e!506649 tp_is_empty!18607)))

(declare-fun res!610148 () Bool)

(assert (=> start!77586 (=> (not res!610148) (not e!506651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77586 (= res!610148 (validMask!0 mask!1756))))

(assert (=> start!77586 e!506651))

(declare-fun array_inv!20102 (array!53241) Bool)

(assert (=> start!77586 (and (array_inv!20102 _values!1152) e!506652)))

(assert (=> start!77586 tp!56829))

(assert (=> start!77586 true))

(assert (=> start!77586 tp_is_empty!18607))

(declare-fun array_inv!20103 (array!53243) Bool)

(assert (=> start!77586 (array_inv!20103 _keys!1386)))

(declare-fun b!904207 () Bool)

(declare-fun res!610152 () Bool)

(assert (=> b!904207 (=> (not res!610152) (not e!506651))))

(assert (=> b!904207 (= res!610152 (and (= (select (arr!25581 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29623 () Bool)

(declare-fun tp!56830 () Bool)

(assert (=> mapNonEmpty!29623 (= mapRes!29623 (and tp!56830 e!506649))))

(declare-fun mapRest!29623 () (Array (_ BitVec 32) ValueCell!8822))

(declare-fun mapKey!29623 () (_ BitVec 32))

(declare-fun mapValue!29623 () ValueCell!8822)

(assert (=> mapNonEmpty!29623 (= (arr!25580 _values!1152) (store mapRest!29623 mapKey!29623 mapValue!29623))))

(declare-fun b!904213 () Bool)

(declare-fun res!610146 () Bool)

(assert (=> b!904213 (=> (not res!610146) (not e!506651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53243 (_ BitVec 32)) Bool)

(assert (=> b!904213 (= res!610146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29623 () Bool)

(assert (=> mapIsEmpty!29623 mapRes!29623))

(declare-fun b!904214 () Bool)

(assert (=> b!904214 (= e!506651 (not e!506653))))

(declare-fun res!610150 () Bool)

(assert (=> b!904214 (=> res!610150 e!506653)))

(assert (=> b!904214 (= res!610150 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26042 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904214 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30606 0))(
  ( (Unit!30607) )
))
(declare-fun lt!407999 () Unit!30606)

(declare-fun lemmaKeyInListMapIsInArray!185 (array!53243 array!53241 (_ BitVec 32) (_ BitVec 32) V!29775 V!29775 (_ BitVec 64) Int) Unit!30606)

(assert (=> b!904214 (= lt!407999 (lemmaKeyInListMapIsInArray!185 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904215 () Bool)

(assert (=> b!904215 (= e!506654 tp_is_empty!18607)))

(assert (= (and start!77586 res!610148) b!904206))

(assert (= (and b!904206 res!610145) b!904213))

(assert (= (and b!904213 res!610146) b!904208))

(assert (= (and b!904208 res!610144) b!904205))

(assert (= (and b!904205 res!610151) b!904209))

(assert (= (and b!904209 res!610147) b!904207))

(assert (= (and b!904207 res!610152) b!904214))

(assert (= (and b!904214 (not res!610150)) b!904210))

(assert (= (and b!904210 (not res!610149)) b!904204))

(assert (= (and b!904211 condMapEmpty!29623) mapIsEmpty!29623))

(assert (= (and b!904211 (not condMapEmpty!29623)) mapNonEmpty!29623))

(get-info :version)

(assert (= (and mapNonEmpty!29623 ((_ is ValueCellFull!8822) mapValue!29623)) b!904212))

(assert (= (and b!904211 ((_ is ValueCellFull!8822) mapDefault!29623)) b!904215))

(assert (= start!77586 b!904211))

(declare-fun m!839177 () Bool)

(assert (=> b!904208 m!839177))

(declare-fun m!839179 () Bool)

(assert (=> b!904210 m!839179))

(declare-fun m!839181 () Bool)

(assert (=> b!904210 m!839181))

(declare-fun m!839183 () Bool)

(assert (=> start!77586 m!839183))

(declare-fun m!839185 () Bool)

(assert (=> start!77586 m!839185))

(declare-fun m!839187 () Bool)

(assert (=> start!77586 m!839187))

(declare-fun m!839189 () Bool)

(assert (=> b!904213 m!839189))

(declare-fun m!839191 () Bool)

(assert (=> b!904205 m!839191))

(assert (=> b!904205 m!839191))

(declare-fun m!839193 () Bool)

(assert (=> b!904205 m!839193))

(declare-fun m!839195 () Bool)

(assert (=> b!904209 m!839195))

(declare-fun m!839197 () Bool)

(assert (=> b!904207 m!839197))

(declare-fun m!839199 () Bool)

(assert (=> b!904204 m!839199))

(declare-fun m!839201 () Bool)

(assert (=> b!904214 m!839201))

(declare-fun m!839203 () Bool)

(assert (=> b!904214 m!839203))

(declare-fun m!839205 () Bool)

(assert (=> mapNonEmpty!29623 m!839205))

(check-sat b_and!26529 (not b!904213) (not b!904205) (not b!904208) (not mapNonEmpty!29623) (not b!904204) (not b!904210) (not b!904214) (not b!904209) (not start!77586) tp_is_empty!18607 (not b_next!16189))
(check-sat b_and!26529 (not b_next!16189))
