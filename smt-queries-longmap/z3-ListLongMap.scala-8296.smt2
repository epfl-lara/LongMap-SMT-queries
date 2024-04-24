; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101322 () Bool)

(assert start!101322)

(declare-fun b_free!26047 () Bool)

(declare-fun b_next!26047 () Bool)

(assert (=> start!101322 (= b_free!26047 (not b_next!26047))))

(declare-fun tp!91159 () Bool)

(declare-fun b_and!43195 () Bool)

(assert (=> start!101322 (= tp!91159 b_and!43195)))

(declare-fun bm!60088 () Bool)

(declare-datatypes ((V!46129 0))(
  ( (V!46130 (val!15432 Int)) )
))
(declare-datatypes ((tuple2!19838 0))(
  ( (tuple2!19839 (_1!9930 (_ BitVec 64)) (_2!9930 V!46129)) )
))
(declare-datatypes ((List!26642 0))(
  ( (Nil!26639) (Cons!26638 (h!27856 tuple2!19838) (t!39661 List!26642)) )
))
(declare-datatypes ((ListLongMap!17815 0))(
  ( (ListLongMap!17816 (toList!8923 List!26642)) )
))
(declare-fun call!60098 () ListLongMap!17815)

(declare-fun call!60092 () ListLongMap!17815)

(assert (=> bm!60088 (= call!60098 call!60092)))

(declare-fun b!1213299 () Bool)

(declare-datatypes ((Unit!40144 0))(
  ( (Unit!40145) )
))
(declare-fun e!689157 () Unit!40144)

(declare-fun Unit!40146 () Unit!40144)

(assert (=> b!1213299 (= e!689157 Unit!40146)))

(declare-fun b!1213300 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!7017 (ListLongMap!17815 (_ BitVec 64)) Bool)

(assert (=> b!1213300 (contains!7017 call!60092 k0!934)))

(declare-fun lt!551151 () Unit!40144)

(declare-fun call!60094 () Unit!40144)

(assert (=> b!1213300 (= lt!551151 call!60094)))

(declare-fun call!60093 () Bool)

(assert (=> b!1213300 call!60093))

(declare-fun lt!551152 () ListLongMap!17815)

(declare-fun lt!551148 () ListLongMap!17815)

(declare-fun zeroValue!944 () V!46129)

(declare-fun +!4083 (ListLongMap!17815 tuple2!19838) ListLongMap!17815)

(assert (=> b!1213300 (= lt!551152 (+!4083 lt!551148 (tuple2!19839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551134 () Unit!40144)

(declare-fun addStillContains!1066 (ListLongMap!17815 (_ BitVec 64) V!46129 (_ BitVec 64)) Unit!40144)

(assert (=> b!1213300 (= lt!551134 (addStillContains!1066 lt!551148 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!689148 () Unit!40144)

(assert (=> b!1213300 (= e!689148 lt!551151)))

(declare-fun b!1213301 () Bool)

(declare-fun e!689147 () Bool)

(declare-fun e!689153 () Bool)

(assert (=> b!1213301 (= e!689147 (not e!689153))))

(declare-fun res!805562 () Bool)

(assert (=> b!1213301 (=> res!805562 e!689153)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213301 (= res!805562 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78321 0))(
  ( (array!78322 (arr!37790 (Array (_ BitVec 32) (_ BitVec 64))) (size!38327 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78321)

(declare-fun arrayContainsKey!0 (array!78321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213301 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551144 () Unit!40144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78321 (_ BitVec 64) (_ BitVec 32)) Unit!40144)

(assert (=> b!1213301 (= lt!551144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1213302 () Bool)

(declare-fun res!805558 () Bool)

(declare-fun e!689146 () Bool)

(assert (=> b!1213302 (=> (not res!805558) (not e!689146))))

(assert (=> b!1213302 (= res!805558 (= (select (arr!37790 _keys!1208) i!673) k0!934))))

(declare-fun b!1213303 () Bool)

(declare-fun e!689155 () Unit!40144)

(declare-fun lt!551138 () Unit!40144)

(assert (=> b!1213303 (= e!689155 lt!551138)))

(declare-fun call!60096 () Unit!40144)

(assert (=> b!1213303 (= lt!551138 call!60096)))

(declare-fun call!60097 () Bool)

(assert (=> b!1213303 call!60097))

(declare-fun b!1213304 () Bool)

(assert (=> b!1213304 (= e!689155 e!689157)))

(declare-fun c!119980 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!551139 () Bool)

(assert (=> b!1213304 (= c!119980 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551139))))

(declare-fun b!1213305 () Bool)

(declare-fun res!805570 () Bool)

(assert (=> b!1213305 (=> (not res!805570) (not e!689146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213305 (= res!805570 (validKeyInArray!0 k0!934))))

(declare-fun lt!551142 () array!78321)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!551149 () ListLongMap!17815)

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!689156 () Bool)

(declare-fun minValue!944 () V!46129)

(declare-fun b!1213306 () Bool)

(declare-datatypes ((ValueCell!14666 0))(
  ( (ValueCellFull!14666 (v!18080 V!46129)) (EmptyCell!14666) )
))
(declare-datatypes ((array!78323 0))(
  ( (array!78324 (arr!37791 (Array (_ BitVec 32) ValueCell!14666)) (size!38328 (_ BitVec 32))) )
))
(declare-fun lt!551150 () array!78323)

(declare-fun getCurrentListMapNoExtraKeys!5382 (array!78321 array!78323 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 32) Int) ListLongMap!17815)

(assert (=> b!1213306 (= e!689156 (= lt!551149 (getCurrentListMapNoExtraKeys!5382 lt!551142 lt!551150 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213307 () Bool)

(assert (=> b!1213307 (= e!689146 e!689147)))

(declare-fun res!805561 () Bool)

(assert (=> b!1213307 (=> (not res!805561) (not e!689147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78321 (_ BitVec 32)) Bool)

(assert (=> b!1213307 (= res!805561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551142 mask!1564))))

(assert (=> b!1213307 (= lt!551142 (array!78322 (store (arr!37790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38327 _keys!1208)))))

(declare-fun mapIsEmpty!47998 () Bool)

(declare-fun mapRes!47998 () Bool)

(assert (=> mapIsEmpty!47998 mapRes!47998))

(declare-fun call!60091 () ListLongMap!17815)

(declare-fun _values!996 () array!78323)

(declare-fun bm!60089 () Bool)

(assert (=> bm!60089 (= call!60091 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!805565 () Bool)

(assert (=> start!101322 (=> (not res!805565) (not e!689146))))

(assert (=> start!101322 (= res!805565 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38327 _keys!1208))))))

(assert (=> start!101322 e!689146))

(declare-fun tp_is_empty!30751 () Bool)

(assert (=> start!101322 tp_is_empty!30751))

(declare-fun array_inv!28846 (array!78321) Bool)

(assert (=> start!101322 (array_inv!28846 _keys!1208)))

(assert (=> start!101322 true))

(assert (=> start!101322 tp!91159))

(declare-fun e!689149 () Bool)

(declare-fun array_inv!28847 (array!78323) Bool)

(assert (=> start!101322 (and (array_inv!28847 _values!996) e!689149)))

(declare-fun b!1213308 () Bool)

(declare-fun e!689142 () Bool)

(assert (=> b!1213308 (= e!689142 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213309 () Bool)

(declare-fun e!689152 () Bool)

(assert (=> b!1213309 (= e!689152 tp_is_empty!30751)))

(declare-fun e!689143 () Bool)

(declare-fun b!1213310 () Bool)

(assert (=> b!1213310 (= e!689143 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551139) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213311 () Bool)

(declare-fun e!689141 () Unit!40144)

(declare-fun Unit!40147 () Unit!40144)

(assert (=> b!1213311 (= e!689141 Unit!40147)))

(assert (=> b!1213311 (= lt!551139 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119984 () Bool)

(assert (=> b!1213311 (= c!119984 (and (not lt!551139) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551136 () Unit!40144)

(assert (=> b!1213311 (= lt!551136 e!689148)))

(declare-fun lt!551132 () Unit!40144)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!614 (array!78321 array!78323 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 64) (_ BitVec 32) Int) Unit!40144)

(assert (=> b!1213311 (= lt!551132 (lemmaListMapContainsThenArrayContainsFrom!614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119983 () Bool)

(assert (=> b!1213311 (= c!119983 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805564 () Bool)

(assert (=> b!1213311 (= res!805564 e!689143)))

(assert (=> b!1213311 (=> (not res!805564) (not e!689142))))

(assert (=> b!1213311 e!689142))

(declare-fun lt!551147 () Unit!40144)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78321 (_ BitVec 32) (_ BitVec 32)) Unit!40144)

(assert (=> b!1213311 (= lt!551147 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26643 0))(
  ( (Nil!26640) (Cons!26639 (h!27857 (_ BitVec 64)) (t!39662 List!26643)) )
))
(declare-fun arrayNoDuplicates!0 (array!78321 (_ BitVec 32) List!26643) Bool)

(assert (=> b!1213311 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26640)))

(declare-fun lt!551137 () Unit!40144)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78321 (_ BitVec 64) (_ BitVec 32) List!26643) Unit!40144)

(assert (=> b!1213311 (= lt!551137 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26640))))

(assert (=> b!1213311 false))

(declare-fun b!1213312 () Bool)

(declare-fun e!689144 () Bool)

(declare-fun e!689151 () Bool)

(assert (=> b!1213312 (= e!689144 e!689151)))

(declare-fun res!805567 () Bool)

(assert (=> b!1213312 (=> res!805567 e!689151)))

(assert (=> b!1213312 (= res!805567 (not (= (select (arr!37790 _keys!1208) from!1455) k0!934)))))

(declare-fun e!689150 () Bool)

(assert (=> b!1213312 e!689150))

(declare-fun c!119981 () Bool)

(assert (=> b!1213312 (= c!119981 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551140 () Unit!40144)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1066 (array!78321 array!78323 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40144)

(assert (=> b!1213312 (= lt!551140 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213313 () Bool)

(assert (=> b!1213313 (= e!689153 e!689144)))

(declare-fun res!805572 () Bool)

(assert (=> b!1213313 (=> res!805572 e!689144)))

(assert (=> b!1213313 (= res!805572 (not (= from!1455 i!673)))))

(declare-fun lt!551153 () ListLongMap!17815)

(assert (=> b!1213313 (= lt!551153 (getCurrentListMapNoExtraKeys!5382 lt!551142 lt!551150 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551145 () V!46129)

(assert (=> b!1213313 (= lt!551150 (array!78324 (store (arr!37791 _values!996) i!673 (ValueCellFull!14666 lt!551145)) (size!38328 _values!996)))))

(declare-fun dynLambda!3298 (Int (_ BitVec 64)) V!46129)

(assert (=> b!1213313 (= lt!551145 (dynLambda!3298 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551135 () ListLongMap!17815)

(assert (=> b!1213313 (= lt!551135 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213314 () Bool)

(declare-fun res!805560 () Bool)

(assert (=> b!1213314 (=> (not res!805560) (not e!689146))))

(assert (=> b!1213314 (= res!805560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213315 () Bool)

(declare-fun call!60095 () ListLongMap!17815)

(declare-fun -!1852 (ListLongMap!17815 (_ BitVec 64)) ListLongMap!17815)

(assert (=> b!1213315 (= e!689150 (= call!60095 (-!1852 call!60091 k0!934)))))

(declare-fun b!1213316 () Bool)

(assert (=> b!1213316 (= e!689150 (= call!60095 call!60091))))

(declare-fun b!1213317 () Bool)

(assert (=> b!1213317 (= e!689149 (and e!689152 mapRes!47998))))

(declare-fun condMapEmpty!47998 () Bool)

(declare-fun mapDefault!47998 () ValueCell!14666)

(assert (=> b!1213317 (= condMapEmpty!47998 (= (arr!37791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14666)) mapDefault!47998)))))

(declare-fun b!1213318 () Bool)

(declare-fun e!689145 () Bool)

(assert (=> b!1213318 (= e!689145 tp_is_empty!30751)))

(declare-fun b!1213319 () Bool)

(assert (=> b!1213319 (= e!689143 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60090 () Bool)

(assert (=> bm!60090 (= call!60095 (getCurrentListMapNoExtraKeys!5382 lt!551142 lt!551150 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60091 () Bool)

(assert (=> bm!60091 (= call!60096 call!60094)))

(declare-fun b!1213320 () Bool)

(declare-fun res!805568 () Bool)

(assert (=> b!1213320 (=> (not res!805568) (not e!689146))))

(assert (=> b!1213320 (= res!805568 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38327 _keys!1208))))))

(declare-fun b!1213321 () Bool)

(declare-fun res!805563 () Bool)

(assert (=> b!1213321 (=> (not res!805563) (not e!689146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213321 (= res!805563 (validMask!0 mask!1564))))

(declare-fun b!1213322 () Bool)

(declare-fun res!805571 () Bool)

(assert (=> b!1213322 (=> (not res!805571) (not e!689146))))

(assert (=> b!1213322 (= res!805571 (and (= (size!38328 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38327 _keys!1208) (size!38328 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213323 () Bool)

(declare-fun c!119985 () Bool)

(assert (=> b!1213323 (= c!119985 (and (not lt!551139) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213323 (= e!689148 e!689155)))

(declare-fun b!1213324 () Bool)

(declare-fun res!805569 () Bool)

(assert (=> b!1213324 (=> (not res!805569) (not e!689146))))

(assert (=> b!1213324 (= res!805569 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26640))))

(declare-fun b!1213325 () Bool)

(assert (=> b!1213325 (= e!689151 true)))

(assert (=> b!1213325 e!689156))

(declare-fun res!805559 () Bool)

(assert (=> b!1213325 (=> (not res!805559) (not e!689156))))

(assert (=> b!1213325 (= res!805559 (= lt!551149 lt!551148))))

(assert (=> b!1213325 (= lt!551149 (-!1852 lt!551135 k0!934))))

(declare-fun lt!551133 () V!46129)

(assert (=> b!1213325 (= (-!1852 (+!4083 lt!551148 (tuple2!19839 (select (arr!37790 _keys!1208) from!1455) lt!551133)) (select (arr!37790 _keys!1208) from!1455)) lt!551148)))

(declare-fun lt!551143 () Unit!40144)

(declare-fun addThenRemoveForNewKeyIsSame!279 (ListLongMap!17815 (_ BitVec 64) V!46129) Unit!40144)

(assert (=> b!1213325 (= lt!551143 (addThenRemoveForNewKeyIsSame!279 lt!551148 (select (arr!37790 _keys!1208) from!1455) lt!551133))))

(declare-fun get!19306 (ValueCell!14666 V!46129) V!46129)

(assert (=> b!1213325 (= lt!551133 (get!19306 (select (arr!37791 _values!996) from!1455) lt!551145))))

(declare-fun lt!551146 () Unit!40144)

(assert (=> b!1213325 (= lt!551146 e!689141)))

(declare-fun c!119982 () Bool)

(assert (=> b!1213325 (= c!119982 (contains!7017 lt!551148 k0!934))))

(assert (=> b!1213325 (= lt!551148 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213326 () Bool)

(declare-fun res!805566 () Bool)

(assert (=> b!1213326 (=> (not res!805566) (not e!689147))))

(assert (=> b!1213326 (= res!805566 (arrayNoDuplicates!0 lt!551142 #b00000000000000000000000000000000 Nil!26640))))

(declare-fun b!1213327 () Bool)

(declare-fun Unit!40148 () Unit!40144)

(assert (=> b!1213327 (= e!689141 Unit!40148)))

(declare-fun bm!60092 () Bool)

(assert (=> bm!60092 (= call!60094 (addStillContains!1066 (ite c!119984 lt!551152 lt!551148) (ite c!119984 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119985 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119984 minValue!944 (ite c!119985 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!60093 () Bool)

(assert (=> bm!60093 (= call!60093 (contains!7017 (ite c!119984 lt!551152 call!60098) k0!934))))

(declare-fun bm!60094 () Bool)

(assert (=> bm!60094 (= call!60097 call!60093)))

(declare-fun b!1213328 () Bool)

(assert (=> b!1213328 call!60097))

(declare-fun lt!551141 () Unit!40144)

(assert (=> b!1213328 (= lt!551141 call!60096)))

(assert (=> b!1213328 (= e!689157 lt!551141)))

(declare-fun bm!60095 () Bool)

(assert (=> bm!60095 (= call!60092 (+!4083 (ite c!119984 lt!551152 lt!551148) (ite c!119984 (tuple2!19839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119985 (tuple2!19839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!47998 () Bool)

(declare-fun tp!91160 () Bool)

(assert (=> mapNonEmpty!47998 (= mapRes!47998 (and tp!91160 e!689145))))

(declare-fun mapValue!47998 () ValueCell!14666)

(declare-fun mapRest!47998 () (Array (_ BitVec 32) ValueCell!14666))

(declare-fun mapKey!47998 () (_ BitVec 32))

(assert (=> mapNonEmpty!47998 (= (arr!37791 _values!996) (store mapRest!47998 mapKey!47998 mapValue!47998))))

(assert (= (and start!101322 res!805565) b!1213321))

(assert (= (and b!1213321 res!805563) b!1213322))

(assert (= (and b!1213322 res!805571) b!1213314))

(assert (= (and b!1213314 res!805560) b!1213324))

(assert (= (and b!1213324 res!805569) b!1213320))

(assert (= (and b!1213320 res!805568) b!1213305))

(assert (= (and b!1213305 res!805570) b!1213302))

(assert (= (and b!1213302 res!805558) b!1213307))

(assert (= (and b!1213307 res!805561) b!1213326))

(assert (= (and b!1213326 res!805566) b!1213301))

(assert (= (and b!1213301 (not res!805562)) b!1213313))

(assert (= (and b!1213313 (not res!805572)) b!1213312))

(assert (= (and b!1213312 c!119981) b!1213315))

(assert (= (and b!1213312 (not c!119981)) b!1213316))

(assert (= (or b!1213315 b!1213316) bm!60090))

(assert (= (or b!1213315 b!1213316) bm!60089))

(assert (= (and b!1213312 (not res!805567)) b!1213325))

(assert (= (and b!1213325 c!119982) b!1213311))

(assert (= (and b!1213325 (not c!119982)) b!1213327))

(assert (= (and b!1213311 c!119984) b!1213300))

(assert (= (and b!1213311 (not c!119984)) b!1213323))

(assert (= (and b!1213323 c!119985) b!1213303))

(assert (= (and b!1213323 (not c!119985)) b!1213304))

(assert (= (and b!1213304 c!119980) b!1213328))

(assert (= (and b!1213304 (not c!119980)) b!1213299))

(assert (= (or b!1213303 b!1213328) bm!60091))

(assert (= (or b!1213303 b!1213328) bm!60088))

(assert (= (or b!1213303 b!1213328) bm!60094))

(assert (= (or b!1213300 bm!60094) bm!60093))

(assert (= (or b!1213300 bm!60091) bm!60092))

(assert (= (or b!1213300 bm!60088) bm!60095))

(assert (= (and b!1213311 c!119983) b!1213319))

(assert (= (and b!1213311 (not c!119983)) b!1213310))

(assert (= (and b!1213311 res!805564) b!1213308))

(assert (= (and b!1213325 res!805559) b!1213306))

(assert (= (and b!1213317 condMapEmpty!47998) mapIsEmpty!47998))

(assert (= (and b!1213317 (not condMapEmpty!47998)) mapNonEmpty!47998))

(get-info :version)

(assert (= (and mapNonEmpty!47998 ((_ is ValueCellFull!14666) mapValue!47998)) b!1213318))

(assert (= (and b!1213317 ((_ is ValueCellFull!14666) mapDefault!47998)) b!1213309))

(assert (= start!101322 b!1213317))

(declare-fun b_lambda!21679 () Bool)

(assert (=> (not b_lambda!21679) (not b!1213313)))

(declare-fun t!39660 () Bool)

(declare-fun tb!10839 () Bool)

(assert (=> (and start!101322 (= defaultEntry!1004 defaultEntry!1004) t!39660) tb!10839))

(declare-fun result!22281 () Bool)

(assert (=> tb!10839 (= result!22281 tp_is_empty!30751)))

(assert (=> b!1213313 t!39660))

(declare-fun b_and!43197 () Bool)

(assert (= b_and!43195 (and (=> t!39660 result!22281) b_and!43197)))

(declare-fun m!1118979 () Bool)

(assert (=> b!1213308 m!1118979))

(declare-fun m!1118981 () Bool)

(assert (=> b!1213301 m!1118981))

(declare-fun m!1118983 () Bool)

(assert (=> b!1213301 m!1118983))

(declare-fun m!1118985 () Bool)

(assert (=> b!1213326 m!1118985))

(declare-fun m!1118987 () Bool)

(assert (=> b!1213306 m!1118987))

(declare-fun m!1118989 () Bool)

(assert (=> b!1213311 m!1118989))

(declare-fun m!1118991 () Bool)

(assert (=> b!1213311 m!1118991))

(declare-fun m!1118993 () Bool)

(assert (=> b!1213311 m!1118993))

(declare-fun m!1118995 () Bool)

(assert (=> b!1213311 m!1118995))

(declare-fun m!1118997 () Bool)

(assert (=> b!1213325 m!1118997))

(declare-fun m!1118999 () Bool)

(assert (=> b!1213325 m!1118999))

(declare-fun m!1119001 () Bool)

(assert (=> b!1213325 m!1119001))

(assert (=> b!1213325 m!1118999))

(declare-fun m!1119003 () Bool)

(assert (=> b!1213325 m!1119003))

(declare-fun m!1119005 () Bool)

(assert (=> b!1213325 m!1119005))

(declare-fun m!1119007 () Bool)

(assert (=> b!1213325 m!1119007))

(declare-fun m!1119009 () Bool)

(assert (=> b!1213325 m!1119009))

(assert (=> b!1213325 m!1119005))

(declare-fun m!1119011 () Bool)

(assert (=> b!1213325 m!1119011))

(assert (=> b!1213325 m!1119011))

(assert (=> b!1213325 m!1119005))

(declare-fun m!1119013 () Bool)

(assert (=> b!1213325 m!1119013))

(declare-fun m!1119015 () Bool)

(assert (=> bm!60095 m!1119015))

(declare-fun m!1119017 () Bool)

(assert (=> bm!60093 m!1119017))

(declare-fun m!1119019 () Bool)

(assert (=> start!101322 m!1119019))

(declare-fun m!1119021 () Bool)

(assert (=> start!101322 m!1119021))

(declare-fun m!1119023 () Bool)

(assert (=> b!1213300 m!1119023))

(declare-fun m!1119025 () Bool)

(assert (=> b!1213300 m!1119025))

(declare-fun m!1119027 () Bool)

(assert (=> b!1213300 m!1119027))

(declare-fun m!1119029 () Bool)

(assert (=> b!1213315 m!1119029))

(declare-fun m!1119031 () Bool)

(assert (=> b!1213305 m!1119031))

(declare-fun m!1119033 () Bool)

(assert (=> mapNonEmpty!47998 m!1119033))

(declare-fun m!1119035 () Bool)

(assert (=> b!1213314 m!1119035))

(assert (=> b!1213312 m!1119005))

(declare-fun m!1119037 () Bool)

(assert (=> b!1213312 m!1119037))

(declare-fun m!1119039 () Bool)

(assert (=> b!1213313 m!1119039))

(declare-fun m!1119041 () Bool)

(assert (=> b!1213313 m!1119041))

(declare-fun m!1119043 () Bool)

(assert (=> b!1213313 m!1119043))

(declare-fun m!1119045 () Bool)

(assert (=> b!1213313 m!1119045))

(declare-fun m!1119047 () Bool)

(assert (=> bm!60092 m!1119047))

(declare-fun m!1119049 () Bool)

(assert (=> b!1213321 m!1119049))

(assert (=> bm!60090 m!1118987))

(declare-fun m!1119051 () Bool)

(assert (=> b!1213307 m!1119051))

(declare-fun m!1119053 () Bool)

(assert (=> b!1213307 m!1119053))

(assert (=> b!1213319 m!1118979))

(assert (=> bm!60089 m!1118997))

(declare-fun m!1119055 () Bool)

(assert (=> b!1213302 m!1119055))

(declare-fun m!1119057 () Bool)

(assert (=> b!1213324 m!1119057))

(check-sat (not b!1213306) (not b!1213313) (not bm!60093) (not b!1213319) (not b!1213300) (not bm!60089) (not b!1213321) (not b!1213311) (not b!1213308) (not b!1213315) b_and!43197 (not bm!60092) (not b!1213325) (not start!101322) (not b!1213324) (not b_next!26047) (not b!1213305) (not b!1213307) (not b_lambda!21679) (not b!1213312) (not bm!60090) (not mapNonEmpty!47998) (not b!1213301) tp_is_empty!30751 (not b!1213326) (not bm!60095) (not b!1213314))
(check-sat b_and!43197 (not b_next!26047))
