; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99040 () Bool)

(assert start!99040)

(declare-fun b_free!24645 () Bool)

(declare-fun b_next!24645 () Bool)

(assert (=> start!99040 (= b_free!24645 (not b_next!24645))))

(declare-fun tp!86646 () Bool)

(declare-fun b_and!40139 () Bool)

(assert (=> start!99040 (= tp!86646 b_and!40139)))

(declare-fun b!1164314 () Bool)

(declare-fun res!772090 () Bool)

(declare-fun e!662004 () Bool)

(assert (=> b!1164314 (=> (not res!772090) (not e!662004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164314 (= res!772090 (validKeyInArray!0 k0!934))))

(declare-fun b!1164315 () Bool)

(declare-fun e!662002 () Bool)

(assert (=> b!1164315 (= e!662004 e!662002)))

(declare-fun res!772087 () Bool)

(assert (=> b!1164315 (=> (not res!772087) (not e!662002))))

(declare-datatypes ((array!75185 0))(
  ( (array!75186 (arr!36243 (Array (_ BitVec 32) (_ BitVec 64))) (size!36779 (_ BitVec 32))) )
))
(declare-fun lt!524607 () array!75185)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75185 (_ BitVec 32)) Bool)

(assert (=> b!1164315 (= res!772087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524607 mask!1564))))

(declare-fun _keys!1208 () array!75185)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164315 (= lt!524607 (array!75186 (store (arr!36243 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36779 _keys!1208)))))

(declare-fun b!1164316 () Bool)

(declare-fun res!772097 () Bool)

(assert (=> b!1164316 (=> (not res!772097) (not e!662004))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44027 0))(
  ( (V!44028 (val!14644 Int)) )
))
(declare-datatypes ((ValueCell!13878 0))(
  ( (ValueCellFull!13878 (v!17281 V!44027)) (EmptyCell!13878) )
))
(declare-datatypes ((array!75187 0))(
  ( (array!75188 (arr!36244 (Array (_ BitVec 32) ValueCell!13878)) (size!36780 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75187)

(assert (=> b!1164316 (= res!772097 (and (= (size!36780 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36779 _keys!1208) (size!36780 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164317 () Bool)

(declare-fun e!662006 () Bool)

(declare-fun tp_is_empty!29175 () Bool)

(assert (=> b!1164317 (= e!662006 tp_is_empty!29175)))

(declare-fun b!1164318 () Bool)

(declare-fun e!662001 () Bool)

(declare-fun e!662003 () Bool)

(declare-fun mapRes!45587 () Bool)

(assert (=> b!1164318 (= e!662001 (and e!662003 mapRes!45587))))

(declare-fun condMapEmpty!45587 () Bool)

(declare-fun mapDefault!45587 () ValueCell!13878)

(assert (=> b!1164318 (= condMapEmpty!45587 (= (arr!36244 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13878)) mapDefault!45587)))))

(declare-fun res!772095 () Bool)

(assert (=> start!99040 (=> (not res!772095) (not e!662004))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99040 (= res!772095 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36779 _keys!1208))))))

(assert (=> start!99040 e!662004))

(assert (=> start!99040 tp_is_empty!29175))

(declare-fun array_inv!27728 (array!75185) Bool)

(assert (=> start!99040 (array_inv!27728 _keys!1208)))

(assert (=> start!99040 true))

(assert (=> start!99040 tp!86646))

(declare-fun array_inv!27729 (array!75187) Bool)

(assert (=> start!99040 (and (array_inv!27729 _values!996) e!662001)))

(declare-fun b!1164319 () Bool)

(declare-fun e!662007 () Bool)

(assert (=> b!1164319 (= e!662002 (not e!662007))))

(declare-fun res!772088 () Bool)

(assert (=> b!1164319 (=> res!772088 e!662007)))

(assert (=> b!1164319 (= res!772088 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164319 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38430 0))(
  ( (Unit!38431) )
))
(declare-fun lt!524606 () Unit!38430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75185 (_ BitVec 64) (_ BitVec 32)) Unit!38430)

(assert (=> b!1164319 (= lt!524606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45587 () Bool)

(declare-fun tp!86645 () Bool)

(assert (=> mapNonEmpty!45587 (= mapRes!45587 (and tp!86645 e!662006))))

(declare-fun mapKey!45587 () (_ BitVec 32))

(declare-fun mapValue!45587 () ValueCell!13878)

(declare-fun mapRest!45587 () (Array (_ BitVec 32) ValueCell!13878))

(assert (=> mapNonEmpty!45587 (= (arr!36244 _values!996) (store mapRest!45587 mapKey!45587 mapValue!45587))))

(declare-fun b!1164320 () Bool)

(declare-fun res!772093 () Bool)

(assert (=> b!1164320 (=> (not res!772093) (not e!662002))))

(declare-datatypes ((List!25408 0))(
  ( (Nil!25405) (Cons!25404 (h!26613 (_ BitVec 64)) (t!37045 List!25408)) )
))
(declare-fun arrayNoDuplicates!0 (array!75185 (_ BitVec 32) List!25408) Bool)

(assert (=> b!1164320 (= res!772093 (arrayNoDuplicates!0 lt!524607 #b00000000000000000000000000000000 Nil!25405))))

(declare-fun mapIsEmpty!45587 () Bool)

(assert (=> mapIsEmpty!45587 mapRes!45587))

(declare-fun b!1164321 () Bool)

(declare-fun res!772089 () Bool)

(assert (=> b!1164321 (=> (not res!772089) (not e!662004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164321 (= res!772089 (validMask!0 mask!1564))))

(declare-fun b!1164322 () Bool)

(assert (=> b!1164322 (= e!662003 tp_is_empty!29175)))

(declare-fun b!1164323 () Bool)

(declare-fun res!772091 () Bool)

(assert (=> b!1164323 (=> (not res!772091) (not e!662004))))

(assert (=> b!1164323 (= res!772091 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25405))))

(declare-fun b!1164324 () Bool)

(assert (=> b!1164324 (= e!662007 true)))

(declare-fun zeroValue!944 () V!44027)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18676 0))(
  ( (tuple2!18677 (_1!9349 (_ BitVec 64)) (_2!9349 V!44027)) )
))
(declare-datatypes ((List!25409 0))(
  ( (Nil!25406) (Cons!25405 (h!26614 tuple2!18676) (t!37046 List!25409)) )
))
(declare-datatypes ((ListLongMap!16645 0))(
  ( (ListLongMap!16646 (toList!8338 List!25409)) )
))
(declare-fun lt!524605 () ListLongMap!16645)

(declare-fun minValue!944 () V!44027)

(declare-fun getCurrentListMapNoExtraKeys!4802 (array!75185 array!75187 (_ BitVec 32) (_ BitVec 32) V!44027 V!44027 (_ BitVec 32) Int) ListLongMap!16645)

(declare-fun dynLambda!2792 (Int (_ BitVec 64)) V!44027)

(assert (=> b!1164324 (= lt!524605 (getCurrentListMapNoExtraKeys!4802 lt!524607 (array!75188 (store (arr!36244 _values!996) i!673 (ValueCellFull!13878 (dynLambda!2792 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36780 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524604 () ListLongMap!16645)

(assert (=> b!1164324 (= lt!524604 (getCurrentListMapNoExtraKeys!4802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164325 () Bool)

(declare-fun res!772092 () Bool)

(assert (=> b!1164325 (=> (not res!772092) (not e!662004))))

(assert (=> b!1164325 (= res!772092 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36779 _keys!1208))))))

(declare-fun b!1164326 () Bool)

(declare-fun res!772094 () Bool)

(assert (=> b!1164326 (=> (not res!772094) (not e!662004))))

(assert (=> b!1164326 (= res!772094 (= (select (arr!36243 _keys!1208) i!673) k0!934))))

(declare-fun b!1164327 () Bool)

(declare-fun res!772096 () Bool)

(assert (=> b!1164327 (=> (not res!772096) (not e!662004))))

(assert (=> b!1164327 (= res!772096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99040 res!772095) b!1164321))

(assert (= (and b!1164321 res!772089) b!1164316))

(assert (= (and b!1164316 res!772097) b!1164327))

(assert (= (and b!1164327 res!772096) b!1164323))

(assert (= (and b!1164323 res!772091) b!1164325))

(assert (= (and b!1164325 res!772092) b!1164314))

(assert (= (and b!1164314 res!772090) b!1164326))

(assert (= (and b!1164326 res!772094) b!1164315))

(assert (= (and b!1164315 res!772087) b!1164320))

(assert (= (and b!1164320 res!772093) b!1164319))

(assert (= (and b!1164319 (not res!772088)) b!1164324))

(assert (= (and b!1164318 condMapEmpty!45587) mapIsEmpty!45587))

(assert (= (and b!1164318 (not condMapEmpty!45587)) mapNonEmpty!45587))

(get-info :version)

(assert (= (and mapNonEmpty!45587 ((_ is ValueCellFull!13878) mapValue!45587)) b!1164317))

(assert (= (and b!1164318 ((_ is ValueCellFull!13878) mapDefault!45587)) b!1164322))

(assert (= start!99040 b!1164318))

(declare-fun b_lambda!19751 () Bool)

(assert (=> (not b_lambda!19751) (not b!1164324)))

(declare-fun t!37044 () Bool)

(declare-fun tb!9457 () Bool)

(assert (=> (and start!99040 (= defaultEntry!1004 defaultEntry!1004) t!37044) tb!9457))

(declare-fun result!19479 () Bool)

(assert (=> tb!9457 (= result!19479 tp_is_empty!29175)))

(assert (=> b!1164324 t!37044))

(declare-fun b_and!40141 () Bool)

(assert (= b_and!40139 (and (=> t!37044 result!19479) b_and!40141)))

(declare-fun m!1072767 () Bool)

(assert (=> b!1164320 m!1072767))

(declare-fun m!1072769 () Bool)

(assert (=> mapNonEmpty!45587 m!1072769))

(declare-fun m!1072771 () Bool)

(assert (=> b!1164315 m!1072771))

(declare-fun m!1072773 () Bool)

(assert (=> b!1164315 m!1072773))

(declare-fun m!1072775 () Bool)

(assert (=> start!99040 m!1072775))

(declare-fun m!1072777 () Bool)

(assert (=> start!99040 m!1072777))

(declare-fun m!1072779 () Bool)

(assert (=> b!1164314 m!1072779))

(declare-fun m!1072781 () Bool)

(assert (=> b!1164321 m!1072781))

(declare-fun m!1072783 () Bool)

(assert (=> b!1164326 m!1072783))

(declare-fun m!1072785 () Bool)

(assert (=> b!1164324 m!1072785))

(declare-fun m!1072787 () Bool)

(assert (=> b!1164324 m!1072787))

(declare-fun m!1072789 () Bool)

(assert (=> b!1164324 m!1072789))

(declare-fun m!1072791 () Bool)

(assert (=> b!1164324 m!1072791))

(declare-fun m!1072793 () Bool)

(assert (=> b!1164319 m!1072793))

(declare-fun m!1072795 () Bool)

(assert (=> b!1164319 m!1072795))

(declare-fun m!1072797 () Bool)

(assert (=> b!1164323 m!1072797))

(declare-fun m!1072799 () Bool)

(assert (=> b!1164327 m!1072799))

(check-sat (not b!1164327) (not b_lambda!19751) (not mapNonEmpty!45587) (not b!1164314) (not b!1164319) (not b!1164324) (not start!99040) (not b_next!24645) tp_is_empty!29175 (not b!1164315) (not b!1164323) (not b!1164320) (not b!1164321) b_and!40141)
(check-sat b_and!40141 (not b_next!24645))
