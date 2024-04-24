; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98890 () Bool)

(assert start!98890)

(declare-fun b_free!24259 () Bool)

(declare-fun b_next!24259 () Bool)

(assert (=> start!98890 (= b_free!24259 (not b_next!24259))))

(declare-fun tp!85488 () Bool)

(declare-fun b_and!39369 () Bool)

(assert (=> start!98890 (= tp!85488 b_and!39369)))

(declare-fun mapNonEmpty!45008 () Bool)

(declare-fun mapRes!45008 () Bool)

(declare-fun tp!85487 () Bool)

(declare-fun e!653231 () Bool)

(assert (=> mapNonEmpty!45008 (= mapRes!45008 (and tp!85487 e!653231))))

(declare-fun mapKey!45008 () (_ BitVec 32))

(declare-datatypes ((V!43513 0))(
  ( (V!43514 (val!14451 Int)) )
))
(declare-datatypes ((ValueCell!13685 0))(
  ( (ValueCellFull!13685 (v!17084 V!43513)) (EmptyCell!13685) )
))
(declare-fun mapValue!45008 () ValueCell!13685)

(declare-datatypes ((array!74473 0))(
  ( (array!74474 (arr!35881 (Array (_ BitVec 32) ValueCell!13685)) (size!36418 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74473)

(declare-fun mapRest!45008 () (Array (_ BitVec 32) ValueCell!13685))

(assert (=> mapNonEmpty!45008 (= (arr!35881 _values!996) (store mapRest!45008 mapKey!45008 mapValue!45008))))

(declare-fun b!1148215 () Bool)

(declare-fun res!764009 () Bool)

(declare-fun e!653230 () Bool)

(assert (=> b!1148215 (=> (not res!764009) (not e!653230))))

(declare-datatypes ((array!74475 0))(
  ( (array!74476 (arr!35882 (Array (_ BitVec 32) (_ BitVec 64))) (size!36419 (_ BitVec 32))) )
))
(declare-fun lt!512834 () array!74475)

(declare-datatypes ((List!25084 0))(
  ( (Nil!25081) (Cons!25080 (h!26298 (_ BitVec 64)) (t!36327 List!25084)) )
))
(declare-fun arrayNoDuplicates!0 (array!74475 (_ BitVec 32) List!25084) Bool)

(assert (=> b!1148215 (= res!764009 (arrayNoDuplicates!0 lt!512834 #b00000000000000000000000000000000 Nil!25081))))

(declare-fun b!1148216 () Bool)

(declare-fun res!764002 () Bool)

(declare-fun e!653222 () Bool)

(assert (=> b!1148216 (=> (not res!764002) (not e!653222))))

(declare-fun _keys!1208 () array!74475)

(assert (=> b!1148216 (= res!764002 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25081))))

(declare-fun b!1148217 () Bool)

(declare-fun res!764005 () Bool)

(assert (=> b!1148217 (=> (not res!764005) (not e!653222))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1148217 (= res!764005 (= (select (arr!35882 _keys!1208) i!673) k0!934))))

(declare-fun b!1148218 () Bool)

(declare-fun res!764006 () Bool)

(assert (=> b!1148218 (=> (not res!764006) (not e!653222))))

(assert (=> b!1148218 (= res!764006 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36419 _keys!1208))))))

(declare-fun e!653223 () Bool)

(declare-fun b!1148219 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148219 (= e!653223 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148220 () Bool)

(declare-fun e!653226 () Bool)

(assert (=> b!1148220 (= e!653226 true)))

(declare-fun e!653233 () Bool)

(assert (=> b!1148220 e!653233))

(declare-fun res!764010 () Bool)

(assert (=> b!1148220 (=> (not res!764010) (not e!653233))))

(declare-datatypes ((tuple2!18330 0))(
  ( (tuple2!18331 (_1!9176 (_ BitVec 64)) (_2!9176 V!43513)) )
))
(declare-datatypes ((List!25085 0))(
  ( (Nil!25082) (Cons!25081 (h!26299 tuple2!18330) (t!36328 List!25085)) )
))
(declare-datatypes ((ListLongMap!16307 0))(
  ( (ListLongMap!16308 (toList!8169 List!25085)) )
))
(declare-fun lt!512852 () ListLongMap!16307)

(declare-fun lt!512837 () V!43513)

(declare-fun -!1294 (ListLongMap!16307 (_ BitVec 64)) ListLongMap!16307)

(declare-fun +!3609 (ListLongMap!16307 tuple2!18330) ListLongMap!16307)

(assert (=> b!1148220 (= res!764010 (= (-!1294 (+!3609 lt!512852 (tuple2!18331 (select (arr!35882 _keys!1208) from!1455) lt!512837)) (select (arr!35882 _keys!1208) from!1455)) lt!512852))))

(declare-datatypes ((Unit!37650 0))(
  ( (Unit!37651) )
))
(declare-fun lt!512842 () Unit!37650)

(declare-fun addThenRemoveForNewKeyIsSame!147 (ListLongMap!16307 (_ BitVec 64) V!43513) Unit!37650)

(assert (=> b!1148220 (= lt!512842 (addThenRemoveForNewKeyIsSame!147 lt!512852 (select (arr!35882 _keys!1208) from!1455) lt!512837))))

(declare-fun lt!512843 () V!43513)

(declare-fun get!18278 (ValueCell!13685 V!43513) V!43513)

(assert (=> b!1148220 (= lt!512837 (get!18278 (select (arr!35881 _values!996) from!1455) lt!512843))))

(declare-fun lt!512840 () Unit!37650)

(declare-fun e!653235 () Unit!37650)

(assert (=> b!1148220 (= lt!512840 e!653235)))

(declare-fun c!113587 () Bool)

(declare-fun contains!6708 (ListLongMap!16307 (_ BitVec 64)) Bool)

(assert (=> b!1148220 (= c!113587 (contains!6708 lt!512852 k0!934))))

(declare-fun zeroValue!944 () V!43513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43513)

(declare-fun getCurrentListMapNoExtraKeys!4673 (array!74475 array!74473 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 32) Int) ListLongMap!16307)

(assert (=> b!1148220 (= lt!512852 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148221 () Bool)

(declare-fun call!52717 () ListLongMap!16307)

(assert (=> b!1148221 (contains!6708 call!52717 k0!934)))

(declare-fun lt!512854 () ListLongMap!16307)

(declare-fun lt!512849 () Unit!37650)

(declare-fun addStillContains!836 (ListLongMap!16307 (_ BitVec 64) V!43513 (_ BitVec 64)) Unit!37650)

(assert (=> b!1148221 (= lt!512849 (addStillContains!836 lt!512854 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52718 () Bool)

(assert (=> b!1148221 call!52718))

(assert (=> b!1148221 (= lt!512854 (+!3609 lt!512852 (tuple2!18331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512841 () Unit!37650)

(declare-fun call!52715 () Unit!37650)

(assert (=> b!1148221 (= lt!512841 call!52715)))

(declare-fun e!653229 () Unit!37650)

(assert (=> b!1148221 (= e!653229 lt!512849)))

(declare-fun b!1148222 () Bool)

(declare-fun res!764004 () Bool)

(assert (=> b!1148222 (=> (not res!764004) (not e!653222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74475 (_ BitVec 32)) Bool)

(assert (=> b!1148222 (= res!764004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148223 () Bool)

(declare-fun e!653232 () Unit!37650)

(declare-fun e!653220 () Unit!37650)

(assert (=> b!1148223 (= e!653232 e!653220)))

(declare-fun c!113589 () Bool)

(declare-fun lt!512846 () Bool)

(assert (=> b!1148223 (= c!113589 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512846))))

(declare-fun mapIsEmpty!45008 () Bool)

(assert (=> mapIsEmpty!45008 mapRes!45008))

(declare-fun b!1148224 () Bool)

(declare-fun lt!512844 () ListLongMap!16307)

(assert (=> b!1148224 (= e!653233 (= (-!1294 lt!512844 k0!934) lt!512852))))

(declare-fun b!1148225 () Bool)

(declare-fun Unit!37652 () Unit!37650)

(assert (=> b!1148225 (= e!653235 Unit!37652)))

(assert (=> b!1148225 (= lt!512846 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113592 () Bool)

(assert (=> b!1148225 (= c!113592 (and (not lt!512846) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512838 () Unit!37650)

(assert (=> b!1148225 (= lt!512838 e!653229)))

(declare-fun lt!512836 () Unit!37650)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!431 (array!74475 array!74473 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 64) (_ BitVec 32) Int) Unit!37650)

(assert (=> b!1148225 (= lt!512836 (lemmaListMapContainsThenArrayContainsFrom!431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113591 () Bool)

(assert (=> b!1148225 (= c!113591 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764008 () Bool)

(assert (=> b!1148225 (= res!764008 e!653223)))

(declare-fun e!653225 () Bool)

(assert (=> b!1148225 (=> (not res!764008) (not e!653225))))

(assert (=> b!1148225 e!653225))

(declare-fun lt!512847 () Unit!37650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74475 (_ BitVec 32) (_ BitVec 32)) Unit!37650)

(assert (=> b!1148225 (= lt!512847 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148225 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25081)))

(declare-fun lt!512851 () Unit!37650)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74475 (_ BitVec 64) (_ BitVec 32) List!25084) Unit!37650)

(assert (=> b!1148225 (= lt!512851 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25081))))

(assert (=> b!1148225 false))

(declare-fun b!1148226 () Bool)

(declare-fun res!764013 () Bool)

(assert (=> b!1148226 (=> (not res!764013) (not e!653222))))

(assert (=> b!1148226 (= res!764013 (and (= (size!36418 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36419 _keys!1208) (size!36418 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52712 () Bool)

(declare-fun call!52716 () Unit!37650)

(assert (=> bm!52712 (= call!52716 call!52715)))

(declare-fun b!1148227 () Bool)

(declare-fun res!764012 () Bool)

(assert (=> b!1148227 (=> (not res!764012) (not e!653222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148227 (= res!764012 (validKeyInArray!0 k0!934))))

(declare-fun b!1148228 () Bool)

(declare-fun e!653224 () Bool)

(assert (=> b!1148228 (= e!653230 (not e!653224))))

(declare-fun res!764014 () Bool)

(assert (=> b!1148228 (=> res!764014 e!653224)))

(assert (=> b!1148228 (= res!764014 (bvsgt from!1455 i!673))))

(assert (=> b!1148228 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512850 () Unit!37650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74475 (_ BitVec 64) (_ BitVec 32)) Unit!37650)

(assert (=> b!1148228 (= lt!512850 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52713 () Bool)

(declare-fun call!52719 () ListLongMap!16307)

(assert (=> bm!52713 (= call!52719 call!52717)))

(declare-fun b!1148229 () Bool)

(declare-fun Unit!37653 () Unit!37650)

(assert (=> b!1148229 (= e!653220 Unit!37653)))

(declare-fun b!1148230 () Bool)

(declare-fun lt!512835 () Unit!37650)

(assert (=> b!1148230 (= e!653232 lt!512835)))

(assert (=> b!1148230 (= lt!512835 call!52716)))

(declare-fun call!52721 () Bool)

(assert (=> b!1148230 call!52721))

(declare-fun b!1148231 () Bool)

(assert (=> b!1148231 (= e!653222 e!653230)))

(declare-fun res!764011 () Bool)

(assert (=> b!1148231 (=> (not res!764011) (not e!653230))))

(assert (=> b!1148231 (= res!764011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512834 mask!1564))))

(assert (=> b!1148231 (= lt!512834 (array!74476 (store (arr!35882 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36419 _keys!1208)))))

(declare-fun b!1148232 () Bool)

(declare-fun e!653234 () Bool)

(assert (=> b!1148232 (= e!653224 e!653234)))

(declare-fun res!764016 () Bool)

(assert (=> b!1148232 (=> res!764016 e!653234)))

(assert (=> b!1148232 (= res!764016 (not (= from!1455 i!673)))))

(declare-fun lt!512839 () ListLongMap!16307)

(declare-fun lt!512848 () array!74473)

(assert (=> b!1148232 (= lt!512839 (getCurrentListMapNoExtraKeys!4673 lt!512834 lt!512848 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148232 (= lt!512848 (array!74474 (store (arr!35881 _values!996) i!673 (ValueCellFull!13685 lt!512843)) (size!36418 _values!996)))))

(declare-fun dynLambda!2700 (Int (_ BitVec 64)) V!43513)

(assert (=> b!1148232 (= lt!512843 (dynLambda!2700 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148232 (= lt!512844 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148233 () Bool)

(declare-fun c!113588 () Bool)

(assert (=> b!1148233 (= c!113588 (and (not lt!512846) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1148233 (= e!653229 e!653232)))

(declare-fun b!1148234 () Bool)

(declare-fun tp_is_empty!28789 () Bool)

(assert (=> b!1148234 (= e!653231 tp_is_empty!28789)))

(declare-fun b!1148235 () Bool)

(declare-fun res!764007 () Bool)

(assert (=> b!1148235 (=> (not res!764007) (not e!653222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148235 (= res!764007 (validMask!0 mask!1564))))

(declare-fun b!1148236 () Bool)

(declare-fun e!653227 () Bool)

(declare-fun e!653221 () Bool)

(assert (=> b!1148236 (= e!653227 (and e!653221 mapRes!45008))))

(declare-fun condMapEmpty!45008 () Bool)

(declare-fun mapDefault!45008 () ValueCell!13685)

(assert (=> b!1148236 (= condMapEmpty!45008 (= (arr!35881 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13685)) mapDefault!45008)))))

(declare-fun bm!52714 () Bool)

(assert (=> bm!52714 (= call!52715 (addStillContains!836 lt!512852 (ite (or c!113592 c!113588) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113592 c!113588) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148237 () Bool)

(assert (=> b!1148237 (= e!653223 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512846) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!52722 () ListLongMap!16307)

(declare-fun call!52720 () ListLongMap!16307)

(declare-fun b!1148238 () Bool)

(declare-fun e!653228 () Bool)

(assert (=> b!1148238 (= e!653228 (= call!52720 (-!1294 call!52722 k0!934)))))

(declare-fun bm!52715 () Bool)

(assert (=> bm!52715 (= call!52717 (+!3609 (ite c!113592 lt!512854 lt!512852) (ite c!113592 (tuple2!18331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113588 (tuple2!18331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!764003 () Bool)

(assert (=> start!98890 (=> (not res!764003) (not e!653222))))

(assert (=> start!98890 (= res!764003 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36419 _keys!1208))))))

(assert (=> start!98890 e!653222))

(assert (=> start!98890 tp_is_empty!28789))

(declare-fun array_inv!27538 (array!74475) Bool)

(assert (=> start!98890 (array_inv!27538 _keys!1208)))

(assert (=> start!98890 true))

(assert (=> start!98890 tp!85488))

(declare-fun array_inv!27539 (array!74473) Bool)

(assert (=> start!98890 (and (array_inv!27539 _values!996) e!653227)))

(declare-fun bm!52716 () Bool)

(assert (=> bm!52716 (= call!52720 (getCurrentListMapNoExtraKeys!4673 lt!512834 lt!512848 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52717 () Bool)

(assert (=> bm!52717 (= call!52718 (contains!6708 (ite c!113592 lt!512854 call!52719) k0!934))))

(declare-fun b!1148239 () Bool)

(declare-fun Unit!37654 () Unit!37650)

(assert (=> b!1148239 (= e!653235 Unit!37654)))

(declare-fun b!1148240 () Bool)

(assert (=> b!1148240 (= e!653234 e!653226)))

(declare-fun res!764015 () Bool)

(assert (=> b!1148240 (=> res!764015 e!653226)))

(assert (=> b!1148240 (= res!764015 (not (= (select (arr!35882 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1148240 e!653228))

(declare-fun c!113590 () Bool)

(assert (=> b!1148240 (= c!113590 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512845 () Unit!37650)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!540 (array!74475 array!74473 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37650)

(assert (=> b!1148240 (= lt!512845 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52718 () Bool)

(assert (=> bm!52718 (= call!52721 call!52718)))

(declare-fun b!1148241 () Bool)

(assert (=> b!1148241 (= e!653221 tp_is_empty!28789)))

(declare-fun b!1148242 () Bool)

(assert (=> b!1148242 call!52721))

(declare-fun lt!512853 () Unit!37650)

(assert (=> b!1148242 (= lt!512853 call!52716)))

(assert (=> b!1148242 (= e!653220 lt!512853)))

(declare-fun b!1148243 () Bool)

(assert (=> b!1148243 (= e!653225 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52719 () Bool)

(assert (=> bm!52719 (= call!52722 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148244 () Bool)

(assert (=> b!1148244 (= e!653228 (= call!52720 call!52722))))

(assert (= (and start!98890 res!764003) b!1148235))

(assert (= (and b!1148235 res!764007) b!1148226))

(assert (= (and b!1148226 res!764013) b!1148222))

(assert (= (and b!1148222 res!764004) b!1148216))

(assert (= (and b!1148216 res!764002) b!1148218))

(assert (= (and b!1148218 res!764006) b!1148227))

(assert (= (and b!1148227 res!764012) b!1148217))

(assert (= (and b!1148217 res!764005) b!1148231))

(assert (= (and b!1148231 res!764011) b!1148215))

(assert (= (and b!1148215 res!764009) b!1148228))

(assert (= (and b!1148228 (not res!764014)) b!1148232))

(assert (= (and b!1148232 (not res!764016)) b!1148240))

(assert (= (and b!1148240 c!113590) b!1148238))

(assert (= (and b!1148240 (not c!113590)) b!1148244))

(assert (= (or b!1148238 b!1148244) bm!52716))

(assert (= (or b!1148238 b!1148244) bm!52719))

(assert (= (and b!1148240 (not res!764015)) b!1148220))

(assert (= (and b!1148220 c!113587) b!1148225))

(assert (= (and b!1148220 (not c!113587)) b!1148239))

(assert (= (and b!1148225 c!113592) b!1148221))

(assert (= (and b!1148225 (not c!113592)) b!1148233))

(assert (= (and b!1148233 c!113588) b!1148230))

(assert (= (and b!1148233 (not c!113588)) b!1148223))

(assert (= (and b!1148223 c!113589) b!1148242))

(assert (= (and b!1148223 (not c!113589)) b!1148229))

(assert (= (or b!1148230 b!1148242) bm!52712))

(assert (= (or b!1148230 b!1148242) bm!52713))

(assert (= (or b!1148230 b!1148242) bm!52718))

(assert (= (or b!1148221 bm!52718) bm!52717))

(assert (= (or b!1148221 bm!52712) bm!52714))

(assert (= (or b!1148221 bm!52713) bm!52715))

(assert (= (and b!1148225 c!113591) b!1148219))

(assert (= (and b!1148225 (not c!113591)) b!1148237))

(assert (= (and b!1148225 res!764008) b!1148243))

(assert (= (and b!1148220 res!764010) b!1148224))

(assert (= (and b!1148236 condMapEmpty!45008) mapIsEmpty!45008))

(assert (= (and b!1148236 (not condMapEmpty!45008)) mapNonEmpty!45008))

(get-info :version)

(assert (= (and mapNonEmpty!45008 ((_ is ValueCellFull!13685) mapValue!45008)) b!1148234))

(assert (= (and b!1148236 ((_ is ValueCellFull!13685) mapDefault!45008)) b!1148241))

(assert (= start!98890 b!1148236))

(declare-fun b_lambda!19359 () Bool)

(assert (=> (not b_lambda!19359) (not b!1148232)))

(declare-fun t!36326 () Bool)

(declare-fun tb!9063 () Bool)

(assert (=> (and start!98890 (= defaultEntry!1004 defaultEntry!1004) t!36326) tb!9063))

(declare-fun result!18699 () Bool)

(assert (=> tb!9063 (= result!18699 tp_is_empty!28789)))

(assert (=> b!1148232 t!36326))

(declare-fun b_and!39371 () Bool)

(assert (= b_and!39369 (and (=> t!36326 result!18699) b_and!39371)))

(declare-fun m!1059193 () Bool)

(assert (=> b!1148228 m!1059193))

(declare-fun m!1059195 () Bool)

(assert (=> b!1148228 m!1059195))

(declare-fun m!1059197 () Bool)

(assert (=> b!1148220 m!1059197))

(declare-fun m!1059199 () Bool)

(assert (=> b!1148220 m!1059199))

(declare-fun m!1059201 () Bool)

(assert (=> b!1148220 m!1059201))

(declare-fun m!1059203 () Bool)

(assert (=> b!1148220 m!1059203))

(assert (=> b!1148220 m!1059203))

(declare-fun m!1059205 () Bool)

(assert (=> b!1148220 m!1059205))

(declare-fun m!1059207 () Bool)

(assert (=> b!1148220 m!1059207))

(assert (=> b!1148220 m!1059199))

(declare-fun m!1059209 () Bool)

(assert (=> b!1148220 m!1059209))

(declare-fun m!1059211 () Bool)

(assert (=> b!1148220 m!1059211))

(assert (=> b!1148220 m!1059207))

(assert (=> b!1148220 m!1059199))

(declare-fun m!1059213 () Bool)

(assert (=> b!1148219 m!1059213))

(declare-fun m!1059215 () Bool)

(assert (=> start!98890 m!1059215))

(declare-fun m!1059217 () Bool)

(assert (=> start!98890 m!1059217))

(declare-fun m!1059219 () Bool)

(assert (=> bm!52714 m!1059219))

(declare-fun m!1059221 () Bool)

(assert (=> b!1148225 m!1059221))

(declare-fun m!1059223 () Bool)

(assert (=> b!1148225 m!1059223))

(declare-fun m!1059225 () Bool)

(assert (=> b!1148225 m!1059225))

(declare-fun m!1059227 () Bool)

(assert (=> b!1148225 m!1059227))

(declare-fun m!1059229 () Bool)

(assert (=> b!1148215 m!1059229))

(declare-fun m!1059231 () Bool)

(assert (=> b!1148221 m!1059231))

(declare-fun m!1059233 () Bool)

(assert (=> b!1148221 m!1059233))

(declare-fun m!1059235 () Bool)

(assert (=> b!1148221 m!1059235))

(declare-fun m!1059237 () Bool)

(assert (=> b!1148238 m!1059237))

(declare-fun m!1059239 () Bool)

(assert (=> b!1148231 m!1059239))

(declare-fun m!1059241 () Bool)

(assert (=> b!1148231 m!1059241))

(declare-fun m!1059243 () Bool)

(assert (=> bm!52716 m!1059243))

(declare-fun m!1059245 () Bool)

(assert (=> b!1148217 m!1059245))

(declare-fun m!1059247 () Bool)

(assert (=> bm!52715 m!1059247))

(declare-fun m!1059249 () Bool)

(assert (=> b!1148235 m!1059249))

(declare-fun m!1059251 () Bool)

(assert (=> b!1148222 m!1059251))

(declare-fun m!1059253 () Bool)

(assert (=> bm!52717 m!1059253))

(declare-fun m!1059255 () Bool)

(assert (=> b!1148216 m!1059255))

(declare-fun m!1059257 () Bool)

(assert (=> b!1148224 m!1059257))

(assert (=> b!1148243 m!1059213))

(declare-fun m!1059259 () Bool)

(assert (=> b!1148232 m!1059259))

(declare-fun m!1059261 () Bool)

(assert (=> b!1148232 m!1059261))

(declare-fun m!1059263 () Bool)

(assert (=> b!1148232 m!1059263))

(declare-fun m!1059265 () Bool)

(assert (=> b!1148232 m!1059265))

(assert (=> bm!52719 m!1059197))

(declare-fun m!1059267 () Bool)

(assert (=> mapNonEmpty!45008 m!1059267))

(assert (=> b!1148240 m!1059199))

(declare-fun m!1059269 () Bool)

(assert (=> b!1148240 m!1059269))

(declare-fun m!1059271 () Bool)

(assert (=> b!1148227 m!1059271))

(check-sat (not start!98890) (not bm!52714) (not b!1148221) (not b!1148227) (not b!1148243) (not b!1148222) (not b!1148228) (not bm!52716) (not b!1148215) (not mapNonEmpty!45008) (not b_lambda!19359) (not b!1148225) (not b!1148232) (not b!1148216) (not bm!52719) (not b!1148238) (not b!1148220) (not b!1148240) (not b_next!24259) (not bm!52717) b_and!39371 (not b!1148231) tp_is_empty!28789 (not b!1148224) (not b!1148219) (not b!1148235) (not bm!52715))
(check-sat b_and!39371 (not b_next!24259))
