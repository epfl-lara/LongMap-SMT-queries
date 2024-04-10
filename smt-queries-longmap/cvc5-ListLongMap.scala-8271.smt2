; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100574 () Bool)

(assert start!100574)

(declare-fun b_free!25897 () Bool)

(declare-fun b_next!25897 () Bool)

(assert (=> start!100574 (= b_free!25897 (not b_next!25897))))

(declare-fun tp!90680 () Bool)

(declare-fun b_and!42681 () Bool)

(assert (=> start!100574 (= tp!90680 b_and!42681)))

(declare-fun b!1203139 () Bool)

(declare-fun res!800700 () Bool)

(declare-fun e!683194 () Bool)

(assert (=> b!1203139 (=> (not res!800700) (not e!683194))))

(declare-datatypes ((array!77975 0))(
  ( (array!77976 (arr!37632 (Array (_ BitVec 32) (_ BitVec 64))) (size!38168 (_ BitVec 32))) )
))
(declare-fun lt!545388 () array!77975)

(declare-datatypes ((List!26496 0))(
  ( (Nil!26493) (Cons!26492 (h!27701 (_ BitVec 64)) (t!39373 List!26496)) )
))
(declare-fun arrayNoDuplicates!0 (array!77975 (_ BitVec 32) List!26496) Bool)

(assert (=> b!1203139 (= res!800700 (arrayNoDuplicates!0 lt!545388 #b00000000000000000000000000000000 Nil!26493))))

(declare-fun b!1203140 () Bool)

(declare-fun e!683189 () Bool)

(declare-fun e!683186 () Bool)

(assert (=> b!1203140 (= e!683189 e!683186)))

(declare-fun res!800708 () Bool)

(assert (=> b!1203140 (=> res!800708 e!683186)))

(declare-datatypes ((V!45929 0))(
  ( (V!45930 (val!15357 Int)) )
))
(declare-datatypes ((tuple2!19686 0))(
  ( (tuple2!19687 (_1!9854 (_ BitVec 64)) (_2!9854 V!45929)) )
))
(declare-datatypes ((List!26497 0))(
  ( (Nil!26494) (Cons!26493 (h!27702 tuple2!19686) (t!39374 List!26497)) )
))
(declare-datatypes ((ListLongMap!17655 0))(
  ( (ListLongMap!17656 (toList!8843 List!26497)) )
))
(declare-fun lt!545381 () ListLongMap!17655)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6897 (ListLongMap!17655 (_ BitVec 64)) Bool)

(assert (=> b!1203140 (= res!800708 (not (contains!6897 lt!545381 k!934)))))

(declare-fun zeroValue!944 () V!45929)

(declare-fun _keys!1208 () array!77975)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14591 0))(
  ( (ValueCellFull!14591 (v!17995 V!45929)) (EmptyCell!14591) )
))
(declare-datatypes ((array!77977 0))(
  ( (array!77978 (arr!37633 (Array (_ BitVec 32) ValueCell!14591)) (size!38169 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77977)

(declare-fun minValue!944 () V!45929)

(declare-fun getCurrentListMapNoExtraKeys!5279 (array!77975 array!77977 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) Int) ListLongMap!17655)

(assert (=> b!1203140 (= lt!545381 (getCurrentListMapNoExtraKeys!5279 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203141 () Bool)

(declare-fun e!683184 () Bool)

(declare-fun call!57969 () ListLongMap!17655)

(declare-fun call!57970 () ListLongMap!17655)

(assert (=> b!1203141 (= e!683184 (= call!57969 call!57970))))

(declare-fun b!1203142 () Bool)

(declare-fun e!683196 () Bool)

(assert (=> b!1203142 (= e!683196 e!683189)))

(declare-fun res!800703 () Bool)

(assert (=> b!1203142 (=> res!800703 e!683189)))

(assert (=> b!1203142 (= res!800703 (not (= (select (arr!37632 _keys!1208) from!1455) k!934)))))

(assert (=> b!1203142 e!683184))

(declare-fun c!117780 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203142 (= c!117780 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39886 0))(
  ( (Unit!39887) )
))
(declare-fun lt!545387 () Unit!39886)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1015 (array!77975 array!77977 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39886)

(assert (=> b!1203142 (= lt!545387 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1015 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203143 () Bool)

(declare-fun e!683187 () Unit!39886)

(declare-fun lt!545385 () Unit!39886)

(assert (=> b!1203143 (= e!683187 lt!545385)))

(declare-fun lt!545386 () Unit!39886)

(declare-fun addStillContains!998 (ListLongMap!17655 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39886)

(assert (=> b!1203143 (= lt!545386 (addStillContains!998 lt!545381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!545392 () ListLongMap!17655)

(declare-fun call!57965 () ListLongMap!17655)

(assert (=> b!1203143 (= lt!545392 call!57965)))

(declare-fun call!57971 () Bool)

(assert (=> b!1203143 call!57971))

(declare-fun call!57967 () Unit!39886)

(assert (=> b!1203143 (= lt!545385 call!57967)))

(declare-fun +!3969 (ListLongMap!17655 tuple2!19686) ListLongMap!17655)

(assert (=> b!1203143 (contains!6897 (+!3969 lt!545392 (tuple2!19687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1203144 () Bool)

(declare-fun res!800706 () Bool)

(declare-fun e!683197 () Bool)

(assert (=> b!1203144 (=> (not res!800706) (not e!683197))))

(assert (=> b!1203144 (= res!800706 (and (= (size!38169 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38168 _keys!1208) (size!38169 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203145 () Bool)

(declare-fun res!800711 () Bool)

(assert (=> b!1203145 (=> (not res!800711) (not e!683197))))

(assert (=> b!1203145 (= res!800711 (= (select (arr!37632 _keys!1208) i!673) k!934))))

(declare-fun b!1203146 () Bool)

(declare-fun e!683185 () Unit!39886)

(assert (=> b!1203146 (= e!683187 e!683185)))

(declare-fun c!117779 () Bool)

(declare-fun lt!545382 () Bool)

(assert (=> b!1203146 (= c!117779 (and (not lt!545382) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203147 () Bool)

(assert (=> b!1203147 (= e!683186 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38168 _keys!1208))))))

(declare-fun lt!545391 () Unit!39886)

(assert (=> b!1203147 (= lt!545391 e!683187)))

(declare-fun c!117782 () Bool)

(assert (=> b!1203147 (= c!117782 (and (not lt!545382) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203147 (= lt!545382 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!57961 () Bool)

(assert (=> bm!57961 (= call!57967 (addStillContains!998 (ite c!117782 lt!545392 lt!545381) (ite c!117782 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117779 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117782 minValue!944 (ite c!117779 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1203148 () Bool)

(declare-fun res!800702 () Bool)

(assert (=> b!1203148 (=> (not res!800702) (not e!683197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203148 (= res!800702 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!47744 () Bool)

(declare-fun mapRes!47744 () Bool)

(assert (=> mapIsEmpty!47744 mapRes!47744))

(declare-fun res!800701 () Bool)

(assert (=> start!100574 (=> (not res!800701) (not e!683197))))

(assert (=> start!100574 (= res!800701 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38168 _keys!1208))))))

(assert (=> start!100574 e!683197))

(declare-fun tp_is_empty!30601 () Bool)

(assert (=> start!100574 tp_is_empty!30601))

(declare-fun array_inv!28672 (array!77975) Bool)

(assert (=> start!100574 (array_inv!28672 _keys!1208)))

(assert (=> start!100574 true))

(assert (=> start!100574 tp!90680))

(declare-fun e!683188 () Bool)

(declare-fun array_inv!28673 (array!77977) Bool)

(assert (=> start!100574 (and (array_inv!28673 _values!996) e!683188)))

(declare-fun b!1203149 () Bool)

(declare-fun e!683190 () Bool)

(assert (=> b!1203149 (= e!683190 e!683196)))

(declare-fun res!800710 () Bool)

(assert (=> b!1203149 (=> res!800710 e!683196)))

(assert (=> b!1203149 (= res!800710 (not (= from!1455 i!673)))))

(declare-fun lt!545379 () ListLongMap!17655)

(declare-fun lt!545390 () array!77977)

(assert (=> b!1203149 (= lt!545379 (getCurrentListMapNoExtraKeys!5279 lt!545388 lt!545390 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3191 (Int (_ BitVec 64)) V!45929)

(assert (=> b!1203149 (= lt!545390 (array!77978 (store (arr!37633 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3191 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38169 _values!996)))))

(declare-fun lt!545389 () ListLongMap!17655)

(assert (=> b!1203149 (= lt!545389 (getCurrentListMapNoExtraKeys!5279 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57962 () Bool)

(declare-fun call!57964 () Bool)

(assert (=> bm!57962 (= call!57964 call!57971)))

(declare-fun b!1203150 () Bool)

(declare-fun res!800709 () Bool)

(assert (=> b!1203150 (=> (not res!800709) (not e!683197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203150 (= res!800709 (validMask!0 mask!1564))))

(declare-fun bm!57963 () Bool)

(declare-fun call!57966 () ListLongMap!17655)

(assert (=> bm!57963 (= call!57971 (contains!6897 (ite c!117782 lt!545392 call!57966) k!934))))

(declare-fun bm!57964 () Bool)

(assert (=> bm!57964 (= call!57969 (getCurrentListMapNoExtraKeys!5279 lt!545388 lt!545390 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203151 () Bool)

(declare-fun e!683191 () Unit!39886)

(declare-fun Unit!39888 () Unit!39886)

(assert (=> b!1203151 (= e!683191 Unit!39888)))

(declare-fun bm!57965 () Bool)

(assert (=> bm!57965 (= call!57966 call!57965)))

(declare-fun mapNonEmpty!47744 () Bool)

(declare-fun tp!90681 () Bool)

(declare-fun e!683192 () Bool)

(assert (=> mapNonEmpty!47744 (= mapRes!47744 (and tp!90681 e!683192))))

(declare-fun mapKey!47744 () (_ BitVec 32))

(declare-fun mapValue!47744 () ValueCell!14591)

(declare-fun mapRest!47744 () (Array (_ BitVec 32) ValueCell!14591))

(assert (=> mapNonEmpty!47744 (= (arr!37633 _values!996) (store mapRest!47744 mapKey!47744 mapValue!47744))))

(declare-fun b!1203152 () Bool)

(declare-fun res!800705 () Bool)

(assert (=> b!1203152 (=> (not res!800705) (not e!683197))))

(assert (=> b!1203152 (= res!800705 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26493))))

(declare-fun b!1203153 () Bool)

(declare-fun e!683195 () Bool)

(assert (=> b!1203153 (= e!683188 (and e!683195 mapRes!47744))))

(declare-fun condMapEmpty!47744 () Bool)

(declare-fun mapDefault!47744 () ValueCell!14591)

