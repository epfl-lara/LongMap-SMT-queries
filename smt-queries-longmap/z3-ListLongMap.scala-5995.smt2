; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77990 () Bool)

(assert start!77990)

(declare-fun b_free!16381 () Bool)

(declare-fun b_next!16381 () Bool)

(assert (=> start!77990 (= b_free!16381 (not b_next!16381))))

(declare-fun tp!57408 () Bool)

(declare-fun b_and!26929 () Bool)

(assert (=> start!77990 (= tp!57408 b_and!26929)))

(declare-fun b!909376 () Bool)

(declare-fun e!509755 () Bool)

(declare-fun e!509756 () Bool)

(declare-fun mapRes!29914 () Bool)

(assert (=> b!909376 (= e!509755 (and e!509756 mapRes!29914))))

(declare-fun condMapEmpty!29914 () Bool)

(declare-datatypes ((V!30031 0))(
  ( (V!30032 (val!9450 Int)) )
))
(declare-datatypes ((ValueCell!8918 0))(
  ( (ValueCellFull!8918 (v!11954 V!30031)) (EmptyCell!8918) )
))
(declare-datatypes ((array!53675 0))(
  ( (array!53676 (arr!25791 (Array (_ BitVec 32) ValueCell!8918)) (size!26251 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53675)

(declare-fun mapDefault!29914 () ValueCell!8918)

(assert (=> b!909376 (= condMapEmpty!29914 (= (arr!25791 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8918)) mapDefault!29914)))))

(declare-fun b!909377 () Bool)

(declare-fun res!613512 () Bool)

(declare-fun e!509757 () Bool)

(assert (=> b!909377 (=> (not res!613512) (not e!509757))))

(declare-datatypes ((array!53677 0))(
  ( (array!53678 (arr!25792 (Array (_ BitVec 32) (_ BitVec 64))) (size!26252 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53677)

(declare-datatypes ((List!18081 0))(
  ( (Nil!18078) (Cons!18077 (h!19229 (_ BitVec 64)) (t!25626 List!18081)) )
))
(declare-fun arrayNoDuplicates!0 (array!53677 (_ BitVec 32) List!18081) Bool)

(assert (=> b!909377 (= res!613512 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18078))))

(declare-fun b!909378 () Bool)

(declare-fun res!613516 () Bool)

(declare-fun e!509751 () Bool)

(assert (=> b!909378 (=> (not res!613516) (not e!509751))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!909378 (= res!613516 (and (= (select (arr!25792 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909379 () Bool)

(assert (=> b!909379 (= e!509757 e!509751)))

(declare-fun res!613514 () Bool)

(assert (=> b!909379 (=> (not res!613514) (not e!509751))))

(declare-datatypes ((tuple2!12256 0))(
  ( (tuple2!12257 (_1!6139 (_ BitVec 64)) (_2!6139 V!30031)) )
))
(declare-datatypes ((List!18082 0))(
  ( (Nil!18079) (Cons!18078 (h!19230 tuple2!12256) (t!25627 List!18082)) )
))
(declare-datatypes ((ListLongMap!10955 0))(
  ( (ListLongMap!10956 (toList!5493 List!18082)) )
))
(declare-fun lt!410089 () ListLongMap!10955)

(declare-fun contains!4544 (ListLongMap!10955 (_ BitVec 64)) Bool)

(assert (=> b!909379 (= res!613514 (contains!4544 lt!410089 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30031)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30031)

(declare-fun getCurrentListMap!2754 (array!53677 array!53675 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 32) Int) ListLongMap!10955)

(assert (=> b!909379 (= lt!410089 (getCurrentListMap!2754 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29914 () Bool)

(assert (=> mapIsEmpty!29914 mapRes!29914))

(declare-fun b!909380 () Bool)

(declare-fun res!613511 () Bool)

(assert (=> b!909380 (=> (not res!613511) (not e!509757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53677 (_ BitVec 32)) Bool)

(assert (=> b!909380 (= res!613511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909381 () Bool)

(declare-fun e!509750 () Bool)

(declare-fun e!509753 () Bool)

(assert (=> b!909381 (= e!509750 e!509753)))

(declare-fun res!613515 () Bool)

(assert (=> b!909381 (=> res!613515 e!509753)))

(declare-fun lt!410091 () ListLongMap!10955)

(assert (=> b!909381 (= res!613515 (not (contains!4544 lt!410091 k0!1033)))))

(assert (=> b!909381 (= lt!410091 (getCurrentListMap!2754 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909382 () Bool)

(assert (=> b!909382 (= e!509751 (not e!509750))))

(declare-fun res!613510 () Bool)

(assert (=> b!909382 (=> res!613510 e!509750)))

(assert (=> b!909382 (= res!613510 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26252 _keys!1386))))))

(declare-fun lt!410088 () V!30031)

(declare-fun get!13588 (ValueCell!8918 V!30031) V!30031)

(declare-fun dynLambda!1393 (Int (_ BitVec 64)) V!30031)

(assert (=> b!909382 (= lt!410088 (get!13588 (select (arr!25791 _values!1152) i!717) (dynLambda!1393 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909382 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30826 0))(
  ( (Unit!30827) )
))
(declare-fun lt!410087 () Unit!30826)

(declare-fun lemmaKeyInListMapIsInArray!252 (array!53677 array!53675 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 64) Int) Unit!30826)

(assert (=> b!909382 (= lt!410087 (lemmaKeyInListMapIsInArray!252 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!613508 () Bool)

(assert (=> start!77990 (=> (not res!613508) (not e!509757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77990 (= res!613508 (validMask!0 mask!1756))))

(assert (=> start!77990 e!509757))

(declare-fun array_inv!20252 (array!53675) Bool)

(assert (=> start!77990 (and (array_inv!20252 _values!1152) e!509755)))

(assert (=> start!77990 tp!57408))

(assert (=> start!77990 true))

(declare-fun tp_is_empty!18799 () Bool)

(assert (=> start!77990 tp_is_empty!18799))

(declare-fun array_inv!20253 (array!53677) Bool)

(assert (=> start!77990 (array_inv!20253 _keys!1386)))

(declare-fun b!909383 () Bool)

(declare-fun res!613509 () Bool)

(assert (=> b!909383 (=> (not res!613509) (not e!509757))))

(assert (=> b!909383 (= res!613509 (and (= (size!26251 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26252 _keys!1386) (size!26251 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909384 () Bool)

(declare-fun e!509752 () Bool)

(assert (=> b!909384 (= e!509752 tp_is_empty!18799)))

(declare-fun mapNonEmpty!29914 () Bool)

(declare-fun tp!57409 () Bool)

(assert (=> mapNonEmpty!29914 (= mapRes!29914 (and tp!57409 e!509752))))

(declare-fun mapValue!29914 () ValueCell!8918)

(declare-fun mapKey!29914 () (_ BitVec 32))

(declare-fun mapRest!29914 () (Array (_ BitVec 32) ValueCell!8918))

(assert (=> mapNonEmpty!29914 (= (arr!25791 _values!1152) (store mapRest!29914 mapKey!29914 mapValue!29914))))

(declare-fun b!909385 () Bool)

(declare-fun res!613517 () Bool)

(assert (=> b!909385 (=> (not res!613517) (not e!509751))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909385 (= res!613517 (inRange!0 i!717 mask!1756))))

(declare-fun b!909386 () Bool)

(declare-fun res!613513 () Bool)

(assert (=> b!909386 (=> res!613513 e!509753)))

(declare-fun apply!509 (ListLongMap!10955 (_ BitVec 64)) V!30031)

(assert (=> b!909386 (= res!613513 (not (= (apply!509 lt!410091 k0!1033) lt!410088)))))

(declare-fun b!909387 () Bool)

(assert (=> b!909387 (= e!509753 true)))

(assert (=> b!909387 (= (apply!509 lt!410089 k0!1033) lt!410088)))

(declare-fun lt!410090 () Unit!30826)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!54 (array!53677 array!53675 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 64) V!30031 (_ BitVec 32) Int) Unit!30826)

(assert (=> b!909387 (= lt!410090 (lemmaListMapApplyFromThenApplyFromZero!54 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410088 i!717 defaultEntry!1160))))

(declare-fun b!909388 () Bool)

(assert (=> b!909388 (= e!509756 tp_is_empty!18799)))

(assert (= (and start!77990 res!613508) b!909383))

(assert (= (and b!909383 res!613509) b!909380))

(assert (= (and b!909380 res!613511) b!909377))

(assert (= (and b!909377 res!613512) b!909379))

(assert (= (and b!909379 res!613514) b!909385))

(assert (= (and b!909385 res!613517) b!909378))

(assert (= (and b!909378 res!613516) b!909382))

(assert (= (and b!909382 (not res!613510)) b!909381))

(assert (= (and b!909381 (not res!613515)) b!909386))

(assert (= (and b!909386 (not res!613513)) b!909387))

(assert (= (and b!909376 condMapEmpty!29914) mapIsEmpty!29914))

(assert (= (and b!909376 (not condMapEmpty!29914)) mapNonEmpty!29914))

(get-info :version)

(assert (= (and mapNonEmpty!29914 ((_ is ValueCellFull!8918) mapValue!29914)) b!909384))

(assert (= (and b!909376 ((_ is ValueCellFull!8918) mapDefault!29914)) b!909388))

(assert (= start!77990 b!909376))

(declare-fun b_lambda!13279 () Bool)

(assert (=> (not b_lambda!13279) (not b!909382)))

(declare-fun t!25625 () Bool)

(declare-fun tb!5395 () Bool)

(assert (=> (and start!77990 (= defaultEntry!1160 defaultEntry!1160) t!25625) tb!5395))

(declare-fun result!10595 () Bool)

(assert (=> tb!5395 (= result!10595 tp_is_empty!18799)))

(assert (=> b!909382 t!25625))

(declare-fun b_and!26931 () Bool)

(assert (= b_and!26929 (and (=> t!25625 result!10595) b_and!26931)))

(declare-fun m!845103 () Bool)

(assert (=> b!909377 m!845103))

(declare-fun m!845105 () Bool)

(assert (=> b!909386 m!845105))

(declare-fun m!845107 () Bool)

(assert (=> b!909382 m!845107))

(declare-fun m!845109 () Bool)

(assert (=> b!909382 m!845109))

(declare-fun m!845111 () Bool)

(assert (=> b!909382 m!845111))

(declare-fun m!845113 () Bool)

(assert (=> b!909382 m!845113))

(assert (=> b!909382 m!845107))

(assert (=> b!909382 m!845111))

(declare-fun m!845115 () Bool)

(assert (=> b!909382 m!845115))

(declare-fun m!845117 () Bool)

(assert (=> start!77990 m!845117))

(declare-fun m!845119 () Bool)

(assert (=> start!77990 m!845119))

(declare-fun m!845121 () Bool)

(assert (=> start!77990 m!845121))

(declare-fun m!845123 () Bool)

(assert (=> b!909385 m!845123))

(declare-fun m!845125 () Bool)

(assert (=> b!909380 m!845125))

(declare-fun m!845127 () Bool)

(assert (=> mapNonEmpty!29914 m!845127))

(declare-fun m!845129 () Bool)

(assert (=> b!909379 m!845129))

(declare-fun m!845131 () Bool)

(assert (=> b!909379 m!845131))

(declare-fun m!845133 () Bool)

(assert (=> b!909387 m!845133))

(declare-fun m!845135 () Bool)

(assert (=> b!909387 m!845135))

(declare-fun m!845137 () Bool)

(assert (=> b!909378 m!845137))

(declare-fun m!845139 () Bool)

(assert (=> b!909381 m!845139))

(declare-fun m!845141 () Bool)

(assert (=> b!909381 m!845141))

(check-sat (not mapNonEmpty!29914) (not b_next!16381) (not b!909381) (not b!909387) tp_is_empty!18799 (not b!909377) (not b!909379) (not b!909386) (not b!909382) (not start!77990) (not b!909385) b_and!26931 (not b_lambda!13279) (not b!909380))
(check-sat b_and!26931 (not b_next!16381))
