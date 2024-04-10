; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109120 () Bool)

(assert start!109120)

(declare-fun b_free!28609 () Bool)

(declare-fun b_next!28609 () Bool)

(assert (=> start!109120 (= b_free!28609 (not b_next!28609))))

(declare-fun tp!100945 () Bool)

(declare-fun b_and!46699 () Bool)

(assert (=> start!109120 (= tp!100945 b_and!46699)))

(declare-fun b!1290245 () Bool)

(declare-fun res!857124 () Bool)

(declare-fun e!736619 () Bool)

(assert (=> b!1290245 (=> (not res!857124) (not e!736619))))

(declare-datatypes ((array!85540 0))(
  ( (array!85541 (arr!41271 (Array (_ BitVec 32) (_ BitVec 64))) (size!41821 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85540)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290245 (= res!857124 (not (validKeyInArray!0 (select (arr!41271 _keys!1741) from!2144))))))

(declare-fun b!1290246 () Bool)

(declare-fun e!736620 () Bool)

(declare-fun tp_is_empty!34249 () Bool)

(assert (=> b!1290246 (= e!736620 tp_is_empty!34249)))

(declare-fun mapIsEmpty!52934 () Bool)

(declare-fun mapRes!52934 () Bool)

(assert (=> mapIsEmpty!52934 mapRes!52934))

(declare-fun b!1290247 () Bool)

(declare-fun res!857129 () Bool)

(assert (=> b!1290247 (=> (not res!857129) (not e!736619))))

(declare-datatypes ((List!29265 0))(
  ( (Nil!29262) (Cons!29261 (h!30470 (_ BitVec 64)) (t!42829 List!29265)) )
))
(declare-fun arrayNoDuplicates!0 (array!85540 (_ BitVec 32) List!29265) Bool)

(assert (=> b!1290247 (= res!857129 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29262))))

(declare-fun b!1290248 () Bool)

(declare-fun res!857130 () Bool)

(assert (=> b!1290248 (=> (not res!857130) (not e!736619))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1290248 (= res!857130 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41821 _keys!1741))))))

(declare-fun b!1290249 () Bool)

(declare-fun e!736622 () Bool)

(assert (=> b!1290249 (= e!736622 tp_is_empty!34249)))

(declare-fun b!1290250 () Bool)

(declare-fun res!857122 () Bool)

(assert (=> b!1290250 (=> (not res!857122) (not e!736619))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50769 0))(
  ( (V!50770 (val!17199 Int)) )
))
(declare-datatypes ((ValueCell!16226 0))(
  ( (ValueCellFull!16226 (v!19802 V!50769)) (EmptyCell!16226) )
))
(declare-datatypes ((array!85542 0))(
  ( (array!85543 (arr!41272 (Array (_ BitVec 32) ValueCell!16226)) (size!41822 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85542)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290250 (= res!857122 (and (= (size!41822 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41821 _keys!1741) (size!41822 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290252 () Bool)

(declare-fun e!736621 () Bool)

(assert (=> b!1290252 (= e!736619 (not e!736621))))

(declare-fun res!857125 () Bool)

(assert (=> b!1290252 (=> res!857125 e!736621)))

(assert (=> b!1290252 (= res!857125 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22098 0))(
  ( (tuple2!22099 (_1!11060 (_ BitVec 64)) (_2!11060 V!50769)) )
))
(declare-datatypes ((List!29266 0))(
  ( (Nil!29263) (Cons!29262 (h!30471 tuple2!22098) (t!42830 List!29266)) )
))
(declare-datatypes ((ListLongMap!19755 0))(
  ( (ListLongMap!19756 (toList!9893 List!29266)) )
))
(declare-fun contains!8011 (ListLongMap!19755 (_ BitVec 64)) Bool)

(assert (=> b!1290252 (not (contains!8011 (ListLongMap!19756 Nil!29263) k!1205))))

(declare-datatypes ((Unit!42700 0))(
  ( (Unit!42701) )
))
(declare-fun lt!578525 () Unit!42700)

(declare-fun emptyContainsNothing!76 ((_ BitVec 64)) Unit!42700)

(assert (=> b!1290252 (= lt!578525 (emptyContainsNothing!76 k!1205))))

(declare-fun b!1290253 () Bool)

(declare-fun res!857127 () Bool)

(assert (=> b!1290253 (=> (not res!857127) (not e!736619))))

(declare-fun minValue!1387 () V!50769)

(declare-fun zeroValue!1387 () V!50769)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4951 (array!85540 array!85542 (_ BitVec 32) (_ BitVec 32) V!50769 V!50769 (_ BitVec 32) Int) ListLongMap!19755)

(assert (=> b!1290253 (= res!857127 (contains!8011 (getCurrentListMap!4951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290254 () Bool)

(declare-fun res!857126 () Bool)

(assert (=> b!1290254 (=> (not res!857126) (not e!736619))))

(assert (=> b!1290254 (= res!857126 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41821 _keys!1741))))))

(declare-fun mapNonEmpty!52934 () Bool)

(declare-fun tp!100946 () Bool)

(assert (=> mapNonEmpty!52934 (= mapRes!52934 (and tp!100946 e!736622))))

(declare-fun mapKey!52934 () (_ BitVec 32))

(declare-fun mapValue!52934 () ValueCell!16226)

(declare-fun mapRest!52934 () (Array (_ BitVec 32) ValueCell!16226))

(assert (=> mapNonEmpty!52934 (= (arr!41272 _values!1445) (store mapRest!52934 mapKey!52934 mapValue!52934))))

(declare-fun b!1290255 () Bool)

(declare-fun e!736617 () Bool)

(assert (=> b!1290255 (= e!736617 (and e!736620 mapRes!52934))))

(declare-fun condMapEmpty!52934 () Bool)

(declare-fun mapDefault!52934 () ValueCell!16226)

