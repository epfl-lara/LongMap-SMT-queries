; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97592 () Bool)

(assert start!97592)

(declare-fun b!1114770 () Bool)

(declare-fun e!635299 () Bool)

(declare-fun e!635303 () Bool)

(assert (=> b!1114770 (= e!635299 e!635303)))

(declare-fun res!744191 () Bool)

(assert (=> b!1114770 (=> (not res!744191) (not e!635303))))

(declare-datatypes ((array!72462 0))(
  ( (array!72463 (arr!34884 (Array (_ BitVec 32) (_ BitVec 64))) (size!35422 (_ BitVec 32))) )
))
(declare-fun lt!496697 () array!72462)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72462 (_ BitVec 32)) Bool)

(assert (=> b!1114770 (= res!744191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496697 mask!1564))))

(declare-fun _keys!1208 () array!72462)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114770 (= lt!496697 (array!72463 (store (arr!34884 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35422 _keys!1208)))))

(declare-fun b!1114771 () Bool)

(declare-fun e!635300 () Bool)

(declare-fun tp_is_empty!27829 () Bool)

(assert (=> b!1114771 (= e!635300 tp_is_empty!27829)))

(declare-fun b!1114772 () Bool)

(declare-fun res!744185 () Bool)

(assert (=> b!1114772 (=> (not res!744185) (not e!635299))))

(assert (=> b!1114772 (= res!744185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!744184 () Bool)

(assert (=> start!97592 (=> (not res!744184) (not e!635299))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97592 (= res!744184 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35422 _keys!1208))))))

(assert (=> start!97592 e!635299))

(declare-fun array_inv!26888 (array!72462) Bool)

(assert (=> start!97592 (array_inv!26888 _keys!1208)))

(assert (=> start!97592 true))

(declare-datatypes ((V!42233 0))(
  ( (V!42234 (val!13971 Int)) )
))
(declare-datatypes ((ValueCell!13205 0))(
  ( (ValueCellFull!13205 (v!16603 V!42233)) (EmptyCell!13205) )
))
(declare-datatypes ((array!72464 0))(
  ( (array!72465 (arr!34885 (Array (_ BitVec 32) ValueCell!13205)) (size!35423 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72464)

(declare-fun e!635304 () Bool)

(declare-fun array_inv!26889 (array!72464) Bool)

(assert (=> start!97592 (and (array_inv!26889 _values!996) e!635304)))

(declare-fun b!1114773 () Bool)

(assert (=> b!1114773 (= e!635303 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114773 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36411 0))(
  ( (Unit!36412) )
))
(declare-fun lt!496698 () Unit!36411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72462 (_ BitVec 64) (_ BitVec 32)) Unit!36411)

(assert (=> b!1114773 (= lt!496698 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114774 () Bool)

(declare-fun res!744189 () Bool)

(assert (=> b!1114774 (=> (not res!744189) (not e!635299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114774 (= res!744189 (validKeyInArray!0 k0!934))))

(declare-fun b!1114775 () Bool)

(declare-fun res!744186 () Bool)

(assert (=> b!1114775 (=> (not res!744186) (not e!635299))))

(declare-datatypes ((List!24371 0))(
  ( (Nil!24368) (Cons!24367 (h!25576 (_ BitVec 64)) (t!34843 List!24371)) )
))
(declare-fun arrayNoDuplicates!0 (array!72462 (_ BitVec 32) List!24371) Bool)

(assert (=> b!1114775 (= res!744186 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24368))))

(declare-fun b!1114776 () Bool)

(declare-fun res!744187 () Bool)

(assert (=> b!1114776 (=> (not res!744187) (not e!635303))))

(assert (=> b!1114776 (= res!744187 (arrayNoDuplicates!0 lt!496697 #b00000000000000000000000000000000 Nil!24368))))

(declare-fun b!1114777 () Bool)

(declare-fun res!744188 () Bool)

(assert (=> b!1114777 (=> (not res!744188) (not e!635299))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114777 (= res!744188 (and (= (size!35423 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35422 _keys!1208) (size!35423 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43561 () Bool)

(declare-fun mapRes!43561 () Bool)

(assert (=> mapIsEmpty!43561 mapRes!43561))

(declare-fun b!1114778 () Bool)

(declare-fun res!744190 () Bool)

(assert (=> b!1114778 (=> (not res!744190) (not e!635299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114778 (= res!744190 (validMask!0 mask!1564))))

(declare-fun b!1114779 () Bool)

(declare-fun res!744193 () Bool)

(assert (=> b!1114779 (=> (not res!744193) (not e!635299))))

(assert (=> b!1114779 (= res!744193 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35422 _keys!1208))))))

(declare-fun b!1114780 () Bool)

(declare-fun res!744192 () Bool)

(assert (=> b!1114780 (=> (not res!744192) (not e!635299))))

(assert (=> b!1114780 (= res!744192 (= (select (arr!34884 _keys!1208) i!673) k0!934))))

(declare-fun b!1114781 () Bool)

(declare-fun e!635302 () Bool)

(assert (=> b!1114781 (= e!635302 tp_is_empty!27829)))

(declare-fun b!1114782 () Bool)

(assert (=> b!1114782 (= e!635304 (and e!635302 mapRes!43561))))

(declare-fun condMapEmpty!43561 () Bool)

(declare-fun mapDefault!43561 () ValueCell!13205)

(assert (=> b!1114782 (= condMapEmpty!43561 (= (arr!34885 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13205)) mapDefault!43561)))))

(declare-fun mapNonEmpty!43561 () Bool)

(declare-fun tp!82805 () Bool)

(assert (=> mapNonEmpty!43561 (= mapRes!43561 (and tp!82805 e!635300))))

(declare-fun mapValue!43561 () ValueCell!13205)

(declare-fun mapKey!43561 () (_ BitVec 32))

(declare-fun mapRest!43561 () (Array (_ BitVec 32) ValueCell!13205))

(assert (=> mapNonEmpty!43561 (= (arr!34885 _values!996) (store mapRest!43561 mapKey!43561 mapValue!43561))))

(assert (= (and start!97592 res!744184) b!1114778))

(assert (= (and b!1114778 res!744190) b!1114777))

(assert (= (and b!1114777 res!744188) b!1114772))

(assert (= (and b!1114772 res!744185) b!1114775))

(assert (= (and b!1114775 res!744186) b!1114779))

(assert (= (and b!1114779 res!744193) b!1114774))

(assert (= (and b!1114774 res!744189) b!1114780))

(assert (= (and b!1114780 res!744192) b!1114770))

(assert (= (and b!1114770 res!744191) b!1114776))

(assert (= (and b!1114776 res!744187) b!1114773))

(assert (= (and b!1114782 condMapEmpty!43561) mapIsEmpty!43561))

(assert (= (and b!1114782 (not condMapEmpty!43561)) mapNonEmpty!43561))

(get-info :version)

(assert (= (and mapNonEmpty!43561 ((_ is ValueCellFull!13205) mapValue!43561)) b!1114771))

(assert (= (and b!1114782 ((_ is ValueCellFull!13205) mapDefault!43561)) b!1114781))

(assert (= start!97592 b!1114782))

(declare-fun m!1030995 () Bool)

(assert (=> b!1114780 m!1030995))

(declare-fun m!1030997 () Bool)

(assert (=> b!1114774 m!1030997))

(declare-fun m!1030999 () Bool)

(assert (=> b!1114773 m!1030999))

(declare-fun m!1031001 () Bool)

(assert (=> b!1114773 m!1031001))

(declare-fun m!1031003 () Bool)

(assert (=> start!97592 m!1031003))

(declare-fun m!1031005 () Bool)

(assert (=> start!97592 m!1031005))

(declare-fun m!1031007 () Bool)

(assert (=> b!1114776 m!1031007))

(declare-fun m!1031009 () Bool)

(assert (=> b!1114772 m!1031009))

(declare-fun m!1031011 () Bool)

(assert (=> b!1114778 m!1031011))

(declare-fun m!1031013 () Bool)

(assert (=> b!1114775 m!1031013))

(declare-fun m!1031015 () Bool)

(assert (=> b!1114770 m!1031015))

(declare-fun m!1031017 () Bool)

(assert (=> b!1114770 m!1031017))

(declare-fun m!1031019 () Bool)

(assert (=> mapNonEmpty!43561 m!1031019))

(check-sat (not b!1114775) (not start!97592) (not b!1114774) (not b!1114776) (not mapNonEmpty!43561) (not b!1114778) (not b!1114772) (not b!1114773) (not b!1114770) tp_is_empty!27829)
(check-sat)
