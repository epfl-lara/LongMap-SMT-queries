; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77600 () Bool)

(assert start!77600)

(declare-fun b_free!16185 () Bool)

(declare-fun b_next!16185 () Bool)

(assert (=> start!77600 (= b_free!16185 (not b_next!16185))))

(declare-fun tp!56816 () Bool)

(declare-fun b_and!26551 () Bool)

(assert (=> start!77600 (= tp!56816 b_and!26551)))

(declare-fun res!610205 () Bool)

(declare-fun e!506754 () Bool)

(assert (=> start!77600 (=> (not res!610205) (not e!506754))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77600 (= res!610205 (validMask!0 mask!1756))))

(assert (=> start!77600 e!506754))

(declare-datatypes ((V!29769 0))(
  ( (V!29770 (val!9352 Int)) )
))
(declare-datatypes ((ValueCell!8820 0))(
  ( (ValueCellFull!8820 (v!11857 V!29769)) (EmptyCell!8820) )
))
(declare-datatypes ((array!53250 0))(
  ( (array!53251 (arr!25584 (Array (_ BitVec 32) ValueCell!8820)) (size!26043 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53250)

(declare-fun e!506757 () Bool)

(declare-fun array_inv!20044 (array!53250) Bool)

(assert (=> start!77600 (and (array_inv!20044 _values!1152) e!506757)))

(assert (=> start!77600 tp!56816))

(assert (=> start!77600 true))

(declare-fun tp_is_empty!18603 () Bool)

(assert (=> start!77600 tp_is_empty!18603))

(declare-datatypes ((array!53252 0))(
  ( (array!53253 (arr!25585 (Array (_ BitVec 32) (_ BitVec 64))) (size!26044 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53252)

(declare-fun array_inv!20045 (array!53252) Bool)

(assert (=> start!77600 (array_inv!20045 _keys!1386)))

(declare-fun b!904371 () Bool)

(declare-fun res!610200 () Bool)

(assert (=> b!904371 (=> (not res!610200) (not e!506754))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29769)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29769)

(declare-datatypes ((tuple2!12148 0))(
  ( (tuple2!12149 (_1!6085 (_ BitVec 64)) (_2!6085 V!29769)) )
))
(declare-datatypes ((List!17966 0))(
  ( (Nil!17963) (Cons!17962 (h!19108 tuple2!12148) (t!25349 List!17966)) )
))
(declare-datatypes ((ListLongMap!10845 0))(
  ( (ListLongMap!10846 (toList!5438 List!17966)) )
))
(declare-fun contains!4486 (ListLongMap!10845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2707 (array!53252 array!53250 (_ BitVec 32) (_ BitVec 32) V!29769 V!29769 (_ BitVec 32) Int) ListLongMap!10845)

(assert (=> b!904371 (= res!610200 (contains!4486 (getCurrentListMap!2707 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904372 () Bool)

(declare-fun res!610201 () Bool)

(assert (=> b!904372 (=> (not res!610201) (not e!506754))))

(declare-datatypes ((List!17967 0))(
  ( (Nil!17964) (Cons!17963 (h!19109 (_ BitVec 64)) (t!25350 List!17967)) )
))
(declare-fun arrayNoDuplicates!0 (array!53252 (_ BitVec 32) List!17967) Bool)

(assert (=> b!904372 (= res!610201 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17964))))

(declare-fun b!904373 () Bool)

(declare-fun res!610202 () Bool)

(assert (=> b!904373 (=> (not res!610202) (not e!506754))))

(assert (=> b!904373 (= res!610202 (and (= (size!26043 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26044 _keys!1386) (size!26043 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904374 () Bool)

(declare-fun res!610208 () Bool)

(assert (=> b!904374 (=> (not res!610208) (not e!506754))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904374 (= res!610208 (and (= (select (arr!25585 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904375 () Bool)

(declare-fun e!506755 () Bool)

(assert (=> b!904375 (= e!506754 (not e!506755))))

(declare-fun res!610203 () Bool)

(assert (=> b!904375 (=> res!610203 e!506755)))

(assert (=> b!904375 (= res!610203 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26044 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904375 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30670 0))(
  ( (Unit!30671) )
))
(declare-fun lt!408218 () Unit!30670)

(declare-fun lemmaKeyInListMapIsInArray!178 (array!53252 array!53250 (_ BitVec 32) (_ BitVec 32) V!29769 V!29769 (_ BitVec 64) Int) Unit!30670)

(assert (=> b!904375 (= lt!408218 (lemmaKeyInListMapIsInArray!178 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29617 () Bool)

(declare-fun mapRes!29617 () Bool)

(declare-fun tp!56817 () Bool)

(declare-fun e!506760 () Bool)

(assert (=> mapNonEmpty!29617 (= mapRes!29617 (and tp!56817 e!506760))))

(declare-fun mapValue!29617 () ValueCell!8820)

(declare-fun mapRest!29617 () (Array (_ BitVec 32) ValueCell!8820))

(declare-fun mapKey!29617 () (_ BitVec 32))

(assert (=> mapNonEmpty!29617 (= (arr!25584 _values!1152) (store mapRest!29617 mapKey!29617 mapValue!29617))))

(declare-fun b!904376 () Bool)

(declare-fun res!610206 () Bool)

(assert (=> b!904376 (=> (not res!610206) (not e!506754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53252 (_ BitVec 32)) Bool)

(assert (=> b!904376 (= res!610206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904377 () Bool)

(assert (=> b!904377 (= e!506760 tp_is_empty!18603)))

(declare-fun b!904378 () Bool)

(declare-fun e!506758 () Bool)

(assert (=> b!904378 (= e!506755 e!506758)))

(declare-fun res!610207 () Bool)

(assert (=> b!904378 (=> res!610207 e!506758)))

(declare-fun lt!408219 () ListLongMap!10845)

(assert (=> b!904378 (= res!610207 (not (contains!4486 lt!408219 k0!1033)))))

(assert (=> b!904378 (= lt!408219 (getCurrentListMap!2707 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904379 () Bool)

(declare-fun e!506756 () Bool)

(assert (=> b!904379 (= e!506757 (and e!506756 mapRes!29617))))

(declare-fun condMapEmpty!29617 () Bool)

(declare-fun mapDefault!29617 () ValueCell!8820)

(assert (=> b!904379 (= condMapEmpty!29617 (= (arr!25584 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8820)) mapDefault!29617)))))

(declare-fun b!904380 () Bool)

(declare-fun res!610204 () Bool)

(assert (=> b!904380 (=> (not res!610204) (not e!506754))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904380 (= res!610204 (inRange!0 i!717 mask!1756))))

(declare-fun b!904381 () Bool)

(assert (=> b!904381 (= e!506756 tp_is_empty!18603)))

(declare-fun mapIsEmpty!29617 () Bool)

(assert (=> mapIsEmpty!29617 mapRes!29617))

(declare-fun b!904382 () Bool)

(assert (=> b!904382 (= e!506758 true)))

(declare-fun lt!408217 () V!29769)

(declare-fun apply!434 (ListLongMap!10845 (_ BitVec 64)) V!29769)

(assert (=> b!904382 (= lt!408217 (apply!434 lt!408219 k0!1033))))

(assert (= (and start!77600 res!610205) b!904373))

(assert (= (and b!904373 res!610202) b!904376))

(assert (= (and b!904376 res!610206) b!904372))

(assert (= (and b!904372 res!610201) b!904371))

(assert (= (and b!904371 res!610200) b!904380))

(assert (= (and b!904380 res!610204) b!904374))

(assert (= (and b!904374 res!610208) b!904375))

(assert (= (and b!904375 (not res!610203)) b!904378))

(assert (= (and b!904378 (not res!610207)) b!904382))

(assert (= (and b!904379 condMapEmpty!29617) mapIsEmpty!29617))

(assert (= (and b!904379 (not condMapEmpty!29617)) mapNonEmpty!29617))

(get-info :version)

(assert (= (and mapNonEmpty!29617 ((_ is ValueCellFull!8820) mapValue!29617)) b!904377))

(assert (= (and b!904379 ((_ is ValueCellFull!8820) mapDefault!29617)) b!904381))

(assert (= start!77600 b!904379))

(declare-fun m!839875 () Bool)

(assert (=> b!904372 m!839875))

(declare-fun m!839877 () Bool)

(assert (=> start!77600 m!839877))

(declare-fun m!839879 () Bool)

(assert (=> start!77600 m!839879))

(declare-fun m!839881 () Bool)

(assert (=> start!77600 m!839881))

(declare-fun m!839883 () Bool)

(assert (=> b!904380 m!839883))

(declare-fun m!839885 () Bool)

(assert (=> b!904375 m!839885))

(declare-fun m!839887 () Bool)

(assert (=> b!904375 m!839887))

(declare-fun m!839889 () Bool)

(assert (=> b!904374 m!839889))

(declare-fun m!839891 () Bool)

(assert (=> b!904382 m!839891))

(declare-fun m!839893 () Bool)

(assert (=> b!904376 m!839893))

(declare-fun m!839895 () Bool)

(assert (=> mapNonEmpty!29617 m!839895))

(declare-fun m!839897 () Bool)

(assert (=> b!904371 m!839897))

(assert (=> b!904371 m!839897))

(declare-fun m!839899 () Bool)

(assert (=> b!904371 m!839899))

(declare-fun m!839901 () Bool)

(assert (=> b!904378 m!839901))

(declare-fun m!839903 () Bool)

(assert (=> b!904378 m!839903))

(check-sat (not b!904380) (not b!904372) (not start!77600) (not mapNonEmpty!29617) tp_is_empty!18603 (not b!904371) (not b_next!16185) b_and!26551 (not b!904376) (not b!904382) (not b!904375) (not b!904378))
(check-sat b_and!26551 (not b_next!16185))
