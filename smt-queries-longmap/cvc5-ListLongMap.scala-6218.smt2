; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79474 () Bool)

(assert start!79474)

(declare-fun b_free!17629 () Bool)

(declare-fun b_next!17629 () Bool)

(assert (=> start!79474 (= b_free!17629 (not b_next!17629))))

(declare-fun tp!61334 () Bool)

(declare-fun b_and!28825 () Bool)

(assert (=> start!79474 (= tp!61334 b_and!28825)))

(declare-fun b!934089 () Bool)

(declare-fun res!629127 () Bool)

(declare-fun e!524505 () Bool)

(assert (=> b!934089 (=> (not res!629127) (not e!524505))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56212 0))(
  ( (array!56213 (arr!27049 (Array (_ BitVec 32) (_ BitVec 64))) (size!27508 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56212)

(assert (=> b!934089 (= res!629127 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27508 _keys!1487))))))

(declare-fun b!934090 () Bool)

(declare-fun res!629123 () Bool)

(assert (=> b!934090 (=> (not res!629123) (not e!524505))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56212 (_ BitVec 32)) Bool)

(assert (=> b!934090 (= res!629123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934091 () Bool)

(declare-fun e!524508 () Bool)

(declare-fun e!524506 () Bool)

(assert (=> b!934091 (= e!524508 e!524506)))

(declare-fun res!629121 () Bool)

(assert (=> b!934091 (=> (not res!629121) (not e!524506))))

(declare-fun lt!420806 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934091 (= res!629121 (validKeyInArray!0 lt!420806))))

(assert (=> b!934091 (= lt!420806 (select (arr!27049 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31968 () Bool)

(declare-fun mapRes!31968 () Bool)

(declare-fun tp!61333 () Bool)

(declare-fun e!524507 () Bool)

(assert (=> mapNonEmpty!31968 (= mapRes!31968 (and tp!61333 e!524507))))

(declare-datatypes ((V!31815 0))(
  ( (V!31816 (val!10119 Int)) )
))
(declare-datatypes ((ValueCell!9587 0))(
  ( (ValueCellFull!9587 (v!12639 V!31815)) (EmptyCell!9587) )
))
(declare-fun mapRest!31968 () (Array (_ BitVec 32) ValueCell!9587))

(declare-fun mapKey!31968 () (_ BitVec 32))

(declare-fun mapValue!31968 () ValueCell!9587)

(declare-datatypes ((array!56214 0))(
  ( (array!56215 (arr!27050 (Array (_ BitVec 32) ValueCell!9587)) (size!27509 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56214)

(assert (=> mapNonEmpty!31968 (= (arr!27050 _values!1231) (store mapRest!31968 mapKey!31968 mapValue!31968))))

(declare-fun b!934093 () Bool)

(assert (=> b!934093 (= e!524505 e!524508)))

(declare-fun res!629124 () Bool)

(assert (=> b!934093 (=> (not res!629124) (not e!524508))))

(declare-datatypes ((tuple2!13268 0))(
  ( (tuple2!13269 (_1!6645 (_ BitVec 64)) (_2!6645 V!31815)) )
))
(declare-datatypes ((List!19050 0))(
  ( (Nil!19047) (Cons!19046 (h!20192 tuple2!13268) (t!27223 List!19050)) )
))
(declare-datatypes ((ListLongMap!11965 0))(
  ( (ListLongMap!11966 (toList!5998 List!19050)) )
))
(declare-fun lt!420804 () ListLongMap!11965)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5049 (ListLongMap!11965 (_ BitVec 64)) Bool)

(assert (=> b!934093 (= res!629124 (contains!5049 lt!420804 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31815)

(declare-fun minValue!1173 () V!31815)

(declare-fun getCurrentListMap!3236 (array!56212 array!56214 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 32) Int) ListLongMap!11965)

(assert (=> b!934093 (= lt!420804 (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934094 () Bool)

(declare-fun e!524502 () Bool)

(declare-fun tp_is_empty!20137 () Bool)

(assert (=> b!934094 (= e!524502 tp_is_empty!20137)))

(declare-fun b!934095 () Bool)

(declare-fun res!629120 () Bool)

(assert (=> b!934095 (=> (not res!629120) (not e!524505))))

(assert (=> b!934095 (= res!629120 (and (= (size!27509 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27508 _keys!1487) (size!27509 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934096 () Bool)

(assert (=> b!934096 (= e!524507 tp_is_empty!20137)))

(declare-fun b!934097 () Bool)

(assert (=> b!934097 (= e!524506 (not true))))

(declare-fun e!524503 () Bool)

(assert (=> b!934097 e!524503))

(declare-fun c!97134 () Bool)

(assert (=> b!934097 (= c!97134 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31516 0))(
  ( (Unit!31517) )
))
(declare-fun lt!420800 () Unit!31516)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!270 (array!56212 array!56214 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 64) (_ BitVec 32) Int) Unit!31516)

(assert (=> b!934097 (= lt!420800 (lemmaListMapContainsThenArrayContainsFrom!270 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19051 0))(
  ( (Nil!19048) (Cons!19047 (h!20193 (_ BitVec 64)) (t!27224 List!19051)) )
))
(declare-fun arrayNoDuplicates!0 (array!56212 (_ BitVec 32) List!19051) Bool)

(assert (=> b!934097 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19048)))

(declare-fun lt!420807 () Unit!31516)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56212 (_ BitVec 32) (_ BitVec 32)) Unit!31516)

(assert (=> b!934097 (= lt!420807 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420802 () tuple2!13268)

(declare-fun +!2798 (ListLongMap!11965 tuple2!13268) ListLongMap!11965)

(assert (=> b!934097 (contains!5049 (+!2798 lt!420804 lt!420802) k!1099)))

(declare-fun lt!420803 () Unit!31516)

(declare-fun lt!420805 () V!31815)

(declare-fun addStillContains!517 (ListLongMap!11965 (_ BitVec 64) V!31815 (_ BitVec 64)) Unit!31516)

(assert (=> b!934097 (= lt!420803 (addStillContains!517 lt!420804 lt!420806 lt!420805 k!1099))))

(assert (=> b!934097 (= (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2798 (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420802))))

(assert (=> b!934097 (= lt!420802 (tuple2!13269 lt!420806 lt!420805))))

(declare-fun get!14237 (ValueCell!9587 V!31815) V!31815)

(declare-fun dynLambda!1587 (Int (_ BitVec 64)) V!31815)

(assert (=> b!934097 (= lt!420805 (get!14237 (select (arr!27050 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1587 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420801 () Unit!31516)

(declare-fun lemmaListMapRecursiveValidKeyArray!188 (array!56212 array!56214 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 32) Int) Unit!31516)

(assert (=> b!934097 (= lt!420801 (lemmaListMapRecursiveValidKeyArray!188 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934098 () Bool)

(declare-fun arrayContainsKey!0 (array!56212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934098 (= e!524503 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!934099 () Bool)

(declare-fun res!629122 () Bool)

(assert (=> b!934099 (=> (not res!629122) (not e!524505))))

(assert (=> b!934099 (= res!629122 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19048))))

(declare-fun b!934100 () Bool)

(declare-fun res!629126 () Bool)

(assert (=> b!934100 (=> (not res!629126) (not e!524508))))

(assert (=> b!934100 (= res!629126 (validKeyInArray!0 k!1099))))

(declare-fun b!934101 () Bool)

(declare-fun res!629119 () Bool)

(assert (=> b!934101 (=> (not res!629119) (not e!524508))))

(assert (=> b!934101 (= res!629119 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934102 () Bool)

(assert (=> b!934102 (= e!524503 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!629128 () Bool)

(assert (=> start!79474 (=> (not res!629128) (not e!524505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79474 (= res!629128 (validMask!0 mask!1881))))

(assert (=> start!79474 e!524505))

(assert (=> start!79474 true))

(assert (=> start!79474 tp_is_empty!20137))

(declare-fun e!524501 () Bool)

(declare-fun array_inv!21052 (array!56214) Bool)

(assert (=> start!79474 (and (array_inv!21052 _values!1231) e!524501)))

(assert (=> start!79474 tp!61334))

(declare-fun array_inv!21053 (array!56212) Bool)

(assert (=> start!79474 (array_inv!21053 _keys!1487)))

(declare-fun b!934092 () Bool)

(assert (=> b!934092 (= e!524501 (and e!524502 mapRes!31968))))

(declare-fun condMapEmpty!31968 () Bool)

(declare-fun mapDefault!31968 () ValueCell!9587)

