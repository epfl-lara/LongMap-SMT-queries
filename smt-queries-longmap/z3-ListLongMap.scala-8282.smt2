; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100826 () Bool)

(assert start!100826)

(declare-fun b_free!25965 () Bool)

(declare-fun b_next!25965 () Bool)

(assert (=> start!100826 (= b_free!25965 (not b_next!25965))))

(declare-fun tp!90900 () Bool)

(declare-fun b_and!42931 () Bool)

(assert (=> start!100826 (= tp!90900 b_and!42931)))

(declare-datatypes ((V!46019 0))(
  ( (V!46020 (val!15391 Int)) )
))
(declare-datatypes ((tuple2!19752 0))(
  ( (tuple2!19753 (_1!9887 (_ BitVec 64)) (_2!9887 V!46019)) )
))
(declare-datatypes ((List!26553 0))(
  ( (Nil!26550) (Cons!26549 (h!27758 tuple2!19752) (t!39498 List!26553)) )
))
(declare-datatypes ((ListLongMap!17721 0))(
  ( (ListLongMap!17722 (toList!8876 List!26553)) )
))
(declare-fun call!58936 () ListLongMap!17721)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!58929 () ListLongMap!17721)

(declare-fun b!1207237 () Bool)

(declare-fun e!685574 () Bool)

(declare-fun -!1831 (ListLongMap!17721 (_ BitVec 64)) ListLongMap!17721)

(assert (=> b!1207237 (= e!685574 (= call!58936 (-!1831 call!58929 k0!934)))))

(declare-fun zeroValue!944 () V!46019)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!58926 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46019)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78119 0))(
  ( (array!78120 (arr!37699 (Array (_ BitVec 32) (_ BitVec 64))) (size!38235 (_ BitVec 32))) )
))
(declare-fun lt!547751 () array!78119)

(declare-datatypes ((ValueCell!14625 0))(
  ( (ValueCellFull!14625 (v!18036 V!46019)) (EmptyCell!14625) )
))
(declare-datatypes ((array!78121 0))(
  ( (array!78122 (arr!37700 (Array (_ BitVec 32) ValueCell!14625)) (size!38236 (_ BitVec 32))) )
))
(declare-fun lt!547747 () array!78121)

(declare-fun getCurrentListMapNoExtraKeys!5310 (array!78119 array!78121 (_ BitVec 32) (_ BitVec 32) V!46019 V!46019 (_ BitVec 32) Int) ListLongMap!17721)

(assert (=> bm!58926 (= call!58936 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207238 () Bool)

(declare-fun res!802716 () Bool)

(declare-fun e!685582 () Bool)

(assert (=> b!1207238 (=> (not res!802716) (not e!685582))))

(declare-fun _keys!1208 () array!78119)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78119 (_ BitVec 32)) Bool)

(assert (=> b!1207238 (= res!802716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47862 () Bool)

(declare-fun mapRes!47862 () Bool)

(assert (=> mapIsEmpty!47862 mapRes!47862))

(declare-fun b!1207239 () Bool)

(declare-fun res!802726 () Bool)

(assert (=> b!1207239 (=> (not res!802726) (not e!685582))))

(declare-fun _values!996 () array!78121)

(assert (=> b!1207239 (= res!802726 (and (= (size!38236 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38235 _keys!1208) (size!38236 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1207240 () Bool)

(declare-fun res!802714 () Bool)

(assert (=> b!1207240 (=> (not res!802714) (not e!685582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207240 (= res!802714 (validKeyInArray!0 k0!934))))

(declare-fun b!1207241 () Bool)

(declare-fun e!685576 () Bool)

(declare-fun arrayContainsKey!0 (array!78119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207241 (= e!685576 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207242 () Bool)

(declare-datatypes ((Unit!40015 0))(
  ( (Unit!40016) )
))
(declare-fun e!685584 () Unit!40015)

(declare-fun Unit!40017 () Unit!40015)

(assert (=> b!1207242 (= e!685584 Unit!40017)))

(declare-fun b!1207243 () Bool)

(declare-fun e!685575 () Bool)

(declare-fun tp_is_empty!30669 () Bool)

(assert (=> b!1207243 (= e!685575 tp_is_empty!30669)))

(declare-fun b!1207244 () Bool)

(assert (=> b!1207244 (= e!685574 (= call!58936 call!58929))))

(declare-fun b!1207245 () Bool)

(declare-fun res!802728 () Bool)

(assert (=> b!1207245 (=> (not res!802728) (not e!685582))))

(declare-datatypes ((List!26554 0))(
  ( (Nil!26551) (Cons!26550 (h!27759 (_ BitVec 64)) (t!39499 List!26554)) )
))
(declare-fun arrayNoDuplicates!0 (array!78119 (_ BitVec 32) List!26554) Bool)

(assert (=> b!1207245 (= res!802728 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26551))))

(declare-fun b!1207246 () Bool)

(declare-fun e!685586 () Bool)

(declare-fun e!685587 () Bool)

(assert (=> b!1207246 (= e!685586 e!685587)))

(declare-fun res!802727 () Bool)

(assert (=> b!1207246 (=> res!802727 e!685587)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207246 (= res!802727 (not (= from!1455 i!673)))))

(declare-fun lt!547742 () ListLongMap!17721)

(assert (=> b!1207246 (= lt!547742 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3214 (Int (_ BitVec 64)) V!46019)

(assert (=> b!1207246 (= lt!547747 (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)))))

(declare-fun lt!547741 () ListLongMap!17721)

(assert (=> b!1207246 (= lt!547741 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207247 () Bool)

(declare-fun e!685577 () Bool)

(assert (=> b!1207247 (= e!685577 (and e!685575 mapRes!47862))))

(declare-fun condMapEmpty!47862 () Bool)

(declare-fun mapDefault!47862 () ValueCell!14625)

(assert (=> b!1207247 (= condMapEmpty!47862 (= (arr!37700 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14625)) mapDefault!47862)))))

(declare-fun b!1207248 () Bool)

(declare-fun e!685583 () Bool)

(assert (=> b!1207248 (= e!685583 tp_is_empty!30669)))

(declare-fun b!1207249 () Bool)

(declare-fun c!118613 () Bool)

(declare-fun lt!547740 () Bool)

(assert (=> b!1207249 (= c!118613 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547740))))

(declare-fun e!685578 () Unit!40015)

(assert (=> b!1207249 (= e!685578 e!685584)))

(declare-fun b!1207250 () Bool)

(declare-fun res!802715 () Bool)

(assert (=> b!1207250 (=> (not res!802715) (not e!685582))))

(assert (=> b!1207250 (= res!802715 (= (select (arr!37699 _keys!1208) i!673) k0!934))))

(declare-fun b!1207251 () Bool)

(declare-fun e!685585 () Bool)

(assert (=> b!1207251 (= e!685587 e!685585)))

(declare-fun res!802722 () Bool)

(assert (=> b!1207251 (=> res!802722 e!685585)))

(assert (=> b!1207251 (= res!802722 (not (= (select (arr!37699 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1207251 e!685574))

(declare-fun c!118609 () Bool)

(assert (=> b!1207251 (= c!118609 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547739 () Unit!40015)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 (array!78119 array!78121 (_ BitVec 32) (_ BitVec 32) V!46019 V!46019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40015)

(assert (=> b!1207251 (= lt!547739 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207252 () Bool)

(declare-fun res!802719 () Bool)

(assert (=> b!1207252 (=> (not res!802719) (not e!685582))))

(assert (=> b!1207252 (= res!802719 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38235 _keys!1208))))))

(declare-fun b!1207253 () Bool)

(declare-fun e!685579 () Unit!40015)

(declare-fun lt!547738 () Unit!40015)

(assert (=> b!1207253 (= e!685579 lt!547738)))

(declare-fun lt!547750 () Unit!40015)

(declare-fun call!58935 () Unit!40015)

(assert (=> b!1207253 (= lt!547750 call!58935)))

(declare-fun lt!547744 () ListLongMap!17721)

(declare-fun call!58931 () ListLongMap!17721)

(assert (=> b!1207253 (= lt!547744 call!58931)))

(declare-fun call!58930 () Bool)

(assert (=> b!1207253 call!58930))

(declare-fun addStillContains!1025 (ListLongMap!17721 (_ BitVec 64) V!46019 (_ BitVec 64)) Unit!40015)

(assert (=> b!1207253 (= lt!547738 (addStillContains!1025 lt!547744 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6935 (ListLongMap!17721 (_ BitVec 64)) Bool)

(declare-fun +!3996 (ListLongMap!17721 tuple2!19752) ListLongMap!17721)

(assert (=> b!1207253 (contains!6935 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1207254 () Bool)

(declare-fun e!685580 () Bool)

(assert (=> b!1207254 (= e!685580 (or (bvsge (size!38235 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208))))))

(assert (=> b!1207254 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26551)))

(declare-fun lt!547736 () Unit!40015)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78119 (_ BitVec 32) (_ BitVec 32)) Unit!40015)

(assert (=> b!1207254 (= lt!547736 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1207254 e!685576))

(declare-fun res!802724 () Bool)

(assert (=> b!1207254 (=> (not res!802724) (not e!685576))))

(declare-fun e!685589 () Bool)

(assert (=> b!1207254 (= res!802724 e!685589)))

(declare-fun c!118611 () Bool)

(assert (=> b!1207254 (= c!118611 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547737 () Unit!40015)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!578 (array!78119 array!78121 (_ BitVec 32) (_ BitVec 32) V!46019 V!46019 (_ BitVec 64) (_ BitVec 32) Int) Unit!40015)

(assert (=> b!1207254 (= lt!547737 (lemmaListMapContainsThenArrayContainsFrom!578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547748 () Unit!40015)

(assert (=> b!1207254 (= lt!547748 e!685579)))

(declare-fun c!118610 () Bool)

(assert (=> b!1207254 (= c!118610 (and (not lt!547740) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207254 (= lt!547740 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!118612 () Bool)

(declare-fun lt!547743 () ListLongMap!17721)

(declare-fun bm!58927 () Bool)

(assert (=> bm!58927 (= call!58931 (+!3996 lt!547743 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207255 () Bool)

(declare-fun e!685588 () Bool)

(assert (=> b!1207255 (= e!685582 e!685588)))

(declare-fun res!802723 () Bool)

(assert (=> b!1207255 (=> (not res!802723) (not e!685588))))

(assert (=> b!1207255 (= res!802723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547751 mask!1564))))

(assert (=> b!1207255 (= lt!547751 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)))))

(declare-fun bm!58928 () Bool)

(declare-fun call!58932 () Unit!40015)

(assert (=> bm!58928 (= call!58932 call!58935)))

(declare-fun bm!58929 () Bool)

(assert (=> bm!58929 (= call!58929 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207256 () Bool)

(assert (=> b!1207256 (= e!685589 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547740) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1207257 () Bool)

(assert (=> b!1207257 (= e!685579 e!685578)))

(assert (=> b!1207257 (= c!118612 (and (not lt!547740) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!802717 () Bool)

(assert (=> start!100826 (=> (not res!802717) (not e!685582))))

(assert (=> start!100826 (= res!802717 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38235 _keys!1208))))))

(assert (=> start!100826 e!685582))

(assert (=> start!100826 tp_is_empty!30669))

(declare-fun array_inv!28714 (array!78119) Bool)

(assert (=> start!100826 (array_inv!28714 _keys!1208)))

(assert (=> start!100826 true))

(assert (=> start!100826 tp!90900))

(declare-fun array_inv!28715 (array!78121) Bool)

(assert (=> start!100826 (and (array_inv!28715 _values!996) e!685577)))

(declare-fun b!1207258 () Bool)

(assert (=> b!1207258 (= e!685588 (not e!685586))))

(declare-fun res!802720 () Bool)

(assert (=> b!1207258 (=> res!802720 e!685586)))

(assert (=> b!1207258 (= res!802720 (bvsgt from!1455 i!673))))

(assert (=> b!1207258 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547749 () Unit!40015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78119 (_ BitVec 64) (_ BitVec 32)) Unit!40015)

(assert (=> b!1207258 (= lt!547749 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!58930 () Bool)

(declare-fun call!58934 () Bool)

(assert (=> bm!58930 (= call!58934 call!58930)))

(declare-fun bm!58931 () Bool)

(assert (=> bm!58931 (= call!58935 (addStillContains!1025 lt!547743 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1207259 () Bool)

(declare-fun res!802721 () Bool)

(assert (=> b!1207259 (=> (not res!802721) (not e!685582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207259 (= res!802721 (validMask!0 mask!1564))))

(declare-fun b!1207260 () Bool)

(declare-fun lt!547745 () Unit!40015)

(assert (=> b!1207260 (= e!685584 lt!547745)))

(assert (=> b!1207260 (= lt!547745 call!58932)))

(assert (=> b!1207260 call!58934))

(declare-fun b!1207261 () Bool)

(assert (=> b!1207261 (= e!685589 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58932 () Bool)

(declare-fun call!58933 () ListLongMap!17721)

(assert (=> bm!58932 (= call!58933 call!58931)))

(declare-fun mapNonEmpty!47862 () Bool)

(declare-fun tp!90901 () Bool)

(assert (=> mapNonEmpty!47862 (= mapRes!47862 (and tp!90901 e!685583))))

(declare-fun mapKey!47862 () (_ BitVec 32))

(declare-fun mapRest!47862 () (Array (_ BitVec 32) ValueCell!14625))

(declare-fun mapValue!47862 () ValueCell!14625)

(assert (=> mapNonEmpty!47862 (= (arr!37700 _values!996) (store mapRest!47862 mapKey!47862 mapValue!47862))))

(declare-fun bm!58933 () Bool)

(assert (=> bm!58933 (= call!58930 (contains!6935 (ite c!118610 lt!547744 call!58933) k0!934))))

(declare-fun b!1207262 () Bool)

(assert (=> b!1207262 (= e!685585 e!685580)))

(declare-fun res!802725 () Bool)

(assert (=> b!1207262 (=> res!802725 e!685580)))

(assert (=> b!1207262 (= res!802725 (not (contains!6935 lt!547743 k0!934)))))

(assert (=> b!1207262 (= lt!547743 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207263 () Bool)

(declare-fun res!802718 () Bool)

(assert (=> b!1207263 (=> (not res!802718) (not e!685588))))

(assert (=> b!1207263 (= res!802718 (arrayNoDuplicates!0 lt!547751 #b00000000000000000000000000000000 Nil!26551))))

(declare-fun b!1207264 () Bool)

(assert (=> b!1207264 call!58934))

(declare-fun lt!547746 () Unit!40015)

(assert (=> b!1207264 (= lt!547746 call!58932)))

(assert (=> b!1207264 (= e!685578 lt!547746)))

(assert (= (and start!100826 res!802717) b!1207259))

(assert (= (and b!1207259 res!802721) b!1207239))

(assert (= (and b!1207239 res!802726) b!1207238))

(assert (= (and b!1207238 res!802716) b!1207245))

(assert (= (and b!1207245 res!802728) b!1207252))

(assert (= (and b!1207252 res!802719) b!1207240))

(assert (= (and b!1207240 res!802714) b!1207250))

(assert (= (and b!1207250 res!802715) b!1207255))

(assert (= (and b!1207255 res!802723) b!1207263))

(assert (= (and b!1207263 res!802718) b!1207258))

(assert (= (and b!1207258 (not res!802720)) b!1207246))

(assert (= (and b!1207246 (not res!802727)) b!1207251))

(assert (= (and b!1207251 c!118609) b!1207237))

(assert (= (and b!1207251 (not c!118609)) b!1207244))

(assert (= (or b!1207237 b!1207244) bm!58926))

(assert (= (or b!1207237 b!1207244) bm!58929))

(assert (= (and b!1207251 (not res!802722)) b!1207262))

(assert (= (and b!1207262 (not res!802725)) b!1207254))

(assert (= (and b!1207254 c!118610) b!1207253))

(assert (= (and b!1207254 (not c!118610)) b!1207257))

(assert (= (and b!1207257 c!118612) b!1207264))

(assert (= (and b!1207257 (not c!118612)) b!1207249))

(assert (= (and b!1207249 c!118613) b!1207260))

(assert (= (and b!1207249 (not c!118613)) b!1207242))

(assert (= (or b!1207264 b!1207260) bm!58928))

(assert (= (or b!1207264 b!1207260) bm!58932))

(assert (= (or b!1207264 b!1207260) bm!58930))

(assert (= (or b!1207253 bm!58930) bm!58933))

(assert (= (or b!1207253 bm!58928) bm!58931))

(assert (= (or b!1207253 bm!58932) bm!58927))

(assert (= (and b!1207254 c!118611) b!1207261))

(assert (= (and b!1207254 (not c!118611)) b!1207256))

(assert (= (and b!1207254 res!802724) b!1207241))

(assert (= (and b!1207247 condMapEmpty!47862) mapIsEmpty!47862))

(assert (= (and b!1207247 (not condMapEmpty!47862)) mapNonEmpty!47862))

(get-info :version)

(assert (= (and mapNonEmpty!47862 ((_ is ValueCellFull!14625) mapValue!47862)) b!1207248))

(assert (= (and b!1207247 ((_ is ValueCellFull!14625) mapDefault!47862)) b!1207243))

(assert (= start!100826 b!1207247))

(declare-fun b_lambda!21399 () Bool)

(assert (=> (not b_lambda!21399) (not b!1207246)))

(declare-fun t!39497 () Bool)

(declare-fun tb!10765 () Bool)

(assert (=> (and start!100826 (= defaultEntry!1004 defaultEntry!1004) t!39497) tb!10765))

(declare-fun result!22117 () Bool)

(assert (=> tb!10765 (= result!22117 tp_is_empty!30669)))

(assert (=> b!1207246 t!39497))

(declare-fun b_and!42933 () Bool)

(assert (= b_and!42931 (and (=> t!39497 result!22117) b_and!42933)))

(declare-fun m!1112791 () Bool)

(assert (=> b!1207259 m!1112791))

(declare-fun m!1112793 () Bool)

(assert (=> bm!58929 m!1112793))

(declare-fun m!1112795 () Bool)

(assert (=> bm!58933 m!1112795))

(declare-fun m!1112797 () Bool)

(assert (=> b!1207253 m!1112797))

(declare-fun m!1112799 () Bool)

(assert (=> b!1207253 m!1112799))

(assert (=> b!1207253 m!1112799))

(declare-fun m!1112801 () Bool)

(assert (=> b!1207253 m!1112801))

(declare-fun m!1112803 () Bool)

(assert (=> b!1207240 m!1112803))

(declare-fun m!1112805 () Bool)

(assert (=> b!1207251 m!1112805))

(declare-fun m!1112807 () Bool)

(assert (=> b!1207251 m!1112807))

(declare-fun m!1112809 () Bool)

(assert (=> b!1207255 m!1112809))

(declare-fun m!1112811 () Bool)

(assert (=> b!1207255 m!1112811))

(declare-fun m!1112813 () Bool)

(assert (=> bm!58926 m!1112813))

(declare-fun m!1112815 () Bool)

(assert (=> b!1207241 m!1112815))

(declare-fun m!1112817 () Bool)

(assert (=> start!100826 m!1112817))

(declare-fun m!1112819 () Bool)

(assert (=> start!100826 m!1112819))

(declare-fun m!1112821 () Bool)

(assert (=> b!1207245 m!1112821))

(declare-fun m!1112823 () Bool)

(assert (=> b!1207262 m!1112823))

(assert (=> b!1207262 m!1112793))

(declare-fun m!1112825 () Bool)

(assert (=> b!1207258 m!1112825))

(declare-fun m!1112827 () Bool)

(assert (=> b!1207258 m!1112827))

(declare-fun m!1112829 () Bool)

(assert (=> b!1207250 m!1112829))

(declare-fun m!1112831 () Bool)

(assert (=> bm!58931 m!1112831))

(declare-fun m!1112833 () Bool)

(assert (=> mapNonEmpty!47862 m!1112833))

(declare-fun m!1112835 () Bool)

(assert (=> b!1207254 m!1112835))

(declare-fun m!1112837 () Bool)

(assert (=> b!1207254 m!1112837))

(declare-fun m!1112839 () Bool)

(assert (=> b!1207254 m!1112839))

(declare-fun m!1112841 () Bool)

(assert (=> b!1207237 m!1112841))

(declare-fun m!1112843 () Bool)

(assert (=> b!1207263 m!1112843))

(declare-fun m!1112845 () Bool)

(assert (=> b!1207246 m!1112845))

(declare-fun m!1112847 () Bool)

(assert (=> b!1207246 m!1112847))

(declare-fun m!1112849 () Bool)

(assert (=> b!1207246 m!1112849))

(declare-fun m!1112851 () Bool)

(assert (=> b!1207246 m!1112851))

(declare-fun m!1112853 () Bool)

(assert (=> b!1207238 m!1112853))

(declare-fun m!1112855 () Bool)

(assert (=> bm!58927 m!1112855))

(assert (=> b!1207261 m!1112815))

(check-sat (not b!1207259) (not b!1207254) (not b!1207251) (not bm!58927) (not b!1207263) (not bm!58933) (not bm!58929) (not b!1207245) (not b_lambda!21399) (not b!1207241) (not b!1207262) (not b!1207258) (not b!1207237) (not start!100826) (not b!1207238) tp_is_empty!30669 (not b!1207253) (not b_next!25965) (not bm!58931) (not bm!58926) (not b!1207240) b_and!42933 (not b!1207246) (not b!1207261) (not b!1207255) (not mapNonEmpty!47862))
(check-sat b_and!42933 (not b_next!25965))
(get-model)

(declare-fun b_lambda!21403 () Bool)

(assert (= b_lambda!21399 (or (and start!100826 b_free!25965) b_lambda!21403)))

(check-sat (not b!1207259) (not b!1207254) (not b!1207251) (not bm!58927) (not b!1207263) (not bm!58933) (not bm!58929) (not b!1207241) (not b!1207262) (not b!1207258) (not b!1207237) (not start!100826) (not b!1207238) tp_is_empty!30669 (not b!1207253) (not b_next!25965) (not bm!58931) (not bm!58926) (not b!1207240) (not b_lambda!21403) (not b!1207245) b_and!42933 (not b!1207246) (not b!1207261) (not b!1207255) (not mapNonEmpty!47862))
(check-sat b_and!42933 (not b_next!25965))
(get-model)

(declare-fun d!132955 () Bool)

(assert (=> d!132955 (contains!6935 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!547802 () Unit!40015)

(declare-fun choose!1801 (ListLongMap!17721 (_ BitVec 64) V!46019 (_ BitVec 64)) Unit!40015)

(assert (=> d!132955 (= lt!547802 (choose!1801 lt!547744 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132955 (contains!6935 lt!547744 k0!934)))

(assert (=> d!132955 (= (addStillContains!1025 lt!547744 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!547802)))

(declare-fun bs!34129 () Bool)

(assert (= bs!34129 d!132955))

(assert (=> bs!34129 m!1112799))

(assert (=> bs!34129 m!1112799))

(assert (=> bs!34129 m!1112801))

(declare-fun m!1112923 () Bool)

(assert (=> bs!34129 m!1112923))

(declare-fun m!1112925 () Bool)

(assert (=> bs!34129 m!1112925))

(assert (=> b!1207253 d!132955))

(declare-fun d!132957 () Bool)

(declare-fun e!685642 () Bool)

(assert (=> d!132957 e!685642))

(declare-fun res!802776 () Bool)

(assert (=> d!132957 (=> res!802776 e!685642)))

(declare-fun lt!547811 () Bool)

(assert (=> d!132957 (= res!802776 (not lt!547811))))

(declare-fun lt!547814 () Bool)

(assert (=> d!132957 (= lt!547811 lt!547814)))

(declare-fun lt!547813 () Unit!40015)

(declare-fun e!685643 () Unit!40015)

(assert (=> d!132957 (= lt!547813 e!685643)))

(declare-fun c!118631 () Bool)

(assert (=> d!132957 (= c!118631 lt!547814)))

(declare-fun containsKey!592 (List!26553 (_ BitVec 64)) Bool)

(assert (=> d!132957 (= lt!547814 (containsKey!592 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132957 (= (contains!6935 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!547811)))

(declare-fun b!1207360 () Bool)

(declare-fun lt!547812 () Unit!40015)

(assert (=> b!1207360 (= e!685643 lt!547812)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!422 (List!26553 (_ BitVec 64)) Unit!40015)

(assert (=> b!1207360 (= lt!547812 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!687 0))(
  ( (Some!686 (v!18038 V!46019)) (None!685) )
))
(declare-fun isDefined!461 (Option!687) Bool)

(declare-fun getValueByKey!636 (List!26553 (_ BitVec 64)) Option!687)

(assert (=> b!1207360 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1207361 () Bool)

(declare-fun Unit!40021 () Unit!40015)

(assert (=> b!1207361 (= e!685643 Unit!40021)))

(declare-fun b!1207362 () Bool)

(assert (=> b!1207362 (= e!685642 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132957 c!118631) b!1207360))

(assert (= (and d!132957 (not c!118631)) b!1207361))

(assert (= (and d!132957 (not res!802776)) b!1207362))

(declare-fun m!1112927 () Bool)

(assert (=> d!132957 m!1112927))

(declare-fun m!1112929 () Bool)

(assert (=> b!1207360 m!1112929))

(declare-fun m!1112931 () Bool)

(assert (=> b!1207360 m!1112931))

(assert (=> b!1207360 m!1112931))

(declare-fun m!1112933 () Bool)

(assert (=> b!1207360 m!1112933))

(assert (=> b!1207362 m!1112931))

(assert (=> b!1207362 m!1112931))

(assert (=> b!1207362 m!1112933))

(assert (=> b!1207253 d!132957))

(declare-fun d!132959 () Bool)

(declare-fun e!685646 () Bool)

(assert (=> d!132959 e!685646))

(declare-fun res!802781 () Bool)

(assert (=> d!132959 (=> (not res!802781) (not e!685646))))

(declare-fun lt!547824 () ListLongMap!17721)

(assert (=> d!132959 (= res!802781 (contains!6935 lt!547824 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!547823 () List!26553)

(assert (=> d!132959 (= lt!547824 (ListLongMap!17722 lt!547823))))

(declare-fun lt!547826 () Unit!40015)

(declare-fun lt!547825 () Unit!40015)

(assert (=> d!132959 (= lt!547826 lt!547825)))

(assert (=> d!132959 (= (getValueByKey!636 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!686 (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!313 (List!26553 (_ BitVec 64) V!46019) Unit!40015)

(assert (=> d!132959 (= lt!547825 (lemmaContainsTupThenGetReturnValue!313 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!406 (List!26553 (_ BitVec 64) V!46019) List!26553)

(assert (=> d!132959 (= lt!547823 (insertStrictlySorted!406 (toList!8876 lt!547744) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132959 (= (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!547824)))

(declare-fun b!1207367 () Bool)

(declare-fun res!802782 () Bool)

(assert (=> b!1207367 (=> (not res!802782) (not e!685646))))

(assert (=> b!1207367 (= res!802782 (= (getValueByKey!636 (toList!8876 lt!547824) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!686 (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207368 () Bool)

(declare-fun contains!6936 (List!26553 tuple2!19752) Bool)

(assert (=> b!1207368 (= e!685646 (contains!6936 (toList!8876 lt!547824) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132959 res!802781) b!1207367))

(assert (= (and b!1207367 res!802782) b!1207368))

(declare-fun m!1112935 () Bool)

(assert (=> d!132959 m!1112935))

(declare-fun m!1112937 () Bool)

(assert (=> d!132959 m!1112937))

(declare-fun m!1112939 () Bool)

(assert (=> d!132959 m!1112939))

(declare-fun m!1112941 () Bool)

(assert (=> d!132959 m!1112941))

(declare-fun m!1112943 () Bool)

(assert (=> b!1207367 m!1112943))

(declare-fun m!1112945 () Bool)

(assert (=> b!1207368 m!1112945))

(assert (=> b!1207253 d!132959))

(declare-fun d!132961 () Bool)

(assert (=> d!132961 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1207259 d!132961))

(declare-fun b!1207379 () Bool)

(declare-fun e!685656 () Bool)

(declare-fun e!685658 () Bool)

(assert (=> b!1207379 (= e!685656 e!685658)))

(declare-fun res!802791 () Bool)

(assert (=> b!1207379 (=> (not res!802791) (not e!685658))))

(declare-fun e!685655 () Bool)

(assert (=> b!1207379 (= res!802791 (not e!685655))))

(declare-fun res!802789 () Bool)

(assert (=> b!1207379 (=> (not res!802789) (not e!685655))))

(assert (=> b!1207379 (= res!802789 (validKeyInArray!0 (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun b!1207380 () Bool)

(declare-fun contains!6937 (List!26554 (_ BitVec 64)) Bool)

(assert (=> b!1207380 (= e!685655 (contains!6937 Nil!26551 (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun b!1207381 () Bool)

(declare-fun e!685657 () Bool)

(assert (=> b!1207381 (= e!685658 e!685657)))

(declare-fun c!118634 () Bool)

(assert (=> b!1207381 (= c!118634 (validKeyInArray!0 (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun d!132963 () Bool)

(declare-fun res!802790 () Bool)

(assert (=> d!132963 (=> res!802790 e!685656)))

(assert (=> d!132963 (= res!802790 (bvsge from!1455 (size!38235 _keys!1208)))))

(assert (=> d!132963 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26551) e!685656)))

(declare-fun b!1207382 () Bool)

(declare-fun call!58963 () Bool)

(assert (=> b!1207382 (= e!685657 call!58963)))

(declare-fun b!1207383 () Bool)

(assert (=> b!1207383 (= e!685657 call!58963)))

(declare-fun bm!58960 () Bool)

(assert (=> bm!58960 (= call!58963 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118634 (Cons!26550 (select (arr!37699 _keys!1208) from!1455) Nil!26551) Nil!26551)))))

(assert (= (and d!132963 (not res!802790)) b!1207379))

(assert (= (and b!1207379 res!802789) b!1207380))

(assert (= (and b!1207379 res!802791) b!1207381))

(assert (= (and b!1207381 c!118634) b!1207382))

(assert (= (and b!1207381 (not c!118634)) b!1207383))

(assert (= (or b!1207382 b!1207383) bm!58960))

(assert (=> b!1207379 m!1112805))

(assert (=> b!1207379 m!1112805))

(declare-fun m!1112947 () Bool)

(assert (=> b!1207379 m!1112947))

(assert (=> b!1207380 m!1112805))

(assert (=> b!1207380 m!1112805))

(declare-fun m!1112949 () Bool)

(assert (=> b!1207380 m!1112949))

(assert (=> b!1207381 m!1112805))

(assert (=> b!1207381 m!1112805))

(assert (=> b!1207381 m!1112947))

(assert (=> bm!58960 m!1112805))

(declare-fun m!1112951 () Bool)

(assert (=> bm!58960 m!1112951))

(assert (=> b!1207254 d!132963))

(declare-fun d!132965 () Bool)

(assert (=> d!132965 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26551)))

(declare-fun lt!547829 () Unit!40015)

(declare-fun choose!39 (array!78119 (_ BitVec 32) (_ BitVec 32)) Unit!40015)

(assert (=> d!132965 (= lt!547829 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!132965 (bvslt (size!38235 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!132965 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!547829)))

(declare-fun bs!34130 () Bool)

(assert (= bs!34130 d!132965))

(assert (=> bs!34130 m!1112835))

(declare-fun m!1112953 () Bool)

(assert (=> bs!34130 m!1112953))

(assert (=> b!1207254 d!132965))

(declare-fun d!132967 () Bool)

(declare-fun e!685661 () Bool)

(assert (=> d!132967 e!685661))

(declare-fun c!118637 () Bool)

(assert (=> d!132967 (= c!118637 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547832 () Unit!40015)

(declare-fun choose!1802 (array!78119 array!78121 (_ BitVec 32) (_ BitVec 32) V!46019 V!46019 (_ BitVec 64) (_ BitVec 32) Int) Unit!40015)

(assert (=> d!132967 (= lt!547832 (choose!1802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132967 (validMask!0 mask!1564)))

(assert (=> d!132967 (= (lemmaListMapContainsThenArrayContainsFrom!578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547832)))

(declare-fun b!1207388 () Bool)

(assert (=> b!1207388 (= e!685661 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207389 () Bool)

(assert (=> b!1207389 (= e!685661 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132967 c!118637) b!1207388))

(assert (= (and d!132967 (not c!118637)) b!1207389))

(declare-fun m!1112955 () Bool)

(assert (=> d!132967 m!1112955))

(assert (=> d!132967 m!1112791))

(assert (=> b!1207388 m!1112815))

(assert (=> b!1207254 d!132967))

(declare-fun d!132969 () Bool)

(declare-fun e!685662 () Bool)

(assert (=> d!132969 e!685662))

(declare-fun res!802792 () Bool)

(assert (=> d!132969 (=> (not res!802792) (not e!685662))))

(declare-fun lt!547834 () ListLongMap!17721)

(assert (=> d!132969 (= res!802792 (contains!6935 lt!547834 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!547833 () List!26553)

(assert (=> d!132969 (= lt!547834 (ListLongMap!17722 lt!547833))))

(declare-fun lt!547836 () Unit!40015)

(declare-fun lt!547835 () Unit!40015)

(assert (=> d!132969 (= lt!547836 lt!547835)))

(assert (=> d!132969 (= (getValueByKey!636 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!686 (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132969 (= lt!547835 (lemmaContainsTupThenGetReturnValue!313 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132969 (= lt!547833 (insertStrictlySorted!406 (toList!8876 lt!547743) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132969 (= (+!3996 lt!547743 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!547834)))

(declare-fun b!1207390 () Bool)

(declare-fun res!802793 () Bool)

(assert (=> b!1207390 (=> (not res!802793) (not e!685662))))

(assert (=> b!1207390 (= res!802793 (= (getValueByKey!636 (toList!8876 lt!547834) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!686 (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207391 () Bool)

(assert (=> b!1207391 (= e!685662 (contains!6936 (toList!8876 lt!547834) (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132969 res!802792) b!1207390))

(assert (= (and b!1207390 res!802793) b!1207391))

(declare-fun m!1112957 () Bool)

(assert (=> d!132969 m!1112957))

(declare-fun m!1112959 () Bool)

(assert (=> d!132969 m!1112959))

(declare-fun m!1112961 () Bool)

(assert (=> d!132969 m!1112961))

(declare-fun m!1112963 () Bool)

(assert (=> d!132969 m!1112963))

(declare-fun m!1112965 () Bool)

(assert (=> b!1207390 m!1112965))

(declare-fun m!1112967 () Bool)

(assert (=> b!1207391 m!1112967))

(assert (=> bm!58927 d!132969))

(declare-fun d!132971 () Bool)

(declare-fun res!802798 () Bool)

(declare-fun e!685667 () Bool)

(assert (=> d!132971 (=> res!802798 e!685667)))

(assert (=> d!132971 (= res!802798 (= (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132971 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!685667)))

(declare-fun b!1207396 () Bool)

(declare-fun e!685668 () Bool)

(assert (=> b!1207396 (= e!685667 e!685668)))

(declare-fun res!802799 () Bool)

(assert (=> b!1207396 (=> (not res!802799) (not e!685668))))

(assert (=> b!1207396 (= res!802799 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207397 () Bool)

(assert (=> b!1207397 (= e!685668 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132971 (not res!802798)) b!1207396))

(assert (= (and b!1207396 res!802799) b!1207397))

(declare-fun m!1112969 () Bool)

(assert (=> d!132971 m!1112969))

(declare-fun m!1112971 () Bool)

(assert (=> b!1207397 m!1112971))

(assert (=> b!1207261 d!132971))

(declare-fun b!1207398 () Bool)

(declare-fun e!685670 () Bool)

(declare-fun e!685672 () Bool)

(assert (=> b!1207398 (= e!685670 e!685672)))

(declare-fun res!802802 () Bool)

(assert (=> b!1207398 (=> (not res!802802) (not e!685672))))

(declare-fun e!685669 () Bool)

(assert (=> b!1207398 (= res!802802 (not e!685669))))

(declare-fun res!802800 () Bool)

(assert (=> b!1207398 (=> (not res!802800) (not e!685669))))

(assert (=> b!1207398 (= res!802800 (validKeyInArray!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207399 () Bool)

(assert (=> b!1207399 (= e!685669 (contains!6937 Nil!26551 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207400 () Bool)

(declare-fun e!685671 () Bool)

(assert (=> b!1207400 (= e!685672 e!685671)))

(declare-fun c!118638 () Bool)

(assert (=> b!1207400 (= c!118638 (validKeyInArray!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132973 () Bool)

(declare-fun res!802801 () Bool)

(assert (=> d!132973 (=> res!802801 e!685670)))

(assert (=> d!132973 (= res!802801 (bvsge #b00000000000000000000000000000000 (size!38235 _keys!1208)))))

(assert (=> d!132973 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26551) e!685670)))

(declare-fun b!1207401 () Bool)

(declare-fun call!58964 () Bool)

(assert (=> b!1207401 (= e!685671 call!58964)))

(declare-fun b!1207402 () Bool)

(assert (=> b!1207402 (= e!685671 call!58964)))

(declare-fun bm!58961 () Bool)

(assert (=> bm!58961 (= call!58964 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118638 (Cons!26550 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) Nil!26551) Nil!26551)))))

(assert (= (and d!132973 (not res!802801)) b!1207398))

(assert (= (and b!1207398 res!802800) b!1207399))

(assert (= (and b!1207398 res!802802) b!1207400))

(assert (= (and b!1207400 c!118638) b!1207401))

(assert (= (and b!1207400 (not c!118638)) b!1207402))

(assert (= (or b!1207401 b!1207402) bm!58961))

(declare-fun m!1112973 () Bool)

(assert (=> b!1207398 m!1112973))

(assert (=> b!1207398 m!1112973))

(declare-fun m!1112975 () Bool)

(assert (=> b!1207398 m!1112975))

(assert (=> b!1207399 m!1112973))

(assert (=> b!1207399 m!1112973))

(declare-fun m!1112977 () Bool)

(assert (=> b!1207399 m!1112977))

(assert (=> b!1207400 m!1112973))

(assert (=> b!1207400 m!1112973))

(assert (=> b!1207400 m!1112975))

(assert (=> bm!58961 m!1112973))

(declare-fun m!1112979 () Bool)

(assert (=> bm!58961 m!1112979))

(assert (=> b!1207245 d!132973))

(declare-fun b!1207411 () Bool)

(declare-fun e!685679 () Bool)

(declare-fun call!58967 () Bool)

(assert (=> b!1207411 (= e!685679 call!58967)))

(declare-fun b!1207412 () Bool)

(declare-fun e!685681 () Bool)

(declare-fun e!685680 () Bool)

(assert (=> b!1207412 (= e!685681 e!685680)))

(declare-fun c!118641 () Bool)

(assert (=> b!1207412 (= c!118641 (validKeyInArray!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun b!1207413 () Bool)

(assert (=> b!1207413 (= e!685680 e!685679)))

(declare-fun lt!547843 () (_ BitVec 64))

(assert (=> b!1207413 (= lt!547843 (select (arr!37699 lt!547751) #b00000000000000000000000000000000))))

(declare-fun lt!547844 () Unit!40015)

(assert (=> b!1207413 (= lt!547844 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547751 lt!547843 #b00000000000000000000000000000000))))

(assert (=> b!1207413 (arrayContainsKey!0 lt!547751 lt!547843 #b00000000000000000000000000000000)))

(declare-fun lt!547845 () Unit!40015)

(assert (=> b!1207413 (= lt!547845 lt!547844)))

(declare-fun res!802807 () Bool)

(declare-datatypes ((SeekEntryResult!9938 0))(
  ( (MissingZero!9938 (index!42123 (_ BitVec 32))) (Found!9938 (index!42124 (_ BitVec 32))) (Intermediate!9938 (undefined!10750 Bool) (index!42125 (_ BitVec 32)) (x!106580 (_ BitVec 32))) (Undefined!9938) (MissingVacant!9938 (index!42126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78119 (_ BitVec 32)) SeekEntryResult!9938)

(assert (=> b!1207413 (= res!802807 (= (seekEntryOrOpen!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) lt!547751 mask!1564) (Found!9938 #b00000000000000000000000000000000)))))

(assert (=> b!1207413 (=> (not res!802807) (not e!685679))))

(declare-fun bm!58964 () Bool)

(assert (=> bm!58964 (= call!58967 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!547751 mask!1564))))

(declare-fun d!132975 () Bool)

(declare-fun res!802808 () Bool)

(assert (=> d!132975 (=> res!802808 e!685681)))

(assert (=> d!132975 (= res!802808 (bvsge #b00000000000000000000000000000000 (size!38235 lt!547751)))))

(assert (=> d!132975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547751 mask!1564) e!685681)))

(declare-fun b!1207414 () Bool)

(assert (=> b!1207414 (= e!685680 call!58967)))

(assert (= (and d!132975 (not res!802808)) b!1207412))

(assert (= (and b!1207412 c!118641) b!1207413))

(assert (= (and b!1207412 (not c!118641)) b!1207414))

(assert (= (and b!1207413 res!802807) b!1207411))

(assert (= (or b!1207411 b!1207414) bm!58964))

(declare-fun m!1112981 () Bool)

(assert (=> b!1207412 m!1112981))

(assert (=> b!1207412 m!1112981))

(declare-fun m!1112983 () Bool)

(assert (=> b!1207412 m!1112983))

(assert (=> b!1207413 m!1112981))

(declare-fun m!1112985 () Bool)

(assert (=> b!1207413 m!1112985))

(declare-fun m!1112987 () Bool)

(assert (=> b!1207413 m!1112987))

(assert (=> b!1207413 m!1112981))

(declare-fun m!1112989 () Bool)

(assert (=> b!1207413 m!1112989))

(declare-fun m!1112991 () Bool)

(assert (=> bm!58964 m!1112991))

(assert (=> b!1207255 d!132975))

(declare-fun d!132977 () Bool)

(declare-fun lt!547848 () ListLongMap!17721)

(assert (=> d!132977 (not (contains!6935 lt!547848 k0!934))))

(declare-fun removeStrictlySorted!98 (List!26553 (_ BitVec 64)) List!26553)

(assert (=> d!132977 (= lt!547848 (ListLongMap!17722 (removeStrictlySorted!98 (toList!8876 call!58929) k0!934)))))

(assert (=> d!132977 (= (-!1831 call!58929 k0!934) lt!547848)))

(declare-fun bs!34131 () Bool)

(assert (= bs!34131 d!132977))

(declare-fun m!1112993 () Bool)

(assert (=> bs!34131 m!1112993))

(declare-fun m!1112995 () Bool)

(assert (=> bs!34131 m!1112995))

(assert (=> b!1207237 d!132977))

(declare-fun b!1207439 () Bool)

(declare-fun lt!547864 () Unit!40015)

(declare-fun lt!547866 () Unit!40015)

(assert (=> b!1207439 (= lt!547864 lt!547866)))

(declare-fun lt!547863 () (_ BitVec 64))

(declare-fun lt!547867 () (_ BitVec 64))

(declare-fun lt!547869 () V!46019)

(declare-fun lt!547865 () ListLongMap!17721)

(assert (=> b!1207439 (not (contains!6935 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869)) lt!547863))))

(declare-fun addStillNotContains!293 (ListLongMap!17721 (_ BitVec 64) V!46019 (_ BitVec 64)) Unit!40015)

(assert (=> b!1207439 (= lt!547866 (addStillNotContains!293 lt!547865 lt!547867 lt!547869 lt!547863))))

(assert (=> b!1207439 (= lt!547863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19210 (ValueCell!14625 V!46019) V!46019)

(assert (=> b!1207439 (= lt!547869 (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207439 (= lt!547867 (select (arr!37699 lt!547751) from!1455))))

(declare-fun call!58970 () ListLongMap!17721)

(assert (=> b!1207439 (= lt!547865 call!58970)))

(declare-fun e!685697 () ListLongMap!17721)

(assert (=> b!1207439 (= e!685697 (+!3996 call!58970 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207440 () Bool)

(declare-fun res!802820 () Bool)

(declare-fun e!685700 () Bool)

(assert (=> b!1207440 (=> (not res!802820) (not e!685700))))

(declare-fun lt!547868 () ListLongMap!17721)

(assert (=> b!1207440 (= res!802820 (not (contains!6935 lt!547868 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207441 () Bool)

(declare-fun e!685702 () Bool)

(assert (=> b!1207441 (= e!685700 e!685702)))

(declare-fun c!118650 () Bool)

(declare-fun e!685701 () Bool)

(assert (=> b!1207441 (= c!118650 e!685701)))

(declare-fun res!802819 () Bool)

(assert (=> b!1207441 (=> (not res!802819) (not e!685701))))

(assert (=> b!1207441 (= res!802819 (bvslt from!1455 (size!38235 lt!547751)))))

(declare-fun b!1207442 () Bool)

(declare-fun e!685696 () Bool)

(declare-fun isEmpty!987 (ListLongMap!17721) Bool)

(assert (=> b!1207442 (= e!685696 (isEmpty!987 lt!547868))))

(declare-fun b!1207443 () Bool)

(assert (=> b!1207443 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38235 lt!547751)))))

(assert (=> b!1207443 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38236 lt!547747)))))

(declare-fun e!685698 () Bool)

(declare-fun apply!965 (ListLongMap!17721 (_ BitVec 64)) V!46019)

(assert (=> b!1207443 (= e!685698 (= (apply!965 lt!547868 (select (arr!37699 lt!547751) from!1455)) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207444 () Bool)

(assert (=> b!1207444 (= e!685701 (validKeyInArray!0 (select (arr!37699 lt!547751) from!1455)))))

(assert (=> b!1207444 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1207445 () Bool)

(assert (=> b!1207445 (= e!685702 e!685696)))

(declare-fun c!118652 () Bool)

(assert (=> b!1207445 (= c!118652 (bvslt from!1455 (size!38235 lt!547751)))))

(declare-fun bm!58967 () Bool)

(assert (=> bm!58967 (= call!58970 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207446 () Bool)

(assert (=> b!1207446 (= e!685696 (= lt!547868 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207447 () Bool)

(declare-fun e!685699 () ListLongMap!17721)

(assert (=> b!1207447 (= e!685699 e!685697)))

(declare-fun c!118651 () Bool)

(assert (=> b!1207447 (= c!118651 (validKeyInArray!0 (select (arr!37699 lt!547751) from!1455)))))

(declare-fun b!1207448 () Bool)

(assert (=> b!1207448 (= e!685702 e!685698)))

(assert (=> b!1207448 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38235 lt!547751)))))

(declare-fun res!802817 () Bool)

(assert (=> b!1207448 (= res!802817 (contains!6935 lt!547868 (select (arr!37699 lt!547751) from!1455)))))

(assert (=> b!1207448 (=> (not res!802817) (not e!685698))))

(declare-fun d!132979 () Bool)

(assert (=> d!132979 e!685700))

(declare-fun res!802818 () Bool)

(assert (=> d!132979 (=> (not res!802818) (not e!685700))))

(assert (=> d!132979 (= res!802818 (not (contains!6935 lt!547868 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132979 (= lt!547868 e!685699)))

(declare-fun c!118653 () Bool)

(assert (=> d!132979 (= c!118653 (bvsge from!1455 (size!38235 lt!547751)))))

(assert (=> d!132979 (validMask!0 mask!1564)))

(assert (=> d!132979 (= (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547868)))

(declare-fun b!1207449 () Bool)

(assert (=> b!1207449 (= e!685699 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207450 () Bool)

(assert (=> b!1207450 (= e!685697 call!58970)))

(assert (= (and d!132979 c!118653) b!1207449))

(assert (= (and d!132979 (not c!118653)) b!1207447))

(assert (= (and b!1207447 c!118651) b!1207439))

(assert (= (and b!1207447 (not c!118651)) b!1207450))

(assert (= (or b!1207439 b!1207450) bm!58967))

(assert (= (and d!132979 res!802818) b!1207440))

(assert (= (and b!1207440 res!802820) b!1207441))

(assert (= (and b!1207441 res!802819) b!1207444))

(assert (= (and b!1207441 c!118650) b!1207448))

(assert (= (and b!1207441 (not c!118650)) b!1207445))

(assert (= (and b!1207448 res!802817) b!1207443))

(assert (= (and b!1207445 c!118652) b!1207446))

(assert (= (and b!1207445 (not c!118652)) b!1207442))

(declare-fun b_lambda!21405 () Bool)

(assert (=> (not b_lambda!21405) (not b!1207439)))

(assert (=> b!1207439 t!39497))

(declare-fun b_and!42939 () Bool)

(assert (= b_and!42933 (and (=> t!39497 result!22117) b_and!42939)))

(declare-fun b_lambda!21407 () Bool)

(assert (=> (not b_lambda!21407) (not b!1207443)))

(assert (=> b!1207443 t!39497))

(declare-fun b_and!42941 () Bool)

(assert (= b_and!42939 (and (=> t!39497 result!22117) b_and!42941)))

(declare-fun m!1112997 () Bool)

(assert (=> b!1207446 m!1112997))

(declare-fun m!1112999 () Bool)

(assert (=> d!132979 m!1112999))

(assert (=> d!132979 m!1112791))

(declare-fun m!1113001 () Bool)

(assert (=> b!1207442 m!1113001))

(declare-fun m!1113003 () Bool)

(assert (=> b!1207440 m!1113003))

(assert (=> b!1207443 m!1112847))

(declare-fun m!1113005 () Bool)

(assert (=> b!1207443 m!1113005))

(assert (=> b!1207443 m!1113005))

(declare-fun m!1113007 () Bool)

(assert (=> b!1207443 m!1113007))

(declare-fun m!1113009 () Bool)

(assert (=> b!1207443 m!1113009))

(assert (=> b!1207443 m!1112847))

(declare-fun m!1113011 () Bool)

(assert (=> b!1207443 m!1113011))

(assert (=> b!1207443 m!1113009))

(assert (=> b!1207444 m!1113005))

(assert (=> b!1207444 m!1113005))

(declare-fun m!1113013 () Bool)

(assert (=> b!1207444 m!1113013))

(assert (=> b!1207447 m!1113005))

(assert (=> b!1207447 m!1113005))

(assert (=> b!1207447 m!1113013))

(assert (=> bm!58967 m!1112997))

(declare-fun m!1113015 () Bool)

(assert (=> b!1207439 m!1113015))

(declare-fun m!1113017 () Bool)

(assert (=> b!1207439 m!1113017))

(declare-fun m!1113019 () Bool)

(assert (=> b!1207439 m!1113019))

(assert (=> b!1207439 m!1112847))

(assert (=> b!1207439 m!1113005))

(declare-fun m!1113021 () Bool)

(assert (=> b!1207439 m!1113021))

(assert (=> b!1207439 m!1113009))

(assert (=> b!1207439 m!1112847))

(assert (=> b!1207439 m!1113011))

(assert (=> b!1207439 m!1113009))

(assert (=> b!1207439 m!1113015))

(assert (=> b!1207448 m!1113005))

(assert (=> b!1207448 m!1113005))

(declare-fun m!1113023 () Bool)

(assert (=> b!1207448 m!1113023))

(assert (=> b!1207246 d!132979))

(declare-fun b!1207451 () Bool)

(declare-fun lt!547871 () Unit!40015)

(declare-fun lt!547873 () Unit!40015)

(assert (=> b!1207451 (= lt!547871 lt!547873)))

(declare-fun lt!547872 () ListLongMap!17721)

(declare-fun lt!547870 () (_ BitVec 64))

(declare-fun lt!547874 () (_ BitVec 64))

(declare-fun lt!547876 () V!46019)

(assert (=> b!1207451 (not (contains!6935 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876)) lt!547870))))

(assert (=> b!1207451 (= lt!547873 (addStillNotContains!293 lt!547872 lt!547874 lt!547876 lt!547870))))

(assert (=> b!1207451 (= lt!547870 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207451 (= lt!547876 (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207451 (= lt!547874 (select (arr!37699 _keys!1208) from!1455))))

(declare-fun call!58971 () ListLongMap!17721)

(assert (=> b!1207451 (= lt!547872 call!58971)))

(declare-fun e!685704 () ListLongMap!17721)

(assert (=> b!1207451 (= e!685704 (+!3996 call!58971 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207452 () Bool)

(declare-fun res!802824 () Bool)

(declare-fun e!685707 () Bool)

(assert (=> b!1207452 (=> (not res!802824) (not e!685707))))

(declare-fun lt!547875 () ListLongMap!17721)

(assert (=> b!1207452 (= res!802824 (not (contains!6935 lt!547875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207453 () Bool)

(declare-fun e!685709 () Bool)

(assert (=> b!1207453 (= e!685707 e!685709)))

(declare-fun c!118654 () Bool)

(declare-fun e!685708 () Bool)

(assert (=> b!1207453 (= c!118654 e!685708)))

(declare-fun res!802823 () Bool)

(assert (=> b!1207453 (=> (not res!802823) (not e!685708))))

(assert (=> b!1207453 (= res!802823 (bvslt from!1455 (size!38235 _keys!1208)))))

(declare-fun b!1207454 () Bool)

(declare-fun e!685703 () Bool)

(assert (=> b!1207454 (= e!685703 (isEmpty!987 lt!547875))))

(declare-fun b!1207455 () Bool)

(assert (=> b!1207455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38235 _keys!1208)))))

(assert (=> b!1207455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38236 _values!996)))))

(declare-fun e!685705 () Bool)

(assert (=> b!1207455 (= e!685705 (= (apply!965 lt!547875 (select (arr!37699 _keys!1208) from!1455)) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207456 () Bool)

(assert (=> b!1207456 (= e!685708 (validKeyInArray!0 (select (arr!37699 _keys!1208) from!1455)))))

(assert (=> b!1207456 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1207457 () Bool)

(assert (=> b!1207457 (= e!685709 e!685703)))

(declare-fun c!118656 () Bool)

(assert (=> b!1207457 (= c!118656 (bvslt from!1455 (size!38235 _keys!1208)))))

(declare-fun bm!58968 () Bool)

(assert (=> bm!58968 (= call!58971 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207458 () Bool)

(assert (=> b!1207458 (= e!685703 (= lt!547875 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207459 () Bool)

(declare-fun e!685706 () ListLongMap!17721)

(assert (=> b!1207459 (= e!685706 e!685704)))

(declare-fun c!118655 () Bool)

(assert (=> b!1207459 (= c!118655 (validKeyInArray!0 (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun b!1207460 () Bool)

(assert (=> b!1207460 (= e!685709 e!685705)))

(assert (=> b!1207460 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38235 _keys!1208)))))

(declare-fun res!802821 () Bool)

(assert (=> b!1207460 (= res!802821 (contains!6935 lt!547875 (select (arr!37699 _keys!1208) from!1455)))))

(assert (=> b!1207460 (=> (not res!802821) (not e!685705))))

(declare-fun d!132981 () Bool)

(assert (=> d!132981 e!685707))

(declare-fun res!802822 () Bool)

(assert (=> d!132981 (=> (not res!802822) (not e!685707))))

(assert (=> d!132981 (= res!802822 (not (contains!6935 lt!547875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132981 (= lt!547875 e!685706)))

(declare-fun c!118657 () Bool)

(assert (=> d!132981 (= c!118657 (bvsge from!1455 (size!38235 _keys!1208)))))

(assert (=> d!132981 (validMask!0 mask!1564)))

(assert (=> d!132981 (= (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547875)))

(declare-fun b!1207461 () Bool)

(assert (=> b!1207461 (= e!685706 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207462 () Bool)

(assert (=> b!1207462 (= e!685704 call!58971)))

(assert (= (and d!132981 c!118657) b!1207461))

(assert (= (and d!132981 (not c!118657)) b!1207459))

(assert (= (and b!1207459 c!118655) b!1207451))

(assert (= (and b!1207459 (not c!118655)) b!1207462))

(assert (= (or b!1207451 b!1207462) bm!58968))

(assert (= (and d!132981 res!802822) b!1207452))

(assert (= (and b!1207452 res!802824) b!1207453))

(assert (= (and b!1207453 res!802823) b!1207456))

(assert (= (and b!1207453 c!118654) b!1207460))

(assert (= (and b!1207453 (not c!118654)) b!1207457))

(assert (= (and b!1207460 res!802821) b!1207455))

(assert (= (and b!1207457 c!118656) b!1207458))

(assert (= (and b!1207457 (not c!118656)) b!1207454))

(declare-fun b_lambda!21409 () Bool)

(assert (=> (not b_lambda!21409) (not b!1207451)))

(assert (=> b!1207451 t!39497))

(declare-fun b_and!42943 () Bool)

(assert (= b_and!42941 (and (=> t!39497 result!22117) b_and!42943)))

(declare-fun b_lambda!21411 () Bool)

(assert (=> (not b_lambda!21411) (not b!1207455)))

(assert (=> b!1207455 t!39497))

(declare-fun b_and!42945 () Bool)

(assert (= b_and!42943 (and (=> t!39497 result!22117) b_and!42945)))

(declare-fun m!1113025 () Bool)

(assert (=> b!1207458 m!1113025))

(declare-fun m!1113027 () Bool)

(assert (=> d!132981 m!1113027))

(assert (=> d!132981 m!1112791))

(declare-fun m!1113029 () Bool)

(assert (=> b!1207454 m!1113029))

(declare-fun m!1113031 () Bool)

(assert (=> b!1207452 m!1113031))

(assert (=> b!1207455 m!1112847))

(assert (=> b!1207455 m!1112805))

(assert (=> b!1207455 m!1112805))

(declare-fun m!1113033 () Bool)

(assert (=> b!1207455 m!1113033))

(declare-fun m!1113035 () Bool)

(assert (=> b!1207455 m!1113035))

(assert (=> b!1207455 m!1112847))

(declare-fun m!1113037 () Bool)

(assert (=> b!1207455 m!1113037))

(assert (=> b!1207455 m!1113035))

(assert (=> b!1207456 m!1112805))

(assert (=> b!1207456 m!1112805))

(assert (=> b!1207456 m!1112947))

(assert (=> b!1207459 m!1112805))

(assert (=> b!1207459 m!1112805))

(assert (=> b!1207459 m!1112947))

(assert (=> bm!58968 m!1113025))

(declare-fun m!1113039 () Bool)

(assert (=> b!1207451 m!1113039))

(declare-fun m!1113041 () Bool)

(assert (=> b!1207451 m!1113041))

(declare-fun m!1113043 () Bool)

(assert (=> b!1207451 m!1113043))

(assert (=> b!1207451 m!1112847))

(assert (=> b!1207451 m!1112805))

(declare-fun m!1113045 () Bool)

(assert (=> b!1207451 m!1113045))

(assert (=> b!1207451 m!1113035))

(assert (=> b!1207451 m!1112847))

(assert (=> b!1207451 m!1113037))

(assert (=> b!1207451 m!1113035))

(assert (=> b!1207451 m!1113039))

(assert (=> b!1207460 m!1112805))

(assert (=> b!1207460 m!1112805))

(declare-fun m!1113047 () Bool)

(assert (=> b!1207460 m!1113047))

(assert (=> b!1207246 d!132981))

(declare-fun b!1207463 () Bool)

(declare-fun lt!547878 () Unit!40015)

(declare-fun lt!547880 () Unit!40015)

(assert (=> b!1207463 (= lt!547878 lt!547880)))

(declare-fun lt!547877 () (_ BitVec 64))

(declare-fun lt!547881 () (_ BitVec 64))

(declare-fun lt!547879 () ListLongMap!17721)

(declare-fun lt!547883 () V!46019)

(assert (=> b!1207463 (not (contains!6935 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883)) lt!547877))))

(assert (=> b!1207463 (= lt!547880 (addStillNotContains!293 lt!547879 lt!547881 lt!547883 lt!547877))))

(assert (=> b!1207463 (= lt!547877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207463 (= lt!547883 (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207463 (= lt!547881 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58972 () ListLongMap!17721)

(assert (=> b!1207463 (= lt!547879 call!58972)))

(declare-fun e!685711 () ListLongMap!17721)

(assert (=> b!1207463 (= e!685711 (+!3996 call!58972 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207464 () Bool)

(declare-fun res!802828 () Bool)

(declare-fun e!685714 () Bool)

(assert (=> b!1207464 (=> (not res!802828) (not e!685714))))

(declare-fun lt!547882 () ListLongMap!17721)

(assert (=> b!1207464 (= res!802828 (not (contains!6935 lt!547882 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207465 () Bool)

(declare-fun e!685716 () Bool)

(assert (=> b!1207465 (= e!685714 e!685716)))

(declare-fun c!118658 () Bool)

(declare-fun e!685715 () Bool)

(assert (=> b!1207465 (= c!118658 e!685715)))

(declare-fun res!802827 () Bool)

(assert (=> b!1207465 (=> (not res!802827) (not e!685715))))

(assert (=> b!1207465 (= res!802827 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 lt!547751)))))

(declare-fun b!1207466 () Bool)

(declare-fun e!685710 () Bool)

(assert (=> b!1207466 (= e!685710 (isEmpty!987 lt!547882))))

(declare-fun b!1207467 () Bool)

(assert (=> b!1207467 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 lt!547751)))))

(assert (=> b!1207467 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38236 lt!547747)))))

(declare-fun e!685712 () Bool)

(assert (=> b!1207467 (= e!685712 (= (apply!965 lt!547882 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207468 () Bool)

(assert (=> b!1207468 (= e!685715 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207468 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1207469 () Bool)

(assert (=> b!1207469 (= e!685716 e!685710)))

(declare-fun c!118660 () Bool)

(assert (=> b!1207469 (= c!118660 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 lt!547751)))))

(declare-fun bm!58969 () Bool)

(assert (=> bm!58969 (= call!58972 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207470 () Bool)

(assert (=> b!1207470 (= e!685710 (= lt!547882 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207471 () Bool)

(declare-fun e!685713 () ListLongMap!17721)

(assert (=> b!1207471 (= e!685713 e!685711)))

(declare-fun c!118659 () Bool)

(assert (=> b!1207471 (= c!118659 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207472 () Bool)

(assert (=> b!1207472 (= e!685716 e!685712)))

(assert (=> b!1207472 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 lt!547751)))))

(declare-fun res!802825 () Bool)

(assert (=> b!1207472 (= res!802825 (contains!6935 lt!547882 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207472 (=> (not res!802825) (not e!685712))))

(declare-fun d!132983 () Bool)

(assert (=> d!132983 e!685714))

(declare-fun res!802826 () Bool)

(assert (=> d!132983 (=> (not res!802826) (not e!685714))))

(assert (=> d!132983 (= res!802826 (not (contains!6935 lt!547882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132983 (= lt!547882 e!685713)))

(declare-fun c!118661 () Bool)

(assert (=> d!132983 (= c!118661 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 lt!547751)))))

(assert (=> d!132983 (validMask!0 mask!1564)))

(assert (=> d!132983 (= (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547882)))

(declare-fun b!1207473 () Bool)

(assert (=> b!1207473 (= e!685713 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207474 () Bool)

(assert (=> b!1207474 (= e!685711 call!58972)))

(assert (= (and d!132983 c!118661) b!1207473))

(assert (= (and d!132983 (not c!118661)) b!1207471))

(assert (= (and b!1207471 c!118659) b!1207463))

(assert (= (and b!1207471 (not c!118659)) b!1207474))

(assert (= (or b!1207463 b!1207474) bm!58969))

(assert (= (and d!132983 res!802826) b!1207464))

(assert (= (and b!1207464 res!802828) b!1207465))

(assert (= (and b!1207465 res!802827) b!1207468))

(assert (= (and b!1207465 c!118658) b!1207472))

(assert (= (and b!1207465 (not c!118658)) b!1207469))

(assert (= (and b!1207472 res!802825) b!1207467))

(assert (= (and b!1207469 c!118660) b!1207470))

(assert (= (and b!1207469 (not c!118660)) b!1207466))

(declare-fun b_lambda!21413 () Bool)

(assert (=> (not b_lambda!21413) (not b!1207463)))

(assert (=> b!1207463 t!39497))

(declare-fun b_and!42947 () Bool)

(assert (= b_and!42945 (and (=> t!39497 result!22117) b_and!42947)))

(declare-fun b_lambda!21415 () Bool)

(assert (=> (not b_lambda!21415) (not b!1207467)))

(assert (=> b!1207467 t!39497))

(declare-fun b_and!42949 () Bool)

(assert (= b_and!42947 (and (=> t!39497 result!22117) b_and!42949)))

(declare-fun m!1113049 () Bool)

(assert (=> b!1207470 m!1113049))

(declare-fun m!1113051 () Bool)

(assert (=> d!132983 m!1113051))

(assert (=> d!132983 m!1112791))

(declare-fun m!1113053 () Bool)

(assert (=> b!1207466 m!1113053))

(declare-fun m!1113055 () Bool)

(assert (=> b!1207464 m!1113055))

(assert (=> b!1207467 m!1112847))

(declare-fun m!1113057 () Bool)

(assert (=> b!1207467 m!1113057))

(assert (=> b!1207467 m!1113057))

(declare-fun m!1113059 () Bool)

(assert (=> b!1207467 m!1113059))

(declare-fun m!1113061 () Bool)

(assert (=> b!1207467 m!1113061))

(assert (=> b!1207467 m!1112847))

(declare-fun m!1113063 () Bool)

(assert (=> b!1207467 m!1113063))

(assert (=> b!1207467 m!1113061))

(assert (=> b!1207468 m!1113057))

(assert (=> b!1207468 m!1113057))

(declare-fun m!1113065 () Bool)

(assert (=> b!1207468 m!1113065))

(assert (=> b!1207471 m!1113057))

(assert (=> b!1207471 m!1113057))

(assert (=> b!1207471 m!1113065))

(assert (=> bm!58969 m!1113049))

(declare-fun m!1113067 () Bool)

(assert (=> b!1207463 m!1113067))

(declare-fun m!1113069 () Bool)

(assert (=> b!1207463 m!1113069))

(declare-fun m!1113071 () Bool)

(assert (=> b!1207463 m!1113071))

(assert (=> b!1207463 m!1112847))

(assert (=> b!1207463 m!1113057))

(declare-fun m!1113073 () Bool)

(assert (=> b!1207463 m!1113073))

(assert (=> b!1207463 m!1113061))

(assert (=> b!1207463 m!1112847))

(assert (=> b!1207463 m!1113063))

(assert (=> b!1207463 m!1113061))

(assert (=> b!1207463 m!1113067))

(assert (=> b!1207472 m!1113057))

(assert (=> b!1207472 m!1113057))

(declare-fun m!1113075 () Bool)

(assert (=> b!1207472 m!1113075))

(assert (=> bm!58926 d!132983))

(declare-fun b!1207475 () Bool)

(declare-fun lt!547885 () Unit!40015)

(declare-fun lt!547887 () Unit!40015)

(assert (=> b!1207475 (= lt!547885 lt!547887)))

(declare-fun lt!547890 () V!46019)

(declare-fun lt!547888 () (_ BitVec 64))

(declare-fun lt!547886 () ListLongMap!17721)

(declare-fun lt!547884 () (_ BitVec 64))

(assert (=> b!1207475 (not (contains!6935 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890)) lt!547884))))

(assert (=> b!1207475 (= lt!547887 (addStillNotContains!293 lt!547886 lt!547888 lt!547890 lt!547884))))

(assert (=> b!1207475 (= lt!547884 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207475 (= lt!547890 (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207475 (= lt!547888 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58973 () ListLongMap!17721)

(assert (=> b!1207475 (= lt!547886 call!58973)))

(declare-fun e!685718 () ListLongMap!17721)

(assert (=> b!1207475 (= e!685718 (+!3996 call!58973 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207476 () Bool)

(declare-fun res!802832 () Bool)

(declare-fun e!685721 () Bool)

(assert (=> b!1207476 (=> (not res!802832) (not e!685721))))

(declare-fun lt!547889 () ListLongMap!17721)

(assert (=> b!1207476 (= res!802832 (not (contains!6935 lt!547889 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207477 () Bool)

(declare-fun e!685723 () Bool)

(assert (=> b!1207477 (= e!685721 e!685723)))

(declare-fun c!118662 () Bool)

(declare-fun e!685722 () Bool)

(assert (=> b!1207477 (= c!118662 e!685722)))

(declare-fun res!802831 () Bool)

(assert (=> b!1207477 (=> (not res!802831) (not e!685722))))

(assert (=> b!1207477 (= res!802831 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208)))))

(declare-fun b!1207478 () Bool)

(declare-fun e!685717 () Bool)

(assert (=> b!1207478 (= e!685717 (isEmpty!987 lt!547889))))

(declare-fun b!1207479 () Bool)

(assert (=> b!1207479 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208)))))

(assert (=> b!1207479 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38236 _values!996)))))

(declare-fun e!685719 () Bool)

(assert (=> b!1207479 (= e!685719 (= (apply!965 lt!547889 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207480 () Bool)

(assert (=> b!1207480 (= e!685722 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207480 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1207481 () Bool)

(assert (=> b!1207481 (= e!685723 e!685717)))

(declare-fun c!118664 () Bool)

(assert (=> b!1207481 (= c!118664 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208)))))

(declare-fun bm!58970 () Bool)

(assert (=> bm!58970 (= call!58973 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207482 () Bool)

(assert (=> b!1207482 (= e!685717 (= lt!547889 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207483 () Bool)

(declare-fun e!685720 () ListLongMap!17721)

(assert (=> b!1207483 (= e!685720 e!685718)))

(declare-fun c!118663 () Bool)

(assert (=> b!1207483 (= c!118663 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207484 () Bool)

(assert (=> b!1207484 (= e!685723 e!685719)))

(assert (=> b!1207484 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208)))))

(declare-fun res!802829 () Bool)

(assert (=> b!1207484 (= res!802829 (contains!6935 lt!547889 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207484 (=> (not res!802829) (not e!685719))))

(declare-fun d!132985 () Bool)

(assert (=> d!132985 e!685721))

(declare-fun res!802830 () Bool)

(assert (=> d!132985 (=> (not res!802830) (not e!685721))))

(assert (=> d!132985 (= res!802830 (not (contains!6935 lt!547889 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132985 (= lt!547889 e!685720)))

(declare-fun c!118665 () Bool)

(assert (=> d!132985 (= c!118665 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208)))))

(assert (=> d!132985 (validMask!0 mask!1564)))

(assert (=> d!132985 (= (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547889)))

(declare-fun b!1207485 () Bool)

(assert (=> b!1207485 (= e!685720 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207486 () Bool)

(assert (=> b!1207486 (= e!685718 call!58973)))

(assert (= (and d!132985 c!118665) b!1207485))

(assert (= (and d!132985 (not c!118665)) b!1207483))

(assert (= (and b!1207483 c!118663) b!1207475))

(assert (= (and b!1207483 (not c!118663)) b!1207486))

(assert (= (or b!1207475 b!1207486) bm!58970))

(assert (= (and d!132985 res!802830) b!1207476))

(assert (= (and b!1207476 res!802832) b!1207477))

(assert (= (and b!1207477 res!802831) b!1207480))

(assert (= (and b!1207477 c!118662) b!1207484))

(assert (= (and b!1207477 (not c!118662)) b!1207481))

(assert (= (and b!1207484 res!802829) b!1207479))

(assert (= (and b!1207481 c!118664) b!1207482))

(assert (= (and b!1207481 (not c!118664)) b!1207478))

(declare-fun b_lambda!21417 () Bool)

(assert (=> (not b_lambda!21417) (not b!1207475)))

(assert (=> b!1207475 t!39497))

(declare-fun b_and!42951 () Bool)

(assert (= b_and!42949 (and (=> t!39497 result!22117) b_and!42951)))

(declare-fun b_lambda!21419 () Bool)

(assert (=> (not b_lambda!21419) (not b!1207479)))

(assert (=> b!1207479 t!39497))

(declare-fun b_and!42953 () Bool)

(assert (= b_and!42951 (and (=> t!39497 result!22117) b_and!42953)))

(declare-fun m!1113077 () Bool)

(assert (=> b!1207482 m!1113077))

(declare-fun m!1113079 () Bool)

(assert (=> d!132985 m!1113079))

(assert (=> d!132985 m!1112791))

(declare-fun m!1113081 () Bool)

(assert (=> b!1207478 m!1113081))

(declare-fun m!1113083 () Bool)

(assert (=> b!1207476 m!1113083))

(assert (=> b!1207479 m!1112847))

(assert (=> b!1207479 m!1112969))

(assert (=> b!1207479 m!1112969))

(declare-fun m!1113085 () Bool)

(assert (=> b!1207479 m!1113085))

(declare-fun m!1113087 () Bool)

(assert (=> b!1207479 m!1113087))

(assert (=> b!1207479 m!1112847))

(declare-fun m!1113089 () Bool)

(assert (=> b!1207479 m!1113089))

(assert (=> b!1207479 m!1113087))

(assert (=> b!1207480 m!1112969))

(assert (=> b!1207480 m!1112969))

(declare-fun m!1113091 () Bool)

(assert (=> b!1207480 m!1113091))

(assert (=> b!1207483 m!1112969))

(assert (=> b!1207483 m!1112969))

(assert (=> b!1207483 m!1113091))

(assert (=> bm!58970 m!1113077))

(declare-fun m!1113093 () Bool)

(assert (=> b!1207475 m!1113093))

(declare-fun m!1113095 () Bool)

(assert (=> b!1207475 m!1113095))

(declare-fun m!1113097 () Bool)

(assert (=> b!1207475 m!1113097))

(assert (=> b!1207475 m!1112847))

(assert (=> b!1207475 m!1112969))

(declare-fun m!1113099 () Bool)

(assert (=> b!1207475 m!1113099))

(assert (=> b!1207475 m!1113087))

(assert (=> b!1207475 m!1112847))

(assert (=> b!1207475 m!1113089))

(assert (=> b!1207475 m!1113087))

(assert (=> b!1207475 m!1113093))

(assert (=> b!1207484 m!1112969))

(assert (=> b!1207484 m!1112969))

(declare-fun m!1113101 () Bool)

(assert (=> b!1207484 m!1113101))

(assert (=> bm!58929 d!132985))

(declare-fun b!1207487 () Bool)

(declare-fun e!685724 () Bool)

(declare-fun call!58974 () Bool)

(assert (=> b!1207487 (= e!685724 call!58974)))

(declare-fun b!1207488 () Bool)

(declare-fun e!685726 () Bool)

(declare-fun e!685725 () Bool)

(assert (=> b!1207488 (= e!685726 e!685725)))

(declare-fun c!118666 () Bool)

(assert (=> b!1207488 (= c!118666 (validKeyInArray!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207489 () Bool)

(assert (=> b!1207489 (= e!685725 e!685724)))

(declare-fun lt!547891 () (_ BitVec 64))

(assert (=> b!1207489 (= lt!547891 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!547892 () Unit!40015)

(assert (=> b!1207489 (= lt!547892 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547891 #b00000000000000000000000000000000))))

(assert (=> b!1207489 (arrayContainsKey!0 _keys!1208 lt!547891 #b00000000000000000000000000000000)))

(declare-fun lt!547893 () Unit!40015)

(assert (=> b!1207489 (= lt!547893 lt!547892)))

(declare-fun res!802833 () Bool)

(assert (=> b!1207489 (= res!802833 (= (seekEntryOrOpen!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9938 #b00000000000000000000000000000000)))))

(assert (=> b!1207489 (=> (not res!802833) (not e!685724))))

(declare-fun bm!58971 () Bool)

(assert (=> bm!58971 (= call!58974 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!132987 () Bool)

(declare-fun res!802834 () Bool)

(assert (=> d!132987 (=> res!802834 e!685726)))

(assert (=> d!132987 (= res!802834 (bvsge #b00000000000000000000000000000000 (size!38235 _keys!1208)))))

(assert (=> d!132987 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!685726)))

(declare-fun b!1207490 () Bool)

(assert (=> b!1207490 (= e!685725 call!58974)))

(assert (= (and d!132987 (not res!802834)) b!1207488))

(assert (= (and b!1207488 c!118666) b!1207489))

(assert (= (and b!1207488 (not c!118666)) b!1207490))

(assert (= (and b!1207489 res!802833) b!1207487))

(assert (= (or b!1207487 b!1207490) bm!58971))

(assert (=> b!1207488 m!1112973))

(assert (=> b!1207488 m!1112973))

(assert (=> b!1207488 m!1112975))

(assert (=> b!1207489 m!1112973))

(declare-fun m!1113103 () Bool)

(assert (=> b!1207489 m!1113103))

(declare-fun m!1113105 () Bool)

(assert (=> b!1207489 m!1113105))

(assert (=> b!1207489 m!1112973))

(declare-fun m!1113107 () Bool)

(assert (=> b!1207489 m!1113107))

(declare-fun m!1113109 () Bool)

(assert (=> bm!58971 m!1113109))

(assert (=> b!1207238 d!132987))

(declare-fun d!132989 () Bool)

(declare-fun e!685727 () Bool)

(assert (=> d!132989 e!685727))

(declare-fun res!802835 () Bool)

(assert (=> d!132989 (=> res!802835 e!685727)))

(declare-fun lt!547894 () Bool)

(assert (=> d!132989 (= res!802835 (not lt!547894))))

(declare-fun lt!547897 () Bool)

(assert (=> d!132989 (= lt!547894 lt!547897)))

(declare-fun lt!547896 () Unit!40015)

(declare-fun e!685728 () Unit!40015)

(assert (=> d!132989 (= lt!547896 e!685728)))

(declare-fun c!118667 () Bool)

(assert (=> d!132989 (= c!118667 lt!547897)))

(assert (=> d!132989 (= lt!547897 (containsKey!592 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))

(assert (=> d!132989 (= (contains!6935 (ite c!118610 lt!547744 call!58933) k0!934) lt!547894)))

(declare-fun b!1207491 () Bool)

(declare-fun lt!547895 () Unit!40015)

(assert (=> b!1207491 (= e!685728 lt!547895)))

(assert (=> b!1207491 (= lt!547895 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))

(assert (=> b!1207491 (isDefined!461 (getValueByKey!636 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))

(declare-fun b!1207492 () Bool)

(declare-fun Unit!40022 () Unit!40015)

(assert (=> b!1207492 (= e!685728 Unit!40022)))

(declare-fun b!1207493 () Bool)

(assert (=> b!1207493 (= e!685727 (isDefined!461 (getValueByKey!636 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934)))))

(assert (= (and d!132989 c!118667) b!1207491))

(assert (= (and d!132989 (not c!118667)) b!1207492))

(assert (= (and d!132989 (not res!802835)) b!1207493))

(declare-fun m!1113111 () Bool)

(assert (=> d!132989 m!1113111))

(declare-fun m!1113113 () Bool)

(assert (=> b!1207491 m!1113113))

(declare-fun m!1113115 () Bool)

(assert (=> b!1207491 m!1113115))

(assert (=> b!1207491 m!1113115))

(declare-fun m!1113117 () Bool)

(assert (=> b!1207491 m!1113117))

(assert (=> b!1207493 m!1113115))

(assert (=> b!1207493 m!1113115))

(assert (=> b!1207493 m!1113117))

(assert (=> bm!58933 d!132989))

(declare-fun d!132991 () Bool)

(declare-fun e!685729 () Bool)

(assert (=> d!132991 e!685729))

(declare-fun res!802836 () Bool)

(assert (=> d!132991 (=> res!802836 e!685729)))

(declare-fun lt!547898 () Bool)

(assert (=> d!132991 (= res!802836 (not lt!547898))))

(declare-fun lt!547901 () Bool)

(assert (=> d!132991 (= lt!547898 lt!547901)))

(declare-fun lt!547900 () Unit!40015)

(declare-fun e!685730 () Unit!40015)

(assert (=> d!132991 (= lt!547900 e!685730)))

(declare-fun c!118668 () Bool)

(assert (=> d!132991 (= c!118668 lt!547901)))

(assert (=> d!132991 (= lt!547901 (containsKey!592 (toList!8876 lt!547743) k0!934))))

(assert (=> d!132991 (= (contains!6935 lt!547743 k0!934) lt!547898)))

(declare-fun b!1207494 () Bool)

(declare-fun lt!547899 () Unit!40015)

(assert (=> b!1207494 (= e!685730 lt!547899)))

(assert (=> b!1207494 (= lt!547899 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547743) k0!934))))

(assert (=> b!1207494 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547743) k0!934))))

(declare-fun b!1207495 () Bool)

(declare-fun Unit!40023 () Unit!40015)

(assert (=> b!1207495 (= e!685730 Unit!40023)))

(declare-fun b!1207496 () Bool)

(assert (=> b!1207496 (= e!685729 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547743) k0!934)))))

(assert (= (and d!132991 c!118668) b!1207494))

(assert (= (and d!132991 (not c!118668)) b!1207495))

(assert (= (and d!132991 (not res!802836)) b!1207496))

(declare-fun m!1113119 () Bool)

(assert (=> d!132991 m!1113119))

(declare-fun m!1113121 () Bool)

(assert (=> b!1207494 m!1113121))

(declare-fun m!1113123 () Bool)

(assert (=> b!1207494 m!1113123))

(assert (=> b!1207494 m!1113123))

(declare-fun m!1113125 () Bool)

(assert (=> b!1207494 m!1113125))

(assert (=> b!1207496 m!1113123))

(assert (=> b!1207496 m!1113123))

(assert (=> b!1207496 m!1113125))

(assert (=> b!1207262 d!132991))

(assert (=> b!1207262 d!132985))

(declare-fun b!1207497 () Bool)

(declare-fun e!685732 () Bool)

(declare-fun e!685734 () Bool)

(assert (=> b!1207497 (= e!685732 e!685734)))

(declare-fun res!802839 () Bool)

(assert (=> b!1207497 (=> (not res!802839) (not e!685734))))

(declare-fun e!685731 () Bool)

(assert (=> b!1207497 (= res!802839 (not e!685731))))

(declare-fun res!802837 () Bool)

(assert (=> b!1207497 (=> (not res!802837) (not e!685731))))

(assert (=> b!1207497 (= res!802837 (validKeyInArray!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun b!1207498 () Bool)

(assert (=> b!1207498 (= e!685731 (contains!6937 Nil!26551 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun b!1207499 () Bool)

(declare-fun e!685733 () Bool)

(assert (=> b!1207499 (= e!685734 e!685733)))

(declare-fun c!118669 () Bool)

(assert (=> b!1207499 (= c!118669 (validKeyInArray!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun d!132993 () Bool)

(declare-fun res!802838 () Bool)

(assert (=> d!132993 (=> res!802838 e!685732)))

(assert (=> d!132993 (= res!802838 (bvsge #b00000000000000000000000000000000 (size!38235 lt!547751)))))

(assert (=> d!132993 (= (arrayNoDuplicates!0 lt!547751 #b00000000000000000000000000000000 Nil!26551) e!685732)))

(declare-fun b!1207500 () Bool)

(declare-fun call!58975 () Bool)

(assert (=> b!1207500 (= e!685733 call!58975)))

(declare-fun b!1207501 () Bool)

(assert (=> b!1207501 (= e!685733 call!58975)))

(declare-fun bm!58972 () Bool)

(assert (=> bm!58972 (= call!58975 (arrayNoDuplicates!0 lt!547751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118669 (Cons!26550 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) Nil!26551) Nil!26551)))))

(assert (= (and d!132993 (not res!802838)) b!1207497))

(assert (= (and b!1207497 res!802837) b!1207498))

(assert (= (and b!1207497 res!802839) b!1207499))

(assert (= (and b!1207499 c!118669) b!1207500))

(assert (= (and b!1207499 (not c!118669)) b!1207501))

(assert (= (or b!1207500 b!1207501) bm!58972))

(assert (=> b!1207497 m!1112981))

(assert (=> b!1207497 m!1112981))

(assert (=> b!1207497 m!1112983))

(assert (=> b!1207498 m!1112981))

(assert (=> b!1207498 m!1112981))

(declare-fun m!1113127 () Bool)

(assert (=> b!1207498 m!1113127))

(assert (=> b!1207499 m!1112981))

(assert (=> b!1207499 m!1112981))

(assert (=> b!1207499 m!1112983))

(assert (=> bm!58972 m!1112981))

(declare-fun m!1113129 () Bool)

(assert (=> bm!58972 m!1113129))

(assert (=> b!1207263 d!132993))

(declare-fun d!132995 () Bool)

(declare-fun res!802840 () Bool)

(declare-fun e!685735 () Bool)

(assert (=> d!132995 (=> res!802840 e!685735)))

(assert (=> d!132995 (= res!802840 (= (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132995 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!685735)))

(declare-fun b!1207502 () Bool)

(declare-fun e!685736 () Bool)

(assert (=> b!1207502 (= e!685735 e!685736)))

(declare-fun res!802841 () Bool)

(assert (=> b!1207502 (=> (not res!802841) (not e!685736))))

(assert (=> b!1207502 (= res!802841 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207503 () Bool)

(assert (=> b!1207503 (= e!685736 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132995 (not res!802840)) b!1207502))

(assert (= (and b!1207502 res!802841) b!1207503))

(assert (=> d!132995 m!1112973))

(declare-fun m!1113131 () Bool)

(assert (=> b!1207503 m!1113131))

(assert (=> b!1207258 d!132995))

(declare-fun d!132997 () Bool)

(assert (=> d!132997 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547904 () Unit!40015)

(declare-fun choose!13 (array!78119 (_ BitVec 64) (_ BitVec 32)) Unit!40015)

(assert (=> d!132997 (= lt!547904 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132997 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132997 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!547904)))

(declare-fun bs!34132 () Bool)

(assert (= bs!34132 d!132997))

(assert (=> bs!34132 m!1112825))

(declare-fun m!1113133 () Bool)

(assert (=> bs!34132 m!1113133))

(assert (=> b!1207258 d!132997))

(declare-fun d!132999 () Bool)

(assert (=> d!132999 (= (array_inv!28714 _keys!1208) (bvsge (size!38235 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100826 d!132999))

(declare-fun d!133001 () Bool)

(assert (=> d!133001 (= (array_inv!28715 _values!996) (bvsge (size!38236 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100826 d!133001))

(declare-fun d!133003 () Bool)

(assert (=> d!133003 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207240 d!133003))

(declare-fun b!1207510 () Bool)

(declare-fun e!685742 () Bool)

(declare-fun call!58981 () ListLongMap!17721)

(declare-fun call!58980 () ListLongMap!17721)

(assert (=> b!1207510 (= e!685742 (= call!58981 call!58980))))

(assert (=> b!1207510 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38236 _values!996)))))

(declare-fun bm!58977 () Bool)

(assert (=> bm!58977 (= call!58980 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207511 () Bool)

(assert (=> b!1207511 (= e!685742 (= call!58981 (-!1831 call!58980 k0!934)))))

(assert (=> b!1207511 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38236 _values!996)))))

(declare-fun b!1207512 () Bool)

(declare-fun e!685741 () Bool)

(assert (=> b!1207512 (= e!685741 e!685742)))

(declare-fun c!118672 () Bool)

(assert (=> b!1207512 (= c!118672 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133005 () Bool)

(assert (=> d!133005 e!685741))

(declare-fun res!802844 () Bool)

(assert (=> d!133005 (=> (not res!802844) (not e!685741))))

(assert (=> d!133005 (= res!802844 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38235 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38235 _keys!1208))))))))

(declare-fun lt!547907 () Unit!40015)

(declare-fun choose!1803 (array!78119 array!78121 (_ BitVec 32) (_ BitVec 32) V!46019 V!46019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40015)

(assert (=> d!133005 (= lt!547907 (choose!1803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133005 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 _keys!1208)))))

(assert (=> d!133005 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547907)))

(declare-fun bm!58978 () Bool)

(assert (=> bm!58978 (= call!58981 (getCurrentListMapNoExtraKeys!5310 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)) (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133005 res!802844) b!1207512))

(assert (= (and b!1207512 c!118672) b!1207511))

(assert (= (and b!1207512 (not c!118672)) b!1207510))

(assert (= (or b!1207511 b!1207510) bm!58977))

(assert (= (or b!1207511 b!1207510) bm!58978))

(declare-fun b_lambda!21421 () Bool)

(assert (=> (not b_lambda!21421) (not bm!58978)))

(assert (=> bm!58978 t!39497))

(declare-fun b_and!42955 () Bool)

(assert (= b_and!42953 (and (=> t!39497 result!22117) b_and!42955)))

(assert (=> bm!58977 m!1112793))

(declare-fun m!1113135 () Bool)

(assert (=> b!1207511 m!1113135))

(declare-fun m!1113137 () Bool)

(assert (=> d!133005 m!1113137))

(assert (=> bm!58978 m!1112811))

(assert (=> bm!58978 m!1112847))

(assert (=> bm!58978 m!1112849))

(declare-fun m!1113139 () Bool)

(assert (=> bm!58978 m!1113139))

(assert (=> b!1207251 d!133005))

(assert (=> b!1207241 d!132971))

(declare-fun d!133007 () Bool)

(assert (=> d!133007 (contains!6935 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!547908 () Unit!40015)

(assert (=> d!133007 (= lt!547908 (choose!1801 lt!547743 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133007 (contains!6935 lt!547743 k0!934)))

(assert (=> d!133007 (= (addStillContains!1025 lt!547743 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944) k0!934) lt!547908)))

(declare-fun bs!34133 () Bool)

(assert (= bs!34133 d!133007))

(declare-fun m!1113141 () Bool)

(assert (=> bs!34133 m!1113141))

(assert (=> bs!34133 m!1113141))

(declare-fun m!1113143 () Bool)

(assert (=> bs!34133 m!1113143))

(declare-fun m!1113145 () Bool)

(assert (=> bs!34133 m!1113145))

(assert (=> bs!34133 m!1112823))

(assert (=> bm!58931 d!133007))

(declare-fun mapNonEmpty!47868 () Bool)

(declare-fun mapRes!47868 () Bool)

(declare-fun tp!90910 () Bool)

(declare-fun e!685747 () Bool)

(assert (=> mapNonEmpty!47868 (= mapRes!47868 (and tp!90910 e!685747))))

(declare-fun mapKey!47868 () (_ BitVec 32))

(declare-fun mapRest!47868 () (Array (_ BitVec 32) ValueCell!14625))

(declare-fun mapValue!47868 () ValueCell!14625)

(assert (=> mapNonEmpty!47868 (= mapRest!47862 (store mapRest!47868 mapKey!47868 mapValue!47868))))

(declare-fun b!1207520 () Bool)

(declare-fun e!685748 () Bool)

(assert (=> b!1207520 (= e!685748 tp_is_empty!30669)))

(declare-fun b!1207519 () Bool)

(assert (=> b!1207519 (= e!685747 tp_is_empty!30669)))

(declare-fun mapIsEmpty!47868 () Bool)

(assert (=> mapIsEmpty!47868 mapRes!47868))

(declare-fun condMapEmpty!47868 () Bool)

(declare-fun mapDefault!47868 () ValueCell!14625)

(assert (=> mapNonEmpty!47862 (= condMapEmpty!47868 (= mapRest!47862 ((as const (Array (_ BitVec 32) ValueCell!14625)) mapDefault!47868)))))

(assert (=> mapNonEmpty!47862 (= tp!90901 (and e!685748 mapRes!47868))))

(assert (= (and mapNonEmpty!47862 condMapEmpty!47868) mapIsEmpty!47868))

(assert (= (and mapNonEmpty!47862 (not condMapEmpty!47868)) mapNonEmpty!47868))

(assert (= (and mapNonEmpty!47868 ((_ is ValueCellFull!14625) mapValue!47868)) b!1207519))

(assert (= (and mapNonEmpty!47862 ((_ is ValueCellFull!14625) mapDefault!47868)) b!1207520))

(declare-fun m!1113147 () Bool)

(assert (=> mapNonEmpty!47868 m!1113147))

(declare-fun b_lambda!21423 () Bool)

(assert (= b_lambda!21411 (or (and start!100826 b_free!25965) b_lambda!21423)))

(declare-fun b_lambda!21425 () Bool)

(assert (= b_lambda!21413 (or (and start!100826 b_free!25965) b_lambda!21425)))

(declare-fun b_lambda!21427 () Bool)

(assert (= b_lambda!21417 (or (and start!100826 b_free!25965) b_lambda!21427)))

(declare-fun b_lambda!21429 () Bool)

(assert (= b_lambda!21415 (or (and start!100826 b_free!25965) b_lambda!21429)))

(declare-fun b_lambda!21431 () Bool)

(assert (= b_lambda!21409 (or (and start!100826 b_free!25965) b_lambda!21431)))

(declare-fun b_lambda!21433 () Bool)

(assert (= b_lambda!21421 (or (and start!100826 b_free!25965) b_lambda!21433)))

(declare-fun b_lambda!21435 () Bool)

(assert (= b_lambda!21405 (or (and start!100826 b_free!25965) b_lambda!21435)))

(declare-fun b_lambda!21437 () Bool)

(assert (= b_lambda!21407 (or (and start!100826 b_free!25965) b_lambda!21437)))

(declare-fun b_lambda!21439 () Bool)

(assert (= b_lambda!21419 (or (and start!100826 b_free!25965) b_lambda!21439)))

(check-sat (not bm!58971) (not b!1207447) (not b!1207446) (not b_lambda!21423) (not mapNonEmpty!47868) (not b!1207443) (not d!132983) (not b!1207448) (not d!132981) (not b!1207479) (not b!1207475) (not b!1207360) (not bm!58961) (not bm!58960) (not d!132977) (not b!1207471) (not b!1207452) (not b!1207442) (not b!1207455) (not d!133005) (not b!1207413) (not b!1207454) (not bm!58969) b_and!42955 (not b!1207503) (not b!1207459) (not d!132979) (not b_lambda!21439) (not b!1207484) (not b_lambda!21429) (not b!1207412) (not b!1207463) (not b!1207451) (not b!1207478) (not b!1207379) (not b!1207391) (not b!1207491) (not b!1207476) (not b!1207368) (not b!1207482) (not b_lambda!21435) (not b!1207467) (not b_lambda!21433) (not bm!58978) (not b!1207388) (not d!132969) tp_is_empty!30669 (not d!133007) (not b!1207489) (not b!1207466) (not b!1207483) (not bm!58970) (not b!1207400) (not d!132965) (not b!1207488) (not b!1207439) (not b!1207493) (not d!132991) (not b_lambda!21437) (not d!132985) (not b_next!25965) (not b_lambda!21427) (not bm!58967) (not bm!58972) (not b!1207496) (not b!1207440) (not b!1207494) (not b!1207399) (not b!1207511) (not b!1207464) (not b!1207397) (not d!132997) (not b!1207381) (not b!1207468) (not b_lambda!21403) (not b!1207458) (not d!132955) (not b!1207470) (not d!132957) (not b!1207499) (not b!1207398) (not b!1207456) (not b!1207460) (not b!1207480) (not b!1207472) (not d!132959) (not b!1207444) (not b!1207362) (not b!1207380) (not b_lambda!21425) (not d!132967) (not b!1207390) (not bm!58964) (not b_lambda!21431) (not bm!58977) (not bm!58968) (not b!1207367) (not b!1207497) (not b!1207498) (not d!132989))
(check-sat b_and!42955 (not b_next!25965))
(get-model)

(declare-fun b!1207521 () Bool)

(declare-fun lt!547910 () Unit!40015)

(declare-fun lt!547912 () Unit!40015)

(assert (=> b!1207521 (= lt!547910 lt!547912)))

(declare-fun lt!547909 () (_ BitVec 64))

(declare-fun lt!547913 () (_ BitVec 64))

(declare-fun lt!547915 () V!46019)

(declare-fun lt!547911 () ListLongMap!17721)

(assert (=> b!1207521 (not (contains!6935 (+!3996 lt!547911 (tuple2!19753 lt!547913 lt!547915)) lt!547909))))

(assert (=> b!1207521 (= lt!547912 (addStillNotContains!293 lt!547911 lt!547913 lt!547915 lt!547909))))

(assert (=> b!1207521 (= lt!547909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207521 (= lt!547915 (get!19210 (select (arr!37700 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207521 (= lt!547913 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58982 () ListLongMap!17721)

(assert (=> b!1207521 (= lt!547911 call!58982)))

(declare-fun e!685750 () ListLongMap!17721)

(assert (=> b!1207521 (= e!685750 (+!3996 call!58982 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19210 (select (arr!37700 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207522 () Bool)

(declare-fun res!802848 () Bool)

(declare-fun e!685753 () Bool)

(assert (=> b!1207522 (=> (not res!802848) (not e!685753))))

(declare-fun lt!547914 () ListLongMap!17721)

(assert (=> b!1207522 (= res!802848 (not (contains!6935 lt!547914 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207523 () Bool)

(declare-fun e!685755 () Bool)

(assert (=> b!1207523 (= e!685753 e!685755)))

(declare-fun c!118673 () Bool)

(declare-fun e!685754 () Bool)

(assert (=> b!1207523 (= c!118673 e!685754)))

(declare-fun res!802847 () Bool)

(assert (=> b!1207523 (=> (not res!802847) (not e!685754))))

(assert (=> b!1207523 (= res!802847 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207524 () Bool)

(declare-fun e!685749 () Bool)

(assert (=> b!1207524 (= e!685749 (isEmpty!987 lt!547914))))

(declare-fun b!1207525 () Bool)

(assert (=> b!1207525 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> b!1207525 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38236 _values!996)))))

(declare-fun e!685751 () Bool)

(assert (=> b!1207525 (= e!685751 (= (apply!965 lt!547914 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19210 (select (arr!37700 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207526 () Bool)

(assert (=> b!1207526 (= e!685754 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207526 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207527 () Bool)

(assert (=> b!1207527 (= e!685755 e!685749)))

(declare-fun c!118675 () Bool)

(assert (=> b!1207527 (= c!118675 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun bm!58979 () Bool)

(assert (=> bm!58979 (= call!58982 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207528 () Bool)

(assert (=> b!1207528 (= e!685749 (= lt!547914 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207529 () Bool)

(declare-fun e!685752 () ListLongMap!17721)

(assert (=> b!1207529 (= e!685752 e!685750)))

(declare-fun c!118674 () Bool)

(assert (=> b!1207529 (= c!118674 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207530 () Bool)

(assert (=> b!1207530 (= e!685755 e!685751)))

(assert (=> b!1207530 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun res!802845 () Bool)

(assert (=> b!1207530 (= res!802845 (contains!6935 lt!547914 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207530 (=> (not res!802845) (not e!685751))))

(declare-fun d!133009 () Bool)

(assert (=> d!133009 e!685753))

(declare-fun res!802846 () Bool)

(assert (=> d!133009 (=> (not res!802846) (not e!685753))))

(assert (=> d!133009 (= res!802846 (not (contains!6935 lt!547914 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133009 (= lt!547914 e!685752)))

(declare-fun c!118676 () Bool)

(assert (=> d!133009 (= c!118676 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> d!133009 (validMask!0 mask!1564)))

(assert (=> d!133009 (= (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547914)))

(declare-fun b!1207531 () Bool)

(assert (=> b!1207531 (= e!685752 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207532 () Bool)

(assert (=> b!1207532 (= e!685750 call!58982)))

(assert (= (and d!133009 c!118676) b!1207531))

(assert (= (and d!133009 (not c!118676)) b!1207529))

(assert (= (and b!1207529 c!118674) b!1207521))

(assert (= (and b!1207529 (not c!118674)) b!1207532))

(assert (= (or b!1207521 b!1207532) bm!58979))

(assert (= (and d!133009 res!802846) b!1207522))

(assert (= (and b!1207522 res!802848) b!1207523))

(assert (= (and b!1207523 res!802847) b!1207526))

(assert (= (and b!1207523 c!118673) b!1207530))

(assert (= (and b!1207523 (not c!118673)) b!1207527))

(assert (= (and b!1207530 res!802845) b!1207525))

(assert (= (and b!1207527 c!118675) b!1207528))

(assert (= (and b!1207527 (not c!118675)) b!1207524))

(declare-fun b_lambda!21441 () Bool)

(assert (=> (not b_lambda!21441) (not b!1207521)))

(assert (=> b!1207521 t!39497))

(declare-fun b_and!42957 () Bool)

(assert (= b_and!42955 (and (=> t!39497 result!22117) b_and!42957)))

(declare-fun b_lambda!21443 () Bool)

(assert (=> (not b_lambda!21443) (not b!1207525)))

(assert (=> b!1207525 t!39497))

(declare-fun b_and!42959 () Bool)

(assert (= b_and!42957 (and (=> t!39497 result!22117) b_and!42959)))

(declare-fun m!1113149 () Bool)

(assert (=> b!1207528 m!1113149))

(declare-fun m!1113151 () Bool)

(assert (=> d!133009 m!1113151))

(assert (=> d!133009 m!1112791))

(declare-fun m!1113153 () Bool)

(assert (=> b!1207524 m!1113153))

(declare-fun m!1113155 () Bool)

(assert (=> b!1207522 m!1113155))

(assert (=> b!1207525 m!1112847))

(declare-fun m!1113157 () Bool)

(assert (=> b!1207525 m!1113157))

(assert (=> b!1207525 m!1113157))

(declare-fun m!1113159 () Bool)

(assert (=> b!1207525 m!1113159))

(declare-fun m!1113161 () Bool)

(assert (=> b!1207525 m!1113161))

(assert (=> b!1207525 m!1112847))

(declare-fun m!1113163 () Bool)

(assert (=> b!1207525 m!1113163))

(assert (=> b!1207525 m!1113161))

(assert (=> b!1207526 m!1113157))

(assert (=> b!1207526 m!1113157))

(declare-fun m!1113165 () Bool)

(assert (=> b!1207526 m!1113165))

(assert (=> b!1207529 m!1113157))

(assert (=> b!1207529 m!1113157))

(assert (=> b!1207529 m!1113165))

(assert (=> bm!58979 m!1113149))

(declare-fun m!1113167 () Bool)

(assert (=> b!1207521 m!1113167))

(declare-fun m!1113169 () Bool)

(assert (=> b!1207521 m!1113169))

(declare-fun m!1113171 () Bool)

(assert (=> b!1207521 m!1113171))

(assert (=> b!1207521 m!1112847))

(assert (=> b!1207521 m!1113157))

(declare-fun m!1113173 () Bool)

(assert (=> b!1207521 m!1113173))

(assert (=> b!1207521 m!1113161))

(assert (=> b!1207521 m!1112847))

(assert (=> b!1207521 m!1113163))

(assert (=> b!1207521 m!1113161))

(assert (=> b!1207521 m!1113167))

(assert (=> b!1207530 m!1113157))

(assert (=> b!1207530 m!1113157))

(declare-fun m!1113175 () Bool)

(assert (=> b!1207530 m!1113175))

(assert (=> bm!58968 d!133009))

(declare-fun d!133011 () Bool)

(declare-fun c!118679 () Bool)

(assert (=> d!133011 (= c!118679 ((_ is ValueCellFull!14625) (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!685758 () V!46019)

(assert (=> d!133011 (= (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685758)))

(declare-fun b!1207537 () Bool)

(declare-fun get!19211 (ValueCell!14625 V!46019) V!46019)

(assert (=> b!1207537 (= e!685758 (get!19211 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207538 () Bool)

(declare-fun get!19212 (ValueCell!14625 V!46019) V!46019)

(assert (=> b!1207538 (= e!685758 (get!19212 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133011 c!118679) b!1207537))

(assert (= (and d!133011 (not c!118679)) b!1207538))

(assert (=> b!1207537 m!1113061))

(assert (=> b!1207537 m!1112847))

(declare-fun m!1113177 () Bool)

(assert (=> b!1207537 m!1113177))

(assert (=> b!1207538 m!1113061))

(assert (=> b!1207538 m!1112847))

(declare-fun m!1113179 () Bool)

(assert (=> b!1207538 m!1113179))

(assert (=> b!1207463 d!133011))

(declare-fun d!133013 () Bool)

(declare-fun e!685759 () Bool)

(assert (=> d!133013 e!685759))

(declare-fun res!802849 () Bool)

(assert (=> d!133013 (=> (not res!802849) (not e!685759))))

(declare-fun lt!547917 () ListLongMap!17721)

(assert (=> d!133013 (= res!802849 (contains!6935 lt!547917 (_1!9887 (tuple2!19753 lt!547881 lt!547883))))))

(declare-fun lt!547916 () List!26553)

(assert (=> d!133013 (= lt!547917 (ListLongMap!17722 lt!547916))))

(declare-fun lt!547919 () Unit!40015)

(declare-fun lt!547918 () Unit!40015)

(assert (=> d!133013 (= lt!547919 lt!547918)))

(assert (=> d!133013 (= (getValueByKey!636 lt!547916 (_1!9887 (tuple2!19753 lt!547881 lt!547883))) (Some!686 (_2!9887 (tuple2!19753 lt!547881 lt!547883))))))

(assert (=> d!133013 (= lt!547918 (lemmaContainsTupThenGetReturnValue!313 lt!547916 (_1!9887 (tuple2!19753 lt!547881 lt!547883)) (_2!9887 (tuple2!19753 lt!547881 lt!547883))))))

(assert (=> d!133013 (= lt!547916 (insertStrictlySorted!406 (toList!8876 lt!547879) (_1!9887 (tuple2!19753 lt!547881 lt!547883)) (_2!9887 (tuple2!19753 lt!547881 lt!547883))))))

(assert (=> d!133013 (= (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883)) lt!547917)))

(declare-fun b!1207539 () Bool)

(declare-fun res!802850 () Bool)

(assert (=> b!1207539 (=> (not res!802850) (not e!685759))))

(assert (=> b!1207539 (= res!802850 (= (getValueByKey!636 (toList!8876 lt!547917) (_1!9887 (tuple2!19753 lt!547881 lt!547883))) (Some!686 (_2!9887 (tuple2!19753 lt!547881 lt!547883)))))))

(declare-fun b!1207540 () Bool)

(assert (=> b!1207540 (= e!685759 (contains!6936 (toList!8876 lt!547917) (tuple2!19753 lt!547881 lt!547883)))))

(assert (= (and d!133013 res!802849) b!1207539))

(assert (= (and b!1207539 res!802850) b!1207540))

(declare-fun m!1113181 () Bool)

(assert (=> d!133013 m!1113181))

(declare-fun m!1113183 () Bool)

(assert (=> d!133013 m!1113183))

(declare-fun m!1113185 () Bool)

(assert (=> d!133013 m!1113185))

(declare-fun m!1113187 () Bool)

(assert (=> d!133013 m!1113187))

(declare-fun m!1113189 () Bool)

(assert (=> b!1207539 m!1113189))

(declare-fun m!1113191 () Bool)

(assert (=> b!1207540 m!1113191))

(assert (=> b!1207463 d!133013))

(declare-fun d!133015 () Bool)

(assert (=> d!133015 (not (contains!6935 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883)) lt!547877))))

(declare-fun lt!547922 () Unit!40015)

(declare-fun choose!1804 (ListLongMap!17721 (_ BitVec 64) V!46019 (_ BitVec 64)) Unit!40015)

(assert (=> d!133015 (= lt!547922 (choose!1804 lt!547879 lt!547881 lt!547883 lt!547877))))

(declare-fun e!685762 () Bool)

(assert (=> d!133015 e!685762))

(declare-fun res!802853 () Bool)

(assert (=> d!133015 (=> (not res!802853) (not e!685762))))

(assert (=> d!133015 (= res!802853 (not (contains!6935 lt!547879 lt!547877)))))

(assert (=> d!133015 (= (addStillNotContains!293 lt!547879 lt!547881 lt!547883 lt!547877) lt!547922)))

(declare-fun b!1207544 () Bool)

(assert (=> b!1207544 (= e!685762 (not (= lt!547881 lt!547877)))))

(assert (= (and d!133015 res!802853) b!1207544))

(assert (=> d!133015 m!1113067))

(assert (=> d!133015 m!1113067))

(assert (=> d!133015 m!1113069))

(declare-fun m!1113193 () Bool)

(assert (=> d!133015 m!1113193))

(declare-fun m!1113195 () Bool)

(assert (=> d!133015 m!1113195))

(assert (=> b!1207463 d!133015))

(declare-fun d!133017 () Bool)

(declare-fun e!685763 () Bool)

(assert (=> d!133017 e!685763))

(declare-fun res!802854 () Bool)

(assert (=> d!133017 (=> (not res!802854) (not e!685763))))

(declare-fun lt!547924 () ListLongMap!17721)

(assert (=> d!133017 (= res!802854 (contains!6935 lt!547924 (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!547923 () List!26553)

(assert (=> d!133017 (= lt!547924 (ListLongMap!17722 lt!547923))))

(declare-fun lt!547926 () Unit!40015)

(declare-fun lt!547925 () Unit!40015)

(assert (=> d!133017 (= lt!547926 lt!547925)))

(assert (=> d!133017 (= (getValueByKey!636 lt!547923 (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133017 (= lt!547925 (lemmaContainsTupThenGetReturnValue!313 lt!547923 (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133017 (= lt!547923 (insertStrictlySorted!406 (toList!8876 call!58972) (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133017 (= (+!3996 call!58972 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!547924)))

(declare-fun b!1207545 () Bool)

(declare-fun res!802855 () Bool)

(assert (=> b!1207545 (=> (not res!802855) (not e!685763))))

(assert (=> b!1207545 (= res!802855 (= (getValueByKey!636 (toList!8876 lt!547924) (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207546 () Bool)

(assert (=> b!1207546 (= e!685763 (contains!6936 (toList!8876 lt!547924) (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133017 res!802854) b!1207545))

(assert (= (and b!1207545 res!802855) b!1207546))

(declare-fun m!1113197 () Bool)

(assert (=> d!133017 m!1113197))

(declare-fun m!1113199 () Bool)

(assert (=> d!133017 m!1113199))

(declare-fun m!1113201 () Bool)

(assert (=> d!133017 m!1113201))

(declare-fun m!1113203 () Bool)

(assert (=> d!133017 m!1113203))

(declare-fun m!1113205 () Bool)

(assert (=> b!1207545 m!1113205))

(declare-fun m!1113207 () Bool)

(assert (=> b!1207546 m!1113207))

(assert (=> b!1207463 d!133017))

(declare-fun d!133019 () Bool)

(declare-fun e!685764 () Bool)

(assert (=> d!133019 e!685764))

(declare-fun res!802856 () Bool)

(assert (=> d!133019 (=> res!802856 e!685764)))

(declare-fun lt!547927 () Bool)

(assert (=> d!133019 (= res!802856 (not lt!547927))))

(declare-fun lt!547930 () Bool)

(assert (=> d!133019 (= lt!547927 lt!547930)))

(declare-fun lt!547929 () Unit!40015)

(declare-fun e!685765 () Unit!40015)

(assert (=> d!133019 (= lt!547929 e!685765)))

(declare-fun c!118680 () Bool)

(assert (=> d!133019 (= c!118680 lt!547930)))

(assert (=> d!133019 (= lt!547930 (containsKey!592 (toList!8876 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883))) lt!547877))))

(assert (=> d!133019 (= (contains!6935 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883)) lt!547877) lt!547927)))

(declare-fun b!1207547 () Bool)

(declare-fun lt!547928 () Unit!40015)

(assert (=> b!1207547 (= e!685765 lt!547928)))

(assert (=> b!1207547 (= lt!547928 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883))) lt!547877))))

(assert (=> b!1207547 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883))) lt!547877))))

(declare-fun b!1207548 () Bool)

(declare-fun Unit!40024 () Unit!40015)

(assert (=> b!1207548 (= e!685765 Unit!40024)))

(declare-fun b!1207549 () Bool)

(assert (=> b!1207549 (= e!685764 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547879 (tuple2!19753 lt!547881 lt!547883))) lt!547877)))))

(assert (= (and d!133019 c!118680) b!1207547))

(assert (= (and d!133019 (not c!118680)) b!1207548))

(assert (= (and d!133019 (not res!802856)) b!1207549))

(declare-fun m!1113209 () Bool)

(assert (=> d!133019 m!1113209))

(declare-fun m!1113211 () Bool)

(assert (=> b!1207547 m!1113211))

(declare-fun m!1113213 () Bool)

(assert (=> b!1207547 m!1113213))

(assert (=> b!1207547 m!1113213))

(declare-fun m!1113215 () Bool)

(assert (=> b!1207547 m!1113215))

(assert (=> b!1207549 m!1113213))

(assert (=> b!1207549 m!1113213))

(assert (=> b!1207549 m!1113215))

(assert (=> b!1207463 d!133019))

(declare-fun d!133021 () Bool)

(assert (=> d!133021 (= (validKeyInArray!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207400 d!133021))

(assert (=> d!132965 d!132963))

(declare-fun d!133023 () Bool)

(assert (=> d!133023 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26551)))

(assert (=> d!133023 true))

(declare-fun _$71!186 () Unit!40015)

(assert (=> d!133023 (= (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455) _$71!186)))

(declare-fun bs!34134 () Bool)

(assert (= bs!34134 d!133023))

(assert (=> bs!34134 m!1112835))

(assert (=> d!132965 d!133023))

(declare-fun d!133025 () Bool)

(declare-fun e!685766 () Bool)

(assert (=> d!133025 e!685766))

(declare-fun res!802857 () Bool)

(assert (=> d!133025 (=> res!802857 e!685766)))

(declare-fun lt!547931 () Bool)

(assert (=> d!133025 (= res!802857 (not lt!547931))))

(declare-fun lt!547934 () Bool)

(assert (=> d!133025 (= lt!547931 lt!547934)))

(declare-fun lt!547933 () Unit!40015)

(declare-fun e!685767 () Unit!40015)

(assert (=> d!133025 (= lt!547933 e!685767)))

(declare-fun c!118681 () Bool)

(assert (=> d!133025 (= c!118681 lt!547934)))

(assert (=> d!133025 (= lt!547934 (containsKey!592 (toList!8876 lt!547889) (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!133025 (= (contains!6935 lt!547889 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!547931)))

(declare-fun b!1207550 () Bool)

(declare-fun lt!547932 () Unit!40015)

(assert (=> b!1207550 (= e!685767 lt!547932)))

(assert (=> b!1207550 (= lt!547932 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547889) (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207550 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547889) (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207551 () Bool)

(declare-fun Unit!40025 () Unit!40015)

(assert (=> b!1207551 (= e!685767 Unit!40025)))

(declare-fun b!1207552 () Bool)

(assert (=> b!1207552 (= e!685766 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547889) (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!133025 c!118681) b!1207550))

(assert (= (and d!133025 (not c!118681)) b!1207551))

(assert (= (and d!133025 (not res!802857)) b!1207552))

(assert (=> d!133025 m!1112969))

(declare-fun m!1113217 () Bool)

(assert (=> d!133025 m!1113217))

(assert (=> b!1207550 m!1112969))

(declare-fun m!1113219 () Bool)

(assert (=> b!1207550 m!1113219))

(assert (=> b!1207550 m!1112969))

(declare-fun m!1113221 () Bool)

(assert (=> b!1207550 m!1113221))

(assert (=> b!1207550 m!1113221))

(declare-fun m!1113223 () Bool)

(assert (=> b!1207550 m!1113223))

(assert (=> b!1207552 m!1112969))

(assert (=> b!1207552 m!1113221))

(assert (=> b!1207552 m!1113221))

(assert (=> b!1207552 m!1113223))

(assert (=> b!1207484 d!133025))

(declare-fun d!133027 () Bool)

(assert (=> d!133027 (= (validKeyInArray!0 (select (arr!37699 _keys!1208) from!1455)) (and (not (= (select (arr!37699 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37699 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207456 d!133027))

(declare-fun d!133029 () Bool)

(declare-fun res!802862 () Bool)

(declare-fun e!685772 () Bool)

(assert (=> d!133029 (=> res!802862 e!685772)))

(assert (=> d!133029 (= res!802862 (and ((_ is Cons!26549) (toList!8876 lt!547743)) (= (_1!9887 (h!27758 (toList!8876 lt!547743))) k0!934)))))

(assert (=> d!133029 (= (containsKey!592 (toList!8876 lt!547743) k0!934) e!685772)))

(declare-fun b!1207557 () Bool)

(declare-fun e!685773 () Bool)

(assert (=> b!1207557 (= e!685772 e!685773)))

(declare-fun res!802863 () Bool)

(assert (=> b!1207557 (=> (not res!802863) (not e!685773))))

(assert (=> b!1207557 (= res!802863 (and (or (not ((_ is Cons!26549) (toList!8876 lt!547743))) (bvsle (_1!9887 (h!27758 (toList!8876 lt!547743))) k0!934)) ((_ is Cons!26549) (toList!8876 lt!547743)) (bvslt (_1!9887 (h!27758 (toList!8876 lt!547743))) k0!934)))))

(declare-fun b!1207558 () Bool)

(assert (=> b!1207558 (= e!685773 (containsKey!592 (t!39498 (toList!8876 lt!547743)) k0!934))))

(assert (= (and d!133029 (not res!802862)) b!1207557))

(assert (= (and b!1207557 res!802863) b!1207558))

(declare-fun m!1113225 () Bool)

(assert (=> b!1207558 m!1113225))

(assert (=> d!132991 d!133029))

(declare-fun d!133031 () Bool)

(declare-fun lt!547935 () ListLongMap!17721)

(assert (=> d!133031 (not (contains!6935 lt!547935 k0!934))))

(assert (=> d!133031 (= lt!547935 (ListLongMap!17722 (removeStrictlySorted!98 (toList!8876 call!58980) k0!934)))))

(assert (=> d!133031 (= (-!1831 call!58980 k0!934) lt!547935)))

(declare-fun bs!34135 () Bool)

(assert (= bs!34135 d!133031))

(declare-fun m!1113227 () Bool)

(assert (=> bs!34135 m!1113227))

(declare-fun m!1113229 () Bool)

(assert (=> bs!34135 m!1113229))

(assert (=> b!1207511 d!133031))

(assert (=> b!1207398 d!133021))

(declare-fun d!133033 () Bool)

(declare-fun res!802864 () Bool)

(declare-fun e!685774 () Bool)

(assert (=> d!133033 (=> res!802864 e!685774)))

(assert (=> d!133033 (= res!802864 (and ((_ is Cons!26549) (toList!8876 (ite c!118610 lt!547744 call!58933))) (= (_1!9887 (h!27758 (toList!8876 (ite c!118610 lt!547744 call!58933)))) k0!934)))))

(assert (=> d!133033 (= (containsKey!592 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934) e!685774)))

(declare-fun b!1207559 () Bool)

(declare-fun e!685775 () Bool)

(assert (=> b!1207559 (= e!685774 e!685775)))

(declare-fun res!802865 () Bool)

(assert (=> b!1207559 (=> (not res!802865) (not e!685775))))

(assert (=> b!1207559 (= res!802865 (and (or (not ((_ is Cons!26549) (toList!8876 (ite c!118610 lt!547744 call!58933)))) (bvsle (_1!9887 (h!27758 (toList!8876 (ite c!118610 lt!547744 call!58933)))) k0!934)) ((_ is Cons!26549) (toList!8876 (ite c!118610 lt!547744 call!58933))) (bvslt (_1!9887 (h!27758 (toList!8876 (ite c!118610 lt!547744 call!58933)))) k0!934)))))

(declare-fun b!1207560 () Bool)

(assert (=> b!1207560 (= e!685775 (containsKey!592 (t!39498 (toList!8876 (ite c!118610 lt!547744 call!58933))) k0!934))))

(assert (= (and d!133033 (not res!802864)) b!1207559))

(assert (= (and b!1207559 res!802865) b!1207560))

(declare-fun m!1113231 () Bool)

(assert (=> b!1207560 m!1113231))

(assert (=> d!132989 d!133033))

(declare-fun b!1207561 () Bool)

(declare-fun lt!547937 () Unit!40015)

(declare-fun lt!547939 () Unit!40015)

(assert (=> b!1207561 (= lt!547937 lt!547939)))

(declare-fun lt!547942 () V!46019)

(declare-fun lt!547940 () (_ BitVec 64))

(declare-fun lt!547936 () (_ BitVec 64))

(declare-fun lt!547938 () ListLongMap!17721)

(assert (=> b!1207561 (not (contains!6935 (+!3996 lt!547938 (tuple2!19753 lt!547940 lt!547942)) lt!547936))))

(assert (=> b!1207561 (= lt!547939 (addStillNotContains!293 lt!547938 lt!547940 lt!547942 lt!547936))))

(assert (=> b!1207561 (= lt!547936 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207561 (= lt!547942 (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207561 (= lt!547940 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58983 () ListLongMap!17721)

(assert (=> b!1207561 (= lt!547938 call!58983)))

(declare-fun e!685777 () ListLongMap!17721)

(assert (=> b!1207561 (= e!685777 (+!3996 call!58983 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207562 () Bool)

(declare-fun res!802869 () Bool)

(declare-fun e!685780 () Bool)

(assert (=> b!1207562 (=> (not res!802869) (not e!685780))))

(declare-fun lt!547941 () ListLongMap!17721)

(assert (=> b!1207562 (= res!802869 (not (contains!6935 lt!547941 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207563 () Bool)

(declare-fun e!685782 () Bool)

(assert (=> b!1207563 (= e!685780 e!685782)))

(declare-fun c!118682 () Bool)

(declare-fun e!685781 () Bool)

(assert (=> b!1207563 (= c!118682 e!685781)))

(declare-fun res!802868 () Bool)

(assert (=> b!1207563 (=> (not res!802868) (not e!685781))))

(assert (=> b!1207563 (= res!802868 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207564 () Bool)

(declare-fun e!685776 () Bool)

(assert (=> b!1207564 (= e!685776 (isEmpty!987 lt!547941))))

(declare-fun b!1207565 () Bool)

(assert (=> b!1207565 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> b!1207565 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38236 _values!996)))))

(declare-fun e!685778 () Bool)

(assert (=> b!1207565 (= e!685778 (= (apply!965 lt!547941 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207566 () Bool)

(assert (=> b!1207566 (= e!685781 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207566 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207567 () Bool)

(assert (=> b!1207567 (= e!685782 e!685776)))

(declare-fun c!118684 () Bool)

(assert (=> b!1207567 (= c!118684 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun bm!58980 () Bool)

(assert (=> bm!58980 (= call!58983 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207568 () Bool)

(assert (=> b!1207568 (= e!685776 (= lt!547941 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207569 () Bool)

(declare-fun e!685779 () ListLongMap!17721)

(assert (=> b!1207569 (= e!685779 e!685777)))

(declare-fun c!118683 () Bool)

(assert (=> b!1207569 (= c!118683 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207570 () Bool)

(assert (=> b!1207570 (= e!685782 e!685778)))

(assert (=> b!1207570 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun res!802866 () Bool)

(assert (=> b!1207570 (= res!802866 (contains!6935 lt!547941 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207570 (=> (not res!802866) (not e!685778))))

(declare-fun d!133035 () Bool)

(assert (=> d!133035 e!685780))

(declare-fun res!802867 () Bool)

(assert (=> d!133035 (=> (not res!802867) (not e!685780))))

(assert (=> d!133035 (= res!802867 (not (contains!6935 lt!547941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133035 (= lt!547941 e!685779)))

(declare-fun c!118685 () Bool)

(assert (=> d!133035 (= c!118685 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> d!133035 (validMask!0 mask!1564)))

(assert (=> d!133035 (= (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547941)))

(declare-fun b!1207571 () Bool)

(assert (=> b!1207571 (= e!685779 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207572 () Bool)

(assert (=> b!1207572 (= e!685777 call!58983)))

(assert (= (and d!133035 c!118685) b!1207571))

(assert (= (and d!133035 (not c!118685)) b!1207569))

(assert (= (and b!1207569 c!118683) b!1207561))

(assert (= (and b!1207569 (not c!118683)) b!1207572))

(assert (= (or b!1207561 b!1207572) bm!58980))

(assert (= (and d!133035 res!802867) b!1207562))

(assert (= (and b!1207562 res!802869) b!1207563))

(assert (= (and b!1207563 res!802868) b!1207566))

(assert (= (and b!1207563 c!118682) b!1207570))

(assert (= (and b!1207563 (not c!118682)) b!1207567))

(assert (= (and b!1207570 res!802866) b!1207565))

(assert (= (and b!1207567 c!118684) b!1207568))

(assert (= (and b!1207567 (not c!118684)) b!1207564))

(declare-fun b_lambda!21445 () Bool)

(assert (=> (not b_lambda!21445) (not b!1207561)))

(assert (=> b!1207561 t!39497))

(declare-fun b_and!42961 () Bool)

(assert (= b_and!42959 (and (=> t!39497 result!22117) b_and!42961)))

(declare-fun b_lambda!21447 () Bool)

(assert (=> (not b_lambda!21447) (not b!1207565)))

(assert (=> b!1207565 t!39497))

(declare-fun b_and!42963 () Bool)

(assert (= b_and!42961 (and (=> t!39497 result!22117) b_and!42963)))

(declare-fun m!1113233 () Bool)

(assert (=> b!1207568 m!1113233))

(declare-fun m!1113235 () Bool)

(assert (=> d!133035 m!1113235))

(assert (=> d!133035 m!1112791))

(declare-fun m!1113237 () Bool)

(assert (=> b!1207564 m!1113237))

(declare-fun m!1113239 () Bool)

(assert (=> b!1207562 m!1113239))

(assert (=> b!1207565 m!1112847))

(declare-fun m!1113241 () Bool)

(assert (=> b!1207565 m!1113241))

(assert (=> b!1207565 m!1113241))

(declare-fun m!1113243 () Bool)

(assert (=> b!1207565 m!1113243))

(declare-fun m!1113245 () Bool)

(assert (=> b!1207565 m!1113245))

(assert (=> b!1207565 m!1112847))

(declare-fun m!1113247 () Bool)

(assert (=> b!1207565 m!1113247))

(assert (=> b!1207565 m!1113245))

(assert (=> b!1207566 m!1113241))

(assert (=> b!1207566 m!1113241))

(declare-fun m!1113249 () Bool)

(assert (=> b!1207566 m!1113249))

(assert (=> b!1207569 m!1113241))

(assert (=> b!1207569 m!1113241))

(assert (=> b!1207569 m!1113249))

(assert (=> bm!58980 m!1113233))

(declare-fun m!1113251 () Bool)

(assert (=> b!1207561 m!1113251))

(declare-fun m!1113253 () Bool)

(assert (=> b!1207561 m!1113253))

(declare-fun m!1113255 () Bool)

(assert (=> b!1207561 m!1113255))

(assert (=> b!1207561 m!1112847))

(assert (=> b!1207561 m!1113241))

(declare-fun m!1113257 () Bool)

(assert (=> b!1207561 m!1113257))

(assert (=> b!1207561 m!1113245))

(assert (=> b!1207561 m!1112847))

(assert (=> b!1207561 m!1113247))

(assert (=> b!1207561 m!1113245))

(assert (=> b!1207561 m!1113251))

(assert (=> b!1207570 m!1113241))

(assert (=> b!1207570 m!1113241))

(declare-fun m!1113259 () Bool)

(assert (=> b!1207570 m!1113259))

(assert (=> b!1207482 d!133035))

(declare-fun d!133037 () Bool)

(declare-fun isEmpty!988 (List!26553) Bool)

(assert (=> d!133037 (= (isEmpty!987 lt!547875) (isEmpty!988 (toList!8876 lt!547875)))))

(declare-fun bs!34136 () Bool)

(assert (= bs!34136 d!133037))

(declare-fun m!1113261 () Bool)

(assert (=> bs!34136 m!1113261))

(assert (=> b!1207454 d!133037))

(declare-fun d!133039 () Bool)

(assert (=> d!133039 (arrayContainsKey!0 lt!547751 lt!547843 #b00000000000000000000000000000000)))

(declare-fun lt!547943 () Unit!40015)

(assert (=> d!133039 (= lt!547943 (choose!13 lt!547751 lt!547843 #b00000000000000000000000000000000))))

(assert (=> d!133039 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!133039 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547751 lt!547843 #b00000000000000000000000000000000) lt!547943)))

(declare-fun bs!34137 () Bool)

(assert (= bs!34137 d!133039))

(assert (=> bs!34137 m!1112987))

(declare-fun m!1113263 () Bool)

(assert (=> bs!34137 m!1113263))

(assert (=> b!1207413 d!133039))

(declare-fun d!133041 () Bool)

(declare-fun res!802870 () Bool)

(declare-fun e!685783 () Bool)

(assert (=> d!133041 (=> res!802870 e!685783)))

(assert (=> d!133041 (= res!802870 (= (select (arr!37699 lt!547751) #b00000000000000000000000000000000) lt!547843))))

(assert (=> d!133041 (= (arrayContainsKey!0 lt!547751 lt!547843 #b00000000000000000000000000000000) e!685783)))

(declare-fun b!1207573 () Bool)

(declare-fun e!685784 () Bool)

(assert (=> b!1207573 (= e!685783 e!685784)))

(declare-fun res!802871 () Bool)

(assert (=> b!1207573 (=> (not res!802871) (not e!685784))))

(assert (=> b!1207573 (= res!802871 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun b!1207574 () Bool)

(assert (=> b!1207574 (= e!685784 (arrayContainsKey!0 lt!547751 lt!547843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133041 (not res!802870)) b!1207573))

(assert (= (and b!1207573 res!802871) b!1207574))

(assert (=> d!133041 m!1112981))

(declare-fun m!1113265 () Bool)

(assert (=> b!1207574 m!1113265))

(assert (=> b!1207413 d!133041))

(declare-fun d!133043 () Bool)

(declare-fun lt!547950 () SeekEntryResult!9938)

(assert (=> d!133043 (and (or ((_ is Undefined!9938) lt!547950) (not ((_ is Found!9938) lt!547950)) (and (bvsge (index!42124 lt!547950) #b00000000000000000000000000000000) (bvslt (index!42124 lt!547950) (size!38235 lt!547751)))) (or ((_ is Undefined!9938) lt!547950) ((_ is Found!9938) lt!547950) (not ((_ is MissingZero!9938) lt!547950)) (and (bvsge (index!42123 lt!547950) #b00000000000000000000000000000000) (bvslt (index!42123 lt!547950) (size!38235 lt!547751)))) (or ((_ is Undefined!9938) lt!547950) ((_ is Found!9938) lt!547950) ((_ is MissingZero!9938) lt!547950) (not ((_ is MissingVacant!9938) lt!547950)) (and (bvsge (index!42126 lt!547950) #b00000000000000000000000000000000) (bvslt (index!42126 lt!547950) (size!38235 lt!547751)))) (or ((_ is Undefined!9938) lt!547950) (ite ((_ is Found!9938) lt!547950) (= (select (arr!37699 lt!547751) (index!42124 lt!547950)) (select (arr!37699 lt!547751) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9938) lt!547950) (= (select (arr!37699 lt!547751) (index!42123 lt!547950)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9938) lt!547950) (= (select (arr!37699 lt!547751) (index!42126 lt!547950)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!685792 () SeekEntryResult!9938)

(assert (=> d!133043 (= lt!547950 e!685792)))

(declare-fun c!118692 () Bool)

(declare-fun lt!547951 () SeekEntryResult!9938)

(assert (=> d!133043 (= c!118692 (and ((_ is Intermediate!9938) lt!547951) (undefined!10750 lt!547951)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78119 (_ BitVec 32)) SeekEntryResult!9938)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!133043 (= lt!547951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) mask!1564) (select (arr!37699 lt!547751) #b00000000000000000000000000000000) lt!547751 mask!1564))))

(assert (=> d!133043 (validMask!0 mask!1564)))

(assert (=> d!133043 (= (seekEntryOrOpen!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) lt!547751 mask!1564) lt!547950)))

(declare-fun b!1207587 () Bool)

(declare-fun c!118694 () Bool)

(declare-fun lt!547952 () (_ BitVec 64))

(assert (=> b!1207587 (= c!118694 (= lt!547952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!685791 () SeekEntryResult!9938)

(declare-fun e!685793 () SeekEntryResult!9938)

(assert (=> b!1207587 (= e!685791 e!685793)))

(declare-fun b!1207588 () Bool)

(assert (=> b!1207588 (= e!685792 e!685791)))

(assert (=> b!1207588 (= lt!547952 (select (arr!37699 lt!547751) (index!42125 lt!547951)))))

(declare-fun c!118693 () Bool)

(assert (=> b!1207588 (= c!118693 (= lt!547952 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun b!1207589 () Bool)

(assert (=> b!1207589 (= e!685791 (Found!9938 (index!42125 lt!547951)))))

(declare-fun b!1207590 () Bool)

(assert (=> b!1207590 (= e!685792 Undefined!9938)))

(declare-fun b!1207591 () Bool)

(assert (=> b!1207591 (= e!685793 (MissingZero!9938 (index!42125 lt!547951)))))

(declare-fun b!1207592 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78119 (_ BitVec 32)) SeekEntryResult!9938)

(assert (=> b!1207592 (= e!685793 (seekKeyOrZeroReturnVacant!0 (x!106580 lt!547951) (index!42125 lt!547951) (index!42125 lt!547951) (select (arr!37699 lt!547751) #b00000000000000000000000000000000) lt!547751 mask!1564))))

(assert (= (and d!133043 c!118692) b!1207590))

(assert (= (and d!133043 (not c!118692)) b!1207588))

(assert (= (and b!1207588 c!118693) b!1207589))

(assert (= (and b!1207588 (not c!118693)) b!1207587))

(assert (= (and b!1207587 c!118694) b!1207591))

(assert (= (and b!1207587 (not c!118694)) b!1207592))

(declare-fun m!1113267 () Bool)

(assert (=> d!133043 m!1113267))

(assert (=> d!133043 m!1112981))

(declare-fun m!1113269 () Bool)

(assert (=> d!133043 m!1113269))

(declare-fun m!1113271 () Bool)

(assert (=> d!133043 m!1113271))

(declare-fun m!1113273 () Bool)

(assert (=> d!133043 m!1113273))

(declare-fun m!1113275 () Bool)

(assert (=> d!133043 m!1113275))

(assert (=> d!133043 m!1112791))

(assert (=> d!133043 m!1112981))

(assert (=> d!133043 m!1113267))

(declare-fun m!1113277 () Bool)

(assert (=> b!1207588 m!1113277))

(assert (=> b!1207592 m!1112981))

(declare-fun m!1113279 () Bool)

(assert (=> b!1207592 m!1113279))

(assert (=> b!1207413 d!133043))

(declare-fun d!133045 () Bool)

(declare-fun e!685794 () Bool)

(assert (=> d!133045 e!685794))

(declare-fun res!802872 () Bool)

(assert (=> d!133045 (=> res!802872 e!685794)))

(declare-fun lt!547953 () Bool)

(assert (=> d!133045 (= res!802872 (not lt!547953))))

(declare-fun lt!547956 () Bool)

(assert (=> d!133045 (= lt!547953 lt!547956)))

(declare-fun lt!547955 () Unit!40015)

(declare-fun e!685795 () Unit!40015)

(assert (=> d!133045 (= lt!547955 e!685795)))

(declare-fun c!118695 () Bool)

(assert (=> d!133045 (= c!118695 lt!547956)))

(assert (=> d!133045 (= lt!547956 (containsKey!592 (toList!8876 lt!547875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133045 (= (contains!6935 lt!547875 #b1000000000000000000000000000000000000000000000000000000000000000) lt!547953)))

(declare-fun b!1207593 () Bool)

(declare-fun lt!547954 () Unit!40015)

(assert (=> b!1207593 (= e!685795 lt!547954)))

(assert (=> b!1207593 (= lt!547954 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207593 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207594 () Bool)

(declare-fun Unit!40026 () Unit!40015)

(assert (=> b!1207594 (= e!685795 Unit!40026)))

(declare-fun b!1207595 () Bool)

(assert (=> b!1207595 (= e!685794 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133045 c!118695) b!1207593))

(assert (= (and d!133045 (not c!118695)) b!1207594))

(assert (= (and d!133045 (not res!802872)) b!1207595))

(declare-fun m!1113281 () Bool)

(assert (=> d!133045 m!1113281))

(declare-fun m!1113283 () Bool)

(assert (=> b!1207593 m!1113283))

(declare-fun m!1113285 () Bool)

(assert (=> b!1207593 m!1113285))

(assert (=> b!1207593 m!1113285))

(declare-fun m!1113287 () Bool)

(assert (=> b!1207593 m!1113287))

(assert (=> b!1207595 m!1113285))

(assert (=> b!1207595 m!1113285))

(assert (=> b!1207595 m!1113287))

(assert (=> b!1207452 d!133045))

(assert (=> b!1207388 d!132971))

(declare-fun d!133047 () Bool)

(declare-fun e!685796 () Bool)

(assert (=> d!133047 e!685796))

(declare-fun res!802873 () Bool)

(assert (=> d!133047 (=> res!802873 e!685796)))

(declare-fun lt!547957 () Bool)

(assert (=> d!133047 (= res!802873 (not lt!547957))))

(declare-fun lt!547960 () Bool)

(assert (=> d!133047 (= lt!547957 lt!547960)))

(declare-fun lt!547959 () Unit!40015)

(declare-fun e!685797 () Unit!40015)

(assert (=> d!133047 (= lt!547959 e!685797)))

(declare-fun c!118696 () Bool)

(assert (=> d!133047 (= c!118696 lt!547960)))

(assert (=> d!133047 (= lt!547960 (containsKey!592 (toList!8876 lt!547868) (select (arr!37699 lt!547751) from!1455)))))

(assert (=> d!133047 (= (contains!6935 lt!547868 (select (arr!37699 lt!547751) from!1455)) lt!547957)))

(declare-fun b!1207596 () Bool)

(declare-fun lt!547958 () Unit!40015)

(assert (=> b!1207596 (= e!685797 lt!547958)))

(assert (=> b!1207596 (= lt!547958 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547868) (select (arr!37699 lt!547751) from!1455)))))

(assert (=> b!1207596 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547868) (select (arr!37699 lt!547751) from!1455)))))

(declare-fun b!1207597 () Bool)

(declare-fun Unit!40027 () Unit!40015)

(assert (=> b!1207597 (= e!685797 Unit!40027)))

(declare-fun b!1207598 () Bool)

(assert (=> b!1207598 (= e!685796 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547868) (select (arr!37699 lt!547751) from!1455))))))

(assert (= (and d!133047 c!118696) b!1207596))

(assert (= (and d!133047 (not c!118696)) b!1207597))

(assert (= (and d!133047 (not res!802873)) b!1207598))

(assert (=> d!133047 m!1113005))

(declare-fun m!1113289 () Bool)

(assert (=> d!133047 m!1113289))

(assert (=> b!1207596 m!1113005))

(declare-fun m!1113291 () Bool)

(assert (=> b!1207596 m!1113291))

(assert (=> b!1207596 m!1113005))

(declare-fun m!1113293 () Bool)

(assert (=> b!1207596 m!1113293))

(assert (=> b!1207596 m!1113293))

(declare-fun m!1113295 () Bool)

(assert (=> b!1207596 m!1113295))

(assert (=> b!1207598 m!1113005))

(assert (=> b!1207598 m!1113293))

(assert (=> b!1207598 m!1113293))

(assert (=> b!1207598 m!1113295))

(assert (=> b!1207448 d!133047))

(declare-fun d!133049 () Bool)

(declare-fun res!802874 () Bool)

(declare-fun e!685798 () Bool)

(assert (=> d!133049 (=> res!802874 e!685798)))

(assert (=> d!133049 (= res!802874 (and ((_ is Cons!26549) (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9887 (h!27758 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!133049 (= (containsKey!592 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!685798)))

(declare-fun b!1207599 () Bool)

(declare-fun e!685799 () Bool)

(assert (=> b!1207599 (= e!685798 e!685799)))

(declare-fun res!802875 () Bool)

(assert (=> b!1207599 (=> (not res!802875) (not e!685799))))

(assert (=> b!1207599 (= res!802875 (and (or (not ((_ is Cons!26549) (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (bvsle (_1!9887 (h!27758 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)) ((_ is Cons!26549) (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (bvslt (_1!9887 (h!27758 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun b!1207600 () Bool)

(assert (=> b!1207600 (= e!685799 (containsKey!592 (t!39498 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!133049 (not res!802874)) b!1207599))

(assert (= (and b!1207599 res!802875) b!1207600))

(declare-fun m!1113297 () Bool)

(assert (=> b!1207600 m!1113297))

(assert (=> d!132957 d!133049))

(declare-fun d!133051 () Bool)

(declare-fun get!19213 (Option!687) V!46019)

(assert (=> d!133051 (= (apply!965 lt!547889 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19213 (getValueByKey!636 (toList!8876 lt!547889) (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34138 () Bool)

(assert (= bs!34138 d!133051))

(assert (=> bs!34138 m!1112969))

(assert (=> bs!34138 m!1113221))

(assert (=> bs!34138 m!1113221))

(declare-fun m!1113299 () Bool)

(assert (=> bs!34138 m!1113299))

(assert (=> b!1207479 d!133051))

(declare-fun d!133053 () Bool)

(declare-fun c!118697 () Bool)

(assert (=> d!133053 (= c!118697 ((_ is ValueCellFull!14625) (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!685800 () V!46019)

(assert (=> d!133053 (= (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685800)))

(declare-fun b!1207601 () Bool)

(assert (=> b!1207601 (= e!685800 (get!19211 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207602 () Bool)

(assert (=> b!1207602 (= e!685800 (get!19212 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133053 c!118697) b!1207601))

(assert (= (and d!133053 (not c!118697)) b!1207602))

(assert (=> b!1207601 m!1113087))

(assert (=> b!1207601 m!1112847))

(declare-fun m!1113301 () Bool)

(assert (=> b!1207601 m!1113301))

(assert (=> b!1207602 m!1113087))

(assert (=> b!1207602 m!1112847))

(declare-fun m!1113303 () Bool)

(assert (=> b!1207602 m!1113303))

(assert (=> b!1207479 d!133053))

(declare-fun d!133055 () Bool)

(declare-fun e!685803 () Bool)

(assert (=> d!133055 e!685803))

(declare-fun c!118700 () Bool)

(assert (=> d!133055 (= c!118700 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!133055 true))

(declare-fun _$12!468 () Unit!40015)

(assert (=> d!133055 (= (choose!1803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!468)))

(declare-fun b!1207608 () Bool)

(declare-fun call!58988 () ListLongMap!17721)

(declare-fun call!58989 () ListLongMap!17721)

(assert (=> b!1207608 (= e!685803 (= call!58988 call!58989))))

(declare-fun bm!58986 () Bool)

(assert (=> bm!58986 (= call!58988 (getCurrentListMapNoExtraKeys!5310 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)) (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207607 () Bool)

(assert (=> b!1207607 (= e!685803 (= call!58988 (-!1831 call!58989 k0!934)))))

(declare-fun bm!58985 () Bool)

(assert (=> bm!58985 (= call!58989 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133055 c!118700) b!1207607))

(assert (= (and d!133055 (not c!118700)) b!1207608))

(assert (= (or b!1207607 b!1207608) bm!58985))

(assert (= (or b!1207607 b!1207608) bm!58986))

(declare-fun b_lambda!21449 () Bool)

(assert (=> (not b_lambda!21449) (not bm!58986)))

(assert (=> bm!58986 t!39497))

(declare-fun b_and!42965 () Bool)

(assert (= b_and!42963 (and (=> t!39497 result!22117) b_and!42965)))

(assert (=> bm!58986 m!1112811))

(assert (=> bm!58986 m!1112847))

(assert (=> bm!58986 m!1112849))

(assert (=> bm!58986 m!1113139))

(declare-fun m!1113305 () Bool)

(assert (=> b!1207607 m!1113305))

(assert (=> bm!58985 m!1112793))

(assert (=> d!133005 d!133055))

(declare-fun b!1207609 () Bool)

(declare-fun lt!547962 () Unit!40015)

(declare-fun lt!547964 () Unit!40015)

(assert (=> b!1207609 (= lt!547962 lt!547964)))

(declare-fun lt!547963 () ListLongMap!17721)

(declare-fun lt!547961 () (_ BitVec 64))

(declare-fun lt!547965 () (_ BitVec 64))

(declare-fun lt!547967 () V!46019)

(assert (=> b!1207609 (not (contains!6935 (+!3996 lt!547963 (tuple2!19753 lt!547965 lt!547967)) lt!547961))))

(assert (=> b!1207609 (= lt!547964 (addStillNotContains!293 lt!547963 lt!547965 lt!547967 lt!547961))))

(assert (=> b!1207609 (= lt!547961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207609 (= lt!547967 (get!19210 (select (arr!37700 lt!547747) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207609 (= lt!547965 (select (arr!37699 lt!547751) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58990 () ListLongMap!17721)

(assert (=> b!1207609 (= lt!547963 call!58990)))

(declare-fun e!685805 () ListLongMap!17721)

(assert (=> b!1207609 (= e!685805 (+!3996 call!58990 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19210 (select (arr!37700 lt!547747) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207610 () Bool)

(declare-fun res!802879 () Bool)

(declare-fun e!685808 () Bool)

(assert (=> b!1207610 (=> (not res!802879) (not e!685808))))

(declare-fun lt!547966 () ListLongMap!17721)

(assert (=> b!1207610 (= res!802879 (not (contains!6935 lt!547966 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207611 () Bool)

(declare-fun e!685810 () Bool)

(assert (=> b!1207611 (= e!685808 e!685810)))

(declare-fun c!118701 () Bool)

(declare-fun e!685809 () Bool)

(assert (=> b!1207611 (= c!118701 e!685809)))

(declare-fun res!802878 () Bool)

(assert (=> b!1207611 (=> (not res!802878) (not e!685809))))

(assert (=> b!1207611 (= res!802878 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun b!1207612 () Bool)

(declare-fun e!685804 () Bool)

(assert (=> b!1207612 (= e!685804 (isEmpty!987 lt!547966))))

(declare-fun b!1207613 () Bool)

(assert (=> b!1207613 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(assert (=> b!1207613 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38236 lt!547747)))))

(declare-fun e!685806 () Bool)

(assert (=> b!1207613 (= e!685806 (= (apply!965 lt!547966 (select (arr!37699 lt!547751) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19210 (select (arr!37700 lt!547747) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207614 () Bool)

(assert (=> b!1207614 (= e!685809 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207614 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207615 () Bool)

(assert (=> b!1207615 (= e!685810 e!685804)))

(declare-fun c!118703 () Bool)

(assert (=> b!1207615 (= c!118703 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun bm!58987 () Bool)

(assert (=> bm!58987 (= call!58990 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207616 () Bool)

(assert (=> b!1207616 (= e!685804 (= lt!547966 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207617 () Bool)

(declare-fun e!685807 () ListLongMap!17721)

(assert (=> b!1207617 (= e!685807 e!685805)))

(declare-fun c!118702 () Bool)

(assert (=> b!1207617 (= c!118702 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207618 () Bool)

(assert (=> b!1207618 (= e!685810 e!685806)))

(assert (=> b!1207618 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun res!802876 () Bool)

(assert (=> b!1207618 (= res!802876 (contains!6935 lt!547966 (select (arr!37699 lt!547751) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207618 (=> (not res!802876) (not e!685806))))

(declare-fun d!133057 () Bool)

(assert (=> d!133057 e!685808))

(declare-fun res!802877 () Bool)

(assert (=> d!133057 (=> (not res!802877) (not e!685808))))

(assert (=> d!133057 (= res!802877 (not (contains!6935 lt!547966 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133057 (= lt!547966 e!685807)))

(declare-fun c!118704 () Bool)

(assert (=> d!133057 (= c!118704 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(assert (=> d!133057 (validMask!0 mask!1564)))

(assert (=> d!133057 (= (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547966)))

(declare-fun b!1207619 () Bool)

(assert (=> b!1207619 (= e!685807 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207620 () Bool)

(assert (=> b!1207620 (= e!685805 call!58990)))

(assert (= (and d!133057 c!118704) b!1207619))

(assert (= (and d!133057 (not c!118704)) b!1207617))

(assert (= (and b!1207617 c!118702) b!1207609))

(assert (= (and b!1207617 (not c!118702)) b!1207620))

(assert (= (or b!1207609 b!1207620) bm!58987))

(assert (= (and d!133057 res!802877) b!1207610))

(assert (= (and b!1207610 res!802879) b!1207611))

(assert (= (and b!1207611 res!802878) b!1207614))

(assert (= (and b!1207611 c!118701) b!1207618))

(assert (= (and b!1207611 (not c!118701)) b!1207615))

(assert (= (and b!1207618 res!802876) b!1207613))

(assert (= (and b!1207615 c!118703) b!1207616))

(assert (= (and b!1207615 (not c!118703)) b!1207612))

(declare-fun b_lambda!21451 () Bool)

(assert (=> (not b_lambda!21451) (not b!1207609)))

(assert (=> b!1207609 t!39497))

(declare-fun b_and!42967 () Bool)

(assert (= b_and!42965 (and (=> t!39497 result!22117) b_and!42967)))

(declare-fun b_lambda!21453 () Bool)

(assert (=> (not b_lambda!21453) (not b!1207613)))

(assert (=> b!1207613 t!39497))

(declare-fun b_and!42969 () Bool)

(assert (= b_and!42967 (and (=> t!39497 result!22117) b_and!42969)))

(declare-fun m!1113307 () Bool)

(assert (=> b!1207616 m!1113307))

(declare-fun m!1113309 () Bool)

(assert (=> d!133057 m!1113309))

(assert (=> d!133057 m!1112791))

(declare-fun m!1113311 () Bool)

(assert (=> b!1207612 m!1113311))

(declare-fun m!1113313 () Bool)

(assert (=> b!1207610 m!1113313))

(assert (=> b!1207613 m!1112847))

(declare-fun m!1113315 () Bool)

(assert (=> b!1207613 m!1113315))

(assert (=> b!1207613 m!1113315))

(declare-fun m!1113317 () Bool)

(assert (=> b!1207613 m!1113317))

(declare-fun m!1113319 () Bool)

(assert (=> b!1207613 m!1113319))

(assert (=> b!1207613 m!1112847))

(declare-fun m!1113321 () Bool)

(assert (=> b!1207613 m!1113321))

(assert (=> b!1207613 m!1113319))

(assert (=> b!1207614 m!1113315))

(assert (=> b!1207614 m!1113315))

(declare-fun m!1113323 () Bool)

(assert (=> b!1207614 m!1113323))

(assert (=> b!1207617 m!1113315))

(assert (=> b!1207617 m!1113315))

(assert (=> b!1207617 m!1113323))

(assert (=> bm!58987 m!1113307))

(declare-fun m!1113325 () Bool)

(assert (=> b!1207609 m!1113325))

(declare-fun m!1113327 () Bool)

(assert (=> b!1207609 m!1113327))

(declare-fun m!1113329 () Bool)

(assert (=> b!1207609 m!1113329))

(assert (=> b!1207609 m!1112847))

(assert (=> b!1207609 m!1113315))

(declare-fun m!1113331 () Bool)

(assert (=> b!1207609 m!1113331))

(assert (=> b!1207609 m!1113319))

(assert (=> b!1207609 m!1112847))

(assert (=> b!1207609 m!1113321))

(assert (=> b!1207609 m!1113319))

(assert (=> b!1207609 m!1113325))

(assert (=> b!1207618 m!1113315))

(assert (=> b!1207618 m!1113315))

(declare-fun m!1113333 () Bool)

(assert (=> b!1207618 m!1113333))

(assert (=> b!1207446 d!133057))

(declare-fun d!133059 () Bool)

(assert (=> d!133059 (= (isEmpty!987 lt!547889) (isEmpty!988 (toList!8876 lt!547889)))))

(declare-fun bs!34139 () Bool)

(assert (= bs!34139 d!133059))

(declare-fun m!1113335 () Bool)

(assert (=> bs!34139 m!1113335))

(assert (=> b!1207478 d!133059))

(declare-fun d!133061 () Bool)

(declare-fun e!685811 () Bool)

(assert (=> d!133061 e!685811))

(declare-fun res!802880 () Bool)

(assert (=> d!133061 (=> res!802880 e!685811)))

(declare-fun lt!547968 () Bool)

(assert (=> d!133061 (= res!802880 (not lt!547968))))

(declare-fun lt!547971 () Bool)

(assert (=> d!133061 (= lt!547968 lt!547971)))

(declare-fun lt!547970 () Unit!40015)

(declare-fun e!685812 () Unit!40015)

(assert (=> d!133061 (= lt!547970 e!685812)))

(declare-fun c!118705 () Bool)

(assert (=> d!133061 (= c!118705 lt!547971)))

(assert (=> d!133061 (= lt!547971 (containsKey!592 (toList!8876 lt!547848) k0!934))))

(assert (=> d!133061 (= (contains!6935 lt!547848 k0!934) lt!547968)))

(declare-fun b!1207621 () Bool)

(declare-fun lt!547969 () Unit!40015)

(assert (=> b!1207621 (= e!685812 lt!547969)))

(assert (=> b!1207621 (= lt!547969 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547848) k0!934))))

(assert (=> b!1207621 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547848) k0!934))))

(declare-fun b!1207622 () Bool)

(declare-fun Unit!40028 () Unit!40015)

(assert (=> b!1207622 (= e!685812 Unit!40028)))

(declare-fun b!1207623 () Bool)

(assert (=> b!1207623 (= e!685811 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547848) k0!934)))))

(assert (= (and d!133061 c!118705) b!1207621))

(assert (= (and d!133061 (not c!118705)) b!1207622))

(assert (= (and d!133061 (not res!802880)) b!1207623))

(declare-fun m!1113337 () Bool)

(assert (=> d!133061 m!1113337))

(declare-fun m!1113339 () Bool)

(assert (=> b!1207621 m!1113339))

(declare-fun m!1113341 () Bool)

(assert (=> b!1207621 m!1113341))

(assert (=> b!1207621 m!1113341))

(declare-fun m!1113343 () Bool)

(assert (=> b!1207621 m!1113343))

(assert (=> b!1207623 m!1113341))

(assert (=> b!1207623 m!1113341))

(assert (=> b!1207623 m!1113343))

(assert (=> d!132977 d!133061))

(declare-fun d!133063 () Bool)

(declare-fun e!685821 () Bool)

(assert (=> d!133063 e!685821))

(declare-fun res!802883 () Bool)

(assert (=> d!133063 (=> (not res!802883) (not e!685821))))

(declare-fun lt!547974 () List!26553)

(declare-fun isStrictlySorted!729 (List!26553) Bool)

(assert (=> d!133063 (= res!802883 (isStrictlySorted!729 lt!547974))))

(declare-fun e!685819 () List!26553)

(assert (=> d!133063 (= lt!547974 e!685819)))

(declare-fun c!118711 () Bool)

(assert (=> d!133063 (= c!118711 (and ((_ is Cons!26549) (toList!8876 call!58929)) (= (_1!9887 (h!27758 (toList!8876 call!58929))) k0!934)))))

(assert (=> d!133063 (isStrictlySorted!729 (toList!8876 call!58929))))

(assert (=> d!133063 (= (removeStrictlySorted!98 (toList!8876 call!58929) k0!934) lt!547974)))

(declare-fun b!1207634 () Bool)

(assert (=> b!1207634 (= e!685819 (t!39498 (toList!8876 call!58929)))))

(declare-fun b!1207635 () Bool)

(declare-fun e!685820 () List!26553)

(assert (=> b!1207635 (= e!685819 e!685820)))

(declare-fun c!118710 () Bool)

(assert (=> b!1207635 (= c!118710 (and ((_ is Cons!26549) (toList!8876 call!58929)) (not (= (_1!9887 (h!27758 (toList!8876 call!58929))) k0!934))))))

(declare-fun b!1207636 () Bool)

(declare-fun $colon$colon!610 (List!26553 tuple2!19752) List!26553)

(assert (=> b!1207636 (= e!685820 ($colon$colon!610 (removeStrictlySorted!98 (t!39498 (toList!8876 call!58929)) k0!934) (h!27758 (toList!8876 call!58929))))))

(declare-fun b!1207637 () Bool)

(assert (=> b!1207637 (= e!685820 Nil!26550)))

(declare-fun b!1207638 () Bool)

(assert (=> b!1207638 (= e!685821 (not (containsKey!592 lt!547974 k0!934)))))

(assert (= (and d!133063 c!118711) b!1207634))

(assert (= (and d!133063 (not c!118711)) b!1207635))

(assert (= (and b!1207635 c!118710) b!1207636))

(assert (= (and b!1207635 (not c!118710)) b!1207637))

(assert (= (and d!133063 res!802883) b!1207638))

(declare-fun m!1113345 () Bool)

(assert (=> d!133063 m!1113345))

(declare-fun m!1113347 () Bool)

(assert (=> d!133063 m!1113347))

(declare-fun m!1113349 () Bool)

(assert (=> b!1207636 m!1113349))

(assert (=> b!1207636 m!1113349))

(declare-fun m!1113351 () Bool)

(assert (=> b!1207636 m!1113351))

(declare-fun m!1113353 () Bool)

(assert (=> b!1207638 m!1113353))

(assert (=> d!132977 d!133063))

(assert (=> bm!58967 d!133057))

(declare-fun d!133065 () Bool)

(declare-fun e!685822 () Bool)

(assert (=> d!133065 e!685822))

(declare-fun res!802884 () Bool)

(assert (=> d!133065 (=> res!802884 e!685822)))

(declare-fun lt!547975 () Bool)

(assert (=> d!133065 (= res!802884 (not lt!547975))))

(declare-fun lt!547978 () Bool)

(assert (=> d!133065 (= lt!547975 lt!547978)))

(declare-fun lt!547977 () Unit!40015)

(declare-fun e!685823 () Unit!40015)

(assert (=> d!133065 (= lt!547977 e!685823)))

(declare-fun c!118712 () Bool)

(assert (=> d!133065 (= c!118712 lt!547978)))

(assert (=> d!133065 (= lt!547978 (containsKey!592 (toList!8876 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> d!133065 (= (contains!6935 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))) k0!934) lt!547975)))

(declare-fun b!1207639 () Bool)

(declare-fun lt!547976 () Unit!40015)

(assert (=> b!1207639 (= e!685823 lt!547976)))

(assert (=> b!1207639 (= lt!547976 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> b!1207639 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))) k0!934))))

(declare-fun b!1207640 () Bool)

(declare-fun Unit!40029 () Unit!40015)

(assert (=> b!1207640 (= e!685823 Unit!40029)))

(declare-fun b!1207641 () Bool)

(assert (=> b!1207641 (= e!685822 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))) k0!934)))))

(assert (= (and d!133065 c!118712) b!1207639))

(assert (= (and d!133065 (not c!118712)) b!1207640))

(assert (= (and d!133065 (not res!802884)) b!1207641))

(declare-fun m!1113355 () Bool)

(assert (=> d!133065 m!1113355))

(declare-fun m!1113357 () Bool)

(assert (=> b!1207639 m!1113357))

(declare-fun m!1113359 () Bool)

(assert (=> b!1207639 m!1113359))

(assert (=> b!1207639 m!1113359))

(declare-fun m!1113361 () Bool)

(assert (=> b!1207639 m!1113361))

(assert (=> b!1207641 m!1113359))

(assert (=> b!1207641 m!1113359))

(assert (=> b!1207641 m!1113361))

(assert (=> d!133007 d!133065))

(declare-fun d!133067 () Bool)

(declare-fun e!685824 () Bool)

(assert (=> d!133067 e!685824))

(declare-fun res!802885 () Bool)

(assert (=> d!133067 (=> (not res!802885) (not e!685824))))

(declare-fun lt!547980 () ListLongMap!17721)

(assert (=> d!133067 (= res!802885 (contains!6935 lt!547980 (_1!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))))))

(declare-fun lt!547979 () List!26553)

(assert (=> d!133067 (= lt!547980 (ListLongMap!17722 lt!547979))))

(declare-fun lt!547982 () Unit!40015)

(declare-fun lt!547981 () Unit!40015)

(assert (=> d!133067 (= lt!547982 lt!547981)))

(assert (=> d!133067 (= (getValueByKey!636 lt!547979 (_1!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))) (Some!686 (_2!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))))))

(assert (=> d!133067 (= lt!547981 (lemmaContainsTupThenGetReturnValue!313 lt!547979 (_1!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))) (_2!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))))))

(assert (=> d!133067 (= lt!547979 (insertStrictlySorted!406 (toList!8876 lt!547743) (_1!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))) (_2!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))))))

(assert (=> d!133067 (= (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))) lt!547980)))

(declare-fun b!1207642 () Bool)

(declare-fun res!802886 () Bool)

(assert (=> b!1207642 (=> (not res!802886) (not e!685824))))

(assert (=> b!1207642 (= res!802886 (= (getValueByKey!636 (toList!8876 lt!547980) (_1!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944)))) (Some!686 (_2!9887 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))))))))

(declare-fun b!1207643 () Bool)

(assert (=> b!1207643 (= e!685824 (contains!6936 (toList!8876 lt!547980) (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))))))

(assert (= (and d!133067 res!802885) b!1207642))

(assert (= (and b!1207642 res!802886) b!1207643))

(declare-fun m!1113363 () Bool)

(assert (=> d!133067 m!1113363))

(declare-fun m!1113365 () Bool)

(assert (=> d!133067 m!1113365))

(declare-fun m!1113367 () Bool)

(assert (=> d!133067 m!1113367))

(declare-fun m!1113369 () Bool)

(assert (=> d!133067 m!1113369))

(declare-fun m!1113371 () Bool)

(assert (=> b!1207642 m!1113371))

(declare-fun m!1113373 () Bool)

(assert (=> b!1207643 m!1113373))

(assert (=> d!133007 d!133067))

(declare-fun d!133069 () Bool)

(assert (=> d!133069 (contains!6935 (+!3996 lt!547743 (tuple2!19753 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944))) k0!934)))

(assert (=> d!133069 true))

(declare-fun _$35!459 () Unit!40015)

(assert (=> d!133069 (= (choose!1801 lt!547743 (ite (or c!118610 c!118612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118610 c!118612) zeroValue!944 minValue!944) k0!934) _$35!459)))

(declare-fun bs!34140 () Bool)

(assert (= bs!34140 d!133069))

(assert (=> bs!34140 m!1113141))

(assert (=> bs!34140 m!1113141))

(assert (=> bs!34140 m!1113143))

(assert (=> d!133007 d!133069))

(assert (=> d!133007 d!132991))

(declare-fun d!133071 () Bool)

(declare-fun e!685825 () Bool)

(assert (=> d!133071 e!685825))

(declare-fun res!802887 () Bool)

(assert (=> d!133071 (=> res!802887 e!685825)))

(declare-fun lt!547983 () Bool)

(assert (=> d!133071 (= res!802887 (not lt!547983))))

(declare-fun lt!547986 () Bool)

(assert (=> d!133071 (= lt!547983 lt!547986)))

(declare-fun lt!547985 () Unit!40015)

(declare-fun e!685826 () Unit!40015)

(assert (=> d!133071 (= lt!547985 e!685826)))

(declare-fun c!118713 () Bool)

(assert (=> d!133071 (= c!118713 lt!547986)))

(assert (=> d!133071 (= lt!547986 (containsKey!592 (toList!8876 lt!547889) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133071 (= (contains!6935 lt!547889 #b1000000000000000000000000000000000000000000000000000000000000000) lt!547983)))

(declare-fun b!1207645 () Bool)

(declare-fun lt!547984 () Unit!40015)

(assert (=> b!1207645 (= e!685826 lt!547984)))

(assert (=> b!1207645 (= lt!547984 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547889) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207645 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547889) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207646 () Bool)

(declare-fun Unit!40030 () Unit!40015)

(assert (=> b!1207646 (= e!685826 Unit!40030)))

(declare-fun b!1207647 () Bool)

(assert (=> b!1207647 (= e!685825 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133071 c!118713) b!1207645))

(assert (= (and d!133071 (not c!118713)) b!1207646))

(assert (= (and d!133071 (not res!802887)) b!1207647))

(declare-fun m!1113375 () Bool)

(assert (=> d!133071 m!1113375))

(declare-fun m!1113377 () Bool)

(assert (=> b!1207645 m!1113377))

(declare-fun m!1113379 () Bool)

(assert (=> b!1207645 m!1113379))

(assert (=> b!1207645 m!1113379))

(declare-fun m!1113381 () Bool)

(assert (=> b!1207645 m!1113381))

(assert (=> b!1207647 m!1113379))

(assert (=> b!1207647 m!1113379))

(assert (=> b!1207647 m!1113381))

(assert (=> b!1207476 d!133071))

(declare-fun d!133073 () Bool)

(assert (=> d!133073 (= (validKeyInArray!0 (select (arr!37699 lt!547751) from!1455)) (and (not (= (select (arr!37699 lt!547751) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37699 lt!547751) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207444 d!133073))

(declare-fun d!133075 () Bool)

(declare-fun e!685827 () Bool)

(assert (=> d!133075 e!685827))

(declare-fun res!802888 () Bool)

(assert (=> d!133075 (=> res!802888 e!685827)))

(declare-fun lt!547987 () Bool)

(assert (=> d!133075 (= res!802888 (not lt!547987))))

(declare-fun lt!547990 () Bool)

(assert (=> d!133075 (= lt!547987 lt!547990)))

(declare-fun lt!547989 () Unit!40015)

(declare-fun e!685828 () Unit!40015)

(assert (=> d!133075 (= lt!547989 e!685828)))

(declare-fun c!118714 () Bool)

(assert (=> d!133075 (= c!118714 lt!547990)))

(assert (=> d!133075 (= lt!547990 (containsKey!592 (toList!8876 lt!547882) (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!133075 (= (contains!6935 lt!547882 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))) lt!547987)))

(declare-fun b!1207648 () Bool)

(declare-fun lt!547988 () Unit!40015)

(assert (=> b!1207648 (= e!685828 lt!547988)))

(assert (=> b!1207648 (= lt!547988 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547882) (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207648 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547882) (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207649 () Bool)

(declare-fun Unit!40031 () Unit!40015)

(assert (=> b!1207649 (= e!685828 Unit!40031)))

(declare-fun b!1207650 () Bool)

(assert (=> b!1207650 (= e!685827 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547882) (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!133075 c!118714) b!1207648))

(assert (= (and d!133075 (not c!118714)) b!1207649))

(assert (= (and d!133075 (not res!802888)) b!1207650))

(assert (=> d!133075 m!1113057))

(declare-fun m!1113383 () Bool)

(assert (=> d!133075 m!1113383))

(assert (=> b!1207648 m!1113057))

(declare-fun m!1113385 () Bool)

(assert (=> b!1207648 m!1113385))

(assert (=> b!1207648 m!1113057))

(declare-fun m!1113387 () Bool)

(assert (=> b!1207648 m!1113387))

(assert (=> b!1207648 m!1113387))

(declare-fun m!1113389 () Bool)

(assert (=> b!1207648 m!1113389))

(assert (=> b!1207650 m!1113057))

(assert (=> b!1207650 m!1113387))

(assert (=> b!1207650 m!1113387))

(assert (=> b!1207650 m!1113389))

(assert (=> b!1207472 d!133075))

(assert (=> b!1207381 d!133027))

(declare-fun d!133077 () Bool)

(declare-fun isEmpty!989 (Option!687) Bool)

(assert (=> d!133077 (= (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)) (not (isEmpty!989 (getValueByKey!636 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))))

(declare-fun bs!34141 () Bool)

(assert (= bs!34141 d!133077))

(assert (=> bs!34141 m!1112931))

(declare-fun m!1113391 () Bool)

(assert (=> bs!34141 m!1113391))

(assert (=> b!1207362 d!133077))

(declare-fun b!1207659 () Bool)

(declare-fun e!685833 () Option!687)

(assert (=> b!1207659 (= e!685833 (Some!686 (_2!9887 (h!27758 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1207662 () Bool)

(declare-fun e!685834 () Option!687)

(assert (=> b!1207662 (= e!685834 None!685)))

(declare-fun b!1207661 () Bool)

(assert (=> b!1207661 (= e!685834 (getValueByKey!636 (t!39498 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(declare-fun b!1207660 () Bool)

(assert (=> b!1207660 (= e!685833 e!685834)))

(declare-fun c!118720 () Bool)

(assert (=> b!1207660 (= c!118720 (and ((_ is Cons!26549) (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (not (= (_1!9887 (h!27758 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934))))))

(declare-fun c!118719 () Bool)

(declare-fun d!133079 () Bool)

(assert (=> d!133079 (= c!118719 (and ((_ is Cons!26549) (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9887 (h!27758 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!133079 (= (getValueByKey!636 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!685833)))

(assert (= (and d!133079 c!118719) b!1207659))

(assert (= (and d!133079 (not c!118719)) b!1207660))

(assert (= (and b!1207660 c!118720) b!1207661))

(assert (= (and b!1207660 (not c!118720)) b!1207662))

(declare-fun m!1113393 () Bool)

(assert (=> b!1207661 m!1113393))

(assert (=> b!1207362 d!133079))

(declare-fun d!133081 () Bool)

(assert (=> d!133081 (= (validKeyInArray!0 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)) (and (not (= (select (arr!37699 lt!547751) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37699 lt!547751) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207499 d!133081))

(declare-fun lt!547993 () Bool)

(declare-fun d!133083 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!543 (List!26553) (InoxSet tuple2!19752))

(assert (=> d!133083 (= lt!547993 (select (content!543 (toList!8876 lt!547834)) (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!685840 () Bool)

(assert (=> d!133083 (= lt!547993 e!685840)))

(declare-fun res!802894 () Bool)

(assert (=> d!133083 (=> (not res!802894) (not e!685840))))

(assert (=> d!133083 (= res!802894 ((_ is Cons!26549) (toList!8876 lt!547834)))))

(assert (=> d!133083 (= (contains!6936 (toList!8876 lt!547834) (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!547993)))

(declare-fun b!1207667 () Bool)

(declare-fun e!685839 () Bool)

(assert (=> b!1207667 (= e!685840 e!685839)))

(declare-fun res!802893 () Bool)

(assert (=> b!1207667 (=> res!802893 e!685839)))

(assert (=> b!1207667 (= res!802893 (= (h!27758 (toList!8876 lt!547834)) (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207668 () Bool)

(assert (=> b!1207668 (= e!685839 (contains!6936 (t!39498 (toList!8876 lt!547834)) (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133083 res!802894) b!1207667))

(assert (= (and b!1207667 (not res!802893)) b!1207668))

(declare-fun m!1113395 () Bool)

(assert (=> d!133083 m!1113395))

(declare-fun m!1113397 () Bool)

(assert (=> d!133083 m!1113397))

(declare-fun m!1113399 () Bool)

(assert (=> b!1207668 m!1113399))

(assert (=> b!1207391 d!133083))

(declare-fun d!133085 () Bool)

(assert (=> d!133085 (= (isEmpty!987 lt!547868) (isEmpty!988 (toList!8876 lt!547868)))))

(declare-fun bs!34142 () Bool)

(assert (= bs!34142 d!133085))

(declare-fun m!1113401 () Bool)

(assert (=> bs!34142 m!1113401))

(assert (=> b!1207442 d!133085))

(declare-fun b!1207669 () Bool)

(declare-fun lt!547995 () Unit!40015)

(declare-fun lt!547997 () Unit!40015)

(assert (=> b!1207669 (= lt!547995 lt!547997)))

(declare-fun lt!547994 () (_ BitVec 64))

(declare-fun lt!547996 () ListLongMap!17721)

(declare-fun lt!547998 () (_ BitVec 64))

(declare-fun lt!548000 () V!46019)

(assert (=> b!1207669 (not (contains!6935 (+!3996 lt!547996 (tuple2!19753 lt!547998 lt!548000)) lt!547994))))

(assert (=> b!1207669 (= lt!547997 (addStillNotContains!293 lt!547996 lt!547998 lt!548000 lt!547994))))

(assert (=> b!1207669 (= lt!547994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207669 (= lt!548000 (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207669 (= lt!547998 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58991 () ListLongMap!17721)

(assert (=> b!1207669 (= lt!547996 call!58991)))

(declare-fun e!685842 () ListLongMap!17721)

(assert (=> b!1207669 (= e!685842 (+!3996 call!58991 (tuple2!19753 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207670 () Bool)

(declare-fun res!802898 () Bool)

(declare-fun e!685845 () Bool)

(assert (=> b!1207670 (=> (not res!802898) (not e!685845))))

(declare-fun lt!547999 () ListLongMap!17721)

(assert (=> b!1207670 (= res!802898 (not (contains!6935 lt!547999 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207671 () Bool)

(declare-fun e!685847 () Bool)

(assert (=> b!1207671 (= e!685845 e!685847)))

(declare-fun c!118721 () Bool)

(declare-fun e!685846 () Bool)

(assert (=> b!1207671 (= c!118721 e!685846)))

(declare-fun res!802897 () Bool)

(assert (=> b!1207671 (=> (not res!802897) (not e!685846))))

(assert (=> b!1207671 (= res!802897 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun b!1207672 () Bool)

(declare-fun e!685841 () Bool)

(assert (=> b!1207672 (= e!685841 (isEmpty!987 lt!547999))))

(declare-fun b!1207673 () Bool)

(assert (=> b!1207673 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(assert (=> b!1207673 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38236 lt!547747)))))

(declare-fun e!685843 () Bool)

(assert (=> b!1207673 (= e!685843 (= (apply!965 lt!547999 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19210 (select (arr!37700 lt!547747) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207674 () Bool)

(assert (=> b!1207674 (= e!685846 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207674 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207675 () Bool)

(assert (=> b!1207675 (= e!685847 e!685841)))

(declare-fun c!118723 () Bool)

(assert (=> b!1207675 (= c!118723 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun bm!58988 () Bool)

(assert (=> bm!58988 (= call!58991 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207676 () Bool)

(assert (=> b!1207676 (= e!685841 (= lt!547999 (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207677 () Bool)

(declare-fun e!685844 () ListLongMap!17721)

(assert (=> b!1207677 (= e!685844 e!685842)))

(declare-fun c!118722 () Bool)

(assert (=> b!1207677 (= c!118722 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207678 () Bool)

(assert (=> b!1207678 (= e!685847 e!685843)))

(assert (=> b!1207678 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(declare-fun res!802895 () Bool)

(assert (=> b!1207678 (= res!802895 (contains!6935 lt!547999 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207678 (=> (not res!802895) (not e!685843))))

(declare-fun d!133087 () Bool)

(assert (=> d!133087 e!685845))

(declare-fun res!802896 () Bool)

(assert (=> d!133087 (=> (not res!802896) (not e!685845))))

(assert (=> d!133087 (= res!802896 (not (contains!6935 lt!547999 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133087 (= lt!547999 e!685844)))

(declare-fun c!118724 () Bool)

(assert (=> d!133087 (= c!118724 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(assert (=> d!133087 (validMask!0 mask!1564)))

(assert (=> d!133087 (= (getCurrentListMapNoExtraKeys!5310 lt!547751 lt!547747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547999)))

(declare-fun b!1207679 () Bool)

(assert (=> b!1207679 (= e!685844 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207680 () Bool)

(assert (=> b!1207680 (= e!685842 call!58991)))

(assert (= (and d!133087 c!118724) b!1207679))

(assert (= (and d!133087 (not c!118724)) b!1207677))

(assert (= (and b!1207677 c!118722) b!1207669))

(assert (= (and b!1207677 (not c!118722)) b!1207680))

(assert (= (or b!1207669 b!1207680) bm!58988))

(assert (= (and d!133087 res!802896) b!1207670))

(assert (= (and b!1207670 res!802898) b!1207671))

(assert (= (and b!1207671 res!802897) b!1207674))

(assert (= (and b!1207671 c!118721) b!1207678))

(assert (= (and b!1207671 (not c!118721)) b!1207675))

(assert (= (and b!1207678 res!802895) b!1207673))

(assert (= (and b!1207675 c!118723) b!1207676))

(assert (= (and b!1207675 (not c!118723)) b!1207672))

(declare-fun b_lambda!21455 () Bool)

(assert (=> (not b_lambda!21455) (not b!1207669)))

(assert (=> b!1207669 t!39497))

(declare-fun b_and!42971 () Bool)

(assert (= b_and!42969 (and (=> t!39497 result!22117) b_and!42971)))

(declare-fun b_lambda!21457 () Bool)

(assert (=> (not b_lambda!21457) (not b!1207673)))

(assert (=> b!1207673 t!39497))

(declare-fun b_and!42973 () Bool)

(assert (= b_and!42971 (and (=> t!39497 result!22117) b_and!42973)))

(declare-fun m!1113403 () Bool)

(assert (=> b!1207676 m!1113403))

(declare-fun m!1113405 () Bool)

(assert (=> d!133087 m!1113405))

(assert (=> d!133087 m!1112791))

(declare-fun m!1113407 () Bool)

(assert (=> b!1207672 m!1113407))

(declare-fun m!1113409 () Bool)

(assert (=> b!1207670 m!1113409))

(assert (=> b!1207673 m!1112847))

(declare-fun m!1113411 () Bool)

(assert (=> b!1207673 m!1113411))

(assert (=> b!1207673 m!1113411))

(declare-fun m!1113413 () Bool)

(assert (=> b!1207673 m!1113413))

(declare-fun m!1113415 () Bool)

(assert (=> b!1207673 m!1113415))

(assert (=> b!1207673 m!1112847))

(declare-fun m!1113417 () Bool)

(assert (=> b!1207673 m!1113417))

(assert (=> b!1207673 m!1113415))

(assert (=> b!1207674 m!1113411))

(assert (=> b!1207674 m!1113411))

(declare-fun m!1113419 () Bool)

(assert (=> b!1207674 m!1113419))

(assert (=> b!1207677 m!1113411))

(assert (=> b!1207677 m!1113411))

(assert (=> b!1207677 m!1113419))

(assert (=> bm!58988 m!1113403))

(declare-fun m!1113421 () Bool)

(assert (=> b!1207669 m!1113421))

(declare-fun m!1113423 () Bool)

(assert (=> b!1207669 m!1113423))

(declare-fun m!1113425 () Bool)

(assert (=> b!1207669 m!1113425))

(assert (=> b!1207669 m!1112847))

(assert (=> b!1207669 m!1113411))

(declare-fun m!1113427 () Bool)

(assert (=> b!1207669 m!1113427))

(assert (=> b!1207669 m!1113415))

(assert (=> b!1207669 m!1112847))

(assert (=> b!1207669 m!1113417))

(assert (=> b!1207669 m!1113415))

(assert (=> b!1207669 m!1113421))

(assert (=> b!1207678 m!1113411))

(assert (=> b!1207678 m!1113411))

(declare-fun m!1113429 () Bool)

(assert (=> b!1207678 m!1113429))

(assert (=> b!1207470 d!133087))

(declare-fun b!1207681 () Bool)

(declare-fun e!685848 () Bool)

(declare-fun call!58992 () Bool)

(assert (=> b!1207681 (= e!685848 call!58992)))

(declare-fun b!1207682 () Bool)

(declare-fun e!685850 () Bool)

(declare-fun e!685849 () Bool)

(assert (=> b!1207682 (= e!685850 e!685849)))

(declare-fun c!118725 () Bool)

(assert (=> b!1207682 (= c!118725 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207683 () Bool)

(assert (=> b!1207683 (= e!685849 e!685848)))

(declare-fun lt!548001 () (_ BitVec 64))

(assert (=> b!1207683 (= lt!548001 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!548002 () Unit!40015)

(assert (=> b!1207683 (= lt!548002 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548001 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1207683 (arrayContainsKey!0 _keys!1208 lt!548001 #b00000000000000000000000000000000)))

(declare-fun lt!548003 () Unit!40015)

(assert (=> b!1207683 (= lt!548003 lt!548002)))

(declare-fun res!802899 () Bool)

(assert (=> b!1207683 (= res!802899 (= (seekEntryOrOpen!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1207683 (=> (not res!802899) (not e!685848))))

(declare-fun bm!58989 () Bool)

(assert (=> bm!58989 (= call!58992 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!133089 () Bool)

(declare-fun res!802900 () Bool)

(assert (=> d!133089 (=> res!802900 e!685850)))

(assert (=> d!133089 (= res!802900 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> d!133089 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!685850)))

(declare-fun b!1207684 () Bool)

(assert (=> b!1207684 (= e!685849 call!58992)))

(assert (= (and d!133089 (not res!802900)) b!1207682))

(assert (= (and b!1207682 c!118725) b!1207683))

(assert (= (and b!1207682 (not c!118725)) b!1207684))

(assert (= (and b!1207683 res!802899) b!1207681))

(assert (= (or b!1207681 b!1207684) bm!58989))

(declare-fun m!1113431 () Bool)

(assert (=> b!1207682 m!1113431))

(assert (=> b!1207682 m!1113431))

(declare-fun m!1113433 () Bool)

(assert (=> b!1207682 m!1113433))

(assert (=> b!1207683 m!1113431))

(declare-fun m!1113435 () Bool)

(assert (=> b!1207683 m!1113435))

(declare-fun m!1113437 () Bool)

(assert (=> b!1207683 m!1113437))

(assert (=> b!1207683 m!1113431))

(declare-fun m!1113439 () Bool)

(assert (=> b!1207683 m!1113439))

(declare-fun m!1113441 () Bool)

(assert (=> bm!58989 m!1113441))

(assert (=> bm!58971 d!133089))

(declare-fun d!133091 () Bool)

(declare-fun e!685851 () Bool)

(assert (=> d!133091 e!685851))

(declare-fun res!802901 () Bool)

(assert (=> d!133091 (=> res!802901 e!685851)))

(declare-fun lt!548004 () Bool)

(assert (=> d!133091 (= res!802901 (not lt!548004))))

(declare-fun lt!548007 () Bool)

(assert (=> d!133091 (= lt!548004 lt!548007)))

(declare-fun lt!548006 () Unit!40015)

(declare-fun e!685852 () Unit!40015)

(assert (=> d!133091 (= lt!548006 e!685852)))

(declare-fun c!118726 () Bool)

(assert (=> d!133091 (= c!118726 lt!548007)))

(assert (=> d!133091 (= lt!548007 (containsKey!592 (toList!8876 lt!547889) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133091 (= (contains!6935 lt!547889 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548004)))

(declare-fun b!1207685 () Bool)

(declare-fun lt!548005 () Unit!40015)

(assert (=> b!1207685 (= e!685852 lt!548005)))

(assert (=> b!1207685 (= lt!548005 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547889) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207685 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547889) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207686 () Bool)

(declare-fun Unit!40032 () Unit!40015)

(assert (=> b!1207686 (= e!685852 Unit!40032)))

(declare-fun b!1207687 () Bool)

(assert (=> b!1207687 (= e!685851 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133091 c!118726) b!1207685))

(assert (= (and d!133091 (not c!118726)) b!1207686))

(assert (= (and d!133091 (not res!802901)) b!1207687))

(declare-fun m!1113443 () Bool)

(assert (=> d!133091 m!1113443))

(declare-fun m!1113445 () Bool)

(assert (=> b!1207685 m!1113445))

(declare-fun m!1113447 () Bool)

(assert (=> b!1207685 m!1113447))

(assert (=> b!1207685 m!1113447))

(declare-fun m!1113449 () Bool)

(assert (=> b!1207685 m!1113449))

(assert (=> b!1207687 m!1113447))

(assert (=> b!1207687 m!1113447))

(assert (=> b!1207687 m!1113449))

(assert (=> d!132985 d!133091))

(assert (=> d!132985 d!132961))

(assert (=> b!1207379 d!133027))

(declare-fun d!133093 () Bool)

(assert (=> d!133093 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun lt!548010 () Unit!40015)

(declare-fun choose!1805 (List!26553 (_ BitVec 64)) Unit!40015)

(assert (=> d!133093 (= lt!548010 (choose!1805 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun e!685855 () Bool)

(assert (=> d!133093 e!685855))

(declare-fun res!802904 () Bool)

(assert (=> d!133093 (=> (not res!802904) (not e!685855))))

(assert (=> d!133093 (= res!802904 (isStrictlySorted!729 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133093 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) lt!548010)))

(declare-fun b!1207690 () Bool)

(assert (=> b!1207690 (= e!685855 (containsKey!592 (toList!8876 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (= (and d!133093 res!802904) b!1207690))

(assert (=> d!133093 m!1112931))

(assert (=> d!133093 m!1112931))

(assert (=> d!133093 m!1112933))

(declare-fun m!1113451 () Bool)

(assert (=> d!133093 m!1113451))

(declare-fun m!1113453 () Bool)

(assert (=> d!133093 m!1113453))

(assert (=> b!1207690 m!1112927))

(assert (=> b!1207360 d!133093))

(assert (=> b!1207360 d!133077))

(assert (=> b!1207360 d!133079))

(assert (=> d!132997 d!132995))

(declare-fun d!133095 () Bool)

(assert (=> d!133095 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!133095 true))

(declare-fun _$60!451 () Unit!40015)

(assert (=> d!133095 (= (choose!13 _keys!1208 k0!934 i!673) _$60!451)))

(declare-fun bs!34143 () Bool)

(assert (= bs!34143 d!133095))

(assert (=> bs!34143 m!1112825))

(assert (=> d!132997 d!133095))

(assert (=> b!1207497 d!133081))

(declare-fun b!1207691 () Bool)

(declare-fun e!685856 () Option!687)

(assert (=> b!1207691 (= e!685856 (Some!686 (_2!9887 (h!27758 (toList!8876 lt!547824)))))))

(declare-fun b!1207694 () Bool)

(declare-fun e!685857 () Option!687)

(assert (=> b!1207694 (= e!685857 None!685)))

(declare-fun b!1207693 () Bool)

(assert (=> b!1207693 (= e!685857 (getValueByKey!636 (t!39498 (toList!8876 lt!547824)) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207692 () Bool)

(assert (=> b!1207692 (= e!685856 e!685857)))

(declare-fun c!118728 () Bool)

(assert (=> b!1207692 (= c!118728 (and ((_ is Cons!26549) (toList!8876 lt!547824)) (not (= (_1!9887 (h!27758 (toList!8876 lt!547824))) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun d!133097 () Bool)

(declare-fun c!118727 () Bool)

(assert (=> d!133097 (= c!118727 (and ((_ is Cons!26549) (toList!8876 lt!547824)) (= (_1!9887 (h!27758 (toList!8876 lt!547824))) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133097 (= (getValueByKey!636 (toList!8876 lt!547824) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!685856)))

(assert (= (and d!133097 c!118727) b!1207691))

(assert (= (and d!133097 (not c!118727)) b!1207692))

(assert (= (and b!1207692 c!118728) b!1207693))

(assert (= (and b!1207692 (not c!118728)) b!1207694))

(declare-fun m!1113455 () Bool)

(assert (=> b!1207693 m!1113455))

(assert (=> b!1207367 d!133097))

(declare-fun d!133099 () Bool)

(declare-fun e!685858 () Bool)

(assert (=> d!133099 e!685858))

(declare-fun res!802905 () Bool)

(assert (=> d!133099 (=> res!802905 e!685858)))

(declare-fun lt!548011 () Bool)

(assert (=> d!133099 (= res!802905 (not lt!548011))))

(declare-fun lt!548014 () Bool)

(assert (=> d!133099 (= lt!548011 lt!548014)))

(declare-fun lt!548013 () Unit!40015)

(declare-fun e!685859 () Unit!40015)

(assert (=> d!133099 (= lt!548013 e!685859)))

(declare-fun c!118729 () Bool)

(assert (=> d!133099 (= c!118729 lt!548014)))

(assert (=> d!133099 (= lt!548014 (containsKey!592 (toList!8876 lt!547868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133099 (= (contains!6935 lt!547868 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548011)))

(declare-fun b!1207695 () Bool)

(declare-fun lt!548012 () Unit!40015)

(assert (=> b!1207695 (= e!685859 lt!548012)))

(assert (=> b!1207695 (= lt!548012 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207695 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207696 () Bool)

(declare-fun Unit!40033 () Unit!40015)

(assert (=> b!1207696 (= e!685859 Unit!40033)))

(declare-fun b!1207697 () Bool)

(assert (=> b!1207697 (= e!685858 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133099 c!118729) b!1207695))

(assert (= (and d!133099 (not c!118729)) b!1207696))

(assert (= (and d!133099 (not res!802905)) b!1207697))

(declare-fun m!1113457 () Bool)

(assert (=> d!133099 m!1113457))

(declare-fun m!1113459 () Bool)

(assert (=> b!1207695 m!1113459))

(declare-fun m!1113461 () Bool)

(assert (=> b!1207695 m!1113461))

(assert (=> b!1207695 m!1113461))

(declare-fun m!1113463 () Bool)

(assert (=> b!1207695 m!1113463))

(assert (=> b!1207697 m!1113461))

(assert (=> b!1207697 m!1113461))

(assert (=> b!1207697 m!1113463))

(assert (=> b!1207440 d!133099))

(assert (=> b!1207488 d!133021))

(declare-fun d!133101 () Bool)

(assert (=> d!133101 (= (apply!965 lt!547882 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19213 (getValueByKey!636 (toList!8876 lt!547882) (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34144 () Bool)

(assert (= bs!34144 d!133101))

(assert (=> bs!34144 m!1113057))

(assert (=> bs!34144 m!1113387))

(assert (=> bs!34144 m!1113387))

(declare-fun m!1113465 () Bool)

(assert (=> bs!34144 m!1113465))

(assert (=> b!1207467 d!133101))

(assert (=> b!1207467 d!133011))

(declare-fun d!133103 () Bool)

(declare-fun res!802906 () Bool)

(declare-fun e!685860 () Bool)

(assert (=> d!133103 (=> res!802906 e!685860)))

(assert (=> d!133103 (= res!802906 (= (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!133103 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!685860)))

(declare-fun b!1207698 () Bool)

(declare-fun e!685861 () Bool)

(assert (=> b!1207698 (= e!685860 e!685861)))

(declare-fun res!802907 () Bool)

(assert (=> b!1207698 (=> (not res!802907) (not e!685861))))

(assert (=> b!1207698 (= res!802907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207699 () Bool)

(assert (=> b!1207699 (= e!685861 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!133103 (not res!802906)) b!1207698))

(assert (= (and b!1207698 res!802907) b!1207699))

(assert (=> d!133103 m!1113431))

(declare-fun m!1113467 () Bool)

(assert (=> b!1207699 m!1113467))

(assert (=> b!1207503 d!133103))

(assert (=> b!1207459 d!133027))

(declare-fun b!1207700 () Bool)

(declare-fun e!685863 () Bool)

(declare-fun e!685865 () Bool)

(assert (=> b!1207700 (= e!685863 e!685865)))

(declare-fun res!802910 () Bool)

(assert (=> b!1207700 (=> (not res!802910) (not e!685865))))

(declare-fun e!685862 () Bool)

(assert (=> b!1207700 (= res!802910 (not e!685862))))

(declare-fun res!802908 () Bool)

(assert (=> b!1207700 (=> (not res!802908) (not e!685862))))

(assert (=> b!1207700 (= res!802908 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207701 () Bool)

(assert (=> b!1207701 (= e!685862 (contains!6937 (ite c!118638 (Cons!26550 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) Nil!26551) Nil!26551) (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207702 () Bool)

(declare-fun e!685864 () Bool)

(assert (=> b!1207702 (= e!685865 e!685864)))

(declare-fun c!118730 () Bool)

(assert (=> b!1207702 (= c!118730 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!133105 () Bool)

(declare-fun res!802909 () Bool)

(assert (=> d!133105 (=> res!802909 e!685863)))

(assert (=> d!133105 (= res!802909 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> d!133105 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118638 (Cons!26550 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) Nil!26551) Nil!26551)) e!685863)))

(declare-fun b!1207703 () Bool)

(declare-fun call!58993 () Bool)

(assert (=> b!1207703 (= e!685864 call!58993)))

(declare-fun b!1207704 () Bool)

(assert (=> b!1207704 (= e!685864 call!58993)))

(declare-fun bm!58990 () Bool)

(assert (=> bm!58990 (= call!58993 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118730 (Cons!26550 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!118638 (Cons!26550 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) Nil!26551) Nil!26551)) (ite c!118638 (Cons!26550 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) Nil!26551) Nil!26551))))))

(assert (= (and d!133105 (not res!802909)) b!1207700))

(assert (= (and b!1207700 res!802908) b!1207701))

(assert (= (and b!1207700 res!802910) b!1207702))

(assert (= (and b!1207702 c!118730) b!1207703))

(assert (= (and b!1207702 (not c!118730)) b!1207704))

(assert (= (or b!1207703 b!1207704) bm!58990))

(assert (=> b!1207700 m!1113431))

(assert (=> b!1207700 m!1113431))

(assert (=> b!1207700 m!1113433))

(assert (=> b!1207701 m!1113431))

(assert (=> b!1207701 m!1113431))

(declare-fun m!1113469 () Bool)

(assert (=> b!1207701 m!1113469))

(assert (=> b!1207702 m!1113431))

(assert (=> b!1207702 m!1113431))

(assert (=> b!1207702 m!1113433))

(assert (=> bm!58990 m!1113431))

(declare-fun m!1113471 () Bool)

(assert (=> bm!58990 m!1113471))

(assert (=> bm!58961 d!133105))

(assert (=> b!1207458 d!133009))

(declare-fun d!133107 () Bool)

(declare-fun e!685866 () Bool)

(assert (=> d!133107 e!685866))

(declare-fun res!802911 () Bool)

(assert (=> d!133107 (=> res!802911 e!685866)))

(declare-fun lt!548015 () Bool)

(assert (=> d!133107 (= res!802911 (not lt!548015))))

(declare-fun lt!548018 () Bool)

(assert (=> d!133107 (= lt!548015 lt!548018)))

(declare-fun lt!548017 () Unit!40015)

(declare-fun e!685867 () Unit!40015)

(assert (=> d!133107 (= lt!548017 e!685867)))

(declare-fun c!118731 () Bool)

(assert (=> d!133107 (= c!118731 lt!548018)))

(assert (=> d!133107 (= lt!548018 (containsKey!592 (toList!8876 lt!547882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133107 (= (contains!6935 lt!547882 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548015)))

(declare-fun b!1207705 () Bool)

(declare-fun lt!548016 () Unit!40015)

(assert (=> b!1207705 (= e!685867 lt!548016)))

(assert (=> b!1207705 (= lt!548016 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207705 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207706 () Bool)

(declare-fun Unit!40034 () Unit!40015)

(assert (=> b!1207706 (= e!685867 Unit!40034)))

(declare-fun b!1207707 () Bool)

(assert (=> b!1207707 (= e!685866 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133107 c!118731) b!1207705))

(assert (= (and d!133107 (not c!118731)) b!1207706))

(assert (= (and d!133107 (not res!802911)) b!1207707))

(declare-fun m!1113473 () Bool)

(assert (=> d!133107 m!1113473))

(declare-fun m!1113475 () Bool)

(assert (=> b!1207705 m!1113475))

(declare-fun m!1113477 () Bool)

(assert (=> b!1207705 m!1113477))

(assert (=> b!1207705 m!1113477))

(declare-fun m!1113479 () Bool)

(assert (=> b!1207705 m!1113479))

(assert (=> b!1207707 m!1113477))

(assert (=> b!1207707 m!1113477))

(assert (=> b!1207707 m!1113479))

(assert (=> b!1207464 d!133107))

(declare-fun d!133109 () Bool)

(declare-fun e!685868 () Bool)

(assert (=> d!133109 e!685868))

(declare-fun res!802912 () Bool)

(assert (=> d!133109 (=> res!802912 e!685868)))

(declare-fun lt!548019 () Bool)

(assert (=> d!133109 (= res!802912 (not lt!548019))))

(declare-fun lt!548022 () Bool)

(assert (=> d!133109 (= lt!548019 lt!548022)))

(declare-fun lt!548021 () Unit!40015)

(declare-fun e!685869 () Unit!40015)

(assert (=> d!133109 (= lt!548021 e!685869)))

(declare-fun c!118732 () Bool)

(assert (=> d!133109 (= c!118732 lt!548022)))

(assert (=> d!133109 (= lt!548022 (containsKey!592 (toList!8876 lt!547834) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133109 (= (contains!6935 lt!547834 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548019)))

(declare-fun b!1207708 () Bool)

(declare-fun lt!548020 () Unit!40015)

(assert (=> b!1207708 (= e!685869 lt!548020)))

(assert (=> b!1207708 (= lt!548020 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547834) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1207708 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547834) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207709 () Bool)

(declare-fun Unit!40035 () Unit!40015)

(assert (=> b!1207709 (= e!685869 Unit!40035)))

(declare-fun b!1207710 () Bool)

(assert (=> b!1207710 (= e!685868 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547834) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!133109 c!118732) b!1207708))

(assert (= (and d!133109 (not c!118732)) b!1207709))

(assert (= (and d!133109 (not res!802912)) b!1207710))

(declare-fun m!1113481 () Bool)

(assert (=> d!133109 m!1113481))

(declare-fun m!1113483 () Bool)

(assert (=> b!1207708 m!1113483))

(assert (=> b!1207708 m!1112965))

(assert (=> b!1207708 m!1112965))

(declare-fun m!1113485 () Bool)

(assert (=> b!1207708 m!1113485))

(assert (=> b!1207710 m!1112965))

(assert (=> b!1207710 m!1112965))

(assert (=> b!1207710 m!1113485))

(assert (=> d!132969 d!133109))

(declare-fun b!1207711 () Bool)

(declare-fun e!685870 () Option!687)

(assert (=> b!1207711 (= e!685870 (Some!686 (_2!9887 (h!27758 lt!547833))))))

(declare-fun b!1207714 () Bool)

(declare-fun e!685871 () Option!687)

(assert (=> b!1207714 (= e!685871 None!685)))

(declare-fun b!1207713 () Bool)

(assert (=> b!1207713 (= e!685871 (getValueByKey!636 (t!39498 lt!547833) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207712 () Bool)

(assert (=> b!1207712 (= e!685870 e!685871)))

(declare-fun c!118734 () Bool)

(assert (=> b!1207712 (= c!118734 (and ((_ is Cons!26549) lt!547833) (not (= (_1!9887 (h!27758 lt!547833)) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!118733 () Bool)

(declare-fun d!133111 () Bool)

(assert (=> d!133111 (= c!118733 (and ((_ is Cons!26549) lt!547833) (= (_1!9887 (h!27758 lt!547833)) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133111 (= (getValueByKey!636 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!685870)))

(assert (= (and d!133111 c!118733) b!1207711))

(assert (= (and d!133111 (not c!118733)) b!1207712))

(assert (= (and b!1207712 c!118734) b!1207713))

(assert (= (and b!1207712 (not c!118734)) b!1207714))

(declare-fun m!1113487 () Bool)

(assert (=> b!1207713 m!1113487))

(assert (=> d!132969 d!133111))

(declare-fun d!133113 () Bool)

(assert (=> d!133113 (= (getValueByKey!636 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!686 (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548025 () Unit!40015)

(declare-fun choose!1806 (List!26553 (_ BitVec 64) V!46019) Unit!40015)

(assert (=> d!133113 (= lt!548025 (choose!1806 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!685874 () Bool)

(assert (=> d!133113 e!685874))

(declare-fun res!802917 () Bool)

(assert (=> d!133113 (=> (not res!802917) (not e!685874))))

(assert (=> d!133113 (= res!802917 (isStrictlySorted!729 lt!547833))))

(assert (=> d!133113 (= (lemmaContainsTupThenGetReturnValue!313 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548025)))

(declare-fun b!1207719 () Bool)

(declare-fun res!802918 () Bool)

(assert (=> b!1207719 (=> (not res!802918) (not e!685874))))

(assert (=> b!1207719 (= res!802918 (containsKey!592 lt!547833 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207720 () Bool)

(assert (=> b!1207720 (= e!685874 (contains!6936 lt!547833 (tuple2!19753 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!133113 res!802917) b!1207719))

(assert (= (and b!1207719 res!802918) b!1207720))

(assert (=> d!133113 m!1112959))

(declare-fun m!1113489 () Bool)

(assert (=> d!133113 m!1113489))

(declare-fun m!1113491 () Bool)

(assert (=> d!133113 m!1113491))

(declare-fun m!1113493 () Bool)

(assert (=> b!1207719 m!1113493))

(declare-fun m!1113495 () Bool)

(assert (=> b!1207720 m!1113495))

(assert (=> d!132969 d!133113))

(declare-fun c!118745 () Bool)

(declare-fun bm!58997 () Bool)

(declare-fun e!685885 () List!26553)

(declare-fun call!59001 () List!26553)

(assert (=> bm!58997 (= call!59001 ($colon$colon!610 e!685885 (ite c!118745 (h!27758 (toList!8876 lt!547743)) (tuple2!19753 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!118744 () Bool)

(assert (=> bm!58997 (= c!118744 c!118745)))

(declare-fun c!118743 () Bool)

(declare-fun b!1207741 () Bool)

(assert (=> b!1207741 (= c!118743 (and ((_ is Cons!26549) (toList!8876 lt!547743)) (bvsgt (_1!9887 (h!27758 (toList!8876 lt!547743))) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!685888 () List!26553)

(declare-fun e!685887 () List!26553)

(assert (=> b!1207741 (= e!685888 e!685887)))

(declare-fun d!133115 () Bool)

(declare-fun e!685886 () Bool)

(assert (=> d!133115 e!685886))

(declare-fun res!802924 () Bool)

(assert (=> d!133115 (=> (not res!802924) (not e!685886))))

(declare-fun lt!548028 () List!26553)

(assert (=> d!133115 (= res!802924 (isStrictlySorted!729 lt!548028))))

(declare-fun e!685889 () List!26553)

(assert (=> d!133115 (= lt!548028 e!685889)))

(assert (=> d!133115 (= c!118745 (and ((_ is Cons!26549) (toList!8876 lt!547743)) (bvslt (_1!9887 (h!27758 (toList!8876 lt!547743))) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133115 (isStrictlySorted!729 (toList!8876 lt!547743))))

(assert (=> d!133115 (= (insertStrictlySorted!406 (toList!8876 lt!547743) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548028)))

(declare-fun b!1207742 () Bool)

(assert (=> b!1207742 (= e!685885 (insertStrictlySorted!406 (t!39498 (toList!8876 lt!547743)) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207743 () Bool)

(assert (=> b!1207743 (= e!685886 (contains!6936 lt!548028 (tuple2!19753 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207744 () Bool)

(declare-fun res!802923 () Bool)

(assert (=> b!1207744 (=> (not res!802923) (not e!685886))))

(assert (=> b!1207744 (= res!802923 (containsKey!592 lt!548028 (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207745 () Bool)

(declare-fun call!59000 () List!26553)

(assert (=> b!1207745 (= e!685887 call!59000)))

(declare-fun b!1207746 () Bool)

(assert (=> b!1207746 (= e!685887 call!59000)))

(declare-fun b!1207747 () Bool)

(declare-fun c!118746 () Bool)

(assert (=> b!1207747 (= e!685885 (ite c!118746 (t!39498 (toList!8876 lt!547743)) (ite c!118743 (Cons!26549 (h!27758 (toList!8876 lt!547743)) (t!39498 (toList!8876 lt!547743))) Nil!26550)))))

(declare-fun b!1207748 () Bool)

(assert (=> b!1207748 (= e!685889 e!685888)))

(assert (=> b!1207748 (= c!118746 (and ((_ is Cons!26549) (toList!8876 lt!547743)) (= (_1!9887 (h!27758 (toList!8876 lt!547743))) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun bm!58998 () Bool)

(declare-fun call!59002 () List!26553)

(assert (=> bm!58998 (= call!59000 call!59002)))

(declare-fun b!1207749 () Bool)

(assert (=> b!1207749 (= e!685889 call!59001)))

(declare-fun b!1207750 () Bool)

(assert (=> b!1207750 (= e!685888 call!59002)))

(declare-fun bm!58999 () Bool)

(assert (=> bm!58999 (= call!59002 call!59001)))

(assert (= (and d!133115 c!118745) b!1207749))

(assert (= (and d!133115 (not c!118745)) b!1207748))

(assert (= (and b!1207748 c!118746) b!1207750))

(assert (= (and b!1207748 (not c!118746)) b!1207741))

(assert (= (and b!1207741 c!118743) b!1207745))

(assert (= (and b!1207741 (not c!118743)) b!1207746))

(assert (= (or b!1207745 b!1207746) bm!58998))

(assert (= (or b!1207750 bm!58998) bm!58999))

(assert (= (or b!1207749 bm!58999) bm!58997))

(assert (= (and bm!58997 c!118744) b!1207742))

(assert (= (and bm!58997 (not c!118744)) b!1207747))

(assert (= (and d!133115 res!802924) b!1207744))

(assert (= (and b!1207744 res!802923) b!1207743))

(declare-fun m!1113497 () Bool)

(assert (=> b!1207743 m!1113497))

(declare-fun m!1113499 () Bool)

(assert (=> d!133115 m!1113499))

(declare-fun m!1113501 () Bool)

(assert (=> d!133115 m!1113501))

(declare-fun m!1113503 () Bool)

(assert (=> b!1207744 m!1113503))

(declare-fun m!1113505 () Bool)

(assert (=> b!1207742 m!1113505))

(declare-fun m!1113507 () Bool)

(assert (=> bm!58997 m!1113507))

(assert (=> d!132969 d!133115))

(assert (=> d!132955 d!132957))

(assert (=> d!132955 d!132959))

(declare-fun d!133117 () Bool)

(assert (=> d!133117 (contains!6935 (+!3996 lt!547744 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (=> d!133117 true))

(declare-fun _$35!460 () Unit!40015)

(assert (=> d!133117 (= (choose!1801 lt!547744 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) _$35!460)))

(declare-fun bs!34145 () Bool)

(assert (= bs!34145 d!133117))

(assert (=> bs!34145 m!1112799))

(assert (=> bs!34145 m!1112799))

(assert (=> bs!34145 m!1112801))

(assert (=> d!132955 d!133117))

(declare-fun d!133119 () Bool)

(declare-fun e!685890 () Bool)

(assert (=> d!133119 e!685890))

(declare-fun res!802925 () Bool)

(assert (=> d!133119 (=> res!802925 e!685890)))

(declare-fun lt!548029 () Bool)

(assert (=> d!133119 (= res!802925 (not lt!548029))))

(declare-fun lt!548032 () Bool)

(assert (=> d!133119 (= lt!548029 lt!548032)))

(declare-fun lt!548031 () Unit!40015)

(declare-fun e!685891 () Unit!40015)

(assert (=> d!133119 (= lt!548031 e!685891)))

(declare-fun c!118747 () Bool)

(assert (=> d!133119 (= c!118747 lt!548032)))

(assert (=> d!133119 (= lt!548032 (containsKey!592 (toList!8876 lt!547744) k0!934))))

(assert (=> d!133119 (= (contains!6935 lt!547744 k0!934) lt!548029)))

(declare-fun b!1207751 () Bool)

(declare-fun lt!548030 () Unit!40015)

(assert (=> b!1207751 (= e!685891 lt!548030)))

(assert (=> b!1207751 (= lt!548030 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547744) k0!934))))

(assert (=> b!1207751 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547744) k0!934))))

(declare-fun b!1207752 () Bool)

(declare-fun Unit!40036 () Unit!40015)

(assert (=> b!1207752 (= e!685891 Unit!40036)))

(declare-fun b!1207753 () Bool)

(assert (=> b!1207753 (= e!685890 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547744) k0!934)))))

(assert (= (and d!133119 c!118747) b!1207751))

(assert (= (and d!133119 (not c!118747)) b!1207752))

(assert (= (and d!133119 (not res!802925)) b!1207753))

(declare-fun m!1113509 () Bool)

(assert (=> d!133119 m!1113509))

(declare-fun m!1113511 () Bool)

(assert (=> b!1207751 m!1113511))

(declare-fun m!1113513 () Bool)

(assert (=> b!1207751 m!1113513))

(assert (=> b!1207751 m!1113513))

(declare-fun m!1113515 () Bool)

(assert (=> b!1207751 m!1113515))

(assert (=> b!1207753 m!1113513))

(assert (=> b!1207753 m!1113513))

(assert (=> b!1207753 m!1113515))

(assert (=> d!132955 d!133119))

(declare-fun d!133121 () Bool)

(declare-fun lt!548035 () Bool)

(declare-fun content!544 (List!26554) (InoxSet (_ BitVec 64)))

(assert (=> d!133121 (= lt!548035 (select (content!544 Nil!26551) (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!685896 () Bool)

(assert (=> d!133121 (= lt!548035 e!685896)))

(declare-fun res!802931 () Bool)

(assert (=> d!133121 (=> (not res!802931) (not e!685896))))

(assert (=> d!133121 (= res!802931 ((_ is Cons!26550) Nil!26551))))

(assert (=> d!133121 (= (contains!6937 Nil!26551 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)) lt!548035)))

(declare-fun b!1207758 () Bool)

(declare-fun e!685897 () Bool)

(assert (=> b!1207758 (= e!685896 e!685897)))

(declare-fun res!802930 () Bool)

(assert (=> b!1207758 (=> res!802930 e!685897)))

(assert (=> b!1207758 (= res!802930 (= (h!27759 Nil!26551) (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207759 () Bool)

(assert (=> b!1207759 (= e!685897 (contains!6937 (t!39499 Nil!26551) (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133121 res!802931) b!1207758))

(assert (= (and b!1207758 (not res!802930)) b!1207759))

(declare-fun m!1113517 () Bool)

(assert (=> d!133121 m!1113517))

(assert (=> d!133121 m!1112973))

(declare-fun m!1113519 () Bool)

(assert (=> d!133121 m!1113519))

(assert (=> b!1207759 m!1112973))

(declare-fun m!1113521 () Bool)

(assert (=> b!1207759 m!1113521))

(assert (=> b!1207399 d!133121))

(declare-fun d!133123 () Bool)

(assert (=> d!133123 (= (apply!965 lt!547875 (select (arr!37699 _keys!1208) from!1455)) (get!19213 (getValueByKey!636 (toList!8876 lt!547875) (select (arr!37699 _keys!1208) from!1455))))))

(declare-fun bs!34146 () Bool)

(assert (= bs!34146 d!133123))

(assert (=> bs!34146 m!1112805))

(declare-fun m!1113523 () Bool)

(assert (=> bs!34146 m!1113523))

(assert (=> bs!34146 m!1113523))

(declare-fun m!1113525 () Bool)

(assert (=> bs!34146 m!1113525))

(assert (=> b!1207455 d!133123))

(declare-fun d!133125 () Bool)

(declare-fun c!118748 () Bool)

(assert (=> d!133125 (= c!118748 ((_ is ValueCellFull!14625) (select (arr!37700 _values!996) from!1455)))))

(declare-fun e!685898 () V!46019)

(assert (=> d!133125 (= (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685898)))

(declare-fun b!1207760 () Bool)

(assert (=> b!1207760 (= e!685898 (get!19211 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207761 () Bool)

(assert (=> b!1207761 (= e!685898 (get!19212 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133125 c!118748) b!1207760))

(assert (= (and d!133125 (not c!118748)) b!1207761))

(assert (=> b!1207760 m!1113035))

(assert (=> b!1207760 m!1112847))

(declare-fun m!1113527 () Bool)

(assert (=> b!1207760 m!1113527))

(assert (=> b!1207761 m!1113035))

(assert (=> b!1207761 m!1112847))

(declare-fun m!1113529 () Bool)

(assert (=> b!1207761 m!1113529))

(assert (=> b!1207455 d!133125))

(declare-fun b!1207762 () Bool)

(declare-fun lt!548037 () Unit!40015)

(declare-fun lt!548039 () Unit!40015)

(assert (=> b!1207762 (= lt!548037 lt!548039)))

(declare-fun lt!548040 () (_ BitVec 64))

(declare-fun lt!548038 () ListLongMap!17721)

(declare-fun lt!548036 () (_ BitVec 64))

(declare-fun lt!548042 () V!46019)

(assert (=> b!1207762 (not (contains!6935 (+!3996 lt!548038 (tuple2!19753 lt!548040 lt!548042)) lt!548036))))

(assert (=> b!1207762 (= lt!548039 (addStillNotContains!293 lt!548038 lt!548040 lt!548042 lt!548036))))

(assert (=> b!1207762 (= lt!548036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207762 (= lt!548042 (get!19210 (select (arr!37700 (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207762 (= lt!548040 (select (arr!37699 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!59003 () ListLongMap!17721)

(assert (=> b!1207762 (= lt!548038 call!59003)))

(declare-fun e!685900 () ListLongMap!17721)

(assert (=> b!1207762 (= e!685900 (+!3996 call!59003 (tuple2!19753 (select (arr!37699 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207763 () Bool)

(declare-fun res!802935 () Bool)

(declare-fun e!685903 () Bool)

(assert (=> b!1207763 (=> (not res!802935) (not e!685903))))

(declare-fun lt!548041 () ListLongMap!17721)

(assert (=> b!1207763 (= res!802935 (not (contains!6935 lt!548041 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207764 () Bool)

(declare-fun e!685905 () Bool)

(assert (=> b!1207764 (= e!685903 e!685905)))

(declare-fun c!118749 () Bool)

(declare-fun e!685904 () Bool)

(assert (=> b!1207764 (= c!118749 e!685904)))

(declare-fun res!802934 () Bool)

(assert (=> b!1207764 (=> (not res!802934) (not e!685904))))

(assert (=> b!1207764 (= res!802934 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)))))))

(declare-fun b!1207765 () Bool)

(declare-fun e!685899 () Bool)

(assert (=> b!1207765 (= e!685899 (isEmpty!987 lt!548041))))

(declare-fun b!1207766 () Bool)

(assert (=> b!1207766 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)))))))

(assert (=> b!1207766 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38236 (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)))))))

(declare-fun e!685901 () Bool)

(assert (=> b!1207766 (= e!685901 (= (apply!965 lt!548041 (select (arr!37699 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19210 (select (arr!37700 (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207767 () Bool)

(assert (=> b!1207767 (= e!685904 (validKeyInArray!0 (select (arr!37699 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207767 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1207768 () Bool)

(assert (=> b!1207768 (= e!685905 e!685899)))

(declare-fun c!118751 () Bool)

(assert (=> b!1207768 (= c!118751 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)))))))

(declare-fun bm!59000 () Bool)

(assert (=> bm!59000 (= call!59003 (getCurrentListMapNoExtraKeys!5310 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)) (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207769 () Bool)

(assert (=> b!1207769 (= e!685899 (= lt!548041 (getCurrentListMapNoExtraKeys!5310 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)) (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207770 () Bool)

(declare-fun e!685902 () ListLongMap!17721)

(assert (=> b!1207770 (= e!685902 e!685900)))

(declare-fun c!118750 () Bool)

(assert (=> b!1207770 (= c!118750 (validKeyInArray!0 (select (arr!37699 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207771 () Bool)

(assert (=> b!1207771 (= e!685905 e!685901)))

(assert (=> b!1207771 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)))))))

(declare-fun res!802932 () Bool)

(assert (=> b!1207771 (= res!802932 (contains!6935 lt!548041 (select (arr!37699 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207771 (=> (not res!802932) (not e!685901))))

(declare-fun d!133127 () Bool)

(assert (=> d!133127 e!685903))

(declare-fun res!802933 () Bool)

(assert (=> d!133127 (=> (not res!802933) (not e!685903))))

(assert (=> d!133127 (= res!802933 (not (contains!6935 lt!548041 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133127 (= lt!548041 e!685902)))

(declare-fun c!118752 () Bool)

(assert (=> d!133127 (= c!118752 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38235 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)))))))

(assert (=> d!133127 (validMask!0 mask!1564)))

(assert (=> d!133127 (= (getCurrentListMapNoExtraKeys!5310 (array!78120 (store (arr!37699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38235 _keys!1208)) (array!78122 (store (arr!37700 _values!996) i!673 (ValueCellFull!14625 (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38236 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548041)))

(declare-fun b!1207772 () Bool)

(assert (=> b!1207772 (= e!685902 (ListLongMap!17722 Nil!26550))))

(declare-fun b!1207773 () Bool)

(assert (=> b!1207773 (= e!685900 call!59003)))

(assert (= (and d!133127 c!118752) b!1207772))

(assert (= (and d!133127 (not c!118752)) b!1207770))

(assert (= (and b!1207770 c!118750) b!1207762))

(assert (= (and b!1207770 (not c!118750)) b!1207773))

(assert (= (or b!1207762 b!1207773) bm!59000))

(assert (= (and d!133127 res!802933) b!1207763))

(assert (= (and b!1207763 res!802935) b!1207764))

(assert (= (and b!1207764 res!802934) b!1207767))

(assert (= (and b!1207764 c!118749) b!1207771))

(assert (= (and b!1207764 (not c!118749)) b!1207768))

(assert (= (and b!1207771 res!802932) b!1207766))

(assert (= (and b!1207768 c!118751) b!1207769))

(assert (= (and b!1207768 (not c!118751)) b!1207765))

(declare-fun b_lambda!21459 () Bool)

(assert (=> (not b_lambda!21459) (not b!1207762)))

(assert (=> b!1207762 t!39497))

(declare-fun b_and!42975 () Bool)

(assert (= b_and!42973 (and (=> t!39497 result!22117) b_and!42975)))

(declare-fun b_lambda!21461 () Bool)

(assert (=> (not b_lambda!21461) (not b!1207766)))

(assert (=> b!1207766 t!39497))

(declare-fun b_and!42977 () Bool)

(assert (= b_and!42975 (and (=> t!39497 result!22117) b_and!42977)))

(declare-fun m!1113531 () Bool)

(assert (=> b!1207769 m!1113531))

(declare-fun m!1113533 () Bool)

(assert (=> d!133127 m!1113533))

(assert (=> d!133127 m!1112791))

(declare-fun m!1113535 () Bool)

(assert (=> b!1207765 m!1113535))

(declare-fun m!1113537 () Bool)

(assert (=> b!1207763 m!1113537))

(assert (=> b!1207766 m!1112847))

(declare-fun m!1113539 () Bool)

(assert (=> b!1207766 m!1113539))

(assert (=> b!1207766 m!1113539))

(declare-fun m!1113541 () Bool)

(assert (=> b!1207766 m!1113541))

(declare-fun m!1113543 () Bool)

(assert (=> b!1207766 m!1113543))

(assert (=> b!1207766 m!1112847))

(declare-fun m!1113545 () Bool)

(assert (=> b!1207766 m!1113545))

(assert (=> b!1207766 m!1113543))

(assert (=> b!1207767 m!1113539))

(assert (=> b!1207767 m!1113539))

(declare-fun m!1113547 () Bool)

(assert (=> b!1207767 m!1113547))

(assert (=> b!1207770 m!1113539))

(assert (=> b!1207770 m!1113539))

(assert (=> b!1207770 m!1113547))

(assert (=> bm!59000 m!1113531))

(declare-fun m!1113549 () Bool)

(assert (=> b!1207762 m!1113549))

(declare-fun m!1113551 () Bool)

(assert (=> b!1207762 m!1113551))

(declare-fun m!1113553 () Bool)

(assert (=> b!1207762 m!1113553))

(assert (=> b!1207762 m!1112847))

(assert (=> b!1207762 m!1113539))

(declare-fun m!1113555 () Bool)

(assert (=> b!1207762 m!1113555))

(assert (=> b!1207762 m!1113543))

(assert (=> b!1207762 m!1112847))

(assert (=> b!1207762 m!1113545))

(assert (=> b!1207762 m!1113543))

(assert (=> b!1207762 m!1113549))

(assert (=> b!1207771 m!1113539))

(assert (=> b!1207771 m!1113539))

(declare-fun m!1113557 () Bool)

(assert (=> b!1207771 m!1113557))

(assert (=> bm!58978 d!133127))

(declare-fun d!133129 () Bool)

(declare-fun e!685906 () Bool)

(assert (=> d!133129 e!685906))

(declare-fun res!802936 () Bool)

(assert (=> d!133129 (=> res!802936 e!685906)))

(declare-fun lt!548043 () Bool)

(assert (=> d!133129 (= res!802936 (not lt!548043))))

(declare-fun lt!548046 () Bool)

(assert (=> d!133129 (= lt!548043 lt!548046)))

(declare-fun lt!548045 () Unit!40015)

(declare-fun e!685907 () Unit!40015)

(assert (=> d!133129 (= lt!548045 e!685907)))

(declare-fun c!118753 () Bool)

(assert (=> d!133129 (= c!118753 lt!548046)))

(assert (=> d!133129 (= lt!548046 (containsKey!592 (toList!8876 lt!547824) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133129 (= (contains!6935 lt!547824 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548043)))

(declare-fun b!1207774 () Bool)

(declare-fun lt!548044 () Unit!40015)

(assert (=> b!1207774 (= e!685907 lt!548044)))

(assert (=> b!1207774 (= lt!548044 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547824) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> b!1207774 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547824) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207775 () Bool)

(declare-fun Unit!40037 () Unit!40015)

(assert (=> b!1207775 (= e!685907 Unit!40037)))

(declare-fun b!1207776 () Bool)

(assert (=> b!1207776 (= e!685906 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547824) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133129 c!118753) b!1207774))

(assert (= (and d!133129 (not c!118753)) b!1207775))

(assert (= (and d!133129 (not res!802936)) b!1207776))

(declare-fun m!1113559 () Bool)

(assert (=> d!133129 m!1113559))

(declare-fun m!1113561 () Bool)

(assert (=> b!1207774 m!1113561))

(assert (=> b!1207774 m!1112943))

(assert (=> b!1207774 m!1112943))

(declare-fun m!1113563 () Bool)

(assert (=> b!1207774 m!1113563))

(assert (=> b!1207776 m!1112943))

(assert (=> b!1207776 m!1112943))

(assert (=> b!1207776 m!1113563))

(assert (=> d!132959 d!133129))

(declare-fun b!1207777 () Bool)

(declare-fun e!685908 () Option!687)

(assert (=> b!1207777 (= e!685908 (Some!686 (_2!9887 (h!27758 lt!547823))))))

(declare-fun b!1207780 () Bool)

(declare-fun e!685909 () Option!687)

(assert (=> b!1207780 (= e!685909 None!685)))

(declare-fun b!1207779 () Bool)

(assert (=> b!1207779 (= e!685909 (getValueByKey!636 (t!39498 lt!547823) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207778 () Bool)

(assert (=> b!1207778 (= e!685908 e!685909)))

(declare-fun c!118755 () Bool)

(assert (=> b!1207778 (= c!118755 (and ((_ is Cons!26549) lt!547823) (not (= (_1!9887 (h!27758 lt!547823)) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun d!133131 () Bool)

(declare-fun c!118754 () Bool)

(assert (=> d!133131 (= c!118754 (and ((_ is Cons!26549) lt!547823) (= (_1!9887 (h!27758 lt!547823)) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133131 (= (getValueByKey!636 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!685908)))

(assert (= (and d!133131 c!118754) b!1207777))

(assert (= (and d!133131 (not c!118754)) b!1207778))

(assert (= (and b!1207778 c!118755) b!1207779))

(assert (= (and b!1207778 (not c!118755)) b!1207780))

(declare-fun m!1113565 () Bool)

(assert (=> b!1207779 m!1113565))

(assert (=> d!132959 d!133131))

(declare-fun d!133133 () Bool)

(assert (=> d!133133 (= (getValueByKey!636 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!686 (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548047 () Unit!40015)

(assert (=> d!133133 (= lt!548047 (choose!1806 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!685910 () Bool)

(assert (=> d!133133 e!685910))

(declare-fun res!802937 () Bool)

(assert (=> d!133133 (=> (not res!802937) (not e!685910))))

(assert (=> d!133133 (= res!802937 (isStrictlySorted!729 lt!547823))))

(assert (=> d!133133 (= (lemmaContainsTupThenGetReturnValue!313 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548047)))

(declare-fun b!1207781 () Bool)

(declare-fun res!802938 () Bool)

(assert (=> b!1207781 (=> (not res!802938) (not e!685910))))

(assert (=> b!1207781 (= res!802938 (containsKey!592 lt!547823 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207782 () Bool)

(assert (=> b!1207782 (= e!685910 (contains!6936 lt!547823 (tuple2!19753 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133133 res!802937) b!1207781))

(assert (= (and b!1207781 res!802938) b!1207782))

(assert (=> d!133133 m!1112937))

(declare-fun m!1113567 () Bool)

(assert (=> d!133133 m!1113567))

(declare-fun m!1113569 () Bool)

(assert (=> d!133133 m!1113569))

(declare-fun m!1113571 () Bool)

(assert (=> b!1207781 m!1113571))

(declare-fun m!1113573 () Bool)

(assert (=> b!1207782 m!1113573))

(assert (=> d!132959 d!133133))

(declare-fun call!59005 () List!26553)

(declare-fun e!685911 () List!26553)

(declare-fun bm!59001 () Bool)

(declare-fun c!118758 () Bool)

(assert (=> bm!59001 (= call!59005 ($colon$colon!610 e!685911 (ite c!118758 (h!27758 (toList!8876 lt!547744)) (tuple2!19753 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!118757 () Bool)

(assert (=> bm!59001 (= c!118757 c!118758)))

(declare-fun b!1207783 () Bool)

(declare-fun c!118756 () Bool)

(assert (=> b!1207783 (= c!118756 (and ((_ is Cons!26549) (toList!8876 lt!547744)) (bvsgt (_1!9887 (h!27758 (toList!8876 lt!547744))) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!685914 () List!26553)

(declare-fun e!685913 () List!26553)

(assert (=> b!1207783 (= e!685914 e!685913)))

(declare-fun d!133135 () Bool)

(declare-fun e!685912 () Bool)

(assert (=> d!133135 e!685912))

(declare-fun res!802940 () Bool)

(assert (=> d!133135 (=> (not res!802940) (not e!685912))))

(declare-fun lt!548048 () List!26553)

(assert (=> d!133135 (= res!802940 (isStrictlySorted!729 lt!548048))))

(declare-fun e!685915 () List!26553)

(assert (=> d!133135 (= lt!548048 e!685915)))

(assert (=> d!133135 (= c!118758 (and ((_ is Cons!26549) (toList!8876 lt!547744)) (bvslt (_1!9887 (h!27758 (toList!8876 lt!547744))) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133135 (isStrictlySorted!729 (toList!8876 lt!547744))))

(assert (=> d!133135 (= (insertStrictlySorted!406 (toList!8876 lt!547744) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548048)))

(declare-fun b!1207784 () Bool)

(assert (=> b!1207784 (= e!685911 (insertStrictlySorted!406 (t!39498 (toList!8876 lt!547744)) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207785 () Bool)

(assert (=> b!1207785 (= e!685912 (contains!6936 lt!548048 (tuple2!19753 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207786 () Bool)

(declare-fun res!802939 () Bool)

(assert (=> b!1207786 (=> (not res!802939) (not e!685912))))

(assert (=> b!1207786 (= res!802939 (containsKey!592 lt!548048 (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207787 () Bool)

(declare-fun call!59004 () List!26553)

(assert (=> b!1207787 (= e!685913 call!59004)))

(declare-fun b!1207788 () Bool)

(assert (=> b!1207788 (= e!685913 call!59004)))

(declare-fun b!1207789 () Bool)

(declare-fun c!118759 () Bool)

(assert (=> b!1207789 (= e!685911 (ite c!118759 (t!39498 (toList!8876 lt!547744)) (ite c!118756 (Cons!26549 (h!27758 (toList!8876 lt!547744)) (t!39498 (toList!8876 lt!547744))) Nil!26550)))))

(declare-fun b!1207790 () Bool)

(assert (=> b!1207790 (= e!685915 e!685914)))

(assert (=> b!1207790 (= c!118759 (and ((_ is Cons!26549) (toList!8876 lt!547744)) (= (_1!9887 (h!27758 (toList!8876 lt!547744))) (_1!9887 (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!59002 () Bool)

(declare-fun call!59006 () List!26553)

(assert (=> bm!59002 (= call!59004 call!59006)))

(declare-fun b!1207791 () Bool)

(assert (=> b!1207791 (= e!685915 call!59005)))

(declare-fun b!1207792 () Bool)

(assert (=> b!1207792 (= e!685914 call!59006)))

(declare-fun bm!59003 () Bool)

(assert (=> bm!59003 (= call!59006 call!59005)))

(assert (= (and d!133135 c!118758) b!1207791))

(assert (= (and d!133135 (not c!118758)) b!1207790))

(assert (= (and b!1207790 c!118759) b!1207792))

(assert (= (and b!1207790 (not c!118759)) b!1207783))

(assert (= (and b!1207783 c!118756) b!1207787))

(assert (= (and b!1207783 (not c!118756)) b!1207788))

(assert (= (or b!1207787 b!1207788) bm!59002))

(assert (= (or b!1207792 bm!59002) bm!59003))

(assert (= (or b!1207791 bm!59003) bm!59001))

(assert (= (and bm!59001 c!118757) b!1207784))

(assert (= (and bm!59001 (not c!118757)) b!1207789))

(assert (= (and d!133135 res!802940) b!1207786))

(assert (= (and b!1207786 res!802939) b!1207785))

(declare-fun m!1113575 () Bool)

(assert (=> b!1207785 m!1113575))

(declare-fun m!1113577 () Bool)

(assert (=> d!133135 m!1113577))

(declare-fun m!1113579 () Bool)

(assert (=> d!133135 m!1113579))

(declare-fun m!1113581 () Bool)

(assert (=> b!1207786 m!1113581))

(declare-fun m!1113583 () Bool)

(assert (=> b!1207784 m!1113583))

(declare-fun m!1113585 () Bool)

(assert (=> bm!59001 m!1113585))

(assert (=> d!132959 d!133135))

(declare-fun d!133137 () Bool)

(declare-fun e!685916 () Bool)

(assert (=> d!133137 e!685916))

(declare-fun res!802941 () Bool)

(assert (=> d!133137 (=> res!802941 e!685916)))

(declare-fun lt!548049 () Bool)

(assert (=> d!133137 (= res!802941 (not lt!548049))))

(declare-fun lt!548052 () Bool)

(assert (=> d!133137 (= lt!548049 lt!548052)))

(declare-fun lt!548051 () Unit!40015)

(declare-fun e!685917 () Unit!40015)

(assert (=> d!133137 (= lt!548051 e!685917)))

(declare-fun c!118760 () Bool)

(assert (=> d!133137 (= c!118760 lt!548052)))

(assert (=> d!133137 (= lt!548052 (containsKey!592 (toList!8876 lt!547882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133137 (= (contains!6935 lt!547882 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548049)))

(declare-fun b!1207793 () Bool)

(declare-fun lt!548050 () Unit!40015)

(assert (=> b!1207793 (= e!685917 lt!548050)))

(assert (=> b!1207793 (= lt!548050 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207793 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207794 () Bool)

(declare-fun Unit!40038 () Unit!40015)

(assert (=> b!1207794 (= e!685917 Unit!40038)))

(declare-fun b!1207795 () Bool)

(assert (=> b!1207795 (= e!685916 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133137 c!118760) b!1207793))

(assert (= (and d!133137 (not c!118760)) b!1207794))

(assert (= (and d!133137 (not res!802941)) b!1207795))

(declare-fun m!1113587 () Bool)

(assert (=> d!133137 m!1113587))

(declare-fun m!1113589 () Bool)

(assert (=> b!1207793 m!1113589))

(declare-fun m!1113591 () Bool)

(assert (=> b!1207793 m!1113591))

(assert (=> b!1207793 m!1113591))

(declare-fun m!1113593 () Bool)

(assert (=> b!1207793 m!1113593))

(assert (=> b!1207795 m!1113591))

(assert (=> b!1207795 m!1113591))

(assert (=> b!1207795 m!1113593))

(assert (=> d!132983 d!133137))

(assert (=> d!132983 d!132961))

(declare-fun b!1207796 () Bool)

(declare-fun e!685918 () Bool)

(declare-fun call!59007 () Bool)

(assert (=> b!1207796 (= e!685918 call!59007)))

(declare-fun b!1207797 () Bool)

(declare-fun e!685920 () Bool)

(declare-fun e!685919 () Bool)

(assert (=> b!1207797 (= e!685920 e!685919)))

(declare-fun c!118761 () Bool)

(assert (=> b!1207797 (= c!118761 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207798 () Bool)

(assert (=> b!1207798 (= e!685919 e!685918)))

(declare-fun lt!548053 () (_ BitVec 64))

(assert (=> b!1207798 (= lt!548053 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!548054 () Unit!40015)

(assert (=> b!1207798 (= lt!548054 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547751 lt!548053 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1207798 (arrayContainsKey!0 lt!547751 lt!548053 #b00000000000000000000000000000000)))

(declare-fun lt!548055 () Unit!40015)

(assert (=> b!1207798 (= lt!548055 lt!548054)))

(declare-fun res!802942 () Bool)

(assert (=> b!1207798 (= res!802942 (= (seekEntryOrOpen!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!547751 mask!1564) (Found!9938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1207798 (=> (not res!802942) (not e!685918))))

(declare-fun bm!59004 () Bool)

(assert (=> bm!59004 (= call!59007 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!547751 mask!1564))))

(declare-fun d!133139 () Bool)

(declare-fun res!802943 () Bool)

(assert (=> d!133139 (=> res!802943 e!685920)))

(assert (=> d!133139 (= res!802943 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(assert (=> d!133139 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!547751 mask!1564) e!685920)))

(declare-fun b!1207799 () Bool)

(assert (=> b!1207799 (= e!685919 call!59007)))

(assert (= (and d!133139 (not res!802943)) b!1207797))

(assert (= (and b!1207797 c!118761) b!1207798))

(assert (= (and b!1207797 (not c!118761)) b!1207799))

(assert (= (and b!1207798 res!802942) b!1207796))

(assert (= (or b!1207796 b!1207799) bm!59004))

(declare-fun m!1113595 () Bool)

(assert (=> b!1207797 m!1113595))

(assert (=> b!1207797 m!1113595))

(declare-fun m!1113597 () Bool)

(assert (=> b!1207797 m!1113597))

(assert (=> b!1207798 m!1113595))

(declare-fun m!1113599 () Bool)

(assert (=> b!1207798 m!1113599))

(declare-fun m!1113601 () Bool)

(assert (=> b!1207798 m!1113601))

(assert (=> b!1207798 m!1113595))

(declare-fun m!1113603 () Bool)

(assert (=> b!1207798 m!1113603))

(declare-fun m!1113605 () Bool)

(assert (=> bm!59004 m!1113605))

(assert (=> bm!58964 d!133139))

(declare-fun d!133141 () Bool)

(assert (=> d!133141 (= (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207483 d!133141))

(assert (=> bm!58977 d!132985))

(assert (=> b!1207412 d!133081))

(assert (=> bm!58970 d!133035))

(declare-fun d!133143 () Bool)

(declare-fun e!685921 () Bool)

(assert (=> d!133143 e!685921))

(declare-fun res!802944 () Bool)

(assert (=> d!133143 (=> (not res!802944) (not e!685921))))

(declare-fun lt!548057 () ListLongMap!17721)

(assert (=> d!133143 (= res!802944 (contains!6935 lt!548057 (_1!9887 (tuple2!19753 lt!547874 lt!547876))))))

(declare-fun lt!548056 () List!26553)

(assert (=> d!133143 (= lt!548057 (ListLongMap!17722 lt!548056))))

(declare-fun lt!548059 () Unit!40015)

(declare-fun lt!548058 () Unit!40015)

(assert (=> d!133143 (= lt!548059 lt!548058)))

(assert (=> d!133143 (= (getValueByKey!636 lt!548056 (_1!9887 (tuple2!19753 lt!547874 lt!547876))) (Some!686 (_2!9887 (tuple2!19753 lt!547874 lt!547876))))))

(assert (=> d!133143 (= lt!548058 (lemmaContainsTupThenGetReturnValue!313 lt!548056 (_1!9887 (tuple2!19753 lt!547874 lt!547876)) (_2!9887 (tuple2!19753 lt!547874 lt!547876))))))

(assert (=> d!133143 (= lt!548056 (insertStrictlySorted!406 (toList!8876 lt!547872) (_1!9887 (tuple2!19753 lt!547874 lt!547876)) (_2!9887 (tuple2!19753 lt!547874 lt!547876))))))

(assert (=> d!133143 (= (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876)) lt!548057)))

(declare-fun b!1207800 () Bool)

(declare-fun res!802945 () Bool)

(assert (=> b!1207800 (=> (not res!802945) (not e!685921))))

(assert (=> b!1207800 (= res!802945 (= (getValueByKey!636 (toList!8876 lt!548057) (_1!9887 (tuple2!19753 lt!547874 lt!547876))) (Some!686 (_2!9887 (tuple2!19753 lt!547874 lt!547876)))))))

(declare-fun b!1207801 () Bool)

(assert (=> b!1207801 (= e!685921 (contains!6936 (toList!8876 lt!548057) (tuple2!19753 lt!547874 lt!547876)))))

(assert (= (and d!133143 res!802944) b!1207800))

(assert (= (and b!1207800 res!802945) b!1207801))

(declare-fun m!1113607 () Bool)

(assert (=> d!133143 m!1113607))

(declare-fun m!1113609 () Bool)

(assert (=> d!133143 m!1113609))

(declare-fun m!1113611 () Bool)

(assert (=> d!133143 m!1113611))

(declare-fun m!1113613 () Bool)

(assert (=> d!133143 m!1113613))

(declare-fun m!1113615 () Bool)

(assert (=> b!1207800 m!1113615))

(declare-fun m!1113617 () Bool)

(assert (=> b!1207801 m!1113617))

(assert (=> b!1207451 d!133143))

(assert (=> b!1207451 d!133125))

(declare-fun d!133145 () Bool)

(declare-fun e!685922 () Bool)

(assert (=> d!133145 e!685922))

(declare-fun res!802946 () Bool)

(assert (=> d!133145 (=> (not res!802946) (not e!685922))))

(declare-fun lt!548061 () ListLongMap!17721)

(assert (=> d!133145 (= res!802946 (contains!6935 lt!548061 (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548060 () List!26553)

(assert (=> d!133145 (= lt!548061 (ListLongMap!17722 lt!548060))))

(declare-fun lt!548063 () Unit!40015)

(declare-fun lt!548062 () Unit!40015)

(assert (=> d!133145 (= lt!548063 lt!548062)))

(assert (=> d!133145 (= (getValueByKey!636 lt!548060 (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133145 (= lt!548062 (lemmaContainsTupThenGetReturnValue!313 lt!548060 (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133145 (= lt!548060 (insertStrictlySorted!406 (toList!8876 call!58971) (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133145 (= (+!3996 call!58971 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548061)))

(declare-fun b!1207802 () Bool)

(declare-fun res!802947 () Bool)

(assert (=> b!1207802 (=> (not res!802947) (not e!685922))))

(assert (=> b!1207802 (= res!802947 (= (getValueByKey!636 (toList!8876 lt!548061) (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207803 () Bool)

(assert (=> b!1207803 (= e!685922 (contains!6936 (toList!8876 lt!548061) (tuple2!19753 (select (arr!37699 _keys!1208) from!1455) (get!19210 (select (arr!37700 _values!996) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133145 res!802946) b!1207802))

(assert (= (and b!1207802 res!802947) b!1207803))

(declare-fun m!1113619 () Bool)

(assert (=> d!133145 m!1113619))

(declare-fun m!1113621 () Bool)

(assert (=> d!133145 m!1113621))

(declare-fun m!1113623 () Bool)

(assert (=> d!133145 m!1113623))

(declare-fun m!1113625 () Bool)

(assert (=> d!133145 m!1113625))

(declare-fun m!1113627 () Bool)

(assert (=> b!1207802 m!1113627))

(declare-fun m!1113629 () Bool)

(assert (=> b!1207803 m!1113629))

(assert (=> b!1207451 d!133145))

(declare-fun d!133147 () Bool)

(assert (=> d!133147 (not (contains!6935 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876)) lt!547870))))

(declare-fun lt!548064 () Unit!40015)

(assert (=> d!133147 (= lt!548064 (choose!1804 lt!547872 lt!547874 lt!547876 lt!547870))))

(declare-fun e!685923 () Bool)

(assert (=> d!133147 e!685923))

(declare-fun res!802948 () Bool)

(assert (=> d!133147 (=> (not res!802948) (not e!685923))))

(assert (=> d!133147 (= res!802948 (not (contains!6935 lt!547872 lt!547870)))))

(assert (=> d!133147 (= (addStillNotContains!293 lt!547872 lt!547874 lt!547876 lt!547870) lt!548064)))

(declare-fun b!1207804 () Bool)

(assert (=> b!1207804 (= e!685923 (not (= lt!547874 lt!547870)))))

(assert (= (and d!133147 res!802948) b!1207804))

(assert (=> d!133147 m!1113039))

(assert (=> d!133147 m!1113039))

(assert (=> d!133147 m!1113041))

(declare-fun m!1113631 () Bool)

(assert (=> d!133147 m!1113631))

(declare-fun m!1113633 () Bool)

(assert (=> d!133147 m!1113633))

(assert (=> b!1207451 d!133147))

(declare-fun d!133149 () Bool)

(declare-fun e!685924 () Bool)

(assert (=> d!133149 e!685924))

(declare-fun res!802949 () Bool)

(assert (=> d!133149 (=> res!802949 e!685924)))

(declare-fun lt!548065 () Bool)

(assert (=> d!133149 (= res!802949 (not lt!548065))))

(declare-fun lt!548068 () Bool)

(assert (=> d!133149 (= lt!548065 lt!548068)))

(declare-fun lt!548067 () Unit!40015)

(declare-fun e!685925 () Unit!40015)

(assert (=> d!133149 (= lt!548067 e!685925)))

(declare-fun c!118762 () Bool)

(assert (=> d!133149 (= c!118762 lt!548068)))

(assert (=> d!133149 (= lt!548068 (containsKey!592 (toList!8876 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876))) lt!547870))))

(assert (=> d!133149 (= (contains!6935 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876)) lt!547870) lt!548065)))

(declare-fun b!1207805 () Bool)

(declare-fun lt!548066 () Unit!40015)

(assert (=> b!1207805 (= e!685925 lt!548066)))

(assert (=> b!1207805 (= lt!548066 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876))) lt!547870))))

(assert (=> b!1207805 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876))) lt!547870))))

(declare-fun b!1207806 () Bool)

(declare-fun Unit!40039 () Unit!40015)

(assert (=> b!1207806 (= e!685925 Unit!40039)))

(declare-fun b!1207807 () Bool)

(assert (=> b!1207807 (= e!685924 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547872 (tuple2!19753 lt!547874 lt!547876))) lt!547870)))))

(assert (= (and d!133149 c!118762) b!1207805))

(assert (= (and d!133149 (not c!118762)) b!1207806))

(assert (= (and d!133149 (not res!802949)) b!1207807))

(declare-fun m!1113635 () Bool)

(assert (=> d!133149 m!1113635))

(declare-fun m!1113637 () Bool)

(assert (=> b!1207805 m!1113637))

(declare-fun m!1113639 () Bool)

(assert (=> b!1207805 m!1113639))

(assert (=> b!1207805 m!1113639))

(declare-fun m!1113641 () Bool)

(assert (=> b!1207805 m!1113641))

(assert (=> b!1207807 m!1113639))

(assert (=> b!1207807 m!1113639))

(assert (=> b!1207807 m!1113641))

(assert (=> b!1207451 d!133149))

(assert (=> b!1207480 d!133141))

(assert (=> b!1207447 d!133073))

(declare-fun d!133151 () Bool)

(declare-fun e!685926 () Bool)

(assert (=> d!133151 e!685926))

(declare-fun res!802950 () Bool)

(assert (=> d!133151 (=> res!802950 e!685926)))

(declare-fun lt!548069 () Bool)

(assert (=> d!133151 (= res!802950 (not lt!548069))))

(declare-fun lt!548072 () Bool)

(assert (=> d!133151 (= lt!548069 lt!548072)))

(declare-fun lt!548071 () Unit!40015)

(declare-fun e!685927 () Unit!40015)

(assert (=> d!133151 (= lt!548071 e!685927)))

(declare-fun c!118763 () Bool)

(assert (=> d!133151 (= c!118763 lt!548072)))

(assert (=> d!133151 (= lt!548072 (containsKey!592 (toList!8876 lt!547875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133151 (= (contains!6935 lt!547875 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548069)))

(declare-fun b!1207808 () Bool)

(declare-fun lt!548070 () Unit!40015)

(assert (=> b!1207808 (= e!685927 lt!548070)))

(assert (=> b!1207808 (= lt!548070 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207808 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207809 () Bool)

(declare-fun Unit!40040 () Unit!40015)

(assert (=> b!1207809 (= e!685927 Unit!40040)))

(declare-fun b!1207810 () Bool)

(assert (=> b!1207810 (= e!685926 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133151 c!118763) b!1207808))

(assert (= (and d!133151 (not c!118763)) b!1207809))

(assert (= (and d!133151 (not res!802950)) b!1207810))

(declare-fun m!1113643 () Bool)

(assert (=> d!133151 m!1113643))

(declare-fun m!1113645 () Bool)

(assert (=> b!1207808 m!1113645))

(declare-fun m!1113647 () Bool)

(assert (=> b!1207808 m!1113647))

(assert (=> b!1207808 m!1113647))

(declare-fun m!1113649 () Bool)

(assert (=> b!1207808 m!1113649))

(assert (=> b!1207810 m!1113647))

(assert (=> b!1207810 m!1113647))

(assert (=> b!1207810 m!1113649))

(assert (=> d!132981 d!133151))

(assert (=> d!132981 d!132961))

(declare-fun b!1207811 () Bool)

(declare-fun e!685929 () Bool)

(declare-fun e!685931 () Bool)

(assert (=> b!1207811 (= e!685929 e!685931)))

(declare-fun res!802953 () Bool)

(assert (=> b!1207811 (=> (not res!802953) (not e!685931))))

(declare-fun e!685928 () Bool)

(assert (=> b!1207811 (= res!802953 (not e!685928))))

(declare-fun res!802951 () Bool)

(assert (=> b!1207811 (=> (not res!802951) (not e!685928))))

(assert (=> b!1207811 (= res!802951 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207812 () Bool)

(assert (=> b!1207812 (= e!685928 (contains!6937 (ite c!118634 (Cons!26550 (select (arr!37699 _keys!1208) from!1455) Nil!26551) Nil!26551) (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207813 () Bool)

(declare-fun e!685930 () Bool)

(assert (=> b!1207813 (= e!685931 e!685930)))

(declare-fun c!118764 () Bool)

(assert (=> b!1207813 (= c!118764 (validKeyInArray!0 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun d!133153 () Bool)

(declare-fun res!802952 () Bool)

(assert (=> d!133153 (=> res!802952 e!685929)))

(assert (=> d!133153 (= res!802952 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(assert (=> d!133153 (= (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118634 (Cons!26550 (select (arr!37699 _keys!1208) from!1455) Nil!26551) Nil!26551)) e!685929)))

(declare-fun b!1207814 () Bool)

(declare-fun call!59008 () Bool)

(assert (=> b!1207814 (= e!685930 call!59008)))

(declare-fun b!1207815 () Bool)

(assert (=> b!1207815 (= e!685930 call!59008)))

(declare-fun bm!59005 () Bool)

(assert (=> bm!59005 (= call!59008 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118764 (Cons!26550 (select (arr!37699 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (ite c!118634 (Cons!26550 (select (arr!37699 _keys!1208) from!1455) Nil!26551) Nil!26551)) (ite c!118634 (Cons!26550 (select (arr!37699 _keys!1208) from!1455) Nil!26551) Nil!26551))))))

(assert (= (and d!133153 (not res!802952)) b!1207811))

(assert (= (and b!1207811 res!802951) b!1207812))

(assert (= (and b!1207811 res!802953) b!1207813))

(assert (= (and b!1207813 c!118764) b!1207814))

(assert (= (and b!1207813 (not c!118764)) b!1207815))

(assert (= (or b!1207814 b!1207815) bm!59005))

(assert (=> b!1207811 m!1113157))

(assert (=> b!1207811 m!1113157))

(assert (=> b!1207811 m!1113165))

(assert (=> b!1207812 m!1113157))

(assert (=> b!1207812 m!1113157))

(declare-fun m!1113651 () Bool)

(assert (=> b!1207812 m!1113651))

(assert (=> b!1207813 m!1113157))

(assert (=> b!1207813 m!1113157))

(assert (=> b!1207813 m!1113165))

(assert (=> bm!59005 m!1113157))

(declare-fun m!1113653 () Bool)

(assert (=> bm!59005 m!1113653))

(assert (=> bm!58960 d!133153))

(declare-fun b!1207816 () Bool)

(declare-fun e!685933 () Bool)

(declare-fun e!685935 () Bool)

(assert (=> b!1207816 (= e!685933 e!685935)))

(declare-fun res!802956 () Bool)

(assert (=> b!1207816 (=> (not res!802956) (not e!685935))))

(declare-fun e!685932 () Bool)

(assert (=> b!1207816 (= res!802956 (not e!685932))))

(declare-fun res!802954 () Bool)

(assert (=> b!1207816 (=> (not res!802954) (not e!685932))))

(assert (=> b!1207816 (= res!802954 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207817 () Bool)

(assert (=> b!1207817 (= e!685932 (contains!6937 (ite c!118669 (Cons!26550 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) Nil!26551) Nil!26551) (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207818 () Bool)

(declare-fun e!685934 () Bool)

(assert (=> b!1207818 (= e!685935 e!685934)))

(declare-fun c!118765 () Bool)

(assert (=> b!1207818 (= c!118765 (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!133155 () Bool)

(declare-fun res!802955 () Bool)

(assert (=> d!133155 (=> res!802955 e!685933)))

(assert (=> d!133155 (= res!802955 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 lt!547751)))))

(assert (=> d!133155 (= (arrayNoDuplicates!0 lt!547751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118669 (Cons!26550 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) Nil!26551) Nil!26551)) e!685933)))

(declare-fun b!1207819 () Bool)

(declare-fun call!59009 () Bool)

(assert (=> b!1207819 (= e!685934 call!59009)))

(declare-fun b!1207820 () Bool)

(assert (=> b!1207820 (= e!685934 call!59009)))

(declare-fun bm!59006 () Bool)

(assert (=> bm!59006 (= call!59009 (arrayNoDuplicates!0 lt!547751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118765 (Cons!26550 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!118669 (Cons!26550 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) Nil!26551) Nil!26551)) (ite c!118669 (Cons!26550 (select (arr!37699 lt!547751) #b00000000000000000000000000000000) Nil!26551) Nil!26551))))))

(assert (= (and d!133155 (not res!802955)) b!1207816))

(assert (= (and b!1207816 res!802954) b!1207817))

(assert (= (and b!1207816 res!802956) b!1207818))

(assert (= (and b!1207818 c!118765) b!1207819))

(assert (= (and b!1207818 (not c!118765)) b!1207820))

(assert (= (or b!1207819 b!1207820) bm!59006))

(assert (=> b!1207816 m!1113595))

(assert (=> b!1207816 m!1113595))

(assert (=> b!1207816 m!1113597))

(assert (=> b!1207817 m!1113595))

(assert (=> b!1207817 m!1113595))

(declare-fun m!1113655 () Bool)

(assert (=> b!1207817 m!1113655))

(assert (=> b!1207818 m!1113595))

(assert (=> b!1207818 m!1113595))

(assert (=> b!1207818 m!1113597))

(assert (=> bm!59006 m!1113595))

(declare-fun m!1113657 () Bool)

(assert (=> bm!59006 m!1113657))

(assert (=> bm!58972 d!133155))

(declare-fun d!133157 () Bool)

(declare-fun e!685938 () Bool)

(assert (=> d!133157 e!685938))

(declare-fun c!118768 () Bool)

(assert (=> d!133157 (= c!118768 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!133157 true))

(declare-fun _$29!189 () Unit!40015)

(assert (=> d!133157 (= (choose!1802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$29!189)))

(declare-fun b!1207825 () Bool)

(assert (=> b!1207825 (= e!685938 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207826 () Bool)

(assert (=> b!1207826 (= e!685938 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133157 c!118768) b!1207825))

(assert (= (and d!133157 (not c!118768)) b!1207826))

(assert (=> b!1207825 m!1112815))

(assert (=> d!132967 d!133157))

(assert (=> d!132967 d!132961))

(declare-fun d!133159 () Bool)

(declare-fun e!685939 () Bool)

(assert (=> d!133159 e!685939))

(declare-fun res!802957 () Bool)

(assert (=> d!133159 (=> res!802957 e!685939)))

(declare-fun lt!548073 () Bool)

(assert (=> d!133159 (= res!802957 (not lt!548073))))

(declare-fun lt!548076 () Bool)

(assert (=> d!133159 (= lt!548073 lt!548076)))

(declare-fun lt!548075 () Unit!40015)

(declare-fun e!685940 () Unit!40015)

(assert (=> d!133159 (= lt!548075 e!685940)))

(declare-fun c!118769 () Bool)

(assert (=> d!133159 (= c!118769 lt!548076)))

(assert (=> d!133159 (= lt!548076 (containsKey!592 (toList!8876 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890))) lt!547884))))

(assert (=> d!133159 (= (contains!6935 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890)) lt!547884) lt!548073)))

(declare-fun b!1207827 () Bool)

(declare-fun lt!548074 () Unit!40015)

(assert (=> b!1207827 (= e!685940 lt!548074)))

(assert (=> b!1207827 (= lt!548074 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890))) lt!547884))))

(assert (=> b!1207827 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890))) lt!547884))))

(declare-fun b!1207828 () Bool)

(declare-fun Unit!40041 () Unit!40015)

(assert (=> b!1207828 (= e!685940 Unit!40041)))

(declare-fun b!1207829 () Bool)

(assert (=> b!1207829 (= e!685939 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890))) lt!547884)))))

(assert (= (and d!133159 c!118769) b!1207827))

(assert (= (and d!133159 (not c!118769)) b!1207828))

(assert (= (and d!133159 (not res!802957)) b!1207829))

(declare-fun m!1113659 () Bool)

(assert (=> d!133159 m!1113659))

(declare-fun m!1113661 () Bool)

(assert (=> b!1207827 m!1113661))

(declare-fun m!1113663 () Bool)

(assert (=> b!1207827 m!1113663))

(assert (=> b!1207827 m!1113663))

(declare-fun m!1113665 () Bool)

(assert (=> b!1207827 m!1113665))

(assert (=> b!1207829 m!1113663))

(assert (=> b!1207829 m!1113663))

(assert (=> b!1207829 m!1113665))

(assert (=> b!1207475 d!133159))

(declare-fun d!133161 () Bool)

(assert (=> d!133161 (not (contains!6935 (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890)) lt!547884))))

(declare-fun lt!548077 () Unit!40015)

(assert (=> d!133161 (= lt!548077 (choose!1804 lt!547886 lt!547888 lt!547890 lt!547884))))

(declare-fun e!685941 () Bool)

(assert (=> d!133161 e!685941))

(declare-fun res!802958 () Bool)

(assert (=> d!133161 (=> (not res!802958) (not e!685941))))

(assert (=> d!133161 (= res!802958 (not (contains!6935 lt!547886 lt!547884)))))

(assert (=> d!133161 (= (addStillNotContains!293 lt!547886 lt!547888 lt!547890 lt!547884) lt!548077)))

(declare-fun b!1207830 () Bool)

(assert (=> b!1207830 (= e!685941 (not (= lt!547888 lt!547884)))))

(assert (= (and d!133161 res!802958) b!1207830))

(assert (=> d!133161 m!1113093))

(assert (=> d!133161 m!1113093))

(assert (=> d!133161 m!1113095))

(declare-fun m!1113667 () Bool)

(assert (=> d!133161 m!1113667))

(declare-fun m!1113669 () Bool)

(assert (=> d!133161 m!1113669))

(assert (=> b!1207475 d!133161))

(declare-fun d!133163 () Bool)

(declare-fun e!685942 () Bool)

(assert (=> d!133163 e!685942))

(declare-fun res!802959 () Bool)

(assert (=> d!133163 (=> (not res!802959) (not e!685942))))

(declare-fun lt!548079 () ListLongMap!17721)

(assert (=> d!133163 (= res!802959 (contains!6935 lt!548079 (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548078 () List!26553)

(assert (=> d!133163 (= lt!548079 (ListLongMap!17722 lt!548078))))

(declare-fun lt!548081 () Unit!40015)

(declare-fun lt!548080 () Unit!40015)

(assert (=> d!133163 (= lt!548081 lt!548080)))

(assert (=> d!133163 (= (getValueByKey!636 lt!548078 (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133163 (= lt!548080 (lemmaContainsTupThenGetReturnValue!313 lt!548078 (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133163 (= lt!548078 (insertStrictlySorted!406 (toList!8876 call!58973) (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133163 (= (+!3996 call!58973 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548079)))

(declare-fun b!1207831 () Bool)

(declare-fun res!802960 () Bool)

(assert (=> b!1207831 (=> (not res!802960) (not e!685942))))

(assert (=> b!1207831 (= res!802960 (= (getValueByKey!636 (toList!8876 lt!548079) (_1!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207832 () Bool)

(assert (=> b!1207832 (= e!685942 (contains!6936 (toList!8876 lt!548079) (tuple2!19753 (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19210 (select (arr!37700 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133163 res!802959) b!1207831))

(assert (= (and b!1207831 res!802960) b!1207832))

(declare-fun m!1113671 () Bool)

(assert (=> d!133163 m!1113671))

(declare-fun m!1113673 () Bool)

(assert (=> d!133163 m!1113673))

(declare-fun m!1113675 () Bool)

(assert (=> d!133163 m!1113675))

(declare-fun m!1113677 () Bool)

(assert (=> d!133163 m!1113677))

(declare-fun m!1113679 () Bool)

(assert (=> b!1207831 m!1113679))

(declare-fun m!1113681 () Bool)

(assert (=> b!1207832 m!1113681))

(assert (=> b!1207475 d!133163))

(declare-fun d!133165 () Bool)

(declare-fun e!685943 () Bool)

(assert (=> d!133165 e!685943))

(declare-fun res!802961 () Bool)

(assert (=> d!133165 (=> (not res!802961) (not e!685943))))

(declare-fun lt!548083 () ListLongMap!17721)

(assert (=> d!133165 (= res!802961 (contains!6935 lt!548083 (_1!9887 (tuple2!19753 lt!547888 lt!547890))))))

(declare-fun lt!548082 () List!26553)

(assert (=> d!133165 (= lt!548083 (ListLongMap!17722 lt!548082))))

(declare-fun lt!548085 () Unit!40015)

(declare-fun lt!548084 () Unit!40015)

(assert (=> d!133165 (= lt!548085 lt!548084)))

(assert (=> d!133165 (= (getValueByKey!636 lt!548082 (_1!9887 (tuple2!19753 lt!547888 lt!547890))) (Some!686 (_2!9887 (tuple2!19753 lt!547888 lt!547890))))))

(assert (=> d!133165 (= lt!548084 (lemmaContainsTupThenGetReturnValue!313 lt!548082 (_1!9887 (tuple2!19753 lt!547888 lt!547890)) (_2!9887 (tuple2!19753 lt!547888 lt!547890))))))

(assert (=> d!133165 (= lt!548082 (insertStrictlySorted!406 (toList!8876 lt!547886) (_1!9887 (tuple2!19753 lt!547888 lt!547890)) (_2!9887 (tuple2!19753 lt!547888 lt!547890))))))

(assert (=> d!133165 (= (+!3996 lt!547886 (tuple2!19753 lt!547888 lt!547890)) lt!548083)))

(declare-fun b!1207833 () Bool)

(declare-fun res!802962 () Bool)

(assert (=> b!1207833 (=> (not res!802962) (not e!685943))))

(assert (=> b!1207833 (= res!802962 (= (getValueByKey!636 (toList!8876 lt!548083) (_1!9887 (tuple2!19753 lt!547888 lt!547890))) (Some!686 (_2!9887 (tuple2!19753 lt!547888 lt!547890)))))))

(declare-fun b!1207834 () Bool)

(assert (=> b!1207834 (= e!685943 (contains!6936 (toList!8876 lt!548083) (tuple2!19753 lt!547888 lt!547890)))))

(assert (= (and d!133165 res!802961) b!1207833))

(assert (= (and b!1207833 res!802962) b!1207834))

(declare-fun m!1113683 () Bool)

(assert (=> d!133165 m!1113683))

(declare-fun m!1113685 () Bool)

(assert (=> d!133165 m!1113685))

(declare-fun m!1113687 () Bool)

(assert (=> d!133165 m!1113687))

(declare-fun m!1113689 () Bool)

(assert (=> d!133165 m!1113689))

(declare-fun m!1113691 () Bool)

(assert (=> b!1207833 m!1113691))

(declare-fun m!1113693 () Bool)

(assert (=> b!1207834 m!1113693))

(assert (=> b!1207475 d!133165))

(assert (=> b!1207475 d!133053))

(declare-fun d!133167 () Bool)

(assert (=> d!133167 (= (apply!965 lt!547868 (select (arr!37699 lt!547751) from!1455)) (get!19213 (getValueByKey!636 (toList!8876 lt!547868) (select (arr!37699 lt!547751) from!1455))))))

(declare-fun bs!34147 () Bool)

(assert (= bs!34147 d!133167))

(assert (=> bs!34147 m!1113005))

(assert (=> bs!34147 m!1113293))

(assert (=> bs!34147 m!1113293))

(declare-fun m!1113695 () Bool)

(assert (=> bs!34147 m!1113695))

(assert (=> b!1207443 d!133167))

(declare-fun d!133169 () Bool)

(declare-fun c!118770 () Bool)

(assert (=> d!133169 (= c!118770 ((_ is ValueCellFull!14625) (select (arr!37700 lt!547747) from!1455)))))

(declare-fun e!685944 () V!46019)

(assert (=> d!133169 (= (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685944)))

(declare-fun b!1207835 () Bool)

(assert (=> b!1207835 (= e!685944 (get!19211 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207836 () Bool)

(assert (=> b!1207836 (= e!685944 (get!19212 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133169 c!118770) b!1207835))

(assert (= (and d!133169 (not c!118770)) b!1207836))

(assert (=> b!1207835 m!1113009))

(assert (=> b!1207835 m!1112847))

(declare-fun m!1113697 () Bool)

(assert (=> b!1207835 m!1113697))

(assert (=> b!1207836 m!1113009))

(assert (=> b!1207836 m!1112847))

(declare-fun m!1113699 () Bool)

(assert (=> b!1207836 m!1113699))

(assert (=> b!1207443 d!133169))

(declare-fun d!133171 () Bool)

(assert (=> d!133171 (= (isDefined!461 (getValueByKey!636 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934)) (not (isEmpty!989 (getValueByKey!636 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))))

(declare-fun bs!34148 () Bool)

(assert (= bs!34148 d!133171))

(assert (=> bs!34148 m!1113115))

(declare-fun m!1113701 () Bool)

(assert (=> bs!34148 m!1113701))

(assert (=> b!1207493 d!133171))

(declare-fun e!685945 () Option!687)

(declare-fun b!1207837 () Bool)

(assert (=> b!1207837 (= e!685945 (Some!686 (_2!9887 (h!27758 (toList!8876 (ite c!118610 lt!547744 call!58933))))))))

(declare-fun b!1207840 () Bool)

(declare-fun e!685946 () Option!687)

(assert (=> b!1207840 (= e!685946 None!685)))

(declare-fun b!1207839 () Bool)

(assert (=> b!1207839 (= e!685946 (getValueByKey!636 (t!39498 (toList!8876 (ite c!118610 lt!547744 call!58933))) k0!934))))

(declare-fun b!1207838 () Bool)

(assert (=> b!1207838 (= e!685945 e!685946)))

(declare-fun c!118772 () Bool)

(assert (=> b!1207838 (= c!118772 (and ((_ is Cons!26549) (toList!8876 (ite c!118610 lt!547744 call!58933))) (not (= (_1!9887 (h!27758 (toList!8876 (ite c!118610 lt!547744 call!58933)))) k0!934))))))

(declare-fun d!133173 () Bool)

(declare-fun c!118771 () Bool)

(assert (=> d!133173 (= c!118771 (and ((_ is Cons!26549) (toList!8876 (ite c!118610 lt!547744 call!58933))) (= (_1!9887 (h!27758 (toList!8876 (ite c!118610 lt!547744 call!58933)))) k0!934)))))

(assert (=> d!133173 (= (getValueByKey!636 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934) e!685945)))

(assert (= (and d!133173 c!118771) b!1207837))

(assert (= (and d!133173 (not c!118771)) b!1207838))

(assert (= (and b!1207838 c!118772) b!1207839))

(assert (= (and b!1207838 (not c!118772)) b!1207840))

(declare-fun m!1113703 () Bool)

(assert (=> b!1207839 m!1113703))

(assert (=> b!1207493 d!133173))

(declare-fun d!133175 () Bool)

(assert (=> d!133175 (= (validKeyInArray!0 (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37699 lt!547751) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207471 d!133175))

(declare-fun d!133177 () Bool)

(declare-fun lt!548086 () Bool)

(assert (=> d!133177 (= lt!548086 (select (content!544 Nil!26551) (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun e!685947 () Bool)

(assert (=> d!133177 (= lt!548086 e!685947)))

(declare-fun res!802964 () Bool)

(assert (=> d!133177 (=> (not res!802964) (not e!685947))))

(assert (=> d!133177 (= res!802964 ((_ is Cons!26550) Nil!26551))))

(assert (=> d!133177 (= (contains!6937 Nil!26551 (select (arr!37699 _keys!1208) from!1455)) lt!548086)))

(declare-fun b!1207841 () Bool)

(declare-fun e!685948 () Bool)

(assert (=> b!1207841 (= e!685947 e!685948)))

(declare-fun res!802963 () Bool)

(assert (=> b!1207841 (=> res!802963 e!685948)))

(assert (=> b!1207841 (= res!802963 (= (h!27759 Nil!26551) (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun b!1207842 () Bool)

(assert (=> b!1207842 (= e!685948 (contains!6937 (t!39499 Nil!26551) (select (arr!37699 _keys!1208) from!1455)))))

(assert (= (and d!133177 res!802964) b!1207841))

(assert (= (and b!1207841 (not res!802963)) b!1207842))

(assert (=> d!133177 m!1113517))

(assert (=> d!133177 m!1112805))

(declare-fun m!1113705 () Bool)

(assert (=> d!133177 m!1113705))

(assert (=> b!1207842 m!1112805))

(declare-fun m!1113707 () Bool)

(assert (=> b!1207842 m!1113707))

(assert (=> b!1207380 d!133177))

(declare-fun d!133179 () Bool)

(declare-fun lt!548087 () Bool)

(assert (=> d!133179 (= lt!548087 (select (content!544 Nil!26551) (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun e!685949 () Bool)

(assert (=> d!133179 (= lt!548087 e!685949)))

(declare-fun res!802966 () Bool)

(assert (=> d!133179 (=> (not res!802966) (not e!685949))))

(assert (=> d!133179 (= res!802966 ((_ is Cons!26550) Nil!26551))))

(assert (=> d!133179 (= (contains!6937 Nil!26551 (select (arr!37699 lt!547751) #b00000000000000000000000000000000)) lt!548087)))

(declare-fun b!1207843 () Bool)

(declare-fun e!685950 () Bool)

(assert (=> b!1207843 (= e!685949 e!685950)))

(declare-fun res!802965 () Bool)

(assert (=> b!1207843 (=> res!802965 e!685950)))

(assert (=> b!1207843 (= res!802965 (= (h!27759 Nil!26551) (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(declare-fun b!1207844 () Bool)

(assert (=> b!1207844 (= e!685950 (contains!6937 (t!39499 Nil!26551) (select (arr!37699 lt!547751) #b00000000000000000000000000000000)))))

(assert (= (and d!133179 res!802966) b!1207843))

(assert (= (and b!1207843 (not res!802965)) b!1207844))

(assert (=> d!133179 m!1113517))

(assert (=> d!133179 m!1112981))

(declare-fun m!1113709 () Bool)

(assert (=> d!133179 m!1113709))

(assert (=> b!1207844 m!1112981))

(declare-fun m!1113711 () Bool)

(assert (=> b!1207844 m!1113711))

(assert (=> b!1207498 d!133179))

(declare-fun d!133181 () Bool)

(assert (=> d!133181 (= (isDefined!461 (getValueByKey!636 (toList!8876 lt!547743) k0!934)) (not (isEmpty!989 (getValueByKey!636 (toList!8876 lt!547743) k0!934))))))

(declare-fun bs!34149 () Bool)

(assert (= bs!34149 d!133181))

(assert (=> bs!34149 m!1113123))

(declare-fun m!1113713 () Bool)

(assert (=> bs!34149 m!1113713))

(assert (=> b!1207496 d!133181))

(declare-fun b!1207845 () Bool)

(declare-fun e!685951 () Option!687)

(assert (=> b!1207845 (= e!685951 (Some!686 (_2!9887 (h!27758 (toList!8876 lt!547743)))))))

(declare-fun b!1207848 () Bool)

(declare-fun e!685952 () Option!687)

(assert (=> b!1207848 (= e!685952 None!685)))

(declare-fun b!1207847 () Bool)

(assert (=> b!1207847 (= e!685952 (getValueByKey!636 (t!39498 (toList!8876 lt!547743)) k0!934))))

(declare-fun b!1207846 () Bool)

(assert (=> b!1207846 (= e!685951 e!685952)))

(declare-fun c!118774 () Bool)

(assert (=> b!1207846 (= c!118774 (and ((_ is Cons!26549) (toList!8876 lt!547743)) (not (= (_1!9887 (h!27758 (toList!8876 lt!547743))) k0!934))))))

(declare-fun d!133183 () Bool)

(declare-fun c!118773 () Bool)

(assert (=> d!133183 (= c!118773 (and ((_ is Cons!26549) (toList!8876 lt!547743)) (= (_1!9887 (h!27758 (toList!8876 lt!547743))) k0!934)))))

(assert (=> d!133183 (= (getValueByKey!636 (toList!8876 lt!547743) k0!934) e!685951)))

(assert (= (and d!133183 c!118773) b!1207845))

(assert (= (and d!133183 (not c!118773)) b!1207846))

(assert (= (and b!1207846 c!118774) b!1207847))

(assert (= (and b!1207846 (not c!118774)) b!1207848))

(declare-fun m!1113715 () Bool)

(assert (=> b!1207847 m!1113715))

(assert (=> b!1207496 d!133183))

(declare-fun d!133185 () Bool)

(declare-fun lt!548088 () Bool)

(assert (=> d!133185 (= lt!548088 (select (content!543 (toList!8876 lt!547824)) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun e!685954 () Bool)

(assert (=> d!133185 (= lt!548088 e!685954)))

(declare-fun res!802968 () Bool)

(assert (=> d!133185 (=> (not res!802968) (not e!685954))))

(assert (=> d!133185 (= res!802968 ((_ is Cons!26549) (toList!8876 lt!547824)))))

(assert (=> d!133185 (= (contains!6936 (toList!8876 lt!547824) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548088)))

(declare-fun b!1207849 () Bool)

(declare-fun e!685953 () Bool)

(assert (=> b!1207849 (= e!685954 e!685953)))

(declare-fun res!802967 () Bool)

(assert (=> b!1207849 (=> res!802967 e!685953)))

(assert (=> b!1207849 (= res!802967 (= (h!27758 (toList!8876 lt!547824)) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1207850 () Bool)

(assert (=> b!1207850 (= e!685953 (contains!6936 (t!39498 (toList!8876 lt!547824)) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133185 res!802968) b!1207849))

(assert (= (and b!1207849 (not res!802967)) b!1207850))

(declare-fun m!1113717 () Bool)

(assert (=> d!133185 m!1113717))

(declare-fun m!1113719 () Bool)

(assert (=> d!133185 m!1113719))

(declare-fun m!1113721 () Bool)

(assert (=> b!1207850 m!1113721))

(assert (=> b!1207368 d!133185))

(declare-fun b!1207851 () Bool)

(declare-fun e!685955 () Option!687)

(assert (=> b!1207851 (= e!685955 (Some!686 (_2!9887 (h!27758 (toList!8876 lt!547834)))))))

(declare-fun b!1207854 () Bool)

(declare-fun e!685956 () Option!687)

(assert (=> b!1207854 (= e!685956 None!685)))

(declare-fun b!1207853 () Bool)

(assert (=> b!1207853 (= e!685956 (getValueByKey!636 (t!39498 (toList!8876 lt!547834)) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207852 () Bool)

(assert (=> b!1207852 (= e!685955 e!685956)))

(declare-fun c!118776 () Bool)

(assert (=> b!1207852 (= c!118776 (and ((_ is Cons!26549) (toList!8876 lt!547834)) (not (= (_1!9887 (h!27758 (toList!8876 lt!547834))) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!118775 () Bool)

(declare-fun d!133187 () Bool)

(assert (=> d!133187 (= c!118775 (and ((_ is Cons!26549) (toList!8876 lt!547834)) (= (_1!9887 (h!27758 (toList!8876 lt!547834))) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133187 (= (getValueByKey!636 (toList!8876 lt!547834) (_1!9887 (ite (or c!118610 c!118612) (tuple2!19753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!685955)))

(assert (= (and d!133187 c!118775) b!1207851))

(assert (= (and d!133187 (not c!118775)) b!1207852))

(assert (= (and b!1207852 c!118776) b!1207853))

(assert (= (and b!1207852 (not c!118776)) b!1207854))

(declare-fun m!1113723 () Bool)

(assert (=> b!1207853 m!1113723))

(assert (=> b!1207390 d!133187))

(declare-fun d!133189 () Bool)

(assert (=> d!133189 (isDefined!461 (getValueByKey!636 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))

(declare-fun lt!548089 () Unit!40015)

(assert (=> d!133189 (= lt!548089 (choose!1805 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))

(declare-fun e!685957 () Bool)

(assert (=> d!133189 e!685957))

(declare-fun res!802969 () Bool)

(assert (=> d!133189 (=> (not res!802969) (not e!685957))))

(assert (=> d!133189 (= res!802969 (isStrictlySorted!729 (toList!8876 (ite c!118610 lt!547744 call!58933))))))

(assert (=> d!133189 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934) lt!548089)))

(declare-fun b!1207855 () Bool)

(assert (=> b!1207855 (= e!685957 (containsKey!592 (toList!8876 (ite c!118610 lt!547744 call!58933)) k0!934))))

(assert (= (and d!133189 res!802969) b!1207855))

(assert (=> d!133189 m!1113115))

(assert (=> d!133189 m!1113115))

(assert (=> d!133189 m!1113117))

(declare-fun m!1113725 () Bool)

(assert (=> d!133189 m!1113725))

(declare-fun m!1113727 () Bool)

(assert (=> d!133189 m!1113727))

(assert (=> b!1207855 m!1113111))

(assert (=> b!1207491 d!133189))

(assert (=> b!1207491 d!133171))

(assert (=> b!1207491 d!133173))

(assert (=> bm!58969 d!133087))

(declare-fun d!133191 () Bool)

(assert (=> d!133191 (arrayContainsKey!0 _keys!1208 lt!547891 #b00000000000000000000000000000000)))

(declare-fun lt!548090 () Unit!40015)

(assert (=> d!133191 (= lt!548090 (choose!13 _keys!1208 lt!547891 #b00000000000000000000000000000000))))

(assert (=> d!133191 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!133191 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547891 #b00000000000000000000000000000000) lt!548090)))

(declare-fun bs!34150 () Bool)

(assert (= bs!34150 d!133191))

(assert (=> bs!34150 m!1113105))

(declare-fun m!1113729 () Bool)

(assert (=> bs!34150 m!1113729))

(assert (=> b!1207489 d!133191))

(declare-fun d!133193 () Bool)

(declare-fun res!802970 () Bool)

(declare-fun e!685958 () Bool)

(assert (=> d!133193 (=> res!802970 e!685958)))

(assert (=> d!133193 (= res!802970 (= (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) lt!547891))))

(assert (=> d!133193 (= (arrayContainsKey!0 _keys!1208 lt!547891 #b00000000000000000000000000000000) e!685958)))

(declare-fun b!1207856 () Bool)

(declare-fun e!685959 () Bool)

(assert (=> b!1207856 (= e!685958 e!685959)))

(declare-fun res!802971 () Bool)

(assert (=> b!1207856 (=> (not res!802971) (not e!685959))))

(assert (=> b!1207856 (= res!802971 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207857 () Bool)

(assert (=> b!1207857 (= e!685959 (arrayContainsKey!0 _keys!1208 lt!547891 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133193 (not res!802970)) b!1207856))

(assert (= (and b!1207856 res!802971) b!1207857))

(assert (=> d!133193 m!1112973))

(declare-fun m!1113731 () Bool)

(assert (=> b!1207857 m!1113731))

(assert (=> b!1207489 d!133193))

(declare-fun d!133195 () Bool)

(declare-fun lt!548091 () SeekEntryResult!9938)

(assert (=> d!133195 (and (or ((_ is Undefined!9938) lt!548091) (not ((_ is Found!9938) lt!548091)) (and (bvsge (index!42124 lt!548091) #b00000000000000000000000000000000) (bvslt (index!42124 lt!548091) (size!38235 _keys!1208)))) (or ((_ is Undefined!9938) lt!548091) ((_ is Found!9938) lt!548091) (not ((_ is MissingZero!9938) lt!548091)) (and (bvsge (index!42123 lt!548091) #b00000000000000000000000000000000) (bvslt (index!42123 lt!548091) (size!38235 _keys!1208)))) (or ((_ is Undefined!9938) lt!548091) ((_ is Found!9938) lt!548091) ((_ is MissingZero!9938) lt!548091) (not ((_ is MissingVacant!9938) lt!548091)) (and (bvsge (index!42126 lt!548091) #b00000000000000000000000000000000) (bvslt (index!42126 lt!548091) (size!38235 _keys!1208)))) (or ((_ is Undefined!9938) lt!548091) (ite ((_ is Found!9938) lt!548091) (= (select (arr!37699 _keys!1208) (index!42124 lt!548091)) (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9938) lt!548091) (= (select (arr!37699 _keys!1208) (index!42123 lt!548091)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9938) lt!548091) (= (select (arr!37699 _keys!1208) (index!42126 lt!548091)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!685961 () SeekEntryResult!9938)

(assert (=> d!133195 (= lt!548091 e!685961)))

(declare-fun c!118777 () Bool)

(declare-fun lt!548092 () SeekEntryResult!9938)

(assert (=> d!133195 (= c!118777 (and ((_ is Intermediate!9938) lt!548092) (undefined!10750 lt!548092)))))

(assert (=> d!133195 (= lt!548092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!133195 (validMask!0 mask!1564)))

(assert (=> d!133195 (= (seekEntryOrOpen!0 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!548091)))

(declare-fun b!1207858 () Bool)

(declare-fun c!118779 () Bool)

(declare-fun lt!548093 () (_ BitVec 64))

(assert (=> b!1207858 (= c!118779 (= lt!548093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!685960 () SeekEntryResult!9938)

(declare-fun e!685962 () SeekEntryResult!9938)

(assert (=> b!1207858 (= e!685960 e!685962)))

(declare-fun b!1207859 () Bool)

(assert (=> b!1207859 (= e!685961 e!685960)))

(assert (=> b!1207859 (= lt!548093 (select (arr!37699 _keys!1208) (index!42125 lt!548092)))))

(declare-fun c!118778 () Bool)

(assert (=> b!1207859 (= c!118778 (= lt!548093 (select (arr!37699 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207860 () Bool)

(assert (=> b!1207860 (= e!685960 (Found!9938 (index!42125 lt!548092)))))

(declare-fun b!1207861 () Bool)

(assert (=> b!1207861 (= e!685961 Undefined!9938)))

(declare-fun b!1207862 () Bool)

(assert (=> b!1207862 (= e!685962 (MissingZero!9938 (index!42125 lt!548092)))))

(declare-fun b!1207863 () Bool)

(assert (=> b!1207863 (= e!685962 (seekKeyOrZeroReturnVacant!0 (x!106580 lt!548092) (index!42125 lt!548092) (index!42125 lt!548092) (select (arr!37699 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (= (and d!133195 c!118777) b!1207861))

(assert (= (and d!133195 (not c!118777)) b!1207859))

(assert (= (and b!1207859 c!118778) b!1207860))

(assert (= (and b!1207859 (not c!118778)) b!1207858))

(assert (= (and b!1207858 c!118779) b!1207862))

(assert (= (and b!1207858 (not c!118779)) b!1207863))

(declare-fun m!1113733 () Bool)

(assert (=> d!133195 m!1113733))

(assert (=> d!133195 m!1112973))

(declare-fun m!1113735 () Bool)

(assert (=> d!133195 m!1113735))

(declare-fun m!1113737 () Bool)

(assert (=> d!133195 m!1113737))

(declare-fun m!1113739 () Bool)

(assert (=> d!133195 m!1113739))

(declare-fun m!1113741 () Bool)

(assert (=> d!133195 m!1113741))

(assert (=> d!133195 m!1112791))

(assert (=> d!133195 m!1112973))

(assert (=> d!133195 m!1113733))

(declare-fun m!1113743 () Bool)

(assert (=> b!1207859 m!1113743))

(assert (=> b!1207863 m!1112973))

(declare-fun m!1113745 () Bool)

(assert (=> b!1207863 m!1113745))

(assert (=> b!1207489 d!133195))

(declare-fun d!133197 () Bool)

(assert (=> d!133197 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547743) k0!934))))

(declare-fun lt!548094 () Unit!40015)

(assert (=> d!133197 (= lt!548094 (choose!1805 (toList!8876 lt!547743) k0!934))))

(declare-fun e!685963 () Bool)

(assert (=> d!133197 e!685963))

(declare-fun res!802972 () Bool)

(assert (=> d!133197 (=> (not res!802972) (not e!685963))))

(assert (=> d!133197 (= res!802972 (isStrictlySorted!729 (toList!8876 lt!547743)))))

(assert (=> d!133197 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547743) k0!934) lt!548094)))

(declare-fun b!1207864 () Bool)

(assert (=> b!1207864 (= e!685963 (containsKey!592 (toList!8876 lt!547743) k0!934))))

(assert (= (and d!133197 res!802972) b!1207864))

(assert (=> d!133197 m!1113123))

(assert (=> d!133197 m!1113123))

(assert (=> d!133197 m!1113125))

(declare-fun m!1113747 () Bool)

(assert (=> d!133197 m!1113747))

(assert (=> d!133197 m!1113501))

(assert (=> b!1207864 m!1113119))

(assert (=> b!1207494 d!133197))

(assert (=> b!1207494 d!133181))

(assert (=> b!1207494 d!133183))

(declare-fun d!133199 () Bool)

(declare-fun e!685964 () Bool)

(assert (=> d!133199 e!685964))

(declare-fun res!802973 () Bool)

(assert (=> d!133199 (=> (not res!802973) (not e!685964))))

(declare-fun lt!548096 () ListLongMap!17721)

(assert (=> d!133199 (= res!802973 (contains!6935 lt!548096 (_1!9887 (tuple2!19753 lt!547867 lt!547869))))))

(declare-fun lt!548095 () List!26553)

(assert (=> d!133199 (= lt!548096 (ListLongMap!17722 lt!548095))))

(declare-fun lt!548098 () Unit!40015)

(declare-fun lt!548097 () Unit!40015)

(assert (=> d!133199 (= lt!548098 lt!548097)))

(assert (=> d!133199 (= (getValueByKey!636 lt!548095 (_1!9887 (tuple2!19753 lt!547867 lt!547869))) (Some!686 (_2!9887 (tuple2!19753 lt!547867 lt!547869))))))

(assert (=> d!133199 (= lt!548097 (lemmaContainsTupThenGetReturnValue!313 lt!548095 (_1!9887 (tuple2!19753 lt!547867 lt!547869)) (_2!9887 (tuple2!19753 lt!547867 lt!547869))))))

(assert (=> d!133199 (= lt!548095 (insertStrictlySorted!406 (toList!8876 lt!547865) (_1!9887 (tuple2!19753 lt!547867 lt!547869)) (_2!9887 (tuple2!19753 lt!547867 lt!547869))))))

(assert (=> d!133199 (= (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869)) lt!548096)))

(declare-fun b!1207865 () Bool)

(declare-fun res!802974 () Bool)

(assert (=> b!1207865 (=> (not res!802974) (not e!685964))))

(assert (=> b!1207865 (= res!802974 (= (getValueByKey!636 (toList!8876 lt!548096) (_1!9887 (tuple2!19753 lt!547867 lt!547869))) (Some!686 (_2!9887 (tuple2!19753 lt!547867 lt!547869)))))))

(declare-fun b!1207866 () Bool)

(assert (=> b!1207866 (= e!685964 (contains!6936 (toList!8876 lt!548096) (tuple2!19753 lt!547867 lt!547869)))))

(assert (= (and d!133199 res!802973) b!1207865))

(assert (= (and b!1207865 res!802974) b!1207866))

(declare-fun m!1113749 () Bool)

(assert (=> d!133199 m!1113749))

(declare-fun m!1113751 () Bool)

(assert (=> d!133199 m!1113751))

(declare-fun m!1113753 () Bool)

(assert (=> d!133199 m!1113753))

(declare-fun m!1113755 () Bool)

(assert (=> d!133199 m!1113755))

(declare-fun m!1113757 () Bool)

(assert (=> b!1207865 m!1113757))

(declare-fun m!1113759 () Bool)

(assert (=> b!1207866 m!1113759))

(assert (=> b!1207439 d!133199))

(assert (=> b!1207439 d!133169))

(declare-fun d!133201 () Bool)

(declare-fun e!685965 () Bool)

(assert (=> d!133201 e!685965))

(declare-fun res!802975 () Bool)

(assert (=> d!133201 (=> res!802975 e!685965)))

(declare-fun lt!548099 () Bool)

(assert (=> d!133201 (= res!802975 (not lt!548099))))

(declare-fun lt!548102 () Bool)

(assert (=> d!133201 (= lt!548099 lt!548102)))

(declare-fun lt!548101 () Unit!40015)

(declare-fun e!685966 () Unit!40015)

(assert (=> d!133201 (= lt!548101 e!685966)))

(declare-fun c!118780 () Bool)

(assert (=> d!133201 (= c!118780 lt!548102)))

(assert (=> d!133201 (= lt!548102 (containsKey!592 (toList!8876 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869))) lt!547863))))

(assert (=> d!133201 (= (contains!6935 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869)) lt!547863) lt!548099)))

(declare-fun b!1207867 () Bool)

(declare-fun lt!548100 () Unit!40015)

(assert (=> b!1207867 (= e!685966 lt!548100)))

(assert (=> b!1207867 (= lt!548100 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869))) lt!547863))))

(assert (=> b!1207867 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869))) lt!547863))))

(declare-fun b!1207868 () Bool)

(declare-fun Unit!40042 () Unit!40015)

(assert (=> b!1207868 (= e!685966 Unit!40042)))

(declare-fun b!1207869 () Bool)

(assert (=> b!1207869 (= e!685965 (isDefined!461 (getValueByKey!636 (toList!8876 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869))) lt!547863)))))

(assert (= (and d!133201 c!118780) b!1207867))

(assert (= (and d!133201 (not c!118780)) b!1207868))

(assert (= (and d!133201 (not res!802975)) b!1207869))

(declare-fun m!1113761 () Bool)

(assert (=> d!133201 m!1113761))

(declare-fun m!1113763 () Bool)

(assert (=> b!1207867 m!1113763))

(declare-fun m!1113765 () Bool)

(assert (=> b!1207867 m!1113765))

(assert (=> b!1207867 m!1113765))

(declare-fun m!1113767 () Bool)

(assert (=> b!1207867 m!1113767))

(assert (=> b!1207869 m!1113765))

(assert (=> b!1207869 m!1113765))

(assert (=> b!1207869 m!1113767))

(assert (=> b!1207439 d!133201))

(declare-fun d!133203 () Bool)

(assert (=> d!133203 (not (contains!6935 (+!3996 lt!547865 (tuple2!19753 lt!547867 lt!547869)) lt!547863))))

(declare-fun lt!548103 () Unit!40015)

(assert (=> d!133203 (= lt!548103 (choose!1804 lt!547865 lt!547867 lt!547869 lt!547863))))

(declare-fun e!685967 () Bool)

(assert (=> d!133203 e!685967))

(declare-fun res!802976 () Bool)

(assert (=> d!133203 (=> (not res!802976) (not e!685967))))

(assert (=> d!133203 (= res!802976 (not (contains!6935 lt!547865 lt!547863)))))

(assert (=> d!133203 (= (addStillNotContains!293 lt!547865 lt!547867 lt!547869 lt!547863) lt!548103)))

(declare-fun b!1207870 () Bool)

(assert (=> b!1207870 (= e!685967 (not (= lt!547867 lt!547863)))))

(assert (= (and d!133203 res!802976) b!1207870))

(assert (=> d!133203 m!1113015))

(assert (=> d!133203 m!1113015))

(assert (=> d!133203 m!1113017))

(declare-fun m!1113769 () Bool)

(assert (=> d!133203 m!1113769))

(declare-fun m!1113771 () Bool)

(assert (=> d!133203 m!1113771))

(assert (=> b!1207439 d!133203))

(declare-fun d!133205 () Bool)

(declare-fun e!685968 () Bool)

(assert (=> d!133205 e!685968))

(declare-fun res!802977 () Bool)

(assert (=> d!133205 (=> (not res!802977) (not e!685968))))

(declare-fun lt!548105 () ListLongMap!17721)

(assert (=> d!133205 (= res!802977 (contains!6935 lt!548105 (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548104 () List!26553)

(assert (=> d!133205 (= lt!548105 (ListLongMap!17722 lt!548104))))

(declare-fun lt!548107 () Unit!40015)

(declare-fun lt!548106 () Unit!40015)

(assert (=> d!133205 (= lt!548107 lt!548106)))

(assert (=> d!133205 (= (getValueByKey!636 lt!548104 (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133205 (= lt!548106 (lemmaContainsTupThenGetReturnValue!313 lt!548104 (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133205 (= lt!548104 (insertStrictlySorted!406 (toList!8876 call!58970) (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133205 (= (+!3996 call!58970 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548105)))

(declare-fun b!1207871 () Bool)

(declare-fun res!802978 () Bool)

(assert (=> b!1207871 (=> (not res!802978) (not e!685968))))

(assert (=> b!1207871 (= res!802978 (= (getValueByKey!636 (toList!8876 lt!548105) (_1!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!686 (_2!9887 (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207872 () Bool)

(assert (=> b!1207872 (= e!685968 (contains!6936 (toList!8876 lt!548105) (tuple2!19753 (select (arr!37699 lt!547751) from!1455) (get!19210 (select (arr!37700 lt!547747) from!1455) (dynLambda!3214 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133205 res!802977) b!1207871))

(assert (= (and b!1207871 res!802978) b!1207872))

(declare-fun m!1113773 () Bool)

(assert (=> d!133205 m!1113773))

(declare-fun m!1113775 () Bool)

(assert (=> d!133205 m!1113775))

(declare-fun m!1113777 () Bool)

(assert (=> d!133205 m!1113777))

(declare-fun m!1113779 () Bool)

(assert (=> d!133205 m!1113779))

(declare-fun m!1113781 () Bool)

(assert (=> b!1207871 m!1113781))

(declare-fun m!1113783 () Bool)

(assert (=> b!1207872 m!1113783))

(assert (=> b!1207439 d!133205))

(declare-fun d!133207 () Bool)

(declare-fun e!685969 () Bool)

(assert (=> d!133207 e!685969))

(declare-fun res!802979 () Bool)

(assert (=> d!133207 (=> res!802979 e!685969)))

(declare-fun lt!548108 () Bool)

(assert (=> d!133207 (= res!802979 (not lt!548108))))

(declare-fun lt!548111 () Bool)

(assert (=> d!133207 (= lt!548108 lt!548111)))

(declare-fun lt!548110 () Unit!40015)

(declare-fun e!685970 () Unit!40015)

(assert (=> d!133207 (= lt!548110 e!685970)))

(declare-fun c!118781 () Bool)

(assert (=> d!133207 (= c!118781 lt!548111)))

(assert (=> d!133207 (= lt!548111 (containsKey!592 (toList!8876 lt!547868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133207 (= (contains!6935 lt!547868 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548108)))

(declare-fun b!1207873 () Bool)

(declare-fun lt!548109 () Unit!40015)

(assert (=> b!1207873 (= e!685970 lt!548109)))

(assert (=> b!1207873 (= lt!548109 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207873 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207874 () Bool)

(declare-fun Unit!40043 () Unit!40015)

(assert (=> b!1207874 (= e!685970 Unit!40043)))

(declare-fun b!1207875 () Bool)

(assert (=> b!1207875 (= e!685969 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547868) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133207 c!118781) b!1207873))

(assert (= (and d!133207 (not c!118781)) b!1207874))

(assert (= (and d!133207 (not res!802979)) b!1207875))

(declare-fun m!1113785 () Bool)

(assert (=> d!133207 m!1113785))

(declare-fun m!1113787 () Bool)

(assert (=> b!1207873 m!1113787))

(declare-fun m!1113789 () Bool)

(assert (=> b!1207873 m!1113789))

(assert (=> b!1207873 m!1113789))

(declare-fun m!1113791 () Bool)

(assert (=> b!1207873 m!1113791))

(assert (=> b!1207875 m!1113789))

(assert (=> b!1207875 m!1113789))

(assert (=> b!1207875 m!1113791))

(assert (=> d!132979 d!133207))

(assert (=> d!132979 d!132961))

(assert (=> b!1207468 d!133175))

(declare-fun d!133209 () Bool)

(declare-fun e!685971 () Bool)

(assert (=> d!133209 e!685971))

(declare-fun res!802980 () Bool)

(assert (=> d!133209 (=> res!802980 e!685971)))

(declare-fun lt!548112 () Bool)

(assert (=> d!133209 (= res!802980 (not lt!548112))))

(declare-fun lt!548115 () Bool)

(assert (=> d!133209 (= lt!548112 lt!548115)))

(declare-fun lt!548114 () Unit!40015)

(declare-fun e!685972 () Unit!40015)

(assert (=> d!133209 (= lt!548114 e!685972)))

(declare-fun c!118782 () Bool)

(assert (=> d!133209 (= c!118782 lt!548115)))

(assert (=> d!133209 (= lt!548115 (containsKey!592 (toList!8876 lt!547875) (select (arr!37699 _keys!1208) from!1455)))))

(assert (=> d!133209 (= (contains!6935 lt!547875 (select (arr!37699 _keys!1208) from!1455)) lt!548112)))

(declare-fun b!1207876 () Bool)

(declare-fun lt!548113 () Unit!40015)

(assert (=> b!1207876 (= e!685972 lt!548113)))

(assert (=> b!1207876 (= lt!548113 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8876 lt!547875) (select (arr!37699 _keys!1208) from!1455)))))

(assert (=> b!1207876 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547875) (select (arr!37699 _keys!1208) from!1455)))))

(declare-fun b!1207877 () Bool)

(declare-fun Unit!40044 () Unit!40015)

(assert (=> b!1207877 (= e!685972 Unit!40044)))

(declare-fun b!1207878 () Bool)

(assert (=> b!1207878 (= e!685971 (isDefined!461 (getValueByKey!636 (toList!8876 lt!547875) (select (arr!37699 _keys!1208) from!1455))))))

(assert (= (and d!133209 c!118782) b!1207876))

(assert (= (and d!133209 (not c!118782)) b!1207877))

(assert (= (and d!133209 (not res!802980)) b!1207878))

(assert (=> d!133209 m!1112805))

(declare-fun m!1113793 () Bool)

(assert (=> d!133209 m!1113793))

(assert (=> b!1207876 m!1112805))

(declare-fun m!1113795 () Bool)

(assert (=> b!1207876 m!1113795))

(assert (=> b!1207876 m!1112805))

(assert (=> b!1207876 m!1113523))

(assert (=> b!1207876 m!1113523))

(declare-fun m!1113797 () Bool)

(assert (=> b!1207876 m!1113797))

(assert (=> b!1207878 m!1112805))

(assert (=> b!1207878 m!1113523))

(assert (=> b!1207878 m!1113523))

(assert (=> b!1207878 m!1113797))

(assert (=> b!1207460 d!133209))

(declare-fun d!133211 () Bool)

(declare-fun res!802981 () Bool)

(declare-fun e!685973 () Bool)

(assert (=> d!133211 (=> res!802981 e!685973)))

(assert (=> d!133211 (= res!802981 (= (select (arr!37699 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!133211 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) e!685973)))

(declare-fun b!1207879 () Bool)

(declare-fun e!685974 () Bool)

(assert (=> b!1207879 (= e!685973 e!685974)))

(declare-fun res!802982 () Bool)

(assert (=> b!1207879 (=> (not res!802982) (not e!685974))))

(assert (=> b!1207879 (= res!802982 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38235 _keys!1208)))))

(declare-fun b!1207880 () Bool)

(assert (=> b!1207880 (= e!685974 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!133211 (not res!802981)) b!1207879))

(assert (= (and b!1207879 res!802982) b!1207880))

(assert (=> d!133211 m!1113241))

(declare-fun m!1113799 () Bool)

(assert (=> b!1207880 m!1113799))

(assert (=> b!1207397 d!133211))

(declare-fun d!133213 () Bool)

(assert (=> d!133213 (= (isEmpty!987 lt!547882) (isEmpty!988 (toList!8876 lt!547882)))))

(declare-fun bs!34151 () Bool)

(assert (= bs!34151 d!133213))

(declare-fun m!1113801 () Bool)

(assert (=> bs!34151 m!1113801))

(assert (=> b!1207466 d!133213))

(declare-fun mapNonEmpty!47869 () Bool)

(declare-fun mapRes!47869 () Bool)

(declare-fun tp!90911 () Bool)

(declare-fun e!685975 () Bool)

(assert (=> mapNonEmpty!47869 (= mapRes!47869 (and tp!90911 e!685975))))

(declare-fun mapValue!47869 () ValueCell!14625)

(declare-fun mapKey!47869 () (_ BitVec 32))

(declare-fun mapRest!47869 () (Array (_ BitVec 32) ValueCell!14625))

(assert (=> mapNonEmpty!47869 (= mapRest!47868 (store mapRest!47869 mapKey!47869 mapValue!47869))))

(declare-fun b!1207882 () Bool)

(declare-fun e!685976 () Bool)

(assert (=> b!1207882 (= e!685976 tp_is_empty!30669)))

(declare-fun b!1207881 () Bool)

(assert (=> b!1207881 (= e!685975 tp_is_empty!30669)))

(declare-fun mapIsEmpty!47869 () Bool)

(assert (=> mapIsEmpty!47869 mapRes!47869))

(declare-fun condMapEmpty!47869 () Bool)

(declare-fun mapDefault!47869 () ValueCell!14625)

(assert (=> mapNonEmpty!47868 (= condMapEmpty!47869 (= mapRest!47868 ((as const (Array (_ BitVec 32) ValueCell!14625)) mapDefault!47869)))))

(assert (=> mapNonEmpty!47868 (= tp!90910 (and e!685976 mapRes!47869))))

(assert (= (and mapNonEmpty!47868 condMapEmpty!47869) mapIsEmpty!47869))

(assert (= (and mapNonEmpty!47868 (not condMapEmpty!47869)) mapNonEmpty!47869))

(assert (= (and mapNonEmpty!47869 ((_ is ValueCellFull!14625) mapValue!47869)) b!1207881))

(assert (= (and mapNonEmpty!47868 ((_ is ValueCellFull!14625) mapDefault!47869)) b!1207882))

(declare-fun m!1113803 () Bool)

(assert (=> mapNonEmpty!47869 m!1113803))

(declare-fun b_lambda!21463 () Bool)

(assert (= b_lambda!21441 (or (and start!100826 b_free!25965) b_lambda!21463)))

(declare-fun b_lambda!21465 () Bool)

(assert (= b_lambda!21459 (or (and start!100826 b_free!25965) b_lambda!21465)))

(declare-fun b_lambda!21467 () Bool)

(assert (= b_lambda!21451 (or (and start!100826 b_free!25965) b_lambda!21467)))

(declare-fun b_lambda!21469 () Bool)

(assert (= b_lambda!21457 (or (and start!100826 b_free!25965) b_lambda!21469)))

(declare-fun b_lambda!21471 () Bool)

(assert (= b_lambda!21455 (or (and start!100826 b_free!25965) b_lambda!21471)))

(declare-fun b_lambda!21473 () Bool)

(assert (= b_lambda!21453 (or (and start!100826 b_free!25965) b_lambda!21473)))

(declare-fun b_lambda!21475 () Bool)

(assert (= b_lambda!21449 (or (and start!100826 b_free!25965) b_lambda!21475)))

(declare-fun b_lambda!21477 () Bool)

(assert (= b_lambda!21443 (or (and start!100826 b_free!25965) b_lambda!21477)))

(declare-fun b_lambda!21479 () Bool)

(assert (= b_lambda!21447 (or (and start!100826 b_free!25965) b_lambda!21479)))

(declare-fun b_lambda!21481 () Bool)

(assert (= b_lambda!21445 (or (and start!100826 b_free!25965) b_lambda!21481)))

(declare-fun b_lambda!21483 () Bool)

(assert (= b_lambda!21461 (or (and start!100826 b_free!25965) b_lambda!21483)))

(check-sat (not b!1207866) (not b!1207697) (not b!1207707) (not b!1207562) (not b!1207701) (not b!1207817) (not d!133067) (not b!1207529) (not b!1207539) (not b!1207661) (not d!133177) (not b!1207526) (not b!1207781) (not b!1207595) (not b!1207621) (not b!1207800) (not b!1207670) (not b!1207801) (not b!1207592) (not b!1207521) (not d!133213) (not b!1207769) (not b!1207753) (not b!1207807) (not b!1207863) (not d!133199) (not b!1207842) (not b!1207847) (not b!1207873) (not b!1207812) (not d!133171) (not b!1207766) (not b!1207834) (not b!1207785) (not d!133077) (not b!1207864) (not d!133045) (not b!1207693) (not b!1207565) (not b!1207833) (not b!1207850) (not b!1207641) (not b!1207876) (not b!1207648) (not d!133185) (not d!133025) (not d!133075) (not b!1207645) b_and!42977 (not d!133019) (not b!1207564) (not b_lambda!21483) (not b!1207522) (not b!1207525) (not d!133129) (not bm!58988) (not b!1207832) (not d!133127) (not d!133197) (not b!1207763) (not d!133091) (not d!133209) (not b!1207613) (not d!133037) (not b!1207765) (not bm!58987) (not d!133113) (not b_lambda!21439) (not b_lambda!21473) (not b!1207802) (not b!1207600) (not b_lambda!21429) (not b_lambda!21479) (not d!133047) (not b!1207566) (not d!133043) (not b_lambda!21481) (not d!133061) (not mapNonEmpty!47869) (not b!1207676) (not d!133123) (not d!133137) (not b!1207550) (not b!1207612) (not d!133201) (not d!133205) (not d!133057) (not bm!59000) (not b!1207650) (not b!1207865) (not b!1207805) (not bm!59001) (not b_lambda!21475) (not b!1207552) (not b!1207720) (not b!1207855) (not d!133069) (not b!1207609) (not b!1207538) (not b!1207867) (not b!1207549) (not b!1207880) (not b!1207569) (not b!1207813) (not b_lambda!21465) (not b_lambda!21435) (not b!1207702) (not b!1207836) (not b!1207674) (not d!133145) (not b!1207537) (not d!133121) (not d!133161) (not b!1207545) (not b_lambda!21433) (not d!133087) (not b!1207672) (not d!133119) (not b!1207685) (not b!1207743) (not b!1207540) (not b!1207827) (not d!133167) (not d!133039) (not b!1207607) (not d!133017) (not b!1207636) (not bm!58985) tp_is_empty!30669 (not b!1207695) (not b!1207767) (not b!1207818) (not b!1207699) (not b!1207742) (not bm!58980) (not d!133147) (not b!1207759) (not b!1207751) (not b!1207869) (not d!133151) (not b!1207690) (not b!1207811) (not b_lambda!21469) (not b!1207744) (not b!1207668) (not b!1207774) (not d!133191) (not b!1207614) (not d!133031) (not b!1207793) (not b!1207878) (not d!133195) (not b_lambda!21437) (not d!133015) (not b!1207669) (not b!1207561) (not b!1207853) (not b!1207598) (not b_lambda!21427) (not b!1207713) (not d!133083) (not b_lambda!21471) (not b_lambda!21477) (not b_next!25965) (not b!1207638) (not b!1207803) (not d!133117) (not d!133159) (not b!1207871) (not b!1207558) (not b!1207829) (not b!1207601) (not b!1207642) (not b!1207687) (not d!133063) (not d!133163) (not b!1207560) (not b!1207808) (not d!133109) (not b!1207875) (not d!133149) (not bm!59006) (not b!1207546) (not d!133099) (not b!1207683) (not d!133135) (not b!1207795) (not b!1207831) (not b!1207528) (not d!133095) (not bm!58989) (not bm!58986) (not b_lambda!21403) (not d!133165) (not b!1207593) (not b!1207682) (not b!1207617) (not bm!58990) (not b!1207839) (not d!133143) (not b!1207770) (not d!133085) (not b!1207678) (not d!133035) (not d!133179) (not b!1207797) (not b!1207570) (not b!1207623) (not b!1207705) (not b!1207710) (not b!1207719) (not b!1207596) (not b!1207857) (not b!1207784) (not bm!58997) (not b!1207524) (not b!1207530) (not b!1207835) (not b!1207762) (not b!1207872) (not b!1207771) (not b!1207610) (not b!1207810) (not b_lambda!21423) (not b!1207844) (not b!1207547) (not b!1207761) (not b!1207643) (not b!1207700) (not d!133107) (not d!133133) (not b!1207568) (not b!1207677) (not d!133181) (not b!1207647) (not b!1207618) (not d!133023) (not bm!58979) (not d!133101) (not b!1207616) (not d!133013) (not d!133203) (not b_lambda!21463) (not b!1207776) (not b!1207602) (not b!1207673) (not d!133115) (not b_lambda!21425) (not d!133051) (not b!1207779) (not b!1207760) (not b!1207708) (not b!1207825) (not b_lambda!21467) (not d!133009) (not d!133207) (not b_lambda!21431) (not b!1207798) (not b!1207816) (not bm!59004) (not d!133065) (not b!1207786) (not d!133071) (not b!1207782) (not d!133189) (not b!1207574) (not b!1207639) (not d!133059) (not d!133093) (not bm!59005))
(check-sat b_and!42977 (not b_next!25965))
