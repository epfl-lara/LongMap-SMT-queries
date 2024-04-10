; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109358 () Bool)

(assert start!109358)

(declare-fun b_free!28847 () Bool)

(declare-fun b_next!28847 () Bool)

(assert (=> start!109358 (= b_free!28847 (not b_next!28847))))

(declare-fun tp!101659 () Bool)

(declare-fun b_and!46937 () Bool)

(assert (=> start!109358 (= tp!101659 b_and!46937)))

(declare-fun b!1294404 () Bool)

(declare-fun res!860213 () Bool)

(declare-fun e!738636 () Bool)

(assert (=> b!1294404 (=> (not res!860213) (not e!738636))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85996 0))(
  ( (array!85997 (arr!41499 (Array (_ BitVec 32) (_ BitVec 64))) (size!42049 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85996)

(assert (=> b!1294404 (= res!860213 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42049 _keys!1741))))))

(declare-fun b!1294405 () Bool)

(declare-fun res!860210 () Bool)

(assert (=> b!1294405 (=> (not res!860210) (not e!738636))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51085 0))(
  ( (V!51086 (val!17318 Int)) )
))
(declare-datatypes ((ValueCell!16345 0))(
  ( (ValueCellFull!16345 (v!19921 V!51085)) (EmptyCell!16345) )
))
(declare-datatypes ((array!85998 0))(
  ( (array!85999 (arr!41500 (Array (_ BitVec 32) ValueCell!16345)) (size!42050 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85998)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294405 (= res!860210 (and (= (size!42050 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42049 _keys!1741) (size!42050 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53291 () Bool)

(declare-fun mapRes!53291 () Bool)

(assert (=> mapIsEmpty!53291 mapRes!53291))

(declare-fun b!1294406 () Bool)

(declare-fun e!738634 () Bool)

(declare-fun tp_is_empty!34487 () Bool)

(assert (=> b!1294406 (= e!738634 tp_is_empty!34487)))

(declare-fun res!860214 () Bool)

(assert (=> start!109358 (=> (not res!860214) (not e!738636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109358 (= res!860214 (validMask!0 mask!2175))))

(assert (=> start!109358 e!738636))

(assert (=> start!109358 tp_is_empty!34487))

(assert (=> start!109358 true))

(declare-fun e!738635 () Bool)

(declare-fun array_inv!31429 (array!85998) Bool)

(assert (=> start!109358 (and (array_inv!31429 _values!1445) e!738635)))

(declare-fun array_inv!31430 (array!85996) Bool)

(assert (=> start!109358 (array_inv!31430 _keys!1741)))

(assert (=> start!109358 tp!101659))

(declare-fun b!1294407 () Bool)

(assert (=> b!1294407 (= e!738636 (not true))))

(declare-datatypes ((tuple2!22294 0))(
  ( (tuple2!22295 (_1!11158 (_ BitVec 64)) (_2!11158 V!51085)) )
))
(declare-datatypes ((List!29437 0))(
  ( (Nil!29434) (Cons!29433 (h!30642 tuple2!22294) (t!43001 List!29437)) )
))
(declare-datatypes ((ListLongMap!19951 0))(
  ( (ListLongMap!19952 (toList!9991 List!29437)) )
))
(declare-fun contains!8109 (ListLongMap!19951 (_ BitVec 64)) Bool)

(assert (=> b!1294407 (not (contains!8109 (ListLongMap!19952 Nil!29434) k!1205))))

(declare-datatypes ((Unit!42872 0))(
  ( (Unit!42873) )
))
(declare-fun lt!579713 () Unit!42872)

(declare-fun emptyContainsNothing!157 ((_ BitVec 64)) Unit!42872)

(assert (=> b!1294407 (= lt!579713 (emptyContainsNothing!157 k!1205))))

(declare-fun b!1294408 () Bool)

(declare-fun res!860215 () Bool)

(assert (=> b!1294408 (=> (not res!860215) (not e!738636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294408 (= res!860215 (not (validKeyInArray!0 (select (arr!41499 _keys!1741) from!2144))))))

(declare-fun b!1294409 () Bool)

(declare-fun res!860212 () Bool)

(assert (=> b!1294409 (=> (not res!860212) (not e!738636))))

(assert (=> b!1294409 (= res!860212 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42049 _keys!1741))))))

(declare-fun b!1294410 () Bool)

(declare-fun e!738637 () Bool)

(assert (=> b!1294410 (= e!738637 tp_is_empty!34487)))

(declare-fun b!1294411 () Bool)

(assert (=> b!1294411 (= e!738635 (and e!738634 mapRes!53291))))

(declare-fun condMapEmpty!53291 () Bool)

(declare-fun mapDefault!53291 () ValueCell!16345)

