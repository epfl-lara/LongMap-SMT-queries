; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109036 () Bool)

(assert start!109036)

(declare-fun b_free!28525 () Bool)

(declare-fun b_next!28525 () Bool)

(assert (=> start!109036 (= b_free!28525 (not b_next!28525))))

(declare-fun tp!100694 () Bool)

(declare-fun b_and!46615 () Bool)

(assert (=> start!109036 (= tp!100694 b_and!46615)))

(declare-fun b!1288733 () Bool)

(declare-fun res!855996 () Bool)

(declare-fun e!735866 () Bool)

(assert (=> b!1288733 (=> (not res!855996) (not e!735866))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50657 0))(
  ( (V!50658 (val!17157 Int)) )
))
(declare-datatypes ((ValueCell!16184 0))(
  ( (ValueCellFull!16184 (v!19760 V!50657)) (EmptyCell!16184) )
))
(declare-datatypes ((array!85374 0))(
  ( (array!85375 (arr!41188 (Array (_ BitVec 32) ValueCell!16184)) (size!41738 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85374)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85376 0))(
  ( (array!85377 (arr!41189 (Array (_ BitVec 32) (_ BitVec 64))) (size!41739 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85376)

(assert (=> b!1288733 (= res!855996 (and (= (size!41738 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41739 _keys!1741) (size!41738 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288734 () Bool)

(declare-fun res!855988 () Bool)

(assert (=> b!1288734 (=> (not res!855988) (not e!735866))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1288734 (= res!855988 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41739 _keys!1741))))))

(declare-fun mapNonEmpty!52808 () Bool)

(declare-fun mapRes!52808 () Bool)

(declare-fun tp!100693 () Bool)

(declare-fun e!735862 () Bool)

(assert (=> mapNonEmpty!52808 (= mapRes!52808 (and tp!100693 e!735862))))

(declare-fun mapRest!52808 () (Array (_ BitVec 32) ValueCell!16184))

(declare-fun mapKey!52808 () (_ BitVec 32))

(declare-fun mapValue!52808 () ValueCell!16184)

(assert (=> mapNonEmpty!52808 (= (arr!41188 _values!1445) (store mapRest!52808 mapKey!52808 mapValue!52808))))

(declare-fun b!1288735 () Bool)

(declare-fun res!855993 () Bool)

(assert (=> b!1288735 (=> (not res!855993) (not e!735866))))

(declare-fun minValue!1387 () V!50657)

(declare-fun zeroValue!1387 () V!50657)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22028 0))(
  ( (tuple2!22029 (_1!11025 (_ BitVec 64)) (_2!11025 V!50657)) )
))
(declare-datatypes ((List!29202 0))(
  ( (Nil!29199) (Cons!29198 (h!30407 tuple2!22028) (t!42766 List!29202)) )
))
(declare-datatypes ((ListLongMap!19685 0))(
  ( (ListLongMap!19686 (toList!9858 List!29202)) )
))
(declare-fun contains!7976 (ListLongMap!19685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4920 (array!85376 array!85374 (_ BitVec 32) (_ BitVec 32) V!50657 V!50657 (_ BitVec 32) Int) ListLongMap!19685)

(assert (=> b!1288735 (= res!855993 (contains!7976 (getCurrentListMap!4920 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1288736 () Bool)

(declare-fun res!855995 () Bool)

(assert (=> b!1288736 (=> (not res!855995) (not e!735866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288736 (= res!855995 (not (validKeyInArray!0 (select (arr!41189 _keys!1741) from!2144))))))

(declare-fun b!1288738 () Bool)

(declare-fun tp_is_empty!34165 () Bool)

(assert (=> b!1288738 (= e!735862 tp_is_empty!34165)))

(declare-fun b!1288739 () Bool)

(declare-fun e!735865 () Bool)

(assert (=> b!1288739 (= e!735865 tp_is_empty!34165)))

(declare-fun b!1288740 () Bool)

(declare-fun res!855992 () Bool)

(assert (=> b!1288740 (=> (not res!855992) (not e!735866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85376 (_ BitVec 32)) Bool)

(assert (=> b!1288740 (= res!855992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288741 () Bool)

(declare-fun e!735864 () Bool)

(assert (=> b!1288741 (= e!735864 (and e!735865 mapRes!52808))))

(declare-fun condMapEmpty!52808 () Bool)

(declare-fun mapDefault!52808 () ValueCell!16184)

