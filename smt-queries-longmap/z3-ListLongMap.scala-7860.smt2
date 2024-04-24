; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98140 () Bool)

(assert start!98140)

(declare-fun b_free!23605 () Bool)

(declare-fun b_next!23605 () Bool)

(assert (=> start!98140 (= b_free!23605 (not b_next!23605))))

(declare-fun tp!83518 () Bool)

(declare-fun b_and!38003 () Bool)

(assert (=> start!98140 (= tp!83518 b_and!38003)))

(declare-fun b!1122702 () Bool)

(declare-fun res!749669 () Bool)

(declare-fun e!639341 () Bool)

(assert (=> b!1122702 (=> (not res!749669) (not e!639341))))

(declare-datatypes ((array!73193 0))(
  ( (array!73194 (arr!35243 (Array (_ BitVec 32) (_ BitVec 64))) (size!35780 (_ BitVec 32))) )
))
(declare-fun lt!498856 () array!73193)

(declare-datatypes ((List!24532 0))(
  ( (Nil!24529) (Cons!24528 (h!25746 (_ BitVec 64)) (t!35121 List!24532)) )
))
(declare-fun arrayNoDuplicates!0 (array!73193 (_ BitVec 32) List!24532) Bool)

(assert (=> b!1122702 (= res!749669 (arrayNoDuplicates!0 lt!498856 #b00000000000000000000000000000000 Nil!24529))))

(declare-datatypes ((V!42641 0))(
  ( (V!42642 (val!14124 Int)) )
))
(declare-fun zeroValue!944 () V!42641)

(declare-fun _keys!1208 () array!73193)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47161 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13358 0))(
  ( (ValueCellFull!13358 (v!16753 V!42641)) (EmptyCell!13358) )
))
(declare-datatypes ((array!73195 0))(
  ( (array!73196 (arr!35244 (Array (_ BitVec 32) ValueCell!13358)) (size!35781 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73195)

(declare-fun minValue!944 () V!42641)

(declare-datatypes ((tuple2!17736 0))(
  ( (tuple2!17737 (_1!8879 (_ BitVec 64)) (_2!8879 V!42641)) )
))
(declare-datatypes ((List!24533 0))(
  ( (Nil!24530) (Cons!24529 (h!25747 tuple2!17736) (t!35122 List!24533)) )
))
(declare-datatypes ((ListLongMap!15713 0))(
  ( (ListLongMap!15714 (toList!7872 List!24533)) )
))
(declare-fun call!47164 () ListLongMap!15713)

(declare-fun getCurrentListMapNoExtraKeys!4401 (array!73193 array!73195 (_ BitVec 32) (_ BitVec 32) V!42641 V!42641 (_ BitVec 32) Int) ListLongMap!15713)

(assert (=> bm!47161 (= call!47164 (getCurrentListMapNoExtraKeys!4401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47165 () ListLongMap!15713)

(declare-fun lt!498852 () array!73195)

(declare-fun bm!47162 () Bool)

(assert (=> bm!47162 (= call!47165 (getCurrentListMapNoExtraKeys!4401 lt!498856 lt!498852 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122703 () Bool)

(declare-fun e!639338 () Bool)

(declare-fun e!639339 () Bool)

(declare-fun mapRes!44020 () Bool)

(assert (=> b!1122703 (= e!639338 (and e!639339 mapRes!44020))))

(declare-fun condMapEmpty!44020 () Bool)

(declare-fun mapDefault!44020 () ValueCell!13358)

(assert (=> b!1122703 (= condMapEmpty!44020 (= (arr!35244 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13358)) mapDefault!44020)))))

(declare-fun b!1122704 () Bool)

(declare-fun res!749675 () Bool)

(declare-fun e!639342 () Bool)

(assert (=> b!1122704 (=> (not res!749675) (not e!639342))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122704 (= res!749675 (validKeyInArray!0 k0!934))))

(declare-fun b!1122705 () Bool)

(declare-fun res!749672 () Bool)

(assert (=> b!1122705 (=> (not res!749672) (not e!639342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73193 (_ BitVec 32)) Bool)

(assert (=> b!1122705 (= res!749672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122706 () Bool)

(declare-fun res!749677 () Bool)

(assert (=> b!1122706 (=> (not res!749677) (not e!639342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122706 (= res!749677 (validMask!0 mask!1564))))

(declare-fun b!1122707 () Bool)

(declare-fun res!749667 () Bool)

(assert (=> b!1122707 (=> (not res!749667) (not e!639342))))

(assert (=> b!1122707 (= res!749667 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24529))))

(declare-fun b!1122708 () Bool)

(assert (=> b!1122708 (= e!639342 e!639341)))

(declare-fun res!749666 () Bool)

(assert (=> b!1122708 (=> (not res!749666) (not e!639341))))

(assert (=> b!1122708 (= res!749666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498856 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122708 (= lt!498856 (array!73194 (store (arr!35243 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35780 _keys!1208)))))

(declare-fun mapIsEmpty!44020 () Bool)

(assert (=> mapIsEmpty!44020 mapRes!44020))

(declare-fun b!1122710 () Bool)

(declare-fun res!749670 () Bool)

(assert (=> b!1122710 (=> (not res!749670) (not e!639342))))

(assert (=> b!1122710 (= res!749670 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35780 _keys!1208))))))

(declare-fun b!1122711 () Bool)

(declare-fun tp_is_empty!28135 () Bool)

(assert (=> b!1122711 (= e!639339 tp_is_empty!28135)))

(declare-fun b!1122712 () Bool)

(declare-fun res!749671 () Bool)

(assert (=> b!1122712 (=> (not res!749671) (not e!639342))))

(assert (=> b!1122712 (= res!749671 (and (= (size!35781 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35780 _keys!1208) (size!35781 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122713 () Bool)

(declare-fun e!639344 () Bool)

(assert (=> b!1122713 (= e!639344 tp_is_empty!28135)))

(declare-fun b!1122714 () Bool)

(declare-fun res!749673 () Bool)

(assert (=> b!1122714 (=> (not res!749673) (not e!639342))))

(assert (=> b!1122714 (= res!749673 (= (select (arr!35243 _keys!1208) i!673) k0!934))))

(declare-fun b!1122715 () Bool)

(declare-fun e!639337 () Bool)

(assert (=> b!1122715 (= e!639337 (= call!47165 call!47164))))

(declare-fun mapNonEmpty!44020 () Bool)

(declare-fun tp!83519 () Bool)

(assert (=> mapNonEmpty!44020 (= mapRes!44020 (and tp!83519 e!639344))))

(declare-fun mapValue!44020 () ValueCell!13358)

(declare-fun mapKey!44020 () (_ BitVec 32))

(declare-fun mapRest!44020 () (Array (_ BitVec 32) ValueCell!13358))

(assert (=> mapNonEmpty!44020 (= (arr!35244 _values!996) (store mapRest!44020 mapKey!44020 mapValue!44020))))

(declare-fun b!1122716 () Bool)

(declare-fun e!639345 () Bool)

(assert (=> b!1122716 (= e!639345 true)))

(assert (=> b!1122716 e!639337))

(declare-fun c!109808 () Bool)

(assert (=> b!1122716 (= c!109808 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36773 0))(
  ( (Unit!36774) )
))
(declare-fun lt!498854 () Unit!36773)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!335 (array!73193 array!73195 (_ BitVec 32) (_ BitVec 32) V!42641 V!42641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36773)

(assert (=> b!1122716 (= lt!498854 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122717 () Bool)

(declare-fun -!1071 (ListLongMap!15713 (_ BitVec 64)) ListLongMap!15713)

(assert (=> b!1122717 (= e!639337 (= call!47165 (-!1071 call!47164 k0!934)))))

(declare-fun b!1122718 () Bool)

(declare-fun e!639343 () Bool)

(assert (=> b!1122718 (= e!639341 (not e!639343))))

(declare-fun res!749674 () Bool)

(assert (=> b!1122718 (=> res!749674 e!639343)))

(assert (=> b!1122718 (= res!749674 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122718 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498851 () Unit!36773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73193 (_ BitVec 64) (_ BitVec 32)) Unit!36773)

(assert (=> b!1122718 (= lt!498851 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122709 () Bool)

(assert (=> b!1122709 (= e!639343 e!639345)))

(declare-fun res!749668 () Bool)

(assert (=> b!1122709 (=> res!749668 e!639345)))

(assert (=> b!1122709 (= res!749668 (not (= from!1455 i!673)))))

(declare-fun lt!498855 () ListLongMap!15713)

(assert (=> b!1122709 (= lt!498855 (getCurrentListMapNoExtraKeys!4401 lt!498856 lt!498852 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2488 (Int (_ BitVec 64)) V!42641)

(assert (=> b!1122709 (= lt!498852 (array!73196 (store (arr!35244 _values!996) i!673 (ValueCellFull!13358 (dynLambda!2488 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35781 _values!996)))))

(declare-fun lt!498853 () ListLongMap!15713)

(assert (=> b!1122709 (= lt!498853 (getCurrentListMapNoExtraKeys!4401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!749676 () Bool)

(assert (=> start!98140 (=> (not res!749676) (not e!639342))))

(assert (=> start!98140 (= res!749676 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35780 _keys!1208))))))

(assert (=> start!98140 e!639342))

(assert (=> start!98140 tp_is_empty!28135))

(declare-fun array_inv!27132 (array!73193) Bool)

(assert (=> start!98140 (array_inv!27132 _keys!1208)))

(assert (=> start!98140 true))

(assert (=> start!98140 tp!83518))

(declare-fun array_inv!27133 (array!73195) Bool)

(assert (=> start!98140 (and (array_inv!27133 _values!996) e!639338)))

(assert (= (and start!98140 res!749676) b!1122706))

(assert (= (and b!1122706 res!749677) b!1122712))

(assert (= (and b!1122712 res!749671) b!1122705))

(assert (= (and b!1122705 res!749672) b!1122707))

(assert (= (and b!1122707 res!749667) b!1122710))

(assert (= (and b!1122710 res!749670) b!1122704))

(assert (= (and b!1122704 res!749675) b!1122714))

(assert (= (and b!1122714 res!749673) b!1122708))

(assert (= (and b!1122708 res!749666) b!1122702))

(assert (= (and b!1122702 res!749669) b!1122718))

(assert (= (and b!1122718 (not res!749674)) b!1122709))

(assert (= (and b!1122709 (not res!749668)) b!1122716))

(assert (= (and b!1122716 c!109808) b!1122717))

(assert (= (and b!1122716 (not c!109808)) b!1122715))

(assert (= (or b!1122717 b!1122715) bm!47162))

(assert (= (or b!1122717 b!1122715) bm!47161))

(assert (= (and b!1122703 condMapEmpty!44020) mapIsEmpty!44020))

(assert (= (and b!1122703 (not condMapEmpty!44020)) mapNonEmpty!44020))

(get-info :version)

(assert (= (and mapNonEmpty!44020 ((_ is ValueCellFull!13358) mapValue!44020)) b!1122713))

(assert (= (and b!1122703 ((_ is ValueCellFull!13358) mapDefault!44020)) b!1122711))

(assert (= start!98140 b!1122703))

(declare-fun b_lambda!18585 () Bool)

(assert (=> (not b_lambda!18585) (not b!1122709)))

(declare-fun t!35120 () Bool)

(declare-fun tb!8409 () Bool)

(assert (=> (and start!98140 (= defaultEntry!1004 defaultEntry!1004) t!35120) tb!8409))

(declare-fun result!17387 () Bool)

(assert (=> tb!8409 (= result!17387 tp_is_empty!28135)))

(assert (=> b!1122709 t!35120))

(declare-fun b_and!38005 () Bool)

(assert (= b_and!38003 (and (=> t!35120 result!17387) b_and!38005)))

(declare-fun m!1037901 () Bool)

(assert (=> bm!47162 m!1037901))

(declare-fun m!1037903 () Bool)

(assert (=> b!1122709 m!1037903))

(declare-fun m!1037905 () Bool)

(assert (=> b!1122709 m!1037905))

(declare-fun m!1037907 () Bool)

(assert (=> b!1122709 m!1037907))

(declare-fun m!1037909 () Bool)

(assert (=> b!1122709 m!1037909))

(declare-fun m!1037911 () Bool)

(assert (=> b!1122708 m!1037911))

(declare-fun m!1037913 () Bool)

(assert (=> b!1122708 m!1037913))

(declare-fun m!1037915 () Bool)

(assert (=> mapNonEmpty!44020 m!1037915))

(declare-fun m!1037917 () Bool)

(assert (=> b!1122704 m!1037917))

(declare-fun m!1037919 () Bool)

(assert (=> b!1122714 m!1037919))

(declare-fun m!1037921 () Bool)

(assert (=> b!1122706 m!1037921))

(declare-fun m!1037923 () Bool)

(assert (=> b!1122718 m!1037923))

(declare-fun m!1037925 () Bool)

(assert (=> b!1122718 m!1037925))

(declare-fun m!1037927 () Bool)

(assert (=> b!1122702 m!1037927))

(declare-fun m!1037929 () Bool)

(assert (=> b!1122717 m!1037929))

(declare-fun m!1037931 () Bool)

(assert (=> b!1122705 m!1037931))

(declare-fun m!1037933 () Bool)

(assert (=> start!98140 m!1037933))

(declare-fun m!1037935 () Bool)

(assert (=> start!98140 m!1037935))

(declare-fun m!1037937 () Bool)

(assert (=> bm!47161 m!1037937))

(declare-fun m!1037939 () Bool)

(assert (=> b!1122716 m!1037939))

(declare-fun m!1037941 () Bool)

(assert (=> b!1122707 m!1037941))

(check-sat (not b!1122717) (not start!98140) (not b!1122704) (not bm!47162) (not b!1122718) b_and!38005 (not b_lambda!18585) (not b!1122707) (not b!1122702) tp_is_empty!28135 (not b!1122709) (not bm!47161) (not b!1122716) (not b!1122706) (not b_next!23605) (not b!1122708) (not b!1122705) (not mapNonEmpty!44020))
(check-sat b_and!38005 (not b_next!23605))
