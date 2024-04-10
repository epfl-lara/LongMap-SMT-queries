; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108952 () Bool)

(assert start!108952)

(declare-fun b_free!28441 () Bool)

(declare-fun b_next!28441 () Bool)

(assert (=> start!108952 (= b_free!28441 (not b_next!28441))))

(declare-fun tp!100442 () Bool)

(declare-fun b_and!46531 () Bool)

(assert (=> start!108952 (= tp!100442 b_and!46531)))

(declare-fun b!1287300 () Bool)

(declare-fun res!854933 () Bool)

(declare-fun e!735185 () Bool)

(assert (=> b!1287300 (=> (not res!854933) (not e!735185))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85212 0))(
  ( (array!85213 (arr!41107 (Array (_ BitVec 32) (_ BitVec 64))) (size!41657 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85212)

(assert (=> b!1287300 (= res!854933 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41657 _keys!1741))))))

(declare-fun b!1287301 () Bool)

(declare-fun e!735186 () Bool)

(declare-fun tp_is_empty!34081 () Bool)

(assert (=> b!1287301 (= e!735186 tp_is_empty!34081)))

(declare-fun mapIsEmpty!52682 () Bool)

(declare-fun mapRes!52682 () Bool)

(assert (=> mapIsEmpty!52682 mapRes!52682))

(declare-fun b!1287302 () Bool)

(assert (=> b!1287302 (= e!735185 (not true))))

(declare-datatypes ((V!50545 0))(
  ( (V!50546 (val!17115 Int)) )
))
(declare-datatypes ((tuple2!21954 0))(
  ( (tuple2!21955 (_1!10988 (_ BitVec 64)) (_2!10988 V!50545)) )
))
(declare-datatypes ((List!29136 0))(
  ( (Nil!29133) (Cons!29132 (h!30341 tuple2!21954) (t!42700 List!29136)) )
))
(declare-datatypes ((ListLongMap!19611 0))(
  ( (ListLongMap!19612 (toList!9821 List!29136)) )
))
(declare-fun contains!7939 (ListLongMap!19611 (_ BitVec 64)) Bool)

(assert (=> b!1287302 (not (contains!7939 (ListLongMap!19612 Nil!29133) k!1205))))

(declare-datatypes ((Unit!42570 0))(
  ( (Unit!42571) )
))
(declare-fun lt!577853 () Unit!42570)

(declare-fun emptyContainsNothing!14 ((_ BitVec 64)) Unit!42570)

(assert (=> b!1287302 (= lt!577853 (emptyContainsNothing!14 k!1205))))

(declare-fun b!1287303 () Bool)

(declare-fun res!854937 () Bool)

(assert (=> b!1287303 (=> (not res!854937) (not e!735185))))

(declare-datatypes ((List!29137 0))(
  ( (Nil!29134) (Cons!29133 (h!30342 (_ BitVec 64)) (t!42701 List!29137)) )
))
(declare-fun arrayNoDuplicates!0 (array!85212 (_ BitVec 32) List!29137) Bool)

(assert (=> b!1287303 (= res!854937 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29134))))

(declare-fun b!1287304 () Bool)

(declare-fun res!854935 () Bool)

(assert (=> b!1287304 (=> (not res!854935) (not e!735185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287304 (= res!854935 (not (validKeyInArray!0 (select (arr!41107 _keys!1741) from!2144))))))

(declare-fun b!1287305 () Bool)

(declare-fun res!854936 () Bool)

(assert (=> b!1287305 (=> (not res!854936) (not e!735185))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85212 (_ BitVec 32)) Bool)

(assert (=> b!1287305 (= res!854936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52682 () Bool)

(declare-fun tp!100441 () Bool)

(assert (=> mapNonEmpty!52682 (= mapRes!52682 (and tp!100441 e!735186))))

(declare-datatypes ((ValueCell!16142 0))(
  ( (ValueCellFull!16142 (v!19718 V!50545)) (EmptyCell!16142) )
))
(declare-fun mapValue!52682 () ValueCell!16142)

(declare-datatypes ((array!85214 0))(
  ( (array!85215 (arr!41108 (Array (_ BitVec 32) ValueCell!16142)) (size!41658 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85214)

(declare-fun mapRest!52682 () (Array (_ BitVec 32) ValueCell!16142))

(declare-fun mapKey!52682 () (_ BitVec 32))

(assert (=> mapNonEmpty!52682 (= (arr!41108 _values!1445) (store mapRest!52682 mapKey!52682 mapValue!52682))))

(declare-fun res!854940 () Bool)

(assert (=> start!108952 (=> (not res!854940) (not e!735185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108952 (= res!854940 (validMask!0 mask!2175))))

(assert (=> start!108952 e!735185))

(assert (=> start!108952 tp_is_empty!34081))

(assert (=> start!108952 true))

(declare-fun e!735188 () Bool)

(declare-fun array_inv!31171 (array!85214) Bool)

(assert (=> start!108952 (and (array_inv!31171 _values!1445) e!735188)))

(declare-fun array_inv!31172 (array!85212) Bool)

(assert (=> start!108952 (array_inv!31172 _keys!1741)))

(assert (=> start!108952 tp!100442))

(declare-fun b!1287306 () Bool)

(declare-fun res!854938 () Bool)

(assert (=> b!1287306 (=> (not res!854938) (not e!735185))))

(declare-fun minValue!1387 () V!50545)

(declare-fun zeroValue!1387 () V!50545)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4895 (array!85212 array!85214 (_ BitVec 32) (_ BitVec 32) V!50545 V!50545 (_ BitVec 32) Int) ListLongMap!19611)

(assert (=> b!1287306 (= res!854938 (contains!7939 (getCurrentListMap!4895 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287307 () Bool)

(declare-fun e!735184 () Bool)

(assert (=> b!1287307 (= e!735188 (and e!735184 mapRes!52682))))

(declare-fun condMapEmpty!52682 () Bool)

(declare-fun mapDefault!52682 () ValueCell!16142)

