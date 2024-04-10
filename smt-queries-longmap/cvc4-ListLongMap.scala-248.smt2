; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4174 () Bool)

(assert start!4174)

(declare-fun b_free!1079 () Bool)

(declare-fun b_next!1079 () Bool)

(assert (=> start!4174 (= b_free!1079 (not b_next!1079))))

(declare-fun tp!4657 () Bool)

(declare-fun b_and!1889 () Bool)

(assert (=> start!4174 (= tp!4657 b_and!1889)))

(declare-fun b!31557 () Bool)

(declare-fun res!19121 () Bool)

(declare-fun e!20155 () Bool)

(assert (=> b!31557 (=> (not res!19121) (not e!20155))))

(declare-datatypes ((array!2083 0))(
  ( (array!2084 (arr!995 (Array (_ BitVec 32) (_ BitVec 64))) (size!1096 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2083)

(declare-datatypes ((List!806 0))(
  ( (Nil!803) (Cons!802 (h!1369 (_ BitVec 64)) (t!3499 List!806)) )
))
(declare-fun arrayNoDuplicates!0 (array!2083 (_ BitVec 32) List!806) Bool)

(assert (=> b!31557 (= res!19121 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!803))))

(declare-fun b!31558 () Bool)

(declare-fun e!20156 () Bool)

(declare-fun tp_is_empty!1433 () Bool)

(assert (=> b!31558 (= e!20156 tp_is_empty!1433)))

(declare-fun b!31559 () Bool)

(declare-fun res!19124 () Bool)

(assert (=> b!31559 (=> (not res!19124) (not e!20155))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31559 (= res!19124 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31560 () Bool)

(assert (=> b!31560 (= e!20155 false)))

(declare-fun lt!11579 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2083 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31560 (= lt!11579 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31561 () Bool)

(declare-fun res!19123 () Bool)

(assert (=> b!31561 (=> (not res!19123) (not e!20155))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1735 0))(
  ( (V!1736 (val!743 Int)) )
))
(declare-datatypes ((ValueCell!517 0))(
  ( (ValueCellFull!517 (v!1832 V!1735)) (EmptyCell!517) )
))
(declare-datatypes ((array!2085 0))(
  ( (array!2086 (arr!996 (Array (_ BitVec 32) ValueCell!517)) (size!1097 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2085)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1735)

(declare-fun minValue!1443 () V!1735)

(declare-datatypes ((tuple2!1212 0))(
  ( (tuple2!1213 (_1!617 (_ BitVec 64)) (_2!617 V!1735)) )
))
(declare-datatypes ((List!807 0))(
  ( (Nil!804) (Cons!803 (h!1370 tuple2!1212) (t!3500 List!807)) )
))
(declare-datatypes ((ListLongMap!789 0))(
  ( (ListLongMap!790 (toList!410 List!807)) )
))
(declare-fun contains!350 (ListLongMap!789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!238 (array!2083 array!2085 (_ BitVec 32) (_ BitVec 32) V!1735 V!1735 (_ BitVec 32) Int) ListLongMap!789)

(assert (=> b!31561 (= res!19123 (not (contains!350 (getCurrentListMap!238 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31562 () Bool)

(declare-fun res!19122 () Bool)

(assert (=> b!31562 (=> (not res!19122) (not e!20155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2083 (_ BitVec 32)) Bool)

(assert (=> b!31562 (= res!19122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!19119 () Bool)

(assert (=> start!4174 (=> (not res!19119) (not e!20155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4174 (= res!19119 (validMask!0 mask!2294))))

(assert (=> start!4174 e!20155))

(assert (=> start!4174 true))

(assert (=> start!4174 tp!4657))

(declare-fun e!20158 () Bool)

(declare-fun array_inv!695 (array!2085) Bool)

(assert (=> start!4174 (and (array_inv!695 _values!1501) e!20158)))

(declare-fun array_inv!696 (array!2083) Bool)

(assert (=> start!4174 (array_inv!696 _keys!1833)))

(assert (=> start!4174 tp_is_empty!1433))

(declare-fun b!31563 () Bool)

(declare-fun res!19120 () Bool)

(assert (=> b!31563 (=> (not res!19120) (not e!20155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31563 (= res!19120 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1678 () Bool)

(declare-fun mapRes!1678 () Bool)

(assert (=> mapIsEmpty!1678 mapRes!1678))

(declare-fun b!31564 () Bool)

(declare-fun e!20159 () Bool)

(assert (=> b!31564 (= e!20159 tp_is_empty!1433)))

(declare-fun mapNonEmpty!1678 () Bool)

(declare-fun tp!4656 () Bool)

(assert (=> mapNonEmpty!1678 (= mapRes!1678 (and tp!4656 e!20156))))

(declare-fun mapValue!1678 () ValueCell!517)

(declare-fun mapKey!1678 () (_ BitVec 32))

(declare-fun mapRest!1678 () (Array (_ BitVec 32) ValueCell!517))

(assert (=> mapNonEmpty!1678 (= (arr!996 _values!1501) (store mapRest!1678 mapKey!1678 mapValue!1678))))

(declare-fun b!31565 () Bool)

(declare-fun res!19125 () Bool)

(assert (=> b!31565 (=> (not res!19125) (not e!20155))))

(assert (=> b!31565 (= res!19125 (and (= (size!1097 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1096 _keys!1833) (size!1097 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31566 () Bool)

(assert (=> b!31566 (= e!20158 (and e!20159 mapRes!1678))))

(declare-fun condMapEmpty!1678 () Bool)

(declare-fun mapDefault!1678 () ValueCell!517)

