; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77714 () Bool)

(assert start!77714)

(declare-fun b_free!16299 () Bool)

(declare-fun b_next!16299 () Bool)

(assert (=> start!77714 (= b_free!16299 (not b_next!16299))))

(declare-fun tp!57159 () Bool)

(declare-fun b_and!26751 () Bool)

(assert (=> start!77714 (= tp!57159 b_and!26751)))

(declare-fun b!906640 () Bool)

(declare-fun res!611871 () Bool)

(declare-fun e!508086 () Bool)

(assert (=> b!906640 (=> res!611871 e!508086)))

(declare-datatypes ((V!29921 0))(
  ( (V!29922 (val!9409 Int)) )
))
(declare-fun lt!408996 () V!29921)

(declare-datatypes ((tuple2!12250 0))(
  ( (tuple2!12251 (_1!6136 (_ BitVec 64)) (_2!6136 V!29921)) )
))
(declare-datatypes ((List!18055 0))(
  ( (Nil!18052) (Cons!18051 (h!19197 tuple2!12250) (t!25526 List!18055)) )
))
(declare-datatypes ((ListLongMap!10947 0))(
  ( (ListLongMap!10948 (toList!5489 List!18055)) )
))
(declare-fun lt!408993 () ListLongMap!10947)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!475 (ListLongMap!10947 (_ BitVec 64)) V!29921)

(assert (=> b!906640 (= res!611871 (not (= (apply!475 lt!408993 k0!1033) lt!408996)))))

(declare-fun b!906641 () Bool)

(declare-fun res!611870 () Bool)

(declare-fun e!508087 () Bool)

(assert (=> b!906641 (=> (not res!611870) (not e!508087))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906641 (= res!611870 (inRange!0 i!717 mask!1756))))

(declare-fun res!611876 () Bool)

(declare-fun e!508082 () Bool)

(assert (=> start!77714 (=> (not res!611876) (not e!508082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77714 (= res!611876 (validMask!0 mask!1756))))

(assert (=> start!77714 e!508082))

(declare-datatypes ((ValueCell!8877 0))(
  ( (ValueCellFull!8877 (v!11914 V!29921)) (EmptyCell!8877) )
))
(declare-datatypes ((array!53476 0))(
  ( (array!53477 (arr!25697 (Array (_ BitVec 32) ValueCell!8877)) (size!26156 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53476)

(declare-fun e!508088 () Bool)

(declare-fun array_inv!20130 (array!53476) Bool)

(assert (=> start!77714 (and (array_inv!20130 _values!1152) e!508088)))

(assert (=> start!77714 tp!57159))

(assert (=> start!77714 true))

(declare-fun tp_is_empty!18717 () Bool)

(assert (=> start!77714 tp_is_empty!18717))

(declare-datatypes ((array!53478 0))(
  ( (array!53479 (arr!25698 (Array (_ BitVec 32) (_ BitVec 64))) (size!26157 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53478)

(declare-fun array_inv!20131 (array!53478) Bool)

(assert (=> start!77714 (array_inv!20131 _keys!1386)))

(declare-fun b!906642 () Bool)

(declare-fun res!611879 () Bool)

(assert (=> b!906642 (=> (not res!611879) (not e!508082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53478 (_ BitVec 32)) Bool)

(assert (=> b!906642 (= res!611879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906643 () Bool)

(declare-fun res!611873 () Bool)

(assert (=> b!906643 (=> (not res!611873) (not e!508082))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!906643 (= res!611873 (and (= (size!26156 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26157 _keys!1386) (size!26156 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906644 () Bool)

(declare-fun res!611872 () Bool)

(assert (=> b!906644 (=> (not res!611872) (not e!508082))))

(declare-datatypes ((List!18056 0))(
  ( (Nil!18053) (Cons!18052 (h!19198 (_ BitVec 64)) (t!25527 List!18056)) )
))
(declare-fun arrayNoDuplicates!0 (array!53478 (_ BitVec 32) List!18056) Bool)

(assert (=> b!906644 (= res!611872 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18053))))

(declare-fun b!906645 () Bool)

(declare-fun e!508089 () Bool)

(assert (=> b!906645 (= e!508089 tp_is_empty!18717)))

(declare-fun b!906646 () Bool)

(assert (=> b!906646 (= e!508082 e!508087)))

(declare-fun res!611874 () Bool)

(assert (=> b!906646 (=> (not res!611874) (not e!508087))))

(declare-fun lt!408994 () ListLongMap!10947)

(declare-fun contains!4534 (ListLongMap!10947 (_ BitVec 64)) Bool)

(assert (=> b!906646 (= res!611874 (contains!4534 lt!408994 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29921)

(declare-fun minValue!1094 () V!29921)

(declare-fun getCurrentListMap!2755 (array!53478 array!53476 (_ BitVec 32) (_ BitVec 32) V!29921 V!29921 (_ BitVec 32) Int) ListLongMap!10947)

(assert (=> b!906646 (= lt!408994 (getCurrentListMap!2755 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906647 () Bool)

(declare-fun res!611877 () Bool)

(assert (=> b!906647 (=> (not res!611877) (not e!508087))))

(assert (=> b!906647 (= res!611877 (and (= (select (arr!25698 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906648 () Bool)

(assert (=> b!906648 (= e!508086 true)))

(assert (=> b!906648 (= (apply!475 lt!408994 k0!1033) lt!408996)))

(declare-datatypes ((Unit!30772 0))(
  ( (Unit!30773) )
))
(declare-fun lt!408995 () Unit!30772)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!30 (array!53478 array!53476 (_ BitVec 32) (_ BitVec 32) V!29921 V!29921 (_ BitVec 64) V!29921 (_ BitVec 32) Int) Unit!30772)

(assert (=> b!906648 (= lt!408995 (lemmaListMapApplyFromThenApplyFromZero!30 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408996 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29788 () Bool)

(declare-fun mapRes!29788 () Bool)

(declare-fun tp!57158 () Bool)

(assert (=> mapNonEmpty!29788 (= mapRes!29788 (and tp!57158 e!508089))))

(declare-fun mapRest!29788 () (Array (_ BitVec 32) ValueCell!8877))

(declare-fun mapKey!29788 () (_ BitVec 32))

(declare-fun mapValue!29788 () ValueCell!8877)

(assert (=> mapNonEmpty!29788 (= (arr!25697 _values!1152) (store mapRest!29788 mapKey!29788 mapValue!29788))))

(declare-fun b!906649 () Bool)

(declare-fun e!508085 () Bool)

(assert (=> b!906649 (= e!508085 e!508086)))

(declare-fun res!611875 () Bool)

(assert (=> b!906649 (=> res!611875 e!508086)))

(assert (=> b!906649 (= res!611875 (not (contains!4534 lt!408993 k0!1033)))))

(assert (=> b!906649 (= lt!408993 (getCurrentListMap!2755 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906650 () Bool)

(declare-fun e!508084 () Bool)

(assert (=> b!906650 (= e!508084 tp_is_empty!18717)))

(declare-fun mapIsEmpty!29788 () Bool)

(assert (=> mapIsEmpty!29788 mapRes!29788))

(declare-fun b!906651 () Bool)

(assert (=> b!906651 (= e!508087 (not e!508085))))

(declare-fun res!611878 () Bool)

(assert (=> b!906651 (=> res!611878 e!508085)))

(assert (=> b!906651 (= res!611878 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26157 _keys!1386))))))

(declare-fun get!13512 (ValueCell!8877 V!29921) V!29921)

(declare-fun dynLambda!1352 (Int (_ BitVec 64)) V!29921)

(assert (=> b!906651 (= lt!408996 (get!13512 (select (arr!25697 _values!1152) i!717) (dynLambda!1352 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906651 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408992 () Unit!30772)

(declare-fun lemmaKeyInListMapIsInArray!224 (array!53478 array!53476 (_ BitVec 32) (_ BitVec 32) V!29921 V!29921 (_ BitVec 64) Int) Unit!30772)

(assert (=> b!906651 (= lt!408992 (lemmaKeyInListMapIsInArray!224 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906652 () Bool)

(assert (=> b!906652 (= e!508088 (and e!508084 mapRes!29788))))

(declare-fun condMapEmpty!29788 () Bool)

(declare-fun mapDefault!29788 () ValueCell!8877)

(assert (=> b!906652 (= condMapEmpty!29788 (= (arr!25697 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8877)) mapDefault!29788)))))

(assert (= (and start!77714 res!611876) b!906643))

(assert (= (and b!906643 res!611873) b!906642))

(assert (= (and b!906642 res!611879) b!906644))

(assert (= (and b!906644 res!611872) b!906646))

(assert (= (and b!906646 res!611874) b!906641))

(assert (= (and b!906641 res!611870) b!906647))

(assert (= (and b!906647 res!611877) b!906651))

(assert (= (and b!906651 (not res!611878)) b!906649))

(assert (= (and b!906649 (not res!611875)) b!906640))

(assert (= (and b!906640 (not res!611871)) b!906648))

(assert (= (and b!906652 condMapEmpty!29788) mapIsEmpty!29788))

(assert (= (and b!906652 (not condMapEmpty!29788)) mapNonEmpty!29788))

(get-info :version)

(assert (= (and mapNonEmpty!29788 ((_ is ValueCellFull!8877) mapValue!29788)) b!906645))

(assert (= (and b!906652 ((_ is ValueCellFull!8877) mapDefault!29788)) b!906650))

(assert (= start!77714 b!906652))

(declare-fun b_lambda!13173 () Bool)

(assert (=> (not b_lambda!13173) (not b!906651)))

(declare-fun t!25525 () Bool)

(declare-fun tb!5321 () Bool)

(assert (=> (and start!77714 (= defaultEntry!1160 defaultEntry!1160) t!25525) tb!5321))

(declare-fun result!10437 () Bool)

(assert (=> tb!5321 (= result!10437 tp_is_empty!18717)))

(assert (=> b!906651 t!25525))

(declare-fun b_and!26753 () Bool)

(assert (= b_and!26751 (and (=> t!25525 result!10437) b_and!26753)))

(declare-fun m!842015 () Bool)

(assert (=> b!906649 m!842015))

(declare-fun m!842017 () Bool)

(assert (=> b!906649 m!842017))

(declare-fun m!842019 () Bool)

(assert (=> b!906647 m!842019))

(declare-fun m!842021 () Bool)

(assert (=> b!906646 m!842021))

(declare-fun m!842023 () Bool)

(assert (=> b!906646 m!842023))

(declare-fun m!842025 () Bool)

(assert (=> b!906641 m!842025))

(declare-fun m!842027 () Bool)

(assert (=> b!906642 m!842027))

(declare-fun m!842029 () Bool)

(assert (=> b!906648 m!842029))

(declare-fun m!842031 () Bool)

(assert (=> b!906648 m!842031))

(declare-fun m!842033 () Bool)

(assert (=> b!906651 m!842033))

(declare-fun m!842035 () Bool)

(assert (=> b!906651 m!842035))

(declare-fun m!842037 () Bool)

(assert (=> b!906651 m!842037))

(declare-fun m!842039 () Bool)

(assert (=> b!906651 m!842039))

(assert (=> b!906651 m!842033))

(assert (=> b!906651 m!842037))

(declare-fun m!842041 () Bool)

(assert (=> b!906651 m!842041))

(declare-fun m!842043 () Bool)

(assert (=> b!906644 m!842043))

(declare-fun m!842045 () Bool)

(assert (=> start!77714 m!842045))

(declare-fun m!842047 () Bool)

(assert (=> start!77714 m!842047))

(declare-fun m!842049 () Bool)

(assert (=> start!77714 m!842049))

(declare-fun m!842051 () Bool)

(assert (=> mapNonEmpty!29788 m!842051))

(declare-fun m!842053 () Bool)

(assert (=> b!906640 m!842053))

(check-sat (not b!906644) (not b!906642) tp_is_empty!18717 (not b!906651) (not b_next!16299) (not mapNonEmpty!29788) b_and!26753 (not b!906648) (not b!906649) (not b!906640) (not b_lambda!13173) (not b!906646) (not start!77714) (not b!906641))
(check-sat b_and!26753 (not b_next!16299))
