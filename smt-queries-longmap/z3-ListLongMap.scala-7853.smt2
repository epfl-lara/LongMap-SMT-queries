; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98098 () Bool)

(assert start!98098)

(declare-fun b_free!23563 () Bool)

(declare-fun b_next!23563 () Bool)

(assert (=> start!98098 (= b_free!23563 (not b_next!23563))))

(declare-fun tp!83392 () Bool)

(declare-fun b_and!37919 () Bool)

(assert (=> start!98098 (= tp!83392 b_and!37919)))

(declare-fun res!748930 () Bool)

(declare-fun e!638804 () Bool)

(assert (=> start!98098 (=> (not res!748930) (not e!638804))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73117 0))(
  ( (array!73118 (arr!35205 (Array (_ BitVec 32) (_ BitVec 64))) (size!35742 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73117)

(assert (=> start!98098 (= res!748930 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35742 _keys!1208))))))

(assert (=> start!98098 e!638804))

(declare-fun tp_is_empty!28093 () Bool)

(assert (=> start!98098 tp_is_empty!28093))

(declare-fun array_inv!27102 (array!73117) Bool)

(assert (=> start!98098 (array_inv!27102 _keys!1208)))

(assert (=> start!98098 true))

(assert (=> start!98098 tp!83392))

(declare-datatypes ((V!42585 0))(
  ( (V!42586 (val!14103 Int)) )
))
(declare-datatypes ((ValueCell!13337 0))(
  ( (ValueCellFull!13337 (v!16732 V!42585)) (EmptyCell!13337) )
))
(declare-datatypes ((array!73119 0))(
  ( (array!73120 (arr!35206 (Array (_ BitVec 32) ValueCell!13337)) (size!35743 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73119)

(declare-fun e!638806 () Bool)

(declare-fun array_inv!27103 (array!73119) Bool)

(assert (=> start!98098 (and (array_inv!27103 _values!996) e!638806)))

(declare-fun b!1121637 () Bool)

(declare-fun res!748926 () Bool)

(declare-fun e!638808 () Bool)

(assert (=> b!1121637 (=> (not res!748926) (not e!638808))))

(declare-fun lt!498508 () array!73117)

(declare-datatypes ((List!24502 0))(
  ( (Nil!24499) (Cons!24498 (h!25716 (_ BitVec 64)) (t!35049 List!24502)) )
))
(declare-fun arrayNoDuplicates!0 (array!73117 (_ BitVec 32) List!24502) Bool)

(assert (=> b!1121637 (= res!748926 (arrayNoDuplicates!0 lt!498508 #b00000000000000000000000000000000 Nil!24499))))

(declare-fun b!1121638 () Bool)

(declare-fun res!748936 () Bool)

(assert (=> b!1121638 (=> (not res!748936) (not e!638804))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121638 (= res!748936 (= (select (arr!35205 _keys!1208) i!673) k0!934))))

(declare-fun b!1121639 () Bool)

(declare-fun res!748934 () Bool)

(assert (=> b!1121639 (=> (not res!748934) (not e!638804))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73117 (_ BitVec 32)) Bool)

(assert (=> b!1121639 (= res!748934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121640 () Bool)

(declare-fun e!638803 () Bool)

(declare-fun mapRes!43957 () Bool)

(assert (=> b!1121640 (= e!638806 (and e!638803 mapRes!43957))))

(declare-fun condMapEmpty!43957 () Bool)

(declare-fun mapDefault!43957 () ValueCell!13337)

(assert (=> b!1121640 (= condMapEmpty!43957 (= (arr!35206 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13337)) mapDefault!43957)))))

(declare-fun b!1121641 () Bool)

(declare-fun res!748935 () Bool)

(assert (=> b!1121641 (=> (not res!748935) (not e!638804))))

(assert (=> b!1121641 (= res!748935 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24499))))

(declare-fun b!1121642 () Bool)

(declare-fun e!638805 () Bool)

(assert (=> b!1121642 (= e!638805 true)))

(declare-fun zeroValue!944 () V!42585)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17704 0))(
  ( (tuple2!17705 (_1!8863 (_ BitVec 64)) (_2!8863 V!42585)) )
))
(declare-datatypes ((List!24503 0))(
  ( (Nil!24500) (Cons!24499 (h!25717 tuple2!17704) (t!35050 List!24503)) )
))
(declare-datatypes ((ListLongMap!15681 0))(
  ( (ListLongMap!15682 (toList!7856 List!24503)) )
))
(declare-fun lt!498506 () ListLongMap!15681)

(declare-fun getCurrentListMapNoExtraKeys!4386 (array!73117 array!73119 (_ BitVec 32) (_ BitVec 32) V!42585 V!42585 (_ BitVec 32) Int) ListLongMap!15681)

(declare-fun dynLambda!2475 (Int (_ BitVec 64)) V!42585)

(assert (=> b!1121642 (= lt!498506 (getCurrentListMapNoExtraKeys!4386 lt!498508 (array!73120 (store (arr!35206 _values!996) i!673 (ValueCellFull!13337 (dynLambda!2475 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35743 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498507 () ListLongMap!15681)

(assert (=> b!1121642 (= lt!498507 (getCurrentListMapNoExtraKeys!4386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121643 () Bool)

(declare-fun res!748932 () Bool)

(assert (=> b!1121643 (=> (not res!748932) (not e!638804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121643 (= res!748932 (validMask!0 mask!1564))))

(declare-fun b!1121644 () Bool)

(declare-fun e!638807 () Bool)

(assert (=> b!1121644 (= e!638807 tp_is_empty!28093)))

(declare-fun b!1121645 () Bool)

(assert (=> b!1121645 (= e!638803 tp_is_empty!28093)))

(declare-fun b!1121646 () Bool)

(declare-fun res!748928 () Bool)

(assert (=> b!1121646 (=> (not res!748928) (not e!638804))))

(assert (=> b!1121646 (= res!748928 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35742 _keys!1208))))))

(declare-fun mapIsEmpty!43957 () Bool)

(assert (=> mapIsEmpty!43957 mapRes!43957))

(declare-fun b!1121647 () Bool)

(assert (=> b!1121647 (= e!638804 e!638808)))

(declare-fun res!748927 () Bool)

(assert (=> b!1121647 (=> (not res!748927) (not e!638808))))

(assert (=> b!1121647 (= res!748927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498508 mask!1564))))

(assert (=> b!1121647 (= lt!498508 (array!73118 (store (arr!35205 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35742 _keys!1208)))))

(declare-fun b!1121648 () Bool)

(declare-fun res!748933 () Bool)

(assert (=> b!1121648 (=> (not res!748933) (not e!638804))))

(assert (=> b!1121648 (= res!748933 (and (= (size!35743 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35742 _keys!1208) (size!35743 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43957 () Bool)

(declare-fun tp!83393 () Bool)

(assert (=> mapNonEmpty!43957 (= mapRes!43957 (and tp!83393 e!638807))))

(declare-fun mapKey!43957 () (_ BitVec 32))

(declare-fun mapValue!43957 () ValueCell!13337)

(declare-fun mapRest!43957 () (Array (_ BitVec 32) ValueCell!13337))

(assert (=> mapNonEmpty!43957 (= (arr!35206 _values!996) (store mapRest!43957 mapKey!43957 mapValue!43957))))

(declare-fun b!1121649 () Bool)

(assert (=> b!1121649 (= e!638808 (not e!638805))))

(declare-fun res!748929 () Bool)

(assert (=> b!1121649 (=> res!748929 e!638805)))

(assert (=> b!1121649 (= res!748929 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121649 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36749 0))(
  ( (Unit!36750) )
))
(declare-fun lt!498505 () Unit!36749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73117 (_ BitVec 64) (_ BitVec 32)) Unit!36749)

(assert (=> b!1121649 (= lt!498505 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121650 () Bool)

(declare-fun res!748931 () Bool)

(assert (=> b!1121650 (=> (not res!748931) (not e!638804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121650 (= res!748931 (validKeyInArray!0 k0!934))))

(assert (= (and start!98098 res!748930) b!1121643))

(assert (= (and b!1121643 res!748932) b!1121648))

(assert (= (and b!1121648 res!748933) b!1121639))

(assert (= (and b!1121639 res!748934) b!1121641))

(assert (= (and b!1121641 res!748935) b!1121646))

(assert (= (and b!1121646 res!748928) b!1121650))

(assert (= (and b!1121650 res!748931) b!1121638))

(assert (= (and b!1121638 res!748936) b!1121647))

(assert (= (and b!1121647 res!748927) b!1121637))

(assert (= (and b!1121637 res!748926) b!1121649))

(assert (= (and b!1121649 (not res!748929)) b!1121642))

(assert (= (and b!1121640 condMapEmpty!43957) mapIsEmpty!43957))

(assert (= (and b!1121640 (not condMapEmpty!43957)) mapNonEmpty!43957))

(get-info :version)

(assert (= (and mapNonEmpty!43957 ((_ is ValueCellFull!13337) mapValue!43957)) b!1121644))

(assert (= (and b!1121640 ((_ is ValueCellFull!13337) mapDefault!43957)) b!1121645))

(assert (= start!98098 b!1121640))

(declare-fun b_lambda!18543 () Bool)

(assert (=> (not b_lambda!18543) (not b!1121642)))

(declare-fun t!35048 () Bool)

(declare-fun tb!8367 () Bool)

(assert (=> (and start!98098 (= defaultEntry!1004 defaultEntry!1004) t!35048) tb!8367))

(declare-fun result!17303 () Bool)

(assert (=> tb!8367 (= result!17303 tp_is_empty!28093)))

(assert (=> b!1121642 t!35048))

(declare-fun b_and!37921 () Bool)

(assert (= b_and!37919 (and (=> t!35048 result!17303) b_and!37921)))

(declare-fun m!1037067 () Bool)

(assert (=> b!1121649 m!1037067))

(declare-fun m!1037069 () Bool)

(assert (=> b!1121649 m!1037069))

(declare-fun m!1037071 () Bool)

(assert (=> b!1121642 m!1037071))

(declare-fun m!1037073 () Bool)

(assert (=> b!1121642 m!1037073))

(declare-fun m!1037075 () Bool)

(assert (=> b!1121642 m!1037075))

(declare-fun m!1037077 () Bool)

(assert (=> b!1121642 m!1037077))

(declare-fun m!1037079 () Bool)

(assert (=> mapNonEmpty!43957 m!1037079))

(declare-fun m!1037081 () Bool)

(assert (=> b!1121637 m!1037081))

(declare-fun m!1037083 () Bool)

(assert (=> start!98098 m!1037083))

(declare-fun m!1037085 () Bool)

(assert (=> start!98098 m!1037085))

(declare-fun m!1037087 () Bool)

(assert (=> b!1121643 m!1037087))

(declare-fun m!1037089 () Bool)

(assert (=> b!1121638 m!1037089))

(declare-fun m!1037091 () Bool)

(assert (=> b!1121650 m!1037091))

(declare-fun m!1037093 () Bool)

(assert (=> b!1121641 m!1037093))

(declare-fun m!1037095 () Bool)

(assert (=> b!1121647 m!1037095))

(declare-fun m!1037097 () Bool)

(assert (=> b!1121647 m!1037097))

(declare-fun m!1037099 () Bool)

(assert (=> b!1121639 m!1037099))

(check-sat b_and!37921 (not b!1121637) (not b_lambda!18543) (not b!1121639) (not b!1121649) (not b_next!23563) (not b!1121650) (not b!1121642) (not b!1121647) tp_is_empty!28093 (not start!98098) (not b!1121643) (not b!1121641) (not mapNonEmpty!43957))
(check-sat b_and!37921 (not b_next!23563))
