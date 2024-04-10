; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108710 () Bool)

(assert start!108710)

(declare-fun b_free!28223 () Bool)

(declare-fun b_next!28223 () Bool)

(assert (=> start!108710 (= b_free!28223 (not b_next!28223))))

(declare-fun tp!99785 () Bool)

(declare-fun b_and!46289 () Bool)

(assert (=> start!108710 (= tp!99785 b_and!46289)))

(declare-fun b!1283452 () Bool)

(declare-fun e!733235 () Bool)

(declare-fun tp_is_empty!33863 () Bool)

(assert (=> b!1283452 (= e!733235 tp_is_empty!33863)))

(declare-fun b!1283453 () Bool)

(declare-fun res!852562 () Bool)

(declare-fun e!733233 () Bool)

(assert (=> b!1283453 (=> (not res!852562) (not e!733233))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84788 0))(
  ( (array!84789 (arr!40896 (Array (_ BitVec 32) (_ BitVec 64))) (size!41446 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84788)

(assert (=> b!1283453 (= res!852562 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41446 _keys!1741))))))

(declare-fun b!1283454 () Bool)

(declare-fun res!852561 () Bool)

(assert (=> b!1283454 (=> (not res!852561) (not e!733233))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84788 (_ BitVec 32)) Bool)

(assert (=> b!1283454 (= res!852561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283455 () Bool)

(assert (=> b!1283455 (= e!733233 (not true))))

(declare-datatypes ((V!50253 0))(
  ( (V!50254 (val!17006 Int)) )
))
(declare-datatypes ((tuple2!21778 0))(
  ( (tuple2!21779 (_1!10900 (_ BitVec 64)) (_2!10900 V!50253)) )
))
(declare-datatypes ((List!28976 0))(
  ( (Nil!28973) (Cons!28972 (h!30181 tuple2!21778) (t!42520 List!28976)) )
))
(declare-datatypes ((ListLongMap!19435 0))(
  ( (ListLongMap!19436 (toList!9733 List!28976)) )
))
(declare-fun lt!576657 () ListLongMap!19435)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7850 (ListLongMap!19435 (_ BitVec 64)) Bool)

(assert (=> b!1283455 (contains!7850 lt!576657 k!1205)))

(declare-fun minValue!1387 () V!50253)

(declare-datatypes ((Unit!42475 0))(
  ( (Unit!42476) )
))
(declare-fun lt!576658 () Unit!42475)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!8 ((_ BitVec 64) (_ BitVec 64) V!50253 ListLongMap!19435) Unit!42475)

(assert (=> b!1283455 (= lt!576658 (lemmaInListMapAfterAddingDiffThenInBefore!8 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576657))))

(declare-fun zeroValue!1387 () V!50253)

(declare-datatypes ((ValueCell!16033 0))(
  ( (ValueCellFull!16033 (v!19608 V!50253)) (EmptyCell!16033) )
))
(declare-datatypes ((array!84790 0))(
  ( (array!84791 (arr!40897 (Array (_ BitVec 32) ValueCell!16033)) (size!41447 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84790)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4284 (ListLongMap!19435 tuple2!21778) ListLongMap!19435)

(declare-fun getCurrentListMapNoExtraKeys!5914 (array!84788 array!84790 (_ BitVec 32) (_ BitVec 32) V!50253 V!50253 (_ BitVec 32) Int) ListLongMap!19435)

(assert (=> b!1283455 (= lt!576657 (+!4284 (getCurrentListMapNoExtraKeys!5914 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283456 () Bool)

(declare-fun res!852563 () Bool)

(assert (=> b!1283456 (=> (not res!852563) (not e!733233))))

(declare-fun getCurrentListMap!4816 (array!84788 array!84790 (_ BitVec 32) (_ BitVec 32) V!50253 V!50253 (_ BitVec 32) Int) ListLongMap!19435)

(assert (=> b!1283456 (= res!852563 (contains!7850 (getCurrentListMap!4816 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1283457 () Bool)

(declare-fun e!733231 () Bool)

(declare-fun e!733234 () Bool)

(declare-fun mapRes!52352 () Bool)

(assert (=> b!1283457 (= e!733231 (and e!733234 mapRes!52352))))

(declare-fun condMapEmpty!52352 () Bool)

(declare-fun mapDefault!52352 () ValueCell!16033)

