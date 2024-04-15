; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97436 () Bool)

(assert start!97436)

(declare-fun b_free!23413 () Bool)

(declare-fun b_next!23413 () Bool)

(assert (=> start!97436 (= b_free!23413 (not b_next!23413))))

(declare-fun tp!82537 () Bool)

(declare-fun b_and!37641 () Bool)

(assert (=> start!97436 (= tp!82537 b_and!37641)))

(declare-fun b!1111602 () Bool)

(declare-fun e!633827 () Bool)

(declare-fun tp_is_empty!27673 () Bool)

(assert (=> b!1111602 (= e!633827 tp_is_empty!27673)))

(declare-fun b!1111603 () Bool)

(declare-fun res!741811 () Bool)

(declare-fun e!633830 () Bool)

(assert (=> b!1111603 (=> (not res!741811) (not e!633830))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72156 0))(
  ( (array!72157 (arr!34731 (Array (_ BitVec 32) (_ BitVec 64))) (size!35269 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72156)

(assert (=> b!1111603 (= res!741811 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35269 _keys!1208))))))

(declare-fun b!1111604 () Bool)

(declare-fun res!741814 () Bool)

(assert (=> b!1111604 (=> (not res!741814) (not e!633830))))

(declare-datatypes ((List!24299 0))(
  ( (Nil!24296) (Cons!24295 (h!25504 (_ BitVec 64)) (t!34749 List!24299)) )
))
(declare-fun arrayNoDuplicates!0 (array!72156 (_ BitVec 32) List!24299) Bool)

(assert (=> b!1111604 (= res!741814 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24296))))

(declare-fun mapIsEmpty!43327 () Bool)

(declare-fun mapRes!43327 () Bool)

(assert (=> mapIsEmpty!43327 mapRes!43327))

(declare-fun mapNonEmpty!43327 () Bool)

(declare-fun tp!82538 () Bool)

(assert (=> mapNonEmpty!43327 (= mapRes!43327 (and tp!82538 e!633827))))

(declare-datatypes ((V!42025 0))(
  ( (V!42026 (val!13893 Int)) )
))
(declare-datatypes ((ValueCell!13127 0))(
  ( (ValueCellFull!13127 (v!16525 V!42025)) (EmptyCell!13127) )
))
(declare-fun mapRest!43327 () (Array (_ BitVec 32) ValueCell!13127))

(declare-fun mapValue!43327 () ValueCell!13127)

(declare-fun mapKey!43327 () (_ BitVec 32))

(declare-datatypes ((array!72158 0))(
  ( (array!72159 (arr!34732 (Array (_ BitVec 32) ValueCell!13127)) (size!35270 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72158)

(assert (=> mapNonEmpty!43327 (= (arr!34732 _values!996) (store mapRest!43327 mapKey!43327 mapValue!43327))))

(declare-fun b!1111606 () Bool)

(declare-fun res!741812 () Bool)

(assert (=> b!1111606 (=> (not res!741812) (not e!633830))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111606 (= res!741812 (validMask!0 mask!1564))))

(declare-fun b!1111607 () Bool)

(declare-fun e!633833 () Bool)

(assert (=> b!1111607 (= e!633830 e!633833)))

(declare-fun res!741815 () Bool)

(assert (=> b!1111607 (=> (not res!741815) (not e!633833))))

(declare-fun lt!496195 () array!72156)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72156 (_ BitVec 32)) Bool)

(assert (=> b!1111607 (= res!741815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496195 mask!1564))))

(assert (=> b!1111607 (= lt!496195 (array!72157 (store (arr!34731 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35269 _keys!1208)))))

(declare-fun b!1111608 () Bool)

(declare-fun e!633832 () Bool)

(declare-fun e!633831 () Bool)

(assert (=> b!1111608 (= e!633832 (and e!633831 mapRes!43327))))

(declare-fun condMapEmpty!43327 () Bool)

(declare-fun mapDefault!43327 () ValueCell!13127)

(assert (=> b!1111608 (= condMapEmpty!43327 (= (arr!34732 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13127)) mapDefault!43327)))))

(declare-fun b!1111609 () Bool)

(declare-fun res!741813 () Bool)

(assert (=> b!1111609 (=> (not res!741813) (not e!633830))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1111609 (= res!741813 (= (select (arr!34731 _keys!1208) i!673) k0!934))))

(declare-fun b!1111610 () Bool)

(assert (=> b!1111610 (= e!633831 tp_is_empty!27673)))

(declare-fun b!1111611 () Bool)

(declare-fun res!741816 () Bool)

(assert (=> b!1111611 (=> (not res!741816) (not e!633830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111611 (= res!741816 (validKeyInArray!0 k0!934))))

(declare-fun res!741810 () Bool)

(assert (=> start!97436 (=> (not res!741810) (not e!633830))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97436 (= res!741810 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35269 _keys!1208))))))

(assert (=> start!97436 e!633830))

(assert (=> start!97436 tp_is_empty!27673))

(declare-fun array_inv!26772 (array!72156) Bool)

(assert (=> start!97436 (array_inv!26772 _keys!1208)))

(assert (=> start!97436 true))

(assert (=> start!97436 tp!82537))

(declare-fun array_inv!26773 (array!72158) Bool)

(assert (=> start!97436 (and (array_inv!26773 _values!996) e!633832)))

(declare-fun b!1111605 () Bool)

(declare-fun res!741819 () Bool)

(assert (=> b!1111605 (=> (not res!741819) (not e!633830))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1111605 (= res!741819 (and (= (size!35270 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35269 _keys!1208) (size!35270 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111612 () Bool)

(declare-fun res!741818 () Bool)

(assert (=> b!1111612 (=> (not res!741818) (not e!633833))))

(assert (=> b!1111612 (= res!741818 (arrayNoDuplicates!0 lt!496195 #b00000000000000000000000000000000 Nil!24296))))

(declare-fun zeroValue!944 () V!42025)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46909 () Bool)

(declare-datatypes ((tuple2!17646 0))(
  ( (tuple2!17647 (_1!8834 (_ BitVec 64)) (_2!8834 V!42025)) )
))
(declare-datatypes ((List!24300 0))(
  ( (Nil!24297) (Cons!24296 (h!25505 tuple2!17646) (t!34750 List!24300)) )
))
(declare-datatypes ((ListLongMap!15615 0))(
  ( (ListLongMap!15616 (toList!7823 List!24300)) )
))
(declare-fun call!46912 () ListLongMap!15615)

(declare-fun minValue!944 () V!42025)

(declare-fun getCurrentListMapNoExtraKeys!4334 (array!72156 array!72158 (_ BitVec 32) (_ BitVec 32) V!42025 V!42025 (_ BitVec 32) Int) ListLongMap!15615)

(assert (=> bm!46909 (= call!46912 (getCurrentListMapNoExtraKeys!4334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111613 () Bool)

(declare-fun e!633834 () Bool)

(declare-fun call!46913 () ListLongMap!15615)

(declare-fun -!1034 (ListLongMap!15615 (_ BitVec 64)) ListLongMap!15615)

(assert (=> b!1111613 (= e!633834 (= call!46913 (-!1034 call!46912 k0!934)))))

(declare-fun b!1111614 () Bool)

(declare-fun res!741820 () Bool)

(assert (=> b!1111614 (=> (not res!741820) (not e!633830))))

(assert (=> b!1111614 (= res!741820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46910 () Bool)

(declare-fun dynLambda!2397 (Int (_ BitVec 64)) V!42025)

(assert (=> bm!46910 (= call!46913 (getCurrentListMapNoExtraKeys!4334 lt!496195 (array!72159 (store (arr!34732 _values!996) i!673 (ValueCellFull!13127 (dynLambda!2397 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35270 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111615 () Bool)

(declare-fun e!633828 () Bool)

(assert (=> b!1111615 (= e!633833 (not e!633828))))

(declare-fun res!741817 () Bool)

(assert (=> b!1111615 (=> res!741817 e!633828)))

(assert (=> b!1111615 (= res!741817 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35269 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111615 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36295 0))(
  ( (Unit!36296) )
))
(declare-fun lt!496197 () Unit!36295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72156 (_ BitVec 64) (_ BitVec 32)) Unit!36295)

(assert (=> b!1111615 (= lt!496197 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111616 () Bool)

(assert (=> b!1111616 (= e!633834 (= call!46913 call!46912))))

(declare-fun b!1111617 () Bool)

(assert (=> b!1111617 (= e!633828 true)))

(assert (=> b!1111617 e!633834))

(declare-fun c!109290 () Bool)

(assert (=> b!1111617 (= c!109290 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496196 () Unit!36295)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!307 (array!72156 array!72158 (_ BitVec 32) (_ BitVec 32) V!42025 V!42025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36295)

(assert (=> b!1111617 (= lt!496196 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97436 res!741810) b!1111606))

(assert (= (and b!1111606 res!741812) b!1111605))

(assert (= (and b!1111605 res!741819) b!1111614))

(assert (= (and b!1111614 res!741820) b!1111604))

(assert (= (and b!1111604 res!741814) b!1111603))

(assert (= (and b!1111603 res!741811) b!1111611))

(assert (= (and b!1111611 res!741816) b!1111609))

(assert (= (and b!1111609 res!741813) b!1111607))

(assert (= (and b!1111607 res!741815) b!1111612))

(assert (= (and b!1111612 res!741818) b!1111615))

(assert (= (and b!1111615 (not res!741817)) b!1111617))

(assert (= (and b!1111617 c!109290) b!1111613))

(assert (= (and b!1111617 (not c!109290)) b!1111616))

(assert (= (or b!1111613 b!1111616) bm!46910))

(assert (= (or b!1111613 b!1111616) bm!46909))

(assert (= (and b!1111608 condMapEmpty!43327) mapIsEmpty!43327))

(assert (= (and b!1111608 (not condMapEmpty!43327)) mapNonEmpty!43327))

(get-info :version)

(assert (= (and mapNonEmpty!43327 ((_ is ValueCellFull!13127) mapValue!43327)) b!1111602))

(assert (= (and b!1111608 ((_ is ValueCellFull!13127) mapDefault!43327)) b!1111610))

(assert (= start!97436 b!1111608))

(declare-fun b_lambda!18419 () Bool)

(assert (=> (not b_lambda!18419) (not bm!46910)))

(declare-fun t!34748 () Bool)

(declare-fun tb!8271 () Bool)

(assert (=> (and start!97436 (= defaultEntry!1004 defaultEntry!1004) t!34748) tb!8271))

(declare-fun result!17111 () Bool)

(assert (=> tb!8271 (= result!17111 tp_is_empty!27673)))

(assert (=> bm!46910 t!34748))

(declare-fun b_and!37643 () Bool)

(assert (= b_and!37641 (and (=> t!34748 result!17111) b_and!37643)))

(declare-fun m!1028823 () Bool)

(assert (=> b!1111615 m!1028823))

(declare-fun m!1028825 () Bool)

(assert (=> b!1111615 m!1028825))

(declare-fun m!1028827 () Bool)

(assert (=> mapNonEmpty!43327 m!1028827))

(declare-fun m!1028829 () Bool)

(assert (=> b!1111606 m!1028829))

(declare-fun m!1028831 () Bool)

(assert (=> b!1111611 m!1028831))

(declare-fun m!1028833 () Bool)

(assert (=> start!97436 m!1028833))

(declare-fun m!1028835 () Bool)

(assert (=> start!97436 m!1028835))

(declare-fun m!1028837 () Bool)

(assert (=> b!1111609 m!1028837))

(declare-fun m!1028839 () Bool)

(assert (=> b!1111613 m!1028839))

(declare-fun m!1028841 () Bool)

(assert (=> b!1111612 m!1028841))

(declare-fun m!1028843 () Bool)

(assert (=> b!1111607 m!1028843))

(declare-fun m!1028845 () Bool)

(assert (=> b!1111607 m!1028845))

(declare-fun m!1028847 () Bool)

(assert (=> bm!46909 m!1028847))

(declare-fun m!1028849 () Bool)

(assert (=> bm!46910 m!1028849))

(declare-fun m!1028851 () Bool)

(assert (=> bm!46910 m!1028851))

(declare-fun m!1028853 () Bool)

(assert (=> bm!46910 m!1028853))

(declare-fun m!1028855 () Bool)

(assert (=> b!1111604 m!1028855))

(declare-fun m!1028857 () Bool)

(assert (=> b!1111614 m!1028857))

(declare-fun m!1028859 () Bool)

(assert (=> b!1111617 m!1028859))

(check-sat (not mapNonEmpty!43327) (not b!1111607) (not bm!46909) (not bm!46910) (not b_next!23413) (not b!1111613) (not b!1111614) (not b!1111615) (not b!1111606) (not b!1111617) (not b!1111611) (not b!1111604) (not b_lambda!18419) tp_is_empty!27673 b_and!37643 (not start!97436) (not b!1111612))
(check-sat b_and!37643 (not b_next!23413))
