; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109354 () Bool)

(assert start!109354)

(declare-fun b_free!28843 () Bool)

(declare-fun b_next!28843 () Bool)

(assert (=> start!109354 (= b_free!28843 (not b_next!28843))))

(declare-fun tp!101648 () Bool)

(declare-fun b_and!46933 () Bool)

(assert (=> start!109354 (= tp!101648 b_and!46933)))

(declare-fun mapNonEmpty!53285 () Bool)

(declare-fun mapRes!53285 () Bool)

(declare-fun tp!101647 () Bool)

(declare-fun e!738608 () Bool)

(assert (=> mapNonEmpty!53285 (= mapRes!53285 (and tp!101647 e!738608))))

(declare-datatypes ((V!51081 0))(
  ( (V!51082 (val!17316 Int)) )
))
(declare-datatypes ((ValueCell!16343 0))(
  ( (ValueCellFull!16343 (v!19919 V!51081)) (EmptyCell!16343) )
))
(declare-fun mapValue!53285 () ValueCell!16343)

(declare-datatypes ((array!85988 0))(
  ( (array!85989 (arr!41495 (Array (_ BitVec 32) ValueCell!16343)) (size!42045 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85988)

(declare-fun mapKey!53285 () (_ BitVec 32))

(declare-fun mapRest!53285 () (Array (_ BitVec 32) ValueCell!16343))

(assert (=> mapNonEmpty!53285 (= (arr!41495 _values!1445) (store mapRest!53285 mapKey!53285 mapValue!53285))))

(declare-fun mapIsEmpty!53285 () Bool)

(assert (=> mapIsEmpty!53285 mapRes!53285))

(declare-fun b!1294338 () Bool)

(declare-fun res!860164 () Bool)

(declare-fun e!738604 () Bool)

(assert (=> b!1294338 (=> (not res!860164) (not e!738604))))

(declare-datatypes ((array!85990 0))(
  ( (array!85991 (arr!41496 (Array (_ BitVec 32) (_ BitVec 64))) (size!42046 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85990)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294338 (= res!860164 (not (validKeyInArray!0 (select (arr!41496 _keys!1741) from!2144))))))

(declare-fun b!1294339 () Bool)

(declare-fun tp_is_empty!34483 () Bool)

(assert (=> b!1294339 (= e!738608 tp_is_empty!34483)))

(declare-fun b!1294340 () Bool)

(assert (=> b!1294340 (= e!738604 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22290 0))(
  ( (tuple2!22291 (_1!11156 (_ BitVec 64)) (_2!11156 V!51081)) )
))
(declare-datatypes ((List!29434 0))(
  ( (Nil!29431) (Cons!29430 (h!30639 tuple2!22290) (t!42998 List!29434)) )
))
(declare-datatypes ((ListLongMap!19947 0))(
  ( (ListLongMap!19948 (toList!9989 List!29434)) )
))
(declare-fun contains!8107 (ListLongMap!19947 (_ BitVec 64)) Bool)

(assert (=> b!1294340 (not (contains!8107 (ListLongMap!19948 Nil!29431) k!1205))))

(declare-datatypes ((Unit!42868 0))(
  ( (Unit!42869) )
))
(declare-fun lt!579707 () Unit!42868)

(declare-fun emptyContainsNothing!155 ((_ BitVec 64)) Unit!42868)

(assert (=> b!1294340 (= lt!579707 (emptyContainsNothing!155 k!1205))))

(declare-fun b!1294341 () Bool)

(declare-fun e!738607 () Bool)

(declare-fun e!738605 () Bool)

(assert (=> b!1294341 (= e!738607 (and e!738605 mapRes!53285))))

(declare-fun condMapEmpty!53285 () Bool)

(declare-fun mapDefault!53285 () ValueCell!16343)

