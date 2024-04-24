; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77922 () Bool)

(assert start!77922)

(declare-fun b_free!16339 () Bool)

(declare-fun b_next!16339 () Bool)

(assert (=> start!77922 (= b_free!16339 (not b_next!16339))))

(declare-fun tp!57280 () Bool)

(declare-fun b_and!26841 () Bool)

(assert (=> start!77922 (= tp!57280 b_and!26841)))

(declare-fun b!908363 () Bool)

(declare-fun res!612819 () Bool)

(declare-fun e!509150 () Bool)

(assert (=> b!908363 (=> (not res!612819) (not e!509150))))

(declare-datatypes ((V!29975 0))(
  ( (V!29976 (val!9429 Int)) )
))
(declare-datatypes ((ValueCell!8897 0))(
  ( (ValueCellFull!8897 (v!11931 V!29975)) (EmptyCell!8897) )
))
(declare-datatypes ((array!53589 0))(
  ( (array!53590 (arr!25749 (Array (_ BitVec 32) ValueCell!8897)) (size!26209 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53589)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53591 0))(
  ( (array!53592 (arr!25750 (Array (_ BitVec 32) (_ BitVec 64))) (size!26210 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53591)

(assert (=> b!908363 (= res!612819 (and (= (size!26209 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26210 _keys!1386) (size!26209 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908364 () Bool)

(declare-fun res!612821 () Bool)

(declare-fun e!509144 () Bool)

(assert (=> b!908364 (=> res!612821 e!509144)))

(declare-fun lt!409653 () V!29975)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12214 0))(
  ( (tuple2!12215 (_1!6118 (_ BitVec 64)) (_2!6118 V!29975)) )
))
(declare-datatypes ((List!18047 0))(
  ( (Nil!18044) (Cons!18043 (h!19195 tuple2!12214) (t!25550 List!18047)) )
))
(declare-datatypes ((ListLongMap!10913 0))(
  ( (ListLongMap!10914 (toList!5472 List!18047)) )
))
(declare-fun lt!409657 () ListLongMap!10913)

(declare-fun apply!491 (ListLongMap!10913 (_ BitVec 64)) V!29975)

(assert (=> b!908364 (= res!612821 (not (= (apply!491 lt!409657 k0!1033) lt!409653)))))

(declare-fun mapNonEmpty!29848 () Bool)

(declare-fun mapRes!29848 () Bool)

(declare-fun tp!57279 () Bool)

(declare-fun e!509145 () Bool)

(assert (=> mapNonEmpty!29848 (= mapRes!29848 (and tp!57279 e!509145))))

(declare-fun mapRest!29848 () (Array (_ BitVec 32) ValueCell!8897))

(declare-fun mapKey!29848 () (_ BitVec 32))

(declare-fun mapValue!29848 () ValueCell!8897)

(assert (=> mapNonEmpty!29848 (= (arr!25749 _values!1152) (store mapRest!29848 mapKey!29848 mapValue!29848))))

(declare-fun b!908365 () Bool)

(declare-fun res!612823 () Bool)

(declare-fun e!509151 () Bool)

(assert (=> b!908365 (=> (not res!612823) (not e!509151))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!908365 (= res!612823 (and (= (select (arr!25750 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908366 () Bool)

(declare-fun res!612816 () Bool)

(assert (=> b!908366 (=> (not res!612816) (not e!509150))))

(declare-datatypes ((List!18048 0))(
  ( (Nil!18045) (Cons!18044 (h!19196 (_ BitVec 64)) (t!25551 List!18048)) )
))
(declare-fun arrayNoDuplicates!0 (array!53591 (_ BitVec 32) List!18048) Bool)

(assert (=> b!908366 (= res!612816 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18045))))

(declare-fun b!908367 () Bool)

(declare-fun e!509149 () Bool)

(declare-fun tp_is_empty!18757 () Bool)

(assert (=> b!908367 (= e!509149 tp_is_empty!18757)))

(declare-fun b!908368 () Bool)

(declare-fun e!509146 () Bool)

(assert (=> b!908368 (= e!509146 (and e!509149 mapRes!29848))))

(declare-fun condMapEmpty!29848 () Bool)

(declare-fun mapDefault!29848 () ValueCell!8897)

(assert (=> b!908368 (= condMapEmpty!29848 (= (arr!25749 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8897)) mapDefault!29848)))))

(declare-fun b!908369 () Bool)

(declare-fun res!612814 () Bool)

(assert (=> b!908369 (=> (not res!612814) (not e!509151))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908369 (= res!612814 (inRange!0 i!717 mask!1756))))

(declare-fun res!612820 () Bool)

(assert (=> start!77922 (=> (not res!612820) (not e!509150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77922 (= res!612820 (validMask!0 mask!1756))))

(assert (=> start!77922 e!509150))

(declare-fun array_inv!20220 (array!53589) Bool)

(assert (=> start!77922 (and (array_inv!20220 _values!1152) e!509146)))

(assert (=> start!77922 tp!57280))

(assert (=> start!77922 true))

(assert (=> start!77922 tp_is_empty!18757))

(declare-fun array_inv!20221 (array!53591) Bool)

(assert (=> start!77922 (array_inv!20221 _keys!1386)))

(declare-fun b!908370 () Bool)

(declare-fun res!612815 () Bool)

(assert (=> b!908370 (=> (not res!612815) (not e!509150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53591 (_ BitVec 32)) Bool)

(assert (=> b!908370 (= res!612815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29848 () Bool)

(assert (=> mapIsEmpty!29848 mapRes!29848))

(declare-fun b!908371 () Bool)

(declare-fun e!509148 () Bool)

(assert (=> b!908371 (= e!509151 (not e!509148))))

(declare-fun res!612817 () Bool)

(assert (=> b!908371 (=> res!612817 e!509148)))

(assert (=> b!908371 (= res!612817 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26210 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13556 (ValueCell!8897 V!29975) V!29975)

(declare-fun dynLambda!1378 (Int (_ BitVec 64)) V!29975)

(assert (=> b!908371 (= lt!409653 (get!13556 (select (arr!25749 _values!1152) i!717) (dynLambda!1378 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908371 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29975)

(declare-fun minValue!1094 () V!29975)

(declare-datatypes ((Unit!30790 0))(
  ( (Unit!30791) )
))
(declare-fun lt!409656 () Unit!30790)

(declare-fun lemmaKeyInListMapIsInArray!237 (array!53591 array!53589 (_ BitVec 32) (_ BitVec 32) V!29975 V!29975 (_ BitVec 64) Int) Unit!30790)

(assert (=> b!908371 (= lt!409656 (lemmaKeyInListMapIsInArray!237 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908372 () Bool)

(assert (=> b!908372 (= e!509150 e!509151)))

(declare-fun res!612822 () Bool)

(assert (=> b!908372 (=> (not res!612822) (not e!509151))))

(declare-fun lt!409654 () ListLongMap!10913)

(declare-fun contains!4525 (ListLongMap!10913 (_ BitVec 64)) Bool)

(assert (=> b!908372 (= res!612822 (contains!4525 lt!409654 k0!1033))))

(declare-fun getCurrentListMap!2736 (array!53591 array!53589 (_ BitVec 32) (_ BitVec 32) V!29975 V!29975 (_ BitVec 32) Int) ListLongMap!10913)

(assert (=> b!908372 (= lt!409654 (getCurrentListMap!2736 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908373 () Bool)

(assert (=> b!908373 (= e!509145 tp_is_empty!18757)))

(declare-fun b!908374 () Bool)

(assert (=> b!908374 (= e!509148 e!509144)))

(declare-fun res!612818 () Bool)

(assert (=> b!908374 (=> res!612818 e!509144)))

(assert (=> b!908374 (= res!612818 (not (contains!4525 lt!409657 k0!1033)))))

(assert (=> b!908374 (= lt!409657 (getCurrentListMap!2736 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908375 () Bool)

(assert (=> b!908375 (= e!509144 (bvslt #b00000000000000000000000000000000 (size!26210 _keys!1386)))))

(assert (=> b!908375 (= (apply!491 lt!409654 k0!1033) lt!409653)))

(declare-fun lt!409655 () Unit!30790)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!40 (array!53591 array!53589 (_ BitVec 32) (_ BitVec 32) V!29975 V!29975 (_ BitVec 64) V!29975 (_ BitVec 32) Int) Unit!30790)

(assert (=> b!908375 (= lt!409655 (lemmaListMapApplyFromThenApplyFromZero!40 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409653 i!717 defaultEntry!1160))))

(assert (= (and start!77922 res!612820) b!908363))

(assert (= (and b!908363 res!612819) b!908370))

(assert (= (and b!908370 res!612815) b!908366))

(assert (= (and b!908366 res!612816) b!908372))

(assert (= (and b!908372 res!612822) b!908369))

(assert (= (and b!908369 res!612814) b!908365))

(assert (= (and b!908365 res!612823) b!908371))

(assert (= (and b!908371 (not res!612817)) b!908374))

(assert (= (and b!908374 (not res!612818)) b!908364))

(assert (= (and b!908364 (not res!612821)) b!908375))

(assert (= (and b!908368 condMapEmpty!29848) mapIsEmpty!29848))

(assert (= (and b!908368 (not condMapEmpty!29848)) mapNonEmpty!29848))

(get-info :version)

(assert (= (and mapNonEmpty!29848 ((_ is ValueCellFull!8897) mapValue!29848)) b!908373))

(assert (= (and b!908368 ((_ is ValueCellFull!8897) mapDefault!29848)) b!908367))

(assert (= start!77922 b!908368))

(declare-fun b_lambda!13227 () Bool)

(assert (=> (not b_lambda!13227) (not b!908371)))

(declare-fun t!25549 () Bool)

(declare-fun tb!5353 () Bool)

(assert (=> (and start!77922 (= defaultEntry!1160 defaultEntry!1160) t!25549) tb!5353))

(declare-fun result!10509 () Bool)

(assert (=> tb!5353 (= result!10509 tp_is_empty!18757)))

(assert (=> b!908371 t!25549))

(declare-fun b_and!26843 () Bool)

(assert (= b_and!26841 (and (=> t!25549 result!10509) b_and!26843)))

(declare-fun m!844109 () Bool)

(assert (=> start!77922 m!844109))

(declare-fun m!844111 () Bool)

(assert (=> start!77922 m!844111))

(declare-fun m!844113 () Bool)

(assert (=> start!77922 m!844113))

(declare-fun m!844115 () Bool)

(assert (=> b!908364 m!844115))

(declare-fun m!844117 () Bool)

(assert (=> b!908369 m!844117))

(declare-fun m!844119 () Bool)

(assert (=> mapNonEmpty!29848 m!844119))

(declare-fun m!844121 () Bool)

(assert (=> b!908374 m!844121))

(declare-fun m!844123 () Bool)

(assert (=> b!908374 m!844123))

(declare-fun m!844125 () Bool)

(assert (=> b!908371 m!844125))

(declare-fun m!844127 () Bool)

(assert (=> b!908371 m!844127))

(declare-fun m!844129 () Bool)

(assert (=> b!908371 m!844129))

(declare-fun m!844131 () Bool)

(assert (=> b!908371 m!844131))

(assert (=> b!908371 m!844125))

(assert (=> b!908371 m!844129))

(declare-fun m!844133 () Bool)

(assert (=> b!908371 m!844133))

(declare-fun m!844135 () Bool)

(assert (=> b!908366 m!844135))

(declare-fun m!844137 () Bool)

(assert (=> b!908365 m!844137))

(declare-fun m!844139 () Bool)

(assert (=> b!908375 m!844139))

(declare-fun m!844141 () Bool)

(assert (=> b!908375 m!844141))

(declare-fun m!844143 () Bool)

(assert (=> b!908370 m!844143))

(declare-fun m!844145 () Bool)

(assert (=> b!908372 m!844145))

(declare-fun m!844147 () Bool)

(assert (=> b!908372 m!844147))

(check-sat b_and!26843 (not b!908369) (not b_next!16339) (not b!908364) (not b!908370) (not b_lambda!13227) (not start!77922) (not b!908375) (not b!908374) (not b!908371) (not mapNonEmpty!29848) tp_is_empty!18757 (not b!908366) (not b!908372))
(check-sat b_and!26843 (not b_next!16339))
