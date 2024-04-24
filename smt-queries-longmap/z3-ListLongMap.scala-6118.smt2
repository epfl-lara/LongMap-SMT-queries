; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78984 () Bool)

(assert start!78984)

(declare-fun b_free!17029 () Bool)

(declare-fun b_next!17029 () Bool)

(assert (=> start!78984 (= b_free!17029 (not b_next!17029))))

(declare-fun tp!59529 () Bool)

(declare-fun b_and!27805 () Bool)

(assert (=> start!78984 (= tp!59529 b_and!27805)))

(declare-fun b!921077 () Bool)

(declare-fun res!620846 () Bool)

(declare-fun e!517046 () Bool)

(assert (=> b!921077 (=> (not res!620846) (not e!517046))))

(declare-datatypes ((array!55101 0))(
  ( (array!55102 (arr!26491 (Array (_ BitVec 32) (_ BitVec 64))) (size!26951 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55101)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55101 (_ BitVec 32)) Bool)

(assert (=> b!921077 (= res!620846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921078 () Bool)

(declare-fun res!620845 () Bool)

(declare-fun e!517048 () Bool)

(assert (=> b!921078 (=> (not res!620845) (not e!517048))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921078 (= res!620845 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921079 () Bool)

(declare-fun e!517047 () Bool)

(declare-fun tp_is_empty!19537 () Bool)

(assert (=> b!921079 (= e!517047 tp_is_empty!19537)))

(declare-fun b!921080 () Bool)

(declare-fun e!517049 () Bool)

(declare-fun e!517045 () Bool)

(declare-fun mapRes!31062 () Bool)

(assert (=> b!921080 (= e!517049 (and e!517045 mapRes!31062))))

(declare-fun condMapEmpty!31062 () Bool)

(declare-datatypes ((V!31015 0))(
  ( (V!31016 (val!9819 Int)) )
))
(declare-datatypes ((ValueCell!9287 0))(
  ( (ValueCellFull!9287 (v!12334 V!31015)) (EmptyCell!9287) )
))
(declare-datatypes ((array!55103 0))(
  ( (array!55104 (arr!26492 (Array (_ BitVec 32) ValueCell!9287)) (size!26952 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55103)

(declare-fun mapDefault!31062 () ValueCell!9287)

(assert (=> b!921080 (= condMapEmpty!31062 (= (arr!26492 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9287)) mapDefault!31062)))))

(declare-fun b!921081 () Bool)

(declare-fun res!620849 () Bool)

(assert (=> b!921081 (=> (not res!620849) (not e!517046))))

(declare-datatypes ((List!18563 0))(
  ( (Nil!18560) (Cons!18559 (h!19711 (_ BitVec 64)) (t!26314 List!18563)) )
))
(declare-fun arrayNoDuplicates!0 (array!55101 (_ BitVec 32) List!18563) Bool)

(assert (=> b!921081 (= res!620849 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18560))))

(declare-fun res!620848 () Bool)

(assert (=> start!78984 (=> (not res!620848) (not e!517046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78984 (= res!620848 (validMask!0 mask!1881))))

(assert (=> start!78984 e!517046))

(assert (=> start!78984 true))

(assert (=> start!78984 tp_is_empty!19537))

(declare-fun array_inv!20738 (array!55103) Bool)

(assert (=> start!78984 (and (array_inv!20738 _values!1231) e!517049)))

(assert (=> start!78984 tp!59529))

(declare-fun array_inv!20739 (array!55101) Bool)

(assert (=> start!78984 (array_inv!20739 _keys!1487)))

(declare-fun b!921082 () Bool)

(assert (=> b!921082 (= e!517045 tp_is_empty!19537)))

(declare-fun b!921083 () Bool)

(declare-fun e!517051 () Bool)

(assert (=> b!921083 (= e!517051 (not true))))

(assert (=> b!921083 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18560)))

(declare-datatypes ((Unit!31058 0))(
  ( (Unit!31059) )
))
(declare-fun lt!413446 () Unit!31058)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55101 (_ BitVec 32) (_ BitVec 32)) Unit!31058)

(assert (=> b!921083 (= lt!413446 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12748 0))(
  ( (tuple2!12749 (_1!6385 (_ BitVec 64)) (_2!6385 V!31015)) )
))
(declare-datatypes ((List!18564 0))(
  ( (Nil!18561) (Cons!18560 (h!19712 tuple2!12748) (t!26315 List!18564)) )
))
(declare-datatypes ((ListLongMap!11447 0))(
  ( (ListLongMap!11448 (toList!5739 List!18564)) )
))
(declare-fun lt!413443 () ListLongMap!11447)

(declare-fun lt!413441 () tuple2!12748)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4792 (ListLongMap!11447 (_ BitVec 64)) Bool)

(declare-fun +!2673 (ListLongMap!11447 tuple2!12748) ListLongMap!11447)

(assert (=> b!921083 (contains!4792 (+!2673 lt!413443 lt!413441) k0!1099)))

(declare-fun lt!413444 () V!31015)

(declare-fun lt!413442 () Unit!31058)

(declare-fun lt!413447 () (_ BitVec 64))

(declare-fun addStillContains!382 (ListLongMap!11447 (_ BitVec 64) V!31015 (_ BitVec 64)) Unit!31058)

(assert (=> b!921083 (= lt!413442 (addStillContains!382 lt!413443 lt!413447 lt!413444 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31015)

(declare-fun minValue!1173 () V!31015)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2992 (array!55101 array!55103 (_ BitVec 32) (_ BitVec 32) V!31015 V!31015 (_ BitVec 32) Int) ListLongMap!11447)

(assert (=> b!921083 (= (getCurrentListMap!2992 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2673 (getCurrentListMap!2992 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413441))))

(assert (=> b!921083 (= lt!413441 (tuple2!12749 lt!413447 lt!413444))))

(declare-fun get!13918 (ValueCell!9287 V!31015) V!31015)

(declare-fun dynLambda!1470 (Int (_ BitVec 64)) V!31015)

(assert (=> b!921083 (= lt!413444 (get!13918 (select (arr!26492 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1470 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413445 () Unit!31058)

(declare-fun lemmaListMapRecursiveValidKeyArray!53 (array!55101 array!55103 (_ BitVec 32) (_ BitVec 32) V!31015 V!31015 (_ BitVec 32) Int) Unit!31058)

(assert (=> b!921083 (= lt!413445 (lemmaListMapRecursiveValidKeyArray!53 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31062 () Bool)

(assert (=> mapIsEmpty!31062 mapRes!31062))

(declare-fun b!921084 () Bool)

(declare-fun res!620852 () Bool)

(assert (=> b!921084 (=> (not res!620852) (not e!517048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921084 (= res!620852 (validKeyInArray!0 k0!1099))))

(declare-fun b!921085 () Bool)

(assert (=> b!921085 (= e!517048 e!517051)))

(declare-fun res!620847 () Bool)

(assert (=> b!921085 (=> (not res!620847) (not e!517051))))

(assert (=> b!921085 (= res!620847 (validKeyInArray!0 lt!413447))))

(assert (=> b!921085 (= lt!413447 (select (arr!26491 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921086 () Bool)

(declare-fun res!620844 () Bool)

(assert (=> b!921086 (=> (not res!620844) (not e!517046))))

(assert (=> b!921086 (= res!620844 (and (= (size!26952 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26951 _keys!1487) (size!26952 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921087 () Bool)

(declare-fun res!620851 () Bool)

(assert (=> b!921087 (=> (not res!620851) (not e!517046))))

(assert (=> b!921087 (= res!620851 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26951 _keys!1487))))))

(declare-fun b!921088 () Bool)

(declare-fun res!620853 () Bool)

(assert (=> b!921088 (=> (not res!620853) (not e!517048))))

(declare-fun v!791 () V!31015)

(declare-fun apply!606 (ListLongMap!11447 (_ BitVec 64)) V!31015)

(assert (=> b!921088 (= res!620853 (= (apply!606 lt!413443 k0!1099) v!791))))

(declare-fun b!921089 () Bool)

(assert (=> b!921089 (= e!517046 e!517048)))

(declare-fun res!620850 () Bool)

(assert (=> b!921089 (=> (not res!620850) (not e!517048))))

(assert (=> b!921089 (= res!620850 (contains!4792 lt!413443 k0!1099))))

(assert (=> b!921089 (= lt!413443 (getCurrentListMap!2992 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31062 () Bool)

(declare-fun tp!59528 () Bool)

(assert (=> mapNonEmpty!31062 (= mapRes!31062 (and tp!59528 e!517047))))

(declare-fun mapKey!31062 () (_ BitVec 32))

(declare-fun mapValue!31062 () ValueCell!9287)

(declare-fun mapRest!31062 () (Array (_ BitVec 32) ValueCell!9287))

(assert (=> mapNonEmpty!31062 (= (arr!26492 _values!1231) (store mapRest!31062 mapKey!31062 mapValue!31062))))

(assert (= (and start!78984 res!620848) b!921086))

(assert (= (and b!921086 res!620844) b!921077))

(assert (= (and b!921077 res!620846) b!921081))

(assert (= (and b!921081 res!620849) b!921087))

(assert (= (and b!921087 res!620851) b!921089))

(assert (= (and b!921089 res!620850) b!921088))

(assert (= (and b!921088 res!620853) b!921078))

(assert (= (and b!921078 res!620845) b!921084))

(assert (= (and b!921084 res!620852) b!921085))

(assert (= (and b!921085 res!620847) b!921083))

(assert (= (and b!921080 condMapEmpty!31062) mapIsEmpty!31062))

(assert (= (and b!921080 (not condMapEmpty!31062)) mapNonEmpty!31062))

(get-info :version)

(assert (= (and mapNonEmpty!31062 ((_ is ValueCellFull!9287) mapValue!31062)) b!921079))

(assert (= (and b!921080 ((_ is ValueCellFull!9287) mapDefault!31062)) b!921082))

(assert (= start!78984 b!921080))

(declare-fun b_lambda!13545 () Bool)

(assert (=> (not b_lambda!13545) (not b!921083)))

(declare-fun t!26313 () Bool)

(declare-fun tb!5601 () Bool)

(assert (=> (and start!78984 (= defaultEntry!1235 defaultEntry!1235) t!26313) tb!5601))

(declare-fun result!11033 () Bool)

(assert (=> tb!5601 (= result!11033 tp_is_empty!19537)))

(assert (=> b!921083 t!26313))

(declare-fun b_and!27807 () Bool)

(assert (= b_and!27805 (and (=> t!26313 result!11033) b_and!27807)))

(declare-fun m!855373 () Bool)

(assert (=> b!921081 m!855373))

(declare-fun m!855375 () Bool)

(assert (=> start!78984 m!855375))

(declare-fun m!855377 () Bool)

(assert (=> start!78984 m!855377))

(declare-fun m!855379 () Bool)

(assert (=> start!78984 m!855379))

(declare-fun m!855381 () Bool)

(assert (=> b!921077 m!855381))

(declare-fun m!855383 () Bool)

(assert (=> b!921088 m!855383))

(declare-fun m!855385 () Bool)

(assert (=> b!921084 m!855385))

(declare-fun m!855387 () Bool)

(assert (=> b!921083 m!855387))

(declare-fun m!855389 () Bool)

(assert (=> b!921083 m!855389))

(declare-fun m!855391 () Bool)

(assert (=> b!921083 m!855391))

(assert (=> b!921083 m!855387))

(assert (=> b!921083 m!855389))

(declare-fun m!855393 () Bool)

(assert (=> b!921083 m!855393))

(declare-fun m!855395 () Bool)

(assert (=> b!921083 m!855395))

(declare-fun m!855397 () Bool)

(assert (=> b!921083 m!855397))

(declare-fun m!855399 () Bool)

(assert (=> b!921083 m!855399))

(declare-fun m!855401 () Bool)

(assert (=> b!921083 m!855401))

(declare-fun m!855403 () Bool)

(assert (=> b!921083 m!855403))

(declare-fun m!855405 () Bool)

(assert (=> b!921083 m!855405))

(assert (=> b!921083 m!855401))

(declare-fun m!855407 () Bool)

(assert (=> b!921083 m!855407))

(assert (=> b!921083 m!855397))

(declare-fun m!855409 () Bool)

(assert (=> b!921083 m!855409))

(declare-fun m!855411 () Bool)

(assert (=> b!921089 m!855411))

(declare-fun m!855413 () Bool)

(assert (=> b!921089 m!855413))

(declare-fun m!855415 () Bool)

(assert (=> mapNonEmpty!31062 m!855415))

(declare-fun m!855417 () Bool)

(assert (=> b!921085 m!855417))

(declare-fun m!855419 () Bool)

(assert (=> b!921085 m!855419))

(check-sat (not mapNonEmpty!31062) tp_is_empty!19537 (not b!921085) (not start!78984) (not b_next!17029) (not b!921081) (not b!921077) (not b!921088) (not b!921089) b_and!27807 (not b!921083) (not b!921084) (not b_lambda!13545))
(check-sat b_and!27807 (not b_next!17029))
