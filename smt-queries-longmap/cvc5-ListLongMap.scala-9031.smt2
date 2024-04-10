; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108970 () Bool)

(assert start!108970)

(declare-fun b_free!28459 () Bool)

(declare-fun b_next!28459 () Bool)

(assert (=> start!108970 (= b_free!28459 (not b_next!28459))))

(declare-fun tp!100496 () Bool)

(declare-fun b_and!46549 () Bool)

(assert (=> start!108970 (= tp!100496 b_and!46549)))

(declare-fun mapNonEmpty!52709 () Bool)

(declare-fun mapRes!52709 () Bool)

(declare-fun tp!100495 () Bool)

(declare-fun e!735323 () Bool)

(assert (=> mapNonEmpty!52709 (= mapRes!52709 (and tp!100495 e!735323))))

(declare-datatypes ((V!50569 0))(
  ( (V!50570 (val!17124 Int)) )
))
(declare-datatypes ((ValueCell!16151 0))(
  ( (ValueCellFull!16151 (v!19727 V!50569)) (EmptyCell!16151) )
))
(declare-fun mapRest!52709 () (Array (_ BitVec 32) ValueCell!16151))

(declare-datatypes ((array!85248 0))(
  ( (array!85249 (arr!41125 (Array (_ BitVec 32) ValueCell!16151)) (size!41675 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85248)

(declare-fun mapKey!52709 () (_ BitVec 32))

(declare-fun mapValue!52709 () ValueCell!16151)

(assert (=> mapNonEmpty!52709 (= (arr!41125 _values!1445) (store mapRest!52709 mapKey!52709 mapValue!52709))))

(declare-fun b!1287597 () Bool)

(declare-fun e!735321 () Bool)

(assert (=> b!1287597 (= e!735321 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21972 0))(
  ( (tuple2!21973 (_1!10997 (_ BitVec 64)) (_2!10997 V!50569)) )
))
(declare-datatypes ((List!29151 0))(
  ( (Nil!29148) (Cons!29147 (h!30356 tuple2!21972) (t!42715 List!29151)) )
))
(declare-datatypes ((ListLongMap!19629 0))(
  ( (ListLongMap!19630 (toList!9830 List!29151)) )
))
(declare-fun contains!7948 (ListLongMap!19629 (_ BitVec 64)) Bool)

(assert (=> b!1287597 (not (contains!7948 (ListLongMap!19630 Nil!29148) k!1205))))

(declare-datatypes ((Unit!42582 0))(
  ( (Unit!42583) )
))
(declare-fun lt!577880 () Unit!42582)

(declare-fun emptyContainsNothing!20 ((_ BitVec 64)) Unit!42582)

(assert (=> b!1287597 (= lt!577880 (emptyContainsNothing!20 k!1205))))

(declare-fun res!855154 () Bool)

(assert (=> start!108970 (=> (not res!855154) (not e!735321))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108970 (= res!855154 (validMask!0 mask!2175))))

(assert (=> start!108970 e!735321))

(declare-fun tp_is_empty!34099 () Bool)

(assert (=> start!108970 tp_is_empty!34099))

(assert (=> start!108970 true))

(declare-fun e!735320 () Bool)

(declare-fun array_inv!31187 (array!85248) Bool)

(assert (=> start!108970 (and (array_inv!31187 _values!1445) e!735320)))

(declare-datatypes ((array!85250 0))(
  ( (array!85251 (arr!41126 (Array (_ BitVec 32) (_ BitVec 64))) (size!41676 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85250)

(declare-fun array_inv!31188 (array!85250) Bool)

(assert (=> start!108970 (array_inv!31188 _keys!1741)))

(assert (=> start!108970 tp!100496))

(declare-fun b!1287598 () Bool)

(declare-fun e!735319 () Bool)

(assert (=> b!1287598 (= e!735320 (and e!735319 mapRes!52709))))

(declare-fun condMapEmpty!52709 () Bool)

(declare-fun mapDefault!52709 () ValueCell!16151)

