; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79366 () Bool)

(assert start!79366)

(declare-fun b_free!17553 () Bool)

(declare-fun b_next!17553 () Bool)

(assert (=> start!79366 (= b_free!17553 (not b_next!17553))))

(declare-fun tp!61102 () Bool)

(declare-fun b_and!28665 () Bool)

(assert (=> start!79366 (= tp!61102 b_and!28665)))

(declare-fun b!932322 () Bool)

(declare-fun res!627895 () Bool)

(declare-fun e!523573 () Bool)

(assert (=> b!932322 (=> (not res!627895) (not e!523573))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56062 0))(
  ( (array!56063 (arr!26975 (Array (_ BitVec 32) (_ BitVec 64))) (size!27434 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56062)

(assert (=> b!932322 (= res!627895 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27434 _keys!1487))))))

(declare-fun b!932323 () Bool)

(declare-fun e!523574 () Bool)

(declare-fun tp_is_empty!20061 () Bool)

(assert (=> b!932323 (= e!523574 tp_is_empty!20061)))

(declare-fun b!932324 () Bool)

(declare-fun e!523575 () Bool)

(assert (=> b!932324 (= e!523575 (not (or (bvsge (size!27434 _keys!1487) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!27434 _keys!1487)) (bvsle (bvsub from!1844 #b00000000000000000000000000000001) (size!27434 _keys!1487)))))))

(declare-datatypes ((V!31713 0))(
  ( (V!31714 (val!10081 Int)) )
))
(declare-datatypes ((tuple2!13206 0))(
  ( (tuple2!13207 (_1!6614 (_ BitVec 64)) (_2!6614 V!31713)) )
))
(declare-datatypes ((List!18991 0))(
  ( (Nil!18988) (Cons!18987 (h!20133 tuple2!13206) (t!27088 List!18991)) )
))
(declare-datatypes ((ListLongMap!11903 0))(
  ( (ListLongMap!11904 (toList!5967 List!18991)) )
))
(declare-fun lt!419844 () ListLongMap!11903)

(declare-fun lt!419842 () tuple2!13206)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5016 (ListLongMap!11903 (_ BitVec 64)) Bool)

(declare-fun +!2773 (ListLongMap!11903 tuple2!13206) ListLongMap!11903)

(assert (=> b!932324 (contains!5016 (+!2773 lt!419844 lt!419842) k0!1099)))

(declare-fun lt!419843 () V!31713)

(declare-fun lt!419841 () (_ BitVec 64))

(declare-datatypes ((Unit!31461 0))(
  ( (Unit!31462) )
))
(declare-fun lt!419846 () Unit!31461)

(declare-fun addStillContains!492 (ListLongMap!11903 (_ BitVec 64) V!31713 (_ BitVec 64)) Unit!31461)

(assert (=> b!932324 (= lt!419846 (addStillContains!492 lt!419844 lt!419841 lt!419843 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9549 0))(
  ( (ValueCellFull!9549 (v!12600 V!31713)) (EmptyCell!9549) )
))
(declare-datatypes ((array!56064 0))(
  ( (array!56065 (arr!26976 (Array (_ BitVec 32) ValueCell!9549)) (size!27435 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56064)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31713)

(declare-fun minValue!1173 () V!31713)

(declare-fun getCurrentListMap!3205 (array!56062 array!56064 (_ BitVec 32) (_ BitVec 32) V!31713 V!31713 (_ BitVec 32) Int) ListLongMap!11903)

(assert (=> b!932324 (= (getCurrentListMap!3205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2773 (getCurrentListMap!3205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419842))))

(assert (=> b!932324 (= lt!419842 (tuple2!13207 lt!419841 lt!419843))))

(declare-fun get!14183 (ValueCell!9549 V!31713) V!31713)

(declare-fun dynLambda!1562 (Int (_ BitVec 64)) V!31713)

(assert (=> b!932324 (= lt!419843 (get!14183 (select (arr!26976 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1562 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419845 () Unit!31461)

(declare-fun lemmaListMapRecursiveValidKeyArray!163 (array!56062 array!56064 (_ BitVec 32) (_ BitVec 32) V!31713 V!31713 (_ BitVec 32) Int) Unit!31461)

(assert (=> b!932324 (= lt!419845 (lemmaListMapRecursiveValidKeyArray!163 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31851 () Bool)

(declare-fun mapRes!31851 () Bool)

(declare-fun tp!61103 () Bool)

(declare-fun e!523570 () Bool)

(assert (=> mapNonEmpty!31851 (= mapRes!31851 (and tp!61103 e!523570))))

(declare-fun mapValue!31851 () ValueCell!9549)

(declare-fun mapRest!31851 () (Array (_ BitVec 32) ValueCell!9549))

(declare-fun mapKey!31851 () (_ BitVec 32))

(assert (=> mapNonEmpty!31851 (= (arr!26976 _values!1231) (store mapRest!31851 mapKey!31851 mapValue!31851))))

(declare-fun b!932325 () Bool)

(declare-fun e!523572 () Bool)

(assert (=> b!932325 (= e!523572 e!523575)))

(declare-fun res!627900 () Bool)

(assert (=> b!932325 (=> (not res!627900) (not e!523575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932325 (= res!627900 (validKeyInArray!0 lt!419841))))

(assert (=> b!932325 (= lt!419841 (select (arr!26975 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932326 () Bool)

(declare-fun res!627902 () Bool)

(assert (=> b!932326 (=> (not res!627902) (not e!523573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56062 (_ BitVec 32)) Bool)

(assert (=> b!932326 (= res!627902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932327 () Bool)

(assert (=> b!932327 (= e!523570 tp_is_empty!20061)))

(declare-fun res!627903 () Bool)

(assert (=> start!79366 (=> (not res!627903) (not e!523573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79366 (= res!627903 (validMask!0 mask!1881))))

(assert (=> start!79366 e!523573))

(assert (=> start!79366 true))

(assert (=> start!79366 tp_is_empty!20061))

(declare-fun e!523569 () Bool)

(declare-fun array_inv!20998 (array!56064) Bool)

(assert (=> start!79366 (and (array_inv!20998 _values!1231) e!523569)))

(assert (=> start!79366 tp!61102))

(declare-fun array_inv!20999 (array!56062) Bool)

(assert (=> start!79366 (array_inv!20999 _keys!1487)))

(declare-fun b!932328 () Bool)

(assert (=> b!932328 (= e!523569 (and e!523574 mapRes!31851))))

(declare-fun condMapEmpty!31851 () Bool)

(declare-fun mapDefault!31851 () ValueCell!9549)

(assert (=> b!932328 (= condMapEmpty!31851 (= (arr!26976 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9549)) mapDefault!31851)))))

(declare-fun b!932329 () Bool)

(assert (=> b!932329 (= e!523573 e!523572)))

(declare-fun res!627899 () Bool)

(assert (=> b!932329 (=> (not res!627899) (not e!523572))))

(assert (=> b!932329 (= res!627899 (contains!5016 lt!419844 k0!1099))))

(assert (=> b!932329 (= lt!419844 (getCurrentListMap!3205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932330 () Bool)

(declare-fun res!627904 () Bool)

(assert (=> b!932330 (=> (not res!627904) (not e!523573))))

(declare-datatypes ((List!18992 0))(
  ( (Nil!18989) (Cons!18988 (h!20134 (_ BitVec 64)) (t!27089 List!18992)) )
))
(declare-fun arrayNoDuplicates!0 (array!56062 (_ BitVec 32) List!18992) Bool)

(assert (=> b!932330 (= res!627904 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18989))))

(declare-fun b!932331 () Bool)

(declare-fun res!627897 () Bool)

(assert (=> b!932331 (=> (not res!627897) (not e!523572))))

(assert (=> b!932331 (= res!627897 (validKeyInArray!0 k0!1099))))

(declare-fun b!932332 () Bool)

(declare-fun res!627896 () Bool)

(assert (=> b!932332 (=> (not res!627896) (not e!523572))))

(assert (=> b!932332 (= res!627896 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31851 () Bool)

(assert (=> mapIsEmpty!31851 mapRes!31851))

(declare-fun b!932333 () Bool)

(declare-fun res!627898 () Bool)

(assert (=> b!932333 (=> (not res!627898) (not e!523573))))

(assert (=> b!932333 (= res!627898 (and (= (size!27435 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27434 _keys!1487) (size!27435 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932334 () Bool)

(declare-fun res!627901 () Bool)

(assert (=> b!932334 (=> (not res!627901) (not e!523572))))

(declare-fun v!791 () V!31713)

(declare-fun apply!781 (ListLongMap!11903 (_ BitVec 64)) V!31713)

(assert (=> b!932334 (= res!627901 (= (apply!781 lt!419844 k0!1099) v!791))))

(assert (= (and start!79366 res!627903) b!932333))

(assert (= (and b!932333 res!627898) b!932326))

(assert (= (and b!932326 res!627902) b!932330))

(assert (= (and b!932330 res!627904) b!932322))

(assert (= (and b!932322 res!627895) b!932329))

(assert (= (and b!932329 res!627899) b!932334))

(assert (= (and b!932334 res!627901) b!932332))

(assert (= (and b!932332 res!627896) b!932331))

(assert (= (and b!932331 res!627897) b!932325))

(assert (= (and b!932325 res!627900) b!932324))

(assert (= (and b!932328 condMapEmpty!31851) mapIsEmpty!31851))

(assert (= (and b!932328 (not condMapEmpty!31851)) mapNonEmpty!31851))

(get-info :version)

(assert (= (and mapNonEmpty!31851 ((_ is ValueCellFull!9549) mapValue!31851)) b!932327))

(assert (= (and b!932328 ((_ is ValueCellFull!9549) mapDefault!31851)) b!932323))

(assert (= start!79366 b!932328))

(declare-fun b_lambda!13887 () Bool)

(assert (=> (not b_lambda!13887) (not b!932324)))

(declare-fun t!27087 () Bool)

(declare-fun tb!5947 () Bool)

(assert (=> (and start!79366 (= defaultEntry!1235 defaultEntry!1235) t!27087) tb!5947))

(declare-fun result!11719 () Bool)

(assert (=> tb!5947 (= result!11719 tp_is_empty!20061)))

(assert (=> b!932324 t!27087))

(declare-fun b_and!28667 () Bool)

(assert (= b_and!28665 (and (=> t!27087 result!11719) b_and!28667)))

(declare-fun m!866283 () Bool)

(assert (=> mapNonEmpty!31851 m!866283))

(declare-fun m!866285 () Bool)

(assert (=> b!932329 m!866285))

(declare-fun m!866287 () Bool)

(assert (=> b!932329 m!866287))

(declare-fun m!866289 () Bool)

(assert (=> b!932324 m!866289))

(declare-fun m!866291 () Bool)

(assert (=> b!932324 m!866291))

(declare-fun m!866293 () Bool)

(assert (=> b!932324 m!866293))

(declare-fun m!866295 () Bool)

(assert (=> b!932324 m!866295))

(assert (=> b!932324 m!866289))

(assert (=> b!932324 m!866291))

(declare-fun m!866297 () Bool)

(assert (=> b!932324 m!866297))

(declare-fun m!866299 () Bool)

(assert (=> b!932324 m!866299))

(assert (=> b!932324 m!866295))

(declare-fun m!866301 () Bool)

(assert (=> b!932324 m!866301))

(declare-fun m!866303 () Bool)

(assert (=> b!932324 m!866303))

(assert (=> b!932324 m!866303))

(declare-fun m!866305 () Bool)

(assert (=> b!932324 m!866305))

(declare-fun m!866307 () Bool)

(assert (=> b!932324 m!866307))

(declare-fun m!866309 () Bool)

(assert (=> start!79366 m!866309))

(declare-fun m!866311 () Bool)

(assert (=> start!79366 m!866311))

(declare-fun m!866313 () Bool)

(assert (=> start!79366 m!866313))

(declare-fun m!866315 () Bool)

(assert (=> b!932325 m!866315))

(declare-fun m!866317 () Bool)

(assert (=> b!932325 m!866317))

(declare-fun m!866319 () Bool)

(assert (=> b!932331 m!866319))

(declare-fun m!866321 () Bool)

(assert (=> b!932334 m!866321))

(declare-fun m!866323 () Bool)

(assert (=> b!932326 m!866323))

(declare-fun m!866325 () Bool)

(assert (=> b!932330 m!866325))

(check-sat (not b!932324) b_and!28667 (not b_lambda!13887) (not b!932325) (not b_next!17553) tp_is_empty!20061 (not b!932331) (not mapNonEmpty!31851) (not b!932334) (not b!932326) (not start!79366) (not b!932329) (not b!932330))
(check-sat b_and!28667 (not b_next!17553))
