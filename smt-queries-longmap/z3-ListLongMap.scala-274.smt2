; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4472 () Bool)

(assert start!4472)

(declare-fun b_free!1233 () Bool)

(declare-fun b_next!1233 () Bool)

(assert (=> start!4472 (= b_free!1233 (not b_next!1233))))

(declare-fun tp!5136 () Bool)

(declare-fun b_and!2055 () Bool)

(assert (=> start!4472 (= tp!5136 b_and!2055)))

(declare-fun b!34711 () Bool)

(declare-fun res!21083 () Bool)

(declare-fun e!21982 () Bool)

(assert (=> b!34711 (=> (not res!21083) (not e!21982))))

(declare-datatypes ((array!2389 0))(
  ( (array!2390 (arr!1142 (Array (_ BitVec 32) (_ BitVec 64))) (size!1243 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2389)

(declare-datatypes ((List!918 0))(
  ( (Nil!915) (Cons!914 (h!1481 (_ BitVec 64)) (t!3623 List!918)) )
))
(declare-fun arrayNoDuplicates!0 (array!2389 (_ BitVec 32) List!918) Bool)

(assert (=> b!34711 (= res!21083 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!915))))

(declare-fun b!34712 () Bool)

(declare-fun res!21078 () Bool)

(assert (=> b!34712 (=> (not res!21078) (not e!21982))))

(declare-datatypes ((V!1941 0))(
  ( (V!1942 (val!820 Int)) )
))
(declare-datatypes ((ValueCell!594 0))(
  ( (ValueCellFull!594 (v!1915 V!1941)) (EmptyCell!594) )
))
(declare-datatypes ((array!2391 0))(
  ( (array!2392 (arr!1143 (Array (_ BitVec 32) ValueCell!594)) (size!1244 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2391)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34712 (= res!21078 (and (= (size!1244 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1243 _keys!1833) (size!1244 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34713 () Bool)

(declare-fun res!21084 () Bool)

(assert (=> b!34713 (=> (not res!21084) (not e!21982))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34713 (= res!21084 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1927 () Bool)

(declare-fun mapRes!1927 () Bool)

(assert (=> mapIsEmpty!1927 mapRes!1927))

(declare-fun b!34714 () Bool)

(declare-fun e!21983 () Bool)

(declare-fun tp_is_empty!1587 () Bool)

(assert (=> b!34714 (= e!21983 tp_is_empty!1587)))

(declare-fun b!34715 () Bool)

(declare-fun e!21981 () Bool)

(assert (=> b!34715 (= e!21981 tp_is_empty!1587)))

(declare-fun b!34717 () Bool)

(declare-fun e!21984 () Bool)

(assert (=> b!34717 (= e!21984 (and e!21981 mapRes!1927))))

(declare-fun condMapEmpty!1927 () Bool)

(declare-fun mapDefault!1927 () ValueCell!594)

(assert (=> b!34717 (= condMapEmpty!1927 (= (arr!1143 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!594)) mapDefault!1927)))))

(declare-fun b!34718 () Bool)

(declare-fun res!21081 () Bool)

(assert (=> b!34718 (=> (not res!21081) (not e!21982))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1941)

(declare-fun minValue!1443 () V!1941)

(declare-datatypes ((tuple2!1330 0))(
  ( (tuple2!1331 (_1!676 (_ BitVec 64)) (_2!676 V!1941)) )
))
(declare-datatypes ((List!919 0))(
  ( (Nil!916) (Cons!915 (h!1482 tuple2!1330) (t!3624 List!919)) )
))
(declare-datatypes ((ListLongMap!907 0))(
  ( (ListLongMap!908 (toList!469 List!919)) )
))
(declare-fun contains!415 (ListLongMap!907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!293 (array!2389 array!2391 (_ BitVec 32) (_ BitVec 32) V!1941 V!1941 (_ BitVec 32) Int) ListLongMap!907)

(assert (=> b!34718 (= res!21081 (not (contains!415 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34719 () Bool)

(declare-fun res!21079 () Bool)

(assert (=> b!34719 (=> (not res!21079) (not e!21982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2389 (_ BitVec 32)) Bool)

(assert (=> b!34719 (= res!21079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34720 () Bool)

(declare-fun res!21082 () Bool)

(assert (=> b!34720 (=> (not res!21082) (not e!21982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34720 (= res!21082 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1927 () Bool)

(declare-fun tp!5137 () Bool)

(assert (=> mapNonEmpty!1927 (= mapRes!1927 (and tp!5137 e!21983))))

(declare-fun mapValue!1927 () ValueCell!594)

(declare-fun mapRest!1927 () (Array (_ BitVec 32) ValueCell!594))

(declare-fun mapKey!1927 () (_ BitVec 32))

(assert (=> mapNonEmpty!1927 (= (arr!1143 _values!1501) (store mapRest!1927 mapKey!1927 mapValue!1927))))

(declare-fun res!21080 () Bool)

(assert (=> start!4472 (=> (not res!21080) (not e!21982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4472 (= res!21080 (validMask!0 mask!2294))))

(assert (=> start!4472 e!21982))

(assert (=> start!4472 true))

(assert (=> start!4472 tp!5136))

(declare-fun array_inv!809 (array!2391) Bool)

(assert (=> start!4472 (and (array_inv!809 _values!1501) e!21984)))

(declare-fun array_inv!810 (array!2389) Bool)

(assert (=> start!4472 (array_inv!810 _keys!1833)))

(assert (=> start!4472 tp_is_empty!1587))

(declare-fun b!34716 () Bool)

(assert (=> b!34716 (= e!21982 false)))

(declare-datatypes ((SeekEntryResult!149 0))(
  ( (MissingZero!149 (index!2718 (_ BitVec 32))) (Found!149 (index!2719 (_ BitVec 32))) (Intermediate!149 (undefined!961 Bool) (index!2720 (_ BitVec 32)) (x!6943 (_ BitVec 32))) (Undefined!149) (MissingVacant!149 (index!2721 (_ BitVec 32))) )
))
(declare-fun lt!12807 () SeekEntryResult!149)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2389 (_ BitVec 32)) SeekEntryResult!149)

(assert (=> b!34716 (= lt!12807 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(assert (= (and start!4472 res!21080) b!34712))

(assert (= (and b!34712 res!21078) b!34719))

(assert (= (and b!34719 res!21079) b!34711))

(assert (= (and b!34711 res!21083) b!34720))

(assert (= (and b!34720 res!21082) b!34718))

(assert (= (and b!34718 res!21081) b!34713))

(assert (= (and b!34713 res!21084) b!34716))

(assert (= (and b!34717 condMapEmpty!1927) mapIsEmpty!1927))

(assert (= (and b!34717 (not condMapEmpty!1927)) mapNonEmpty!1927))

(get-info :version)

(assert (= (and mapNonEmpty!1927 ((_ is ValueCellFull!594) mapValue!1927)) b!34714))

(assert (= (and b!34717 ((_ is ValueCellFull!594) mapDefault!1927)) b!34715))

(assert (= start!4472 b!34717))

(declare-fun m!27967 () Bool)

(assert (=> b!34719 m!27967))

(declare-fun m!27969 () Bool)

(assert (=> b!34716 m!27969))

(declare-fun m!27971 () Bool)

(assert (=> b!34711 m!27971))

(declare-fun m!27973 () Bool)

(assert (=> mapNonEmpty!1927 m!27973))

(declare-fun m!27975 () Bool)

(assert (=> b!34713 m!27975))

(declare-fun m!27977 () Bool)

(assert (=> b!34720 m!27977))

(declare-fun m!27979 () Bool)

(assert (=> b!34718 m!27979))

(assert (=> b!34718 m!27979))

(declare-fun m!27981 () Bool)

(assert (=> b!34718 m!27981))

(declare-fun m!27983 () Bool)

(assert (=> start!4472 m!27983))

(declare-fun m!27985 () Bool)

(assert (=> start!4472 m!27985))

(declare-fun m!27987 () Bool)

(assert (=> start!4472 m!27987))

(check-sat (not b!34713) (not b!34719) (not b!34716) (not b_next!1233) (not start!4472) b_and!2055 tp_is_empty!1587 (not b!34720) (not mapNonEmpty!1927) (not b!34711) (not b!34718))
(check-sat b_and!2055 (not b_next!1233))
