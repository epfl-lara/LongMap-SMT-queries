; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3918 () Bool)

(assert start!3918)

(declare-fun b_free!823 () Bool)

(declare-fun b_next!823 () Bool)

(assert (=> start!3918 (= b_free!823 (not b_next!823))))

(declare-fun tp!3889 () Bool)

(declare-fun b_and!1633 () Bool)

(assert (=> start!3918 (= tp!3889 b_and!1633)))

(declare-fun b!27726 () Bool)

(declare-fun e!18019 () Bool)

(declare-fun tp_is_empty!1177 () Bool)

(assert (=> b!27726 (= e!18019 tp_is_empty!1177)))

(declare-fun b!27727 () Bool)

(declare-fun res!16444 () Bool)

(declare-fun e!18022 () Bool)

(assert (=> b!27727 (=> (not res!16444) (not e!18022))))

(declare-datatypes ((array!1595 0))(
  ( (array!1596 (arr!751 (Array (_ BitVec 32) (_ BitVec 64))) (size!852 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1595)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27727 (= res!16444 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1294 () Bool)

(declare-fun mapRes!1294 () Bool)

(declare-fun tp!3888 () Bool)

(declare-fun e!18021 () Bool)

(assert (=> mapNonEmpty!1294 (= mapRes!1294 (and tp!3888 e!18021))))

(declare-datatypes ((V!1395 0))(
  ( (V!1396 (val!615 Int)) )
))
(declare-datatypes ((ValueCell!389 0))(
  ( (ValueCellFull!389 (v!1704 V!1395)) (EmptyCell!389) )
))
(declare-fun mapRest!1294 () (Array (_ BitVec 32) ValueCell!389))

(declare-datatypes ((array!1597 0))(
  ( (array!1598 (arr!752 (Array (_ BitVec 32) ValueCell!389)) (size!853 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1597)

(declare-fun mapKey!1294 () (_ BitVec 32))

(declare-fun mapValue!1294 () ValueCell!389)

(assert (=> mapNonEmpty!1294 (= (arr!752 _values!1501) (store mapRest!1294 mapKey!1294 mapValue!1294))))

(declare-fun b!27728 () Bool)

(assert (=> b!27728 (= e!18022 false)))

(declare-fun lt!10709 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1595 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27728 (= lt!10709 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!16446 () Bool)

(assert (=> start!3918 (=> (not res!16446) (not e!18022))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3918 (= res!16446 (validMask!0 mask!2294))))

(assert (=> start!3918 e!18022))

(assert (=> start!3918 true))

(assert (=> start!3918 tp!3889))

(declare-fun e!18023 () Bool)

(declare-fun array_inv!515 (array!1597) Bool)

(assert (=> start!3918 (and (array_inv!515 _values!1501) e!18023)))

(declare-fun array_inv!516 (array!1595) Bool)

(assert (=> start!3918 (array_inv!516 _keys!1833)))

(assert (=> start!3918 tp_is_empty!1177))

(declare-fun b!27729 () Bool)

(declare-fun res!16443 () Bool)

(assert (=> b!27729 (=> (not res!16443) (not e!18022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27729 (= res!16443 (validKeyInArray!0 k!1304))))

(declare-fun b!27730 () Bool)

(declare-fun res!16442 () Bool)

(assert (=> b!27730 (=> (not res!16442) (not e!18022))))

(declare-datatypes ((List!632 0))(
  ( (Nil!629) (Cons!628 (h!1195 (_ BitVec 64)) (t!3325 List!632)) )
))
(declare-fun arrayNoDuplicates!0 (array!1595 (_ BitVec 32) List!632) Bool)

(assert (=> b!27730 (= res!16442 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!629))))

(declare-fun b!27731 () Bool)

(assert (=> b!27731 (= e!18023 (and e!18019 mapRes!1294))))

(declare-fun condMapEmpty!1294 () Bool)

(declare-fun mapDefault!1294 () ValueCell!389)

