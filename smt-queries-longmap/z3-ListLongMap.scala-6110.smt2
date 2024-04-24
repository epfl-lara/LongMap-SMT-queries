; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78936 () Bool)

(assert start!78936)

(declare-fun b_free!16981 () Bool)

(declare-fun b_next!16981 () Bool)

(assert (=> start!78936 (= b_free!16981 (not b_next!16981))))

(declare-fun tp!59384 () Bool)

(declare-fun b_and!27709 () Bool)

(assert (=> start!78936 (= tp!59384 b_and!27709)))

(declare-fun b!920093 () Bool)

(declare-fun res!620129 () Bool)

(declare-fun e!516544 () Bool)

(assert (=> b!920093 (=> (not res!620129) (not e!516544))))

(declare-datatypes ((array!55007 0))(
  ( (array!55008 (arr!26444 (Array (_ BitVec 32) (_ BitVec 64))) (size!26904 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55007)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30951 0))(
  ( (V!30952 (val!9795 Int)) )
))
(declare-datatypes ((ValueCell!9263 0))(
  ( (ValueCellFull!9263 (v!12310 V!30951)) (EmptyCell!9263) )
))
(declare-datatypes ((array!55009 0))(
  ( (array!55010 (arr!26445 (Array (_ BitVec 32) ValueCell!9263)) (size!26905 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55009)

(assert (=> b!920093 (= res!620129 (and (= (size!26905 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26904 _keys!1487) (size!26905 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920094 () Bool)

(declare-fun e!516542 () Bool)

(assert (=> b!920094 (= e!516544 e!516542)))

(declare-fun res!620132 () Bool)

(assert (=> b!920094 (=> (not res!620132) (not e!516542))))

(declare-datatypes ((tuple2!12704 0))(
  ( (tuple2!12705 (_1!6363 (_ BitVec 64)) (_2!6363 V!30951)) )
))
(declare-datatypes ((List!18522 0))(
  ( (Nil!18519) (Cons!18518 (h!19670 tuple2!12704) (t!26225 List!18522)) )
))
(declare-datatypes ((ListLongMap!11403 0))(
  ( (ListLongMap!11404 (toList!5717 List!18522)) )
))
(declare-fun lt!412938 () ListLongMap!11403)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4771 (ListLongMap!11403 (_ BitVec 64)) Bool)

(assert (=> b!920094 (= res!620132 (contains!4771 lt!412938 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30951)

(declare-fun minValue!1173 () V!30951)

(declare-fun getCurrentListMap!2971 (array!55007 array!55009 (_ BitVec 32) (_ BitVec 32) V!30951 V!30951 (_ BitVec 32) Int) ListLongMap!11403)

(assert (=> b!920094 (= lt!412938 (getCurrentListMap!2971 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920095 () Bool)

(declare-fun res!620130 () Bool)

(assert (=> b!920095 (=> (not res!620130) (not e!516542))))

(declare-fun v!791 () V!30951)

(declare-fun apply!589 (ListLongMap!11403 (_ BitVec 64)) V!30951)

(assert (=> b!920095 (= res!620130 (= (apply!589 lt!412938 k0!1099) v!791))))

(declare-fun b!920096 () Bool)

(declare-fun e!516541 () Bool)

(declare-fun tp_is_empty!19489 () Bool)

(assert (=> b!920096 (= e!516541 tp_is_empty!19489)))

(declare-fun mapNonEmpty!30990 () Bool)

(declare-fun mapRes!30990 () Bool)

(declare-fun tp!59385 () Bool)

(declare-fun e!516546 () Bool)

(assert (=> mapNonEmpty!30990 (= mapRes!30990 (and tp!59385 e!516546))))

(declare-fun mapRest!30990 () (Array (_ BitVec 32) ValueCell!9263))

(declare-fun mapValue!30990 () ValueCell!9263)

(declare-fun mapKey!30990 () (_ BitVec 32))

(assert (=> mapNonEmpty!30990 (= (arr!26445 _values!1231) (store mapRest!30990 mapKey!30990 mapValue!30990))))

(declare-fun mapIsEmpty!30990 () Bool)

(assert (=> mapIsEmpty!30990 mapRes!30990))

(declare-fun b!920097 () Bool)

(declare-fun res!620131 () Bool)

(assert (=> b!920097 (=> (not res!620131) (not e!516544))))

(declare-datatypes ((List!18523 0))(
  ( (Nil!18520) (Cons!18519 (h!19671 (_ BitVec 64)) (t!26226 List!18523)) )
))
(declare-fun arrayNoDuplicates!0 (array!55007 (_ BitVec 32) List!18523) Bool)

(assert (=> b!920097 (= res!620131 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18520))))

(declare-fun b!920099 () Bool)

(declare-fun res!620125 () Bool)

(assert (=> b!920099 (=> (not res!620125) (not e!516542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920099 (= res!620125 (validKeyInArray!0 k0!1099))))

(declare-fun b!920100 () Bool)

(declare-fun res!620133 () Bool)

(assert (=> b!920100 (=> (not res!620133) (not e!516544))))

(assert (=> b!920100 (= res!620133 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26904 _keys!1487))))))

(declare-fun b!920101 () Bool)

(declare-fun res!620126 () Bool)

(assert (=> b!920101 (=> (not res!620126) (not e!516544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55007 (_ BitVec 32)) Bool)

(assert (=> b!920101 (= res!620126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!620127 () Bool)

(assert (=> start!78936 (=> (not res!620127) (not e!516544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78936 (= res!620127 (validMask!0 mask!1881))))

(assert (=> start!78936 e!516544))

(assert (=> start!78936 true))

(assert (=> start!78936 tp_is_empty!19489))

(declare-fun e!516547 () Bool)

(declare-fun array_inv!20704 (array!55009) Bool)

(assert (=> start!78936 (and (array_inv!20704 _values!1231) e!516547)))

(assert (=> start!78936 tp!59384))

(declare-fun array_inv!20705 (array!55007) Bool)

(assert (=> start!78936 (array_inv!20705 _keys!1487)))

(declare-fun b!920098 () Bool)

(assert (=> b!920098 (= e!516547 (and e!516541 mapRes!30990))))

(declare-fun condMapEmpty!30990 () Bool)

(declare-fun mapDefault!30990 () ValueCell!9263)

(assert (=> b!920098 (= condMapEmpty!30990 (= (arr!26445 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9263)) mapDefault!30990)))))

(declare-fun b!920102 () Bool)

(declare-fun e!516545 () Bool)

(assert (=> b!920102 (= e!516545 (not true))))

(assert (=> b!920102 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18520)))

(declare-datatypes ((Unit!31026 0))(
  ( (Unit!31027) )
))
(declare-fun lt!412943 () Unit!31026)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55007 (_ BitVec 32) (_ BitVec 32)) Unit!31026)

(assert (=> b!920102 (= lt!412943 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412940 () tuple2!12704)

(declare-fun +!2657 (ListLongMap!11403 tuple2!12704) ListLongMap!11403)

(assert (=> b!920102 (contains!4771 (+!2657 lt!412938 lt!412940) k0!1099)))

(declare-fun lt!412939 () V!30951)

(declare-fun lt!412941 () (_ BitVec 64))

(declare-fun lt!412937 () Unit!31026)

(declare-fun addStillContains!366 (ListLongMap!11403 (_ BitVec 64) V!30951 (_ BitVec 64)) Unit!31026)

(assert (=> b!920102 (= lt!412937 (addStillContains!366 lt!412938 lt!412941 lt!412939 k0!1099))))

(assert (=> b!920102 (= (getCurrentListMap!2971 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2657 (getCurrentListMap!2971 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412940))))

(assert (=> b!920102 (= lt!412940 (tuple2!12705 lt!412941 lt!412939))))

(declare-fun get!13886 (ValueCell!9263 V!30951) V!30951)

(declare-fun dynLambda!1454 (Int (_ BitVec 64)) V!30951)

(assert (=> b!920102 (= lt!412939 (get!13886 (select (arr!26445 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1454 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412942 () Unit!31026)

(declare-fun lemmaListMapRecursiveValidKeyArray!37 (array!55007 array!55009 (_ BitVec 32) (_ BitVec 32) V!30951 V!30951 (_ BitVec 32) Int) Unit!31026)

(assert (=> b!920102 (= lt!412942 (lemmaListMapRecursiveValidKeyArray!37 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920103 () Bool)

(declare-fun res!620128 () Bool)

(assert (=> b!920103 (=> (not res!620128) (not e!516542))))

(assert (=> b!920103 (= res!620128 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920104 () Bool)

(assert (=> b!920104 (= e!516546 tp_is_empty!19489)))

(declare-fun b!920105 () Bool)

(assert (=> b!920105 (= e!516542 e!516545)))

(declare-fun res!620124 () Bool)

(assert (=> b!920105 (=> (not res!620124) (not e!516545))))

(assert (=> b!920105 (= res!620124 (validKeyInArray!0 lt!412941))))

(assert (=> b!920105 (= lt!412941 (select (arr!26444 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!78936 res!620127) b!920093))

(assert (= (and b!920093 res!620129) b!920101))

(assert (= (and b!920101 res!620126) b!920097))

(assert (= (and b!920097 res!620131) b!920100))

(assert (= (and b!920100 res!620133) b!920094))

(assert (= (and b!920094 res!620132) b!920095))

(assert (= (and b!920095 res!620130) b!920103))

(assert (= (and b!920103 res!620128) b!920099))

(assert (= (and b!920099 res!620125) b!920105))

(assert (= (and b!920105 res!620124) b!920102))

(assert (= (and b!920098 condMapEmpty!30990) mapIsEmpty!30990))

(assert (= (and b!920098 (not condMapEmpty!30990)) mapNonEmpty!30990))

(get-info :version)

(assert (= (and mapNonEmpty!30990 ((_ is ValueCellFull!9263) mapValue!30990)) b!920104))

(assert (= (and b!920098 ((_ is ValueCellFull!9263) mapDefault!30990)) b!920096))

(assert (= start!78936 b!920098))

(declare-fun b_lambda!13497 () Bool)

(assert (=> (not b_lambda!13497) (not b!920102)))

(declare-fun t!26224 () Bool)

(declare-fun tb!5553 () Bool)

(assert (=> (and start!78936 (= defaultEntry!1235 defaultEntry!1235) t!26224) tb!5553))

(declare-fun result!10937 () Bool)

(assert (=> tb!5553 (= result!10937 tp_is_empty!19489)))

(assert (=> b!920102 t!26224))

(declare-fun b_and!27711 () Bool)

(assert (= b_and!27709 (and (=> t!26224 result!10937) b_and!27711)))

(declare-fun m!854221 () Bool)

(assert (=> start!78936 m!854221))

(declare-fun m!854223 () Bool)

(assert (=> start!78936 m!854223))

(declare-fun m!854225 () Bool)

(assert (=> start!78936 m!854225))

(declare-fun m!854227 () Bool)

(assert (=> b!920101 m!854227))

(declare-fun m!854229 () Bool)

(assert (=> mapNonEmpty!30990 m!854229))

(declare-fun m!854231 () Bool)

(assert (=> b!920105 m!854231))

(declare-fun m!854233 () Bool)

(assert (=> b!920105 m!854233))

(declare-fun m!854235 () Bool)

(assert (=> b!920095 m!854235))

(declare-fun m!854237 () Bool)

(assert (=> b!920102 m!854237))

(declare-fun m!854239 () Bool)

(assert (=> b!920102 m!854239))

(declare-fun m!854241 () Bool)

(assert (=> b!920102 m!854241))

(declare-fun m!854243 () Bool)

(assert (=> b!920102 m!854243))

(assert (=> b!920102 m!854239))

(declare-fun m!854245 () Bool)

(assert (=> b!920102 m!854245))

(declare-fun m!854247 () Bool)

(assert (=> b!920102 m!854247))

(declare-fun m!854249 () Bool)

(assert (=> b!920102 m!854249))

(assert (=> b!920102 m!854237))

(declare-fun m!854251 () Bool)

(assert (=> b!920102 m!854251))

(declare-fun m!854253 () Bool)

(assert (=> b!920102 m!854253))

(declare-fun m!854255 () Bool)

(assert (=> b!920102 m!854255))

(assert (=> b!920102 m!854245))

(declare-fun m!854257 () Bool)

(assert (=> b!920102 m!854257))

(assert (=> b!920102 m!854241))

(declare-fun m!854259 () Bool)

(assert (=> b!920102 m!854259))

(declare-fun m!854261 () Bool)

(assert (=> b!920094 m!854261))

(declare-fun m!854263 () Bool)

(assert (=> b!920094 m!854263))

(declare-fun m!854265 () Bool)

(assert (=> b!920097 m!854265))

(declare-fun m!854267 () Bool)

(assert (=> b!920099 m!854267))

(check-sat (not start!78936) (not b!920097) (not b!920101) (not b!920105) (not b_next!16981) (not b!920095) (not b!920099) b_and!27711 (not b!920094) tp_is_empty!19489 (not b_lambda!13497) (not b!920102) (not mapNonEmpty!30990))
(check-sat b_and!27711 (not b_next!16981))
