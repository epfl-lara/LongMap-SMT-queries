; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97690 () Bool)

(assert start!97690)

(declare-fun b_free!23425 () Bool)

(declare-fun b_next!23425 () Bool)

(assert (=> start!97690 (= b_free!23425 (not b_next!23425))))

(declare-fun tp!82574 () Bool)

(declare-fun b_and!37697 () Bool)

(assert (=> start!97690 (= tp!82574 b_and!37697)))

(declare-fun res!742599 () Bool)

(declare-fun e!634912 () Bool)

(assert (=> start!97690 (=> (not res!742599) (not e!634912))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72321 0))(
  ( (array!72322 (arr!34807 (Array (_ BitVec 32) (_ BitVec 64))) (size!35344 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72321)

(assert (=> start!97690 (= res!742599 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35344 _keys!1208))))))

(assert (=> start!97690 e!634912))

(declare-fun tp_is_empty!27685 () Bool)

(assert (=> start!97690 tp_is_empty!27685))

(declare-fun array_inv!26820 (array!72321) Bool)

(assert (=> start!97690 (array_inv!26820 _keys!1208)))

(assert (=> start!97690 true))

(assert (=> start!97690 tp!82574))

(declare-datatypes ((V!42041 0))(
  ( (V!42042 (val!13899 Int)) )
))
(declare-datatypes ((ValueCell!13133 0))(
  ( (ValueCellFull!13133 (v!16528 V!42041)) (EmptyCell!13133) )
))
(declare-datatypes ((array!72323 0))(
  ( (array!72324 (arr!34808 (Array (_ BitVec 32) ValueCell!13133)) (size!35345 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72323)

(declare-fun e!634909 () Bool)

(declare-fun array_inv!26821 (array!72323) Bool)

(assert (=> start!97690 (and (array_inv!26821 _values!996) e!634909)))

(declare-fun b!1113358 () Bool)

(declare-fun res!742606 () Bool)

(assert (=> b!1113358 (=> (not res!742606) (not e!634912))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113358 (= res!742606 (validMask!0 mask!1564))))

(declare-fun b!1113359 () Bool)

(declare-fun res!742600 () Bool)

(assert (=> b!1113359 (=> (not res!742600) (not e!634912))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113359 (= res!742600 (= (select (arr!34807 _keys!1208) i!673) k0!934))))

(declare-fun b!1113360 () Bool)

(declare-fun res!742604 () Bool)

(assert (=> b!1113360 (=> (not res!742604) (not e!634912))))

(assert (=> b!1113360 (= res!742604 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35344 _keys!1208))))))

(declare-fun b!1113361 () Bool)

(declare-fun e!634907 () Bool)

(assert (=> b!1113361 (= e!634907 tp_is_empty!27685)))

(declare-fun b!1113362 () Bool)

(declare-fun res!742607 () Bool)

(assert (=> b!1113362 (=> (not res!742607) (not e!634912))))

(declare-datatypes ((List!24295 0))(
  ( (Nil!24292) (Cons!24291 (h!25509 (_ BitVec 64)) (t!34758 List!24295)) )
))
(declare-fun arrayNoDuplicates!0 (array!72321 (_ BitVec 32) List!24295) Bool)

(assert (=> b!1113362 (= res!742607 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24292))))

(declare-fun b!1113363 () Bool)

(declare-fun e!634908 () Bool)

(assert (=> b!1113363 (= e!634908 true)))

(declare-fun e!634910 () Bool)

(assert (=> b!1113363 e!634910))

(declare-fun c!109745 () Bool)

(assert (=> b!1113363 (= c!109745 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42041)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!42041)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36469 0))(
  ( (Unit!36470) )
))
(declare-fun lt!496964 () Unit!36469)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!322 (array!72321 array!72323 (_ BitVec 32) (_ BitVec 32) V!42041 V!42041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36469)

(assert (=> b!1113363 (= lt!496964 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47035 () Bool)

(declare-datatypes ((tuple2!17614 0))(
  ( (tuple2!17615 (_1!8818 (_ BitVec 64)) (_2!8818 V!42041)) )
))
(declare-datatypes ((List!24296 0))(
  ( (Nil!24293) (Cons!24292 (h!25510 tuple2!17614) (t!34759 List!24296)) )
))
(declare-datatypes ((ListLongMap!15591 0))(
  ( (ListLongMap!15592 (toList!7811 List!24296)) )
))
(declare-fun call!47039 () ListLongMap!15591)

(declare-fun getCurrentListMapNoExtraKeys!4342 (array!72321 array!72323 (_ BitVec 32) (_ BitVec 32) V!42041 V!42041 (_ BitVec 32) Int) ListLongMap!15591)

(assert (=> bm!47035 (= call!47039 (getCurrentListMapNoExtraKeys!4342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113364 () Bool)

(declare-fun call!47038 () ListLongMap!15591)

(declare-fun -!1059 (ListLongMap!15591 (_ BitVec 64)) ListLongMap!15591)

(assert (=> b!1113364 (= e!634910 (= call!47038 (-!1059 call!47039 k0!934)))))

(declare-fun b!1113365 () Bool)

(declare-fun res!742602 () Bool)

(assert (=> b!1113365 (=> (not res!742602) (not e!634912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113365 (= res!742602 (validKeyInArray!0 k0!934))))

(declare-fun b!1113366 () Bool)

(declare-fun res!742603 () Bool)

(declare-fun e!634911 () Bool)

(assert (=> b!1113366 (=> (not res!742603) (not e!634911))))

(declare-fun lt!496965 () array!72321)

(assert (=> b!1113366 (= res!742603 (arrayNoDuplicates!0 lt!496965 #b00000000000000000000000000000000 Nil!24292))))

(declare-fun b!1113367 () Bool)

(assert (=> b!1113367 (= e!634910 (= call!47038 call!47039))))

(declare-fun b!1113368 () Bool)

(assert (=> b!1113368 (= e!634912 e!634911)))

(declare-fun res!742605 () Bool)

(assert (=> b!1113368 (=> (not res!742605) (not e!634911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72321 (_ BitVec 32)) Bool)

(assert (=> b!1113368 (= res!742605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496965 mask!1564))))

(assert (=> b!1113368 (= lt!496965 (array!72322 (store (arr!34807 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35344 _keys!1208)))))

(declare-fun b!1113369 () Bool)

(declare-fun e!634914 () Bool)

(declare-fun mapRes!43345 () Bool)

(assert (=> b!1113369 (= e!634909 (and e!634914 mapRes!43345))))

(declare-fun condMapEmpty!43345 () Bool)

(declare-fun mapDefault!43345 () ValueCell!13133)

(assert (=> b!1113369 (= condMapEmpty!43345 (= (arr!34808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13133)) mapDefault!43345)))))

(declare-fun bm!47036 () Bool)

(declare-fun dynLambda!2451 (Int (_ BitVec 64)) V!42041)

(assert (=> bm!47036 (= call!47038 (getCurrentListMapNoExtraKeys!4342 lt!496965 (array!72324 (store (arr!34808 _values!996) i!673 (ValueCellFull!13133 (dynLambda!2451 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35345 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113370 () Bool)

(declare-fun res!742609 () Bool)

(assert (=> b!1113370 (=> (not res!742609) (not e!634912))))

(assert (=> b!1113370 (= res!742609 (and (= (size!35345 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35344 _keys!1208) (size!35345 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43345 () Bool)

(declare-fun tp!82573 () Bool)

(assert (=> mapNonEmpty!43345 (= mapRes!43345 (and tp!82573 e!634907))))

(declare-fun mapRest!43345 () (Array (_ BitVec 32) ValueCell!13133))

(declare-fun mapValue!43345 () ValueCell!13133)

(declare-fun mapKey!43345 () (_ BitVec 32))

(assert (=> mapNonEmpty!43345 (= (arr!34808 _values!996) (store mapRest!43345 mapKey!43345 mapValue!43345))))

(declare-fun b!1113371 () Bool)

(assert (=> b!1113371 (= e!634911 (not e!634908))))

(declare-fun res!742608 () Bool)

(assert (=> b!1113371 (=> res!742608 e!634908)))

(assert (=> b!1113371 (= res!742608 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35344 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113371 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496966 () Unit!36469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72321 (_ BitVec 64) (_ BitVec 32)) Unit!36469)

(assert (=> b!1113371 (= lt!496966 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43345 () Bool)

(assert (=> mapIsEmpty!43345 mapRes!43345))

(declare-fun b!1113372 () Bool)

(assert (=> b!1113372 (= e!634914 tp_is_empty!27685)))

(declare-fun b!1113373 () Bool)

(declare-fun res!742601 () Bool)

(assert (=> b!1113373 (=> (not res!742601) (not e!634912))))

(assert (=> b!1113373 (= res!742601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97690 res!742599) b!1113358))

(assert (= (and b!1113358 res!742606) b!1113370))

(assert (= (and b!1113370 res!742609) b!1113373))

(assert (= (and b!1113373 res!742601) b!1113362))

(assert (= (and b!1113362 res!742607) b!1113360))

(assert (= (and b!1113360 res!742604) b!1113365))

(assert (= (and b!1113365 res!742602) b!1113359))

(assert (= (and b!1113359 res!742600) b!1113368))

(assert (= (and b!1113368 res!742605) b!1113366))

(assert (= (and b!1113366 res!742603) b!1113371))

(assert (= (and b!1113371 (not res!742608)) b!1113363))

(assert (= (and b!1113363 c!109745) b!1113364))

(assert (= (and b!1113363 (not c!109745)) b!1113367))

(assert (= (or b!1113364 b!1113367) bm!47036))

(assert (= (or b!1113364 b!1113367) bm!47035))

(assert (= (and b!1113369 condMapEmpty!43345) mapIsEmpty!43345))

(assert (= (and b!1113369 (not condMapEmpty!43345)) mapNonEmpty!43345))

(get-info :version)

(assert (= (and mapNonEmpty!43345 ((_ is ValueCellFull!13133) mapValue!43345)) b!1113361))

(assert (= (and b!1113369 ((_ is ValueCellFull!13133) mapDefault!43345)) b!1113372))

(assert (= start!97690 b!1113369))

(declare-fun b_lambda!18459 () Bool)

(assert (=> (not b_lambda!18459) (not bm!47036)))

(declare-fun t!34757 () Bool)

(declare-fun tb!8283 () Bool)

(assert (=> (and start!97690 (= defaultEntry!1004 defaultEntry!1004) t!34757) tb!8283))

(declare-fun result!17135 () Bool)

(assert (=> tb!8283 (= result!17135 tp_is_empty!27685)))

(assert (=> bm!47036 t!34757))

(declare-fun b_and!37699 () Bool)

(assert (= b_and!37697 (and (=> t!34757 result!17135) b_and!37699)))

(declare-fun m!1031349 () Bool)

(assert (=> b!1113371 m!1031349))

(declare-fun m!1031351 () Bool)

(assert (=> b!1113371 m!1031351))

(declare-fun m!1031353 () Bool)

(assert (=> bm!47035 m!1031353))

(declare-fun m!1031355 () Bool)

(assert (=> b!1113365 m!1031355))

(declare-fun m!1031357 () Bool)

(assert (=> b!1113366 m!1031357))

(declare-fun m!1031359 () Bool)

(assert (=> b!1113373 m!1031359))

(declare-fun m!1031361 () Bool)

(assert (=> b!1113363 m!1031361))

(declare-fun m!1031363 () Bool)

(assert (=> b!1113359 m!1031363))

(declare-fun m!1031365 () Bool)

(assert (=> b!1113364 m!1031365))

(declare-fun m!1031367 () Bool)

(assert (=> start!97690 m!1031367))

(declare-fun m!1031369 () Bool)

(assert (=> start!97690 m!1031369))

(declare-fun m!1031371 () Bool)

(assert (=> bm!47036 m!1031371))

(declare-fun m!1031373 () Bool)

(assert (=> bm!47036 m!1031373))

(declare-fun m!1031375 () Bool)

(assert (=> bm!47036 m!1031375))

(declare-fun m!1031377 () Bool)

(assert (=> b!1113368 m!1031377))

(declare-fun m!1031379 () Bool)

(assert (=> b!1113368 m!1031379))

(declare-fun m!1031381 () Bool)

(assert (=> b!1113358 m!1031381))

(declare-fun m!1031383 () Bool)

(assert (=> mapNonEmpty!43345 m!1031383))

(declare-fun m!1031385 () Bool)

(assert (=> b!1113362 m!1031385))

(check-sat (not mapNonEmpty!43345) (not b!1113368) tp_is_empty!27685 (not bm!47036) (not b!1113371) (not b!1113365) (not b!1113366) (not b!1113364) (not b!1113362) (not b_lambda!18459) b_and!37699 (not bm!47035) (not b!1113358) (not start!97690) (not b!1113373) (not b!1113363) (not b_next!23425))
(check-sat b_and!37699 (not b_next!23425))
