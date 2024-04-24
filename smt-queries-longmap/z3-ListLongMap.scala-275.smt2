; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4472 () Bool)

(assert start!4472)

(declare-fun b_free!1237 () Bool)

(declare-fun b_next!1237 () Bool)

(assert (=> start!4472 (= b_free!1237 (not b_next!1237))))

(declare-fun tp!5148 () Bool)

(declare-fun b_and!2049 () Bool)

(assert (=> start!4472 (= tp!5148 b_and!2049)))

(declare-fun b!34699 () Bool)

(declare-fun res!21080 () Bool)

(declare-fun e!21962 () Bool)

(assert (=> b!34699 (=> (not res!21080) (not e!21962))))

(declare-datatypes ((array!2379 0))(
  ( (array!2380 (arr!1137 (Array (_ BitVec 32) (_ BitVec 64))) (size!1238 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2379)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34699 (= res!21080 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34700 () Bool)

(assert (=> b!34700 (= e!21962 false)))

(declare-datatypes ((SeekEntryResult!141 0))(
  ( (MissingZero!141 (index!2686 (_ BitVec 32))) (Found!141 (index!2687 (_ BitVec 32))) (Intermediate!141 (undefined!953 Bool) (index!2688 (_ BitVec 32)) (x!6943 (_ BitVec 32))) (Undefined!141) (MissingVacant!141 (index!2689 (_ BitVec 32))) )
))
(declare-fun lt!12769 () SeekEntryResult!141)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2379 (_ BitVec 32)) SeekEntryResult!141)

(assert (=> b!34700 (= lt!12769 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34701 () Bool)

(declare-fun res!21084 () Bool)

(assert (=> b!34701 (=> (not res!21084) (not e!21962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2379 (_ BitVec 32)) Bool)

(assert (=> b!34701 (= res!21084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34702 () Bool)

(declare-fun e!21961 () Bool)

(declare-fun tp_is_empty!1591 () Bool)

(assert (=> b!34702 (= e!21961 tp_is_empty!1591)))

(declare-fun mapIsEmpty!1933 () Bool)

(declare-fun mapRes!1933 () Bool)

(assert (=> mapIsEmpty!1933 mapRes!1933))

(declare-fun b!34703 () Bool)

(declare-fun res!21083 () Bool)

(assert (=> b!34703 (=> (not res!21083) (not e!21962))))

(declare-datatypes ((V!1947 0))(
  ( (V!1948 (val!822 Int)) )
))
(declare-datatypes ((ValueCell!596 0))(
  ( (ValueCellFull!596 (v!1917 V!1947)) (EmptyCell!596) )
))
(declare-datatypes ((array!2381 0))(
  ( (array!2382 (arr!1138 (Array (_ BitVec 32) ValueCell!596)) (size!1239 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2381)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34703 (= res!21083 (and (= (size!1239 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1238 _keys!1833) (size!1239 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34704 () Bool)

(declare-fun res!21081 () Bool)

(assert (=> b!34704 (=> (not res!21081) (not e!21962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34704 (= res!21081 (validKeyInArray!0 k0!1304))))

(declare-fun b!34705 () Bool)

(declare-fun e!21963 () Bool)

(assert (=> b!34705 (= e!21963 tp_is_empty!1591)))

(declare-fun mapNonEmpty!1933 () Bool)

(declare-fun tp!5149 () Bool)

(assert (=> mapNonEmpty!1933 (= mapRes!1933 (and tp!5149 e!21961))))

(declare-fun mapValue!1933 () ValueCell!596)

(declare-fun mapRest!1933 () (Array (_ BitVec 32) ValueCell!596))

(declare-fun mapKey!1933 () (_ BitVec 32))

(assert (=> mapNonEmpty!1933 (= (arr!1138 _values!1501) (store mapRest!1933 mapKey!1933 mapValue!1933))))

(declare-fun b!34706 () Bool)

(declare-fun res!21086 () Bool)

(assert (=> b!34706 (=> (not res!21086) (not e!21962))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1947)

(declare-fun minValue!1443 () V!1947)

(declare-datatypes ((tuple2!1306 0))(
  ( (tuple2!1307 (_1!664 (_ BitVec 64)) (_2!664 V!1947)) )
))
(declare-datatypes ((List!901 0))(
  ( (Nil!898) (Cons!897 (h!1464 tuple2!1306) (t!3600 List!901)) )
))
(declare-datatypes ((ListLongMap!877 0))(
  ( (ListLongMap!878 (toList!454 List!901)) )
))
(declare-fun contains!402 (ListLongMap!877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!275 (array!2379 array!2381 (_ BitVec 32) (_ BitVec 32) V!1947 V!1947 (_ BitVec 32) Int) ListLongMap!877)

(assert (=> b!34706 (= res!21086 (not (contains!402 (getCurrentListMap!275 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34707 () Bool)

(declare-fun e!21959 () Bool)

(assert (=> b!34707 (= e!21959 (and e!21963 mapRes!1933))))

(declare-fun condMapEmpty!1933 () Bool)

(declare-fun mapDefault!1933 () ValueCell!596)

(assert (=> b!34707 (= condMapEmpty!1933 (= (arr!1138 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!596)) mapDefault!1933)))))

(declare-fun res!21085 () Bool)

(assert (=> start!4472 (=> (not res!21085) (not e!21962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4472 (= res!21085 (validMask!0 mask!2294))))

(assert (=> start!4472 e!21962))

(assert (=> start!4472 true))

(assert (=> start!4472 tp!5148))

(declare-fun array_inv!777 (array!2381) Bool)

(assert (=> start!4472 (and (array_inv!777 _values!1501) e!21959)))

(declare-fun array_inv!778 (array!2379) Bool)

(assert (=> start!4472 (array_inv!778 _keys!1833)))

(assert (=> start!4472 tp_is_empty!1591))

(declare-fun b!34708 () Bool)

(declare-fun res!21082 () Bool)

(assert (=> b!34708 (=> (not res!21082) (not e!21962))))

(declare-datatypes ((List!902 0))(
  ( (Nil!899) (Cons!898 (h!1465 (_ BitVec 64)) (t!3601 List!902)) )
))
(declare-fun arrayNoDuplicates!0 (array!2379 (_ BitVec 32) List!902) Bool)

(assert (=> b!34708 (= res!21082 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!899))))

(assert (= (and start!4472 res!21085) b!34703))

(assert (= (and b!34703 res!21083) b!34701))

(assert (= (and b!34701 res!21084) b!34708))

(assert (= (and b!34708 res!21082) b!34704))

(assert (= (and b!34704 res!21081) b!34706))

(assert (= (and b!34706 res!21086) b!34699))

(assert (= (and b!34699 res!21080) b!34700))

(assert (= (and b!34707 condMapEmpty!1933) mapIsEmpty!1933))

(assert (= (and b!34707 (not condMapEmpty!1933)) mapNonEmpty!1933))

(get-info :version)

(assert (= (and mapNonEmpty!1933 ((_ is ValueCellFull!596) mapValue!1933)) b!34702))

(assert (= (and b!34707 ((_ is ValueCellFull!596) mapDefault!1933)) b!34705))

(assert (= start!4472 b!34707))

(declare-fun m!27859 () Bool)

(assert (=> b!34701 m!27859))

(declare-fun m!27861 () Bool)

(assert (=> b!34699 m!27861))

(declare-fun m!27863 () Bool)

(assert (=> start!4472 m!27863))

(declare-fun m!27865 () Bool)

(assert (=> start!4472 m!27865))

(declare-fun m!27867 () Bool)

(assert (=> start!4472 m!27867))

(declare-fun m!27869 () Bool)

(assert (=> b!34706 m!27869))

(assert (=> b!34706 m!27869))

(declare-fun m!27871 () Bool)

(assert (=> b!34706 m!27871))

(declare-fun m!27873 () Bool)

(assert (=> b!34708 m!27873))

(declare-fun m!27875 () Bool)

(assert (=> mapNonEmpty!1933 m!27875))

(declare-fun m!27877 () Bool)

(assert (=> b!34700 m!27877))

(declare-fun m!27879 () Bool)

(assert (=> b!34704 m!27879))

(check-sat tp_is_empty!1591 (not b!34708) (not start!4472) (not b_next!1237) (not b!34704) (not b!34701) (not b!34699) (not b!34700) b_and!2049 (not b!34706) (not mapNonEmpty!1933))
(check-sat b_and!2049 (not b_next!1237))
