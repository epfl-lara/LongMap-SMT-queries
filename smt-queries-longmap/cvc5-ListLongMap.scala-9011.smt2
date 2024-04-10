; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108826 () Bool)

(assert start!108826)

(declare-fun b_free!28339 () Bool)

(declare-fun b_next!28339 () Bool)

(assert (=> start!108826 (= b_free!28339 (not b_next!28339))))

(declare-fun tp!100133 () Bool)

(declare-fun b_and!46405 () Bool)

(assert (=> start!108826 (= tp!100133 b_and!46405)))

(declare-fun b!1285199 () Bool)

(declare-fun e!734101 () Bool)

(declare-fun tp_is_empty!33979 () Bool)

(assert (=> b!1285199 (= e!734101 tp_is_empty!33979)))

(declare-fun res!853784 () Bool)

(declare-fun e!734102 () Bool)

(assert (=> start!108826 (=> (not res!853784) (not e!734102))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108826 (= res!853784 (validMask!0 mask!2175))))

(assert (=> start!108826 e!734102))

(assert (=> start!108826 tp_is_empty!33979))

(assert (=> start!108826 true))

(declare-datatypes ((V!50409 0))(
  ( (V!50410 (val!17064 Int)) )
))
(declare-datatypes ((ValueCell!16091 0))(
  ( (ValueCellFull!16091 (v!19666 V!50409)) (EmptyCell!16091) )
))
(declare-datatypes ((array!85016 0))(
  ( (array!85017 (arr!41010 (Array (_ BitVec 32) ValueCell!16091)) (size!41560 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85016)

(declare-fun e!734105 () Bool)

(declare-fun array_inv!31105 (array!85016) Bool)

(assert (=> start!108826 (and (array_inv!31105 _values!1445) e!734105)))

(declare-datatypes ((array!85018 0))(
  ( (array!85019 (arr!41011 (Array (_ BitVec 32) (_ BitVec 64))) (size!41561 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85018)

(declare-fun array_inv!31106 (array!85018) Bool)

(assert (=> start!108826 (array_inv!31106 _keys!1741)))

(assert (=> start!108826 tp!100133))

(declare-fun b!1285200 () Bool)

(declare-fun res!853782 () Bool)

(assert (=> b!1285200 (=> (not res!853782) (not e!734102))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285200 (= res!853782 (and (= (size!41560 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41561 _keys!1741) (size!41560 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285201 () Bool)

(assert (=> b!1285201 (= e!734102 false)))

(declare-fun minValue!1387 () V!50409)

(declare-fun zeroValue!1387 () V!50409)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576886 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21870 0))(
  ( (tuple2!21871 (_1!10946 (_ BitVec 64)) (_2!10946 V!50409)) )
))
(declare-datatypes ((List!29063 0))(
  ( (Nil!29060) (Cons!29059 (h!30268 tuple2!21870) (t!42607 List!29063)) )
))
(declare-datatypes ((ListLongMap!19527 0))(
  ( (ListLongMap!19528 (toList!9779 List!29063)) )
))
(declare-fun contains!7896 (ListLongMap!19527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4857 (array!85018 array!85016 (_ BitVec 32) (_ BitVec 32) V!50409 V!50409 (_ BitVec 32) Int) ListLongMap!19527)

(assert (=> b!1285201 (= lt!576886 (contains!7896 (getCurrentListMap!4857 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52526 () Bool)

(declare-fun mapRes!52526 () Bool)

(declare-fun tp!100132 () Bool)

(declare-fun e!734103 () Bool)

(assert (=> mapNonEmpty!52526 (= mapRes!52526 (and tp!100132 e!734103))))

(declare-fun mapValue!52526 () ValueCell!16091)

(declare-fun mapKey!52526 () (_ BitVec 32))

(declare-fun mapRest!52526 () (Array (_ BitVec 32) ValueCell!16091))

(assert (=> mapNonEmpty!52526 (= (arr!41010 _values!1445) (store mapRest!52526 mapKey!52526 mapValue!52526))))

(declare-fun b!1285202 () Bool)

(assert (=> b!1285202 (= e!734103 tp_is_empty!33979)))

(declare-fun b!1285203 () Bool)

(assert (=> b!1285203 (= e!734105 (and e!734101 mapRes!52526))))

(declare-fun condMapEmpty!52526 () Bool)

(declare-fun mapDefault!52526 () ValueCell!16091)

