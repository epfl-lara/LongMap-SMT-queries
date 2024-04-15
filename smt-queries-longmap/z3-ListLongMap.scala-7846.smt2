; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97814 () Bool)

(assert start!97814)

(declare-fun b_free!23521 () Bool)

(declare-fun b_next!23521 () Bool)

(assert (=> start!97814 (= b_free!23521 (not b_next!23521))))

(declare-fun tp!83266 () Bool)

(declare-fun b_and!37803 () Bool)

(assert (=> start!97814 (= tp!83266 b_and!37803)))

(declare-fun mapIsEmpty!43894 () Bool)

(declare-fun mapRes!43894 () Bool)

(assert (=> mapIsEmpty!43894 mapRes!43894))

(declare-fun b!1119257 () Bool)

(declare-fun e!637430 () Bool)

(declare-fun e!637431 () Bool)

(assert (=> b!1119257 (= e!637430 (and e!637431 mapRes!43894))))

(declare-fun condMapEmpty!43894 () Bool)

(declare-datatypes ((V!42529 0))(
  ( (V!42530 (val!14082 Int)) )
))
(declare-datatypes ((ValueCell!13316 0))(
  ( (ValueCellFull!13316 (v!16714 V!42529)) (EmptyCell!13316) )
))
(declare-datatypes ((array!72896 0))(
  ( (array!72897 (arr!35101 (Array (_ BitVec 32) ValueCell!13316)) (size!35639 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72896)

(declare-fun mapDefault!43894 () ValueCell!13316)

(assert (=> b!1119257 (= condMapEmpty!43894 (= (arr!35101 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13316)) mapDefault!43894)))))

(declare-fun b!1119258 () Bool)

(declare-fun res!747647 () Bool)

(declare-fun e!637427 () Bool)

(assert (=> b!1119258 (=> (not res!747647) (not e!637427))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72898 0))(
  ( (array!72899 (arr!35102 (Array (_ BitVec 32) (_ BitVec 64))) (size!35640 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72898)

(assert (=> b!1119258 (= res!747647 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35640 _keys!1208))))))

(declare-fun b!1119259 () Bool)

(declare-fun e!637425 () Bool)

(declare-fun e!637429 () Bool)

(assert (=> b!1119259 (= e!637425 (not e!637429))))

(declare-fun res!747646 () Bool)

(assert (=> b!1119259 (=> res!747646 e!637429)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119259 (= res!747646 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119259 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36561 0))(
  ( (Unit!36562) )
))
(declare-fun lt!497539 () Unit!36561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72898 (_ BitVec 64) (_ BitVec 32)) Unit!36561)

(assert (=> b!1119259 (= lt!497539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119260 () Bool)

(assert (=> b!1119260 (= e!637429 true)))

(declare-fun zeroValue!944 () V!42529)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17728 0))(
  ( (tuple2!17729 (_1!8875 (_ BitVec 64)) (_2!8875 V!42529)) )
))
(declare-datatypes ((List!24497 0))(
  ( (Nil!24494) (Cons!24493 (h!25702 tuple2!17728) (t!35001 List!24497)) )
))
(declare-datatypes ((ListLongMap!15697 0))(
  ( (ListLongMap!15698 (toList!7864 List!24497)) )
))
(declare-fun lt!497538 () ListLongMap!15697)

(declare-fun minValue!944 () V!42529)

(declare-fun lt!497540 () array!72898)

(declare-fun getCurrentListMapNoExtraKeys!4373 (array!72898 array!72896 (_ BitVec 32) (_ BitVec 32) V!42529 V!42529 (_ BitVec 32) Int) ListLongMap!15697)

(declare-fun dynLambda!2416 (Int (_ BitVec 64)) V!42529)

(assert (=> b!1119260 (= lt!497538 (getCurrentListMapNoExtraKeys!4373 lt!497540 (array!72897 (store (arr!35101 _values!996) i!673 (ValueCellFull!13316 (dynLambda!2416 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35639 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497541 () ListLongMap!15697)

(assert (=> b!1119260 (= lt!497541 (getCurrentListMapNoExtraKeys!4373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119261 () Bool)

(declare-fun e!637428 () Bool)

(declare-fun tp_is_empty!28051 () Bool)

(assert (=> b!1119261 (= e!637428 tp_is_empty!28051)))

(declare-fun b!1119262 () Bool)

(assert (=> b!1119262 (= e!637431 tp_is_empty!28051)))

(declare-fun b!1119263 () Bool)

(declare-fun res!747651 () Bool)

(assert (=> b!1119263 (=> (not res!747651) (not e!637427))))

(assert (=> b!1119263 (= res!747651 (= (select (arr!35102 _keys!1208) i!673) k0!934))))

(declare-fun b!1119264 () Bool)

(declare-fun res!747652 () Bool)

(assert (=> b!1119264 (=> (not res!747652) (not e!637427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72898 (_ BitVec 32)) Bool)

(assert (=> b!1119264 (= res!747652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119265 () Bool)

(declare-fun res!747648 () Bool)

(assert (=> b!1119265 (=> (not res!747648) (not e!637427))))

(assert (=> b!1119265 (= res!747648 (and (= (size!35639 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35640 _keys!1208) (size!35639 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119266 () Bool)

(declare-fun res!747645 () Bool)

(assert (=> b!1119266 (=> (not res!747645) (not e!637427))))

(declare-datatypes ((List!24498 0))(
  ( (Nil!24495) (Cons!24494 (h!25703 (_ BitVec 64)) (t!35002 List!24498)) )
))
(declare-fun arrayNoDuplicates!0 (array!72898 (_ BitVec 32) List!24498) Bool)

(assert (=> b!1119266 (= res!747645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24495))))

(declare-fun b!1119267 () Bool)

(declare-fun res!747649 () Bool)

(assert (=> b!1119267 (=> (not res!747649) (not e!637427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119267 (= res!747649 (validMask!0 mask!1564))))

(declare-fun res!747642 () Bool)

(assert (=> start!97814 (=> (not res!747642) (not e!637427))))

(assert (=> start!97814 (= res!747642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35640 _keys!1208))))))

(assert (=> start!97814 e!637427))

(assert (=> start!97814 tp_is_empty!28051))

(declare-fun array_inv!27030 (array!72898) Bool)

(assert (=> start!97814 (array_inv!27030 _keys!1208)))

(assert (=> start!97814 true))

(assert (=> start!97814 tp!83266))

(declare-fun array_inv!27031 (array!72896) Bool)

(assert (=> start!97814 (and (array_inv!27031 _values!996) e!637430)))

(declare-fun b!1119268 () Bool)

(declare-fun res!747644 () Bool)

(assert (=> b!1119268 (=> (not res!747644) (not e!637425))))

(assert (=> b!1119268 (= res!747644 (arrayNoDuplicates!0 lt!497540 #b00000000000000000000000000000000 Nil!24495))))

(declare-fun b!1119269 () Bool)

(assert (=> b!1119269 (= e!637427 e!637425)))

(declare-fun res!747650 () Bool)

(assert (=> b!1119269 (=> (not res!747650) (not e!637425))))

(assert (=> b!1119269 (= res!747650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497540 mask!1564))))

(assert (=> b!1119269 (= lt!497540 (array!72899 (store (arr!35102 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35640 _keys!1208)))))

(declare-fun mapNonEmpty!43894 () Bool)

(declare-fun tp!83267 () Bool)

(assert (=> mapNonEmpty!43894 (= mapRes!43894 (and tp!83267 e!637428))))

(declare-fun mapRest!43894 () (Array (_ BitVec 32) ValueCell!13316))

(declare-fun mapKey!43894 () (_ BitVec 32))

(declare-fun mapValue!43894 () ValueCell!13316)

(assert (=> mapNonEmpty!43894 (= (arr!35101 _values!996) (store mapRest!43894 mapKey!43894 mapValue!43894))))

(declare-fun b!1119270 () Bool)

(declare-fun res!747643 () Bool)

(assert (=> b!1119270 (=> (not res!747643) (not e!637427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119270 (= res!747643 (validKeyInArray!0 k0!934))))

(assert (= (and start!97814 res!747642) b!1119267))

(assert (= (and b!1119267 res!747649) b!1119265))

(assert (= (and b!1119265 res!747648) b!1119264))

(assert (= (and b!1119264 res!747652) b!1119266))

(assert (= (and b!1119266 res!747645) b!1119258))

(assert (= (and b!1119258 res!747647) b!1119270))

(assert (= (and b!1119270 res!747643) b!1119263))

(assert (= (and b!1119263 res!747651) b!1119269))

(assert (= (and b!1119269 res!747650) b!1119268))

(assert (= (and b!1119268 res!747644) b!1119259))

(assert (= (and b!1119259 (not res!747646)) b!1119260))

(assert (= (and b!1119257 condMapEmpty!43894) mapIsEmpty!43894))

(assert (= (and b!1119257 (not condMapEmpty!43894)) mapNonEmpty!43894))

(get-info :version)

(assert (= (and mapNonEmpty!43894 ((_ is ValueCellFull!13316) mapValue!43894)) b!1119261))

(assert (= (and b!1119257 ((_ is ValueCellFull!13316) mapDefault!43894)) b!1119262))

(assert (= start!97814 b!1119257))

(declare-fun b_lambda!18473 () Bool)

(assert (=> (not b_lambda!18473) (not b!1119260)))

(declare-fun t!35000 () Bool)

(declare-fun tb!8325 () Bool)

(assert (=> (and start!97814 (= defaultEntry!1004 defaultEntry!1004) t!35000) tb!8325))

(declare-fun result!17219 () Bool)

(assert (=> tb!8325 (= result!17219 tp_is_empty!28051)))

(assert (=> b!1119260 t!35000))

(declare-fun b_and!37805 () Bool)

(assert (= b_and!37803 (and (=> t!35000 result!17219) b_and!37805)))

(declare-fun m!1034055 () Bool)

(assert (=> b!1119270 m!1034055))

(declare-fun m!1034057 () Bool)

(assert (=> b!1119264 m!1034057))

(declare-fun m!1034059 () Bool)

(assert (=> b!1119268 m!1034059))

(declare-fun m!1034061 () Bool)

(assert (=> mapNonEmpty!43894 m!1034061))

(declare-fun m!1034063 () Bool)

(assert (=> b!1119259 m!1034063))

(declare-fun m!1034065 () Bool)

(assert (=> b!1119259 m!1034065))

(declare-fun m!1034067 () Bool)

(assert (=> b!1119260 m!1034067))

(declare-fun m!1034069 () Bool)

(assert (=> b!1119260 m!1034069))

(declare-fun m!1034071 () Bool)

(assert (=> b!1119260 m!1034071))

(declare-fun m!1034073 () Bool)

(assert (=> b!1119260 m!1034073))

(declare-fun m!1034075 () Bool)

(assert (=> b!1119267 m!1034075))

(declare-fun m!1034077 () Bool)

(assert (=> b!1119266 m!1034077))

(declare-fun m!1034079 () Bool)

(assert (=> b!1119269 m!1034079))

(declare-fun m!1034081 () Bool)

(assert (=> b!1119269 m!1034081))

(declare-fun m!1034083 () Bool)

(assert (=> b!1119263 m!1034083))

(declare-fun m!1034085 () Bool)

(assert (=> start!97814 m!1034085))

(declare-fun m!1034087 () Bool)

(assert (=> start!97814 m!1034087))

(check-sat (not b_next!23521) (not b!1119270) b_and!37805 (not b!1119268) (not start!97814) (not b!1119264) (not b!1119266) (not b!1119269) (not b!1119267) (not mapNonEmpty!43894) (not b!1119259) (not b!1119260) (not b_lambda!18473) tp_is_empty!28051)
(check-sat b_and!37805 (not b_next!23521))
