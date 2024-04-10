; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98800 () Bool)

(assert start!98800)

(declare-fun b_free!24405 () Bool)

(declare-fun b_next!24405 () Bool)

(assert (=> start!98800 (= b_free!24405 (not b_next!24405))))

(declare-fun tp!85925 () Bool)

(declare-fun b_and!39659 () Bool)

(assert (=> start!98800 (= tp!85925 b_and!39659)))

(declare-datatypes ((V!43707 0))(
  ( (V!43708 (val!14524 Int)) )
))
(declare-fun zeroValue!944 () V!43707)

(declare-datatypes ((ValueCell!13758 0))(
  ( (ValueCellFull!13758 (v!17161 V!43707)) (EmptyCell!13758) )
))
(declare-datatypes ((array!74717 0))(
  ( (array!74718 (arr!36009 (Array (_ BitVec 32) ValueCell!13758)) (size!36545 (_ BitVec 32))) )
))
(declare-fun lt!517102 () array!74717)

(declare-fun e!656117 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18456 0))(
  ( (tuple2!18457 (_1!9239 (_ BitVec 64)) (_2!9239 V!43707)) )
))
(declare-datatypes ((List!25201 0))(
  ( (Nil!25198) (Cons!25197 (h!26406 tuple2!18456) (t!36598 List!25201)) )
))
(declare-datatypes ((ListLongMap!16425 0))(
  ( (ListLongMap!16426 (toList!8228 List!25201)) )
))
(declare-fun lt!517104 () ListLongMap!16425)

(declare-fun b!1153642 () Bool)

(declare-fun minValue!944 () V!43707)

(declare-datatypes ((array!74719 0))(
  ( (array!74720 (arr!36010 (Array (_ BitVec 32) (_ BitVec 64))) (size!36546 (_ BitVec 32))) )
))
(declare-fun lt!517098 () array!74719)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4698 (array!74719 array!74717 (_ BitVec 32) (_ BitVec 32) V!43707 V!43707 (_ BitVec 32) Int) ListLongMap!16425)

(assert (=> b!1153642 (= e!656117 (= lt!517104 (getCurrentListMapNoExtraKeys!4698 lt!517098 lt!517102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153643 () Bool)

(declare-fun res!766789 () Bool)

(declare-fun e!656122 () Bool)

(assert (=> b!1153643 (=> (not res!766789) (not e!656122))))

(declare-fun _keys!1208 () array!74719)

(declare-fun _values!996 () array!74717)

(assert (=> b!1153643 (= res!766789 (and (= (size!36545 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36546 _keys!1208) (size!36545 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153644 () Bool)

(declare-fun e!656121 () Bool)

(declare-fun e!656126 () Bool)

(assert (=> b!1153644 (= e!656121 e!656126)))

(declare-fun res!766782 () Bool)

(assert (=> b!1153644 (=> res!766782 e!656126)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153644 (= res!766782 (not (= from!1455 i!673)))))

(declare-fun lt!517116 () ListLongMap!16425)

(assert (=> b!1153644 (= lt!517116 (getCurrentListMapNoExtraKeys!4698 lt!517098 lt!517102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517112 () V!43707)

(assert (=> b!1153644 (= lt!517102 (array!74718 (store (arr!36009 _values!996) i!673 (ValueCellFull!13758 lt!517112)) (size!36545 _values!996)))))

(declare-fun dynLambda!2713 (Int (_ BitVec 64)) V!43707)

(assert (=> b!1153644 (= lt!517112 (dynLambda!2713 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517107 () ListLongMap!16425)

(assert (=> b!1153644 (= lt!517107 (getCurrentListMapNoExtraKeys!4698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517108 () ListLongMap!16425)

(declare-fun lt!517111 () ListLongMap!16425)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!114504 () Bool)

(declare-fun c!114508 () Bool)

(declare-fun bm!54399 () Bool)

(declare-datatypes ((Unit!37969 0))(
  ( (Unit!37970) )
))
(declare-fun call!54402 () Unit!37969)

(declare-fun addStillContains!887 (ListLongMap!16425 (_ BitVec 64) V!43707 (_ BitVec 64)) Unit!37969)

(assert (=> bm!54399 (= call!54402 (addStillContains!887 (ite c!114504 lt!517108 lt!517111) (ite c!114504 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114508 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114504 minValue!944 (ite c!114508 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1153645 () Bool)

(declare-fun call!54406 () Bool)

(assert (=> b!1153645 call!54406))

(declare-fun lt!517118 () Unit!37969)

(declare-fun call!54407 () Unit!37969)

(assert (=> b!1153645 (= lt!517118 call!54407)))

(declare-fun e!656114 () Unit!37969)

(assert (=> b!1153645 (= e!656114 lt!517118)))

(declare-fun bm!54400 () Bool)

(declare-fun call!54409 () ListLongMap!16425)

(declare-fun +!3642 (ListLongMap!16425 tuple2!18456) ListLongMap!16425)

(assert (=> bm!54400 (= call!54409 (+!3642 (ite c!114504 lt!517108 lt!517111) (ite c!114504 (tuple2!18457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114508 (tuple2!18457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153646 () Bool)

(declare-fun e!656113 () Bool)

(declare-fun tp_is_empty!28935 () Bool)

(assert (=> b!1153646 (= e!656113 tp_is_empty!28935)))

(declare-fun mapNonEmpty!45227 () Bool)

(declare-fun mapRes!45227 () Bool)

(declare-fun tp!85926 () Bool)

(assert (=> mapNonEmpty!45227 (= mapRes!45227 (and tp!85926 e!656113))))

(declare-fun mapValue!45227 () ValueCell!13758)

(declare-fun mapKey!45227 () (_ BitVec 32))

(declare-fun mapRest!45227 () (Array (_ BitVec 32) ValueCell!13758))

(assert (=> mapNonEmpty!45227 (= (arr!36009 _values!996) (store mapRest!45227 mapKey!45227 mapValue!45227))))

(declare-fun call!54403 () ListLongMap!16425)

(declare-fun bm!54401 () Bool)

(assert (=> bm!54401 (= call!54403 (getCurrentListMapNoExtraKeys!4698 lt!517098 lt!517102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153647 () Bool)

(declare-fun contains!6743 (ListLongMap!16425 (_ BitVec 64)) Bool)

(assert (=> b!1153647 (contains!6743 call!54409 k0!934)))

(declare-fun lt!517105 () Unit!37969)

(assert (=> b!1153647 (= lt!517105 call!54402)))

(declare-fun call!54404 () Bool)

(assert (=> b!1153647 call!54404))

(assert (=> b!1153647 (= lt!517108 (+!3642 lt!517111 (tuple2!18457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517119 () Unit!37969)

(assert (=> b!1153647 (= lt!517119 (addStillContains!887 lt!517111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!656120 () Unit!37969)

(assert (=> b!1153647 (= e!656120 lt!517105)))

(declare-fun b!1153648 () Bool)

(declare-fun e!656118 () Bool)

(assert (=> b!1153648 (= e!656118 (not e!656121))))

(declare-fun res!766793 () Bool)

(assert (=> b!1153648 (=> res!766793 e!656121)))

(assert (=> b!1153648 (= res!766793 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153648 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517100 () Unit!37969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74719 (_ BitVec 64) (_ BitVec 32)) Unit!37969)

(assert (=> b!1153648 (= lt!517100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45227 () Bool)

(assert (=> mapIsEmpty!45227 mapRes!45227))

(declare-fun b!1153649 () Bool)

(declare-fun e!656112 () Bool)

(declare-fun e!656111 () Bool)

(assert (=> b!1153649 (= e!656112 (and e!656111 mapRes!45227))))

(declare-fun condMapEmpty!45227 () Bool)

(declare-fun mapDefault!45227 () ValueCell!13758)

(assert (=> b!1153649 (= condMapEmpty!45227 (= (arr!36009 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13758)) mapDefault!45227)))))

(declare-fun b!1153650 () Bool)

(declare-fun e!656127 () Unit!37969)

(declare-fun Unit!37971 () Unit!37969)

(assert (=> b!1153650 (= e!656127 Unit!37971)))

(declare-fun b!1153651 () Bool)

(declare-fun res!766791 () Bool)

(assert (=> b!1153651 (=> (not res!766791) (not e!656122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153651 (= res!766791 (validKeyInArray!0 k0!934))))

(declare-fun bm!54402 () Bool)

(assert (=> bm!54402 (= call!54407 call!54402)))

(declare-fun b!1153652 () Bool)

(declare-fun e!656125 () Bool)

(assert (=> b!1153652 (= e!656126 e!656125)))

(declare-fun res!766783 () Bool)

(assert (=> b!1153652 (=> res!766783 e!656125)))

(assert (=> b!1153652 (= res!766783 (not (= (select (arr!36010 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656124 () Bool)

(assert (=> b!1153652 e!656124))

(declare-fun c!114505 () Bool)

(assert (=> b!1153652 (= c!114505 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517099 () Unit!37969)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!587 (array!74719 array!74717 (_ BitVec 32) (_ BitVec 32) V!43707 V!43707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37969)

(assert (=> b!1153652 (= lt!517099 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153653 () Bool)

(assert (=> b!1153653 (= e!656111 tp_is_empty!28935)))

(declare-fun b!1153654 () Bool)

(declare-fun e!656119 () Unit!37969)

(assert (=> b!1153654 (= e!656119 e!656114)))

(declare-fun c!114503 () Bool)

(declare-fun lt!517115 () Bool)

(assert (=> b!1153654 (= c!114503 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517115))))

(declare-fun call!54408 () ListLongMap!16425)

(declare-fun b!1153655 () Bool)

(declare-fun -!1352 (ListLongMap!16425 (_ BitVec 64)) ListLongMap!16425)

(assert (=> b!1153655 (= e!656124 (= call!54403 (-!1352 call!54408 k0!934)))))

(declare-fun e!656123 () Bool)

(declare-fun b!1153656 () Bool)

(assert (=> b!1153656 (= e!656123 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153657 () Bool)

(assert (=> b!1153657 (= e!656122 e!656118)))

(declare-fun res!766787 () Bool)

(assert (=> b!1153657 (=> (not res!766787) (not e!656118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74719 (_ BitVec 32)) Bool)

(assert (=> b!1153657 (= res!766787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517098 mask!1564))))

(assert (=> b!1153657 (= lt!517098 (array!74720 (store (arr!36010 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36546 _keys!1208)))))

(declare-fun b!1153658 () Bool)

(assert (=> b!1153658 (= e!656125 true)))

(assert (=> b!1153658 e!656117))

(declare-fun res!766786 () Bool)

(assert (=> b!1153658 (=> (not res!766786) (not e!656117))))

(assert (=> b!1153658 (= res!766786 (= lt!517104 lt!517111))))

(assert (=> b!1153658 (= lt!517104 (-!1352 lt!517107 k0!934))))

(declare-fun lt!517106 () V!43707)

(assert (=> b!1153658 (= (-!1352 (+!3642 lt!517111 (tuple2!18457 (select (arr!36010 _keys!1208) from!1455) lt!517106)) (select (arr!36010 _keys!1208) from!1455)) lt!517111)))

(declare-fun lt!517114 () Unit!37969)

(declare-fun addThenRemoveForNewKeyIsSame!192 (ListLongMap!16425 (_ BitVec 64) V!43707) Unit!37969)

(assert (=> b!1153658 (= lt!517114 (addThenRemoveForNewKeyIsSame!192 lt!517111 (select (arr!36010 _keys!1208) from!1455) lt!517106))))

(declare-fun get!18340 (ValueCell!13758 V!43707) V!43707)

(assert (=> b!1153658 (= lt!517106 (get!18340 (select (arr!36009 _values!996) from!1455) lt!517112))))

(declare-fun lt!517103 () Unit!37969)

(assert (=> b!1153658 (= lt!517103 e!656127)))

(declare-fun c!114506 () Bool)

(assert (=> b!1153658 (= c!114506 (contains!6743 lt!517111 k0!934))))

(assert (=> b!1153658 (= lt!517111 (getCurrentListMapNoExtraKeys!4698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153659 () Bool)

(declare-fun e!656115 () Bool)

(assert (=> b!1153659 (= e!656115 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153660 () Bool)

(declare-fun res!766779 () Bool)

(assert (=> b!1153660 (=> (not res!766779) (not e!656122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153660 (= res!766779 (validMask!0 mask!1564))))

(declare-fun res!766792 () Bool)

(assert (=> start!98800 (=> (not res!766792) (not e!656122))))

(assert (=> start!98800 (= res!766792 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36546 _keys!1208))))))

(assert (=> start!98800 e!656122))

(assert (=> start!98800 tp_is_empty!28935))

(declare-fun array_inv!27568 (array!74719) Bool)

(assert (=> start!98800 (array_inv!27568 _keys!1208)))

(assert (=> start!98800 true))

(assert (=> start!98800 tp!85925))

(declare-fun array_inv!27569 (array!74717) Bool)

(assert (=> start!98800 (and (array_inv!27569 _values!996) e!656112)))

(declare-fun b!1153661 () Bool)

(assert (=> b!1153661 (= e!656124 (= call!54403 call!54408))))

(declare-fun b!1153662 () Bool)

(assert (=> b!1153662 (= e!656123 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517115) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153663 () Bool)

(declare-fun lt!517113 () Unit!37969)

(assert (=> b!1153663 (= e!656119 lt!517113)))

(assert (=> b!1153663 (= lt!517113 call!54407)))

(assert (=> b!1153663 call!54406))

(declare-fun call!54405 () ListLongMap!16425)

(declare-fun bm!54403 () Bool)

(assert (=> bm!54403 (= call!54404 (contains!6743 (ite c!114504 lt!517108 call!54405) k0!934))))

(declare-fun b!1153664 () Bool)

(declare-fun res!766790 () Bool)

(assert (=> b!1153664 (=> (not res!766790) (not e!656122))))

(declare-datatypes ((List!25202 0))(
  ( (Nil!25199) (Cons!25198 (h!26407 (_ BitVec 64)) (t!36599 List!25202)) )
))
(declare-fun arrayNoDuplicates!0 (array!74719 (_ BitVec 32) List!25202) Bool)

(assert (=> b!1153664 (= res!766790 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25199))))

(declare-fun b!1153665 () Bool)

(declare-fun res!766784 () Bool)

(assert (=> b!1153665 (=> (not res!766784) (not e!656122))))

(assert (=> b!1153665 (= res!766784 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36546 _keys!1208))))))

(declare-fun b!1153666 () Bool)

(assert (=> b!1153666 (= c!114508 (and (not lt!517115) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153666 (= e!656120 e!656119)))

(declare-fun bm!54404 () Bool)

(assert (=> bm!54404 (= call!54406 call!54404)))

(declare-fun b!1153667 () Bool)

(declare-fun res!766781 () Bool)

(assert (=> b!1153667 (=> (not res!766781) (not e!656122))))

(assert (=> b!1153667 (= res!766781 (= (select (arr!36010 _keys!1208) i!673) k0!934))))

(declare-fun bm!54405 () Bool)

(assert (=> bm!54405 (= call!54408 (getCurrentListMapNoExtraKeys!4698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153668 () Bool)

(declare-fun Unit!37972 () Unit!37969)

(assert (=> b!1153668 (= e!656114 Unit!37972)))

(declare-fun b!1153669 () Bool)

(declare-fun Unit!37973 () Unit!37969)

(assert (=> b!1153669 (= e!656127 Unit!37973)))

(assert (=> b!1153669 (= lt!517115 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153669 (= c!114504 (and (not lt!517115) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517101 () Unit!37969)

(assert (=> b!1153669 (= lt!517101 e!656120)))

(declare-fun lt!517117 () Unit!37969)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!481 (array!74719 array!74717 (_ BitVec 32) (_ BitVec 32) V!43707 V!43707 (_ BitVec 64) (_ BitVec 32) Int) Unit!37969)

(assert (=> b!1153669 (= lt!517117 (lemmaListMapContainsThenArrayContainsFrom!481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114507 () Bool)

(assert (=> b!1153669 (= c!114507 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766780 () Bool)

(assert (=> b!1153669 (= res!766780 e!656123)))

(assert (=> b!1153669 (=> (not res!766780) (not e!656115))))

(assert (=> b!1153669 e!656115))

(declare-fun lt!517109 () Unit!37969)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74719 (_ BitVec 32) (_ BitVec 32)) Unit!37969)

(assert (=> b!1153669 (= lt!517109 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153669 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25199)))

(declare-fun lt!517110 () Unit!37969)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74719 (_ BitVec 64) (_ BitVec 32) List!25202) Unit!37969)

(assert (=> b!1153669 (= lt!517110 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25199))))

(assert (=> b!1153669 false))

(declare-fun b!1153670 () Bool)

(declare-fun res!766785 () Bool)

(assert (=> b!1153670 (=> (not res!766785) (not e!656122))))

(assert (=> b!1153670 (= res!766785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54406 () Bool)

(assert (=> bm!54406 (= call!54405 call!54409)))

(declare-fun b!1153671 () Bool)

(declare-fun res!766788 () Bool)

(assert (=> b!1153671 (=> (not res!766788) (not e!656118))))

(assert (=> b!1153671 (= res!766788 (arrayNoDuplicates!0 lt!517098 #b00000000000000000000000000000000 Nil!25199))))

(assert (= (and start!98800 res!766792) b!1153660))

(assert (= (and b!1153660 res!766779) b!1153643))

(assert (= (and b!1153643 res!766789) b!1153670))

(assert (= (and b!1153670 res!766785) b!1153664))

(assert (= (and b!1153664 res!766790) b!1153665))

(assert (= (and b!1153665 res!766784) b!1153651))

(assert (= (and b!1153651 res!766791) b!1153667))

(assert (= (and b!1153667 res!766781) b!1153657))

(assert (= (and b!1153657 res!766787) b!1153671))

(assert (= (and b!1153671 res!766788) b!1153648))

(assert (= (and b!1153648 (not res!766793)) b!1153644))

(assert (= (and b!1153644 (not res!766782)) b!1153652))

(assert (= (and b!1153652 c!114505) b!1153655))

(assert (= (and b!1153652 (not c!114505)) b!1153661))

(assert (= (or b!1153655 b!1153661) bm!54401))

(assert (= (or b!1153655 b!1153661) bm!54405))

(assert (= (and b!1153652 (not res!766783)) b!1153658))

(assert (= (and b!1153658 c!114506) b!1153669))

(assert (= (and b!1153658 (not c!114506)) b!1153650))

(assert (= (and b!1153669 c!114504) b!1153647))

(assert (= (and b!1153669 (not c!114504)) b!1153666))

(assert (= (and b!1153666 c!114508) b!1153663))

(assert (= (and b!1153666 (not c!114508)) b!1153654))

(assert (= (and b!1153654 c!114503) b!1153645))

(assert (= (and b!1153654 (not c!114503)) b!1153668))

(assert (= (or b!1153663 b!1153645) bm!54402))

(assert (= (or b!1153663 b!1153645) bm!54406))

(assert (= (or b!1153663 b!1153645) bm!54404))

(assert (= (or b!1153647 bm!54404) bm!54403))

(assert (= (or b!1153647 bm!54402) bm!54399))

(assert (= (or b!1153647 bm!54406) bm!54400))

(assert (= (and b!1153669 c!114507) b!1153656))

(assert (= (and b!1153669 (not c!114507)) b!1153662))

(assert (= (and b!1153669 res!766780) b!1153659))

(assert (= (and b!1153658 res!766786) b!1153642))

(assert (= (and b!1153649 condMapEmpty!45227) mapIsEmpty!45227))

(assert (= (and b!1153649 (not condMapEmpty!45227)) mapNonEmpty!45227))

(get-info :version)

(assert (= (and mapNonEmpty!45227 ((_ is ValueCellFull!13758) mapValue!45227)) b!1153646))

(assert (= (and b!1153649 ((_ is ValueCellFull!13758) mapDefault!45227)) b!1153653))

(assert (= start!98800 b!1153649))

(declare-fun b_lambda!19511 () Bool)

(assert (=> (not b_lambda!19511) (not b!1153644)))

(declare-fun t!36597 () Bool)

(declare-fun tb!9217 () Bool)

(assert (=> (and start!98800 (= defaultEntry!1004 defaultEntry!1004) t!36597) tb!9217))

(declare-fun result!18999 () Bool)

(assert (=> tb!9217 (= result!18999 tp_is_empty!28935)))

(assert (=> b!1153644 t!36597))

(declare-fun b_and!39661 () Bool)

(assert (= b_and!39659 (and (=> t!36597 result!18999) b_and!39661)))

(declare-fun m!1063465 () Bool)

(assert (=> b!1153664 m!1063465))

(declare-fun m!1063467 () Bool)

(assert (=> b!1153648 m!1063467))

(declare-fun m!1063469 () Bool)

(assert (=> b!1153648 m!1063469))

(declare-fun m!1063471 () Bool)

(assert (=> b!1153644 m!1063471))

(declare-fun m!1063473 () Bool)

(assert (=> b!1153644 m!1063473))

(declare-fun m!1063475 () Bool)

(assert (=> b!1153644 m!1063475))

(declare-fun m!1063477 () Bool)

(assert (=> b!1153644 m!1063477))

(declare-fun m!1063479 () Bool)

(assert (=> b!1153652 m!1063479))

(declare-fun m!1063481 () Bool)

(assert (=> b!1153652 m!1063481))

(declare-fun m!1063483 () Bool)

(assert (=> b!1153642 m!1063483))

(declare-fun m!1063485 () Bool)

(assert (=> b!1153656 m!1063485))

(declare-fun m!1063487 () Bool)

(assert (=> start!98800 m!1063487))

(declare-fun m!1063489 () Bool)

(assert (=> start!98800 m!1063489))

(assert (=> b!1153659 m!1063485))

(declare-fun m!1063491 () Bool)

(assert (=> bm!54403 m!1063491))

(declare-fun m!1063493 () Bool)

(assert (=> bm!54400 m!1063493))

(declare-fun m!1063495 () Bool)

(assert (=> bm!54405 m!1063495))

(declare-fun m!1063497 () Bool)

(assert (=> b!1153669 m!1063497))

(declare-fun m!1063499 () Bool)

(assert (=> b!1153669 m!1063499))

(declare-fun m!1063501 () Bool)

(assert (=> b!1153669 m!1063501))

(declare-fun m!1063503 () Bool)

(assert (=> b!1153669 m!1063503))

(declare-fun m!1063505 () Bool)

(assert (=> b!1153670 m!1063505))

(declare-fun m!1063507 () Bool)

(assert (=> b!1153651 m!1063507))

(declare-fun m!1063509 () Bool)

(assert (=> b!1153660 m!1063509))

(assert (=> bm!54401 m!1063483))

(declare-fun m!1063511 () Bool)

(assert (=> b!1153658 m!1063511))

(assert (=> b!1153658 m!1063479))

(declare-fun m!1063513 () Bool)

(assert (=> b!1153658 m!1063513))

(declare-fun m!1063515 () Bool)

(assert (=> b!1153658 m!1063515))

(assert (=> b!1153658 m!1063479))

(declare-fun m!1063517 () Bool)

(assert (=> b!1153658 m!1063517))

(declare-fun m!1063519 () Bool)

(assert (=> b!1153658 m!1063519))

(assert (=> b!1153658 m!1063511))

(assert (=> b!1153658 m!1063479))

(declare-fun m!1063521 () Bool)

(assert (=> b!1153658 m!1063521))

(assert (=> b!1153658 m!1063495))

(assert (=> b!1153658 m!1063515))

(declare-fun m!1063523 () Bool)

(assert (=> b!1153658 m!1063523))

(declare-fun m!1063525 () Bool)

(assert (=> b!1153667 m!1063525))

(declare-fun m!1063527 () Bool)

(assert (=> b!1153655 m!1063527))

(declare-fun m!1063529 () Bool)

(assert (=> b!1153671 m!1063529))

(declare-fun m!1063531 () Bool)

(assert (=> b!1153647 m!1063531))

(declare-fun m!1063533 () Bool)

(assert (=> b!1153647 m!1063533))

(declare-fun m!1063535 () Bool)

(assert (=> b!1153647 m!1063535))

(declare-fun m!1063537 () Bool)

(assert (=> mapNonEmpty!45227 m!1063537))

(declare-fun m!1063539 () Bool)

(assert (=> bm!54399 m!1063539))

(declare-fun m!1063541 () Bool)

(assert (=> b!1153657 m!1063541))

(declare-fun m!1063543 () Bool)

(assert (=> b!1153657 m!1063543))

(check-sat (not bm!54400) (not b!1153659) (not b!1153642) (not bm!54399) (not start!98800) (not b!1153660) (not b!1153651) (not b!1153664) (not b!1153656) (not b_next!24405) (not b!1153644) (not mapNonEmpty!45227) tp_is_empty!28935 (not bm!54403) (not b!1153647) (not b_lambda!19511) (not b!1153658) (not b!1153657) (not b!1153670) (not bm!54401) b_and!39661 (not b!1153648) (not b!1153671) (not b!1153655) (not b!1153652) (not b!1153669) (not bm!54405))
(check-sat b_and!39661 (not b_next!24405))
