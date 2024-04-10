; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100004 () Bool)

(assert start!100004)

(declare-fun b_free!25583 () Bool)

(declare-fun b_next!25583 () Bool)

(assert (=> start!100004 (= b_free!25583 (not b_next!25583))))

(declare-fun tp!89463 () Bool)

(declare-fun b_and!42033 () Bool)

(assert (=> start!100004 (= tp!89463 b_and!42033)))

(declare-fun b!1191374 () Bool)

(declare-fun e!677239 () Bool)

(declare-fun e!677242 () Bool)

(assert (=> b!1191374 (= e!677239 (not e!677242))))

(declare-fun res!792431 () Bool)

(assert (=> b!1191374 (=> res!792431 e!677242)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191374 (= res!792431 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77017 0))(
  ( (array!77018 (arr!37158 (Array (_ BitVec 32) (_ BitVec 64))) (size!37694 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77017)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191374 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39520 0))(
  ( (Unit!39521) )
))
(declare-fun lt!541811 () Unit!39520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77017 (_ BitVec 64) (_ BitVec 32)) Unit!39520)

(assert (=> b!1191374 (= lt!541811 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191375 () Bool)

(declare-fun e!677240 () Bool)

(assert (=> b!1191375 (= e!677240 true)))

(declare-datatypes ((V!45277 0))(
  ( (V!45278 (val!15113 Int)) )
))
(declare-fun zeroValue!944 () V!45277)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45277)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14347 0))(
  ( (ValueCellFull!14347 (v!17751 V!45277)) (EmptyCell!14347) )
))
(declare-datatypes ((array!77019 0))(
  ( (array!77020 (arr!37159 (Array (_ BitVec 32) ValueCell!14347)) (size!37695 (_ BitVec 32))) )
))
(declare-fun lt!541807 () array!77019)

(declare-fun lt!541809 () array!77017)

(declare-fun _values!996 () array!77019)

(declare-datatypes ((tuple2!19424 0))(
  ( (tuple2!19425 (_1!9723 (_ BitVec 64)) (_2!9723 V!45277)) )
))
(declare-datatypes ((List!26168 0))(
  ( (Nil!26165) (Cons!26164 (h!27373 tuple2!19424) (t!38743 List!26168)) )
))
(declare-datatypes ((ListLongMap!17393 0))(
  ( (ListLongMap!17394 (toList!8712 List!26168)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5153 (array!77017 array!77019 (_ BitVec 32) (_ BitVec 32) V!45277 V!45277 (_ BitVec 32) Int) ListLongMap!17393)

(declare-fun -!1737 (ListLongMap!17393 (_ BitVec 64)) ListLongMap!17393)

(assert (=> b!1191375 (= (getCurrentListMapNoExtraKeys!5153 lt!541809 lt!541807 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1737 (getCurrentListMapNoExtraKeys!5153 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541808 () Unit!39520)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!946 (array!77017 array!77019 (_ BitVec 32) (_ BitVec 32) V!45277 V!45277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39520)

(assert (=> b!1191375 (= lt!541808 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!946 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191376 () Bool)

(declare-fun res!792439 () Bool)

(declare-fun e!677235 () Bool)

(assert (=> b!1191376 (=> (not res!792439) (not e!677235))))

(assert (=> b!1191376 (= res!792439 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37694 _keys!1208))))))

(declare-fun b!1191377 () Bool)

(declare-fun res!792436 () Bool)

(assert (=> b!1191377 (=> (not res!792436) (not e!677235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77017 (_ BitVec 32)) Bool)

(assert (=> b!1191377 (= res!792436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191378 () Bool)

(declare-fun e!677238 () Bool)

(declare-fun tp_is_empty!30113 () Bool)

(assert (=> b!1191378 (= e!677238 tp_is_empty!30113)))

(declare-fun mapIsEmpty!46997 () Bool)

(declare-fun mapRes!46997 () Bool)

(assert (=> mapIsEmpty!46997 mapRes!46997))

(declare-fun b!1191380 () Bool)

(declare-fun res!792434 () Bool)

(assert (=> b!1191380 (=> (not res!792434) (not e!677235))))

(assert (=> b!1191380 (= res!792434 (= (select (arr!37158 _keys!1208) i!673) k!934))))

(declare-fun b!1191381 () Bool)

(declare-fun res!792428 () Bool)

(assert (=> b!1191381 (=> (not res!792428) (not e!677235))))

(declare-datatypes ((List!26169 0))(
  ( (Nil!26166) (Cons!26165 (h!27374 (_ BitVec 64)) (t!38744 List!26169)) )
))
(declare-fun arrayNoDuplicates!0 (array!77017 (_ BitVec 32) List!26169) Bool)

(assert (=> b!1191381 (= res!792428 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26166))))

(declare-fun b!1191382 () Bool)

(declare-fun res!792430 () Bool)

(assert (=> b!1191382 (=> (not res!792430) (not e!677235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191382 (= res!792430 (validMask!0 mask!1564))))

(declare-fun b!1191383 () Bool)

(declare-fun res!792433 () Bool)

(assert (=> b!1191383 (=> (not res!792433) (not e!677235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191383 (= res!792433 (validKeyInArray!0 k!934))))

(declare-fun b!1191384 () Bool)

(assert (=> b!1191384 (= e!677235 e!677239)))

(declare-fun res!792438 () Bool)

(assert (=> b!1191384 (=> (not res!792438) (not e!677239))))

(assert (=> b!1191384 (= res!792438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541809 mask!1564))))

(assert (=> b!1191384 (= lt!541809 (array!77018 (store (arr!37158 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37694 _keys!1208)))))

(declare-fun b!1191385 () Bool)

(declare-fun res!792432 () Bool)

(assert (=> b!1191385 (=> (not res!792432) (not e!677239))))

(assert (=> b!1191385 (= res!792432 (arrayNoDuplicates!0 lt!541809 #b00000000000000000000000000000000 Nil!26166))))

(declare-fun b!1191379 () Bool)

(declare-fun res!792429 () Bool)

(assert (=> b!1191379 (=> (not res!792429) (not e!677235))))

(assert (=> b!1191379 (= res!792429 (and (= (size!37695 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37694 _keys!1208) (size!37695 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!792435 () Bool)

(assert (=> start!100004 (=> (not res!792435) (not e!677235))))

(assert (=> start!100004 (= res!792435 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37694 _keys!1208))))))

(assert (=> start!100004 e!677235))

(assert (=> start!100004 tp_is_empty!30113))

(declare-fun array_inv!28338 (array!77017) Bool)

(assert (=> start!100004 (array_inv!28338 _keys!1208)))

(assert (=> start!100004 true))

(assert (=> start!100004 tp!89463))

(declare-fun e!677236 () Bool)

(declare-fun array_inv!28339 (array!77019) Bool)

(assert (=> start!100004 (and (array_inv!28339 _values!996) e!677236)))

(declare-fun mapNonEmpty!46997 () Bool)

(declare-fun tp!89462 () Bool)

(declare-fun e!677241 () Bool)

(assert (=> mapNonEmpty!46997 (= mapRes!46997 (and tp!89462 e!677241))))

(declare-fun mapRest!46997 () (Array (_ BitVec 32) ValueCell!14347))

(declare-fun mapValue!46997 () ValueCell!14347)

(declare-fun mapKey!46997 () (_ BitVec 32))

(assert (=> mapNonEmpty!46997 (= (arr!37159 _values!996) (store mapRest!46997 mapKey!46997 mapValue!46997))))

(declare-fun b!1191386 () Bool)

(assert (=> b!1191386 (= e!677241 tp_is_empty!30113)))

(declare-fun b!1191387 () Bool)

(assert (=> b!1191387 (= e!677242 e!677240)))

(declare-fun res!792437 () Bool)

(assert (=> b!1191387 (=> res!792437 e!677240)))

(assert (=> b!1191387 (= res!792437 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541812 () ListLongMap!17393)

(assert (=> b!1191387 (= lt!541812 (getCurrentListMapNoExtraKeys!5153 lt!541809 lt!541807 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3087 (Int (_ BitVec 64)) V!45277)

(assert (=> b!1191387 (= lt!541807 (array!77020 (store (arr!37159 _values!996) i!673 (ValueCellFull!14347 (dynLambda!3087 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37695 _values!996)))))

(declare-fun lt!541810 () ListLongMap!17393)

(assert (=> b!1191387 (= lt!541810 (getCurrentListMapNoExtraKeys!5153 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191388 () Bool)

(assert (=> b!1191388 (= e!677236 (and e!677238 mapRes!46997))))

(declare-fun condMapEmpty!46997 () Bool)

(declare-fun mapDefault!46997 () ValueCell!14347)

