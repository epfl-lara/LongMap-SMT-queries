; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98474 () Bool)

(assert start!98474)

(declare-fun b_free!24079 () Bool)

(declare-fun b_next!24079 () Bool)

(assert (=> start!98474 (= b_free!24079 (not b_next!24079))))

(declare-fun tp!84947 () Bool)

(declare-fun b_and!39007 () Bool)

(assert (=> start!98474 (= tp!84947 b_and!39007)))

(declare-fun b!1138824 () Bool)

(declare-fun res!759632 () Bool)

(declare-fun e!647987 () Bool)

(assert (=> b!1138824 (=> (not res!759632) (not e!647987))))

(declare-datatypes ((array!74077 0))(
  ( (array!74078 (arr!35689 (Array (_ BitVec 32) (_ BitVec 64))) (size!36225 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74077)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74077 (_ BitVec 32)) Bool)

(assert (=> b!1138824 (= res!759632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!647982 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!506732 () Bool)

(declare-fun b!1138825 () Bool)

(assert (=> b!1138825 (= e!647982 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506732) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138826 () Bool)

(declare-fun e!647980 () Bool)

(assert (=> b!1138826 (= e!647987 e!647980)))

(declare-fun res!759628 () Bool)

(assert (=> b!1138826 (=> (not res!759628) (not e!647980))))

(declare-fun lt!506720 () array!74077)

(assert (=> b!1138826 (= res!759628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506720 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138826 (= lt!506720 (array!74078 (store (arr!35689 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36225 _keys!1208)))))

(declare-fun bm!50487 () Bool)

(declare-datatypes ((Unit!37316 0))(
  ( (Unit!37317) )
))
(declare-fun call!50494 () Unit!37316)

(declare-fun call!50497 () Unit!37316)

(assert (=> bm!50487 (= call!50494 call!50497)))

(declare-fun b!1138827 () Bool)

(declare-fun res!759624 () Bool)

(assert (=> b!1138827 (=> (not res!759624) (not e!647987))))

(assert (=> b!1138827 (= res!759624 (= (select (arr!35689 _keys!1208) i!673) k!934))))

(declare-fun b!1138828 () Bool)

(declare-datatypes ((V!43273 0))(
  ( (V!43274 (val!14361 Int)) )
))
(declare-datatypes ((tuple2!18148 0))(
  ( (tuple2!18149 (_1!9085 (_ BitVec 64)) (_2!9085 V!43273)) )
))
(declare-datatypes ((List!24904 0))(
  ( (Nil!24901) (Cons!24900 (h!26109 tuple2!18148) (t!35975 List!24904)) )
))
(declare-datatypes ((ListLongMap!16117 0))(
  ( (ListLongMap!16118 (toList!8074 List!24904)) )
))
(declare-fun lt!506727 () ListLongMap!16117)

(declare-fun minValue!944 () V!43273)

(declare-fun contains!6610 (ListLongMap!16117 (_ BitVec 64)) Bool)

(declare-fun +!3506 (ListLongMap!16117 tuple2!18148) ListLongMap!16117)

(assert (=> b!1138828 (contains!6610 (+!3506 lt!506727 (tuple2!18149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!506721 () Unit!37316)

(assert (=> b!1138828 (= lt!506721 call!50497)))

(declare-fun call!50492 () Bool)

(assert (=> b!1138828 call!50492))

(declare-fun call!50490 () ListLongMap!16117)

(assert (=> b!1138828 (= lt!506727 call!50490)))

(declare-fun zeroValue!944 () V!43273)

(declare-fun lt!506728 () Unit!37316)

(declare-fun lt!506724 () ListLongMap!16117)

(declare-fun addStillContains!766 (ListLongMap!16117 (_ BitVec 64) V!43273 (_ BitVec 64)) Unit!37316)

(assert (=> b!1138828 (= lt!506728 (addStillContains!766 lt!506724 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!647991 () Unit!37316)

(assert (=> b!1138828 (= e!647991 lt!506721)))

(declare-fun b!1138829 () Bool)

(declare-fun res!759625 () Bool)

(assert (=> b!1138829 (=> (not res!759625) (not e!647980))))

(declare-datatypes ((List!24905 0))(
  ( (Nil!24902) (Cons!24901 (h!26110 (_ BitVec 64)) (t!35976 List!24905)) )
))
(declare-fun arrayNoDuplicates!0 (array!74077 (_ BitVec 32) List!24905) Bool)

(assert (=> b!1138829 (= res!759625 (arrayNoDuplicates!0 lt!506720 #b00000000000000000000000000000000 Nil!24902))))

(declare-fun b!1138830 () Bool)

(declare-fun e!647988 () Bool)

(assert (=> b!1138830 (= e!647980 (not e!647988))))

(declare-fun res!759627 () Bool)

(assert (=> b!1138830 (=> res!759627 e!647988)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1138830 (= res!759627 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138830 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!506725 () Unit!37316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74077 (_ BitVec 64) (_ BitVec 32)) Unit!37316)

(assert (=> b!1138830 (= lt!506725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1138831 () Bool)

(declare-fun e!647986 () Unit!37316)

(declare-fun e!647981 () Unit!37316)

(assert (=> b!1138831 (= e!647986 e!647981)))

(declare-fun c!111571 () Bool)

(assert (=> b!1138831 (= c!111571 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506732))))

(declare-fun b!1138832 () Bool)

(declare-fun e!647983 () Bool)

(declare-fun e!647990 () Bool)

(assert (=> b!1138832 (= e!647983 e!647990)))

(declare-fun res!759635 () Bool)

(assert (=> b!1138832 (=> res!759635 e!647990)))

(assert (=> b!1138832 (= res!759635 (not (= (select (arr!35689 _keys!1208) from!1455) k!934)))))

(declare-fun e!647977 () Bool)

(assert (=> b!1138832 e!647977))

(declare-fun c!111573 () Bool)

(assert (=> b!1138832 (= c!111573 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!506722 () Unit!37316)

(declare-datatypes ((ValueCell!13595 0))(
  ( (ValueCellFull!13595 (v!16998 V!43273)) (EmptyCell!13595) )
))
(declare-datatypes ((array!74079 0))(
  ( (array!74080 (arr!35690 (Array (_ BitVec 32) ValueCell!13595)) (size!36226 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74079)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!475 (array!74077 array!74079 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37316)

(assert (=> b!1138832 (= lt!506722 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138833 () Bool)

(declare-fun res!759626 () Bool)

(assert (=> b!1138833 (=> (not res!759626) (not e!647987))))

(assert (=> b!1138833 (= res!759626 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24902))))

(declare-fun b!1138834 () Bool)

(declare-fun res!759634 () Bool)

(assert (=> b!1138834 (=> (not res!759634) (not e!647987))))

(assert (=> b!1138834 (= res!759634 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36225 _keys!1208))))))

(declare-fun b!1138836 () Bool)

(declare-fun res!759623 () Bool)

(assert (=> b!1138836 (=> (not res!759623) (not e!647987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138836 (= res!759623 (validMask!0 mask!1564))))

(declare-fun bm!50488 () Bool)

(declare-fun call!50491 () Bool)

(assert (=> bm!50488 (= call!50491 call!50492)))

(declare-fun b!1138837 () Bool)

(declare-fun res!759630 () Bool)

(assert (=> b!1138837 (=> (not res!759630) (not e!647987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138837 (= res!759630 (validKeyInArray!0 k!934))))

(declare-fun bm!50489 () Bool)

(declare-fun call!50493 () ListLongMap!16117)

(assert (=> bm!50489 (= call!50493 call!50490)))

(declare-fun call!50496 () ListLongMap!16117)

(declare-fun bm!50490 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4558 (array!74077 array!74079 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 32) Int) ListLongMap!16117)

(assert (=> bm!50490 (= call!50496 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138838 () Bool)

(assert (=> b!1138838 (= e!647990 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36225 _keys!1208))))))

(declare-fun lt!506731 () Unit!37316)

(declare-fun e!647979 () Unit!37316)

(assert (=> b!1138838 (= lt!506731 e!647979)))

(declare-fun c!111572 () Bool)

(assert (=> b!1138838 (= c!111572 (contains!6610 lt!506724 k!934))))

(assert (=> b!1138838 (= lt!506724 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!50495 () ListLongMap!16117)

(declare-fun lt!506734 () array!74079)

(declare-fun bm!50491 () Bool)

(assert (=> bm!50491 (= call!50495 (getCurrentListMapNoExtraKeys!4558 lt!506720 lt!506734 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138839 () Bool)

(declare-fun -!1225 (ListLongMap!16117 (_ BitVec 64)) ListLongMap!16117)

(assert (=> b!1138839 (= e!647977 (= call!50495 (-!1225 call!50496 k!934)))))

(declare-fun b!1138840 () Bool)

(declare-fun e!647978 () Bool)

(declare-fun tp_is_empty!28609 () Bool)

(assert (=> b!1138840 (= e!647978 tp_is_empty!28609)))

(declare-fun b!1138841 () Bool)

(declare-fun c!111570 () Bool)

(assert (=> b!1138841 (= c!111570 (and (not lt!506732) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138841 (= e!647991 e!647986)))

(declare-fun b!1138842 () Bool)

(declare-fun Unit!37318 () Unit!37316)

(assert (=> b!1138842 (= e!647979 Unit!37318)))

(assert (=> b!1138842 (= lt!506732 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111569 () Bool)

(assert (=> b!1138842 (= c!111569 (and (not lt!506732) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506723 () Unit!37316)

(assert (=> b!1138842 (= lt!506723 e!647991)))

(declare-fun lt!506726 () Unit!37316)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!368 (array!74077 array!74079 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 64) (_ BitVec 32) Int) Unit!37316)

(assert (=> b!1138842 (= lt!506726 (lemmaListMapContainsThenArrayContainsFrom!368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111574 () Bool)

(assert (=> b!1138842 (= c!111574 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759629 () Bool)

(assert (=> b!1138842 (= res!759629 e!647982)))

(declare-fun e!647989 () Bool)

(assert (=> b!1138842 (=> (not res!759629) (not e!647989))))

(assert (=> b!1138842 e!647989))

(declare-fun lt!506730 () Unit!37316)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74077 (_ BitVec 32) (_ BitVec 32)) Unit!37316)

(assert (=> b!1138842 (= lt!506730 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138842 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24902)))

(declare-fun lt!506729 () Unit!37316)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74077 (_ BitVec 64) (_ BitVec 32) List!24905) Unit!37316)

(assert (=> b!1138842 (= lt!506729 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24902))))

(assert (=> b!1138842 false))

(declare-fun b!1138843 () Bool)

(declare-fun Unit!37319 () Unit!37316)

(assert (=> b!1138843 (= e!647979 Unit!37319)))

(declare-fun b!1138844 () Bool)

(declare-fun e!647984 () Bool)

(declare-fun mapRes!44738 () Bool)

(assert (=> b!1138844 (= e!647984 (and e!647978 mapRes!44738))))

(declare-fun condMapEmpty!44738 () Bool)

(declare-fun mapDefault!44738 () ValueCell!13595)

