; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4440 () Bool)

(assert start!4440)

(declare-fun b_free!1201 () Bool)

(declare-fun b_next!1201 () Bool)

(assert (=> start!4440 (= b_free!1201 (not b_next!1201))))

(declare-fun tp!5041 () Bool)

(declare-fun b_and!2023 () Bool)

(assert (=> start!4440 (= tp!5041 b_and!2023)))

(declare-fun b!34231 () Bool)

(declare-fun e!21735 () Bool)

(assert (=> b!34231 (= e!21735 (not true))))

(declare-fun lt!12728 () (_ BitVec 32))

(declare-datatypes ((array!2327 0))(
  ( (array!2328 (arr!1111 (Array (_ BitVec 32) (_ BitVec 64))) (size!1212 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2327)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2327 (_ BitVec 32)) Bool)

(assert (=> b!34231 (arrayForallSeekEntryOrOpenFound!0 lt!12728 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!773 0))(
  ( (Unit!774) )
))
(declare-fun lt!12726 () Unit!773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!773)

(assert (=> b!34231 (= lt!12726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12728))))

(declare-datatypes ((SeekEntryResult!138 0))(
  ( (MissingZero!138 (index!2674 (_ BitVec 32))) (Found!138 (index!2675 (_ BitVec 32))) (Intermediate!138 (undefined!950 Bool) (index!2676 (_ BitVec 32)) (x!6892 (_ BitVec 32))) (Undefined!138) (MissingVacant!138 (index!2677 (_ BitVec 32))) )
))
(declare-fun lt!12727 () SeekEntryResult!138)

(assert (=> b!34231 (and (is-Found!138 lt!12727) (= (index!2675 lt!12727) lt!12728))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2327 (_ BitVec 32)) SeekEntryResult!138)

(assert (=> b!34231 (= lt!12727 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!12725 () Unit!773)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2327 (_ BitVec 32)) Unit!773)

(assert (=> b!34231 (= lt!12725 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12728 _keys!1833 mask!2294))))

(declare-datatypes ((V!1899 0))(
  ( (V!1900 (val!804 Int)) )
))
(declare-datatypes ((tuple2!1308 0))(
  ( (tuple2!1309 (_1!665 (_ BitVec 64)) (_2!665 V!1899)) )
))
(declare-datatypes ((List!897 0))(
  ( (Nil!894) (Cons!893 (h!1460 tuple2!1308) (t!3602 List!897)) )
))
(declare-datatypes ((ListLongMap!885 0))(
  ( (ListLongMap!886 (toList!458 List!897)) )
))
(declare-fun lt!12729 () ListLongMap!885)

(declare-fun contains!404 (ListLongMap!885 (_ BitVec 64)) Bool)

(assert (=> b!34231 (contains!404 lt!12729 (select (arr!1111 _keys!1833) lt!12728))))

(declare-fun lt!12724 () Unit!773)

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!578 0))(
  ( (ValueCellFull!578 (v!1899 V!1899)) (EmptyCell!578) )
))
(declare-datatypes ((array!2329 0))(
  ( (array!2330 (arr!1112 (Array (_ BitVec 32) ValueCell!578)) (size!1213 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2329)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1899)

(declare-fun minValue!1443 () V!1899)

(declare-fun lemmaValidKeyInArrayIsInListMap!70 (array!2327 array!2329 (_ BitVec 32) (_ BitVec 32) V!1899 V!1899 (_ BitVec 32) Int) Unit!773)

(assert (=> b!34231 (= lt!12724 (lemmaValidKeyInArrayIsInListMap!70 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12728 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2327 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!34231 (= lt!12728 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!34232 () Bool)

(declare-fun res!20747 () Bool)

(declare-fun e!21739 () Bool)

(assert (=> b!34232 (=> (not res!20747) (not e!21739))))

(assert (=> b!34232 (= res!20747 (and (= (size!1213 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1212 _keys!1833) (size!1213 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34233 () Bool)

(declare-fun res!20744 () Bool)

(assert (=> b!34233 (=> (not res!20744) (not e!21739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34233 (= res!20744 (validKeyInArray!0 k!1304))))

(declare-fun b!34234 () Bool)

(declare-fun res!20746 () Bool)

(assert (=> b!34234 (=> (not res!20746) (not e!21735))))

(declare-fun arrayContainsKey!0 (array!2327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34234 (= res!20746 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!20742 () Bool)

(assert (=> start!4440 (=> (not res!20742) (not e!21739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4440 (= res!20742 (validMask!0 mask!2294))))

(assert (=> start!4440 e!21739))

(assert (=> start!4440 true))

(assert (=> start!4440 tp!5041))

(declare-fun e!21736 () Bool)

(declare-fun array_inv!781 (array!2329) Bool)

(assert (=> start!4440 (and (array_inv!781 _values!1501) e!21736)))

(declare-fun array_inv!782 (array!2327) Bool)

(assert (=> start!4440 (array_inv!782 _keys!1833)))

(declare-fun tp_is_empty!1555 () Bool)

(assert (=> start!4440 tp_is_empty!1555))

(declare-fun b!34235 () Bool)

(declare-fun res!20743 () Bool)

(assert (=> b!34235 (=> (not res!20743) (not e!21739))))

(assert (=> b!34235 (= res!20743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34236 () Bool)

(declare-fun res!20748 () Bool)

(assert (=> b!34236 (=> (not res!20748) (not e!21739))))

(declare-datatypes ((List!898 0))(
  ( (Nil!895) (Cons!894 (h!1461 (_ BitVec 64)) (t!3603 List!898)) )
))
(declare-fun arrayNoDuplicates!0 (array!2327 (_ BitVec 32) List!898) Bool)

(assert (=> b!34236 (= res!20748 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!895))))

(declare-fun mapIsEmpty!1879 () Bool)

(declare-fun mapRes!1879 () Bool)

(assert (=> mapIsEmpty!1879 mapRes!1879))

(declare-fun b!34237 () Bool)

(declare-fun e!21738 () Bool)

(assert (=> b!34237 (= e!21738 tp_is_empty!1555)))

(declare-fun b!34238 () Bool)

(declare-fun e!21734 () Bool)

(assert (=> b!34238 (= e!21734 tp_is_empty!1555)))

(declare-fun b!34239 () Bool)

(assert (=> b!34239 (= e!21739 e!21735)))

(declare-fun res!20745 () Bool)

(assert (=> b!34239 (=> (not res!20745) (not e!21735))))

(assert (=> b!34239 (= res!20745 (not (contains!404 lt!12729 k!1304)))))

(declare-fun getCurrentListMap!282 (array!2327 array!2329 (_ BitVec 32) (_ BitVec 32) V!1899 V!1899 (_ BitVec 32) Int) ListLongMap!885)

(assert (=> b!34239 (= lt!12729 (getCurrentListMap!282 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!34240 () Bool)

(assert (=> b!34240 (= e!21736 (and e!21738 mapRes!1879))))

(declare-fun condMapEmpty!1879 () Bool)

(declare-fun mapDefault!1879 () ValueCell!578)

