; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79474 () Bool)

(assert start!79474)

(declare-fun b_free!17647 () Bool)

(declare-fun b_next!17647 () Bool)

(assert (=> start!79474 (= b_free!17647 (not b_next!17647))))

(declare-fun tp!61388 () Bool)

(declare-fun b_and!28835 () Bool)

(assert (=> start!79474 (= tp!61388 b_and!28835)))

(declare-fun b!934273 () Bool)

(declare-fun e!524571 () Bool)

(declare-fun e!524573 () Bool)

(assert (=> b!934273 (= e!524571 e!524573)))

(declare-fun res!629283 () Bool)

(assert (=> b!934273 (=> (not res!629283) (not e!524573))))

(declare-fun lt!420786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934273 (= res!629283 (validKeyInArray!0 lt!420786))))

(declare-datatypes ((array!56213 0))(
  ( (array!56214 (arr!27050 (Array (_ BitVec 32) (_ BitVec 64))) (size!27511 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56213)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934273 (= lt!420786 (select (arr!27050 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934274 () Bool)

(declare-fun e!524574 () Bool)

(declare-fun tp_is_empty!20155 () Bool)

(assert (=> b!934274 (= e!524574 tp_is_empty!20155)))

(declare-fun b!934275 () Bool)

(declare-fun res!629287 () Bool)

(declare-fun e!524572 () Bool)

(assert (=> b!934275 (=> (not res!629287) (not e!524572))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31839 0))(
  ( (V!31840 (val!10128 Int)) )
))
(declare-datatypes ((ValueCell!9596 0))(
  ( (ValueCellFull!9596 (v!12647 V!31839)) (EmptyCell!9596) )
))
(declare-datatypes ((array!56215 0))(
  ( (array!56216 (arr!27051 (Array (_ BitVec 32) ValueCell!9596)) (size!27512 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56215)

(assert (=> b!934275 (= res!629287 (and (= (size!27512 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27511 _keys!1487) (size!27512 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934276 () Bool)

(declare-fun res!629284 () Bool)

(assert (=> b!934276 (=> (not res!629284) (not e!524571))))

(assert (=> b!934276 (= res!629284 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934277 () Bool)

(declare-fun res!629280 () Bool)

(assert (=> b!934277 (=> (not res!629280) (not e!524572))))

(declare-datatypes ((List!19091 0))(
  ( (Nil!19088) (Cons!19087 (h!20233 (_ BitVec 64)) (t!27273 List!19091)) )
))
(declare-fun arrayNoDuplicates!0 (array!56213 (_ BitVec 32) List!19091) Bool)

(assert (=> b!934277 (= res!629280 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19088))))

(declare-fun b!934278 () Bool)

(declare-fun e!524575 () Bool)

(assert (=> b!934278 (= e!524575 tp_is_empty!20155)))

(declare-fun b!934279 () Bool)

(declare-fun res!629282 () Bool)

(assert (=> b!934279 (=> (not res!629282) (not e!524571))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31839)

(declare-datatypes ((tuple2!13344 0))(
  ( (tuple2!13345 (_1!6683 (_ BitVec 64)) (_2!6683 V!31839)) )
))
(declare-datatypes ((List!19092 0))(
  ( (Nil!19089) (Cons!19088 (h!20234 tuple2!13344) (t!27274 List!19092)) )
))
(declare-datatypes ((ListLongMap!12031 0))(
  ( (ListLongMap!12032 (toList!6031 List!19092)) )
))
(declare-fun lt!420782 () ListLongMap!12031)

(declare-fun apply!813 (ListLongMap!12031 (_ BitVec 64)) V!31839)

(assert (=> b!934279 (= res!629282 (= (apply!813 lt!420782 k0!1099) v!791))))

(declare-fun mapNonEmpty!31995 () Bool)

(declare-fun mapRes!31995 () Bool)

(declare-fun tp!61389 () Bool)

(assert (=> mapNonEmpty!31995 (= mapRes!31995 (and tp!61389 e!524574))))

(declare-fun mapRest!31995 () (Array (_ BitVec 32) ValueCell!9596))

(declare-fun mapValue!31995 () ValueCell!9596)

(declare-fun mapKey!31995 () (_ BitVec 32))

(assert (=> mapNonEmpty!31995 (= (arr!27051 _values!1231) (store mapRest!31995 mapKey!31995 mapValue!31995))))

(declare-fun b!934280 () Bool)

(declare-fun res!629279 () Bool)

(assert (=> b!934280 (=> (not res!629279) (not e!524572))))

(assert (=> b!934280 (= res!629279 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27511 _keys!1487))))))

(declare-fun b!934281 () Bool)

(declare-fun res!629288 () Bool)

(assert (=> b!934281 (=> (not res!629288) (not e!524571))))

(assert (=> b!934281 (= res!629288 (validKeyInArray!0 k0!1099))))

(declare-fun b!934282 () Bool)

(declare-fun e!524576 () Bool)

(assert (=> b!934282 (= e!524576 (and e!524575 mapRes!31995))))

(declare-fun condMapEmpty!31995 () Bool)

(declare-fun mapDefault!31995 () ValueCell!9596)

(assert (=> b!934282 (= condMapEmpty!31995 (= (arr!27051 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9596)) mapDefault!31995)))))

(declare-fun b!934283 () Bool)

(assert (=> b!934283 (= e!524573 (not (or (bvsge (size!27511 _keys!1487) #b01111111111111111111111111111111) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27511 _keys!1487)))))))

(declare-fun e!524569 () Bool)

(assert (=> b!934283 e!524569))

(declare-fun c!97096 () Bool)

(assert (=> b!934283 (= c!97096 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31437 0))(
  ( (Unit!31438) )
))
(declare-fun lt!420784 () Unit!31437)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31839)

(declare-fun minValue!1173 () V!31839)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!278 (array!56213 array!56215 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 64) (_ BitVec 32) Int) Unit!31437)

(assert (=> b!934283 (= lt!420784 (lemmaListMapContainsThenArrayContainsFrom!278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934283 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19088)))

(declare-fun lt!420785 () Unit!31437)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56213 (_ BitVec 32) (_ BitVec 32)) Unit!31437)

(assert (=> b!934283 (= lt!420785 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420780 () tuple2!13344)

(declare-fun contains!5028 (ListLongMap!12031 (_ BitVec 64)) Bool)

(declare-fun +!2831 (ListLongMap!12031 tuple2!13344) ListLongMap!12031)

(assert (=> b!934283 (contains!5028 (+!2831 lt!420782 lt!420780) k0!1099)))

(declare-fun lt!420781 () Unit!31437)

(declare-fun lt!420787 () V!31839)

(declare-fun addStillContains!520 (ListLongMap!12031 (_ BitVec 64) V!31839 (_ BitVec 64)) Unit!31437)

(assert (=> b!934283 (= lt!420781 (addStillContains!520 lt!420782 lt!420786 lt!420787 k0!1099))))

(declare-fun getCurrentListMap!3201 (array!56213 array!56215 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 32) Int) ListLongMap!12031)

(assert (=> b!934283 (= (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2831 (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420780))))

(assert (=> b!934283 (= lt!420780 (tuple2!13345 lt!420786 lt!420787))))

(declare-fun get!14248 (ValueCell!9596 V!31839) V!31839)

(declare-fun dynLambda!1587 (Int (_ BitVec 64)) V!31839)

(assert (=> b!934283 (= lt!420787 (get!14248 (select (arr!27051 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1587 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420783 () Unit!31437)

(declare-fun lemmaListMapRecursiveValidKeyArray!195 (array!56213 array!56215 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 32) Int) Unit!31437)

(assert (=> b!934283 (= lt!420783 (lemmaListMapRecursiveValidKeyArray!195 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31995 () Bool)

(assert (=> mapIsEmpty!31995 mapRes!31995))

(declare-fun res!629285 () Bool)

(assert (=> start!79474 (=> (not res!629285) (not e!524572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79474 (= res!629285 (validMask!0 mask!1881))))

(assert (=> start!79474 e!524572))

(assert (=> start!79474 true))

(assert (=> start!79474 tp_is_empty!20155))

(declare-fun array_inv!21114 (array!56215) Bool)

(assert (=> start!79474 (and (array_inv!21114 _values!1231) e!524576)))

(assert (=> start!79474 tp!61388))

(declare-fun array_inv!21115 (array!56213) Bool)

(assert (=> start!79474 (array_inv!21115 _keys!1487)))

(declare-fun b!934284 () Bool)

(assert (=> b!934284 (= e!524572 e!524571)))

(declare-fun res!629281 () Bool)

(assert (=> b!934284 (=> (not res!629281) (not e!524571))))

(assert (=> b!934284 (= res!629281 (contains!5028 lt!420782 k0!1099))))

(assert (=> b!934284 (= lt!420782 (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934285 () Bool)

(assert (=> b!934285 (= e!524569 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934286 () Bool)

(declare-fun arrayContainsKey!0 (array!56213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934286 (= e!524569 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934287 () Bool)

(declare-fun res!629286 () Bool)

(assert (=> b!934287 (=> (not res!629286) (not e!524572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56213 (_ BitVec 32)) Bool)

(assert (=> b!934287 (= res!629286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79474 res!629285) b!934275))

(assert (= (and b!934275 res!629287) b!934287))

(assert (= (and b!934287 res!629286) b!934277))

(assert (= (and b!934277 res!629280) b!934280))

(assert (= (and b!934280 res!629279) b!934284))

(assert (= (and b!934284 res!629281) b!934279))

(assert (= (and b!934279 res!629282) b!934276))

(assert (= (and b!934276 res!629284) b!934281))

(assert (= (and b!934281 res!629288) b!934273))

(assert (= (and b!934273 res!629283) b!934283))

(assert (= (and b!934283 c!97096) b!934286))

(assert (= (and b!934283 (not c!97096)) b!934285))

(assert (= (and b!934282 condMapEmpty!31995) mapIsEmpty!31995))

(assert (= (and b!934282 (not condMapEmpty!31995)) mapNonEmpty!31995))

(get-info :version)

(assert (= (and mapNonEmpty!31995 ((_ is ValueCellFull!9596) mapValue!31995)) b!934274))

(assert (= (and b!934282 ((_ is ValueCellFull!9596) mapDefault!31995)) b!934278))

(assert (= start!79474 b!934282))

(declare-fun b_lambda!13981 () Bool)

(assert (=> (not b_lambda!13981) (not b!934283)))

(declare-fun t!27272 () Bool)

(declare-fun tb!6033 () Bool)

(assert (=> (and start!79474 (= defaultEntry!1235 defaultEntry!1235) t!27272) tb!6033))

(declare-fun result!11901 () Bool)

(assert (=> tb!6033 (= result!11901 tp_is_empty!20155)))

(assert (=> b!934283 t!27272))

(declare-fun b_and!28837 () Bool)

(assert (= b_and!28835 (and (=> t!27272 result!11901) b_and!28837)))

(declare-fun m!868057 () Bool)

(assert (=> b!934287 m!868057))

(declare-fun m!868059 () Bool)

(assert (=> b!934284 m!868059))

(declare-fun m!868061 () Bool)

(assert (=> b!934284 m!868061))

(declare-fun m!868063 () Bool)

(assert (=> b!934286 m!868063))

(declare-fun m!868065 () Bool)

(assert (=> mapNonEmpty!31995 m!868065))

(declare-fun m!868067 () Bool)

(assert (=> b!934279 m!868067))

(declare-fun m!868069 () Bool)

(assert (=> b!934273 m!868069))

(declare-fun m!868071 () Bool)

(assert (=> b!934273 m!868071))

(declare-fun m!868073 () Bool)

(assert (=> b!934281 m!868073))

(declare-fun m!868075 () Bool)

(assert (=> start!79474 m!868075))

(declare-fun m!868077 () Bool)

(assert (=> start!79474 m!868077))

(declare-fun m!868079 () Bool)

(assert (=> start!79474 m!868079))

(declare-fun m!868081 () Bool)

(assert (=> b!934277 m!868081))

(declare-fun m!868083 () Bool)

(assert (=> b!934283 m!868083))

(declare-fun m!868085 () Bool)

(assert (=> b!934283 m!868085))

(declare-fun m!868087 () Bool)

(assert (=> b!934283 m!868087))

(declare-fun m!868089 () Bool)

(assert (=> b!934283 m!868089))

(declare-fun m!868091 () Bool)

(assert (=> b!934283 m!868091))

(declare-fun m!868093 () Bool)

(assert (=> b!934283 m!868093))

(declare-fun m!868095 () Bool)

(assert (=> b!934283 m!868095))

(declare-fun m!868097 () Bool)

(assert (=> b!934283 m!868097))

(assert (=> b!934283 m!868089))

(assert (=> b!934283 m!868091))

(declare-fun m!868099 () Bool)

(assert (=> b!934283 m!868099))

(declare-fun m!868101 () Bool)

(assert (=> b!934283 m!868101))

(declare-fun m!868103 () Bool)

(assert (=> b!934283 m!868103))

(assert (=> b!934283 m!868083))

(declare-fun m!868105 () Bool)

(assert (=> b!934283 m!868105))

(assert (=> b!934283 m!868093))

(declare-fun m!868107 () Bool)

(assert (=> b!934283 m!868107))

(check-sat b_and!28837 tp_is_empty!20155 (not mapNonEmpty!31995) (not b!934287) (not b!934284) (not b!934281) (not b_lambda!13981) (not b!934283) (not start!79474) (not b!934273) (not b!934277) (not b!934286) (not b!934279) (not b_next!17647))
(check-sat b_and!28837 (not b_next!17647))
