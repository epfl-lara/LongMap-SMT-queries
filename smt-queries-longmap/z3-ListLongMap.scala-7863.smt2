; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97916 () Bool)

(assert start!97916)

(declare-fun b_free!23623 () Bool)

(declare-fun b_next!23623 () Bool)

(assert (=> start!97916 (= b_free!23623 (not b_next!23623))))

(declare-fun tp!83573 () Bool)

(declare-fun b_and!38007 () Bool)

(assert (=> start!97916 (= tp!83573 b_and!38007)))

(declare-fun b!1121723 () Bool)

(declare-fun e!638644 () Bool)

(declare-fun e!638651 () Bool)

(assert (=> b!1121723 (= e!638644 e!638651)))

(declare-fun res!749403 () Bool)

(assert (=> b!1121723 (=> res!749403 e!638651)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121723 (= res!749403 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42665 0))(
  ( (V!42666 (val!14133 Int)) )
))
(declare-fun zeroValue!944 () V!42665)

(declare-datatypes ((array!73098 0))(
  ( (array!73099 (arr!35202 (Array (_ BitVec 32) (_ BitVec 64))) (size!35740 (_ BitVec 32))) )
))
(declare-fun lt!498303 () array!73098)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42665)

(declare-datatypes ((tuple2!17806 0))(
  ( (tuple2!17807 (_1!8914 (_ BitVec 64)) (_2!8914 V!42665)) )
))
(declare-datatypes ((List!24577 0))(
  ( (Nil!24574) (Cons!24573 (h!25782 tuple2!17806) (t!35183 List!24577)) )
))
(declare-datatypes ((ListLongMap!15775 0))(
  ( (ListLongMap!15776 (toList!7903 List!24577)) )
))
(declare-fun lt!498302 () ListLongMap!15775)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13367 0))(
  ( (ValueCellFull!13367 (v!16765 V!42665)) (EmptyCell!13367) )
))
(declare-datatypes ((array!73100 0))(
  ( (array!73101 (arr!35203 (Array (_ BitVec 32) ValueCell!13367)) (size!35741 (_ BitVec 32))) )
))
(declare-fun lt!498301 () array!73100)

(declare-fun getCurrentListMapNoExtraKeys!4410 (array!73098 array!73100 (_ BitVec 32) (_ BitVec 32) V!42665 V!42665 (_ BitVec 32) Int) ListLongMap!15775)

(assert (=> b!1121723 (= lt!498302 (getCurrentListMapNoExtraKeys!4410 lt!498303 lt!498301 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73100)

(declare-fun dynLambda!2450 (Int (_ BitVec 64)) V!42665)

(assert (=> b!1121723 (= lt!498301 (array!73101 (store (arr!35203 _values!996) i!673 (ValueCellFull!13367 (dynLambda!2450 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35741 _values!996)))))

(declare-fun _keys!1208 () array!73098)

(declare-fun lt!498298 () ListLongMap!15775)

(assert (=> b!1121723 (= lt!498298 (getCurrentListMapNoExtraKeys!4410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121724 () Bool)

(declare-fun res!749407 () Bool)

(declare-fun e!638647 () Bool)

(assert (=> b!1121724 (=> (not res!749407) (not e!638647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73098 (_ BitVec 32)) Bool)

(assert (=> b!1121724 (= res!749407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121725 () Bool)

(declare-fun res!749409 () Bool)

(assert (=> b!1121725 (=> (not res!749409) (not e!638647))))

(assert (=> b!1121725 (= res!749409 (and (= (size!35741 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35740 _keys!1208) (size!35741 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121726 () Bool)

(declare-fun res!749401 () Bool)

(assert (=> b!1121726 (=> (not res!749401) (not e!638647))))

(assert (=> b!1121726 (= res!749401 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35740 _keys!1208))))))

(declare-fun b!1121728 () Bool)

(declare-fun res!749405 () Bool)

(assert (=> b!1121728 (=> (not res!749405) (not e!638647))))

(declare-datatypes ((List!24578 0))(
  ( (Nil!24575) (Cons!24574 (h!25783 (_ BitVec 64)) (t!35184 List!24578)) )
))
(declare-fun arrayNoDuplicates!0 (array!73098 (_ BitVec 32) List!24578) Bool)

(assert (=> b!1121728 (= res!749405 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24575))))

(declare-fun mapIsEmpty!44047 () Bool)

(declare-fun mapRes!44047 () Bool)

(assert (=> mapIsEmpty!44047 mapRes!44047))

(declare-fun call!47129 () ListLongMap!15775)

(declare-fun bm!47125 () Bool)

(assert (=> bm!47125 (= call!47129 (getCurrentListMapNoExtraKeys!4410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121729 () Bool)

(declare-fun e!638650 () Bool)

(declare-fun e!638645 () Bool)

(assert (=> b!1121729 (= e!638650 (and e!638645 mapRes!44047))))

(declare-fun condMapEmpty!44047 () Bool)

(declare-fun mapDefault!44047 () ValueCell!13367)

(assert (=> b!1121729 (= condMapEmpty!44047 (= (arr!35203 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13367)) mapDefault!44047)))))

(declare-fun b!1121730 () Bool)

(declare-fun e!638648 () Bool)

(declare-fun call!47128 () ListLongMap!15775)

(assert (=> b!1121730 (= e!638648 (= call!47128 call!47129))))

(declare-fun bm!47126 () Bool)

(assert (=> bm!47126 (= call!47128 (getCurrentListMapNoExtraKeys!4410 lt!498303 lt!498301 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121731 () Bool)

(declare-fun e!638649 () Bool)

(assert (=> b!1121731 (= e!638647 e!638649)))

(declare-fun res!749410 () Bool)

(assert (=> b!1121731 (=> (not res!749410) (not e!638649))))

(assert (=> b!1121731 (= res!749410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498303 mask!1564))))

(assert (=> b!1121731 (= lt!498303 (array!73099 (store (arr!35202 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35740 _keys!1208)))))

(declare-fun b!1121732 () Bool)

(assert (=> b!1121732 (= e!638649 (not e!638644))))

(declare-fun res!749404 () Bool)

(assert (=> b!1121732 (=> res!749404 e!638644)))

(assert (=> b!1121732 (= res!749404 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121732 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36631 0))(
  ( (Unit!36632) )
))
(declare-fun lt!498299 () Unit!36631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73098 (_ BitVec 64) (_ BitVec 32)) Unit!36631)

(assert (=> b!1121732 (= lt!498299 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121733 () Bool)

(declare-fun res!749400 () Bool)

(assert (=> b!1121733 (=> (not res!749400) (not e!638647))))

(assert (=> b!1121733 (= res!749400 (= (select (arr!35202 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44047 () Bool)

(declare-fun tp!83572 () Bool)

(declare-fun e!638652 () Bool)

(assert (=> mapNonEmpty!44047 (= mapRes!44047 (and tp!83572 e!638652))))

(declare-fun mapRest!44047 () (Array (_ BitVec 32) ValueCell!13367))

(declare-fun mapValue!44047 () ValueCell!13367)

(declare-fun mapKey!44047 () (_ BitVec 32))

(assert (=> mapNonEmpty!44047 (= (arr!35203 _values!996) (store mapRest!44047 mapKey!44047 mapValue!44047))))

(declare-fun b!1121727 () Bool)

(declare-fun res!749408 () Bool)

(assert (=> b!1121727 (=> (not res!749408) (not e!638649))))

(assert (=> b!1121727 (= res!749408 (arrayNoDuplicates!0 lt!498303 #b00000000000000000000000000000000 Nil!24575))))

(declare-fun res!749402 () Bool)

(assert (=> start!97916 (=> (not res!749402) (not e!638647))))

(assert (=> start!97916 (= res!749402 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35740 _keys!1208))))))

(assert (=> start!97916 e!638647))

(declare-fun tp_is_empty!28153 () Bool)

(assert (=> start!97916 tp_is_empty!28153))

(declare-fun array_inv!27106 (array!73098) Bool)

(assert (=> start!97916 (array_inv!27106 _keys!1208)))

(assert (=> start!97916 true))

(assert (=> start!97916 tp!83573))

(declare-fun array_inv!27107 (array!73100) Bool)

(assert (=> start!97916 (and (array_inv!27107 _values!996) e!638650)))

(declare-fun b!1121734 () Bool)

(declare-fun -!1055 (ListLongMap!15775 (_ BitVec 64)) ListLongMap!15775)

(assert (=> b!1121734 (= e!638648 (= call!47128 (-!1055 call!47129 k0!934)))))

(declare-fun b!1121735 () Bool)

(assert (=> b!1121735 (= e!638645 tp_is_empty!28153)))

(declare-fun b!1121736 () Bool)

(assert (=> b!1121736 (= e!638652 tp_is_empty!28153)))

(declare-fun b!1121737 () Bool)

(declare-fun res!749399 () Bool)

(assert (=> b!1121737 (=> (not res!749399) (not e!638647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121737 (= res!749399 (validKeyInArray!0 k0!934))))

(declare-fun b!1121738 () Bool)

(declare-fun res!749406 () Bool)

(assert (=> b!1121738 (=> (not res!749406) (not e!638647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121738 (= res!749406 (validMask!0 mask!1564))))

(declare-fun b!1121739 () Bool)

(assert (=> b!1121739 (= e!638651 (or (not (= (select (arr!35202 _keys!1208) from!1455) k0!934)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35740 _keys!1208)))))))

(assert (=> b!1121739 e!638648))

(declare-fun c!109398 () Bool)

(assert (=> b!1121739 (= c!109398 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498300 () Unit!36631)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!332 (array!73098 array!73100 (_ BitVec 32) (_ BitVec 32) V!42665 V!42665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36631)

(assert (=> b!1121739 (= lt!498300 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97916 res!749402) b!1121738))

(assert (= (and b!1121738 res!749406) b!1121725))

(assert (= (and b!1121725 res!749409) b!1121724))

(assert (= (and b!1121724 res!749407) b!1121728))

(assert (= (and b!1121728 res!749405) b!1121726))

(assert (= (and b!1121726 res!749401) b!1121737))

(assert (= (and b!1121737 res!749399) b!1121733))

(assert (= (and b!1121733 res!749400) b!1121731))

(assert (= (and b!1121731 res!749410) b!1121727))

(assert (= (and b!1121727 res!749408) b!1121732))

(assert (= (and b!1121732 (not res!749404)) b!1121723))

(assert (= (and b!1121723 (not res!749403)) b!1121739))

(assert (= (and b!1121739 c!109398) b!1121734))

(assert (= (and b!1121739 (not c!109398)) b!1121730))

(assert (= (or b!1121734 b!1121730) bm!47126))

(assert (= (or b!1121734 b!1121730) bm!47125))

(assert (= (and b!1121729 condMapEmpty!44047) mapIsEmpty!44047))

(assert (= (and b!1121729 (not condMapEmpty!44047)) mapNonEmpty!44047))

(get-info :version)

(assert (= (and mapNonEmpty!44047 ((_ is ValueCellFull!13367) mapValue!44047)) b!1121736))

(assert (= (and b!1121729 ((_ is ValueCellFull!13367) mapDefault!44047)) b!1121735))

(assert (= start!97916 b!1121729))

(declare-fun b_lambda!18575 () Bool)

(assert (=> (not b_lambda!18575) (not b!1121723)))

(declare-fun t!35182 () Bool)

(declare-fun tb!8427 () Bool)

(assert (=> (and start!97916 (= defaultEntry!1004 defaultEntry!1004) t!35182) tb!8427))

(declare-fun result!17423 () Bool)

(assert (=> tb!8427 (= result!17423 tp_is_empty!28153)))

(assert (=> b!1121723 t!35182))

(declare-fun b_and!38009 () Bool)

(assert (= b_and!38007 (and (=> t!35182 result!17423) b_and!38009)))

(declare-fun m!1035981 () Bool)

(assert (=> bm!47126 m!1035981))

(declare-fun m!1035983 () Bool)

(assert (=> b!1121732 m!1035983))

(declare-fun m!1035985 () Bool)

(assert (=> b!1121732 m!1035985))

(declare-fun m!1035987 () Bool)

(assert (=> b!1121728 m!1035987))

(declare-fun m!1035989 () Bool)

(assert (=> b!1121727 m!1035989))

(declare-fun m!1035991 () Bool)

(assert (=> b!1121734 m!1035991))

(declare-fun m!1035993 () Bool)

(assert (=> b!1121724 m!1035993))

(declare-fun m!1035995 () Bool)

(assert (=> b!1121723 m!1035995))

(declare-fun m!1035997 () Bool)

(assert (=> b!1121723 m!1035997))

(declare-fun m!1035999 () Bool)

(assert (=> b!1121723 m!1035999))

(declare-fun m!1036001 () Bool)

(assert (=> b!1121723 m!1036001))

(declare-fun m!1036003 () Bool)

(assert (=> b!1121733 m!1036003))

(declare-fun m!1036005 () Bool)

(assert (=> b!1121737 m!1036005))

(declare-fun m!1036007 () Bool)

(assert (=> b!1121739 m!1036007))

(declare-fun m!1036009 () Bool)

(assert (=> b!1121739 m!1036009))

(declare-fun m!1036011 () Bool)

(assert (=> mapNonEmpty!44047 m!1036011))

(declare-fun m!1036013 () Bool)

(assert (=> start!97916 m!1036013))

(declare-fun m!1036015 () Bool)

(assert (=> start!97916 m!1036015))

(declare-fun m!1036017 () Bool)

(assert (=> b!1121731 m!1036017))

(declare-fun m!1036019 () Bool)

(assert (=> b!1121731 m!1036019))

(declare-fun m!1036021 () Bool)

(assert (=> bm!47125 m!1036021))

(declare-fun m!1036023 () Bool)

(assert (=> b!1121738 m!1036023))

(check-sat (not start!97916) (not b_next!23623) (not b!1121723) (not b!1121727) (not b!1121728) (not bm!47126) (not b_lambda!18575) b_and!38009 (not b!1121739) (not b!1121732) (not b!1121737) (not b!1121734) (not b!1121724) tp_is_empty!28153 (not bm!47125) (not b!1121738) (not b!1121731) (not mapNonEmpty!44047))
(check-sat b_and!38009 (not b_next!23623))
