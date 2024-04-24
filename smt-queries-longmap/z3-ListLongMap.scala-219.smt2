; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3992 () Bool)

(assert start!3992)

(declare-fun b_free!901 () Bool)

(declare-fun b_next!901 () Bool)

(assert (=> start!3992 (= b_free!901 (not b_next!901))))

(declare-fun tp!4123 () Bool)

(declare-fun b_and!1701 () Bool)

(assert (=> start!3992 (= tp!4123 b_and!1701)))

(declare-fun b!28869 () Bool)

(declare-fun e!18656 () Bool)

(declare-fun e!18653 () Bool)

(declare-fun mapRes!1411 () Bool)

(assert (=> b!28869 (= e!18656 (and e!18653 mapRes!1411))))

(declare-fun condMapEmpty!1411 () Bool)

(declare-datatypes ((V!1499 0))(
  ( (V!1500 (val!654 Int)) )
))
(declare-datatypes ((ValueCell!428 0))(
  ( (ValueCellFull!428 (v!1743 V!1499)) (EmptyCell!428) )
))
(declare-datatypes ((array!1725 0))(
  ( (array!1726 (arr!816 (Array (_ BitVec 32) ValueCell!428)) (size!917 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1725)

(declare-fun mapDefault!1411 () ValueCell!428)

(assert (=> b!28869 (= condMapEmpty!1411 (= (arr!816 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!428)) mapDefault!1411)))))

(declare-fun mapIsEmpty!1411 () Bool)

(assert (=> mapIsEmpty!1411 mapRes!1411))

(declare-fun b!28870 () Bool)

(declare-fun res!17266 () Bool)

(declare-fun e!18654 () Bool)

(assert (=> b!28870 (=> (not res!17266) (not e!18654))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28870 (= res!17266 (validKeyInArray!0 k0!1304))))

(declare-fun res!17267 () Bool)

(assert (=> start!3992 (=> (not res!17267) (not e!18654))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3992 (= res!17267 (validMask!0 mask!2294))))

(assert (=> start!3992 e!18654))

(assert (=> start!3992 true))

(assert (=> start!3992 tp!4123))

(declare-fun array_inv!565 (array!1725) Bool)

(assert (=> start!3992 (and (array_inv!565 _values!1501) e!18656)))

(declare-datatypes ((array!1727 0))(
  ( (array!1728 (arr!817 (Array (_ BitVec 32) (_ BitVec 64))) (size!918 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1727)

(declare-fun array_inv!566 (array!1727) Bool)

(assert (=> start!3992 (array_inv!566 _keys!1833)))

(declare-fun tp_is_empty!1255 () Bool)

(assert (=> start!3992 tp_is_empty!1255))

(declare-fun b!28871 () Bool)

(declare-fun res!17268 () Bool)

(assert (=> b!28871 (=> (not res!17268) (not e!18654))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28871 (= res!17268 (and (= (size!917 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!918 _keys!1833) (size!917 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28872 () Bool)

(declare-fun e!18658 () Bool)

(assert (=> b!28872 (= e!18658 (not true))))

(declare-datatypes ((SeekEntryResult!77 0))(
  ( (MissingZero!77 (index!2430 (_ BitVec 32))) (Found!77 (index!2431 (_ BitVec 32))) (Intermediate!77 (undefined!889 Bool) (index!2432 (_ BitVec 32)) (x!6371 (_ BitVec 32))) (Undefined!77) (MissingVacant!77 (index!2433 (_ BitVec 32))) )
))
(declare-fun lt!10961 () SeekEntryResult!77)

(declare-fun lt!10963 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28872 (and ((_ is Found!77) lt!10961) (= (index!2431 lt!10961) lt!10963))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1727 (_ BitVec 32)) SeekEntryResult!77)

(assert (=> b!28872 (= lt!10961 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!677 0))(
  ( (Unit!678) )
))
(declare-fun lt!10962 () Unit!677)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1727 (_ BitVec 32)) Unit!677)

(assert (=> b!28872 (= lt!10962 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!10963 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1084 0))(
  ( (tuple2!1085 (_1!553 (_ BitVec 64)) (_2!553 V!1499)) )
))
(declare-datatypes ((List!674 0))(
  ( (Nil!671) (Cons!670 (h!1237 tuple2!1084) (t!3361 List!674)) )
))
(declare-datatypes ((ListLongMap!655 0))(
  ( (ListLongMap!656 (toList!343 List!674)) )
))
(declare-fun lt!10964 () ListLongMap!655)

(declare-fun contains!285 (ListLongMap!655 (_ BitVec 64)) Bool)

(assert (=> b!28872 (contains!285 lt!10964 (select (arr!817 _keys!1833) lt!10963))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!10965 () Unit!677)

(declare-fun zeroValue!1443 () V!1499)

(declare-fun minValue!1443 () V!1499)

(declare-fun lemmaValidKeyInArrayIsInListMap!28 (array!1727 array!1725 (_ BitVec 32) (_ BitVec 32) V!1499 V!1499 (_ BitVec 32) Int) Unit!677)

(assert (=> b!28872 (= lt!10965 (lemmaValidKeyInArrayIsInListMap!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10963 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1727 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28872 (= lt!10963 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28873 () Bool)

(declare-fun e!18655 () Bool)

(assert (=> b!28873 (= e!18655 tp_is_empty!1255)))

(declare-fun b!28874 () Bool)

(assert (=> b!28874 (= e!18654 e!18658)))

(declare-fun res!17264 () Bool)

(assert (=> b!28874 (=> (not res!17264) (not e!18658))))

(assert (=> b!28874 (= res!17264 (not (contains!285 lt!10964 k0!1304)))))

(declare-fun getCurrentListMap!169 (array!1727 array!1725 (_ BitVec 32) (_ BitVec 32) V!1499 V!1499 (_ BitVec 32) Int) ListLongMap!655)

(assert (=> b!28874 (= lt!10964 (getCurrentListMap!169 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28875 () Bool)

(declare-fun res!17265 () Bool)

(assert (=> b!28875 (=> (not res!17265) (not e!18654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1727 (_ BitVec 32)) Bool)

(assert (=> b!28875 (= res!17265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28876 () Bool)

(assert (=> b!28876 (= e!18653 tp_is_empty!1255)))

(declare-fun mapNonEmpty!1411 () Bool)

(declare-fun tp!4122 () Bool)

(assert (=> mapNonEmpty!1411 (= mapRes!1411 (and tp!4122 e!18655))))

(declare-fun mapRest!1411 () (Array (_ BitVec 32) ValueCell!428))

(declare-fun mapKey!1411 () (_ BitVec 32))

(declare-fun mapValue!1411 () ValueCell!428)

(assert (=> mapNonEmpty!1411 (= (arr!816 _values!1501) (store mapRest!1411 mapKey!1411 mapValue!1411))))

(declare-fun b!28877 () Bool)

(declare-fun res!17270 () Bool)

(assert (=> b!28877 (=> (not res!17270) (not e!18654))))

(declare-datatypes ((List!675 0))(
  ( (Nil!672) (Cons!671 (h!1238 (_ BitVec 64)) (t!3362 List!675)) )
))
(declare-fun arrayNoDuplicates!0 (array!1727 (_ BitVec 32) List!675) Bool)

(assert (=> b!28877 (= res!17270 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!672))))

(declare-fun b!28878 () Bool)

(declare-fun res!17269 () Bool)

(assert (=> b!28878 (=> (not res!17269) (not e!18658))))

(declare-fun arrayContainsKey!0 (array!1727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28878 (= res!17269 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3992 res!17267) b!28871))

(assert (= (and b!28871 res!17268) b!28875))

(assert (= (and b!28875 res!17265) b!28877))

(assert (= (and b!28877 res!17270) b!28870))

(assert (= (and b!28870 res!17266) b!28874))

(assert (= (and b!28874 res!17264) b!28878))

(assert (= (and b!28878 res!17269) b!28872))

(assert (= (and b!28869 condMapEmpty!1411) mapIsEmpty!1411))

(assert (= (and b!28869 (not condMapEmpty!1411)) mapNonEmpty!1411))

(assert (= (and mapNonEmpty!1411 ((_ is ValueCellFull!428) mapValue!1411)) b!28873))

(assert (= (and b!28869 ((_ is ValueCellFull!428) mapDefault!1411)) b!28876))

(assert (= start!3992 b!28869))

(declare-fun m!22961 () Bool)

(assert (=> b!28874 m!22961))

(declare-fun m!22963 () Bool)

(assert (=> b!28874 m!22963))

(declare-fun m!22965 () Bool)

(assert (=> b!28870 m!22965))

(declare-fun m!22967 () Bool)

(assert (=> b!28878 m!22967))

(declare-fun m!22969 () Bool)

(assert (=> b!28875 m!22969))

(declare-fun m!22971 () Bool)

(assert (=> start!3992 m!22971))

(declare-fun m!22973 () Bool)

(assert (=> start!3992 m!22973))

(declare-fun m!22975 () Bool)

(assert (=> start!3992 m!22975))

(declare-fun m!22977 () Bool)

(assert (=> b!28872 m!22977))

(declare-fun m!22979 () Bool)

(assert (=> b!28872 m!22979))

(declare-fun m!22981 () Bool)

(assert (=> b!28872 m!22981))

(declare-fun m!22983 () Bool)

(assert (=> b!28872 m!22983))

(assert (=> b!28872 m!22977))

(declare-fun m!22985 () Bool)

(assert (=> b!28872 m!22985))

(declare-fun m!22987 () Bool)

(assert (=> b!28872 m!22987))

(declare-fun m!22989 () Bool)

(assert (=> mapNonEmpty!1411 m!22989))

(declare-fun m!22991 () Bool)

(assert (=> b!28877 m!22991))

(check-sat (not start!3992) (not mapNonEmpty!1411) b_and!1701 (not b!28872) (not b!28874) tp_is_empty!1255 (not b!28870) (not b!28877) (not b_next!901) (not b!28878) (not b!28875))
(check-sat b_and!1701 (not b_next!901))
