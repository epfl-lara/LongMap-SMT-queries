; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78708 () Bool)

(assert start!78708)

(declare-fun b_free!16939 () Bool)

(declare-fun b_next!16939 () Bool)

(assert (=> start!78708 (= b_free!16939 (not b_next!16939))))

(declare-fun tp!59258 () Bool)

(declare-fun b_and!27589 () Bool)

(assert (=> start!78708 (= tp!59258 b_and!27589)))

(declare-fun b!918090 () Bool)

(declare-fun e!515373 () Bool)

(declare-fun e!515376 () Bool)

(assert (=> b!918090 (= e!515373 e!515376)))

(declare-fun res!619047 () Bool)

(assert (=> b!918090 (=> (not res!619047) (not e!515376))))

(declare-fun lt!411974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918090 (= res!619047 (validKeyInArray!0 lt!411974))))

(declare-datatypes ((array!54861 0))(
  ( (array!54862 (arr!26376 (Array (_ BitVec 32) (_ BitVec 64))) (size!26837 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54861)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918090 (= lt!411974 (select (arr!26376 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918091 () Bool)

(declare-fun res!619046 () Bool)

(declare-fun e!515374 () Bool)

(assert (=> b!918091 (=> (not res!619046) (not e!515374))))

(assert (=> b!918091 (= res!619046 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26837 _keys!1487))))))

(declare-fun mapIsEmpty!30927 () Bool)

(declare-fun mapRes!30927 () Bool)

(assert (=> mapIsEmpty!30927 mapRes!30927))

(declare-fun b!918092 () Bool)

(declare-fun e!515370 () Bool)

(declare-fun tp_is_empty!19447 () Bool)

(assert (=> b!918092 (= e!515370 tp_is_empty!19447)))

(declare-fun b!918093 () Bool)

(declare-fun res!619043 () Bool)

(assert (=> b!918093 (=> (not res!619043) (not e!515374))))

(declare-datatypes ((List!18533 0))(
  ( (Nil!18530) (Cons!18529 (h!19675 (_ BitVec 64)) (t!26193 List!18533)) )
))
(declare-fun arrayNoDuplicates!0 (array!54861 (_ BitVec 32) List!18533) Bool)

(assert (=> b!918093 (= res!619043 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18530))))

(declare-fun b!918094 () Bool)

(declare-fun res!619040 () Bool)

(assert (=> b!918094 (=> (not res!619040) (not e!515374))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54861 (_ BitVec 32)) Bool)

(assert (=> b!918094 (= res!619040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918095 () Bool)

(declare-fun e!515372 () Bool)

(assert (=> b!918095 (= e!515372 tp_is_empty!19447)))

(declare-fun res!619048 () Bool)

(assert (=> start!78708 (=> (not res!619048) (not e!515374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78708 (= res!619048 (validMask!0 mask!1881))))

(assert (=> start!78708 e!515374))

(assert (=> start!78708 true))

(assert (=> start!78708 tp_is_empty!19447))

(declare-datatypes ((V!30895 0))(
  ( (V!30896 (val!9774 Int)) )
))
(declare-datatypes ((ValueCell!9242 0))(
  ( (ValueCellFull!9242 (v!12291 V!30895)) (EmptyCell!9242) )
))
(declare-datatypes ((array!54863 0))(
  ( (array!54864 (arr!26377 (Array (_ BitVec 32) ValueCell!9242)) (size!26838 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54863)

(declare-fun e!515375 () Bool)

(declare-fun array_inv!20642 (array!54863) Bool)

(assert (=> start!78708 (and (array_inv!20642 _values!1231) e!515375)))

(assert (=> start!78708 tp!59258))

(declare-fun array_inv!20643 (array!54861) Bool)

(assert (=> start!78708 (array_inv!20643 _keys!1487)))

(declare-fun b!918096 () Bool)

(assert (=> b!918096 (= e!515375 (and e!515372 mapRes!30927))))

(declare-fun condMapEmpty!30927 () Bool)

(declare-fun mapDefault!30927 () ValueCell!9242)

(assert (=> b!918096 (= condMapEmpty!30927 (= (arr!26377 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9242)) mapDefault!30927)))))

(declare-fun b!918097 () Bool)

(declare-fun res!619049 () Bool)

(assert (=> b!918097 (=> (not res!619049) (not e!515373))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30895)

(declare-datatypes ((tuple2!12744 0))(
  ( (tuple2!12745 (_1!6383 (_ BitVec 64)) (_2!6383 V!30895)) )
))
(declare-datatypes ((List!18534 0))(
  ( (Nil!18531) (Cons!18530 (h!19676 tuple2!12744) (t!26194 List!18534)) )
))
(declare-datatypes ((ListLongMap!11431 0))(
  ( (ListLongMap!11432 (toList!5731 List!18534)) )
))
(declare-fun lt!411972 () ListLongMap!11431)

(declare-fun apply!564 (ListLongMap!11431 (_ BitVec 64)) V!30895)

(assert (=> b!918097 (= res!619049 (= (apply!564 lt!411972 k0!1099) v!791))))

(declare-fun b!918098 () Bool)

(declare-fun res!619044 () Bool)

(assert (=> b!918098 (=> (not res!619044) (not e!515374))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!918098 (= res!619044 (and (= (size!26838 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26837 _keys!1487) (size!26838 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918099 () Bool)

(assert (=> b!918099 (= e!515374 e!515373)))

(declare-fun res!619042 () Bool)

(assert (=> b!918099 (=> (not res!619042) (not e!515373))))

(declare-fun contains!4732 (ListLongMap!11431 (_ BitVec 64)) Bool)

(assert (=> b!918099 (= res!619042 (contains!4732 lt!411972 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30895)

(declare-fun minValue!1173 () V!30895)

(declare-fun getCurrentListMap!2924 (array!54861 array!54863 (_ BitVec 32) (_ BitVec 32) V!30895 V!30895 (_ BitVec 32) Int) ListLongMap!11431)

(assert (=> b!918099 (= lt!411972 (getCurrentListMap!2924 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30927 () Bool)

(declare-fun tp!59259 () Bool)

(assert (=> mapNonEmpty!30927 (= mapRes!30927 (and tp!59259 e!515370))))

(declare-fun mapRest!30927 () (Array (_ BitVec 32) ValueCell!9242))

(declare-fun mapKey!30927 () (_ BitVec 32))

(declare-fun mapValue!30927 () ValueCell!9242)

(assert (=> mapNonEmpty!30927 (= (arr!26377 _values!1231) (store mapRest!30927 mapKey!30927 mapValue!30927))))

(declare-fun b!918100 () Bool)

(declare-fun res!619041 () Bool)

(assert (=> b!918100 (=> (not res!619041) (not e!515373))))

(assert (=> b!918100 (= res!619041 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918101 () Bool)

(declare-fun res!619045 () Bool)

(assert (=> b!918101 (=> (not res!619045) (not e!515373))))

(assert (=> b!918101 (= res!619045 (validKeyInArray!0 k0!1099))))

(declare-fun b!918102 () Bool)

(assert (=> b!918102 (= e!515376 (not true))))

(declare-fun +!2653 (ListLongMap!11431 tuple2!12744) ListLongMap!11431)

(declare-fun get!13828 (ValueCell!9242 V!30895) V!30895)

(declare-fun dynLambda!1409 (Int (_ BitVec 64)) V!30895)

(assert (=> b!918102 (= (getCurrentListMap!2924 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2653 (getCurrentListMap!2924 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12745 lt!411974 (get!13828 (select (arr!26377 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1409 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30918 0))(
  ( (Unit!30919) )
))
(declare-fun lt!411973 () Unit!30918)

(declare-fun lemmaListMapRecursiveValidKeyArray!17 (array!54861 array!54863 (_ BitVec 32) (_ BitVec 32) V!30895 V!30895 (_ BitVec 32) Int) Unit!30918)

(assert (=> b!918102 (= lt!411973 (lemmaListMapRecursiveValidKeyArray!17 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78708 res!619048) b!918098))

(assert (= (and b!918098 res!619044) b!918094))

(assert (= (and b!918094 res!619040) b!918093))

(assert (= (and b!918093 res!619043) b!918091))

(assert (= (and b!918091 res!619046) b!918099))

(assert (= (and b!918099 res!619042) b!918097))

(assert (= (and b!918097 res!619049) b!918100))

(assert (= (and b!918100 res!619041) b!918101))

(assert (= (and b!918101 res!619045) b!918090))

(assert (= (and b!918090 res!619047) b!918102))

(assert (= (and b!918096 condMapEmpty!30927) mapIsEmpty!30927))

(assert (= (and b!918096 (not condMapEmpty!30927)) mapNonEmpty!30927))

(get-info :version)

(assert (= (and mapNonEmpty!30927 ((_ is ValueCellFull!9242) mapValue!30927)) b!918092))

(assert (= (and b!918096 ((_ is ValueCellFull!9242) mapDefault!30927)) b!918095))

(assert (= start!78708 b!918096))

(declare-fun b_lambda!13423 () Bool)

(assert (=> (not b_lambda!13423) (not b!918102)))

(declare-fun t!26192 () Bool)

(declare-fun tb!5511 () Bool)

(assert (=> (and start!78708 (= defaultEntry!1235 defaultEntry!1235) t!26192) tb!5511))

(declare-fun result!10853 () Bool)

(assert (=> tb!5511 (= result!10853 tp_is_empty!19447)))

(assert (=> b!918102 t!26192))

(declare-fun b_and!27591 () Bool)

(assert (= b_and!27589 (and (=> t!26192 result!10853) b_and!27591)))

(declare-fun m!851251 () Bool)

(assert (=> b!918097 m!851251))

(declare-fun m!851253 () Bool)

(assert (=> b!918094 m!851253))

(declare-fun m!851255 () Bool)

(assert (=> start!78708 m!851255))

(declare-fun m!851257 () Bool)

(assert (=> start!78708 m!851257))

(declare-fun m!851259 () Bool)

(assert (=> start!78708 m!851259))

(declare-fun m!851261 () Bool)

(assert (=> b!918101 m!851261))

(declare-fun m!851263 () Bool)

(assert (=> b!918102 m!851263))

(declare-fun m!851265 () Bool)

(assert (=> b!918102 m!851265))

(assert (=> b!918102 m!851263))

(assert (=> b!918102 m!851265))

(declare-fun m!851267 () Bool)

(assert (=> b!918102 m!851267))

(declare-fun m!851269 () Bool)

(assert (=> b!918102 m!851269))

(declare-fun m!851271 () Bool)

(assert (=> b!918102 m!851271))

(declare-fun m!851273 () Bool)

(assert (=> b!918102 m!851273))

(assert (=> b!918102 m!851271))

(declare-fun m!851275 () Bool)

(assert (=> b!918102 m!851275))

(declare-fun m!851277 () Bool)

(assert (=> mapNonEmpty!30927 m!851277))

(declare-fun m!851279 () Bool)

(assert (=> b!918093 m!851279))

(declare-fun m!851281 () Bool)

(assert (=> b!918090 m!851281))

(declare-fun m!851283 () Bool)

(assert (=> b!918090 m!851283))

(declare-fun m!851285 () Bool)

(assert (=> b!918099 m!851285))

(declare-fun m!851287 () Bool)

(assert (=> b!918099 m!851287))

(check-sat (not b!918094) (not b!918090) (not mapNonEmpty!30927) (not start!78708) (not b_next!16939) (not b!918102) tp_is_empty!19447 (not b_lambda!13423) (not b!918099) b_and!27591 (not b!918097) (not b!918093) (not b!918101))
(check-sat b_and!27591 (not b_next!16939))
