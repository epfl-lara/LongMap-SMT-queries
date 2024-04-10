; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97990 () Bool)

(assert start!97990)

(declare-fun b_free!23691 () Bool)

(declare-fun b_next!23691 () Bool)

(assert (=> start!97990 (= b_free!23691 (not b_next!23691))))

(declare-fun tp!83776 () Bool)

(declare-fun b_and!38165 () Bool)

(assert (=> start!97990 (= tp!83776 b_and!38165)))

(declare-fun b!1123768 () Bool)

(declare-fun res!750819 () Bool)

(declare-fun e!639747 () Bool)

(assert (=> b!1123768 (=> (not res!750819) (not e!639747))))

(declare-datatypes ((array!73309 0))(
  ( (array!73310 (arr!35307 (Array (_ BitVec 32) (_ BitVec 64))) (size!35843 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73309)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42755 0))(
  ( (V!42756 (val!14167 Int)) )
))
(declare-datatypes ((ValueCell!13401 0))(
  ( (ValueCellFull!13401 (v!16800 V!42755)) (EmptyCell!13401) )
))
(declare-datatypes ((array!73311 0))(
  ( (array!73312 (arr!35308 (Array (_ BitVec 32) ValueCell!13401)) (size!35844 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73311)

(assert (=> b!1123768 (= res!750819 (and (= (size!35844 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35843 _keys!1208) (size!35844 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123769 () Bool)

(declare-fun res!750809 () Bool)

(assert (=> b!1123769 (=> (not res!750809) (not e!639747))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123769 (= res!750809 (validKeyInArray!0 k0!934))))

(declare-fun res!750815 () Bool)

(assert (=> start!97990 (=> (not res!750815) (not e!639747))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97990 (= res!750815 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35843 _keys!1208))))))

(assert (=> start!97990 e!639747))

(declare-fun tp_is_empty!28221 () Bool)

(assert (=> start!97990 tp_is_empty!28221))

(declare-fun array_inv!27104 (array!73309) Bool)

(assert (=> start!97990 (array_inv!27104 _keys!1208)))

(assert (=> start!97990 true))

(assert (=> start!97990 tp!83776))

(declare-fun e!639750 () Bool)

(declare-fun array_inv!27105 (array!73311) Bool)

(assert (=> start!97990 (and (array_inv!27105 _values!996) e!639750)))

(declare-fun b!1123770 () Bool)

(declare-fun e!639751 () Bool)

(declare-fun mapRes!44149 () Bool)

(assert (=> b!1123770 (= e!639750 (and e!639751 mapRes!44149))))

(declare-fun condMapEmpty!44149 () Bool)

(declare-fun mapDefault!44149 () ValueCell!13401)

(assert (=> b!1123770 (= condMapEmpty!44149 (= (arr!35308 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13401)) mapDefault!44149)))))

(declare-fun b!1123771 () Bool)

(declare-fun res!750806 () Bool)

(assert (=> b!1123771 (=> (not res!750806) (not e!639747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123771 (= res!750806 (validMask!0 mask!1564))))

(declare-fun b!1123772 () Bool)

(declare-fun e!639748 () Bool)

(assert (=> b!1123772 (= e!639747 e!639748)))

(declare-fun res!750811 () Bool)

(assert (=> b!1123772 (=> (not res!750811) (not e!639748))))

(declare-fun lt!499204 () array!73309)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73309 (_ BitVec 32)) Bool)

(assert (=> b!1123772 (= res!750811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499204 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123772 (= lt!499204 (array!73310 (store (arr!35307 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35843 _keys!1208)))))

(declare-fun b!1123773 () Bool)

(declare-fun res!750810 () Bool)

(assert (=> b!1123773 (=> (not res!750810) (not e!639747))))

(declare-datatypes ((List!24569 0))(
  ( (Nil!24566) (Cons!24565 (h!25774 (_ BitVec 64)) (t!35252 List!24569)) )
))
(declare-fun arrayNoDuplicates!0 (array!73309 (_ BitVec 32) List!24569) Bool)

(assert (=> b!1123773 (= res!750810 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24566))))

(declare-fun b!1123774 () Bool)

(declare-fun res!750808 () Bool)

(assert (=> b!1123774 (=> (not res!750808) (not e!639747))))

(assert (=> b!1123774 (= res!750808 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35843 _keys!1208))))))

(declare-fun b!1123775 () Bool)

(declare-fun e!639752 () Bool)

(assert (=> b!1123775 (= e!639752 true)))

(declare-datatypes ((tuple2!17790 0))(
  ( (tuple2!17791 (_1!8906 (_ BitVec 64)) (_2!8906 V!42755)) )
))
(declare-datatypes ((List!24570 0))(
  ( (Nil!24567) (Cons!24566 (h!25775 tuple2!17790) (t!35253 List!24570)) )
))
(declare-datatypes ((ListLongMap!15759 0))(
  ( (ListLongMap!15760 (toList!7895 List!24570)) )
))
(declare-fun lt!499201 () ListLongMap!15759)

(declare-fun zeroValue!944 () V!42755)

(declare-fun contains!6434 (ListLongMap!15759 (_ BitVec 64)) Bool)

(declare-fun +!3406 (ListLongMap!15759 tuple2!17790) ListLongMap!15759)

(assert (=> b!1123775 (contains!6434 (+!3406 lt!499201 (tuple2!17791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36844 0))(
  ( (Unit!36845) )
))
(declare-fun lt!499202 () Unit!36844)

(declare-fun addStillContains!668 (ListLongMap!15759 (_ BitVec 64) V!42755 (_ BitVec 64)) Unit!36844)

(assert (=> b!1123775 (= lt!499202 (addStillContains!668 lt!499201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1123776 () Bool)

(declare-fun e!639744 () Bool)

(assert (=> b!1123776 (= e!639744 e!639752)))

(declare-fun res!750807 () Bool)

(assert (=> b!1123776 (=> res!750807 e!639752)))

(assert (=> b!1123776 (= res!750807 (not (contains!6434 lt!499201 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42755)

(declare-fun getCurrentListMapNoExtraKeys!4383 (array!73309 array!73311 (_ BitVec 32) (_ BitVec 32) V!42755 V!42755 (_ BitVec 32) Int) ListLongMap!15759)

(assert (=> b!1123776 (= lt!499201 (getCurrentListMapNoExtraKeys!4383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44149 () Bool)

(assert (=> mapIsEmpty!44149 mapRes!44149))

(declare-fun bm!47352 () Bool)

(declare-fun call!47356 () ListLongMap!15759)

(assert (=> bm!47352 (= call!47356 (getCurrentListMapNoExtraKeys!4383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123777 () Bool)

(assert (=> b!1123777 (= e!639751 tp_is_empty!28221)))

(declare-fun mapNonEmpty!44149 () Bool)

(declare-fun tp!83777 () Bool)

(declare-fun e!639743 () Bool)

(assert (=> mapNonEmpty!44149 (= mapRes!44149 (and tp!83777 e!639743))))

(declare-fun mapValue!44149 () ValueCell!13401)

(declare-fun mapRest!44149 () (Array (_ BitVec 32) ValueCell!13401))

(declare-fun mapKey!44149 () (_ BitVec 32))

(assert (=> mapNonEmpty!44149 (= (arr!35308 _values!996) (store mapRest!44149 mapKey!44149 mapValue!44149))))

(declare-fun b!1123778 () Bool)

(declare-fun res!750817 () Bool)

(assert (=> b!1123778 (=> (not res!750817) (not e!639748))))

(assert (=> b!1123778 (= res!750817 (arrayNoDuplicates!0 lt!499204 #b00000000000000000000000000000000 Nil!24566))))

(declare-fun b!1123779 () Bool)

(assert (=> b!1123779 (= e!639743 tp_is_empty!28221)))

(declare-fun b!1123780 () Bool)

(declare-fun res!750812 () Bool)

(assert (=> b!1123780 (=> (not res!750812) (not e!639747))))

(assert (=> b!1123780 (= res!750812 (= (select (arr!35307 _keys!1208) i!673) k0!934))))

(declare-fun b!1123781 () Bool)

(declare-fun res!750818 () Bool)

(assert (=> b!1123781 (=> (not res!750818) (not e!639747))))

(assert (=> b!1123781 (= res!750818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123782 () Bool)

(declare-fun e!639753 () Bool)

(declare-fun call!47355 () ListLongMap!15759)

(assert (=> b!1123782 (= e!639753 (= call!47355 call!47356))))

(declare-fun b!1123783 () Bool)

(declare-fun e!639749 () Bool)

(assert (=> b!1123783 (= e!639749 e!639744)))

(declare-fun res!750820 () Bool)

(assert (=> b!1123783 (=> res!750820 e!639744)))

(assert (=> b!1123783 (= res!750820 (not (= (select (arr!35307 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123783 e!639753))

(declare-fun c!109527 () Bool)

(assert (=> b!1123783 (= c!109527 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499203 () Unit!36844)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!347 (array!73309 array!73311 (_ BitVec 32) (_ BitVec 32) V!42755 V!42755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36844)

(assert (=> b!1123783 (= lt!499203 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47353 () Bool)

(declare-fun lt!499206 () array!73311)

(assert (=> bm!47353 (= call!47355 (getCurrentListMapNoExtraKeys!4383 lt!499204 lt!499206 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123784 () Bool)

(declare-fun e!639745 () Bool)

(assert (=> b!1123784 (= e!639745 e!639749)))

(declare-fun res!750814 () Bool)

(assert (=> b!1123784 (=> res!750814 e!639749)))

(assert (=> b!1123784 (= res!750814 (not (= from!1455 i!673)))))

(declare-fun lt!499205 () ListLongMap!15759)

(assert (=> b!1123784 (= lt!499205 (getCurrentListMapNoExtraKeys!4383 lt!499204 lt!499206 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2479 (Int (_ BitVec 64)) V!42755)

(assert (=> b!1123784 (= lt!499206 (array!73312 (store (arr!35308 _values!996) i!673 (ValueCellFull!13401 (dynLambda!2479 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35844 _values!996)))))

(declare-fun lt!499208 () ListLongMap!15759)

(assert (=> b!1123784 (= lt!499208 (getCurrentListMapNoExtraKeys!4383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123785 () Bool)

(assert (=> b!1123785 (= e!639748 (not e!639745))))

(declare-fun res!750816 () Bool)

(assert (=> b!1123785 (=> res!750816 e!639745)))

(assert (=> b!1123785 (= res!750816 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499207 () Unit!36844)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73309 (_ BitVec 64) (_ BitVec 32)) Unit!36844)

(assert (=> b!1123785 (= lt!499207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123786 () Bool)

(declare-fun res!750813 () Bool)

(assert (=> b!1123786 (=> res!750813 e!639752)))

(assert (=> b!1123786 (= res!750813 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1123787 () Bool)

(declare-fun -!1100 (ListLongMap!15759 (_ BitVec 64)) ListLongMap!15759)

(assert (=> b!1123787 (= e!639753 (= call!47355 (-!1100 call!47356 k0!934)))))

(assert (= (and start!97990 res!750815) b!1123771))

(assert (= (and b!1123771 res!750806) b!1123768))

(assert (= (and b!1123768 res!750819) b!1123781))

(assert (= (and b!1123781 res!750818) b!1123773))

(assert (= (and b!1123773 res!750810) b!1123774))

(assert (= (and b!1123774 res!750808) b!1123769))

(assert (= (and b!1123769 res!750809) b!1123780))

(assert (= (and b!1123780 res!750812) b!1123772))

(assert (= (and b!1123772 res!750811) b!1123778))

(assert (= (and b!1123778 res!750817) b!1123785))

(assert (= (and b!1123785 (not res!750816)) b!1123784))

(assert (= (and b!1123784 (not res!750814)) b!1123783))

(assert (= (and b!1123783 c!109527) b!1123787))

(assert (= (and b!1123783 (not c!109527)) b!1123782))

(assert (= (or b!1123787 b!1123782) bm!47353))

(assert (= (or b!1123787 b!1123782) bm!47352))

(assert (= (and b!1123783 (not res!750820)) b!1123776))

(assert (= (and b!1123776 (not res!750807)) b!1123786))

(assert (= (and b!1123786 (not res!750813)) b!1123775))

(assert (= (and b!1123770 condMapEmpty!44149) mapIsEmpty!44149))

(assert (= (and b!1123770 (not condMapEmpty!44149)) mapNonEmpty!44149))

(get-info :version)

(assert (= (and mapNonEmpty!44149 ((_ is ValueCellFull!13401) mapValue!44149)) b!1123779))

(assert (= (and b!1123770 ((_ is ValueCellFull!13401) mapDefault!44149)) b!1123777))

(assert (= start!97990 b!1123770))

(declare-fun b_lambda!18661 () Bool)

(assert (=> (not b_lambda!18661) (not b!1123784)))

(declare-fun t!35251 () Bool)

(declare-fun tb!8503 () Bool)

(assert (=> (and start!97990 (= defaultEntry!1004 defaultEntry!1004) t!35251) tb!8503))

(declare-fun result!17567 () Bool)

(assert (=> tb!8503 (= result!17567 tp_is_empty!28221)))

(assert (=> b!1123784 t!35251))

(declare-fun b_and!38167 () Bool)

(assert (= b_and!38165 (and (=> t!35251 result!17567) b_and!38167)))

(declare-fun m!1038173 () Bool)

(assert (=> b!1123787 m!1038173))

(declare-fun m!1038175 () Bool)

(assert (=> b!1123772 m!1038175))

(declare-fun m!1038177 () Bool)

(assert (=> b!1123772 m!1038177))

(declare-fun m!1038179 () Bool)

(assert (=> bm!47352 m!1038179))

(declare-fun m!1038181 () Bool)

(assert (=> b!1123781 m!1038181))

(declare-fun m!1038183 () Bool)

(assert (=> bm!47353 m!1038183))

(declare-fun m!1038185 () Bool)

(assert (=> b!1123775 m!1038185))

(assert (=> b!1123775 m!1038185))

(declare-fun m!1038187 () Bool)

(assert (=> b!1123775 m!1038187))

(declare-fun m!1038189 () Bool)

(assert (=> b!1123775 m!1038189))

(declare-fun m!1038191 () Bool)

(assert (=> b!1123780 m!1038191))

(declare-fun m!1038193 () Bool)

(assert (=> start!97990 m!1038193))

(declare-fun m!1038195 () Bool)

(assert (=> start!97990 m!1038195))

(declare-fun m!1038197 () Bool)

(assert (=> b!1123785 m!1038197))

(declare-fun m!1038199 () Bool)

(assert (=> b!1123785 m!1038199))

(declare-fun m!1038201 () Bool)

(assert (=> b!1123773 m!1038201))

(declare-fun m!1038203 () Bool)

(assert (=> b!1123776 m!1038203))

(assert (=> b!1123776 m!1038179))

(declare-fun m!1038205 () Bool)

(assert (=> b!1123784 m!1038205))

(declare-fun m!1038207 () Bool)

(assert (=> b!1123784 m!1038207))

(declare-fun m!1038209 () Bool)

(assert (=> b!1123784 m!1038209))

(declare-fun m!1038211 () Bool)

(assert (=> b!1123784 m!1038211))

(declare-fun m!1038213 () Bool)

(assert (=> b!1123771 m!1038213))

(declare-fun m!1038215 () Bool)

(assert (=> mapNonEmpty!44149 m!1038215))

(declare-fun m!1038217 () Bool)

(assert (=> b!1123769 m!1038217))

(declare-fun m!1038219 () Bool)

(assert (=> b!1123783 m!1038219))

(declare-fun m!1038221 () Bool)

(assert (=> b!1123783 m!1038221))

(declare-fun m!1038223 () Bool)

(assert (=> b!1123778 m!1038223))

(check-sat (not b!1123776) (not b!1123772) (not b!1123783) (not b!1123775) tp_is_empty!28221 (not b_next!23691) (not b!1123785) (not b!1123773) (not bm!47352) (not bm!47353) (not b!1123781) (not b!1123787) (not start!97990) (not b!1123778) (not b_lambda!18661) (not b!1123784) b_and!38167 (not mapNonEmpty!44149) (not b!1123771) (not b!1123769))
(check-sat b_and!38167 (not b_next!23691))
