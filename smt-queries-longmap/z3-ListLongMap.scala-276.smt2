; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4472 () Bool)

(assert start!4472)

(declare-fun b_free!1243 () Bool)

(declare-fun b_next!1243 () Bool)

(assert (=> start!4472 (= b_free!1243 (not b_next!1243))))

(declare-fun tp!5167 () Bool)

(declare-fun b_and!2059 () Bool)

(assert (=> start!4472 (= tp!5167 b_and!2059)))

(declare-fun b!34807 () Bool)

(declare-fun res!21152 () Bool)

(declare-fun e!22017 () Bool)

(assert (=> b!34807 (=> (not res!21152) (not e!22017))))

(declare-datatypes ((array!2381 0))(
  ( (array!2382 (arr!1138 (Array (_ BitVec 32) (_ BitVec 64))) (size!1239 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2381)

(declare-datatypes ((List!912 0))(
  ( (Nil!909) (Cons!908 (h!1475 (_ BitVec 64)) (t!3610 List!912)) )
))
(declare-fun arrayNoDuplicates!0 (array!2381 (_ BitVec 32) List!912) Bool)

(assert (=> b!34807 (= res!21152 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!909))))

(declare-fun res!21157 () Bool)

(assert (=> start!4472 (=> (not res!21157) (not e!22017))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4472 (= res!21157 (validMask!0 mask!2294))))

(assert (=> start!4472 e!22017))

(assert (=> start!4472 true))

(assert (=> start!4472 tp!5167))

(declare-datatypes ((V!1955 0))(
  ( (V!1956 (val!825 Int)) )
))
(declare-datatypes ((ValueCell!599 0))(
  ( (ValueCellFull!599 (v!1919 V!1955)) (EmptyCell!599) )
))
(declare-datatypes ((array!2383 0))(
  ( (array!2384 (arr!1139 (Array (_ BitVec 32) ValueCell!599)) (size!1240 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2383)

(declare-fun e!22015 () Bool)

(declare-fun array_inv!803 (array!2383) Bool)

(assert (=> start!4472 (and (array_inv!803 _values!1501) e!22015)))

(declare-fun array_inv!804 (array!2381) Bool)

(assert (=> start!4472 (array_inv!804 _keys!1833)))

(declare-fun tp_is_empty!1597 () Bool)

(assert (=> start!4472 tp_is_empty!1597))

(declare-fun b!34808 () Bool)

(declare-fun res!21155 () Bool)

(assert (=> b!34808 (=> (not res!21155) (not e!22017))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34808 (= res!21155 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1942 () Bool)

(declare-fun mapRes!1942 () Bool)

(declare-fun tp!5166 () Bool)

(declare-fun e!22016 () Bool)

(assert (=> mapNonEmpty!1942 (= mapRes!1942 (and tp!5166 e!22016))))

(declare-fun mapRest!1942 () (Array (_ BitVec 32) ValueCell!599))

(declare-fun mapValue!1942 () ValueCell!599)

(declare-fun mapKey!1942 () (_ BitVec 32))

(assert (=> mapNonEmpty!1942 (= (arr!1139 _values!1501) (store mapRest!1942 mapKey!1942 mapValue!1942))))

(declare-fun b!34809 () Bool)

(declare-fun res!21154 () Bool)

(assert (=> b!34809 (=> (not res!21154) (not e!22017))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34809 (= res!21154 (and (= (size!1240 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1239 _keys!1833) (size!1240 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34810 () Bool)

(declare-fun res!21153 () Bool)

(assert (=> b!34810 (=> (not res!21153) (not e!22017))))

(declare-fun arrayContainsKey!0 (array!2381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34810 (= res!21153 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34811 () Bool)

(declare-fun e!22013 () Bool)

(assert (=> b!34811 (= e!22015 (and e!22013 mapRes!1942))))

(declare-fun condMapEmpty!1942 () Bool)

(declare-fun mapDefault!1942 () ValueCell!599)

(assert (=> b!34811 (= condMapEmpty!1942 (= (arr!1139 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!599)) mapDefault!1942)))))

(declare-fun mapIsEmpty!1942 () Bool)

(assert (=> mapIsEmpty!1942 mapRes!1942))

(declare-fun b!34812 () Bool)

(declare-fun res!21156 () Bool)

(assert (=> b!34812 (=> (not res!21156) (not e!22017))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1955)

(declare-fun minValue!1443 () V!1955)

(declare-datatypes ((tuple2!1330 0))(
  ( (tuple2!1331 (_1!676 (_ BitVec 64)) (_2!676 V!1955)) )
))
(declare-datatypes ((List!913 0))(
  ( (Nil!910) (Cons!909 (h!1476 tuple2!1330) (t!3611 List!913)) )
))
(declare-datatypes ((ListLongMap!895 0))(
  ( (ListLongMap!896 (toList!463 List!913)) )
))
(declare-fun contains!410 (ListLongMap!895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!282 (array!2381 array!2383 (_ BitVec 32) (_ BitVec 32) V!1955 V!1955 (_ BitVec 32) Int) ListLongMap!895)

(assert (=> b!34812 (= res!21156 (not (contains!410 (getCurrentListMap!282 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34813 () Bool)

(declare-fun res!21151 () Bool)

(assert (=> b!34813 (=> (not res!21151) (not e!22017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2381 (_ BitVec 32)) Bool)

(assert (=> b!34813 (= res!21151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34814 () Bool)

(assert (=> b!34814 (= e!22013 tp_is_empty!1597)))

(declare-fun b!34815 () Bool)

(assert (=> b!34815 (= e!22016 tp_is_empty!1597)))

(declare-fun b!34816 () Bool)

(assert (=> b!34816 (= e!22017 false)))

(declare-datatypes ((SeekEntryResult!157 0))(
  ( (MissingZero!157 (index!2750 (_ BitVec 32))) (Found!157 (index!2751 (_ BitVec 32))) (Intermediate!157 (undefined!969 Bool) (index!2752 (_ BitVec 32)) (x!6967 (_ BitVec 32))) (Undefined!157) (MissingVacant!157 (index!2753 (_ BitVec 32))) )
))
(declare-fun lt!12818 () SeekEntryResult!157)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2381 (_ BitVec 32)) SeekEntryResult!157)

(assert (=> b!34816 (= lt!12818 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(assert (= (and start!4472 res!21157) b!34809))

(assert (= (and b!34809 res!21154) b!34813))

(assert (= (and b!34813 res!21151) b!34807))

(assert (= (and b!34807 res!21152) b!34808))

(assert (= (and b!34808 res!21155) b!34812))

(assert (= (and b!34812 res!21156) b!34810))

(assert (= (and b!34810 res!21153) b!34816))

(assert (= (and b!34811 condMapEmpty!1942) mapIsEmpty!1942))

(assert (= (and b!34811 (not condMapEmpty!1942)) mapNonEmpty!1942))

(get-info :version)

(assert (= (and mapNonEmpty!1942 ((_ is ValueCellFull!599) mapValue!1942)) b!34815))

(assert (= (and b!34811 ((_ is ValueCellFull!599) mapDefault!1942)) b!34814))

(assert (= start!4472 b!34811))

(declare-fun m!28007 () Bool)

(assert (=> b!34816 m!28007))

(declare-fun m!28009 () Bool)

(assert (=> b!34808 m!28009))

(declare-fun m!28011 () Bool)

(assert (=> b!34813 m!28011))

(declare-fun m!28013 () Bool)

(assert (=> b!34807 m!28013))

(declare-fun m!28015 () Bool)

(assert (=> mapNonEmpty!1942 m!28015))

(declare-fun m!28017 () Bool)

(assert (=> start!4472 m!28017))

(declare-fun m!28019 () Bool)

(assert (=> start!4472 m!28019))

(declare-fun m!28021 () Bool)

(assert (=> start!4472 m!28021))

(declare-fun m!28023 () Bool)

(assert (=> b!34812 m!28023))

(assert (=> b!34812 m!28023))

(declare-fun m!28025 () Bool)

(assert (=> b!34812 m!28025))

(declare-fun m!28027 () Bool)

(assert (=> b!34810 m!28027))

(check-sat (not start!4472) (not b!34807) (not b_next!1243) (not mapNonEmpty!1942) (not b!34808) b_and!2059 (not b!34810) (not b!34812) (not b!34813) tp_is_empty!1597 (not b!34816))
(check-sat b_and!2059 (not b_next!1243))
