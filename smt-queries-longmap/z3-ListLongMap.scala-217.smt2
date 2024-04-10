; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3986 () Bool)

(assert start!3986)

(declare-fun b_free!891 () Bool)

(declare-fun b_next!891 () Bool)

(assert (=> start!3986 (= b_free!891 (not b_next!891))))

(declare-fun tp!4093 () Bool)

(declare-fun b_and!1701 () Bool)

(assert (=> start!3986 (= tp!4093 b_and!1701)))

(declare-fun b!28787 () Bool)

(declare-fun res!17200 () Bool)

(declare-fun e!18614 () Bool)

(assert (=> b!28787 (=> (not res!17200) (not e!18614))))

(declare-datatypes ((array!1725 0))(
  ( (array!1726 (arr!816 (Array (_ BitVec 32) (_ BitVec 64))) (size!917 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1725)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1725 (_ BitVec 32)) Bool)

(assert (=> b!28787 (= res!17200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28788 () Bool)

(declare-fun e!18617 () Bool)

(declare-fun e!18616 () Bool)

(declare-fun mapRes!1396 () Bool)

(assert (=> b!28788 (= e!18617 (and e!18616 mapRes!1396))))

(declare-fun condMapEmpty!1396 () Bool)

(declare-datatypes ((V!1485 0))(
  ( (V!1486 (val!649 Int)) )
))
(declare-datatypes ((ValueCell!423 0))(
  ( (ValueCellFull!423 (v!1738 V!1485)) (EmptyCell!423) )
))
(declare-datatypes ((array!1727 0))(
  ( (array!1728 (arr!817 (Array (_ BitVec 32) ValueCell!423)) (size!918 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1727)

(declare-fun mapDefault!1396 () ValueCell!423)

(assert (=> b!28788 (= condMapEmpty!1396 (= (arr!817 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!423)) mapDefault!1396)))))

(declare-fun b!28789 () Bool)

(declare-fun e!18615 () Bool)

(declare-fun tp_is_empty!1245 () Bool)

(assert (=> b!28789 (= e!18615 tp_is_empty!1245)))

(declare-fun b!28790 () Bool)

(declare-fun res!17199 () Bool)

(declare-fun e!18611 () Bool)

(assert (=> b!28790 (=> (not res!17199) (not e!18611))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28790 (= res!17199 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28791 () Bool)

(assert (=> b!28791 (= e!18614 e!18611)))

(declare-fun res!17195 () Bool)

(assert (=> b!28791 (=> (not res!17195) (not e!18611))))

(declare-datatypes ((tuple2!1080 0))(
  ( (tuple2!1081 (_1!551 (_ BitVec 64)) (_2!551 V!1485)) )
))
(declare-datatypes ((List!679 0))(
  ( (Nil!676) (Cons!675 (h!1242 tuple2!1080) (t!3372 List!679)) )
))
(declare-datatypes ((ListLongMap!657 0))(
  ( (ListLongMap!658 (toList!344 List!679)) )
))
(declare-fun lt!10935 () ListLongMap!657)

(declare-fun contains!284 (ListLongMap!657 (_ BitVec 64)) Bool)

(assert (=> b!28791 (= res!17195 (not (contains!284 lt!10935 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1485)

(declare-fun minValue!1443 () V!1485)

(declare-fun getCurrentListMap!174 (array!1725 array!1727 (_ BitVec 32) (_ BitVec 32) V!1485 V!1485 (_ BitVec 32) Int) ListLongMap!657)

(assert (=> b!28791 (= lt!10935 (getCurrentListMap!174 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28792 () Bool)

(declare-fun e!18612 () Bool)

(assert (=> b!28792 (= e!18611 (not e!18612))))

(declare-fun res!17198 () Bool)

(assert (=> b!28792 (=> res!17198 e!18612)))

(assert (=> b!28792 (= res!17198 (not (= (size!917 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10936 () (_ BitVec 32))

(assert (=> b!28792 (contains!284 lt!10935 (select (arr!816 _keys!1833) lt!10936))))

(declare-datatypes ((Unit!653 0))(
  ( (Unit!654) )
))
(declare-fun lt!10937 () Unit!653)

(declare-fun lemmaValidKeyInArrayIsInListMap!20 (array!1725 array!1727 (_ BitVec 32) (_ BitVec 32) V!1485 V!1485 (_ BitVec 32) Int) Unit!653)

(assert (=> b!28792 (= lt!10937 (lemmaValidKeyInArrayIsInListMap!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10936 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1725 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28792 (= lt!10936 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28793 () Bool)

(declare-fun res!17202 () Bool)

(assert (=> b!28793 (=> (not res!17202) (not e!18614))))

(assert (=> b!28793 (= res!17202 (and (= (size!918 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!917 _keys!1833) (size!918 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28794 () Bool)

(declare-fun res!17197 () Bool)

(assert (=> b!28794 (=> (not res!17197) (not e!18614))))

(declare-datatypes ((List!680 0))(
  ( (Nil!677) (Cons!676 (h!1243 (_ BitVec 64)) (t!3373 List!680)) )
))
(declare-fun arrayNoDuplicates!0 (array!1725 (_ BitVec 32) List!680) Bool)

(assert (=> b!28794 (= res!17197 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!677))))

(declare-fun b!28795 () Bool)

(declare-fun res!17201 () Bool)

(assert (=> b!28795 (=> (not res!17201) (not e!18614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28795 (= res!17201 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1396 () Bool)

(declare-fun tp!4092 () Bool)

(assert (=> mapNonEmpty!1396 (= mapRes!1396 (and tp!4092 e!18615))))

(declare-fun mapKey!1396 () (_ BitVec 32))

(declare-fun mapRest!1396 () (Array (_ BitVec 32) ValueCell!423))

(declare-fun mapValue!1396 () ValueCell!423)

(assert (=> mapNonEmpty!1396 (= (arr!817 _values!1501) (store mapRest!1396 mapKey!1396 mapValue!1396))))

(declare-fun b!28796 () Bool)

(assert (=> b!28796 (= e!18612 true)))

(declare-datatypes ((SeekEntryResult!73 0))(
  ( (MissingZero!73 (index!2414 (_ BitVec 32))) (Found!73 (index!2415 (_ BitVec 32))) (Intermediate!73 (undefined!885 Bool) (index!2416 (_ BitVec 32)) (x!6351 (_ BitVec 32))) (Undefined!73) (MissingVacant!73 (index!2417 (_ BitVec 32))) )
))
(declare-fun lt!10934 () SeekEntryResult!73)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1725 (_ BitVec 32)) SeekEntryResult!73)

(assert (=> b!28796 (= lt!10934 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!17196 () Bool)

(assert (=> start!3986 (=> (not res!17196) (not e!18614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3986 (= res!17196 (validMask!0 mask!2294))))

(assert (=> start!3986 e!18614))

(assert (=> start!3986 true))

(assert (=> start!3986 tp!4093))

(declare-fun array_inv!561 (array!1727) Bool)

(assert (=> start!3986 (and (array_inv!561 _values!1501) e!18617)))

(declare-fun array_inv!562 (array!1725) Bool)

(assert (=> start!3986 (array_inv!562 _keys!1833)))

(assert (=> start!3986 tp_is_empty!1245))

(declare-fun b!28797 () Bool)

(assert (=> b!28797 (= e!18616 tp_is_empty!1245)))

(declare-fun mapIsEmpty!1396 () Bool)

(assert (=> mapIsEmpty!1396 mapRes!1396))

(assert (= (and start!3986 res!17196) b!28793))

(assert (= (and b!28793 res!17202) b!28787))

(assert (= (and b!28787 res!17200) b!28794))

(assert (= (and b!28794 res!17197) b!28795))

(assert (= (and b!28795 res!17201) b!28791))

(assert (= (and b!28791 res!17195) b!28790))

(assert (= (and b!28790 res!17199) b!28792))

(assert (= (and b!28792 (not res!17198)) b!28796))

(assert (= (and b!28788 condMapEmpty!1396) mapIsEmpty!1396))

(assert (= (and b!28788 (not condMapEmpty!1396)) mapNonEmpty!1396))

(get-info :version)

(assert (= (and mapNonEmpty!1396 ((_ is ValueCellFull!423) mapValue!1396)) b!28789))

(assert (= (and b!28788 ((_ is ValueCellFull!423) mapDefault!1396)) b!28797))

(assert (= start!3986 b!28788))

(declare-fun m!22957 () Bool)

(assert (=> b!28787 m!22957))

(declare-fun m!22959 () Bool)

(assert (=> b!28792 m!22959))

(assert (=> b!28792 m!22959))

(declare-fun m!22961 () Bool)

(assert (=> b!28792 m!22961))

(declare-fun m!22963 () Bool)

(assert (=> b!28792 m!22963))

(declare-fun m!22965 () Bool)

(assert (=> b!28792 m!22965))

(declare-fun m!22967 () Bool)

(assert (=> b!28790 m!22967))

(declare-fun m!22969 () Bool)

(assert (=> b!28796 m!22969))

(declare-fun m!22971 () Bool)

(assert (=> b!28791 m!22971))

(declare-fun m!22973 () Bool)

(assert (=> b!28791 m!22973))

(declare-fun m!22975 () Bool)

(assert (=> b!28794 m!22975))

(declare-fun m!22977 () Bool)

(assert (=> mapNonEmpty!1396 m!22977))

(declare-fun m!22979 () Bool)

(assert (=> start!3986 m!22979))

(declare-fun m!22981 () Bool)

(assert (=> start!3986 m!22981))

(declare-fun m!22983 () Bool)

(assert (=> start!3986 m!22983))

(declare-fun m!22985 () Bool)

(assert (=> b!28795 m!22985))

(check-sat (not b!28790) (not b!28787) (not b_next!891) (not b!28796) (not b!28791) (not start!3986) tp_is_empty!1245 b_and!1701 (not b!28795) (not mapNonEmpty!1396) (not b!28794) (not b!28792))
(check-sat b_and!1701 (not b_next!891))
