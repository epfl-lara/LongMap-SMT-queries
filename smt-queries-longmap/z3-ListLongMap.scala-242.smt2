; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4136 () Bool)

(assert start!4136)

(declare-fun b_free!1041 () Bool)

(declare-fun b_next!1041 () Bool)

(assert (=> start!4136 (= b_free!1041 (not b_next!1041))))

(declare-fun tp!4542 () Bool)

(declare-fun b_and!1851 () Bool)

(assert (=> start!4136 (= tp!4542 b_and!1851)))

(declare-fun b!31032 () Bool)

(declare-fun res!18770 () Bool)

(declare-fun e!19870 () Bool)

(assert (=> b!31032 (=> (not res!18770) (not e!19870))))

(declare-datatypes ((array!2013 0))(
  ( (array!2014 (arr!960 (Array (_ BitVec 32) (_ BitVec 64))) (size!1061 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2013)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2013 (_ BitVec 32)) Bool)

(assert (=> b!31032 (= res!18770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31033 () Bool)

(declare-fun e!19873 () Bool)

(declare-fun e!19874 () Bool)

(declare-fun mapRes!1621 () Bool)

(assert (=> b!31033 (= e!19873 (and e!19874 mapRes!1621))))

(declare-fun condMapEmpty!1621 () Bool)

(declare-datatypes ((V!1685 0))(
  ( (V!1686 (val!724 Int)) )
))
(declare-datatypes ((ValueCell!498 0))(
  ( (ValueCellFull!498 (v!1813 V!1685)) (EmptyCell!498) )
))
(declare-datatypes ((array!2015 0))(
  ( (array!2016 (arr!961 (Array (_ BitVec 32) ValueCell!498)) (size!1062 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2015)

(declare-fun mapDefault!1621 () ValueCell!498)

(assert (=> b!31033 (= condMapEmpty!1621 (= (arr!961 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!498)) mapDefault!1621)))))

(declare-fun mapNonEmpty!1621 () Bool)

(declare-fun tp!4543 () Bool)

(declare-fun e!19871 () Bool)

(assert (=> mapNonEmpty!1621 (= mapRes!1621 (and tp!4543 e!19871))))

(declare-fun mapKey!1621 () (_ BitVec 32))

(declare-fun mapRest!1621 () (Array (_ BitVec 32) ValueCell!498))

(declare-fun mapValue!1621 () ValueCell!498)

(assert (=> mapNonEmpty!1621 (= (arr!961 _values!1501) (store mapRest!1621 mapKey!1621 mapValue!1621))))

(declare-fun b!31034 () Bool)

(declare-fun tp_is_empty!1395 () Bool)

(assert (=> b!31034 (= e!19871 tp_is_empty!1395)))

(declare-fun b!31036 () Bool)

(declare-fun res!18769 () Bool)

(assert (=> b!31036 (=> (not res!18769) (not e!19870))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31036 (= res!18769 (validKeyInArray!0 k0!1304))))

(declare-fun b!31037 () Bool)

(assert (=> b!31037 (= e!19870 false)))

(declare-datatypes ((SeekEntryResult!116 0))(
  ( (MissingZero!116 (index!2586 (_ BitVec 32))) (Found!116 (index!2587 (_ BitVec 32))) (Intermediate!116 (undefined!928 Bool) (index!2588 (_ BitVec 32)) (x!6594 (_ BitVec 32))) (Undefined!116) (MissingVacant!116 (index!2589 (_ BitVec 32))) )
))
(declare-fun lt!11531 () SeekEntryResult!116)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2013 (_ BitVec 32)) SeekEntryResult!116)

(assert (=> b!31037 (= lt!11531 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!31038 () Bool)

(assert (=> b!31038 (= e!19874 tp_is_empty!1395)))

(declare-fun b!31039 () Bool)

(declare-fun res!18768 () Bool)

(assert (=> b!31039 (=> (not res!18768) (not e!19870))))

(declare-fun arrayContainsKey!0 (array!2013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31039 (= res!18768 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31040 () Bool)

(declare-fun res!18771 () Bool)

(assert (=> b!31040 (=> (not res!18771) (not e!19870))))

(declare-datatypes ((List!781 0))(
  ( (Nil!778) (Cons!777 (h!1344 (_ BitVec 64)) (t!3474 List!781)) )
))
(declare-fun arrayNoDuplicates!0 (array!2013 (_ BitVec 32) List!781) Bool)

(assert (=> b!31040 (= res!18771 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!778))))

(declare-fun b!31041 () Bool)

(declare-fun res!18765 () Bool)

(assert (=> b!31041 (=> (not res!18765) (not e!19870))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1685)

(declare-fun minValue!1443 () V!1685)

(declare-datatypes ((tuple2!1188 0))(
  ( (tuple2!1189 (_1!605 (_ BitVec 64)) (_2!605 V!1685)) )
))
(declare-datatypes ((List!782 0))(
  ( (Nil!779) (Cons!778 (h!1345 tuple2!1188) (t!3475 List!782)) )
))
(declare-datatypes ((ListLongMap!765 0))(
  ( (ListLongMap!766 (toList!398 List!782)) )
))
(declare-fun contains!338 (ListLongMap!765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!226 (array!2013 array!2015 (_ BitVec 32) (_ BitVec 32) V!1685 V!1685 (_ BitVec 32) Int) ListLongMap!765)

(assert (=> b!31041 (= res!18765 (not (contains!338 (getCurrentListMap!226 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1621 () Bool)

(assert (=> mapIsEmpty!1621 mapRes!1621))

(declare-fun b!31035 () Bool)

(declare-fun res!18766 () Bool)

(assert (=> b!31035 (=> (not res!18766) (not e!19870))))

(assert (=> b!31035 (= res!18766 (and (= (size!1062 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1061 _keys!1833) (size!1062 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!18767 () Bool)

(assert (=> start!4136 (=> (not res!18767) (not e!19870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4136 (= res!18767 (validMask!0 mask!2294))))

(assert (=> start!4136 e!19870))

(assert (=> start!4136 true))

(assert (=> start!4136 tp!4542))

(declare-fun array_inv!671 (array!2015) Bool)

(assert (=> start!4136 (and (array_inv!671 _values!1501) e!19873)))

(declare-fun array_inv!672 (array!2013) Bool)

(assert (=> start!4136 (array_inv!672 _keys!1833)))

(assert (=> start!4136 tp_is_empty!1395))

(assert (= (and start!4136 res!18767) b!31035))

(assert (= (and b!31035 res!18766) b!31032))

(assert (= (and b!31032 res!18770) b!31040))

(assert (= (and b!31040 res!18771) b!31036))

(assert (= (and b!31036 res!18769) b!31041))

(assert (= (and b!31041 res!18765) b!31039))

(assert (= (and b!31039 res!18768) b!31037))

(assert (= (and b!31033 condMapEmpty!1621) mapIsEmpty!1621))

(assert (= (and b!31033 (not condMapEmpty!1621)) mapNonEmpty!1621))

(get-info :version)

(assert (= (and mapNonEmpty!1621 ((_ is ValueCellFull!498) mapValue!1621)) b!31034))

(assert (= (and b!31033 ((_ is ValueCellFull!498) mapDefault!1621)) b!31038))

(assert (= start!4136 b!31033))

(declare-fun m!24923 () Bool)

(assert (=> b!31032 m!24923))

(declare-fun m!24925 () Bool)

(assert (=> mapNonEmpty!1621 m!24925))

(declare-fun m!24927 () Bool)

(assert (=> b!31041 m!24927))

(assert (=> b!31041 m!24927))

(declare-fun m!24929 () Bool)

(assert (=> b!31041 m!24929))

(declare-fun m!24931 () Bool)

(assert (=> b!31040 m!24931))

(declare-fun m!24933 () Bool)

(assert (=> b!31037 m!24933))

(declare-fun m!24935 () Bool)

(assert (=> start!4136 m!24935))

(declare-fun m!24937 () Bool)

(assert (=> start!4136 m!24937))

(declare-fun m!24939 () Bool)

(assert (=> start!4136 m!24939))

(declare-fun m!24941 () Bool)

(assert (=> b!31039 m!24941))

(declare-fun m!24943 () Bool)

(assert (=> b!31036 m!24943))

(check-sat (not b_next!1041) (not b!31032) (not mapNonEmpty!1621) b_and!1851 (not b!31037) (not b!31040) tp_is_empty!1395 (not b!31036) (not b!31039) (not start!4136) (not b!31041))
(check-sat b_and!1851 (not b_next!1041))
