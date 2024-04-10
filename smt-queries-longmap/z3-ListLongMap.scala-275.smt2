; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4478 () Bool)

(assert start!4478)

(declare-fun b_free!1239 () Bool)

(declare-fun b_next!1239 () Bool)

(assert (=> start!4478 (= b_free!1239 (not b_next!1239))))

(declare-fun tp!5155 () Bool)

(declare-fun b_and!2061 () Bool)

(assert (=> start!4478 (= tp!5155 b_and!2061)))

(declare-fun res!21145 () Bool)

(declare-fun e!22027 () Bool)

(assert (=> start!4478 (=> (not res!21145) (not e!22027))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4478 (= res!21145 (validMask!0 mask!2294))))

(assert (=> start!4478 e!22027))

(assert (=> start!4478 true))

(assert (=> start!4478 tp!5155))

(declare-datatypes ((V!1949 0))(
  ( (V!1950 (val!823 Int)) )
))
(declare-datatypes ((ValueCell!597 0))(
  ( (ValueCellFull!597 (v!1918 V!1949)) (EmptyCell!597) )
))
(declare-datatypes ((array!2399 0))(
  ( (array!2400 (arr!1147 (Array (_ BitVec 32) ValueCell!597)) (size!1248 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2399)

(declare-fun e!22030 () Bool)

(declare-fun array_inv!811 (array!2399) Bool)

(assert (=> start!4478 (and (array_inv!811 _values!1501) e!22030)))

(declare-datatypes ((array!2401 0))(
  ( (array!2402 (arr!1148 (Array (_ BitVec 32) (_ BitVec 64))) (size!1249 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2401)

(declare-fun array_inv!812 (array!2401) Bool)

(assert (=> start!4478 (array_inv!812 _keys!1833)))

(declare-fun tp_is_empty!1593 () Bool)

(assert (=> start!4478 tp_is_empty!1593))

(declare-fun b!34801 () Bool)

(declare-fun res!21146 () Bool)

(assert (=> b!34801 (=> (not res!21146) (not e!22027))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34801 (= res!21146 (validKeyInArray!0 k0!1304))))

(declare-fun b!34802 () Bool)

(declare-fun e!22028 () Bool)

(assert (=> b!34802 (= e!22028 tp_is_empty!1593)))

(declare-fun mapNonEmpty!1936 () Bool)

(declare-fun mapRes!1936 () Bool)

(declare-fun tp!5154 () Bool)

(declare-fun e!22029 () Bool)

(assert (=> mapNonEmpty!1936 (= mapRes!1936 (and tp!5154 e!22029))))

(declare-fun mapRest!1936 () (Array (_ BitVec 32) ValueCell!597))

(declare-fun mapKey!1936 () (_ BitVec 32))

(declare-fun mapValue!1936 () ValueCell!597)

(assert (=> mapNonEmpty!1936 (= (arr!1147 _values!1501) (store mapRest!1936 mapKey!1936 mapValue!1936))))

(declare-fun b!34803 () Bool)

(assert (=> b!34803 (= e!22027 false)))

(declare-datatypes ((SeekEntryResult!151 0))(
  ( (MissingZero!151 (index!2726 (_ BitVec 32))) (Found!151 (index!2727 (_ BitVec 32))) (Intermediate!151 (undefined!963 Bool) (index!2728 (_ BitVec 32)) (x!6953 (_ BitVec 32))) (Undefined!151) (MissingVacant!151 (index!2729 (_ BitVec 32))) )
))
(declare-fun lt!12816 () SeekEntryResult!151)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2401 (_ BitVec 32)) SeekEntryResult!151)

(assert (=> b!34803 (= lt!12816 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34804 () Bool)

(assert (=> b!34804 (= e!22030 (and e!22028 mapRes!1936))))

(declare-fun condMapEmpty!1936 () Bool)

(declare-fun mapDefault!1936 () ValueCell!597)

(assert (=> b!34804 (= condMapEmpty!1936 (= (arr!1147 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!597)) mapDefault!1936)))))

(declare-fun b!34805 () Bool)

(declare-fun res!21147 () Bool)

(assert (=> b!34805 (=> (not res!21147) (not e!22027))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1949)

(declare-fun minValue!1443 () V!1949)

(declare-datatypes ((tuple2!1332 0))(
  ( (tuple2!1333 (_1!677 (_ BitVec 64)) (_2!677 V!1949)) )
))
(declare-datatypes ((List!921 0))(
  ( (Nil!918) (Cons!917 (h!1484 tuple2!1332) (t!3626 List!921)) )
))
(declare-datatypes ((ListLongMap!909 0))(
  ( (ListLongMap!910 (toList!470 List!921)) )
))
(declare-fun contains!416 (ListLongMap!909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!294 (array!2401 array!2399 (_ BitVec 32) (_ BitVec 32) V!1949 V!1949 (_ BitVec 32) Int) ListLongMap!909)

(assert (=> b!34805 (= res!21147 (not (contains!416 (getCurrentListMap!294 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34806 () Bool)

(assert (=> b!34806 (= e!22029 tp_is_empty!1593)))

(declare-fun b!34807 () Bool)

(declare-fun res!21141 () Bool)

(assert (=> b!34807 (=> (not res!21141) (not e!22027))))

(declare-fun arrayContainsKey!0 (array!2401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34807 (= res!21141 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34808 () Bool)

(declare-fun res!21144 () Bool)

(assert (=> b!34808 (=> (not res!21144) (not e!22027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2401 (_ BitVec 32)) Bool)

(assert (=> b!34808 (= res!21144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34809 () Bool)

(declare-fun res!21142 () Bool)

(assert (=> b!34809 (=> (not res!21142) (not e!22027))))

(declare-datatypes ((List!922 0))(
  ( (Nil!919) (Cons!918 (h!1485 (_ BitVec 64)) (t!3627 List!922)) )
))
(declare-fun arrayNoDuplicates!0 (array!2401 (_ BitVec 32) List!922) Bool)

(assert (=> b!34809 (= res!21142 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!919))))

(declare-fun b!34810 () Bool)

(declare-fun res!21143 () Bool)

(assert (=> b!34810 (=> (not res!21143) (not e!22027))))

(assert (=> b!34810 (= res!21143 (and (= (size!1248 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1249 _keys!1833) (size!1248 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1936 () Bool)

(assert (=> mapIsEmpty!1936 mapRes!1936))

(assert (= (and start!4478 res!21145) b!34810))

(assert (= (and b!34810 res!21143) b!34808))

(assert (= (and b!34808 res!21144) b!34809))

(assert (= (and b!34809 res!21142) b!34801))

(assert (= (and b!34801 res!21146) b!34805))

(assert (= (and b!34805 res!21147) b!34807))

(assert (= (and b!34807 res!21141) b!34803))

(assert (= (and b!34804 condMapEmpty!1936) mapIsEmpty!1936))

(assert (= (and b!34804 (not condMapEmpty!1936)) mapNonEmpty!1936))

(get-info :version)

(assert (= (and mapNonEmpty!1936 ((_ is ValueCellFull!597) mapValue!1936)) b!34806))

(assert (= (and b!34804 ((_ is ValueCellFull!597) mapDefault!1936)) b!34802))

(assert (= start!4478 b!34804))

(declare-fun m!28033 () Bool)

(assert (=> b!34809 m!28033))

(declare-fun m!28035 () Bool)

(assert (=> b!34805 m!28035))

(assert (=> b!34805 m!28035))

(declare-fun m!28037 () Bool)

(assert (=> b!34805 m!28037))

(declare-fun m!28039 () Bool)

(assert (=> b!34808 m!28039))

(declare-fun m!28041 () Bool)

(assert (=> b!34803 m!28041))

(declare-fun m!28043 () Bool)

(assert (=> b!34807 m!28043))

(declare-fun m!28045 () Bool)

(assert (=> start!4478 m!28045))

(declare-fun m!28047 () Bool)

(assert (=> start!4478 m!28047))

(declare-fun m!28049 () Bool)

(assert (=> start!4478 m!28049))

(declare-fun m!28051 () Bool)

(assert (=> b!34801 m!28051))

(declare-fun m!28053 () Bool)

(assert (=> mapNonEmpty!1936 m!28053))

(check-sat (not b!34809) (not start!4478) (not b!34801) (not b!34803) (not b!34808) b_and!2061 (not mapNonEmpty!1936) (not b_next!1239) tp_is_empty!1593 (not b!34805) (not b!34807))
(check-sat b_and!2061 (not b_next!1239))
