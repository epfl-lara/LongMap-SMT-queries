; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108670 () Bool)

(assert start!108670)

(declare-fun b_free!28183 () Bool)

(declare-fun b_next!28183 () Bool)

(assert (=> start!108670 (= b_free!28183 (not b_next!28183))))

(declare-fun tp!99664 () Bool)

(declare-fun b_and!46249 () Bool)

(assert (=> start!108670 (= tp!99664 b_and!46249)))

(declare-fun b!1282739 () Bool)

(declare-fun res!852029 () Bool)

(declare-fun e!732933 () Bool)

(assert (=> b!1282739 (=> (not res!852029) (not e!732933))))

(declare-datatypes ((array!84714 0))(
  ( (array!84715 (arr!40859 (Array (_ BitVec 32) (_ BitVec 64))) (size!41409 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84714)

(declare-datatypes ((List!28948 0))(
  ( (Nil!28945) (Cons!28944 (h!30153 (_ BitVec 64)) (t!42492 List!28948)) )
))
(declare-fun arrayNoDuplicates!0 (array!84714 (_ BitVec 32) List!28948) Bool)

(assert (=> b!1282739 (= res!852029 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28945))))

(declare-fun b!1282740 () Bool)

(declare-fun res!852026 () Bool)

(assert (=> b!1282740 (=> (not res!852026) (not e!732933))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50201 0))(
  ( (V!50202 (val!16986 Int)) )
))
(declare-datatypes ((ValueCell!16013 0))(
  ( (ValueCellFull!16013 (v!19588 V!50201)) (EmptyCell!16013) )
))
(declare-datatypes ((array!84716 0))(
  ( (array!84717 (arr!40860 (Array (_ BitVec 32) ValueCell!16013)) (size!41410 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84716)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282740 (= res!852026 (and (= (size!41410 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41409 _keys!1741) (size!41410 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282741 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282741 (= e!732933 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt from!2144 (size!41409 _keys!1741))))))

(declare-fun b!1282742 () Bool)

(declare-fun e!732934 () Bool)

(declare-fun tp_is_empty!33823 () Bool)

(assert (=> b!1282742 (= e!732934 tp_is_empty!33823)))

(declare-fun res!852023 () Bool)

(assert (=> start!108670 (=> (not res!852023) (not e!732933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108670 (= res!852023 (validMask!0 mask!2175))))

(assert (=> start!108670 e!732933))

(assert (=> start!108670 tp_is_empty!33823))

(assert (=> start!108670 true))

(declare-fun e!732935 () Bool)

(declare-fun array_inv!30997 (array!84716) Bool)

(assert (=> start!108670 (and (array_inv!30997 _values!1445) e!732935)))

(declare-fun array_inv!30998 (array!84714) Bool)

(assert (=> start!108670 (array_inv!30998 _keys!1741)))

(assert (=> start!108670 tp!99664))

(declare-fun mapNonEmpty!52292 () Bool)

(declare-fun mapRes!52292 () Bool)

(declare-fun tp!99665 () Bool)

(declare-fun e!732931 () Bool)

(assert (=> mapNonEmpty!52292 (= mapRes!52292 (and tp!99665 e!732931))))

(declare-fun mapValue!52292 () ValueCell!16013)

(declare-fun mapRest!52292 () (Array (_ BitVec 32) ValueCell!16013))

(declare-fun mapKey!52292 () (_ BitVec 32))

(assert (=> mapNonEmpty!52292 (= (arr!40860 _values!1445) (store mapRest!52292 mapKey!52292 mapValue!52292))))

(declare-fun b!1282743 () Bool)

(assert (=> b!1282743 (= e!732931 tp_is_empty!33823)))

(declare-fun b!1282744 () Bool)

(declare-fun res!852024 () Bool)

(assert (=> b!1282744 (=> (not res!852024) (not e!732933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282744 (= res!852024 (validKeyInArray!0 (select (arr!40859 _keys!1741) from!2144)))))

(declare-fun b!1282745 () Bool)

(declare-fun res!852027 () Bool)

(assert (=> b!1282745 (=> (not res!852027) (not e!732933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84714 (_ BitVec 32)) Bool)

(assert (=> b!1282745 (= res!852027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282746 () Bool)

(declare-fun res!852025 () Bool)

(assert (=> b!1282746 (=> (not res!852025) (not e!732933))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1282746 (= res!852025 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41409 _keys!1741))))))

(declare-fun b!1282747 () Bool)

(declare-fun res!852028 () Bool)

(assert (=> b!1282747 (=> (not res!852028) (not e!732933))))

(assert (=> b!1282747 (= res!852028 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41409 _keys!1741))))))

(declare-fun b!1282748 () Bool)

(declare-fun res!852030 () Bool)

(assert (=> b!1282748 (=> (not res!852030) (not e!732933))))

(declare-fun minValue!1387 () V!50201)

(declare-fun zeroValue!1387 () V!50201)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21752 0))(
  ( (tuple2!21753 (_1!10887 (_ BitVec 64)) (_2!10887 V!50201)) )
))
(declare-datatypes ((List!28949 0))(
  ( (Nil!28946) (Cons!28945 (h!30154 tuple2!21752) (t!42493 List!28949)) )
))
(declare-datatypes ((ListLongMap!19409 0))(
  ( (ListLongMap!19410 (toList!9720 List!28949)) )
))
(declare-fun contains!7837 (ListLongMap!19409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4804 (array!84714 array!84716 (_ BitVec 32) (_ BitVec 32) V!50201 V!50201 (_ BitVec 32) Int) ListLongMap!19409)

(assert (=> b!1282748 (= res!852030 (contains!7837 (getCurrentListMap!4804 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52292 () Bool)

(assert (=> mapIsEmpty!52292 mapRes!52292))

(declare-fun b!1282749 () Bool)

(assert (=> b!1282749 (= e!732935 (and e!732934 mapRes!52292))))

(declare-fun condMapEmpty!52292 () Bool)

(declare-fun mapDefault!52292 () ValueCell!16013)

