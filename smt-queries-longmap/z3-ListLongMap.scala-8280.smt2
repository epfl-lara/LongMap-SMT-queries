; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100814 () Bool)

(assert start!100814)

(declare-fun b_free!25953 () Bool)

(declare-fun b_next!25953 () Bool)

(assert (=> start!100814 (= b_free!25953 (not b_next!25953))))

(declare-fun tp!90864 () Bool)

(declare-fun b_and!42907 () Bool)

(assert (=> start!100814 (= tp!90864 b_and!42907)))

(declare-fun b!1206721 () Bool)

(declare-fun e!685294 () Bool)

(declare-fun tp_is_empty!30657 () Bool)

(assert (=> b!1206721 (= e!685294 tp_is_empty!30657)))

(declare-fun mapNonEmpty!47844 () Bool)

(declare-fun mapRes!47844 () Bool)

(declare-fun tp!90865 () Bool)

(assert (=> mapNonEmpty!47844 (= mapRes!47844 (and tp!90865 e!685294))))

(declare-datatypes ((V!46003 0))(
  ( (V!46004 (val!15385 Int)) )
))
(declare-datatypes ((ValueCell!14619 0))(
  ( (ValueCellFull!14619 (v!18030 V!46003)) (EmptyCell!14619) )
))
(declare-fun mapValue!47844 () ValueCell!14619)

(declare-fun mapRest!47844 () (Array (_ BitVec 32) ValueCell!14619))

(declare-datatypes ((array!78097 0))(
  ( (array!78098 (arr!37688 (Array (_ BitVec 32) ValueCell!14619)) (size!38224 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78097)

(declare-fun mapKey!47844 () (_ BitVec 32))

(assert (=> mapNonEmpty!47844 (= (arr!37688 _values!996) (store mapRest!47844 mapKey!47844 mapValue!47844))))

(declare-fun e!685300 () Bool)

(declare-datatypes ((tuple2!19742 0))(
  ( (tuple2!19743 (_1!9882 (_ BitVec 64)) (_2!9882 V!46003)) )
))
(declare-datatypes ((List!26544 0))(
  ( (Nil!26541) (Cons!26540 (h!27749 tuple2!19742) (t!39477 List!26544)) )
))
(declare-datatypes ((ListLongMap!17711 0))(
  ( (ListLongMap!17712 (toList!8871 List!26544)) )
))
(declare-fun call!58788 () ListLongMap!17711)

(declare-fun call!58792 () ListLongMap!17711)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1206722 () Bool)

(declare-fun -!1828 (ListLongMap!17711 (_ BitVec 64)) ListLongMap!17711)

(assert (=> b!1206722 (= e!685300 (= call!58792 (-!1828 call!58788 k0!934)))))

(declare-fun b!1206723 () Bool)

(declare-fun e!685291 () Bool)

(declare-fun e!685289 () Bool)

(assert (=> b!1206723 (= e!685291 e!685289)))

(declare-fun res!802455 () Bool)

(assert (=> b!1206723 (=> res!802455 e!685289)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78099 0))(
  ( (array!78100 (arr!37689 (Array (_ BitVec 32) (_ BitVec 64))) (size!38225 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78099)

(assert (=> b!1206723 (= res!802455 (not (= (select (arr!37689 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1206723 e!685300))

(declare-fun c!118519 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206723 (= c!118519 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!46003)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46003)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((Unit!40002 0))(
  ( (Unit!40003) )
))
(declare-fun lt!547455 () Unit!40002)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1035 (array!78099 array!78097 (_ BitVec 32) (_ BitVec 32) V!46003 V!46003 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40002)

(assert (=> b!1206723 (= lt!547455 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1035 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58782 () Bool)

(declare-fun call!58790 () Unit!40002)

(declare-fun call!58785 () Unit!40002)

(assert (=> bm!58782 (= call!58790 call!58785)))

(declare-fun b!1206724 () Bool)

(declare-fun e!685287 () Bool)

(declare-fun arrayContainsKey!0 (array!78099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206724 (= e!685287 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58783 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5305 (array!78099 array!78097 (_ BitVec 32) (_ BitVec 32) V!46003 V!46003 (_ BitVec 32) Int) ListLongMap!17711)

(assert (=> bm!58783 (= call!58788 (getCurrentListMapNoExtraKeys!5305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206726 () Bool)

(declare-fun e!685292 () Bool)

(declare-fun e!685288 () Bool)

(assert (=> b!1206726 (= e!685292 (not e!685288))))

(declare-fun res!802447 () Bool)

(assert (=> b!1206726 (=> res!802447 e!685288)))

(assert (=> b!1206726 (= res!802447 (bvsgt from!1455 i!673))))

(assert (=> b!1206726 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547457 () Unit!40002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78099 (_ BitVec 64) (_ BitVec 32)) Unit!40002)

(assert (=> b!1206726 (= lt!547457 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun c!118523 () Bool)

(declare-fun c!118520 () Bool)

(declare-fun call!58789 () ListLongMap!17711)

(declare-fun lt!547453 () ListLongMap!17711)

(declare-fun bm!58784 () Bool)

(declare-fun +!3992 (ListLongMap!17711 tuple2!19742) ListLongMap!17711)

(assert (=> bm!58784 (= call!58789 (+!3992 lt!547453 (ite (or c!118520 c!118523) (tuple2!19743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!685293 () Bool)

(declare-fun b!1206727 () Bool)

(assert (=> b!1206727 (= e!685293 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206728 () Bool)

(declare-fun res!802444 () Bool)

(assert (=> b!1206728 (=> (not res!802444) (not e!685292))))

(declare-fun lt!547461 () array!78099)

(declare-datatypes ((List!26545 0))(
  ( (Nil!26542) (Cons!26541 (h!27750 (_ BitVec 64)) (t!39478 List!26545)) )
))
(declare-fun arrayNoDuplicates!0 (array!78099 (_ BitVec 32) List!26545) Bool)

(assert (=> b!1206728 (= res!802444 (arrayNoDuplicates!0 lt!547461 #b00000000000000000000000000000000 Nil!26542))))

(declare-fun b!1206729 () Bool)

(declare-fun res!802451 () Bool)

(declare-fun e!685286 () Bool)

(assert (=> b!1206729 (=> (not res!802451) (not e!685286))))

(assert (=> b!1206729 (= res!802451 (and (= (size!38224 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38225 _keys!1208) (size!38224 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206730 () Bool)

(declare-fun res!802452 () Bool)

(assert (=> b!1206730 (=> (not res!802452) (not e!685286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206730 (= res!802452 (validKeyInArray!0 k0!934))))

(declare-fun bm!58785 () Bool)

(declare-fun call!58786 () ListLongMap!17711)

(assert (=> bm!58785 (= call!58786 call!58789)))

(declare-fun b!1206731 () Bool)

(declare-fun e!685299 () Bool)

(assert (=> b!1206731 (= e!685289 e!685299)))

(declare-fun res!802446 () Bool)

(assert (=> b!1206731 (=> res!802446 e!685299)))

(declare-fun contains!6930 (ListLongMap!17711 (_ BitVec 64)) Bool)

(assert (=> b!1206731 (= res!802446 (not (contains!6930 lt!547453 k0!934)))))

(assert (=> b!1206731 (= lt!547453 (getCurrentListMapNoExtraKeys!5305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206732 () Bool)

(declare-fun res!802448 () Bool)

(assert (=> b!1206732 (=> (not res!802448) (not e!685286))))

(assert (=> b!1206732 (= res!802448 (= (select (arr!37689 _keys!1208) i!673) k0!934))))

(declare-fun b!1206733 () Bool)

(declare-fun call!58787 () Bool)

(assert (=> b!1206733 call!58787))

(declare-fun lt!547459 () Unit!40002)

(assert (=> b!1206733 (= lt!547459 call!58790)))

(declare-fun e!685290 () Unit!40002)

(assert (=> b!1206733 (= e!685290 lt!547459)))

(declare-fun b!1206734 () Bool)

(assert (=> b!1206734 (= e!685299 true)))

(assert (=> b!1206734 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26542)))

(declare-fun lt!547452 () Unit!40002)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78099 (_ BitVec 32) (_ BitVec 32)) Unit!40002)

(assert (=> b!1206734 (= lt!547452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1206734 e!685287))

(declare-fun res!802449 () Bool)

(assert (=> b!1206734 (=> (not res!802449) (not e!685287))))

(assert (=> b!1206734 (= res!802449 e!685293)))

(declare-fun c!118522 () Bool)

(assert (=> b!1206734 (= c!118522 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547451 () Unit!40002)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!575 (array!78099 array!78097 (_ BitVec 32) (_ BitVec 32) V!46003 V!46003 (_ BitVec 64) (_ BitVec 32) Int) Unit!40002)

(assert (=> b!1206734 (= lt!547451 (lemmaListMapContainsThenArrayContainsFrom!575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547463 () Unit!40002)

(declare-fun e!685301 () Unit!40002)

(assert (=> b!1206734 (= lt!547463 e!685301)))

(declare-fun lt!547454 () Bool)

(assert (=> b!1206734 (= c!118520 (and (not lt!547454) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206734 (= lt!547454 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206735 () Bool)

(assert (=> b!1206735 (= e!685301 e!685290)))

(assert (=> b!1206735 (= c!118523 (and (not lt!547454) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206725 () Bool)

(assert (=> b!1206725 (= e!685293 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547454) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!802450 () Bool)

(assert (=> start!100814 (=> (not res!802450) (not e!685286))))

(assert (=> start!100814 (= res!802450 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38225 _keys!1208))))))

(assert (=> start!100814 e!685286))

(assert (=> start!100814 tp_is_empty!30657))

(declare-fun array_inv!28708 (array!78099) Bool)

(assert (=> start!100814 (array_inv!28708 _keys!1208)))

(assert (=> start!100814 true))

(assert (=> start!100814 tp!90864))

(declare-fun e!685295 () Bool)

(declare-fun array_inv!28709 (array!78097) Bool)

(assert (=> start!100814 (and (array_inv!28709 _values!996) e!685295)))

(declare-fun b!1206736 () Bool)

(declare-fun c!118521 () Bool)

(assert (=> b!1206736 (= c!118521 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547454))))

(declare-fun e!685297 () Unit!40002)

(assert (=> b!1206736 (= e!685290 e!685297)))

(declare-fun bm!58786 () Bool)

(declare-fun addStillContains!1021 (ListLongMap!17711 (_ BitVec 64) V!46003 (_ BitVec 64)) Unit!40002)

(assert (=> bm!58786 (= call!58785 (addStillContains!1021 lt!547453 (ite (or c!118520 c!118523) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118520 c!118523) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1206737 () Bool)

(declare-fun res!802456 () Bool)

(assert (=> b!1206737 (=> (not res!802456) (not e!685286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206737 (= res!802456 (validMask!0 mask!1564))))

(declare-fun b!1206738 () Bool)

(declare-fun lt!547460 () Unit!40002)

(assert (=> b!1206738 (= e!685297 lt!547460)))

(assert (=> b!1206738 (= lt!547460 call!58790)))

(assert (=> b!1206738 call!58787))

(declare-fun b!1206739 () Bool)

(declare-fun Unit!40004 () Unit!40002)

(assert (=> b!1206739 (= e!685297 Unit!40004)))

(declare-fun b!1206740 () Bool)

(declare-fun res!802454 () Bool)

(assert (=> b!1206740 (=> (not res!802454) (not e!685286))))

(assert (=> b!1206740 (= res!802454 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38225 _keys!1208))))))

(declare-fun b!1206741 () Bool)

(declare-fun res!802445 () Bool)

(assert (=> b!1206741 (=> (not res!802445) (not e!685286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78099 (_ BitVec 32)) Bool)

(assert (=> b!1206741 (= res!802445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47844 () Bool)

(assert (=> mapIsEmpty!47844 mapRes!47844))

(declare-fun b!1206742 () Bool)

(assert (=> b!1206742 (= e!685286 e!685292)))

(declare-fun res!802457 () Bool)

(assert (=> b!1206742 (=> (not res!802457) (not e!685292))))

(assert (=> b!1206742 (= res!802457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547461 mask!1564))))

(assert (=> b!1206742 (= lt!547461 (array!78100 (store (arr!37689 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38225 _keys!1208)))))

(declare-fun lt!547450 () array!78097)

(declare-fun bm!58787 () Bool)

(assert (=> bm!58787 (= call!58792 (getCurrentListMapNoExtraKeys!5305 lt!547461 lt!547450 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206743 () Bool)

(declare-fun e!685296 () Bool)

(assert (=> b!1206743 (= e!685296 tp_is_empty!30657)))

(declare-fun lt!547462 () ListLongMap!17711)

(declare-fun call!58791 () Bool)

(declare-fun bm!58788 () Bool)

(assert (=> bm!58788 (= call!58791 (contains!6930 (ite c!118520 lt!547462 call!58786) k0!934))))

(declare-fun bm!58789 () Bool)

(assert (=> bm!58789 (= call!58787 call!58791)))

(declare-fun b!1206744 () Bool)

(assert (=> b!1206744 (= e!685300 (= call!58792 call!58788))))

(declare-fun b!1206745 () Bool)

(declare-fun res!802453 () Bool)

(assert (=> b!1206745 (=> (not res!802453) (not e!685286))))

(assert (=> b!1206745 (= res!802453 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26542))))

(declare-fun b!1206746 () Bool)

(assert (=> b!1206746 (= e!685295 (and e!685296 mapRes!47844))))

(declare-fun condMapEmpty!47844 () Bool)

(declare-fun mapDefault!47844 () ValueCell!14619)

(assert (=> b!1206746 (= condMapEmpty!47844 (= (arr!37688 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14619)) mapDefault!47844)))))

(declare-fun b!1206747 () Bool)

(declare-fun lt!547449 () Unit!40002)

(assert (=> b!1206747 (= e!685301 lt!547449)))

(declare-fun lt!547448 () Unit!40002)

(assert (=> b!1206747 (= lt!547448 call!58785)))

(assert (=> b!1206747 (= lt!547462 call!58789)))

(assert (=> b!1206747 call!58791))

(assert (=> b!1206747 (= lt!547449 (addStillContains!1021 lt!547462 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1206747 (contains!6930 (+!3992 lt!547462 (tuple2!19743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1206748 () Bool)

(assert (=> b!1206748 (= e!685288 e!685291)))

(declare-fun res!802458 () Bool)

(assert (=> b!1206748 (=> res!802458 e!685291)))

(assert (=> b!1206748 (= res!802458 (not (= from!1455 i!673)))))

(declare-fun lt!547458 () ListLongMap!17711)

(assert (=> b!1206748 (= lt!547458 (getCurrentListMapNoExtraKeys!5305 lt!547461 lt!547450 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3210 (Int (_ BitVec 64)) V!46003)

(assert (=> b!1206748 (= lt!547450 (array!78098 (store (arr!37688 _values!996) i!673 (ValueCellFull!14619 (dynLambda!3210 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38224 _values!996)))))

(declare-fun lt!547456 () ListLongMap!17711)

(assert (=> b!1206748 (= lt!547456 (getCurrentListMapNoExtraKeys!5305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100814 res!802450) b!1206737))

(assert (= (and b!1206737 res!802456) b!1206729))

(assert (= (and b!1206729 res!802451) b!1206741))

(assert (= (and b!1206741 res!802445) b!1206745))

(assert (= (and b!1206745 res!802453) b!1206740))

(assert (= (and b!1206740 res!802454) b!1206730))

(assert (= (and b!1206730 res!802452) b!1206732))

(assert (= (and b!1206732 res!802448) b!1206742))

(assert (= (and b!1206742 res!802457) b!1206728))

(assert (= (and b!1206728 res!802444) b!1206726))

(assert (= (and b!1206726 (not res!802447)) b!1206748))

(assert (= (and b!1206748 (not res!802458)) b!1206723))

(assert (= (and b!1206723 c!118519) b!1206722))

(assert (= (and b!1206723 (not c!118519)) b!1206744))

(assert (= (or b!1206722 b!1206744) bm!58787))

(assert (= (or b!1206722 b!1206744) bm!58783))

(assert (= (and b!1206723 (not res!802455)) b!1206731))

(assert (= (and b!1206731 (not res!802446)) b!1206734))

(assert (= (and b!1206734 c!118520) b!1206747))

(assert (= (and b!1206734 (not c!118520)) b!1206735))

(assert (= (and b!1206735 c!118523) b!1206733))

(assert (= (and b!1206735 (not c!118523)) b!1206736))

(assert (= (and b!1206736 c!118521) b!1206738))

(assert (= (and b!1206736 (not c!118521)) b!1206739))

(assert (= (or b!1206733 b!1206738) bm!58782))

(assert (= (or b!1206733 b!1206738) bm!58785))

(assert (= (or b!1206733 b!1206738) bm!58789))

(assert (= (or b!1206747 bm!58789) bm!58788))

(assert (= (or b!1206747 bm!58782) bm!58786))

(assert (= (or b!1206747 bm!58785) bm!58784))

(assert (= (and b!1206734 c!118522) b!1206727))

(assert (= (and b!1206734 (not c!118522)) b!1206725))

(assert (= (and b!1206734 res!802449) b!1206724))

(assert (= (and b!1206746 condMapEmpty!47844) mapIsEmpty!47844))

(assert (= (and b!1206746 (not condMapEmpty!47844)) mapNonEmpty!47844))

(get-info :version)

(assert (= (and mapNonEmpty!47844 ((_ is ValueCellFull!14619) mapValue!47844)) b!1206721))

(assert (= (and b!1206746 ((_ is ValueCellFull!14619) mapDefault!47844)) b!1206743))

(assert (= start!100814 b!1206746))

(declare-fun b_lambda!21387 () Bool)

(assert (=> (not b_lambda!21387) (not b!1206748)))

(declare-fun t!39476 () Bool)

(declare-fun tb!10753 () Bool)

(assert (=> (and start!100814 (= defaultEntry!1004 defaultEntry!1004) t!39476) tb!10753))

(declare-fun result!22093 () Bool)

(assert (=> tb!10753 (= result!22093 tp_is_empty!30657)))

(assert (=> b!1206748 t!39476))

(declare-fun b_and!42909 () Bool)

(assert (= b_and!42907 (and (=> t!39476 result!22093) b_and!42909)))

(declare-fun m!1112395 () Bool)

(assert (=> b!1206730 m!1112395))

(declare-fun m!1112397 () Bool)

(assert (=> bm!58786 m!1112397))

(declare-fun m!1112399 () Bool)

(assert (=> b!1206747 m!1112399))

(declare-fun m!1112401 () Bool)

(assert (=> b!1206747 m!1112401))

(assert (=> b!1206747 m!1112401))

(declare-fun m!1112403 () Bool)

(assert (=> b!1206747 m!1112403))

(declare-fun m!1112405 () Bool)

(assert (=> mapNonEmpty!47844 m!1112405))

(declare-fun m!1112407 () Bool)

(assert (=> b!1206726 m!1112407))

(declare-fun m!1112409 () Bool)

(assert (=> b!1206726 m!1112409))

(declare-fun m!1112411 () Bool)

(assert (=> start!100814 m!1112411))

(declare-fun m!1112413 () Bool)

(assert (=> start!100814 m!1112413))

(declare-fun m!1112415 () Bool)

(assert (=> bm!58788 m!1112415))

(declare-fun m!1112417 () Bool)

(assert (=> bm!58784 m!1112417))

(declare-fun m!1112419 () Bool)

(assert (=> bm!58787 m!1112419))

(declare-fun m!1112421 () Bool)

(assert (=> b!1206722 m!1112421))

(declare-fun m!1112423 () Bool)

(assert (=> b!1206723 m!1112423))

(declare-fun m!1112425 () Bool)

(assert (=> b!1206723 m!1112425))

(declare-fun m!1112427 () Bool)

(assert (=> b!1206732 m!1112427))

(declare-fun m!1112429 () Bool)

(assert (=> bm!58783 m!1112429))

(declare-fun m!1112431 () Bool)

(assert (=> b!1206745 m!1112431))

(declare-fun m!1112433 () Bool)

(assert (=> b!1206734 m!1112433))

(declare-fun m!1112435 () Bool)

(assert (=> b!1206734 m!1112435))

(declare-fun m!1112437 () Bool)

(assert (=> b!1206734 m!1112437))

(declare-fun m!1112439 () Bool)

(assert (=> b!1206731 m!1112439))

(assert (=> b!1206731 m!1112429))

(declare-fun m!1112441 () Bool)

(assert (=> b!1206748 m!1112441))

(declare-fun m!1112443 () Bool)

(assert (=> b!1206748 m!1112443))

(declare-fun m!1112445 () Bool)

(assert (=> b!1206748 m!1112445))

(declare-fun m!1112447 () Bool)

(assert (=> b!1206748 m!1112447))

(declare-fun m!1112449 () Bool)

(assert (=> b!1206727 m!1112449))

(assert (=> b!1206724 m!1112449))

(declare-fun m!1112451 () Bool)

(assert (=> b!1206741 m!1112451))

(declare-fun m!1112453 () Bool)

(assert (=> b!1206737 m!1112453))

(declare-fun m!1112455 () Bool)

(assert (=> b!1206742 m!1112455))

(declare-fun m!1112457 () Bool)

(assert (=> b!1206742 m!1112457))

(declare-fun m!1112459 () Bool)

(assert (=> b!1206728 m!1112459))

(check-sat (not b!1206726) (not b!1206724) (not b!1206742) (not bm!58788) (not b_next!25953) (not b!1206747) (not b!1206741) (not b_lambda!21387) (not b!1206722) (not b!1206728) (not mapNonEmpty!47844) (not b!1206730) (not bm!58786) (not b!1206731) (not b!1206737) (not b!1206745) b_and!42909 (not start!100814) (not b!1206727) (not bm!58787) (not b!1206748) (not bm!58784) tp_is_empty!30657 (not b!1206723) (not bm!58783) (not b!1206734))
(check-sat b_and!42909 (not b_next!25953))
