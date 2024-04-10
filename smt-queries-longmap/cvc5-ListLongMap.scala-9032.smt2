; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108976 () Bool)

(assert start!108976)

(declare-fun b_free!28465 () Bool)

(declare-fun b_next!28465 () Bool)

(assert (=> start!108976 (= b_free!28465 (not b_next!28465))))

(declare-fun tp!100514 () Bool)

(declare-fun b_and!46555 () Bool)

(assert (=> start!108976 (= tp!100514 b_and!46555)))

(declare-fun res!855225 () Bool)

(declare-fun e!735367 () Bool)

(assert (=> start!108976 (=> (not res!855225) (not e!735367))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108976 (= res!855225 (validMask!0 mask!2175))))

(assert (=> start!108976 e!735367))

(declare-fun tp_is_empty!34105 () Bool)

(assert (=> start!108976 tp_is_empty!34105))

(assert (=> start!108976 true))

(declare-datatypes ((V!50577 0))(
  ( (V!50578 (val!17127 Int)) )
))
(declare-datatypes ((ValueCell!16154 0))(
  ( (ValueCellFull!16154 (v!19730 V!50577)) (EmptyCell!16154) )
))
(declare-datatypes ((array!85260 0))(
  ( (array!85261 (arr!41131 (Array (_ BitVec 32) ValueCell!16154)) (size!41681 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85260)

(declare-fun e!735368 () Bool)

(declare-fun array_inv!31191 (array!85260) Bool)

(assert (=> start!108976 (and (array_inv!31191 _values!1445) e!735368)))

(declare-datatypes ((array!85262 0))(
  ( (array!85263 (arr!41132 (Array (_ BitVec 32) (_ BitVec 64))) (size!41682 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85262)

(declare-fun array_inv!31192 (array!85262) Bool)

(assert (=> start!108976 (array_inv!31192 _keys!1741)))

(assert (=> start!108976 tp!100514))

(declare-fun mapNonEmpty!52718 () Bool)

(declare-fun mapRes!52718 () Bool)

(declare-fun tp!100513 () Bool)

(declare-fun e!735365 () Bool)

(assert (=> mapNonEmpty!52718 (= mapRes!52718 (and tp!100513 e!735365))))

(declare-fun mapKey!52718 () (_ BitVec 32))

(declare-fun mapRest!52718 () (Array (_ BitVec 32) ValueCell!16154))

(declare-fun mapValue!52718 () ValueCell!16154)

(assert (=> mapNonEmpty!52718 (= (arr!41131 _values!1445) (store mapRest!52718 mapKey!52718 mapValue!52718))))

(declare-fun b!1287696 () Bool)

(declare-fun res!855222 () Bool)

(assert (=> b!1287696 (=> (not res!855222) (not e!735367))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1287696 (= res!855222 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41682 _keys!1741))))))

(declare-fun b!1287697 () Bool)

(declare-fun res!855228 () Bool)

(assert (=> b!1287697 (=> (not res!855228) (not e!735367))))

(declare-fun minValue!1387 () V!50577)

(declare-fun zeroValue!1387 () V!50577)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21978 0))(
  ( (tuple2!21979 (_1!11000 (_ BitVec 64)) (_2!11000 V!50577)) )
))
(declare-datatypes ((List!29156 0))(
  ( (Nil!29153) (Cons!29152 (h!30361 tuple2!21978) (t!42720 List!29156)) )
))
(declare-datatypes ((ListLongMap!19635 0))(
  ( (ListLongMap!19636 (toList!9833 List!29156)) )
))
(declare-fun contains!7951 (ListLongMap!19635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4904 (array!85262 array!85260 (_ BitVec 32) (_ BitVec 32) V!50577 V!50577 (_ BitVec 32) Int) ListLongMap!19635)

(assert (=> b!1287697 (= res!855228 (contains!7951 (getCurrentListMap!4904 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287698 () Bool)

(declare-fun res!855223 () Bool)

(assert (=> b!1287698 (=> (not res!855223) (not e!735367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287698 (= res!855223 (not (validKeyInArray!0 (select (arr!41132 _keys!1741) from!2144))))))

(declare-fun b!1287699 () Bool)

(declare-fun res!855227 () Bool)

(assert (=> b!1287699 (=> (not res!855227) (not e!735367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85262 (_ BitVec 32)) Bool)

(assert (=> b!1287699 (= res!855227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287700 () Bool)

(declare-fun res!855226 () Bool)

(assert (=> b!1287700 (=> (not res!855226) (not e!735367))))

(declare-datatypes ((List!29157 0))(
  ( (Nil!29154) (Cons!29153 (h!30362 (_ BitVec 64)) (t!42721 List!29157)) )
))
(declare-fun arrayNoDuplicates!0 (array!85262 (_ BitVec 32) List!29157) Bool)

(assert (=> b!1287700 (= res!855226 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29154))))

(declare-fun b!1287701 () Bool)

(declare-fun e!735366 () Bool)

(assert (=> b!1287701 (= e!735366 tp_is_empty!34105)))

(declare-fun b!1287702 () Bool)

(assert (=> b!1287702 (= e!735365 tp_is_empty!34105)))

(declare-fun b!1287703 () Bool)

(assert (=> b!1287703 (= e!735368 (and e!735366 mapRes!52718))))

(declare-fun condMapEmpty!52718 () Bool)

(declare-fun mapDefault!52718 () ValueCell!16154)

