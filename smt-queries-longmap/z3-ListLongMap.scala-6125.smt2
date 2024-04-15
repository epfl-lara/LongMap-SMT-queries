; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78840 () Bool)

(assert start!78840)

(declare-fun b_free!17071 () Bool)

(declare-fun b_next!17071 () Bool)

(assert (=> start!78840 (= b_free!17071 (not b_next!17071))))

(declare-fun tp!59654 () Bool)

(declare-fun b_and!27853 () Bool)

(assert (=> start!78840 (= tp!59654 b_and!27853)))

(declare-fun b!921076 () Bool)

(declare-fun e!516869 () Bool)

(declare-fun e!516874 () Bool)

(assert (=> b!921076 (= e!516869 e!516874)))

(declare-fun res!621188 () Bool)

(assert (=> b!921076 (=> (not res!621188) (not e!516874))))

(declare-fun lt!413403 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921076 (= res!621188 (validKeyInArray!0 lt!413403))))

(declare-datatypes ((array!55111 0))(
  ( (array!55112 (arr!26501 (Array (_ BitVec 32) (_ BitVec 64))) (size!26962 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55111)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921076 (= lt!413403 (select (arr!26501 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921077 () Bool)

(declare-fun res!621195 () Bool)

(declare-fun e!516875 () Bool)

(assert (=> b!921077 (=> (not res!621195) (not e!516875))))

(declare-datatypes ((List!18638 0))(
  ( (Nil!18635) (Cons!18634 (h!19780 (_ BitVec 64)) (t!26430 List!18638)) )
))
(declare-fun arrayNoDuplicates!0 (array!55111 (_ BitVec 32) List!18638) Bool)

(assert (=> b!921077 (= res!621195 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18635))))

(declare-fun b!921078 () Bool)

(declare-fun res!621197 () Bool)

(declare-fun e!516873 () Bool)

(assert (=> b!921078 (=> res!621197 e!516873)))

(declare-fun contains!4798 (List!18638 (_ BitVec 64)) Bool)

(assert (=> b!921078 (= res!621197 (contains!4798 Nil!18635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921079 () Bool)

(assert (=> b!921079 (= e!516873 true)))

(declare-fun lt!413402 () Bool)

(assert (=> b!921079 (= lt!413402 (contains!4798 Nil!18635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921080 () Bool)

(declare-fun res!621198 () Bool)

(assert (=> b!921080 (=> (not res!621198) (not e!516875))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31071 0))(
  ( (V!31072 (val!9840 Int)) )
))
(declare-datatypes ((ValueCell!9308 0))(
  ( (ValueCellFull!9308 (v!12357 V!31071)) (EmptyCell!9308) )
))
(declare-datatypes ((array!55113 0))(
  ( (array!55114 (arr!26502 (Array (_ BitVec 32) ValueCell!9308)) (size!26963 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55113)

(assert (=> b!921080 (= res!621198 (and (= (size!26963 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26962 _keys!1487) (size!26963 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921081 () Bool)

(assert (=> b!921081 (= e!516874 (not e!516873))))

(declare-fun res!621194 () Bool)

(assert (=> b!921081 (=> res!621194 e!516873)))

(assert (=> b!921081 (= res!621194 (or (bvsge (size!26962 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26962 _keys!1487))))))

(declare-fun e!516870 () Bool)

(assert (=> b!921081 e!516870))

(declare-fun c!96043 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!921081 (= c!96043 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31006 0))(
  ( (Unit!31007) )
))
(declare-fun lt!413405 () Unit!31006)

(declare-fun zeroValue!1173 () V!31071)

(declare-fun minValue!1173 () V!31071)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!185 (array!55111 array!55113 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 64) (_ BitVec 32) Int) Unit!31006)

(assert (=> b!921081 (= lt!413405 (lemmaListMapContainsThenArrayContainsFrom!185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921081 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18635)))

(declare-fun lt!413397 () Unit!31006)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55111 (_ BitVec 32) (_ BitVec 32)) Unit!31006)

(assert (=> b!921081 (= lt!413397 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12854 0))(
  ( (tuple2!12855 (_1!6438 (_ BitVec 64)) (_2!6438 V!31071)) )
))
(declare-datatypes ((List!18639 0))(
  ( (Nil!18636) (Cons!18635 (h!19781 tuple2!12854) (t!26431 List!18639)) )
))
(declare-datatypes ((ListLongMap!11541 0))(
  ( (ListLongMap!11542 (toList!5786 List!18639)) )
))
(declare-fun lt!413401 () ListLongMap!11541)

(declare-fun lt!413398 () tuple2!12854)

(declare-fun contains!4799 (ListLongMap!11541 (_ BitVec 64)) Bool)

(declare-fun +!2697 (ListLongMap!11541 tuple2!12854) ListLongMap!11541)

(assert (=> b!921081 (contains!4799 (+!2697 lt!413401 lt!413398) k0!1099)))

(declare-fun lt!413404 () V!31071)

(declare-fun lt!413399 () Unit!31006)

(declare-fun addStillContains!394 (ListLongMap!11541 (_ BitVec 64) V!31071 (_ BitVec 64)) Unit!31006)

(assert (=> b!921081 (= lt!413399 (addStillContains!394 lt!413401 lt!413403 lt!413404 k0!1099))))

(declare-fun getCurrentListMap!2977 (array!55111 array!55113 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 32) Int) ListLongMap!11541)

(assert (=> b!921081 (= (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2697 (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413398))))

(assert (=> b!921081 (= lt!413398 (tuple2!12855 lt!413403 lt!413404))))

(declare-fun get!13916 (ValueCell!9308 V!31071) V!31071)

(declare-fun dynLambda!1453 (Int (_ BitVec 64)) V!31071)

(assert (=> b!921081 (= lt!413404 (get!13916 (select (arr!26502 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1453 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413400 () Unit!31006)

(declare-fun lemmaListMapRecursiveValidKeyArray!61 (array!55111 array!55113 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 32) Int) Unit!31006)

(assert (=> b!921081 (= lt!413400 (lemmaListMapRecursiveValidKeyArray!61 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921083 () Bool)

(assert (=> b!921083 (= e!516875 e!516869)))

(declare-fun res!621199 () Bool)

(assert (=> b!921083 (=> (not res!621199) (not e!516869))))

(assert (=> b!921083 (= res!621199 (contains!4799 lt!413401 k0!1099))))

(assert (=> b!921083 (= lt!413401 (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921084 () Bool)

(declare-fun arrayContainsKey!0 (array!55111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921084 (= e!516870 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921085 () Bool)

(declare-fun res!621193 () Bool)

(assert (=> b!921085 (=> (not res!621193) (not e!516869))))

(assert (=> b!921085 (= res!621193 (validKeyInArray!0 k0!1099))))

(declare-fun b!921086 () Bool)

(declare-fun e!516871 () Bool)

(declare-fun tp_is_empty!19579 () Bool)

(assert (=> b!921086 (= e!516871 tp_is_empty!19579)))

(declare-fun mapNonEmpty!31125 () Bool)

(declare-fun mapRes!31125 () Bool)

(declare-fun tp!59655 () Bool)

(assert (=> mapNonEmpty!31125 (= mapRes!31125 (and tp!59655 e!516871))))

(declare-fun mapRest!31125 () (Array (_ BitVec 32) ValueCell!9308))

(declare-fun mapKey!31125 () (_ BitVec 32))

(declare-fun mapValue!31125 () ValueCell!9308)

(assert (=> mapNonEmpty!31125 (= (arr!26502 _values!1231) (store mapRest!31125 mapKey!31125 mapValue!31125))))

(declare-fun b!921087 () Bool)

(assert (=> b!921087 (= e!516870 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921088 () Bool)

(declare-fun e!516876 () Bool)

(assert (=> b!921088 (= e!516876 tp_is_empty!19579)))

(declare-fun b!921089 () Bool)

(declare-fun res!621190 () Bool)

(assert (=> b!921089 (=> res!621190 e!516873)))

(declare-fun noDuplicate!1350 (List!18638) Bool)

(assert (=> b!921089 (= res!621190 (not (noDuplicate!1350 Nil!18635)))))

(declare-fun b!921090 () Bool)

(declare-fun e!516868 () Bool)

(assert (=> b!921090 (= e!516868 (and e!516876 mapRes!31125))))

(declare-fun condMapEmpty!31125 () Bool)

(declare-fun mapDefault!31125 () ValueCell!9308)

(assert (=> b!921090 (= condMapEmpty!31125 (= (arr!26502 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9308)) mapDefault!31125)))))

(declare-fun res!621189 () Bool)

(assert (=> start!78840 (=> (not res!621189) (not e!516875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78840 (= res!621189 (validMask!0 mask!1881))))

(assert (=> start!78840 e!516875))

(assert (=> start!78840 true))

(assert (=> start!78840 tp_is_empty!19579))

(declare-fun array_inv!20732 (array!55113) Bool)

(assert (=> start!78840 (and (array_inv!20732 _values!1231) e!516868)))

(assert (=> start!78840 tp!59654))

(declare-fun array_inv!20733 (array!55111) Bool)

(assert (=> start!78840 (array_inv!20733 _keys!1487)))

(declare-fun b!921082 () Bool)

(declare-fun res!621196 () Bool)

(assert (=> b!921082 (=> (not res!621196) (not e!516875))))

(assert (=> b!921082 (= res!621196 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26962 _keys!1487))))))

(declare-fun mapIsEmpty!31125 () Bool)

(assert (=> mapIsEmpty!31125 mapRes!31125))

(declare-fun b!921091 () Bool)

(declare-fun res!621192 () Bool)

(assert (=> b!921091 (=> (not res!621192) (not e!516869))))

(declare-fun v!791 () V!31071)

(declare-fun apply!606 (ListLongMap!11541 (_ BitVec 64)) V!31071)

(assert (=> b!921091 (= res!621192 (= (apply!606 lt!413401 k0!1099) v!791))))

(declare-fun b!921092 () Bool)

(declare-fun res!621200 () Bool)

(assert (=> b!921092 (=> (not res!621200) (not e!516875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55111 (_ BitVec 32)) Bool)

(assert (=> b!921092 (= res!621200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921093 () Bool)

(declare-fun res!621191 () Bool)

(assert (=> b!921093 (=> (not res!621191) (not e!516869))))

(assert (=> b!921093 (= res!621191 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78840 res!621189) b!921080))

(assert (= (and b!921080 res!621198) b!921092))

(assert (= (and b!921092 res!621200) b!921077))

(assert (= (and b!921077 res!621195) b!921082))

(assert (= (and b!921082 res!621196) b!921083))

(assert (= (and b!921083 res!621199) b!921091))

(assert (= (and b!921091 res!621192) b!921093))

(assert (= (and b!921093 res!621191) b!921085))

(assert (= (and b!921085 res!621193) b!921076))

(assert (= (and b!921076 res!621188) b!921081))

(assert (= (and b!921081 c!96043) b!921084))

(assert (= (and b!921081 (not c!96043)) b!921087))

(assert (= (and b!921081 (not res!621194)) b!921089))

(assert (= (and b!921089 (not res!621190)) b!921078))

(assert (= (and b!921078 (not res!621197)) b!921079))

(assert (= (and b!921090 condMapEmpty!31125) mapIsEmpty!31125))

(assert (= (and b!921090 (not condMapEmpty!31125)) mapNonEmpty!31125))

(get-info :version)

(assert (= (and mapNonEmpty!31125 ((_ is ValueCellFull!9308) mapValue!31125)) b!921086))

(assert (= (and b!921090 ((_ is ValueCellFull!9308) mapDefault!31125)) b!921088))

(assert (= start!78840 b!921090))

(declare-fun b_lambda!13555 () Bool)

(assert (=> (not b_lambda!13555) (not b!921081)))

(declare-fun t!26429 () Bool)

(declare-fun tb!5643 () Bool)

(assert (=> (and start!78840 (= defaultEntry!1235 defaultEntry!1235) t!26429) tb!5643))

(declare-fun result!11117 () Bool)

(assert (=> tb!5643 (= result!11117 tp_is_empty!19579)))

(assert (=> b!921081 t!26429))

(declare-fun b_and!27855 () Bool)

(assert (= b_and!27853 (and (=> t!26429 result!11117) b_and!27855)))

(declare-fun m!854509 () Bool)

(assert (=> b!921079 m!854509))

(declare-fun m!854511 () Bool)

(assert (=> b!921076 m!854511))

(declare-fun m!854513 () Bool)

(assert (=> b!921076 m!854513))

(declare-fun m!854515 () Bool)

(assert (=> start!78840 m!854515))

(declare-fun m!854517 () Bool)

(assert (=> start!78840 m!854517))

(declare-fun m!854519 () Bool)

(assert (=> start!78840 m!854519))

(declare-fun m!854521 () Bool)

(assert (=> b!921092 m!854521))

(declare-fun m!854523 () Bool)

(assert (=> b!921089 m!854523))

(declare-fun m!854525 () Bool)

(assert (=> b!921078 m!854525))

(declare-fun m!854527 () Bool)

(assert (=> b!921085 m!854527))

(declare-fun m!854529 () Bool)

(assert (=> mapNonEmpty!31125 m!854529))

(declare-fun m!854531 () Bool)

(assert (=> b!921084 m!854531))

(declare-fun m!854533 () Bool)

(assert (=> b!921083 m!854533))

(declare-fun m!854535 () Bool)

(assert (=> b!921083 m!854535))

(declare-fun m!854537 () Bool)

(assert (=> b!921091 m!854537))

(declare-fun m!854539 () Bool)

(assert (=> b!921077 m!854539))

(declare-fun m!854541 () Bool)

(assert (=> b!921081 m!854541))

(declare-fun m!854543 () Bool)

(assert (=> b!921081 m!854543))

(declare-fun m!854545 () Bool)

(assert (=> b!921081 m!854545))

(declare-fun m!854547 () Bool)

(assert (=> b!921081 m!854547))

(declare-fun m!854549 () Bool)

(assert (=> b!921081 m!854549))

(assert (=> b!921081 m!854543))

(assert (=> b!921081 m!854545))

(declare-fun m!854551 () Bool)

(assert (=> b!921081 m!854551))

(declare-fun m!854553 () Bool)

(assert (=> b!921081 m!854553))

(declare-fun m!854555 () Bool)

(assert (=> b!921081 m!854555))

(declare-fun m!854557 () Bool)

(assert (=> b!921081 m!854557))

(declare-fun m!854559 () Bool)

(assert (=> b!921081 m!854559))

(assert (=> b!921081 m!854547))

(declare-fun m!854561 () Bool)

(assert (=> b!921081 m!854561))

(declare-fun m!854563 () Bool)

(assert (=> b!921081 m!854563))

(declare-fun m!854565 () Bool)

(assert (=> b!921081 m!854565))

(assert (=> b!921081 m!854561))

(check-sat (not b!921079) (not b!921078) (not b!921081) (not b!921083) b_and!27855 (not b!921084) (not b!921076) (not b!921092) (not mapNonEmpty!31125) (not b!921091) tp_is_empty!19579 (not b!921089) (not b_next!17071) (not b_lambda!13555) (not start!78840) (not b!921085) (not b!921077))
(check-sat b_and!27855 (not b_next!17071))
