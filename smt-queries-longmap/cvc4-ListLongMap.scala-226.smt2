; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4042 () Bool)

(assert start!4042)

(declare-fun b_free!947 () Bool)

(declare-fun b_next!947 () Bool)

(assert (=> start!4042 (= b_free!947 (not b_next!947))))

(declare-fun tp!4260 () Bool)

(declare-fun b_and!1757 () Bool)

(assert (=> start!4042 (= tp!4260 b_and!1757)))

(declare-fun b!29615 () Bool)

(declare-fun res!17772 () Bool)

(declare-fun e!19113 () Bool)

(assert (=> b!29615 (=> (not res!17772) (not e!19113))))

(declare-datatypes ((V!1559 0))(
  ( (V!1560 (val!677 Int)) )
))
(declare-datatypes ((ValueCell!451 0))(
  ( (ValueCellFull!451 (v!1766 V!1559)) (EmptyCell!451) )
))
(declare-datatypes ((array!1833 0))(
  ( (array!1834 (arr!870 (Array (_ BitVec 32) ValueCell!451)) (size!971 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1833)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1835 0))(
  ( (array!1836 (arr!871 (Array (_ BitVec 32) (_ BitVec 64))) (size!972 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1835)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29615 (= res!17772 (and (= (size!971 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!972 _keys!1833) (size!971 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29616 () Bool)

(declare-fun e!19112 () Bool)

(declare-fun tp_is_empty!1301 () Bool)

(assert (=> b!29616 (= e!19112 tp_is_empty!1301)))

(declare-fun b!29617 () Bool)

(declare-fun res!17775 () Bool)

(assert (=> b!29617 (=> (not res!17775) (not e!19113))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29617 (= res!17775 (validKeyInArray!0 k!1304))))

(declare-fun b!29618 () Bool)

(declare-fun res!17774 () Bool)

(assert (=> b!29618 (=> (not res!17774) (not e!19113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1835 (_ BitVec 32)) Bool)

(assert (=> b!29618 (= res!17774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29619 () Bool)

(assert (=> b!29619 (= e!19113 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1559)

(declare-fun minValue!1443 () V!1559)

(declare-fun lt!11345 () Bool)

(declare-datatypes ((tuple2!1122 0))(
  ( (tuple2!1123 (_1!572 (_ BitVec 64)) (_2!572 V!1559)) )
))
(declare-datatypes ((List!722 0))(
  ( (Nil!719) (Cons!718 (h!1285 tuple2!1122) (t!3415 List!722)) )
))
(declare-datatypes ((ListLongMap!699 0))(
  ( (ListLongMap!700 (toList!365 List!722)) )
))
(declare-fun contains!305 (ListLongMap!699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!193 (array!1835 array!1833 (_ BitVec 32) (_ BitVec 32) V!1559 V!1559 (_ BitVec 32) Int) ListLongMap!699)

(assert (=> b!29619 (= lt!11345 (contains!305 (getCurrentListMap!193 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun res!17773 () Bool)

(assert (=> start!4042 (=> (not res!17773) (not e!19113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4042 (= res!17773 (validMask!0 mask!2294))))

(assert (=> start!4042 e!19113))

(assert (=> start!4042 true))

(assert (=> start!4042 tp!4260))

(declare-fun e!19114 () Bool)

(declare-fun array_inv!605 (array!1833) Bool)

(assert (=> start!4042 (and (array_inv!605 _values!1501) e!19114)))

(declare-fun array_inv!606 (array!1835) Bool)

(assert (=> start!4042 (array_inv!606 _keys!1833)))

(assert (=> start!4042 tp_is_empty!1301))

(declare-fun b!29620 () Bool)

(declare-fun e!19115 () Bool)

(declare-fun mapRes!1480 () Bool)

(assert (=> b!29620 (= e!19114 (and e!19115 mapRes!1480))))

(declare-fun condMapEmpty!1480 () Bool)

(declare-fun mapDefault!1480 () ValueCell!451)

