; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99878 () Bool)

(assert start!99878)

(declare-fun b_free!25457 () Bool)

(declare-fun b_next!25457 () Bool)

(assert (=> start!99878 (= b_free!25457 (not b_next!25457))))

(declare-fun tp!89085 () Bool)

(declare-fun b_and!41781 () Bool)

(assert (=> start!99878 (= tp!89085 b_and!41781)))

(declare-fun b!1188413 () Bool)

(declare-fun e!675727 () Bool)

(assert (=> b!1188413 (= e!675727 true)))

(declare-datatypes ((V!45109 0))(
  ( (V!45110 (val!15050 Int)) )
))
(declare-fun zeroValue!944 () V!45109)

(declare-datatypes ((array!76769 0))(
  ( (array!76770 (arr!37034 (Array (_ BitVec 32) (_ BitVec 64))) (size!37570 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76769)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14284 0))(
  ( (ValueCellFull!14284 (v!17688 V!45109)) (EmptyCell!14284) )
))
(declare-datatypes ((array!76771 0))(
  ( (array!76772 (arr!37035 (Array (_ BitVec 32) ValueCell!14284)) (size!37571 (_ BitVec 32))) )
))
(declare-fun lt!540677 () array!76771)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!540676 () array!76769)

(declare-fun _values!996 () array!76771)

(declare-fun minValue!944 () V!45109)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!19328 0))(
  ( (tuple2!19329 (_1!9675 (_ BitVec 64)) (_2!9675 V!45109)) )
))
(declare-datatypes ((List!26069 0))(
  ( (Nil!26066) (Cons!26065 (h!27274 tuple2!19328) (t!38518 List!26069)) )
))
(declare-datatypes ((ListLongMap!17297 0))(
  ( (ListLongMap!17298 (toList!8664 List!26069)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5105 (array!76769 array!76771 (_ BitVec 32) (_ BitVec 32) V!45109 V!45109 (_ BitVec 32) Int) ListLongMap!17297)

(declare-fun -!1694 (ListLongMap!17297 (_ BitVec 64)) ListLongMap!17297)

(assert (=> b!1188413 (= (getCurrentListMapNoExtraKeys!5105 lt!540676 lt!540677 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1694 (getCurrentListMapNoExtraKeys!5105 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39426 0))(
  ( (Unit!39427) )
))
(declare-fun lt!540678 () Unit!39426)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!903 (array!76769 array!76771 (_ BitVec 32) (_ BitVec 32) V!45109 V!45109 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39426)

(assert (=> b!1188413 (= lt!540678 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!903 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188415 () Bool)

(declare-fun res!790168 () Bool)

(declare-fun e!675723 () Bool)

(assert (=> b!1188415 (=> (not res!790168) (not e!675723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76769 (_ BitVec 32)) Bool)

(assert (=> b!1188415 (= res!790168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188416 () Bool)

(declare-fun res!790167 () Bool)

(declare-fun e!675726 () Bool)

(assert (=> b!1188416 (=> (not res!790167) (not e!675726))))

(declare-datatypes ((List!26070 0))(
  ( (Nil!26067) (Cons!26066 (h!27275 (_ BitVec 64)) (t!38519 List!26070)) )
))
(declare-fun arrayNoDuplicates!0 (array!76769 (_ BitVec 32) List!26070) Bool)

(assert (=> b!1188416 (= res!790167 (arrayNoDuplicates!0 lt!540676 #b00000000000000000000000000000000 Nil!26067))))

(declare-fun b!1188417 () Bool)

(declare-fun res!790162 () Bool)

(assert (=> b!1188417 (=> (not res!790162) (not e!675723))))

(assert (=> b!1188417 (= res!790162 (= (select (arr!37034 _keys!1208) i!673) k!934))))

(declare-fun b!1188418 () Bool)

(declare-fun res!790164 () Bool)

(assert (=> b!1188418 (=> (not res!790164) (not e!675723))))

(assert (=> b!1188418 (= res!790164 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26067))))

(declare-fun mapNonEmpty!46808 () Bool)

(declare-fun mapRes!46808 () Bool)

(declare-fun tp!89084 () Bool)

(declare-fun e!675724 () Bool)

(assert (=> mapNonEmpty!46808 (= mapRes!46808 (and tp!89084 e!675724))))

(declare-fun mapValue!46808 () ValueCell!14284)

(declare-fun mapRest!46808 () (Array (_ BitVec 32) ValueCell!14284))

(declare-fun mapKey!46808 () (_ BitVec 32))

(assert (=> mapNonEmpty!46808 (= (arr!37035 _values!996) (store mapRest!46808 mapKey!46808 mapValue!46808))))

(declare-fun mapIsEmpty!46808 () Bool)

(assert (=> mapIsEmpty!46808 mapRes!46808))

(declare-fun b!1188419 () Bool)

(declare-fun e!675728 () Bool)

(assert (=> b!1188419 (= e!675728 e!675727)))

(declare-fun res!790171 () Bool)

(assert (=> b!1188419 (=> res!790171 e!675727)))

(assert (=> b!1188419 (= res!790171 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540675 () ListLongMap!17297)

(assert (=> b!1188419 (= lt!540675 (getCurrentListMapNoExtraKeys!5105 lt!540676 lt!540677 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3049 (Int (_ BitVec 64)) V!45109)

(assert (=> b!1188419 (= lt!540677 (array!76772 (store (arr!37035 _values!996) i!673 (ValueCellFull!14284 (dynLambda!3049 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37571 _values!996)))))

(declare-fun lt!540674 () ListLongMap!17297)

(assert (=> b!1188419 (= lt!540674 (getCurrentListMapNoExtraKeys!5105 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188420 () Bool)

(declare-fun res!790163 () Bool)

(assert (=> b!1188420 (=> (not res!790163) (not e!675723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188420 (= res!790163 (validMask!0 mask!1564))))

(declare-fun b!1188421 () Bool)

(declare-fun res!790166 () Bool)

(assert (=> b!1188421 (=> (not res!790166) (not e!675723))))

(assert (=> b!1188421 (= res!790166 (and (= (size!37571 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37570 _keys!1208) (size!37571 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188422 () Bool)

(declare-fun e!675725 () Bool)

(declare-fun tp_is_empty!29987 () Bool)

(assert (=> b!1188422 (= e!675725 tp_is_empty!29987)))

(declare-fun b!1188423 () Bool)

(declare-fun e!675730 () Bool)

(assert (=> b!1188423 (= e!675730 (and e!675725 mapRes!46808))))

(declare-fun condMapEmpty!46808 () Bool)

(declare-fun mapDefault!46808 () ValueCell!14284)

