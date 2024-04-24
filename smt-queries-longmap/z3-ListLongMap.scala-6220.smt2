; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79654 () Bool)

(assert start!79654)

(declare-fun b_free!17641 () Bool)

(declare-fun b_next!17641 () Bool)

(assert (=> start!79654 (= b_free!17641 (not b_next!17641))))

(declare-fun tp!61370 () Bool)

(declare-fun b_and!28859 () Bool)

(assert (=> start!79654 (= tp!61370 b_and!28859)))

(declare-fun mapNonEmpty!31986 () Bool)

(declare-fun mapRes!31986 () Bool)

(declare-fun tp!61371 () Bool)

(declare-fun e!525230 () Bool)

(assert (=> mapNonEmpty!31986 (= mapRes!31986 (and tp!61371 e!525230))))

(declare-datatypes ((V!31831 0))(
  ( (V!31832 (val!10125 Int)) )
))
(declare-datatypes ((ValueCell!9593 0))(
  ( (ValueCellFull!9593 (v!12642 V!31831)) (EmptyCell!9593) )
))
(declare-fun mapValue!31986 () ValueCell!9593)

(declare-fun mapKey!31986 () (_ BitVec 32))

(declare-datatypes ((array!56289 0))(
  ( (array!56290 (arr!27083 (Array (_ BitVec 32) ValueCell!9593)) (size!27543 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56289)

(declare-fun mapRest!31986 () (Array (_ BitVec 32) ValueCell!9593))

(assert (=> mapNonEmpty!31986 (= (arr!27083 _values!1231) (store mapRest!31986 mapKey!31986 mapValue!31986))))

(declare-fun b!935274 () Bool)

(declare-fun e!525231 () Bool)

(declare-fun tp_is_empty!20149 () Bool)

(assert (=> b!935274 (= e!525231 tp_is_empty!20149)))

(declare-fun b!935275 () Bool)

(declare-fun res!629646 () Bool)

(declare-fun e!525227 () Bool)

(assert (=> b!935275 (=> (not res!629646) (not e!525227))))

(declare-datatypes ((array!56291 0))(
  ( (array!56292 (arr!27084 (Array (_ BitVec 32) (_ BitVec 64))) (size!27544 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56291)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935275 (= res!629646 (and (= (size!27543 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27544 _keys!1487) (size!27543 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935276 () Bool)

(declare-fun e!525228 () Bool)

(declare-fun e!525233 () Bool)

(assert (=> b!935276 (= e!525228 e!525233)))

(declare-fun res!629649 () Bool)

(assert (=> b!935276 (=> (not res!629649) (not e!525233))))

(declare-fun lt!421306 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935276 (= res!629649 (validKeyInArray!0 lt!421306))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935276 (= lt!421306 (select (arr!27084 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun e!525234 () Bool)

(declare-fun b!935277 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935277 (= e!525234 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935278 () Bool)

(assert (=> b!935278 (= e!525227 e!525228)))

(declare-fun res!629651 () Bool)

(assert (=> b!935278 (=> (not res!629651) (not e!525228))))

(declare-datatypes ((tuple2!13268 0))(
  ( (tuple2!13269 (_1!6645 (_ BitVec 64)) (_2!6645 V!31831)) )
))
(declare-datatypes ((List!19050 0))(
  ( (Nil!19047) (Cons!19046 (h!20198 tuple2!13268) (t!27227 List!19050)) )
))
(declare-datatypes ((ListLongMap!11967 0))(
  ( (ListLongMap!11968 (toList!5999 List!19050)) )
))
(declare-fun lt!421305 () ListLongMap!11967)

(declare-fun contains!5063 (ListLongMap!11967 (_ BitVec 64)) Bool)

(assert (=> b!935278 (= res!629651 (contains!5063 lt!421305 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31831)

(declare-fun minValue!1173 () V!31831)

(declare-fun getCurrentListMap!3238 (array!56291 array!56289 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 32) Int) ListLongMap!11967)

(assert (=> b!935278 (= lt!421305 (getCurrentListMap!3238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935279 () Bool)

(declare-fun e!525232 () Bool)

(assert (=> b!935279 (= e!525232 (and e!525231 mapRes!31986))))

(declare-fun condMapEmpty!31986 () Bool)

(declare-fun mapDefault!31986 () ValueCell!9593)

(assert (=> b!935279 (= condMapEmpty!31986 (= (arr!27083 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9593)) mapDefault!31986)))))

(declare-fun mapIsEmpty!31986 () Bool)

(assert (=> mapIsEmpty!31986 mapRes!31986))

(declare-fun b!935280 () Bool)

(declare-fun res!629645 () Bool)

(assert (=> b!935280 (=> (not res!629645) (not e!525228))))

(assert (=> b!935280 (= res!629645 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935281 () Bool)

(assert (=> b!935281 (= e!525233 (not true))))

(assert (=> b!935281 e!525234))

(declare-fun c!97434 () Bool)

(assert (=> b!935281 (= c!97434 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31519 0))(
  ( (Unit!31520) )
))
(declare-fun lt!421312 () Unit!31519)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!276 (array!56291 array!56289 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 64) (_ BitVec 32) Int) Unit!31519)

(assert (=> b!935281 (= lt!421312 (lemmaListMapContainsThenArrayContainsFrom!276 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19051 0))(
  ( (Nil!19048) (Cons!19047 (h!20199 (_ BitVec 64)) (t!27228 List!19051)) )
))
(declare-fun arrayNoDuplicates!0 (array!56291 (_ BitVec 32) List!19051) Bool)

(assert (=> b!935281 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19048)))

(declare-fun lt!421310 () Unit!31519)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56291 (_ BitVec 32) (_ BitVec 32)) Unit!31519)

(assert (=> b!935281 (= lt!421310 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421307 () tuple2!13268)

(declare-fun +!2822 (ListLongMap!11967 tuple2!13268) ListLongMap!11967)

(assert (=> b!935281 (contains!5063 (+!2822 lt!421305 lt!421307) k0!1099)))

(declare-fun lt!421308 () Unit!31519)

(declare-fun lt!421309 () V!31831)

(declare-fun addStillContains!525 (ListLongMap!11967 (_ BitVec 64) V!31831 (_ BitVec 64)) Unit!31519)

(assert (=> b!935281 (= lt!421308 (addStillContains!525 lt!421305 lt!421306 lt!421309 k0!1099))))

(assert (=> b!935281 (= (getCurrentListMap!3238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2822 (getCurrentListMap!3238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421307))))

(assert (=> b!935281 (= lt!421307 (tuple2!13269 lt!421306 lt!421309))))

(declare-fun get!14277 (ValueCell!9593 V!31831) V!31831)

(declare-fun dynLambda!1619 (Int (_ BitVec 64)) V!31831)

(assert (=> b!935281 (= lt!421309 (get!14277 (select (arr!27083 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1619 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421311 () Unit!31519)

(declare-fun lemmaListMapRecursiveValidKeyArray!202 (array!56291 array!56289 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 32) Int) Unit!31519)

(assert (=> b!935281 (= lt!421311 (lemmaListMapRecursiveValidKeyArray!202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!629647 () Bool)

(assert (=> start!79654 (=> (not res!629647) (not e!525227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79654 (= res!629647 (validMask!0 mask!1881))))

(assert (=> start!79654 e!525227))

(assert (=> start!79654 true))

(assert (=> start!79654 tp_is_empty!20149))

(declare-fun array_inv!21162 (array!56289) Bool)

(assert (=> start!79654 (and (array_inv!21162 _values!1231) e!525232)))

(assert (=> start!79654 tp!61370))

(declare-fun array_inv!21163 (array!56291) Bool)

(assert (=> start!79654 (array_inv!21163 _keys!1487)))

(declare-fun b!935282 () Bool)

(assert (=> b!935282 (= e!525230 tp_is_empty!20149)))

(declare-fun b!935283 () Bool)

(declare-fun res!629644 () Bool)

(assert (=> b!935283 (=> (not res!629644) (not e!525228))))

(assert (=> b!935283 (= res!629644 (validKeyInArray!0 k0!1099))))

(declare-fun b!935284 () Bool)

(declare-fun res!629650 () Bool)

(assert (=> b!935284 (=> (not res!629650) (not e!525227))))

(assert (=> b!935284 (= res!629650 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19048))))

(declare-fun b!935285 () Bool)

(declare-fun res!629652 () Bool)

(assert (=> b!935285 (=> (not res!629652) (not e!525227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56291 (_ BitVec 32)) Bool)

(assert (=> b!935285 (= res!629652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935286 () Bool)

(assert (=> b!935286 (= e!525234 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935287 () Bool)

(declare-fun res!629643 () Bool)

(assert (=> b!935287 (=> (not res!629643) (not e!525227))))

(assert (=> b!935287 (= res!629643 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27544 _keys!1487))))))

(declare-fun b!935288 () Bool)

(declare-fun res!629648 () Bool)

(assert (=> b!935288 (=> (not res!629648) (not e!525228))))

(declare-fun v!791 () V!31831)

(declare-fun apply!823 (ListLongMap!11967 (_ BitVec 64)) V!31831)

(assert (=> b!935288 (= res!629648 (= (apply!823 lt!421305 k0!1099) v!791))))

(assert (= (and start!79654 res!629647) b!935275))

(assert (= (and b!935275 res!629646) b!935285))

(assert (= (and b!935285 res!629652) b!935284))

(assert (= (and b!935284 res!629650) b!935287))

(assert (= (and b!935287 res!629643) b!935278))

(assert (= (and b!935278 res!629651) b!935288))

(assert (= (and b!935288 res!629648) b!935280))

(assert (= (and b!935280 res!629645) b!935283))

(assert (= (and b!935283 res!629644) b!935276))

(assert (= (and b!935276 res!629649) b!935281))

(assert (= (and b!935281 c!97434) b!935277))

(assert (= (and b!935281 (not c!97434)) b!935286))

(assert (= (and b!935279 condMapEmpty!31986) mapIsEmpty!31986))

(assert (= (and b!935279 (not condMapEmpty!31986)) mapNonEmpty!31986))

(get-info :version)

(assert (= (and mapNonEmpty!31986 ((_ is ValueCellFull!9593) mapValue!31986)) b!935282))

(assert (= (and b!935279 ((_ is ValueCellFull!9593) mapDefault!31986)) b!935274))

(assert (= start!79654 b!935279))

(declare-fun b_lambda!14007 () Bool)

(assert (=> (not b_lambda!14007) (not b!935281)))

(declare-fun t!27226 () Bool)

(declare-fun tb!6027 () Bool)

(assert (=> (and start!79654 (= defaultEntry!1235 defaultEntry!1235) t!27226) tb!6027))

(declare-fun result!11889 () Bool)

(assert (=> tb!6027 (= result!11889 tp_is_empty!20149)))

(assert (=> b!935281 t!27226))

(declare-fun b_and!28861 () Bool)

(assert (= b_and!28859 (and (=> t!27226 result!11889) b_and!28861)))

(declare-fun m!869953 () Bool)

(assert (=> b!935276 m!869953))

(declare-fun m!869955 () Bool)

(assert (=> b!935276 m!869955))

(declare-fun m!869957 () Bool)

(assert (=> b!935278 m!869957))

(declare-fun m!869959 () Bool)

(assert (=> b!935278 m!869959))

(declare-fun m!869961 () Bool)

(assert (=> b!935277 m!869961))

(declare-fun m!869963 () Bool)

(assert (=> b!935285 m!869963))

(declare-fun m!869965 () Bool)

(assert (=> b!935284 m!869965))

(declare-fun m!869967 () Bool)

(assert (=> mapNonEmpty!31986 m!869967))

(declare-fun m!869969 () Bool)

(assert (=> b!935288 m!869969))

(declare-fun m!869971 () Bool)

(assert (=> b!935281 m!869971))

(declare-fun m!869973 () Bool)

(assert (=> b!935281 m!869973))

(declare-fun m!869975 () Bool)

(assert (=> b!935281 m!869975))

(declare-fun m!869977 () Bool)

(assert (=> b!935281 m!869977))

(declare-fun m!869979 () Bool)

(assert (=> b!935281 m!869979))

(assert (=> b!935281 m!869977))

(assert (=> b!935281 m!869979))

(declare-fun m!869981 () Bool)

(assert (=> b!935281 m!869981))

(declare-fun m!869983 () Bool)

(assert (=> b!935281 m!869983))

(declare-fun m!869985 () Bool)

(assert (=> b!935281 m!869985))

(declare-fun m!869987 () Bool)

(assert (=> b!935281 m!869987))

(assert (=> b!935281 m!869973))

(declare-fun m!869989 () Bool)

(assert (=> b!935281 m!869989))

(declare-fun m!869991 () Bool)

(assert (=> b!935281 m!869991))

(declare-fun m!869993 () Bool)

(assert (=> b!935281 m!869993))

(assert (=> b!935281 m!869991))

(declare-fun m!869995 () Bool)

(assert (=> b!935281 m!869995))

(declare-fun m!869997 () Bool)

(assert (=> start!79654 m!869997))

(declare-fun m!869999 () Bool)

(assert (=> start!79654 m!869999))

(declare-fun m!870001 () Bool)

(assert (=> start!79654 m!870001))

(declare-fun m!870003 () Bool)

(assert (=> b!935283 m!870003))

(check-sat (not b!935285) tp_is_empty!20149 (not b_next!17641) (not mapNonEmpty!31986) (not start!79654) (not b!935284) (not b!935288) b_and!28861 (not b!935283) (not b!935277) (not b_lambda!14007) (not b!935276) (not b!935281) (not b!935278))
(check-sat b_and!28861 (not b_next!17641))
