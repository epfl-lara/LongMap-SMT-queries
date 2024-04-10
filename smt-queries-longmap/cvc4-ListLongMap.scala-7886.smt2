; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98064 () Bool)

(assert start!98064)

(declare-fun b_free!23765 () Bool)

(declare-fun b_next!23765 () Bool)

(assert (=> start!98064 (= b_free!23765 (not b_next!23765))))

(declare-fun tp!83999 () Bool)

(declare-fun b_and!38313 () Bool)

(assert (=> start!98064 (= tp!83999 b_and!38313)))

(declare-fun b!1126010 () Bool)

(declare-fun e!640945 () Bool)

(declare-fun e!640938 () Bool)

(assert (=> b!1126010 (= e!640945 e!640938)))

(declare-fun res!752428 () Bool)

(assert (=> b!1126010 (=> res!752428 e!640938)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73453 0))(
  ( (array!73454 (arr!35379 (Array (_ BitVec 32) (_ BitVec 64))) (size!35915 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73453)

(assert (=> b!1126010 (= res!752428 (not (= (select (arr!35379 _keys!1208) from!1455) k!934)))))

(declare-fun e!640941 () Bool)

(assert (=> b!1126010 e!640941))

(declare-fun c!109638 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126010 (= c!109638 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42853 0))(
  ( (V!42854 (val!14204 Int)) )
))
(declare-fun zeroValue!944 () V!42853)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36904 0))(
  ( (Unit!36905) )
))
(declare-fun lt!500064 () Unit!36904)

(declare-datatypes ((ValueCell!13438 0))(
  ( (ValueCellFull!13438 (v!16837 V!42853)) (EmptyCell!13438) )
))
(declare-datatypes ((array!73455 0))(
  ( (array!73456 (arr!35380 (Array (_ BitVec 32) ValueCell!13438)) (size!35916 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73455)

(declare-fun minValue!944 () V!42853)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!373 (array!73453 array!73455 (_ BitVec 32) (_ BitVec 32) V!42853 V!42853 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36904)

(assert (=> b!1126010 (= lt!500064 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126011 () Bool)

(declare-fun res!752429 () Bool)

(declare-fun e!640943 () Bool)

(assert (=> b!1126011 (=> (not res!752429) (not e!640943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126011 (= res!752429 (validMask!0 mask!1564))))

(declare-fun b!1126012 () Bool)

(declare-fun res!752422 () Bool)

(assert (=> b!1126012 (=> (not res!752422) (not e!640943))))

(assert (=> b!1126012 (= res!752422 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35915 _keys!1208))))))

(declare-fun b!1126013 () Bool)

(declare-fun e!640944 () Bool)

(assert (=> b!1126013 (= e!640944 e!640945)))

(declare-fun res!752425 () Bool)

(assert (=> b!1126013 (=> res!752425 e!640945)))

(assert (=> b!1126013 (= res!752425 (not (= from!1455 i!673)))))

(declare-fun lt!500065 () array!73455)

(declare-fun lt!500067 () array!73453)

(declare-datatypes ((tuple2!17856 0))(
  ( (tuple2!17857 (_1!8939 (_ BitVec 64)) (_2!8939 V!42853)) )
))
(declare-datatypes ((List!24634 0))(
  ( (Nil!24631) (Cons!24630 (h!25839 tuple2!17856) (t!35391 List!24634)) )
))
(declare-datatypes ((ListLongMap!15825 0))(
  ( (ListLongMap!15826 (toList!7928 List!24634)) )
))
(declare-fun lt!500063 () ListLongMap!15825)

(declare-fun getCurrentListMapNoExtraKeys!4416 (array!73453 array!73455 (_ BitVec 32) (_ BitVec 32) V!42853 V!42853 (_ BitVec 32) Int) ListLongMap!15825)

(assert (=> b!1126013 (= lt!500063 (getCurrentListMapNoExtraKeys!4416 lt!500067 lt!500065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2506 (Int (_ BitVec 64)) V!42853)

(assert (=> b!1126013 (= lt!500065 (array!73456 (store (arr!35380 _values!996) i!673 (ValueCellFull!13438 (dynLambda!2506 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35916 _values!996)))))

(declare-fun lt!500066 () ListLongMap!15825)

(assert (=> b!1126013 (= lt!500066 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126014 () Bool)

(declare-fun res!752430 () Bool)

(assert (=> b!1126014 (=> (not res!752430) (not e!640943))))

(assert (=> b!1126014 (= res!752430 (and (= (size!35916 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35915 _keys!1208) (size!35916 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47574 () Bool)

(declare-fun call!47578 () ListLongMap!15825)

(assert (=> bm!47574 (= call!47578 (getCurrentListMapNoExtraKeys!4416 lt!500067 lt!500065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126016 () Bool)

(declare-fun e!640939 () Bool)

(assert (=> b!1126016 (= e!640943 e!640939)))

(declare-fun res!752431 () Bool)

(assert (=> b!1126016 (=> (not res!752431) (not e!640939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73453 (_ BitVec 32)) Bool)

(assert (=> b!1126016 (= res!752431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500067 mask!1564))))

(assert (=> b!1126016 (= lt!500067 (array!73454 (store (arr!35379 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35915 _keys!1208)))))

(declare-fun b!1126017 () Bool)

(declare-fun res!752420 () Bool)

(assert (=> b!1126017 (=> (not res!752420) (not e!640943))))

(assert (=> b!1126017 (= res!752420 (= (select (arr!35379 _keys!1208) i!673) k!934))))

(declare-fun b!1126018 () Bool)

(declare-fun call!47577 () ListLongMap!15825)

(assert (=> b!1126018 (= e!640941 (= call!47578 call!47577))))

(declare-fun b!1126019 () Bool)

(declare-fun e!640940 () Bool)

(declare-fun tp_is_empty!28295 () Bool)

(assert (=> b!1126019 (= e!640940 tp_is_empty!28295)))

(declare-fun b!1126020 () Bool)

(assert (=> b!1126020 (= e!640938 true)))

(declare-fun lt!500069 () Bool)

(declare-fun contains!6463 (ListLongMap!15825 (_ BitVec 64)) Bool)

(assert (=> b!1126020 (= lt!500069 (contains!6463 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun mapIsEmpty!44260 () Bool)

(declare-fun mapRes!44260 () Bool)

(assert (=> mapIsEmpty!44260 mapRes!44260))

(declare-fun b!1126021 () Bool)

(declare-fun res!752419 () Bool)

(assert (=> b!1126021 (=> (not res!752419) (not e!640943))))

(assert (=> b!1126021 (= res!752419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47575 () Bool)

(assert (=> bm!47575 (= call!47577 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126022 () Bool)

(declare-fun e!640947 () Bool)

(assert (=> b!1126022 (= e!640947 tp_is_empty!28295)))

(declare-fun res!752427 () Bool)

(assert (=> start!98064 (=> (not res!752427) (not e!640943))))

(assert (=> start!98064 (= res!752427 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35915 _keys!1208))))))

(assert (=> start!98064 e!640943))

(assert (=> start!98064 tp_is_empty!28295))

(declare-fun array_inv!27156 (array!73453) Bool)

(assert (=> start!98064 (array_inv!27156 _keys!1208)))

(assert (=> start!98064 true))

(assert (=> start!98064 tp!83999))

(declare-fun e!640942 () Bool)

(declare-fun array_inv!27157 (array!73455) Bool)

(assert (=> start!98064 (and (array_inv!27157 _values!996) e!640942)))

(declare-fun b!1126015 () Bool)

(assert (=> b!1126015 (= e!640939 (not e!640944))))

(declare-fun res!752421 () Bool)

(assert (=> b!1126015 (=> res!752421 e!640944)))

(assert (=> b!1126015 (= res!752421 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126015 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500068 () Unit!36904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73453 (_ BitVec 64) (_ BitVec 32)) Unit!36904)

(assert (=> b!1126015 (= lt!500068 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1126023 () Bool)

(declare-fun res!752424 () Bool)

(assert (=> b!1126023 (=> (not res!752424) (not e!640943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126023 (= res!752424 (validKeyInArray!0 k!934))))

(declare-fun b!1126024 () Bool)

(assert (=> b!1126024 (= e!640942 (and e!640940 mapRes!44260))))

(declare-fun condMapEmpty!44260 () Bool)

(declare-fun mapDefault!44260 () ValueCell!13438)

