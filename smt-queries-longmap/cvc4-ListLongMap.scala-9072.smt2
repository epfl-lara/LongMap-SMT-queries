; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109220 () Bool)

(assert start!109220)

(declare-fun b_free!28709 () Bool)

(declare-fun b_next!28709 () Bool)

(assert (=> start!109220 (= b_free!28709 (not b_next!28709))))

(declare-fun tp!101246 () Bool)

(declare-fun b_and!46799 () Bool)

(assert (=> start!109220 (= tp!101246 b_and!46799)))

(declare-fun b!1292019 () Bool)

(declare-fun res!858448 () Bool)

(declare-fun e!737495 () Bool)

(assert (=> b!1292019 (=> (not res!858448) (not e!737495))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85732 0))(
  ( (array!85733 (arr!41367 (Array (_ BitVec 32) (_ BitVec 64))) (size!41917 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85732)

(assert (=> b!1292019 (= res!858448 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41917 _keys!1741))))))

(declare-fun b!1292020 () Bool)

(declare-fun res!858453 () Bool)

(assert (=> b!1292020 (=> (not res!858453) (not e!737495))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85732 (_ BitVec 32)) Bool)

(assert (=> b!1292020 (= res!858453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292021 () Bool)

(declare-fun e!737491 () Bool)

(declare-fun tp_is_empty!34349 () Bool)

(assert (=> b!1292021 (= e!737491 tp_is_empty!34349)))

(declare-fun b!1292022 () Bool)

(declare-fun res!858450 () Bool)

(assert (=> b!1292022 (=> (not res!858450) (not e!737495))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((V!50901 0))(
  ( (V!50902 (val!17249 Int)) )
))
(declare-datatypes ((ValueCell!16276 0))(
  ( (ValueCellFull!16276 (v!19852 V!50901)) (EmptyCell!16276) )
))
(declare-datatypes ((array!85734 0))(
  ( (array!85735 (arr!41368 (Array (_ BitVec 32) ValueCell!16276)) (size!41918 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85734)

(assert (=> b!1292022 (= res!858450 (and (= (size!41918 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41917 _keys!1741) (size!41918 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292023 () Bool)

(declare-fun res!858446 () Bool)

(assert (=> b!1292023 (=> (not res!858446) (not e!737495))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1292023 (= res!858446 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41917 _keys!1741))))))

(declare-fun res!858449 () Bool)

(assert (=> start!109220 (=> (not res!858449) (not e!737495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109220 (= res!858449 (validMask!0 mask!2175))))

(assert (=> start!109220 e!737495))

(assert (=> start!109220 tp_is_empty!34349))

(assert (=> start!109220 true))

(declare-fun e!737493 () Bool)

(declare-fun array_inv!31345 (array!85734) Bool)

(assert (=> start!109220 (and (array_inv!31345 _values!1445) e!737493)))

(declare-fun array_inv!31346 (array!85732) Bool)

(assert (=> start!109220 (array_inv!31346 _keys!1741)))

(assert (=> start!109220 tp!101246))

(declare-fun b!1292024 () Bool)

(declare-fun res!858451 () Bool)

(assert (=> b!1292024 (=> (not res!858451) (not e!737495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292024 (= res!858451 (not (validKeyInArray!0 (select (arr!41367 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53084 () Bool)

(declare-fun mapRes!53084 () Bool)

(declare-fun tp!101245 () Bool)

(declare-fun e!737492 () Bool)

(assert (=> mapNonEmpty!53084 (= mapRes!53084 (and tp!101245 e!737492))))

(declare-fun mapRest!53084 () (Array (_ BitVec 32) ValueCell!16276))

(declare-fun mapValue!53084 () ValueCell!16276)

(declare-fun mapKey!53084 () (_ BitVec 32))

(assert (=> mapNonEmpty!53084 (= (arr!41368 _values!1445) (store mapRest!53084 mapKey!53084 mapValue!53084))))

(declare-fun b!1292025 () Bool)

(assert (=> b!1292025 (= e!737495 (not true))))

(declare-datatypes ((tuple2!22188 0))(
  ( (tuple2!22189 (_1!11105 (_ BitVec 64)) (_2!11105 V!50901)) )
))
(declare-datatypes ((List!29341 0))(
  ( (Nil!29338) (Cons!29337 (h!30546 tuple2!22188) (t!42905 List!29341)) )
))
(declare-datatypes ((ListLongMap!19845 0))(
  ( (ListLongMap!19846 (toList!9938 List!29341)) )
))
(declare-fun contains!8056 (ListLongMap!19845 (_ BitVec 64)) Bool)

(assert (=> b!1292025 (not (contains!8056 (ListLongMap!19846 Nil!29338) k!1205))))

(declare-datatypes ((Unit!42786 0))(
  ( (Unit!42787) )
))
(declare-fun lt!579299 () Unit!42786)

(declare-fun emptyContainsNothing!115 ((_ BitVec 64)) Unit!42786)

(assert (=> b!1292025 (= lt!579299 (emptyContainsNothing!115 k!1205))))

(declare-fun b!1292026 () Bool)

(assert (=> b!1292026 (= e!737493 (and e!737491 mapRes!53084))))

(declare-fun condMapEmpty!53084 () Bool)

(declare-fun mapDefault!53084 () ValueCell!16276)

