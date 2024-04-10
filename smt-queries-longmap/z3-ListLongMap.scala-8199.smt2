; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100062 () Bool)

(assert start!100062)

(declare-fun b_free!25641 () Bool)

(declare-fun b_next!25641 () Bool)

(assert (=> start!100062 (= b_free!25641 (not b_next!25641))))

(declare-fun tp!89637 () Bool)

(declare-fun b_and!42149 () Bool)

(assert (=> start!100062 (= tp!89637 b_and!42149)))

(declare-fun b!1192737 () Bool)

(declare-fun e!677934 () Bool)

(declare-fun e!677932 () Bool)

(assert (=> b!1192737 (= e!677934 (not e!677932))))

(declare-fun res!793475 () Bool)

(assert (=> b!1192737 (=> res!793475 e!677932)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192737 (= res!793475 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77127 0))(
  ( (array!77128 (arr!37213 (Array (_ BitVec 32) (_ BitVec 64))) (size!37749 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77127)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192737 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39570 0))(
  ( (Unit!39571) )
))
(declare-fun lt!542333 () Unit!39570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77127 (_ BitVec 64) (_ BitVec 32)) Unit!39570)

(assert (=> b!1192737 (= lt!542333 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192738 () Bool)

(declare-fun res!793472 () Bool)

(declare-fun e!677935 () Bool)

(assert (=> b!1192738 (=> (not res!793472) (not e!677935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192738 (= res!793472 (validKeyInArray!0 k0!934))))

(declare-fun b!1192739 () Bool)

(assert (=> b!1192739 (= e!677935 e!677934)))

(declare-fun res!793482 () Bool)

(assert (=> b!1192739 (=> (not res!793482) (not e!677934))))

(declare-fun lt!542332 () array!77127)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77127 (_ BitVec 32)) Bool)

(assert (=> b!1192739 (= res!793482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542332 mask!1564))))

(assert (=> b!1192739 (= lt!542332 (array!77128 (store (arr!37213 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37749 _keys!1208)))))

(declare-fun b!1192740 () Bool)

(declare-fun res!793480 () Bool)

(assert (=> b!1192740 (=> (not res!793480) (not e!677935))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45355 0))(
  ( (V!45356 (val!15142 Int)) )
))
(declare-datatypes ((ValueCell!14376 0))(
  ( (ValueCellFull!14376 (v!17780 V!45355)) (EmptyCell!14376) )
))
(declare-datatypes ((array!77129 0))(
  ( (array!77130 (arr!37214 (Array (_ BitVec 32) ValueCell!14376)) (size!37750 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77129)

(assert (=> b!1192740 (= res!793480 (and (= (size!37750 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37749 _keys!1208) (size!37750 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192741 () Bool)

(declare-fun e!677936 () Bool)

(declare-fun e!677937 () Bool)

(declare-fun mapRes!47084 () Bool)

(assert (=> b!1192741 (= e!677936 (and e!677937 mapRes!47084))))

(declare-fun condMapEmpty!47084 () Bool)

(declare-fun mapDefault!47084 () ValueCell!14376)

(assert (=> b!1192741 (= condMapEmpty!47084 (= (arr!37214 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14376)) mapDefault!47084)))))

(declare-fun b!1192742 () Bool)

(declare-fun e!677931 () Bool)

(declare-fun tp_is_empty!30171 () Bool)

(assert (=> b!1192742 (= e!677931 tp_is_empty!30171)))

(declare-fun b!1192743 () Bool)

(declare-fun e!677933 () Bool)

(assert (=> b!1192743 (= e!677932 e!677933)))

(declare-fun res!793474 () Bool)

(assert (=> b!1192743 (=> res!793474 e!677933)))

(assert (=> b!1192743 (= res!793474 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45355)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19466 0))(
  ( (tuple2!19467 (_1!9744 (_ BitVec 64)) (_2!9744 V!45355)) )
))
(declare-datatypes ((List!26209 0))(
  ( (Nil!26206) (Cons!26205 (h!27414 tuple2!19466) (t!38842 List!26209)) )
))
(declare-datatypes ((ListLongMap!17435 0))(
  ( (ListLongMap!17436 (toList!8733 List!26209)) )
))
(declare-fun lt!542329 () ListLongMap!17435)

(declare-fun minValue!944 () V!45355)

(declare-fun lt!542331 () array!77129)

(declare-fun getCurrentListMapNoExtraKeys!5174 (array!77127 array!77129 (_ BitVec 32) (_ BitVec 32) V!45355 V!45355 (_ BitVec 32) Int) ListLongMap!17435)

(assert (=> b!1192743 (= lt!542329 (getCurrentListMapNoExtraKeys!5174 lt!542332 lt!542331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3105 (Int (_ BitVec 64)) V!45355)

(assert (=> b!1192743 (= lt!542331 (array!77130 (store (arr!37214 _values!996) i!673 (ValueCellFull!14376 (dynLambda!3105 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37750 _values!996)))))

(declare-fun lt!542334 () ListLongMap!17435)

(assert (=> b!1192743 (= lt!542334 (getCurrentListMapNoExtraKeys!5174 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!793476 () Bool)

(assert (=> start!100062 (=> (not res!793476) (not e!677935))))

(assert (=> start!100062 (= res!793476 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37749 _keys!1208))))))

(assert (=> start!100062 e!677935))

(assert (=> start!100062 tp_is_empty!30171))

(declare-fun array_inv!28374 (array!77127) Bool)

(assert (=> start!100062 (array_inv!28374 _keys!1208)))

(assert (=> start!100062 true))

(assert (=> start!100062 tp!89637))

(declare-fun array_inv!28375 (array!77129) Bool)

(assert (=> start!100062 (and (array_inv!28375 _values!996) e!677936)))

(declare-fun b!1192744 () Bool)

(declare-fun res!793478 () Bool)

(assert (=> b!1192744 (=> (not res!793478) (not e!677935))))

(assert (=> b!1192744 (= res!793478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192745 () Bool)

(declare-fun res!793477 () Bool)

(assert (=> b!1192745 (=> (not res!793477) (not e!677935))))

(assert (=> b!1192745 (= res!793477 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37749 _keys!1208))))))

(declare-fun b!1192746 () Bool)

(declare-fun res!793473 () Bool)

(assert (=> b!1192746 (=> (not res!793473) (not e!677935))))

(assert (=> b!1192746 (= res!793473 (= (select (arr!37213 _keys!1208) i!673) k0!934))))

(declare-fun b!1192747 () Bool)

(declare-fun res!793481 () Bool)

(assert (=> b!1192747 (=> (not res!793481) (not e!677934))))

(declare-datatypes ((List!26210 0))(
  ( (Nil!26207) (Cons!26206 (h!27415 (_ BitVec 64)) (t!38843 List!26210)) )
))
(declare-fun arrayNoDuplicates!0 (array!77127 (_ BitVec 32) List!26210) Bool)

(assert (=> b!1192747 (= res!793481 (arrayNoDuplicates!0 lt!542332 #b00000000000000000000000000000000 Nil!26207))))

(declare-fun b!1192748 () Bool)

(assert (=> b!1192748 (= e!677933 true)))

(declare-fun -!1758 (ListLongMap!17435 (_ BitVec 64)) ListLongMap!17435)

(assert (=> b!1192748 (= (getCurrentListMapNoExtraKeys!5174 lt!542332 lt!542331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1758 (getCurrentListMapNoExtraKeys!5174 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542330 () Unit!39570)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!967 (array!77127 array!77129 (_ BitVec 32) (_ BitVec 32) V!45355 V!45355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39570)

(assert (=> b!1192748 (= lt!542330 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!967 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47084 () Bool)

(declare-fun tp!89636 () Bool)

(assert (=> mapNonEmpty!47084 (= mapRes!47084 (and tp!89636 e!677931))))

(declare-fun mapKey!47084 () (_ BitVec 32))

(declare-fun mapRest!47084 () (Array (_ BitVec 32) ValueCell!14376))

(declare-fun mapValue!47084 () ValueCell!14376)

(assert (=> mapNonEmpty!47084 (= (arr!37214 _values!996) (store mapRest!47084 mapKey!47084 mapValue!47084))))

(declare-fun mapIsEmpty!47084 () Bool)

(assert (=> mapIsEmpty!47084 mapRes!47084))

(declare-fun b!1192749 () Bool)

(declare-fun res!793483 () Bool)

(assert (=> b!1192749 (=> (not res!793483) (not e!677935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192749 (= res!793483 (validMask!0 mask!1564))))

(declare-fun b!1192750 () Bool)

(declare-fun res!793479 () Bool)

(assert (=> b!1192750 (=> (not res!793479) (not e!677935))))

(assert (=> b!1192750 (= res!793479 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26207))))

(declare-fun b!1192751 () Bool)

(assert (=> b!1192751 (= e!677937 tp_is_empty!30171)))

(assert (= (and start!100062 res!793476) b!1192749))

(assert (= (and b!1192749 res!793483) b!1192740))

(assert (= (and b!1192740 res!793480) b!1192744))

(assert (= (and b!1192744 res!793478) b!1192750))

(assert (= (and b!1192750 res!793479) b!1192745))

(assert (= (and b!1192745 res!793477) b!1192738))

(assert (= (and b!1192738 res!793472) b!1192746))

(assert (= (and b!1192746 res!793473) b!1192739))

(assert (= (and b!1192739 res!793482) b!1192747))

(assert (= (and b!1192747 res!793481) b!1192737))

(assert (= (and b!1192737 (not res!793475)) b!1192743))

(assert (= (and b!1192743 (not res!793474)) b!1192748))

(assert (= (and b!1192741 condMapEmpty!47084) mapIsEmpty!47084))

(assert (= (and b!1192741 (not condMapEmpty!47084)) mapNonEmpty!47084))

(get-info :version)

(assert (= (and mapNonEmpty!47084 ((_ is ValueCellFull!14376) mapValue!47084)) b!1192742))

(assert (= (and b!1192741 ((_ is ValueCellFull!14376) mapDefault!47084)) b!1192751))

(assert (= start!100062 b!1192741))

(declare-fun b_lambda!20785 () Bool)

(assert (=> (not b_lambda!20785) (not b!1192743)))

(declare-fun t!38841 () Bool)

(declare-fun tb!10453 () Bool)

(assert (=> (and start!100062 (= defaultEntry!1004 defaultEntry!1004) t!38841) tb!10453))

(declare-fun result!21473 () Bool)

(assert (=> tb!10453 (= result!21473 tp_is_empty!30171)))

(assert (=> b!1192743 t!38841))

(declare-fun b_and!42151 () Bool)

(assert (= b_and!42149 (and (=> t!38841 result!21473) b_and!42151)))

(declare-fun m!1101063 () Bool)

(assert (=> b!1192746 m!1101063))

(declare-fun m!1101065 () Bool)

(assert (=> b!1192749 m!1101065))

(declare-fun m!1101067 () Bool)

(assert (=> b!1192747 m!1101067))

(declare-fun m!1101069 () Bool)

(assert (=> b!1192739 m!1101069))

(declare-fun m!1101071 () Bool)

(assert (=> b!1192739 m!1101071))

(declare-fun m!1101073 () Bool)

(assert (=> start!100062 m!1101073))

(declare-fun m!1101075 () Bool)

(assert (=> start!100062 m!1101075))

(declare-fun m!1101077 () Bool)

(assert (=> b!1192748 m!1101077))

(declare-fun m!1101079 () Bool)

(assert (=> b!1192748 m!1101079))

(assert (=> b!1192748 m!1101079))

(declare-fun m!1101081 () Bool)

(assert (=> b!1192748 m!1101081))

(declare-fun m!1101083 () Bool)

(assert (=> b!1192748 m!1101083))

(declare-fun m!1101085 () Bool)

(assert (=> b!1192750 m!1101085))

(declare-fun m!1101087 () Bool)

(assert (=> mapNonEmpty!47084 m!1101087))

(declare-fun m!1101089 () Bool)

(assert (=> b!1192738 m!1101089))

(declare-fun m!1101091 () Bool)

(assert (=> b!1192737 m!1101091))

(declare-fun m!1101093 () Bool)

(assert (=> b!1192737 m!1101093))

(declare-fun m!1101095 () Bool)

(assert (=> b!1192743 m!1101095))

(declare-fun m!1101097 () Bool)

(assert (=> b!1192743 m!1101097))

(declare-fun m!1101099 () Bool)

(assert (=> b!1192743 m!1101099))

(declare-fun m!1101101 () Bool)

(assert (=> b!1192743 m!1101101))

(declare-fun m!1101103 () Bool)

(assert (=> b!1192744 m!1101103))

(check-sat (not b!1192749) (not b!1192750) (not b_next!25641) (not b!1192744) (not b!1192747) (not b_lambda!20785) (not b!1192738) (not b!1192743) (not b!1192737) (not b!1192739) (not mapNonEmpty!47084) (not start!100062) (not b!1192748) tp_is_empty!30171 b_and!42151)
(check-sat b_and!42151 (not b_next!25641))
