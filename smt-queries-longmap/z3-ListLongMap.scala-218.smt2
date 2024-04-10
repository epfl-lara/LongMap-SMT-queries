; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3992 () Bool)

(assert start!3992)

(declare-fun b_free!897 () Bool)

(declare-fun b_next!897 () Bool)

(assert (=> start!3992 (= b_free!897 (not b_next!897))))

(declare-fun tp!4111 () Bool)

(declare-fun b_and!1707 () Bool)

(assert (=> start!3992 (= tp!4111 b_and!1707)))

(declare-fun b!28881 () Bool)

(declare-fun e!18672 () Bool)

(declare-fun e!18674 () Bool)

(assert (=> b!28881 (= e!18672 e!18674)))

(declare-fun res!17268 () Bool)

(assert (=> b!28881 (=> (not res!17268) (not e!18674))))

(declare-datatypes ((V!1493 0))(
  ( (V!1494 (val!652 Int)) )
))
(declare-datatypes ((tuple2!1082 0))(
  ( (tuple2!1083 (_1!552 (_ BitVec 64)) (_2!552 V!1493)) )
))
(declare-datatypes ((List!682 0))(
  ( (Nil!679) (Cons!678 (h!1245 tuple2!1082) (t!3375 List!682)) )
))
(declare-datatypes ((ListLongMap!659 0))(
  ( (ListLongMap!660 (toList!345 List!682)) )
))
(declare-fun lt!10975 () ListLongMap!659)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!285 (ListLongMap!659 (_ BitVec 64)) Bool)

(assert (=> b!28881 (= res!17268 (not (contains!285 lt!10975 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!426 0))(
  ( (ValueCellFull!426 (v!1741 V!1493)) (EmptyCell!426) )
))
(declare-datatypes ((array!1737 0))(
  ( (array!1738 (arr!822 (Array (_ BitVec 32) ValueCell!426)) (size!923 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1737)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1739 0))(
  ( (array!1740 (arr!823 (Array (_ BitVec 32) (_ BitVec 64))) (size!924 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1739)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1493)

(declare-fun minValue!1443 () V!1493)

(declare-fun getCurrentListMap!175 (array!1739 array!1737 (_ BitVec 32) (_ BitVec 32) V!1493 V!1493 (_ BitVec 32) Int) ListLongMap!659)

(assert (=> b!28881 (= lt!10975 (getCurrentListMap!175 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1405 () Bool)

(declare-fun mapRes!1405 () Bool)

(assert (=> mapIsEmpty!1405 mapRes!1405))

(declare-fun b!28883 () Bool)

(declare-fun res!17262 () Bool)

(assert (=> b!28883 (=> (not res!17262) (not e!18672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1739 (_ BitVec 32)) Bool)

(assert (=> b!28883 (= res!17262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28884 () Bool)

(declare-fun res!17264 () Bool)

(assert (=> b!28884 (=> (not res!17264) (not e!18672))))

(declare-datatypes ((List!683 0))(
  ( (Nil!680) (Cons!679 (h!1246 (_ BitVec 64)) (t!3376 List!683)) )
))
(declare-fun arrayNoDuplicates!0 (array!1739 (_ BitVec 32) List!683) Bool)

(assert (=> b!28884 (= res!17264 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!680))))

(declare-fun b!28885 () Bool)

(declare-fun e!18669 () Bool)

(declare-fun tp_is_empty!1251 () Bool)

(assert (=> b!28885 (= e!18669 tp_is_empty!1251)))

(declare-fun mapNonEmpty!1405 () Bool)

(declare-fun tp!4110 () Bool)

(declare-fun e!18670 () Bool)

(assert (=> mapNonEmpty!1405 (= mapRes!1405 (and tp!4110 e!18670))))

(declare-fun mapKey!1405 () (_ BitVec 32))

(declare-fun mapRest!1405 () (Array (_ BitVec 32) ValueCell!426))

(declare-fun mapValue!1405 () ValueCell!426)

(assert (=> mapNonEmpty!1405 (= (arr!822 _values!1501) (store mapRest!1405 mapKey!1405 mapValue!1405))))

(declare-fun res!17263 () Bool)

(assert (=> start!3992 (=> (not res!17263) (not e!18672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3992 (= res!17263 (validMask!0 mask!2294))))

(assert (=> start!3992 e!18672))

(assert (=> start!3992 true))

(assert (=> start!3992 tp!4111))

(declare-fun e!18671 () Bool)

(declare-fun array_inv!567 (array!1737) Bool)

(assert (=> start!3992 (and (array_inv!567 _values!1501) e!18671)))

(declare-fun array_inv!568 (array!1739) Bool)

(assert (=> start!3992 (array_inv!568 _keys!1833)))

(assert (=> start!3992 tp_is_empty!1251))

(declare-fun b!28882 () Bool)

(assert (=> b!28882 (= e!18670 tp_is_empty!1251)))

(declare-fun b!28886 () Bool)

(declare-fun res!17265 () Bool)

(assert (=> b!28886 (=> (not res!17265) (not e!18672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28886 (= res!17265 (validKeyInArray!0 k0!1304))))

(declare-fun b!28887 () Bool)

(assert (=> b!28887 (= e!18674 (not true))))

(declare-datatypes ((SeekEntryResult!74 0))(
  ( (MissingZero!74 (index!2418 (_ BitVec 32))) (Found!74 (index!2419 (_ BitVec 32))) (Intermediate!74 (undefined!886 Bool) (index!2420 (_ BitVec 32)) (x!6360 (_ BitVec 32))) (Undefined!74) (MissingVacant!74 (index!2421 (_ BitVec 32))) )
))
(declare-fun lt!10977 () SeekEntryResult!74)

(declare-fun lt!10976 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28887 (and ((_ is Found!74) lt!10977) (= (index!2419 lt!10977) lt!10976))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1739 (_ BitVec 32)) SeekEntryResult!74)

(assert (=> b!28887 (= lt!10977 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!655 0))(
  ( (Unit!656) )
))
(declare-fun lt!10978 () Unit!655)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1739 (_ BitVec 32)) Unit!655)

(assert (=> b!28887 (= lt!10978 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!10976 _keys!1833 mask!2294))))

(assert (=> b!28887 (contains!285 lt!10975 (select (arr!823 _keys!1833) lt!10976))))

(declare-fun lt!10979 () Unit!655)

(declare-fun lemmaValidKeyInArrayIsInListMap!21 (array!1739 array!1737 (_ BitVec 32) (_ BitVec 32) V!1493 V!1493 (_ BitVec 32) Int) Unit!655)

(assert (=> b!28887 (= lt!10979 (lemmaValidKeyInArrayIsInListMap!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10976 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1739 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28887 (= lt!10976 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28888 () Bool)

(declare-fun res!17267 () Bool)

(assert (=> b!28888 (=> (not res!17267) (not e!18672))))

(assert (=> b!28888 (= res!17267 (and (= (size!923 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!924 _keys!1833) (size!923 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28889 () Bool)

(assert (=> b!28889 (= e!18671 (and e!18669 mapRes!1405))))

(declare-fun condMapEmpty!1405 () Bool)

(declare-fun mapDefault!1405 () ValueCell!426)

(assert (=> b!28889 (= condMapEmpty!1405 (= (arr!822 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!426)) mapDefault!1405)))))

(declare-fun b!28890 () Bool)

(declare-fun res!17266 () Bool)

(assert (=> b!28890 (=> (not res!17266) (not e!18674))))

(declare-fun arrayContainsKey!0 (array!1739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28890 (= res!17266 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3992 res!17263) b!28888))

(assert (= (and b!28888 res!17267) b!28883))

(assert (= (and b!28883 res!17262) b!28884))

(assert (= (and b!28884 res!17264) b!28886))

(assert (= (and b!28886 res!17265) b!28881))

(assert (= (and b!28881 res!17268) b!28890))

(assert (= (and b!28890 res!17266) b!28887))

(assert (= (and b!28889 condMapEmpty!1405) mapIsEmpty!1405))

(assert (= (and b!28889 (not condMapEmpty!1405)) mapNonEmpty!1405))

(assert (= (and mapNonEmpty!1405 ((_ is ValueCellFull!426) mapValue!1405)) b!28882))

(assert (= (and b!28889 ((_ is ValueCellFull!426) mapDefault!1405)) b!28885))

(assert (= start!3992 b!28889))

(declare-fun m!23049 () Bool)

(assert (=> b!28881 m!23049))

(declare-fun m!23051 () Bool)

(assert (=> b!28881 m!23051))

(declare-fun m!23053 () Bool)

(assert (=> mapNonEmpty!1405 m!23053))

(declare-fun m!23055 () Bool)

(assert (=> b!28883 m!23055))

(declare-fun m!23057 () Bool)

(assert (=> b!28890 m!23057))

(declare-fun m!23059 () Bool)

(assert (=> b!28884 m!23059))

(declare-fun m!23061 () Bool)

(assert (=> b!28886 m!23061))

(declare-fun m!23063 () Bool)

(assert (=> start!3992 m!23063))

(declare-fun m!23065 () Bool)

(assert (=> start!3992 m!23065))

(declare-fun m!23067 () Bool)

(assert (=> start!3992 m!23067))

(declare-fun m!23069 () Bool)

(assert (=> b!28887 m!23069))

(declare-fun m!23071 () Bool)

(assert (=> b!28887 m!23071))

(assert (=> b!28887 m!23069))

(declare-fun m!23073 () Bool)

(assert (=> b!28887 m!23073))

(declare-fun m!23075 () Bool)

(assert (=> b!28887 m!23075))

(declare-fun m!23077 () Bool)

(assert (=> b!28887 m!23077))

(declare-fun m!23079 () Bool)

(assert (=> b!28887 m!23079))

(check-sat (not b!28886) (not b!28890) (not b_next!897) tp_is_empty!1251 (not b!28884) (not mapNonEmpty!1405) (not start!3992) (not b!28881) (not b!28887) (not b!28883) b_and!1707)
(check-sat b_and!1707 (not b_next!897))
