; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3986 () Bool)

(assert start!3986)

(declare-fun b_free!901 () Bool)

(declare-fun b_next!901 () Bool)

(assert (=> start!3986 (= b_free!901 (not b_next!901))))

(declare-fun tp!4123 () Bool)

(declare-fun b_and!1705 () Bool)

(assert (=> start!3986 (= tp!4123 b_and!1705)))

(declare-fun b!28887 () Bool)

(declare-fun res!17275 () Bool)

(declare-fun e!18664 () Bool)

(assert (=> b!28887 (=> (not res!17275) (not e!18664))))

(declare-datatypes ((array!1721 0))(
  ( (array!1722 (arr!814 (Array (_ BitVec 32) (_ BitVec 64))) (size!915 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1721)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28887 (= res!17275 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28888 () Bool)

(declare-fun res!17274 () Bool)

(declare-fun e!18667 () Bool)

(assert (=> b!28888 (=> (not res!17274) (not e!18667))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1721 (_ BitVec 32)) Bool)

(assert (=> b!28888 (= res!17274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1411 () Bool)

(declare-fun mapRes!1411 () Bool)

(declare-fun tp!4122 () Bool)

(declare-fun e!18663 () Bool)

(assert (=> mapNonEmpty!1411 (= mapRes!1411 (and tp!4122 e!18663))))

(declare-fun mapKey!1411 () (_ BitVec 32))

(declare-datatypes ((V!1499 0))(
  ( (V!1500 (val!654 Int)) )
))
(declare-datatypes ((ValueCell!428 0))(
  ( (ValueCellFull!428 (v!1742 V!1499)) (EmptyCell!428) )
))
(declare-datatypes ((array!1723 0))(
  ( (array!1724 (arr!815 (Array (_ BitVec 32) ValueCell!428)) (size!916 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1723)

(declare-fun mapRest!1411 () (Array (_ BitVec 32) ValueCell!428))

(declare-fun mapValue!1411 () ValueCell!428)

(assert (=> mapNonEmpty!1411 (= (arr!815 _values!1501) (store mapRest!1411 mapKey!1411 mapValue!1411))))

(declare-fun b!28889 () Bool)

(assert (=> b!28889 (= e!18664 (not true))))

(declare-datatypes ((SeekEntryResult!79 0))(
  ( (MissingZero!79 (index!2438 (_ BitVec 32))) (Found!79 (index!2439 (_ BitVec 32))) (Intermediate!79 (undefined!891 Bool) (index!2440 (_ BitVec 32)) (x!6373 (_ BitVec 32))) (Undefined!79) (MissingVacant!79 (index!2441 (_ BitVec 32))) )
))
(declare-fun lt!11004 () SeekEntryResult!79)

(declare-fun lt!11005 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28889 (and ((_ is Found!79) lt!11004) (= (index!2439 lt!11004) lt!11005))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1721 (_ BitVec 32)) SeekEntryResult!79)

(assert (=> b!28889 (= lt!11004 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!668 0))(
  ( (Unit!669) )
))
(declare-fun lt!11001 () Unit!668)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1721 (_ BitVec 32)) Unit!668)

(assert (=> b!28889 (= lt!11001 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11005 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1098 0))(
  ( (tuple2!1099 (_1!560 (_ BitVec 64)) (_2!560 V!1499)) )
))
(declare-datatypes ((List!681 0))(
  ( (Nil!678) (Cons!677 (h!1244 tuple2!1098) (t!3367 List!681)) )
))
(declare-datatypes ((ListLongMap!663 0))(
  ( (ListLongMap!664 (toList!347 List!681)) )
))
(declare-fun lt!11002 () ListLongMap!663)

(declare-fun contains!288 (ListLongMap!663 (_ BitVec 64)) Bool)

(assert (=> b!28889 (contains!288 lt!11002 (select (arr!814 _keys!1833) lt!11005))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11003 () Unit!668)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1499)

(declare-fun minValue!1443 () V!1499)

(declare-fun lemmaValidKeyInArrayIsInListMap!24 (array!1721 array!1723 (_ BitVec 32) (_ BitVec 32) V!1499 V!1499 (_ BitVec 32) Int) Unit!668)

(assert (=> b!28889 (= lt!11003 (lemmaValidKeyInArrayIsInListMap!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11005 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1721 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28889 (= lt!11005 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28891 () Bool)

(declare-fun e!18666 () Bool)

(declare-fun e!18665 () Bool)

(assert (=> b!28891 (= e!18666 (and e!18665 mapRes!1411))))

(declare-fun condMapEmpty!1411 () Bool)

(declare-fun mapDefault!1411 () ValueCell!428)

(assert (=> b!28891 (= condMapEmpty!1411 (= (arr!815 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!428)) mapDefault!1411)))))

(declare-fun b!28892 () Bool)

(assert (=> b!28892 (= e!18667 e!18664)))

(declare-fun res!17278 () Bool)

(assert (=> b!28892 (=> (not res!17278) (not e!18664))))

(assert (=> b!28892 (= res!17278 (not (contains!288 lt!11002 k0!1304)))))

(declare-fun getCurrentListMap!175 (array!1721 array!1723 (_ BitVec 32) (_ BitVec 32) V!1499 V!1499 (_ BitVec 32) Int) ListLongMap!663)

(assert (=> b!28892 (= lt!11002 (getCurrentListMap!175 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28893 () Bool)

(declare-fun res!17276 () Bool)

(assert (=> b!28893 (=> (not res!17276) (not e!18667))))

(assert (=> b!28893 (= res!17276 (and (= (size!916 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!915 _keys!1833) (size!916 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28890 () Bool)

(declare-fun res!17277 () Bool)

(assert (=> b!28890 (=> (not res!17277) (not e!18667))))

(declare-datatypes ((List!682 0))(
  ( (Nil!679) (Cons!678 (h!1245 (_ BitVec 64)) (t!3368 List!682)) )
))
(declare-fun arrayNoDuplicates!0 (array!1721 (_ BitVec 32) List!682) Bool)

(assert (=> b!28890 (= res!17277 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!679))))

(declare-fun res!17272 () Bool)

(assert (=> start!3986 (=> (not res!17272) (not e!18667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3986 (= res!17272 (validMask!0 mask!2294))))

(assert (=> start!3986 e!18667))

(assert (=> start!3986 true))

(assert (=> start!3986 tp!4123))

(declare-fun array_inv!567 (array!1723) Bool)

(assert (=> start!3986 (and (array_inv!567 _values!1501) e!18666)))

(declare-fun array_inv!568 (array!1721) Bool)

(assert (=> start!3986 (array_inv!568 _keys!1833)))

(declare-fun tp_is_empty!1255 () Bool)

(assert (=> start!3986 tp_is_empty!1255))

(declare-fun b!28894 () Bool)

(declare-fun res!17273 () Bool)

(assert (=> b!28894 (=> (not res!17273) (not e!18667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28894 (= res!17273 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1411 () Bool)

(assert (=> mapIsEmpty!1411 mapRes!1411))

(declare-fun b!28895 () Bool)

(assert (=> b!28895 (= e!18663 tp_is_empty!1255)))

(declare-fun b!28896 () Bool)

(assert (=> b!28896 (= e!18665 tp_is_empty!1255)))

(assert (= (and start!3986 res!17272) b!28893))

(assert (= (and b!28893 res!17276) b!28888))

(assert (= (and b!28888 res!17274) b!28890))

(assert (= (and b!28890 res!17277) b!28894))

(assert (= (and b!28894 res!17273) b!28892))

(assert (= (and b!28892 res!17278) b!28887))

(assert (= (and b!28887 res!17275) b!28889))

(assert (= (and b!28891 condMapEmpty!1411) mapIsEmpty!1411))

(assert (= (and b!28891 (not condMapEmpty!1411)) mapNonEmpty!1411))

(assert (= (and mapNonEmpty!1411 ((_ is ValueCellFull!428) mapValue!1411)) b!28895))

(assert (= (and b!28891 ((_ is ValueCellFull!428) mapDefault!1411)) b!28896))

(assert (= start!3986 b!28891))

(declare-fun m!23043 () Bool)

(assert (=> b!28894 m!23043))

(declare-fun m!23045 () Bool)

(assert (=> b!28890 m!23045))

(declare-fun m!23047 () Bool)

(assert (=> b!28892 m!23047))

(declare-fun m!23049 () Bool)

(assert (=> b!28892 m!23049))

(declare-fun m!23051 () Bool)

(assert (=> mapNonEmpty!1411 m!23051))

(declare-fun m!23053 () Bool)

(assert (=> start!3986 m!23053))

(declare-fun m!23055 () Bool)

(assert (=> start!3986 m!23055))

(declare-fun m!23057 () Bool)

(assert (=> start!3986 m!23057))

(declare-fun m!23059 () Bool)

(assert (=> b!28889 m!23059))

(declare-fun m!23061 () Bool)

(assert (=> b!28889 m!23061))

(declare-fun m!23063 () Bool)

(assert (=> b!28889 m!23063))

(declare-fun m!23065 () Bool)

(assert (=> b!28889 m!23065))

(declare-fun m!23067 () Bool)

(assert (=> b!28889 m!23067))

(declare-fun m!23069 () Bool)

(assert (=> b!28889 m!23069))

(assert (=> b!28889 m!23061))

(declare-fun m!23071 () Bool)

(assert (=> b!28888 m!23071))

(declare-fun m!23073 () Bool)

(assert (=> b!28887 m!23073))

(check-sat (not b!28894) (not b!28887) (not b!28888) (not mapNonEmpty!1411) b_and!1705 (not b!28890) (not b!28889) tp_is_empty!1255 (not start!3986) (not b!28892) (not b_next!901))
(check-sat b_and!1705 (not b_next!901))
