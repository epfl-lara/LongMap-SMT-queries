; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78930 () Bool)

(assert start!78930)

(declare-fun b_free!17143 () Bool)

(declare-fun b_next!17143 () Bool)

(assert (=> start!78930 (= b_free!17143 (not b_next!17143))))

(declare-fun tp!59869 () Bool)

(declare-fun b_and!28023 () Bool)

(assert (=> start!78930 (= tp!59869 b_and!28023)))

(declare-fun mapIsEmpty!31233 () Bool)

(declare-fun mapRes!31233 () Bool)

(assert (=> mapIsEmpty!31233 mapRes!31233))

(declare-fun b!923082 () Bool)

(declare-fun res!622459 () Bool)

(declare-fun e!517912 () Bool)

(assert (=> b!923082 (=> (not res!622459) (not e!517912))))

(declare-datatypes ((array!55278 0))(
  ( (array!55279 (arr!26584 (Array (_ BitVec 32) (_ BitVec 64))) (size!27043 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55278)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55278 (_ BitVec 32)) Bool)

(assert (=> b!923082 (= res!622459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923083 () Bool)

(declare-fun res!622456 () Bool)

(declare-fun e!517910 () Bool)

(assert (=> b!923083 (=> (not res!622456) (not e!517910))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923083 (= res!622456 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923084 () Bool)

(declare-fun e!517905 () Bool)

(assert (=> b!923084 (= e!517905 (not true))))

(declare-fun lt!414612 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!923084 (not (= lt!414612 k!1099))))

(declare-datatypes ((Unit!31136 0))(
  ( (Unit!31137) )
))
(declare-fun lt!414608 () Unit!31136)

(declare-datatypes ((List!18658 0))(
  ( (Nil!18655) (Cons!18654 (h!19800 (_ BitVec 64)) (t!26531 List!18658)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55278 (_ BitVec 64) (_ BitVec 32) List!18658) Unit!31136)

(assert (=> b!923084 (= lt!414608 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18655))))

(declare-fun e!517908 () Bool)

(assert (=> b!923084 e!517908))

(declare-fun c!96216 () Bool)

(assert (=> b!923084 (= c!96216 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414609 () Unit!31136)

(declare-datatypes ((V!31167 0))(
  ( (V!31168 (val!9876 Int)) )
))
(declare-datatypes ((ValueCell!9344 0))(
  ( (ValueCellFull!9344 (v!12394 V!31167)) (EmptyCell!9344) )
))
(declare-datatypes ((array!55280 0))(
  ( (array!55281 (arr!26585 (Array (_ BitVec 32) ValueCell!9344)) (size!27044 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55280)

(declare-fun zeroValue!1173 () V!31167)

(declare-fun minValue!1173 () V!31167)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!201 (array!55278 array!55280 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 64) (_ BitVec 32) Int) Unit!31136)

(assert (=> b!923084 (= lt!414609 (lemmaListMapContainsThenArrayContainsFrom!201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55278 (_ BitVec 32) List!18658) Bool)

(assert (=> b!923084 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18655)))

(declare-fun lt!414605 () Unit!31136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55278 (_ BitVec 32) (_ BitVec 32)) Unit!31136)

(assert (=> b!923084 (= lt!414605 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12852 0))(
  ( (tuple2!12853 (_1!6437 (_ BitVec 64)) (_2!6437 V!31167)) )
))
(declare-datatypes ((List!18659 0))(
  ( (Nil!18656) (Cons!18655 (h!19801 tuple2!12852) (t!26532 List!18659)) )
))
(declare-datatypes ((ListLongMap!11549 0))(
  ( (ListLongMap!11550 (toList!5790 List!18659)) )
))
(declare-fun lt!414606 () ListLongMap!11549)

(declare-fun lt!414613 () tuple2!12852)

(declare-fun contains!4853 (ListLongMap!11549 (_ BitVec 64)) Bool)

(declare-fun +!2694 (ListLongMap!11549 tuple2!12852) ListLongMap!11549)

(assert (=> b!923084 (contains!4853 (+!2694 lt!414606 lt!414613) k!1099)))

(declare-fun lt!414607 () V!31167)

(declare-fun lt!414610 () Unit!31136)

(declare-fun addStillContains!418 (ListLongMap!11549 (_ BitVec 64) V!31167 (_ BitVec 64)) Unit!31136)

(assert (=> b!923084 (= lt!414610 (addStillContains!418 lt!414606 lt!414612 lt!414607 k!1099))))

(declare-fun getCurrentListMap!3044 (array!55278 array!55280 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 32) Int) ListLongMap!11549)

(assert (=> b!923084 (= (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2694 (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414613))))

(assert (=> b!923084 (= lt!414613 (tuple2!12853 lt!414612 lt!414607))))

(declare-fun get!13965 (ValueCell!9344 V!31167) V!31167)

(declare-fun dynLambda!1483 (Int (_ BitVec 64)) V!31167)

(assert (=> b!923084 (= lt!414607 (get!13965 (select (arr!26585 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1483 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414611 () Unit!31136)

(declare-fun lemmaListMapRecursiveValidKeyArray!84 (array!55278 array!55280 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 32) Int) Unit!31136)

(assert (=> b!923084 (= lt!414611 (lemmaListMapRecursiveValidKeyArray!84 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923085 () Bool)

(declare-fun res!622462 () Bool)

(assert (=> b!923085 (=> (not res!622462) (not e!517910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923085 (= res!622462 (validKeyInArray!0 k!1099))))

(declare-fun b!923086 () Bool)

(declare-fun e!517909 () Bool)

(declare-fun tp_is_empty!19651 () Bool)

(assert (=> b!923086 (= e!517909 tp_is_empty!19651)))

(declare-fun b!923087 () Bool)

(declare-fun res!622453 () Bool)

(assert (=> b!923087 (=> (not res!622453) (not e!517912))))

(assert (=> b!923087 (= res!622453 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27043 _keys!1487))))))

(declare-fun b!923088 () Bool)

(declare-fun res!622461 () Bool)

(assert (=> b!923088 (=> (not res!622461) (not e!517912))))

(assert (=> b!923088 (= res!622461 (and (= (size!27044 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27043 _keys!1487) (size!27044 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31233 () Bool)

(declare-fun tp!59870 () Bool)

(assert (=> mapNonEmpty!31233 (= mapRes!31233 (and tp!59870 e!517909))))

(declare-fun mapKey!31233 () (_ BitVec 32))

(declare-fun mapValue!31233 () ValueCell!9344)

(declare-fun mapRest!31233 () (Array (_ BitVec 32) ValueCell!9344))

(assert (=> mapNonEmpty!31233 (= (arr!26585 _values!1231) (store mapRest!31233 mapKey!31233 mapValue!31233))))

(declare-fun b!923089 () Bool)

(declare-fun arrayContainsKey!0 (array!55278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923089 (= e!517908 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!923090 () Bool)

(assert (=> b!923090 (= e!517910 e!517905)))

(declare-fun res!622460 () Bool)

(assert (=> b!923090 (=> (not res!622460) (not e!517905))))

(assert (=> b!923090 (= res!622460 (validKeyInArray!0 lt!414612))))

(assert (=> b!923090 (= lt!414612 (select (arr!26584 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923091 () Bool)

(declare-fun res!622455 () Bool)

(assert (=> b!923091 (=> (not res!622455) (not e!517910))))

(declare-fun v!791 () V!31167)

(declare-fun apply!621 (ListLongMap!11549 (_ BitVec 64)) V!31167)

(assert (=> b!923091 (= res!622455 (= (apply!621 lt!414606 k!1099) v!791))))

(declare-fun b!923092 () Bool)

(declare-fun res!622457 () Bool)

(assert (=> b!923092 (=> (not res!622457) (not e!517912))))

(assert (=> b!923092 (= res!622457 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18655))))

(declare-fun b!923093 () Bool)

(declare-fun e!517907 () Bool)

(declare-fun e!517906 () Bool)

(assert (=> b!923093 (= e!517907 (and e!517906 mapRes!31233))))

(declare-fun condMapEmpty!31233 () Bool)

(declare-fun mapDefault!31233 () ValueCell!9344)

