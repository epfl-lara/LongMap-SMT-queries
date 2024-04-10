; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109004 () Bool)

(assert start!109004)

(declare-fun b_free!28493 () Bool)

(declare-fun b_next!28493 () Bool)

(assert (=> start!109004 (= b_free!28493 (not b_next!28493))))

(declare-fun tp!100598 () Bool)

(declare-fun b_and!46583 () Bool)

(assert (=> start!109004 (= tp!100598 b_and!46583)))

(declare-fun b!1288158 () Bool)

(declare-fun e!735575 () Bool)

(declare-fun tp_is_empty!34133 () Bool)

(assert (=> b!1288158 (= e!735575 tp_is_empty!34133)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1288159 () Bool)

(declare-fun e!735577 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85314 0))(
  ( (array!85315 (arr!41158 (Array (_ BitVec 32) (_ BitVec 64))) (size!41708 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85314)

(assert (=> b!1288159 (= e!735577 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle from!2144 (size!41708 _keys!1741)))))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50613 0))(
  ( (V!50614 (val!17141 Int)) )
))
(declare-datatypes ((tuple2!22002 0))(
  ( (tuple2!22003 (_1!11012 (_ BitVec 64)) (_2!11012 V!50613)) )
))
(declare-datatypes ((List!29176 0))(
  ( (Nil!29173) (Cons!29172 (h!30381 tuple2!22002) (t!42740 List!29176)) )
))
(declare-datatypes ((ListLongMap!19659 0))(
  ( (ListLongMap!19660 (toList!9845 List!29176)) )
))
(declare-fun contains!7963 (ListLongMap!19659 (_ BitVec 64)) Bool)

(assert (=> b!1288159 (not (contains!7963 (ListLongMap!19660 Nil!29173) k!1205))))

(declare-datatypes ((Unit!42610 0))(
  ( (Unit!42611) )
))
(declare-fun lt!577931 () Unit!42610)

(declare-fun emptyContainsNothing!34 ((_ BitVec 64)) Unit!42610)

(assert (=> b!1288159 (= lt!577931 (emptyContainsNothing!34 k!1205))))

(declare-fun mapNonEmpty!52760 () Bool)

(declare-fun mapRes!52760 () Bool)

(declare-fun tp!100597 () Bool)

(assert (=> mapNonEmpty!52760 (= mapRes!52760 (and tp!100597 e!735575))))

(declare-datatypes ((ValueCell!16168 0))(
  ( (ValueCellFull!16168 (v!19744 V!50613)) (EmptyCell!16168) )
))
(declare-fun mapRest!52760 () (Array (_ BitVec 32) ValueCell!16168))

(declare-fun mapValue!52760 () ValueCell!16168)

(declare-datatypes ((array!85316 0))(
  ( (array!85317 (arr!41159 (Array (_ BitVec 32) ValueCell!16168)) (size!41709 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85316)

(declare-fun mapKey!52760 () (_ BitVec 32))

(assert (=> mapNonEmpty!52760 (= (arr!41159 _values!1445) (store mapRest!52760 mapKey!52760 mapValue!52760))))

(declare-fun b!1288160 () Bool)

(declare-fun e!735576 () Bool)

(declare-fun e!735574 () Bool)

(assert (=> b!1288160 (= e!735576 (and e!735574 mapRes!52760))))

(declare-fun condMapEmpty!52760 () Bool)

(declare-fun mapDefault!52760 () ValueCell!16168)

