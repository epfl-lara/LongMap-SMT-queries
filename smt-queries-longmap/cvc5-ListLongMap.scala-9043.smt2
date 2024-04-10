; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109042 () Bool)

(assert start!109042)

(declare-fun b_free!28531 () Bool)

(declare-fun b_next!28531 () Bool)

(assert (=> start!109042 (= b_free!28531 (not b_next!28531))))

(declare-fun tp!100712 () Bool)

(declare-fun b_and!46621 () Bool)

(assert (=> start!109042 (= tp!100712 b_and!46621)))

(declare-fun b!1288841 () Bool)

(declare-fun res!856072 () Bool)

(declare-fun e!735919 () Bool)

(assert (=> b!1288841 (=> (not res!856072) (not e!735919))))

(declare-datatypes ((V!50665 0))(
  ( (V!50666 (val!17160 Int)) )
))
(declare-fun minValue!1387 () V!50665)

(declare-fun zeroValue!1387 () V!50665)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16187 0))(
  ( (ValueCellFull!16187 (v!19763 V!50665)) (EmptyCell!16187) )
))
(declare-datatypes ((array!85386 0))(
  ( (array!85387 (arr!41194 (Array (_ BitVec 32) ValueCell!16187)) (size!41744 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85386)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85388 0))(
  ( (array!85389 (arr!41195 (Array (_ BitVec 32) (_ BitVec 64))) (size!41745 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85388)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22034 0))(
  ( (tuple2!22035 (_1!11028 (_ BitVec 64)) (_2!11028 V!50665)) )
))
(declare-datatypes ((List!29206 0))(
  ( (Nil!29203) (Cons!29202 (h!30411 tuple2!22034) (t!42770 List!29206)) )
))
(declare-datatypes ((ListLongMap!19691 0))(
  ( (ListLongMap!19692 (toList!9861 List!29206)) )
))
(declare-fun contains!7979 (ListLongMap!19691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4923 (array!85388 array!85386 (_ BitVec 32) (_ BitVec 32) V!50665 V!50665 (_ BitVec 32) Int) ListLongMap!19691)

(assert (=> b!1288841 (= res!856072 (contains!7979 (getCurrentListMap!4923 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52817 () Bool)

(declare-fun mapRes!52817 () Bool)

(assert (=> mapIsEmpty!52817 mapRes!52817))

(declare-fun b!1288842 () Bool)

(declare-fun e!735918 () Bool)

(declare-fun tp_is_empty!34171 () Bool)

(assert (=> b!1288842 (= e!735918 tp_is_empty!34171)))

(declare-fun mapNonEmpty!52817 () Bool)

(declare-fun tp!100711 () Bool)

(assert (=> mapNonEmpty!52817 (= mapRes!52817 (and tp!100711 e!735918))))

(declare-fun mapKey!52817 () (_ BitVec 32))

(declare-fun mapRest!52817 () (Array (_ BitVec 32) ValueCell!16187))

(declare-fun mapValue!52817 () ValueCell!16187)

(assert (=> mapNonEmpty!52817 (= (arr!41194 _values!1445) (store mapRest!52817 mapKey!52817 mapValue!52817))))

(declare-fun b!1288843 () Bool)

(declare-fun e!735917 () Bool)

(assert (=> b!1288843 (= e!735919 (not e!735917))))

(declare-fun res!856070 () Bool)

(assert (=> b!1288843 (=> res!856070 e!735917)))

(assert (=> b!1288843 (= res!856070 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288843 (not (contains!7979 (ListLongMap!19692 Nil!29203) k!1205))))

(declare-datatypes ((Unit!42640 0))(
  ( (Unit!42641) )
))
(declare-fun lt!578091 () Unit!42640)

(declare-fun emptyContainsNothing!49 ((_ BitVec 64)) Unit!42640)

(assert (=> b!1288843 (= lt!578091 (emptyContainsNothing!49 k!1205))))

(declare-fun b!1288844 () Bool)

(declare-fun res!856069 () Bool)

(assert (=> b!1288844 (=> (not res!856069) (not e!735919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288844 (= res!856069 (not (validKeyInArray!0 (select (arr!41195 _keys!1741) from!2144))))))

(declare-fun b!1288845 () Bool)

(declare-fun res!856071 () Bool)

(assert (=> b!1288845 (=> (not res!856071) (not e!735919))))

(assert (=> b!1288845 (= res!856071 (and (= (size!41744 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41745 _keys!1741) (size!41744 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288846 () Bool)

(declare-fun res!856073 () Bool)

(assert (=> b!1288846 (=> (not res!856073) (not e!735919))))

(assert (=> b!1288846 (= res!856073 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41745 _keys!1741))))))

(declare-fun res!856074 () Bool)

(assert (=> start!109042 (=> (not res!856074) (not e!735919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109042 (= res!856074 (validMask!0 mask!2175))))

(assert (=> start!109042 e!735919))

(assert (=> start!109042 tp_is_empty!34171))

(assert (=> start!109042 true))

(declare-fun e!735916 () Bool)

(declare-fun array_inv!31231 (array!85386) Bool)

(assert (=> start!109042 (and (array_inv!31231 _values!1445) e!735916)))

(declare-fun array_inv!31232 (array!85388) Bool)

(assert (=> start!109042 (array_inv!31232 _keys!1741)))

(assert (=> start!109042 tp!100712))

(declare-fun b!1288847 () Bool)

(declare-fun res!856075 () Bool)

(assert (=> b!1288847 (=> (not res!856075) (not e!735919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85388 (_ BitVec 32)) Bool)

(assert (=> b!1288847 (= res!856075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288848 () Bool)

(assert (=> b!1288848 (= e!735917 true)))

(declare-fun lt!578093 () ListLongMap!19691)

(declare-fun +!4333 (ListLongMap!19691 tuple2!22034) ListLongMap!19691)

(assert (=> b!1288848 (not (contains!7979 (+!4333 lt!578093 (tuple2!22035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578092 () Unit!42640)

(declare-fun addStillNotContains!351 (ListLongMap!19691 (_ BitVec 64) V!50665 (_ BitVec 64)) Unit!42640)

(assert (=> b!1288848 (= lt!578092 (addStillNotContains!351 lt!578093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5964 (array!85388 array!85386 (_ BitVec 32) (_ BitVec 32) V!50665 V!50665 (_ BitVec 32) Int) ListLongMap!19691)

(assert (=> b!1288848 (= lt!578093 (getCurrentListMapNoExtraKeys!5964 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288849 () Bool)

(declare-fun e!735915 () Bool)

(assert (=> b!1288849 (= e!735916 (and e!735915 mapRes!52817))))

(declare-fun condMapEmpty!52817 () Bool)

(declare-fun mapDefault!52817 () ValueCell!16187)

