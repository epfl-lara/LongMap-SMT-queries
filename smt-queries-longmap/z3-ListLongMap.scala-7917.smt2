; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98344 () Bool)

(assert start!98344)

(declare-fun b_free!23949 () Bool)

(declare-fun b_next!23949 () Bool)

(assert (=> start!98344 (= b_free!23949 (not b_next!23949))))

(declare-fun tp!84557 () Bool)

(declare-fun b_and!38747 () Bool)

(assert (=> start!98344 (= tp!84557 b_and!38747)))

(declare-datatypes ((V!43099 0))(
  ( (V!43100 (val!14296 Int)) )
))
(declare-fun zeroValue!944 () V!43099)

(declare-datatypes ((tuple2!18024 0))(
  ( (tuple2!18025 (_1!9023 (_ BitVec 64)) (_2!9023 V!43099)) )
))
(declare-datatypes ((List!24786 0))(
  ( (Nil!24783) (Cons!24782 (h!25991 tuple2!18024) (t!35727 List!24786)) )
))
(declare-datatypes ((ListLongMap!15993 0))(
  ( (ListLongMap!15994 (toList!8012 List!24786)) )
))
(declare-fun lt!503416 () ListLongMap!15993)

(declare-fun lt!503422 () ListLongMap!15993)

(declare-fun c!110523 () Bool)

(declare-fun c!110524 () Bool)

(declare-fun bm!48927 () Bool)

(declare-fun call!48935 () ListLongMap!15993)

(declare-fun minValue!944 () V!43099)

(declare-fun +!3455 (ListLongMap!15993 tuple2!18024) ListLongMap!15993)

(assert (=> bm!48927 (= call!48935 (+!3455 (ite c!110524 lt!503416 lt!503422) (ite c!110524 (tuple2!18025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110523 (tuple2!18025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!37122 0))(
  ( (Unit!37123) )
))
(declare-fun call!48936 () Unit!37122)

(declare-fun bm!48928 () Bool)

(declare-fun addStillContains!718 (ListLongMap!15993 (_ BitVec 64) V!43099 (_ BitVec 64)) Unit!37122)

(assert (=> bm!48928 (= call!48936 (addStillContains!718 (ite c!110524 lt!503416 lt!503422) (ite c!110524 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110523 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110524 minValue!944 (ite c!110523 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1132917 () Bool)

(declare-fun res!756528 () Bool)

(declare-fun e!644787 () Bool)

(assert (=> b!1132917 (=> (not res!756528) (not e!644787))))

(declare-datatypes ((array!73819 0))(
  ( (array!73820 (arr!35560 (Array (_ BitVec 32) (_ BitVec 64))) (size!36096 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73819)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13530 0))(
  ( (ValueCellFull!13530 (v!16933 V!43099)) (EmptyCell!13530) )
))
(declare-datatypes ((array!73821 0))(
  ( (array!73822 (arr!35561 (Array (_ BitVec 32) ValueCell!13530)) (size!36097 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73821)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1132917 (= res!756528 (and (= (size!36097 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36096 _keys!1208) (size!36097 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132918 () Bool)

(declare-fun c!110521 () Bool)

(declare-fun lt!503413 () Bool)

(assert (=> b!1132918 (= c!110521 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503413))))

(declare-fun e!644776 () Unit!37122)

(declare-fun e!644783 () Unit!37122)

(assert (=> b!1132918 (= e!644776 e!644783)))

(declare-fun bm!48929 () Bool)

(declare-fun call!48934 () Unit!37122)

(assert (=> bm!48929 (= call!48934 call!48936)))

(declare-fun b!1132919 () Bool)

(declare-fun res!756531 () Bool)

(assert (=> b!1132919 (=> (not res!756531) (not e!644787))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132919 (= res!756531 (= (select (arr!35560 _keys!1208) i!673) k0!934))))

(declare-fun bm!48930 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!48931 () ListLongMap!15993)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4499 (array!73819 array!73821 (_ BitVec 32) (_ BitVec 32) V!43099 V!43099 (_ BitVec 32) Int) ListLongMap!15993)

(assert (=> bm!48930 (= call!48931 (getCurrentListMapNoExtraKeys!4499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132920 () Bool)

(declare-fun e!644789 () Bool)

(assert (=> b!1132920 (= e!644789 true)))

(declare-fun e!644784 () Bool)

(assert (=> b!1132920 e!644784))

(declare-fun res!756529 () Bool)

(assert (=> b!1132920 (=> (not res!756529) (not e!644784))))

(declare-fun e!644782 () Bool)

(assert (=> b!1132920 (= res!756529 e!644782)))

(declare-fun c!110520 () Bool)

(assert (=> b!1132920 (= c!110520 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503418 () Unit!37122)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!327 (array!73819 array!73821 (_ BitVec 32) (_ BitVec 32) V!43099 V!43099 (_ BitVec 64) (_ BitVec 32) Int) Unit!37122)

(assert (=> b!1132920 (= lt!503418 (lemmaListMapContainsThenArrayContainsFrom!327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503411 () Unit!37122)

(declare-fun e!644775 () Unit!37122)

(assert (=> b!1132920 (= lt!503411 e!644775)))

(assert (=> b!1132920 (= c!110524 (and (not lt!503413) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132920 (= lt!503413 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132921 () Bool)

(declare-fun res!756535 () Bool)

(assert (=> b!1132921 (=> (not res!756535) (not e!644787))))

(assert (=> b!1132921 (= res!756535 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36096 _keys!1208))))))

(declare-fun call!48933 () Bool)

(declare-fun call!48930 () ListLongMap!15993)

(declare-fun bm!48931 () Bool)

(declare-fun contains!6538 (ListLongMap!15993 (_ BitVec 64)) Bool)

(assert (=> bm!48931 (= call!48933 (contains!6538 (ite c!110524 lt!503416 call!48930) k0!934))))

(declare-fun b!1132922 () Bool)

(declare-fun e!644786 () Bool)

(declare-fun e!644777 () Bool)

(assert (=> b!1132922 (= e!644786 e!644777)))

(declare-fun res!756541 () Bool)

(assert (=> b!1132922 (=> res!756541 e!644777)))

(assert (=> b!1132922 (= res!756541 (not (= (select (arr!35560 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644779 () Bool)

(assert (=> b!1132922 e!644779))

(declare-fun c!110522 () Bool)

(assert (=> b!1132922 (= c!110522 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503420 () Unit!37122)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!436 (array!73819 array!73821 (_ BitVec 32) (_ BitVec 32) V!43099 V!43099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37122)

(assert (=> b!1132922 (= lt!503420 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132923 () Bool)

(assert (=> b!1132923 (= e!644775 e!644776)))

(assert (=> b!1132923 (= c!110523 (and (not lt!503413) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1132924 () Bool)

(declare-fun Unit!37124 () Unit!37122)

(assert (=> b!1132924 (= e!644783 Unit!37124)))

(declare-fun b!1132926 () Bool)

(declare-fun e!644781 () Bool)

(declare-fun tp_is_empty!28479 () Bool)

(assert (=> b!1132926 (= e!644781 tp_is_empty!28479)))

(declare-fun b!1132927 () Bool)

(declare-fun res!756533 () Bool)

(assert (=> b!1132927 (=> (not res!756533) (not e!644787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132927 (= res!756533 (validMask!0 mask!1564))))

(declare-fun b!1132928 () Bool)

(declare-fun e!644790 () Bool)

(assert (=> b!1132928 (= e!644787 e!644790)))

(declare-fun res!756530 () Bool)

(assert (=> b!1132928 (=> (not res!756530) (not e!644790))))

(declare-fun lt!503423 () array!73819)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73819 (_ BitVec 32)) Bool)

(assert (=> b!1132928 (= res!756530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503423 mask!1564))))

(assert (=> b!1132928 (= lt!503423 (array!73820 (store (arr!35560 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36096 _keys!1208)))))

(declare-fun b!1132929 () Bool)

(declare-fun call!48937 () ListLongMap!15993)

(declare-fun -!1182 (ListLongMap!15993 (_ BitVec 64)) ListLongMap!15993)

(assert (=> b!1132929 (= e!644779 (= call!48937 (-!1182 call!48931 k0!934)))))

(declare-fun b!1132930 () Bool)

(assert (=> b!1132930 (= e!644782 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503413) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1132931 () Bool)

(declare-fun e!644785 () Bool)

(assert (=> b!1132931 (= e!644790 (not e!644785))))

(declare-fun res!756536 () Bool)

(assert (=> b!1132931 (=> res!756536 e!644785)))

(assert (=> b!1132931 (= res!756536 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132931 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503410 () Unit!37122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73819 (_ BitVec 64) (_ BitVec 32)) Unit!37122)

(assert (=> b!1132931 (= lt!503410 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1132932 () Bool)

(declare-fun res!756540 () Bool)

(assert (=> b!1132932 (=> (not res!756540) (not e!644787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132932 (= res!756540 (validKeyInArray!0 k0!934))))

(declare-fun bm!48932 () Bool)

(assert (=> bm!48932 (= call!48930 call!48935)))

(declare-fun mapIsEmpty!44543 () Bool)

(declare-fun mapRes!44543 () Bool)

(assert (=> mapIsEmpty!44543 mapRes!44543))

(declare-fun bm!48933 () Bool)

(declare-fun call!48932 () Bool)

(assert (=> bm!48933 (= call!48932 call!48933)))

(declare-fun b!1132933 () Bool)

(assert (=> b!1132933 (= e!644782 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132934 () Bool)

(assert (=> b!1132934 (= e!644779 (= call!48937 call!48931))))

(declare-fun b!1132935 () Bool)

(declare-fun lt!503414 () Unit!37122)

(assert (=> b!1132935 (= e!644783 lt!503414)))

(assert (=> b!1132935 (= lt!503414 call!48934)))

(assert (=> b!1132935 call!48932))

(declare-fun bm!48934 () Bool)

(declare-fun lt!503424 () array!73821)

(assert (=> bm!48934 (= call!48937 (getCurrentListMapNoExtraKeys!4499 lt!503423 lt!503424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132936 () Bool)

(assert (=> b!1132936 call!48932))

(declare-fun lt!503412 () Unit!37122)

(assert (=> b!1132936 (= lt!503412 call!48934)))

(assert (=> b!1132936 (= e!644776 lt!503412)))

(declare-fun b!1132937 () Bool)

(assert (=> b!1132937 (= e!644777 e!644789)))

(declare-fun res!756532 () Bool)

(assert (=> b!1132937 (=> res!756532 e!644789)))

(assert (=> b!1132937 (= res!756532 (not (contains!6538 lt!503422 k0!934)))))

(assert (=> b!1132937 (= lt!503422 (getCurrentListMapNoExtraKeys!4499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132938 () Bool)

(assert (=> b!1132938 (= e!644785 e!644786)))

(declare-fun res!756538 () Bool)

(assert (=> b!1132938 (=> res!756538 e!644786)))

(assert (=> b!1132938 (= res!756538 (not (= from!1455 i!673)))))

(declare-fun lt!503415 () ListLongMap!15993)

(assert (=> b!1132938 (= lt!503415 (getCurrentListMapNoExtraKeys!4499 lt!503423 lt!503424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2568 (Int (_ BitVec 64)) V!43099)

(assert (=> b!1132938 (= lt!503424 (array!73822 (store (arr!35561 _values!996) i!673 (ValueCellFull!13530 (dynLambda!2568 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36097 _values!996)))))

(declare-fun lt!503419 () ListLongMap!15993)

(assert (=> b!1132938 (= lt!503419 (getCurrentListMapNoExtraKeys!4499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!756534 () Bool)

(assert (=> start!98344 (=> (not res!756534) (not e!644787))))

(assert (=> start!98344 (= res!756534 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36096 _keys!1208))))))

(assert (=> start!98344 e!644787))

(assert (=> start!98344 tp_is_empty!28479))

(declare-fun array_inv!27276 (array!73819) Bool)

(assert (=> start!98344 (array_inv!27276 _keys!1208)))

(assert (=> start!98344 true))

(assert (=> start!98344 tp!84557))

(declare-fun e!644778 () Bool)

(declare-fun array_inv!27277 (array!73821) Bool)

(assert (=> start!98344 (and (array_inv!27277 _values!996) e!644778)))

(declare-fun b!1132925 () Bool)

(declare-fun lt!503421 () Unit!37122)

(assert (=> b!1132925 (= e!644775 lt!503421)))

(declare-fun lt!503417 () Unit!37122)

(assert (=> b!1132925 (= lt!503417 (addStillContains!718 lt!503422 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1132925 (= lt!503416 (+!3455 lt!503422 (tuple2!18025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1132925 call!48933))

(assert (=> b!1132925 (= lt!503421 call!48936)))

(assert (=> b!1132925 (contains!6538 call!48935 k0!934)))

(declare-fun b!1132939 () Bool)

(declare-fun res!756542 () Bool)

(assert (=> b!1132939 (=> (not res!756542) (not e!644790))))

(declare-datatypes ((List!24787 0))(
  ( (Nil!24784) (Cons!24783 (h!25992 (_ BitVec 64)) (t!35728 List!24787)) )
))
(declare-fun arrayNoDuplicates!0 (array!73819 (_ BitVec 32) List!24787) Bool)

(assert (=> b!1132939 (= res!756542 (arrayNoDuplicates!0 lt!503423 #b00000000000000000000000000000000 Nil!24784))))

(declare-fun b!1132940 () Bool)

(declare-fun e!644780 () Bool)

(assert (=> b!1132940 (= e!644778 (and e!644780 mapRes!44543))))

(declare-fun condMapEmpty!44543 () Bool)

(declare-fun mapDefault!44543 () ValueCell!13530)

(assert (=> b!1132940 (= condMapEmpty!44543 (= (arr!35561 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13530)) mapDefault!44543)))))

(declare-fun b!1132941 () Bool)

(assert (=> b!1132941 (= e!644780 tp_is_empty!28479)))

(declare-fun b!1132942 () Bool)

(declare-fun res!756539 () Bool)

(assert (=> b!1132942 (=> (not res!756539) (not e!644787))))

(assert (=> b!1132942 (= res!756539 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24784))))

(declare-fun b!1132943 () Bool)

(assert (=> b!1132943 (= e!644784 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44543 () Bool)

(declare-fun tp!84558 () Bool)

(assert (=> mapNonEmpty!44543 (= mapRes!44543 (and tp!84558 e!644781))))

(declare-fun mapRest!44543 () (Array (_ BitVec 32) ValueCell!13530))

(declare-fun mapKey!44543 () (_ BitVec 32))

(declare-fun mapValue!44543 () ValueCell!13530)

(assert (=> mapNonEmpty!44543 (= (arr!35561 _values!996) (store mapRest!44543 mapKey!44543 mapValue!44543))))

(declare-fun b!1132944 () Bool)

(declare-fun res!756537 () Bool)

(assert (=> b!1132944 (=> (not res!756537) (not e!644787))))

(assert (=> b!1132944 (= res!756537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98344 res!756534) b!1132927))

(assert (= (and b!1132927 res!756533) b!1132917))

(assert (= (and b!1132917 res!756528) b!1132944))

(assert (= (and b!1132944 res!756537) b!1132942))

(assert (= (and b!1132942 res!756539) b!1132921))

(assert (= (and b!1132921 res!756535) b!1132932))

(assert (= (and b!1132932 res!756540) b!1132919))

(assert (= (and b!1132919 res!756531) b!1132928))

(assert (= (and b!1132928 res!756530) b!1132939))

(assert (= (and b!1132939 res!756542) b!1132931))

(assert (= (and b!1132931 (not res!756536)) b!1132938))

(assert (= (and b!1132938 (not res!756538)) b!1132922))

(assert (= (and b!1132922 c!110522) b!1132929))

(assert (= (and b!1132922 (not c!110522)) b!1132934))

(assert (= (or b!1132929 b!1132934) bm!48934))

(assert (= (or b!1132929 b!1132934) bm!48930))

(assert (= (and b!1132922 (not res!756541)) b!1132937))

(assert (= (and b!1132937 (not res!756532)) b!1132920))

(assert (= (and b!1132920 c!110524) b!1132925))

(assert (= (and b!1132920 (not c!110524)) b!1132923))

(assert (= (and b!1132923 c!110523) b!1132936))

(assert (= (and b!1132923 (not c!110523)) b!1132918))

(assert (= (and b!1132918 c!110521) b!1132935))

(assert (= (and b!1132918 (not c!110521)) b!1132924))

(assert (= (or b!1132936 b!1132935) bm!48929))

(assert (= (or b!1132936 b!1132935) bm!48932))

(assert (= (or b!1132936 b!1132935) bm!48933))

(assert (= (or b!1132925 bm!48933) bm!48931))

(assert (= (or b!1132925 bm!48929) bm!48928))

(assert (= (or b!1132925 bm!48932) bm!48927))

(assert (= (and b!1132920 c!110520) b!1132933))

(assert (= (and b!1132920 (not c!110520)) b!1132930))

(assert (= (and b!1132920 res!756529) b!1132943))

(assert (= (and b!1132940 condMapEmpty!44543) mapIsEmpty!44543))

(assert (= (and b!1132940 (not condMapEmpty!44543)) mapNonEmpty!44543))

(get-info :version)

(assert (= (and mapNonEmpty!44543 ((_ is ValueCellFull!13530) mapValue!44543)) b!1132926))

(assert (= (and b!1132940 ((_ is ValueCellFull!13530) mapDefault!44543)) b!1132941))

(assert (= start!98344 b!1132940))

(declare-fun b_lambda!19055 () Bool)

(assert (=> (not b_lambda!19055) (not b!1132938)))

(declare-fun t!35726 () Bool)

(declare-fun tb!8761 () Bool)

(assert (=> (and start!98344 (= defaultEntry!1004 defaultEntry!1004) t!35726) tb!8761))

(declare-fun result!18087 () Bool)

(assert (=> tb!8761 (= result!18087 tp_is_empty!28479)))

(assert (=> b!1132938 t!35726))

(declare-fun b_and!38749 () Bool)

(assert (= b_and!38747 (and (=> t!35726 result!18087) b_and!38749)))

(declare-fun m!1046141 () Bool)

(assert (=> b!1132938 m!1046141))

(declare-fun m!1046143 () Bool)

(assert (=> b!1132938 m!1046143))

(declare-fun m!1046145 () Bool)

(assert (=> b!1132938 m!1046145))

(declare-fun m!1046147 () Bool)

(assert (=> b!1132938 m!1046147))

(declare-fun m!1046149 () Bool)

(assert (=> b!1132929 m!1046149))

(declare-fun m!1046151 () Bool)

(assert (=> b!1132919 m!1046151))

(declare-fun m!1046153 () Bool)

(assert (=> b!1132927 m!1046153))

(declare-fun m!1046155 () Bool)

(assert (=> b!1132944 m!1046155))

(declare-fun m!1046157 () Bool)

(assert (=> start!98344 m!1046157))

(declare-fun m!1046159 () Bool)

(assert (=> start!98344 m!1046159))

(declare-fun m!1046161 () Bool)

(assert (=> b!1132928 m!1046161))

(declare-fun m!1046163 () Bool)

(assert (=> b!1132928 m!1046163))

(declare-fun m!1046165 () Bool)

(assert (=> bm!48927 m!1046165))

(declare-fun m!1046167 () Bool)

(assert (=> b!1132943 m!1046167))

(declare-fun m!1046169 () Bool)

(assert (=> b!1132939 m!1046169))

(declare-fun m!1046171 () Bool)

(assert (=> bm!48931 m!1046171))

(assert (=> b!1132933 m!1046167))

(declare-fun m!1046173 () Bool)

(assert (=> bm!48934 m!1046173))

(declare-fun m!1046175 () Bool)

(assert (=> b!1132922 m!1046175))

(declare-fun m!1046177 () Bool)

(assert (=> b!1132922 m!1046177))

(declare-fun m!1046179 () Bool)

(assert (=> b!1132931 m!1046179))

(declare-fun m!1046181 () Bool)

(assert (=> b!1132931 m!1046181))

(declare-fun m!1046183 () Bool)

(assert (=> mapNonEmpty!44543 m!1046183))

(declare-fun m!1046185 () Bool)

(assert (=> b!1132920 m!1046185))

(declare-fun m!1046187 () Bool)

(assert (=> b!1132925 m!1046187))

(declare-fun m!1046189 () Bool)

(assert (=> b!1132925 m!1046189))

(declare-fun m!1046191 () Bool)

(assert (=> b!1132925 m!1046191))

(declare-fun m!1046193 () Bool)

(assert (=> b!1132932 m!1046193))

(declare-fun m!1046195 () Bool)

(assert (=> b!1132942 m!1046195))

(declare-fun m!1046197 () Bool)

(assert (=> b!1132937 m!1046197))

(declare-fun m!1046199 () Bool)

(assert (=> b!1132937 m!1046199))

(declare-fun m!1046201 () Bool)

(assert (=> bm!48928 m!1046201))

(assert (=> bm!48930 m!1046199))

(check-sat (not mapNonEmpty!44543) (not b!1132937) (not bm!48934) (not b!1132933) (not b_next!23949) (not b!1132938) (not b!1132942) (not b!1132943) tp_is_empty!28479 (not b!1132920) (not b!1132939) (not b_lambda!19055) b_and!38749 (not start!98344) (not b!1132944) (not bm!48930) (not b!1132928) (not b!1132925) (not bm!48931) (not b!1132927) (not b!1132931) (not bm!48927) (not bm!48928) (not b!1132922) (not b!1132929) (not b!1132932))
(check-sat b_and!38749 (not b_next!23949))
