; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100002 () Bool)

(assert start!100002)

(declare-fun b_free!25581 () Bool)

(declare-fun b_next!25581 () Bool)

(assert (=> start!100002 (= b_free!25581 (not b_next!25581))))

(declare-fun tp!89457 () Bool)

(declare-fun b_and!42029 () Bool)

(assert (=> start!100002 (= tp!89457 b_and!42029)))

(declare-fun b!1191327 () Bool)

(declare-fun e!677216 () Bool)

(declare-fun e!677213 () Bool)

(declare-fun mapRes!46994 () Bool)

(assert (=> b!1191327 (= e!677216 (and e!677213 mapRes!46994))))

(declare-fun condMapEmpty!46994 () Bool)

(declare-datatypes ((V!45275 0))(
  ( (V!45276 (val!15112 Int)) )
))
(declare-datatypes ((ValueCell!14346 0))(
  ( (ValueCellFull!14346 (v!17750 V!45275)) (EmptyCell!14346) )
))
(declare-datatypes ((array!77013 0))(
  ( (array!77014 (arr!37156 (Array (_ BitVec 32) ValueCell!14346)) (size!37692 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77013)

(declare-fun mapDefault!46994 () ValueCell!14346)

(assert (=> b!1191327 (= condMapEmpty!46994 (= (arr!37156 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14346)) mapDefault!46994)))))

(declare-fun b!1191328 () Bool)

(declare-fun tp_is_empty!30111 () Bool)

(assert (=> b!1191328 (= e!677213 tp_is_empty!30111)))

(declare-fun b!1191329 () Bool)

(declare-fun res!792392 () Bool)

(declare-fun e!677212 () Bool)

(assert (=> b!1191329 (=> (not res!792392) (not e!677212))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77015 0))(
  ( (array!77016 (arr!37157 (Array (_ BitVec 32) (_ BitVec 64))) (size!37693 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77015)

(assert (=> b!1191329 (= res!792392 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37693 _keys!1208))))))

(declare-fun b!1191330 () Bool)

(declare-fun e!677218 () Bool)

(assert (=> b!1191330 (= e!677218 tp_is_empty!30111)))

(declare-fun b!1191331 () Bool)

(declare-fun e!677215 () Bool)

(assert (=> b!1191331 (= e!677212 e!677215)))

(declare-fun res!792400 () Bool)

(assert (=> b!1191331 (=> (not res!792400) (not e!677215))))

(declare-fun lt!541789 () array!77015)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77015 (_ BitVec 32)) Bool)

(assert (=> b!1191331 (= res!792400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541789 mask!1564))))

(assert (=> b!1191331 (= lt!541789 (array!77016 (store (arr!37157 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37693 _keys!1208)))))

(declare-fun b!1191332 () Bool)

(declare-fun res!792403 () Bool)

(assert (=> b!1191332 (=> (not res!792403) (not e!677212))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1191332 (= res!792403 (= (select (arr!37157 _keys!1208) i!673) k0!934))))

(declare-fun b!1191333 () Bool)

(declare-fun res!792401 () Bool)

(assert (=> b!1191333 (=> (not res!792401) (not e!677215))))

(declare-datatypes ((List!26166 0))(
  ( (Nil!26163) (Cons!26162 (h!27371 (_ BitVec 64)) (t!38739 List!26166)) )
))
(declare-fun arrayNoDuplicates!0 (array!77015 (_ BitVec 32) List!26166) Bool)

(assert (=> b!1191333 (= res!792401 (arrayNoDuplicates!0 lt!541789 #b00000000000000000000000000000000 Nil!26163))))

(declare-fun b!1191334 () Bool)

(declare-fun e!677214 () Bool)

(assert (=> b!1191334 (= e!677214 true)))

(declare-fun zeroValue!944 () V!45275)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45275)

(declare-fun lt!541790 () array!77013)

(declare-datatypes ((tuple2!19422 0))(
  ( (tuple2!19423 (_1!9722 (_ BitVec 64)) (_2!9722 V!45275)) )
))
(declare-datatypes ((List!26167 0))(
  ( (Nil!26164) (Cons!26163 (h!27372 tuple2!19422) (t!38740 List!26167)) )
))
(declare-datatypes ((ListLongMap!17391 0))(
  ( (ListLongMap!17392 (toList!8711 List!26167)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5152 (array!77015 array!77013 (_ BitVec 32) (_ BitVec 32) V!45275 V!45275 (_ BitVec 32) Int) ListLongMap!17391)

(declare-fun -!1736 (ListLongMap!17391 (_ BitVec 64)) ListLongMap!17391)

(assert (=> b!1191334 (= (getCurrentListMapNoExtraKeys!5152 lt!541789 lt!541790 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1736 (getCurrentListMapNoExtraKeys!5152 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39518 0))(
  ( (Unit!39519) )
))
(declare-fun lt!541794 () Unit!39518)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!945 (array!77015 array!77013 (_ BitVec 32) (_ BitVec 32) V!45275 V!45275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39518)

(assert (=> b!1191334 (= lt!541794 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!945 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46994 () Bool)

(assert (=> mapIsEmpty!46994 mapRes!46994))

(declare-fun b!1191335 () Bool)

(declare-fun e!677211 () Bool)

(assert (=> b!1191335 (= e!677211 e!677214)))

(declare-fun res!792393 () Bool)

(assert (=> b!1191335 (=> res!792393 e!677214)))

(assert (=> b!1191335 (= res!792393 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541791 () ListLongMap!17391)

(assert (=> b!1191335 (= lt!541791 (getCurrentListMapNoExtraKeys!5152 lt!541789 lt!541790 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3086 (Int (_ BitVec 64)) V!45275)

(assert (=> b!1191335 (= lt!541790 (array!77014 (store (arr!37156 _values!996) i!673 (ValueCellFull!14346 (dynLambda!3086 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37692 _values!996)))))

(declare-fun lt!541793 () ListLongMap!17391)

(assert (=> b!1191335 (= lt!541793 (getCurrentListMapNoExtraKeys!5152 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191337 () Bool)

(declare-fun res!792395 () Bool)

(assert (=> b!1191337 (=> (not res!792395) (not e!677212))))

(assert (=> b!1191337 (= res!792395 (and (= (size!37692 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37693 _keys!1208) (size!37692 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46994 () Bool)

(declare-fun tp!89456 () Bool)

(assert (=> mapNonEmpty!46994 (= mapRes!46994 (and tp!89456 e!677218))))

(declare-fun mapValue!46994 () ValueCell!14346)

(declare-fun mapKey!46994 () (_ BitVec 32))

(declare-fun mapRest!46994 () (Array (_ BitVec 32) ValueCell!14346))

(assert (=> mapNonEmpty!46994 (= (arr!37156 _values!996) (store mapRest!46994 mapKey!46994 mapValue!46994))))

(declare-fun b!1191338 () Bool)

(declare-fun res!792396 () Bool)

(assert (=> b!1191338 (=> (not res!792396) (not e!677212))))

(assert (=> b!1191338 (= res!792396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191339 () Bool)

(assert (=> b!1191339 (= e!677215 (not e!677211))))

(declare-fun res!792398 () Bool)

(assert (=> b!1191339 (=> res!792398 e!677211)))

(assert (=> b!1191339 (= res!792398 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191339 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541792 () Unit!39518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77015 (_ BitVec 64) (_ BitVec 32)) Unit!39518)

(assert (=> b!1191339 (= lt!541792 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191340 () Bool)

(declare-fun res!792402 () Bool)

(assert (=> b!1191340 (=> (not res!792402) (not e!677212))))

(assert (=> b!1191340 (= res!792402 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26163))))

(declare-fun b!1191341 () Bool)

(declare-fun res!792399 () Bool)

(assert (=> b!1191341 (=> (not res!792399) (not e!677212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191341 (= res!792399 (validMask!0 mask!1564))))

(declare-fun b!1191336 () Bool)

(declare-fun res!792394 () Bool)

(assert (=> b!1191336 (=> (not res!792394) (not e!677212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191336 (= res!792394 (validKeyInArray!0 k0!934))))

(declare-fun res!792397 () Bool)

(assert (=> start!100002 (=> (not res!792397) (not e!677212))))

(assert (=> start!100002 (= res!792397 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37693 _keys!1208))))))

(assert (=> start!100002 e!677212))

(assert (=> start!100002 tp_is_empty!30111))

(declare-fun array_inv!28336 (array!77015) Bool)

(assert (=> start!100002 (array_inv!28336 _keys!1208)))

(assert (=> start!100002 true))

(assert (=> start!100002 tp!89457))

(declare-fun array_inv!28337 (array!77013) Bool)

(assert (=> start!100002 (and (array_inv!28337 _values!996) e!677216)))

(assert (= (and start!100002 res!792397) b!1191341))

(assert (= (and b!1191341 res!792399) b!1191337))

(assert (= (and b!1191337 res!792395) b!1191338))

(assert (= (and b!1191338 res!792396) b!1191340))

(assert (= (and b!1191340 res!792402) b!1191329))

(assert (= (and b!1191329 res!792392) b!1191336))

(assert (= (and b!1191336 res!792394) b!1191332))

(assert (= (and b!1191332 res!792403) b!1191331))

(assert (= (and b!1191331 res!792400) b!1191333))

(assert (= (and b!1191333 res!792401) b!1191339))

(assert (= (and b!1191339 (not res!792398)) b!1191335))

(assert (= (and b!1191335 (not res!792393)) b!1191334))

(assert (= (and b!1191327 condMapEmpty!46994) mapIsEmpty!46994))

(assert (= (and b!1191327 (not condMapEmpty!46994)) mapNonEmpty!46994))

(get-info :version)

(assert (= (and mapNonEmpty!46994 ((_ is ValueCellFull!14346) mapValue!46994)) b!1191330))

(assert (= (and b!1191327 ((_ is ValueCellFull!14346) mapDefault!46994)) b!1191328))

(assert (= start!100002 b!1191327))

(declare-fun b_lambda!20725 () Bool)

(assert (=> (not b_lambda!20725) (not b!1191335)))

(declare-fun t!38738 () Bool)

(declare-fun tb!10393 () Bool)

(assert (=> (and start!100002 (= defaultEntry!1004 defaultEntry!1004) t!38738) tb!10393))

(declare-fun result!21353 () Bool)

(assert (=> tb!10393 (= result!21353 tp_is_empty!30111)))

(assert (=> b!1191335 t!38738))

(declare-fun b_and!42031 () Bool)

(assert (= b_and!42029 (and (=> t!38738 result!21353) b_and!42031)))

(declare-fun m!1099803 () Bool)

(assert (=> b!1191333 m!1099803))

(declare-fun m!1099805 () Bool)

(assert (=> b!1191341 m!1099805))

(declare-fun m!1099807 () Bool)

(assert (=> b!1191331 m!1099807))

(declare-fun m!1099809 () Bool)

(assert (=> b!1191331 m!1099809))

(declare-fun m!1099811 () Bool)

(assert (=> mapNonEmpty!46994 m!1099811))

(declare-fun m!1099813 () Bool)

(assert (=> b!1191335 m!1099813))

(declare-fun m!1099815 () Bool)

(assert (=> b!1191335 m!1099815))

(declare-fun m!1099817 () Bool)

(assert (=> b!1191335 m!1099817))

(declare-fun m!1099819 () Bool)

(assert (=> b!1191335 m!1099819))

(declare-fun m!1099821 () Bool)

(assert (=> b!1191340 m!1099821))

(declare-fun m!1099823 () Bool)

(assert (=> b!1191336 m!1099823))

(declare-fun m!1099825 () Bool)

(assert (=> b!1191332 m!1099825))

(declare-fun m!1099827 () Bool)

(assert (=> b!1191334 m!1099827))

(declare-fun m!1099829 () Bool)

(assert (=> b!1191334 m!1099829))

(assert (=> b!1191334 m!1099829))

(declare-fun m!1099831 () Bool)

(assert (=> b!1191334 m!1099831))

(declare-fun m!1099833 () Bool)

(assert (=> b!1191334 m!1099833))

(declare-fun m!1099835 () Bool)

(assert (=> b!1191339 m!1099835))

(declare-fun m!1099837 () Bool)

(assert (=> b!1191339 m!1099837))

(declare-fun m!1099839 () Bool)

(assert (=> b!1191338 m!1099839))

(declare-fun m!1099841 () Bool)

(assert (=> start!100002 m!1099841))

(declare-fun m!1099843 () Bool)

(assert (=> start!100002 m!1099843))

(check-sat (not b!1191340) (not mapNonEmpty!46994) (not b!1191331) (not b!1191333) b_and!42031 (not b!1191335) (not b!1191334) (not b!1191336) (not b!1191341) (not b!1191338) (not b_lambda!20725) (not b!1191339) tp_is_empty!30111 (not b_next!25581) (not start!100002))
(check-sat b_and!42031 (not b_next!25581))
