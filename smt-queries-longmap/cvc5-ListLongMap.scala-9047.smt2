; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109066 () Bool)

(assert start!109066)

(declare-fun b_free!28555 () Bool)

(declare-fun b_next!28555 () Bool)

(assert (=> start!109066 (= b_free!28555 (not b_next!28555))))

(declare-fun tp!100783 () Bool)

(declare-fun b_and!46645 () Bool)

(assert (=> start!109066 (= tp!100783 b_and!46645)))

(declare-fun b!1289273 () Bool)

(declare-fun e!736133 () Bool)

(declare-fun e!736131 () Bool)

(assert (=> b!1289273 (= e!736133 (not e!736131))))

(declare-fun res!856393 () Bool)

(assert (=> b!1289273 (=> res!856393 e!736131)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289273 (= res!856393 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50697 0))(
  ( (V!50698 (val!17172 Int)) )
))
(declare-datatypes ((tuple2!22054 0))(
  ( (tuple2!22055 (_1!11038 (_ BitVec 64)) (_2!11038 V!50697)) )
))
(declare-datatypes ((List!29224 0))(
  ( (Nil!29221) (Cons!29220 (h!30429 tuple2!22054) (t!42788 List!29224)) )
))
(declare-datatypes ((ListLongMap!19711 0))(
  ( (ListLongMap!19712 (toList!9871 List!29224)) )
))
(declare-fun contains!7989 (ListLongMap!19711 (_ BitVec 64)) Bool)

(assert (=> b!1289273 (not (contains!7989 (ListLongMap!19712 Nil!29221) k!1205))))

(declare-datatypes ((Unit!42660 0))(
  ( (Unit!42661) )
))
(declare-fun lt!578204 () Unit!42660)

(declare-fun emptyContainsNothing!58 ((_ BitVec 64)) Unit!42660)

(assert (=> b!1289273 (= lt!578204 (emptyContainsNothing!58 k!1205))))

(declare-fun b!1289274 () Bool)

(declare-fun res!856395 () Bool)

(assert (=> b!1289274 (=> (not res!856395) (not e!736133))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85432 0))(
  ( (array!85433 (arr!41217 (Array (_ BitVec 32) (_ BitVec 64))) (size!41767 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85432)

(assert (=> b!1289274 (= res!856395 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41767 _keys!1741))))))

(declare-fun mapIsEmpty!52853 () Bool)

(declare-fun mapRes!52853 () Bool)

(assert (=> mapIsEmpty!52853 mapRes!52853))

(declare-fun b!1289276 () Bool)

(declare-fun e!736135 () Bool)

(declare-fun tp_is_empty!34195 () Bool)

(assert (=> b!1289276 (= e!736135 tp_is_empty!34195)))

(declare-fun b!1289277 () Bool)

(declare-fun res!856394 () Bool)

(assert (=> b!1289277 (=> (not res!856394) (not e!736133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289277 (= res!856394 (not (validKeyInArray!0 (select (arr!41217 _keys!1741) from!2144))))))

(declare-fun b!1289278 () Bool)

(declare-fun res!856400 () Bool)

(assert (=> b!1289278 (=> (not res!856400) (not e!736133))))

(declare-fun minValue!1387 () V!50697)

(declare-fun zeroValue!1387 () V!50697)

(declare-datatypes ((ValueCell!16199 0))(
  ( (ValueCellFull!16199 (v!19775 V!50697)) (EmptyCell!16199) )
))
(declare-datatypes ((array!85434 0))(
  ( (array!85435 (arr!41218 (Array (_ BitVec 32) ValueCell!16199)) (size!41768 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85434)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4931 (array!85432 array!85434 (_ BitVec 32) (_ BitVec 32) V!50697 V!50697 (_ BitVec 32) Int) ListLongMap!19711)

(assert (=> b!1289278 (= res!856400 (contains!7989 (getCurrentListMap!4931 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289279 () Bool)

(declare-fun res!856396 () Bool)

(assert (=> b!1289279 (=> (not res!856396) (not e!736133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85432 (_ BitVec 32)) Bool)

(assert (=> b!1289279 (= res!856396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52853 () Bool)

(declare-fun tp!100784 () Bool)

(assert (=> mapNonEmpty!52853 (= mapRes!52853 (and tp!100784 e!736135))))

(declare-fun mapRest!52853 () (Array (_ BitVec 32) ValueCell!16199))

(declare-fun mapValue!52853 () ValueCell!16199)

(declare-fun mapKey!52853 () (_ BitVec 32))

(assert (=> mapNonEmpty!52853 (= (arr!41218 _values!1445) (store mapRest!52853 mapKey!52853 mapValue!52853))))

(declare-fun b!1289280 () Bool)

(declare-fun res!856399 () Bool)

(assert (=> b!1289280 (=> (not res!856399) (not e!736133))))

(assert (=> b!1289280 (= res!856399 (and (= (size!41768 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41767 _keys!1741) (size!41768 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289281 () Bool)

(declare-fun res!856398 () Bool)

(assert (=> b!1289281 (=> (not res!856398) (not e!736133))))

(assert (=> b!1289281 (= res!856398 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41767 _keys!1741))))))

(declare-fun b!1289282 () Bool)

(assert (=> b!1289282 (= e!736131 true)))

(declare-fun lt!578202 () Bool)

(declare-fun lt!578203 () ListLongMap!19711)

(assert (=> b!1289282 (= lt!578202 (contains!7989 lt!578203 k!1205))))

(declare-fun +!4343 (ListLongMap!19711 tuple2!22054) ListLongMap!19711)

(assert (=> b!1289282 (not (contains!7989 (+!4343 lt!578203 (tuple2!22055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578201 () Unit!42660)

(declare-fun addStillNotContains!361 (ListLongMap!19711 (_ BitVec 64) V!50697 (_ BitVec 64)) Unit!42660)

(assert (=> b!1289282 (= lt!578201 (addStillNotContains!361 lt!578203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5974 (array!85432 array!85434 (_ BitVec 32) (_ BitVec 32) V!50697 V!50697 (_ BitVec 32) Int) ListLongMap!19711)

(assert (=> b!1289282 (= lt!578203 (getCurrentListMapNoExtraKeys!5974 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289283 () Bool)

(declare-fun e!736134 () Bool)

(assert (=> b!1289283 (= e!736134 tp_is_empty!34195)))

(declare-fun b!1289284 () Bool)

(declare-fun e!736132 () Bool)

(assert (=> b!1289284 (= e!736132 (and e!736134 mapRes!52853))))

(declare-fun condMapEmpty!52853 () Bool)

(declare-fun mapDefault!52853 () ValueCell!16199)

