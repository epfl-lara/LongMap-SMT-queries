; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98842 () Bool)

(assert start!98842)

(declare-fun b_free!24447 () Bool)

(declare-fun b_next!24447 () Bool)

(assert (=> start!98842 (= b_free!24447 (not b_next!24447))))

(declare-fun tp!86051 () Bool)

(declare-fun b_and!39743 () Bool)

(assert (=> start!98842 (= tp!86051 b_and!39743)))

(declare-fun b!1155574 () Bool)

(declare-fun e!657182 () Bool)

(declare-fun e!657185 () Bool)

(assert (=> b!1155574 (= e!657182 e!657185)))

(declare-fun res!767736 () Bool)

(assert (=> b!1155574 (=> (not res!767736) (not e!657185))))

(declare-datatypes ((array!74801 0))(
  ( (array!74802 (arr!36051 (Array (_ BitVec 32) (_ BitVec 64))) (size!36587 (_ BitVec 32))) )
))
(declare-fun lt!518505 () array!74801)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74801 (_ BitVec 32)) Bool)

(assert (=> b!1155574 (= res!767736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518505 mask!1564))))

(declare-fun _keys!1208 () array!74801)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155574 (= lt!518505 (array!74802 (store (arr!36051 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36587 _keys!1208)))))

(declare-fun b!1155575 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657190 () Bool)

(declare-fun arrayContainsKey!0 (array!74801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155575 (= e!657190 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155576 () Bool)

(declare-fun e!657192 () Bool)

(assert (=> b!1155576 (= e!657192 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155577 () Bool)

(declare-datatypes ((Unit!38054 0))(
  ( (Unit!38055) )
))
(declare-fun e!657186 () Unit!38054)

(declare-fun Unit!38056 () Unit!38054)

(assert (=> b!1155577 (= e!657186 Unit!38056)))

(declare-fun lt!518500 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155577 (= lt!518500 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114882 () Bool)

(assert (=> b!1155577 (= c!114882 (and (not lt!518500) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518492 () Unit!38054)

(declare-fun e!657196 () Unit!38054)

(assert (=> b!1155577 (= lt!518492 e!657196)))

(declare-datatypes ((V!43763 0))(
  ( (V!43764 (val!14545 Int)) )
))
(declare-fun zeroValue!944 () V!43763)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13779 0))(
  ( (ValueCellFull!13779 (v!17182 V!43763)) (EmptyCell!13779) )
))
(declare-datatypes ((array!74803 0))(
  ( (array!74804 (arr!36052 (Array (_ BitVec 32) ValueCell!13779)) (size!36588 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74803)

(declare-fun lt!518504 () Unit!38054)

(declare-fun minValue!944 () V!43763)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!495 (array!74801 array!74803 (_ BitVec 32) (_ BitVec 32) V!43763 V!43763 (_ BitVec 64) (_ BitVec 32) Int) Unit!38054)

(assert (=> b!1155577 (= lt!518504 (lemmaListMapContainsThenArrayContainsFrom!495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114883 () Bool)

(assert (=> b!1155577 (= c!114883 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767728 () Bool)

(assert (=> b!1155577 (= res!767728 e!657190)))

(assert (=> b!1155577 (=> (not res!767728) (not e!657192))))

(assert (=> b!1155577 e!657192))

(declare-fun lt!518488 () Unit!38054)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74801 (_ BitVec 32) (_ BitVec 32)) Unit!38054)

(assert (=> b!1155577 (= lt!518488 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25241 0))(
  ( (Nil!25238) (Cons!25237 (h!26446 (_ BitVec 64)) (t!36680 List!25241)) )
))
(declare-fun arrayNoDuplicates!0 (array!74801 (_ BitVec 32) List!25241) Bool)

(assert (=> b!1155577 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25238)))

(declare-fun lt!518486 () Unit!38054)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74801 (_ BitVec 64) (_ BitVec 32) List!25241) Unit!38054)

(assert (=> b!1155577 (= lt!518486 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25238))))

(assert (=> b!1155577 false))

(declare-datatypes ((tuple2!18498 0))(
  ( (tuple2!18499 (_1!9260 (_ BitVec 64)) (_2!9260 V!43763)) )
))
(declare-datatypes ((List!25242 0))(
  ( (Nil!25239) (Cons!25238 (h!26447 tuple2!18498) (t!36681 List!25242)) )
))
(declare-datatypes ((ListLongMap!16467 0))(
  ( (ListLongMap!16468 (toList!8249 List!25242)) )
))
(declare-fun call!54908 () ListLongMap!16467)

(declare-fun lt!518489 () array!74803)

(declare-fun bm!54904 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4718 (array!74801 array!74803 (_ BitVec 32) (_ BitVec 32) V!43763 V!43763 (_ BitVec 32) Int) ListLongMap!16467)

(assert (=> bm!54904 (= call!54908 (getCurrentListMapNoExtraKeys!4718 lt!518505 lt!518489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54905 () Bool)

(declare-fun call!54907 () Bool)

(declare-fun call!54912 () Bool)

(assert (=> bm!54905 (= call!54907 call!54912)))

(declare-fun b!1155578 () Bool)

(declare-fun e!657183 () Bool)

(declare-fun tp_is_empty!28977 () Bool)

(assert (=> b!1155578 (= e!657183 tp_is_empty!28977)))

(declare-fun b!1155579 () Bool)

(declare-fun res!767726 () Bool)

(assert (=> b!1155579 (=> (not res!767726) (not e!657182))))

(assert (=> b!1155579 (= res!767726 (= (select (arr!36051 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45290 () Bool)

(declare-fun mapRes!45290 () Bool)

(assert (=> mapIsEmpty!45290 mapRes!45290))

(declare-fun b!1155580 () Bool)

(declare-fun res!767734 () Bool)

(assert (=> b!1155580 (=> (not res!767734) (not e!657182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155580 (= res!767734 (validKeyInArray!0 k0!934))))

(declare-fun b!1155581 () Bool)

(declare-fun res!767731 () Bool)

(assert (=> b!1155581 (=> (not res!767731) (not e!657182))))

(assert (=> b!1155581 (= res!767731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54906 () Bool)

(declare-fun call!54911 () Unit!38054)

(declare-fun call!54909 () Unit!38054)

(assert (=> bm!54906 (= call!54911 call!54909)))

(declare-fun b!1155582 () Bool)

(declare-fun call!54906 () ListLongMap!16467)

(declare-fun contains!6762 (ListLongMap!16467 (_ BitVec 64)) Bool)

(assert (=> b!1155582 (contains!6762 call!54906 k0!934)))

(declare-fun lt!518493 () Unit!38054)

(assert (=> b!1155582 (= lt!518493 call!54909)))

(assert (=> b!1155582 call!54912))

(declare-fun lt!518496 () ListLongMap!16467)

(declare-fun lt!518498 () ListLongMap!16467)

(declare-fun +!3662 (ListLongMap!16467 tuple2!18498) ListLongMap!16467)

(assert (=> b!1155582 (= lt!518496 (+!3662 lt!518498 (tuple2!18499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518497 () Unit!38054)

(declare-fun addStillContains!906 (ListLongMap!16467 (_ BitVec 64) V!43763 (_ BitVec 64)) Unit!38054)

(assert (=> b!1155582 (= lt!518497 (addStillContains!906 lt!518498 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1155582 (= e!657196 lt!518493)))

(declare-fun b!1155583 () Bool)

(declare-fun e!657184 () Bool)

(assert (=> b!1155583 (= e!657184 (and e!657183 mapRes!45290))))

(declare-fun condMapEmpty!45290 () Bool)

(declare-fun mapDefault!45290 () ValueCell!13779)

(assert (=> b!1155583 (= condMapEmpty!45290 (= (arr!36052 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13779)) mapDefault!45290)))))

(declare-fun call!54910 () ListLongMap!16467)

(declare-fun bm!54903 () Bool)

(assert (=> bm!54903 (= call!54910 (getCurrentListMapNoExtraKeys!4718 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!767737 () Bool)

(assert (=> start!98842 (=> (not res!767737) (not e!657182))))

(assert (=> start!98842 (= res!767737 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36587 _keys!1208))))))

(assert (=> start!98842 e!657182))

(assert (=> start!98842 tp_is_empty!28977))

(declare-fun array_inv!27592 (array!74801) Bool)

(assert (=> start!98842 (array_inv!27592 _keys!1208)))

(assert (=> start!98842 true))

(assert (=> start!98842 tp!86051))

(declare-fun array_inv!27593 (array!74803) Bool)

(assert (=> start!98842 (and (array_inv!27593 _values!996) e!657184)))

(declare-fun b!1155584 () Bool)

(declare-fun Unit!38057 () Unit!38054)

(assert (=> b!1155584 (= e!657186 Unit!38057)))

(declare-fun b!1155585 () Bool)

(declare-fun c!114881 () Bool)

(assert (=> b!1155585 (= c!114881 (and (not lt!518500) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657191 () Unit!38054)

(assert (=> b!1155585 (= e!657196 e!657191)))

(declare-fun b!1155586 () Bool)

(declare-fun e!657195 () Bool)

(declare-fun e!657188 () Bool)

(assert (=> b!1155586 (= e!657195 e!657188)))

(declare-fun res!767724 () Bool)

(assert (=> b!1155586 (=> res!767724 e!657188)))

(assert (=> b!1155586 (= res!767724 (not (= from!1455 i!673)))))

(declare-fun lt!518502 () ListLongMap!16467)

(assert (=> b!1155586 (= lt!518502 (getCurrentListMapNoExtraKeys!4718 lt!518505 lt!518489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518499 () V!43763)

(assert (=> b!1155586 (= lt!518489 (array!74804 (store (arr!36052 _values!996) i!673 (ValueCellFull!13779 lt!518499)) (size!36588 _values!996)))))

(declare-fun dynLambda!2727 (Int (_ BitVec 64)) V!43763)

(assert (=> b!1155586 (= lt!518499 (dynLambda!2727 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518485 () ListLongMap!16467)

(assert (=> b!1155586 (= lt!518485 (getCurrentListMapNoExtraKeys!4718 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155587 () Bool)

(declare-fun res!767738 () Bool)

(assert (=> b!1155587 (=> (not res!767738) (not e!657185))))

(assert (=> b!1155587 (= res!767738 (arrayNoDuplicates!0 lt!518505 #b00000000000000000000000000000000 Nil!25238))))

(declare-fun e!657198 () Bool)

(declare-fun b!1155588 () Bool)

(declare-fun lt!518491 () ListLongMap!16467)

(assert (=> b!1155588 (= e!657198 (= lt!518491 (getCurrentListMapNoExtraKeys!4718 lt!518505 lt!518489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun e!657193 () Bool)

(declare-fun b!1155589 () Bool)

(declare-fun -!1369 (ListLongMap!16467 (_ BitVec 64)) ListLongMap!16467)

(assert (=> b!1155589 (= e!657193 (= call!54908 (-!1369 call!54910 k0!934)))))

(declare-fun b!1155590 () Bool)

(declare-fun res!767727 () Bool)

(assert (=> b!1155590 (=> (not res!767727) (not e!657182))))

(assert (=> b!1155590 (= res!767727 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36587 _keys!1208))))))

(declare-fun b!1155591 () Bool)

(declare-fun e!657189 () Unit!38054)

(declare-fun Unit!38058 () Unit!38054)

(assert (=> b!1155591 (= e!657189 Unit!38058)))

(declare-fun bm!54907 () Bool)

(assert (=> bm!54907 (= call!54909 (addStillContains!906 (ite c!114882 lt!518496 lt!518498) (ite c!114882 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114881 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114882 minValue!944 (ite c!114881 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155592 () Bool)

(assert (=> b!1155592 (= e!657191 e!657189)))

(declare-fun c!114886 () Bool)

(assert (=> b!1155592 (= c!114886 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518500))))

(declare-fun bm!54908 () Bool)

(assert (=> bm!54908 (= call!54906 (+!3662 (ite c!114882 lt!518496 lt!518498) (ite c!114882 (tuple2!18499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114881 (tuple2!18499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155593 () Bool)

(declare-fun res!767730 () Bool)

(assert (=> b!1155593 (=> (not res!767730) (not e!657182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155593 (= res!767730 (validMask!0 mask!1564))))

(declare-fun b!1155594 () Bool)

(assert (=> b!1155594 (= e!657190 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518500) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155595 () Bool)

(assert (=> b!1155595 (= e!657193 (= call!54908 call!54910))))

(declare-fun bm!54909 () Bool)

(declare-fun call!54913 () ListLongMap!16467)

(assert (=> bm!54909 (= call!54913 call!54906)))

(declare-fun b!1155596 () Bool)

(declare-fun e!657187 () Bool)

(assert (=> b!1155596 (= e!657187 tp_is_empty!28977)))

(declare-fun bm!54910 () Bool)

(assert (=> bm!54910 (= call!54912 (contains!6762 (ite c!114882 lt!518496 call!54913) k0!934))))

(declare-fun b!1155597 () Bool)

(declare-fun res!767729 () Bool)

(assert (=> b!1155597 (=> (not res!767729) (not e!657182))))

(assert (=> b!1155597 (= res!767729 (and (= (size!36588 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36587 _keys!1208) (size!36588 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45290 () Bool)

(declare-fun tp!86052 () Bool)

(assert (=> mapNonEmpty!45290 (= mapRes!45290 (and tp!86052 e!657187))))

(declare-fun mapRest!45290 () (Array (_ BitVec 32) ValueCell!13779))

(declare-fun mapKey!45290 () (_ BitVec 32))

(declare-fun mapValue!45290 () ValueCell!13779)

(assert (=> mapNonEmpty!45290 (= (arr!36052 _values!996) (store mapRest!45290 mapKey!45290 mapValue!45290))))

(declare-fun b!1155598 () Bool)

(declare-fun res!767735 () Bool)

(assert (=> b!1155598 (=> (not res!767735) (not e!657182))))

(assert (=> b!1155598 (= res!767735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25238))))

(declare-fun b!1155599 () Bool)

(declare-fun e!657194 () Bool)

(assert (=> b!1155599 (= e!657194 true)))

(assert (=> b!1155599 e!657198))

(declare-fun res!767725 () Bool)

(assert (=> b!1155599 (=> (not res!767725) (not e!657198))))

(assert (=> b!1155599 (= res!767725 (= lt!518491 lt!518498))))

(assert (=> b!1155599 (= lt!518491 (-!1369 lt!518485 k0!934))))

(declare-fun lt!518484 () V!43763)

(assert (=> b!1155599 (= (-!1369 (+!3662 lt!518498 (tuple2!18499 (select (arr!36051 _keys!1208) from!1455) lt!518484)) (select (arr!36051 _keys!1208) from!1455)) lt!518498)))

(declare-fun lt!518494 () Unit!38054)

(declare-fun addThenRemoveForNewKeyIsSame!208 (ListLongMap!16467 (_ BitVec 64) V!43763) Unit!38054)

(assert (=> b!1155599 (= lt!518494 (addThenRemoveForNewKeyIsSame!208 lt!518498 (select (arr!36051 _keys!1208) from!1455) lt!518484))))

(declare-fun get!18370 (ValueCell!13779 V!43763) V!43763)

(assert (=> b!1155599 (= lt!518484 (get!18370 (select (arr!36052 _values!996) from!1455) lt!518499))))

(declare-fun lt!518501 () Unit!38054)

(assert (=> b!1155599 (= lt!518501 e!657186)))

(declare-fun c!114884 () Bool)

(assert (=> b!1155599 (= c!114884 (contains!6762 lt!518498 k0!934))))

(assert (=> b!1155599 (= lt!518498 (getCurrentListMapNoExtraKeys!4718 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155600 () Bool)

(assert (=> b!1155600 (= e!657188 e!657194)))

(declare-fun res!767732 () Bool)

(assert (=> b!1155600 (=> res!767732 e!657194)))

(assert (=> b!1155600 (= res!767732 (not (= (select (arr!36051 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155600 e!657193))

(declare-fun c!114885 () Bool)

(assert (=> b!1155600 (= c!114885 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518490 () Unit!38054)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!599 (array!74801 array!74803 (_ BitVec 32) (_ BitVec 32) V!43763 V!43763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38054)

(assert (=> b!1155600 (= lt!518490 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155601 () Bool)

(assert (=> b!1155601 call!54907))

(declare-fun lt!518495 () Unit!38054)

(assert (=> b!1155601 (= lt!518495 call!54911)))

(assert (=> b!1155601 (= e!657189 lt!518495)))

(declare-fun b!1155602 () Bool)

(declare-fun lt!518503 () Unit!38054)

(assert (=> b!1155602 (= e!657191 lt!518503)))

(assert (=> b!1155602 (= lt!518503 call!54911)))

(assert (=> b!1155602 call!54907))

(declare-fun b!1155603 () Bool)

(assert (=> b!1155603 (= e!657185 (not e!657195))))

(declare-fun res!767733 () Bool)

(assert (=> b!1155603 (=> res!767733 e!657195)))

(assert (=> b!1155603 (= res!767733 (bvsgt from!1455 i!673))))

(assert (=> b!1155603 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518487 () Unit!38054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74801 (_ BitVec 64) (_ BitVec 32)) Unit!38054)

(assert (=> b!1155603 (= lt!518487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98842 res!767737) b!1155593))

(assert (= (and b!1155593 res!767730) b!1155597))

(assert (= (and b!1155597 res!767729) b!1155581))

(assert (= (and b!1155581 res!767731) b!1155598))

(assert (= (and b!1155598 res!767735) b!1155590))

(assert (= (and b!1155590 res!767727) b!1155580))

(assert (= (and b!1155580 res!767734) b!1155579))

(assert (= (and b!1155579 res!767726) b!1155574))

(assert (= (and b!1155574 res!767736) b!1155587))

(assert (= (and b!1155587 res!767738) b!1155603))

(assert (= (and b!1155603 (not res!767733)) b!1155586))

(assert (= (and b!1155586 (not res!767724)) b!1155600))

(assert (= (and b!1155600 c!114885) b!1155589))

(assert (= (and b!1155600 (not c!114885)) b!1155595))

(assert (= (or b!1155589 b!1155595) bm!54904))

(assert (= (or b!1155589 b!1155595) bm!54903))

(assert (= (and b!1155600 (not res!767732)) b!1155599))

(assert (= (and b!1155599 c!114884) b!1155577))

(assert (= (and b!1155599 (not c!114884)) b!1155584))

(assert (= (and b!1155577 c!114882) b!1155582))

(assert (= (and b!1155577 (not c!114882)) b!1155585))

(assert (= (and b!1155585 c!114881) b!1155602))

(assert (= (and b!1155585 (not c!114881)) b!1155592))

(assert (= (and b!1155592 c!114886) b!1155601))

(assert (= (and b!1155592 (not c!114886)) b!1155591))

(assert (= (or b!1155602 b!1155601) bm!54906))

(assert (= (or b!1155602 b!1155601) bm!54909))

(assert (= (or b!1155602 b!1155601) bm!54905))

(assert (= (or b!1155582 bm!54905) bm!54910))

(assert (= (or b!1155582 bm!54906) bm!54907))

(assert (= (or b!1155582 bm!54909) bm!54908))

(assert (= (and b!1155577 c!114883) b!1155575))

(assert (= (and b!1155577 (not c!114883)) b!1155594))

(assert (= (and b!1155577 res!767728) b!1155576))

(assert (= (and b!1155599 res!767725) b!1155588))

(assert (= (and b!1155583 condMapEmpty!45290) mapIsEmpty!45290))

(assert (= (and b!1155583 (not condMapEmpty!45290)) mapNonEmpty!45290))

(get-info :version)

(assert (= (and mapNonEmpty!45290 ((_ is ValueCellFull!13779) mapValue!45290)) b!1155596))

(assert (= (and b!1155583 ((_ is ValueCellFull!13779) mapDefault!45290)) b!1155578))

(assert (= start!98842 b!1155583))

(declare-fun b_lambda!19553 () Bool)

(assert (=> (not b_lambda!19553) (not b!1155586)))

(declare-fun t!36679 () Bool)

(declare-fun tb!9259 () Bool)

(assert (=> (and start!98842 (= defaultEntry!1004 defaultEntry!1004) t!36679) tb!9259))

(declare-fun result!19083 () Bool)

(assert (=> tb!9259 (= result!19083 tp_is_empty!28977)))

(assert (=> b!1155586 t!36679))

(declare-fun b_and!39745 () Bool)

(assert (= b_and!39743 (and (=> t!36679 result!19083) b_and!39745)))

(declare-fun m!1065145 () Bool)

(assert (=> b!1155586 m!1065145))

(declare-fun m!1065147 () Bool)

(assert (=> b!1155586 m!1065147))

(declare-fun m!1065149 () Bool)

(assert (=> b!1155586 m!1065149))

(declare-fun m!1065151 () Bool)

(assert (=> b!1155586 m!1065151))

(declare-fun m!1065153 () Bool)

(assert (=> b!1155579 m!1065153))

(declare-fun m!1065155 () Bool)

(assert (=> b!1155582 m!1065155))

(declare-fun m!1065157 () Bool)

(assert (=> b!1155582 m!1065157))

(declare-fun m!1065159 () Bool)

(assert (=> b!1155582 m!1065159))

(declare-fun m!1065161 () Bool)

(assert (=> bm!54907 m!1065161))

(declare-fun m!1065163 () Bool)

(assert (=> b!1155575 m!1065163))

(declare-fun m!1065165 () Bool)

(assert (=> b!1155577 m!1065165))

(declare-fun m!1065167 () Bool)

(assert (=> b!1155577 m!1065167))

(declare-fun m!1065169 () Bool)

(assert (=> b!1155577 m!1065169))

(declare-fun m!1065171 () Bool)

(assert (=> b!1155577 m!1065171))

(declare-fun m!1065173 () Bool)

(assert (=> b!1155574 m!1065173))

(declare-fun m!1065175 () Bool)

(assert (=> b!1155574 m!1065175))

(declare-fun m!1065177 () Bool)

(assert (=> bm!54904 m!1065177))

(declare-fun m!1065179 () Bool)

(assert (=> b!1155603 m!1065179))

(declare-fun m!1065181 () Bool)

(assert (=> b!1155603 m!1065181))

(declare-fun m!1065183 () Bool)

(assert (=> bm!54910 m!1065183))

(declare-fun m!1065185 () Bool)

(assert (=> b!1155593 m!1065185))

(declare-fun m!1065187 () Bool)

(assert (=> b!1155589 m!1065187))

(declare-fun m!1065189 () Bool)

(assert (=> mapNonEmpty!45290 m!1065189))

(declare-fun m!1065191 () Bool)

(assert (=> b!1155599 m!1065191))

(declare-fun m!1065193 () Bool)

(assert (=> b!1155599 m!1065193))

(declare-fun m!1065195 () Bool)

(assert (=> b!1155599 m!1065195))

(assert (=> b!1155599 m!1065193))

(declare-fun m!1065197 () Bool)

(assert (=> b!1155599 m!1065197))

(declare-fun m!1065199 () Bool)

(assert (=> b!1155599 m!1065199))

(declare-fun m!1065201 () Bool)

(assert (=> b!1155599 m!1065201))

(declare-fun m!1065203 () Bool)

(assert (=> b!1155599 m!1065203))

(assert (=> b!1155599 m!1065197))

(declare-fun m!1065205 () Bool)

(assert (=> b!1155599 m!1065205))

(assert (=> b!1155599 m!1065201))

(assert (=> b!1155599 m!1065197))

(declare-fun m!1065207 () Bool)

(assert (=> b!1155599 m!1065207))

(declare-fun m!1065209 () Bool)

(assert (=> bm!54908 m!1065209))

(declare-fun m!1065211 () Bool)

(assert (=> b!1155587 m!1065211))

(declare-fun m!1065213 () Bool)

(assert (=> start!98842 m!1065213))

(declare-fun m!1065215 () Bool)

(assert (=> start!98842 m!1065215))

(declare-fun m!1065217 () Bool)

(assert (=> b!1155598 m!1065217))

(assert (=> b!1155588 m!1065177))

(assert (=> b!1155600 m!1065197))

(declare-fun m!1065219 () Bool)

(assert (=> b!1155600 m!1065219))

(declare-fun m!1065221 () Bool)

(assert (=> b!1155580 m!1065221))

(declare-fun m!1065223 () Bool)

(assert (=> b!1155581 m!1065223))

(assert (=> b!1155576 m!1065163))

(assert (=> bm!54903 m!1065191))

(check-sat (not b!1155580) (not b!1155575) (not bm!54907) (not b!1155588) (not b!1155587) (not bm!54904) (not b!1155586) (not b!1155582) (not b!1155600) (not b_next!24447) (not bm!54903) (not bm!54908) (not b!1155581) (not mapNonEmpty!45290) (not b!1155603) (not b!1155589) (not b!1155574) tp_is_empty!28977 (not b!1155599) (not start!98842) b_and!39745 (not b!1155577) (not b_lambda!19553) (not b!1155576) (not b!1155598) (not b!1155593) (not bm!54910))
(check-sat b_and!39745 (not b_next!24447))
