; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101414 () Bool)

(assert start!101414)

(declare-fun b_free!26101 () Bool)

(declare-fun b_next!26101 () Bool)

(assert (=> start!101414 (= b_free!26101 (not b_next!26101))))

(declare-fun tp!91324 () Bool)

(declare-fun b_and!43321 () Bool)

(assert (=> start!101414 (= tp!91324 b_and!43321)))

(declare-fun b!1215783 () Bool)

(declare-fun res!806805 () Bool)

(declare-fun e!690523 () Bool)

(assert (=> b!1215783 (=> (not res!806805) (not e!690523))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215783 (= res!806805 (validMask!0 mask!1564))))

(declare-fun b!1215784 () Bool)

(declare-fun res!806802 () Bool)

(declare-fun e!690524 () Bool)

(assert (=> b!1215784 (=> (not res!806802) (not e!690524))))

(declare-datatypes ((array!78431 0))(
  ( (array!78432 (arr!37844 (Array (_ BitVec 32) (_ BitVec 64))) (size!38381 (_ BitVec 32))) )
))
(declare-fun lt!552838 () array!78431)

(declare-datatypes ((List!26691 0))(
  ( (Nil!26688) (Cons!26687 (h!27905 (_ BitVec 64)) (t!39764 List!26691)) )
))
(declare-fun arrayNoDuplicates!0 (array!78431 (_ BitVec 32) List!26691) Bool)

(assert (=> b!1215784 (= res!806802 (arrayNoDuplicates!0 lt!552838 #b00000000000000000000000000000000 Nil!26688))))

(declare-fun b!1215785 () Bool)

(declare-fun res!806807 () Bool)

(assert (=> b!1215785 (=> (not res!806807) (not e!690523))))

(declare-fun _keys!1208 () array!78431)

(assert (=> b!1215785 (= res!806807 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26688))))

(declare-fun b!1215786 () Bool)

(declare-fun res!806811 () Bool)

(assert (=> b!1215786 (=> (not res!806811) (not e!690523))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46201 0))(
  ( (V!46202 (val!15459 Int)) )
))
(declare-datatypes ((ValueCell!14693 0))(
  ( (ValueCellFull!14693 (v!18108 V!46201)) (EmptyCell!14693) )
))
(declare-datatypes ((array!78433 0))(
  ( (array!78434 (arr!37845 (Array (_ BitVec 32) ValueCell!14693)) (size!38382 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78433)

(assert (=> b!1215786 (= res!806811 (and (= (size!38382 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38381 _keys!1208) (size!38382 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215787 () Bool)

(declare-fun res!806803 () Bool)

(assert (=> b!1215787 (=> (not res!806803) (not e!690523))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215787 (= res!806803 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38381 _keys!1208))))))

(declare-fun mapIsEmpty!48082 () Bool)

(declare-fun mapRes!48082 () Bool)

(assert (=> mapIsEmpty!48082 mapRes!48082))

(declare-fun b!1215788 () Bool)

(declare-fun res!806808 () Bool)

(assert (=> b!1215788 (=> (not res!806808) (not e!690523))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215788 (= res!806808 (validKeyInArray!0 k0!934))))

(declare-fun res!806809 () Bool)

(assert (=> start!101414 (=> (not res!806809) (not e!690523))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101414 (= res!806809 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38381 _keys!1208))))))

(assert (=> start!101414 e!690523))

(declare-fun tp_is_empty!30805 () Bool)

(assert (=> start!101414 tp_is_empty!30805))

(declare-fun array_inv!28882 (array!78431) Bool)

(assert (=> start!101414 (array_inv!28882 _keys!1208)))

(assert (=> start!101414 true))

(assert (=> start!101414 tp!91324))

(declare-fun e!690525 () Bool)

(declare-fun array_inv!28883 (array!78433) Bool)

(assert (=> start!101414 (and (array_inv!28883 _values!996) e!690525)))

(declare-fun b!1215789 () Bool)

(declare-fun e!690526 () Bool)

(assert (=> b!1215789 (= e!690525 (and e!690526 mapRes!48082))))

(declare-fun condMapEmpty!48082 () Bool)

(declare-fun mapDefault!48082 () ValueCell!14693)

(assert (=> b!1215789 (= condMapEmpty!48082 (= (arr!37845 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14693)) mapDefault!48082)))))

(declare-fun b!1215790 () Bool)

(assert (=> b!1215790 (= e!690526 tp_is_empty!30805)))

(declare-fun b!1215791 () Bool)

(assert (=> b!1215791 (= e!690523 e!690524)))

(declare-fun res!806804 () Bool)

(assert (=> b!1215791 (=> (not res!806804) (not e!690524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78431 (_ BitVec 32)) Bool)

(assert (=> b!1215791 (= res!806804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552838 mask!1564))))

(assert (=> b!1215791 (= lt!552838 (array!78432 (store (arr!37844 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38381 _keys!1208)))))

(declare-fun b!1215792 () Bool)

(declare-fun res!806810 () Bool)

(assert (=> b!1215792 (=> (not res!806810) (not e!690523))))

(assert (=> b!1215792 (= res!806810 (= (select (arr!37844 _keys!1208) i!673) k0!934))))

(declare-fun b!1215793 () Bool)

(declare-fun e!690529 () Bool)

(assert (=> b!1215793 (= e!690524 (not e!690529))))

(declare-fun res!806812 () Bool)

(assert (=> b!1215793 (=> res!806812 e!690529)))

(assert (=> b!1215793 (= res!806812 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215793 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40246 0))(
  ( (Unit!40247) )
))
(declare-fun lt!552839 () Unit!40246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78431 (_ BitVec 64) (_ BitVec 32)) Unit!40246)

(assert (=> b!1215793 (= lt!552839 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48082 () Bool)

(declare-fun tp!91325 () Bool)

(declare-fun e!690528 () Bool)

(assert (=> mapNonEmpty!48082 (= mapRes!48082 (and tp!91325 e!690528))))

(declare-fun mapRest!48082 () (Array (_ BitVec 32) ValueCell!14693))

(declare-fun mapKey!48082 () (_ BitVec 32))

(declare-fun mapValue!48082 () ValueCell!14693)

(assert (=> mapNonEmpty!48082 (= (arr!37845 _values!996) (store mapRest!48082 mapKey!48082 mapValue!48082))))

(declare-fun b!1215794 () Bool)

(assert (=> b!1215794 (= e!690528 tp_is_empty!30805)))

(declare-fun b!1215795 () Bool)

(assert (=> b!1215795 (= e!690529 true)))

(declare-datatypes ((tuple2!19890 0))(
  ( (tuple2!19891 (_1!9956 (_ BitVec 64)) (_2!9956 V!46201)) )
))
(declare-datatypes ((List!26692 0))(
  ( (Nil!26689) (Cons!26688 (h!27906 tuple2!19890) (t!39765 List!26692)) )
))
(declare-datatypes ((ListLongMap!17867 0))(
  ( (ListLongMap!17868 (toList!8949 List!26692)) )
))
(declare-fun lt!552837 () ListLongMap!17867)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46201)

(declare-fun zeroValue!944 () V!46201)

(declare-fun getCurrentListMapNoExtraKeys!5406 (array!78431 array!78433 (_ BitVec 32) (_ BitVec 32) V!46201 V!46201 (_ BitVec 32) Int) ListLongMap!17867)

(declare-fun dynLambda!3318 (Int (_ BitVec 64)) V!46201)

(assert (=> b!1215795 (= lt!552837 (getCurrentListMapNoExtraKeys!5406 lt!552838 (array!78434 (store (arr!37845 _values!996) i!673 (ValueCellFull!14693 (dynLambda!3318 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38382 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552840 () ListLongMap!17867)

(assert (=> b!1215795 (= lt!552840 (getCurrentListMapNoExtraKeys!5406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215796 () Bool)

(declare-fun res!806806 () Bool)

(assert (=> b!1215796 (=> (not res!806806) (not e!690523))))

(assert (=> b!1215796 (= res!806806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101414 res!806809) b!1215783))

(assert (= (and b!1215783 res!806805) b!1215786))

(assert (= (and b!1215786 res!806811) b!1215796))

(assert (= (and b!1215796 res!806806) b!1215785))

(assert (= (and b!1215785 res!806807) b!1215787))

(assert (= (and b!1215787 res!806803) b!1215788))

(assert (= (and b!1215788 res!806808) b!1215792))

(assert (= (and b!1215792 res!806810) b!1215791))

(assert (= (and b!1215791 res!806804) b!1215784))

(assert (= (and b!1215784 res!806802) b!1215793))

(assert (= (and b!1215793 (not res!806812)) b!1215795))

(assert (= (and b!1215789 condMapEmpty!48082) mapIsEmpty!48082))

(assert (= (and b!1215789 (not condMapEmpty!48082)) mapNonEmpty!48082))

(get-info :version)

(assert (= (and mapNonEmpty!48082 ((_ is ValueCellFull!14693) mapValue!48082)) b!1215794))

(assert (= (and b!1215789 ((_ is ValueCellFull!14693) mapDefault!48082)) b!1215790))

(assert (= start!101414 b!1215789))

(declare-fun b_lambda!21771 () Bool)

(assert (=> (not b_lambda!21771) (not b!1215795)))

(declare-fun t!39763 () Bool)

(declare-fun tb!10893 () Bool)

(assert (=> (and start!101414 (= defaultEntry!1004 defaultEntry!1004) t!39763) tb!10893))

(declare-fun result!22391 () Bool)

(assert (=> tb!10893 (= result!22391 tp_is_empty!30805)))

(assert (=> b!1215795 t!39763))

(declare-fun b_and!43323 () Bool)

(assert (= b_and!43321 (and (=> t!39763 result!22391) b_and!43323)))

(declare-fun m!1121271 () Bool)

(assert (=> b!1215788 m!1121271))

(declare-fun m!1121273 () Bool)

(assert (=> start!101414 m!1121273))

(declare-fun m!1121275 () Bool)

(assert (=> start!101414 m!1121275))

(declare-fun m!1121277 () Bool)

(assert (=> b!1215784 m!1121277))

(declare-fun m!1121279 () Bool)

(assert (=> b!1215783 m!1121279))

(declare-fun m!1121281 () Bool)

(assert (=> b!1215795 m!1121281))

(declare-fun m!1121283 () Bool)

(assert (=> b!1215795 m!1121283))

(declare-fun m!1121285 () Bool)

(assert (=> b!1215795 m!1121285))

(declare-fun m!1121287 () Bool)

(assert (=> b!1215795 m!1121287))

(declare-fun m!1121289 () Bool)

(assert (=> mapNonEmpty!48082 m!1121289))

(declare-fun m!1121291 () Bool)

(assert (=> b!1215791 m!1121291))

(declare-fun m!1121293 () Bool)

(assert (=> b!1215791 m!1121293))

(declare-fun m!1121295 () Bool)

(assert (=> b!1215793 m!1121295))

(declare-fun m!1121297 () Bool)

(assert (=> b!1215793 m!1121297))

(declare-fun m!1121299 () Bool)

(assert (=> b!1215796 m!1121299))

(declare-fun m!1121301 () Bool)

(assert (=> b!1215785 m!1121301))

(declare-fun m!1121303 () Bool)

(assert (=> b!1215792 m!1121303))

(check-sat (not b!1215791) (not b!1215793) (not b!1215795) (not b!1215796) tp_is_empty!30805 (not b!1215785) (not b!1215783) b_and!43323 (not mapNonEmpty!48082) (not b!1215788) (not b_lambda!21771) (not start!101414) (not b!1215784) (not b_next!26101))
(check-sat b_and!43323 (not b_next!26101))
