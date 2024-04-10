; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108562 () Bool)

(assert start!108562)

(declare-fun b_free!28109 () Bool)

(declare-fun b_next!28109 () Bool)

(assert (=> start!108562 (= b_free!28109 (not b_next!28109))))

(declare-fun tp!99437 () Bool)

(declare-fun b_and!46169 () Bool)

(assert (=> start!108562 (= tp!99437 b_and!46169)))

(declare-fun mapIsEmpty!52175 () Bool)

(declare-fun mapRes!52175 () Bool)

(assert (=> mapIsEmpty!52175 mapRes!52175))

(declare-fun b!1281552 () Bool)

(declare-fun res!851321 () Bool)

(declare-fun e!732199 () Bool)

(assert (=> b!1281552 (=> (not res!851321) (not e!732199))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84568 0))(
  ( (array!84569 (arr!40788 (Array (_ BitVec 32) (_ BitVec 64))) (size!41338 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84568)

(assert (=> b!1281552 (= res!851321 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41338 _keys!1741))))))

(declare-fun b!1281553 () Bool)

(declare-fun res!851317 () Bool)

(assert (=> b!1281553 (=> (not res!851317) (not e!732199))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1281553 (= res!851317 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41338 _keys!1741)) (not (= (select (arr!40788 _keys!1741) from!2144) k!1205))))))

(declare-fun res!851319 () Bool)

(assert (=> start!108562 (=> (not res!851319) (not e!732199))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108562 (= res!851319 (validMask!0 mask!2175))))

(assert (=> start!108562 e!732199))

(declare-fun tp_is_empty!33749 () Bool)

(assert (=> start!108562 tp_is_empty!33749))

(assert (=> start!108562 true))

(declare-datatypes ((V!50101 0))(
  ( (V!50102 (val!16949 Int)) )
))
(declare-datatypes ((ValueCell!15976 0))(
  ( (ValueCellFull!15976 (v!19549 V!50101)) (EmptyCell!15976) )
))
(declare-datatypes ((array!84570 0))(
  ( (array!84571 (arr!40789 (Array (_ BitVec 32) ValueCell!15976)) (size!41339 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84570)

(declare-fun e!732202 () Bool)

(declare-fun array_inv!30951 (array!84570) Bool)

(assert (=> start!108562 (and (array_inv!30951 _values!1445) e!732202)))

(declare-fun array_inv!30952 (array!84568) Bool)

(assert (=> start!108562 (array_inv!30952 _keys!1741)))

(assert (=> start!108562 tp!99437))

(declare-fun b!1281554 () Bool)

(declare-fun e!732203 () Bool)

(assert (=> b!1281554 (= e!732199 (not e!732203))))

(declare-fun res!851318 () Bool)

(assert (=> b!1281554 (=> res!851318 e!732203)))

(assert (=> b!1281554 (= res!851318 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!50101)

(declare-fun zeroValue!1387 () V!50101)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21704 0))(
  ( (tuple2!21705 (_1!10863 (_ BitVec 64)) (_2!10863 V!50101)) )
))
(declare-datatypes ((List!28896 0))(
  ( (Nil!28893) (Cons!28892 (h!30101 tuple2!21704) (t!42436 List!28896)) )
))
(declare-datatypes ((ListLongMap!19361 0))(
  ( (ListLongMap!19362 (toList!9696 List!28896)) )
))
(declare-fun contains!7811 (ListLongMap!19361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4780 (array!84568 array!84570 (_ BitVec 32) (_ BitVec 32) V!50101 V!50101 (_ BitVec 32) Int) ListLongMap!19361)

(assert (=> b!1281554 (contains!7811 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42449 0))(
  ( (Unit!42450) )
))
(declare-fun lt!576253 () Unit!42449)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!29 (array!84568 array!84570 (_ BitVec 32) (_ BitVec 32) V!50101 V!50101 (_ BitVec 64) (_ BitVec 32) Int) Unit!42449)

(assert (=> b!1281554 (= lt!576253 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!29 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281555 () Bool)

(declare-fun res!851324 () Bool)

(assert (=> b!1281555 (=> (not res!851324) (not e!732199))))

(assert (=> b!1281555 (= res!851324 (contains!7811 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1281556 () Bool)

(declare-fun res!851323 () Bool)

(assert (=> b!1281556 (=> (not res!851323) (not e!732199))))

(declare-datatypes ((List!28897 0))(
  ( (Nil!28894) (Cons!28893 (h!30102 (_ BitVec 64)) (t!42437 List!28897)) )
))
(declare-fun arrayNoDuplicates!0 (array!84568 (_ BitVec 32) List!28897) Bool)

(assert (=> b!1281556 (= res!851323 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28894))))

(declare-fun b!1281557 () Bool)

(assert (=> b!1281557 (= e!732203 true)))

(declare-fun arrayContainsKey!0 (array!84568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281557 (arrayContainsKey!0 _keys!1741 k!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576254 () Unit!42449)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!636 (array!84568 array!84570 (_ BitVec 32) (_ BitVec 32) V!50101 V!50101 (_ BitVec 64) (_ BitVec 32) Int) Unit!42449)

(assert (=> b!1281557 (= lt!576254 (lemmaListMapContainsThenArrayContainsFrom!636 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun mapNonEmpty!52175 () Bool)

(declare-fun tp!99436 () Bool)

(declare-fun e!732200 () Bool)

(assert (=> mapNonEmpty!52175 (= mapRes!52175 (and tp!99436 e!732200))))

(declare-fun mapValue!52175 () ValueCell!15976)

(declare-fun mapKey!52175 () (_ BitVec 32))

(declare-fun mapRest!52175 () (Array (_ BitVec 32) ValueCell!15976))

(assert (=> mapNonEmpty!52175 (= (arr!40789 _values!1445) (store mapRest!52175 mapKey!52175 mapValue!52175))))

(declare-fun b!1281558 () Bool)

(declare-fun e!732201 () Bool)

(assert (=> b!1281558 (= e!732201 tp_is_empty!33749)))

(declare-fun b!1281559 () Bool)

(assert (=> b!1281559 (= e!732200 tp_is_empty!33749)))

(declare-fun b!1281560 () Bool)

(declare-fun res!851322 () Bool)

(assert (=> b!1281560 (=> (not res!851322) (not e!732199))))

(assert (=> b!1281560 (= res!851322 (and (= (size!41339 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41338 _keys!1741) (size!41339 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281561 () Bool)

(assert (=> b!1281561 (= e!732202 (and e!732201 mapRes!52175))))

(declare-fun condMapEmpty!52175 () Bool)

(declare-fun mapDefault!52175 () ValueCell!15976)

