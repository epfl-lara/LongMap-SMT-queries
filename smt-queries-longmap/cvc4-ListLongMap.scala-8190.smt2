; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100010 () Bool)

(assert start!100010)

(declare-fun b_free!25589 () Bool)

(declare-fun b_next!25589 () Bool)

(assert (=> start!100010 (= b_free!25589 (not b_next!25589))))

(declare-fun tp!89480 () Bool)

(declare-fun b_and!42045 () Bool)

(assert (=> start!100010 (= tp!89480 b_and!42045)))

(declare-fun b!1191515 () Bool)

(declare-fun e!677314 () Bool)

(declare-fun e!677313 () Bool)

(assert (=> b!1191515 (= e!677314 e!677313)))

(declare-fun res!792546 () Bool)

(assert (=> b!1191515 (=> res!792546 e!677313)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191515 (= res!792546 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45285 0))(
  ( (V!45286 (val!15116 Int)) )
))
(declare-datatypes ((ValueCell!14350 0))(
  ( (ValueCellFull!14350 (v!17754 V!45285)) (EmptyCell!14350) )
))
(declare-datatypes ((array!77029 0))(
  ( (array!77030 (arr!37164 (Array (_ BitVec 32) ValueCell!14350)) (size!37700 (_ BitVec 32))) )
))
(declare-fun lt!541865 () array!77029)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19428 0))(
  ( (tuple2!19429 (_1!9725 (_ BitVec 64)) (_2!9725 V!45285)) )
))
(declare-datatypes ((List!26172 0))(
  ( (Nil!26169) (Cons!26168 (h!27377 tuple2!19428) (t!38753 List!26172)) )
))
(declare-datatypes ((ListLongMap!17397 0))(
  ( (ListLongMap!17398 (toList!8714 List!26172)) )
))
(declare-fun lt!541864 () ListLongMap!17397)

(declare-fun minValue!944 () V!45285)

(declare-fun zeroValue!944 () V!45285)

(declare-datatypes ((array!77031 0))(
  ( (array!77032 (arr!37165 (Array (_ BitVec 32) (_ BitVec 64))) (size!37701 (_ BitVec 32))) )
))
(declare-fun lt!541866 () array!77031)

(declare-fun getCurrentListMapNoExtraKeys!5155 (array!77031 array!77029 (_ BitVec 32) (_ BitVec 32) V!45285 V!45285 (_ BitVec 32) Int) ListLongMap!17397)

(assert (=> b!1191515 (= lt!541864 (getCurrentListMapNoExtraKeys!5155 lt!541866 lt!541865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77029)

(declare-fun dynLambda!3089 (Int (_ BitVec 64)) V!45285)

(assert (=> b!1191515 (= lt!541865 (array!77030 (store (arr!37164 _values!996) i!673 (ValueCellFull!14350 (dynLambda!3089 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37700 _values!996)))))

(declare-fun _keys!1208 () array!77031)

(declare-fun lt!541863 () ListLongMap!17397)

(assert (=> b!1191515 (= lt!541863 (getCurrentListMapNoExtraKeys!5155 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191516 () Bool)

(declare-fun e!677309 () Bool)

(declare-fun tp_is_empty!30119 () Bool)

(assert (=> b!1191516 (= e!677309 tp_is_empty!30119)))

(declare-fun b!1191517 () Bool)

(declare-fun e!677308 () Bool)

(declare-fun e!677311 () Bool)

(assert (=> b!1191517 (= e!677308 e!677311)))

(declare-fun res!792539 () Bool)

(assert (=> b!1191517 (=> (not res!792539) (not e!677311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77031 (_ BitVec 32)) Bool)

(assert (=> b!1191517 (= res!792539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541866 mask!1564))))

(assert (=> b!1191517 (= lt!541866 (array!77032 (store (arr!37165 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37701 _keys!1208)))))

(declare-fun mapNonEmpty!47006 () Bool)

(declare-fun mapRes!47006 () Bool)

(declare-fun tp!89481 () Bool)

(assert (=> mapNonEmpty!47006 (= mapRes!47006 (and tp!89481 e!677309))))

(declare-fun mapKey!47006 () (_ BitVec 32))

(declare-fun mapRest!47006 () (Array (_ BitVec 32) ValueCell!14350))

(declare-fun mapValue!47006 () ValueCell!14350)

(assert (=> mapNonEmpty!47006 (= (arr!37164 _values!996) (store mapRest!47006 mapKey!47006 mapValue!47006))))

(declare-fun b!1191518 () Bool)

(declare-fun res!792538 () Bool)

(assert (=> b!1191518 (=> (not res!792538) (not e!677308))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1191518 (= res!792538 (= (select (arr!37165 _keys!1208) i!673) k!934))))

(declare-fun b!1191519 () Bool)

(assert (=> b!1191519 (= e!677311 (not e!677314))))

(declare-fun res!792542 () Bool)

(assert (=> b!1191519 (=> res!792542 e!677314)))

(assert (=> b!1191519 (= res!792542 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191519 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39524 0))(
  ( (Unit!39525) )
))
(declare-fun lt!541862 () Unit!39524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77031 (_ BitVec 64) (_ BitVec 32)) Unit!39524)

(assert (=> b!1191519 (= lt!541862 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191520 () Bool)

(assert (=> b!1191520 (= e!677313 true)))

(declare-fun -!1739 (ListLongMap!17397 (_ BitVec 64)) ListLongMap!17397)

(assert (=> b!1191520 (= (getCurrentListMapNoExtraKeys!5155 lt!541866 lt!541865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1739 (getCurrentListMapNoExtraKeys!5155 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541861 () Unit!39524)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!948 (array!77031 array!77029 (_ BitVec 32) (_ BitVec 32) V!45285 V!45285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39524)

(assert (=> b!1191520 (= lt!541861 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!948 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191521 () Bool)

(declare-fun res!792544 () Bool)

(assert (=> b!1191521 (=> (not res!792544) (not e!677308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191521 (= res!792544 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47006 () Bool)

(assert (=> mapIsEmpty!47006 mapRes!47006))

(declare-fun b!1191522 () Bool)

(declare-fun e!677310 () Bool)

(declare-fun e!677307 () Bool)

(assert (=> b!1191522 (= e!677310 (and e!677307 mapRes!47006))))

(declare-fun condMapEmpty!47006 () Bool)

(declare-fun mapDefault!47006 () ValueCell!14350)

