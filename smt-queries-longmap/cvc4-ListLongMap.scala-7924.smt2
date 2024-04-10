; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98388 () Bool)

(assert start!98388)

(declare-fun b_free!23993 () Bool)

(declare-fun b_next!23993 () Bool)

(assert (=> start!98388 (= b_free!23993 (not b_next!23993))))

(declare-fun tp!84690 () Bool)

(declare-fun b_and!38835 () Bool)

(assert (=> start!98388 (= tp!84690 b_and!38835)))

(declare-fun b!1134887 () Bool)

(declare-fun res!757598 () Bool)

(declare-fun e!645866 () Bool)

(assert (=> b!1134887 (=> (not res!757598) (not e!645866))))

(declare-datatypes ((array!73907 0))(
  ( (array!73908 (arr!35604 (Array (_ BitVec 32) (_ BitVec 64))) (size!36140 (_ BitVec 32))) )
))
(declare-fun lt!504468 () array!73907)

(declare-datatypes ((List!24824 0))(
  ( (Nil!24821) (Cons!24820 (h!26029 (_ BitVec 64)) (t!35809 List!24824)) )
))
(declare-fun arrayNoDuplicates!0 (array!73907 (_ BitVec 32) List!24824) Bool)

(assert (=> b!1134887 (= res!757598 (arrayNoDuplicates!0 lt!504468 #b00000000000000000000000000000000 Nil!24821))))

(declare-fun b!1134889 () Bool)

(declare-fun res!757602 () Bool)

(declare-fun e!645864 () Bool)

(assert (=> b!1134889 (=> (not res!757602) (not e!645864))))

(declare-fun _keys!1208 () array!73907)

(assert (=> b!1134889 (= res!757602 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24821))))

(declare-fun b!1134890 () Bool)

(declare-fun res!757610 () Bool)

(declare-fun e!645865 () Bool)

(assert (=> b!1134890 (=> res!757610 e!645865)))

(declare-fun noDuplicate!1595 (List!24824) Bool)

(assert (=> b!1134890 (= res!757610 (not (noDuplicate!1595 Nil!24821)))))

(declare-fun bm!49455 () Bool)

(declare-datatypes ((Unit!37181 0))(
  ( (Unit!37182) )
))
(declare-fun call!49462 () Unit!37181)

(declare-fun call!49458 () Unit!37181)

(assert (=> bm!49455 (= call!49462 call!49458)))

(declare-fun b!1134891 () Bool)

(declare-fun c!110850 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504463 () Bool)

(assert (=> b!1134891 (= c!110850 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504463))))

(declare-fun e!645867 () Unit!37181)

(declare-fun e!645860 () Unit!37181)

(assert (=> b!1134891 (= e!645867 e!645860)))

(declare-fun b!1134892 () Bool)

(declare-fun e!645858 () Bool)

(assert (=> b!1134892 (= e!645858 e!645865)))

(declare-fun res!757599 () Bool)

(assert (=> b!1134892 (=> res!757599 e!645865)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1134892 (= res!757599 (or (bvsge (size!36140 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36140 _keys!1208)) (bvsge from!1455 (size!36140 _keys!1208))))))

(assert (=> b!1134892 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24821)))

(declare-fun lt!504464 () Unit!37181)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73907 (_ BitVec 32) (_ BitVec 32)) Unit!37181)

(assert (=> b!1134892 (= lt!504464 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!645871 () Bool)

(assert (=> b!1134892 e!645871))

(declare-fun res!757606 () Bool)

(assert (=> b!1134892 (=> (not res!757606) (not e!645871))))

(declare-fun e!645863 () Bool)

(assert (=> b!1134892 (= res!757606 e!645863)))

(declare-fun c!110852 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1134892 (= c!110852 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!43157 0))(
  ( (V!43158 (val!14318 Int)) )
))
(declare-fun zeroValue!944 () V!43157)

(declare-fun lt!504461 () Unit!37181)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13552 0))(
  ( (ValueCellFull!13552 (v!16955 V!43157)) (EmptyCell!13552) )
))
(declare-datatypes ((array!73909 0))(
  ( (array!73910 (arr!35605 (Array (_ BitVec 32) ValueCell!13552)) (size!36141 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73909)

(declare-fun minValue!944 () V!43157)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!339 (array!73907 array!73909 (_ BitVec 32) (_ BitVec 32) V!43157 V!43157 (_ BitVec 64) (_ BitVec 32) Int) Unit!37181)

(assert (=> b!1134892 (= lt!504461 (lemmaListMapContainsThenArrayContainsFrom!339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504452 () Unit!37181)

(declare-fun e!645859 () Unit!37181)

(assert (=> b!1134892 (= lt!504452 e!645859)))

(declare-fun c!110853 () Bool)

(assert (=> b!1134892 (= c!110853 (and (not lt!504463) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134892 (= lt!504463 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134893 () Bool)

(declare-fun arrayContainsKey!0 (array!73907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134893 (= e!645863 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134894 () Bool)

(declare-fun call!49463 () Bool)

(assert (=> b!1134894 call!49463))

(declare-fun lt!504453 () Unit!37181)

(assert (=> b!1134894 (= lt!504453 call!49462)))

(assert (=> b!1134894 (= e!645867 lt!504453)))

(declare-fun b!1134895 () Bool)

(declare-fun res!757613 () Bool)

(assert (=> b!1134895 (=> (not res!757613) (not e!645864))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134895 (= res!757613 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36140 _keys!1208))))))

(declare-fun mapIsEmpty!44609 () Bool)

(declare-fun mapRes!44609 () Bool)

(assert (=> mapIsEmpty!44609 mapRes!44609))

(declare-fun b!1134896 () Bool)

(declare-fun res!757612 () Bool)

(assert (=> b!1134896 (=> (not res!757612) (not e!645864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134896 (= res!757612 (validMask!0 mask!1564))))

(declare-fun b!1134897 () Bool)

(assert (=> b!1134897 (= e!645864 e!645866)))

(declare-fun res!757609 () Bool)

(assert (=> b!1134897 (=> (not res!757609) (not e!645866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73907 (_ BitVec 32)) Bool)

(assert (=> b!1134897 (= res!757609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504468 mask!1564))))

(assert (=> b!1134897 (= lt!504468 (array!73908 (store (arr!35604 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36140 _keys!1208)))))

(declare-fun bm!49456 () Bool)

(declare-datatypes ((tuple2!18066 0))(
  ( (tuple2!18067 (_1!9044 (_ BitVec 64)) (_2!9044 V!43157)) )
))
(declare-datatypes ((List!24825 0))(
  ( (Nil!24822) (Cons!24821 (h!26030 tuple2!18066) (t!35810 List!24825)) )
))
(declare-datatypes ((ListLongMap!16035 0))(
  ( (ListLongMap!16036 (toList!8033 List!24825)) )
))
(declare-fun call!49460 () ListLongMap!16035)

(declare-fun call!49465 () ListLongMap!16035)

(assert (=> bm!49456 (= call!49460 call!49465)))

(declare-fun b!1134898 () Bool)

(declare-fun e!645872 () Bool)

(declare-fun call!49464 () ListLongMap!16035)

(declare-fun call!49459 () ListLongMap!16035)

(assert (=> b!1134898 (= e!645872 (= call!49464 call!49459))))

(declare-fun b!1134899 () Bool)

(declare-fun lt!504462 () Unit!37181)

(assert (=> b!1134899 (= e!645860 lt!504462)))

(assert (=> b!1134899 (= lt!504462 call!49462)))

(assert (=> b!1134899 call!49463))

(declare-fun b!1134900 () Bool)

(declare-fun e!645868 () Bool)

(assert (=> b!1134900 (= e!645868 e!645858)))

(declare-fun res!757601 () Bool)

(assert (=> b!1134900 (=> res!757601 e!645858)))

(declare-fun lt!504466 () ListLongMap!16035)

(declare-fun contains!6560 (ListLongMap!16035 (_ BitVec 64)) Bool)

(assert (=> b!1134900 (= res!757601 (not (contains!6560 lt!504466 k!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4519 (array!73907 array!73909 (_ BitVec 32) (_ BitVec 32) V!43157 V!43157 (_ BitVec 32) Int) ListLongMap!16035)

(assert (=> b!1134900 (= lt!504466 (getCurrentListMapNoExtraKeys!4519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49457 () Bool)

(declare-fun call!49461 () Bool)

(assert (=> bm!49457 (= call!49463 call!49461)))

(declare-fun b!1134888 () Bool)

(declare-fun res!757597 () Bool)

(assert (=> b!1134888 (=> (not res!757597) (not e!645864))))

(assert (=> b!1134888 (= res!757597 (= (select (arr!35604 _keys!1208) i!673) k!934))))

(declare-fun res!757600 () Bool)

(assert (=> start!98388 (=> (not res!757600) (not e!645864))))

(assert (=> start!98388 (= res!757600 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36140 _keys!1208))))))

(assert (=> start!98388 e!645864))

(declare-fun tp_is_empty!28523 () Bool)

(assert (=> start!98388 tp_is_empty!28523))

(declare-fun array_inv!27306 (array!73907) Bool)

(assert (=> start!98388 (array_inv!27306 _keys!1208)))

(assert (=> start!98388 true))

(assert (=> start!98388 tp!84690))

(declare-fun e!645862 () Bool)

(declare-fun array_inv!27307 (array!73909) Bool)

(assert (=> start!98388 (and (array_inv!27307 _values!996) e!645862)))

(declare-fun mapNonEmpty!44609 () Bool)

(declare-fun tp!84689 () Bool)

(declare-fun e!645873 () Bool)

(assert (=> mapNonEmpty!44609 (= mapRes!44609 (and tp!84689 e!645873))))

(declare-fun mapRest!44609 () (Array (_ BitVec 32) ValueCell!13552))

(declare-fun mapValue!44609 () ValueCell!13552)

(declare-fun mapKey!44609 () (_ BitVec 32))

(assert (=> mapNonEmpty!44609 (= (arr!35605 _values!996) (store mapRest!44609 mapKey!44609 mapValue!44609))))

(declare-fun c!110854 () Bool)

(declare-fun bm!49458 () Bool)

(declare-fun addStillContains!734 (ListLongMap!16035 (_ BitVec 64) V!43157 (_ BitVec 64)) Unit!37181)

(assert (=> bm!49458 (= call!49458 (addStillContains!734 lt!504466 (ite (or c!110853 c!110854) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110853 c!110854) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1134901 () Bool)

(declare-fun -!1197 (ListLongMap!16035 (_ BitVec 64)) ListLongMap!16035)

(assert (=> b!1134901 (= e!645872 (= call!49464 (-!1197 call!49459 k!934)))))

(declare-fun b!1134902 () Bool)

(declare-fun res!757604 () Bool)

(assert (=> b!1134902 (=> res!757604 e!645865)))

(declare-fun contains!6561 (List!24824 (_ BitVec 64)) Bool)

(assert (=> b!1134902 (= res!757604 (contains!6561 Nil!24821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134903 () Bool)

(assert (=> b!1134903 (= e!645863 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504463) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134904 () Bool)

(declare-fun e!645870 () Bool)

(assert (=> b!1134904 (= e!645862 (and e!645870 mapRes!44609))))

(declare-fun condMapEmpty!44609 () Bool)

(declare-fun mapDefault!44609 () ValueCell!13552)

