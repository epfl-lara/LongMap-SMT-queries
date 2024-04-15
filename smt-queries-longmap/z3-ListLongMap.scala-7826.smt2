; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97694 () Bool)

(assert start!97694)

(declare-fun b!1116759 () Bool)

(declare-fun res!745718 () Bool)

(declare-fun e!636220 () Bool)

(assert (=> b!1116759 (=> (not res!745718) (not e!636220))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116759 (= res!745718 (validMask!0 mask!1564))))

(declare-fun b!1116760 () Bool)

(declare-fun res!745714 () Bool)

(declare-fun e!636217 () Bool)

(assert (=> b!1116760 (=> (not res!745714) (not e!636217))))

(declare-datatypes ((array!72658 0))(
  ( (array!72659 (arr!34982 (Array (_ BitVec 32) (_ BitVec 64))) (size!35520 (_ BitVec 32))) )
))
(declare-fun lt!497004 () array!72658)

(declare-datatypes ((List!24412 0))(
  ( (Nil!24409) (Cons!24408 (h!25617 (_ BitVec 64)) (t!34884 List!24412)) )
))
(declare-fun arrayNoDuplicates!0 (array!72658 (_ BitVec 32) List!24412) Bool)

(assert (=> b!1116760 (= res!745714 (arrayNoDuplicates!0 lt!497004 #b00000000000000000000000000000000 Nil!24409))))

(declare-fun b!1116761 () Bool)

(declare-fun res!745716 () Bool)

(assert (=> b!1116761 (=> (not res!745716) (not e!636220))))

(declare-fun _keys!1208 () array!72658)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42369 0))(
  ( (V!42370 (val!14022 Int)) )
))
(declare-datatypes ((ValueCell!13256 0))(
  ( (ValueCellFull!13256 (v!16654 V!42369)) (EmptyCell!13256) )
))
(declare-datatypes ((array!72660 0))(
  ( (array!72661 (arr!34983 (Array (_ BitVec 32) ValueCell!13256)) (size!35521 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72660)

(assert (=> b!1116761 (= res!745716 (and (= (size!35521 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35520 _keys!1208) (size!35521 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116762 () Bool)

(declare-fun res!745720 () Bool)

(assert (=> b!1116762 (=> (not res!745720) (not e!636220))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116762 (= res!745720 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35520 _keys!1208))))))

(declare-fun b!1116763 () Bool)

(declare-fun e!636221 () Bool)

(declare-fun tp_is_empty!27931 () Bool)

(assert (=> b!1116763 (= e!636221 tp_is_empty!27931)))

(declare-fun b!1116764 () Bool)

(declare-fun e!636219 () Bool)

(declare-fun e!636222 () Bool)

(declare-fun mapRes!43714 () Bool)

(assert (=> b!1116764 (= e!636219 (and e!636222 mapRes!43714))))

(declare-fun condMapEmpty!43714 () Bool)

(declare-fun mapDefault!43714 () ValueCell!13256)

(assert (=> b!1116764 (= condMapEmpty!43714 (= (arr!34983 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13256)) mapDefault!43714)))))

(declare-fun b!1116765 () Bool)

(assert (=> b!1116765 (= e!636222 tp_is_empty!27931)))

(declare-fun b!1116766 () Bool)

(declare-fun res!745721 () Bool)

(assert (=> b!1116766 (=> (not res!745721) (not e!636220))))

(assert (=> b!1116766 (= res!745721 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24409))))

(declare-fun b!1116767 () Bool)

(declare-fun res!745717 () Bool)

(assert (=> b!1116767 (=> (not res!745717) (not e!636220))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116767 (= res!745717 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43714 () Bool)

(declare-fun tp!82958 () Bool)

(assert (=> mapNonEmpty!43714 (= mapRes!43714 (and tp!82958 e!636221))))

(declare-fun mapRest!43714 () (Array (_ BitVec 32) ValueCell!13256))

(declare-fun mapValue!43714 () ValueCell!13256)

(declare-fun mapKey!43714 () (_ BitVec 32))

(assert (=> mapNonEmpty!43714 (= (arr!34983 _values!996) (store mapRest!43714 mapKey!43714 mapValue!43714))))

(declare-fun mapIsEmpty!43714 () Bool)

(assert (=> mapIsEmpty!43714 mapRes!43714))

(declare-fun res!745723 () Bool)

(assert (=> start!97694 (=> (not res!745723) (not e!636220))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97694 (= res!745723 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35520 _keys!1208))))))

(assert (=> start!97694 e!636220))

(declare-fun array_inv!26958 (array!72658) Bool)

(assert (=> start!97694 (array_inv!26958 _keys!1208)))

(assert (=> start!97694 true))

(declare-fun array_inv!26959 (array!72660) Bool)

(assert (=> start!97694 (and (array_inv!26959 _values!996) e!636219)))

(declare-fun b!1116768 () Bool)

(declare-fun res!745722 () Bool)

(assert (=> b!1116768 (=> (not res!745722) (not e!636220))))

(assert (=> b!1116768 (= res!745722 (= (select (arr!34982 _keys!1208) i!673) k0!934))))

(declare-fun b!1116769 () Bool)

(declare-fun res!745719 () Bool)

(assert (=> b!1116769 (=> (not res!745719) (not e!636220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72658 (_ BitVec 32)) Bool)

(assert (=> b!1116769 (= res!745719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116770 () Bool)

(assert (=> b!1116770 (= e!636217 (not true))))

(declare-fun arrayContainsKey!0 (array!72658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116770 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36475 0))(
  ( (Unit!36476) )
))
(declare-fun lt!497003 () Unit!36475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72658 (_ BitVec 64) (_ BitVec 32)) Unit!36475)

(assert (=> b!1116770 (= lt!497003 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116771 () Bool)

(assert (=> b!1116771 (= e!636220 e!636217)))

(declare-fun res!745715 () Bool)

(assert (=> b!1116771 (=> (not res!745715) (not e!636217))))

(assert (=> b!1116771 (= res!745715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497004 mask!1564))))

(assert (=> b!1116771 (= lt!497004 (array!72659 (store (arr!34982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35520 _keys!1208)))))

(assert (= (and start!97694 res!745723) b!1116759))

(assert (= (and b!1116759 res!745718) b!1116761))

(assert (= (and b!1116761 res!745716) b!1116769))

(assert (= (and b!1116769 res!745719) b!1116766))

(assert (= (and b!1116766 res!745721) b!1116762))

(assert (= (and b!1116762 res!745720) b!1116767))

(assert (= (and b!1116767 res!745717) b!1116768))

(assert (= (and b!1116768 res!745722) b!1116771))

(assert (= (and b!1116771 res!745715) b!1116760))

(assert (= (and b!1116760 res!745714) b!1116770))

(assert (= (and b!1116764 condMapEmpty!43714) mapIsEmpty!43714))

(assert (= (and b!1116764 (not condMapEmpty!43714)) mapNonEmpty!43714))

(get-info :version)

(assert (= (and mapNonEmpty!43714 ((_ is ValueCellFull!13256) mapValue!43714)) b!1116763))

(assert (= (and b!1116764 ((_ is ValueCellFull!13256) mapDefault!43714)) b!1116765))

(assert (= start!97694 b!1116764))

(declare-fun m!1032321 () Bool)

(assert (=> b!1116760 m!1032321))

(declare-fun m!1032323 () Bool)

(assert (=> b!1116766 m!1032323))

(declare-fun m!1032325 () Bool)

(assert (=> b!1116771 m!1032325))

(declare-fun m!1032327 () Bool)

(assert (=> b!1116771 m!1032327))

(declare-fun m!1032329 () Bool)

(assert (=> mapNonEmpty!43714 m!1032329))

(declare-fun m!1032331 () Bool)

(assert (=> b!1116759 m!1032331))

(declare-fun m!1032333 () Bool)

(assert (=> b!1116770 m!1032333))

(declare-fun m!1032335 () Bool)

(assert (=> b!1116770 m!1032335))

(declare-fun m!1032337 () Bool)

(assert (=> start!97694 m!1032337))

(declare-fun m!1032339 () Bool)

(assert (=> start!97694 m!1032339))

(declare-fun m!1032341 () Bool)

(assert (=> b!1116768 m!1032341))

(declare-fun m!1032343 () Bool)

(assert (=> b!1116767 m!1032343))

(declare-fun m!1032345 () Bool)

(assert (=> b!1116769 m!1032345))

(check-sat (not b!1116770) (not b!1116767) (not start!97694) tp_is_empty!27931 (not b!1116766) (not mapNonEmpty!43714) (not b!1116760) (not b!1116771) (not b!1116759) (not b!1116769))
(check-sat)
