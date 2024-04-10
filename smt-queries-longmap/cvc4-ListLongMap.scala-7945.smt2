; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98514 () Bool)

(assert start!98514)

(declare-fun b_free!24119 () Bool)

(declare-fun b_next!24119 () Bool)

(assert (=> start!98514 (= b_free!24119 (not b_next!24119))))

(declare-fun tp!85067 () Bool)

(declare-fun b_and!39087 () Bool)

(assert (=> start!98514 (= tp!85067 b_and!39087)))

(declare-fun b!1140604 () Bool)

(declare-datatypes ((Unit!37400 0))(
  ( (Unit!37401) )
))
(declare-fun e!648951 () Unit!37400)

(declare-fun Unit!37402 () Unit!37400)

(assert (=> b!1140604 (= e!648951 Unit!37402)))

(declare-fun b!1140605 () Bool)

(declare-fun res!760462 () Bool)

(declare-fun e!648939 () Bool)

(assert (=> b!1140605 (=> (not res!760462) (not e!648939))))

(declare-datatypes ((array!74155 0))(
  ( (array!74156 (arr!35728 (Array (_ BitVec 32) (_ BitVec 64))) (size!36264 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74155)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74155 (_ BitVec 32)) Bool)

(assert (=> b!1140605 (= res!760462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140607 () Bool)

(declare-datatypes ((V!43325 0))(
  ( (V!43326 (val!14381 Int)) )
))
(declare-datatypes ((tuple2!18186 0))(
  ( (tuple2!18187 (_1!9104 (_ BitVec 64)) (_2!9104 V!43325)) )
))
(declare-datatypes ((List!24941 0))(
  ( (Nil!24938) (Cons!24937 (h!26146 tuple2!18186) (t!36052 List!24941)) )
))
(declare-datatypes ((ListLongMap!16155 0))(
  ( (ListLongMap!16156 (toList!8093 List!24941)) )
))
(declare-fun call!50974 () ListLongMap!16155)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6628 (ListLongMap!16155 (_ BitVec 64)) Bool)

(assert (=> b!1140607 (contains!6628 call!50974 k!934)))

(declare-fun lt!507944 () Unit!37400)

(declare-fun call!50972 () Unit!37400)

(assert (=> b!1140607 (= lt!507944 call!50972)))

(declare-fun call!50977 () Bool)

(assert (=> b!1140607 call!50977))

(declare-fun lt!507952 () ListLongMap!16155)

(declare-fun lt!507945 () ListLongMap!16155)

(declare-fun zeroValue!944 () V!43325)

(declare-fun +!3525 (ListLongMap!16155 tuple2!18186) ListLongMap!16155)

(assert (=> b!1140607 (= lt!507952 (+!3525 lt!507945 (tuple2!18187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507950 () Unit!37400)

(declare-fun addStillContains!782 (ListLongMap!16155 (_ BitVec 64) V!43325 (_ BitVec 64)) Unit!37400)

(assert (=> b!1140607 (= lt!507950 (addStillContains!782 lt!507945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!648949 () Unit!37400)

(assert (=> b!1140607 (= e!648949 lt!507944)))

(declare-fun mapNonEmpty!44798 () Bool)

(declare-fun mapRes!44798 () Bool)

(declare-fun tp!85068 () Bool)

(declare-fun e!648947 () Bool)

(assert (=> mapNonEmpty!44798 (= mapRes!44798 (and tp!85068 e!648947))))

(declare-datatypes ((ValueCell!13615 0))(
  ( (ValueCellFull!13615 (v!17018 V!43325)) (EmptyCell!13615) )
))
(declare-fun mapValue!44798 () ValueCell!13615)

(declare-fun mapKey!44798 () (_ BitVec 32))

(declare-datatypes ((array!74157 0))(
  ( (array!74158 (arr!35729 (Array (_ BitVec 32) ValueCell!13615)) (size!36265 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74157)

(declare-fun mapRest!44798 () (Array (_ BitVec 32) ValueCell!13615))

(assert (=> mapNonEmpty!44798 (= (arr!35729 _values!996) (store mapRest!44798 mapKey!44798 mapValue!44798))))

(declare-fun b!1140608 () Bool)

(declare-fun res!760468 () Bool)

(assert (=> b!1140608 (=> (not res!760468) (not e!648939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140608 (= res!760468 (validKeyInArray!0 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!50967 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!50975 () ListLongMap!16155)

(declare-fun lt!507948 () array!74155)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!507947 () array!74157)

(declare-fun minValue!944 () V!43325)

(declare-fun getCurrentListMapNoExtraKeys!4575 (array!74155 array!74157 (_ BitVec 32) (_ BitVec 32) V!43325 V!43325 (_ BitVec 32) Int) ListLongMap!16155)

(assert (=> bm!50967 (= call!50975 (getCurrentListMapNoExtraKeys!4575 lt!507948 lt!507947 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50968 () Bool)

(declare-fun call!50970 () Unit!37400)

(assert (=> bm!50968 (= call!50970 call!50972)))

(declare-fun b!1140609 () Bool)

(declare-fun e!648945 () Unit!37400)

(declare-fun Unit!37403 () Unit!37400)

(assert (=> b!1140609 (= e!648945 Unit!37403)))

(declare-fun call!50973 () ListLongMap!16155)

(declare-fun c!111934 () Bool)

(declare-fun bm!50969 () Bool)

(assert (=> bm!50969 (= call!50977 (contains!6628 (ite c!111934 lt!507952 call!50973) k!934))))

(declare-fun b!1140610 () Bool)

(declare-fun e!648938 () Bool)

(assert (=> b!1140610 (= e!648939 e!648938)))

(declare-fun res!760473 () Bool)

(assert (=> b!1140610 (=> (not res!760473) (not e!648938))))

(assert (=> b!1140610 (= res!760473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507948 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140610 (= lt!507948 (array!74156 (store (arr!35728 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36264 _keys!1208)))))

(declare-fun b!1140611 () Bool)

(declare-fun res!760466 () Bool)

(assert (=> b!1140611 (=> (not res!760466) (not e!648939))))

(assert (=> b!1140611 (= res!760466 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36264 _keys!1208))))))

(declare-fun b!1140612 () Bool)

(declare-fun e!648937 () Bool)

(declare-fun arrayContainsKey!0 (array!74155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140612 (= e!648937 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140613 () Bool)

(declare-fun e!648943 () Unit!37400)

(assert (=> b!1140613 (= e!648943 e!648945)))

(declare-fun c!111933 () Bool)

(declare-fun lt!507957 () Bool)

(assert (=> b!1140613 (= c!111933 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507957))))

(declare-fun b!1140614 () Bool)

(declare-fun res!760472 () Bool)

(assert (=> b!1140614 (=> (not res!760472) (not e!648939))))

(declare-datatypes ((List!24942 0))(
  ( (Nil!24939) (Cons!24938 (h!26147 (_ BitVec 64)) (t!36053 List!24942)) )
))
(declare-fun arrayNoDuplicates!0 (array!74155 (_ BitVec 32) List!24942) Bool)

(assert (=> b!1140614 (= res!760472 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24939))))

(declare-fun c!111932 () Bool)

(declare-fun bm!50970 () Bool)

(assert (=> bm!50970 (= call!50972 (addStillContains!782 (ite c!111934 lt!507952 lt!507945) (ite c!111934 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111932 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111934 minValue!944 (ite c!111932 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1140615 () Bool)

(declare-fun e!648942 () Bool)

(assert (=> b!1140615 (= e!648942 true)))

(declare-fun lt!507941 () V!43325)

(declare-fun -!1243 (ListLongMap!16155 (_ BitVec 64)) ListLongMap!16155)

(assert (=> b!1140615 (= (-!1243 (+!3525 lt!507945 (tuple2!18187 (select (arr!35728 _keys!1208) from!1455) lt!507941)) (select (arr!35728 _keys!1208) from!1455)) lt!507945)))

(declare-fun lt!507953 () Unit!37400)

(declare-fun addThenRemoveForNewKeyIsSame!97 (ListLongMap!16155 (_ BitVec 64) V!43325) Unit!37400)

(assert (=> b!1140615 (= lt!507953 (addThenRemoveForNewKeyIsSame!97 lt!507945 (select (arr!35728 _keys!1208) from!1455) lt!507941))))

(declare-fun lt!507946 () V!43325)

(declare-fun get!18149 (ValueCell!13615 V!43325) V!43325)

(assert (=> b!1140615 (= lt!507941 (get!18149 (select (arr!35729 _values!996) from!1455) lt!507946))))

(declare-fun lt!507943 () Unit!37400)

(assert (=> b!1140615 (= lt!507943 e!648951)))

(declare-fun c!111929 () Bool)

(assert (=> b!1140615 (= c!111929 (contains!6628 lt!507945 k!934))))

(assert (=> b!1140615 (= lt!507945 (getCurrentListMapNoExtraKeys!4575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140616 () Bool)

(declare-fun res!760475 () Bool)

(assert (=> b!1140616 (=> (not res!760475) (not e!648939))))

(assert (=> b!1140616 (= res!760475 (and (= (size!36265 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36264 _keys!1208) (size!36265 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140617 () Bool)

(declare-fun res!760474 () Bool)

(assert (=> b!1140617 (=> (not res!760474) (not e!648938))))

(assert (=> b!1140617 (= res!760474 (arrayNoDuplicates!0 lt!507948 #b00000000000000000000000000000000 Nil!24939))))

(declare-fun b!1140606 () Bool)

(declare-fun lt!507958 () Unit!37400)

(assert (=> b!1140606 (= e!648943 lt!507958)))

(assert (=> b!1140606 (= lt!507958 call!50970)))

(declare-fun call!50976 () Bool)

(assert (=> b!1140606 call!50976))

(declare-fun res!760469 () Bool)

(assert (=> start!98514 (=> (not res!760469) (not e!648939))))

(assert (=> start!98514 (= res!760469 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36264 _keys!1208))))))

(assert (=> start!98514 e!648939))

(declare-fun tp_is_empty!28649 () Bool)

(assert (=> start!98514 tp_is_empty!28649))

(declare-fun array_inv!27386 (array!74155) Bool)

(assert (=> start!98514 (array_inv!27386 _keys!1208)))

(assert (=> start!98514 true))

(assert (=> start!98514 tp!85067))

(declare-fun e!648936 () Bool)

(declare-fun array_inv!27387 (array!74157) Bool)

(assert (=> start!98514 (and (array_inv!27387 _values!996) e!648936)))

(declare-fun b!1140618 () Bool)

(declare-fun e!648944 () Bool)

(assert (=> b!1140618 (= e!648936 (and e!648944 mapRes!44798))))

(declare-fun condMapEmpty!44798 () Bool)

(declare-fun mapDefault!44798 () ValueCell!13615)

