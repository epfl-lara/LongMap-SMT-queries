; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101142 () Bool)

(assert start!101142)

(declare-fun b_free!25975 () Bool)

(declare-fun b_next!25975 () Bool)

(assert (=> start!101142 (= b_free!25975 (not b_next!25975))))

(declare-fun tp!90935 () Bool)

(declare-fun b_and!42997 () Bool)

(assert (=> start!101142 (= tp!90935 b_and!42997)))

(declare-fun b!1209498 () Bool)

(declare-fun res!803669 () Bool)

(declare-fun e!687009 () Bool)

(assert (=> b!1209498 (=> (not res!803669) (not e!687009))))

(declare-datatypes ((array!78173 0))(
  ( (array!78174 (arr!37719 (Array (_ BitVec 32) (_ BitVec 64))) (size!38256 (_ BitVec 32))) )
))
(declare-fun lt!548788 () array!78173)

(declare-datatypes ((List!26579 0))(
  ( (Nil!26576) (Cons!26575 (h!27793 (_ BitVec 64)) (t!39526 List!26579)) )
))
(declare-fun arrayNoDuplicates!0 (array!78173 (_ BitVec 32) List!26579) Bool)

(assert (=> b!1209498 (= res!803669 (arrayNoDuplicates!0 lt!548788 #b00000000000000000000000000000000 Nil!26576))))

(declare-fun b!1209499 () Bool)

(declare-fun e!686993 () Bool)

(assert (=> b!1209499 (= e!687009 (not e!686993))))

(declare-fun res!803664 () Bool)

(assert (=> b!1209499 (=> res!803664 e!686993)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209499 (= res!803664 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!78173)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209499 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40010 0))(
  ( (Unit!40011) )
))
(declare-fun lt!548782 () Unit!40010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78173 (_ BitVec 64) (_ BitVec 32)) Unit!40010)

(assert (=> b!1209499 (= lt!548782 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59161 () Bool)

(declare-datatypes ((V!46033 0))(
  ( (V!46034 (val!15396 Int)) )
))
(declare-datatypes ((tuple2!19772 0))(
  ( (tuple2!19773 (_1!9897 (_ BitVec 64)) (_2!9897 V!46033)) )
))
(declare-datatypes ((List!26580 0))(
  ( (Nil!26577) (Cons!26576 (h!27794 tuple2!19772) (t!39527 List!26580)) )
))
(declare-datatypes ((ListLongMap!17749 0))(
  ( (ListLongMap!17750 (toList!8890 List!26580)) )
))
(declare-fun call!59171 () ListLongMap!17749)

(declare-fun call!59167 () ListLongMap!17749)

(assert (=> bm!59161 (= call!59171 call!59167)))

(declare-fun b!1209501 () Bool)

(declare-fun res!803666 () Bool)

(declare-fun e!686995 () Bool)

(assert (=> b!1209501 (=> (not res!803666) (not e!686995))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78173 (_ BitVec 32)) Bool)

(assert (=> b!1209501 (= res!803666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!59168 () Bool)

(declare-fun lt!548787 () ListLongMap!17749)

(declare-fun bm!59162 () Bool)

(declare-fun c!119244 () Bool)

(declare-fun contains!6973 (ListLongMap!17749 (_ BitVec 64)) Bool)

(assert (=> bm!59162 (= call!59168 (contains!6973 (ite c!119244 lt!548787 call!59171) k0!934))))

(declare-fun b!1209502 () Bool)

(declare-fun e!687003 () Bool)

(declare-fun e!687002 () Bool)

(declare-fun mapRes!47881 () Bool)

(assert (=> b!1209502 (= e!687003 (and e!687002 mapRes!47881))))

(declare-fun condMapEmpty!47881 () Bool)

(declare-datatypes ((ValueCell!14630 0))(
  ( (ValueCellFull!14630 (v!18040 V!46033)) (EmptyCell!14630) )
))
(declare-datatypes ((array!78175 0))(
  ( (array!78176 (arr!37720 (Array (_ BitVec 32) ValueCell!14630)) (size!38257 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78175)

(declare-fun mapDefault!47881 () ValueCell!14630)

(assert (=> b!1209502 (= condMapEmpty!47881 (= (arr!37720 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14630)) mapDefault!47881)))))

(declare-fun b!1209503 () Bool)

(declare-fun tp_is_empty!30679 () Bool)

(assert (=> b!1209503 (= e!687002 tp_is_empty!30679)))

(declare-fun mapNonEmpty!47881 () Bool)

(declare-fun tp!90934 () Bool)

(declare-fun e!687004 () Bool)

(assert (=> mapNonEmpty!47881 (= mapRes!47881 (and tp!90934 e!687004))))

(declare-fun mapKey!47881 () (_ BitVec 32))

(declare-fun mapRest!47881 () (Array (_ BitVec 32) ValueCell!14630))

(declare-fun mapValue!47881 () ValueCell!14630)

(assert (=> mapNonEmpty!47881 (= (arr!37720 _values!996) (store mapRest!47881 mapKey!47881 mapValue!47881))))

(declare-fun zeroValue!944 () V!46033)

(declare-fun c!119241 () Bool)

(declare-fun call!59169 () Unit!40010)

(declare-fun lt!548784 () ListLongMap!17749)

(declare-fun minValue!944 () V!46033)

(declare-fun bm!59163 () Bool)

(declare-fun addStillContains!1036 (ListLongMap!17749 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!40010)

(assert (=> bm!59163 (= call!59169 (addStillContains!1036 (ite c!119244 lt!548787 lt!548784) (ite c!119244 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119241 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119244 minValue!944 (ite c!119241 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209504 () Bool)

(declare-fun res!803663 () Bool)

(assert (=> b!1209504 (=> (not res!803663) (not e!686995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209504 (= res!803663 (validMask!0 mask!1564))))

(declare-fun res!803667 () Bool)

(assert (=> start!101142 (=> (not res!803667) (not e!686995))))

(assert (=> start!101142 (= res!803667 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38256 _keys!1208))))))

(assert (=> start!101142 e!686995))

(assert (=> start!101142 tp_is_empty!30679))

(declare-fun array_inv!28796 (array!78173) Bool)

(assert (=> start!101142 (array_inv!28796 _keys!1208)))

(assert (=> start!101142 true))

(assert (=> start!101142 tp!90935))

(declare-fun array_inv!28797 (array!78175) Bool)

(assert (=> start!101142 (and (array_inv!28797 _values!996) e!687003)))

(declare-fun b!1209500 () Bool)

(assert (=> b!1209500 (= e!687004 tp_is_empty!30679)))

(declare-fun b!1209505 () Bool)

(assert (=> b!1209505 (= e!686995 e!687009)))

(declare-fun res!803662 () Bool)

(assert (=> b!1209505 (=> (not res!803662) (not e!687009))))

(assert (=> b!1209505 (= res!803662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548788 mask!1564))))

(assert (=> b!1209505 (= lt!548788 (array!78174 (store (arr!37719 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38256 _keys!1208)))))

(declare-fun e!686994 () Bool)

(declare-fun b!1209506 () Bool)

(assert (=> b!1209506 (= e!686994 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59164 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!59170 () ListLongMap!17749)

(declare-fun getCurrentListMapNoExtraKeys!5352 (array!78173 array!78175 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) Int) ListLongMap!17749)

(assert (=> bm!59164 (= call!59170 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209507 () Bool)

(declare-fun e!687001 () Bool)

(declare-fun e!687000 () Bool)

(assert (=> b!1209507 (= e!687001 e!687000)))

(declare-fun res!803665 () Bool)

(assert (=> b!1209507 (=> res!803665 e!687000)))

(assert (=> b!1209507 (= res!803665 (or (bvsge (size!38256 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)) (bvsge from!1455 (size!38256 _keys!1208))))))

(assert (=> b!1209507 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26576)))

(declare-fun lt!548783 () Unit!40010)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78173 (_ BitVec 32) (_ BitVec 32)) Unit!40010)

(assert (=> b!1209507 (= lt!548783 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209507 e!686994))

(declare-fun res!803670 () Bool)

(assert (=> b!1209507 (=> (not res!803670) (not e!686994))))

(declare-fun e!686999 () Bool)

(assert (=> b!1209507 (= res!803670 e!686999)))

(declare-fun c!119240 () Bool)

(assert (=> b!1209507 (= c!119240 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548780 () Unit!40010)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!588 (array!78173 array!78175 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> b!1209507 (= lt!548780 (lemmaListMapContainsThenArrayContainsFrom!588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548779 () Unit!40010)

(declare-fun e!687008 () Unit!40010)

(assert (=> b!1209507 (= lt!548779 e!687008)))

(declare-fun lt!548781 () Bool)

(assert (=> b!1209507 (= c!119244 (and (not lt!548781) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209507 (= lt!548781 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209508 () Bool)

(declare-fun e!687007 () Bool)

(declare-fun e!686998 () Bool)

(assert (=> b!1209508 (= e!687007 e!686998)))

(declare-fun res!803671 () Bool)

(assert (=> b!1209508 (=> res!803671 e!686998)))

(assert (=> b!1209508 (= res!803671 (not (= (select (arr!37719 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687006 () Bool)

(assert (=> b!1209508 e!687006))

(declare-fun c!119243 () Bool)

(assert (=> b!1209508 (= c!119243 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548794 () Unit!40010)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 (array!78173 array!78175 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> b!1209508 (= lt!548794 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209509 () Bool)

(declare-fun res!803674 () Bool)

(assert (=> b!1209509 (=> (not res!803674) (not e!686995))))

(assert (=> b!1209509 (= res!803674 (= (select (arr!37719 _keys!1208) i!673) k0!934))))

(declare-fun b!1209510 () Bool)

(declare-fun e!686997 () Unit!40010)

(declare-fun Unit!40012 () Unit!40010)

(assert (=> b!1209510 (= e!686997 Unit!40012)))

(declare-fun b!1209511 () Bool)

(declare-fun e!687005 () Unit!40010)

(assert (=> b!1209511 (= e!687008 e!687005)))

(assert (=> b!1209511 (= c!119241 (and (not lt!548781) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!59165 () Bool)

(declare-fun call!59166 () Bool)

(assert (=> bm!59165 (= call!59166 call!59168)))

(declare-fun b!1209512 () Bool)

(declare-fun res!803660 () Bool)

(assert (=> b!1209512 (=> (not res!803660) (not e!686995))))

(assert (=> b!1209512 (= res!803660 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26576))))

(declare-fun b!1209513 () Bool)

(declare-fun call!59165 () ListLongMap!17749)

(assert (=> b!1209513 (= e!687006 (= call!59165 call!59170))))

(declare-fun b!1209514 () Bool)

(declare-fun res!803668 () Bool)

(assert (=> b!1209514 (=> (not res!803668) (not e!686995))))

(assert (=> b!1209514 (= res!803668 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38256 _keys!1208))))))

(declare-fun b!1209515 () Bool)

(declare-fun c!119242 () Bool)

(assert (=> b!1209515 (= c!119242 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548781))))

(assert (=> b!1209515 (= e!687005 e!686997)))

(declare-fun bm!59166 () Bool)

(declare-fun lt!548791 () array!78175)

(assert (=> bm!59166 (= call!59165 (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209516 () Bool)

(assert (=> b!1209516 call!59166))

(declare-fun lt!548789 () Unit!40010)

(declare-fun call!59164 () Unit!40010)

(assert (=> b!1209516 (= lt!548789 call!59164)))

(assert (=> b!1209516 (= e!687005 lt!548789)))

(declare-fun b!1209517 () Bool)

(declare-fun res!803675 () Bool)

(assert (=> b!1209517 (=> (not res!803675) (not e!686995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209517 (= res!803675 (validKeyInArray!0 k0!934))))

(declare-fun b!1209518 () Bool)

(assert (=> b!1209518 (= e!686998 e!687001)))

(declare-fun res!803673 () Bool)

(assert (=> b!1209518 (=> res!803673 e!687001)))

(assert (=> b!1209518 (= res!803673 (not (contains!6973 lt!548784 k0!934)))))

(assert (=> b!1209518 (= lt!548784 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209519 () Bool)

(assert (=> b!1209519 (= e!686993 e!687007)))

(declare-fun res!803672 () Bool)

(assert (=> b!1209519 (=> res!803672 e!687007)))

(assert (=> b!1209519 (= res!803672 (not (= from!1455 i!673)))))

(declare-fun lt!548786 () ListLongMap!17749)

(assert (=> b!1209519 (= lt!548786 (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3272 (Int (_ BitVec 64)) V!46033)

(assert (=> b!1209519 (= lt!548791 (array!78176 (store (arr!37720 _values!996) i!673 (ValueCellFull!14630 (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38257 _values!996)))))

(declare-fun lt!548792 () ListLongMap!17749)

(assert (=> b!1209519 (= lt!548792 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1209520 () Bool)

(declare-fun res!803661 () Bool)

(assert (=> b!1209520 (=> (not res!803661) (not e!686995))))

(assert (=> b!1209520 (= res!803661 (and (= (size!38257 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38256 _keys!1208) (size!38257 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209521 () Bool)

(assert (=> b!1209521 (= e!686999 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548781) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1209522 () Bool)

(declare-fun noDuplicate!1639 (List!26579) Bool)

(assert (=> b!1209522 (= e!687000 (noDuplicate!1639 Nil!26576))))

(declare-fun mapIsEmpty!47881 () Bool)

(assert (=> mapIsEmpty!47881 mapRes!47881))

(declare-fun b!1209523 () Bool)

(declare-fun lt!548790 () Unit!40010)

(assert (=> b!1209523 (= e!686997 lt!548790)))

(assert (=> b!1209523 (= lt!548790 call!59164)))

(assert (=> b!1209523 call!59166))

(declare-fun bm!59167 () Bool)

(declare-fun +!4052 (ListLongMap!17749 tuple2!19772) ListLongMap!17749)

(assert (=> bm!59167 (= call!59167 (+!4052 lt!548784 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1209524 () Bool)

(declare-fun -!1825 (ListLongMap!17749 (_ BitVec 64)) ListLongMap!17749)

(assert (=> b!1209524 (= e!687006 (= call!59165 (-!1825 call!59170 k0!934)))))

(declare-fun b!1209525 () Bool)

(declare-fun lt!548793 () Unit!40010)

(assert (=> b!1209525 (= e!687008 lt!548793)))

(declare-fun lt!548785 () Unit!40010)

(assert (=> b!1209525 (= lt!548785 (addStillContains!1036 lt!548784 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1209525 (= lt!548787 call!59167)))

(assert (=> b!1209525 call!59168))

(assert (=> b!1209525 (= lt!548793 call!59169)))

(assert (=> b!1209525 (contains!6973 (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!59168 () Bool)

(assert (=> bm!59168 (= call!59164 call!59169)))

(declare-fun b!1209526 () Bool)

(assert (=> b!1209526 (= e!686999 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!101142 res!803667) b!1209504))

(assert (= (and b!1209504 res!803663) b!1209520))

(assert (= (and b!1209520 res!803661) b!1209501))

(assert (= (and b!1209501 res!803666) b!1209512))

(assert (= (and b!1209512 res!803660) b!1209514))

(assert (= (and b!1209514 res!803668) b!1209517))

(assert (= (and b!1209517 res!803675) b!1209509))

(assert (= (and b!1209509 res!803674) b!1209505))

(assert (= (and b!1209505 res!803662) b!1209498))

(assert (= (and b!1209498 res!803669) b!1209499))

(assert (= (and b!1209499 (not res!803664)) b!1209519))

(assert (= (and b!1209519 (not res!803672)) b!1209508))

(assert (= (and b!1209508 c!119243) b!1209524))

(assert (= (and b!1209508 (not c!119243)) b!1209513))

(assert (= (or b!1209524 b!1209513) bm!59166))

(assert (= (or b!1209524 b!1209513) bm!59164))

(assert (= (and b!1209508 (not res!803671)) b!1209518))

(assert (= (and b!1209518 (not res!803673)) b!1209507))

(assert (= (and b!1209507 c!119244) b!1209525))

(assert (= (and b!1209507 (not c!119244)) b!1209511))

(assert (= (and b!1209511 c!119241) b!1209516))

(assert (= (and b!1209511 (not c!119241)) b!1209515))

(assert (= (and b!1209515 c!119242) b!1209523))

(assert (= (and b!1209515 (not c!119242)) b!1209510))

(assert (= (or b!1209516 b!1209523) bm!59168))

(assert (= (or b!1209516 b!1209523) bm!59161))

(assert (= (or b!1209516 b!1209523) bm!59165))

(assert (= (or b!1209525 bm!59165) bm!59162))

(assert (= (or b!1209525 bm!59168) bm!59163))

(assert (= (or b!1209525 bm!59161) bm!59167))

(assert (= (and b!1209507 c!119240) b!1209526))

(assert (= (and b!1209507 (not c!119240)) b!1209521))

(assert (= (and b!1209507 res!803670) b!1209506))

(assert (= (and b!1209507 (not res!803665)) b!1209522))

(assert (= (and b!1209502 condMapEmpty!47881) mapIsEmpty!47881))

(assert (= (and b!1209502 (not condMapEmpty!47881)) mapNonEmpty!47881))

(get-info :version)

(assert (= (and mapNonEmpty!47881 ((_ is ValueCellFull!14630) mapValue!47881)) b!1209500))

(assert (= (and b!1209502 ((_ is ValueCellFull!14630) mapDefault!47881)) b!1209503))

(assert (= start!101142 b!1209502))

(declare-fun b_lambda!21493 () Bool)

(assert (=> (not b_lambda!21493) (not b!1209519)))

(declare-fun t!39525 () Bool)

(declare-fun tb!10767 () Bool)

(assert (=> (and start!101142 (= defaultEntry!1004 defaultEntry!1004) t!39525) tb!10767))

(declare-fun result!22131 () Bool)

(assert (=> tb!10767 (= result!22131 tp_is_empty!30679)))

(assert (=> b!1209519 t!39525))

(declare-fun b_and!42999 () Bool)

(assert (= b_and!42997 (and (=> t!39525 result!22131) b_and!42999)))

(declare-fun m!1115603 () Bool)

(assert (=> b!1209518 m!1115603))

(declare-fun m!1115605 () Bool)

(assert (=> b!1209518 m!1115605))

(declare-fun m!1115607 () Bool)

(assert (=> bm!59166 m!1115607))

(declare-fun m!1115609 () Bool)

(assert (=> b!1209506 m!1115609))

(assert (=> b!1209526 m!1115609))

(declare-fun m!1115611 () Bool)

(assert (=> b!1209509 m!1115611))

(declare-fun m!1115613 () Bool)

(assert (=> bm!59163 m!1115613))

(declare-fun m!1115615 () Bool)

(assert (=> bm!59162 m!1115615))

(declare-fun m!1115617 () Bool)

(assert (=> b!1209505 m!1115617))

(declare-fun m!1115619 () Bool)

(assert (=> b!1209505 m!1115619))

(declare-fun m!1115621 () Bool)

(assert (=> b!1209519 m!1115621))

(declare-fun m!1115623 () Bool)

(assert (=> b!1209519 m!1115623))

(declare-fun m!1115625 () Bool)

(assert (=> b!1209519 m!1115625))

(declare-fun m!1115627 () Bool)

(assert (=> b!1209519 m!1115627))

(declare-fun m!1115629 () Bool)

(assert (=> b!1209512 m!1115629))

(declare-fun m!1115631 () Bool)

(assert (=> b!1209508 m!1115631))

(declare-fun m!1115633 () Bool)

(assert (=> b!1209508 m!1115633))

(declare-fun m!1115635 () Bool)

(assert (=> b!1209498 m!1115635))

(declare-fun m!1115637 () Bool)

(assert (=> b!1209525 m!1115637))

(declare-fun m!1115639 () Bool)

(assert (=> b!1209525 m!1115639))

(assert (=> b!1209525 m!1115639))

(declare-fun m!1115641 () Bool)

(assert (=> b!1209525 m!1115641))

(declare-fun m!1115643 () Bool)

(assert (=> b!1209517 m!1115643))

(declare-fun m!1115645 () Bool)

(assert (=> b!1209499 m!1115645))

(declare-fun m!1115647 () Bool)

(assert (=> b!1209499 m!1115647))

(declare-fun m!1115649 () Bool)

(assert (=> mapNonEmpty!47881 m!1115649))

(declare-fun m!1115651 () Bool)

(assert (=> start!101142 m!1115651))

(declare-fun m!1115653 () Bool)

(assert (=> start!101142 m!1115653))

(declare-fun m!1115655 () Bool)

(assert (=> b!1209507 m!1115655))

(declare-fun m!1115657 () Bool)

(assert (=> b!1209507 m!1115657))

(declare-fun m!1115659 () Bool)

(assert (=> b!1209507 m!1115659))

(assert (=> bm!59164 m!1115605))

(declare-fun m!1115661 () Bool)

(assert (=> b!1209524 m!1115661))

(declare-fun m!1115663 () Bool)

(assert (=> bm!59167 m!1115663))

(declare-fun m!1115665 () Bool)

(assert (=> b!1209504 m!1115665))

(declare-fun m!1115667 () Bool)

(assert (=> b!1209522 m!1115667))

(declare-fun m!1115669 () Bool)

(assert (=> b!1209501 m!1115669))

(check-sat (not bm!59167) (not start!101142) (not b!1209499) (not b_next!25975) (not b!1209508) (not mapNonEmpty!47881) (not b!1209507) (not b!1209518) (not bm!59162) (not b!1209504) tp_is_empty!30679 (not bm!59166) (not b!1209505) (not bm!59163) (not b!1209517) (not b!1209522) (not b_lambda!21493) (not b!1209519) (not b!1209526) (not bm!59164) (not b!1209498) (not b!1209524) (not b!1209525) b_and!42999 (not b!1209512) (not b!1209506) (not b!1209501))
(check-sat b_and!42999 (not b_next!25975))
(get-model)

(declare-fun b_lambda!21499 () Bool)

(assert (= b_lambda!21493 (or (and start!101142 b_free!25975) b_lambda!21499)))

(check-sat (not bm!59167) (not start!101142) (not b!1209499) (not b_next!25975) (not b!1209508) (not mapNonEmpty!47881) (not b_lambda!21499) (not b!1209507) (not b!1209518) (not bm!59162) (not b!1209504) tp_is_empty!30679 (not bm!59166) (not b!1209505) (not bm!59163) (not b!1209517) (not b!1209522) (not b!1209519) (not b!1209526) (not bm!59164) (not b!1209498) (not b!1209524) (not b!1209525) b_and!42999 (not b!1209512) (not b!1209506) (not b!1209501))
(check-sat b_and!42999 (not b_next!25975))
(get-model)

(declare-fun b!1209717 () Bool)

(declare-fun e!687120 () Bool)

(declare-fun contains!6976 (List!26579 (_ BitVec 64)) Bool)

(assert (=> b!1209717 (= e!687120 (contains!6976 Nil!26576 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1209718 () Bool)

(declare-fun e!687123 () Bool)

(declare-fun call!59222 () Bool)

(assert (=> b!1209718 (= e!687123 call!59222)))

(declare-fun b!1209719 () Bool)

(declare-fun e!687122 () Bool)

(declare-fun e!687121 () Bool)

(assert (=> b!1209719 (= e!687122 e!687121)))

(declare-fun res!803779 () Bool)

(assert (=> b!1209719 (=> (not res!803779) (not e!687121))))

(assert (=> b!1209719 (= res!803779 (not e!687120))))

(declare-fun res!803780 () Bool)

(assert (=> b!1209719 (=> (not res!803780) (not e!687120))))

(assert (=> b!1209719 (= res!803780 (validKeyInArray!0 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133661 () Bool)

(declare-fun res!803778 () Bool)

(assert (=> d!133661 (=> res!803778 e!687122)))

(assert (=> d!133661 (= res!803778 (bvsge #b00000000000000000000000000000000 (size!38256 _keys!1208)))))

(assert (=> d!133661 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26576) e!687122)))

(declare-fun bm!59219 () Bool)

(declare-fun c!119277 () Bool)

(assert (=> bm!59219 (= call!59222 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119277 (Cons!26575 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000) Nil!26576) Nil!26576)))))

(declare-fun b!1209720 () Bool)

(assert (=> b!1209720 (= e!687123 call!59222)))

(declare-fun b!1209721 () Bool)

(assert (=> b!1209721 (= e!687121 e!687123)))

(assert (=> b!1209721 (= c!119277 (validKeyInArray!0 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133661 (not res!803778)) b!1209719))

(assert (= (and b!1209719 res!803780) b!1209717))

(assert (= (and b!1209719 res!803779) b!1209721))

(assert (= (and b!1209721 c!119277) b!1209718))

(assert (= (and b!1209721 (not c!119277)) b!1209720))

(assert (= (or b!1209718 b!1209720) bm!59219))

(declare-fun m!1115807 () Bool)

(assert (=> b!1209717 m!1115807))

(assert (=> b!1209717 m!1115807))

(declare-fun m!1115809 () Bool)

(assert (=> b!1209717 m!1115809))

(assert (=> b!1209719 m!1115807))

(assert (=> b!1209719 m!1115807))

(declare-fun m!1115811 () Bool)

(assert (=> b!1209719 m!1115811))

(assert (=> bm!59219 m!1115807))

(declare-fun m!1115813 () Bool)

(assert (=> bm!59219 m!1115813))

(assert (=> b!1209721 m!1115807))

(assert (=> b!1209721 m!1115807))

(assert (=> b!1209721 m!1115811))

(assert (=> b!1209512 d!133661))

(declare-fun d!133663 () Bool)

(declare-fun res!803785 () Bool)

(declare-fun e!687128 () Bool)

(assert (=> d!133663 (=> res!803785 e!687128)))

(assert (=> d!133663 (= res!803785 ((_ is Nil!26576) Nil!26576))))

(assert (=> d!133663 (= (noDuplicate!1639 Nil!26576) e!687128)))

(declare-fun b!1209726 () Bool)

(declare-fun e!687129 () Bool)

(assert (=> b!1209726 (= e!687128 e!687129)))

(declare-fun res!803786 () Bool)

(assert (=> b!1209726 (=> (not res!803786) (not e!687129))))

(assert (=> b!1209726 (= res!803786 (not (contains!6976 (t!39526 Nil!26576) (h!27793 Nil!26576))))))

(declare-fun b!1209727 () Bool)

(assert (=> b!1209727 (= e!687129 (noDuplicate!1639 (t!39526 Nil!26576)))))

(assert (= (and d!133663 (not res!803785)) b!1209726))

(assert (= (and b!1209726 res!803786) b!1209727))

(declare-fun m!1115815 () Bool)

(assert (=> b!1209726 m!1115815))

(declare-fun m!1115817 () Bool)

(assert (=> b!1209727 m!1115817))

(assert (=> b!1209522 d!133663))

(declare-fun d!133665 () Bool)

(assert (=> d!133665 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1209504 d!133665))

(declare-fun d!133667 () Bool)

(assert (=> d!133667 (contains!6973 (+!4052 (ite c!119244 lt!548787 lt!548784) (tuple2!19773 (ite c!119244 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119241 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119244 minValue!944 (ite c!119241 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!548893 () Unit!40010)

(declare-fun choose!1812 (ListLongMap!17749 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!40010)

(assert (=> d!133667 (= lt!548893 (choose!1812 (ite c!119244 lt!548787 lt!548784) (ite c!119244 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119241 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119244 minValue!944 (ite c!119241 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133667 (contains!6973 (ite c!119244 lt!548787 lt!548784) k0!934)))

(assert (=> d!133667 (= (addStillContains!1036 (ite c!119244 lt!548787 lt!548784) (ite c!119244 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119241 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119244 minValue!944 (ite c!119241 zeroValue!944 minValue!944)) k0!934) lt!548893)))

(declare-fun bs!34176 () Bool)

(assert (= bs!34176 d!133667))

(declare-fun m!1115819 () Bool)

(assert (=> bs!34176 m!1115819))

(assert (=> bs!34176 m!1115819))

(declare-fun m!1115821 () Bool)

(assert (=> bs!34176 m!1115821))

(declare-fun m!1115823 () Bool)

(assert (=> bs!34176 m!1115823))

(declare-fun m!1115825 () Bool)

(assert (=> bs!34176 m!1115825))

(assert (=> bm!59163 d!133667))

(declare-fun d!133669 () Bool)

(declare-fun res!803791 () Bool)

(declare-fun e!687134 () Bool)

(assert (=> d!133669 (=> res!803791 e!687134)))

(assert (=> d!133669 (= res!803791 (= (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133669 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!687134)))

(declare-fun b!1209733 () Bool)

(declare-fun e!687135 () Bool)

(assert (=> b!1209733 (= e!687134 e!687135)))

(declare-fun res!803792 () Bool)

(assert (=> b!1209733 (=> (not res!803792) (not e!687135))))

(assert (=> b!1209733 (= res!803792 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38256 _keys!1208)))))

(declare-fun b!1209734 () Bool)

(assert (=> b!1209734 (= e!687135 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133669 (not res!803791)) b!1209733))

(assert (= (and b!1209733 res!803792) b!1209734))

(declare-fun m!1115827 () Bool)

(assert (=> d!133669 m!1115827))

(declare-fun m!1115829 () Bool)

(assert (=> b!1209734 m!1115829))

(assert (=> b!1209506 d!133669))

(declare-fun d!133671 () Bool)

(declare-fun e!687138 () Bool)

(assert (=> d!133671 e!687138))

(declare-fun res!803798 () Bool)

(assert (=> d!133671 (=> (not res!803798) (not e!687138))))

(declare-fun lt!548904 () ListLongMap!17749)

(assert (=> d!133671 (= res!803798 (contains!6973 lt!548904 (_1!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548902 () List!26580)

(assert (=> d!133671 (= lt!548904 (ListLongMap!17750 lt!548902))))

(declare-fun lt!548905 () Unit!40010)

(declare-fun lt!548903 () Unit!40010)

(assert (=> d!133671 (= lt!548905 lt!548903)))

(declare-datatypes ((Option!684 0))(
  ( (Some!683 (v!18043 V!46033)) (None!682) )
))
(declare-fun getValueByKey!633 (List!26580 (_ BitVec 64)) Option!684)

(assert (=> d!133671 (= (getValueByKey!633 lt!548902 (_1!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!683 (_2!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!315 (List!26580 (_ BitVec 64) V!46033) Unit!40010)

(assert (=> d!133671 (= lt!548903 (lemmaContainsTupThenGetReturnValue!315 lt!548902 (_1!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!408 (List!26580 (_ BitVec 64) V!46033) List!26580)

(assert (=> d!133671 (= lt!548902 (insertStrictlySorted!408 (toList!8890 lt!548784) (_1!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133671 (= (+!4052 lt!548784 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548904)))

(declare-fun b!1209739 () Bool)

(declare-fun res!803797 () Bool)

(assert (=> b!1209739 (=> (not res!803797) (not e!687138))))

(assert (=> b!1209739 (= res!803797 (= (getValueByKey!633 (toList!8890 lt!548904) (_1!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!683 (_2!9897 (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1209740 () Bool)

(declare-fun contains!6977 (List!26580 tuple2!19772) Bool)

(assert (=> b!1209740 (= e!687138 (contains!6977 (toList!8890 lt!548904) (ite (or c!119244 c!119241) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133671 res!803798) b!1209739))

(assert (= (and b!1209739 res!803797) b!1209740))

(declare-fun m!1115831 () Bool)

(assert (=> d!133671 m!1115831))

(declare-fun m!1115833 () Bool)

(assert (=> d!133671 m!1115833))

(declare-fun m!1115835 () Bool)

(assert (=> d!133671 m!1115835))

(declare-fun m!1115837 () Bool)

(assert (=> d!133671 m!1115837))

(declare-fun m!1115839 () Bool)

(assert (=> b!1209739 m!1115839))

(declare-fun m!1115841 () Bool)

(assert (=> b!1209740 m!1115841))

(assert (=> bm!59167 d!133671))

(declare-fun b!1209765 () Bool)

(declare-fun res!803807 () Bool)

(declare-fun e!687158 () Bool)

(assert (=> b!1209765 (=> (not res!803807) (not e!687158))))

(declare-fun lt!548921 () ListLongMap!17749)

(assert (=> b!1209765 (= res!803807 (not (contains!6973 lt!548921 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1209766 () Bool)

(assert (=> b!1209766 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)))))

(assert (=> b!1209766 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38257 _values!996)))))

(declare-fun e!687157 () Bool)

(declare-fun apply!975 (ListLongMap!17749 (_ BitVec 64)) V!46033)

(declare-fun get!19271 (ValueCell!14630 V!46033) V!46033)

(assert (=> b!1209766 (= e!687157 (= (apply!975 lt!548921 (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19271 (select (arr!37720 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1209767 () Bool)

(declare-fun e!687159 () Bool)

(declare-fun e!687155 () Bool)

(assert (=> b!1209767 (= e!687159 e!687155)))

(declare-fun c!119288 () Bool)

(assert (=> b!1209767 (= c!119288 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)))))

(declare-fun b!1209768 () Bool)

(assert (=> b!1209768 (= e!687159 e!687157)))

(assert (=> b!1209768 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)))))

(declare-fun res!803809 () Bool)

(assert (=> b!1209768 (= res!803809 (contains!6973 lt!548921 (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209768 (=> (not res!803809) (not e!687157))))

(declare-fun b!1209769 () Bool)

(assert (=> b!1209769 (= e!687155 (= lt!548921 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1209770 () Bool)

(assert (=> b!1209770 (= e!687158 e!687159)))

(declare-fun c!119289 () Bool)

(declare-fun e!687154 () Bool)

(assert (=> b!1209770 (= c!119289 e!687154)))

(declare-fun res!803810 () Bool)

(assert (=> b!1209770 (=> (not res!803810) (not e!687154))))

(assert (=> b!1209770 (= res!803810 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)))))

(declare-fun b!1209771 () Bool)

(assert (=> b!1209771 (= e!687154 (validKeyInArray!0 (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209771 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1209772 () Bool)

(declare-fun e!687153 () ListLongMap!17749)

(assert (=> b!1209772 (= e!687153 (ListLongMap!17750 Nil!26577))))

(declare-fun b!1209773 () Bool)

(declare-fun e!687156 () ListLongMap!17749)

(declare-fun call!59225 () ListLongMap!17749)

(assert (=> b!1209773 (= e!687156 call!59225)))

(declare-fun bm!59222 () Bool)

(assert (=> bm!59222 (= call!59225 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1209774 () Bool)

(declare-fun isEmpty!994 (ListLongMap!17749) Bool)

(assert (=> b!1209774 (= e!687155 (isEmpty!994 lt!548921))))

(declare-fun d!133673 () Bool)

(assert (=> d!133673 e!687158))

(declare-fun res!803808 () Bool)

(assert (=> d!133673 (=> (not res!803808) (not e!687158))))

(assert (=> d!133673 (= res!803808 (not (contains!6973 lt!548921 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133673 (= lt!548921 e!687153)))

(declare-fun c!119286 () Bool)

(assert (=> d!133673 (= c!119286 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)))))

(assert (=> d!133673 (validMask!0 mask!1564)))

(assert (=> d!133673 (= (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548921)))

(declare-fun b!1209775 () Bool)

(declare-fun lt!548922 () Unit!40010)

(declare-fun lt!548925 () Unit!40010)

(assert (=> b!1209775 (= lt!548922 lt!548925)))

(declare-fun lt!548926 () ListLongMap!17749)

(declare-fun lt!548924 () (_ BitVec 64))

(declare-fun lt!548923 () (_ BitVec 64))

(declare-fun lt!548920 () V!46033)

(assert (=> b!1209775 (not (contains!6973 (+!4052 lt!548926 (tuple2!19773 lt!548923 lt!548920)) lt!548924))))

(declare-fun addStillNotContains!296 (ListLongMap!17749 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!40010)

(assert (=> b!1209775 (= lt!548925 (addStillNotContains!296 lt!548926 lt!548923 lt!548920 lt!548924))))

(assert (=> b!1209775 (= lt!548924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1209775 (= lt!548920 (get!19271 (select (arr!37720 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1209775 (= lt!548923 (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1209775 (= lt!548926 call!59225)))

(assert (=> b!1209775 (= e!687156 (+!4052 call!59225 (tuple2!19773 (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19271 (select (arr!37720 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1209776 () Bool)

(assert (=> b!1209776 (= e!687153 e!687156)))

(declare-fun c!119287 () Bool)

(assert (=> b!1209776 (= c!119287 (validKeyInArray!0 (select (arr!37719 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!133673 c!119286) b!1209772))

(assert (= (and d!133673 (not c!119286)) b!1209776))

(assert (= (and b!1209776 c!119287) b!1209775))

(assert (= (and b!1209776 (not c!119287)) b!1209773))

(assert (= (or b!1209775 b!1209773) bm!59222))

(assert (= (and d!133673 res!803808) b!1209765))

(assert (= (and b!1209765 res!803807) b!1209770))

(assert (= (and b!1209770 res!803810) b!1209771))

(assert (= (and b!1209770 c!119289) b!1209768))

(assert (= (and b!1209770 (not c!119289)) b!1209767))

(assert (= (and b!1209768 res!803809) b!1209766))

(assert (= (and b!1209767 c!119288) b!1209769))

(assert (= (and b!1209767 (not c!119288)) b!1209774))

(declare-fun b_lambda!21501 () Bool)

(assert (=> (not b_lambda!21501) (not b!1209766)))

(assert (=> b!1209766 t!39525))

(declare-fun b_and!43009 () Bool)

(assert (= b_and!42999 (and (=> t!39525 result!22131) b_and!43009)))

(declare-fun b_lambda!21503 () Bool)

(assert (=> (not b_lambda!21503) (not b!1209775)))

(assert (=> b!1209775 t!39525))

(declare-fun b_and!43011 () Bool)

(assert (= b_and!43009 (and (=> t!39525 result!22131) b_and!43011)))

(declare-fun m!1115843 () Bool)

(assert (=> b!1209765 m!1115843))

(assert (=> b!1209771 m!1115827))

(assert (=> b!1209771 m!1115827))

(declare-fun m!1115845 () Bool)

(assert (=> b!1209771 m!1115845))

(assert (=> b!1209768 m!1115827))

(assert (=> b!1209768 m!1115827))

(declare-fun m!1115847 () Bool)

(assert (=> b!1209768 m!1115847))

(assert (=> b!1209776 m!1115827))

(assert (=> b!1209776 m!1115827))

(assert (=> b!1209776 m!1115845))

(assert (=> b!1209775 m!1115827))

(declare-fun m!1115849 () Bool)

(assert (=> b!1209775 m!1115849))

(declare-fun m!1115851 () Bool)

(assert (=> b!1209775 m!1115851))

(declare-fun m!1115853 () Bool)

(assert (=> b!1209775 m!1115853))

(assert (=> b!1209775 m!1115851))

(declare-fun m!1115855 () Bool)

(assert (=> b!1209775 m!1115855))

(assert (=> b!1209775 m!1115623))

(assert (=> b!1209775 m!1115853))

(assert (=> b!1209775 m!1115623))

(declare-fun m!1115857 () Bool)

(assert (=> b!1209775 m!1115857))

(declare-fun m!1115859 () Bool)

(assert (=> b!1209775 m!1115859))

(declare-fun m!1115861 () Bool)

(assert (=> d!133673 m!1115861))

(assert (=> d!133673 m!1115665))

(declare-fun m!1115863 () Bool)

(assert (=> b!1209774 m!1115863))

(assert (=> b!1209766 m!1115827))

(assert (=> b!1209766 m!1115853))

(assert (=> b!1209766 m!1115623))

(assert (=> b!1209766 m!1115853))

(assert (=> b!1209766 m!1115623))

(assert (=> b!1209766 m!1115857))

(assert (=> b!1209766 m!1115827))

(declare-fun m!1115865 () Bool)

(assert (=> b!1209766 m!1115865))

(declare-fun m!1115867 () Bool)

(assert (=> b!1209769 m!1115867))

(assert (=> bm!59222 m!1115867))

(assert (=> bm!59164 d!133673))

(declare-fun b!1209777 () Bool)

(declare-fun e!687160 () Bool)

(assert (=> b!1209777 (= e!687160 (contains!6976 Nil!26576 (select (arr!37719 lt!548788) #b00000000000000000000000000000000)))))

(declare-fun b!1209778 () Bool)

(declare-fun e!687163 () Bool)

(declare-fun call!59226 () Bool)

(assert (=> b!1209778 (= e!687163 call!59226)))

(declare-fun b!1209779 () Bool)

(declare-fun e!687162 () Bool)

(declare-fun e!687161 () Bool)

(assert (=> b!1209779 (= e!687162 e!687161)))

(declare-fun res!803812 () Bool)

(assert (=> b!1209779 (=> (not res!803812) (not e!687161))))

(assert (=> b!1209779 (= res!803812 (not e!687160))))

(declare-fun res!803813 () Bool)

(assert (=> b!1209779 (=> (not res!803813) (not e!687160))))

(assert (=> b!1209779 (= res!803813 (validKeyInArray!0 (select (arr!37719 lt!548788) #b00000000000000000000000000000000)))))

(declare-fun d!133675 () Bool)

(declare-fun res!803811 () Bool)

(assert (=> d!133675 (=> res!803811 e!687162)))

(assert (=> d!133675 (= res!803811 (bvsge #b00000000000000000000000000000000 (size!38256 lt!548788)))))

(assert (=> d!133675 (= (arrayNoDuplicates!0 lt!548788 #b00000000000000000000000000000000 Nil!26576) e!687162)))

(declare-fun bm!59223 () Bool)

(declare-fun c!119290 () Bool)

(assert (=> bm!59223 (= call!59226 (arrayNoDuplicates!0 lt!548788 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119290 (Cons!26575 (select (arr!37719 lt!548788) #b00000000000000000000000000000000) Nil!26576) Nil!26576)))))

(declare-fun b!1209780 () Bool)

(assert (=> b!1209780 (= e!687163 call!59226)))

(declare-fun b!1209781 () Bool)

(assert (=> b!1209781 (= e!687161 e!687163)))

(assert (=> b!1209781 (= c!119290 (validKeyInArray!0 (select (arr!37719 lt!548788) #b00000000000000000000000000000000)))))

(assert (= (and d!133675 (not res!803811)) b!1209779))

(assert (= (and b!1209779 res!803813) b!1209777))

(assert (= (and b!1209779 res!803812) b!1209781))

(assert (= (and b!1209781 c!119290) b!1209778))

(assert (= (and b!1209781 (not c!119290)) b!1209780))

(assert (= (or b!1209778 b!1209780) bm!59223))

(declare-fun m!1115869 () Bool)

(assert (=> b!1209777 m!1115869))

(assert (=> b!1209777 m!1115869))

(declare-fun m!1115871 () Bool)

(assert (=> b!1209777 m!1115871))

(assert (=> b!1209779 m!1115869))

(assert (=> b!1209779 m!1115869))

(declare-fun m!1115873 () Bool)

(assert (=> b!1209779 m!1115873))

(assert (=> bm!59223 m!1115869))

(declare-fun m!1115875 () Bool)

(assert (=> bm!59223 m!1115875))

(assert (=> b!1209781 m!1115869))

(assert (=> b!1209781 m!1115869))

(assert (=> b!1209781 m!1115873))

(assert (=> b!1209498 d!133675))

(declare-fun bm!59226 () Bool)

(declare-fun call!59229 () Bool)

(assert (=> bm!59226 (= call!59229 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548788 mask!1564))))

(declare-fun b!1209790 () Bool)

(declare-fun e!687172 () Bool)

(assert (=> b!1209790 (= e!687172 call!59229)))

(declare-fun b!1209791 () Bool)

(declare-fun e!687171 () Bool)

(assert (=> b!1209791 (= e!687171 call!59229)))

(declare-fun b!1209792 () Bool)

(declare-fun e!687170 () Bool)

(assert (=> b!1209792 (= e!687170 e!687171)))

(declare-fun c!119293 () Bool)

(assert (=> b!1209792 (= c!119293 (validKeyInArray!0 (select (arr!37719 lt!548788) #b00000000000000000000000000000000)))))

(declare-fun d!133677 () Bool)

(declare-fun res!803818 () Bool)

(assert (=> d!133677 (=> res!803818 e!687170)))

(assert (=> d!133677 (= res!803818 (bvsge #b00000000000000000000000000000000 (size!38256 lt!548788)))))

(assert (=> d!133677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548788 mask!1564) e!687170)))

(declare-fun b!1209793 () Bool)

(assert (=> b!1209793 (= e!687171 e!687172)))

(declare-fun lt!548934 () (_ BitVec 64))

(assert (=> b!1209793 (= lt!548934 (select (arr!37719 lt!548788) #b00000000000000000000000000000000))))

(declare-fun lt!548935 () Unit!40010)

(assert (=> b!1209793 (= lt!548935 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548788 lt!548934 #b00000000000000000000000000000000))))

(assert (=> b!1209793 (arrayContainsKey!0 lt!548788 lt!548934 #b00000000000000000000000000000000)))

(declare-fun lt!548933 () Unit!40010)

(assert (=> b!1209793 (= lt!548933 lt!548935)))

(declare-fun res!803819 () Bool)

(declare-datatypes ((SeekEntryResult!9895 0))(
  ( (MissingZero!9895 (index!41951 (_ BitVec 32))) (Found!9895 (index!41952 (_ BitVec 32))) (Intermediate!9895 (undefined!10707 Bool) (index!41953 (_ BitVec 32)) (x!106602 (_ BitVec 32))) (Undefined!9895) (MissingVacant!9895 (index!41954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78173 (_ BitVec 32)) SeekEntryResult!9895)

(assert (=> b!1209793 (= res!803819 (= (seekEntryOrOpen!0 (select (arr!37719 lt!548788) #b00000000000000000000000000000000) lt!548788 mask!1564) (Found!9895 #b00000000000000000000000000000000)))))

(assert (=> b!1209793 (=> (not res!803819) (not e!687172))))

(assert (= (and d!133677 (not res!803818)) b!1209792))

(assert (= (and b!1209792 c!119293) b!1209793))

(assert (= (and b!1209792 (not c!119293)) b!1209791))

(assert (= (and b!1209793 res!803819) b!1209790))

(assert (= (or b!1209790 b!1209791) bm!59226))

(declare-fun m!1115877 () Bool)

(assert (=> bm!59226 m!1115877))

(assert (=> b!1209792 m!1115869))

(assert (=> b!1209792 m!1115869))

(assert (=> b!1209792 m!1115873))

(assert (=> b!1209793 m!1115869))

(declare-fun m!1115879 () Bool)

(assert (=> b!1209793 m!1115879))

(declare-fun m!1115881 () Bool)

(assert (=> b!1209793 m!1115881))

(assert (=> b!1209793 m!1115869))

(declare-fun m!1115883 () Bool)

(assert (=> b!1209793 m!1115883))

(assert (=> b!1209505 d!133677))

(declare-fun d!133679 () Bool)

(declare-fun res!803820 () Bool)

(declare-fun e!687173 () Bool)

(assert (=> d!133679 (=> res!803820 e!687173)))

(assert (=> d!133679 (= res!803820 (= (select (arr!37719 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133679 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!687173)))

(declare-fun b!1209794 () Bool)

(declare-fun e!687174 () Bool)

(assert (=> b!1209794 (= e!687173 e!687174)))

(declare-fun res!803821 () Bool)

(assert (=> b!1209794 (=> (not res!803821) (not e!687174))))

(assert (=> b!1209794 (= res!803821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38256 _keys!1208)))))

(declare-fun b!1209795 () Bool)

(assert (=> b!1209795 (= e!687174 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133679 (not res!803820)) b!1209794))

(assert (= (and b!1209794 res!803821) b!1209795))

(assert (=> d!133679 m!1115807))

(declare-fun m!1115885 () Bool)

(assert (=> b!1209795 m!1115885))

(assert (=> b!1209499 d!133679))

(declare-fun d!133681 () Bool)

(assert (=> d!133681 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548938 () Unit!40010)

(declare-fun choose!13 (array!78173 (_ BitVec 64) (_ BitVec 32)) Unit!40010)

(assert (=> d!133681 (= lt!548938 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133681 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133681 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!548938)))

(declare-fun bs!34177 () Bool)

(assert (= bs!34177 d!133681))

(assert (=> bs!34177 m!1115645))

(declare-fun m!1115887 () Bool)

(assert (=> bs!34177 m!1115887))

(assert (=> b!1209499 d!133681))

(declare-fun bm!59227 () Bool)

(declare-fun call!59230 () Bool)

(assert (=> bm!59227 (= call!59230 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1209796 () Bool)

(declare-fun e!687177 () Bool)

(assert (=> b!1209796 (= e!687177 call!59230)))

(declare-fun b!1209797 () Bool)

(declare-fun e!687176 () Bool)

(assert (=> b!1209797 (= e!687176 call!59230)))

(declare-fun b!1209798 () Bool)

(declare-fun e!687175 () Bool)

(assert (=> b!1209798 (= e!687175 e!687176)))

(declare-fun c!119294 () Bool)

(assert (=> b!1209798 (= c!119294 (validKeyInArray!0 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133683 () Bool)

(declare-fun res!803822 () Bool)

(assert (=> d!133683 (=> res!803822 e!687175)))

(assert (=> d!133683 (= res!803822 (bvsge #b00000000000000000000000000000000 (size!38256 _keys!1208)))))

(assert (=> d!133683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!687175)))

(declare-fun b!1209799 () Bool)

(assert (=> b!1209799 (= e!687176 e!687177)))

(declare-fun lt!548940 () (_ BitVec 64))

(assert (=> b!1209799 (= lt!548940 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!548941 () Unit!40010)

(assert (=> b!1209799 (= lt!548941 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548940 #b00000000000000000000000000000000))))

(assert (=> b!1209799 (arrayContainsKey!0 _keys!1208 lt!548940 #b00000000000000000000000000000000)))

(declare-fun lt!548939 () Unit!40010)

(assert (=> b!1209799 (= lt!548939 lt!548941)))

(declare-fun res!803823 () Bool)

(assert (=> b!1209799 (= res!803823 (= (seekEntryOrOpen!0 (select (arr!37719 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9895 #b00000000000000000000000000000000)))))

(assert (=> b!1209799 (=> (not res!803823) (not e!687177))))

(assert (= (and d!133683 (not res!803822)) b!1209798))

(assert (= (and b!1209798 c!119294) b!1209799))

(assert (= (and b!1209798 (not c!119294)) b!1209797))

(assert (= (and b!1209799 res!803823) b!1209796))

(assert (= (or b!1209796 b!1209797) bm!59227))

(declare-fun m!1115889 () Bool)

(assert (=> bm!59227 m!1115889))

(assert (=> b!1209798 m!1115807))

(assert (=> b!1209798 m!1115807))

(assert (=> b!1209798 m!1115811))

(assert (=> b!1209799 m!1115807))

(declare-fun m!1115891 () Bool)

(assert (=> b!1209799 m!1115891))

(declare-fun m!1115893 () Bool)

(assert (=> b!1209799 m!1115893))

(assert (=> b!1209799 m!1115807))

(declare-fun m!1115895 () Bool)

(assert (=> b!1209799 m!1115895))

(assert (=> b!1209501 d!133683))

(declare-fun d!133685 () Bool)

(assert (=> d!133685 (contains!6973 (+!4052 lt!548784 (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!548942 () Unit!40010)

(assert (=> d!133685 (= lt!548942 (choose!1812 lt!548784 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133685 (contains!6973 lt!548784 k0!934)))

(assert (=> d!133685 (= (addStillContains!1036 lt!548784 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!548942)))

(declare-fun bs!34178 () Bool)

(assert (= bs!34178 d!133685))

(declare-fun m!1115897 () Bool)

(assert (=> bs!34178 m!1115897))

(assert (=> bs!34178 m!1115897))

(declare-fun m!1115899 () Bool)

(assert (=> bs!34178 m!1115899))

(declare-fun m!1115901 () Bool)

(assert (=> bs!34178 m!1115901))

(assert (=> bs!34178 m!1115603))

(assert (=> b!1209525 d!133685))

(declare-fun d!133687 () Bool)

(declare-fun e!687183 () Bool)

(assert (=> d!133687 e!687183))

(declare-fun res!803826 () Bool)

(assert (=> d!133687 (=> res!803826 e!687183)))

(declare-fun lt!548953 () Bool)

(assert (=> d!133687 (= res!803826 (not lt!548953))))

(declare-fun lt!548954 () Bool)

(assert (=> d!133687 (= lt!548953 lt!548954)))

(declare-fun lt!548952 () Unit!40010)

(declare-fun e!687182 () Unit!40010)

(assert (=> d!133687 (= lt!548952 e!687182)))

(declare-fun c!119297 () Bool)

(assert (=> d!133687 (= c!119297 lt!548954)))

(declare-fun containsKey!595 (List!26580 (_ BitVec 64)) Bool)

(assert (=> d!133687 (= lt!548954 (containsKey!595 (toList!8890 (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133687 (= (contains!6973 (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!548953)))

(declare-fun b!1209806 () Bool)

(declare-fun lt!548951 () Unit!40010)

(assert (=> b!1209806 (= e!687182 lt!548951)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!423 (List!26580 (_ BitVec 64)) Unit!40010)

(assert (=> b!1209806 (= lt!548951 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8890 (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun isDefined!461 (Option!684) Bool)

(assert (=> b!1209806 (isDefined!461 (getValueByKey!633 (toList!8890 (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1209807 () Bool)

(declare-fun Unit!40018 () Unit!40010)

(assert (=> b!1209807 (= e!687182 Unit!40018)))

(declare-fun b!1209808 () Bool)

(assert (=> b!1209808 (= e!687183 (isDefined!461 (getValueByKey!633 (toList!8890 (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133687 c!119297) b!1209806))

(assert (= (and d!133687 (not c!119297)) b!1209807))

(assert (= (and d!133687 (not res!803826)) b!1209808))

(declare-fun m!1115903 () Bool)

(assert (=> d!133687 m!1115903))

(declare-fun m!1115905 () Bool)

(assert (=> b!1209806 m!1115905))

(declare-fun m!1115907 () Bool)

(assert (=> b!1209806 m!1115907))

(assert (=> b!1209806 m!1115907))

(declare-fun m!1115909 () Bool)

(assert (=> b!1209806 m!1115909))

(assert (=> b!1209808 m!1115907))

(assert (=> b!1209808 m!1115907))

(assert (=> b!1209808 m!1115909))

(assert (=> b!1209525 d!133687))

(declare-fun d!133689 () Bool)

(declare-fun e!687184 () Bool)

(assert (=> d!133689 e!687184))

(declare-fun res!803828 () Bool)

(assert (=> d!133689 (=> (not res!803828) (not e!687184))))

(declare-fun lt!548957 () ListLongMap!17749)

(assert (=> d!133689 (= res!803828 (contains!6973 lt!548957 (_1!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548955 () List!26580)

(assert (=> d!133689 (= lt!548957 (ListLongMap!17750 lt!548955))))

(declare-fun lt!548958 () Unit!40010)

(declare-fun lt!548956 () Unit!40010)

(assert (=> d!133689 (= lt!548958 lt!548956)))

(assert (=> d!133689 (= (getValueByKey!633 lt!548955 (_1!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!683 (_2!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133689 (= lt!548956 (lemmaContainsTupThenGetReturnValue!315 lt!548955 (_1!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133689 (= lt!548955 (insertStrictlySorted!408 (toList!8890 lt!548787) (_1!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133689 (= (+!4052 lt!548787 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548957)))

(declare-fun b!1209809 () Bool)

(declare-fun res!803827 () Bool)

(assert (=> b!1209809 (=> (not res!803827) (not e!687184))))

(assert (=> b!1209809 (= res!803827 (= (getValueByKey!633 (toList!8890 lt!548957) (_1!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!683 (_2!9897 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209810 () Bool)

(assert (=> b!1209810 (= e!687184 (contains!6977 (toList!8890 lt!548957) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133689 res!803828) b!1209809))

(assert (= (and b!1209809 res!803827) b!1209810))

(declare-fun m!1115911 () Bool)

(assert (=> d!133689 m!1115911))

(declare-fun m!1115913 () Bool)

(assert (=> d!133689 m!1115913))

(declare-fun m!1115915 () Bool)

(assert (=> d!133689 m!1115915))

(declare-fun m!1115917 () Bool)

(assert (=> d!133689 m!1115917))

(declare-fun m!1115919 () Bool)

(assert (=> b!1209809 m!1115919))

(declare-fun m!1115921 () Bool)

(assert (=> b!1209810 m!1115921))

(assert (=> b!1209525 d!133689))

(declare-fun call!59236 () ListLongMap!17749)

(declare-fun bm!59232 () Bool)

(assert (=> bm!59232 (= call!59236 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133691 () Bool)

(declare-fun e!687190 () Bool)

(assert (=> d!133691 e!687190))

(declare-fun res!803831 () Bool)

(assert (=> d!133691 (=> (not res!803831) (not e!687190))))

(assert (=> d!133691 (= res!803831 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38256 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38256 _keys!1208))))))))

(declare-fun lt!548961 () Unit!40010)

(declare-fun choose!1813 (array!78173 array!78175 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> d!133691 (= lt!548961 (choose!1813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133691 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 _keys!1208)))))

(assert (=> d!133691 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548961)))

(declare-fun call!59235 () ListLongMap!17749)

(declare-fun e!687189 () Bool)

(declare-fun b!1209817 () Bool)

(assert (=> b!1209817 (= e!687189 (= call!59235 (-!1825 call!59236 k0!934)))))

(assert (=> b!1209817 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38257 _values!996)))))

(declare-fun bm!59233 () Bool)

(assert (=> bm!59233 (= call!59235 (getCurrentListMapNoExtraKeys!5352 (array!78174 (store (arr!37719 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38256 _keys!1208)) (array!78176 (store (arr!37720 _values!996) i!673 (ValueCellFull!14630 (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38257 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209818 () Bool)

(assert (=> b!1209818 (= e!687190 e!687189)))

(declare-fun c!119300 () Bool)

(assert (=> b!1209818 (= c!119300 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1209819 () Bool)

(assert (=> b!1209819 (= e!687189 (= call!59235 call!59236))))

(assert (=> b!1209819 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38257 _values!996)))))

(assert (= (and d!133691 res!803831) b!1209818))

(assert (= (and b!1209818 c!119300) b!1209817))

(assert (= (and b!1209818 (not c!119300)) b!1209819))

(assert (= (or b!1209817 b!1209819) bm!59232))

(assert (= (or b!1209817 b!1209819) bm!59233))

(declare-fun b_lambda!21505 () Bool)

(assert (=> (not b_lambda!21505) (not bm!59233)))

(assert (=> bm!59233 t!39525))

(declare-fun b_and!43013 () Bool)

(assert (= b_and!43011 (and (=> t!39525 result!22131) b_and!43013)))

(assert (=> bm!59232 m!1115605))

(declare-fun m!1115923 () Bool)

(assert (=> d!133691 m!1115923))

(declare-fun m!1115925 () Bool)

(assert (=> b!1209817 m!1115925))

(assert (=> bm!59233 m!1115619))

(assert (=> bm!59233 m!1115623))

(assert (=> bm!59233 m!1115625))

(declare-fun m!1115927 () Bool)

(assert (=> bm!59233 m!1115927))

(assert (=> b!1209508 d!133691))

(declare-fun d!133693 () Bool)

(assert (=> d!133693 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1209517 d!133693))

(declare-fun d!133695 () Bool)

(declare-fun e!687192 () Bool)

(assert (=> d!133695 e!687192))

(declare-fun res!803832 () Bool)

(assert (=> d!133695 (=> res!803832 e!687192)))

(declare-fun lt!548964 () Bool)

(assert (=> d!133695 (= res!803832 (not lt!548964))))

(declare-fun lt!548965 () Bool)

(assert (=> d!133695 (= lt!548964 lt!548965)))

(declare-fun lt!548963 () Unit!40010)

(declare-fun e!687191 () Unit!40010)

(assert (=> d!133695 (= lt!548963 e!687191)))

(declare-fun c!119301 () Bool)

(assert (=> d!133695 (= c!119301 lt!548965)))

(assert (=> d!133695 (= lt!548965 (containsKey!595 (toList!8890 (ite c!119244 lt!548787 call!59171)) k0!934))))

(assert (=> d!133695 (= (contains!6973 (ite c!119244 lt!548787 call!59171) k0!934) lt!548964)))

(declare-fun b!1209820 () Bool)

(declare-fun lt!548962 () Unit!40010)

(assert (=> b!1209820 (= e!687191 lt!548962)))

(assert (=> b!1209820 (= lt!548962 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8890 (ite c!119244 lt!548787 call!59171)) k0!934))))

(assert (=> b!1209820 (isDefined!461 (getValueByKey!633 (toList!8890 (ite c!119244 lt!548787 call!59171)) k0!934))))

(declare-fun b!1209821 () Bool)

(declare-fun Unit!40019 () Unit!40010)

(assert (=> b!1209821 (= e!687191 Unit!40019)))

(declare-fun b!1209822 () Bool)

(assert (=> b!1209822 (= e!687192 (isDefined!461 (getValueByKey!633 (toList!8890 (ite c!119244 lt!548787 call!59171)) k0!934)))))

(assert (= (and d!133695 c!119301) b!1209820))

(assert (= (and d!133695 (not c!119301)) b!1209821))

(assert (= (and d!133695 (not res!803832)) b!1209822))

(declare-fun m!1115929 () Bool)

(assert (=> d!133695 m!1115929))

(declare-fun m!1115931 () Bool)

(assert (=> b!1209820 m!1115931))

(declare-fun m!1115933 () Bool)

(assert (=> b!1209820 m!1115933))

(assert (=> b!1209820 m!1115933))

(declare-fun m!1115935 () Bool)

(assert (=> b!1209820 m!1115935))

(assert (=> b!1209822 m!1115933))

(assert (=> b!1209822 m!1115933))

(assert (=> b!1209822 m!1115935))

(assert (=> bm!59162 d!133695))

(declare-fun b!1209823 () Bool)

(declare-fun res!803833 () Bool)

(declare-fun e!687198 () Bool)

(assert (=> b!1209823 (=> (not res!803833) (not e!687198))))

(declare-fun lt!548967 () ListLongMap!17749)

(assert (=> b!1209823 (= res!803833 (not (contains!6973 lt!548967 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1209824 () Bool)

(assert (=> b!1209824 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 lt!548788)))))

(assert (=> b!1209824 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38257 lt!548791)))))

(declare-fun e!687197 () Bool)

(assert (=> b!1209824 (= e!687197 (= (apply!975 lt!548967 (select (arr!37719 lt!548788) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19271 (select (arr!37720 lt!548791) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1209825 () Bool)

(declare-fun e!687199 () Bool)

(declare-fun e!687195 () Bool)

(assert (=> b!1209825 (= e!687199 e!687195)))

(declare-fun c!119304 () Bool)

(assert (=> b!1209825 (= c!119304 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 lt!548788)))))

(declare-fun b!1209826 () Bool)

(assert (=> b!1209826 (= e!687199 e!687197)))

(assert (=> b!1209826 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 lt!548788)))))

(declare-fun res!803835 () Bool)

(assert (=> b!1209826 (= res!803835 (contains!6973 lt!548967 (select (arr!37719 lt!548788) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209826 (=> (not res!803835) (not e!687197))))

(declare-fun b!1209827 () Bool)

(assert (=> b!1209827 (= e!687195 (= lt!548967 (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1209828 () Bool)

(assert (=> b!1209828 (= e!687198 e!687199)))

(declare-fun c!119305 () Bool)

(declare-fun e!687194 () Bool)

(assert (=> b!1209828 (= c!119305 e!687194)))

(declare-fun res!803836 () Bool)

(assert (=> b!1209828 (=> (not res!803836) (not e!687194))))

(assert (=> b!1209828 (= res!803836 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 lt!548788)))))

(declare-fun b!1209829 () Bool)

(assert (=> b!1209829 (= e!687194 (validKeyInArray!0 (select (arr!37719 lt!548788) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209829 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1209830 () Bool)

(declare-fun e!687193 () ListLongMap!17749)

(assert (=> b!1209830 (= e!687193 (ListLongMap!17750 Nil!26577))))

(declare-fun b!1209831 () Bool)

(declare-fun e!687196 () ListLongMap!17749)

(declare-fun call!59237 () ListLongMap!17749)

(assert (=> b!1209831 (= e!687196 call!59237)))

(declare-fun bm!59234 () Bool)

(assert (=> bm!59234 (= call!59237 (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1209832 () Bool)

(assert (=> b!1209832 (= e!687195 (isEmpty!994 lt!548967))))

(declare-fun d!133697 () Bool)

(assert (=> d!133697 e!687198))

(declare-fun res!803834 () Bool)

(assert (=> d!133697 (=> (not res!803834) (not e!687198))))

(assert (=> d!133697 (= res!803834 (not (contains!6973 lt!548967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133697 (= lt!548967 e!687193)))

(declare-fun c!119302 () Bool)

(assert (=> d!133697 (= c!119302 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38256 lt!548788)))))

(assert (=> d!133697 (validMask!0 mask!1564)))

(assert (=> d!133697 (= (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548967)))

(declare-fun b!1209833 () Bool)

(declare-fun lt!548968 () Unit!40010)

(declare-fun lt!548971 () Unit!40010)

(assert (=> b!1209833 (= lt!548968 lt!548971)))

(declare-fun lt!548966 () V!46033)

(declare-fun lt!548969 () (_ BitVec 64))

(declare-fun lt!548970 () (_ BitVec 64))

(declare-fun lt!548972 () ListLongMap!17749)

(assert (=> b!1209833 (not (contains!6973 (+!4052 lt!548972 (tuple2!19773 lt!548969 lt!548966)) lt!548970))))

(assert (=> b!1209833 (= lt!548971 (addStillNotContains!296 lt!548972 lt!548969 lt!548966 lt!548970))))

(assert (=> b!1209833 (= lt!548970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1209833 (= lt!548966 (get!19271 (select (arr!37720 lt!548791) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1209833 (= lt!548969 (select (arr!37719 lt!548788) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1209833 (= lt!548972 call!59237)))

(assert (=> b!1209833 (= e!687196 (+!4052 call!59237 (tuple2!19773 (select (arr!37719 lt!548788) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19271 (select (arr!37720 lt!548791) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1209834 () Bool)

(assert (=> b!1209834 (= e!687193 e!687196)))

(declare-fun c!119303 () Bool)

(assert (=> b!1209834 (= c!119303 (validKeyInArray!0 (select (arr!37719 lt!548788) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!133697 c!119302) b!1209830))

(assert (= (and d!133697 (not c!119302)) b!1209834))

(assert (= (and b!1209834 c!119303) b!1209833))

(assert (= (and b!1209834 (not c!119303)) b!1209831))

(assert (= (or b!1209833 b!1209831) bm!59234))

(assert (= (and d!133697 res!803834) b!1209823))

(assert (= (and b!1209823 res!803833) b!1209828))

(assert (= (and b!1209828 res!803836) b!1209829))

(assert (= (and b!1209828 c!119305) b!1209826))

(assert (= (and b!1209828 (not c!119305)) b!1209825))

(assert (= (and b!1209826 res!803835) b!1209824))

(assert (= (and b!1209825 c!119304) b!1209827))

(assert (= (and b!1209825 (not c!119304)) b!1209832))

(declare-fun b_lambda!21507 () Bool)

(assert (=> (not b_lambda!21507) (not b!1209824)))

(assert (=> b!1209824 t!39525))

(declare-fun b_and!43015 () Bool)

(assert (= b_and!43013 (and (=> t!39525 result!22131) b_and!43015)))

(declare-fun b_lambda!21509 () Bool)

(assert (=> (not b_lambda!21509) (not b!1209833)))

(assert (=> b!1209833 t!39525))

(declare-fun b_and!43017 () Bool)

(assert (= b_and!43015 (and (=> t!39525 result!22131) b_and!43017)))

(declare-fun m!1115937 () Bool)

(assert (=> b!1209823 m!1115937))

(declare-fun m!1115939 () Bool)

(assert (=> b!1209829 m!1115939))

(assert (=> b!1209829 m!1115939))

(declare-fun m!1115941 () Bool)

(assert (=> b!1209829 m!1115941))

(assert (=> b!1209826 m!1115939))

(assert (=> b!1209826 m!1115939))

(declare-fun m!1115943 () Bool)

(assert (=> b!1209826 m!1115943))

(assert (=> b!1209834 m!1115939))

(assert (=> b!1209834 m!1115939))

(assert (=> b!1209834 m!1115941))

(assert (=> b!1209833 m!1115939))

(declare-fun m!1115945 () Bool)

(assert (=> b!1209833 m!1115945))

(declare-fun m!1115947 () Bool)

(assert (=> b!1209833 m!1115947))

(declare-fun m!1115949 () Bool)

(assert (=> b!1209833 m!1115949))

(assert (=> b!1209833 m!1115947))

(declare-fun m!1115951 () Bool)

(assert (=> b!1209833 m!1115951))

(assert (=> b!1209833 m!1115623))

(assert (=> b!1209833 m!1115949))

(assert (=> b!1209833 m!1115623))

(declare-fun m!1115953 () Bool)

(assert (=> b!1209833 m!1115953))

(declare-fun m!1115955 () Bool)

(assert (=> b!1209833 m!1115955))

(declare-fun m!1115957 () Bool)

(assert (=> d!133697 m!1115957))

(assert (=> d!133697 m!1115665))

(declare-fun m!1115959 () Bool)

(assert (=> b!1209832 m!1115959))

(assert (=> b!1209824 m!1115939))

(assert (=> b!1209824 m!1115949))

(assert (=> b!1209824 m!1115623))

(assert (=> b!1209824 m!1115949))

(assert (=> b!1209824 m!1115623))

(assert (=> b!1209824 m!1115953))

(assert (=> b!1209824 m!1115939))

(declare-fun m!1115961 () Bool)

(assert (=> b!1209824 m!1115961))

(declare-fun m!1115963 () Bool)

(assert (=> b!1209827 m!1115963))

(assert (=> bm!59234 m!1115963))

(assert (=> bm!59166 d!133697))

(declare-fun d!133699 () Bool)

(declare-fun lt!548975 () ListLongMap!17749)

(assert (=> d!133699 (not (contains!6973 lt!548975 k0!934))))

(declare-fun removeStrictlySorted!98 (List!26580 (_ BitVec 64)) List!26580)

(assert (=> d!133699 (= lt!548975 (ListLongMap!17750 (removeStrictlySorted!98 (toList!8890 call!59170) k0!934)))))

(assert (=> d!133699 (= (-!1825 call!59170 k0!934) lt!548975)))

(declare-fun bs!34179 () Bool)

(assert (= bs!34179 d!133699))

(declare-fun m!1115965 () Bool)

(assert (=> bs!34179 m!1115965))

(declare-fun m!1115967 () Bool)

(assert (=> bs!34179 m!1115967))

(assert (=> b!1209524 d!133699))

(declare-fun b!1209835 () Bool)

(declare-fun e!687200 () Bool)

(assert (=> b!1209835 (= e!687200 (contains!6976 Nil!26576 (select (arr!37719 _keys!1208) from!1455)))))

(declare-fun b!1209836 () Bool)

(declare-fun e!687203 () Bool)

(declare-fun call!59238 () Bool)

(assert (=> b!1209836 (= e!687203 call!59238)))

(declare-fun b!1209837 () Bool)

(declare-fun e!687202 () Bool)

(declare-fun e!687201 () Bool)

(assert (=> b!1209837 (= e!687202 e!687201)))

(declare-fun res!803838 () Bool)

(assert (=> b!1209837 (=> (not res!803838) (not e!687201))))

(assert (=> b!1209837 (= res!803838 (not e!687200))))

(declare-fun res!803839 () Bool)

(assert (=> b!1209837 (=> (not res!803839) (not e!687200))))

(assert (=> b!1209837 (= res!803839 (validKeyInArray!0 (select (arr!37719 _keys!1208) from!1455)))))

(declare-fun d!133701 () Bool)

(declare-fun res!803837 () Bool)

(assert (=> d!133701 (=> res!803837 e!687202)))

(assert (=> d!133701 (= res!803837 (bvsge from!1455 (size!38256 _keys!1208)))))

(assert (=> d!133701 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26576) e!687202)))

(declare-fun c!119306 () Bool)

(declare-fun bm!59235 () Bool)

(assert (=> bm!59235 (= call!59238 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119306 (Cons!26575 (select (arr!37719 _keys!1208) from!1455) Nil!26576) Nil!26576)))))

(declare-fun b!1209838 () Bool)

(assert (=> b!1209838 (= e!687203 call!59238)))

(declare-fun b!1209839 () Bool)

(assert (=> b!1209839 (= e!687201 e!687203)))

(assert (=> b!1209839 (= c!119306 (validKeyInArray!0 (select (arr!37719 _keys!1208) from!1455)))))

(assert (= (and d!133701 (not res!803837)) b!1209837))

(assert (= (and b!1209837 res!803839) b!1209835))

(assert (= (and b!1209837 res!803838) b!1209839))

(assert (= (and b!1209839 c!119306) b!1209836))

(assert (= (and b!1209839 (not c!119306)) b!1209838))

(assert (= (or b!1209836 b!1209838) bm!59235))

(assert (=> b!1209835 m!1115631))

(assert (=> b!1209835 m!1115631))

(declare-fun m!1115969 () Bool)

(assert (=> b!1209835 m!1115969))

(assert (=> b!1209837 m!1115631))

(assert (=> b!1209837 m!1115631))

(declare-fun m!1115971 () Bool)

(assert (=> b!1209837 m!1115971))

(assert (=> bm!59235 m!1115631))

(declare-fun m!1115973 () Bool)

(assert (=> bm!59235 m!1115973))

(assert (=> b!1209839 m!1115631))

(assert (=> b!1209839 m!1115631))

(assert (=> b!1209839 m!1115971))

(assert (=> b!1209507 d!133701))

(declare-fun d!133703 () Bool)

(assert (=> d!133703 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26576)))

(declare-fun lt!548978 () Unit!40010)

(declare-fun choose!39 (array!78173 (_ BitVec 32) (_ BitVec 32)) Unit!40010)

(assert (=> d!133703 (= lt!548978 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133703 (bvslt (size!38256 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133703 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!548978)))

(declare-fun bs!34180 () Bool)

(assert (= bs!34180 d!133703))

(assert (=> bs!34180 m!1115655))

(declare-fun m!1115975 () Bool)

(assert (=> bs!34180 m!1115975))

(assert (=> b!1209507 d!133703))

(declare-fun d!133705 () Bool)

(declare-fun e!687206 () Bool)

(assert (=> d!133705 e!687206))

(declare-fun c!119309 () Bool)

(assert (=> d!133705 (= c!119309 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548981 () Unit!40010)

(declare-fun choose!1814 (array!78173 array!78175 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> d!133705 (= lt!548981 (choose!1814 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133705 (validMask!0 mask!1564)))

(assert (=> d!133705 (= (lemmaListMapContainsThenArrayContainsFrom!588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548981)))

(declare-fun b!1209844 () Bool)

(assert (=> b!1209844 (= e!687206 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209845 () Bool)

(assert (=> b!1209845 (= e!687206 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133705 c!119309) b!1209844))

(assert (= (and d!133705 (not c!119309)) b!1209845))

(declare-fun m!1115977 () Bool)

(assert (=> d!133705 m!1115977))

(assert (=> d!133705 m!1115665))

(assert (=> b!1209844 m!1115609))

(assert (=> b!1209507 d!133705))

(declare-fun b!1209846 () Bool)

(declare-fun res!803840 () Bool)

(declare-fun e!687212 () Bool)

(assert (=> b!1209846 (=> (not res!803840) (not e!687212))))

(declare-fun lt!548983 () ListLongMap!17749)

(assert (=> b!1209846 (= res!803840 (not (contains!6973 lt!548983 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1209847 () Bool)

(assert (=> b!1209847 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38256 lt!548788)))))

(assert (=> b!1209847 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38257 lt!548791)))))

(declare-fun e!687211 () Bool)

(assert (=> b!1209847 (= e!687211 (= (apply!975 lt!548983 (select (arr!37719 lt!548788) from!1455)) (get!19271 (select (arr!37720 lt!548791) from!1455) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1209848 () Bool)

(declare-fun e!687213 () Bool)

(declare-fun e!687209 () Bool)

(assert (=> b!1209848 (= e!687213 e!687209)))

(declare-fun c!119312 () Bool)

(assert (=> b!1209848 (= c!119312 (bvslt from!1455 (size!38256 lt!548788)))))

(declare-fun b!1209849 () Bool)

(assert (=> b!1209849 (= e!687213 e!687211)))

(assert (=> b!1209849 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38256 lt!548788)))))

(declare-fun res!803842 () Bool)

(assert (=> b!1209849 (= res!803842 (contains!6973 lt!548983 (select (arr!37719 lt!548788) from!1455)))))

(assert (=> b!1209849 (=> (not res!803842) (not e!687211))))

(declare-fun b!1209850 () Bool)

(assert (=> b!1209850 (= e!687209 (= lt!548983 (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1209851 () Bool)

(assert (=> b!1209851 (= e!687212 e!687213)))

(declare-fun c!119313 () Bool)

(declare-fun e!687208 () Bool)

(assert (=> b!1209851 (= c!119313 e!687208)))

(declare-fun res!803843 () Bool)

(assert (=> b!1209851 (=> (not res!803843) (not e!687208))))

(assert (=> b!1209851 (= res!803843 (bvslt from!1455 (size!38256 lt!548788)))))

(declare-fun b!1209852 () Bool)

(assert (=> b!1209852 (= e!687208 (validKeyInArray!0 (select (arr!37719 lt!548788) from!1455)))))

(assert (=> b!1209852 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1209853 () Bool)

(declare-fun e!687207 () ListLongMap!17749)

(assert (=> b!1209853 (= e!687207 (ListLongMap!17750 Nil!26577))))

(declare-fun b!1209854 () Bool)

(declare-fun e!687210 () ListLongMap!17749)

(declare-fun call!59239 () ListLongMap!17749)

(assert (=> b!1209854 (= e!687210 call!59239)))

(declare-fun bm!59236 () Bool)

(assert (=> bm!59236 (= call!59239 (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1209855 () Bool)

(assert (=> b!1209855 (= e!687209 (isEmpty!994 lt!548983))))

(declare-fun d!133707 () Bool)

(assert (=> d!133707 e!687212))

(declare-fun res!803841 () Bool)

(assert (=> d!133707 (=> (not res!803841) (not e!687212))))

(assert (=> d!133707 (= res!803841 (not (contains!6973 lt!548983 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133707 (= lt!548983 e!687207)))

(declare-fun c!119310 () Bool)

(assert (=> d!133707 (= c!119310 (bvsge from!1455 (size!38256 lt!548788)))))

(assert (=> d!133707 (validMask!0 mask!1564)))

(assert (=> d!133707 (= (getCurrentListMapNoExtraKeys!5352 lt!548788 lt!548791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548983)))

(declare-fun b!1209856 () Bool)

(declare-fun lt!548984 () Unit!40010)

(declare-fun lt!548987 () Unit!40010)

(assert (=> b!1209856 (= lt!548984 lt!548987)))

(declare-fun lt!548988 () ListLongMap!17749)

(declare-fun lt!548985 () (_ BitVec 64))

(declare-fun lt!548982 () V!46033)

(declare-fun lt!548986 () (_ BitVec 64))

(assert (=> b!1209856 (not (contains!6973 (+!4052 lt!548988 (tuple2!19773 lt!548985 lt!548982)) lt!548986))))

(assert (=> b!1209856 (= lt!548987 (addStillNotContains!296 lt!548988 lt!548985 lt!548982 lt!548986))))

(assert (=> b!1209856 (= lt!548986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1209856 (= lt!548982 (get!19271 (select (arr!37720 lt!548791) from!1455) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1209856 (= lt!548985 (select (arr!37719 lt!548788) from!1455))))

(assert (=> b!1209856 (= lt!548988 call!59239)))

(assert (=> b!1209856 (= e!687210 (+!4052 call!59239 (tuple2!19773 (select (arr!37719 lt!548788) from!1455) (get!19271 (select (arr!37720 lt!548791) from!1455) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1209857 () Bool)

(assert (=> b!1209857 (= e!687207 e!687210)))

(declare-fun c!119311 () Bool)

(assert (=> b!1209857 (= c!119311 (validKeyInArray!0 (select (arr!37719 lt!548788) from!1455)))))

(assert (= (and d!133707 c!119310) b!1209853))

(assert (= (and d!133707 (not c!119310)) b!1209857))

(assert (= (and b!1209857 c!119311) b!1209856))

(assert (= (and b!1209857 (not c!119311)) b!1209854))

(assert (= (or b!1209856 b!1209854) bm!59236))

(assert (= (and d!133707 res!803841) b!1209846))

(assert (= (and b!1209846 res!803840) b!1209851))

(assert (= (and b!1209851 res!803843) b!1209852))

(assert (= (and b!1209851 c!119313) b!1209849))

(assert (= (and b!1209851 (not c!119313)) b!1209848))

(assert (= (and b!1209849 res!803842) b!1209847))

(assert (= (and b!1209848 c!119312) b!1209850))

(assert (= (and b!1209848 (not c!119312)) b!1209855))

(declare-fun b_lambda!21511 () Bool)

(assert (=> (not b_lambda!21511) (not b!1209847)))

(assert (=> b!1209847 t!39525))

(declare-fun b_and!43019 () Bool)

(assert (= b_and!43017 (and (=> t!39525 result!22131) b_and!43019)))

(declare-fun b_lambda!21513 () Bool)

(assert (=> (not b_lambda!21513) (not b!1209856)))

(assert (=> b!1209856 t!39525))

(declare-fun b_and!43021 () Bool)

(assert (= b_and!43019 (and (=> t!39525 result!22131) b_and!43021)))

(declare-fun m!1115979 () Bool)

(assert (=> b!1209846 m!1115979))

(declare-fun m!1115981 () Bool)

(assert (=> b!1209852 m!1115981))

(assert (=> b!1209852 m!1115981))

(declare-fun m!1115983 () Bool)

(assert (=> b!1209852 m!1115983))

(assert (=> b!1209849 m!1115981))

(assert (=> b!1209849 m!1115981))

(declare-fun m!1115985 () Bool)

(assert (=> b!1209849 m!1115985))

(assert (=> b!1209857 m!1115981))

(assert (=> b!1209857 m!1115981))

(assert (=> b!1209857 m!1115983))

(assert (=> b!1209856 m!1115981))

(declare-fun m!1115987 () Bool)

(assert (=> b!1209856 m!1115987))

(declare-fun m!1115989 () Bool)

(assert (=> b!1209856 m!1115989))

(declare-fun m!1115991 () Bool)

(assert (=> b!1209856 m!1115991))

(assert (=> b!1209856 m!1115989))

(declare-fun m!1115993 () Bool)

(assert (=> b!1209856 m!1115993))

(assert (=> b!1209856 m!1115623))

(assert (=> b!1209856 m!1115991))

(assert (=> b!1209856 m!1115623))

(declare-fun m!1115995 () Bool)

(assert (=> b!1209856 m!1115995))

(declare-fun m!1115997 () Bool)

(assert (=> b!1209856 m!1115997))

(declare-fun m!1115999 () Bool)

(assert (=> d!133707 m!1115999))

(assert (=> d!133707 m!1115665))

(declare-fun m!1116001 () Bool)

(assert (=> b!1209855 m!1116001))

(assert (=> b!1209847 m!1115981))

(assert (=> b!1209847 m!1115991))

(assert (=> b!1209847 m!1115623))

(assert (=> b!1209847 m!1115991))

(assert (=> b!1209847 m!1115623))

(assert (=> b!1209847 m!1115995))

(assert (=> b!1209847 m!1115981))

(declare-fun m!1116003 () Bool)

(assert (=> b!1209847 m!1116003))

(declare-fun m!1116005 () Bool)

(assert (=> b!1209850 m!1116005))

(assert (=> bm!59236 m!1116005))

(assert (=> b!1209519 d!133707))

(declare-fun b!1209858 () Bool)

(declare-fun res!803844 () Bool)

(declare-fun e!687219 () Bool)

(assert (=> b!1209858 (=> (not res!803844) (not e!687219))))

(declare-fun lt!548990 () ListLongMap!17749)

(assert (=> b!1209858 (= res!803844 (not (contains!6973 lt!548990 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1209859 () Bool)

(assert (=> b!1209859 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38256 _keys!1208)))))

(assert (=> b!1209859 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38257 _values!996)))))

(declare-fun e!687218 () Bool)

(assert (=> b!1209859 (= e!687218 (= (apply!975 lt!548990 (select (arr!37719 _keys!1208) from!1455)) (get!19271 (select (arr!37720 _values!996) from!1455) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1209860 () Bool)

(declare-fun e!687220 () Bool)

(declare-fun e!687216 () Bool)

(assert (=> b!1209860 (= e!687220 e!687216)))

(declare-fun c!119316 () Bool)

(assert (=> b!1209860 (= c!119316 (bvslt from!1455 (size!38256 _keys!1208)))))

(declare-fun b!1209861 () Bool)

(assert (=> b!1209861 (= e!687220 e!687218)))

(assert (=> b!1209861 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38256 _keys!1208)))))

(declare-fun res!803846 () Bool)

(assert (=> b!1209861 (= res!803846 (contains!6973 lt!548990 (select (arr!37719 _keys!1208) from!1455)))))

(assert (=> b!1209861 (=> (not res!803846) (not e!687218))))

(declare-fun b!1209862 () Bool)

(assert (=> b!1209862 (= e!687216 (= lt!548990 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1209863 () Bool)

(assert (=> b!1209863 (= e!687219 e!687220)))

(declare-fun c!119317 () Bool)

(declare-fun e!687215 () Bool)

(assert (=> b!1209863 (= c!119317 e!687215)))

(declare-fun res!803847 () Bool)

(assert (=> b!1209863 (=> (not res!803847) (not e!687215))))

(assert (=> b!1209863 (= res!803847 (bvslt from!1455 (size!38256 _keys!1208)))))

(declare-fun b!1209864 () Bool)

(assert (=> b!1209864 (= e!687215 (validKeyInArray!0 (select (arr!37719 _keys!1208) from!1455)))))

(assert (=> b!1209864 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1209865 () Bool)

(declare-fun e!687214 () ListLongMap!17749)

(assert (=> b!1209865 (= e!687214 (ListLongMap!17750 Nil!26577))))

(declare-fun b!1209866 () Bool)

(declare-fun e!687217 () ListLongMap!17749)

(declare-fun call!59240 () ListLongMap!17749)

(assert (=> b!1209866 (= e!687217 call!59240)))

(declare-fun bm!59237 () Bool)

(assert (=> bm!59237 (= call!59240 (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1209867 () Bool)

(assert (=> b!1209867 (= e!687216 (isEmpty!994 lt!548990))))

(declare-fun d!133709 () Bool)

(assert (=> d!133709 e!687219))

(declare-fun res!803845 () Bool)

(assert (=> d!133709 (=> (not res!803845) (not e!687219))))

(assert (=> d!133709 (= res!803845 (not (contains!6973 lt!548990 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133709 (= lt!548990 e!687214)))

(declare-fun c!119314 () Bool)

(assert (=> d!133709 (= c!119314 (bvsge from!1455 (size!38256 _keys!1208)))))

(assert (=> d!133709 (validMask!0 mask!1564)))

(assert (=> d!133709 (= (getCurrentListMapNoExtraKeys!5352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548990)))

(declare-fun b!1209868 () Bool)

(declare-fun lt!548991 () Unit!40010)

(declare-fun lt!548994 () Unit!40010)

(assert (=> b!1209868 (= lt!548991 lt!548994)))

(declare-fun lt!548989 () V!46033)

(declare-fun lt!548995 () ListLongMap!17749)

(declare-fun lt!548993 () (_ BitVec 64))

(declare-fun lt!548992 () (_ BitVec 64))

(assert (=> b!1209868 (not (contains!6973 (+!4052 lt!548995 (tuple2!19773 lt!548992 lt!548989)) lt!548993))))

(assert (=> b!1209868 (= lt!548994 (addStillNotContains!296 lt!548995 lt!548992 lt!548989 lt!548993))))

(assert (=> b!1209868 (= lt!548993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1209868 (= lt!548989 (get!19271 (select (arr!37720 _values!996) from!1455) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1209868 (= lt!548992 (select (arr!37719 _keys!1208) from!1455))))

(assert (=> b!1209868 (= lt!548995 call!59240)))

(assert (=> b!1209868 (= e!687217 (+!4052 call!59240 (tuple2!19773 (select (arr!37719 _keys!1208) from!1455) (get!19271 (select (arr!37720 _values!996) from!1455) (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1209869 () Bool)

(assert (=> b!1209869 (= e!687214 e!687217)))

(declare-fun c!119315 () Bool)

(assert (=> b!1209869 (= c!119315 (validKeyInArray!0 (select (arr!37719 _keys!1208) from!1455)))))

(assert (= (and d!133709 c!119314) b!1209865))

(assert (= (and d!133709 (not c!119314)) b!1209869))

(assert (= (and b!1209869 c!119315) b!1209868))

(assert (= (and b!1209869 (not c!119315)) b!1209866))

(assert (= (or b!1209868 b!1209866) bm!59237))

(assert (= (and d!133709 res!803845) b!1209858))

(assert (= (and b!1209858 res!803844) b!1209863))

(assert (= (and b!1209863 res!803847) b!1209864))

(assert (= (and b!1209863 c!119317) b!1209861))

(assert (= (and b!1209863 (not c!119317)) b!1209860))

(assert (= (and b!1209861 res!803846) b!1209859))

(assert (= (and b!1209860 c!119316) b!1209862))

(assert (= (and b!1209860 (not c!119316)) b!1209867))

(declare-fun b_lambda!21515 () Bool)

(assert (=> (not b_lambda!21515) (not b!1209859)))

(assert (=> b!1209859 t!39525))

(declare-fun b_and!43023 () Bool)

(assert (= b_and!43021 (and (=> t!39525 result!22131) b_and!43023)))

(declare-fun b_lambda!21517 () Bool)

(assert (=> (not b_lambda!21517) (not b!1209868)))

(assert (=> b!1209868 t!39525))

(declare-fun b_and!43025 () Bool)

(assert (= b_and!43023 (and (=> t!39525 result!22131) b_and!43025)))

(declare-fun m!1116007 () Bool)

(assert (=> b!1209858 m!1116007))

(assert (=> b!1209864 m!1115631))

(assert (=> b!1209864 m!1115631))

(assert (=> b!1209864 m!1115971))

(assert (=> b!1209861 m!1115631))

(assert (=> b!1209861 m!1115631))

(declare-fun m!1116009 () Bool)

(assert (=> b!1209861 m!1116009))

(assert (=> b!1209869 m!1115631))

(assert (=> b!1209869 m!1115631))

(assert (=> b!1209869 m!1115971))

(assert (=> b!1209868 m!1115631))

(declare-fun m!1116011 () Bool)

(assert (=> b!1209868 m!1116011))

(declare-fun m!1116013 () Bool)

(assert (=> b!1209868 m!1116013))

(declare-fun m!1116015 () Bool)

(assert (=> b!1209868 m!1116015))

(assert (=> b!1209868 m!1116013))

(declare-fun m!1116017 () Bool)

(assert (=> b!1209868 m!1116017))

(assert (=> b!1209868 m!1115623))

(assert (=> b!1209868 m!1116015))

(assert (=> b!1209868 m!1115623))

(declare-fun m!1116019 () Bool)

(assert (=> b!1209868 m!1116019))

(declare-fun m!1116021 () Bool)

(assert (=> b!1209868 m!1116021))

(declare-fun m!1116023 () Bool)

(assert (=> d!133709 m!1116023))

(assert (=> d!133709 m!1115665))

(declare-fun m!1116025 () Bool)

(assert (=> b!1209867 m!1116025))

(assert (=> b!1209859 m!1115631))

(assert (=> b!1209859 m!1116015))

(assert (=> b!1209859 m!1115623))

(assert (=> b!1209859 m!1116015))

(assert (=> b!1209859 m!1115623))

(assert (=> b!1209859 m!1116019))

(assert (=> b!1209859 m!1115631))

(declare-fun m!1116027 () Bool)

(assert (=> b!1209859 m!1116027))

(declare-fun m!1116029 () Bool)

(assert (=> b!1209862 m!1116029))

(assert (=> bm!59237 m!1116029))

(assert (=> b!1209519 d!133709))

(declare-fun d!133711 () Bool)

(assert (=> d!133711 (= (array_inv!28796 _keys!1208) (bvsge (size!38256 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101142 d!133711))

(declare-fun d!133713 () Bool)

(assert (=> d!133713 (= (array_inv!28797 _values!996) (bvsge (size!38257 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101142 d!133713))

(declare-fun d!133715 () Bool)

(declare-fun e!687222 () Bool)

(assert (=> d!133715 e!687222))

(declare-fun res!803848 () Bool)

(assert (=> d!133715 (=> res!803848 e!687222)))

(declare-fun lt!548998 () Bool)

(assert (=> d!133715 (= res!803848 (not lt!548998))))

(declare-fun lt!548999 () Bool)

(assert (=> d!133715 (= lt!548998 lt!548999)))

(declare-fun lt!548997 () Unit!40010)

(declare-fun e!687221 () Unit!40010)

(assert (=> d!133715 (= lt!548997 e!687221)))

(declare-fun c!119318 () Bool)

(assert (=> d!133715 (= c!119318 lt!548999)))

(assert (=> d!133715 (= lt!548999 (containsKey!595 (toList!8890 lt!548784) k0!934))))

(assert (=> d!133715 (= (contains!6973 lt!548784 k0!934) lt!548998)))

(declare-fun b!1209870 () Bool)

(declare-fun lt!548996 () Unit!40010)

(assert (=> b!1209870 (= e!687221 lt!548996)))

(assert (=> b!1209870 (= lt!548996 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8890 lt!548784) k0!934))))

(assert (=> b!1209870 (isDefined!461 (getValueByKey!633 (toList!8890 lt!548784) k0!934))))

(declare-fun b!1209871 () Bool)

(declare-fun Unit!40020 () Unit!40010)

(assert (=> b!1209871 (= e!687221 Unit!40020)))

(declare-fun b!1209872 () Bool)

(assert (=> b!1209872 (= e!687222 (isDefined!461 (getValueByKey!633 (toList!8890 lt!548784) k0!934)))))

(assert (= (and d!133715 c!119318) b!1209870))

(assert (= (and d!133715 (not c!119318)) b!1209871))

(assert (= (and d!133715 (not res!803848)) b!1209872))

(declare-fun m!1116031 () Bool)

(assert (=> d!133715 m!1116031))

(declare-fun m!1116033 () Bool)

(assert (=> b!1209870 m!1116033))

(declare-fun m!1116035 () Bool)

(assert (=> b!1209870 m!1116035))

(assert (=> b!1209870 m!1116035))

(declare-fun m!1116037 () Bool)

(assert (=> b!1209870 m!1116037))

(assert (=> b!1209872 m!1116035))

(assert (=> b!1209872 m!1116035))

(assert (=> b!1209872 m!1116037))

(assert (=> b!1209518 d!133715))

(assert (=> b!1209518 d!133673))

(assert (=> b!1209526 d!133669))

(declare-fun mapIsEmpty!47890 () Bool)

(declare-fun mapRes!47890 () Bool)

(assert (=> mapIsEmpty!47890 mapRes!47890))

(declare-fun b!1209879 () Bool)

(declare-fun e!687228 () Bool)

(assert (=> b!1209879 (= e!687228 tp_is_empty!30679)))

(declare-fun mapNonEmpty!47890 () Bool)

(declare-fun tp!90950 () Bool)

(assert (=> mapNonEmpty!47890 (= mapRes!47890 (and tp!90950 e!687228))))

(declare-fun mapValue!47890 () ValueCell!14630)

(declare-fun mapRest!47890 () (Array (_ BitVec 32) ValueCell!14630))

(declare-fun mapKey!47890 () (_ BitVec 32))

(assert (=> mapNonEmpty!47890 (= mapRest!47881 (store mapRest!47890 mapKey!47890 mapValue!47890))))

(declare-fun b!1209880 () Bool)

(declare-fun e!687227 () Bool)

(assert (=> b!1209880 (= e!687227 tp_is_empty!30679)))

(declare-fun condMapEmpty!47890 () Bool)

(declare-fun mapDefault!47890 () ValueCell!14630)

(assert (=> mapNonEmpty!47881 (= condMapEmpty!47890 (= mapRest!47881 ((as const (Array (_ BitVec 32) ValueCell!14630)) mapDefault!47890)))))

(assert (=> mapNonEmpty!47881 (= tp!90934 (and e!687227 mapRes!47890))))

(assert (= (and mapNonEmpty!47881 condMapEmpty!47890) mapIsEmpty!47890))

(assert (= (and mapNonEmpty!47881 (not condMapEmpty!47890)) mapNonEmpty!47890))

(assert (= (and mapNonEmpty!47890 ((_ is ValueCellFull!14630) mapValue!47890)) b!1209879))

(assert (= (and mapNonEmpty!47881 ((_ is ValueCellFull!14630) mapDefault!47890)) b!1209880))

(declare-fun m!1116039 () Bool)

(assert (=> mapNonEmpty!47890 m!1116039))

(declare-fun b_lambda!21519 () Bool)

(assert (= b_lambda!21503 (or (and start!101142 b_free!25975) b_lambda!21519)))

(declare-fun b_lambda!21521 () Bool)

(assert (= b_lambda!21501 (or (and start!101142 b_free!25975) b_lambda!21521)))

(declare-fun b_lambda!21523 () Bool)

(assert (= b_lambda!21505 (or (and start!101142 b_free!25975) b_lambda!21523)))

(declare-fun b_lambda!21525 () Bool)

(assert (= b_lambda!21517 (or (and start!101142 b_free!25975) b_lambda!21525)))

(declare-fun b_lambda!21527 () Bool)

(assert (= b_lambda!21515 (or (and start!101142 b_free!25975) b_lambda!21527)))

(declare-fun b_lambda!21529 () Bool)

(assert (= b_lambda!21513 (or (and start!101142 b_free!25975) b_lambda!21529)))

(declare-fun b_lambda!21531 () Bool)

(assert (= b_lambda!21511 (or (and start!101142 b_free!25975) b_lambda!21531)))

(declare-fun b_lambda!21533 () Bool)

(assert (= b_lambda!21507 (or (and start!101142 b_free!25975) b_lambda!21533)))

(declare-fun b_lambda!21535 () Bool)

(assert (= b_lambda!21509 (or (and start!101142 b_free!25975) b_lambda!21535)))

(check-sat (not b_lambda!21531) (not b!1209844) (not b!1209806) (not b!1209808) (not b!1209795) (not b!1209810) (not d!133699) (not mapNonEmpty!47890) (not b!1209774) (not b!1209826) (not b!1209809) (not bm!59234) (not b!1209799) (not b!1209798) (not b!1209765) (not b!1209872) (not b_lambda!21521) (not b!1209855) (not b_lambda!21533) (not b!1209837) (not bm!59222) (not d!133709) (not b!1209766) (not bm!59219) b_and!43025 (not b!1209856) (not bm!59227) (not b!1209829) (not bm!59223) (not b!1209740) (not b!1209739) (not b_next!25975) (not b!1209817) (not b!1209726) (not b!1209822) (not b!1209868) (not d!133707) (not d!133697) (not b!1209824) (not d!133673) (not d!133715) (not bm!59237) (not b!1209793) (not b!1209867) (not b!1209870) (not b!1209776) (not bm!59233) (not d!133667) (not d!133691) (not b!1209862) (not bm!59226) (not b!1209864) (not b!1209779) (not b!1209769) (not b!1209869) (not d!133703) (not d!133681) (not b_lambda!21499) (not b!1209768) (not b!1209834) (not b_lambda!21523) (not b!1209781) (not b_lambda!21525) (not b_lambda!21535) (not d!133687) (not bm!59232) (not d!133695) (not b!1209734) (not bm!59235) (not b!1209727) (not b!1209827) (not d!133671) (not b!1209835) (not b!1209721) (not b!1209846) (not b_lambda!21519) (not b!1209771) (not b!1209792) (not b!1209717) (not b!1209719) (not b!1209823) (not b!1209839) (not b_lambda!21527) tp_is_empty!30679 (not b!1209850) (not b_lambda!21529) (not d!133685) (not b!1209777) (not bm!59236) (not b!1209820) (not b!1209852) (not b!1209832) (not b!1209858) (not b!1209859) (not d!133705) (not b!1209849) (not b!1209833) (not b!1209857) (not b!1209861) (not b!1209775) (not d!133689) (not b!1209847))
(check-sat b_and!43025 (not b_next!25975))
