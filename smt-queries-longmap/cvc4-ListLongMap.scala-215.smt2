; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3976 () Bool)

(assert start!3976)

(declare-fun b_free!881 () Bool)

(declare-fun b_next!881 () Bool)

(assert (=> start!3976 (= b_free!881 (not b_next!881))))

(declare-fun tp!4063 () Bool)

(declare-fun b_and!1691 () Bool)

(assert (=> start!3976 (= tp!4063 b_and!1691)))

(declare-fun b!28622 () Bool)

(declare-fun res!17081 () Bool)

(declare-fun e!18506 () Bool)

(assert (=> b!28622 (=> (not res!17081) (not e!18506))))

(declare-datatypes ((array!1705 0))(
  ( (array!1706 (arr!806 (Array (_ BitVec 32) (_ BitVec 64))) (size!907 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1705)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28622 (= res!17081 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28623 () Bool)

(declare-fun e!18508 () Bool)

(declare-fun tp_is_empty!1235 () Bool)

(assert (=> b!28623 (= e!18508 tp_is_empty!1235)))

(declare-fun b!28624 () Bool)

(declare-fun res!17082 () Bool)

(declare-fun e!18509 () Bool)

(assert (=> b!28624 (=> (not res!17082) (not e!18509))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1705 (_ BitVec 32)) Bool)

(assert (=> b!28624 (= res!17082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1381 () Bool)

(declare-fun mapRes!1381 () Bool)

(assert (=> mapIsEmpty!1381 mapRes!1381))

(declare-fun b!28625 () Bool)

(declare-fun res!17078 () Bool)

(assert (=> b!28625 (=> (not res!17078) (not e!18509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28625 (= res!17078 (validKeyInArray!0 k!1304))))

(declare-fun res!17079 () Bool)

(assert (=> start!3976 (=> (not res!17079) (not e!18509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3976 (= res!17079 (validMask!0 mask!2294))))

(assert (=> start!3976 e!18509))

(assert (=> start!3976 true))

(assert (=> start!3976 tp!4063))

(declare-datatypes ((V!1471 0))(
  ( (V!1472 (val!644 Int)) )
))
(declare-datatypes ((ValueCell!418 0))(
  ( (ValueCellFull!418 (v!1733 V!1471)) (EmptyCell!418) )
))
(declare-datatypes ((array!1707 0))(
  ( (array!1708 (arr!807 (Array (_ BitVec 32) ValueCell!418)) (size!908 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1707)

(declare-fun e!18511 () Bool)

(declare-fun array_inv!553 (array!1707) Bool)

(assert (=> start!3976 (and (array_inv!553 _values!1501) e!18511)))

(declare-fun array_inv!554 (array!1705) Bool)

(assert (=> start!3976 (array_inv!554 _keys!1833)))

(assert (=> start!3976 tp_is_empty!1235))

(declare-fun b!28626 () Bool)

(assert (=> b!28626 (= e!18509 e!18506)))

(declare-fun res!17080 () Bool)

(assert (=> b!28626 (=> (not res!17080) (not e!18506))))

(declare-datatypes ((tuple2!1070 0))(
  ( (tuple2!1071 (_1!546 (_ BitVec 64)) (_2!546 V!1471)) )
))
(declare-datatypes ((List!670 0))(
  ( (Nil!667) (Cons!666 (h!1233 tuple2!1070) (t!3363 List!670)) )
))
(declare-datatypes ((ListLongMap!647 0))(
  ( (ListLongMap!648 (toList!339 List!670)) )
))
(declare-fun lt!10874 () ListLongMap!647)

(declare-fun contains!279 (ListLongMap!647 (_ BitVec 64)) Bool)

(assert (=> b!28626 (= res!17080 (not (contains!279 lt!10874 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1471)

(declare-fun minValue!1443 () V!1471)

(declare-fun getCurrentListMap!169 (array!1705 array!1707 (_ BitVec 32) (_ BitVec 32) V!1471 V!1471 (_ BitVec 32) Int) ListLongMap!647)

(assert (=> b!28626 (= lt!10874 (getCurrentListMap!169 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28627 () Bool)

(declare-fun e!18507 () Bool)

(assert (=> b!28627 (= e!18507 tp_is_empty!1235)))

(declare-fun b!28628 () Bool)

(declare-fun e!18512 () Bool)

(assert (=> b!28628 (= e!18506 (not e!18512))))

(declare-fun res!17076 () Bool)

(assert (=> b!28628 (=> res!17076 e!18512)))

(assert (=> b!28628 (= res!17076 (not (= (size!907 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10876 () (_ BitVec 32))

(assert (=> b!28628 (contains!279 lt!10874 (select (arr!806 _keys!1833) lt!10876))))

(declare-datatypes ((Unit!647 0))(
  ( (Unit!648) )
))
(declare-fun lt!10877 () Unit!647)

(declare-fun lemmaValidKeyInArrayIsInListMap!17 (array!1705 array!1707 (_ BitVec 32) (_ BitVec 32) V!1471 V!1471 (_ BitVec 32) Int) Unit!647)

(assert (=> b!28628 (= lt!10877 (lemmaValidKeyInArrayIsInListMap!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10876 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1705 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28628 (= lt!10876 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1381 () Bool)

(declare-fun tp!4062 () Bool)

(assert (=> mapNonEmpty!1381 (= mapRes!1381 (and tp!4062 e!18507))))

(declare-fun mapValue!1381 () ValueCell!418)

(declare-fun mapKey!1381 () (_ BitVec 32))

(declare-fun mapRest!1381 () (Array (_ BitVec 32) ValueCell!418))

(assert (=> mapNonEmpty!1381 (= (arr!807 _values!1501) (store mapRest!1381 mapKey!1381 mapValue!1381))))

(declare-fun b!28629 () Bool)

(declare-fun res!17075 () Bool)

(assert (=> b!28629 (=> (not res!17075) (not e!18509))))

(assert (=> b!28629 (= res!17075 (and (= (size!908 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!907 _keys!1833) (size!908 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28630 () Bool)

(assert (=> b!28630 (= e!18511 (and e!18508 mapRes!1381))))

(declare-fun condMapEmpty!1381 () Bool)

(declare-fun mapDefault!1381 () ValueCell!418)

