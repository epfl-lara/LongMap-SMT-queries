; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97930 () Bool)

(assert start!97930)

(declare-fun b_free!23631 () Bool)

(declare-fun b_next!23631 () Bool)

(assert (=> start!97930 (= b_free!23631 (not b_next!23631))))

(declare-fun tp!83597 () Bool)

(declare-fun b_and!38045 () Bool)

(assert (=> start!97930 (= tp!83597 b_and!38045)))

(declare-datatypes ((V!42675 0))(
  ( (V!42676 (val!14137 Int)) )
))
(declare-fun zeroValue!944 () V!42675)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47172 () Bool)

(declare-datatypes ((tuple2!17748 0))(
  ( (tuple2!17749 (_1!8885 (_ BitVec 64)) (_2!8885 V!42675)) )
))
(declare-datatypes ((List!24529 0))(
  ( (Nil!24526) (Cons!24525 (h!25734 tuple2!17748) (t!35152 List!24529)) )
))
(declare-datatypes ((ListLongMap!15717 0))(
  ( (ListLongMap!15718 (toList!7874 List!24529)) )
))
(declare-fun call!47175 () ListLongMap!15717)

(declare-fun minValue!944 () V!42675)

(declare-datatypes ((ValueCell!13371 0))(
  ( (ValueCellFull!13371 (v!16770 V!42675)) (EmptyCell!13371) )
))
(declare-datatypes ((array!73201 0))(
  ( (array!73202 (arr!35253 (Array (_ BitVec 32) ValueCell!13371)) (size!35789 (_ BitVec 32))) )
))
(declare-fun lt!498581 () array!73201)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!73203 0))(
  ( (array!73204 (arr!35254 (Array (_ BitVec 32) (_ BitVec 64))) (size!35790 (_ BitVec 32))) )
))
(declare-fun lt!498577 () array!73203)

(declare-fun getCurrentListMapNoExtraKeys!4363 (array!73203 array!73201 (_ BitVec 32) (_ BitVec 32) V!42675 V!42675 (_ BitVec 32) Int) ListLongMap!15717)

(assert (=> bm!47172 (= call!47175 (getCurrentListMapNoExtraKeys!4363 lt!498577 lt!498581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44059 () Bool)

(declare-fun mapRes!44059 () Bool)

(assert (=> mapIsEmpty!44059 mapRes!44059))

(declare-fun b!1122069 () Bool)

(declare-fun res!749629 () Bool)

(declare-fun e!638847 () Bool)

(assert (=> b!1122069 (=> (not res!749629) (not e!638847))))

(declare-fun _keys!1208 () array!73203)

(declare-datatypes ((List!24530 0))(
  ( (Nil!24527) (Cons!24526 (h!25735 (_ BitVec 64)) (t!35153 List!24530)) )
))
(declare-fun arrayNoDuplicates!0 (array!73203 (_ BitVec 32) List!24530) Bool)

(assert (=> b!1122069 (= res!749629 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24527))))

(declare-fun b!1122070 () Bool)

(declare-fun res!749626 () Bool)

(assert (=> b!1122070 (=> (not res!749626) (not e!638847))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122070 (= res!749626 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35790 _keys!1208))))))

(declare-fun mapNonEmpty!44059 () Bool)

(declare-fun tp!83596 () Bool)

(declare-fun e!638841 () Bool)

(assert (=> mapNonEmpty!44059 (= mapRes!44059 (and tp!83596 e!638841))))

(declare-fun mapRest!44059 () (Array (_ BitVec 32) ValueCell!13371))

(declare-fun _values!996 () array!73201)

(declare-fun mapKey!44059 () (_ BitVec 32))

(declare-fun mapValue!44059 () ValueCell!13371)

(assert (=> mapNonEmpty!44059 (= (arr!35253 _values!996) (store mapRest!44059 mapKey!44059 mapValue!44059))))

(declare-fun b!1122071 () Bool)

(declare-fun e!638843 () Bool)

(declare-fun call!47176 () ListLongMap!15717)

(assert (=> b!1122071 (= e!638843 (= call!47175 call!47176))))

(declare-fun b!1122073 () Bool)

(declare-fun e!638838 () Bool)

(assert (=> b!1122073 (= e!638838 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!498578 () Bool)

(declare-fun contains!6420 (ListLongMap!15717 (_ BitVec 64)) Bool)

(assert (=> b!1122073 (= lt!498578 (contains!6420 (getCurrentListMapNoExtraKeys!4363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47173 () Bool)

(assert (=> bm!47173 (= call!47176 (getCurrentListMapNoExtraKeys!4363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122074 () Bool)

(declare-fun e!638842 () Bool)

(declare-fun e!638846 () Bool)

(assert (=> b!1122074 (= e!638842 e!638846)))

(declare-fun res!749619 () Bool)

(assert (=> b!1122074 (=> res!749619 e!638846)))

(assert (=> b!1122074 (= res!749619 (not (= from!1455 i!673)))))

(declare-fun lt!498576 () ListLongMap!15717)

(assert (=> b!1122074 (= lt!498576 (getCurrentListMapNoExtraKeys!4363 lt!498577 lt!498581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2461 (Int (_ BitVec 64)) V!42675)

(assert (=> b!1122074 (= lt!498581 (array!73202 (store (arr!35253 _values!996) i!673 (ValueCellFull!13371 (dynLambda!2461 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35789 _values!996)))))

(declare-fun lt!498580 () ListLongMap!15717)

(assert (=> b!1122074 (= lt!498580 (getCurrentListMapNoExtraKeys!4363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122075 () Bool)

(declare-fun res!749625 () Bool)

(assert (=> b!1122075 (=> (not res!749625) (not e!638847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122075 (= res!749625 (validMask!0 mask!1564))))

(declare-fun b!1122076 () Bool)

(declare-fun e!638839 () Bool)

(assert (=> b!1122076 (= e!638847 e!638839)))

(declare-fun res!749621 () Bool)

(assert (=> b!1122076 (=> (not res!749621) (not e!638839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73203 (_ BitVec 32)) Bool)

(assert (=> b!1122076 (= res!749621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498577 mask!1564))))

(assert (=> b!1122076 (= lt!498577 (array!73204 (store (arr!35254 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35790 _keys!1208)))))

(declare-fun b!1122077 () Bool)

(declare-fun e!638844 () Bool)

(declare-fun e!638845 () Bool)

(assert (=> b!1122077 (= e!638844 (and e!638845 mapRes!44059))))

(declare-fun condMapEmpty!44059 () Bool)

(declare-fun mapDefault!44059 () ValueCell!13371)

(assert (=> b!1122077 (= condMapEmpty!44059 (= (arr!35253 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13371)) mapDefault!44059)))))

(declare-fun b!1122078 () Bool)

(assert (=> b!1122078 (= e!638839 (not e!638842))))

(declare-fun res!749620 () Bool)

(assert (=> b!1122078 (=> res!749620 e!638842)))

(assert (=> b!1122078 (= res!749620 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122078 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36804 0))(
  ( (Unit!36805) )
))
(declare-fun lt!498579 () Unit!36804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73203 (_ BitVec 64) (_ BitVec 32)) Unit!36804)

(assert (=> b!1122078 (= lt!498579 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122079 () Bool)

(declare-fun res!749622 () Bool)

(assert (=> b!1122079 (=> (not res!749622) (not e!638847))))

(assert (=> b!1122079 (= res!749622 (and (= (size!35789 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35790 _keys!1208) (size!35789 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122080 () Bool)

(declare-fun res!749617 () Bool)

(assert (=> b!1122080 (=> (not res!749617) (not e!638847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122080 (= res!749617 (validKeyInArray!0 k0!934))))

(declare-fun b!1122081 () Bool)

(declare-fun res!749623 () Bool)

(assert (=> b!1122081 (=> (not res!749623) (not e!638839))))

(assert (=> b!1122081 (= res!749623 (arrayNoDuplicates!0 lt!498577 #b00000000000000000000000000000000 Nil!24527))))

(declare-fun b!1122082 () Bool)

(declare-fun tp_is_empty!28161 () Bool)

(assert (=> b!1122082 (= e!638841 tp_is_empty!28161)))

(declare-fun b!1122083 () Bool)

(declare-fun -!1083 (ListLongMap!15717 (_ BitVec 64)) ListLongMap!15717)

(assert (=> b!1122083 (= e!638843 (= call!47175 (-!1083 call!47176 k0!934)))))

(declare-fun b!1122084 () Bool)

(assert (=> b!1122084 (= e!638845 tp_is_empty!28161)))

(declare-fun b!1122085 () Bool)

(assert (=> b!1122085 (= e!638846 e!638838)))

(declare-fun res!749624 () Bool)

(assert (=> b!1122085 (=> res!749624 e!638838)))

(assert (=> b!1122085 (= res!749624 (not (= (select (arr!35254 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1122085 e!638843))

(declare-fun c!109437 () Bool)

(assert (=> b!1122085 (= c!109437 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498575 () Unit!36804)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!330 (array!73203 array!73201 (_ BitVec 32) (_ BitVec 32) V!42675 V!42675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36804)

(assert (=> b!1122085 (= lt!498575 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122086 () Bool)

(declare-fun res!749618 () Bool)

(assert (=> b!1122086 (=> (not res!749618) (not e!638847))))

(assert (=> b!1122086 (= res!749618 (= (select (arr!35254 _keys!1208) i!673) k0!934))))

(declare-fun b!1122072 () Bool)

(declare-fun res!749628 () Bool)

(assert (=> b!1122072 (=> (not res!749628) (not e!638847))))

(assert (=> b!1122072 (= res!749628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!749627 () Bool)

(assert (=> start!97930 (=> (not res!749627) (not e!638847))))

(assert (=> start!97930 (= res!749627 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35790 _keys!1208))))))

(assert (=> start!97930 e!638847))

(assert (=> start!97930 tp_is_empty!28161))

(declare-fun array_inv!27064 (array!73203) Bool)

(assert (=> start!97930 (array_inv!27064 _keys!1208)))

(assert (=> start!97930 true))

(assert (=> start!97930 tp!83597))

(declare-fun array_inv!27065 (array!73201) Bool)

(assert (=> start!97930 (and (array_inv!27065 _values!996) e!638844)))

(assert (= (and start!97930 res!749627) b!1122075))

(assert (= (and b!1122075 res!749625) b!1122079))

(assert (= (and b!1122079 res!749622) b!1122072))

(assert (= (and b!1122072 res!749628) b!1122069))

(assert (= (and b!1122069 res!749629) b!1122070))

(assert (= (and b!1122070 res!749626) b!1122080))

(assert (= (and b!1122080 res!749617) b!1122086))

(assert (= (and b!1122086 res!749618) b!1122076))

(assert (= (and b!1122076 res!749621) b!1122081))

(assert (= (and b!1122081 res!749623) b!1122078))

(assert (= (and b!1122078 (not res!749620)) b!1122074))

(assert (= (and b!1122074 (not res!749619)) b!1122085))

(assert (= (and b!1122085 c!109437) b!1122083))

(assert (= (and b!1122085 (not c!109437)) b!1122071))

(assert (= (or b!1122083 b!1122071) bm!47172))

(assert (= (or b!1122083 b!1122071) bm!47173))

(assert (= (and b!1122085 (not res!749624)) b!1122073))

(assert (= (and b!1122077 condMapEmpty!44059) mapIsEmpty!44059))

(assert (= (and b!1122077 (not condMapEmpty!44059)) mapNonEmpty!44059))

(get-info :version)

(assert (= (and mapNonEmpty!44059 ((_ is ValueCellFull!13371) mapValue!44059)) b!1122082))

(assert (= (and b!1122077 ((_ is ValueCellFull!13371) mapDefault!44059)) b!1122084))

(assert (= start!97930 b!1122077))

(declare-fun b_lambda!18601 () Bool)

(assert (=> (not b_lambda!18601) (not b!1122074)))

(declare-fun t!35151 () Bool)

(declare-fun tb!8443 () Bool)

(assert (=> (and start!97930 (= defaultEntry!1004 defaultEntry!1004) t!35151) tb!8443))

(declare-fun result!17447 () Bool)

(assert (=> tb!8443 (= result!17447 tp_is_empty!28161)))

(assert (=> b!1122074 t!35151))

(declare-fun b_and!38047 () Bool)

(assert (= b_and!38045 (and (=> t!35151 result!17447) b_and!38047)))

(declare-fun m!1036785 () Bool)

(assert (=> b!1122086 m!1036785))

(declare-fun m!1036787 () Bool)

(assert (=> b!1122072 m!1036787))

(declare-fun m!1036789 () Bool)

(assert (=> b!1122083 m!1036789))

(declare-fun m!1036791 () Bool)

(assert (=> b!1122074 m!1036791))

(declare-fun m!1036793 () Bool)

(assert (=> b!1122074 m!1036793))

(declare-fun m!1036795 () Bool)

(assert (=> b!1122074 m!1036795))

(declare-fun m!1036797 () Bool)

(assert (=> b!1122074 m!1036797))

(declare-fun m!1036799 () Bool)

(assert (=> bm!47173 m!1036799))

(declare-fun m!1036801 () Bool)

(assert (=> b!1122076 m!1036801))

(declare-fun m!1036803 () Bool)

(assert (=> b!1122076 m!1036803))

(declare-fun m!1036805 () Bool)

(assert (=> b!1122085 m!1036805))

(declare-fun m!1036807 () Bool)

(assert (=> b!1122085 m!1036807))

(declare-fun m!1036809 () Bool)

(assert (=> bm!47172 m!1036809))

(declare-fun m!1036811 () Bool)

(assert (=> b!1122081 m!1036811))

(declare-fun m!1036813 () Bool)

(assert (=> b!1122069 m!1036813))

(declare-fun m!1036815 () Bool)

(assert (=> b!1122078 m!1036815))

(declare-fun m!1036817 () Bool)

(assert (=> b!1122078 m!1036817))

(declare-fun m!1036819 () Bool)

(assert (=> mapNonEmpty!44059 m!1036819))

(declare-fun m!1036821 () Bool)

(assert (=> b!1122080 m!1036821))

(declare-fun m!1036823 () Bool)

(assert (=> start!97930 m!1036823))

(declare-fun m!1036825 () Bool)

(assert (=> start!97930 m!1036825))

(declare-fun m!1036827 () Bool)

(assert (=> b!1122075 m!1036827))

(assert (=> b!1122073 m!1036799))

(assert (=> b!1122073 m!1036799))

(declare-fun m!1036829 () Bool)

(assert (=> b!1122073 m!1036829))

(check-sat (not b_lambda!18601) (not b!1122078) (not b!1122069) (not b!1122076) b_and!38047 (not b!1122081) tp_is_empty!28161 (not b_next!23631) (not b!1122073) (not b!1122072) (not bm!47172) (not b!1122083) (not bm!47173) (not b!1122074) (not mapNonEmpty!44059) (not b!1122080) (not b!1122075) (not b!1122085) (not start!97930))
(check-sat b_and!38047 (not b_next!23631))
