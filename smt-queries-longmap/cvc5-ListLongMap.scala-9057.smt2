; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109126 () Bool)

(assert start!109126)

(declare-fun b_free!28615 () Bool)

(declare-fun b_next!28615 () Bool)

(assert (=> start!109126 (= b_free!28615 (not b_next!28615))))

(declare-fun tp!100963 () Bool)

(declare-fun b_and!46705 () Bool)

(assert (=> start!109126 (= tp!100963 b_and!46705)))

(declare-fun b!1290353 () Bool)

(declare-fun res!857205 () Bool)

(declare-fun e!736673 () Bool)

(assert (=> b!1290353 (=> (not res!857205) (not e!736673))))

(declare-datatypes ((array!85550 0))(
  ( (array!85551 (arr!41276 (Array (_ BitVec 32) (_ BitVec 64))) (size!41826 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85550)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290353 (= res!857205 (not (validKeyInArray!0 (select (arr!41276 _keys!1741) from!2144))))))

(declare-fun b!1290354 () Bool)

(declare-fun res!857206 () Bool)

(assert (=> b!1290354 (=> (not res!857206) (not e!736673))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1290354 (= res!857206 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41826 _keys!1741))))))

(declare-fun b!1290355 () Bool)

(declare-fun e!736671 () Bool)

(declare-fun tp_is_empty!34255 () Bool)

(assert (=> b!1290355 (= e!736671 tp_is_empty!34255)))

(declare-fun b!1290356 () Bool)

(declare-fun e!736676 () Bool)

(assert (=> b!1290356 (= e!736673 (not e!736676))))

(declare-fun res!857210 () Bool)

(assert (=> b!1290356 (=> res!857210 e!736676)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290356 (= res!857210 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50777 0))(
  ( (V!50778 (val!17202 Int)) )
))
(declare-datatypes ((tuple2!22102 0))(
  ( (tuple2!22103 (_1!11062 (_ BitVec 64)) (_2!11062 V!50777)) )
))
(declare-datatypes ((List!29269 0))(
  ( (Nil!29266) (Cons!29265 (h!30474 tuple2!22102) (t!42833 List!29269)) )
))
(declare-datatypes ((ListLongMap!19759 0))(
  ( (ListLongMap!19760 (toList!9895 List!29269)) )
))
(declare-fun contains!8013 (ListLongMap!19759 (_ BitVec 64)) Bool)

(assert (=> b!1290356 (not (contains!8013 (ListLongMap!19760 Nil!29266) k!1205))))

(declare-datatypes ((Unit!42704 0))(
  ( (Unit!42705) )
))
(declare-fun lt!578571 () Unit!42704)

(declare-fun emptyContainsNothing!78 ((_ BitVec 64)) Unit!42704)

(assert (=> b!1290356 (= lt!578571 (emptyContainsNothing!78 k!1205))))

(declare-fun b!1290357 () Bool)

(declare-fun res!857211 () Bool)

(assert (=> b!1290357 (=> (not res!857211) (not e!736673))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16229 0))(
  ( (ValueCellFull!16229 (v!19805 V!50777)) (EmptyCell!16229) )
))
(declare-datatypes ((array!85552 0))(
  ( (array!85553 (arr!41277 (Array (_ BitVec 32) ValueCell!16229)) (size!41827 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85552)

(assert (=> b!1290357 (= res!857211 (and (= (size!41827 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41826 _keys!1741) (size!41827 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290358 () Bool)

(declare-fun res!857204 () Bool)

(assert (=> b!1290358 (=> (not res!857204) (not e!736673))))

(declare-fun minValue!1387 () V!50777)

(declare-fun zeroValue!1387 () V!50777)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4953 (array!85550 array!85552 (_ BitVec 32) (_ BitVec 32) V!50777 V!50777 (_ BitVec 32) Int) ListLongMap!19759)

(assert (=> b!1290358 (= res!857204 (contains!8013 (getCurrentListMap!4953 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290360 () Bool)

(declare-fun res!857203 () Bool)

(assert (=> b!1290360 (=> (not res!857203) (not e!736673))))

(declare-datatypes ((List!29270 0))(
  ( (Nil!29267) (Cons!29266 (h!30475 (_ BitVec 64)) (t!42834 List!29270)) )
))
(declare-fun arrayNoDuplicates!0 (array!85550 (_ BitVec 32) List!29270) Bool)

(assert (=> b!1290360 (= res!857203 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29267))))

(declare-fun mapIsEmpty!52943 () Bool)

(declare-fun mapRes!52943 () Bool)

(assert (=> mapIsEmpty!52943 mapRes!52943))

(declare-fun b!1290361 () Bool)

(declare-fun res!857209 () Bool)

(assert (=> b!1290361 (=> (not res!857209) (not e!736673))))

(assert (=> b!1290361 (= res!857209 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41826 _keys!1741))))))

(declare-fun b!1290362 () Bool)

(declare-fun res!857207 () Bool)

(assert (=> b!1290362 (=> (not res!857207) (not e!736673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85550 (_ BitVec 32)) Bool)

(assert (=> b!1290362 (= res!857207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290363 () Bool)

(assert (=> b!1290363 (= e!736676 true)))

(declare-fun lt!578568 () tuple2!22102)

(declare-fun lt!578572 () ListLongMap!19759)

(declare-fun lt!578573 () Bool)

(declare-fun +!4363 (ListLongMap!19759 tuple2!22102) ListLongMap!19759)

(assert (=> b!1290363 (= lt!578573 (contains!8013 (+!4363 lt!578572 lt!578568) k!1205))))

(declare-fun lt!578567 () ListLongMap!19759)

(assert (=> b!1290363 (not (contains!8013 (+!4363 lt!578567 lt!578568) k!1205))))

(assert (=> b!1290363 (= lt!578568 (tuple2!22103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!578570 () Unit!42704)

(declare-fun addStillNotContains!381 (ListLongMap!19759 (_ BitVec 64) V!50777 (_ BitVec 64)) Unit!42704)

(assert (=> b!1290363 (= lt!578570 (addStillNotContains!381 lt!578567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290363 (not (contains!8013 lt!578572 k!1205))))

(assert (=> b!1290363 (= lt!578572 (+!4363 lt!578567 (tuple2!22103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578569 () Unit!42704)

(assert (=> b!1290363 (= lt!578569 (addStillNotContains!381 lt!578567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5994 (array!85550 array!85552 (_ BitVec 32) (_ BitVec 32) V!50777 V!50777 (_ BitVec 32) Int) ListLongMap!19759)

(assert (=> b!1290363 (= lt!578567 (getCurrentListMapNoExtraKeys!5994 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!857208 () Bool)

(assert (=> start!109126 (=> (not res!857208) (not e!736673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109126 (= res!857208 (validMask!0 mask!2175))))

(assert (=> start!109126 e!736673))

(assert (=> start!109126 tp_is_empty!34255))

(assert (=> start!109126 true))

(declare-fun e!736675 () Bool)

(declare-fun array_inv!31283 (array!85552) Bool)

(assert (=> start!109126 (and (array_inv!31283 _values!1445) e!736675)))

(declare-fun array_inv!31284 (array!85550) Bool)

(assert (=> start!109126 (array_inv!31284 _keys!1741)))

(assert (=> start!109126 tp!100963))

(declare-fun b!1290359 () Bool)

(declare-fun e!736674 () Bool)

(assert (=> b!1290359 (= e!736675 (and e!736674 mapRes!52943))))

(declare-fun condMapEmpty!52943 () Bool)

(declare-fun mapDefault!52943 () ValueCell!16229)

