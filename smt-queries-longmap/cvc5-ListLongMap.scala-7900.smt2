; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98144 () Bool)

(assert start!98144)

(declare-fun b_free!23845 () Bool)

(declare-fun b_next!23845 () Bool)

(assert (=> start!98144 (= b_free!23845 (not b_next!23845))))

(declare-fun tp!84238 () Bool)

(declare-fun b_and!38473 () Bool)

(assert (=> start!98144 (= tp!84238 b_and!38473)))

(declare-fun b!1128259 () Bool)

(declare-fun res!753995 () Bool)

(declare-fun e!642145 () Bool)

(assert (=> b!1128259 (=> (not res!753995) (not e!642145))))

(declare-datatypes ((array!73609 0))(
  ( (array!73610 (arr!35457 (Array (_ BitVec 32) (_ BitVec 64))) (size!35993 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73609)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73609 (_ BitVec 32)) Bool)

(assert (=> b!1128259 (= res!753995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!753992 () Bool)

(assert (=> start!98144 (=> (not res!753992) (not e!642145))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98144 (= res!753992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35993 _keys!1208))))))

(assert (=> start!98144 e!642145))

(declare-fun tp_is_empty!28375 () Bool)

(assert (=> start!98144 tp_is_empty!28375))

(declare-fun array_inv!27206 (array!73609) Bool)

(assert (=> start!98144 (array_inv!27206 _keys!1208)))

(assert (=> start!98144 true))

(assert (=> start!98144 tp!84238))

(declare-datatypes ((V!42961 0))(
  ( (V!42962 (val!14244 Int)) )
))
(declare-datatypes ((ValueCell!13478 0))(
  ( (ValueCellFull!13478 (v!16877 V!42961)) (EmptyCell!13478) )
))
(declare-datatypes ((array!73611 0))(
  ( (array!73612 (arr!35458 (Array (_ BitVec 32) ValueCell!13478)) (size!35994 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73611)

(declare-fun e!642142 () Bool)

(declare-fun array_inv!27207 (array!73611) Bool)

(assert (=> start!98144 (and (array_inv!27207 _values!996) e!642142)))

(declare-fun mapIsEmpty!44380 () Bool)

(declare-fun mapRes!44380 () Bool)

(assert (=> mapIsEmpty!44380 mapRes!44380))

(declare-fun zeroValue!944 () V!42961)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!500896 () array!73611)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500894 () array!73609)

(declare-datatypes ((tuple2!17924 0))(
  ( (tuple2!17925 (_1!8973 (_ BitVec 64)) (_2!8973 V!42961)) )
))
(declare-datatypes ((List!24694 0))(
  ( (Nil!24691) (Cons!24690 (h!25899 tuple2!17924) (t!35531 List!24694)) )
))
(declare-datatypes ((ListLongMap!15893 0))(
  ( (ListLongMap!15894 (toList!7962 List!24694)) )
))
(declare-fun call!47817 () ListLongMap!15893)

(declare-fun minValue!944 () V!42961)

(declare-fun bm!47814 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4449 (array!73609 array!73611 (_ BitVec 32) (_ BitVec 32) V!42961 V!42961 (_ BitVec 32) Int) ListLongMap!15893)

(assert (=> bm!47814 (= call!47817 (getCurrentListMapNoExtraKeys!4449 lt!500894 lt!500896 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128260 () Bool)

(declare-fun res!753997 () Bool)

(assert (=> b!1128260 (=> (not res!753997) (not e!642145))))

(assert (=> b!1128260 (= res!753997 (and (= (size!35994 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35993 _keys!1208) (size!35994 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128261 () Bool)

(declare-fun e!642138 () Bool)

(declare-fun e!642140 () Bool)

(assert (=> b!1128261 (= e!642138 (not e!642140))))

(declare-fun res!753998 () Bool)

(assert (=> b!1128261 (=> res!753998 e!642140)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128261 (= res!753998 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128261 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36964 0))(
  ( (Unit!36965) )
))
(declare-fun lt!500895 () Unit!36964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73609 (_ BitVec 64) (_ BitVec 32)) Unit!36964)

(assert (=> b!1128261 (= lt!500895 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!44380 () Bool)

(declare-fun tp!84239 () Bool)

(declare-fun e!642143 () Bool)

(assert (=> mapNonEmpty!44380 (= mapRes!44380 (and tp!84239 e!642143))))

(declare-fun mapRest!44380 () (Array (_ BitVec 32) ValueCell!13478))

(declare-fun mapValue!44380 () ValueCell!13478)

(declare-fun mapKey!44380 () (_ BitVec 32))

(assert (=> mapNonEmpty!44380 (= (arr!35458 _values!996) (store mapRest!44380 mapKey!44380 mapValue!44380))))

(declare-fun b!1128262 () Bool)

(declare-fun e!642139 () Bool)

(assert (=> b!1128262 (= e!642142 (and e!642139 mapRes!44380))))

(declare-fun condMapEmpty!44380 () Bool)

(declare-fun mapDefault!44380 () ValueCell!13478)

