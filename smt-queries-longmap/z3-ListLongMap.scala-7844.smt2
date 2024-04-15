; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97802 () Bool)

(assert start!97802)

(declare-fun b_free!23509 () Bool)

(declare-fun b_next!23509 () Bool)

(assert (=> start!97802 (= b_free!23509 (not b_next!23509))))

(declare-fun tp!83231 () Bool)

(declare-fun b_and!37779 () Bool)

(assert (=> start!97802 (= tp!83231 b_and!37779)))

(declare-fun b!1118993 () Bool)

(declare-fun e!637299 () Bool)

(declare-fun tp_is_empty!28039 () Bool)

(assert (=> b!1118993 (= e!637299 tp_is_empty!28039)))

(declare-fun b!1118994 () Bool)

(declare-fun e!637300 () Bool)

(declare-fun mapRes!43876 () Bool)

(assert (=> b!1118994 (= e!637300 (and e!637299 mapRes!43876))))

(declare-fun condMapEmpty!43876 () Bool)

(declare-datatypes ((V!42513 0))(
  ( (V!42514 (val!14076 Int)) )
))
(declare-datatypes ((ValueCell!13310 0))(
  ( (ValueCellFull!13310 (v!16708 V!42513)) (EmptyCell!13310) )
))
(declare-datatypes ((array!72872 0))(
  ( (array!72873 (arr!35089 (Array (_ BitVec 32) ValueCell!13310)) (size!35627 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72872)

(declare-fun mapDefault!43876 () ValueCell!13310)

(assert (=> b!1118994 (= condMapEmpty!43876 (= (arr!35089 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13310)) mapDefault!43876)))))

(declare-fun b!1118995 () Bool)

(declare-fun e!637303 () Bool)

(assert (=> b!1118995 (= e!637303 tp_is_empty!28039)))

(declare-fun b!1118996 () Bool)

(declare-fun e!637305 () Bool)

(declare-fun e!637302 () Bool)

(assert (=> b!1118996 (= e!637305 (not e!637302))))

(declare-fun res!747454 () Bool)

(assert (=> b!1118996 (=> res!747454 e!637302)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118996 (= res!747454 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72874 0))(
  ( (array!72875 (arr!35090 (Array (_ BitVec 32) (_ BitVec 64))) (size!35628 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72874)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118996 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36551 0))(
  ( (Unit!36552) )
))
(declare-fun lt!497467 () Unit!36551)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72874 (_ BitVec 64) (_ BitVec 32)) Unit!36551)

(assert (=> b!1118996 (= lt!497467 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118997 () Bool)

(declare-fun res!747448 () Bool)

(declare-fun e!637304 () Bool)

(assert (=> b!1118997 (=> (not res!747448) (not e!637304))))

(declare-datatypes ((List!24487 0))(
  ( (Nil!24484) (Cons!24483 (h!25692 (_ BitVec 64)) (t!34979 List!24487)) )
))
(declare-fun arrayNoDuplicates!0 (array!72874 (_ BitVec 32) List!24487) Bool)

(assert (=> b!1118997 (= res!747448 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24484))))

(declare-fun b!1118998 () Bool)

(declare-fun res!747444 () Bool)

(assert (=> b!1118998 (=> (not res!747444) (not e!637305))))

(declare-fun lt!497468 () array!72874)

(assert (=> b!1118998 (= res!747444 (arrayNoDuplicates!0 lt!497468 #b00000000000000000000000000000000 Nil!24484))))

(declare-fun b!1118999 () Bool)

(declare-fun res!747450 () Bool)

(assert (=> b!1118999 (=> (not res!747450) (not e!637304))))

(assert (=> b!1118999 (= res!747450 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35628 _keys!1208))))))

(declare-fun b!1119000 () Bool)

(declare-fun res!747449 () Bool)

(assert (=> b!1119000 (=> (not res!747449) (not e!637304))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1119000 (= res!747449 (and (= (size!35627 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35628 _keys!1208) (size!35627 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119002 () Bool)

(declare-fun res!747451 () Bool)

(assert (=> b!1119002 (=> (not res!747451) (not e!637304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119002 (= res!747451 (validMask!0 mask!1564))))

(declare-fun b!1119003 () Bool)

(declare-fun res!747445 () Bool)

(assert (=> b!1119003 (=> (not res!747445) (not e!637304))))

(assert (=> b!1119003 (= res!747445 (= (select (arr!35090 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43876 () Bool)

(assert (=> mapIsEmpty!43876 mapRes!43876))

(declare-fun b!1119004 () Bool)

(declare-fun res!747453 () Bool)

(assert (=> b!1119004 (=> (not res!747453) (not e!637304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72874 (_ BitVec 32)) Bool)

(assert (=> b!1119004 (= res!747453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43876 () Bool)

(declare-fun tp!83230 () Bool)

(assert (=> mapNonEmpty!43876 (= mapRes!43876 (and tp!83230 e!637303))))

(declare-fun mapRest!43876 () (Array (_ BitVec 32) ValueCell!13310))

(declare-fun mapValue!43876 () ValueCell!13310)

(declare-fun mapKey!43876 () (_ BitVec 32))

(assert (=> mapNonEmpty!43876 (= (arr!35089 _values!996) (store mapRest!43876 mapKey!43876 mapValue!43876))))

(declare-fun b!1119005 () Bool)

(assert (=> b!1119005 (= e!637304 e!637305)))

(declare-fun res!747452 () Bool)

(assert (=> b!1119005 (=> (not res!747452) (not e!637305))))

(assert (=> b!1119005 (= res!747452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497468 mask!1564))))

(assert (=> b!1119005 (= lt!497468 (array!72875 (store (arr!35090 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35628 _keys!1208)))))

(declare-fun b!1119006 () Bool)

(assert (=> b!1119006 (= e!637302 true)))

(declare-fun zeroValue!944 () V!42513)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17720 0))(
  ( (tuple2!17721 (_1!8871 (_ BitVec 64)) (_2!8871 V!42513)) )
))
(declare-datatypes ((List!24488 0))(
  ( (Nil!24485) (Cons!24484 (h!25693 tuple2!17720) (t!34980 List!24488)) )
))
(declare-datatypes ((ListLongMap!15689 0))(
  ( (ListLongMap!15690 (toList!7860 List!24488)) )
))
(declare-fun lt!497469 () ListLongMap!15689)

(declare-fun minValue!944 () V!42513)

(declare-fun getCurrentListMapNoExtraKeys!4369 (array!72874 array!72872 (_ BitVec 32) (_ BitVec 32) V!42513 V!42513 (_ BitVec 32) Int) ListLongMap!15689)

(declare-fun dynLambda!2412 (Int (_ BitVec 64)) V!42513)

(assert (=> b!1119006 (= lt!497469 (getCurrentListMapNoExtraKeys!4369 lt!497468 (array!72873 (store (arr!35089 _values!996) i!673 (ValueCellFull!13310 (dynLambda!2412 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35627 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497466 () ListLongMap!15689)

(assert (=> b!1119006 (= lt!497466 (getCurrentListMapNoExtraKeys!4369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!747446 () Bool)

(assert (=> start!97802 (=> (not res!747446) (not e!637304))))

(assert (=> start!97802 (= res!747446 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35628 _keys!1208))))))

(assert (=> start!97802 e!637304))

(assert (=> start!97802 tp_is_empty!28039))

(declare-fun array_inv!27022 (array!72874) Bool)

(assert (=> start!97802 (array_inv!27022 _keys!1208)))

(assert (=> start!97802 true))

(assert (=> start!97802 tp!83231))

(declare-fun array_inv!27023 (array!72872) Bool)

(assert (=> start!97802 (and (array_inv!27023 _values!996) e!637300)))

(declare-fun b!1119001 () Bool)

(declare-fun res!747447 () Bool)

(assert (=> b!1119001 (=> (not res!747447) (not e!637304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119001 (= res!747447 (validKeyInArray!0 k0!934))))

(assert (= (and start!97802 res!747446) b!1119002))

(assert (= (and b!1119002 res!747451) b!1119000))

(assert (= (and b!1119000 res!747449) b!1119004))

(assert (= (and b!1119004 res!747453) b!1118997))

(assert (= (and b!1118997 res!747448) b!1118999))

(assert (= (and b!1118999 res!747450) b!1119001))

(assert (= (and b!1119001 res!747447) b!1119003))

(assert (= (and b!1119003 res!747445) b!1119005))

(assert (= (and b!1119005 res!747452) b!1118998))

(assert (= (and b!1118998 res!747444) b!1118996))

(assert (= (and b!1118996 (not res!747454)) b!1119006))

(assert (= (and b!1118994 condMapEmpty!43876) mapIsEmpty!43876))

(assert (= (and b!1118994 (not condMapEmpty!43876)) mapNonEmpty!43876))

(get-info :version)

(assert (= (and mapNonEmpty!43876 ((_ is ValueCellFull!13310) mapValue!43876)) b!1118995))

(assert (= (and b!1118994 ((_ is ValueCellFull!13310) mapDefault!43876)) b!1118993))

(assert (= start!97802 b!1118994))

(declare-fun b_lambda!18461 () Bool)

(assert (=> (not b_lambda!18461) (not b!1119006)))

(declare-fun t!34978 () Bool)

(declare-fun tb!8313 () Bool)

(assert (=> (and start!97802 (= defaultEntry!1004 defaultEntry!1004) t!34978) tb!8313))

(declare-fun result!17195 () Bool)

(assert (=> tb!8313 (= result!17195 tp_is_empty!28039)))

(assert (=> b!1119006 t!34978))

(declare-fun b_and!37781 () Bool)

(assert (= b_and!37779 (and (=> t!34978 result!17195) b_and!37781)))

(declare-fun m!1033851 () Bool)

(assert (=> b!1118998 m!1033851))

(declare-fun m!1033853 () Bool)

(assert (=> start!97802 m!1033853))

(declare-fun m!1033855 () Bool)

(assert (=> start!97802 m!1033855))

(declare-fun m!1033857 () Bool)

(assert (=> b!1119003 m!1033857))

(declare-fun m!1033859 () Bool)

(assert (=> b!1118996 m!1033859))

(declare-fun m!1033861 () Bool)

(assert (=> b!1118996 m!1033861))

(declare-fun m!1033863 () Bool)

(assert (=> mapNonEmpty!43876 m!1033863))

(declare-fun m!1033865 () Bool)

(assert (=> b!1119005 m!1033865))

(declare-fun m!1033867 () Bool)

(assert (=> b!1119005 m!1033867))

(declare-fun m!1033869 () Bool)

(assert (=> b!1118997 m!1033869))

(declare-fun m!1033871 () Bool)

(assert (=> b!1119002 m!1033871))

(declare-fun m!1033873 () Bool)

(assert (=> b!1119001 m!1033873))

(declare-fun m!1033875 () Bool)

(assert (=> b!1119004 m!1033875))

(declare-fun m!1033877 () Bool)

(assert (=> b!1119006 m!1033877))

(declare-fun m!1033879 () Bool)

(assert (=> b!1119006 m!1033879))

(declare-fun m!1033881 () Bool)

(assert (=> b!1119006 m!1033881))

(declare-fun m!1033883 () Bool)

(assert (=> b!1119006 m!1033883))

(check-sat (not b_next!23509) (not b!1119004) (not b!1118997) (not b!1119001) (not b_lambda!18461) (not mapNonEmpty!43876) (not b!1119002) b_and!37781 (not start!97802) (not b!1118996) tp_is_empty!28039 (not b!1119005) (not b!1118998) (not b!1119006))
(check-sat b_and!37781 (not b_next!23509))
