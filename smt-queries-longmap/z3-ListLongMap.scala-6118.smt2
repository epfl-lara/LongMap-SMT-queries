; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78798 () Bool)

(assert start!78798)

(declare-fun b_free!17029 () Bool)

(declare-fun b_next!17029 () Bool)

(assert (=> start!78798 (= b_free!17029 (not b_next!17029))))

(declare-fun tp!59529 () Bool)

(declare-fun b_and!27769 () Bool)

(assert (=> start!78798 (= tp!59529 b_and!27769)))

(declare-fun b!919936 () Bool)

(declare-fun res!620392 () Bool)

(declare-fun e!516321 () Bool)

(assert (=> b!919936 (=> (not res!620392) (not e!516321))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919936 (= res!620392 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919937 () Bool)

(declare-fun e!516315 () Bool)

(declare-fun tp_is_empty!19537 () Bool)

(assert (=> b!919937 (= e!516315 tp_is_empty!19537)))

(declare-fun b!919938 () Bool)

(declare-fun e!516320 () Bool)

(assert (=> b!919938 (= e!516320 e!516321)))

(declare-fun res!620390 () Bool)

(assert (=> b!919938 (=> (not res!620390) (not e!516321))))

(declare-datatypes ((V!31015 0))(
  ( (V!31016 (val!9819 Int)) )
))
(declare-datatypes ((tuple2!12820 0))(
  ( (tuple2!12821 (_1!6421 (_ BitVec 64)) (_2!6421 V!31015)) )
))
(declare-datatypes ((List!18603 0))(
  ( (Nil!18600) (Cons!18599 (h!19745 tuple2!12820) (t!26353 List!18603)) )
))
(declare-datatypes ((ListLongMap!11507 0))(
  ( (ListLongMap!11508 (toList!5769 List!18603)) )
))
(declare-fun lt!412848 () ListLongMap!11507)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4768 (ListLongMap!11507 (_ BitVec 64)) Bool)

(assert (=> b!919938 (= res!620390 (contains!4768 lt!412848 k0!1099))))

(declare-datatypes ((array!55033 0))(
  ( (array!55034 (arr!26462 (Array (_ BitVec 32) (_ BitVec 64))) (size!26923 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55033)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9287 0))(
  ( (ValueCellFull!9287 (v!12336 V!31015)) (EmptyCell!9287) )
))
(declare-datatypes ((array!55035 0))(
  ( (array!55036 (arr!26463 (Array (_ BitVec 32) ValueCell!9287)) (size!26924 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55035)

(declare-fun zeroValue!1173 () V!31015)

(declare-fun minValue!1173 () V!31015)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2960 (array!55033 array!55035 (_ BitVec 32) (_ BitVec 32) V!31015 V!31015 (_ BitVec 32) Int) ListLongMap!11507)

(assert (=> b!919938 (= lt!412848 (getCurrentListMap!2960 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919939 () Bool)

(declare-fun e!516317 () Bool)

(declare-fun mapRes!31062 () Bool)

(assert (=> b!919939 (= e!516317 (and e!516315 mapRes!31062))))

(declare-fun condMapEmpty!31062 () Bool)

(declare-fun mapDefault!31062 () ValueCell!9287)

(assert (=> b!919939 (= condMapEmpty!31062 (= (arr!26463 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9287)) mapDefault!31062)))))

(declare-fun b!919940 () Bool)

(declare-fun res!620393 () Bool)

(assert (=> b!919940 (=> (not res!620393) (not e!516320))))

(assert (=> b!919940 (= res!620393 (and (= (size!26924 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26923 _keys!1487) (size!26924 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919941 () Bool)

(declare-fun e!516316 () Bool)

(assert (=> b!919941 (= e!516321 e!516316)))

(declare-fun res!620394 () Bool)

(assert (=> b!919941 (=> (not res!620394) (not e!516316))))

(declare-fun lt!412850 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919941 (= res!620394 (validKeyInArray!0 lt!412850))))

(assert (=> b!919941 (= lt!412850 (select (arr!26462 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31062 () Bool)

(assert (=> mapIsEmpty!31062 mapRes!31062))

(declare-fun b!919942 () Bool)

(declare-fun res!620395 () Bool)

(assert (=> b!919942 (=> (not res!620395) (not e!516320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55033 (_ BitVec 32)) Bool)

(assert (=> b!919942 (= res!620395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919943 () Bool)

(declare-fun res!620399 () Bool)

(assert (=> b!919943 (=> (not res!620399) (not e!516320))))

(declare-datatypes ((List!18604 0))(
  ( (Nil!18601) (Cons!18600 (h!19746 (_ BitVec 64)) (t!26354 List!18604)) )
))
(declare-fun arrayNoDuplicates!0 (array!55033 (_ BitVec 32) List!18604) Bool)

(assert (=> b!919943 (= res!620399 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18601))))

(declare-fun b!919944 () Bool)

(assert (=> b!919944 (= e!516316 (not true))))

(assert (=> b!919944 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18601)))

(declare-datatypes ((Unit!30976 0))(
  ( (Unit!30977) )
))
(declare-fun lt!412847 () Unit!30976)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55033 (_ BitVec 32) (_ BitVec 32)) Unit!30976)

(assert (=> b!919944 (= lt!412847 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412849 () tuple2!12820)

(declare-fun +!2682 (ListLongMap!11507 tuple2!12820) ListLongMap!11507)

(assert (=> b!919944 (contains!4768 (+!2682 lt!412848 lt!412849) k0!1099)))

(declare-fun lt!412845 () V!31015)

(declare-fun lt!412844 () Unit!30976)

(declare-fun addStillContains!379 (ListLongMap!11507 (_ BitVec 64) V!31015 (_ BitVec 64)) Unit!30976)

(assert (=> b!919944 (= lt!412844 (addStillContains!379 lt!412848 lt!412850 lt!412845 k0!1099))))

(assert (=> b!919944 (= (getCurrentListMap!2960 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2682 (getCurrentListMap!2960 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412849))))

(assert (=> b!919944 (= lt!412849 (tuple2!12821 lt!412850 lt!412845))))

(declare-fun get!13887 (ValueCell!9287 V!31015) V!31015)

(declare-fun dynLambda!1438 (Int (_ BitVec 64)) V!31015)

(assert (=> b!919944 (= lt!412845 (get!13887 (select (arr!26463 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1438 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412846 () Unit!30976)

(declare-fun lemmaListMapRecursiveValidKeyArray!46 (array!55033 array!55035 (_ BitVec 32) (_ BitVec 32) V!31015 V!31015 (_ BitVec 32) Int) Unit!30976)

(assert (=> b!919944 (= lt!412846 (lemmaListMapRecursiveValidKeyArray!46 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919935 () Bool)

(declare-fun res!620398 () Bool)

(assert (=> b!919935 (=> (not res!620398) (not e!516321))))

(declare-fun v!791 () V!31015)

(declare-fun apply!592 (ListLongMap!11507 (_ BitVec 64)) V!31015)

(assert (=> b!919935 (= res!620398 (= (apply!592 lt!412848 k0!1099) v!791))))

(declare-fun res!620391 () Bool)

(assert (=> start!78798 (=> (not res!620391) (not e!516320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78798 (= res!620391 (validMask!0 mask!1881))))

(assert (=> start!78798 e!516320))

(assert (=> start!78798 true))

(assert (=> start!78798 tp_is_empty!19537))

(declare-fun array_inv!20704 (array!55035) Bool)

(assert (=> start!78798 (and (array_inv!20704 _values!1231) e!516317)))

(assert (=> start!78798 tp!59529))

(declare-fun array_inv!20705 (array!55033) Bool)

(assert (=> start!78798 (array_inv!20705 _keys!1487)))

(declare-fun b!919945 () Bool)

(declare-fun res!620396 () Bool)

(assert (=> b!919945 (=> (not res!620396) (not e!516320))))

(assert (=> b!919945 (= res!620396 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26923 _keys!1487))))))

(declare-fun b!919946 () Bool)

(declare-fun e!516318 () Bool)

(assert (=> b!919946 (= e!516318 tp_is_empty!19537)))

(declare-fun b!919947 () Bool)

(declare-fun res!620397 () Bool)

(assert (=> b!919947 (=> (not res!620397) (not e!516321))))

(assert (=> b!919947 (= res!620397 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31062 () Bool)

(declare-fun tp!59528 () Bool)

(assert (=> mapNonEmpty!31062 (= mapRes!31062 (and tp!59528 e!516318))))

(declare-fun mapValue!31062 () ValueCell!9287)

(declare-fun mapRest!31062 () (Array (_ BitVec 32) ValueCell!9287))

(declare-fun mapKey!31062 () (_ BitVec 32))

(assert (=> mapNonEmpty!31062 (= (arr!26463 _values!1231) (store mapRest!31062 mapKey!31062 mapValue!31062))))

(assert (= (and start!78798 res!620391) b!919940))

(assert (= (and b!919940 res!620393) b!919942))

(assert (= (and b!919942 res!620395) b!919943))

(assert (= (and b!919943 res!620399) b!919945))

(assert (= (and b!919945 res!620396) b!919938))

(assert (= (and b!919938 res!620390) b!919935))

(assert (= (and b!919935 res!620398) b!919936))

(assert (= (and b!919936 res!620392) b!919947))

(assert (= (and b!919947 res!620397) b!919941))

(assert (= (and b!919941 res!620394) b!919944))

(assert (= (and b!919939 condMapEmpty!31062) mapIsEmpty!31062))

(assert (= (and b!919939 (not condMapEmpty!31062)) mapNonEmpty!31062))

(get-info :version)

(assert (= (and mapNonEmpty!31062 ((_ is ValueCellFull!9287) mapValue!31062)) b!919946))

(assert (= (and b!919939 ((_ is ValueCellFull!9287) mapDefault!31062)) b!919937))

(assert (= start!78798 b!919939))

(declare-fun b_lambda!13513 () Bool)

(assert (=> (not b_lambda!13513) (not b!919944)))

(declare-fun t!26352 () Bool)

(declare-fun tb!5601 () Bool)

(assert (=> (and start!78798 (= defaultEntry!1235 defaultEntry!1235) t!26352) tb!5601))

(declare-fun result!11033 () Bool)

(assert (=> tb!5601 (= result!11033 tp_is_empty!19537)))

(assert (=> b!919944 t!26352))

(declare-fun b_and!27771 () Bool)

(assert (= b_and!27769 (and (=> t!26352 result!11033) b_and!27771)))

(declare-fun m!853321 () Bool)

(assert (=> b!919941 m!853321))

(declare-fun m!853323 () Bool)

(assert (=> b!919941 m!853323))

(declare-fun m!853325 () Bool)

(assert (=> start!78798 m!853325))

(declare-fun m!853327 () Bool)

(assert (=> start!78798 m!853327))

(declare-fun m!853329 () Bool)

(assert (=> start!78798 m!853329))

(declare-fun m!853331 () Bool)

(assert (=> b!919942 m!853331))

(declare-fun m!853333 () Bool)

(assert (=> b!919938 m!853333))

(declare-fun m!853335 () Bool)

(assert (=> b!919938 m!853335))

(declare-fun m!853337 () Bool)

(assert (=> b!919935 m!853337))

(declare-fun m!853339 () Bool)

(assert (=> b!919943 m!853339))

(declare-fun m!853341 () Bool)

(assert (=> b!919947 m!853341))

(declare-fun m!853343 () Bool)

(assert (=> b!919944 m!853343))

(declare-fun m!853345 () Bool)

(assert (=> b!919944 m!853345))

(assert (=> b!919944 m!853343))

(declare-fun m!853347 () Bool)

(assert (=> b!919944 m!853347))

(declare-fun m!853349 () Bool)

(assert (=> b!919944 m!853349))

(declare-fun m!853351 () Bool)

(assert (=> b!919944 m!853351))

(declare-fun m!853353 () Bool)

(assert (=> b!919944 m!853353))

(declare-fun m!853355 () Bool)

(assert (=> b!919944 m!853355))

(assert (=> b!919944 m!853347))

(assert (=> b!919944 m!853351))

(declare-fun m!853357 () Bool)

(assert (=> b!919944 m!853357))

(declare-fun m!853359 () Bool)

(assert (=> b!919944 m!853359))

(declare-fun m!853361 () Bool)

(assert (=> b!919944 m!853361))

(declare-fun m!853363 () Bool)

(assert (=> b!919944 m!853363))

(assert (=> b!919944 m!853353))

(declare-fun m!853365 () Bool)

(assert (=> b!919944 m!853365))

(declare-fun m!853367 () Bool)

(assert (=> mapNonEmpty!31062 m!853367))

(check-sat (not b!919944) (not b!919947) (not start!78798) (not b_next!17029) b_and!27771 (not b!919942) (not b_lambda!13513) (not b!919935) (not b!919941) (not b!919938) (not mapNonEmpty!31062) (not b!919943) tp_is_empty!19537)
(check-sat b_and!27771 (not b_next!17029))
