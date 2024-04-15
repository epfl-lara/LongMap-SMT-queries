; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77804 () Bool)

(assert start!77804)

(declare-fun b_free!16381 () Bool)

(declare-fun b_next!16381 () Bool)

(assert (=> start!77804 (= b_free!16381 (not b_next!16381))))

(declare-fun tp!57408 () Bool)

(declare-fun b_and!26893 () Bool)

(assert (=> start!77804 (= tp!57408 b_and!26893)))

(declare-fun b!908234 () Bool)

(declare-fun res!613062 () Bool)

(declare-fun e!509024 () Bool)

(assert (=> b!908234 (=> (not res!613062) (not e!509024))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908234 (= res!613062 (inRange!0 i!717 mask!1756))))

(declare-fun b!908235 () Bool)

(declare-fun e!509022 () Bool)

(declare-fun tp_is_empty!18799 () Bool)

(assert (=> b!908235 (= e!509022 tp_is_empty!18799)))

(declare-fun b!908236 () Bool)

(declare-fun e!509026 () Bool)

(assert (=> b!908236 (= e!509026 e!509024)))

(declare-fun res!613059 () Bool)

(assert (=> b!908236 (=> (not res!613059) (not e!509024))))

(declare-datatypes ((V!30031 0))(
  ( (V!30032 (val!9450 Int)) )
))
(declare-datatypes ((tuple2!12344 0))(
  ( (tuple2!12345 (_1!6183 (_ BitVec 64)) (_2!6183 V!30031)) )
))
(declare-datatypes ((List!18126 0))(
  ( (Nil!18123) (Cons!18122 (h!19268 tuple2!12344) (t!25670 List!18126)) )
))
(declare-datatypes ((ListLongMap!11031 0))(
  ( (ListLongMap!11032 (toList!5531 List!18126)) )
))
(declare-fun lt!409490 () ListLongMap!11031)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4530 (ListLongMap!11031 (_ BitVec 64)) Bool)

(assert (=> b!908236 (= res!613059 (contains!4530 lt!409490 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30031)

(declare-datatypes ((array!53611 0))(
  ( (array!53612 (arr!25764 (Array (_ BitVec 32) (_ BitVec 64))) (size!26225 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53611)

(declare-datatypes ((ValueCell!8918 0))(
  ( (ValueCellFull!8918 (v!11956 V!30031)) (EmptyCell!8918) )
))
(declare-datatypes ((array!53613 0))(
  ( (array!53614 (arr!25765 (Array (_ BitVec 32) ValueCell!8918)) (size!26226 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53613)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30031)

(declare-fun getCurrentListMap!2733 (array!53611 array!53613 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 32) Int) ListLongMap!11031)

(assert (=> b!908236 (= lt!409490 (getCurrentListMap!2733 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908237 () Bool)

(declare-fun e!509027 () Bool)

(assert (=> b!908237 (= e!509027 tp_is_empty!18799)))

(declare-fun b!908238 () Bool)

(declare-fun res!613055 () Bool)

(declare-fun e!509025 () Bool)

(assert (=> b!908238 (=> res!613055 e!509025)))

(declare-fun lt!409492 () ListLongMap!11031)

(declare-fun lt!409493 () V!30031)

(declare-fun apply!503 (ListLongMap!11031 (_ BitVec 64)) V!30031)

(assert (=> b!908238 (= res!613055 (not (= (apply!503 lt!409492 k0!1033) lt!409493)))))

(declare-fun b!908240 () Bool)

(declare-fun res!613063 () Bool)

(assert (=> b!908240 (=> (not res!613063) (not e!509026))))

(assert (=> b!908240 (= res!613063 (and (= (size!26226 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26225 _keys!1386) (size!26226 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908241 () Bool)

(declare-fun res!613056 () Bool)

(assert (=> b!908241 (=> (not res!613056) (not e!509026))))

(declare-datatypes ((List!18127 0))(
  ( (Nil!18124) (Cons!18123 (h!19269 (_ BitVec 64)) (t!25671 List!18127)) )
))
(declare-fun arrayNoDuplicates!0 (array!53611 (_ BitVec 32) List!18127) Bool)

(assert (=> b!908241 (= res!613056 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18124))))

(declare-fun b!908242 () Bool)

(declare-fun e!509021 () Bool)

(assert (=> b!908242 (= e!509024 (not e!509021))))

(declare-fun res!613057 () Bool)

(assert (=> b!908242 (=> res!613057 e!509021)))

(assert (=> b!908242 (= res!613057 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26225 _keys!1386))))))

(declare-fun get!13565 (ValueCell!8918 V!30031) V!30031)

(declare-fun dynLambda!1369 (Int (_ BitVec 64)) V!30031)

(assert (=> b!908242 (= lt!409493 (get!13565 (select (arr!25765 _values!1152) i!717) (dynLambda!1369 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908242 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30762 0))(
  ( (Unit!30763) )
))
(declare-fun lt!409494 () Unit!30762)

(declare-fun lemmaKeyInListMapIsInArray!245 (array!53611 array!53613 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 64) Int) Unit!30762)

(assert (=> b!908242 (= lt!409494 (lemmaKeyInListMapIsInArray!245 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908243 () Bool)

(assert (=> b!908243 (= e!509025 true)))

(assert (=> b!908243 (= (apply!503 lt!409490 k0!1033) lt!409493)))

(declare-fun lt!409491 () Unit!30762)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!61 (array!53611 array!53613 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 64) V!30031 (_ BitVec 32) Int) Unit!30762)

(assert (=> b!908243 (= lt!409491 (lemmaListMapApplyFromThenApplyFromZero!61 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409493 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29914 () Bool)

(declare-fun mapRes!29914 () Bool)

(declare-fun tp!57409 () Bool)

(assert (=> mapNonEmpty!29914 (= mapRes!29914 (and tp!57409 e!509022))))

(declare-fun mapValue!29914 () ValueCell!8918)

(declare-fun mapKey!29914 () (_ BitVec 32))

(declare-fun mapRest!29914 () (Array (_ BitVec 32) ValueCell!8918))

(assert (=> mapNonEmpty!29914 (= (arr!25765 _values!1152) (store mapRest!29914 mapKey!29914 mapValue!29914))))

(declare-fun mapIsEmpty!29914 () Bool)

(assert (=> mapIsEmpty!29914 mapRes!29914))

(declare-fun b!908239 () Bool)

(declare-fun res!613061 () Bool)

(assert (=> b!908239 (=> (not res!613061) (not e!509024))))

(assert (=> b!908239 (= res!613061 (and (= (select (arr!25764 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!613060 () Bool)

(assert (=> start!77804 (=> (not res!613060) (not e!509026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77804 (= res!613060 (validMask!0 mask!1756))))

(assert (=> start!77804 e!509026))

(declare-fun e!509023 () Bool)

(declare-fun array_inv!20212 (array!53613) Bool)

(assert (=> start!77804 (and (array_inv!20212 _values!1152) e!509023)))

(assert (=> start!77804 tp!57408))

(assert (=> start!77804 true))

(assert (=> start!77804 tp_is_empty!18799))

(declare-fun array_inv!20213 (array!53611) Bool)

(assert (=> start!77804 (array_inv!20213 _keys!1386)))

(declare-fun b!908244 () Bool)

(assert (=> b!908244 (= e!509021 e!509025)))

(declare-fun res!613054 () Bool)

(assert (=> b!908244 (=> res!613054 e!509025)))

(assert (=> b!908244 (= res!613054 (not (contains!4530 lt!409492 k0!1033)))))

(assert (=> b!908244 (= lt!409492 (getCurrentListMap!2733 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908245 () Bool)

(declare-fun res!613058 () Bool)

(assert (=> b!908245 (=> (not res!613058) (not e!509026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53611 (_ BitVec 32)) Bool)

(assert (=> b!908245 (= res!613058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908246 () Bool)

(assert (=> b!908246 (= e!509023 (and e!509027 mapRes!29914))))

(declare-fun condMapEmpty!29914 () Bool)

(declare-fun mapDefault!29914 () ValueCell!8918)

(assert (=> b!908246 (= condMapEmpty!29914 (= (arr!25765 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8918)) mapDefault!29914)))))

(assert (= (and start!77804 res!613060) b!908240))

(assert (= (and b!908240 res!613063) b!908245))

(assert (= (and b!908245 res!613058) b!908241))

(assert (= (and b!908241 res!613056) b!908236))

(assert (= (and b!908236 res!613059) b!908234))

(assert (= (and b!908234 res!613062) b!908239))

(assert (= (and b!908239 res!613061) b!908242))

(assert (= (and b!908242 (not res!613057)) b!908244))

(assert (= (and b!908244 (not res!613054)) b!908238))

(assert (= (and b!908238 (not res!613055)) b!908243))

(assert (= (and b!908246 condMapEmpty!29914) mapIsEmpty!29914))

(assert (= (and b!908246 (not condMapEmpty!29914)) mapNonEmpty!29914))

(get-info :version)

(assert (= (and mapNonEmpty!29914 ((_ is ValueCellFull!8918) mapValue!29914)) b!908235))

(assert (= (and b!908246 ((_ is ValueCellFull!8918) mapDefault!29914)) b!908237))

(assert (= start!77804 b!908246))

(declare-fun b_lambda!13247 () Bool)

(assert (=> (not b_lambda!13247) (not b!908242)))

(declare-fun t!25669 () Bool)

(declare-fun tb!5395 () Bool)

(assert (=> (and start!77804 (= defaultEntry!1160 defaultEntry!1160) t!25669) tb!5395))

(declare-fun result!10595 () Bool)

(assert (=> tb!5395 (= result!10595 tp_is_empty!18799)))

(assert (=> b!908242 t!25669))

(declare-fun b_and!26895 () Bool)

(assert (= b_and!26893 (and (=> t!25669 result!10595) b_and!26895)))

(declare-fun m!843051 () Bool)

(assert (=> b!908239 m!843051))

(declare-fun m!843053 () Bool)

(assert (=> start!77804 m!843053))

(declare-fun m!843055 () Bool)

(assert (=> start!77804 m!843055))

(declare-fun m!843057 () Bool)

(assert (=> start!77804 m!843057))

(declare-fun m!843059 () Bool)

(assert (=> mapNonEmpty!29914 m!843059))

(declare-fun m!843061 () Bool)

(assert (=> b!908244 m!843061))

(declare-fun m!843063 () Bool)

(assert (=> b!908244 m!843063))

(declare-fun m!843065 () Bool)

(assert (=> b!908243 m!843065))

(declare-fun m!843067 () Bool)

(assert (=> b!908243 m!843067))

(declare-fun m!843069 () Bool)

(assert (=> b!908236 m!843069))

(declare-fun m!843071 () Bool)

(assert (=> b!908236 m!843071))

(declare-fun m!843073 () Bool)

(assert (=> b!908245 m!843073))

(declare-fun m!843075 () Bool)

(assert (=> b!908238 m!843075))

(declare-fun m!843077 () Bool)

(assert (=> b!908241 m!843077))

(declare-fun m!843079 () Bool)

(assert (=> b!908242 m!843079))

(declare-fun m!843081 () Bool)

(assert (=> b!908242 m!843081))

(declare-fun m!843083 () Bool)

(assert (=> b!908242 m!843083))

(declare-fun m!843085 () Bool)

(assert (=> b!908242 m!843085))

(assert (=> b!908242 m!843079))

(assert (=> b!908242 m!843083))

(declare-fun m!843087 () Bool)

(assert (=> b!908242 m!843087))

(declare-fun m!843089 () Bool)

(assert (=> b!908234 m!843089))

(check-sat (not b_lambda!13247) (not b_next!16381) (not b!908243) b_and!26895 (not b!908236) (not b!908244) (not b!908234) (not mapNonEmpty!29914) (not b!908238) (not b!908245) tp_is_empty!18799 (not b!908241) (not start!77804) (not b!908242))
(check-sat b_and!26895 (not b_next!16381))
