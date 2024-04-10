; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78812 () Bool)

(assert start!78812)

(declare-fun b_free!17025 () Bool)

(declare-fun b_next!17025 () Bool)

(assert (=> start!78812 (= b_free!17025 (not b_next!17025))))

(declare-fun tp!59516 () Bool)

(declare-fun b_and!27787 () Bool)

(assert (=> start!78812 (= tp!59516 b_and!27787)))

(declare-fun b!920092 () Bool)

(declare-fun e!516421 () Bool)

(declare-fun tp_is_empty!19533 () Bool)

(assert (=> b!920092 (= e!516421 tp_is_empty!19533)))

(declare-fun b!920093 () Bool)

(declare-fun e!516425 () Bool)

(declare-fun e!516427 () Bool)

(assert (=> b!920093 (= e!516425 e!516427)))

(declare-fun res!620447 () Bool)

(assert (=> b!920093 (=> (not res!620447) (not e!516427))))

(declare-datatypes ((V!31009 0))(
  ( (V!31010 (val!9817 Int)) )
))
(declare-datatypes ((tuple2!12758 0))(
  ( (tuple2!12759 (_1!6390 (_ BitVec 64)) (_2!6390 V!31009)) )
))
(declare-datatypes ((List!18561 0))(
  ( (Nil!18558) (Cons!18557 (h!19703 tuple2!12758) (t!26316 List!18561)) )
))
(declare-datatypes ((ListLongMap!11455 0))(
  ( (ListLongMap!11456 (toList!5743 List!18561)) )
))
(declare-fun lt!413044 () ListLongMap!11455)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4789 (ListLongMap!11455 (_ BitVec 64)) Bool)

(assert (=> b!920093 (= res!620447 (contains!4789 lt!413044 k0!1099))))

(declare-datatypes ((array!55046 0))(
  ( (array!55047 (arr!26468 (Array (_ BitVec 32) (_ BitVec 64))) (size!26927 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55046)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9285 0))(
  ( (ValueCellFull!9285 (v!12335 V!31009)) (EmptyCell!9285) )
))
(declare-datatypes ((array!55048 0))(
  ( (array!55049 (arr!26469 (Array (_ BitVec 32) ValueCell!9285)) (size!26928 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55048)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31009)

(declare-fun minValue!1173 () V!31009)

(declare-fun getCurrentListMap!2999 (array!55046 array!55048 (_ BitVec 32) (_ BitVec 32) V!31009 V!31009 (_ BitVec 32) Int) ListLongMap!11455)

(assert (=> b!920093 (= lt!413044 (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31056 () Bool)

(declare-fun mapRes!31056 () Bool)

(declare-fun tp!59515 () Bool)

(assert (=> mapNonEmpty!31056 (= mapRes!31056 (and tp!59515 e!516421))))

(declare-fun mapRest!31056 () (Array (_ BitVec 32) ValueCell!9285))

(declare-fun mapValue!31056 () ValueCell!9285)

(declare-fun mapKey!31056 () (_ BitVec 32))

(assert (=> mapNonEmpty!31056 (= (arr!26469 _values!1231) (store mapRest!31056 mapKey!31056 mapValue!31056))))

(declare-fun b!920094 () Bool)

(declare-fun e!516422 () Bool)

(assert (=> b!920094 (= e!516427 e!516422)))

(declare-fun res!620444 () Bool)

(assert (=> b!920094 (=> (not res!620444) (not e!516422))))

(declare-fun lt!413041 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920094 (= res!620444 (validKeyInArray!0 lt!413041))))

(assert (=> b!920094 (= lt!413041 (select (arr!26468 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920095 () Bool)

(declare-fun res!620441 () Bool)

(assert (=> b!920095 (=> (not res!620441) (not e!516427))))

(assert (=> b!920095 (= res!620441 (validKeyInArray!0 k0!1099))))

(declare-fun b!920096 () Bool)

(declare-fun res!620443 () Bool)

(assert (=> b!920096 (=> (not res!620443) (not e!516425))))

(assert (=> b!920096 (= res!620443 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26927 _keys!1487))))))

(declare-fun b!920097 () Bool)

(declare-fun res!620449 () Bool)

(assert (=> b!920097 (=> (not res!620449) (not e!516427))))

(declare-fun v!791 () V!31009)

(declare-fun apply!586 (ListLongMap!11455 (_ BitVec 64)) V!31009)

(assert (=> b!920097 (= res!620449 (= (apply!586 lt!413044 k0!1099) v!791))))

(declare-fun b!920098 () Bool)

(declare-fun res!620440 () Bool)

(assert (=> b!920098 (=> (not res!620440) (not e!516425))))

(declare-datatypes ((List!18562 0))(
  ( (Nil!18559) (Cons!18558 (h!19704 (_ BitVec 64)) (t!26317 List!18562)) )
))
(declare-fun arrayNoDuplicates!0 (array!55046 (_ BitVec 32) List!18562) Bool)

(assert (=> b!920098 (= res!620440 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18559))))

(declare-fun b!920099 () Bool)

(declare-fun res!620448 () Bool)

(assert (=> b!920099 (=> (not res!620448) (not e!516427))))

(assert (=> b!920099 (= res!620448 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920100 () Bool)

(declare-fun e!516424 () Bool)

(assert (=> b!920100 (= e!516424 tp_is_empty!19533)))

(declare-fun b!920101 () Bool)

(declare-fun res!620445 () Bool)

(assert (=> b!920101 (=> (not res!620445) (not e!516425))))

(assert (=> b!920101 (= res!620445 (and (= (size!26928 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26927 _keys!1487) (size!26928 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!620442 () Bool)

(assert (=> start!78812 (=> (not res!620442) (not e!516425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78812 (= res!620442 (validMask!0 mask!1881))))

(assert (=> start!78812 e!516425))

(assert (=> start!78812 true))

(assert (=> start!78812 tp_is_empty!19533))

(declare-fun e!516423 () Bool)

(declare-fun array_inv!20628 (array!55048) Bool)

(assert (=> start!78812 (and (array_inv!20628 _values!1231) e!516423)))

(assert (=> start!78812 tp!59516))

(declare-fun array_inv!20629 (array!55046) Bool)

(assert (=> start!78812 (array_inv!20629 _keys!1487)))

(declare-fun mapIsEmpty!31056 () Bool)

(assert (=> mapIsEmpty!31056 mapRes!31056))

(declare-fun b!920102 () Bool)

(assert (=> b!920102 (= e!516423 (and e!516424 mapRes!31056))))

(declare-fun condMapEmpty!31056 () Bool)

(declare-fun mapDefault!31056 () ValueCell!9285)

(assert (=> b!920102 (= condMapEmpty!31056 (= (arr!26469 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9285)) mapDefault!31056)))))

(declare-fun b!920103 () Bool)

(declare-fun res!620446 () Bool)

(assert (=> b!920103 (=> (not res!620446) (not e!516425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55046 (_ BitVec 32)) Bool)

(assert (=> b!920103 (= res!620446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920104 () Bool)

(assert (=> b!920104 (= e!516422 (not true))))

(assert (=> b!920104 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18559)))

(declare-datatypes ((Unit!31052 0))(
  ( (Unit!31053) )
))
(declare-fun lt!413042 () Unit!31052)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55046 (_ BitVec 32) (_ BitVec 32)) Unit!31052)

(assert (=> b!920104 (= lt!413042 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413043 () tuple2!12758)

(declare-fun +!2652 (ListLongMap!11455 tuple2!12758) ListLongMap!11455)

(assert (=> b!920104 (contains!4789 (+!2652 lt!413044 lt!413043) k0!1099)))

(declare-fun lt!413039 () V!31009)

(declare-fun lt!413040 () Unit!31052)

(declare-fun addStillContains!376 (ListLongMap!11455 (_ BitVec 64) V!31009 (_ BitVec 64)) Unit!31052)

(assert (=> b!920104 (= lt!413040 (addStillContains!376 lt!413044 lt!413041 lt!413039 k0!1099))))

(assert (=> b!920104 (= (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2652 (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413043))))

(assert (=> b!920104 (= lt!413043 (tuple2!12759 lt!413041 lt!413039))))

(declare-fun get!13883 (ValueCell!9285 V!31009) V!31009)

(declare-fun dynLambda!1441 (Int (_ BitVec 64)) V!31009)

(assert (=> b!920104 (= lt!413039 (get!13883 (select (arr!26469 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1441 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413038 () Unit!31052)

(declare-fun lemmaListMapRecursiveValidKeyArray!42 (array!55046 array!55048 (_ BitVec 32) (_ BitVec 32) V!31009 V!31009 (_ BitVec 32) Int) Unit!31052)

(assert (=> b!920104 (= lt!413038 (lemmaListMapRecursiveValidKeyArray!42 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78812 res!620442) b!920101))

(assert (= (and b!920101 res!620445) b!920103))

(assert (= (and b!920103 res!620446) b!920098))

(assert (= (and b!920098 res!620440) b!920096))

(assert (= (and b!920096 res!620443) b!920093))

(assert (= (and b!920093 res!620447) b!920097))

(assert (= (and b!920097 res!620449) b!920099))

(assert (= (and b!920099 res!620448) b!920095))

(assert (= (and b!920095 res!620441) b!920094))

(assert (= (and b!920094 res!620444) b!920104))

(assert (= (and b!920102 condMapEmpty!31056) mapIsEmpty!31056))

(assert (= (and b!920102 (not condMapEmpty!31056)) mapNonEmpty!31056))

(get-info :version)

(assert (= (and mapNonEmpty!31056 ((_ is ValueCellFull!9285) mapValue!31056)) b!920092))

(assert (= (and b!920102 ((_ is ValueCellFull!9285) mapDefault!31056)) b!920100))

(assert (= start!78812 b!920102))

(declare-fun b_lambda!13527 () Bool)

(assert (=> (not b_lambda!13527) (not b!920104)))

(declare-fun t!26315 () Bool)

(declare-fun tb!5605 () Bool)

(assert (=> (and start!78812 (= defaultEntry!1235 defaultEntry!1235) t!26315) tb!5605))

(declare-fun result!11033 () Bool)

(assert (=> tb!5605 (= result!11033 tp_is_empty!19533)))

(assert (=> b!920104 t!26315))

(declare-fun b_and!27789 () Bool)

(assert (= b_and!27787 (and (=> t!26315 result!11033) b_and!27789)))

(declare-fun m!853983 () Bool)

(assert (=> b!920094 m!853983))

(declare-fun m!853985 () Bool)

(assert (=> b!920094 m!853985))

(declare-fun m!853987 () Bool)

(assert (=> b!920104 m!853987))

(assert (=> b!920104 m!853987))

(declare-fun m!853989 () Bool)

(assert (=> b!920104 m!853989))

(declare-fun m!853991 () Bool)

(assert (=> b!920104 m!853991))

(declare-fun m!853993 () Bool)

(assert (=> b!920104 m!853993))

(declare-fun m!853995 () Bool)

(assert (=> b!920104 m!853995))

(declare-fun m!853997 () Bool)

(assert (=> b!920104 m!853997))

(assert (=> b!920104 m!853991))

(assert (=> b!920104 m!853997))

(declare-fun m!853999 () Bool)

(assert (=> b!920104 m!853999))

(declare-fun m!854001 () Bool)

(assert (=> b!920104 m!854001))

(declare-fun m!854003 () Bool)

(assert (=> b!920104 m!854003))

(declare-fun m!854005 () Bool)

(assert (=> b!920104 m!854005))

(declare-fun m!854007 () Bool)

(assert (=> b!920104 m!854007))

(assert (=> b!920104 m!853993))

(declare-fun m!854009 () Bool)

(assert (=> b!920104 m!854009))

(declare-fun m!854011 () Bool)

(assert (=> mapNonEmpty!31056 m!854011))

(declare-fun m!854013 () Bool)

(assert (=> b!920103 m!854013))

(declare-fun m!854015 () Bool)

(assert (=> b!920095 m!854015))

(declare-fun m!854017 () Bool)

(assert (=> start!78812 m!854017))

(declare-fun m!854019 () Bool)

(assert (=> start!78812 m!854019))

(declare-fun m!854021 () Bool)

(assert (=> start!78812 m!854021))

(declare-fun m!854023 () Bool)

(assert (=> b!920098 m!854023))

(declare-fun m!854025 () Bool)

(assert (=> b!920093 m!854025))

(declare-fun m!854027 () Bool)

(assert (=> b!920093 m!854027))

(declare-fun m!854029 () Bool)

(assert (=> b!920097 m!854029))

(check-sat tp_is_empty!19533 (not b!920095) (not b!920093) (not mapNonEmpty!31056) b_and!27789 (not start!78812) (not b!920098) (not b_lambda!13527) (not b!920097) (not b_next!17025) (not b!920104) (not b!920103) (not b!920094))
(check-sat b_and!27789 (not b_next!17025))
