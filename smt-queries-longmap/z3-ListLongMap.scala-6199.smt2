; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79304 () Bool)

(assert start!79304)

(declare-fun b_free!17517 () Bool)

(declare-fun b_next!17517 () Bool)

(assert (=> start!79304 (= b_free!17517 (not b_next!17517))))

(declare-fun tp!60992 () Bool)

(declare-fun b_and!28585 () Bool)

(assert (=> start!79304 (= tp!60992 b_and!28585)))

(declare-fun b!931414 () Bool)

(declare-fun res!627281 () Bool)

(declare-fun e!523081 () Bool)

(assert (=> b!931414 (=> (not res!627281) (not e!523081))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55990 0))(
  ( (array!55991 (arr!26940 (Array (_ BitVec 32) (_ BitVec 64))) (size!27399 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55990)

(assert (=> b!931414 (= res!627281 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27399 _keys!1487))))))

(declare-fun mapNonEmpty!31794 () Bool)

(declare-fun mapRes!31794 () Bool)

(declare-fun tp!60991 () Bool)

(declare-fun e!523087 () Bool)

(assert (=> mapNonEmpty!31794 (= mapRes!31794 (and tp!60991 e!523087))))

(declare-fun mapKey!31794 () (_ BitVec 32))

(declare-datatypes ((V!31665 0))(
  ( (V!31666 (val!10063 Int)) )
))
(declare-datatypes ((ValueCell!9531 0))(
  ( (ValueCellFull!9531 (v!12581 V!31665)) (EmptyCell!9531) )
))
(declare-datatypes ((array!55992 0))(
  ( (array!55993 (arr!26941 (Array (_ BitVec 32) ValueCell!9531)) (size!27400 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55992)

(declare-fun mapValue!31794 () ValueCell!9531)

(declare-fun mapRest!31794 () (Array (_ BitVec 32) ValueCell!9531))

(assert (=> mapNonEmpty!31794 (= (arr!26941 _values!1231) (store mapRest!31794 mapKey!31794 mapValue!31794))))

(declare-fun mapIsEmpty!31794 () Bool)

(assert (=> mapIsEmpty!31794 mapRes!31794))

(declare-fun b!931415 () Bool)

(declare-fun e!523083 () Bool)

(declare-fun tp_is_empty!20025 () Bool)

(assert (=> b!931415 (= e!523083 tp_is_empty!20025)))

(declare-fun b!931416 () Bool)

(declare-fun res!627283 () Bool)

(declare-fun e!523086 () Bool)

(assert (=> b!931416 (=> (not res!627283) (not e!523086))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31665)

(declare-datatypes ((tuple2!13180 0))(
  ( (tuple2!13181 (_1!6601 (_ BitVec 64)) (_2!6601 V!31665)) )
))
(declare-datatypes ((List!18965 0))(
  ( (Nil!18962) (Cons!18961 (h!20107 tuple2!13180) (t!27026 List!18965)) )
))
(declare-datatypes ((ListLongMap!11877 0))(
  ( (ListLongMap!11878 (toList!5954 List!18965)) )
))
(declare-fun lt!419426 () ListLongMap!11877)

(declare-fun apply!772 (ListLongMap!11877 (_ BitVec 64)) V!31665)

(assert (=> b!931416 (= res!627283 (= (apply!772 lt!419426 k0!1099) v!791))))

(declare-fun b!931417 () Bool)

(declare-fun res!627280 () Bool)

(assert (=> b!931417 (=> (not res!627280) (not e!523086))))

(assert (=> b!931417 (= res!627280 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931418 () Bool)

(declare-fun res!627285 () Bool)

(assert (=> b!931418 (=> (not res!627285) (not e!523081))))

(declare-datatypes ((List!18966 0))(
  ( (Nil!18963) (Cons!18962 (h!20108 (_ BitVec 64)) (t!27027 List!18966)) )
))
(declare-fun arrayNoDuplicates!0 (array!55990 (_ BitVec 32) List!18966) Bool)

(assert (=> b!931418 (= res!627285 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18963))))

(declare-fun b!931419 () Bool)

(declare-fun res!627288 () Bool)

(assert (=> b!931419 (=> (not res!627288) (not e!523081))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55990 (_ BitVec 32)) Bool)

(assert (=> b!931419 (= res!627288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931420 () Bool)

(declare-fun e!523082 () Bool)

(assert (=> b!931420 (= e!523086 e!523082)))

(declare-fun res!627284 () Bool)

(assert (=> b!931420 (=> (not res!627284) (not e!523082))))

(declare-fun lt!419427 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931420 (= res!627284 (validKeyInArray!0 lt!419427))))

(assert (=> b!931420 (= lt!419427 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931421 () Bool)

(declare-fun res!627289 () Bool)

(assert (=> b!931421 (=> (not res!627289) (not e!523086))))

(assert (=> b!931421 (= res!627289 (validKeyInArray!0 k0!1099))))

(declare-fun b!931422 () Bool)

(declare-fun e!523084 () Bool)

(assert (=> b!931422 (= e!523084 (and e!523083 mapRes!31794))))

(declare-fun condMapEmpty!31794 () Bool)

(declare-fun mapDefault!31794 () ValueCell!9531)

(assert (=> b!931422 (= condMapEmpty!31794 (= (arr!26941 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9531)) mapDefault!31794)))))

(declare-fun res!627282 () Bool)

(assert (=> start!79304 (=> (not res!627282) (not e!523081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79304 (= res!627282 (validMask!0 mask!1881))))

(assert (=> start!79304 e!523081))

(assert (=> start!79304 true))

(assert (=> start!79304 tp_is_empty!20025))

(declare-fun array_inv!20970 (array!55992) Bool)

(assert (=> start!79304 (and (array_inv!20970 _values!1231) e!523084)))

(assert (=> start!79304 tp!60992))

(declare-fun array_inv!20971 (array!55990) Bool)

(assert (=> start!79304 (array_inv!20971 _keys!1487)))

(declare-fun b!931423 () Bool)

(assert (=> b!931423 (= e!523081 e!523086)))

(declare-fun res!627286 () Bool)

(assert (=> b!931423 (=> (not res!627286) (not e!523086))))

(declare-fun contains!5001 (ListLongMap!11877 (_ BitVec 64)) Bool)

(assert (=> b!931423 (= res!627286 (contains!5001 lt!419426 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31665)

(declare-fun minValue!1173 () V!31665)

(declare-fun getCurrentListMap!3192 (array!55990 array!55992 (_ BitVec 32) (_ BitVec 32) V!31665 V!31665 (_ BitVec 32) Int) ListLongMap!11877)

(assert (=> b!931423 (= lt!419426 (getCurrentListMap!3192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931424 () Bool)

(assert (=> b!931424 (= e!523082 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27399 _keys!1487))))))

(declare-fun +!2761 (ListLongMap!11877 tuple2!13180) ListLongMap!11877)

(declare-fun get!14156 (ValueCell!9531 V!31665) V!31665)

(declare-fun dynLambda!1550 (Int (_ BitVec 64)) V!31665)

(assert (=> b!931424 (= (getCurrentListMap!3192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2761 (getCurrentListMap!3192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13181 lt!419427 (get!14156 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1550 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31432 0))(
  ( (Unit!31433) )
))
(declare-fun lt!419428 () Unit!31432)

(declare-fun lemmaListMapRecursiveValidKeyArray!151 (array!55990 array!55992 (_ BitVec 32) (_ BitVec 32) V!31665 V!31665 (_ BitVec 32) Int) Unit!31432)

(assert (=> b!931424 (= lt!419428 (lemmaListMapRecursiveValidKeyArray!151 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931425 () Bool)

(assert (=> b!931425 (= e!523087 tp_is_empty!20025)))

(declare-fun b!931426 () Bool)

(declare-fun res!627287 () Bool)

(assert (=> b!931426 (=> (not res!627287) (not e!523081))))

(assert (=> b!931426 (= res!627287 (and (= (size!27400 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27399 _keys!1487) (size!27400 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79304 res!627282) b!931426))

(assert (= (and b!931426 res!627287) b!931419))

(assert (= (and b!931419 res!627288) b!931418))

(assert (= (and b!931418 res!627285) b!931414))

(assert (= (and b!931414 res!627281) b!931423))

(assert (= (and b!931423 res!627286) b!931416))

(assert (= (and b!931416 res!627283) b!931417))

(assert (= (and b!931417 res!627280) b!931421))

(assert (= (and b!931421 res!627289) b!931420))

(assert (= (and b!931420 res!627284) b!931424))

(assert (= (and b!931422 condMapEmpty!31794) mapIsEmpty!31794))

(assert (= (and b!931422 (not condMapEmpty!31794)) mapNonEmpty!31794))

(get-info :version)

(assert (= (and mapNonEmpty!31794 ((_ is ValueCellFull!9531) mapValue!31794)) b!931425))

(assert (= (and b!931422 ((_ is ValueCellFull!9531) mapDefault!31794)) b!931415))

(assert (= start!79304 b!931422))

(declare-fun b_lambda!13833 () Bool)

(assert (=> (not b_lambda!13833) (not b!931424)))

(declare-fun t!27025 () Bool)

(declare-fun tb!5911 () Bool)

(assert (=> (and start!79304 (= defaultEntry!1235 defaultEntry!1235) t!27025) tb!5911))

(declare-fun result!11645 () Bool)

(assert (=> tb!5911 (= result!11645 tp_is_empty!20025)))

(assert (=> b!931424 t!27025))

(declare-fun b_and!28587 () Bool)

(assert (= b_and!28585 (and (=> t!27025 result!11645) b_and!28587)))

(declare-fun m!865301 () Bool)

(assert (=> b!931419 m!865301))

(declare-fun m!865303 () Bool)

(assert (=> b!931423 m!865303))

(declare-fun m!865305 () Bool)

(assert (=> b!931423 m!865305))

(declare-fun m!865307 () Bool)

(assert (=> b!931416 m!865307))

(declare-fun m!865309 () Bool)

(assert (=> mapNonEmpty!31794 m!865309))

(declare-fun m!865311 () Bool)

(assert (=> b!931421 m!865311))

(declare-fun m!865313 () Bool)

(assert (=> start!79304 m!865313))

(declare-fun m!865315 () Bool)

(assert (=> start!79304 m!865315))

(declare-fun m!865317 () Bool)

(assert (=> start!79304 m!865317))

(declare-fun m!865319 () Bool)

(assert (=> b!931418 m!865319))

(declare-fun m!865321 () Bool)

(assert (=> b!931424 m!865321))

(declare-fun m!865323 () Bool)

(assert (=> b!931424 m!865323))

(assert (=> b!931424 m!865321))

(assert (=> b!931424 m!865323))

(declare-fun m!865325 () Bool)

(assert (=> b!931424 m!865325))

(declare-fun m!865327 () Bool)

(assert (=> b!931424 m!865327))

(declare-fun m!865329 () Bool)

(assert (=> b!931424 m!865329))

(assert (=> b!931424 m!865329))

(declare-fun m!865331 () Bool)

(assert (=> b!931424 m!865331))

(declare-fun m!865333 () Bool)

(assert (=> b!931424 m!865333))

(declare-fun m!865335 () Bool)

(assert (=> b!931420 m!865335))

(declare-fun m!865337 () Bool)

(assert (=> b!931420 m!865337))

(check-sat (not b_next!17517) tp_is_empty!20025 (not b!931423) (not mapNonEmpty!31794) (not b!931416) (not b!931419) b_and!28587 (not b!931424) (not b_lambda!13833) (not b!931421) (not b!931420) (not b!931418) (not start!79304))
(check-sat b_and!28587 (not b_next!17517))
