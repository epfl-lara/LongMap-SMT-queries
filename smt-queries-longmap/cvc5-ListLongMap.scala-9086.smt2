; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109300 () Bool)

(assert start!109300)

(declare-fun b_free!28789 () Bool)

(declare-fun b_next!28789 () Bool)

(assert (=> start!109300 (= b_free!28789 (not b_next!28789))))

(declare-fun tp!101486 () Bool)

(declare-fun b_and!46879 () Bool)

(assert (=> start!109300 (= tp!101486 b_and!46879)))

(declare-fun b!1293404 () Bool)

(declare-fun e!738156 () Bool)

(declare-fun tp_is_empty!34429 () Bool)

(assert (=> b!1293404 (= e!738156 tp_is_empty!34429)))

(declare-fun b!1293405 () Bool)

(declare-fun res!859477 () Bool)

(declare-fun e!738159 () Bool)

(assert (=> b!1293405 (=> (not res!859477) (not e!738159))))

(declare-datatypes ((array!85886 0))(
  ( (array!85887 (arr!41444 (Array (_ BitVec 32) (_ BitVec 64))) (size!41994 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85886)

(declare-datatypes ((List!29398 0))(
  ( (Nil!29395) (Cons!29394 (h!30603 (_ BitVec 64)) (t!42962 List!29398)) )
))
(declare-fun arrayNoDuplicates!0 (array!85886 (_ BitVec 32) List!29398) Bool)

(assert (=> b!1293405 (= res!859477 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29395))))

(declare-fun b!1293406 () Bool)

(declare-fun res!859478 () Bool)

(assert (=> b!1293406 (=> (not res!859478) (not e!738159))))

(declare-datatypes ((V!51009 0))(
  ( (V!51010 (val!17289 Int)) )
))
(declare-fun minValue!1387 () V!51009)

(declare-fun zeroValue!1387 () V!51009)

(declare-datatypes ((ValueCell!16316 0))(
  ( (ValueCellFull!16316 (v!19892 V!51009)) (EmptyCell!16316) )
))
(declare-datatypes ((array!85888 0))(
  ( (array!85889 (arr!41445 (Array (_ BitVec 32) ValueCell!16316)) (size!41995 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85888)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22250 0))(
  ( (tuple2!22251 (_1!11136 (_ BitVec 64)) (_2!11136 V!51009)) )
))
(declare-datatypes ((List!29399 0))(
  ( (Nil!29396) (Cons!29395 (h!30604 tuple2!22250) (t!42963 List!29399)) )
))
(declare-datatypes ((ListLongMap!19907 0))(
  ( (ListLongMap!19908 (toList!9969 List!29399)) )
))
(declare-fun contains!8087 (ListLongMap!19907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5011 (array!85886 array!85888 (_ BitVec 32) (_ BitVec 32) V!51009 V!51009 (_ BitVec 32) Int) ListLongMap!19907)

(assert (=> b!1293406 (= res!859478 (contains!8087 (getCurrentListMap!5011 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1293407 () Bool)

(declare-fun e!738160 () Bool)

(assert (=> b!1293407 (= e!738159 (not e!738160))))

(declare-fun res!859472 () Bool)

(assert (=> b!1293407 (=> res!859472 e!738160)))

(assert (=> b!1293407 (= res!859472 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293407 (not (contains!8087 (ListLongMap!19908 Nil!29396) k!1205))))

(declare-datatypes ((Unit!42836 0))(
  ( (Unit!42837) )
))
(declare-fun lt!579542 () Unit!42836)

(declare-fun emptyContainsNothing!139 ((_ BitVec 64)) Unit!42836)

(assert (=> b!1293407 (= lt!579542 (emptyContainsNothing!139 k!1205))))

(declare-fun mapNonEmpty!53204 () Bool)

(declare-fun mapRes!53204 () Bool)

(declare-fun tp!101485 () Bool)

(assert (=> mapNonEmpty!53204 (= mapRes!53204 (and tp!101485 e!738156))))

(declare-fun mapRest!53204 () (Array (_ BitVec 32) ValueCell!16316))

(declare-fun mapKey!53204 () (_ BitVec 32))

(declare-fun mapValue!53204 () ValueCell!16316)

(assert (=> mapNonEmpty!53204 (= (arr!41445 _values!1445) (store mapRest!53204 mapKey!53204 mapValue!53204))))

(declare-fun b!1293408 () Bool)

(declare-fun res!859474 () Bool)

(assert (=> b!1293408 (=> (not res!859474) (not e!738159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85886 (_ BitVec 32)) Bool)

(assert (=> b!1293408 (= res!859474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293409 () Bool)

(declare-fun e!738157 () Bool)

(declare-fun e!738158 () Bool)

(assert (=> b!1293409 (= e!738157 (and e!738158 mapRes!53204))))

(declare-fun condMapEmpty!53204 () Bool)

(declare-fun mapDefault!53204 () ValueCell!16316)

