; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98056 () Bool)

(assert start!98056)

(declare-fun b_free!23521 () Bool)

(declare-fun b_next!23521 () Bool)

(assert (=> start!98056 (= b_free!23521 (not b_next!23521))))

(declare-fun tp!83266 () Bool)

(declare-fun b_and!37835 () Bool)

(assert (=> start!98056 (= tp!83266 b_and!37835)))

(declare-fun b!1120713 () Bool)

(declare-fun e!638367 () Bool)

(declare-fun tp_is_empty!28051 () Bool)

(assert (=> b!1120713 (= e!638367 tp_is_empty!28051)))

(declare-fun mapNonEmpty!43894 () Bool)

(declare-fun mapRes!43894 () Bool)

(declare-fun tp!83267 () Bool)

(assert (=> mapNonEmpty!43894 (= mapRes!43894 (and tp!83267 e!638367))))

(declare-datatypes ((V!42529 0))(
  ( (V!42530 (val!14082 Int)) )
))
(declare-datatypes ((ValueCell!13316 0))(
  ( (ValueCellFull!13316 (v!16711 V!42529)) (EmptyCell!13316) )
))
(declare-fun mapRest!43894 () (Array (_ BitVec 32) ValueCell!13316))

(declare-datatypes ((array!73033 0))(
  ( (array!73034 (arr!35163 (Array (_ BitVec 32) ValueCell!13316)) (size!35700 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73033)

(declare-fun mapValue!43894 () ValueCell!13316)

(declare-fun mapKey!43894 () (_ BitVec 32))

(assert (=> mapNonEmpty!43894 (= (arr!35163 _values!996) (store mapRest!43894 mapKey!43894 mapValue!43894))))

(declare-fun b!1120714 () Bool)

(declare-fun res!748233 () Bool)

(declare-fun e!638366 () Bool)

(assert (=> b!1120714 (=> (not res!748233) (not e!638366))))

(declare-datatypes ((array!73035 0))(
  ( (array!73036 (arr!35164 (Array (_ BitVec 32) (_ BitVec 64))) (size!35701 (_ BitVec 32))) )
))
(declare-fun lt!498254 () array!73035)

(declare-datatypes ((List!24470 0))(
  ( (Nil!24467) (Cons!24466 (h!25684 (_ BitVec 64)) (t!34975 List!24470)) )
))
(declare-fun arrayNoDuplicates!0 (array!73035 (_ BitVec 32) List!24470) Bool)

(assert (=> b!1120714 (= res!748233 (arrayNoDuplicates!0 lt!498254 #b00000000000000000000000000000000 Nil!24467))))

(declare-fun b!1120715 () Bool)

(declare-fun e!638361 () Bool)

(assert (=> b!1120715 (= e!638366 (not e!638361))))

(declare-fun res!748239 () Bool)

(assert (=> b!1120715 (=> res!748239 e!638361)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120715 (= res!748239 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!73035)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120715 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36715 0))(
  ( (Unit!36716) )
))
(declare-fun lt!498255 () Unit!36715)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73035 (_ BitVec 64) (_ BitVec 32)) Unit!36715)

(assert (=> b!1120715 (= lt!498255 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120716 () Bool)

(declare-fun e!638363 () Bool)

(assert (=> b!1120716 (= e!638363 tp_is_empty!28051)))

(declare-fun b!1120717 () Bool)

(declare-fun res!748242 () Bool)

(declare-fun e!638362 () Bool)

(assert (=> b!1120717 (=> (not res!748242) (not e!638362))))

(assert (=> b!1120717 (= res!748242 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24467))))

(declare-fun b!1120718 () Bool)

(declare-fun res!748235 () Bool)

(assert (=> b!1120718 (=> (not res!748235) (not e!638362))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120718 (= res!748235 (validMask!0 mask!1564))))

(declare-fun b!1120719 () Bool)

(declare-fun res!748238 () Bool)

(assert (=> b!1120719 (=> (not res!748238) (not e!638362))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1120719 (= res!748238 (and (= (size!35700 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35701 _keys!1208) (size!35700 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120720 () Bool)

(declare-fun res!748236 () Bool)

(assert (=> b!1120720 (=> (not res!748236) (not e!638362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73035 (_ BitVec 32)) Bool)

(assert (=> b!1120720 (= res!748236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43894 () Bool)

(assert (=> mapIsEmpty!43894 mapRes!43894))

(declare-fun b!1120721 () Bool)

(declare-fun e!638365 () Bool)

(assert (=> b!1120721 (= e!638365 (and e!638363 mapRes!43894))))

(declare-fun condMapEmpty!43894 () Bool)

(declare-fun mapDefault!43894 () ValueCell!13316)

(assert (=> b!1120721 (= condMapEmpty!43894 (= (arr!35163 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13316)) mapDefault!43894)))))

(declare-fun b!1120722 () Bool)

(declare-fun res!748237 () Bool)

(assert (=> b!1120722 (=> (not res!748237) (not e!638362))))

(assert (=> b!1120722 (= res!748237 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35701 _keys!1208))))))

(declare-fun b!1120723 () Bool)

(assert (=> b!1120723 (= e!638361 true)))

(declare-fun zeroValue!944 () V!42529)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17678 0))(
  ( (tuple2!17679 (_1!8850 (_ BitVec 64)) (_2!8850 V!42529)) )
))
(declare-datatypes ((List!24471 0))(
  ( (Nil!24468) (Cons!24467 (h!25685 tuple2!17678) (t!34976 List!24471)) )
))
(declare-datatypes ((ListLongMap!15655 0))(
  ( (ListLongMap!15656 (toList!7843 List!24471)) )
))
(declare-fun lt!498256 () ListLongMap!15655)

(declare-fun minValue!944 () V!42529)

(declare-fun getCurrentListMapNoExtraKeys!4373 (array!73035 array!73033 (_ BitVec 32) (_ BitVec 32) V!42529 V!42529 (_ BitVec 32) Int) ListLongMap!15655)

(declare-fun dynLambda!2462 (Int (_ BitVec 64)) V!42529)

(assert (=> b!1120723 (= lt!498256 (getCurrentListMapNoExtraKeys!4373 lt!498254 (array!73034 (store (arr!35163 _values!996) i!673 (ValueCellFull!13316 (dynLambda!2462 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35700 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498253 () ListLongMap!15655)

(assert (=> b!1120723 (= lt!498253 (getCurrentListMapNoExtraKeys!4373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120724 () Bool)

(assert (=> b!1120724 (= e!638362 e!638366)))

(declare-fun res!748243 () Bool)

(assert (=> b!1120724 (=> (not res!748243) (not e!638366))))

(assert (=> b!1120724 (= res!748243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498254 mask!1564))))

(assert (=> b!1120724 (= lt!498254 (array!73036 (store (arr!35164 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35701 _keys!1208)))))

(declare-fun res!748234 () Bool)

(assert (=> start!98056 (=> (not res!748234) (not e!638362))))

(assert (=> start!98056 (= res!748234 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35701 _keys!1208))))))

(assert (=> start!98056 e!638362))

(assert (=> start!98056 tp_is_empty!28051))

(declare-fun array_inv!27072 (array!73035) Bool)

(assert (=> start!98056 (array_inv!27072 _keys!1208)))

(assert (=> start!98056 true))

(assert (=> start!98056 tp!83266))

(declare-fun array_inv!27073 (array!73033) Bool)

(assert (=> start!98056 (and (array_inv!27073 _values!996) e!638365)))

(declare-fun b!1120725 () Bool)

(declare-fun res!748240 () Bool)

(assert (=> b!1120725 (=> (not res!748240) (not e!638362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120725 (= res!748240 (validKeyInArray!0 k0!934))))

(declare-fun b!1120726 () Bool)

(declare-fun res!748241 () Bool)

(assert (=> b!1120726 (=> (not res!748241) (not e!638362))))

(assert (=> b!1120726 (= res!748241 (= (select (arr!35164 _keys!1208) i!673) k0!934))))

(assert (= (and start!98056 res!748234) b!1120718))

(assert (= (and b!1120718 res!748235) b!1120719))

(assert (= (and b!1120719 res!748238) b!1120720))

(assert (= (and b!1120720 res!748236) b!1120717))

(assert (= (and b!1120717 res!748242) b!1120722))

(assert (= (and b!1120722 res!748237) b!1120725))

(assert (= (and b!1120725 res!748240) b!1120726))

(assert (= (and b!1120726 res!748241) b!1120724))

(assert (= (and b!1120724 res!748243) b!1120714))

(assert (= (and b!1120714 res!748233) b!1120715))

(assert (= (and b!1120715 (not res!748239)) b!1120723))

(assert (= (and b!1120721 condMapEmpty!43894) mapIsEmpty!43894))

(assert (= (and b!1120721 (not condMapEmpty!43894)) mapNonEmpty!43894))

(get-info :version)

(assert (= (and mapNonEmpty!43894 ((_ is ValueCellFull!13316) mapValue!43894)) b!1120713))

(assert (= (and b!1120721 ((_ is ValueCellFull!13316) mapDefault!43894)) b!1120716))

(assert (= start!98056 b!1120721))

(declare-fun b_lambda!18501 () Bool)

(assert (=> (not b_lambda!18501) (not b!1120723)))

(declare-fun t!34974 () Bool)

(declare-fun tb!8325 () Bool)

(assert (=> (and start!98056 (= defaultEntry!1004 defaultEntry!1004) t!34974) tb!8325))

(declare-fun result!17219 () Bool)

(assert (=> tb!8325 (= result!17219 tp_is_empty!28051)))

(assert (=> b!1120723 t!34974))

(declare-fun b_and!37837 () Bool)

(assert (= b_and!37835 (and (=> t!34974 result!17219) b_and!37837)))

(declare-fun m!1036353 () Bool)

(assert (=> b!1120715 m!1036353))

(declare-fun m!1036355 () Bool)

(assert (=> b!1120715 m!1036355))

(declare-fun m!1036357 () Bool)

(assert (=> b!1120724 m!1036357))

(declare-fun m!1036359 () Bool)

(assert (=> b!1120724 m!1036359))

(declare-fun m!1036361 () Bool)

(assert (=> start!98056 m!1036361))

(declare-fun m!1036363 () Bool)

(assert (=> start!98056 m!1036363))

(declare-fun m!1036365 () Bool)

(assert (=> b!1120725 m!1036365))

(declare-fun m!1036367 () Bool)

(assert (=> b!1120717 m!1036367))

(declare-fun m!1036369 () Bool)

(assert (=> b!1120720 m!1036369))

(declare-fun m!1036371 () Bool)

(assert (=> b!1120718 m!1036371))

(declare-fun m!1036373 () Bool)

(assert (=> mapNonEmpty!43894 m!1036373))

(declare-fun m!1036375 () Bool)

(assert (=> b!1120726 m!1036375))

(declare-fun m!1036377 () Bool)

(assert (=> b!1120714 m!1036377))

(declare-fun m!1036379 () Bool)

(assert (=> b!1120723 m!1036379))

(declare-fun m!1036381 () Bool)

(assert (=> b!1120723 m!1036381))

(declare-fun m!1036383 () Bool)

(assert (=> b!1120723 m!1036383))

(declare-fun m!1036385 () Bool)

(assert (=> b!1120723 m!1036385))

(check-sat (not b!1120715) (not b!1120724) (not b_lambda!18501) (not b_next!23521) (not b!1120720) (not b!1120723) b_and!37837 (not mapNonEmpty!43894) tp_is_empty!28051 (not b!1120725) (not b!1120717) (not b!1120714) (not start!98056) (not b!1120718))
(check-sat b_and!37837 (not b_next!23521))
