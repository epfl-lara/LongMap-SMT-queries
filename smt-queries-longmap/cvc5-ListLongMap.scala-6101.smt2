; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78714 () Bool)

(assert start!78714)

(declare-fun b_free!16927 () Bool)

(declare-fun b_next!16927 () Bool)

(assert (=> start!78714 (= b_free!16927 (not b_next!16927))))

(declare-fun tp!59221 () Bool)

(declare-fun b_and!27591 () Bool)

(assert (=> start!78714 (= tp!59221 b_and!27591)))

(declare-fun b!918083 () Bool)

(declare-fun res!618976 () Bool)

(declare-fun e!515395 () Bool)

(assert (=> b!918083 (=> (not res!618976) (not e!515395))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54854 0))(
  ( (array!54855 (arr!26372 (Array (_ BitVec 32) (_ BitVec 64))) (size!26831 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54854)

(assert (=> b!918083 (= res!618976 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26831 _keys!1487))))))

(declare-fun b!918084 () Bool)

(declare-fun res!618971 () Bool)

(declare-fun e!515397 () Bool)

(assert (=> b!918084 (=> (not res!618971) (not e!515397))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!30879 0))(
  ( (V!30880 (val!9768 Int)) )
))
(declare-fun v!791 () V!30879)

(declare-datatypes ((tuple2!12690 0))(
  ( (tuple2!12691 (_1!6356 (_ BitVec 64)) (_2!6356 V!30879)) )
))
(declare-datatypes ((List!18496 0))(
  ( (Nil!18493) (Cons!18492 (h!19638 tuple2!12690) (t!26153 List!18496)) )
))
(declare-datatypes ((ListLongMap!11387 0))(
  ( (ListLongMap!11388 (toList!5709 List!18496)) )
))
(declare-fun lt!412155 () ListLongMap!11387)

(declare-fun apply!559 (ListLongMap!11387 (_ BitVec 64)) V!30879)

(assert (=> b!918084 (= res!618971 (= (apply!559 lt!412155 k!1099) v!791))))

(declare-fun mapIsEmpty!30909 () Bool)

(declare-fun mapRes!30909 () Bool)

(assert (=> mapIsEmpty!30909 mapRes!30909))

(declare-fun b!918085 () Bool)

(declare-fun res!618970 () Bool)

(assert (=> b!918085 (=> (not res!618970) (not e!515395))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54854 (_ BitVec 32)) Bool)

(assert (=> b!918085 (= res!618970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918086 () Bool)

(declare-fun res!618979 () Bool)

(assert (=> b!918086 (=> (not res!618979) (not e!515395))))

(declare-datatypes ((List!18497 0))(
  ( (Nil!18494) (Cons!18493 (h!19639 (_ BitVec 64)) (t!26154 List!18497)) )
))
(declare-fun arrayNoDuplicates!0 (array!54854 (_ BitVec 32) List!18497) Bool)

(assert (=> b!918086 (= res!618979 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18494))))

(declare-fun b!918087 () Bool)

(declare-fun e!515394 () Bool)

(assert (=> b!918087 (= e!515397 e!515394)))

(declare-fun res!618974 () Bool)

(assert (=> b!918087 (=> (not res!618974) (not e!515394))))

(declare-fun lt!412154 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918087 (= res!618974 (validKeyInArray!0 lt!412154))))

(assert (=> b!918087 (= lt!412154 (select (arr!26372 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918088 () Bool)

(declare-fun res!618972 () Bool)

(assert (=> b!918088 (=> (not res!618972) (not e!515397))))

(assert (=> b!918088 (= res!618972 (validKeyInArray!0 k!1099))))

(declare-fun b!918089 () Bool)

(assert (=> b!918089 (= e!515395 e!515397)))

(declare-fun res!618975 () Bool)

(assert (=> b!918089 (=> (not res!618975) (not e!515397))))

(declare-fun contains!4758 (ListLongMap!11387 (_ BitVec 64)) Bool)

(assert (=> b!918089 (= res!618975 (contains!4758 lt!412155 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9236 0))(
  ( (ValueCellFull!9236 (v!12286 V!30879)) (EmptyCell!9236) )
))
(declare-datatypes ((array!54856 0))(
  ( (array!54857 (arr!26373 (Array (_ BitVec 32) ValueCell!9236)) (size!26832 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54856)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30879)

(declare-fun minValue!1173 () V!30879)

(declare-fun getCurrentListMap!2966 (array!54854 array!54856 (_ BitVec 32) (_ BitVec 32) V!30879 V!30879 (_ BitVec 32) Int) ListLongMap!11387)

(assert (=> b!918089 (= lt!412155 (getCurrentListMap!2966 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918090 () Bool)

(declare-fun e!515398 () Bool)

(declare-fun tp_is_empty!19435 () Bool)

(assert (=> b!918090 (= e!515398 tp_is_empty!19435)))

(declare-fun b!918091 () Bool)

(assert (=> b!918091 (= e!515394 (not true))))

(declare-fun +!2622 (ListLongMap!11387 tuple2!12690) ListLongMap!11387)

(declare-fun get!13821 (ValueCell!9236 V!30879) V!30879)

(declare-fun dynLambda!1411 (Int (_ BitVec 64)) V!30879)

(assert (=> b!918091 (= (getCurrentListMap!2966 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2622 (getCurrentListMap!2966 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12691 lt!412154 (get!13821 (select (arr!26373 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1411 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30992 0))(
  ( (Unit!30993) )
))
(declare-fun lt!412156 () Unit!30992)

(declare-fun lemmaListMapRecursiveValidKeyArray!12 (array!54854 array!54856 (_ BitVec 32) (_ BitVec 32) V!30879 V!30879 (_ BitVec 32) Int) Unit!30992)

(assert (=> b!918091 (= lt!412156 (lemmaListMapRecursiveValidKeyArray!12 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918092 () Bool)

(declare-fun res!618973 () Bool)

(assert (=> b!918092 (=> (not res!618973) (not e!515397))))

(assert (=> b!918092 (= res!618973 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918093 () Bool)

(declare-fun e!515396 () Bool)

(assert (=> b!918093 (= e!515396 tp_is_empty!19435)))

(declare-fun b!918094 () Bool)

(declare-fun res!618977 () Bool)

(assert (=> b!918094 (=> (not res!618977) (not e!515395))))

(assert (=> b!918094 (= res!618977 (and (= (size!26832 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26831 _keys!1487) (size!26832 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30909 () Bool)

(declare-fun tp!59222 () Bool)

(assert (=> mapNonEmpty!30909 (= mapRes!30909 (and tp!59222 e!515398))))

(declare-fun mapValue!30909 () ValueCell!9236)

(declare-fun mapKey!30909 () (_ BitVec 32))

(declare-fun mapRest!30909 () (Array (_ BitVec 32) ValueCell!9236))

(assert (=> mapNonEmpty!30909 (= (arr!26373 _values!1231) (store mapRest!30909 mapKey!30909 mapValue!30909))))

(declare-fun b!918095 () Bool)

(declare-fun e!515392 () Bool)

(assert (=> b!918095 (= e!515392 (and e!515396 mapRes!30909))))

(declare-fun condMapEmpty!30909 () Bool)

(declare-fun mapDefault!30909 () ValueCell!9236)

