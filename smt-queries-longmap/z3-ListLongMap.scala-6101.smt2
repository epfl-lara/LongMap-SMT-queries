; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78882 () Bool)

(assert start!78882)

(declare-fun b_free!16927 () Bool)

(declare-fun b_next!16927 () Bool)

(assert (=> start!78882 (= b_free!16927 (not b_next!16927))))

(declare-fun tp!59222 () Bool)

(declare-fun b_and!27601 () Bool)

(assert (=> start!78882 (= tp!59222 b_and!27601)))

(declare-fun b!918986 () Bool)

(declare-fun e!515974 () Bool)

(declare-fun tp_is_empty!19435 () Bool)

(assert (=> b!918986 (= e!515974 tp_is_empty!19435)))

(declare-fun b!918987 () Bool)

(declare-fun res!619315 () Bool)

(declare-fun e!515978 () Bool)

(assert (=> b!918987 (=> (not res!619315) (not e!515978))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918987 (= res!619315 (validKeyInArray!0 k0!1099))))

(declare-fun b!918988 () Bool)

(declare-fun res!619318 () Bool)

(declare-fun e!515979 () Bool)

(assert (=> b!918988 (=> (not res!619318) (not e!515979))))

(declare-datatypes ((array!54901 0))(
  ( (array!54902 (arr!26391 (Array (_ BitVec 32) (_ BitVec 64))) (size!26851 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54901)

(declare-datatypes ((List!18476 0))(
  ( (Nil!18473) (Cons!18472 (h!19624 (_ BitVec 64)) (t!26125 List!18476)) )
))
(declare-fun arrayNoDuplicates!0 (array!54901 (_ BitVec 32) List!18476) Bool)

(assert (=> b!918988 (= res!619318 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18473))))

(declare-fun mapIsEmpty!30909 () Bool)

(declare-fun mapRes!30909 () Bool)

(assert (=> mapIsEmpty!30909 mapRes!30909))

(declare-fun b!918989 () Bool)

(declare-fun e!515977 () Bool)

(assert (=> b!918989 (= e!515977 (and e!515974 mapRes!30909))))

(declare-fun condMapEmpty!30909 () Bool)

(declare-datatypes ((V!30879 0))(
  ( (V!30880 (val!9768 Int)) )
))
(declare-datatypes ((ValueCell!9236 0))(
  ( (ValueCellFull!9236 (v!12283 V!30879)) (EmptyCell!9236) )
))
(declare-datatypes ((array!54903 0))(
  ( (array!54904 (arr!26392 (Array (_ BitVec 32) ValueCell!9236)) (size!26852 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54903)

(declare-fun mapDefault!30909 () ValueCell!9236)

(assert (=> b!918989 (= condMapEmpty!30909 (= (arr!26392 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9236)) mapDefault!30909)))))

(declare-fun b!918990 () Bool)

(declare-fun e!515980 () Bool)

(assert (=> b!918990 (= e!515978 e!515980)))

(declare-fun res!619320 () Bool)

(assert (=> b!918990 (=> (not res!619320) (not e!515980))))

(declare-fun lt!412516 () (_ BitVec 64))

(assert (=> b!918990 (= res!619320 (validKeyInArray!0 lt!412516))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918990 (= lt!412516 (select (arr!26391 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918991 () Bool)

(declare-fun res!619319 () Bool)

(assert (=> b!918991 (=> (not res!619319) (not e!515979))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54901 (_ BitVec 32)) Bool)

(assert (=> b!918991 (= res!619319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918992 () Bool)

(declare-fun res!619321 () Bool)

(assert (=> b!918992 (=> (not res!619321) (not e!515978))))

(declare-fun v!791 () V!30879)

(declare-datatypes ((tuple2!12656 0))(
  ( (tuple2!12657 (_1!6339 (_ BitVec 64)) (_2!6339 V!30879)) )
))
(declare-datatypes ((List!18477 0))(
  ( (Nil!18474) (Cons!18473 (h!19625 tuple2!12656) (t!26126 List!18477)) )
))
(declare-datatypes ((ListLongMap!11355 0))(
  ( (ListLongMap!11356 (toList!5693 List!18477)) )
))
(declare-fun lt!412515 () ListLongMap!11355)

(declare-fun apply!571 (ListLongMap!11355 (_ BitVec 64)) V!30879)

(assert (=> b!918992 (= res!619321 (= (apply!571 lt!412515 k0!1099) v!791))))

(declare-fun b!918993 () Bool)

(declare-fun res!619314 () Bool)

(assert (=> b!918993 (=> (not res!619314) (not e!515978))))

(assert (=> b!918993 (= res!619314 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918994 () Bool)

(declare-fun res!619322 () Bool)

(assert (=> b!918994 (=> (not res!619322) (not e!515979))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!918994 (= res!619322 (and (= (size!26852 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26851 _keys!1487) (size!26852 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918995 () Bool)

(assert (=> b!918995 (= e!515979 e!515978)))

(declare-fun res!619316 () Bool)

(assert (=> b!918995 (=> (not res!619316) (not e!515978))))

(declare-fun contains!4747 (ListLongMap!11355 (_ BitVec 64)) Bool)

(assert (=> b!918995 (= res!619316 (contains!4747 lt!412515 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30879)

(declare-fun minValue!1173 () V!30879)

(declare-fun getCurrentListMap!2947 (array!54901 array!54903 (_ BitVec 32) (_ BitVec 32) V!30879 V!30879 (_ BitVec 32) Int) ListLongMap!11355)

(assert (=> b!918995 (= lt!412515 (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918996 () Bool)

(declare-fun res!619323 () Bool)

(assert (=> b!918996 (=> (not res!619323) (not e!515979))))

(assert (=> b!918996 (= res!619323 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26851 _keys!1487))))))

(declare-fun b!918997 () Bool)

(declare-fun e!515975 () Bool)

(assert (=> b!918997 (= e!515975 tp_is_empty!19435)))

(declare-fun mapNonEmpty!30909 () Bool)

(declare-fun tp!59223 () Bool)

(assert (=> mapNonEmpty!30909 (= mapRes!30909 (and tp!59223 e!515975))))

(declare-fun mapRest!30909 () (Array (_ BitVec 32) ValueCell!9236))

(declare-fun mapKey!30909 () (_ BitVec 32))

(declare-fun mapValue!30909 () ValueCell!9236)

(assert (=> mapNonEmpty!30909 (= (arr!26392 _values!1231) (store mapRest!30909 mapKey!30909 mapValue!30909))))

(declare-fun b!918998 () Bool)

(assert (=> b!918998 (= e!515980 (not true))))

(declare-fun +!2636 (ListLongMap!11355 tuple2!12656) ListLongMap!11355)

(declare-fun get!13847 (ValueCell!9236 V!30879) V!30879)

(declare-fun dynLambda!1433 (Int (_ BitVec 64)) V!30879)

(assert (=> b!918998 (= (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2636 (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12657 lt!412516 (get!13847 (select (arr!26392 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1433 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30984 0))(
  ( (Unit!30985) )
))
(declare-fun lt!412517 () Unit!30984)

(declare-fun lemmaListMapRecursiveValidKeyArray!16 (array!54901 array!54903 (_ BitVec 32) (_ BitVec 32) V!30879 V!30879 (_ BitVec 32) Int) Unit!30984)

(assert (=> b!918998 (= lt!412517 (lemmaListMapRecursiveValidKeyArray!16 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619317 () Bool)

(assert (=> start!78882 (=> (not res!619317) (not e!515979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78882 (= res!619317 (validMask!0 mask!1881))))

(assert (=> start!78882 e!515979))

(assert (=> start!78882 true))

(assert (=> start!78882 tp_is_empty!19435))

(declare-fun array_inv!20672 (array!54903) Bool)

(assert (=> start!78882 (and (array_inv!20672 _values!1231) e!515977)))

(assert (=> start!78882 tp!59222))

(declare-fun array_inv!20673 (array!54901) Bool)

(assert (=> start!78882 (array_inv!20673 _keys!1487)))

(assert (= (and start!78882 res!619317) b!918994))

(assert (= (and b!918994 res!619322) b!918991))

(assert (= (and b!918991 res!619319) b!918988))

(assert (= (and b!918988 res!619318) b!918996))

(assert (= (and b!918996 res!619323) b!918995))

(assert (= (and b!918995 res!619316) b!918992))

(assert (= (and b!918992 res!619321) b!918993))

(assert (= (and b!918993 res!619314) b!918987))

(assert (= (and b!918987 res!619315) b!918990))

(assert (= (and b!918990 res!619320) b!918998))

(assert (= (and b!918989 condMapEmpty!30909) mapIsEmpty!30909))

(assert (= (and b!918989 (not condMapEmpty!30909)) mapNonEmpty!30909))

(get-info :version)

(assert (= (and mapNonEmpty!30909 ((_ is ValueCellFull!9236) mapValue!30909)) b!918997))

(assert (= (and b!918989 ((_ is ValueCellFull!9236) mapDefault!30909)) b!918986))

(assert (= start!78882 b!918989))

(declare-fun b_lambda!13443 () Bool)

(assert (=> (not b_lambda!13443) (not b!918998)))

(declare-fun t!26124 () Bool)

(declare-fun tb!5499 () Bool)

(assert (=> (and start!78882 (= defaultEntry!1235 defaultEntry!1235) t!26124) tb!5499))

(declare-fun result!10829 () Bool)

(assert (=> tb!5499 (= result!10829 tp_is_empty!19435)))

(assert (=> b!918998 t!26124))

(declare-fun b_and!27603 () Bool)

(assert (= b_and!27601 (and (=> t!26124 result!10829) b_and!27603)))

(declare-fun m!853075 () Bool)

(assert (=> b!918995 m!853075))

(declare-fun m!853077 () Bool)

(assert (=> b!918995 m!853077))

(declare-fun m!853079 () Bool)

(assert (=> b!918988 m!853079))

(declare-fun m!853081 () Bool)

(assert (=> b!918990 m!853081))

(declare-fun m!853083 () Bool)

(assert (=> b!918990 m!853083))

(declare-fun m!853085 () Bool)

(assert (=> b!918991 m!853085))

(declare-fun m!853087 () Bool)

(assert (=> b!918992 m!853087))

(declare-fun m!853089 () Bool)

(assert (=> b!918987 m!853089))

(declare-fun m!853091 () Bool)

(assert (=> mapNonEmpty!30909 m!853091))

(declare-fun m!853093 () Bool)

(assert (=> b!918998 m!853093))

(declare-fun m!853095 () Bool)

(assert (=> b!918998 m!853095))

(assert (=> b!918998 m!853093))

(assert (=> b!918998 m!853095))

(declare-fun m!853097 () Bool)

(assert (=> b!918998 m!853097))

(declare-fun m!853099 () Bool)

(assert (=> b!918998 m!853099))

(declare-fun m!853101 () Bool)

(assert (=> b!918998 m!853101))

(declare-fun m!853103 () Bool)

(assert (=> b!918998 m!853103))

(assert (=> b!918998 m!853101))

(declare-fun m!853105 () Bool)

(assert (=> b!918998 m!853105))

(declare-fun m!853107 () Bool)

(assert (=> start!78882 m!853107))

(declare-fun m!853109 () Bool)

(assert (=> start!78882 m!853109))

(declare-fun m!853111 () Bool)

(assert (=> start!78882 m!853111))

(check-sat b_and!27603 (not b!918990) (not b_next!16927) tp_is_empty!19435 (not b!918995) (not b_lambda!13443) (not b!918998) (not b!918988) (not b!918987) (not b!918992) (not mapNonEmpty!30909) (not start!78882) (not b!918991))
(check-sat b_and!27603 (not b_next!16927))
