; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97892 () Bool)

(assert start!97892)

(declare-fun b_free!23593 () Bool)

(declare-fun b_next!23593 () Bool)

(assert (=> start!97892 (= b_free!23593 (not b_next!23593))))

(declare-fun tp!83482 () Bool)

(declare-fun b_and!37969 () Bool)

(assert (=> start!97892 (= tp!83482 b_and!37969)))

(declare-fun b!1121057 () Bool)

(declare-fun res!748928 () Bool)

(declare-fun e!638324 () Bool)

(assert (=> b!1121057 (=> (not res!748928) (not e!638324))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121057 (= res!748928 (validKeyInArray!0 k!934))))

(declare-fun b!1121058 () Bool)

(declare-fun e!638326 () Bool)

(declare-fun tp_is_empty!28123 () Bool)

(assert (=> b!1121058 (= e!638326 tp_is_empty!28123)))

(declare-fun mapIsEmpty!44002 () Bool)

(declare-fun mapRes!44002 () Bool)

(assert (=> mapIsEmpty!44002 mapRes!44002))

(declare-fun b!1121059 () Bool)

(declare-fun e!638321 () Bool)

(declare-fun e!638323 () Bool)

(assert (=> b!1121059 (= e!638321 e!638323)))

(declare-fun res!748929 () Bool)

(assert (=> b!1121059 (=> res!748929 e!638323)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121059 (= res!748929 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42625 0))(
  ( (V!42626 (val!14118 Int)) )
))
(declare-fun zeroValue!944 () V!42625)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17718 0))(
  ( (tuple2!17719 (_1!8870 (_ BitVec 64)) (_2!8870 V!42625)) )
))
(declare-datatypes ((List!24502 0))(
  ( (Nil!24499) (Cons!24498 (h!25707 tuple2!17718) (t!35087 List!24502)) )
))
(declare-datatypes ((ListLongMap!15687 0))(
  ( (ListLongMap!15688 (toList!7859 List!24502)) )
))
(declare-fun lt!498230 () ListLongMap!15687)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!73127 0))(
  ( (array!73128 (arr!35216 (Array (_ BitVec 32) (_ BitVec 64))) (size!35752 (_ BitVec 32))) )
))
(declare-fun lt!498233 () array!73127)

(declare-datatypes ((ValueCell!13352 0))(
  ( (ValueCellFull!13352 (v!16751 V!42625)) (EmptyCell!13352) )
))
(declare-datatypes ((array!73129 0))(
  ( (array!73130 (arr!35217 (Array (_ BitVec 32) ValueCell!13352)) (size!35753 (_ BitVec 32))) )
))
(declare-fun lt!498228 () array!73129)

(declare-fun minValue!944 () V!42625)

(declare-fun getCurrentListMapNoExtraKeys!4348 (array!73127 array!73129 (_ BitVec 32) (_ BitVec 32) V!42625 V!42625 (_ BitVec 32) Int) ListLongMap!15687)

(assert (=> b!1121059 (= lt!498230 (getCurrentListMapNoExtraKeys!4348 lt!498233 lt!498228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73129)

(declare-fun dynLambda!2450 (Int (_ BitVec 64)) V!42625)

(assert (=> b!1121059 (= lt!498228 (array!73130 (store (arr!35217 _values!996) i!673 (ValueCellFull!13352 (dynLambda!2450 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35753 _values!996)))))

(declare-fun _keys!1208 () array!73127)

(declare-fun lt!498229 () ListLongMap!15687)

(assert (=> b!1121059 (= lt!498229 (getCurrentListMapNoExtraKeys!4348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121060 () Bool)

(declare-fun e!638320 () Bool)

(assert (=> b!1121060 (= e!638324 e!638320)))

(declare-fun res!748938 () Bool)

(assert (=> b!1121060 (=> (not res!748938) (not e!638320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73127 (_ BitVec 32)) Bool)

(assert (=> b!1121060 (= res!748938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498233 mask!1564))))

(assert (=> b!1121060 (= lt!498233 (array!73128 (store (arr!35216 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35752 _keys!1208)))))

(declare-fun b!1121061 () Bool)

(declare-fun call!47062 () ListLongMap!15687)

(declare-fun call!47061 () ListLongMap!15687)

(declare-fun e!638328 () Bool)

(declare-fun -!1071 (ListLongMap!15687 (_ BitVec 64)) ListLongMap!15687)

(assert (=> b!1121061 (= e!638328 (= call!47061 (-!1071 call!47062 k!934)))))

(declare-fun b!1121062 () Bool)

(declare-fun res!748935 () Bool)

(assert (=> b!1121062 (=> (not res!748935) (not e!638324))))

(assert (=> b!1121062 (= res!748935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121063 () Bool)

(declare-fun res!748934 () Bool)

(assert (=> b!1121063 (=> (not res!748934) (not e!638324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121063 (= res!748934 (validMask!0 mask!1564))))

(declare-fun b!1121064 () Bool)

(declare-fun res!748939 () Bool)

(assert (=> b!1121064 (=> (not res!748939) (not e!638320))))

(declare-datatypes ((List!24503 0))(
  ( (Nil!24500) (Cons!24499 (h!25708 (_ BitVec 64)) (t!35088 List!24503)) )
))
(declare-fun arrayNoDuplicates!0 (array!73127 (_ BitVec 32) List!24503) Bool)

(assert (=> b!1121064 (= res!748939 (arrayNoDuplicates!0 lt!498233 #b00000000000000000000000000000000 Nil!24500))))

(declare-fun bm!47058 () Bool)

(assert (=> bm!47058 (= call!47061 (getCurrentListMapNoExtraKeys!4348 lt!498233 lt!498228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121065 () Bool)

(assert (=> b!1121065 (= e!638328 (= call!47061 call!47062))))

(declare-fun b!1121066 () Bool)

(declare-fun res!748933 () Bool)

(assert (=> b!1121066 (=> (not res!748933) (not e!638324))))

(assert (=> b!1121066 (= res!748933 (= (select (arr!35216 _keys!1208) i!673) k!934))))

(declare-fun b!1121067 () Bool)

(assert (=> b!1121067 (= e!638323 true)))

(assert (=> b!1121067 e!638328))

(declare-fun c!109380 () Bool)

(assert (=> b!1121067 (= c!109380 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36780 0))(
  ( (Unit!36781) )
))
(declare-fun lt!498231 () Unit!36780)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!319 (array!73127 array!73129 (_ BitVec 32) (_ BitVec 32) V!42625 V!42625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36780)

(assert (=> b!1121067 (= lt!498231 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121068 () Bool)

(declare-fun res!748937 () Bool)

(assert (=> b!1121068 (=> (not res!748937) (not e!638324))))

(assert (=> b!1121068 (= res!748937 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35752 _keys!1208))))))

(declare-fun b!1121069 () Bool)

(declare-fun e!638327 () Bool)

(assert (=> b!1121069 (= e!638327 tp_is_empty!28123)))

(declare-fun bm!47059 () Bool)

(assert (=> bm!47059 (= call!47062 (getCurrentListMapNoExtraKeys!4348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44002 () Bool)

(declare-fun tp!83483 () Bool)

(assert (=> mapNonEmpty!44002 (= mapRes!44002 (and tp!83483 e!638327))))

(declare-fun mapKey!44002 () (_ BitVec 32))

(declare-fun mapValue!44002 () ValueCell!13352)

(declare-fun mapRest!44002 () (Array (_ BitVec 32) ValueCell!13352))

(assert (=> mapNonEmpty!44002 (= (arr!35217 _values!996) (store mapRest!44002 mapKey!44002 mapValue!44002))))

(declare-fun res!748932 () Bool)

(assert (=> start!97892 (=> (not res!748932) (not e!638324))))

(assert (=> start!97892 (= res!748932 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35752 _keys!1208))))))

(assert (=> start!97892 e!638324))

(assert (=> start!97892 tp_is_empty!28123))

(declare-fun array_inv!27048 (array!73127) Bool)

(assert (=> start!97892 (array_inv!27048 _keys!1208)))

(assert (=> start!97892 true))

(assert (=> start!97892 tp!83482))

(declare-fun e!638322 () Bool)

(declare-fun array_inv!27049 (array!73129) Bool)

(assert (=> start!97892 (and (array_inv!27049 _values!996) e!638322)))

(declare-fun b!1121070 () Bool)

(assert (=> b!1121070 (= e!638322 (and e!638326 mapRes!44002))))

(declare-fun condMapEmpty!44002 () Bool)

(declare-fun mapDefault!44002 () ValueCell!13352)

