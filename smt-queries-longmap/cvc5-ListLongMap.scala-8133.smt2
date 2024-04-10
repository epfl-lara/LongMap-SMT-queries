; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99664 () Bool)

(assert start!99664)

(declare-fun b_free!25243 () Bool)

(declare-fun b_next!25243 () Bool)

(assert (=> start!99664 (= b_free!25243 (not b_next!25243))))

(declare-fun tp!88442 () Bool)

(declare-fun b_and!41353 () Bool)

(assert (=> start!99664 (= tp!88442 b_and!41353)))

(declare-fun b!1181819 () Bool)

(declare-fun res!785370 () Bool)

(declare-fun e!671909 () Bool)

(assert (=> b!1181819 (=> (not res!785370) (not e!671909))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76349 0))(
  ( (array!76350 (arr!36824 (Array (_ BitVec 32) (_ BitVec 64))) (size!37360 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76349)

(assert (=> b!1181819 (= res!785370 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37360 _keys!1208))))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1181820 () Bool)

(declare-fun e!671904 () Bool)

(declare-fun arrayContainsKey!0 (array!76349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181820 (= e!671904 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181821 () Bool)

(declare-fun res!785378 () Bool)

(assert (=> b!1181821 (=> (not res!785378) (not e!671909))))

(declare-datatypes ((List!25886 0))(
  ( (Nil!25883) (Cons!25882 (h!27091 (_ BitVec 64)) (t!38121 List!25886)) )
))
(declare-fun arrayNoDuplicates!0 (array!76349 (_ BitVec 32) List!25886) Bool)

(assert (=> b!1181821 (= res!785378 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25883))))

(declare-fun b!1181822 () Bool)

(declare-fun e!671903 () Bool)

(declare-fun e!671913 () Bool)

(assert (=> b!1181822 (= e!671903 e!671913)))

(declare-fun res!785381 () Bool)

(assert (=> b!1181822 (=> res!785381 e!671913)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181822 (= res!785381 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44825 0))(
  ( (V!44826 (val!14943 Int)) )
))
(declare-fun zeroValue!944 () V!44825)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14177 0))(
  ( (ValueCellFull!14177 (v!17581 V!44825)) (EmptyCell!14177) )
))
(declare-datatypes ((array!76351 0))(
  ( (array!76352 (arr!36825 (Array (_ BitVec 32) ValueCell!14177)) (size!37361 (_ BitVec 32))) )
))
(declare-fun lt!534680 () array!76351)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19146 0))(
  ( (tuple2!19147 (_1!9584 (_ BitVec 64)) (_2!9584 V!44825)) )
))
(declare-datatypes ((List!25887 0))(
  ( (Nil!25884) (Cons!25883 (h!27092 tuple2!19146) (t!38122 List!25887)) )
))
(declare-datatypes ((ListLongMap!17115 0))(
  ( (ListLongMap!17116 (toList!8573 List!25887)) )
))
(declare-fun lt!534690 () ListLongMap!17115)

(declare-fun minValue!944 () V!44825)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!534696 () array!76349)

(declare-fun getCurrentListMapNoExtraKeys!5026 (array!76349 array!76351 (_ BitVec 32) (_ BitVec 32) V!44825 V!44825 (_ BitVec 32) Int) ListLongMap!17115)

(assert (=> b!1181822 (= lt!534690 (getCurrentListMapNoExtraKeys!5026 lt!534696 lt!534680 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534687 () V!44825)

(declare-fun _values!996 () array!76351)

(assert (=> b!1181822 (= lt!534680 (array!76352 (store (arr!36825 _values!996) i!673 (ValueCellFull!14177 lt!534687)) (size!37361 _values!996)))))

(declare-fun dynLambda!2981 (Int (_ BitVec 64)) V!44825)

(assert (=> b!1181822 (= lt!534687 (dynLambda!2981 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534682 () ListLongMap!17115)

(assert (=> b!1181822 (= lt!534682 (getCurrentListMapNoExtraKeys!5026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181823 () Bool)

(declare-fun e!671911 () Bool)

(assert (=> b!1181823 (= e!671911 true)))

(declare-fun lt!534679 () ListLongMap!17115)

(declare-fun lt!534683 () ListLongMap!17115)

(declare-fun -!1612 (ListLongMap!17115 (_ BitVec 64)) ListLongMap!17115)

(assert (=> b!1181823 (= (-!1612 lt!534679 k!934) lt!534683)))

(declare-datatypes ((Unit!39090 0))(
  ( (Unit!39091) )
))
(declare-fun lt!534684 () Unit!39090)

(declare-fun lt!534678 () ListLongMap!17115)

(declare-fun lt!534685 () V!44825)

(declare-fun addRemoveCommutativeForDiffKeys!143 (ListLongMap!17115 (_ BitVec 64) V!44825 (_ BitVec 64)) Unit!39090)

(assert (=> b!1181823 (= lt!534684 (addRemoveCommutativeForDiffKeys!143 lt!534678 (select (arr!36824 _keys!1208) from!1455) lt!534685 k!934))))

(declare-fun lt!534695 () ListLongMap!17115)

(declare-fun lt!534693 () ListLongMap!17115)

(assert (=> b!1181823 (and (= lt!534682 lt!534679) (= lt!534693 lt!534695))))

(declare-fun lt!534681 () tuple2!19146)

(declare-fun +!3880 (ListLongMap!17115 tuple2!19146) ListLongMap!17115)

(assert (=> b!1181823 (= lt!534679 (+!3880 lt!534678 lt!534681))))

(assert (=> b!1181823 (not (= (select (arr!36824 _keys!1208) from!1455) k!934))))

(declare-fun lt!534686 () Unit!39090)

(declare-fun e!671914 () Unit!39090)

(assert (=> b!1181823 (= lt!534686 e!671914)))

(declare-fun c!116988 () Bool)

(assert (=> b!1181823 (= c!116988 (= (select (arr!36824 _keys!1208) from!1455) k!934))))

(declare-fun e!671905 () Bool)

(assert (=> b!1181823 e!671905))

(declare-fun res!785374 () Bool)

(assert (=> b!1181823 (=> (not res!785374) (not e!671905))))

(assert (=> b!1181823 (= res!785374 (= lt!534690 lt!534683))))

(assert (=> b!1181823 (= lt!534683 (+!3880 lt!534693 lt!534681))))

(assert (=> b!1181823 (= lt!534681 (tuple2!19147 (select (arr!36824 _keys!1208) from!1455) lt!534685))))

(declare-fun get!18835 (ValueCell!14177 V!44825) V!44825)

(assert (=> b!1181823 (= lt!534685 (get!18835 (select (arr!36825 _values!996) from!1455) lt!534687))))

(declare-fun b!1181824 () Bool)

(declare-fun res!785376 () Bool)

(assert (=> b!1181824 (=> (not res!785376) (not e!671909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181824 (= res!785376 (validMask!0 mask!1564))))

(declare-fun b!1181825 () Bool)

(declare-fun res!785377 () Bool)

(assert (=> b!1181825 (=> (not res!785377) (not e!671909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76349 (_ BitVec 32)) Bool)

(assert (=> b!1181825 (= res!785377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!785372 () Bool)

(assert (=> start!99664 (=> (not res!785372) (not e!671909))))

(assert (=> start!99664 (= res!785372 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37360 _keys!1208))))))

(assert (=> start!99664 e!671909))

(declare-fun tp_is_empty!29773 () Bool)

(assert (=> start!99664 tp_is_empty!29773))

(declare-fun array_inv!28116 (array!76349) Bool)

(assert (=> start!99664 (array_inv!28116 _keys!1208)))

(assert (=> start!99664 true))

(assert (=> start!99664 tp!88442))

(declare-fun e!671910 () Bool)

(declare-fun array_inv!28117 (array!76351) Bool)

(assert (=> start!99664 (and (array_inv!28117 _values!996) e!671910)))

(declare-fun b!1181826 () Bool)

(declare-fun e!671912 () Bool)

(assert (=> b!1181826 (= e!671912 (not e!671903))))

(declare-fun res!785375 () Bool)

(assert (=> b!1181826 (=> res!785375 e!671903)))

(assert (=> b!1181826 (= res!785375 (bvsgt from!1455 i!673))))

(assert (=> b!1181826 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534688 () Unit!39090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76349 (_ BitVec 64) (_ BitVec 32)) Unit!39090)

(assert (=> b!1181826 (= lt!534688 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181827 () Bool)

(declare-fun e!671907 () Bool)

(declare-fun mapRes!46487 () Bool)

(assert (=> b!1181827 (= e!671910 (and e!671907 mapRes!46487))))

(declare-fun condMapEmpty!46487 () Bool)

(declare-fun mapDefault!46487 () ValueCell!14177)

