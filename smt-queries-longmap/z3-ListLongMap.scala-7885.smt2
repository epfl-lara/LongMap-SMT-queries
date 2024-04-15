; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98048 () Bool)

(assert start!98048)

(declare-fun b_free!23755 () Bool)

(declare-fun b_next!23755 () Bool)

(assert (=> start!98048 (= b_free!23755 (not b_next!23755))))

(declare-fun tp!83969 () Bool)

(declare-fun b_and!38271 () Bool)

(assert (=> start!98048 (= tp!83969 b_and!38271)))

(declare-fun b!1125601 () Bool)

(declare-fun res!752158 () Bool)

(declare-fun e!640715 () Bool)

(assert (=> b!1125601 (=> (not res!752158) (not e!640715))))

(declare-datatypes ((array!73360 0))(
  ( (array!73361 (arr!35333 (Array (_ BitVec 32) (_ BitVec 64))) (size!35871 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73360)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73360 (_ BitVec 32)) Bool)

(assert (=> b!1125601 (= res!752158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125602 () Bool)

(declare-fun e!640714 () Bool)

(declare-fun tp_is_empty!28285 () Bool)

(assert (=> b!1125602 (= e!640714 tp_is_empty!28285)))

(declare-fun b!1125603 () Bool)

(declare-fun e!640707 () Bool)

(assert (=> b!1125603 (= e!640715 e!640707)))

(declare-fun res!752165 () Bool)

(assert (=> b!1125603 (=> (not res!752165) (not e!640707))))

(declare-fun lt!499762 () array!73360)

(assert (=> b!1125603 (= res!752165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499762 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125603 (= lt!499762 (array!73361 (store (arr!35333 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35871 _keys!1208)))))

(declare-fun b!1125604 () Bool)

(declare-fun res!752155 () Bool)

(assert (=> b!1125604 (=> (not res!752155) (not e!640715))))

(declare-datatypes ((List!24696 0))(
  ( (Nil!24693) (Cons!24692 (h!25901 (_ BitVec 64)) (t!35434 List!24696)) )
))
(declare-fun arrayNoDuplicates!0 (array!73360 (_ BitVec 32) List!24696) Bool)

(assert (=> b!1125604 (= res!752155 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24693))))

(declare-fun b!1125605 () Bool)

(declare-fun e!640711 () Bool)

(declare-datatypes ((V!42841 0))(
  ( (V!42842 (val!14199 Int)) )
))
(declare-datatypes ((tuple2!17936 0))(
  ( (tuple2!17937 (_1!8979 (_ BitVec 64)) (_2!8979 V!42841)) )
))
(declare-datatypes ((List!24697 0))(
  ( (Nil!24694) (Cons!24693 (h!25902 tuple2!17936) (t!35435 List!24697)) )
))
(declare-datatypes ((ListLongMap!15905 0))(
  ( (ListLongMap!15906 (toList!7968 List!24697)) )
))
(declare-fun call!47525 () ListLongMap!15905)

(declare-fun call!47524 () ListLongMap!15905)

(assert (=> b!1125605 (= e!640711 (= call!47525 call!47524))))

(declare-fun b!1125606 () Bool)

(declare-fun e!640712 () Bool)

(declare-fun e!640709 () Bool)

(declare-fun mapRes!44245 () Bool)

(assert (=> b!1125606 (= e!640712 (and e!640709 mapRes!44245))))

(declare-fun condMapEmpty!44245 () Bool)

(declare-datatypes ((ValueCell!13433 0))(
  ( (ValueCellFull!13433 (v!16831 V!42841)) (EmptyCell!13433) )
))
(declare-datatypes ((array!73362 0))(
  ( (array!73363 (arr!35334 (Array (_ BitVec 32) ValueCell!13433)) (size!35872 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73362)

(declare-fun mapDefault!44245 () ValueCell!13433)

(assert (=> b!1125606 (= condMapEmpty!44245 (= (arr!35334 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13433)) mapDefault!44245)))))

(declare-fun b!1125607 () Bool)

(assert (=> b!1125607 (= e!640709 tp_is_empty!28285)))

(declare-fun b!1125608 () Bool)

(declare-fun e!640710 () Bool)

(assert (=> b!1125608 (= e!640710 true)))

(declare-fun zeroValue!944 () V!42841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!42841)

(declare-fun lt!499763 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun contains!6436 (ListLongMap!15905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4472 (array!73360 array!73362 (_ BitVec 32) (_ BitVec 32) V!42841 V!42841 (_ BitVec 32) Int) ListLongMap!15905)

(assert (=> b!1125608 (= lt!499763 (contains!6436 (getCurrentListMapNoExtraKeys!4472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1125609 () Bool)

(declare-fun res!752157 () Bool)

(assert (=> b!1125609 (=> (not res!752157) (not e!640715))))

(assert (=> b!1125609 (= res!752157 (= (select (arr!35333 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44245 () Bool)

(assert (=> mapIsEmpty!44245 mapRes!44245))

(declare-fun b!1125610 () Bool)

(declare-fun -!1097 (ListLongMap!15905 (_ BitVec 64)) ListLongMap!15905)

(assert (=> b!1125610 (= e!640711 (= call!47525 (-!1097 call!47524 k0!934)))))

(declare-fun b!1125611 () Bool)

(declare-fun res!752161 () Bool)

(assert (=> b!1125611 (=> (not res!752161) (not e!640715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125611 (= res!752161 (validMask!0 mask!1564))))

(declare-fun bm!47521 () Bool)

(assert (=> bm!47521 (= call!47524 (getCurrentListMapNoExtraKeys!4472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125612 () Bool)

(declare-fun res!752160 () Bool)

(assert (=> b!1125612 (=> (not res!752160) (not e!640715))))

(assert (=> b!1125612 (= res!752160 (and (= (size!35872 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35871 _keys!1208) (size!35872 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125613 () Bool)

(declare-fun res!752166 () Bool)

(assert (=> b!1125613 (=> (not res!752166) (not e!640715))))

(assert (=> b!1125613 (= res!752166 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35871 _keys!1208))))))

(declare-fun b!1125614 () Bool)

(declare-fun e!640713 () Bool)

(assert (=> b!1125614 (= e!640707 (not e!640713))))

(declare-fun res!752167 () Bool)

(assert (=> b!1125614 (=> res!752167 e!640713)))

(assert (=> b!1125614 (= res!752167 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125614 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36743 0))(
  ( (Unit!36744) )
))
(declare-fun lt!499760 () Unit!36743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73360 (_ BitVec 64) (_ BitVec 32)) Unit!36743)

(assert (=> b!1125614 (= lt!499760 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44245 () Bool)

(declare-fun tp!83968 () Bool)

(assert (=> mapNonEmpty!44245 (= mapRes!44245 (and tp!83968 e!640714))))

(declare-fun mapRest!44245 () (Array (_ BitVec 32) ValueCell!13433))

(declare-fun mapKey!44245 () (_ BitVec 32))

(declare-fun mapValue!44245 () ValueCell!13433)

(assert (=> mapNonEmpty!44245 (= (arr!35334 _values!996) (store mapRest!44245 mapKey!44245 mapValue!44245))))

(declare-fun bm!47522 () Bool)

(declare-fun lt!499761 () array!73362)

(assert (=> bm!47522 (= call!47525 (getCurrentListMapNoExtraKeys!4472 lt!499762 lt!499761 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!752159 () Bool)

(assert (=> start!98048 (=> (not res!752159) (not e!640715))))

(assert (=> start!98048 (= res!752159 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35871 _keys!1208))))))

(assert (=> start!98048 e!640715))

(assert (=> start!98048 tp_is_empty!28285))

(declare-fun array_inv!27192 (array!73360) Bool)

(assert (=> start!98048 (array_inv!27192 _keys!1208)))

(assert (=> start!98048 true))

(assert (=> start!98048 tp!83969))

(declare-fun array_inv!27193 (array!73362) Bool)

(assert (=> start!98048 (and (array_inv!27193 _values!996) e!640712)))

(declare-fun b!1125615 () Bool)

(declare-fun res!752163 () Bool)

(assert (=> b!1125615 (=> (not res!752163) (not e!640707))))

(assert (=> b!1125615 (= res!752163 (arrayNoDuplicates!0 lt!499762 #b00000000000000000000000000000000 Nil!24693))))

(declare-fun b!1125616 () Bool)

(declare-fun e!640708 () Bool)

(assert (=> b!1125616 (= e!640713 e!640708)))

(declare-fun res!752162 () Bool)

(assert (=> b!1125616 (=> res!752162 e!640708)))

(assert (=> b!1125616 (= res!752162 (not (= from!1455 i!673)))))

(declare-fun lt!499759 () ListLongMap!15905)

(assert (=> b!1125616 (= lt!499759 (getCurrentListMapNoExtraKeys!4472 lt!499762 lt!499761 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2489 (Int (_ BitVec 64)) V!42841)

(assert (=> b!1125616 (= lt!499761 (array!73363 (store (arr!35334 _values!996) i!673 (ValueCellFull!13433 (dynLambda!2489 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35872 _values!996)))))

(declare-fun lt!499758 () ListLongMap!15905)

(assert (=> b!1125616 (= lt!499758 (getCurrentListMapNoExtraKeys!4472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125617 () Bool)

(declare-fun res!752164 () Bool)

(assert (=> b!1125617 (=> (not res!752164) (not e!640715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125617 (= res!752164 (validKeyInArray!0 k0!934))))

(declare-fun b!1125618 () Bool)

(assert (=> b!1125618 (= e!640708 e!640710)))

(declare-fun res!752156 () Bool)

(assert (=> b!1125618 (=> res!752156 e!640710)))

(assert (=> b!1125618 (= res!752156 (not (= (select (arr!35333 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125618 e!640711))

(declare-fun c!109596 () Bool)

(assert (=> b!1125618 (= c!109596 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499764 () Unit!36743)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!377 (array!73360 array!73362 (_ BitVec 32) (_ BitVec 32) V!42841 V!42841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36743)

(assert (=> b!1125618 (= lt!499764 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98048 res!752159) b!1125611))

(assert (= (and b!1125611 res!752161) b!1125612))

(assert (= (and b!1125612 res!752160) b!1125601))

(assert (= (and b!1125601 res!752158) b!1125604))

(assert (= (and b!1125604 res!752155) b!1125613))

(assert (= (and b!1125613 res!752166) b!1125617))

(assert (= (and b!1125617 res!752164) b!1125609))

(assert (= (and b!1125609 res!752157) b!1125603))

(assert (= (and b!1125603 res!752165) b!1125615))

(assert (= (and b!1125615 res!752163) b!1125614))

(assert (= (and b!1125614 (not res!752167)) b!1125616))

(assert (= (and b!1125616 (not res!752162)) b!1125618))

(assert (= (and b!1125618 c!109596) b!1125610))

(assert (= (and b!1125618 (not c!109596)) b!1125605))

(assert (= (or b!1125610 b!1125605) bm!47522))

(assert (= (or b!1125610 b!1125605) bm!47521))

(assert (= (and b!1125618 (not res!752156)) b!1125608))

(assert (= (and b!1125606 condMapEmpty!44245) mapIsEmpty!44245))

(assert (= (and b!1125606 (not condMapEmpty!44245)) mapNonEmpty!44245))

(get-info :version)

(assert (= (and mapNonEmpty!44245 ((_ is ValueCellFull!13433) mapValue!44245)) b!1125602))

(assert (= (and b!1125606 ((_ is ValueCellFull!13433) mapDefault!44245)) b!1125607))

(assert (= start!98048 b!1125606))

(declare-fun b_lambda!18707 () Bool)

(assert (=> (not b_lambda!18707) (not b!1125616)))

(declare-fun t!35433 () Bool)

(declare-fun tb!8559 () Bool)

(assert (=> (and start!98048 (= defaultEntry!1004 defaultEntry!1004) t!35433) tb!8559))

(declare-fun result!17687 () Bool)

(assert (=> tb!8559 (= result!17687 tp_is_empty!28285)))

(assert (=> b!1125616 t!35433))

(declare-fun b_and!38273 () Bool)

(assert (= b_and!38271 (and (=> t!35433 result!17687) b_and!38273)))

(declare-fun m!1039191 () Bool)

(assert (=> b!1125615 m!1039191))

(declare-fun m!1039193 () Bool)

(assert (=> b!1125608 m!1039193))

(assert (=> b!1125608 m!1039193))

(declare-fun m!1039195 () Bool)

(assert (=> b!1125608 m!1039195))

(declare-fun m!1039197 () Bool)

(assert (=> b!1125617 m!1039197))

(declare-fun m!1039199 () Bool)

(assert (=> b!1125616 m!1039199))

(declare-fun m!1039201 () Bool)

(assert (=> b!1125616 m!1039201))

(declare-fun m!1039203 () Bool)

(assert (=> b!1125616 m!1039203))

(declare-fun m!1039205 () Bool)

(assert (=> b!1125616 m!1039205))

(assert (=> bm!47521 m!1039193))

(declare-fun m!1039207 () Bool)

(assert (=> b!1125611 m!1039207))

(declare-fun m!1039209 () Bool)

(assert (=> b!1125603 m!1039209))

(declare-fun m!1039211 () Bool)

(assert (=> b!1125603 m!1039211))

(declare-fun m!1039213 () Bool)

(assert (=> bm!47522 m!1039213))

(declare-fun m!1039215 () Bool)

(assert (=> b!1125604 m!1039215))

(declare-fun m!1039217 () Bool)

(assert (=> b!1125601 m!1039217))

(declare-fun m!1039219 () Bool)

(assert (=> b!1125609 m!1039219))

(declare-fun m!1039221 () Bool)

(assert (=> b!1125618 m!1039221))

(declare-fun m!1039223 () Bool)

(assert (=> b!1125618 m!1039223))

(declare-fun m!1039225 () Bool)

(assert (=> b!1125610 m!1039225))

(declare-fun m!1039227 () Bool)

(assert (=> mapNonEmpty!44245 m!1039227))

(declare-fun m!1039229 () Bool)

(assert (=> b!1125614 m!1039229))

(declare-fun m!1039231 () Bool)

(assert (=> b!1125614 m!1039231))

(declare-fun m!1039233 () Bool)

(assert (=> start!98048 m!1039233))

(declare-fun m!1039235 () Bool)

(assert (=> start!98048 m!1039235))

(check-sat (not b!1125614) (not bm!47521) (not b!1125604) (not b!1125616) (not b!1125618) b_and!38273 (not mapNonEmpty!44245) (not b!1125610) (not b!1125603) (not b!1125608) tp_is_empty!28285 (not b_lambda!18707) (not b_next!23755) (not b!1125611) (not b!1125615) (not start!98048) (not b!1125617) (not b!1125601) (not bm!47522))
(check-sat b_and!38273 (not b_next!23755))
