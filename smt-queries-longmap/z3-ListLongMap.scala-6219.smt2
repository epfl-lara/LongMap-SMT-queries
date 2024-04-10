; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79482 () Bool)

(assert start!79482)

(declare-fun b_free!17637 () Bool)

(declare-fun b_next!17637 () Bool)

(assert (=> start!79482 (= b_free!17637 (not b_next!17637))))

(declare-fun tp!61357 () Bool)

(declare-fun b_and!28841 () Bool)

(assert (=> start!79482 (= tp!61357 b_and!28841)))

(declare-fun b!934277 () Bool)

(declare-fun res!629244 () Bool)

(declare-fun e!524600 () Bool)

(assert (=> b!934277 (=> (not res!629244) (not e!524600))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31825 0))(
  ( (V!31826 (val!10123 Int)) )
))
(declare-fun v!791 () V!31825)

(declare-datatypes ((tuple2!13276 0))(
  ( (tuple2!13277 (_1!6649 (_ BitVec 64)) (_2!6649 V!31825)) )
))
(declare-datatypes ((List!19057 0))(
  ( (Nil!19054) (Cons!19053 (h!20199 tuple2!13276) (t!27238 List!19057)) )
))
(declare-datatypes ((ListLongMap!11973 0))(
  ( (ListLongMap!11974 (toList!6002 List!19057)) )
))
(declare-fun lt!420896 () ListLongMap!11973)

(declare-fun apply!808 (ListLongMap!11973 (_ BitVec 64)) V!31825)

(assert (=> b!934277 (= res!629244 (= (apply!808 lt!420896 k0!1099) v!791))))

(declare-fun mapNonEmpty!31980 () Bool)

(declare-fun mapRes!31980 () Bool)

(declare-fun tp!61358 () Bool)

(declare-fun e!524602 () Bool)

(assert (=> mapNonEmpty!31980 (= mapRes!31980 (and tp!61358 e!524602))))

(declare-datatypes ((ValueCell!9591 0))(
  ( (ValueCellFull!9591 (v!12643 V!31825)) (EmptyCell!9591) )
))
(declare-fun mapValue!31980 () ValueCell!9591)

(declare-fun mapKey!31980 () (_ BitVec 32))

(declare-datatypes ((array!56228 0))(
  ( (array!56229 (arr!27057 (Array (_ BitVec 32) ValueCell!9591)) (size!27516 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56228)

(declare-fun mapRest!31980 () (Array (_ BitVec 32) ValueCell!9591))

(assert (=> mapNonEmpty!31980 (= (arr!27057 _values!1231) (store mapRest!31980 mapKey!31980 mapValue!31980))))

(declare-fun res!629246 () Bool)

(declare-fun e!524603 () Bool)

(assert (=> start!79482 (=> (not res!629246) (not e!524603))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79482 (= res!629246 (validMask!0 mask!1881))))

(assert (=> start!79482 e!524603))

(assert (=> start!79482 true))

(declare-fun tp_is_empty!20145 () Bool)

(assert (=> start!79482 tp_is_empty!20145))

(declare-fun e!524597 () Bool)

(declare-fun array_inv!21058 (array!56228) Bool)

(assert (=> start!79482 (and (array_inv!21058 _values!1231) e!524597)))

(assert (=> start!79482 tp!61357))

(declare-datatypes ((array!56230 0))(
  ( (array!56231 (arr!27058 (Array (_ BitVec 32) (_ BitVec 64))) (size!27517 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56230)

(declare-fun array_inv!21059 (array!56230) Bool)

(assert (=> start!79482 (array_inv!21059 _keys!1487)))

(declare-fun b!934278 () Bool)

(declare-fun res!629245 () Bool)

(assert (=> b!934278 (=> (not res!629245) (not e!524603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56230 (_ BitVec 32)) Bool)

(assert (=> b!934278 (= res!629245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934279 () Bool)

(declare-fun e!524598 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!934279 (= e!524598 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934280 () Bool)

(declare-fun res!629247 () Bool)

(assert (=> b!934280 (=> (not res!629247) (not e!524600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934280 (= res!629247 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31980 () Bool)

(assert (=> mapIsEmpty!31980 mapRes!31980))

(declare-fun b!934281 () Bool)

(declare-fun res!629243 () Bool)

(assert (=> b!934281 (=> (not res!629243) (not e!524600))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934281 (= res!629243 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934282 () Bool)

(declare-fun res!629239 () Bool)

(assert (=> b!934282 (=> (not res!629239) (not e!524603))))

(declare-datatypes ((List!19058 0))(
  ( (Nil!19055) (Cons!19054 (h!20200 (_ BitVec 64)) (t!27239 List!19058)) )
))
(declare-fun arrayNoDuplicates!0 (array!56230 (_ BitVec 32) List!19058) Bool)

(assert (=> b!934282 (= res!629239 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19055))))

(declare-fun b!934283 () Bool)

(assert (=> b!934283 (= e!524602 tp_is_empty!20145)))

(declare-fun b!934284 () Bool)

(declare-fun e!524604 () Bool)

(assert (=> b!934284 (= e!524600 e!524604)))

(declare-fun res!629241 () Bool)

(assert (=> b!934284 (=> (not res!629241) (not e!524604))))

(declare-fun lt!420897 () (_ BitVec 64))

(assert (=> b!934284 (= res!629241 (validKeyInArray!0 lt!420897))))

(assert (=> b!934284 (= lt!420897 (select (arr!27058 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934285 () Bool)

(assert (=> b!934285 (= e!524603 e!524600)))

(declare-fun res!629248 () Bool)

(assert (=> b!934285 (=> (not res!629248) (not e!524600))))

(declare-fun contains!5053 (ListLongMap!11973 (_ BitVec 64)) Bool)

(assert (=> b!934285 (= res!629248 (contains!5053 lt!420896 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31825)

(declare-fun minValue!1173 () V!31825)

(declare-fun getCurrentListMap!3240 (array!56230 array!56228 (_ BitVec 32) (_ BitVec 32) V!31825 V!31825 (_ BitVec 32) Int) ListLongMap!11973)

(assert (=> b!934285 (= lt!420896 (getCurrentListMap!3240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934286 () Bool)

(assert (=> b!934286 (= e!524604 (not true))))

(assert (=> b!934286 e!524598))

(declare-fun c!97146 () Bool)

(assert (=> b!934286 (= c!97146 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31522 0))(
  ( (Unit!31523) )
))
(declare-fun lt!420903 () Unit!31522)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!273 (array!56230 array!56228 (_ BitVec 32) (_ BitVec 32) V!31825 V!31825 (_ BitVec 64) (_ BitVec 32) Int) Unit!31522)

(assert (=> b!934286 (= lt!420903 (lemmaListMapContainsThenArrayContainsFrom!273 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934286 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19055)))

(declare-fun lt!420899 () Unit!31522)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56230 (_ BitVec 32) (_ BitVec 32)) Unit!31522)

(assert (=> b!934286 (= lt!420899 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420898 () tuple2!13276)

(declare-fun +!2801 (ListLongMap!11973 tuple2!13276) ListLongMap!11973)

(assert (=> b!934286 (contains!5053 (+!2801 lt!420896 lt!420898) k0!1099)))

(declare-fun lt!420900 () V!31825)

(declare-fun lt!420901 () Unit!31522)

(declare-fun addStillContains!520 (ListLongMap!11973 (_ BitVec 64) V!31825 (_ BitVec 64)) Unit!31522)

(assert (=> b!934286 (= lt!420901 (addStillContains!520 lt!420896 lt!420897 lt!420900 k0!1099))))

(assert (=> b!934286 (= (getCurrentListMap!3240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2801 (getCurrentListMap!3240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420898))))

(assert (=> b!934286 (= lt!420898 (tuple2!13277 lt!420897 lt!420900))))

(declare-fun get!14242 (ValueCell!9591 V!31825) V!31825)

(declare-fun dynLambda!1590 (Int (_ BitVec 64)) V!31825)

(assert (=> b!934286 (= lt!420900 (get!14242 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420902 () Unit!31522)

(declare-fun lemmaListMapRecursiveValidKeyArray!191 (array!56230 array!56228 (_ BitVec 32) (_ BitVec 32) V!31825 V!31825 (_ BitVec 32) Int) Unit!31522)

(assert (=> b!934286 (= lt!420902 (lemmaListMapRecursiveValidKeyArray!191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934287 () Bool)

(declare-fun res!629242 () Bool)

(assert (=> b!934287 (=> (not res!629242) (not e!524603))))

(assert (=> b!934287 (= res!629242 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27517 _keys!1487))))))

(declare-fun b!934288 () Bool)

(declare-fun e!524601 () Bool)

(assert (=> b!934288 (= e!524597 (and e!524601 mapRes!31980))))

(declare-fun condMapEmpty!31980 () Bool)

(declare-fun mapDefault!31980 () ValueCell!9591)

(assert (=> b!934288 (= condMapEmpty!31980 (= (arr!27057 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9591)) mapDefault!31980)))))

(declare-fun b!934289 () Bool)

(assert (=> b!934289 (= e!524601 tp_is_empty!20145)))

(declare-fun b!934290 () Bool)

(declare-fun res!629240 () Bool)

(assert (=> b!934290 (=> (not res!629240) (not e!524603))))

(assert (=> b!934290 (= res!629240 (and (= (size!27516 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27517 _keys!1487) (size!27516 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934291 () Bool)

(declare-fun arrayContainsKey!0 (array!56230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934291 (= e!524598 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79482 res!629246) b!934290))

(assert (= (and b!934290 res!629240) b!934278))

(assert (= (and b!934278 res!629245) b!934282))

(assert (= (and b!934282 res!629239) b!934287))

(assert (= (and b!934287 res!629242) b!934285))

(assert (= (and b!934285 res!629248) b!934277))

(assert (= (and b!934277 res!629244) b!934281))

(assert (= (and b!934281 res!629243) b!934280))

(assert (= (and b!934280 res!629247) b!934284))

(assert (= (and b!934284 res!629241) b!934286))

(assert (= (and b!934286 c!97146) b!934291))

(assert (= (and b!934286 (not c!97146)) b!934279))

(assert (= (and b!934288 condMapEmpty!31980) mapIsEmpty!31980))

(assert (= (and b!934288 (not condMapEmpty!31980)) mapNonEmpty!31980))

(get-info :version)

(assert (= (and mapNonEmpty!31980 ((_ is ValueCellFull!9591) mapValue!31980)) b!934283))

(assert (= (and b!934288 ((_ is ValueCellFull!9591) mapDefault!31980)) b!934289))

(assert (= start!79482 b!934288))

(declare-fun b_lambda!13989 () Bool)

(assert (=> (not b_lambda!13989) (not b!934286)))

(declare-fun t!27237 () Bool)

(declare-fun tb!6031 () Bool)

(assert (=> (and start!79482 (= defaultEntry!1235 defaultEntry!1235) t!27237) tb!6031))

(declare-fun result!11889 () Bool)

(assert (=> tb!6031 (= result!11889 tp_is_empty!20145)))

(assert (=> b!934286 t!27237))

(declare-fun b_and!28843 () Bool)

(assert (= b_and!28841 (and (=> t!27237 result!11889) b_and!28843)))

(declare-fun m!868555 () Bool)

(assert (=> b!934291 m!868555))

(declare-fun m!868557 () Bool)

(assert (=> start!79482 m!868557))

(declare-fun m!868559 () Bool)

(assert (=> start!79482 m!868559))

(declare-fun m!868561 () Bool)

(assert (=> start!79482 m!868561))

(declare-fun m!868563 () Bool)

(assert (=> b!934277 m!868563))

(declare-fun m!868565 () Bool)

(assert (=> b!934280 m!868565))

(declare-fun m!868567 () Bool)

(assert (=> mapNonEmpty!31980 m!868567))

(declare-fun m!868569 () Bool)

(assert (=> b!934284 m!868569))

(declare-fun m!868571 () Bool)

(assert (=> b!934284 m!868571))

(declare-fun m!868573 () Bool)

(assert (=> b!934282 m!868573))

(declare-fun m!868575 () Bool)

(assert (=> b!934285 m!868575))

(declare-fun m!868577 () Bool)

(assert (=> b!934285 m!868577))

(declare-fun m!868579 () Bool)

(assert (=> b!934286 m!868579))

(declare-fun m!868581 () Bool)

(assert (=> b!934286 m!868581))

(declare-fun m!868583 () Bool)

(assert (=> b!934286 m!868583))

(declare-fun m!868585 () Bool)

(assert (=> b!934286 m!868585))

(declare-fun m!868587 () Bool)

(assert (=> b!934286 m!868587))

(assert (=> b!934286 m!868585))

(declare-fun m!868589 () Bool)

(assert (=> b!934286 m!868589))

(declare-fun m!868591 () Bool)

(assert (=> b!934286 m!868591))

(assert (=> b!934286 m!868581))

(declare-fun m!868593 () Bool)

(assert (=> b!934286 m!868593))

(declare-fun m!868595 () Bool)

(assert (=> b!934286 m!868595))

(declare-fun m!868597 () Bool)

(assert (=> b!934286 m!868597))

(declare-fun m!868599 () Bool)

(assert (=> b!934286 m!868599))

(assert (=> b!934286 m!868587))

(assert (=> b!934286 m!868597))

(declare-fun m!868601 () Bool)

(assert (=> b!934286 m!868601))

(declare-fun m!868603 () Bool)

(assert (=> b!934286 m!868603))

(declare-fun m!868605 () Bool)

(assert (=> b!934278 m!868605))

(check-sat (not start!79482) tp_is_empty!20145 (not b!934285) (not b!934284) (not mapNonEmpty!31980) (not b!934291) (not b!934282) b_and!28843 (not b!934278) (not b_lambda!13989) (not b!934286) (not b!934280) (not b!934277) (not b_next!17637))
(check-sat b_and!28843 (not b_next!17637))
