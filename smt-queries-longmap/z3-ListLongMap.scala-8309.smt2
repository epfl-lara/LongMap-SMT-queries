; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101438 () Bool)

(assert start!101438)

(declare-fun b_free!26125 () Bool)

(declare-fun b_next!26125 () Bool)

(assert (=> start!101438 (= b_free!26125 (not b_next!26125))))

(declare-fun tp!91397 () Bool)

(declare-fun b_and!43369 () Bool)

(assert (=> start!101438 (= tp!91397 b_and!43369)))

(declare-fun b!1216311 () Bool)

(declare-fun res!807204 () Bool)

(declare-fun e!690781 () Bool)

(assert (=> b!1216311 (=> (not res!807204) (not e!690781))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78477 0))(
  ( (array!78478 (arr!37867 (Array (_ BitVec 32) (_ BitVec 64))) (size!38404 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78477)

(assert (=> b!1216311 (= res!807204 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38404 _keys!1208))))))

(declare-fun b!1216312 () Bool)

(declare-fun res!807207 () Bool)

(declare-fun e!690775 () Bool)

(assert (=> b!1216312 (=> (not res!807207) (not e!690775))))

(declare-fun lt!552981 () array!78477)

(declare-datatypes ((List!26709 0))(
  ( (Nil!26706) (Cons!26705 (h!27923 (_ BitVec 64)) (t!39806 List!26709)) )
))
(declare-fun arrayNoDuplicates!0 (array!78477 (_ BitVec 32) List!26709) Bool)

(assert (=> b!1216312 (= res!807207 (arrayNoDuplicates!0 lt!552981 #b00000000000000000000000000000000 Nil!26706))))

(declare-fun b!1216313 () Bool)

(declare-fun res!807208 () Bool)

(assert (=> b!1216313 (=> (not res!807208) (not e!690781))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46233 0))(
  ( (V!46234 (val!15471 Int)) )
))
(declare-datatypes ((ValueCell!14705 0))(
  ( (ValueCellFull!14705 (v!18120 V!46233)) (EmptyCell!14705) )
))
(declare-datatypes ((array!78479 0))(
  ( (array!78480 (arr!37868 (Array (_ BitVec 32) ValueCell!14705)) (size!38405 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78479)

(assert (=> b!1216313 (= res!807208 (and (= (size!38405 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38404 _keys!1208) (size!38405 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216314 () Bool)

(declare-fun res!807198 () Bool)

(assert (=> b!1216314 (=> (not res!807198) (not e!690781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216314 (= res!807198 (validMask!0 mask!1564))))

(declare-fun b!1216315 () Bool)

(declare-fun res!807202 () Bool)

(assert (=> b!1216315 (=> (not res!807202) (not e!690781))))

(assert (=> b!1216315 (= res!807202 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26706))))

(declare-fun b!1216316 () Bool)

(declare-fun e!690776 () Bool)

(assert (=> b!1216316 (= e!690776 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46233)

(declare-fun zeroValue!944 () V!46233)

(declare-datatypes ((tuple2!19906 0))(
  ( (tuple2!19907 (_1!9964 (_ BitVec 64)) (_2!9964 V!46233)) )
))
(declare-datatypes ((List!26710 0))(
  ( (Nil!26707) (Cons!26706 (h!27924 tuple2!19906) (t!39807 List!26710)) )
))
(declare-datatypes ((ListLongMap!17883 0))(
  ( (ListLongMap!17884 (toList!8957 List!26710)) )
))
(declare-fun lt!552983 () ListLongMap!17883)

(declare-fun getCurrentListMapNoExtraKeys!5414 (array!78477 array!78479 (_ BitVec 32) (_ BitVec 32) V!46233 V!46233 (_ BitVec 32) Int) ListLongMap!17883)

(declare-fun dynLambda!3326 (Int (_ BitVec 64)) V!46233)

(assert (=> b!1216316 (= lt!552983 (getCurrentListMapNoExtraKeys!5414 lt!552981 (array!78480 (store (arr!37868 _values!996) i!673 (ValueCellFull!14705 (dynLambda!3326 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38405 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552984 () ListLongMap!17883)

(assert (=> b!1216316 (= lt!552984 (getCurrentListMapNoExtraKeys!5414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216317 () Bool)

(assert (=> b!1216317 (= e!690775 (not e!690776))))

(declare-fun res!807200 () Bool)

(assert (=> b!1216317 (=> res!807200 e!690776)))

(assert (=> b!1216317 (= res!807200 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216317 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40264 0))(
  ( (Unit!40265) )
))
(declare-fun lt!552982 () Unit!40264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78477 (_ BitVec 64) (_ BitVec 32)) Unit!40264)

(assert (=> b!1216317 (= lt!552982 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216318 () Bool)

(declare-fun e!690779 () Bool)

(declare-fun e!690778 () Bool)

(declare-fun mapRes!48118 () Bool)

(assert (=> b!1216318 (= e!690779 (and e!690778 mapRes!48118))))

(declare-fun condMapEmpty!48118 () Bool)

(declare-fun mapDefault!48118 () ValueCell!14705)

(assert (=> b!1216318 (= condMapEmpty!48118 (= (arr!37868 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14705)) mapDefault!48118)))))

(declare-fun b!1216319 () Bool)

(declare-fun e!690780 () Bool)

(declare-fun tp_is_empty!30829 () Bool)

(assert (=> b!1216319 (= e!690780 tp_is_empty!30829)))

(declare-fun b!1216320 () Bool)

(declare-fun res!807203 () Bool)

(assert (=> b!1216320 (=> (not res!807203) (not e!690781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78477 (_ BitVec 32)) Bool)

(assert (=> b!1216320 (= res!807203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48118 () Bool)

(assert (=> mapIsEmpty!48118 mapRes!48118))

(declare-fun res!807199 () Bool)

(assert (=> start!101438 (=> (not res!807199) (not e!690781))))

(assert (=> start!101438 (= res!807199 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38404 _keys!1208))))))

(assert (=> start!101438 e!690781))

(assert (=> start!101438 tp_is_empty!30829))

(declare-fun array_inv!28900 (array!78477) Bool)

(assert (=> start!101438 (array_inv!28900 _keys!1208)))

(assert (=> start!101438 true))

(assert (=> start!101438 tp!91397))

(declare-fun array_inv!28901 (array!78479) Bool)

(assert (=> start!101438 (and (array_inv!28901 _values!996) e!690779)))

(declare-fun b!1216321 () Bool)

(assert (=> b!1216321 (= e!690781 e!690775)))

(declare-fun res!807201 () Bool)

(assert (=> b!1216321 (=> (not res!807201) (not e!690775))))

(assert (=> b!1216321 (= res!807201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552981 mask!1564))))

(assert (=> b!1216321 (= lt!552981 (array!78478 (store (arr!37867 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38404 _keys!1208)))))

(declare-fun b!1216322 () Bool)

(assert (=> b!1216322 (= e!690778 tp_is_empty!30829)))

(declare-fun b!1216323 () Bool)

(declare-fun res!807205 () Bool)

(assert (=> b!1216323 (=> (not res!807205) (not e!690781))))

(assert (=> b!1216323 (= res!807205 (= (select (arr!37867 _keys!1208) i!673) k0!934))))

(declare-fun b!1216324 () Bool)

(declare-fun res!807206 () Bool)

(assert (=> b!1216324 (=> (not res!807206) (not e!690781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216324 (= res!807206 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48118 () Bool)

(declare-fun tp!91396 () Bool)

(assert (=> mapNonEmpty!48118 (= mapRes!48118 (and tp!91396 e!690780))))

(declare-fun mapRest!48118 () (Array (_ BitVec 32) ValueCell!14705))

(declare-fun mapKey!48118 () (_ BitVec 32))

(declare-fun mapValue!48118 () ValueCell!14705)

(assert (=> mapNonEmpty!48118 (= (arr!37868 _values!996) (store mapRest!48118 mapKey!48118 mapValue!48118))))

(assert (= (and start!101438 res!807199) b!1216314))

(assert (= (and b!1216314 res!807198) b!1216313))

(assert (= (and b!1216313 res!807208) b!1216320))

(assert (= (and b!1216320 res!807203) b!1216315))

(assert (= (and b!1216315 res!807202) b!1216311))

(assert (= (and b!1216311 res!807204) b!1216324))

(assert (= (and b!1216324 res!807206) b!1216323))

(assert (= (and b!1216323 res!807205) b!1216321))

(assert (= (and b!1216321 res!807201) b!1216312))

(assert (= (and b!1216312 res!807207) b!1216317))

(assert (= (and b!1216317 (not res!807200)) b!1216316))

(assert (= (and b!1216318 condMapEmpty!48118) mapIsEmpty!48118))

(assert (= (and b!1216318 (not condMapEmpty!48118)) mapNonEmpty!48118))

(get-info :version)

(assert (= (and mapNonEmpty!48118 ((_ is ValueCellFull!14705) mapValue!48118)) b!1216319))

(assert (= (and b!1216318 ((_ is ValueCellFull!14705) mapDefault!48118)) b!1216322))

(assert (= start!101438 b!1216318))

(declare-fun b_lambda!21795 () Bool)

(assert (=> (not b_lambda!21795) (not b!1216316)))

(declare-fun t!39805 () Bool)

(declare-fun tb!10917 () Bool)

(assert (=> (and start!101438 (= defaultEntry!1004 defaultEntry!1004) t!39805) tb!10917))

(declare-fun result!22439 () Bool)

(assert (=> tb!10917 (= result!22439 tp_is_empty!30829)))

(assert (=> b!1216316 t!39805))

(declare-fun b_and!43371 () Bool)

(assert (= b_and!43369 (and (=> t!39805 result!22439) b_and!43371)))

(declare-fun m!1121679 () Bool)

(assert (=> b!1216324 m!1121679))

(declare-fun m!1121681 () Bool)

(assert (=> b!1216312 m!1121681))

(declare-fun m!1121683 () Bool)

(assert (=> mapNonEmpty!48118 m!1121683))

(declare-fun m!1121685 () Bool)

(assert (=> b!1216321 m!1121685))

(declare-fun m!1121687 () Bool)

(assert (=> b!1216321 m!1121687))

(declare-fun m!1121689 () Bool)

(assert (=> b!1216320 m!1121689))

(declare-fun m!1121691 () Bool)

(assert (=> b!1216315 m!1121691))

(declare-fun m!1121693 () Bool)

(assert (=> b!1216316 m!1121693))

(declare-fun m!1121695 () Bool)

(assert (=> b!1216316 m!1121695))

(declare-fun m!1121697 () Bool)

(assert (=> b!1216316 m!1121697))

(declare-fun m!1121699 () Bool)

(assert (=> b!1216316 m!1121699))

(declare-fun m!1121701 () Bool)

(assert (=> b!1216314 m!1121701))

(declare-fun m!1121703 () Bool)

(assert (=> b!1216323 m!1121703))

(declare-fun m!1121705 () Bool)

(assert (=> start!101438 m!1121705))

(declare-fun m!1121707 () Bool)

(assert (=> start!101438 m!1121707))

(declare-fun m!1121709 () Bool)

(assert (=> b!1216317 m!1121709))

(declare-fun m!1121711 () Bool)

(assert (=> b!1216317 m!1121711))

(check-sat tp_is_empty!30829 (not b!1216324) (not b_lambda!21795) (not b!1216314) (not start!101438) (not mapNonEmpty!48118) (not b!1216315) (not b!1216312) (not b!1216320) (not b!1216321) (not b!1216317) (not b!1216316) (not b_next!26125) b_and!43371)
(check-sat b_and!43371 (not b_next!26125))
