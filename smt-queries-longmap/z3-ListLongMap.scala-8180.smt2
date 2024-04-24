; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100182 () Bool)

(assert start!100182)

(declare-fun b_free!25525 () Bool)

(declare-fun b_next!25525 () Bool)

(assert (=> start!100182 (= b_free!25525 (not b_next!25525))))

(declare-fun tp!89288 () Bool)

(declare-fun b_and!41919 () Bool)

(assert (=> start!100182 (= tp!89288 b_and!41919)))

(declare-fun b!1191300 () Bool)

(declare-fun e!677376 () Bool)

(declare-fun e!677377 () Bool)

(assert (=> b!1191300 (= e!677376 e!677377)))

(declare-fun res!791902 () Bool)

(assert (=> b!1191300 (=> res!791902 e!677377)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191300 (= res!791902 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45201 0))(
  ( (V!45202 (val!15084 Int)) )
))
(declare-fun zeroValue!944 () V!45201)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76947 0))(
  ( (array!76948 (arr!37117 (Array (_ BitVec 32) (_ BitVec 64))) (size!37654 (_ BitVec 32))) )
))
(declare-fun lt!541770 () array!76947)

(declare-datatypes ((tuple2!19408 0))(
  ( (tuple2!19409 (_1!9715 (_ BitVec 64)) (_2!9715 V!45201)) )
))
(declare-datatypes ((List!26152 0))(
  ( (Nil!26149) (Cons!26148 (h!27366 tuple2!19408) (t!38661 List!26152)) )
))
(declare-datatypes ((ListLongMap!17385 0))(
  ( (ListLongMap!17386 (toList!8708 List!26152)) )
))
(declare-fun lt!541771 () ListLongMap!17385)

(declare-fun minValue!944 () V!45201)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14318 0))(
  ( (ValueCellFull!14318 (v!17718 V!45201)) (EmptyCell!14318) )
))
(declare-datatypes ((array!76949 0))(
  ( (array!76950 (arr!37118 (Array (_ BitVec 32) ValueCell!14318)) (size!37655 (_ BitVec 32))) )
))
(declare-fun lt!541769 () array!76949)

(declare-fun getCurrentListMapNoExtraKeys!5176 (array!76947 array!76949 (_ BitVec 32) (_ BitVec 32) V!45201 V!45201 (_ BitVec 32) Int) ListLongMap!17385)

(assert (=> b!1191300 (= lt!541771 (getCurrentListMapNoExtraKeys!5176 lt!541770 lt!541769 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76949)

(declare-fun dynLambda!3133 (Int (_ BitVec 64)) V!45201)

(assert (=> b!1191300 (= lt!541769 (array!76950 (store (arr!37118 _values!996) i!673 (ValueCellFull!14318 (dynLambda!3133 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37655 _values!996)))))

(declare-fun _keys!1208 () array!76947)

(declare-fun lt!541774 () ListLongMap!17385)

(assert (=> b!1191300 (= lt!541774 (getCurrentListMapNoExtraKeys!5176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46910 () Bool)

(declare-fun mapRes!46910 () Bool)

(assert (=> mapIsEmpty!46910 mapRes!46910))

(declare-fun res!791898 () Bool)

(declare-fun e!677374 () Bool)

(assert (=> start!100182 (=> (not res!791898) (not e!677374))))

(assert (=> start!100182 (= res!791898 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37654 _keys!1208))))))

(assert (=> start!100182 e!677374))

(declare-fun tp_is_empty!30055 () Bool)

(assert (=> start!100182 tp_is_empty!30055))

(declare-fun array_inv!28374 (array!76947) Bool)

(assert (=> start!100182 (array_inv!28374 _keys!1208)))

(assert (=> start!100182 true))

(assert (=> start!100182 tp!89288))

(declare-fun e!677371 () Bool)

(declare-fun array_inv!28375 (array!76949) Bool)

(assert (=> start!100182 (and (array_inv!28375 _values!996) e!677371)))

(declare-fun b!1191301 () Bool)

(declare-fun res!791894 () Bool)

(assert (=> b!1191301 (=> (not res!791894) (not e!677374))))

(assert (=> b!1191301 (= res!791894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37654 _keys!1208))))))

(declare-fun b!1191302 () Bool)

(declare-fun e!677373 () Bool)

(assert (=> b!1191302 (= e!677374 e!677373)))

(declare-fun res!791896 () Bool)

(assert (=> b!1191302 (=> (not res!791896) (not e!677373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76947 (_ BitVec 32)) Bool)

(assert (=> b!1191302 (= res!791896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541770 mask!1564))))

(assert (=> b!1191302 (= lt!541770 (array!76948 (store (arr!37117 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37654 _keys!1208)))))

(declare-fun b!1191303 () Bool)

(declare-fun e!677375 () Bool)

(assert (=> b!1191303 (= e!677371 (and e!677375 mapRes!46910))))

(declare-fun condMapEmpty!46910 () Bool)

(declare-fun mapDefault!46910 () ValueCell!14318)

(assert (=> b!1191303 (= condMapEmpty!46910 (= (arr!37118 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14318)) mapDefault!46910)))))

(declare-fun b!1191304 () Bool)

(declare-fun res!791895 () Bool)

(assert (=> b!1191304 (=> (not res!791895) (not e!677374))))

(assert (=> b!1191304 (= res!791895 (and (= (size!37655 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37654 _keys!1208) (size!37655 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191305 () Bool)

(declare-fun e!677372 () Bool)

(assert (=> b!1191305 (= e!677372 tp_is_empty!30055)))

(declare-fun mapNonEmpty!46910 () Bool)

(declare-fun tp!89289 () Bool)

(assert (=> mapNonEmpty!46910 (= mapRes!46910 (and tp!89289 e!677372))))

(declare-fun mapValue!46910 () ValueCell!14318)

(declare-fun mapRest!46910 () (Array (_ BitVec 32) ValueCell!14318))

(declare-fun mapKey!46910 () (_ BitVec 32))

(assert (=> mapNonEmpty!46910 (= (arr!37118 _values!996) (store mapRest!46910 mapKey!46910 mapValue!46910))))

(declare-fun b!1191306 () Bool)

(assert (=> b!1191306 (= e!677375 tp_is_empty!30055)))

(declare-fun b!1191307 () Bool)

(assert (=> b!1191307 (= e!677377 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1722 (ListLongMap!17385 (_ BitVec 64)) ListLongMap!17385)

(assert (=> b!1191307 (= (getCurrentListMapNoExtraKeys!5176 lt!541770 lt!541769 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1722 (getCurrentListMapNoExtraKeys!5176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39461 0))(
  ( (Unit!39462) )
))
(declare-fun lt!541772 () Unit!39461)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!937 (array!76947 array!76949 (_ BitVec 32) (_ BitVec 32) V!45201 V!45201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39461)

(assert (=> b!1191307 (= lt!541772 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!937 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191308 () Bool)

(declare-fun res!791893 () Bool)

(assert (=> b!1191308 (=> (not res!791893) (not e!677374))))

(assert (=> b!1191308 (= res!791893 (= (select (arr!37117 _keys!1208) i!673) k0!934))))

(declare-fun b!1191309 () Bool)

(declare-fun res!791892 () Bool)

(assert (=> b!1191309 (=> (not res!791892) (not e!677373))))

(declare-datatypes ((List!26153 0))(
  ( (Nil!26150) (Cons!26149 (h!27367 (_ BitVec 64)) (t!38662 List!26153)) )
))
(declare-fun arrayNoDuplicates!0 (array!76947 (_ BitVec 32) List!26153) Bool)

(assert (=> b!1191309 (= res!791892 (arrayNoDuplicates!0 lt!541770 #b00000000000000000000000000000000 Nil!26150))))

(declare-fun b!1191310 () Bool)

(declare-fun res!791903 () Bool)

(assert (=> b!1191310 (=> (not res!791903) (not e!677374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191310 (= res!791903 (validMask!0 mask!1564))))

(declare-fun b!1191311 () Bool)

(declare-fun res!791901 () Bool)

(assert (=> b!1191311 (=> (not res!791901) (not e!677374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191311 (= res!791901 (validKeyInArray!0 k0!934))))

(declare-fun b!1191312 () Bool)

(declare-fun res!791897 () Bool)

(assert (=> b!1191312 (=> (not res!791897) (not e!677374))))

(assert (=> b!1191312 (= res!791897 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26150))))

(declare-fun b!1191313 () Bool)

(assert (=> b!1191313 (= e!677373 (not e!677376))))

(declare-fun res!791899 () Bool)

(assert (=> b!1191313 (=> res!791899 e!677376)))

(assert (=> b!1191313 (= res!791899 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191313 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541773 () Unit!39461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76947 (_ BitVec 64) (_ BitVec 32)) Unit!39461)

(assert (=> b!1191313 (= lt!541773 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191314 () Bool)

(declare-fun res!791900 () Bool)

(assert (=> b!1191314 (=> (not res!791900) (not e!677374))))

(assert (=> b!1191314 (= res!791900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100182 res!791898) b!1191310))

(assert (= (and b!1191310 res!791903) b!1191304))

(assert (= (and b!1191304 res!791895) b!1191314))

(assert (= (and b!1191314 res!791900) b!1191312))

(assert (= (and b!1191312 res!791897) b!1191301))

(assert (= (and b!1191301 res!791894) b!1191311))

(assert (= (and b!1191311 res!791901) b!1191308))

(assert (= (and b!1191308 res!791893) b!1191302))

(assert (= (and b!1191302 res!791896) b!1191309))

(assert (= (and b!1191309 res!791892) b!1191313))

(assert (= (and b!1191313 (not res!791899)) b!1191300))

(assert (= (and b!1191300 (not res!791902)) b!1191307))

(assert (= (and b!1191303 condMapEmpty!46910) mapIsEmpty!46910))

(assert (= (and b!1191303 (not condMapEmpty!46910)) mapNonEmpty!46910))

(get-info :version)

(assert (= (and mapNonEmpty!46910 ((_ is ValueCellFull!14318) mapValue!46910)) b!1191305))

(assert (= (and b!1191303 ((_ is ValueCellFull!14318) mapDefault!46910)) b!1191306))

(assert (= start!100182 b!1191303))

(declare-fun b_lambda!20663 () Bool)

(assert (=> (not b_lambda!20663) (not b!1191300)))

(declare-fun t!38660 () Bool)

(declare-fun tb!10329 () Bool)

(assert (=> (and start!100182 (= defaultEntry!1004 defaultEntry!1004) t!38660) tb!10329))

(declare-fun result!21233 () Bool)

(assert (=> tb!10329 (= result!21233 tp_is_empty!30055)))

(assert (=> b!1191300 t!38660))

(declare-fun b_and!41921 () Bool)

(assert (= b_and!41919 (and (=> t!38660 result!21233) b_and!41921)))

(declare-fun m!1100199 () Bool)

(assert (=> b!1191314 m!1100199))

(declare-fun m!1100201 () Bool)

(assert (=> b!1191307 m!1100201))

(declare-fun m!1100203 () Bool)

(assert (=> b!1191307 m!1100203))

(assert (=> b!1191307 m!1100203))

(declare-fun m!1100205 () Bool)

(assert (=> b!1191307 m!1100205))

(declare-fun m!1100207 () Bool)

(assert (=> b!1191307 m!1100207))

(declare-fun m!1100209 () Bool)

(assert (=> b!1191312 m!1100209))

(declare-fun m!1100211 () Bool)

(assert (=> b!1191308 m!1100211))

(declare-fun m!1100213 () Bool)

(assert (=> b!1191311 m!1100213))

(declare-fun m!1100215 () Bool)

(assert (=> mapNonEmpty!46910 m!1100215))

(declare-fun m!1100217 () Bool)

(assert (=> b!1191309 m!1100217))

(declare-fun m!1100219 () Bool)

(assert (=> start!100182 m!1100219))

(declare-fun m!1100221 () Bool)

(assert (=> start!100182 m!1100221))

(declare-fun m!1100223 () Bool)

(assert (=> b!1191310 m!1100223))

(declare-fun m!1100225 () Bool)

(assert (=> b!1191313 m!1100225))

(declare-fun m!1100227 () Bool)

(assert (=> b!1191313 m!1100227))

(declare-fun m!1100229 () Bool)

(assert (=> b!1191300 m!1100229))

(declare-fun m!1100231 () Bool)

(assert (=> b!1191300 m!1100231))

(declare-fun m!1100233 () Bool)

(assert (=> b!1191300 m!1100233))

(declare-fun m!1100235 () Bool)

(assert (=> b!1191300 m!1100235))

(declare-fun m!1100237 () Bool)

(assert (=> b!1191302 m!1100237))

(declare-fun m!1100239 () Bool)

(assert (=> b!1191302 m!1100239))

(check-sat (not b!1191302) (not b!1191300) (not b!1191307) tp_is_empty!30055 b_and!41921 (not b!1191311) (not b_lambda!20663) (not b_next!25525) (not start!100182) (not b!1191313) (not b!1191309) (not b!1191310) (not b!1191312) (not mapNonEmpty!46910) (not b!1191314))
(check-sat b_and!41921 (not b_next!25525))
