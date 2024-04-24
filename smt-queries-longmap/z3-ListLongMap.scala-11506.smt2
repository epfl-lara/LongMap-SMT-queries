; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134332 () Bool)

(assert start!134332)

(declare-fun b_free!32143 () Bool)

(declare-fun b_next!32143 () Bool)

(assert (=> start!134332 (= b_free!32143 (not b_next!32143))))

(declare-fun tp!113731 () Bool)

(declare-fun b_and!51729 () Bool)

(assert (=> start!134332 (= tp!113731 b_and!51729)))

(declare-fun b!1567870 () Bool)

(declare-fun res!1070959 () Bool)

(declare-fun e!874073 () Bool)

(assert (=> b!1567870 (=> (not res!1070959) (not e!874073))))

(declare-datatypes ((array!104646 0))(
  ( (array!104647 (arr!50503 (Array (_ BitVec 32) (_ BitVec 64))) (size!51054 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104646)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567870 (= res!1070959 (validKeyInArray!0 (select (arr!50503 _keys!637) from!782)))))

(declare-fun b!1567871 () Bool)

(declare-fun e!874075 () Bool)

(declare-fun tp_is_empty!38917 () Bool)

(assert (=> b!1567871 (= e!874075 tp_is_empty!38917)))

(declare-fun b!1567872 () Bool)

(declare-fun res!1070956 () Bool)

(assert (=> b!1567872 (=> (not res!1070956) (not e!874073))))

(assert (=> b!1567872 (= res!1070956 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51054 _keys!637)) (bvslt from!782 (size!51054 _keys!637))))))

(declare-fun b!1567873 () Bool)

(declare-fun e!874072 () Bool)

(assert (=> b!1567873 (= e!874072 tp_is_empty!38917)))

(declare-fun mapNonEmpty!59767 () Bool)

(declare-fun mapRes!59767 () Bool)

(declare-fun tp!113730 () Bool)

(assert (=> mapNonEmpty!59767 (= mapRes!59767 (and tp!113730 e!874075))))

(declare-datatypes ((V!60097 0))(
  ( (V!60098 (val!19542 Int)) )
))
(declare-datatypes ((ValueCell!18428 0))(
  ( (ValueCellFull!18428 (v!22290 V!60097)) (EmptyCell!18428) )
))
(declare-fun mapValue!59767 () ValueCell!18428)

(declare-datatypes ((array!104648 0))(
  ( (array!104649 (arr!50504 (Array (_ BitVec 32) ValueCell!18428)) (size!51055 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104648)

(declare-fun mapKey!59767 () (_ BitVec 32))

(declare-fun mapRest!59767 () (Array (_ BitVec 32) ValueCell!18428))

(assert (=> mapNonEmpty!59767 (= (arr!50504 _values!487) (store mapRest!59767 mapKey!59767 mapValue!59767))))

(declare-fun mapIsEmpty!59767 () Bool)

(assert (=> mapIsEmpty!59767 mapRes!59767))

(declare-fun b!1567874 () Bool)

(declare-fun res!1070957 () Bool)

(assert (=> b!1567874 (=> (not res!1070957) (not e!874073))))

(declare-datatypes ((List!36630 0))(
  ( (Nil!36627) (Cons!36626 (h!38090 (_ BitVec 64)) (t!51479 List!36630)) )
))
(declare-fun arrayNoDuplicates!0 (array!104646 (_ BitVec 32) List!36630) Bool)

(assert (=> b!1567874 (= res!1070957 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36627))))

(declare-fun b!1567876 () Bool)

(declare-fun res!1070958 () Bool)

(assert (=> b!1567876 (=> (not res!1070958) (not e!874073))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1567876 (= res!1070958 (and (= (size!51055 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51054 _keys!637) (size!51055 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567877 () Bool)

(declare-fun e!874071 () Bool)

(assert (=> b!1567877 (= e!874071 (and e!874072 mapRes!59767))))

(declare-fun condMapEmpty!59767 () Bool)

(declare-fun mapDefault!59767 () ValueCell!18428)

(assert (=> b!1567877 (= condMapEmpty!59767 (= (arr!50504 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18428)) mapDefault!59767)))))

(declare-fun b!1567878 () Bool)

(declare-fun res!1070960 () Bool)

(assert (=> b!1567878 (=> (not res!1070960) (not e!874073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104646 (_ BitVec 32)) Bool)

(assert (=> b!1567878 (= res!1070960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567875 () Bool)

(assert (=> b!1567875 (= e!874073 (not true))))

(declare-fun lt!673176 () V!60097)

(declare-datatypes ((tuple2!25264 0))(
  ( (tuple2!25265 (_1!12643 (_ BitVec 64)) (_2!12643 V!60097)) )
))
(declare-datatypes ((List!36631 0))(
  ( (Nil!36628) (Cons!36627 (h!38091 tuple2!25264) (t!51480 List!36631)) )
))
(declare-datatypes ((ListLongMap!22707 0))(
  ( (ListLongMap!22708 (toList!11369 List!36631)) )
))
(declare-fun lt!673175 () ListLongMap!22707)

(declare-fun contains!10372 (ListLongMap!22707 (_ BitVec 64)) Bool)

(declare-fun +!5107 (ListLongMap!22707 tuple2!25264) ListLongMap!22707)

(assert (=> b!1567875 (not (contains!10372 (+!5107 lt!673175 (tuple2!25265 (select (arr!50503 _keys!637) from!782) lt!673176)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51909 0))(
  ( (Unit!51910) )
))
(declare-fun lt!673177 () Unit!51909)

(declare-fun addStillNotContains!558 (ListLongMap!22707 (_ BitVec 64) V!60097 (_ BitVec 64)) Unit!51909)

(assert (=> b!1567875 (= lt!673177 (addStillNotContains!558 lt!673175 (select (arr!50503 _keys!637) from!782) lt!673176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26371 (ValueCell!18428 V!60097) V!60097)

(declare-fun dynLambda!3905 (Int (_ BitVec 64)) V!60097)

(assert (=> b!1567875 (= lt!673176 (get!26371 (select (arr!50504 _values!487) from!782) (dynLambda!3905 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60097)

(declare-fun minValue!453 () V!60097)

(declare-fun getCurrentListMapNoExtraKeys!6752 (array!104646 array!104648 (_ BitVec 32) (_ BitVec 32) V!60097 V!60097 (_ BitVec 32) Int) ListLongMap!22707)

(assert (=> b!1567875 (= lt!673175 (getCurrentListMapNoExtraKeys!6752 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070961 () Bool)

(assert (=> start!134332 (=> (not res!1070961) (not e!874073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134332 (= res!1070961 (validMask!0 mask!947))))

(assert (=> start!134332 e!874073))

(assert (=> start!134332 tp!113731))

(assert (=> start!134332 tp_is_empty!38917))

(assert (=> start!134332 true))

(declare-fun array_inv!39487 (array!104646) Bool)

(assert (=> start!134332 (array_inv!39487 _keys!637)))

(declare-fun array_inv!39488 (array!104648) Bool)

(assert (=> start!134332 (and (array_inv!39488 _values!487) e!874071)))

(assert (= (and start!134332 res!1070961) b!1567876))

(assert (= (and b!1567876 res!1070958) b!1567878))

(assert (= (and b!1567878 res!1070960) b!1567874))

(assert (= (and b!1567874 res!1070957) b!1567872))

(assert (= (and b!1567872 res!1070956) b!1567870))

(assert (= (and b!1567870 res!1070959) b!1567875))

(assert (= (and b!1567877 condMapEmpty!59767) mapIsEmpty!59767))

(assert (= (and b!1567877 (not condMapEmpty!59767)) mapNonEmpty!59767))

(get-info :version)

(assert (= (and mapNonEmpty!59767 ((_ is ValueCellFull!18428) mapValue!59767)) b!1567871))

(assert (= (and b!1567877 ((_ is ValueCellFull!18428) mapDefault!59767)) b!1567873))

(assert (= start!134332 b!1567877))

(declare-fun b_lambda!24951 () Bool)

(assert (=> (not b_lambda!24951) (not b!1567875)))

(declare-fun t!51478 () Bool)

(declare-fun tb!12603 () Bool)

(assert (=> (and start!134332 (= defaultEntry!495 defaultEntry!495) t!51478) tb!12603))

(declare-fun result!26505 () Bool)

(assert (=> tb!12603 (= result!26505 tp_is_empty!38917)))

(assert (=> b!1567875 t!51478))

(declare-fun b_and!51731 () Bool)

(assert (= b_and!51729 (and (=> t!51478 result!26505) b_and!51731)))

(declare-fun m!1442593 () Bool)

(assert (=> b!1567878 m!1442593))

(declare-fun m!1442595 () Bool)

(assert (=> start!134332 m!1442595))

(declare-fun m!1442597 () Bool)

(assert (=> start!134332 m!1442597))

(declare-fun m!1442599 () Bool)

(assert (=> start!134332 m!1442599))

(declare-fun m!1442601 () Bool)

(assert (=> mapNonEmpty!59767 m!1442601))

(declare-fun m!1442603 () Bool)

(assert (=> b!1567875 m!1442603))

(declare-fun m!1442605 () Bool)

(assert (=> b!1567875 m!1442605))

(declare-fun m!1442607 () Bool)

(assert (=> b!1567875 m!1442607))

(declare-fun m!1442609 () Bool)

(assert (=> b!1567875 m!1442609))

(assert (=> b!1567875 m!1442609))

(declare-fun m!1442611 () Bool)

(assert (=> b!1567875 m!1442611))

(assert (=> b!1567875 m!1442603))

(declare-fun m!1442613 () Bool)

(assert (=> b!1567875 m!1442613))

(assert (=> b!1567875 m!1442605))

(declare-fun m!1442615 () Bool)

(assert (=> b!1567875 m!1442615))

(assert (=> b!1567875 m!1442613))

(declare-fun m!1442617 () Bool)

(assert (=> b!1567875 m!1442617))

(assert (=> b!1567870 m!1442613))

(assert (=> b!1567870 m!1442613))

(declare-fun m!1442619 () Bool)

(assert (=> b!1567870 m!1442619))

(declare-fun m!1442621 () Bool)

(assert (=> b!1567874 m!1442621))

(check-sat (not b_lambda!24951) b_and!51731 tp_is_empty!38917 (not b!1567874) (not mapNonEmpty!59767) (not start!134332) (not b_next!32143) (not b!1567878) (not b!1567875) (not b!1567870))
(check-sat b_and!51731 (not b_next!32143))
