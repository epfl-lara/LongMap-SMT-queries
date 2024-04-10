; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109064 () Bool)

(assert start!109064)

(declare-fun b_free!28553 () Bool)

(declare-fun b_next!28553 () Bool)

(assert (=> start!109064 (= b_free!28553 (not b_next!28553))))

(declare-fun tp!100777 () Bool)

(declare-fun b_and!46643 () Bool)

(assert (=> start!109064 (= tp!100777 b_and!46643)))

(declare-fun b!1289237 () Bool)

(declare-fun res!856366 () Bool)

(declare-fun e!736118 () Bool)

(assert (=> b!1289237 (=> (not res!856366) (not e!736118))))

(declare-datatypes ((array!85428 0))(
  ( (array!85429 (arr!41215 (Array (_ BitVec 32) (_ BitVec 64))) (size!41765 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85428)

(declare-datatypes ((List!29222 0))(
  ( (Nil!29219) (Cons!29218 (h!30427 (_ BitVec 64)) (t!42786 List!29222)) )
))
(declare-fun arrayNoDuplicates!0 (array!85428 (_ BitVec 32) List!29222) Bool)

(assert (=> b!1289237 (= res!856366 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29219))))

(declare-fun b!1289238 () Bool)

(declare-fun res!856369 () Bool)

(assert (=> b!1289238 (=> (not res!856369) (not e!736118))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85428 (_ BitVec 32)) Bool)

(assert (=> b!1289238 (= res!856369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289239 () Bool)

(declare-fun e!736114 () Bool)

(assert (=> b!1289239 (= e!736118 (not e!736114))))

(declare-fun res!856372 () Bool)

(assert (=> b!1289239 (=> res!856372 e!736114)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289239 (= res!856372 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50693 0))(
  ( (V!50694 (val!17171 Int)) )
))
(declare-datatypes ((tuple2!22052 0))(
  ( (tuple2!22053 (_1!11037 (_ BitVec 64)) (_2!11037 V!50693)) )
))
(declare-datatypes ((List!29223 0))(
  ( (Nil!29220) (Cons!29219 (h!30428 tuple2!22052) (t!42787 List!29223)) )
))
(declare-datatypes ((ListLongMap!19709 0))(
  ( (ListLongMap!19710 (toList!9870 List!29223)) )
))
(declare-fun contains!7988 (ListLongMap!19709 (_ BitVec 64)) Bool)

(assert (=> b!1289239 (not (contains!7988 (ListLongMap!19710 Nil!29220) k!1205))))

(declare-datatypes ((Unit!42658 0))(
  ( (Unit!42659) )
))
(declare-fun lt!578192 () Unit!42658)

(declare-fun emptyContainsNothing!57 ((_ BitVec 64)) Unit!42658)

(assert (=> b!1289239 (= lt!578192 (emptyContainsNothing!57 k!1205))))

(declare-fun b!1289240 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1289240 (= e!736114 (bvsle from!2144 (size!41765 _keys!1741)))))

(declare-fun lt!578190 () ListLongMap!19709)

(declare-fun zeroValue!1387 () V!50693)

(declare-fun +!4342 (ListLongMap!19709 tuple2!22052) ListLongMap!19709)

(assert (=> b!1289240 (not (contains!7988 (+!4342 lt!578190 (tuple2!22053 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578191 () Unit!42658)

(declare-fun addStillNotContains!360 (ListLongMap!19709 (_ BitVec 64) V!50693 (_ BitVec 64)) Unit!42658)

(assert (=> b!1289240 (= lt!578191 (addStillNotContains!360 lt!578190 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50693)

(declare-datatypes ((ValueCell!16198 0))(
  ( (ValueCellFull!16198 (v!19774 V!50693)) (EmptyCell!16198) )
))
(declare-datatypes ((array!85430 0))(
  ( (array!85431 (arr!41216 (Array (_ BitVec 32) ValueCell!16198)) (size!41766 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85430)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5973 (array!85428 array!85430 (_ BitVec 32) (_ BitVec 32) V!50693 V!50693 (_ BitVec 32) Int) ListLongMap!19709)

(assert (=> b!1289240 (= lt!578190 (getCurrentListMapNoExtraKeys!5973 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52850 () Bool)

(declare-fun mapRes!52850 () Bool)

(assert (=> mapIsEmpty!52850 mapRes!52850))

(declare-fun b!1289241 () Bool)

(declare-fun e!736113 () Bool)

(declare-fun e!736115 () Bool)

(assert (=> b!1289241 (= e!736113 (and e!736115 mapRes!52850))))

(declare-fun condMapEmpty!52850 () Bool)

(declare-fun mapDefault!52850 () ValueCell!16198)

