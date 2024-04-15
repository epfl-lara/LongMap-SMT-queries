; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77580 () Bool)

(assert start!77580)

(declare-fun b_free!16183 () Bool)

(declare-fun b_next!16183 () Bool)

(assert (=> start!77580 (= b_free!16183 (not b_next!16183))))

(declare-fun tp!56811 () Bool)

(declare-fun b_and!26523 () Bool)

(assert (=> start!77580 (= tp!56811 b_and!26523)))

(declare-fun mapNonEmpty!29614 () Bool)

(declare-fun mapRes!29614 () Bool)

(declare-fun tp!56812 () Bool)

(declare-fun e!506589 () Bool)

(assert (=> mapNonEmpty!29614 (= mapRes!29614 (and tp!56812 e!506589))))

(declare-datatypes ((V!29767 0))(
  ( (V!29768 (val!9351 Int)) )
))
(declare-datatypes ((ValueCell!8819 0))(
  ( (ValueCellFull!8819 (v!11855 V!29767)) (EmptyCell!8819) )
))
(declare-datatypes ((array!53229 0))(
  ( (array!53230 (arr!25574 (Array (_ BitVec 32) ValueCell!8819)) (size!26035 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53229)

(declare-fun mapValue!29614 () ValueCell!8819)

(declare-fun mapRest!29614 () (Array (_ BitVec 32) ValueCell!8819))

(declare-fun mapKey!29614 () (_ BitVec 32))

(assert (=> mapNonEmpty!29614 (= (arr!25574 _values!1152) (store mapRest!29614 mapKey!29614 mapValue!29614))))

(declare-fun res!610068 () Bool)

(declare-fun e!506587 () Bool)

(assert (=> start!77580 (=> (not res!610068) (not e!506587))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77580 (= res!610068 (validMask!0 mask!1756))))

(assert (=> start!77580 e!506587))

(declare-fun e!506586 () Bool)

(declare-fun array_inv!20096 (array!53229) Bool)

(assert (=> start!77580 (and (array_inv!20096 _values!1152) e!506586)))

(assert (=> start!77580 tp!56811))

(assert (=> start!77580 true))

(declare-fun tp_is_empty!18601 () Bool)

(assert (=> start!77580 tp_is_empty!18601))

(declare-datatypes ((array!53231 0))(
  ( (array!53232 (arr!25575 (Array (_ BitVec 32) (_ BitVec 64))) (size!26036 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53231)

(declare-fun array_inv!20097 (array!53231) Bool)

(assert (=> start!77580 (array_inv!20097 _keys!1386)))

(declare-fun mapIsEmpty!29614 () Bool)

(assert (=> mapIsEmpty!29614 mapRes!29614))

(declare-fun b!904096 () Bool)

(declare-fun res!610067 () Bool)

(assert (=> b!904096 (=> (not res!610067) (not e!506587))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29767)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29767)

(declare-datatypes ((tuple2!12172 0))(
  ( (tuple2!12173 (_1!6097 (_ BitVec 64)) (_2!6097 V!29767)) )
))
(declare-datatypes ((List!17975 0))(
  ( (Nil!17972) (Cons!17971 (h!19117 tuple2!12172) (t!25349 List!17975)) )
))
(declare-datatypes ((ListLongMap!10859 0))(
  ( (ListLongMap!10860 (toList!5445 List!17975)) )
))
(declare-fun contains!4455 (ListLongMap!10859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2659 (array!53231 array!53229 (_ BitVec 32) (_ BitVec 32) V!29767 V!29767 (_ BitVec 32) Int) ListLongMap!10859)

(assert (=> b!904096 (= res!610067 (contains!4455 (getCurrentListMap!2659 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904097 () Bool)

(declare-fun res!610066 () Bool)

(assert (=> b!904097 (=> (not res!610066) (not e!506587))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904097 (= res!610066 (inRange!0 i!717 mask!1756))))

(declare-fun b!904098 () Bool)

(declare-fun e!506588 () Bool)

(assert (=> b!904098 (= e!506588 tp_is_empty!18601)))

(declare-fun b!904099 () Bool)

(declare-fun e!506585 () Bool)

(assert (=> b!904099 (= e!506587 (not e!506585))))

(declare-fun res!610063 () Bool)

(assert (=> b!904099 (=> res!610063 e!506585)))

(assert (=> b!904099 (= res!610063 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26036 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904099 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30604 0))(
  ( (Unit!30605) )
))
(declare-fun lt!407973 () Unit!30604)

(declare-fun lemmaKeyInListMapIsInArray!184 (array!53231 array!53229 (_ BitVec 32) (_ BitVec 32) V!29767 V!29767 (_ BitVec 64) Int) Unit!30604)

(assert (=> b!904099 (= lt!407973 (lemmaKeyInListMapIsInArray!184 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904100 () Bool)

(declare-fun res!610069 () Bool)

(assert (=> b!904100 (=> (not res!610069) (not e!506587))))

(assert (=> b!904100 (= res!610069 (and (= (select (arr!25575 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904101 () Bool)

(declare-fun e!506590 () Bool)

(assert (=> b!904101 (= e!506590 true)))

(declare-fun lt!407972 () V!29767)

(declare-fun lt!407974 () ListLongMap!10859)

(declare-fun apply!428 (ListLongMap!10859 (_ BitVec 64)) V!29767)

(assert (=> b!904101 (= lt!407972 (apply!428 lt!407974 k0!1033))))

(declare-fun b!904102 () Bool)

(assert (=> b!904102 (= e!506585 e!506590)))

(declare-fun res!610071 () Bool)

(assert (=> b!904102 (=> res!610071 e!506590)))

(assert (=> b!904102 (= res!610071 (not (contains!4455 lt!407974 k0!1033)))))

(assert (=> b!904102 (= lt!407974 (getCurrentListMap!2659 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904103 () Bool)

(declare-fun res!610065 () Bool)

(assert (=> b!904103 (=> (not res!610065) (not e!506587))))

(assert (=> b!904103 (= res!610065 (and (= (size!26035 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26036 _keys!1386) (size!26035 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904104 () Bool)

(declare-fun res!610070 () Bool)

(assert (=> b!904104 (=> (not res!610070) (not e!506587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53231 (_ BitVec 32)) Bool)

(assert (=> b!904104 (= res!610070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904105 () Bool)

(assert (=> b!904105 (= e!506586 (and e!506588 mapRes!29614))))

(declare-fun condMapEmpty!29614 () Bool)

(declare-fun mapDefault!29614 () ValueCell!8819)

(assert (=> b!904105 (= condMapEmpty!29614 (= (arr!25574 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8819)) mapDefault!29614)))))

(declare-fun b!904106 () Bool)

(declare-fun res!610064 () Bool)

(assert (=> b!904106 (=> (not res!610064) (not e!506587))))

(declare-datatypes ((List!17976 0))(
  ( (Nil!17973) (Cons!17972 (h!19118 (_ BitVec 64)) (t!25350 List!17976)) )
))
(declare-fun arrayNoDuplicates!0 (array!53231 (_ BitVec 32) List!17976) Bool)

(assert (=> b!904106 (= res!610064 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17973))))

(declare-fun b!904107 () Bool)

(assert (=> b!904107 (= e!506589 tp_is_empty!18601)))

(assert (= (and start!77580 res!610068) b!904103))

(assert (= (and b!904103 res!610065) b!904104))

(assert (= (and b!904104 res!610070) b!904106))

(assert (= (and b!904106 res!610064) b!904096))

(assert (= (and b!904096 res!610067) b!904097))

(assert (= (and b!904097 res!610066) b!904100))

(assert (= (and b!904100 res!610069) b!904099))

(assert (= (and b!904099 (not res!610063)) b!904102))

(assert (= (and b!904102 (not res!610071)) b!904101))

(assert (= (and b!904105 condMapEmpty!29614) mapIsEmpty!29614))

(assert (= (and b!904105 (not condMapEmpty!29614)) mapNonEmpty!29614))

(get-info :version)

(assert (= (and mapNonEmpty!29614 ((_ is ValueCellFull!8819) mapValue!29614)) b!904107))

(assert (= (and b!904105 ((_ is ValueCellFull!8819) mapDefault!29614)) b!904098))

(assert (= start!77580 b!904105))

(declare-fun m!839087 () Bool)

(assert (=> b!904099 m!839087))

(declare-fun m!839089 () Bool)

(assert (=> b!904099 m!839089))

(declare-fun m!839091 () Bool)

(assert (=> start!77580 m!839091))

(declare-fun m!839093 () Bool)

(assert (=> start!77580 m!839093))

(declare-fun m!839095 () Bool)

(assert (=> start!77580 m!839095))

(declare-fun m!839097 () Bool)

(assert (=> b!904101 m!839097))

(declare-fun m!839099 () Bool)

(assert (=> b!904106 m!839099))

(declare-fun m!839101 () Bool)

(assert (=> b!904096 m!839101))

(assert (=> b!904096 m!839101))

(declare-fun m!839103 () Bool)

(assert (=> b!904096 m!839103))

(declare-fun m!839105 () Bool)

(assert (=> b!904102 m!839105))

(declare-fun m!839107 () Bool)

(assert (=> b!904102 m!839107))

(declare-fun m!839109 () Bool)

(assert (=> b!904100 m!839109))

(declare-fun m!839111 () Bool)

(assert (=> mapNonEmpty!29614 m!839111))

(declare-fun m!839113 () Bool)

(assert (=> b!904104 m!839113))

(declare-fun m!839115 () Bool)

(assert (=> b!904097 m!839115))

(check-sat (not b!904096) (not start!77580) (not b!904099) (not b!904102) (not mapNonEmpty!29614) (not b!904104) (not b_next!16183) tp_is_empty!18601 (not b!904097) (not b!904101) b_and!26523 (not b!904106))
(check-sat b_and!26523 (not b_next!16183))
