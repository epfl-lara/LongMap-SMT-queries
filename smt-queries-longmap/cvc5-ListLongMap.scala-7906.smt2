; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98180 () Bool)

(assert start!98180)

(declare-fun b_free!23881 () Bool)

(declare-fun b_next!23881 () Bool)

(assert (=> start!98180 (= b_free!23881 (not b_next!23881))))

(declare-fun tp!84346 () Bool)

(declare-fun b_and!38545 () Bool)

(assert (=> start!98180 (= tp!84346 b_and!38545)))

(declare-fun b!1129436 () Bool)

(declare-fun res!754743 () Bool)

(declare-fun e!642792 () Bool)

(assert (=> b!1129436 (=> (not res!754743) (not e!642792))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73679 0))(
  ( (array!73680 (arr!35492 (Array (_ BitVec 32) (_ BitVec 64))) (size!36028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73679)

(assert (=> b!1129436 (= res!754743 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36028 _keys!1208))))))

(declare-fun b!1129437 () Bool)

(declare-datatypes ((Unit!37000 0))(
  ( (Unit!37001) )
))
(declare-fun e!642782 () Unit!37000)

(declare-fun lt!501425 () Unit!37000)

(assert (=> b!1129437 (= e!642782 lt!501425)))

(declare-fun call!48050 () Unit!37000)

(assert (=> b!1129437 (= lt!501425 call!48050)))

(declare-fun call!48052 () Bool)

(assert (=> b!1129437 call!48052))

(declare-fun b!1129438 () Bool)

(declare-fun res!754753 () Bool)

(assert (=> b!1129438 (=> (not res!754753) (not e!642792))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73679 (_ BitVec 32)) Bool)

(assert (=> b!1129438 (= res!754753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129439 () Bool)

(assert (=> b!1129439 call!48052))

(declare-fun lt!501437 () Unit!37000)

(assert (=> b!1129439 (= lt!501437 call!48050)))

(declare-fun e!642779 () Unit!37000)

(assert (=> b!1129439 (= e!642779 lt!501437)))

(declare-fun b!1129440 () Bool)

(declare-fun res!754740 () Bool)

(assert (=> b!1129440 (=> (not res!754740) (not e!642792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129440 (= res!754740 (validMask!0 mask!1564))))

(declare-fun b!1129441 () Bool)

(declare-fun e!642778 () Bool)

(declare-fun tp_is_empty!28411 () Bool)

(assert (=> b!1129441 (= e!642778 tp_is_empty!28411)))

(declare-fun b!1129442 () Bool)

(declare-fun e!642789 () Bool)

(declare-fun e!642781 () Bool)

(assert (=> b!1129442 (= e!642789 e!642781)))

(declare-fun res!754752 () Bool)

(assert (=> b!1129442 (=> res!754752 e!642781)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1129442 (= res!754752 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43009 0))(
  ( (V!43010 (val!14262 Int)) )
))
(declare-fun zeroValue!944 () V!43009)

(declare-datatypes ((ValueCell!13496 0))(
  ( (ValueCellFull!13496 (v!16895 V!43009)) (EmptyCell!13496) )
))
(declare-datatypes ((array!73681 0))(
  ( (array!73682 (arr!35493 (Array (_ BitVec 32) ValueCell!13496)) (size!36029 (_ BitVec 32))) )
))
(declare-fun lt!501432 () array!73681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!501427 () array!73679)

(declare-fun minValue!944 () V!43009)

(declare-datatypes ((tuple2!17958 0))(
  ( (tuple2!17959 (_1!8990 (_ BitVec 64)) (_2!8990 V!43009)) )
))
(declare-datatypes ((List!24725 0))(
  ( (Nil!24722) (Cons!24721 (h!25930 tuple2!17958) (t!35598 List!24725)) )
))
(declare-datatypes ((ListLongMap!15927 0))(
  ( (ListLongMap!15928 (toList!7979 List!24725)) )
))
(declare-fun lt!501433 () ListLongMap!15927)

(declare-fun getCurrentListMapNoExtraKeys!4466 (array!73679 array!73681 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) Int) ListLongMap!15927)

(assert (=> b!1129442 (= lt!501433 (getCurrentListMapNoExtraKeys!4466 lt!501427 lt!501432 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73681)

(declare-fun dynLambda!2544 (Int (_ BitVec 64)) V!43009)

(assert (=> b!1129442 (= lt!501432 (array!73682 (store (arr!35493 _values!996) i!673 (ValueCellFull!13496 (dynLambda!2544 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36029 _values!996)))))

(declare-fun lt!501431 () ListLongMap!15927)

(assert (=> b!1129442 (= lt!501431 (getCurrentListMapNoExtraKeys!4466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44434 () Bool)

(declare-fun mapRes!44434 () Bool)

(assert (=> mapIsEmpty!44434 mapRes!44434))

(declare-fun b!1129443 () Bool)

(declare-fun res!754746 () Bool)

(assert (=> b!1129443 (=> (not res!754746) (not e!642792))))

(declare-datatypes ((List!24726 0))(
  ( (Nil!24723) (Cons!24722 (h!25931 (_ BitVec 64)) (t!35599 List!24726)) )
))
(declare-fun arrayNoDuplicates!0 (array!73679 (_ BitVec 32) List!24726) Bool)

(assert (=> b!1129443 (= res!754746 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24723))))

(declare-fun b!1129444 () Bool)

(declare-fun e!642788 () Bool)

(declare-fun e!642780 () Bool)

(assert (=> b!1129444 (= e!642788 e!642780)))

(declare-fun res!754750 () Bool)

(assert (=> b!1129444 (=> res!754750 e!642780)))

(declare-fun lt!501423 () ListLongMap!15927)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6502 (ListLongMap!15927 (_ BitVec 64)) Bool)

(assert (=> b!1129444 (= res!754750 (not (contains!6502 lt!501423 k!934)))))

(assert (=> b!1129444 (= lt!501423 (getCurrentListMapNoExtraKeys!4466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129445 () Bool)

(declare-fun e!642786 () Unit!37000)

(assert (=> b!1129445 (= e!642786 e!642779)))

(declare-fun c!109875 () Bool)

(declare-fun lt!501424 () Bool)

(assert (=> b!1129445 (= c!109875 (and (not lt!501424) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44434 () Bool)

(declare-fun tp!84347 () Bool)

(assert (=> mapNonEmpty!44434 (= mapRes!44434 (and tp!84347 e!642778))))

(declare-fun mapKey!44434 () (_ BitVec 32))

(declare-fun mapRest!44434 () (Array (_ BitVec 32) ValueCell!13496))

(declare-fun mapValue!44434 () ValueCell!13496)

(assert (=> mapNonEmpty!44434 (= (arr!35493 _values!996) (store mapRest!44434 mapKey!44434 mapValue!44434))))

(declare-fun call!48048 () ListLongMap!15927)

(declare-fun bm!48042 () Bool)

(assert (=> bm!48042 (= call!48048 (getCurrentListMapNoExtraKeys!4466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129446 () Bool)

(declare-fun res!754741 () Bool)

(assert (=> b!1129446 (=> (not res!754741) (not e!642792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129446 (= res!754741 (validKeyInArray!0 k!934))))

(declare-fun e!642790 () Bool)

(declare-fun call!48047 () ListLongMap!15927)

(declare-fun b!1129447 () Bool)

(declare-fun -!1160 (ListLongMap!15927 (_ BitVec 64)) ListLongMap!15927)

(assert (=> b!1129447 (= e!642790 (= call!48047 (-!1160 call!48048 k!934)))))

(declare-fun bm!48043 () Bool)

(declare-fun call!48046 () ListLongMap!15927)

(declare-fun call!48049 () ListLongMap!15927)

(assert (=> bm!48043 (= call!48046 call!48049)))

(declare-fun b!1129448 () Bool)

(declare-fun e!642784 () Bool)

(assert (=> b!1129448 (= e!642792 e!642784)))

(declare-fun res!754742 () Bool)

(assert (=> b!1129448 (=> (not res!754742) (not e!642784))))

(assert (=> b!1129448 (= res!754742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501427 mask!1564))))

(assert (=> b!1129448 (= lt!501427 (array!73680 (store (arr!35492 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36028 _keys!1208)))))

(declare-fun b!1129449 () Bool)

(assert (=> b!1129449 (= e!642790 (= call!48047 call!48048))))

(declare-fun b!1129450 () Bool)

(declare-fun e!642787 () Bool)

(assert (=> b!1129450 (= e!642780 e!642787)))

(declare-fun res!754749 () Bool)

(assert (=> b!1129450 (=> res!754749 e!642787)))

(assert (=> b!1129450 (= res!754749 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36028 _keys!1208))))))

(declare-fun lt!501428 () Unit!37000)

(assert (=> b!1129450 (= lt!501428 e!642786)))

(declare-fun c!109872 () Bool)

(assert (=> b!1129450 (= c!109872 (and (not lt!501424) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129450 (= lt!501424 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129451 () Bool)

(declare-fun res!754751 () Bool)

(assert (=> b!1129451 (=> (not res!754751) (not e!642792))))

(assert (=> b!1129451 (= res!754751 (= (select (arr!35492 _keys!1208) i!673) k!934))))

(declare-fun b!1129452 () Bool)

(declare-fun e!642791 () Bool)

(assert (=> b!1129452 (= e!642791 tp_is_empty!28411)))

(declare-fun b!1129453 () Bool)

(assert (=> b!1129453 (= e!642781 e!642788)))

(declare-fun res!754739 () Bool)

(assert (=> b!1129453 (=> res!754739 e!642788)))

(assert (=> b!1129453 (= res!754739 (not (= (select (arr!35492 _keys!1208) from!1455) k!934)))))

(assert (=> b!1129453 e!642790))

(declare-fun c!109873 () Bool)

(assert (=> b!1129453 (= c!109873 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501436 () Unit!37000)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!412 (array!73679 array!73681 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37000)

(assert (=> b!1129453 (= lt!501436 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48044 () Bool)

(declare-fun +!3430 (ListLongMap!15927 tuple2!17958) ListLongMap!15927)

(assert (=> bm!48044 (= call!48049 (+!3430 lt!501423 (ite (or c!109872 c!109875) (tuple2!17959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129454 () Bool)

(assert (=> b!1129454 (= e!642784 (not e!642789))))

(declare-fun res!754747 () Bool)

(assert (=> b!1129454 (=> res!754747 e!642789)))

(assert (=> b!1129454 (= res!754747 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129454 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501426 () Unit!37000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73679 (_ BitVec 64) (_ BitVec 32)) Unit!37000)

(assert (=> b!1129454 (= lt!501426 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!48045 () Bool)

(assert (=> bm!48045 (= call!48047 (getCurrentListMapNoExtraKeys!4466 lt!501427 lt!501432 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129455 () Bool)

(declare-fun c!109874 () Bool)

(assert (=> b!1129455 (= c!109874 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501424))))

(assert (=> b!1129455 (= e!642779 e!642782)))

(declare-fun bm!48046 () Bool)

(declare-fun call!48051 () Unit!37000)

(declare-fun lt!501430 () ListLongMap!15927)

(declare-fun addStillContains!693 (ListLongMap!15927 (_ BitVec 64) V!43009 (_ BitVec 64)) Unit!37000)

(assert (=> bm!48046 (= call!48051 (addStillContains!693 (ite c!109872 lt!501430 lt!501423) (ite c!109872 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109875 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109872 minValue!944 (ite c!109875 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1129456 () Bool)

(declare-fun res!754745 () Bool)

(assert (=> b!1129456 (=> (not res!754745) (not e!642792))))

(assert (=> b!1129456 (= res!754745 (and (= (size!36029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36028 _keys!1208) (size!36029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!754748 () Bool)

(assert (=> start!98180 (=> (not res!754748) (not e!642792))))

(assert (=> start!98180 (= res!754748 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36028 _keys!1208))))))

(assert (=> start!98180 e!642792))

(assert (=> start!98180 tp_is_empty!28411))

(declare-fun array_inv!27228 (array!73679) Bool)

(assert (=> start!98180 (array_inv!27228 _keys!1208)))

(assert (=> start!98180 true))

(assert (=> start!98180 tp!84346))

(declare-fun e!642783 () Bool)

(declare-fun array_inv!27229 (array!73681) Bool)

(assert (=> start!98180 (and (array_inv!27229 _values!996) e!642783)))

(declare-fun b!1129457 () Bool)

(declare-fun Unit!37002 () Unit!37000)

(assert (=> b!1129457 (= e!642782 Unit!37002)))

(declare-fun b!1129458 () Bool)

(assert (=> b!1129458 (= e!642783 (and e!642791 mapRes!44434))))

(declare-fun condMapEmpty!44434 () Bool)

(declare-fun mapDefault!44434 () ValueCell!13496)

