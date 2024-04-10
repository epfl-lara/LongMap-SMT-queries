; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4186 () Bool)

(assert start!4186)

(declare-fun b_free!1091 () Bool)

(declare-fun b_next!1091 () Bool)

(assert (=> start!4186 (= b_free!1091 (not b_next!1091))))

(declare-fun tp!4692 () Bool)

(declare-fun b_and!1901 () Bool)

(assert (=> start!4186 (= tp!4692 b_and!1901)))

(declare-fun b!31737 () Bool)

(declare-fun e!20248 () Bool)

(declare-fun tp_is_empty!1445 () Bool)

(assert (=> b!31737 (= e!20248 tp_is_empty!1445)))

(declare-fun b!31738 () Bool)

(declare-fun res!19248 () Bool)

(declare-fun e!20245 () Bool)

(assert (=> b!31738 (=> (not res!19248) (not e!20245))))

(declare-datatypes ((array!2105 0))(
  ( (array!2106 (arr!1006 (Array (_ BitVec 32) (_ BitVec 64))) (size!1107 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2105)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31738 (= res!19248 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1696 () Bool)

(declare-fun mapRes!1696 () Bool)

(declare-fun tp!4693 () Bool)

(assert (=> mapNonEmpty!1696 (= mapRes!1696 (and tp!4693 e!20248))))

(declare-datatypes ((V!1751 0))(
  ( (V!1752 (val!749 Int)) )
))
(declare-datatypes ((ValueCell!523 0))(
  ( (ValueCellFull!523 (v!1838 V!1751)) (EmptyCell!523) )
))
(declare-fun mapValue!1696 () ValueCell!523)

(declare-fun mapRest!1696 () (Array (_ BitVec 32) ValueCell!523))

(declare-fun mapKey!1696 () (_ BitVec 32))

(declare-datatypes ((array!2107 0))(
  ( (array!2108 (arr!1007 (Array (_ BitVec 32) ValueCell!523)) (size!1108 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2107)

(assert (=> mapNonEmpty!1696 (= (arr!1007 _values!1501) (store mapRest!1696 mapKey!1696 mapValue!1696))))

(declare-fun b!31740 () Bool)

(declare-fun res!19245 () Bool)

(assert (=> b!31740 (=> (not res!19245) (not e!20245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31740 (= res!19245 (validKeyInArray!0 k!1304))))

(declare-fun b!31741 () Bool)

(assert (=> b!31741 (= e!20245 false)))

(declare-fun lt!11597 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2105 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31741 (= lt!11597 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31742 () Bool)

(declare-fun res!19249 () Bool)

(assert (=> b!31742 (=> (not res!19249) (not e!20245))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31742 (= res!19249 (and (= (size!1108 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1107 _keys!1833) (size!1108 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1696 () Bool)

(assert (=> mapIsEmpty!1696 mapRes!1696))

(declare-fun b!31739 () Bool)

(declare-fun res!19246 () Bool)

(assert (=> b!31739 (=> (not res!19246) (not e!20245))))

(declare-datatypes ((List!815 0))(
  ( (Nil!812) (Cons!811 (h!1378 (_ BitVec 64)) (t!3508 List!815)) )
))
(declare-fun arrayNoDuplicates!0 (array!2105 (_ BitVec 32) List!815) Bool)

(assert (=> b!31739 (= res!19246 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!812))))

(declare-fun res!19251 () Bool)

(assert (=> start!4186 (=> (not res!19251) (not e!20245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4186 (= res!19251 (validMask!0 mask!2294))))

(assert (=> start!4186 e!20245))

(assert (=> start!4186 true))

(assert (=> start!4186 tp!4692))

(declare-fun e!20249 () Bool)

(declare-fun array_inv!703 (array!2107) Bool)

(assert (=> start!4186 (and (array_inv!703 _values!1501) e!20249)))

(declare-fun array_inv!704 (array!2105) Bool)

(assert (=> start!4186 (array_inv!704 _keys!1833)))

(assert (=> start!4186 tp_is_empty!1445))

(declare-fun b!31743 () Bool)

(declare-fun res!19247 () Bool)

(assert (=> b!31743 (=> (not res!19247) (not e!20245))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1751)

(declare-fun minValue!1443 () V!1751)

(declare-datatypes ((tuple2!1222 0))(
  ( (tuple2!1223 (_1!622 (_ BitVec 64)) (_2!622 V!1751)) )
))
(declare-datatypes ((List!816 0))(
  ( (Nil!813) (Cons!812 (h!1379 tuple2!1222) (t!3509 List!816)) )
))
(declare-datatypes ((ListLongMap!799 0))(
  ( (ListLongMap!800 (toList!415 List!816)) )
))
(declare-fun contains!355 (ListLongMap!799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!243 (array!2105 array!2107 (_ BitVec 32) (_ BitVec 32) V!1751 V!1751 (_ BitVec 32) Int) ListLongMap!799)

(assert (=> b!31743 (= res!19247 (not (contains!355 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31744 () Bool)

(declare-fun e!20246 () Bool)

(assert (=> b!31744 (= e!20249 (and e!20246 mapRes!1696))))

(declare-fun condMapEmpty!1696 () Bool)

(declare-fun mapDefault!1696 () ValueCell!523)

