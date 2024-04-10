; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98036 () Bool)

(assert start!98036)

(declare-fun b_free!23737 () Bool)

(declare-fun b_next!23737 () Bool)

(assert (=> start!98036 (= b_free!23737 (not b_next!23737))))

(declare-fun tp!83914 () Bool)

(declare-fun b_and!38257 () Bool)

(assert (=> start!98036 (= tp!83914 b_and!38257)))

(declare-fun b!1125194 () Bool)

(declare-fun e!640508 () Bool)

(declare-datatypes ((V!42817 0))(
  ( (V!42818 (val!14190 Int)) )
))
(declare-datatypes ((tuple2!17828 0))(
  ( (tuple2!17829 (_1!8925 (_ BitVec 64)) (_2!8925 V!42817)) )
))
(declare-datatypes ((List!24608 0))(
  ( (Nil!24605) (Cons!24604 (h!25813 tuple2!17828) (t!35337 List!24608)) )
))
(declare-datatypes ((ListLongMap!15797 0))(
  ( (ListLongMap!15798 (toList!7914 List!24608)) )
))
(declare-fun call!47493 () ListLongMap!15797)

(declare-fun call!47494 () ListLongMap!15797)

(assert (=> b!1125194 (= e!640508 (= call!47493 call!47494))))

(declare-fun b!1125195 () Bool)

(declare-fun e!640511 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73397 0))(
  ( (array!73398 (arr!35351 (Array (_ BitVec 32) (_ BitVec 64))) (size!35887 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73397)

(assert (=> b!1125195 (= e!640511 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35887 _keys!1208))))))

(declare-fun lt!499754 () ListLongMap!15797)

(declare-fun zeroValue!944 () V!42817)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6451 (ListLongMap!15797 (_ BitVec 64)) Bool)

(declare-fun +!3421 (ListLongMap!15797 tuple2!17828) ListLongMap!15797)

(assert (=> b!1125195 (contains!6451 (+!3421 lt!499754 (tuple2!17829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36878 0))(
  ( (Unit!36879) )
))
(declare-fun lt!499756 () Unit!36878)

(declare-fun addStillContains!683 (ListLongMap!15797 (_ BitVec 64) V!42817 (_ BitVec 64)) Unit!36878)

(assert (=> b!1125195 (= lt!499756 (addStillContains!683 lt!499754 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499758 () array!73397)

(declare-fun minValue!944 () V!42817)

(declare-datatypes ((ValueCell!13424 0))(
  ( (ValueCellFull!13424 (v!16823 V!42817)) (EmptyCell!13424) )
))
(declare-datatypes ((array!73399 0))(
  ( (array!73400 (arr!35352 (Array (_ BitVec 32) ValueCell!13424)) (size!35888 (_ BitVec 32))) )
))
(declare-fun lt!499759 () array!73399)

(declare-fun bm!47490 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4402 (array!73397 array!73399 (_ BitVec 32) (_ BitVec 32) V!42817 V!42817 (_ BitVec 32) Int) ListLongMap!15797)

(assert (=> bm!47490 (= call!47493 (getCurrentListMapNoExtraKeys!4402 lt!499758 lt!499759 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751853 () Bool)

(declare-fun e!640509 () Bool)

(assert (=> start!98036 (=> (not res!751853) (not e!640509))))

(assert (=> start!98036 (= res!751853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35887 _keys!1208))))))

(assert (=> start!98036 e!640509))

(declare-fun tp_is_empty!28267 () Bool)

(assert (=> start!98036 tp_is_empty!28267))

(declare-fun array_inv!27136 (array!73397) Bool)

(assert (=> start!98036 (array_inv!27136 _keys!1208)))

(assert (=> start!98036 true))

(assert (=> start!98036 tp!83914))

(declare-fun _values!996 () array!73399)

(declare-fun e!640502 () Bool)

(declare-fun array_inv!27137 (array!73399) Bool)

(assert (=> start!98036 (and (array_inv!27137 _values!996) e!640502)))

(declare-fun b!1125196 () Bool)

(declare-fun res!751841 () Bool)

(assert (=> b!1125196 (=> (not res!751841) (not e!640509))))

(assert (=> b!1125196 (= res!751841 (and (= (size!35888 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35887 _keys!1208) (size!35888 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125197 () Bool)

(declare-fun e!640505 () Bool)

(declare-fun e!640507 () Bool)

(assert (=> b!1125197 (= e!640505 e!640507)))

(declare-fun res!751843 () Bool)

(assert (=> b!1125197 (=> res!751843 e!640507)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125197 (= res!751843 (not (= from!1455 i!673)))))

(declare-fun lt!499757 () ListLongMap!15797)

(assert (=> b!1125197 (= lt!499757 (getCurrentListMapNoExtraKeys!4402 lt!499758 lt!499759 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2495 (Int (_ BitVec 64)) V!42817)

(assert (=> b!1125197 (= lt!499759 (array!73400 (store (arr!35352 _values!996) i!673 (ValueCellFull!13424 (dynLambda!2495 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35888 _values!996)))))

(declare-fun lt!499755 () ListLongMap!15797)

(assert (=> b!1125197 (= lt!499755 (getCurrentListMapNoExtraKeys!4402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125198 () Bool)

(declare-fun res!751852 () Bool)

(assert (=> b!1125198 (=> (not res!751852) (not e!640509))))

(assert (=> b!1125198 (= res!751852 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35887 _keys!1208))))))

(declare-fun b!1125199 () Bool)

(declare-fun res!751845 () Bool)

(assert (=> b!1125199 (=> (not res!751845) (not e!640509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125199 (= res!751845 (validMask!0 mask!1564))))

(declare-fun b!1125200 () Bool)

(declare-fun e!640503 () Bool)

(assert (=> b!1125200 (= e!640503 (not e!640505))))

(declare-fun res!751849 () Bool)

(assert (=> b!1125200 (=> res!751849 e!640505)))

(assert (=> b!1125200 (= res!751849 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125200 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499760 () Unit!36878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73397 (_ BitVec 64) (_ BitVec 32)) Unit!36878)

(assert (=> b!1125200 (= lt!499760 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!47491 () Bool)

(assert (=> bm!47491 (= call!47494 (getCurrentListMapNoExtraKeys!4402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125201 () Bool)

(declare-fun -!1116 (ListLongMap!15797 (_ BitVec 64)) ListLongMap!15797)

(assert (=> b!1125201 (= e!640508 (= call!47493 (-!1116 call!47494 k!934)))))

(declare-fun b!1125202 () Bool)

(declare-fun res!751846 () Bool)

(assert (=> b!1125202 (=> (not res!751846) (not e!640509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125202 (= res!751846 (validKeyInArray!0 k!934))))

(declare-fun b!1125203 () Bool)

(declare-fun e!640504 () Bool)

(assert (=> b!1125203 (= e!640507 e!640504)))

(declare-fun res!751854 () Bool)

(assert (=> b!1125203 (=> res!751854 e!640504)))

(assert (=> b!1125203 (= res!751854 (not (= (select (arr!35351 _keys!1208) from!1455) k!934)))))

(assert (=> b!1125203 e!640508))

(declare-fun c!109596 () Bool)

(assert (=> b!1125203 (= c!109596 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499753 () Unit!36878)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!363 (array!73397 array!73399 (_ BitVec 32) (_ BitVec 32) V!42817 V!42817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36878)

(assert (=> b!1125203 (= lt!499753 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125204 () Bool)

(declare-fun res!751851 () Bool)

(assert (=> b!1125204 (=> res!751851 e!640511)))

(assert (=> b!1125204 (= res!751851 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125205 () Bool)

(declare-fun e!640506 () Bool)

(assert (=> b!1125205 (= e!640506 tp_is_empty!28267)))

(declare-fun mapNonEmpty!44218 () Bool)

(declare-fun mapRes!44218 () Bool)

(declare-fun tp!83915 () Bool)

(assert (=> mapNonEmpty!44218 (= mapRes!44218 (and tp!83915 e!640506))))

(declare-fun mapRest!44218 () (Array (_ BitVec 32) ValueCell!13424))

(declare-fun mapKey!44218 () (_ BitVec 32))

(declare-fun mapValue!44218 () ValueCell!13424)

(assert (=> mapNonEmpty!44218 (= (arr!35352 _values!996) (store mapRest!44218 mapKey!44218 mapValue!44218))))

(declare-fun b!1125206 () Bool)

(assert (=> b!1125206 (= e!640509 e!640503)))

(declare-fun res!751848 () Bool)

(assert (=> b!1125206 (=> (not res!751848) (not e!640503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73397 (_ BitVec 32)) Bool)

(assert (=> b!1125206 (= res!751848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499758 mask!1564))))

(assert (=> b!1125206 (= lt!499758 (array!73398 (store (arr!35351 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35887 _keys!1208)))))

(declare-fun b!1125207 () Bool)

(declare-fun e!640510 () Bool)

(assert (=> b!1125207 (= e!640502 (and e!640510 mapRes!44218))))

(declare-fun condMapEmpty!44218 () Bool)

(declare-fun mapDefault!44218 () ValueCell!13424)

