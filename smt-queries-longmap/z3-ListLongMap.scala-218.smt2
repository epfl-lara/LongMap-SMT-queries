; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3986 () Bool)

(assert start!3986)

(declare-fun b_free!895 () Bool)

(declare-fun b_next!895 () Bool)

(assert (=> start!3986 (= b_free!895 (not b_next!895))))

(declare-fun tp!4105 () Bool)

(declare-fun b_and!1695 () Bool)

(assert (=> start!3986 (= tp!4105 b_and!1695)))

(declare-fun b!28779 () Bool)

(declare-fun e!18600 () Bool)

(declare-fun e!18602 () Bool)

(declare-fun mapRes!1402 () Bool)

(assert (=> b!28779 (= e!18600 (and e!18602 mapRes!1402))))

(declare-fun condMapEmpty!1402 () Bool)

(declare-datatypes ((V!1491 0))(
  ( (V!1492 (val!651 Int)) )
))
(declare-datatypes ((ValueCell!425 0))(
  ( (ValueCellFull!425 (v!1740 V!1491)) (EmptyCell!425) )
))
(declare-datatypes ((array!1713 0))(
  ( (array!1714 (arr!810 (Array (_ BitVec 32) ValueCell!425)) (size!911 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1713)

(declare-fun mapDefault!1402 () ValueCell!425)

(assert (=> b!28779 (= condMapEmpty!1402 (= (arr!810 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!425)) mapDefault!1402)))))

(declare-fun b!28780 () Bool)

(declare-fun res!17202 () Bool)

(declare-fun e!18604 () Bool)

(assert (=> b!28780 (=> (not res!17202) (not e!18604))))

(declare-datatypes ((array!1715 0))(
  ( (array!1716 (arr!811 (Array (_ BitVec 32) (_ BitVec 64))) (size!912 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1715)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1715 (_ BitVec 32)) Bool)

(assert (=> b!28780 (= res!17202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28781 () Bool)

(declare-fun res!17204 () Bool)

(assert (=> b!28781 (=> (not res!17204) (not e!18604))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28781 (= res!17204 (validKeyInArray!0 k0!1304))))

(declare-fun b!28782 () Bool)

(declare-fun tp_is_empty!1249 () Bool)

(assert (=> b!28782 (= e!18602 tp_is_empty!1249)))

(declare-fun b!28783 () Bool)

(declare-fun res!17203 () Bool)

(assert (=> b!28783 (=> (not res!17203) (not e!18604))))

(declare-datatypes ((List!669 0))(
  ( (Nil!666) (Cons!665 (h!1232 (_ BitVec 64)) (t!3356 List!669)) )
))
(declare-fun arrayNoDuplicates!0 (array!1715 (_ BitVec 32) List!669) Bool)

(assert (=> b!28783 (= res!17203 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!666))))

(declare-fun b!28784 () Bool)

(declare-fun res!17201 () Bool)

(assert (=> b!28784 (=> (not res!17201) (not e!18604))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28784 (= res!17201 (and (= (size!911 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!912 _keys!1833) (size!911 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28785 () Bool)

(declare-fun res!17207 () Bool)

(declare-fun e!18603 () Bool)

(assert (=> b!28785 (=> (not res!17207) (not e!18603))))

(declare-fun arrayContainsKey!0 (array!1715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28785 (= res!17207 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1402 () Bool)

(declare-fun tp!4104 () Bool)

(declare-fun e!18599 () Bool)

(assert (=> mapNonEmpty!1402 (= mapRes!1402 (and tp!4104 e!18599))))

(declare-fun mapRest!1402 () (Array (_ BitVec 32) ValueCell!425))

(declare-fun mapKey!1402 () (_ BitVec 32))

(declare-fun mapValue!1402 () ValueCell!425)

(assert (=> mapNonEmpty!1402 (= (arr!810 _values!1501) (store mapRest!1402 mapKey!1402 mapValue!1402))))

(declare-fun res!17205 () Bool)

(assert (=> start!3986 (=> (not res!17205) (not e!18604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3986 (= res!17205 (validMask!0 mask!2294))))

(assert (=> start!3986 e!18604))

(assert (=> start!3986 true))

(assert (=> start!3986 tp!4105))

(declare-fun array_inv!561 (array!1713) Bool)

(assert (=> start!3986 (and (array_inv!561 _values!1501) e!18600)))

(declare-fun array_inv!562 (array!1715) Bool)

(assert (=> start!3986 (array_inv!562 _keys!1833)))

(assert (=> start!3986 tp_is_empty!1249))

(declare-fun mapIsEmpty!1402 () Bool)

(assert (=> mapIsEmpty!1402 mapRes!1402))

(declare-fun b!28786 () Bool)

(assert (=> b!28786 (= e!18599 tp_is_empty!1249)))

(declare-fun b!28787 () Bool)

(assert (=> b!28787 (= e!18603 (not true))))

(declare-datatypes ((SeekEntryResult!75 0))(
  ( (MissingZero!75 (index!2422 (_ BitVec 32))) (Found!75 (index!2423 (_ BitVec 32))) (Intermediate!75 (undefined!887 Bool) (index!2424 (_ BitVec 32)) (x!6361 (_ BitVec 32))) (Undefined!75) (MissingVacant!75 (index!2425 (_ BitVec 32))) )
))
(declare-fun lt!10918 () SeekEntryResult!75)

(declare-fun lt!10916 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28787 (and ((_ is Found!75) lt!10918) (= (index!2423 lt!10918) lt!10916))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1715 (_ BitVec 32)) SeekEntryResult!75)

(assert (=> b!28787 (= lt!10918 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!673 0))(
  ( (Unit!674) )
))
(declare-fun lt!10917 () Unit!673)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1715 (_ BitVec 32)) Unit!673)

(assert (=> b!28787 (= lt!10917 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!10916 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1078 0))(
  ( (tuple2!1079 (_1!550 (_ BitVec 64)) (_2!550 V!1491)) )
))
(declare-datatypes ((List!670 0))(
  ( (Nil!667) (Cons!666 (h!1233 tuple2!1078) (t!3357 List!670)) )
))
(declare-datatypes ((ListLongMap!649 0))(
  ( (ListLongMap!650 (toList!340 List!670)) )
))
(declare-fun lt!10919 () ListLongMap!649)

(declare-fun contains!282 (ListLongMap!649 (_ BitVec 64)) Bool)

(assert (=> b!28787 (contains!282 lt!10919 (select (arr!811 _keys!1833) lt!10916))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!10920 () Unit!673)

(declare-fun zeroValue!1443 () V!1491)

(declare-fun minValue!1443 () V!1491)

(declare-fun lemmaValidKeyInArrayIsInListMap!26 (array!1715 array!1713 (_ BitVec 32) (_ BitVec 32) V!1491 V!1491 (_ BitVec 32) Int) Unit!673)

(assert (=> b!28787 (= lt!10920 (lemmaValidKeyInArrayIsInListMap!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10916 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1715 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28787 (= lt!10916 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28788 () Bool)

(assert (=> b!28788 (= e!18604 e!18603)))

(declare-fun res!17206 () Bool)

(assert (=> b!28788 (=> (not res!17206) (not e!18603))))

(assert (=> b!28788 (= res!17206 (not (contains!282 lt!10919 k0!1304)))))

(declare-fun getCurrentListMap!166 (array!1715 array!1713 (_ BitVec 32) (_ BitVec 32) V!1491 V!1491 (_ BitVec 32) Int) ListLongMap!649)

(assert (=> b!28788 (= lt!10919 (getCurrentListMap!166 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(assert (= (and start!3986 res!17205) b!28784))

(assert (= (and b!28784 res!17201) b!28780))

(assert (= (and b!28780 res!17202) b!28783))

(assert (= (and b!28783 res!17203) b!28781))

(assert (= (and b!28781 res!17204) b!28788))

(assert (= (and b!28788 res!17206) b!28785))

(assert (= (and b!28785 res!17207) b!28787))

(assert (= (and b!28779 condMapEmpty!1402) mapIsEmpty!1402))

(assert (= (and b!28779 (not condMapEmpty!1402)) mapNonEmpty!1402))

(assert (= (and mapNonEmpty!1402 ((_ is ValueCellFull!425) mapValue!1402)) b!28786))

(assert (= (and b!28779 ((_ is ValueCellFull!425) mapDefault!1402)) b!28782))

(assert (= start!3986 b!28779))

(declare-fun m!22865 () Bool)

(assert (=> mapNonEmpty!1402 m!22865))

(declare-fun m!22867 () Bool)

(assert (=> b!28783 m!22867))

(declare-fun m!22869 () Bool)

(assert (=> b!28787 m!22869))

(declare-fun m!22871 () Bool)

(assert (=> b!28787 m!22871))

(declare-fun m!22873 () Bool)

(assert (=> b!28787 m!22873))

(declare-fun m!22875 () Bool)

(assert (=> b!28787 m!22875))

(declare-fun m!22877 () Bool)

(assert (=> b!28787 m!22877))

(declare-fun m!22879 () Bool)

(assert (=> b!28787 m!22879))

(assert (=> b!28787 m!22873))

(declare-fun m!22881 () Bool)

(assert (=> start!3986 m!22881))

(declare-fun m!22883 () Bool)

(assert (=> start!3986 m!22883))

(declare-fun m!22885 () Bool)

(assert (=> start!3986 m!22885))

(declare-fun m!22887 () Bool)

(assert (=> b!28788 m!22887))

(declare-fun m!22889 () Bool)

(assert (=> b!28788 m!22889))

(declare-fun m!22891 () Bool)

(assert (=> b!28780 m!22891))

(declare-fun m!22893 () Bool)

(assert (=> b!28785 m!22893))

(declare-fun m!22895 () Bool)

(assert (=> b!28781 m!22895))

(check-sat tp_is_empty!1249 b_and!1695 (not b!28781) (not b!28780) (not b!28785) (not b_next!895) (not b!28788) (not start!3986) (not mapNonEmpty!1402) (not b!28783) (not b!28787))
(check-sat b_and!1695 (not b_next!895))
