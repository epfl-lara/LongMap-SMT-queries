; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108776 () Bool)

(assert start!108776)

(declare-fun b_free!28289 () Bool)

(declare-fun b_next!28289 () Bool)

(assert (=> start!108776 (= b_free!28289 (not b_next!28289))))

(declare-fun tp!99982 () Bool)

(declare-fun b_and!46355 () Bool)

(assert (=> start!108776 (= tp!99982 b_and!46355)))

(declare-fun b!1284500 () Bool)

(declare-fun res!853308 () Bool)

(declare-fun e!733729 () Bool)

(assert (=> b!1284500 (=> (not res!853308) (not e!733729))))

(declare-datatypes ((array!84916 0))(
  ( (array!84917 (arr!40960 (Array (_ BitVec 32) (_ BitVec 64))) (size!41510 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84916)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84916 (_ BitVec 32)) Bool)

(assert (=> b!1284500 (= res!853308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284501 () Bool)

(assert (=> b!1284501 (= e!733729 false)))

(declare-datatypes ((V!50341 0))(
  ( (V!50342 (val!17039 Int)) )
))
(declare-fun minValue!1387 () V!50341)

(declare-fun zeroValue!1387 () V!50341)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16066 0))(
  ( (ValueCellFull!16066 (v!19641 V!50341)) (EmptyCell!16066) )
))
(declare-datatypes ((array!84918 0))(
  ( (array!84919 (arr!40961 (Array (_ BitVec 32) ValueCell!16066)) (size!41511 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84918)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576820 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21832 0))(
  ( (tuple2!21833 (_1!10927 (_ BitVec 64)) (_2!10927 V!50341)) )
))
(declare-datatypes ((List!29025 0))(
  ( (Nil!29022) (Cons!29021 (h!30230 tuple2!21832) (t!42569 List!29025)) )
))
(declare-datatypes ((ListLongMap!19489 0))(
  ( (ListLongMap!19490 (toList!9760 List!29025)) )
))
(declare-fun contains!7877 (ListLongMap!19489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4839 (array!84916 array!84918 (_ BitVec 32) (_ BitVec 32) V!50341 V!50341 (_ BitVec 32) Int) ListLongMap!19489)

(assert (=> b!1284501 (= lt!576820 (contains!7877 (getCurrentListMap!4839 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284502 () Bool)

(declare-fun e!733727 () Bool)

(declare-fun tp_is_empty!33929 () Bool)

(assert (=> b!1284502 (= e!733727 tp_is_empty!33929)))

(declare-fun mapIsEmpty!52451 () Bool)

(declare-fun mapRes!52451 () Bool)

(assert (=> mapIsEmpty!52451 mapRes!52451))

(declare-fun b!1284503 () Bool)

(declare-fun res!853309 () Bool)

(assert (=> b!1284503 (=> (not res!853309) (not e!733729))))

(declare-datatypes ((List!29026 0))(
  ( (Nil!29023) (Cons!29022 (h!30231 (_ BitVec 64)) (t!42570 List!29026)) )
))
(declare-fun arrayNoDuplicates!0 (array!84916 (_ BitVec 32) List!29026) Bool)

(assert (=> b!1284503 (= res!853309 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29023))))

(declare-fun res!853311 () Bool)

(assert (=> start!108776 (=> (not res!853311) (not e!733729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108776 (= res!853311 (validMask!0 mask!2175))))

(assert (=> start!108776 e!733729))

(assert (=> start!108776 tp_is_empty!33929))

(assert (=> start!108776 true))

(declare-fun e!733730 () Bool)

(declare-fun array_inv!31067 (array!84918) Bool)

(assert (=> start!108776 (and (array_inv!31067 _values!1445) e!733730)))

(declare-fun array_inv!31068 (array!84916) Bool)

(assert (=> start!108776 (array_inv!31068 _keys!1741)))

(assert (=> start!108776 tp!99982))

(declare-fun b!1284504 () Bool)

(declare-fun res!853310 () Bool)

(assert (=> b!1284504 (=> (not res!853310) (not e!733729))))

(assert (=> b!1284504 (= res!853310 (and (= (size!41511 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41510 _keys!1741) (size!41511 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284505 () Bool)

(declare-fun res!853307 () Bool)

(assert (=> b!1284505 (=> (not res!853307) (not e!733729))))

(assert (=> b!1284505 (= res!853307 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41510 _keys!1741))))))

(declare-fun mapNonEmpty!52451 () Bool)

(declare-fun tp!99983 () Bool)

(assert (=> mapNonEmpty!52451 (= mapRes!52451 (and tp!99983 e!733727))))

(declare-fun mapValue!52451 () ValueCell!16066)

(declare-fun mapKey!52451 () (_ BitVec 32))

(declare-fun mapRest!52451 () (Array (_ BitVec 32) ValueCell!16066))

(assert (=> mapNonEmpty!52451 (= (arr!40961 _values!1445) (store mapRest!52451 mapKey!52451 mapValue!52451))))

(declare-fun b!1284506 () Bool)

(declare-fun e!733726 () Bool)

(assert (=> b!1284506 (= e!733730 (and e!733726 mapRes!52451))))

(declare-fun condMapEmpty!52451 () Bool)

(declare-fun mapDefault!52451 () ValueCell!16066)

