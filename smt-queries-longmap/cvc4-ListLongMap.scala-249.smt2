; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4180 () Bool)

(assert start!4180)

(declare-fun b_free!1085 () Bool)

(declare-fun b_next!1085 () Bool)

(assert (=> start!4180 (= b_free!1085 (not b_next!1085))))

(declare-fun tp!4674 () Bool)

(declare-fun b_and!1895 () Bool)

(assert (=> start!4180 (= tp!4674 b_and!1895)))

(declare-fun b!31647 () Bool)

(declare-fun res!19183 () Bool)

(declare-fun e!20203 () Bool)

(assert (=> b!31647 (=> (not res!19183) (not e!20203))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1743 0))(
  ( (V!1744 (val!746 Int)) )
))
(declare-datatypes ((ValueCell!520 0))(
  ( (ValueCellFull!520 (v!1835 V!1743)) (EmptyCell!520) )
))
(declare-datatypes ((array!2095 0))(
  ( (array!2096 (arr!1001 (Array (_ BitVec 32) ValueCell!520)) (size!1102 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2095)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2097 0))(
  ( (array!2098 (arr!1002 (Array (_ BitVec 32) (_ BitVec 64))) (size!1103 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2097)

(declare-fun zeroValue!1443 () V!1743)

(declare-fun minValue!1443 () V!1743)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((tuple2!1218 0))(
  ( (tuple2!1219 (_1!620 (_ BitVec 64)) (_2!620 V!1743)) )
))
(declare-datatypes ((List!811 0))(
  ( (Nil!808) (Cons!807 (h!1374 tuple2!1218) (t!3504 List!811)) )
))
(declare-datatypes ((ListLongMap!795 0))(
  ( (ListLongMap!796 (toList!413 List!811)) )
))
(declare-fun contains!353 (ListLongMap!795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!241 (array!2097 array!2095 (_ BitVec 32) (_ BitVec 32) V!1743 V!1743 (_ BitVec 32) Int) ListLongMap!795)

(assert (=> b!31647 (= res!19183 (not (contains!353 (getCurrentListMap!241 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31648 () Bool)

(assert (=> b!31648 (= e!20203 false)))

(declare-fun lt!11588 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2097 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31648 (= lt!11588 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31649 () Bool)

(declare-fun res!19188 () Bool)

(assert (=> b!31649 (=> (not res!19188) (not e!20203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31649 (= res!19188 (validKeyInArray!0 k!1304))))

(declare-fun b!31650 () Bool)

(declare-fun res!19185 () Bool)

(assert (=> b!31650 (=> (not res!19185) (not e!20203))))

(assert (=> b!31650 (= res!19185 (and (= (size!1102 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1103 _keys!1833) (size!1102 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31651 () Bool)

(declare-fun res!19184 () Bool)

(assert (=> b!31651 (=> (not res!19184) (not e!20203))))

(declare-datatypes ((List!812 0))(
  ( (Nil!809) (Cons!808 (h!1375 (_ BitVec 64)) (t!3505 List!812)) )
))
(declare-fun arrayNoDuplicates!0 (array!2097 (_ BitVec 32) List!812) Bool)

(assert (=> b!31651 (= res!19184 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!809))))

(declare-fun b!31653 () Bool)

(declare-fun e!20202 () Bool)

(declare-fun tp_is_empty!1439 () Bool)

(assert (=> b!31653 (= e!20202 tp_is_empty!1439)))

(declare-fun b!31654 () Bool)

(declare-fun res!19187 () Bool)

(assert (=> b!31654 (=> (not res!19187) (not e!20203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2097 (_ BitVec 32)) Bool)

(assert (=> b!31654 (= res!19187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31655 () Bool)

(declare-fun e!20204 () Bool)

(assert (=> b!31655 (= e!20204 tp_is_empty!1439)))

(declare-fun mapIsEmpty!1687 () Bool)

(declare-fun mapRes!1687 () Bool)

(assert (=> mapIsEmpty!1687 mapRes!1687))

(declare-fun mapNonEmpty!1687 () Bool)

(declare-fun tp!4675 () Bool)

(assert (=> mapNonEmpty!1687 (= mapRes!1687 (and tp!4675 e!20202))))

(declare-fun mapRest!1687 () (Array (_ BitVec 32) ValueCell!520))

(declare-fun mapValue!1687 () ValueCell!520)

(declare-fun mapKey!1687 () (_ BitVec 32))

(assert (=> mapNonEmpty!1687 (= (arr!1001 _values!1501) (store mapRest!1687 mapKey!1687 mapValue!1687))))

(declare-fun b!31656 () Bool)

(declare-fun e!20200 () Bool)

(assert (=> b!31656 (= e!20200 (and e!20204 mapRes!1687))))

(declare-fun condMapEmpty!1687 () Bool)

(declare-fun mapDefault!1687 () ValueCell!520)

