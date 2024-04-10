; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77582 () Bool)

(assert start!77582)

(declare-fun b_free!16167 () Bool)

(declare-fun b_next!16167 () Bool)

(assert (=> start!77582 (= b_free!16167 (not b_next!16167))))

(declare-fun tp!56763 () Bool)

(declare-fun b_and!26533 () Bool)

(assert (=> start!77582 (= tp!56763 b_and!26533)))

(declare-fun mapIsEmpty!29590 () Bool)

(declare-fun mapRes!29590 () Bool)

(assert (=> mapIsEmpty!29590 mapRes!29590))

(declare-fun b!904047 () Bool)

(declare-fun res!609961 () Bool)

(declare-fun e!506571 () Bool)

(assert (=> b!904047 (=> (not res!609961) (not e!506571))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904047 (= res!609961 (inRange!0 i!717 mask!1756))))

(declare-fun b!904048 () Bool)

(declare-fun e!506565 () Bool)

(declare-fun tp_is_empty!18585 () Bool)

(assert (=> b!904048 (= e!506565 tp_is_empty!18585)))

(declare-fun b!904049 () Bool)

(declare-fun res!609964 () Bool)

(assert (=> b!904049 (=> (not res!609964) (not e!506571))))

(declare-datatypes ((array!53222 0))(
  ( (array!53223 (arr!25570 (Array (_ BitVec 32) (_ BitVec 64))) (size!26029 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53222)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53222 (_ BitVec 32)) Bool)

(assert (=> b!904049 (= res!609964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904050 () Bool)

(declare-fun e!506568 () Bool)

(assert (=> b!904050 (= e!506571 (not e!506568))))

(declare-fun res!609960 () Bool)

(assert (=> b!904050 (=> res!609960 e!506568)))

(assert (=> b!904050 (= res!609960 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26029 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904050 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29745 0))(
  ( (V!29746 (val!9343 Int)) )
))
(declare-datatypes ((ValueCell!8811 0))(
  ( (ValueCellFull!8811 (v!11848 V!29745)) (EmptyCell!8811) )
))
(declare-datatypes ((array!53224 0))(
  ( (array!53225 (arr!25571 (Array (_ BitVec 32) ValueCell!8811)) (size!26030 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53224)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30662 0))(
  ( (Unit!30663) )
))
(declare-fun lt!408136 () Unit!30662)

(declare-fun zeroValue!1094 () V!29745)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29745)

(declare-fun lemmaKeyInListMapIsInArray!174 (array!53222 array!53224 (_ BitVec 32) (_ BitVec 32) V!29745 V!29745 (_ BitVec 64) Int) Unit!30662)

(assert (=> b!904050 (= lt!408136 (lemmaKeyInListMapIsInArray!174 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!609959 () Bool)

(assert (=> start!77582 (=> (not res!609959) (not e!506571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77582 (= res!609959 (validMask!0 mask!1756))))

(assert (=> start!77582 e!506571))

(declare-fun e!506567 () Bool)

(declare-fun array_inv!20036 (array!53224) Bool)

(assert (=> start!77582 (and (array_inv!20036 _values!1152) e!506567)))

(assert (=> start!77582 tp!56763))

(assert (=> start!77582 true))

(assert (=> start!77582 tp_is_empty!18585))

(declare-fun array_inv!20037 (array!53222) Bool)

(assert (=> start!77582 (array_inv!20037 _keys!1386)))

(declare-fun b!904051 () Bool)

(declare-fun e!506570 () Bool)

(assert (=> b!904051 (= e!506570 true)))

(declare-fun lt!408137 () V!29745)

(declare-datatypes ((tuple2!12138 0))(
  ( (tuple2!12139 (_1!6080 (_ BitVec 64)) (_2!6080 V!29745)) )
))
(declare-datatypes ((List!17957 0))(
  ( (Nil!17954) (Cons!17953 (h!19099 tuple2!12138) (t!25340 List!17957)) )
))
(declare-datatypes ((ListLongMap!10835 0))(
  ( (ListLongMap!10836 (toList!5433 List!17957)) )
))
(declare-fun lt!408138 () ListLongMap!10835)

(declare-fun apply!430 (ListLongMap!10835 (_ BitVec 64)) V!29745)

(assert (=> b!904051 (= lt!408137 (apply!430 lt!408138 k0!1033))))

(declare-fun b!904052 () Bool)

(declare-fun res!609957 () Bool)

(assert (=> b!904052 (=> (not res!609957) (not e!506571))))

(assert (=> b!904052 (= res!609957 (and (= (select (arr!25570 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29590 () Bool)

(declare-fun tp!56762 () Bool)

(assert (=> mapNonEmpty!29590 (= mapRes!29590 (and tp!56762 e!506565))))

(declare-fun mapValue!29590 () ValueCell!8811)

(declare-fun mapRest!29590 () (Array (_ BitVec 32) ValueCell!8811))

(declare-fun mapKey!29590 () (_ BitVec 32))

(assert (=> mapNonEmpty!29590 (= (arr!25571 _values!1152) (store mapRest!29590 mapKey!29590 mapValue!29590))))

(declare-fun b!904053 () Bool)

(declare-fun e!506566 () Bool)

(assert (=> b!904053 (= e!506566 tp_is_empty!18585)))

(declare-fun b!904054 () Bool)

(declare-fun res!609963 () Bool)

(assert (=> b!904054 (=> (not res!609963) (not e!506571))))

(assert (=> b!904054 (= res!609963 (and (= (size!26030 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26029 _keys!1386) (size!26030 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904055 () Bool)

(declare-fun res!609958 () Bool)

(assert (=> b!904055 (=> (not res!609958) (not e!506571))))

(declare-datatypes ((List!17958 0))(
  ( (Nil!17955) (Cons!17954 (h!19100 (_ BitVec 64)) (t!25341 List!17958)) )
))
(declare-fun arrayNoDuplicates!0 (array!53222 (_ BitVec 32) List!17958) Bool)

(assert (=> b!904055 (= res!609958 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17955))))

(declare-fun b!904056 () Bool)

(assert (=> b!904056 (= e!506567 (and e!506566 mapRes!29590))))

(declare-fun condMapEmpty!29590 () Bool)

(declare-fun mapDefault!29590 () ValueCell!8811)

(assert (=> b!904056 (= condMapEmpty!29590 (= (arr!25571 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8811)) mapDefault!29590)))))

(declare-fun b!904057 () Bool)

(declare-fun res!609965 () Bool)

(assert (=> b!904057 (=> (not res!609965) (not e!506571))))

(declare-fun contains!4481 (ListLongMap!10835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2702 (array!53222 array!53224 (_ BitVec 32) (_ BitVec 32) V!29745 V!29745 (_ BitVec 32) Int) ListLongMap!10835)

(assert (=> b!904057 (= res!609965 (contains!4481 (getCurrentListMap!2702 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904058 () Bool)

(assert (=> b!904058 (= e!506568 e!506570)))

(declare-fun res!609962 () Bool)

(assert (=> b!904058 (=> res!609962 e!506570)))

(assert (=> b!904058 (= res!609962 (not (contains!4481 lt!408138 k0!1033)))))

(assert (=> b!904058 (= lt!408138 (getCurrentListMap!2702 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77582 res!609959) b!904054))

(assert (= (and b!904054 res!609963) b!904049))

(assert (= (and b!904049 res!609964) b!904055))

(assert (= (and b!904055 res!609958) b!904057))

(assert (= (and b!904057 res!609965) b!904047))

(assert (= (and b!904047 res!609961) b!904052))

(assert (= (and b!904052 res!609957) b!904050))

(assert (= (and b!904050 (not res!609960)) b!904058))

(assert (= (and b!904058 (not res!609962)) b!904051))

(assert (= (and b!904056 condMapEmpty!29590) mapIsEmpty!29590))

(assert (= (and b!904056 (not condMapEmpty!29590)) mapNonEmpty!29590))

(get-info :version)

(assert (= (and mapNonEmpty!29590 ((_ is ValueCellFull!8811) mapValue!29590)) b!904048))

(assert (= (and b!904056 ((_ is ValueCellFull!8811) mapDefault!29590)) b!904053))

(assert (= start!77582 b!904056))

(declare-fun m!839605 () Bool)

(assert (=> b!904050 m!839605))

(declare-fun m!839607 () Bool)

(assert (=> b!904050 m!839607))

(declare-fun m!839609 () Bool)

(assert (=> b!904055 m!839609))

(declare-fun m!839611 () Bool)

(assert (=> b!904049 m!839611))

(declare-fun m!839613 () Bool)

(assert (=> b!904052 m!839613))

(declare-fun m!839615 () Bool)

(assert (=> b!904047 m!839615))

(declare-fun m!839617 () Bool)

(assert (=> b!904058 m!839617))

(declare-fun m!839619 () Bool)

(assert (=> b!904058 m!839619))

(declare-fun m!839621 () Bool)

(assert (=> b!904051 m!839621))

(declare-fun m!839623 () Bool)

(assert (=> start!77582 m!839623))

(declare-fun m!839625 () Bool)

(assert (=> start!77582 m!839625))

(declare-fun m!839627 () Bool)

(assert (=> start!77582 m!839627))

(declare-fun m!839629 () Bool)

(assert (=> mapNonEmpty!29590 m!839629))

(declare-fun m!839631 () Bool)

(assert (=> b!904057 m!839631))

(assert (=> b!904057 m!839631))

(declare-fun m!839633 () Bool)

(assert (=> b!904057 m!839633))

(check-sat (not b!904055) (not b!904058) (not b!904050) (not b!904047) (not mapNonEmpty!29590) b_and!26533 (not b!904057) (not start!77582) (not b_next!16167) (not b!904051) tp_is_empty!18585 (not b!904049))
(check-sat b_and!26533 (not b_next!16167))
