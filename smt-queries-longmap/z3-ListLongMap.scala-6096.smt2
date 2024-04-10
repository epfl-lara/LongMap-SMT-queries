; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78686 () Bool)

(assert start!78686)

(declare-fun b_free!16899 () Bool)

(declare-fun b_next!16899 () Bool)

(assert (=> start!78686 (= b_free!16899 (not b_next!16899))))

(declare-fun tp!59137 () Bool)

(declare-fun b_and!27535 () Bool)

(assert (=> start!78686 (= tp!59137 b_and!27535)))

(declare-fun b!917509 () Bool)

(declare-fun e!515103 () Bool)

(declare-fun e!515102 () Bool)

(assert (=> b!917509 (= e!515103 e!515102)))

(declare-fun res!618556 () Bool)

(assert (=> b!917509 (=> (not res!618556) (not e!515102))))

(declare-fun lt!412028 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917509 (= res!618556 (validKeyInArray!0 lt!412028))))

(declare-datatypes ((array!54800 0))(
  ( (array!54801 (arr!26345 (Array (_ BitVec 32) (_ BitVec 64))) (size!26804 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54800)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917509 (= lt!412028 (select (arr!26345 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917510 () Bool)

(declare-fun res!618554 () Bool)

(declare-fun e!515099 () Bool)

(assert (=> b!917510 (=> (not res!618554) (not e!515099))))

(assert (=> b!917510 (= res!618554 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26804 _keys!1487))))))

(declare-fun b!917511 () Bool)

(assert (=> b!917511 (= e!515099 e!515103)))

(declare-fun res!618553 () Bool)

(assert (=> b!917511 (=> (not res!618553) (not e!515103))))

(declare-datatypes ((V!30841 0))(
  ( (V!30842 (val!9754 Int)) )
))
(declare-datatypes ((tuple2!12670 0))(
  ( (tuple2!12671 (_1!6346 (_ BitVec 64)) (_2!6346 V!30841)) )
))
(declare-datatypes ((List!18479 0))(
  ( (Nil!18476) (Cons!18475 (h!19621 tuple2!12670) (t!26108 List!18479)) )
))
(declare-datatypes ((ListLongMap!11367 0))(
  ( (ListLongMap!11368 (toList!5699 List!18479)) )
))
(declare-fun lt!412030 () ListLongMap!11367)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4750 (ListLongMap!11367 (_ BitVec 64)) Bool)

(assert (=> b!917511 (= res!618553 (contains!4750 lt!412030 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9222 0))(
  ( (ValueCellFull!9222 (v!12272 V!30841)) (EmptyCell!9222) )
))
(declare-datatypes ((array!54802 0))(
  ( (array!54803 (arr!26346 (Array (_ BitVec 32) ValueCell!9222)) (size!26805 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54802)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30841)

(declare-fun minValue!1173 () V!30841)

(declare-fun getCurrentListMap!2957 (array!54800 array!54802 (_ BitVec 32) (_ BitVec 32) V!30841 V!30841 (_ BitVec 32) Int) ListLongMap!11367)

(assert (=> b!917511 (= lt!412030 (getCurrentListMap!2957 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917512 () Bool)

(declare-fun res!618555 () Bool)

(assert (=> b!917512 (=> (not res!618555) (not e!515103))))

(assert (=> b!917512 (= res!618555 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917513 () Bool)

(declare-fun e!515101 () Bool)

(declare-fun tp_is_empty!19407 () Bool)

(assert (=> b!917513 (= e!515101 tp_is_empty!19407)))

(declare-fun b!917514 () Bool)

(declare-fun e!515098 () Bool)

(declare-fun e!515104 () Bool)

(declare-fun mapRes!30867 () Bool)

(assert (=> b!917514 (= e!515098 (and e!515104 mapRes!30867))))

(declare-fun condMapEmpty!30867 () Bool)

(declare-fun mapDefault!30867 () ValueCell!9222)

(assert (=> b!917514 (= condMapEmpty!30867 (= (arr!26346 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9222)) mapDefault!30867)))))

(declare-fun b!917515 () Bool)

(assert (=> b!917515 (= e!515102 (not true))))

(declare-fun +!2614 (ListLongMap!11367 tuple2!12670) ListLongMap!11367)

(declare-fun get!13803 (ValueCell!9222 V!30841) V!30841)

(declare-fun dynLambda!1403 (Int (_ BitVec 64)) V!30841)

(assert (=> b!917515 (= (getCurrentListMap!2957 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2614 (getCurrentListMap!2957 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12671 lt!412028 (get!13803 (select (arr!26346 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1403 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30976 0))(
  ( (Unit!30977) )
))
(declare-fun lt!412029 () Unit!30976)

(declare-fun lemmaListMapRecursiveValidKeyArray!4 (array!54800 array!54802 (_ BitVec 32) (_ BitVec 32) V!30841 V!30841 (_ BitVec 32) Int) Unit!30976)

(assert (=> b!917515 (= lt!412029 (lemmaListMapRecursiveValidKeyArray!4 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917516 () Bool)

(declare-fun res!618559 () Bool)

(assert (=> b!917516 (=> (not res!618559) (not e!515103))))

(assert (=> b!917516 (= res!618559 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!30867 () Bool)

(assert (=> mapIsEmpty!30867 mapRes!30867))

(declare-fun res!618552 () Bool)

(assert (=> start!78686 (=> (not res!618552) (not e!515099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78686 (= res!618552 (validMask!0 mask!1881))))

(assert (=> start!78686 e!515099))

(assert (=> start!78686 true))

(assert (=> start!78686 tp_is_empty!19407))

(declare-fun array_inv!20544 (array!54802) Bool)

(assert (=> start!78686 (and (array_inv!20544 _values!1231) e!515098)))

(assert (=> start!78686 tp!59137))

(declare-fun array_inv!20545 (array!54800) Bool)

(assert (=> start!78686 (array_inv!20545 _keys!1487)))

(declare-fun b!917517 () Bool)

(assert (=> b!917517 (= e!515104 tp_is_empty!19407)))

(declare-fun mapNonEmpty!30867 () Bool)

(declare-fun tp!59138 () Bool)

(assert (=> mapNonEmpty!30867 (= mapRes!30867 (and tp!59138 e!515101))))

(declare-fun mapValue!30867 () ValueCell!9222)

(declare-fun mapKey!30867 () (_ BitVec 32))

(declare-fun mapRest!30867 () (Array (_ BitVec 32) ValueCell!9222))

(assert (=> mapNonEmpty!30867 (= (arr!26346 _values!1231) (store mapRest!30867 mapKey!30867 mapValue!30867))))

(declare-fun b!917518 () Bool)

(declare-fun res!618551 () Bool)

(assert (=> b!917518 (=> (not res!618551) (not e!515099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54800 (_ BitVec 32)) Bool)

(assert (=> b!917518 (= res!618551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917519 () Bool)

(declare-fun res!618557 () Bool)

(assert (=> b!917519 (=> (not res!618557) (not e!515103))))

(declare-fun v!791 () V!30841)

(declare-fun apply!551 (ListLongMap!11367 (_ BitVec 64)) V!30841)

(assert (=> b!917519 (= res!618557 (= (apply!551 lt!412030 k0!1099) v!791))))

(declare-fun b!917520 () Bool)

(declare-fun res!618550 () Bool)

(assert (=> b!917520 (=> (not res!618550) (not e!515099))))

(declare-datatypes ((List!18480 0))(
  ( (Nil!18477) (Cons!18476 (h!19622 (_ BitVec 64)) (t!26109 List!18480)) )
))
(declare-fun arrayNoDuplicates!0 (array!54800 (_ BitVec 32) List!18480) Bool)

(assert (=> b!917520 (= res!618550 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18477))))

(declare-fun b!917521 () Bool)

(declare-fun res!618558 () Bool)

(assert (=> b!917521 (=> (not res!618558) (not e!515099))))

(assert (=> b!917521 (= res!618558 (and (= (size!26805 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26804 _keys!1487) (size!26805 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78686 res!618552) b!917521))

(assert (= (and b!917521 res!618558) b!917518))

(assert (= (and b!917518 res!618551) b!917520))

(assert (= (and b!917520 res!618550) b!917510))

(assert (= (and b!917510 res!618554) b!917511))

(assert (= (and b!917511 res!618553) b!917519))

(assert (= (and b!917519 res!618557) b!917512))

(assert (= (and b!917512 res!618555) b!917516))

(assert (= (and b!917516 res!618559) b!917509))

(assert (= (and b!917509 res!618556) b!917515))

(assert (= (and b!917514 condMapEmpty!30867) mapIsEmpty!30867))

(assert (= (and b!917514 (not condMapEmpty!30867)) mapNonEmpty!30867))

(get-info :version)

(assert (= (and mapNonEmpty!30867 ((_ is ValueCellFull!9222) mapValue!30867)) b!917513))

(assert (= (and b!917514 ((_ is ValueCellFull!9222) mapDefault!30867)) b!917517))

(assert (= start!78686 b!917514))

(declare-fun b_lambda!13401 () Bool)

(assert (=> (not b_lambda!13401) (not b!917515)))

(declare-fun t!26107 () Bool)

(declare-fun tb!5479 () Bool)

(assert (=> (and start!78686 (= defaultEntry!1235 defaultEntry!1235) t!26107) tb!5479))

(declare-fun result!10781 () Bool)

(assert (=> tb!5479 (= result!10781 tp_is_empty!19407)))

(assert (=> b!917515 t!26107))

(declare-fun b_and!27537 () Bool)

(assert (= b_and!27535 (and (=> t!26107 result!10781) b_and!27537)))

(declare-fun m!851249 () Bool)

(assert (=> mapNonEmpty!30867 m!851249))

(declare-fun m!851251 () Bool)

(assert (=> b!917519 m!851251))

(declare-fun m!851253 () Bool)

(assert (=> b!917515 m!851253))

(declare-fun m!851255 () Bool)

(assert (=> b!917515 m!851255))

(assert (=> b!917515 m!851253))

(assert (=> b!917515 m!851255))

(declare-fun m!851257 () Bool)

(assert (=> b!917515 m!851257))

(declare-fun m!851259 () Bool)

(assert (=> b!917515 m!851259))

(declare-fun m!851261 () Bool)

(assert (=> b!917515 m!851261))

(declare-fun m!851263 () Bool)

(assert (=> b!917515 m!851263))

(assert (=> b!917515 m!851261))

(declare-fun m!851265 () Bool)

(assert (=> b!917515 m!851265))

(declare-fun m!851267 () Bool)

(assert (=> start!78686 m!851267))

(declare-fun m!851269 () Bool)

(assert (=> start!78686 m!851269))

(declare-fun m!851271 () Bool)

(assert (=> start!78686 m!851271))

(declare-fun m!851273 () Bool)

(assert (=> b!917520 m!851273))

(declare-fun m!851275 () Bool)

(assert (=> b!917509 m!851275))

(declare-fun m!851277 () Bool)

(assert (=> b!917509 m!851277))

(declare-fun m!851279 () Bool)

(assert (=> b!917511 m!851279))

(declare-fun m!851281 () Bool)

(assert (=> b!917511 m!851281))

(declare-fun m!851283 () Bool)

(assert (=> b!917516 m!851283))

(declare-fun m!851285 () Bool)

(assert (=> b!917518 m!851285))

(check-sat (not b!917515) (not b!917516) b_and!27537 (not b!917511) tp_is_empty!19407 (not b!917509) (not b!917520) (not mapNonEmpty!30867) (not start!78686) (not b_lambda!13401) (not b!917518) (not b_next!16899) (not b!917519))
(check-sat b_and!27537 (not b_next!16899))
