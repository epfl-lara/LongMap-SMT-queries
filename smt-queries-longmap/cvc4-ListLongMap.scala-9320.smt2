; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111360 () Bool)

(assert start!111360)

(declare-fun b_free!30017 () Bool)

(declare-fun b_next!30017 () Bool)

(assert (=> start!111360 (= b_free!30017 (not b_next!30017))))

(declare-fun tp!105526 () Bool)

(declare-fun b_and!48237 () Bool)

(assert (=> start!111360 (= tp!105526 b_and!48237)))

(declare-fun mapNonEmpty!55403 () Bool)

(declare-fun mapRes!55403 () Bool)

(declare-fun tp!105527 () Bool)

(declare-fun e!751968 () Bool)

(assert (=> mapNonEmpty!55403 (= mapRes!55403 (and tp!105527 e!751968))))

(declare-fun mapKey!55403 () (_ BitVec 32))

(declare-datatypes ((V!52885 0))(
  ( (V!52886 (val!17993 Int)) )
))
(declare-datatypes ((ValueCell!17020 0))(
  ( (ValueCellFull!17020 (v!20623 V!52885)) (EmptyCell!17020) )
))
(declare-datatypes ((array!88626 0))(
  ( (array!88627 (arr!42787 (Array (_ BitVec 32) ValueCell!17020)) (size!43337 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88626)

(declare-fun mapValue!55403 () ValueCell!17020)

(declare-fun mapRest!55403 () (Array (_ BitVec 32) ValueCell!17020))

(assert (=> mapNonEmpty!55403 (= (arr!42787 _values!1337) (store mapRest!55403 mapKey!55403 mapValue!55403))))

(declare-fun b!1317724 () Bool)

(declare-fun res!874547 () Bool)

(declare-fun e!751966 () Bool)

(assert (=> b!1317724 (=> (not res!874547) (not e!751966))))

(declare-datatypes ((array!88628 0))(
  ( (array!88629 (arr!42788 (Array (_ BitVec 32) (_ BitVec 64))) (size!43338 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88628)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317724 (= res!874547 (and (= (size!43337 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43338 _keys!1609) (size!43337 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55403 () Bool)

(assert (=> mapIsEmpty!55403 mapRes!55403))

(declare-fun b!1317725 () Bool)

(assert (=> b!1317725 (= e!751966 false)))

(declare-fun zeroValue!1279 () V!52885)

(declare-fun minValue!1279 () V!52885)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!586401 () Bool)

(declare-datatypes ((tuple2!23158 0))(
  ( (tuple2!23159 (_1!11590 (_ BitVec 64)) (_2!11590 V!52885)) )
))
(declare-datatypes ((List!30316 0))(
  ( (Nil!30313) (Cons!30312 (h!31521 tuple2!23158) (t!43924 List!30316)) )
))
(declare-datatypes ((ListLongMap!20815 0))(
  ( (ListLongMap!20816 (toList!10423 List!30316)) )
))
(declare-fun contains!8578 (ListLongMap!20815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5436 (array!88628 array!88626 (_ BitVec 32) (_ BitVec 32) V!52885 V!52885 (_ BitVec 32) Int) ListLongMap!20815)

(assert (=> b!1317725 (= lt!586401 (contains!8578 (getCurrentListMap!5436 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!874548 () Bool)

(assert (=> start!111360 (=> (not res!874548) (not e!751966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111360 (= res!874548 (validMask!0 mask!2019))))

(assert (=> start!111360 e!751966))

(declare-fun array_inv!32317 (array!88628) Bool)

(assert (=> start!111360 (array_inv!32317 _keys!1609)))

(assert (=> start!111360 true))

(declare-fun tp_is_empty!35837 () Bool)

(assert (=> start!111360 tp_is_empty!35837))

(declare-fun e!751965 () Bool)

(declare-fun array_inv!32318 (array!88626) Bool)

(assert (=> start!111360 (and (array_inv!32318 _values!1337) e!751965)))

(assert (=> start!111360 tp!105526))

(declare-fun b!1317726 () Bool)

(declare-fun e!751969 () Bool)

(assert (=> b!1317726 (= e!751969 tp_is_empty!35837)))

(declare-fun b!1317727 () Bool)

(assert (=> b!1317727 (= e!751965 (and e!751969 mapRes!55403))))

(declare-fun condMapEmpty!55403 () Bool)

(declare-fun mapDefault!55403 () ValueCell!17020)

