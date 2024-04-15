; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101244 () Bool)

(assert start!101244)

(declare-fun b_free!26173 () Bool)

(declare-fun b_next!26173 () Bool)

(assert (=> start!101244 (= b_free!26173 (not b_next!26173))))

(declare-fun tp!91540 () Bool)

(declare-fun b_and!43445 () Bool)

(assert (=> start!101244 (= tp!91540 b_and!43445)))

(declare-fun b!1215971 () Bool)

(declare-fun res!807428 () Bool)

(declare-fun e!690381 () Bool)

(assert (=> b!1215971 (=> (not res!807428) (not e!690381))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215971 (= res!807428 (validKeyInArray!0 k0!934))))

(declare-fun res!807424 () Bool)

(assert (=> start!101244 (=> (not res!807424) (not e!690381))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78448 0))(
  ( (array!78449 (arr!37859 (Array (_ BitVec 32) (_ BitVec 64))) (size!38397 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78448)

(assert (=> start!101244 (= res!807424 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38397 _keys!1208))))))

(assert (=> start!101244 e!690381))

(declare-fun tp_is_empty!30877 () Bool)

(assert (=> start!101244 tp_is_empty!30877))

(declare-fun array_inv!28938 (array!78448) Bool)

(assert (=> start!101244 (array_inv!28938 _keys!1208)))

(assert (=> start!101244 true))

(assert (=> start!101244 tp!91540))

(declare-datatypes ((V!46297 0))(
  ( (V!46298 (val!15495 Int)) )
))
(declare-datatypes ((ValueCell!14729 0))(
  ( (ValueCellFull!14729 (v!18147 V!46297)) (EmptyCell!14729) )
))
(declare-datatypes ((array!78450 0))(
  ( (array!78451 (arr!37860 (Array (_ BitVec 32) ValueCell!14729)) (size!38398 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78450)

(declare-fun e!690385 () Bool)

(declare-fun array_inv!28939 (array!78450) Bool)

(assert (=> start!101244 (and (array_inv!28939 _values!996) e!690385)))

(declare-fun mapIsEmpty!48190 () Bool)

(declare-fun mapRes!48190 () Bool)

(assert (=> mapIsEmpty!48190 mapRes!48190))

(declare-fun b!1215972 () Bool)

(declare-fun res!807431 () Bool)

(assert (=> b!1215972 (=> (not res!807431) (not e!690381))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215972 (= res!807431 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38397 _keys!1208))))))

(declare-fun mapNonEmpty!48190 () Bool)

(declare-fun tp!91541 () Bool)

(declare-fun e!690380 () Bool)

(assert (=> mapNonEmpty!48190 (= mapRes!48190 (and tp!91541 e!690380))))

(declare-fun mapValue!48190 () ValueCell!14729)

(declare-fun mapKey!48190 () (_ BitVec 32))

(declare-fun mapRest!48190 () (Array (_ BitVec 32) ValueCell!14729))

(assert (=> mapNonEmpty!48190 (= (arr!37860 _values!996) (store mapRest!48190 mapKey!48190 mapValue!48190))))

(declare-fun b!1215973 () Bool)

(declare-fun e!690383 () Bool)

(assert (=> b!1215973 (= e!690383 tp_is_empty!30877)))

(declare-fun b!1215974 () Bool)

(assert (=> b!1215974 (= e!690380 tp_is_empty!30877)))

(declare-fun b!1215975 () Bool)

(declare-fun res!807423 () Bool)

(assert (=> b!1215975 (=> (not res!807423) (not e!690381))))

(assert (=> b!1215975 (= res!807423 (= (select (arr!37859 _keys!1208) i!673) k0!934))))

(declare-fun b!1215976 () Bool)

(declare-fun e!690384 () Bool)

(assert (=> b!1215976 (= e!690381 e!690384)))

(declare-fun res!807426 () Bool)

(assert (=> b!1215976 (=> (not res!807426) (not e!690384))))

(declare-fun lt!552609 () array!78448)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78448 (_ BitVec 32)) Bool)

(assert (=> b!1215976 (= res!807426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552609 mask!1564))))

(assert (=> b!1215976 (= lt!552609 (array!78449 (store (arr!37859 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38397 _keys!1208)))))

(declare-fun b!1215977 () Bool)

(declare-fun res!807429 () Bool)

(assert (=> b!1215977 (=> (not res!807429) (not e!690381))))

(assert (=> b!1215977 (= res!807429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215978 () Bool)

(declare-fun res!807427 () Bool)

(assert (=> b!1215978 (=> (not res!807427) (not e!690384))))

(declare-datatypes ((List!26785 0))(
  ( (Nil!26782) (Cons!26781 (h!27990 (_ BitVec 64)) (t!39929 List!26785)) )
))
(declare-fun arrayNoDuplicates!0 (array!78448 (_ BitVec 32) List!26785) Bool)

(assert (=> b!1215978 (= res!807427 (arrayNoDuplicates!0 lt!552609 #b00000000000000000000000000000000 Nil!26782))))

(declare-fun b!1215979 () Bool)

(declare-fun res!807430 () Bool)

(assert (=> b!1215979 (=> (not res!807430) (not e!690381))))

(assert (=> b!1215979 (= res!807430 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26782))))

(declare-fun b!1215980 () Bool)

(declare-fun res!807433 () Bool)

(assert (=> b!1215980 (=> (not res!807433) (not e!690381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215980 (= res!807433 (validMask!0 mask!1564))))

(declare-fun b!1215981 () Bool)

(declare-fun e!690382 () Bool)

(assert (=> b!1215981 (= e!690382 true)))

(declare-fun zeroValue!944 () V!46297)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46297)

(declare-datatypes ((tuple2!20006 0))(
  ( (tuple2!20007 (_1!10014 (_ BitVec 64)) (_2!10014 V!46297)) )
))
(declare-datatypes ((List!26786 0))(
  ( (Nil!26783) (Cons!26782 (h!27991 tuple2!20006) (t!39930 List!26786)) )
))
(declare-datatypes ((ListLongMap!17975 0))(
  ( (ListLongMap!17976 (toList!9003 List!26786)) )
))
(declare-fun lt!552611 () ListLongMap!17975)

(declare-fun getCurrentListMapNoExtraKeys!5442 (array!78448 array!78450 (_ BitVec 32) (_ BitVec 32) V!46297 V!46297 (_ BitVec 32) Int) ListLongMap!17975)

(declare-fun dynLambda!3294 (Int (_ BitVec 64)) V!46297)

(assert (=> b!1215981 (= lt!552611 (getCurrentListMapNoExtraKeys!5442 lt!552609 (array!78451 (store (arr!37860 _values!996) i!673 (ValueCellFull!14729 (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38398 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552610 () ListLongMap!17975)

(assert (=> b!1215981 (= lt!552610 (getCurrentListMapNoExtraKeys!5442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215982 () Bool)

(assert (=> b!1215982 (= e!690385 (and e!690383 mapRes!48190))))

(declare-fun condMapEmpty!48190 () Bool)

(declare-fun mapDefault!48190 () ValueCell!14729)

(assert (=> b!1215982 (= condMapEmpty!48190 (= (arr!37860 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14729)) mapDefault!48190)))))

(declare-fun b!1215983 () Bool)

(declare-fun res!807425 () Bool)

(assert (=> b!1215983 (=> (not res!807425) (not e!690381))))

(assert (=> b!1215983 (= res!807425 (and (= (size!38398 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38397 _keys!1208) (size!38398 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215984 () Bool)

(assert (=> b!1215984 (= e!690384 (not e!690382))))

(declare-fun res!807432 () Bool)

(assert (=> b!1215984 (=> res!807432 e!690382)))

(assert (=> b!1215984 (= res!807432 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215984 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40179 0))(
  ( (Unit!40180) )
))
(declare-fun lt!552608 () Unit!40179)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78448 (_ BitVec 64) (_ BitVec 32)) Unit!40179)

(assert (=> b!1215984 (= lt!552608 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101244 res!807424) b!1215980))

(assert (= (and b!1215980 res!807433) b!1215983))

(assert (= (and b!1215983 res!807425) b!1215977))

(assert (= (and b!1215977 res!807429) b!1215979))

(assert (= (and b!1215979 res!807430) b!1215972))

(assert (= (and b!1215972 res!807431) b!1215971))

(assert (= (and b!1215971 res!807428) b!1215975))

(assert (= (and b!1215975 res!807423) b!1215976))

(assert (= (and b!1215976 res!807426) b!1215978))

(assert (= (and b!1215978 res!807427) b!1215984))

(assert (= (and b!1215984 (not res!807432)) b!1215981))

(assert (= (and b!1215982 condMapEmpty!48190) mapIsEmpty!48190))

(assert (= (and b!1215982 (not condMapEmpty!48190)) mapNonEmpty!48190))

(get-info :version)

(assert (= (and mapNonEmpty!48190 ((_ is ValueCellFull!14729) mapValue!48190)) b!1215974))

(assert (= (and b!1215982 ((_ is ValueCellFull!14729) mapDefault!48190)) b!1215973))

(assert (= start!101244 b!1215982))

(declare-fun b_lambda!21839 () Bool)

(assert (=> (not b_lambda!21839) (not b!1215981)))

(declare-fun t!39928 () Bool)

(declare-fun tb!10965 () Bool)

(assert (=> (and start!101244 (= defaultEntry!1004 defaultEntry!1004) t!39928) tb!10965))

(declare-fun result!22535 () Bool)

(assert (=> tb!10965 (= result!22535 tp_is_empty!30877)))

(assert (=> b!1215981 t!39928))

(declare-fun b_and!43447 () Bool)

(assert (= b_and!43445 (and (=> t!39928 result!22535) b_and!43447)))

(declare-fun m!1120341 () Bool)

(assert (=> b!1215976 m!1120341))

(declare-fun m!1120343 () Bool)

(assert (=> b!1215976 m!1120343))

(declare-fun m!1120345 () Bool)

(assert (=> b!1215984 m!1120345))

(declare-fun m!1120347 () Bool)

(assert (=> b!1215984 m!1120347))

(declare-fun m!1120349 () Bool)

(assert (=> b!1215975 m!1120349))

(declare-fun m!1120351 () Bool)

(assert (=> b!1215981 m!1120351))

(declare-fun m!1120353 () Bool)

(assert (=> b!1215981 m!1120353))

(declare-fun m!1120355 () Bool)

(assert (=> b!1215981 m!1120355))

(declare-fun m!1120357 () Bool)

(assert (=> b!1215981 m!1120357))

(declare-fun m!1120359 () Bool)

(assert (=> b!1215978 m!1120359))

(declare-fun m!1120361 () Bool)

(assert (=> b!1215977 m!1120361))

(declare-fun m!1120363 () Bool)

(assert (=> b!1215979 m!1120363))

(declare-fun m!1120365 () Bool)

(assert (=> b!1215971 m!1120365))

(declare-fun m!1120367 () Bool)

(assert (=> mapNonEmpty!48190 m!1120367))

(declare-fun m!1120369 () Bool)

(assert (=> b!1215980 m!1120369))

(declare-fun m!1120371 () Bool)

(assert (=> start!101244 m!1120371))

(declare-fun m!1120373 () Bool)

(assert (=> start!101244 m!1120373))

(check-sat (not mapNonEmpty!48190) (not start!101244) (not b!1215979) (not b!1215978) b_and!43447 (not b!1215976) tp_is_empty!30877 (not b!1215980) (not b!1215971) (not b!1215981) (not b_lambda!21839) (not b!1215977) (not b!1215984) (not b_next!26173))
(check-sat b_and!43447 (not b_next!26173))
