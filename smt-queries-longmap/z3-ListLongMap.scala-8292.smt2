; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101026 () Bool)

(assert start!101026)

(declare-fun b_free!26025 () Bool)

(declare-fun b_next!26025 () Bool)

(assert (=> start!101026 (= b_free!26025 (not b_next!26025))))

(declare-fun tp!91091 () Bool)

(declare-fun b_and!43131 () Bool)

(assert (=> start!101026 (= tp!91091 b_and!43131)))

(declare-fun b!1210837 () Bool)

(declare-datatypes ((Unit!40143 0))(
  ( (Unit!40144) )
))
(declare-fun e!687660 () Unit!40143)

(declare-fun e!687659 () Unit!40143)

(assert (=> b!1210837 (= e!687660 e!687659)))

(declare-fun c!119339 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!549840 () Bool)

(assert (=> b!1210837 (= c!119339 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549840))))

(declare-fun b!1210838 () Bool)

(declare-fun e!687662 () Bool)

(declare-fun e!687661 () Bool)

(assert (=> b!1210838 (= e!687662 e!687661)))

(declare-fun res!804510 () Bool)

(assert (=> b!1210838 (=> res!804510 e!687661)))

(declare-datatypes ((array!78243 0))(
  ( (array!78244 (arr!37758 (Array (_ BitVec 32) (_ BitVec 64))) (size!38294 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78243)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1210838 (= res!804510 (not (= (select (arr!37758 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687648 () Bool)

(assert (=> b!1210838 e!687648))

(declare-fun c!119337 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210838 (= c!119337 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!46099 0))(
  ( (V!46100 (val!15421 Int)) )
))
(declare-fun zeroValue!944 () V!46099)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14655 0))(
  ( (ValueCellFull!14655 (v!18072 V!46099)) (EmptyCell!14655) )
))
(declare-datatypes ((array!78245 0))(
  ( (array!78246 (arr!37759 (Array (_ BitVec 32) ValueCell!14655)) (size!38295 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78245)

(declare-fun lt!549827 () Unit!40143)

(declare-fun minValue!944 () V!46099)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1062 (array!78243 array!78245 (_ BitVec 32) (_ BitVec 32) V!46099 V!46099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40143)

(assert (=> b!1210838 (= lt!549827 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210839 () Bool)

(declare-fun res!804508 () Bool)

(declare-fun e!687651 () Bool)

(assert (=> b!1210839 (=> (not res!804508) (not e!687651))))

(assert (=> b!1210839 (= res!804508 (and (= (size!38295 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38294 _keys!1208) (size!38295 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210840 () Bool)

(declare-fun res!804505 () Bool)

(assert (=> b!1210840 (=> (not res!804505) (not e!687651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210840 (= res!804505 (validMask!0 mask!1564))))

(declare-fun bm!59738 () Bool)

(declare-datatypes ((tuple2!19806 0))(
  ( (tuple2!19807 (_1!9914 (_ BitVec 64)) (_2!9914 V!46099)) )
))
(declare-datatypes ((List!26607 0))(
  ( (Nil!26604) (Cons!26603 (h!27812 tuple2!19806) (t!39612 List!26607)) )
))
(declare-datatypes ((ListLongMap!17775 0))(
  ( (ListLongMap!17776 (toList!8903 List!26607)) )
))
(declare-fun call!59748 () ListLongMap!17775)

(declare-fun call!59741 () ListLongMap!17775)

(assert (=> bm!59738 (= call!59748 call!59741)))

(declare-fun b!1210841 () Bool)

(declare-fun e!687657 () Unit!40143)

(declare-fun Unit!40145 () Unit!40143)

(assert (=> b!1210841 (= e!687657 Unit!40145)))

(declare-fun b!1210842 () Bool)

(declare-fun e!687647 () Bool)

(assert (=> b!1210842 (= e!687647 e!687662)))

(declare-fun res!804500 () Bool)

(assert (=> b!1210842 (=> res!804500 e!687662)))

(assert (=> b!1210842 (= res!804500 (not (= from!1455 i!673)))))

(declare-fun lt!549845 () array!78245)

(declare-fun lt!549835 () array!78243)

(declare-fun lt!549843 () ListLongMap!17775)

(declare-fun getCurrentListMapNoExtraKeys!5335 (array!78243 array!78245 (_ BitVec 32) (_ BitVec 32) V!46099 V!46099 (_ BitVec 32) Int) ListLongMap!17775)

(assert (=> b!1210842 (= lt!549843 (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!549847 () V!46099)

(assert (=> b!1210842 (= lt!549845 (array!78246 (store (arr!37759 _values!996) i!673 (ValueCellFull!14655 lt!549847)) (size!38295 _values!996)))))

(declare-fun dynLambda!3232 (Int (_ BitVec 64)) V!46099)

(assert (=> b!1210842 (= lt!549847 (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!549841 () ListLongMap!17775)

(assert (=> b!1210842 (= lt!549841 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59739 () Bool)

(declare-fun call!59744 () Bool)

(declare-fun call!59743 () Bool)

(assert (=> bm!59739 (= call!59744 call!59743)))

(declare-fun b!1210843 () Bool)

(declare-fun lt!549830 () ListLongMap!17775)

(declare-fun -!1852 (ListLongMap!17775 (_ BitVec 64)) ListLongMap!17775)

(assert (=> b!1210843 (= e!687661 (= (-!1852 lt!549841 k0!934) lt!549830))))

(declare-fun lt!549837 () V!46099)

(declare-fun +!4021 (ListLongMap!17775 tuple2!19806) ListLongMap!17775)

(assert (=> b!1210843 (= (-!1852 (+!4021 lt!549830 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)) (select (arr!37758 _keys!1208) from!1455)) lt!549830)))

(declare-fun lt!549832 () Unit!40143)

(declare-fun addThenRemoveForNewKeyIsSame!270 (ListLongMap!17775 (_ BitVec 64) V!46099) Unit!40143)

(assert (=> b!1210843 (= lt!549832 (addThenRemoveForNewKeyIsSame!270 lt!549830 (select (arr!37758 _keys!1208) from!1455) lt!549837))))

(declare-fun get!19237 (ValueCell!14655 V!46099) V!46099)

(assert (=> b!1210843 (= lt!549837 (get!19237 (select (arr!37759 _values!996) from!1455) lt!549847))))

(declare-fun lt!549834 () Unit!40143)

(assert (=> b!1210843 (= lt!549834 e!687657)))

(declare-fun c!119340 () Bool)

(declare-fun contains!6974 (ListLongMap!17775 (_ BitVec 64)) Bool)

(assert (=> b!1210843 (= c!119340 (contains!6974 lt!549830 k0!934))))

(assert (=> b!1210843 (= lt!549830 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!687653 () Bool)

(declare-fun b!1210844 () Bool)

(declare-fun arrayContainsKey!0 (array!78243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210844 (= e!687653 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210845 () Bool)

(declare-fun e!687655 () Bool)

(declare-fun tp_is_empty!30729 () Bool)

(assert (=> b!1210845 (= e!687655 tp_is_empty!30729)))

(declare-fun b!1210846 () Bool)

(declare-fun res!804506 () Bool)

(assert (=> b!1210846 (=> (not res!804506) (not e!687651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210846 (= res!804506 (validKeyInArray!0 k0!934))))

(declare-fun bm!59740 () Bool)

(declare-fun lt!549833 () ListLongMap!17775)

(declare-fun c!119341 () Bool)

(declare-fun c!119338 () Bool)

(assert (=> bm!59740 (= call!59741 (+!4021 (ite c!119341 lt!549833 lt!549830) (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210847 () Bool)

(assert (=> b!1210847 (= c!119338 (and (not lt!549840) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687658 () Unit!40143)

(assert (=> b!1210847 (= e!687658 e!687660)))

(declare-fun b!1210848 () Bool)

(declare-fun res!804503 () Bool)

(assert (=> b!1210848 (=> (not res!804503) (not e!687651))))

(assert (=> b!1210848 (= res!804503 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38294 _keys!1208))))))

(declare-fun b!1210849 () Bool)

(assert (=> b!1210849 call!59744))

(declare-fun lt!549836 () Unit!40143)

(declare-fun call!59745 () Unit!40143)

(assert (=> b!1210849 (= lt!549836 call!59745)))

(assert (=> b!1210849 (= e!687659 lt!549836)))

(declare-fun b!1210850 () Bool)

(declare-fun res!804498 () Bool)

(assert (=> b!1210850 (=> (not res!804498) (not e!687651))))

(declare-datatypes ((List!26608 0))(
  ( (Nil!26605) (Cons!26604 (h!27813 (_ BitVec 64)) (t!39613 List!26608)) )
))
(declare-fun arrayNoDuplicates!0 (array!78243 (_ BitVec 32) List!26608) Bool)

(assert (=> b!1210850 (= res!804498 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26605))))

(declare-fun b!1210851 () Bool)

(declare-fun Unit!40146 () Unit!40143)

(assert (=> b!1210851 (= e!687657 Unit!40146)))

(assert (=> b!1210851 (= lt!549840 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210851 (= c!119341 (and (not lt!549840) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549844 () Unit!40143)

(assert (=> b!1210851 (= lt!549844 e!687658)))

(declare-fun lt!549839 () Unit!40143)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!600 (array!78243 array!78245 (_ BitVec 32) (_ BitVec 32) V!46099 V!46099 (_ BitVec 64) (_ BitVec 32) Int) Unit!40143)

(assert (=> b!1210851 (= lt!549839 (lemmaListMapContainsThenArrayContainsFrom!600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119342 () Bool)

(assert (=> b!1210851 (= c!119342 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804501 () Bool)

(declare-fun e!687656 () Bool)

(assert (=> b!1210851 (= res!804501 e!687656)))

(assert (=> b!1210851 (=> (not res!804501) (not e!687653))))

(assert (=> b!1210851 e!687653))

(declare-fun lt!549846 () Unit!40143)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78243 (_ BitVec 32) (_ BitVec 32)) Unit!40143)

(assert (=> b!1210851 (= lt!549846 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210851 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26605)))

(declare-fun lt!549831 () Unit!40143)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78243 (_ BitVec 64) (_ BitVec 32) List!26608) Unit!40143)

(assert (=> b!1210851 (= lt!549831 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26605))))

(assert (=> b!1210851 false))

(declare-fun b!1210852 () Bool)

(declare-fun lt!549829 () Unit!40143)

(assert (=> b!1210852 (= e!687660 lt!549829)))

(assert (=> b!1210852 (= lt!549829 call!59745)))

(assert (=> b!1210852 call!59744))

(declare-fun b!1210853 () Bool)

(assert (=> b!1210853 (= e!687656 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210854 () Bool)

(declare-fun e!687649 () Bool)

(declare-fun e!687652 () Bool)

(declare-fun mapRes!47962 () Bool)

(assert (=> b!1210854 (= e!687649 (and e!687652 mapRes!47962))))

(declare-fun condMapEmpty!47962 () Bool)

(declare-fun mapDefault!47962 () ValueCell!14655)

(assert (=> b!1210854 (= condMapEmpty!47962 (= (arr!37759 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14655)) mapDefault!47962)))))

(declare-fun call!59747 () ListLongMap!17775)

(declare-fun b!1210855 () Bool)

(declare-fun call!59742 () ListLongMap!17775)

(assert (=> b!1210855 (= e!687648 (= call!59742 (-!1852 call!59747 k0!934)))))

(declare-fun mapIsEmpty!47962 () Bool)

(assert (=> mapIsEmpty!47962 mapRes!47962))

(declare-fun b!1210856 () Bool)

(assert (=> b!1210856 (= e!687652 tp_is_empty!30729)))

(declare-fun b!1210857 () Bool)

(assert (=> b!1210857 (= e!687648 (= call!59742 call!59747))))

(declare-fun b!1210858 () Bool)

(declare-fun res!804507 () Bool)

(declare-fun e!687654 () Bool)

(assert (=> b!1210858 (=> (not res!804507) (not e!687654))))

(assert (=> b!1210858 (= res!804507 (arrayNoDuplicates!0 lt!549835 #b00000000000000000000000000000000 Nil!26605))))

(declare-fun bm!59741 () Bool)

(assert (=> bm!59741 (= call!59747 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!59746 () Unit!40143)

(declare-fun bm!59742 () Bool)

(declare-fun addStillContains!1049 (ListLongMap!17775 (_ BitVec 64) V!46099 (_ BitVec 64)) Unit!40143)

(assert (=> bm!59742 (= call!59746 (addStillContains!1049 (ite c!119341 lt!549833 lt!549830) (ite c!119341 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119338 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119341 minValue!944 (ite c!119338 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1210859 () Bool)

(assert (=> b!1210859 (= e!687654 (not e!687647))))

(declare-fun res!804502 () Bool)

(assert (=> b!1210859 (=> res!804502 e!687647)))

(assert (=> b!1210859 (= res!804502 (bvsgt from!1455 i!673))))

(assert (=> b!1210859 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549842 () Unit!40143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78243 (_ BitVec 64) (_ BitVec 32)) Unit!40143)

(assert (=> b!1210859 (= lt!549842 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1210860 () Bool)

(declare-fun Unit!40147 () Unit!40143)

(assert (=> b!1210860 (= e!687659 Unit!40147)))

(declare-fun bm!59743 () Bool)

(assert (=> bm!59743 (= call!59743 (contains!6974 (ite c!119341 lt!549833 call!59748) k0!934))))

(declare-fun b!1210861 () Bool)

(declare-fun res!804497 () Bool)

(assert (=> b!1210861 (=> (not res!804497) (not e!687651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78243 (_ BitVec 32)) Bool)

(assert (=> b!1210861 (= res!804497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59744 () Bool)

(assert (=> bm!59744 (= call!59742 (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59745 () Bool)

(assert (=> bm!59745 (= call!59745 call!59746)))

(declare-fun res!804509 () Bool)

(assert (=> start!101026 (=> (not res!804509) (not e!687651))))

(assert (=> start!101026 (= res!804509 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38294 _keys!1208))))))

(assert (=> start!101026 e!687651))

(assert (=> start!101026 tp_is_empty!30729))

(declare-fun array_inv!28760 (array!78243) Bool)

(assert (=> start!101026 (array_inv!28760 _keys!1208)))

(assert (=> start!101026 true))

(assert (=> start!101026 tp!91091))

(declare-fun array_inv!28761 (array!78245) Bool)

(assert (=> start!101026 (and (array_inv!28761 _values!996) e!687649)))

(declare-fun b!1210862 () Bool)

(declare-fun res!804504 () Bool)

(assert (=> b!1210862 (=> (not res!804504) (not e!687651))))

(assert (=> b!1210862 (= res!804504 (= (select (arr!37758 _keys!1208) i!673) k0!934))))

(declare-fun b!1210863 () Bool)

(assert (=> b!1210863 (contains!6974 call!59741 k0!934)))

(declare-fun lt!549838 () Unit!40143)

(assert (=> b!1210863 (= lt!549838 call!59746)))

(assert (=> b!1210863 call!59743))

(assert (=> b!1210863 (= lt!549833 (+!4021 lt!549830 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549828 () Unit!40143)

(assert (=> b!1210863 (= lt!549828 (addStillContains!1049 lt!549830 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1210863 (= e!687658 lt!549838)))

(declare-fun b!1210864 () Bool)

(assert (=> b!1210864 (= e!687656 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549840) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!47962 () Bool)

(declare-fun tp!91090 () Bool)

(assert (=> mapNonEmpty!47962 (= mapRes!47962 (and tp!91090 e!687655))))

(declare-fun mapValue!47962 () ValueCell!14655)

(declare-fun mapKey!47962 () (_ BitVec 32))

(declare-fun mapRest!47962 () (Array (_ BitVec 32) ValueCell!14655))

(assert (=> mapNonEmpty!47962 (= (arr!37759 _values!996) (store mapRest!47962 mapKey!47962 mapValue!47962))))

(declare-fun b!1210865 () Bool)

(assert (=> b!1210865 (= e!687651 e!687654)))

(declare-fun res!804499 () Bool)

(assert (=> b!1210865 (=> (not res!804499) (not e!687654))))

(assert (=> b!1210865 (= res!804499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549835 mask!1564))))

(assert (=> b!1210865 (= lt!549835 (array!78244 (store (arr!37758 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38294 _keys!1208)))))

(assert (= (and start!101026 res!804509) b!1210840))

(assert (= (and b!1210840 res!804505) b!1210839))

(assert (= (and b!1210839 res!804508) b!1210861))

(assert (= (and b!1210861 res!804497) b!1210850))

(assert (= (and b!1210850 res!804498) b!1210848))

(assert (= (and b!1210848 res!804503) b!1210846))

(assert (= (and b!1210846 res!804506) b!1210862))

(assert (= (and b!1210862 res!804504) b!1210865))

(assert (= (and b!1210865 res!804499) b!1210858))

(assert (= (and b!1210858 res!804507) b!1210859))

(assert (= (and b!1210859 (not res!804502)) b!1210842))

(assert (= (and b!1210842 (not res!804500)) b!1210838))

(assert (= (and b!1210838 c!119337) b!1210855))

(assert (= (and b!1210838 (not c!119337)) b!1210857))

(assert (= (or b!1210855 b!1210857) bm!59744))

(assert (= (or b!1210855 b!1210857) bm!59741))

(assert (= (and b!1210838 (not res!804510)) b!1210843))

(assert (= (and b!1210843 c!119340) b!1210851))

(assert (= (and b!1210843 (not c!119340)) b!1210841))

(assert (= (and b!1210851 c!119341) b!1210863))

(assert (= (and b!1210851 (not c!119341)) b!1210847))

(assert (= (and b!1210847 c!119338) b!1210852))

(assert (= (and b!1210847 (not c!119338)) b!1210837))

(assert (= (and b!1210837 c!119339) b!1210849))

(assert (= (and b!1210837 (not c!119339)) b!1210860))

(assert (= (or b!1210852 b!1210849) bm!59745))

(assert (= (or b!1210852 b!1210849) bm!59738))

(assert (= (or b!1210852 b!1210849) bm!59739))

(assert (= (or b!1210863 bm!59739) bm!59743))

(assert (= (or b!1210863 bm!59745) bm!59742))

(assert (= (or b!1210863 bm!59738) bm!59740))

(assert (= (and b!1210851 c!119342) b!1210853))

(assert (= (and b!1210851 (not c!119342)) b!1210864))

(assert (= (and b!1210851 res!804501) b!1210844))

(assert (= (and b!1210854 condMapEmpty!47962) mapIsEmpty!47962))

(assert (= (and b!1210854 (not condMapEmpty!47962)) mapNonEmpty!47962))

(get-info :version)

(assert (= (and mapNonEmpty!47962 ((_ is ValueCellFull!14655) mapValue!47962)) b!1210845))

(assert (= (and b!1210854 ((_ is ValueCellFull!14655) mapDefault!47962)) b!1210856))

(assert (= start!101026 b!1210854))

(declare-fun b_lambda!21625 () Bool)

(assert (=> (not b_lambda!21625) (not b!1210842)))

(declare-fun t!39611 () Bool)

(declare-fun tb!10825 () Bool)

(assert (=> (and start!101026 (= defaultEntry!1004 defaultEntry!1004) t!39611) tb!10825))

(declare-fun result!22243 () Bool)

(assert (=> tb!10825 (= result!22243 tp_is_empty!30729)))

(assert (=> b!1210842 t!39611))

(declare-fun b_and!43133 () Bool)

(assert (= b_and!43131 (and (=> t!39611 result!22243) b_and!43133)))

(declare-fun m!1116261 () Bool)

(assert (=> b!1210853 m!1116261))

(declare-fun m!1116263 () Bool)

(assert (=> bm!59741 m!1116263))

(declare-fun m!1116265 () Bool)

(assert (=> bm!59743 m!1116265))

(declare-fun m!1116267 () Bool)

(assert (=> b!1210840 m!1116267))

(declare-fun m!1116269 () Bool)

(assert (=> start!101026 m!1116269))

(declare-fun m!1116271 () Bool)

(assert (=> start!101026 m!1116271))

(declare-fun m!1116273 () Bool)

(assert (=> b!1210846 m!1116273))

(declare-fun m!1116275 () Bool)

(assert (=> bm!59742 m!1116275))

(assert (=> b!1210844 m!1116261))

(declare-fun m!1116277 () Bool)

(assert (=> b!1210858 m!1116277))

(declare-fun m!1116279 () Bool)

(assert (=> bm!59740 m!1116279))

(declare-fun m!1116281 () Bool)

(assert (=> b!1210865 m!1116281))

(declare-fun m!1116283 () Bool)

(assert (=> b!1210865 m!1116283))

(declare-fun m!1116285 () Bool)

(assert (=> b!1210861 m!1116285))

(declare-fun m!1116287 () Bool)

(assert (=> bm!59744 m!1116287))

(declare-fun m!1116289 () Bool)

(assert (=> b!1210838 m!1116289))

(declare-fun m!1116291 () Bool)

(assert (=> b!1210838 m!1116291))

(declare-fun m!1116293 () Bool)

(assert (=> b!1210842 m!1116293))

(declare-fun m!1116295 () Bool)

(assert (=> b!1210842 m!1116295))

(declare-fun m!1116297 () Bool)

(assert (=> b!1210842 m!1116297))

(declare-fun m!1116299 () Bool)

(assert (=> b!1210842 m!1116299))

(declare-fun m!1116301 () Bool)

(assert (=> b!1210855 m!1116301))

(declare-fun m!1116303 () Bool)

(assert (=> b!1210851 m!1116303))

(declare-fun m!1116305 () Bool)

(assert (=> b!1210851 m!1116305))

(declare-fun m!1116307 () Bool)

(assert (=> b!1210851 m!1116307))

(declare-fun m!1116309 () Bool)

(assert (=> b!1210851 m!1116309))

(assert (=> b!1210843 m!1116263))

(declare-fun m!1116311 () Bool)

(assert (=> b!1210843 m!1116311))

(declare-fun m!1116313 () Bool)

(assert (=> b!1210843 m!1116313))

(assert (=> b!1210843 m!1116289))

(declare-fun m!1116315 () Bool)

(assert (=> b!1210843 m!1116315))

(declare-fun m!1116317 () Bool)

(assert (=> b!1210843 m!1116317))

(declare-fun m!1116319 () Bool)

(assert (=> b!1210843 m!1116319))

(assert (=> b!1210843 m!1116313))

(declare-fun m!1116321 () Bool)

(assert (=> b!1210843 m!1116321))

(assert (=> b!1210843 m!1116289))

(assert (=> b!1210843 m!1116317))

(assert (=> b!1210843 m!1116289))

(declare-fun m!1116323 () Bool)

(assert (=> b!1210843 m!1116323))

(declare-fun m!1116325 () Bool)

(assert (=> b!1210863 m!1116325))

(declare-fun m!1116327 () Bool)

(assert (=> b!1210863 m!1116327))

(declare-fun m!1116329 () Bool)

(assert (=> b!1210863 m!1116329))

(declare-fun m!1116331 () Bool)

(assert (=> b!1210850 m!1116331))

(declare-fun m!1116333 () Bool)

(assert (=> b!1210862 m!1116333))

(declare-fun m!1116335 () Bool)

(assert (=> b!1210859 m!1116335))

(declare-fun m!1116337 () Bool)

(assert (=> b!1210859 m!1116337))

(declare-fun m!1116339 () Bool)

(assert (=> mapNonEmpty!47962 m!1116339))

(check-sat (not b!1210838) (not b!1210865) b_and!43133 (not b!1210863) (not b!1210858) (not b_next!26025) (not start!101026) (not bm!59743) tp_is_empty!30729 (not b!1210853) (not b!1210844) (not b!1210851) (not bm!59741) (not b!1210861) (not b!1210859) (not b!1210850) (not b!1210840) (not mapNonEmpty!47962) (not b!1210842) (not b_lambda!21625) (not b!1210846) (not bm!59744) (not bm!59742) (not b!1210843) (not b!1210855) (not bm!59740))
(check-sat b_and!43133 (not b_next!26025))
(get-model)

(declare-fun b_lambda!21629 () Bool)

(assert (= b_lambda!21625 (or (and start!101026 b_free!26025) b_lambda!21629)))

(check-sat (not b!1210838) (not b!1210865) b_and!43133 (not b!1210863) (not b!1210858) (not b_next!26025) (not start!101026) (not bm!59743) (not b_lambda!21629) tp_is_empty!30729 (not b!1210842) (not b!1210853) (not b!1210844) (not b!1210851) (not bm!59741) (not b!1210861) (not b!1210859) (not b!1210850) (not b!1210840) (not mapNonEmpty!47962) (not b!1210846) (not bm!59744) (not bm!59742) (not b!1210843) (not b!1210855) (not bm!59740))
(check-sat b_and!43133 (not b_next!26025))
(get-model)

(declare-fun d!133353 () Bool)

(declare-fun res!804557 () Bool)

(declare-fun e!687715 () Bool)

(assert (=> d!133353 (=> res!804557 e!687715)))

(assert (=> d!133353 (= res!804557 (= (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133353 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!687715)))

(declare-fun b!1210961 () Bool)

(declare-fun e!687716 () Bool)

(assert (=> b!1210961 (= e!687715 e!687716)))

(declare-fun res!804558 () Bool)

(assert (=> b!1210961 (=> (not res!804558) (not e!687716))))

(assert (=> b!1210961 (= res!804558 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38294 _keys!1208)))))

(declare-fun b!1210962 () Bool)

(assert (=> b!1210962 (= e!687716 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133353 (not res!804557)) b!1210961))

(assert (= (and b!1210961 res!804558) b!1210962))

(declare-fun m!1116421 () Bool)

(assert (=> d!133353 m!1116421))

(declare-fun m!1116423 () Bool)

(assert (=> b!1210962 m!1116423))

(assert (=> b!1210844 d!133353))

(declare-fun d!133355 () Bool)

(assert (=> d!133355 (= (array_inv!28760 _keys!1208) (bvsge (size!38294 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101026 d!133355))

(declare-fun d!133357 () Bool)

(assert (=> d!133357 (= (array_inv!28761 _values!996) (bvsge (size!38295 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101026 d!133357))

(declare-fun b!1210971 () Bool)

(declare-fun e!687724 () Bool)

(declare-fun call!59775 () Bool)

(assert (=> b!1210971 (= e!687724 call!59775)))

(declare-fun b!1210972 () Bool)

(declare-fun e!687723 () Bool)

(assert (=> b!1210972 (= e!687723 e!687724)))

(declare-fun lt!549917 () (_ BitVec 64))

(assert (=> b!1210972 (= lt!549917 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!549918 () Unit!40143)

(assert (=> b!1210972 (= lt!549918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!549917 #b00000000000000000000000000000000))))

(assert (=> b!1210972 (arrayContainsKey!0 _keys!1208 lt!549917 #b00000000000000000000000000000000)))

(declare-fun lt!549919 () Unit!40143)

(assert (=> b!1210972 (= lt!549919 lt!549918)))

(declare-fun res!804563 () Bool)

(declare-datatypes ((SeekEntryResult!9941 0))(
  ( (MissingZero!9941 (index!42135 (_ BitVec 32))) (Found!9941 (index!42136 (_ BitVec 32))) (Intermediate!9941 (undefined!10753 Bool) (index!42137 (_ BitVec 32)) (x!106760 (_ BitVec 32))) (Undefined!9941) (MissingVacant!9941 (index!42138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78243 (_ BitVec 32)) SeekEntryResult!9941)

(assert (=> b!1210972 (= res!804563 (= (seekEntryOrOpen!0 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9941 #b00000000000000000000000000000000)))))

(assert (=> b!1210972 (=> (not res!804563) (not e!687724))))

(declare-fun b!1210973 () Bool)

(assert (=> b!1210973 (= e!687723 call!59775)))

(declare-fun d!133359 () Bool)

(declare-fun res!804564 () Bool)

(declare-fun e!687725 () Bool)

(assert (=> d!133359 (=> res!804564 e!687725)))

(assert (=> d!133359 (= res!804564 (bvsge #b00000000000000000000000000000000 (size!38294 _keys!1208)))))

(assert (=> d!133359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!687725)))

(declare-fun bm!59772 () Bool)

(assert (=> bm!59772 (= call!59775 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1210974 () Bool)

(assert (=> b!1210974 (= e!687725 e!687723)))

(declare-fun c!119363 () Bool)

(assert (=> b!1210974 (= c!119363 (validKeyInArray!0 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133359 (not res!804564)) b!1210974))

(assert (= (and b!1210974 c!119363) b!1210972))

(assert (= (and b!1210974 (not c!119363)) b!1210973))

(assert (= (and b!1210972 res!804563) b!1210971))

(assert (= (or b!1210971 b!1210973) bm!59772))

(declare-fun m!1116425 () Bool)

(assert (=> b!1210972 m!1116425))

(declare-fun m!1116427 () Bool)

(assert (=> b!1210972 m!1116427))

(declare-fun m!1116429 () Bool)

(assert (=> b!1210972 m!1116429))

(assert (=> b!1210972 m!1116425))

(declare-fun m!1116431 () Bool)

(assert (=> b!1210972 m!1116431))

(declare-fun m!1116433 () Bool)

(assert (=> bm!59772 m!1116433))

(assert (=> b!1210974 m!1116425))

(assert (=> b!1210974 m!1116425))

(declare-fun m!1116435 () Bool)

(assert (=> b!1210974 m!1116435))

(assert (=> b!1210861 d!133359))

(declare-fun d!133361 () Bool)

(declare-fun e!687728 () Bool)

(assert (=> d!133361 e!687728))

(declare-fun res!804569 () Bool)

(assert (=> d!133361 (=> (not res!804569) (not e!687728))))

(declare-fun lt!549931 () ListLongMap!17775)

(assert (=> d!133361 (= res!804569 (contains!6974 lt!549931 (_1!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))))))

(declare-fun lt!549929 () List!26607)

(assert (=> d!133361 (= lt!549931 (ListLongMap!17776 lt!549929))))

(declare-fun lt!549930 () Unit!40143)

(declare-fun lt!549928 () Unit!40143)

(assert (=> d!133361 (= lt!549930 lt!549928)))

(declare-datatypes ((Option!690 0))(
  ( (Some!689 (v!18074 V!46099)) (None!688) )
))
(declare-fun getValueByKey!639 (List!26607 (_ BitVec 64)) Option!690)

(assert (=> d!133361 (= (getValueByKey!639 lt!549929 (_1!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))) (Some!689 (_2!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))))))

(declare-fun lemmaContainsTupThenGetReturnValue!316 (List!26607 (_ BitVec 64) V!46099) Unit!40143)

(assert (=> d!133361 (= lt!549928 (lemmaContainsTupThenGetReturnValue!316 lt!549929 (_1!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)) (_2!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))))))

(declare-fun insertStrictlySorted!409 (List!26607 (_ BitVec 64) V!46099) List!26607)

(assert (=> d!133361 (= lt!549929 (insertStrictlySorted!409 (toList!8903 lt!549830) (_1!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)) (_2!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))))))

(assert (=> d!133361 (= (+!4021 lt!549830 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)) lt!549931)))

(declare-fun b!1210979 () Bool)

(declare-fun res!804570 () Bool)

(assert (=> b!1210979 (=> (not res!804570) (not e!687728))))

(assert (=> b!1210979 (= res!804570 (= (getValueByKey!639 (toList!8903 lt!549931) (_1!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))) (Some!689 (_2!9914 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)))))))

(declare-fun b!1210980 () Bool)

(declare-fun contains!6976 (List!26607 tuple2!19806) Bool)

(assert (=> b!1210980 (= e!687728 (contains!6976 (toList!8903 lt!549931) (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)))))

(assert (= (and d!133361 res!804569) b!1210979))

(assert (= (and b!1210979 res!804570) b!1210980))

(declare-fun m!1116437 () Bool)

(assert (=> d!133361 m!1116437))

(declare-fun m!1116439 () Bool)

(assert (=> d!133361 m!1116439))

(declare-fun m!1116441 () Bool)

(assert (=> d!133361 m!1116441))

(declare-fun m!1116443 () Bool)

(assert (=> d!133361 m!1116443))

(declare-fun m!1116445 () Bool)

(assert (=> b!1210979 m!1116445))

(declare-fun m!1116447 () Bool)

(assert (=> b!1210980 m!1116447))

(assert (=> b!1210843 d!133361))

(declare-fun d!133363 () Bool)

(declare-fun lt!549934 () ListLongMap!17775)

(assert (=> d!133363 (not (contains!6974 lt!549934 (select (arr!37758 _keys!1208) from!1455)))))

(declare-fun removeStrictlySorted!101 (List!26607 (_ BitVec 64)) List!26607)

(assert (=> d!133363 (= lt!549934 (ListLongMap!17776 (removeStrictlySorted!101 (toList!8903 (+!4021 lt!549830 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837))) (select (arr!37758 _keys!1208) from!1455))))))

(assert (=> d!133363 (= (-!1852 (+!4021 lt!549830 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)) (select (arr!37758 _keys!1208) from!1455)) lt!549934)))

(declare-fun bs!34192 () Bool)

(assert (= bs!34192 d!133363))

(assert (=> bs!34192 m!1116289))

(declare-fun m!1116449 () Bool)

(assert (=> bs!34192 m!1116449))

(assert (=> bs!34192 m!1116289))

(declare-fun m!1116451 () Bool)

(assert (=> bs!34192 m!1116451))

(assert (=> b!1210843 d!133363))

(declare-fun d!133365 () Bool)

(assert (=> d!133365 (= (-!1852 (+!4021 lt!549830 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) lt!549837)) (select (arr!37758 _keys!1208) from!1455)) lt!549830)))

(declare-fun lt!549937 () Unit!40143)

(declare-fun choose!1813 (ListLongMap!17775 (_ BitVec 64) V!46099) Unit!40143)

(assert (=> d!133365 (= lt!549937 (choose!1813 lt!549830 (select (arr!37758 _keys!1208) from!1455) lt!549837))))

(assert (=> d!133365 (not (contains!6974 lt!549830 (select (arr!37758 _keys!1208) from!1455)))))

(assert (=> d!133365 (= (addThenRemoveForNewKeyIsSame!270 lt!549830 (select (arr!37758 _keys!1208) from!1455) lt!549837) lt!549937)))

(declare-fun bs!34193 () Bool)

(assert (= bs!34193 d!133365))

(assert (=> bs!34193 m!1116317))

(assert (=> bs!34193 m!1116317))

(assert (=> bs!34193 m!1116289))

(assert (=> bs!34193 m!1116323))

(assert (=> bs!34193 m!1116289))

(declare-fun m!1116453 () Bool)

(assert (=> bs!34193 m!1116453))

(assert (=> bs!34193 m!1116289))

(declare-fun m!1116455 () Bool)

(assert (=> bs!34193 m!1116455))

(assert (=> b!1210843 d!133365))

(declare-fun b!1211005 () Bool)

(declare-fun e!687747 () ListLongMap!17775)

(assert (=> b!1211005 (= e!687747 (ListLongMap!17776 Nil!26604))))

(declare-fun lt!549955 () ListLongMap!17775)

(declare-fun b!1211006 () Bool)

(declare-fun e!687746 () Bool)

(assert (=> b!1211006 (= e!687746 (= lt!549955 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1211007 () Bool)

(declare-fun e!687749 () Bool)

(declare-fun e!687745 () Bool)

(assert (=> b!1211007 (= e!687749 e!687745)))

(assert (=> b!1211007 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 _keys!1208)))))

(declare-fun res!804582 () Bool)

(assert (=> b!1211007 (= res!804582 (contains!6974 lt!549955 (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1211007 (=> (not res!804582) (not e!687745))))

(declare-fun b!1211008 () Bool)

(declare-fun lt!549956 () Unit!40143)

(declare-fun lt!549952 () Unit!40143)

(assert (=> b!1211008 (= lt!549956 lt!549952)))

(declare-fun lt!549953 () (_ BitVec 64))

(declare-fun lt!549954 () V!46099)

(declare-fun lt!549957 () ListLongMap!17775)

(declare-fun lt!549958 () (_ BitVec 64))

(assert (=> b!1211008 (not (contains!6974 (+!4021 lt!549957 (tuple2!19807 lt!549958 lt!549954)) lt!549953))))

(declare-fun addStillNotContains!296 (ListLongMap!17775 (_ BitVec 64) V!46099 (_ BitVec 64)) Unit!40143)

(assert (=> b!1211008 (= lt!549952 (addStillNotContains!296 lt!549957 lt!549958 lt!549954 lt!549953))))

(assert (=> b!1211008 (= lt!549953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1211008 (= lt!549954 (get!19237 (select (arr!37759 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1211008 (= lt!549958 (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!59778 () ListLongMap!17775)

(assert (=> b!1211008 (= lt!549957 call!59778)))

(declare-fun e!687743 () ListLongMap!17775)

(assert (=> b!1211008 (= e!687743 (+!4021 call!59778 (tuple2!19807 (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19237 (select (arr!37759 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133367 () Bool)

(declare-fun e!687748 () Bool)

(assert (=> d!133367 e!687748))

(declare-fun res!804579 () Bool)

(assert (=> d!133367 (=> (not res!804579) (not e!687748))))

(assert (=> d!133367 (= res!804579 (not (contains!6974 lt!549955 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133367 (= lt!549955 e!687747)))

(declare-fun c!119374 () Bool)

(assert (=> d!133367 (= c!119374 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 _keys!1208)))))

(assert (=> d!133367 (validMask!0 mask!1564)))

(assert (=> d!133367 (= (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549955)))

(declare-fun bm!59775 () Bool)

(assert (=> bm!59775 (= call!59778 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1211009 () Bool)

(assert (=> b!1211009 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 _keys!1208)))))

(assert (=> b!1211009 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38295 _values!996)))))

(declare-fun apply!968 (ListLongMap!17775 (_ BitVec 64)) V!46099)

(assert (=> b!1211009 (= e!687745 (= (apply!968 lt!549955 (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19237 (select (arr!37759 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1211010 () Bool)

(declare-fun res!804581 () Bool)

(assert (=> b!1211010 (=> (not res!804581) (not e!687748))))

(assert (=> b!1211010 (= res!804581 (not (contains!6974 lt!549955 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1211011 () Bool)

(assert (=> b!1211011 (= e!687747 e!687743)))

(declare-fun c!119372 () Bool)

(assert (=> b!1211011 (= c!119372 (validKeyInArray!0 (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1211012 () Bool)

(declare-fun isEmpty!992 (ListLongMap!17775) Bool)

(assert (=> b!1211012 (= e!687746 (isEmpty!992 lt!549955))))

(declare-fun b!1211013 () Bool)

(declare-fun e!687744 () Bool)

(assert (=> b!1211013 (= e!687744 (validKeyInArray!0 (select (arr!37758 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1211013 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1211014 () Bool)

(assert (=> b!1211014 (= e!687748 e!687749)))

(declare-fun c!119373 () Bool)

(assert (=> b!1211014 (= c!119373 e!687744)))

(declare-fun res!804580 () Bool)

(assert (=> b!1211014 (=> (not res!804580) (not e!687744))))

(assert (=> b!1211014 (= res!804580 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 _keys!1208)))))

(declare-fun b!1211015 () Bool)

(assert (=> b!1211015 (= e!687743 call!59778)))

(declare-fun b!1211016 () Bool)

(assert (=> b!1211016 (= e!687749 e!687746)))

(declare-fun c!119375 () Bool)

(assert (=> b!1211016 (= c!119375 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 _keys!1208)))))

(assert (= (and d!133367 c!119374) b!1211005))

(assert (= (and d!133367 (not c!119374)) b!1211011))

(assert (= (and b!1211011 c!119372) b!1211008))

(assert (= (and b!1211011 (not c!119372)) b!1211015))

(assert (= (or b!1211008 b!1211015) bm!59775))

(assert (= (and d!133367 res!804579) b!1211010))

(assert (= (and b!1211010 res!804581) b!1211014))

(assert (= (and b!1211014 res!804580) b!1211013))

(assert (= (and b!1211014 c!119373) b!1211007))

(assert (= (and b!1211014 (not c!119373)) b!1211016))

(assert (= (and b!1211007 res!804582) b!1211009))

(assert (= (and b!1211016 c!119375) b!1211006))

(assert (= (and b!1211016 (not c!119375)) b!1211012))

(declare-fun b_lambda!21631 () Bool)

(assert (=> (not b_lambda!21631) (not b!1211008)))

(assert (=> b!1211008 t!39611))

(declare-fun b_and!43139 () Bool)

(assert (= b_and!43133 (and (=> t!39611 result!22243) b_and!43139)))

(declare-fun b_lambda!21633 () Bool)

(assert (=> (not b_lambda!21633) (not b!1211009)))

(assert (=> b!1211009 t!39611))

(declare-fun b_and!43141 () Bool)

(assert (= b_and!43139 (and (=> t!39611 result!22243) b_and!43141)))

(assert (=> b!1211009 m!1116421))

(declare-fun m!1116457 () Bool)

(assert (=> b!1211009 m!1116457))

(assert (=> b!1211009 m!1116421))

(assert (=> b!1211009 m!1116297))

(declare-fun m!1116459 () Bool)

(assert (=> b!1211009 m!1116459))

(assert (=> b!1211009 m!1116297))

(declare-fun m!1116461 () Bool)

(assert (=> b!1211009 m!1116461))

(assert (=> b!1211009 m!1116459))

(assert (=> b!1211007 m!1116421))

(assert (=> b!1211007 m!1116421))

(declare-fun m!1116463 () Bool)

(assert (=> b!1211007 m!1116463))

(declare-fun m!1116465 () Bool)

(assert (=> b!1211010 m!1116465))

(declare-fun m!1116467 () Bool)

(assert (=> b!1211008 m!1116467))

(declare-fun m!1116469 () Bool)

(assert (=> b!1211008 m!1116469))

(declare-fun m!1116471 () Bool)

(assert (=> b!1211008 m!1116471))

(assert (=> b!1211008 m!1116467))

(assert (=> b!1211008 m!1116421))

(declare-fun m!1116473 () Bool)

(assert (=> b!1211008 m!1116473))

(assert (=> b!1211008 m!1116297))

(assert (=> b!1211008 m!1116459))

(assert (=> b!1211008 m!1116297))

(assert (=> b!1211008 m!1116461))

(assert (=> b!1211008 m!1116459))

(declare-fun m!1116475 () Bool)

(assert (=> d!133367 m!1116475))

(assert (=> d!133367 m!1116267))

(declare-fun m!1116477 () Bool)

(assert (=> b!1211006 m!1116477))

(assert (=> bm!59775 m!1116477))

(assert (=> b!1211011 m!1116421))

(assert (=> b!1211011 m!1116421))

(declare-fun m!1116479 () Bool)

(assert (=> b!1211011 m!1116479))

(assert (=> b!1211013 m!1116421))

(assert (=> b!1211013 m!1116421))

(assert (=> b!1211013 m!1116479))

(declare-fun m!1116481 () Bool)

(assert (=> b!1211012 m!1116481))

(assert (=> b!1210843 d!133367))

(declare-fun d!133369 () Bool)

(declare-fun e!687755 () Bool)

(assert (=> d!133369 e!687755))

(declare-fun res!804585 () Bool)

(assert (=> d!133369 (=> res!804585 e!687755)))

(declare-fun lt!549969 () Bool)

(assert (=> d!133369 (= res!804585 (not lt!549969))))

(declare-fun lt!549970 () Bool)

(assert (=> d!133369 (= lt!549969 lt!549970)))

(declare-fun lt!549968 () Unit!40143)

(declare-fun e!687754 () Unit!40143)

(assert (=> d!133369 (= lt!549968 e!687754)))

(declare-fun c!119378 () Bool)

(assert (=> d!133369 (= c!119378 lt!549970)))

(declare-fun containsKey!595 (List!26607 (_ BitVec 64)) Bool)

(assert (=> d!133369 (= lt!549970 (containsKey!595 (toList!8903 lt!549830) k0!934))))

(assert (=> d!133369 (= (contains!6974 lt!549830 k0!934) lt!549969)))

(declare-fun b!1211023 () Bool)

(declare-fun lt!549967 () Unit!40143)

(assert (=> b!1211023 (= e!687754 lt!549967)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!425 (List!26607 (_ BitVec 64)) Unit!40143)

(assert (=> b!1211023 (= lt!549967 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8903 lt!549830) k0!934))))

(declare-fun isDefined!464 (Option!690) Bool)

(assert (=> b!1211023 (isDefined!464 (getValueByKey!639 (toList!8903 lt!549830) k0!934))))

(declare-fun b!1211024 () Bool)

(declare-fun Unit!40153 () Unit!40143)

(assert (=> b!1211024 (= e!687754 Unit!40153)))

(declare-fun b!1211025 () Bool)

(assert (=> b!1211025 (= e!687755 (isDefined!464 (getValueByKey!639 (toList!8903 lt!549830) k0!934)))))

(assert (= (and d!133369 c!119378) b!1211023))

(assert (= (and d!133369 (not c!119378)) b!1211024))

(assert (= (and d!133369 (not res!804585)) b!1211025))

(declare-fun m!1116483 () Bool)

(assert (=> d!133369 m!1116483))

(declare-fun m!1116485 () Bool)

(assert (=> b!1211023 m!1116485))

(declare-fun m!1116487 () Bool)

(assert (=> b!1211023 m!1116487))

(assert (=> b!1211023 m!1116487))

(declare-fun m!1116489 () Bool)

(assert (=> b!1211023 m!1116489))

(assert (=> b!1211025 m!1116487))

(assert (=> b!1211025 m!1116487))

(assert (=> b!1211025 m!1116489))

(assert (=> b!1210843 d!133369))

(declare-fun d!133371 () Bool)

(declare-fun c!119381 () Bool)

(assert (=> d!133371 (= c!119381 ((_ is ValueCellFull!14655) (select (arr!37759 _values!996) from!1455)))))

(declare-fun e!687758 () V!46099)

(assert (=> d!133371 (= (get!19237 (select (arr!37759 _values!996) from!1455) lt!549847) e!687758)))

(declare-fun b!1211030 () Bool)

(declare-fun get!19239 (ValueCell!14655 V!46099) V!46099)

(assert (=> b!1211030 (= e!687758 (get!19239 (select (arr!37759 _values!996) from!1455) lt!549847))))

(declare-fun b!1211031 () Bool)

(declare-fun get!19240 (ValueCell!14655 V!46099) V!46099)

(assert (=> b!1211031 (= e!687758 (get!19240 (select (arr!37759 _values!996) from!1455) lt!549847))))

(assert (= (and d!133371 c!119381) b!1211030))

(assert (= (and d!133371 (not c!119381)) b!1211031))

(assert (=> b!1211030 m!1116313))

(declare-fun m!1116491 () Bool)

(assert (=> b!1211030 m!1116491))

(assert (=> b!1211031 m!1116313))

(declare-fun m!1116493 () Bool)

(assert (=> b!1211031 m!1116493))

(assert (=> b!1210843 d!133371))

(declare-fun d!133373 () Bool)

(declare-fun lt!549971 () ListLongMap!17775)

(assert (=> d!133373 (not (contains!6974 lt!549971 k0!934))))

(assert (=> d!133373 (= lt!549971 (ListLongMap!17776 (removeStrictlySorted!101 (toList!8903 lt!549841) k0!934)))))

(assert (=> d!133373 (= (-!1852 lt!549841 k0!934) lt!549971)))

(declare-fun bs!34194 () Bool)

(assert (= bs!34194 d!133373))

(declare-fun m!1116495 () Bool)

(assert (=> bs!34194 m!1116495))

(declare-fun m!1116497 () Bool)

(assert (=> bs!34194 m!1116497))

(assert (=> b!1210843 d!133373))

(assert (=> b!1210853 d!133353))

(declare-fun d!133375 () Bool)

(declare-fun e!687760 () Bool)

(assert (=> d!133375 e!687760))

(declare-fun res!804586 () Bool)

(assert (=> d!133375 (=> res!804586 e!687760)))

(declare-fun lt!549974 () Bool)

(assert (=> d!133375 (= res!804586 (not lt!549974))))

(declare-fun lt!549975 () Bool)

(assert (=> d!133375 (= lt!549974 lt!549975)))

(declare-fun lt!549973 () Unit!40143)

(declare-fun e!687759 () Unit!40143)

(assert (=> d!133375 (= lt!549973 e!687759)))

(declare-fun c!119382 () Bool)

(assert (=> d!133375 (= c!119382 lt!549975)))

(assert (=> d!133375 (= lt!549975 (containsKey!595 (toList!8903 (ite c!119341 lt!549833 call!59748)) k0!934))))

(assert (=> d!133375 (= (contains!6974 (ite c!119341 lt!549833 call!59748) k0!934) lt!549974)))

(declare-fun b!1211032 () Bool)

(declare-fun lt!549972 () Unit!40143)

(assert (=> b!1211032 (= e!687759 lt!549972)))

(assert (=> b!1211032 (= lt!549972 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8903 (ite c!119341 lt!549833 call!59748)) k0!934))))

(assert (=> b!1211032 (isDefined!464 (getValueByKey!639 (toList!8903 (ite c!119341 lt!549833 call!59748)) k0!934))))

(declare-fun b!1211033 () Bool)

(declare-fun Unit!40154 () Unit!40143)

(assert (=> b!1211033 (= e!687759 Unit!40154)))

(declare-fun b!1211034 () Bool)

(assert (=> b!1211034 (= e!687760 (isDefined!464 (getValueByKey!639 (toList!8903 (ite c!119341 lt!549833 call!59748)) k0!934)))))

(assert (= (and d!133375 c!119382) b!1211032))

(assert (= (and d!133375 (not c!119382)) b!1211033))

(assert (= (and d!133375 (not res!804586)) b!1211034))

(declare-fun m!1116499 () Bool)

(assert (=> d!133375 m!1116499))

(declare-fun m!1116501 () Bool)

(assert (=> b!1211032 m!1116501))

(declare-fun m!1116503 () Bool)

(assert (=> b!1211032 m!1116503))

(assert (=> b!1211032 m!1116503))

(declare-fun m!1116505 () Bool)

(assert (=> b!1211032 m!1116505))

(assert (=> b!1211034 m!1116503))

(assert (=> b!1211034 m!1116503))

(assert (=> b!1211034 m!1116505))

(assert (=> bm!59743 d!133375))

(declare-fun d!133377 () Bool)

(declare-fun e!687763 () Bool)

(assert (=> d!133377 e!687763))

(declare-fun c!119385 () Bool)

(assert (=> d!133377 (= c!119385 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549978 () Unit!40143)

(declare-fun choose!1814 (array!78243 array!78245 (_ BitVec 32) (_ BitVec 32) V!46099 V!46099 (_ BitVec 64) (_ BitVec 32) Int) Unit!40143)

(assert (=> d!133377 (= lt!549978 (choose!1814 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133377 (validMask!0 mask!1564)))

(assert (=> d!133377 (= (lemmaListMapContainsThenArrayContainsFrom!600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549978)))

(declare-fun b!1211039 () Bool)

(assert (=> b!1211039 (= e!687763 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211040 () Bool)

(assert (=> b!1211040 (= e!687763 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133377 c!119385) b!1211039))

(assert (= (and d!133377 (not c!119385)) b!1211040))

(declare-fun m!1116507 () Bool)

(assert (=> d!133377 m!1116507))

(assert (=> d!133377 m!1116267))

(assert (=> b!1211039 m!1116261))

(assert (=> b!1210851 d!133377))

(declare-fun d!133379 () Bool)

(assert (=> d!133379 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26605)))

(declare-fun lt!549981 () Unit!40143)

(declare-fun choose!39 (array!78243 (_ BitVec 32) (_ BitVec 32)) Unit!40143)

(assert (=> d!133379 (= lt!549981 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133379 (bvslt (size!38294 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133379 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!549981)))

(declare-fun bs!34195 () Bool)

(assert (= bs!34195 d!133379))

(assert (=> bs!34195 m!1116307))

(declare-fun m!1116509 () Bool)

(assert (=> bs!34195 m!1116509))

(assert (=> b!1210851 d!133379))

(declare-fun b!1211051 () Bool)

(declare-fun e!687772 () Bool)

(declare-fun call!59781 () Bool)

(assert (=> b!1211051 (= e!687772 call!59781)))

(declare-fun c!119388 () Bool)

(declare-fun bm!59778 () Bool)

(assert (=> bm!59778 (= call!59781 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119388 (Cons!26604 (select (arr!37758 _keys!1208) from!1455) Nil!26605) Nil!26605)))))

(declare-fun b!1211052 () Bool)

(declare-fun e!687773 () Bool)

(assert (=> b!1211052 (= e!687773 e!687772)))

(assert (=> b!1211052 (= c!119388 (validKeyInArray!0 (select (arr!37758 _keys!1208) from!1455)))))

(declare-fun b!1211053 () Bool)

(declare-fun e!687774 () Bool)

(declare-fun contains!6977 (List!26608 (_ BitVec 64)) Bool)

(assert (=> b!1211053 (= e!687774 (contains!6977 Nil!26605 (select (arr!37758 _keys!1208) from!1455)))))

(declare-fun d!133381 () Bool)

(declare-fun res!804595 () Bool)

(declare-fun e!687775 () Bool)

(assert (=> d!133381 (=> res!804595 e!687775)))

(assert (=> d!133381 (= res!804595 (bvsge from!1455 (size!38294 _keys!1208)))))

(assert (=> d!133381 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26605) e!687775)))

(declare-fun b!1211054 () Bool)

(assert (=> b!1211054 (= e!687775 e!687773)))

(declare-fun res!804593 () Bool)

(assert (=> b!1211054 (=> (not res!804593) (not e!687773))))

(assert (=> b!1211054 (= res!804593 (not e!687774))))

(declare-fun res!804594 () Bool)

(assert (=> b!1211054 (=> (not res!804594) (not e!687774))))

(assert (=> b!1211054 (= res!804594 (validKeyInArray!0 (select (arr!37758 _keys!1208) from!1455)))))

(declare-fun b!1211055 () Bool)

(assert (=> b!1211055 (= e!687772 call!59781)))

(assert (= (and d!133381 (not res!804595)) b!1211054))

(assert (= (and b!1211054 res!804594) b!1211053))

(assert (= (and b!1211054 res!804593) b!1211052))

(assert (= (and b!1211052 c!119388) b!1211055))

(assert (= (and b!1211052 (not c!119388)) b!1211051))

(assert (= (or b!1211055 b!1211051) bm!59778))

(assert (=> bm!59778 m!1116289))

(declare-fun m!1116511 () Bool)

(assert (=> bm!59778 m!1116511))

(assert (=> b!1211052 m!1116289))

(assert (=> b!1211052 m!1116289))

(declare-fun m!1116513 () Bool)

(assert (=> b!1211052 m!1116513))

(assert (=> b!1211053 m!1116289))

(assert (=> b!1211053 m!1116289))

(declare-fun m!1116515 () Bool)

(assert (=> b!1211053 m!1116515))

(assert (=> b!1211054 m!1116289))

(assert (=> b!1211054 m!1116289))

(assert (=> b!1211054 m!1116513))

(assert (=> b!1210851 d!133381))

(declare-fun d!133383 () Bool)

(assert (=> d!133383 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38294 _keys!1208)) (not (= (select (arr!37758 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!549984 () Unit!40143)

(declare-fun choose!21 (array!78243 (_ BitVec 64) (_ BitVec 32) List!26608) Unit!40143)

(assert (=> d!133383 (= lt!549984 (choose!21 _keys!1208 k0!934 from!1455 Nil!26605))))

(assert (=> d!133383 (bvslt (size!38294 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133383 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26605) lt!549984)))

(declare-fun bs!34196 () Bool)

(assert (= bs!34196 d!133383))

(assert (=> bs!34196 m!1116289))

(declare-fun m!1116517 () Bool)

(assert (=> bs!34196 m!1116517))

(assert (=> b!1210851 d!133383))

(declare-fun d!133385 () Bool)

(declare-fun res!804596 () Bool)

(declare-fun e!687776 () Bool)

(assert (=> d!133385 (=> res!804596 e!687776)))

(assert (=> d!133385 (= res!804596 (= (select (arr!37758 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133385 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!687776)))

(declare-fun b!1211056 () Bool)

(declare-fun e!687777 () Bool)

(assert (=> b!1211056 (= e!687776 e!687777)))

(declare-fun res!804597 () Bool)

(assert (=> b!1211056 (=> (not res!804597) (not e!687777))))

(assert (=> b!1211056 (= res!804597 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38294 _keys!1208)))))

(declare-fun b!1211057 () Bool)

(assert (=> b!1211057 (= e!687777 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133385 (not res!804596)) b!1211056))

(assert (= (and b!1211056 res!804597) b!1211057))

(assert (=> d!133385 m!1116425))

(declare-fun m!1116519 () Bool)

(assert (=> b!1211057 m!1116519))

(assert (=> b!1210859 d!133385))

(declare-fun d!133387 () Bool)

(assert (=> d!133387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549987 () Unit!40143)

(declare-fun choose!13 (array!78243 (_ BitVec 64) (_ BitVec 32)) Unit!40143)

(assert (=> d!133387 (= lt!549987 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133387 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133387 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!549987)))

(declare-fun bs!34197 () Bool)

(assert (= bs!34197 d!133387))

(assert (=> bs!34197 m!1116335))

(declare-fun m!1116521 () Bool)

(assert (=> bs!34197 m!1116521))

(assert (=> b!1210859 d!133387))

(declare-fun b!1211058 () Bool)

(declare-fun e!687778 () Bool)

(declare-fun call!59782 () Bool)

(assert (=> b!1211058 (= e!687778 call!59782)))

(declare-fun bm!59779 () Bool)

(declare-fun c!119389 () Bool)

(assert (=> bm!59779 (= call!59782 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119389 (Cons!26604 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000) Nil!26605) Nil!26605)))))

(declare-fun b!1211059 () Bool)

(declare-fun e!687779 () Bool)

(assert (=> b!1211059 (= e!687779 e!687778)))

(assert (=> b!1211059 (= c!119389 (validKeyInArray!0 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1211060 () Bool)

(declare-fun e!687780 () Bool)

(assert (=> b!1211060 (= e!687780 (contains!6977 Nil!26605 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133389 () Bool)

(declare-fun res!804600 () Bool)

(declare-fun e!687781 () Bool)

(assert (=> d!133389 (=> res!804600 e!687781)))

(assert (=> d!133389 (= res!804600 (bvsge #b00000000000000000000000000000000 (size!38294 _keys!1208)))))

(assert (=> d!133389 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26605) e!687781)))

(declare-fun b!1211061 () Bool)

(assert (=> b!1211061 (= e!687781 e!687779)))

(declare-fun res!804598 () Bool)

(assert (=> b!1211061 (=> (not res!804598) (not e!687779))))

(assert (=> b!1211061 (= res!804598 (not e!687780))))

(declare-fun res!804599 () Bool)

(assert (=> b!1211061 (=> (not res!804599) (not e!687780))))

(assert (=> b!1211061 (= res!804599 (validKeyInArray!0 (select (arr!37758 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1211062 () Bool)

(assert (=> b!1211062 (= e!687778 call!59782)))

(assert (= (and d!133389 (not res!804600)) b!1211061))

(assert (= (and b!1211061 res!804599) b!1211060))

(assert (= (and b!1211061 res!804598) b!1211059))

(assert (= (and b!1211059 c!119389) b!1211062))

(assert (= (and b!1211059 (not c!119389)) b!1211058))

(assert (= (or b!1211062 b!1211058) bm!59779))

(assert (=> bm!59779 m!1116425))

(declare-fun m!1116523 () Bool)

(assert (=> bm!59779 m!1116523))

(assert (=> b!1211059 m!1116425))

(assert (=> b!1211059 m!1116425))

(assert (=> b!1211059 m!1116435))

(assert (=> b!1211060 m!1116425))

(assert (=> b!1211060 m!1116425))

(declare-fun m!1116525 () Bool)

(assert (=> b!1211060 m!1116525))

(assert (=> b!1211061 m!1116425))

(assert (=> b!1211061 m!1116425))

(assert (=> b!1211061 m!1116435))

(assert (=> b!1210850 d!133389))

(declare-fun d!133391 () Bool)

(assert (=> d!133391 (contains!6974 (+!4021 (ite c!119341 lt!549833 lt!549830) (tuple2!19807 (ite c!119341 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119338 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119341 minValue!944 (ite c!119338 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!549990 () Unit!40143)

(declare-fun choose!1815 (ListLongMap!17775 (_ BitVec 64) V!46099 (_ BitVec 64)) Unit!40143)

(assert (=> d!133391 (= lt!549990 (choose!1815 (ite c!119341 lt!549833 lt!549830) (ite c!119341 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119338 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119341 minValue!944 (ite c!119338 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133391 (contains!6974 (ite c!119341 lt!549833 lt!549830) k0!934)))

(assert (=> d!133391 (= (addStillContains!1049 (ite c!119341 lt!549833 lt!549830) (ite c!119341 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119338 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119341 minValue!944 (ite c!119338 zeroValue!944 minValue!944)) k0!934) lt!549990)))

(declare-fun bs!34198 () Bool)

(assert (= bs!34198 d!133391))

(declare-fun m!1116527 () Bool)

(assert (=> bs!34198 m!1116527))

(assert (=> bs!34198 m!1116527))

(declare-fun m!1116529 () Bool)

(assert (=> bs!34198 m!1116529))

(declare-fun m!1116531 () Bool)

(assert (=> bs!34198 m!1116531))

(declare-fun m!1116533 () Bool)

(assert (=> bs!34198 m!1116533))

(assert (=> bm!59742 d!133391))

(declare-fun b!1211064 () Bool)

(declare-fun e!687786 () ListLongMap!17775)

(assert (=> b!1211064 (= e!687786 (ListLongMap!17776 Nil!26604))))

(declare-fun lt!549994 () ListLongMap!17775)

(declare-fun b!1211065 () Bool)

(declare-fun e!687785 () Bool)

(assert (=> b!1211065 (= e!687785 (= lt!549994 (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1211066 () Bool)

(declare-fun e!687788 () Bool)

(declare-fun e!687784 () Bool)

(assert (=> b!1211066 (= e!687788 e!687784)))

(assert (=> b!1211066 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38294 lt!549835)))))

(declare-fun res!804604 () Bool)

(assert (=> b!1211066 (= res!804604 (contains!6974 lt!549994 (select (arr!37758 lt!549835) from!1455)))))

(assert (=> b!1211066 (=> (not res!804604) (not e!687784))))

(declare-fun b!1211067 () Bool)

(declare-fun lt!549995 () Unit!40143)

(declare-fun lt!549991 () Unit!40143)

(assert (=> b!1211067 (= lt!549995 lt!549991)))

(declare-fun lt!549993 () V!46099)

(declare-fun lt!549996 () ListLongMap!17775)

(declare-fun lt!549997 () (_ BitVec 64))

(declare-fun lt!549992 () (_ BitVec 64))

(assert (=> b!1211067 (not (contains!6974 (+!4021 lt!549996 (tuple2!19807 lt!549997 lt!549993)) lt!549992))))

(assert (=> b!1211067 (= lt!549991 (addStillNotContains!296 lt!549996 lt!549997 lt!549993 lt!549992))))

(assert (=> b!1211067 (= lt!549992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1211067 (= lt!549993 (get!19237 (select (arr!37759 lt!549845) from!1455) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1211067 (= lt!549997 (select (arr!37758 lt!549835) from!1455))))

(declare-fun call!59783 () ListLongMap!17775)

(assert (=> b!1211067 (= lt!549996 call!59783)))

(declare-fun e!687782 () ListLongMap!17775)

(assert (=> b!1211067 (= e!687782 (+!4021 call!59783 (tuple2!19807 (select (arr!37758 lt!549835) from!1455) (get!19237 (select (arr!37759 lt!549845) from!1455) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133393 () Bool)

(declare-fun e!687787 () Bool)

(assert (=> d!133393 e!687787))

(declare-fun res!804601 () Bool)

(assert (=> d!133393 (=> (not res!804601) (not e!687787))))

(assert (=> d!133393 (= res!804601 (not (contains!6974 lt!549994 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133393 (= lt!549994 e!687786)))

(declare-fun c!119392 () Bool)

(assert (=> d!133393 (= c!119392 (bvsge from!1455 (size!38294 lt!549835)))))

(assert (=> d!133393 (validMask!0 mask!1564)))

(assert (=> d!133393 (= (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!549994)))

(declare-fun bm!59780 () Bool)

(assert (=> bm!59780 (= call!59783 (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1211068 () Bool)

(assert (=> b!1211068 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38294 lt!549835)))))

(assert (=> b!1211068 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38295 lt!549845)))))

(assert (=> b!1211068 (= e!687784 (= (apply!968 lt!549994 (select (arr!37758 lt!549835) from!1455)) (get!19237 (select (arr!37759 lt!549845) from!1455) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1211069 () Bool)

(declare-fun res!804603 () Bool)

(assert (=> b!1211069 (=> (not res!804603) (not e!687787))))

(assert (=> b!1211069 (= res!804603 (not (contains!6974 lt!549994 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1211070 () Bool)

(assert (=> b!1211070 (= e!687786 e!687782)))

(declare-fun c!119390 () Bool)

(assert (=> b!1211070 (= c!119390 (validKeyInArray!0 (select (arr!37758 lt!549835) from!1455)))))

(declare-fun b!1211071 () Bool)

(assert (=> b!1211071 (= e!687785 (isEmpty!992 lt!549994))))

(declare-fun b!1211072 () Bool)

(declare-fun e!687783 () Bool)

(assert (=> b!1211072 (= e!687783 (validKeyInArray!0 (select (arr!37758 lt!549835) from!1455)))))

(assert (=> b!1211072 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1211073 () Bool)

(assert (=> b!1211073 (= e!687787 e!687788)))

(declare-fun c!119391 () Bool)

(assert (=> b!1211073 (= c!119391 e!687783)))

(declare-fun res!804602 () Bool)

(assert (=> b!1211073 (=> (not res!804602) (not e!687783))))

(assert (=> b!1211073 (= res!804602 (bvslt from!1455 (size!38294 lt!549835)))))

(declare-fun b!1211074 () Bool)

(assert (=> b!1211074 (= e!687782 call!59783)))

(declare-fun b!1211075 () Bool)

(assert (=> b!1211075 (= e!687788 e!687785)))

(declare-fun c!119393 () Bool)

(assert (=> b!1211075 (= c!119393 (bvslt from!1455 (size!38294 lt!549835)))))

(assert (= (and d!133393 c!119392) b!1211064))

(assert (= (and d!133393 (not c!119392)) b!1211070))

(assert (= (and b!1211070 c!119390) b!1211067))

(assert (= (and b!1211070 (not c!119390)) b!1211074))

(assert (= (or b!1211067 b!1211074) bm!59780))

(assert (= (and d!133393 res!804601) b!1211069))

(assert (= (and b!1211069 res!804603) b!1211073))

(assert (= (and b!1211073 res!804602) b!1211072))

(assert (= (and b!1211073 c!119391) b!1211066))

(assert (= (and b!1211073 (not c!119391)) b!1211075))

(assert (= (and b!1211066 res!804604) b!1211068))

(assert (= (and b!1211075 c!119393) b!1211065))

(assert (= (and b!1211075 (not c!119393)) b!1211071))

(declare-fun b_lambda!21635 () Bool)

(assert (=> (not b_lambda!21635) (not b!1211067)))

(assert (=> b!1211067 t!39611))

(declare-fun b_and!43143 () Bool)

(assert (= b_and!43141 (and (=> t!39611 result!22243) b_and!43143)))

(declare-fun b_lambda!21637 () Bool)

(assert (=> (not b_lambda!21637) (not b!1211068)))

(assert (=> b!1211068 t!39611))

(declare-fun b_and!43145 () Bool)

(assert (= b_and!43143 (and (=> t!39611 result!22243) b_and!43145)))

(declare-fun m!1116535 () Bool)

(assert (=> b!1211068 m!1116535))

(declare-fun m!1116537 () Bool)

(assert (=> b!1211068 m!1116537))

(assert (=> b!1211068 m!1116535))

(assert (=> b!1211068 m!1116297))

(declare-fun m!1116539 () Bool)

(assert (=> b!1211068 m!1116539))

(assert (=> b!1211068 m!1116297))

(declare-fun m!1116541 () Bool)

(assert (=> b!1211068 m!1116541))

(assert (=> b!1211068 m!1116539))

(assert (=> b!1211066 m!1116535))

(assert (=> b!1211066 m!1116535))

(declare-fun m!1116543 () Bool)

(assert (=> b!1211066 m!1116543))

(declare-fun m!1116545 () Bool)

(assert (=> b!1211069 m!1116545))

(declare-fun m!1116547 () Bool)

(assert (=> b!1211067 m!1116547))

(declare-fun m!1116549 () Bool)

(assert (=> b!1211067 m!1116549))

(declare-fun m!1116551 () Bool)

(assert (=> b!1211067 m!1116551))

(assert (=> b!1211067 m!1116547))

(assert (=> b!1211067 m!1116535))

(declare-fun m!1116553 () Bool)

(assert (=> b!1211067 m!1116553))

(assert (=> b!1211067 m!1116297))

(assert (=> b!1211067 m!1116539))

(assert (=> b!1211067 m!1116297))

(assert (=> b!1211067 m!1116541))

(assert (=> b!1211067 m!1116539))

(declare-fun m!1116555 () Bool)

(assert (=> d!133393 m!1116555))

(assert (=> d!133393 m!1116267))

(declare-fun m!1116557 () Bool)

(assert (=> b!1211065 m!1116557))

(assert (=> bm!59780 m!1116557))

(assert (=> b!1211070 m!1116535))

(assert (=> b!1211070 m!1116535))

(declare-fun m!1116559 () Bool)

(assert (=> b!1211070 m!1116559))

(assert (=> b!1211072 m!1116535))

(assert (=> b!1211072 m!1116535))

(assert (=> b!1211072 m!1116559))

(declare-fun m!1116561 () Bool)

(assert (=> b!1211071 m!1116561))

(assert (=> b!1210842 d!133393))

(declare-fun b!1211076 () Bool)

(declare-fun e!687793 () ListLongMap!17775)

(assert (=> b!1211076 (= e!687793 (ListLongMap!17776 Nil!26604))))

(declare-fun b!1211077 () Bool)

(declare-fun lt!550001 () ListLongMap!17775)

(declare-fun e!687792 () Bool)

(assert (=> b!1211077 (= e!687792 (= lt!550001 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1211078 () Bool)

(declare-fun e!687795 () Bool)

(declare-fun e!687791 () Bool)

(assert (=> b!1211078 (= e!687795 e!687791)))

(assert (=> b!1211078 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38294 _keys!1208)))))

(declare-fun res!804608 () Bool)

(assert (=> b!1211078 (= res!804608 (contains!6974 lt!550001 (select (arr!37758 _keys!1208) from!1455)))))

(assert (=> b!1211078 (=> (not res!804608) (not e!687791))))

(declare-fun b!1211079 () Bool)

(declare-fun lt!550002 () Unit!40143)

(declare-fun lt!549998 () Unit!40143)

(assert (=> b!1211079 (= lt!550002 lt!549998)))

(declare-fun lt!549999 () (_ BitVec 64))

(declare-fun lt!550000 () V!46099)

(declare-fun lt!550003 () ListLongMap!17775)

(declare-fun lt!550004 () (_ BitVec 64))

(assert (=> b!1211079 (not (contains!6974 (+!4021 lt!550003 (tuple2!19807 lt!550004 lt!550000)) lt!549999))))

(assert (=> b!1211079 (= lt!549998 (addStillNotContains!296 lt!550003 lt!550004 lt!550000 lt!549999))))

(assert (=> b!1211079 (= lt!549999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1211079 (= lt!550000 (get!19237 (select (arr!37759 _values!996) from!1455) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1211079 (= lt!550004 (select (arr!37758 _keys!1208) from!1455))))

(declare-fun call!59784 () ListLongMap!17775)

(assert (=> b!1211079 (= lt!550003 call!59784)))

(declare-fun e!687789 () ListLongMap!17775)

(assert (=> b!1211079 (= e!687789 (+!4021 call!59784 (tuple2!19807 (select (arr!37758 _keys!1208) from!1455) (get!19237 (select (arr!37759 _values!996) from!1455) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133395 () Bool)

(declare-fun e!687794 () Bool)

(assert (=> d!133395 e!687794))

(declare-fun res!804605 () Bool)

(assert (=> d!133395 (=> (not res!804605) (not e!687794))))

(assert (=> d!133395 (= res!804605 (not (contains!6974 lt!550001 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133395 (= lt!550001 e!687793)))

(declare-fun c!119396 () Bool)

(assert (=> d!133395 (= c!119396 (bvsge from!1455 (size!38294 _keys!1208)))))

(assert (=> d!133395 (validMask!0 mask!1564)))

(assert (=> d!133395 (= (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!550001)))

(declare-fun bm!59781 () Bool)

(assert (=> bm!59781 (= call!59784 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1211080 () Bool)

(assert (=> b!1211080 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38294 _keys!1208)))))

(assert (=> b!1211080 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38295 _values!996)))))

(assert (=> b!1211080 (= e!687791 (= (apply!968 lt!550001 (select (arr!37758 _keys!1208) from!1455)) (get!19237 (select (arr!37759 _values!996) from!1455) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1211081 () Bool)

(declare-fun res!804607 () Bool)

(assert (=> b!1211081 (=> (not res!804607) (not e!687794))))

(assert (=> b!1211081 (= res!804607 (not (contains!6974 lt!550001 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1211082 () Bool)

(assert (=> b!1211082 (= e!687793 e!687789)))

(declare-fun c!119394 () Bool)

(assert (=> b!1211082 (= c!119394 (validKeyInArray!0 (select (arr!37758 _keys!1208) from!1455)))))

(declare-fun b!1211083 () Bool)

(assert (=> b!1211083 (= e!687792 (isEmpty!992 lt!550001))))

(declare-fun b!1211084 () Bool)

(declare-fun e!687790 () Bool)

(assert (=> b!1211084 (= e!687790 (validKeyInArray!0 (select (arr!37758 _keys!1208) from!1455)))))

(assert (=> b!1211084 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1211085 () Bool)

(assert (=> b!1211085 (= e!687794 e!687795)))

(declare-fun c!119395 () Bool)

(assert (=> b!1211085 (= c!119395 e!687790)))

(declare-fun res!804606 () Bool)

(assert (=> b!1211085 (=> (not res!804606) (not e!687790))))

(assert (=> b!1211085 (= res!804606 (bvslt from!1455 (size!38294 _keys!1208)))))

(declare-fun b!1211086 () Bool)

(assert (=> b!1211086 (= e!687789 call!59784)))

(declare-fun b!1211087 () Bool)

(assert (=> b!1211087 (= e!687795 e!687792)))

(declare-fun c!119397 () Bool)

(assert (=> b!1211087 (= c!119397 (bvslt from!1455 (size!38294 _keys!1208)))))

(assert (= (and d!133395 c!119396) b!1211076))

(assert (= (and d!133395 (not c!119396)) b!1211082))

(assert (= (and b!1211082 c!119394) b!1211079))

(assert (= (and b!1211082 (not c!119394)) b!1211086))

(assert (= (or b!1211079 b!1211086) bm!59781))

(assert (= (and d!133395 res!804605) b!1211081))

(assert (= (and b!1211081 res!804607) b!1211085))

(assert (= (and b!1211085 res!804606) b!1211084))

(assert (= (and b!1211085 c!119395) b!1211078))

(assert (= (and b!1211085 (not c!119395)) b!1211087))

(assert (= (and b!1211078 res!804608) b!1211080))

(assert (= (and b!1211087 c!119397) b!1211077))

(assert (= (and b!1211087 (not c!119397)) b!1211083))

(declare-fun b_lambda!21639 () Bool)

(assert (=> (not b_lambda!21639) (not b!1211079)))

(assert (=> b!1211079 t!39611))

(declare-fun b_and!43147 () Bool)

(assert (= b_and!43145 (and (=> t!39611 result!22243) b_and!43147)))

(declare-fun b_lambda!21641 () Bool)

(assert (=> (not b_lambda!21641) (not b!1211080)))

(assert (=> b!1211080 t!39611))

(declare-fun b_and!43149 () Bool)

(assert (= b_and!43147 (and (=> t!39611 result!22243) b_and!43149)))

(assert (=> b!1211080 m!1116289))

(declare-fun m!1116563 () Bool)

(assert (=> b!1211080 m!1116563))

(assert (=> b!1211080 m!1116289))

(assert (=> b!1211080 m!1116297))

(assert (=> b!1211080 m!1116313))

(assert (=> b!1211080 m!1116297))

(declare-fun m!1116565 () Bool)

(assert (=> b!1211080 m!1116565))

(assert (=> b!1211080 m!1116313))

(assert (=> b!1211078 m!1116289))

(assert (=> b!1211078 m!1116289))

(declare-fun m!1116567 () Bool)

(assert (=> b!1211078 m!1116567))

(declare-fun m!1116569 () Bool)

(assert (=> b!1211081 m!1116569))

(declare-fun m!1116571 () Bool)

(assert (=> b!1211079 m!1116571))

(declare-fun m!1116573 () Bool)

(assert (=> b!1211079 m!1116573))

(declare-fun m!1116575 () Bool)

(assert (=> b!1211079 m!1116575))

(assert (=> b!1211079 m!1116571))

(assert (=> b!1211079 m!1116289))

(declare-fun m!1116577 () Bool)

(assert (=> b!1211079 m!1116577))

(assert (=> b!1211079 m!1116297))

(assert (=> b!1211079 m!1116313))

(assert (=> b!1211079 m!1116297))

(assert (=> b!1211079 m!1116565))

(assert (=> b!1211079 m!1116313))

(declare-fun m!1116579 () Bool)

(assert (=> d!133395 m!1116579))

(assert (=> d!133395 m!1116267))

(declare-fun m!1116581 () Bool)

(assert (=> b!1211077 m!1116581))

(assert (=> bm!59781 m!1116581))

(assert (=> b!1211082 m!1116289))

(assert (=> b!1211082 m!1116289))

(assert (=> b!1211082 m!1116513))

(assert (=> b!1211084 m!1116289))

(assert (=> b!1211084 m!1116289))

(assert (=> b!1211084 m!1116513))

(declare-fun m!1116583 () Bool)

(assert (=> b!1211083 m!1116583))

(assert (=> b!1210842 d!133395))

(declare-fun b!1211088 () Bool)

(declare-fun e!687797 () Bool)

(declare-fun call!59785 () Bool)

(assert (=> b!1211088 (= e!687797 call!59785)))

(declare-fun b!1211089 () Bool)

(declare-fun e!687796 () Bool)

(assert (=> b!1211089 (= e!687796 e!687797)))

(declare-fun lt!550005 () (_ BitVec 64))

(assert (=> b!1211089 (= lt!550005 (select (arr!37758 lt!549835) #b00000000000000000000000000000000))))

(declare-fun lt!550006 () Unit!40143)

(assert (=> b!1211089 (= lt!550006 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!549835 lt!550005 #b00000000000000000000000000000000))))

(assert (=> b!1211089 (arrayContainsKey!0 lt!549835 lt!550005 #b00000000000000000000000000000000)))

(declare-fun lt!550007 () Unit!40143)

(assert (=> b!1211089 (= lt!550007 lt!550006)))

(declare-fun res!804609 () Bool)

(assert (=> b!1211089 (= res!804609 (= (seekEntryOrOpen!0 (select (arr!37758 lt!549835) #b00000000000000000000000000000000) lt!549835 mask!1564) (Found!9941 #b00000000000000000000000000000000)))))

(assert (=> b!1211089 (=> (not res!804609) (not e!687797))))

(declare-fun b!1211090 () Bool)

(assert (=> b!1211090 (= e!687796 call!59785)))

(declare-fun d!133397 () Bool)

(declare-fun res!804610 () Bool)

(declare-fun e!687798 () Bool)

(assert (=> d!133397 (=> res!804610 e!687798)))

(assert (=> d!133397 (= res!804610 (bvsge #b00000000000000000000000000000000 (size!38294 lt!549835)))))

(assert (=> d!133397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549835 mask!1564) e!687798)))

(declare-fun bm!59782 () Bool)

(assert (=> bm!59782 (= call!59785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!549835 mask!1564))))

(declare-fun b!1211091 () Bool)

(assert (=> b!1211091 (= e!687798 e!687796)))

(declare-fun c!119398 () Bool)

(assert (=> b!1211091 (= c!119398 (validKeyInArray!0 (select (arr!37758 lt!549835) #b00000000000000000000000000000000)))))

(assert (= (and d!133397 (not res!804610)) b!1211091))

(assert (= (and b!1211091 c!119398) b!1211089))

(assert (= (and b!1211091 (not c!119398)) b!1211090))

(assert (= (and b!1211089 res!804609) b!1211088))

(assert (= (or b!1211088 b!1211090) bm!59782))

(declare-fun m!1116585 () Bool)

(assert (=> b!1211089 m!1116585))

(declare-fun m!1116587 () Bool)

(assert (=> b!1211089 m!1116587))

(declare-fun m!1116589 () Bool)

(assert (=> b!1211089 m!1116589))

(assert (=> b!1211089 m!1116585))

(declare-fun m!1116591 () Bool)

(assert (=> b!1211089 m!1116591))

(declare-fun m!1116593 () Bool)

(assert (=> bm!59782 m!1116593))

(assert (=> b!1211091 m!1116585))

(assert (=> b!1211091 m!1116585))

(declare-fun m!1116595 () Bool)

(assert (=> b!1211091 m!1116595))

(assert (=> b!1210865 d!133397))

(declare-fun b!1211092 () Bool)

(declare-fun e!687799 () Bool)

(declare-fun call!59786 () Bool)

(assert (=> b!1211092 (= e!687799 call!59786)))

(declare-fun bm!59783 () Bool)

(declare-fun c!119399 () Bool)

(assert (=> bm!59783 (= call!59786 (arrayNoDuplicates!0 lt!549835 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119399 (Cons!26604 (select (arr!37758 lt!549835) #b00000000000000000000000000000000) Nil!26605) Nil!26605)))))

(declare-fun b!1211093 () Bool)

(declare-fun e!687800 () Bool)

(assert (=> b!1211093 (= e!687800 e!687799)))

(assert (=> b!1211093 (= c!119399 (validKeyInArray!0 (select (arr!37758 lt!549835) #b00000000000000000000000000000000)))))

(declare-fun b!1211094 () Bool)

(declare-fun e!687801 () Bool)

(assert (=> b!1211094 (= e!687801 (contains!6977 Nil!26605 (select (arr!37758 lt!549835) #b00000000000000000000000000000000)))))

(declare-fun d!133399 () Bool)

(declare-fun res!804613 () Bool)

(declare-fun e!687802 () Bool)

(assert (=> d!133399 (=> res!804613 e!687802)))

(assert (=> d!133399 (= res!804613 (bvsge #b00000000000000000000000000000000 (size!38294 lt!549835)))))

(assert (=> d!133399 (= (arrayNoDuplicates!0 lt!549835 #b00000000000000000000000000000000 Nil!26605) e!687802)))

(declare-fun b!1211095 () Bool)

(assert (=> b!1211095 (= e!687802 e!687800)))

(declare-fun res!804611 () Bool)

(assert (=> b!1211095 (=> (not res!804611) (not e!687800))))

(assert (=> b!1211095 (= res!804611 (not e!687801))))

(declare-fun res!804612 () Bool)

(assert (=> b!1211095 (=> (not res!804612) (not e!687801))))

(assert (=> b!1211095 (= res!804612 (validKeyInArray!0 (select (arr!37758 lt!549835) #b00000000000000000000000000000000)))))

(declare-fun b!1211096 () Bool)

(assert (=> b!1211096 (= e!687799 call!59786)))

(assert (= (and d!133399 (not res!804613)) b!1211095))

(assert (= (and b!1211095 res!804612) b!1211094))

(assert (= (and b!1211095 res!804611) b!1211093))

(assert (= (and b!1211093 c!119399) b!1211096))

(assert (= (and b!1211093 (not c!119399)) b!1211092))

(assert (= (or b!1211096 b!1211092) bm!59783))

(assert (=> bm!59783 m!1116585))

(declare-fun m!1116597 () Bool)

(assert (=> bm!59783 m!1116597))

(assert (=> b!1211093 m!1116585))

(assert (=> b!1211093 m!1116585))

(assert (=> b!1211093 m!1116595))

(assert (=> b!1211094 m!1116585))

(assert (=> b!1211094 m!1116585))

(declare-fun m!1116599 () Bool)

(assert (=> b!1211094 m!1116599))

(assert (=> b!1211095 m!1116585))

(assert (=> b!1211095 m!1116585))

(assert (=> b!1211095 m!1116595))

(assert (=> b!1210858 d!133399))

(assert (=> bm!59741 d!133367))

(declare-fun d!133401 () Bool)

(assert (=> d!133401 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1210840 d!133401))

(declare-fun d!133403 () Bool)

(declare-fun e!687804 () Bool)

(assert (=> d!133403 e!687804))

(declare-fun res!804614 () Bool)

(assert (=> d!133403 (=> res!804614 e!687804)))

(declare-fun lt!550010 () Bool)

(assert (=> d!133403 (= res!804614 (not lt!550010))))

(declare-fun lt!550011 () Bool)

(assert (=> d!133403 (= lt!550010 lt!550011)))

(declare-fun lt!550009 () Unit!40143)

(declare-fun e!687803 () Unit!40143)

(assert (=> d!133403 (= lt!550009 e!687803)))

(declare-fun c!119400 () Bool)

(assert (=> d!133403 (= c!119400 lt!550011)))

(assert (=> d!133403 (= lt!550011 (containsKey!595 (toList!8903 call!59741) k0!934))))

(assert (=> d!133403 (= (contains!6974 call!59741 k0!934) lt!550010)))

(declare-fun b!1211097 () Bool)

(declare-fun lt!550008 () Unit!40143)

(assert (=> b!1211097 (= e!687803 lt!550008)))

(assert (=> b!1211097 (= lt!550008 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8903 call!59741) k0!934))))

(assert (=> b!1211097 (isDefined!464 (getValueByKey!639 (toList!8903 call!59741) k0!934))))

(declare-fun b!1211098 () Bool)

(declare-fun Unit!40155 () Unit!40143)

(assert (=> b!1211098 (= e!687803 Unit!40155)))

(declare-fun b!1211099 () Bool)

(assert (=> b!1211099 (= e!687804 (isDefined!464 (getValueByKey!639 (toList!8903 call!59741) k0!934)))))

(assert (= (and d!133403 c!119400) b!1211097))

(assert (= (and d!133403 (not c!119400)) b!1211098))

(assert (= (and d!133403 (not res!804614)) b!1211099))

(declare-fun m!1116601 () Bool)

(assert (=> d!133403 m!1116601))

(declare-fun m!1116603 () Bool)

(assert (=> b!1211097 m!1116603))

(declare-fun m!1116605 () Bool)

(assert (=> b!1211097 m!1116605))

(assert (=> b!1211097 m!1116605))

(declare-fun m!1116607 () Bool)

(assert (=> b!1211097 m!1116607))

(assert (=> b!1211099 m!1116605))

(assert (=> b!1211099 m!1116605))

(assert (=> b!1211099 m!1116607))

(assert (=> b!1210863 d!133403))

(declare-fun d!133405 () Bool)

(declare-fun e!687805 () Bool)

(assert (=> d!133405 e!687805))

(declare-fun res!804615 () Bool)

(assert (=> d!133405 (=> (not res!804615) (not e!687805))))

(declare-fun lt!550015 () ListLongMap!17775)

(assert (=> d!133405 (= res!804615 (contains!6974 lt!550015 (_1!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!550013 () List!26607)

(assert (=> d!133405 (= lt!550015 (ListLongMap!17776 lt!550013))))

(declare-fun lt!550014 () Unit!40143)

(declare-fun lt!550012 () Unit!40143)

(assert (=> d!133405 (= lt!550014 lt!550012)))

(assert (=> d!133405 (= (getValueByKey!639 lt!550013 (_1!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!689 (_2!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133405 (= lt!550012 (lemmaContainsTupThenGetReturnValue!316 lt!550013 (_1!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133405 (= lt!550013 (insertStrictlySorted!409 (toList!8903 lt!549830) (_1!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133405 (= (+!4021 lt!549830 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!550015)))

(declare-fun b!1211100 () Bool)

(declare-fun res!804616 () Bool)

(assert (=> b!1211100 (=> (not res!804616) (not e!687805))))

(assert (=> b!1211100 (= res!804616 (= (getValueByKey!639 (toList!8903 lt!550015) (_1!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!689 (_2!9914 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1211101 () Bool)

(assert (=> b!1211101 (= e!687805 (contains!6976 (toList!8903 lt!550015) (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133405 res!804615) b!1211100))

(assert (= (and b!1211100 res!804616) b!1211101))

(declare-fun m!1116609 () Bool)

(assert (=> d!133405 m!1116609))

(declare-fun m!1116611 () Bool)

(assert (=> d!133405 m!1116611))

(declare-fun m!1116613 () Bool)

(assert (=> d!133405 m!1116613))

(declare-fun m!1116615 () Bool)

(assert (=> d!133405 m!1116615))

(declare-fun m!1116617 () Bool)

(assert (=> b!1211100 m!1116617))

(declare-fun m!1116619 () Bool)

(assert (=> b!1211101 m!1116619))

(assert (=> b!1210863 d!133405))

(declare-fun d!133407 () Bool)

(assert (=> d!133407 (contains!6974 (+!4021 lt!549830 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!550016 () Unit!40143)

(assert (=> d!133407 (= lt!550016 (choose!1815 lt!549830 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133407 (contains!6974 lt!549830 k0!934)))

(assert (=> d!133407 (= (addStillContains!1049 lt!549830 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!550016)))

(declare-fun bs!34199 () Bool)

(assert (= bs!34199 d!133407))

(assert (=> bs!34199 m!1116327))

(assert (=> bs!34199 m!1116327))

(declare-fun m!1116621 () Bool)

(assert (=> bs!34199 m!1116621))

(declare-fun m!1116623 () Bool)

(assert (=> bs!34199 m!1116623))

(assert (=> bs!34199 m!1116319))

(assert (=> b!1210863 d!133407))

(declare-fun bm!59788 () Bool)

(declare-fun call!59791 () ListLongMap!17775)

(assert (=> bm!59788 (= call!59791 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!59792 () ListLongMap!17775)

(declare-fun bm!59789 () Bool)

(assert (=> bm!59789 (= call!59792 (getCurrentListMapNoExtraKeys!5335 (array!78244 (store (arr!37758 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38294 _keys!1208)) (array!78246 (store (arr!37759 _values!996) i!673 (ValueCellFull!14655 (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38295 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211108 () Bool)

(declare-fun e!687810 () Bool)

(declare-fun e!687811 () Bool)

(assert (=> b!1211108 (= e!687810 e!687811)))

(declare-fun c!119403 () Bool)

(assert (=> b!1211108 (= c!119403 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133409 () Bool)

(assert (=> d!133409 e!687810))

(declare-fun res!804619 () Bool)

(assert (=> d!133409 (=> (not res!804619) (not e!687810))))

(assert (=> d!133409 (= res!804619 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38294 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38294 _keys!1208))))))))

(declare-fun lt!550019 () Unit!40143)

(declare-fun choose!1816 (array!78243 array!78245 (_ BitVec 32) (_ BitVec 32) V!46099 V!46099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40143)

(assert (=> d!133409 (= lt!550019 (choose!1816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133409 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 _keys!1208)))))

(assert (=> d!133409 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!550019)))

(declare-fun b!1211109 () Bool)

(assert (=> b!1211109 (= e!687811 (= call!59792 call!59791))))

(assert (=> b!1211109 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38295 _values!996)))))

(declare-fun b!1211110 () Bool)

(assert (=> b!1211110 (= e!687811 (= call!59792 (-!1852 call!59791 k0!934)))))

(assert (=> b!1211110 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38295 _values!996)))))

(assert (= (and d!133409 res!804619) b!1211108))

(assert (= (and b!1211108 c!119403) b!1211110))

(assert (= (and b!1211108 (not c!119403)) b!1211109))

(assert (= (or b!1211110 b!1211109) bm!59788))

(assert (= (or b!1211110 b!1211109) bm!59789))

(declare-fun b_lambda!21643 () Bool)

(assert (=> (not b_lambda!21643) (not bm!59789)))

(assert (=> bm!59789 t!39611))

(declare-fun b_and!43151 () Bool)

(assert (= b_and!43149 (and (=> t!39611 result!22243) b_and!43151)))

(assert (=> bm!59788 m!1116263))

(assert (=> bm!59789 m!1116283))

(assert (=> bm!59789 m!1116297))

(declare-fun m!1116625 () Bool)

(assert (=> bm!59789 m!1116625))

(declare-fun m!1116627 () Bool)

(assert (=> bm!59789 m!1116627))

(declare-fun m!1116629 () Bool)

(assert (=> d!133409 m!1116629))

(declare-fun m!1116631 () Bool)

(assert (=> b!1211110 m!1116631))

(assert (=> b!1210838 d!133409))

(declare-fun d!133411 () Bool)

(declare-fun e!687812 () Bool)

(assert (=> d!133411 e!687812))

(declare-fun res!804620 () Bool)

(assert (=> d!133411 (=> (not res!804620) (not e!687812))))

(declare-fun lt!550023 () ListLongMap!17775)

(assert (=> d!133411 (= res!804620 (contains!6974 lt!550023 (_1!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!550021 () List!26607)

(assert (=> d!133411 (= lt!550023 (ListLongMap!17776 lt!550021))))

(declare-fun lt!550022 () Unit!40143)

(declare-fun lt!550020 () Unit!40143)

(assert (=> d!133411 (= lt!550022 lt!550020)))

(assert (=> d!133411 (= (getValueByKey!639 lt!550021 (_1!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!689 (_2!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133411 (= lt!550020 (lemmaContainsTupThenGetReturnValue!316 lt!550021 (_1!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133411 (= lt!550021 (insertStrictlySorted!409 (toList!8903 (ite c!119341 lt!549833 lt!549830)) (_1!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133411 (= (+!4021 (ite c!119341 lt!549833 lt!549830) (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!550023)))

(declare-fun b!1211111 () Bool)

(declare-fun res!804621 () Bool)

(assert (=> b!1211111 (=> (not res!804621) (not e!687812))))

(assert (=> b!1211111 (= res!804621 (= (getValueByKey!639 (toList!8903 lt!550023) (_1!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!689 (_2!9914 (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1211112 () Bool)

(assert (=> b!1211112 (= e!687812 (contains!6976 (toList!8903 lt!550023) (ite c!119341 (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119338 (tuple2!19807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133411 res!804620) b!1211111))

(assert (= (and b!1211111 res!804621) b!1211112))

(declare-fun m!1116633 () Bool)

(assert (=> d!133411 m!1116633))

(declare-fun m!1116635 () Bool)

(assert (=> d!133411 m!1116635))

(declare-fun m!1116637 () Bool)

(assert (=> d!133411 m!1116637))

(declare-fun m!1116639 () Bool)

(assert (=> d!133411 m!1116639))

(declare-fun m!1116641 () Bool)

(assert (=> b!1211111 m!1116641))

(declare-fun m!1116643 () Bool)

(assert (=> b!1211112 m!1116643))

(assert (=> bm!59740 d!133411))

(declare-fun d!133413 () Bool)

(declare-fun lt!550024 () ListLongMap!17775)

(assert (=> d!133413 (not (contains!6974 lt!550024 k0!934))))

(assert (=> d!133413 (= lt!550024 (ListLongMap!17776 (removeStrictlySorted!101 (toList!8903 call!59747) k0!934)))))

(assert (=> d!133413 (= (-!1852 call!59747 k0!934) lt!550024)))

(declare-fun bs!34200 () Bool)

(assert (= bs!34200 d!133413))

(declare-fun m!1116645 () Bool)

(assert (=> bs!34200 m!1116645))

(declare-fun m!1116647 () Bool)

(assert (=> bs!34200 m!1116647))

(assert (=> b!1210855 d!133413))

(declare-fun b!1211113 () Bool)

(declare-fun e!687817 () ListLongMap!17775)

(assert (=> b!1211113 (= e!687817 (ListLongMap!17776 Nil!26604))))

(declare-fun e!687816 () Bool)

(declare-fun b!1211114 () Bool)

(declare-fun lt!550028 () ListLongMap!17775)

(assert (=> b!1211114 (= e!687816 (= lt!550028 (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1211115 () Bool)

(declare-fun e!687819 () Bool)

(declare-fun e!687815 () Bool)

(assert (=> b!1211115 (= e!687819 e!687815)))

(assert (=> b!1211115 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 lt!549835)))))

(declare-fun res!804625 () Bool)

(assert (=> b!1211115 (= res!804625 (contains!6974 lt!550028 (select (arr!37758 lt!549835) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1211115 (=> (not res!804625) (not e!687815))))

(declare-fun b!1211116 () Bool)

(declare-fun lt!550029 () Unit!40143)

(declare-fun lt!550025 () Unit!40143)

(assert (=> b!1211116 (= lt!550029 lt!550025)))

(declare-fun lt!550031 () (_ BitVec 64))

(declare-fun lt!550030 () ListLongMap!17775)

(declare-fun lt!550026 () (_ BitVec 64))

(declare-fun lt!550027 () V!46099)

(assert (=> b!1211116 (not (contains!6974 (+!4021 lt!550030 (tuple2!19807 lt!550031 lt!550027)) lt!550026))))

(assert (=> b!1211116 (= lt!550025 (addStillNotContains!296 lt!550030 lt!550031 lt!550027 lt!550026))))

(assert (=> b!1211116 (= lt!550026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1211116 (= lt!550027 (get!19237 (select (arr!37759 lt!549845) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1211116 (= lt!550031 (select (arr!37758 lt!549835) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!59793 () ListLongMap!17775)

(assert (=> b!1211116 (= lt!550030 call!59793)))

(declare-fun e!687813 () ListLongMap!17775)

(assert (=> b!1211116 (= e!687813 (+!4021 call!59793 (tuple2!19807 (select (arr!37758 lt!549835) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19237 (select (arr!37759 lt!549845) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133415 () Bool)

(declare-fun e!687818 () Bool)

(assert (=> d!133415 e!687818))

(declare-fun res!804622 () Bool)

(assert (=> d!133415 (=> (not res!804622) (not e!687818))))

(assert (=> d!133415 (= res!804622 (not (contains!6974 lt!550028 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133415 (= lt!550028 e!687817)))

(declare-fun c!119406 () Bool)

(assert (=> d!133415 (= c!119406 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 lt!549835)))))

(assert (=> d!133415 (validMask!0 mask!1564)))

(assert (=> d!133415 (= (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!550028)))

(declare-fun bm!59790 () Bool)

(assert (=> bm!59790 (= call!59793 (getCurrentListMapNoExtraKeys!5335 lt!549835 lt!549845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1211117 () Bool)

(assert (=> b!1211117 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 lt!549835)))))

(assert (=> b!1211117 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38295 lt!549845)))))

(assert (=> b!1211117 (= e!687815 (= (apply!968 lt!550028 (select (arr!37758 lt!549835) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19237 (select (arr!37759 lt!549845) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3232 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1211118 () Bool)

(declare-fun res!804624 () Bool)

(assert (=> b!1211118 (=> (not res!804624) (not e!687818))))

(assert (=> b!1211118 (= res!804624 (not (contains!6974 lt!550028 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1211119 () Bool)

(assert (=> b!1211119 (= e!687817 e!687813)))

(declare-fun c!119404 () Bool)

(assert (=> b!1211119 (= c!119404 (validKeyInArray!0 (select (arr!37758 lt!549835) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1211120 () Bool)

(assert (=> b!1211120 (= e!687816 (isEmpty!992 lt!550028))))

(declare-fun b!1211121 () Bool)

(declare-fun e!687814 () Bool)

(assert (=> b!1211121 (= e!687814 (validKeyInArray!0 (select (arr!37758 lt!549835) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1211121 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1211122 () Bool)

(assert (=> b!1211122 (= e!687818 e!687819)))

(declare-fun c!119405 () Bool)

(assert (=> b!1211122 (= c!119405 e!687814)))

(declare-fun res!804623 () Bool)

(assert (=> b!1211122 (=> (not res!804623) (not e!687814))))

(assert (=> b!1211122 (= res!804623 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 lt!549835)))))

(declare-fun b!1211123 () Bool)

(assert (=> b!1211123 (= e!687813 call!59793)))

(declare-fun b!1211124 () Bool)

(assert (=> b!1211124 (= e!687819 e!687816)))

(declare-fun c!119407 () Bool)

(assert (=> b!1211124 (= c!119407 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38294 lt!549835)))))

(assert (= (and d!133415 c!119406) b!1211113))

(assert (= (and d!133415 (not c!119406)) b!1211119))

(assert (= (and b!1211119 c!119404) b!1211116))

(assert (= (and b!1211119 (not c!119404)) b!1211123))

(assert (= (or b!1211116 b!1211123) bm!59790))

(assert (= (and d!133415 res!804622) b!1211118))

(assert (= (and b!1211118 res!804624) b!1211122))

(assert (= (and b!1211122 res!804623) b!1211121))

(assert (= (and b!1211122 c!119405) b!1211115))

(assert (= (and b!1211122 (not c!119405)) b!1211124))

(assert (= (and b!1211115 res!804625) b!1211117))

(assert (= (and b!1211124 c!119407) b!1211114))

(assert (= (and b!1211124 (not c!119407)) b!1211120))

(declare-fun b_lambda!21645 () Bool)

(assert (=> (not b_lambda!21645) (not b!1211116)))

(assert (=> b!1211116 t!39611))

(declare-fun b_and!43153 () Bool)

(assert (= b_and!43151 (and (=> t!39611 result!22243) b_and!43153)))

(declare-fun b_lambda!21647 () Bool)

(assert (=> (not b_lambda!21647) (not b!1211117)))

(assert (=> b!1211117 t!39611))

(declare-fun b_and!43155 () Bool)

(assert (= b_and!43153 (and (=> t!39611 result!22243) b_and!43155)))

(declare-fun m!1116649 () Bool)

(assert (=> b!1211117 m!1116649))

(declare-fun m!1116651 () Bool)

(assert (=> b!1211117 m!1116651))

(assert (=> b!1211117 m!1116649))

(assert (=> b!1211117 m!1116297))

(declare-fun m!1116653 () Bool)

(assert (=> b!1211117 m!1116653))

(assert (=> b!1211117 m!1116297))

(declare-fun m!1116655 () Bool)

(assert (=> b!1211117 m!1116655))

(assert (=> b!1211117 m!1116653))

(assert (=> b!1211115 m!1116649))

(assert (=> b!1211115 m!1116649))

(declare-fun m!1116657 () Bool)

(assert (=> b!1211115 m!1116657))

(declare-fun m!1116659 () Bool)

(assert (=> b!1211118 m!1116659))

(declare-fun m!1116661 () Bool)

(assert (=> b!1211116 m!1116661))

(declare-fun m!1116663 () Bool)

(assert (=> b!1211116 m!1116663))

(declare-fun m!1116665 () Bool)

(assert (=> b!1211116 m!1116665))

(assert (=> b!1211116 m!1116661))

(assert (=> b!1211116 m!1116649))

(declare-fun m!1116667 () Bool)

(assert (=> b!1211116 m!1116667))

(assert (=> b!1211116 m!1116297))

(assert (=> b!1211116 m!1116653))

(assert (=> b!1211116 m!1116297))

(assert (=> b!1211116 m!1116655))

(assert (=> b!1211116 m!1116653))

(declare-fun m!1116669 () Bool)

(assert (=> d!133415 m!1116669))

(assert (=> d!133415 m!1116267))

(declare-fun m!1116671 () Bool)

(assert (=> b!1211114 m!1116671))

(assert (=> bm!59790 m!1116671))

(assert (=> b!1211119 m!1116649))

(assert (=> b!1211119 m!1116649))

(declare-fun m!1116673 () Bool)

(assert (=> b!1211119 m!1116673))

(assert (=> b!1211121 m!1116649))

(assert (=> b!1211121 m!1116649))

(assert (=> b!1211121 m!1116673))

(declare-fun m!1116675 () Bool)

(assert (=> b!1211120 m!1116675))

(assert (=> bm!59744 d!133415))

(declare-fun d!133417 () Bool)

(assert (=> d!133417 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1210846 d!133417))

(declare-fun b!1211132 () Bool)

(declare-fun e!687824 () Bool)

(assert (=> b!1211132 (= e!687824 tp_is_empty!30729)))

(declare-fun mapNonEmpty!47968 () Bool)

(declare-fun mapRes!47968 () Bool)

(declare-fun tp!91100 () Bool)

(declare-fun e!687825 () Bool)

(assert (=> mapNonEmpty!47968 (= mapRes!47968 (and tp!91100 e!687825))))

(declare-fun mapRest!47968 () (Array (_ BitVec 32) ValueCell!14655))

(declare-fun mapKey!47968 () (_ BitVec 32))

(declare-fun mapValue!47968 () ValueCell!14655)

(assert (=> mapNonEmpty!47968 (= mapRest!47962 (store mapRest!47968 mapKey!47968 mapValue!47968))))

(declare-fun mapIsEmpty!47968 () Bool)

(assert (=> mapIsEmpty!47968 mapRes!47968))

(declare-fun condMapEmpty!47968 () Bool)

(declare-fun mapDefault!47968 () ValueCell!14655)

(assert (=> mapNonEmpty!47962 (= condMapEmpty!47968 (= mapRest!47962 ((as const (Array (_ BitVec 32) ValueCell!14655)) mapDefault!47968)))))

(assert (=> mapNonEmpty!47962 (= tp!91090 (and e!687824 mapRes!47968))))

(declare-fun b!1211131 () Bool)

(assert (=> b!1211131 (= e!687825 tp_is_empty!30729)))

(assert (= (and mapNonEmpty!47962 condMapEmpty!47968) mapIsEmpty!47968))

(assert (= (and mapNonEmpty!47962 (not condMapEmpty!47968)) mapNonEmpty!47968))

(assert (= (and mapNonEmpty!47968 ((_ is ValueCellFull!14655) mapValue!47968)) b!1211131))

(assert (= (and mapNonEmpty!47962 ((_ is ValueCellFull!14655) mapDefault!47968)) b!1211132))

(declare-fun m!1116677 () Bool)

(assert (=> mapNonEmpty!47968 m!1116677))

(declare-fun b_lambda!21649 () Bool)

(assert (= b_lambda!21643 (or (and start!101026 b_free!26025) b_lambda!21649)))

(declare-fun b_lambda!21651 () Bool)

(assert (= b_lambda!21639 (or (and start!101026 b_free!26025) b_lambda!21651)))

(declare-fun b_lambda!21653 () Bool)

(assert (= b_lambda!21635 (or (and start!101026 b_free!26025) b_lambda!21653)))

(declare-fun b_lambda!21655 () Bool)

(assert (= b_lambda!21631 (or (and start!101026 b_free!26025) b_lambda!21655)))

(declare-fun b_lambda!21657 () Bool)

(assert (= b_lambda!21645 (or (and start!101026 b_free!26025) b_lambda!21657)))

(declare-fun b_lambda!21659 () Bool)

(assert (= b_lambda!21641 (or (and start!101026 b_free!26025) b_lambda!21659)))

(declare-fun b_lambda!21661 () Bool)

(assert (= b_lambda!21633 (or (and start!101026 b_free!26025) b_lambda!21661)))

(declare-fun b_lambda!21663 () Bool)

(assert (= b_lambda!21647 (or (and start!101026 b_free!26025) b_lambda!21663)))

(declare-fun b_lambda!21665 () Bool)

(assert (= b_lambda!21637 (or (and start!101026 b_free!26025) b_lambda!21665)))

(check-sat (not b!1211025) (not b!1211112) (not b!1211111) (not b!1211080) (not d!133393) (not b_lambda!21657) b_and!43155 (not d!133395) (not b!1211077) (not b!1211008) (not bm!59782) (not b!1211099) (not b!1210972) (not b!1211120) (not b!1211039) (not b!1211094) (not b!1211101) (not bm!59775) (not bm!59790) (not b!1211082) (not b!1211119) (not b!1211060) (not b!1211061) (not d!133391) (not b!1210962) (not b_next!26025) (not b!1211118) (not d!133383) (not b!1211011) (not b!1211083) (not b!1211079) (not b!1211097) (not b!1211068) (not bm!59783) (not b!1211072) (not d!133387) (not b!1210974) (not bm!59778) (not b!1211116) (not bm!59781) (not b!1211110) (not d!133367) (not b!1211010) (not b_lambda!21655) (not b!1211078) (not b!1210979) (not d!133377) (not b!1211114) (not b!1211009) (not b_lambda!21629) (not b!1211031) (not b!1211121) (not b!1211065) tp_is_empty!30729 (not b!1211093) (not d!133363) (not b!1211057) (not b!1211069) (not d!133415) (not d!133375) (not b!1211117) (not bm!59788) (not b!1211034) (not mapNonEmpty!47968) (not bm!59789) (not b!1211071) (not d!133373) (not b_lambda!21665) (not b_lambda!21659) (not d!133403) (not b!1211070) (not d!133369) (not d!133405) (not bm!59772) (not b!1211013) (not b!1211091) (not b_lambda!21653) (not b!1210980) (not b!1211053) (not b!1211095) (not b!1211081) (not b_lambda!21651) (not d!133413) (not b!1211084) (not b!1211030) (not b!1211059) (not bm!59780) (not b_lambda!21649) (not b!1211067) (not b!1211100) (not b_lambda!21661) (not b!1211023) (not d!133365) (not b!1211115) (not d!133379) (not b_lambda!21663) (not d!133361) (not b!1211006) (not b!1211054) (not b!1211007) (not b!1211032) (not b!1211012) (not bm!59779) (not d!133407) (not b!1211052) (not b!1211066) (not b!1211089) (not d!133409) (not d!133411))
(check-sat b_and!43155 (not b_next!26025))
