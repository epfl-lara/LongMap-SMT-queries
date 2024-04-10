; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133940 () Bool)

(assert start!133940)

(declare-fun b_free!32163 () Bool)

(declare-fun b_next!32163 () Bool)

(assert (=> start!133940 (= b_free!32163 (not b_next!32163))))

(declare-fun tp!113791 () Bool)

(declare-fun b_and!51767 () Bool)

(assert (=> start!133940 (= tp!113791 b_and!51767)))

(declare-fun b!1565724 () Bool)

(declare-fun res!1070276 () Bool)

(declare-fun e!872715 () Bool)

(assert (=> b!1565724 (=> (not res!1070276) (not e!872715))))

(declare-datatypes ((array!104564 0))(
  ( (array!104565 (arr!50469 (Array (_ BitVec 32) (_ BitVec 64))) (size!51019 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104564)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104564 (_ BitVec 32)) Bool)

(assert (=> b!1565724 (= res!1070276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565725 () Bool)

(declare-fun e!872713 () Bool)

(declare-fun tp_is_empty!38937 () Bool)

(assert (=> b!1565725 (= e!872713 tp_is_empty!38937)))

(declare-fun mapNonEmpty!59797 () Bool)

(declare-fun mapRes!59797 () Bool)

(declare-fun tp!113790 () Bool)

(declare-fun e!872716 () Bool)

(assert (=> mapNonEmpty!59797 (= mapRes!59797 (and tp!113790 e!872716))))

(declare-datatypes ((V!60123 0))(
  ( (V!60124 (val!19552 Int)) )
))
(declare-datatypes ((ValueCell!18438 0))(
  ( (ValueCellFull!18438 (v!22308 V!60123)) (EmptyCell!18438) )
))
(declare-fun mapRest!59797 () (Array (_ BitVec 32) ValueCell!18438))

(declare-fun mapKey!59797 () (_ BitVec 32))

(declare-datatypes ((array!104566 0))(
  ( (array!104567 (arr!50470 (Array (_ BitVec 32) ValueCell!18438)) (size!51020 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104566)

(declare-fun mapValue!59797 () ValueCell!18438)

(assert (=> mapNonEmpty!59797 (= (arr!50470 _values!487) (store mapRest!59797 mapKey!59797 mapValue!59797))))

(declare-fun b!1565726 () Bool)

(declare-fun res!1070281 () Bool)

(assert (=> b!1565726 (=> (not res!1070281) (not e!872715))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565726 (= res!1070281 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51019 _keys!637)) (bvslt from!782 (size!51019 _keys!637))))))

(declare-fun b!1565727 () Bool)

(declare-fun res!1070279 () Bool)

(assert (=> b!1565727 (=> (not res!1070279) (not e!872715))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565727 (= res!1070279 (and (= (size!51020 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51019 _keys!637) (size!51020 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1070278 () Bool)

(assert (=> start!133940 (=> (not res!1070278) (not e!872715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133940 (= res!1070278 (validMask!0 mask!947))))

(assert (=> start!133940 e!872715))

(assert (=> start!133940 tp!113791))

(assert (=> start!133940 tp_is_empty!38937))

(assert (=> start!133940 true))

(declare-fun array_inv!39217 (array!104564) Bool)

(assert (=> start!133940 (array_inv!39217 _keys!637)))

(declare-fun e!872714 () Bool)

(declare-fun array_inv!39218 (array!104566) Bool)

(assert (=> start!133940 (and (array_inv!39218 _values!487) e!872714)))

(declare-fun b!1565728 () Bool)

(declare-fun res!1070277 () Bool)

(assert (=> b!1565728 (=> (not res!1070277) (not e!872715))))

(declare-datatypes ((List!36614 0))(
  ( (Nil!36611) (Cons!36610 (h!38056 (_ BitVec 64)) (t!51491 List!36614)) )
))
(declare-fun arrayNoDuplicates!0 (array!104564 (_ BitVec 32) List!36614) Bool)

(assert (=> b!1565728 (= res!1070277 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36611))))

(declare-fun b!1565729 () Bool)

(assert (=> b!1565729 (= e!872715 (not true))))

(declare-fun lt!672388 () Bool)

(declare-datatypes ((tuple2!25226 0))(
  ( (tuple2!25227 (_1!12624 (_ BitVec 64)) (_2!12624 V!60123)) )
))
(declare-datatypes ((List!36615 0))(
  ( (Nil!36612) (Cons!36611 (h!38057 tuple2!25226) (t!51492 List!36615)) )
))
(declare-datatypes ((ListLongMap!22661 0))(
  ( (ListLongMap!22662 (toList!11346 List!36615)) )
))
(declare-fun lt!672389 () ListLongMap!22661)

(declare-fun contains!10337 (ListLongMap!22661 (_ BitVec 64)) Bool)

(assert (=> b!1565729 (= lt!672388 (contains!10337 lt!672389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565729 (not (contains!10337 lt!672389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672387 () ListLongMap!22661)

(declare-fun lt!672385 () V!60123)

(declare-fun +!5076 (ListLongMap!22661 tuple2!25226) ListLongMap!22661)

(assert (=> b!1565729 (= lt!672389 (+!5076 lt!672387 (tuple2!25227 (select (arr!50469 _keys!637) from!782) lt!672385)))))

(declare-datatypes ((Unit!52016 0))(
  ( (Unit!52017) )
))
(declare-fun lt!672386 () Unit!52016)

(declare-fun addStillNotContains!566 (ListLongMap!22661 (_ BitVec 64) V!60123 (_ BitVec 64)) Unit!52016)

(assert (=> b!1565729 (= lt!672386 (addStillNotContains!566 lt!672387 (select (arr!50469 _keys!637) from!782) lt!672385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26345 (ValueCell!18438 V!60123) V!60123)

(declare-fun dynLambda!3860 (Int (_ BitVec 64)) V!60123)

(assert (=> b!1565729 (= lt!672385 (get!26345 (select (arr!50470 _values!487) from!782) (dynLambda!3860 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60123)

(declare-fun minValue!453 () V!60123)

(declare-fun getCurrentListMapNoExtraKeys!6711 (array!104564 array!104566 (_ BitVec 32) (_ BitVec 32) V!60123 V!60123 (_ BitVec 32) Int) ListLongMap!22661)

(assert (=> b!1565729 (= lt!672387 (getCurrentListMapNoExtraKeys!6711 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565730 () Bool)

(declare-fun res!1070280 () Bool)

(assert (=> b!1565730 (=> (not res!1070280) (not e!872715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565730 (= res!1070280 (validKeyInArray!0 (select (arr!50469 _keys!637) from!782)))))

(declare-fun b!1565731 () Bool)

(assert (=> b!1565731 (= e!872714 (and e!872713 mapRes!59797))))

(declare-fun condMapEmpty!59797 () Bool)

(declare-fun mapDefault!59797 () ValueCell!18438)

(assert (=> b!1565731 (= condMapEmpty!59797 (= (arr!50470 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18438)) mapDefault!59797)))))

(declare-fun mapIsEmpty!59797 () Bool)

(assert (=> mapIsEmpty!59797 mapRes!59797))

(declare-fun b!1565732 () Bool)

(assert (=> b!1565732 (= e!872716 tp_is_empty!38937)))

(assert (= (and start!133940 res!1070278) b!1565727))

(assert (= (and b!1565727 res!1070279) b!1565724))

(assert (= (and b!1565724 res!1070276) b!1565728))

(assert (= (and b!1565728 res!1070277) b!1565726))

(assert (= (and b!1565726 res!1070281) b!1565730))

(assert (= (and b!1565730 res!1070280) b!1565729))

(assert (= (and b!1565731 condMapEmpty!59797) mapIsEmpty!59797))

(assert (= (and b!1565731 (not condMapEmpty!59797)) mapNonEmpty!59797))

(get-info :version)

(assert (= (and mapNonEmpty!59797 ((_ is ValueCellFull!18438) mapValue!59797)) b!1565732))

(assert (= (and b!1565731 ((_ is ValueCellFull!18438) mapDefault!59797)) b!1565725))

(assert (= start!133940 b!1565731))

(declare-fun b_lambda!24977 () Bool)

(assert (=> (not b_lambda!24977) (not b!1565729)))

(declare-fun t!51490 () Bool)

(declare-fun tb!12631 () Bool)

(assert (=> (and start!133940 (= defaultEntry!495 defaultEntry!495) t!51490) tb!12631))

(declare-fun result!26553 () Bool)

(assert (=> tb!12631 (= result!26553 tp_is_empty!38937)))

(assert (=> b!1565729 t!51490))

(declare-fun b_and!51769 () Bool)

(assert (= b_and!51767 (and (=> t!51490 result!26553) b_and!51769)))

(declare-fun m!1440643 () Bool)

(assert (=> b!1565728 m!1440643))

(declare-fun m!1440645 () Bool)

(assert (=> mapNonEmpty!59797 m!1440645))

(declare-fun m!1440647 () Bool)

(assert (=> b!1565724 m!1440647))

(declare-fun m!1440649 () Bool)

(assert (=> start!133940 m!1440649))

(declare-fun m!1440651 () Bool)

(assert (=> start!133940 m!1440651))

(declare-fun m!1440653 () Bool)

(assert (=> start!133940 m!1440653))

(declare-fun m!1440655 () Bool)

(assert (=> b!1565730 m!1440655))

(assert (=> b!1565730 m!1440655))

(declare-fun m!1440657 () Bool)

(assert (=> b!1565730 m!1440657))

(declare-fun m!1440659 () Bool)

(assert (=> b!1565729 m!1440659))

(declare-fun m!1440661 () Bool)

(assert (=> b!1565729 m!1440661))

(declare-fun m!1440663 () Bool)

(assert (=> b!1565729 m!1440663))

(declare-fun m!1440665 () Bool)

(assert (=> b!1565729 m!1440665))

(assert (=> b!1565729 m!1440659))

(assert (=> b!1565729 m!1440655))

(declare-fun m!1440667 () Bool)

(assert (=> b!1565729 m!1440667))

(declare-fun m!1440669 () Bool)

(assert (=> b!1565729 m!1440669))

(assert (=> b!1565729 m!1440655))

(declare-fun m!1440671 () Bool)

(assert (=> b!1565729 m!1440671))

(assert (=> b!1565729 m!1440661))

(declare-fun m!1440673 () Bool)

(assert (=> b!1565729 m!1440673))

(check-sat (not start!133940) b_and!51769 (not b_next!32163) (not b!1565724) (not b_lambda!24977) tp_is_empty!38937 (not b!1565729) (not mapNonEmpty!59797) (not b!1565730) (not b!1565728))
(check-sat b_and!51769 (not b_next!32163))
