; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109478 () Bool)

(assert start!109478)

(declare-fun b_free!28967 () Bool)

(declare-fun b_next!28967 () Bool)

(assert (=> start!109478 (= b_free!28967 (not b_next!28967))))

(declare-fun tp!102019 () Bool)

(declare-fun b_and!47057 () Bool)

(assert (=> start!109478 (= tp!102019 b_and!47057)))

(declare-fun b!1296630 () Bool)

(declare-fun e!739724 () Bool)

(assert (=> b!1296630 (= e!739724 false)))

(declare-datatypes ((V!51245 0))(
  ( (V!51246 (val!17378 Int)) )
))
(declare-fun minValue!1387 () V!51245)

(declare-fun zeroValue!1387 () V!51245)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86232 0))(
  ( (array!86233 (arr!41617 (Array (_ BitVec 32) (_ BitVec 64))) (size!42167 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86232)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16405 0))(
  ( (ValueCellFull!16405 (v!19981 V!51245)) (EmptyCell!16405) )
))
(declare-datatypes ((array!86234 0))(
  ( (array!86235 (arr!41618 (Array (_ BitVec 32) ValueCell!16405)) (size!42168 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86234)

(declare-fun lt!580505 () Bool)

(declare-datatypes ((tuple2!22388 0))(
  ( (tuple2!22389 (_1!11205 (_ BitVec 64)) (_2!11205 V!51245)) )
))
(declare-datatypes ((List!29526 0))(
  ( (Nil!29523) (Cons!29522 (h!30731 tuple2!22388) (t!43090 List!29526)) )
))
(declare-datatypes ((ListLongMap!20045 0))(
  ( (ListLongMap!20046 (toList!10038 List!29526)) )
))
(declare-fun contains!8156 (ListLongMap!20045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5067 (array!86232 array!86234 (_ BitVec 32) (_ BitVec 32) V!51245 V!51245 (_ BitVec 32) Int) ListLongMap!20045)

(assert (=> b!1296630 (= lt!580505 (contains!8156 (getCurrentListMap!5067 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53471 () Bool)

(declare-fun mapRes!53471 () Bool)

(assert (=> mapIsEmpty!53471 mapRes!53471))

(declare-fun b!1296631 () Bool)

(declare-fun e!739725 () Bool)

(declare-fun tp_is_empty!34607 () Bool)

(assert (=> b!1296631 (= e!739725 tp_is_empty!34607)))

(declare-fun mapNonEmpty!53471 () Bool)

(declare-fun tp!102020 () Bool)

(declare-fun e!739726 () Bool)

(assert (=> mapNonEmpty!53471 (= mapRes!53471 (and tp!102020 e!739726))))

(declare-fun mapRest!53471 () (Array (_ BitVec 32) ValueCell!16405))

(declare-fun mapKey!53471 () (_ BitVec 32))

(declare-fun mapValue!53471 () ValueCell!16405)

(assert (=> mapNonEmpty!53471 (= (arr!41618 _values!1445) (store mapRest!53471 mapKey!53471 mapValue!53471))))

(declare-fun b!1296632 () Bool)

(declare-fun res!861738 () Bool)

(assert (=> b!1296632 (=> (not res!861738) (not e!739724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86232 (_ BitVec 32)) Bool)

(assert (=> b!1296632 (= res!861738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296633 () Bool)

(declare-fun res!861735 () Bool)

(assert (=> b!1296633 (=> (not res!861735) (not e!739724))))

(assert (=> b!1296633 (= res!861735 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42167 _keys!1741))))))

(declare-fun b!1296634 () Bool)

(assert (=> b!1296634 (= e!739726 tp_is_empty!34607)))

(declare-fun b!1296635 () Bool)

(declare-fun res!861737 () Bool)

(assert (=> b!1296635 (=> (not res!861737) (not e!739724))))

(declare-datatypes ((List!29527 0))(
  ( (Nil!29524) (Cons!29523 (h!30732 (_ BitVec 64)) (t!43091 List!29527)) )
))
(declare-fun arrayNoDuplicates!0 (array!86232 (_ BitVec 32) List!29527) Bool)

(assert (=> b!1296635 (= res!861737 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29524))))

(declare-fun b!1296636 () Bool)

(declare-fun e!739723 () Bool)

(assert (=> b!1296636 (= e!739723 (and e!739725 mapRes!53471))))

(declare-fun condMapEmpty!53471 () Bool)

(declare-fun mapDefault!53471 () ValueCell!16405)

