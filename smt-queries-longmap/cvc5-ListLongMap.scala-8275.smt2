; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100750 () Bool)

(assert start!100750)

(declare-fun b_free!25921 () Bool)

(declare-fun b_next!25921 () Bool)

(assert (=> start!100750 (= b_free!25921 (not b_next!25921))))

(declare-fun tp!90765 () Bool)

(declare-fun b_and!42825 () Bool)

(assert (=> start!100750 (= tp!90765 b_and!42825)))

(declare-fun b!1205177 () Bool)

(declare-datatypes ((Unit!39955 0))(
  ( (Unit!39956) )
))
(declare-fun e!684409 () Unit!39955)

(declare-fun e!684412 () Unit!39955)

(assert (=> b!1205177 (= e!684409 e!684412)))

(declare-fun c!118236 () Bool)

(declare-fun lt!546611 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1205177 (= c!118236 (and (not lt!546611) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205178 () Bool)

(declare-fun e!684416 () Bool)

(declare-fun tp_is_empty!30625 () Bool)

(assert (=> b!1205178 (= e!684416 tp_is_empty!30625)))

(declare-fun b!1205179 () Bool)

(declare-fun e!684411 () Bool)

(declare-datatypes ((V!45961 0))(
  ( (V!45962 (val!15369 Int)) )
))
(declare-datatypes ((tuple2!19710 0))(
  ( (tuple2!19711 (_1!9866 (_ BitVec 64)) (_2!9866 V!45961)) )
))
(declare-datatypes ((List!26517 0))(
  ( (Nil!26514) (Cons!26513 (h!27722 tuple2!19710) (t!39418 List!26517)) )
))
(declare-datatypes ((ListLongMap!17679 0))(
  ( (ListLongMap!17680 (toList!8855 List!26517)) )
))
(declare-fun call!58383 () ListLongMap!17679)

(declare-fun call!58382 () ListLongMap!17679)

(assert (=> b!1205179 (= e!684411 (= call!58383 call!58382))))

(declare-fun zeroValue!944 () V!45961)

(declare-fun bm!58377 () Bool)

(declare-datatypes ((array!78031 0))(
  ( (array!78032 (arr!37656 (Array (_ BitVec 32) (_ BitVec 64))) (size!38192 (_ BitVec 32))) )
))
(declare-fun lt!546613 () array!78031)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45961)

(declare-datatypes ((ValueCell!14603 0))(
  ( (ValueCellFull!14603 (v!18013 V!45961)) (EmptyCell!14603) )
))
(declare-datatypes ((array!78033 0))(
  ( (array!78034 (arr!37657 (Array (_ BitVec 32) ValueCell!14603)) (size!38193 (_ BitVec 32))) )
))
(declare-fun lt!546609 () array!78033)

(declare-fun getCurrentListMapNoExtraKeys!5291 (array!78031 array!78033 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 32) Int) ListLongMap!17679)

(assert (=> bm!58377 (= call!58383 (getCurrentListMapNoExtraKeys!5291 lt!546613 lt!546609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!78031)

(declare-fun e!684418 () Bool)

(declare-fun b!1205180 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205180 (= e!684418 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205181 () Bool)

(declare-fun call!58386 () Bool)

(assert (=> b!1205181 call!58386))

(declare-fun lt!546612 () Unit!39955)

(declare-fun call!58385 () Unit!39955)

(assert (=> b!1205181 (= lt!546612 call!58385)))

(assert (=> b!1205181 (= e!684412 lt!546612)))

(declare-fun b!1205182 () Bool)

(declare-fun e!684422 () Bool)

(declare-fun e!684413 () Bool)

(assert (=> b!1205182 (= e!684422 (not e!684413))))

(declare-fun res!801664 () Bool)

(assert (=> b!1205182 (=> res!801664 e!684413)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205182 (= res!801664 (bvsgt from!1455 i!673))))

(assert (=> b!1205182 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!546616 () Unit!39955)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78031 (_ BitVec 64) (_ BitVec 32)) Unit!39955)

(assert (=> b!1205182 (= lt!546616 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun call!58380 () Unit!39955)

(declare-fun lt!546605 () ListLongMap!17679)

(declare-fun lt!546606 () ListLongMap!17679)

(declare-fun bm!58378 () Bool)

(declare-fun c!118235 () Bool)

(declare-fun addStillContains!1009 (ListLongMap!17679 (_ BitVec 64) V!45961 (_ BitVec 64)) Unit!39955)

(assert (=> bm!58378 (= call!58380 (addStillContains!1009 (ite c!118235 lt!546605 lt!546606) (ite c!118235 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118236 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118235 minValue!944 (ite c!118236 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!58379 () Bool)

(declare-fun call!58384 () ListLongMap!17679)

(declare-fun call!58381 () ListLongMap!17679)

(assert (=> bm!58379 (= call!58384 call!58381)))

(declare-fun e!684415 () Bool)

(declare-fun b!1205183 () Bool)

(assert (=> b!1205183 (= e!684415 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546611) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205184 () Bool)

(declare-fun e!684419 () Unit!39955)

(declare-fun Unit!39957 () Unit!39955)

(assert (=> b!1205184 (= e!684419 Unit!39957)))

(declare-fun bm!58380 () Bool)

(declare-fun _values!996 () array!78033)

(assert (=> bm!58380 (= call!58382 (getCurrentListMapNoExtraKeys!5291 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58381 () Bool)

(assert (=> bm!58381 (= call!58385 call!58380)))

(declare-fun mapNonEmpty!47793 () Bool)

(declare-fun mapRes!47793 () Bool)

(declare-fun tp!90766 () Bool)

(declare-fun e!684414 () Bool)

(assert (=> mapNonEmpty!47793 (= mapRes!47793 (and tp!90766 e!684414))))

(declare-fun mapRest!47793 () (Array (_ BitVec 32) ValueCell!14603))

(declare-fun mapValue!47793 () ValueCell!14603)

(declare-fun mapKey!47793 () (_ BitVec 32))

(assert (=> mapNonEmpty!47793 (= (arr!37657 _values!996) (store mapRest!47793 mapKey!47793 mapValue!47793))))

(declare-fun b!1205185 () Bool)

(assert (=> b!1205185 (= e!684414 tp_is_empty!30625)))

(declare-fun b!1205186 () Bool)

(declare-fun lt!546618 () Unit!39955)

(assert (=> b!1205186 (= e!684409 lt!546618)))

(declare-fun lt!546619 () Unit!39955)

(assert (=> b!1205186 (= lt!546619 (addStillContains!1009 lt!546606 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun +!3980 (ListLongMap!17679 tuple2!19710) ListLongMap!17679)

(assert (=> b!1205186 (= lt!546605 (+!3980 lt!546606 (tuple2!19711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58387 () Bool)

(assert (=> b!1205186 call!58387))

(assert (=> b!1205186 (= lt!546618 call!58380)))

(declare-fun contains!6916 (ListLongMap!17679 (_ BitVec 64)) Bool)

(assert (=> b!1205186 (contains!6916 call!58381 k!934)))

(declare-fun b!1205187 () Bool)

(declare-fun res!801653 () Bool)

(declare-fun e!684420 () Bool)

(assert (=> b!1205187 (=> (not res!801653) (not e!684420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78031 (_ BitVec 32)) Bool)

(assert (=> b!1205187 (= res!801653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205188 () Bool)

(assert (=> b!1205188 (= e!684420 e!684422)))

(declare-fun res!801656 () Bool)

(assert (=> b!1205188 (=> (not res!801656) (not e!684422))))

(assert (=> b!1205188 (= res!801656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546613 mask!1564))))

(assert (=> b!1205188 (= lt!546613 (array!78032 (store (arr!37656 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))

(declare-fun res!801658 () Bool)

(assert (=> start!100750 (=> (not res!801658) (not e!684420))))

(assert (=> start!100750 (= res!801658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38192 _keys!1208))))))

(assert (=> start!100750 e!684420))

(assert (=> start!100750 tp_is_empty!30625))

(declare-fun array_inv!28690 (array!78031) Bool)

(assert (=> start!100750 (array_inv!28690 _keys!1208)))

(assert (=> start!100750 true))

(assert (=> start!100750 tp!90765))

(declare-fun e!684408 () Bool)

(declare-fun array_inv!28691 (array!78033) Bool)

(assert (=> start!100750 (and (array_inv!28691 _values!996) e!684408)))

(declare-fun b!1205189 () Bool)

(declare-fun e!684407 () Bool)

(assert (=> b!1205189 (= e!684413 e!684407)))

(declare-fun res!801665 () Bool)

(assert (=> b!1205189 (=> res!801665 e!684407)))

(assert (=> b!1205189 (= res!801665 (not (= from!1455 i!673)))))

(declare-fun lt!546615 () ListLongMap!17679)

(assert (=> b!1205189 (= lt!546615 (getCurrentListMapNoExtraKeys!5291 lt!546613 lt!546609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3201 (Int (_ BitVec 64)) V!45961)

(assert (=> b!1205189 (= lt!546609 (array!78034 (store (arr!37657 _values!996) i!673 (ValueCellFull!14603 (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)))))

(declare-fun lt!546608 () ListLongMap!17679)

(assert (=> b!1205189 (= lt!546608 (getCurrentListMapNoExtraKeys!5291 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47793 () Bool)

(assert (=> mapIsEmpty!47793 mapRes!47793))

(declare-fun b!1205190 () Bool)

(declare-fun res!801659 () Bool)

(assert (=> b!1205190 (=> (not res!801659) (not e!684420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205190 (= res!801659 (validMask!0 mask!1564))))

(declare-fun b!1205191 () Bool)

(declare-fun e!684421 () Bool)

(assert (=> b!1205191 (= e!684421 true)))

(assert (=> b!1205191 e!684418))

(declare-fun res!801663 () Bool)

(assert (=> b!1205191 (=> (not res!801663) (not e!684418))))

(assert (=> b!1205191 (= res!801663 e!684415)))

(declare-fun c!118237 () Bool)

(assert (=> b!1205191 (= c!118237 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546614 () Unit!39955)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!565 (array!78031 array!78033 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 64) (_ BitVec 32) Int) Unit!39955)

(assert (=> b!1205191 (= lt!546614 (lemmaListMapContainsThenArrayContainsFrom!565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546607 () Unit!39955)

(assert (=> b!1205191 (= lt!546607 e!684409)))

(assert (=> b!1205191 (= c!118235 (and (not lt!546611) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205191 (= lt!546611 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205192 () Bool)

(declare-fun c!118239 () Bool)

(assert (=> b!1205192 (= c!118239 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546611))))

(assert (=> b!1205192 (= e!684412 e!684419)))

(declare-fun b!1205193 () Bool)

(assert (=> b!1205193 (= e!684415 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205194 () Bool)

(declare-fun res!801657 () Bool)

(assert (=> b!1205194 (=> (not res!801657) (not e!684422))))

(declare-datatypes ((List!26518 0))(
  ( (Nil!26515) (Cons!26514 (h!27723 (_ BitVec 64)) (t!39419 List!26518)) )
))
(declare-fun arrayNoDuplicates!0 (array!78031 (_ BitVec 32) List!26518) Bool)

(assert (=> b!1205194 (= res!801657 (arrayNoDuplicates!0 lt!546613 #b00000000000000000000000000000000 Nil!26515))))

(declare-fun bm!58382 () Bool)

(assert (=> bm!58382 (= call!58386 call!58387)))

(declare-fun b!1205195 () Bool)

(declare-fun res!801654 () Bool)

(assert (=> b!1205195 (=> (not res!801654) (not e!684420))))

(assert (=> b!1205195 (= res!801654 (and (= (size!38193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38192 _keys!1208) (size!38193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205196 () Bool)

(declare-fun lt!546610 () Unit!39955)

(assert (=> b!1205196 (= e!684419 lt!546610)))

(assert (=> b!1205196 (= lt!546610 call!58385)))

(assert (=> b!1205196 call!58386))

(declare-fun b!1205197 () Bool)

(declare-fun e!684417 () Bool)

(assert (=> b!1205197 (= e!684407 e!684417)))

(declare-fun res!801667 () Bool)

(assert (=> b!1205197 (=> res!801667 e!684417)))

(assert (=> b!1205197 (= res!801667 (not (= (select (arr!37656 _keys!1208) from!1455) k!934)))))

(assert (=> b!1205197 e!684411))

(declare-fun c!118238 () Bool)

(assert (=> b!1205197 (= c!118238 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546617 () Unit!39955)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1024 (array!78031 array!78033 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39955)

(assert (=> b!1205197 (= lt!546617 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58383 () Bool)

(assert (=> bm!58383 (= call!58387 (contains!6916 (ite c!118235 lt!546605 call!58384) k!934))))

(declare-fun b!1205198 () Bool)

(declare-fun res!801660 () Bool)

(assert (=> b!1205198 (=> (not res!801660) (not e!684420))))

(assert (=> b!1205198 (= res!801660 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208))))))

(declare-fun bm!58384 () Bool)

(assert (=> bm!58384 (= call!58381 (+!3980 (ite c!118235 lt!546605 lt!546606) (ite c!118235 (tuple2!19711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118236 (tuple2!19711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205199 () Bool)

(declare-fun res!801662 () Bool)

(assert (=> b!1205199 (=> (not res!801662) (not e!684420))))

(assert (=> b!1205199 (= res!801662 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26515))))

(declare-fun b!1205200 () Bool)

(declare-fun -!1820 (ListLongMap!17679 (_ BitVec 64)) ListLongMap!17679)

(assert (=> b!1205200 (= e!684411 (= call!58383 (-!1820 call!58382 k!934)))))

(declare-fun b!1205201 () Bool)

(declare-fun res!801666 () Bool)

(assert (=> b!1205201 (=> (not res!801666) (not e!684420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205201 (= res!801666 (validKeyInArray!0 k!934))))

(declare-fun b!1205202 () Bool)

(assert (=> b!1205202 (= e!684408 (and e!684416 mapRes!47793))))

(declare-fun condMapEmpty!47793 () Bool)

(declare-fun mapDefault!47793 () ValueCell!14603)

