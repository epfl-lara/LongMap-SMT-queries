; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133590 () Bool)

(assert start!133590)

(declare-fun b_free!32007 () Bool)

(declare-fun b_next!32007 () Bool)

(assert (=> start!133590 (= b_free!32007 (not b_next!32007))))

(declare-fun tp!113144 () Bool)

(declare-fun b_and!51525 () Bool)

(assert (=> start!133590 (= tp!113144 b_and!51525)))

(declare-fun res!1067906 () Bool)

(declare-fun e!870386 () Bool)

(assert (=> start!133590 (=> (not res!1067906) (not e!870386))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133590 (= res!1067906 (validMask!0 mask!947))))

(assert (=> start!133590 e!870386))

(assert (=> start!133590 tp!113144))

(declare-fun tp_is_empty!38673 () Bool)

(assert (=> start!133590 tp_is_empty!38673))

(assert (=> start!133590 true))

(declare-datatypes ((array!104064 0))(
  ( (array!104065 (arr!50224 (Array (_ BitVec 32) (_ BitVec 64))) (size!50774 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104064)

(declare-fun array_inv!39037 (array!104064) Bool)

(assert (=> start!133590 (array_inv!39037 _keys!637)))

(declare-datatypes ((V!59771 0))(
  ( (V!59772 (val!19420 Int)) )
))
(declare-datatypes ((ValueCell!18306 0))(
  ( (ValueCellFull!18306 (v!22172 V!59771)) (EmptyCell!18306) )
))
(declare-datatypes ((array!104066 0))(
  ( (array!104067 (arr!50225 (Array (_ BitVec 32) ValueCell!18306)) (size!50775 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104066)

(declare-fun e!870384 () Bool)

(declare-fun array_inv!39038 (array!104066) Bool)

(assert (=> start!133590 (and (array_inv!39038 _values!487) e!870384)))

(declare-fun b!1561886 () Bool)

(declare-fun e!870385 () Bool)

(assert (=> b!1561886 (= e!870385 tp_is_empty!38673)))

(declare-fun mapNonEmpty!59385 () Bool)

(declare-fun mapRes!59385 () Bool)

(declare-fun tp!113145 () Bool)

(declare-fun e!870388 () Bool)

(assert (=> mapNonEmpty!59385 (= mapRes!59385 (and tp!113145 e!870388))))

(declare-fun mapValue!59385 () ValueCell!18306)

(declare-fun mapKey!59385 () (_ BitVec 32))

(declare-fun mapRest!59385 () (Array (_ BitVec 32) ValueCell!18306))

(assert (=> mapNonEmpty!59385 (= (arr!50225 _values!487) (store mapRest!59385 mapKey!59385 mapValue!59385))))

(declare-fun b!1561887 () Bool)

(declare-fun res!1067910 () Bool)

(assert (=> b!1561887 (=> (not res!1067910) (not e!870386))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561887 (= res!1067910 (validKeyInArray!0 (select (arr!50224 _keys!637) from!782)))))

(declare-fun b!1561888 () Bool)

(assert (=> b!1561888 (= e!870384 (and e!870385 mapRes!59385))))

(declare-fun condMapEmpty!59385 () Bool)

(declare-fun mapDefault!59385 () ValueCell!18306)

(assert (=> b!1561888 (= condMapEmpty!59385 (= (arr!50225 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18306)) mapDefault!59385)))))

(declare-fun b!1561889 () Bool)

(declare-fun res!1067905 () Bool)

(assert (=> b!1561889 (=> (not res!1067905) (not e!870386))))

(declare-datatypes ((List!36460 0))(
  ( (Nil!36457) (Cons!36456 (h!37902 (_ BitVec 64)) (t!51257 List!36460)) )
))
(declare-fun arrayNoDuplicates!0 (array!104064 (_ BitVec 32) List!36460) Bool)

(assert (=> b!1561889 (= res!1067905 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36457))))

(declare-fun b!1561890 () Bool)

(declare-fun res!1067909 () Bool)

(assert (=> b!1561890 (=> (not res!1067909) (not e!870386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104064 (_ BitVec 32)) Bool)

(assert (=> b!1561890 (= res!1067909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59385 () Bool)

(assert (=> mapIsEmpty!59385 mapRes!59385))

(declare-fun b!1561891 () Bool)

(assert (=> b!1561891 (= e!870386 (not true))))

(declare-fun lt!671375 () Bool)

(declare-datatypes ((tuple2!25088 0))(
  ( (tuple2!25089 (_1!12555 (_ BitVec 64)) (_2!12555 V!59771)) )
))
(declare-datatypes ((List!36461 0))(
  ( (Nil!36458) (Cons!36457 (h!37903 tuple2!25088) (t!51258 List!36461)) )
))
(declare-datatypes ((ListLongMap!22523 0))(
  ( (ListLongMap!22524 (toList!11277 List!36461)) )
))
(declare-fun lt!671379 () ListLongMap!22523)

(declare-fun contains!10267 (ListLongMap!22523 (_ BitVec 64)) Bool)

(assert (=> b!1561891 (= lt!671375 (contains!10267 lt!671379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561891 (not (contains!10267 lt!671379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671376 () V!59771)

(declare-fun lt!671378 () ListLongMap!22523)

(declare-fun +!5047 (ListLongMap!22523 tuple2!25088) ListLongMap!22523)

(assert (=> b!1561891 (= lt!671379 (+!5047 lt!671378 (tuple2!25089 (select (arr!50224 _keys!637) from!782) lt!671376)))))

(declare-datatypes ((Unit!51948 0))(
  ( (Unit!51949) )
))
(declare-fun lt!671377 () Unit!51948)

(declare-fun addStillNotContains!537 (ListLongMap!22523 (_ BitVec 64) V!59771 (_ BitVec 64)) Unit!51948)

(assert (=> b!1561891 (= lt!671377 (addStillNotContains!537 lt!671378 (select (arr!50224 _keys!637) from!782) lt!671376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26226 (ValueCell!18306 V!59771) V!59771)

(declare-fun dynLambda!3831 (Int (_ BitVec 64)) V!59771)

(assert (=> b!1561891 (= lt!671376 (get!26226 (select (arr!50225 _values!487) from!782) (dynLambda!3831 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59771)

(declare-fun zeroValue!453 () V!59771)

(declare-fun getCurrentListMapNoExtraKeys!6661 (array!104064 array!104066 (_ BitVec 32) (_ BitVec 32) V!59771 V!59771 (_ BitVec 32) Int) ListLongMap!22523)

(assert (=> b!1561891 (= lt!671378 (getCurrentListMapNoExtraKeys!6661 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561892 () Bool)

(assert (=> b!1561892 (= e!870388 tp_is_empty!38673)))

(declare-fun b!1561893 () Bool)

(declare-fun res!1067908 () Bool)

(assert (=> b!1561893 (=> (not res!1067908) (not e!870386))))

(assert (=> b!1561893 (= res!1067908 (and (= (size!50775 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50774 _keys!637) (size!50775 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561894 () Bool)

(declare-fun res!1067907 () Bool)

(assert (=> b!1561894 (=> (not res!1067907) (not e!870386))))

(assert (=> b!1561894 (= res!1067907 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50774 _keys!637)) (bvslt from!782 (size!50774 _keys!637))))))

(assert (= (and start!133590 res!1067906) b!1561893))

(assert (= (and b!1561893 res!1067908) b!1561890))

(assert (= (and b!1561890 res!1067909) b!1561889))

(assert (= (and b!1561889 res!1067905) b!1561894))

(assert (= (and b!1561894 res!1067907) b!1561887))

(assert (= (and b!1561887 res!1067910) b!1561891))

(assert (= (and b!1561888 condMapEmpty!59385) mapIsEmpty!59385))

(assert (= (and b!1561888 (not condMapEmpty!59385)) mapNonEmpty!59385))

(get-info :version)

(assert (= (and mapNonEmpty!59385 ((_ is ValueCellFull!18306) mapValue!59385)) b!1561892))

(assert (= (and b!1561888 ((_ is ValueCellFull!18306) mapDefault!59385)) b!1561886))

(assert (= start!133590 b!1561888))

(declare-fun b_lambda!24881 () Bool)

(assert (=> (not b_lambda!24881) (not b!1561891)))

(declare-fun t!51256 () Bool)

(declare-fun tb!12551 () Bool)

(assert (=> (and start!133590 (= defaultEntry!495 defaultEntry!495) t!51256) tb!12551))

(declare-fun result!26383 () Bool)

(assert (=> tb!12551 (= result!26383 tp_is_empty!38673)))

(assert (=> b!1561891 t!51256))

(declare-fun b_and!51527 () Bool)

(assert (= b_and!51525 (and (=> t!51256 result!26383) b_and!51527)))

(declare-fun m!1437585 () Bool)

(assert (=> mapNonEmpty!59385 m!1437585))

(declare-fun m!1437587 () Bool)

(assert (=> b!1561887 m!1437587))

(assert (=> b!1561887 m!1437587))

(declare-fun m!1437589 () Bool)

(assert (=> b!1561887 m!1437589))

(declare-fun m!1437591 () Bool)

(assert (=> b!1561890 m!1437591))

(declare-fun m!1437593 () Bool)

(assert (=> b!1561891 m!1437593))

(declare-fun m!1437595 () Bool)

(assert (=> b!1561891 m!1437595))

(declare-fun m!1437597 () Bool)

(assert (=> b!1561891 m!1437597))

(assert (=> b!1561891 m!1437587))

(declare-fun m!1437599 () Bool)

(assert (=> b!1561891 m!1437599))

(assert (=> b!1561891 m!1437593))

(assert (=> b!1561891 m!1437587))

(declare-fun m!1437601 () Bool)

(assert (=> b!1561891 m!1437601))

(assert (=> b!1561891 m!1437595))

(declare-fun m!1437603 () Bool)

(assert (=> b!1561891 m!1437603))

(declare-fun m!1437605 () Bool)

(assert (=> b!1561891 m!1437605))

(declare-fun m!1437607 () Bool)

(assert (=> b!1561891 m!1437607))

(declare-fun m!1437609 () Bool)

(assert (=> b!1561889 m!1437609))

(declare-fun m!1437611 () Bool)

(assert (=> start!133590 m!1437611))

(declare-fun m!1437613 () Bool)

(assert (=> start!133590 m!1437613))

(declare-fun m!1437615 () Bool)

(assert (=> start!133590 m!1437615))

(check-sat (not b!1561887) (not b_next!32007) (not mapNonEmpty!59385) (not b!1561889) (not start!133590) (not b_lambda!24881) (not b!1561890) tp_is_empty!38673 b_and!51527 (not b!1561891))
(check-sat b_and!51527 (not b_next!32007))
