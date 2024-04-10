; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4248 () Bool)

(assert start!4248)

(declare-fun b_free!1133 () Bool)

(declare-fun b_next!1133 () Bool)

(assert (=> start!4248 (= b_free!1133 (not b_next!1133))))

(declare-fun tp!4822 () Bool)

(declare-fun b_and!1945 () Bool)

(assert (=> start!4248 (= tp!4822 b_and!1945)))

(declare-fun mapIsEmpty!1762 () Bool)

(declare-fun mapRes!1762 () Bool)

(assert (=> mapIsEmpty!1762 mapRes!1762))

(declare-fun b!32496 () Bool)

(declare-fun e!20652 () Bool)

(declare-fun tp_is_empty!1487 () Bool)

(assert (=> b!32496 (= e!20652 tp_is_empty!1487)))

(declare-fun b!32497 () Bool)

(declare-fun res!19747 () Bool)

(declare-fun e!20650 () Bool)

(assert (=> b!32497 (=> (not res!19747) (not e!20650))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32497 (= res!19747 (validKeyInArray!0 k!1304))))

(declare-fun b!32498 () Bool)

(declare-fun e!20653 () Bool)

(assert (=> b!32498 (= e!20653 tp_is_empty!1487)))

(declare-fun b!32499 () Bool)

(declare-fun res!19748 () Bool)

(assert (=> b!32499 (=> (not res!19748) (not e!20650))))

(declare-datatypes ((array!2185 0))(
  ( (array!2186 (arr!1045 (Array (_ BitVec 32) (_ BitVec 64))) (size!1146 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2185)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2185 (_ BitVec 32)) Bool)

(assert (=> b!32499 (= res!19748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32500 () Bool)

(declare-fun res!19751 () Bool)

(assert (=> b!32500 (=> (not res!19751) (not e!20650))))

(declare-fun arrayContainsKey!0 (array!2185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32500 (= res!19751 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32501 () Bool)

(declare-fun e!20651 () Bool)

(declare-fun lt!11750 () (_ BitVec 32))

(assert (=> b!32501 (= e!20651 (not (validKeyInArray!0 (select (arr!1045 _keys!1833) lt!11750))))))

(declare-fun res!19745 () Bool)

(assert (=> start!4248 (=> (not res!19745) (not e!20650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4248 (= res!19745 (validMask!0 mask!2294))))

(assert (=> start!4248 e!20650))

(assert (=> start!4248 true))

(assert (=> start!4248 tp!4822))

(declare-datatypes ((V!1807 0))(
  ( (V!1808 (val!770 Int)) )
))
(declare-datatypes ((ValueCell!544 0))(
  ( (ValueCellFull!544 (v!1860 V!1807)) (EmptyCell!544) )
))
(declare-datatypes ((array!2187 0))(
  ( (array!2188 (arr!1046 (Array (_ BitVec 32) ValueCell!544)) (size!1147 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2187)

(declare-fun e!20649 () Bool)

(declare-fun array_inv!731 (array!2187) Bool)

(assert (=> start!4248 (and (array_inv!731 _values!1501) e!20649)))

(declare-fun array_inv!732 (array!2185) Bool)

(assert (=> start!4248 (array_inv!732 _keys!1833)))

(assert (=> start!4248 tp_is_empty!1487))

(declare-fun b!32502 () Bool)

(assert (=> b!32502 (= e!20650 e!20651)))

(declare-fun res!19749 () Bool)

(assert (=> b!32502 (=> (not res!19749) (not e!20651))))

(assert (=> b!32502 (= res!19749 (and (bvsge lt!11750 #b00000000000000000000000000000000) (bvslt lt!11750 (size!1146 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2185 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32502 (= lt!11750 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32503 () Bool)

(declare-fun res!19746 () Bool)

(assert (=> b!32503 (=> (not res!19746) (not e!20650))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1807)

(declare-fun minValue!1443 () V!1807)

(declare-datatypes ((tuple2!1250 0))(
  ( (tuple2!1251 (_1!636 (_ BitVec 64)) (_2!636 V!1807)) )
))
(declare-datatypes ((List!844 0))(
  ( (Nil!841) (Cons!840 (h!1407 tuple2!1250) (t!3539 List!844)) )
))
(declare-datatypes ((ListLongMap!827 0))(
  ( (ListLongMap!828 (toList!429 List!844)) )
))
(declare-fun contains!370 (ListLongMap!827 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!257 (array!2185 array!2187 (_ BitVec 32) (_ BitVec 32) V!1807 V!1807 (_ BitVec 32) Int) ListLongMap!827)

(assert (=> b!32503 (= res!19746 (not (contains!370 (getCurrentListMap!257 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun mapNonEmpty!1762 () Bool)

(declare-fun tp!4821 () Bool)

(assert (=> mapNonEmpty!1762 (= mapRes!1762 (and tp!4821 e!20653))))

(declare-fun mapRest!1762 () (Array (_ BitVec 32) ValueCell!544))

(declare-fun mapKey!1762 () (_ BitVec 32))

(declare-fun mapValue!1762 () ValueCell!544)

(assert (=> mapNonEmpty!1762 (= (arr!1046 _values!1501) (store mapRest!1762 mapKey!1762 mapValue!1762))))

(declare-fun b!32504 () Bool)

(declare-fun res!19752 () Bool)

(assert (=> b!32504 (=> (not res!19752) (not e!20650))))

(assert (=> b!32504 (= res!19752 (and (= (size!1147 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1146 _keys!1833) (size!1147 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32505 () Bool)

(declare-fun res!19750 () Bool)

(assert (=> b!32505 (=> (not res!19750) (not e!20650))))

(declare-datatypes ((List!845 0))(
  ( (Nil!842) (Cons!841 (h!1408 (_ BitVec 64)) (t!3540 List!845)) )
))
(declare-fun arrayNoDuplicates!0 (array!2185 (_ BitVec 32) List!845) Bool)

(assert (=> b!32505 (= res!19750 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!842))))

(declare-fun b!32506 () Bool)

(assert (=> b!32506 (= e!20649 (and e!20652 mapRes!1762))))

(declare-fun condMapEmpty!1762 () Bool)

(declare-fun mapDefault!1762 () ValueCell!544)

