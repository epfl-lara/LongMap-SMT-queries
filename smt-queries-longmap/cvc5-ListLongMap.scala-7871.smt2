; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97970 () Bool)

(assert start!97970)

(declare-fun b_free!23671 () Bool)

(declare-fun b_next!23671 () Bool)

(assert (=> start!97970 (= b_free!23671 (not b_next!23671))))

(declare-fun tp!83716 () Bool)

(declare-fun b_and!38125 () Bool)

(assert (=> start!97970 (= tp!83716 b_and!38125)))

(declare-fun b!1123189 () Bool)

(declare-fun res!750400 () Bool)

(declare-fun e!639446 () Bool)

(assert (=> b!1123189 (=> (not res!750400) (not e!639446))))

(declare-datatypes ((array!73273 0))(
  ( (array!73274 (arr!35289 (Array (_ BitVec 32) (_ BitVec 64))) (size!35825 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73273)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73273 (_ BitVec 32)) Bool)

(assert (=> b!1123189 (= res!750400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42729 0))(
  ( (V!42730 (val!14157 Int)) )
))
(declare-fun zeroValue!944 () V!42729)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47292 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13391 0))(
  ( (ValueCellFull!13391 (v!16790 V!42729)) (EmptyCell!13391) )
))
(declare-datatypes ((array!73275 0))(
  ( (array!73276 (arr!35290 (Array (_ BitVec 32) ValueCell!13391)) (size!35826 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73275)

(declare-fun minValue!944 () V!42729)

(declare-datatypes ((tuple2!17780 0))(
  ( (tuple2!17781 (_1!8901 (_ BitVec 64)) (_2!8901 V!42729)) )
))
(declare-datatypes ((List!24559 0))(
  ( (Nil!24556) (Cons!24555 (h!25764 tuple2!17780) (t!35222 List!24559)) )
))
(declare-datatypes ((ListLongMap!15749 0))(
  ( (ListLongMap!15750 (toList!7890 List!24559)) )
))
(declare-fun call!47296 () ListLongMap!15749)

(declare-fun getCurrentListMapNoExtraKeys!4378 (array!73273 array!73275 (_ BitVec 32) (_ BitVec 32) V!42729 V!42729 (_ BitVec 32) Int) ListLongMap!15749)

(assert (=> bm!47292 (= call!47296 (getCurrentListMapNoExtraKeys!4378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123190 () Bool)

(declare-fun res!750407 () Bool)

(assert (=> b!1123190 (=> (not res!750407) (not e!639446))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123190 (= res!750407 (= (select (arr!35289 _keys!1208) i!673) k!934))))

(declare-fun b!1123191 () Bool)

(declare-fun res!750401 () Bool)

(assert (=> b!1123191 (=> (not res!750401) (not e!639446))))

(assert (=> b!1123191 (= res!750401 (and (= (size!35826 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35825 _keys!1208) (size!35826 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123192 () Bool)

(declare-fun e!639443 () Bool)

(declare-fun e!639439 () Bool)

(assert (=> b!1123192 (= e!639443 e!639439)))

(declare-fun res!750408 () Bool)

(assert (=> b!1123192 (=> res!750408 e!639439)))

(assert (=> b!1123192 (= res!750408 (not (= from!1455 i!673)))))

(declare-fun lt!498996 () array!73273)

(declare-fun lt!498999 () array!73275)

(declare-fun lt!498995 () ListLongMap!15749)

(assert (=> b!1123192 (= lt!498995 (getCurrentListMapNoExtraKeys!4378 lt!498996 lt!498999 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2474 (Int (_ BitVec 64)) V!42729)

(assert (=> b!1123192 (= lt!498999 (array!73276 (store (arr!35290 _values!996) i!673 (ValueCellFull!13391 (dynLambda!2474 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35826 _values!996)))))

(declare-fun lt!498997 () ListLongMap!15749)

(assert (=> b!1123192 (= lt!498997 (getCurrentListMapNoExtraKeys!4378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123193 () Bool)

(declare-fun e!639445 () Bool)

(declare-fun tp_is_empty!28201 () Bool)

(assert (=> b!1123193 (= e!639445 tp_is_empty!28201)))

(declare-fun b!1123194 () Bool)

(declare-fun res!750398 () Bool)

(assert (=> b!1123194 (=> (not res!750398) (not e!639446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123194 (= res!750398 (validMask!0 mask!1564))))

(declare-fun b!1123195 () Bool)

(declare-fun e!639438 () Bool)

(assert (=> b!1123195 (= e!639438 (not e!639443))))

(declare-fun res!750403 () Bool)

(assert (=> b!1123195 (=> res!750403 e!639443)))

(assert (=> b!1123195 (= res!750403 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123195 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36836 0))(
  ( (Unit!36837) )
))
(declare-fun lt!499001 () Unit!36836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73273 (_ BitVec 64) (_ BitVec 32)) Unit!36836)

(assert (=> b!1123195 (= lt!499001 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!750405 () Bool)

(assert (=> start!97970 (=> (not res!750405) (not e!639446))))

(assert (=> start!97970 (= res!750405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35825 _keys!1208))))))

(assert (=> start!97970 e!639446))

(assert (=> start!97970 tp_is_empty!28201))

(declare-fun array_inv!27094 (array!73273) Bool)

(assert (=> start!97970 (array_inv!27094 _keys!1208)))

(assert (=> start!97970 true))

(assert (=> start!97970 tp!83716))

(declare-fun e!639447 () Bool)

(declare-fun array_inv!27095 (array!73275) Bool)

(assert (=> start!97970 (and (array_inv!27095 _values!996) e!639447)))

(declare-fun b!1123196 () Bool)

(declare-fun e!639440 () Bool)

(assert (=> b!1123196 (= e!639439 e!639440)))

(declare-fun res!750402 () Bool)

(assert (=> b!1123196 (=> res!750402 e!639440)))

(assert (=> b!1123196 (= res!750402 (not (= (select (arr!35289 _keys!1208) from!1455) k!934)))))

(declare-fun e!639442 () Bool)

(assert (=> b!1123196 e!639442))

(declare-fun c!109497 () Bool)

(assert (=> b!1123196 (= c!109497 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499000 () Unit!36836)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!343 (array!73273 array!73275 (_ BitVec 32) (_ BitVec 32) V!42729 V!42729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36836)

(assert (=> b!1123196 (= lt!499000 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123197 () Bool)

(declare-fun res!750409 () Bool)

(assert (=> b!1123197 (=> (not res!750409) (not e!639446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123197 (= res!750409 (validKeyInArray!0 k!934))))

(declare-fun bm!47293 () Bool)

(declare-fun call!47295 () ListLongMap!15749)

(assert (=> bm!47293 (= call!47295 (getCurrentListMapNoExtraKeys!4378 lt!498996 lt!498999 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123198 () Bool)

(declare-fun e!639441 () Bool)

(declare-fun mapRes!44119 () Bool)

(assert (=> b!1123198 (= e!639447 (and e!639441 mapRes!44119))))

(declare-fun condMapEmpty!44119 () Bool)

(declare-fun mapDefault!44119 () ValueCell!13391)

