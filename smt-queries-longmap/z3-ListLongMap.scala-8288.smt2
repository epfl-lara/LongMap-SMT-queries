; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101002 () Bool)

(assert start!101002)

(declare-fun b_free!26001 () Bool)

(declare-fun b_next!26001 () Bool)

(assert (=> start!101002 (= b_free!26001 (not b_next!26001))))

(declare-fun tp!91019 () Bool)

(declare-fun b_and!43083 () Bool)

(assert (=> start!101002 (= tp!91019 b_and!43083)))

(declare-fun b!1209773 () Bool)

(declare-datatypes ((Unit!40093 0))(
  ( (Unit!40094) )
))
(declare-fun e!687074 () Unit!40093)

(declare-fun Unit!40095 () Unit!40093)

(assert (=> b!1209773 (= e!687074 Unit!40095)))

(declare-fun bm!59450 () Bool)

(declare-datatypes ((V!46067 0))(
  ( (V!46068 (val!15409 Int)) )
))
(declare-datatypes ((tuple2!19784 0))(
  ( (tuple2!19785 (_1!9903 (_ BitVec 64)) (_2!9903 V!46067)) )
))
(declare-datatypes ((List!26585 0))(
  ( (Nil!26582) (Cons!26581 (h!27790 tuple2!19784) (t!39566 List!26585)) )
))
(declare-datatypes ((ListLongMap!17753 0))(
  ( (ListLongMap!17754 (toList!8892 List!26585)) )
))
(declare-fun call!59459 () ListLongMap!17753)

(declare-fun call!59457 () ListLongMap!17753)

(assert (=> bm!59450 (= call!59459 call!59457)))

(declare-fun b!1209774 () Bool)

(declare-fun e!687084 () Bool)

(declare-fun e!687077 () Bool)

(assert (=> b!1209774 (= e!687084 (not e!687077))))

(declare-fun res!803997 () Bool)

(assert (=> b!1209774 (=> res!803997 e!687077)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209774 (= res!803997 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78195 0))(
  ( (array!78196 (arr!37734 (Array (_ BitVec 32) (_ BitVec 64))) (size!38270 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78195)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209774 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549180 () Unit!40093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78195 (_ BitVec 64) (_ BitVec 32)) Unit!40093)

(assert (=> b!1209774 (= lt!549180 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209775 () Bool)

(declare-fun call!59456 () Bool)

(assert (=> b!1209775 call!59456))

(declare-fun lt!549171 () Unit!40093)

(declare-fun call!59460 () Unit!40093)

(assert (=> b!1209775 (= lt!549171 call!59460)))

(declare-fun e!687076 () Unit!40093)

(assert (=> b!1209775 (= e!687076 lt!549171)))

(declare-fun b!1209776 () Bool)

(declare-fun e!687086 () Bool)

(declare-fun e!687081 () Bool)

(assert (=> b!1209776 (= e!687086 e!687081)))

(declare-fun res!803996 () Bool)

(assert (=> b!1209776 (=> res!803996 e!687081)))

(assert (=> b!1209776 (= res!803996 (not (= (select (arr!37734 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687080 () Bool)

(assert (=> b!1209776 e!687080))

(declare-fun c!119126 () Bool)

(assert (=> b!1209776 (= c!119126 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!46067)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14643 0))(
  ( (ValueCellFull!14643 (v!18060 V!46067)) (EmptyCell!14643) )
))
(declare-datatypes ((array!78197 0))(
  ( (array!78198 (arr!37735 (Array (_ BitVec 32) ValueCell!14643)) (size!38271 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78197)

(declare-fun minValue!944 () V!46067)

(declare-fun lt!549175 () Unit!40093)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1053 (array!78195 array!78197 (_ BitVec 32) (_ BitVec 32) V!46067 V!46067 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40093)

(assert (=> b!1209776 (= lt!549175 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1053 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209777 () Bool)

(declare-fun c!119129 () Bool)

(declare-fun lt!549169 () Bool)

(assert (=> b!1209777 (= c!119129 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549169))))

(assert (=> b!1209777 (= e!687076 e!687074)))

(declare-fun e!687072 () Bool)

(declare-fun b!1209778 () Bool)

(assert (=> b!1209778 (= e!687072 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209779 () Bool)

(declare-fun res!804002 () Bool)

(declare-fun e!687082 () Bool)

(assert (=> b!1209779 (=> (not res!804002) (not e!687082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209779 (= res!804002 (validKeyInArray!0 k0!934))))

(declare-fun b!1209780 () Bool)

(declare-fun call!59454 () ListLongMap!17753)

(declare-fun call!59458 () ListLongMap!17753)

(assert (=> b!1209780 (= e!687080 (= call!59454 call!59458))))

(declare-fun lt!549168 () ListLongMap!17753)

(declare-fun lt!549179 () ListLongMap!17753)

(declare-fun bm!59451 () Bool)

(declare-fun c!119125 () Bool)

(declare-fun c!119127 () Bool)

(declare-fun +!4010 (ListLongMap!17753 tuple2!19784) ListLongMap!17753)

(assert (=> bm!59451 (= call!59457 (+!4010 (ite c!119127 lt!549179 lt!549168) (ite c!119127 (tuple2!19785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119125 (tuple2!19785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209781 () Bool)

(declare-fun e!687075 () Bool)

(declare-fun tp_is_empty!30705 () Bool)

(assert (=> b!1209781 (= e!687075 tp_is_empty!30705)))

(declare-fun lt!549172 () array!78195)

(declare-fun lt!549183 () array!78197)

(declare-fun bm!59452 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5326 (array!78195 array!78197 (_ BitVec 32) (_ BitVec 32) V!46067 V!46067 (_ BitVec 32) Int) ListLongMap!17753)

(assert (=> bm!59452 (= call!59454 (getCurrentListMapNoExtraKeys!5326 lt!549172 lt!549183 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209782 () Bool)

(declare-fun res!804001 () Bool)

(assert (=> b!1209782 (=> (not res!804001) (not e!687082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78195 (_ BitVec 32)) Bool)

(assert (=> b!1209782 (= res!804001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59453 () Bool)

(declare-fun call!59455 () Bool)

(assert (=> bm!59453 (= call!59456 call!59455)))

(declare-fun b!1209783 () Bool)

(declare-fun res!803995 () Bool)

(assert (=> b!1209783 (=> (not res!803995) (not e!687082))))

(assert (=> b!1209783 (= res!803995 (and (= (size!38271 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38270 _keys!1208) (size!38271 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209784 () Bool)

(assert (=> b!1209784 (= e!687077 e!687086)))

(declare-fun res!804000 () Bool)

(assert (=> b!1209784 (=> res!804000 e!687086)))

(assert (=> b!1209784 (= res!804000 (not (= from!1455 i!673)))))

(declare-fun lt!549176 () ListLongMap!17753)

(assert (=> b!1209784 (= lt!549176 (getCurrentListMapNoExtraKeys!5326 lt!549172 lt!549183 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3224 (Int (_ BitVec 64)) V!46067)

(assert (=> b!1209784 (= lt!549183 (array!78198 (store (arr!37735 _values!996) i!673 (ValueCellFull!14643 (dynLambda!3224 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38271 _values!996)))))

(declare-fun lt!549181 () ListLongMap!17753)

(assert (=> b!1209784 (= lt!549181 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59454 () Bool)

(declare-fun call!59453 () Unit!40093)

(assert (=> bm!59454 (= call!59460 call!59453)))

(declare-fun b!1209785 () Bool)

(declare-fun e!687078 () Unit!40093)

(declare-fun lt!549184 () Unit!40093)

(assert (=> b!1209785 (= e!687078 lt!549184)))

(declare-fun lt!549178 () Unit!40093)

(assert (=> b!1209785 (= lt!549178 call!59453)))

(assert (=> b!1209785 (= lt!549179 (+!4010 lt!549168 (tuple2!19785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1209785 call!59455))

(declare-fun addStillContains!1039 (ListLongMap!17753 (_ BitVec 64) V!46067 (_ BitVec 64)) Unit!40093)

(assert (=> b!1209785 (= lt!549184 (addStillContains!1039 lt!549179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6963 (ListLongMap!17753 (_ BitVec 64)) Bool)

(assert (=> b!1209785 (contains!6963 call!59457 k0!934)))

(declare-fun b!1209786 () Bool)

(assert (=> b!1209786 (= e!687082 e!687084)))

(declare-fun res!803994 () Bool)

(assert (=> b!1209786 (=> (not res!803994) (not e!687084))))

(assert (=> b!1209786 (= res!803994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549172 mask!1564))))

(assert (=> b!1209786 (= lt!549172 (array!78196 (store (arr!37734 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38270 _keys!1208)))))

(declare-fun b!1209787 () Bool)

(declare-fun e!687071 () Bool)

(assert (=> b!1209787 (= e!687071 true)))

(assert (=> b!1209787 false))

(declare-fun lt!549182 () Unit!40093)

(declare-datatypes ((List!26586 0))(
  ( (Nil!26583) (Cons!26582 (h!27791 (_ BitVec 64)) (t!39567 List!26586)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78195 (_ BitVec 64) (_ BitVec 32) List!26586) Unit!40093)

(assert (=> b!1209787 (= lt!549182 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26583))))

(declare-fun arrayNoDuplicates!0 (array!78195 (_ BitVec 32) List!26586) Bool)

(assert (=> b!1209787 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26583)))

(declare-fun lt!549177 () Unit!40093)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78195 (_ BitVec 32) (_ BitVec 32)) Unit!40093)

(assert (=> b!1209787 (= lt!549177 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!687073 () Bool)

(assert (=> b!1209787 e!687073))

(declare-fun res!803992 () Bool)

(assert (=> b!1209787 (=> (not res!803992) (not e!687073))))

(assert (=> b!1209787 (= res!803992 e!687072)))

(declare-fun c!119128 () Bool)

(assert (=> b!1209787 (= c!119128 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549173 () Unit!40093)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!591 (array!78195 array!78197 (_ BitVec 32) (_ BitVec 32) V!46067 V!46067 (_ BitVec 64) (_ BitVec 32) Int) Unit!40093)

(assert (=> b!1209787 (= lt!549173 (lemmaListMapContainsThenArrayContainsFrom!591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549174 () Unit!40093)

(assert (=> b!1209787 (= lt!549174 e!687078)))

(assert (=> b!1209787 (= c!119127 (and (not lt!549169) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209787 (= lt!549169 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209788 () Bool)

(declare-fun e!687079 () Bool)

(declare-fun e!687083 () Bool)

(declare-fun mapRes!47926 () Bool)

(assert (=> b!1209788 (= e!687079 (and e!687083 mapRes!47926))))

(declare-fun condMapEmpty!47926 () Bool)

(declare-fun mapDefault!47926 () ValueCell!14643)

(assert (=> b!1209788 (= condMapEmpty!47926 (= (arr!37735 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14643)) mapDefault!47926)))))

(declare-fun b!1209789 () Bool)

(declare-fun lt!549170 () Unit!40093)

(assert (=> b!1209789 (= e!687074 lt!549170)))

(assert (=> b!1209789 (= lt!549170 call!59460)))

(assert (=> b!1209789 call!59456))

(declare-fun b!1209790 () Bool)

(declare-fun res!803990 () Bool)

(assert (=> b!1209790 (=> (not res!803990) (not e!687082))))

(assert (=> b!1209790 (= res!803990 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26583))))

(declare-fun b!1209791 () Bool)

(declare-fun -!1843 (ListLongMap!17753 (_ BitVec 64)) ListLongMap!17753)

(assert (=> b!1209791 (= e!687080 (= call!59454 (-!1843 call!59458 k0!934)))))

(declare-fun res!803998 () Bool)

(assert (=> start!101002 (=> (not res!803998) (not e!687082))))

(assert (=> start!101002 (= res!803998 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38270 _keys!1208))))))

(assert (=> start!101002 e!687082))

(assert (=> start!101002 tp_is_empty!30705))

(declare-fun array_inv!28744 (array!78195) Bool)

(assert (=> start!101002 (array_inv!28744 _keys!1208)))

(assert (=> start!101002 true))

(assert (=> start!101002 tp!91019))

(declare-fun array_inv!28745 (array!78197) Bool)

(assert (=> start!101002 (and (array_inv!28745 _values!996) e!687079)))

(declare-fun b!1209792 () Bool)

(assert (=> b!1209792 (= e!687078 e!687076)))

(assert (=> b!1209792 (= c!119125 (and (not lt!549169) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1209793 () Bool)

(assert (=> b!1209793 (= e!687072 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549169) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1209794 () Bool)

(assert (=> b!1209794 (= e!687073 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209795 () Bool)

(declare-fun res!803999 () Bool)

(assert (=> b!1209795 (=> (not res!803999) (not e!687084))))

(assert (=> b!1209795 (= res!803999 (arrayNoDuplicates!0 lt!549172 #b00000000000000000000000000000000 Nil!26583))))

(declare-fun mapNonEmpty!47926 () Bool)

(declare-fun tp!91018 () Bool)

(assert (=> mapNonEmpty!47926 (= mapRes!47926 (and tp!91018 e!687075))))

(declare-fun mapKey!47926 () (_ BitVec 32))

(declare-fun mapValue!47926 () ValueCell!14643)

(declare-fun mapRest!47926 () (Array (_ BitVec 32) ValueCell!14643))

(assert (=> mapNonEmpty!47926 (= (arr!37735 _values!996) (store mapRest!47926 mapKey!47926 mapValue!47926))))

(declare-fun mapIsEmpty!47926 () Bool)

(assert (=> mapIsEmpty!47926 mapRes!47926))

(declare-fun bm!59455 () Bool)

(assert (=> bm!59455 (= call!59453 (addStillContains!1039 lt!549168 (ite (or c!119127 c!119125) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119127 c!119125) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1209796 () Bool)

(assert (=> b!1209796 (= e!687083 tp_is_empty!30705)))

(declare-fun bm!59456 () Bool)

(assert (=> bm!59456 (= call!59458 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209797 () Bool)

(declare-fun res!803991 () Bool)

(assert (=> b!1209797 (=> (not res!803991) (not e!687082))))

(assert (=> b!1209797 (= res!803991 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38270 _keys!1208))))))

(declare-fun b!1209798 () Bool)

(declare-fun res!804003 () Bool)

(assert (=> b!1209798 (=> (not res!804003) (not e!687082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209798 (= res!804003 (validMask!0 mask!1564))))

(declare-fun bm!59457 () Bool)

(assert (=> bm!59457 (= call!59455 (contains!6963 (ite c!119127 lt!549179 call!59459) k0!934))))

(declare-fun b!1209799 () Bool)

(assert (=> b!1209799 (= e!687081 e!687071)))

(declare-fun res!803993 () Bool)

(assert (=> b!1209799 (=> res!803993 e!687071)))

(assert (=> b!1209799 (= res!803993 (not (contains!6963 lt!549168 k0!934)))))

(assert (=> b!1209799 (= lt!549168 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209800 () Bool)

(declare-fun res!803989 () Bool)

(assert (=> b!1209800 (=> (not res!803989) (not e!687082))))

(assert (=> b!1209800 (= res!803989 (= (select (arr!37734 _keys!1208) i!673) k0!934))))

(assert (= (and start!101002 res!803998) b!1209798))

(assert (= (and b!1209798 res!804003) b!1209783))

(assert (= (and b!1209783 res!803995) b!1209782))

(assert (= (and b!1209782 res!804001) b!1209790))

(assert (= (and b!1209790 res!803990) b!1209797))

(assert (= (and b!1209797 res!803991) b!1209779))

(assert (= (and b!1209779 res!804002) b!1209800))

(assert (= (and b!1209800 res!803989) b!1209786))

(assert (= (and b!1209786 res!803994) b!1209795))

(assert (= (and b!1209795 res!803999) b!1209774))

(assert (= (and b!1209774 (not res!803997)) b!1209784))

(assert (= (and b!1209784 (not res!804000)) b!1209776))

(assert (= (and b!1209776 c!119126) b!1209791))

(assert (= (and b!1209776 (not c!119126)) b!1209780))

(assert (= (or b!1209791 b!1209780) bm!59452))

(assert (= (or b!1209791 b!1209780) bm!59456))

(assert (= (and b!1209776 (not res!803996)) b!1209799))

(assert (= (and b!1209799 (not res!803993)) b!1209787))

(assert (= (and b!1209787 c!119127) b!1209785))

(assert (= (and b!1209787 (not c!119127)) b!1209792))

(assert (= (and b!1209792 c!119125) b!1209775))

(assert (= (and b!1209792 (not c!119125)) b!1209777))

(assert (= (and b!1209777 c!119129) b!1209789))

(assert (= (and b!1209777 (not c!119129)) b!1209773))

(assert (= (or b!1209775 b!1209789) bm!59454))

(assert (= (or b!1209775 b!1209789) bm!59450))

(assert (= (or b!1209775 b!1209789) bm!59453))

(assert (= (or b!1209785 bm!59453) bm!59457))

(assert (= (or b!1209785 bm!59454) bm!59455))

(assert (= (or b!1209785 bm!59450) bm!59451))

(assert (= (and b!1209787 c!119128) b!1209778))

(assert (= (and b!1209787 (not c!119128)) b!1209793))

(assert (= (and b!1209787 res!803992) b!1209794))

(assert (= (and b!1209788 condMapEmpty!47926) mapIsEmpty!47926))

(assert (= (and b!1209788 (not condMapEmpty!47926)) mapNonEmpty!47926))

(get-info :version)

(assert (= (and mapNonEmpty!47926 ((_ is ValueCellFull!14643) mapValue!47926)) b!1209781))

(assert (= (and b!1209788 ((_ is ValueCellFull!14643) mapDefault!47926)) b!1209796))

(assert (= start!101002 b!1209788))

(declare-fun b_lambda!21601 () Bool)

(assert (=> (not b_lambda!21601) (not b!1209784)))

(declare-fun t!39565 () Bool)

(declare-fun tb!10801 () Bool)

(assert (=> (and start!101002 (= defaultEntry!1004 defaultEntry!1004) t!39565) tb!10801))

(declare-fun result!22195 () Bool)

(assert (=> tb!10801 (= result!22195 tp_is_empty!30705)))

(assert (=> b!1209784 t!39565))

(declare-fun b_and!43085 () Bool)

(assert (= b_and!43083 (and (=> t!39565 result!22195) b_and!43085)))

(declare-fun m!1115427 () Bool)

(assert (=> b!1209778 m!1115427))

(declare-fun m!1115429 () Bool)

(assert (=> b!1209790 m!1115429))

(declare-fun m!1115431 () Bool)

(assert (=> b!1209799 m!1115431))

(declare-fun m!1115433 () Bool)

(assert (=> b!1209799 m!1115433))

(declare-fun m!1115435 () Bool)

(assert (=> bm!59457 m!1115435))

(declare-fun m!1115437 () Bool)

(assert (=> b!1209798 m!1115437))

(declare-fun m!1115439 () Bool)

(assert (=> b!1209795 m!1115439))

(declare-fun m!1115441 () Bool)

(assert (=> bm!59451 m!1115441))

(declare-fun m!1115443 () Bool)

(assert (=> bm!59455 m!1115443))

(declare-fun m!1115445 () Bool)

(assert (=> b!1209786 m!1115445))

(declare-fun m!1115447 () Bool)

(assert (=> b!1209786 m!1115447))

(declare-fun m!1115449 () Bool)

(assert (=> b!1209784 m!1115449))

(declare-fun m!1115451 () Bool)

(assert (=> b!1209784 m!1115451))

(declare-fun m!1115453 () Bool)

(assert (=> b!1209784 m!1115453))

(declare-fun m!1115455 () Bool)

(assert (=> b!1209784 m!1115455))

(declare-fun m!1115457 () Bool)

(assert (=> b!1209785 m!1115457))

(declare-fun m!1115459 () Bool)

(assert (=> b!1209785 m!1115459))

(declare-fun m!1115461 () Bool)

(assert (=> b!1209785 m!1115461))

(declare-fun m!1115463 () Bool)

(assert (=> bm!59452 m!1115463))

(assert (=> bm!59456 m!1115433))

(declare-fun m!1115465 () Bool)

(assert (=> start!101002 m!1115465))

(declare-fun m!1115467 () Bool)

(assert (=> start!101002 m!1115467))

(declare-fun m!1115469 () Bool)

(assert (=> b!1209782 m!1115469))

(declare-fun m!1115471 () Bool)

(assert (=> b!1209791 m!1115471))

(declare-fun m!1115473 () Bool)

(assert (=> b!1209779 m!1115473))

(declare-fun m!1115475 () Bool)

(assert (=> b!1209800 m!1115475))

(declare-fun m!1115477 () Bool)

(assert (=> b!1209787 m!1115477))

(declare-fun m!1115479 () Bool)

(assert (=> b!1209787 m!1115479))

(declare-fun m!1115481 () Bool)

(assert (=> b!1209787 m!1115481))

(declare-fun m!1115483 () Bool)

(assert (=> b!1209787 m!1115483))

(declare-fun m!1115485 () Bool)

(assert (=> b!1209776 m!1115485))

(declare-fun m!1115487 () Bool)

(assert (=> b!1209776 m!1115487))

(declare-fun m!1115489 () Bool)

(assert (=> b!1209774 m!1115489))

(declare-fun m!1115491 () Bool)

(assert (=> b!1209774 m!1115491))

(declare-fun m!1115493 () Bool)

(assert (=> mapNonEmpty!47926 m!1115493))

(assert (=> b!1209794 m!1115427))

(check-sat (not bm!59451) (not mapNonEmpty!47926) (not b!1209786) (not b_next!26001) (not bm!59455) (not b!1209799) (not bm!59452) (not b!1209795) (not b!1209787) (not b!1209779) (not b!1209794) (not b!1209774) (not b_lambda!21601) (not b!1209778) tp_is_empty!30705 (not bm!59457) (not b!1209782) (not b!1209790) (not b!1209776) b_and!43085 (not start!101002) (not b!1209785) (not b!1209791) (not bm!59456) (not b!1209784) (not b!1209798))
(check-sat b_and!43085 (not b_next!26001))
