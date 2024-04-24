; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78930 () Bool)

(assert start!78930)

(declare-fun b_free!16975 () Bool)

(declare-fun b_next!16975 () Bool)

(assert (=> start!78930 (= b_free!16975 (not b_next!16975))))

(declare-fun tp!59366 () Bool)

(declare-fun b_and!27697 () Bool)

(assert (=> start!78930 (= tp!59366 b_and!27697)))

(declare-fun b!919970 () Bool)

(declare-fun e!516483 () Bool)

(declare-fun e!516482 () Bool)

(declare-fun mapRes!30981 () Bool)

(assert (=> b!919970 (= e!516483 (and e!516482 mapRes!30981))))

(declare-fun condMapEmpty!30981 () Bool)

(declare-datatypes ((V!30943 0))(
  ( (V!30944 (val!9792 Int)) )
))
(declare-datatypes ((ValueCell!9260 0))(
  ( (ValueCellFull!9260 (v!12307 V!30943)) (EmptyCell!9260) )
))
(declare-datatypes ((array!54995 0))(
  ( (array!54996 (arr!26438 (Array (_ BitVec 32) ValueCell!9260)) (size!26898 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54995)

(declare-fun mapDefault!30981 () ValueCell!9260)

(assert (=> b!919970 (= condMapEmpty!30981 (= (arr!26438 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9260)) mapDefault!30981)))))

(declare-fun b!919971 () Bool)

(declare-fun res!620040 () Bool)

(declare-fun e!516478 () Bool)

(assert (=> b!919971 (=> (not res!620040) (not e!516478))))

(declare-datatypes ((array!54997 0))(
  ( (array!54998 (arr!26439 (Array (_ BitVec 32) (_ BitVec 64))) (size!26899 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54997)

(declare-datatypes ((List!18518 0))(
  ( (Nil!18515) (Cons!18514 (h!19666 (_ BitVec 64)) (t!26215 List!18518)) )
))
(declare-fun arrayNoDuplicates!0 (array!54997 (_ BitVec 32) List!18518) Bool)

(assert (=> b!919971 (= res!620040 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18515))))

(declare-fun b!919972 () Bool)

(declare-fun e!516480 () Bool)

(assert (=> b!919972 (= e!516478 e!516480)))

(declare-fun res!620036 () Bool)

(assert (=> b!919972 (=> (not res!620036) (not e!516480))))

(declare-datatypes ((tuple2!12700 0))(
  ( (tuple2!12701 (_1!6361 (_ BitVec 64)) (_2!6361 V!30943)) )
))
(declare-datatypes ((List!18519 0))(
  ( (Nil!18516) (Cons!18515 (h!19667 tuple2!12700) (t!26216 List!18519)) )
))
(declare-datatypes ((ListLongMap!11399 0))(
  ( (ListLongMap!11400 (toList!5715 List!18519)) )
))
(declare-fun lt!412874 () ListLongMap!11399)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4769 (ListLongMap!11399 (_ BitVec 64)) Bool)

(assert (=> b!919972 (= res!620036 (contains!4769 lt!412874 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30943)

(declare-fun minValue!1173 () V!30943)

(declare-fun getCurrentListMap!2969 (array!54997 array!54995 (_ BitVec 32) (_ BitVec 32) V!30943 V!30943 (_ BitVec 32) Int) ListLongMap!11399)

(assert (=> b!919972 (= lt!412874 (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919973 () Bool)

(declare-fun res!620042 () Bool)

(assert (=> b!919973 (=> (not res!620042) (not e!516478))))

(assert (=> b!919973 (= res!620042 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26899 _keys!1487))))))

(declare-fun b!919974 () Bool)

(declare-fun e!516481 () Bool)

(assert (=> b!919974 (= e!516480 e!516481)))

(declare-fun res!620038 () Bool)

(assert (=> b!919974 (=> (not res!620038) (not e!516481))))

(declare-fun lt!412878 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919974 (= res!620038 (validKeyInArray!0 lt!412878))))

(assert (=> b!919974 (= lt!412878 (select (arr!26439 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919975 () Bool)

(declare-fun res!620034 () Bool)

(assert (=> b!919975 (=> (not res!620034) (not e!516480))))

(assert (=> b!919975 (= res!620034 (validKeyInArray!0 k0!1099))))

(declare-fun b!919976 () Bool)

(declare-fun res!620035 () Bool)

(assert (=> b!919976 (=> (not res!620035) (not e!516480))))

(declare-fun v!791 () V!30943)

(declare-fun apply!588 (ListLongMap!11399 (_ BitVec 64)) V!30943)

(assert (=> b!919976 (= res!620035 (= (apply!588 lt!412874 k0!1099) v!791))))

(declare-fun mapNonEmpty!30981 () Bool)

(declare-fun tp!59367 () Bool)

(declare-fun e!516479 () Bool)

(assert (=> mapNonEmpty!30981 (= mapRes!30981 (and tp!59367 e!516479))))

(declare-fun mapKey!30981 () (_ BitVec 32))

(declare-fun mapRest!30981 () (Array (_ BitVec 32) ValueCell!9260))

(declare-fun mapValue!30981 () ValueCell!9260)

(assert (=> mapNonEmpty!30981 (= (arr!26438 _values!1231) (store mapRest!30981 mapKey!30981 mapValue!30981))))

(declare-fun b!919977 () Bool)

(declare-fun res!620039 () Bool)

(assert (=> b!919977 (=> (not res!620039) (not e!516478))))

(assert (=> b!919977 (= res!620039 (and (= (size!26898 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26899 _keys!1487) (size!26898 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30981 () Bool)

(assert (=> mapIsEmpty!30981 mapRes!30981))

(declare-fun res!620041 () Bool)

(assert (=> start!78930 (=> (not res!620041) (not e!516478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78930 (= res!620041 (validMask!0 mask!1881))))

(assert (=> start!78930 e!516478))

(assert (=> start!78930 true))

(declare-fun tp_is_empty!19483 () Bool)

(assert (=> start!78930 tp_is_empty!19483))

(declare-fun array_inv!20700 (array!54995) Bool)

(assert (=> start!78930 (and (array_inv!20700 _values!1231) e!516483)))

(assert (=> start!78930 tp!59366))

(declare-fun array_inv!20701 (array!54997) Bool)

(assert (=> start!78930 (array_inv!20701 _keys!1487)))

(declare-fun b!919978 () Bool)

(assert (=> b!919978 (= e!516482 tp_is_empty!19483)))

(declare-fun b!919979 () Bool)

(assert (=> b!919979 (= e!516481 (not true))))

(assert (=> b!919979 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18515)))

(declare-datatypes ((Unit!31022 0))(
  ( (Unit!31023) )
))
(declare-fun lt!412879 () Unit!31022)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54997 (_ BitVec 32) (_ BitVec 32)) Unit!31022)

(assert (=> b!919979 (= lt!412879 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412875 () tuple2!12700)

(declare-fun +!2655 (ListLongMap!11399 tuple2!12700) ListLongMap!11399)

(assert (=> b!919979 (contains!4769 (+!2655 lt!412874 lt!412875) k0!1099)))

(declare-fun lt!412876 () Unit!31022)

(declare-fun lt!412877 () V!30943)

(declare-fun addStillContains!364 (ListLongMap!11399 (_ BitVec 64) V!30943 (_ BitVec 64)) Unit!31022)

(assert (=> b!919979 (= lt!412876 (addStillContains!364 lt!412874 lt!412878 lt!412877 k0!1099))))

(assert (=> b!919979 (= (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2655 (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412875))))

(assert (=> b!919979 (= lt!412875 (tuple2!12701 lt!412878 lt!412877))))

(declare-fun get!13882 (ValueCell!9260 V!30943) V!30943)

(declare-fun dynLambda!1452 (Int (_ BitVec 64)) V!30943)

(assert (=> b!919979 (= lt!412877 (get!13882 (select (arr!26438 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1452 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412880 () Unit!31022)

(declare-fun lemmaListMapRecursiveValidKeyArray!35 (array!54997 array!54995 (_ BitVec 32) (_ BitVec 32) V!30943 V!30943 (_ BitVec 32) Int) Unit!31022)

(assert (=> b!919979 (= lt!412880 (lemmaListMapRecursiveValidKeyArray!35 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919980 () Bool)

(declare-fun res!620043 () Bool)

(assert (=> b!919980 (=> (not res!620043) (not e!516478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54997 (_ BitVec 32)) Bool)

(assert (=> b!919980 (= res!620043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919981 () Bool)

(assert (=> b!919981 (= e!516479 tp_is_empty!19483)))

(declare-fun b!919982 () Bool)

(declare-fun res!620037 () Bool)

(assert (=> b!919982 (=> (not res!620037) (not e!516480))))

(assert (=> b!919982 (= res!620037 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78930 res!620041) b!919977))

(assert (= (and b!919977 res!620039) b!919980))

(assert (= (and b!919980 res!620043) b!919971))

(assert (= (and b!919971 res!620040) b!919973))

(assert (= (and b!919973 res!620042) b!919972))

(assert (= (and b!919972 res!620036) b!919976))

(assert (= (and b!919976 res!620035) b!919982))

(assert (= (and b!919982 res!620037) b!919975))

(assert (= (and b!919975 res!620034) b!919974))

(assert (= (and b!919974 res!620038) b!919979))

(assert (= (and b!919970 condMapEmpty!30981) mapIsEmpty!30981))

(assert (= (and b!919970 (not condMapEmpty!30981)) mapNonEmpty!30981))

(get-info :version)

(assert (= (and mapNonEmpty!30981 ((_ is ValueCellFull!9260) mapValue!30981)) b!919981))

(assert (= (and b!919970 ((_ is ValueCellFull!9260) mapDefault!30981)) b!919978))

(assert (= start!78930 b!919970))

(declare-fun b_lambda!13491 () Bool)

(assert (=> (not b_lambda!13491) (not b!919979)))

(declare-fun t!26214 () Bool)

(declare-fun tb!5547 () Bool)

(assert (=> (and start!78930 (= defaultEntry!1235 defaultEntry!1235) t!26214) tb!5547))

(declare-fun result!10925 () Bool)

(assert (=> tb!5547 (= result!10925 tp_is_empty!19483)))

(assert (=> b!919979 t!26214))

(declare-fun b_and!27699 () Bool)

(assert (= b_and!27697 (and (=> t!26214 result!10925) b_and!27699)))

(declare-fun m!854077 () Bool)

(assert (=> b!919974 m!854077))

(declare-fun m!854079 () Bool)

(assert (=> b!919974 m!854079))

(declare-fun m!854081 () Bool)

(assert (=> b!919976 m!854081))

(declare-fun m!854083 () Bool)

(assert (=> b!919979 m!854083))

(declare-fun m!854085 () Bool)

(assert (=> b!919979 m!854085))

(declare-fun m!854087 () Bool)

(assert (=> b!919979 m!854087))

(declare-fun m!854089 () Bool)

(assert (=> b!919979 m!854089))

(assert (=> b!919979 m!854083))

(assert (=> b!919979 m!854085))

(declare-fun m!854091 () Bool)

(assert (=> b!919979 m!854091))

(declare-fun m!854093 () Bool)

(assert (=> b!919979 m!854093))

(declare-fun m!854095 () Bool)

(assert (=> b!919979 m!854095))

(declare-fun m!854097 () Bool)

(assert (=> b!919979 m!854097))

(declare-fun m!854099 () Bool)

(assert (=> b!919979 m!854099))

(declare-fun m!854101 () Bool)

(assert (=> b!919979 m!854101))

(assert (=> b!919979 m!854087))

(declare-fun m!854103 () Bool)

(assert (=> b!919979 m!854103))

(declare-fun m!854105 () Bool)

(assert (=> b!919979 m!854105))

(assert (=> b!919979 m!854095))

(declare-fun m!854107 () Bool)

(assert (=> b!919975 m!854107))

(declare-fun m!854109 () Bool)

(assert (=> b!919972 m!854109))

(declare-fun m!854111 () Bool)

(assert (=> b!919972 m!854111))

(declare-fun m!854113 () Bool)

(assert (=> mapNonEmpty!30981 m!854113))

(declare-fun m!854115 () Bool)

(assert (=> b!919980 m!854115))

(declare-fun m!854117 () Bool)

(assert (=> start!78930 m!854117))

(declare-fun m!854119 () Bool)

(assert (=> start!78930 m!854119))

(declare-fun m!854121 () Bool)

(assert (=> start!78930 m!854121))

(declare-fun m!854123 () Bool)

(assert (=> b!919971 m!854123))

(check-sat (not b!919975) (not b_next!16975) (not b_lambda!13491) (not mapNonEmpty!30981) (not b!919974) (not b!919972) (not start!78930) (not b!919980) (not b!919971) tp_is_empty!19483 (not b!919976) b_and!27699 (not b!919979))
(check-sat b_and!27699 (not b_next!16975))
