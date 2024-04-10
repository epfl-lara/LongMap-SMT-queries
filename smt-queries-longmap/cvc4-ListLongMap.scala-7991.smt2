; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98790 () Bool)

(assert start!98790)

(declare-fun b_free!24395 () Bool)

(declare-fun b_next!24395 () Bool)

(assert (=> start!98790 (= b_free!24395 (not b_next!24395))))

(declare-fun tp!85895 () Bool)

(declare-fun b_and!39639 () Bool)

(assert (=> start!98790 (= tp!85895 b_and!39639)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1153182 () Bool)

(declare-fun lt!516774 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!655856 () Bool)

(assert (=> b!1153182 (= e!655856 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516774) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153183 () Bool)

(declare-fun res!766556 () Bool)

(declare-fun e!655862 () Bool)

(assert (=> b!1153183 (=> (not res!766556) (not e!655862))))

(declare-datatypes ((array!74697 0))(
  ( (array!74698 (arr!35999 (Array (_ BitVec 32) (_ BitVec 64))) (size!36535 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74697)

(declare-datatypes ((V!43693 0))(
  ( (V!43694 (val!14519 Int)) )
))
(declare-datatypes ((ValueCell!13753 0))(
  ( (ValueCellFull!13753 (v!17156 V!43693)) (EmptyCell!13753) )
))
(declare-datatypes ((array!74699 0))(
  ( (array!74700 (arr!36000 (Array (_ BitVec 32) ValueCell!13753)) (size!36536 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74699)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1153183 (= res!766556 (and (= (size!36536 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36535 _keys!1208) (size!36536 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153184 () Bool)

(declare-fun res!766555 () Bool)

(assert (=> b!1153184 (=> (not res!766555) (not e!655862))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153184 (= res!766555 (= (select (arr!35999 _keys!1208) i!673) k!934))))

(declare-fun b!1153185 () Bool)

(declare-fun e!655858 () Bool)

(declare-datatypes ((tuple2!18446 0))(
  ( (tuple2!18447 (_1!9234 (_ BitVec 64)) (_2!9234 V!43693)) )
))
(declare-datatypes ((List!25193 0))(
  ( (Nil!25190) (Cons!25189 (h!26398 tuple2!18446) (t!36580 List!25193)) )
))
(declare-datatypes ((ListLongMap!16415 0))(
  ( (ListLongMap!16416 (toList!8223 List!25193)) )
))
(declare-fun call!54284 () ListLongMap!16415)

(declare-fun call!54285 () ListLongMap!16415)

(assert (=> b!1153185 (= e!655858 (= call!54284 call!54285))))

(declare-fun b!1153186 () Bool)

(declare-fun e!655860 () Bool)

(assert (=> b!1153186 (= e!655860 true)))

(declare-fun e!655870 () Bool)

(assert (=> b!1153186 e!655870))

(declare-fun res!766558 () Bool)

(assert (=> b!1153186 (=> (not res!766558) (not e!655870))))

(declare-fun lt!516776 () ListLongMap!16415)

(declare-fun lt!516785 () ListLongMap!16415)

(assert (=> b!1153186 (= res!766558 (= lt!516776 lt!516785))))

(declare-fun lt!516775 () ListLongMap!16415)

(declare-fun -!1349 (ListLongMap!16415 (_ BitVec 64)) ListLongMap!16415)

(assert (=> b!1153186 (= lt!516776 (-!1349 lt!516775 k!934))))

(declare-fun lt!516782 () V!43693)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3639 (ListLongMap!16415 tuple2!18446) ListLongMap!16415)

(assert (=> b!1153186 (= (-!1349 (+!3639 lt!516785 (tuple2!18447 (select (arr!35999 _keys!1208) from!1455) lt!516782)) (select (arr!35999 _keys!1208) from!1455)) lt!516785)))

(declare-datatypes ((Unit!37954 0))(
  ( (Unit!37955) )
))
(declare-fun lt!516783 () Unit!37954)

(declare-fun addThenRemoveForNewKeyIsSame!190 (ListLongMap!16415 (_ BitVec 64) V!43693) Unit!37954)

(assert (=> b!1153186 (= lt!516783 (addThenRemoveForNewKeyIsSame!190 lt!516785 (select (arr!35999 _keys!1208) from!1455) lt!516782))))

(declare-fun lt!516786 () V!43693)

(declare-fun get!18334 (ValueCell!13753 V!43693) V!43693)

(assert (=> b!1153186 (= lt!516782 (get!18334 (select (arr!36000 _values!996) from!1455) lt!516786))))

(declare-fun lt!516781 () Unit!37954)

(declare-fun e!655857 () Unit!37954)

(assert (=> b!1153186 (= lt!516781 e!655857)))

(declare-fun c!114416 () Bool)

(declare-fun contains!6740 (ListLongMap!16415 (_ BitVec 64)) Bool)

(assert (=> b!1153186 (= c!114416 (contains!6740 lt!516785 k!934))))

(declare-fun zeroValue!944 () V!43693)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43693)

(declare-fun getCurrentListMapNoExtraKeys!4693 (array!74697 array!74699 (_ BitVec 32) (_ BitVec 32) V!43693 V!43693 (_ BitVec 32) Int) ListLongMap!16415)

(assert (=> b!1153186 (= lt!516785 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153187 () Bool)

(declare-fun e!655871 () Bool)

(declare-fun e!655861 () Bool)

(declare-fun mapRes!45212 () Bool)

(assert (=> b!1153187 (= e!655871 (and e!655861 mapRes!45212))))

(declare-fun condMapEmpty!45212 () Bool)

(declare-fun mapDefault!45212 () ValueCell!13753)

