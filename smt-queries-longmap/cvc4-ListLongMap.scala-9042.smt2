; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109040 () Bool)

(assert start!109040)

(declare-fun b_free!28529 () Bool)

(declare-fun b_next!28529 () Bool)

(assert (=> start!109040 (= b_free!28529 (not b_next!28529))))

(declare-fun tp!100705 () Bool)

(declare-fun b_and!46619 () Bool)

(assert (=> start!109040 (= tp!100705 b_and!46619)))

(declare-fun b!1288805 () Bool)

(declare-fun res!856048 () Bool)

(declare-fun e!735897 () Bool)

(assert (=> b!1288805 (=> (not res!856048) (not e!735897))))

(declare-datatypes ((array!85382 0))(
  ( (array!85383 (arr!41192 (Array (_ BitVec 32) (_ BitVec 64))) (size!41742 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85382)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85382 (_ BitVec 32)) Bool)

(assert (=> b!1288805 (= res!856048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288806 () Bool)

(declare-fun res!856046 () Bool)

(assert (=> b!1288806 (=> (not res!856046) (not e!735897))))

(declare-datatypes ((V!50661 0))(
  ( (V!50662 (val!17159 Int)) )
))
(declare-fun minValue!1387 () V!50661)

(declare-fun zeroValue!1387 () V!50661)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16186 0))(
  ( (ValueCellFull!16186 (v!19762 V!50661)) (EmptyCell!16186) )
))
(declare-datatypes ((array!85384 0))(
  ( (array!85385 (arr!41193 (Array (_ BitVec 32) ValueCell!16186)) (size!41743 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85384)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22032 0))(
  ( (tuple2!22033 (_1!11027 (_ BitVec 64)) (_2!11027 V!50661)) )
))
(declare-datatypes ((List!29205 0))(
  ( (Nil!29202) (Cons!29201 (h!30410 tuple2!22032) (t!42769 List!29205)) )
))
(declare-datatypes ((ListLongMap!19689 0))(
  ( (ListLongMap!19690 (toList!9860 List!29205)) )
))
(declare-fun contains!7978 (ListLongMap!19689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4922 (array!85382 array!85384 (_ BitVec 32) (_ BitVec 32) V!50661 V!50661 (_ BitVec 32) Int) ListLongMap!19689)

(assert (=> b!1288806 (= res!856046 (contains!7978 (getCurrentListMap!4922 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1288807 () Bool)

(declare-fun e!735898 () Bool)

(assert (=> b!1288807 (= e!735897 (not e!735898))))

(declare-fun res!856047 () Bool)

(assert (=> b!1288807 (=> res!856047 e!735898)))

(assert (=> b!1288807 (= res!856047 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288807 (not (contains!7978 (ListLongMap!19690 Nil!29202) k!1205))))

(declare-datatypes ((Unit!42638 0))(
  ( (Unit!42639) )
))
(declare-fun lt!578082 () Unit!42638)

(declare-fun emptyContainsNothing!48 ((_ BitVec 64)) Unit!42638)

(assert (=> b!1288807 (= lt!578082 (emptyContainsNothing!48 k!1205))))

(declare-fun b!1288809 () Bool)

(declare-fun res!856045 () Bool)

(assert (=> b!1288809 (=> (not res!856045) (not e!735897))))

(assert (=> b!1288809 (= res!856045 (and (= (size!41743 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41742 _keys!1741) (size!41743 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52814 () Bool)

(declare-fun mapRes!52814 () Bool)

(declare-fun tp!100706 () Bool)

(declare-fun e!735900 () Bool)

(assert (=> mapNonEmpty!52814 (= mapRes!52814 (and tp!100706 e!735900))))

(declare-fun mapKey!52814 () (_ BitVec 32))

(declare-fun mapRest!52814 () (Array (_ BitVec 32) ValueCell!16186))

(declare-fun mapValue!52814 () ValueCell!16186)

(assert (=> mapNonEmpty!52814 (= (arr!41193 _values!1445) (store mapRest!52814 mapKey!52814 mapValue!52814))))

(declare-fun b!1288810 () Bool)

(declare-fun res!856043 () Bool)

(assert (=> b!1288810 (=> (not res!856043) (not e!735897))))

(assert (=> b!1288810 (= res!856043 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41742 _keys!1741))))))

(declare-fun mapIsEmpty!52814 () Bool)

(assert (=> mapIsEmpty!52814 mapRes!52814))

(declare-fun b!1288811 () Bool)

(declare-fun res!856042 () Bool)

(assert (=> b!1288811 (=> (not res!856042) (not e!735897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288811 (= res!856042 (not (validKeyInArray!0 (select (arr!41192 _keys!1741) from!2144))))))

(declare-fun b!1288812 () Bool)

(declare-fun res!856044 () Bool)

(assert (=> b!1288812 (=> (not res!856044) (not e!735897))))

(assert (=> b!1288812 (= res!856044 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41742 _keys!1741))))))

(declare-fun b!1288813 () Bool)

(assert (=> b!1288813 (= e!735898 true)))

(declare-fun lt!578083 () ListLongMap!19689)

(declare-fun +!4332 (ListLongMap!19689 tuple2!22032) ListLongMap!19689)

(assert (=> b!1288813 (not (contains!7978 (+!4332 lt!578083 (tuple2!22033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578084 () Unit!42638)

(declare-fun addStillNotContains!350 (ListLongMap!19689 (_ BitVec 64) V!50661 (_ BitVec 64)) Unit!42638)

(assert (=> b!1288813 (= lt!578084 (addStillNotContains!350 lt!578083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5963 (array!85382 array!85384 (_ BitVec 32) (_ BitVec 32) V!50661 V!50661 (_ BitVec 32) Int) ListLongMap!19689)

(assert (=> b!1288813 (= lt!578083 (getCurrentListMapNoExtraKeys!5963 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288814 () Bool)

(declare-fun tp_is_empty!34169 () Bool)

(assert (=> b!1288814 (= e!735900 tp_is_empty!34169)))

(declare-fun res!856050 () Bool)

(assert (=> start!109040 (=> (not res!856050) (not e!735897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109040 (= res!856050 (validMask!0 mask!2175))))

(assert (=> start!109040 e!735897))

(assert (=> start!109040 tp_is_empty!34169))

(assert (=> start!109040 true))

(declare-fun e!735899 () Bool)

(declare-fun array_inv!31229 (array!85384) Bool)

(assert (=> start!109040 (and (array_inv!31229 _values!1445) e!735899)))

(declare-fun array_inv!31230 (array!85382) Bool)

(assert (=> start!109040 (array_inv!31230 _keys!1741)))

(assert (=> start!109040 tp!100705))

(declare-fun b!1288808 () Bool)

(declare-fun e!735901 () Bool)

(assert (=> b!1288808 (= e!735901 tp_is_empty!34169)))

(declare-fun b!1288815 () Bool)

(assert (=> b!1288815 (= e!735899 (and e!735901 mapRes!52814))))

(declare-fun condMapEmpty!52814 () Bool)

(declare-fun mapDefault!52814 () ValueCell!16186)

