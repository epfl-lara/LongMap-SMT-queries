; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4038 () Bool)

(assert start!4038)

(declare-fun b_free!943 () Bool)

(declare-fun b_next!943 () Bool)

(assert (=> start!4038 (= b_free!943 (not b_next!943))))

(declare-fun tp!4249 () Bool)

(declare-fun b_and!1753 () Bool)

(assert (=> start!4038 (= tp!4249 b_and!1753)))

(declare-fun b!29567 () Bool)

(declare-fun res!17741 () Bool)

(declare-fun e!19082 () Bool)

(assert (=> b!29567 (=> (not res!17741) (not e!19082))))

(declare-datatypes ((V!1555 0))(
  ( (V!1556 (val!675 Int)) )
))
(declare-datatypes ((ValueCell!449 0))(
  ( (ValueCellFull!449 (v!1764 V!1555)) (EmptyCell!449) )
))
(declare-datatypes ((array!1825 0))(
  ( (array!1826 (arr!866 (Array (_ BitVec 32) ValueCell!449)) (size!967 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1825)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1827 0))(
  ( (array!1828 (arr!867 (Array (_ BitVec 32) (_ BitVec 64))) (size!968 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1827)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29567 (= res!17741 (and (= (size!967 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!968 _keys!1833) (size!967 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29568 () Bool)

(declare-fun e!19085 () Bool)

(declare-fun tp_is_empty!1297 () Bool)

(assert (=> b!29568 (= e!19085 tp_is_empty!1297)))

(declare-fun b!29569 () Bool)

(declare-fun e!19081 () Bool)

(assert (=> b!29569 (= e!19081 tp_is_empty!1297)))

(declare-fun mapIsEmpty!1474 () Bool)

(declare-fun mapRes!1474 () Bool)

(assert (=> mapIsEmpty!1474 mapRes!1474))

(declare-fun b!29570 () Bool)

(assert (=> b!29570 (= e!19082 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11339 () Bool)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun zeroValue!1443 () V!1555)

(declare-fun minValue!1443 () V!1555)

(declare-datatypes ((tuple2!1118 0))(
  ( (tuple2!1119 (_1!570 (_ BitVec 64)) (_2!570 V!1555)) )
))
(declare-datatypes ((List!718 0))(
  ( (Nil!715) (Cons!714 (h!1281 tuple2!1118) (t!3411 List!718)) )
))
(declare-datatypes ((ListLongMap!695 0))(
  ( (ListLongMap!696 (toList!363 List!718)) )
))
(declare-fun contains!303 (ListLongMap!695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!191 (array!1827 array!1825 (_ BitVec 32) (_ BitVec 32) V!1555 V!1555 (_ BitVec 32) Int) ListLongMap!695)

(assert (=> b!29570 (= lt!11339 (contains!303 (getCurrentListMap!191 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun mapNonEmpty!1474 () Bool)

(declare-fun tp!4248 () Bool)

(assert (=> mapNonEmpty!1474 (= mapRes!1474 (and tp!4248 e!19081))))

(declare-fun mapKey!1474 () (_ BitVec 32))

(declare-fun mapRest!1474 () (Array (_ BitVec 32) ValueCell!449))

(declare-fun mapValue!1474 () ValueCell!449)

(assert (=> mapNonEmpty!1474 (= (arr!866 _values!1501) (store mapRest!1474 mapKey!1474 mapValue!1474))))

(declare-fun b!29571 () Bool)

(declare-fun res!17742 () Bool)

(assert (=> b!29571 (=> (not res!17742) (not e!19082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1827 (_ BitVec 32)) Bool)

(assert (=> b!29571 (= res!17742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29572 () Bool)

(declare-fun res!17745 () Bool)

(assert (=> b!29572 (=> (not res!17745) (not e!19082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29572 (= res!17745 (validKeyInArray!0 k!1304))))

(declare-fun res!17744 () Bool)

(assert (=> start!4038 (=> (not res!17744) (not e!19082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4038 (= res!17744 (validMask!0 mask!2294))))

(assert (=> start!4038 e!19082))

(assert (=> start!4038 true))

(assert (=> start!4038 tp!4249))

(declare-fun e!19084 () Bool)

(declare-fun array_inv!601 (array!1825) Bool)

(assert (=> start!4038 (and (array_inv!601 _values!1501) e!19084)))

(declare-fun array_inv!602 (array!1827) Bool)

(assert (=> start!4038 (array_inv!602 _keys!1833)))

(assert (=> start!4038 tp_is_empty!1297))

(declare-fun b!29573 () Bool)

(declare-fun res!17743 () Bool)

(assert (=> b!29573 (=> (not res!17743) (not e!19082))))

(declare-datatypes ((List!719 0))(
  ( (Nil!716) (Cons!715 (h!1282 (_ BitVec 64)) (t!3412 List!719)) )
))
(declare-fun arrayNoDuplicates!0 (array!1827 (_ BitVec 32) List!719) Bool)

(assert (=> b!29573 (= res!17743 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!716))))

(declare-fun b!29574 () Bool)

(assert (=> b!29574 (= e!19084 (and e!19085 mapRes!1474))))

(declare-fun condMapEmpty!1474 () Bool)

(declare-fun mapDefault!1474 () ValueCell!449)

