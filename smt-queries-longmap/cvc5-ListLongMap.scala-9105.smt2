; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109414 () Bool)

(assert start!109414)

(declare-fun b_free!28903 () Bool)

(declare-fun b_next!28903 () Bool)

(assert (=> start!109414 (= b_free!28903 (not b_next!28903))))

(declare-fun tp!101828 () Bool)

(declare-fun b_and!46993 () Bool)

(assert (=> start!109414 (= tp!101828 b_and!46993)))

(declare-fun b!1295375 () Bool)

(declare-fun res!860932 () Bool)

(declare-fun e!739102 () Bool)

(assert (=> b!1295375 (=> (not res!860932) (not e!739102))))

(declare-datatypes ((array!86106 0))(
  ( (array!86107 (arr!41554 (Array (_ BitVec 32) (_ BitVec 64))) (size!42104 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86106)

(declare-datatypes ((List!29478 0))(
  ( (Nil!29475) (Cons!29474 (h!30683 (_ BitVec 64)) (t!43042 List!29478)) )
))
(declare-fun arrayNoDuplicates!0 (array!86106 (_ BitVec 32) List!29478) Bool)

(assert (=> b!1295375 (= res!860932 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29475))))

(declare-fun b!1295376 () Bool)

(declare-fun e!739106 () Bool)

(declare-fun tp_is_empty!34543 () Bool)

(assert (=> b!1295376 (= e!739106 tp_is_empty!34543)))

(declare-fun b!1295377 () Bool)

(declare-fun e!739105 () Bool)

(assert (=> b!1295377 (= e!739105 true)))

(declare-datatypes ((V!51161 0))(
  ( (V!51162 (val!17346 Int)) )
))
(declare-datatypes ((tuple2!22336 0))(
  ( (tuple2!22337 (_1!11179 (_ BitVec 64)) (_2!11179 V!51161)) )
))
(declare-datatypes ((List!29479 0))(
  ( (Nil!29476) (Cons!29475 (h!30684 tuple2!22336) (t!43043 List!29479)) )
))
(declare-datatypes ((ListLongMap!19993 0))(
  ( (ListLongMap!19994 (toList!10012 List!29479)) )
))
(declare-fun lt!579883 () ListLongMap!19993)

(declare-fun minValue!1387 () V!51161)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8130 (ListLongMap!19993 (_ BitVec 64)) Bool)

(declare-fun +!4418 (ListLongMap!19993 tuple2!22336) ListLongMap!19993)

(assert (=> b!1295377 (not (contains!8130 (+!4418 lt!579883 (tuple2!22337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42904 0))(
  ( (Unit!42905) )
))
(declare-fun lt!579882 () Unit!42904)

(declare-fun addStillNotContains!436 (ListLongMap!19993 (_ BitVec 64) V!51161 (_ BitVec 64)) Unit!42904)

(assert (=> b!1295377 (= lt!579882 (addStillNotContains!436 lt!579883 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51161)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16373 0))(
  ( (ValueCellFull!16373 (v!19949 V!51161)) (EmptyCell!16373) )
))
(declare-datatypes ((array!86108 0))(
  ( (array!86109 (arr!41555 (Array (_ BitVec 32) ValueCell!16373)) (size!42105 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86108)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6051 (array!86106 array!86108 (_ BitVec 32) (_ BitVec 32) V!51161 V!51161 (_ BitVec 32) Int) ListLongMap!19993)

(assert (=> b!1295377 (= lt!579883 (getCurrentListMapNoExtraKeys!6051 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53375 () Bool)

(declare-fun mapRes!53375 () Bool)

(assert (=> mapIsEmpty!53375 mapRes!53375))

(declare-fun b!1295378 () Bool)

(declare-fun res!860933 () Bool)

(assert (=> b!1295378 (=> (not res!860933) (not e!739102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86106 (_ BitVec 32)) Bool)

(assert (=> b!1295378 (= res!860933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295379 () Bool)

(declare-fun res!860931 () Bool)

(assert (=> b!1295379 (=> (not res!860931) (not e!739102))))

(assert (=> b!1295379 (= res!860931 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42104 _keys!1741))))))

(declare-fun b!1295380 () Bool)

(declare-fun e!739103 () Bool)

(declare-fun e!739104 () Bool)

(assert (=> b!1295380 (= e!739103 (and e!739104 mapRes!53375))))

(declare-fun condMapEmpty!53375 () Bool)

(declare-fun mapDefault!53375 () ValueCell!16373)

