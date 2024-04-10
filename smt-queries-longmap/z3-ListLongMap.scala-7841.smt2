; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97792 () Bool)

(assert start!97792)

(declare-fun b_free!23493 () Bool)

(declare-fun b_next!23493 () Bool)

(assert (=> start!97792 (= b_free!23493 (not b_next!23493))))

(declare-fun tp!83182 () Bool)

(declare-fun b_and!37769 () Bool)

(assert (=> start!97792 (= tp!83182 b_and!37769)))

(declare-fun b!1118770 () Bool)

(declare-fun e!637216 () Bool)

(declare-fun e!637217 () Bool)

(assert (=> b!1118770 (= e!637216 e!637217)))

(declare-fun res!747249 () Bool)

(assert (=> b!1118770 (=> (not res!747249) (not e!637217))))

(declare-datatypes ((array!72935 0))(
  ( (array!72936 (arr!35120 (Array (_ BitVec 32) (_ BitVec 64))) (size!35656 (_ BitVec 32))) )
))
(declare-fun lt!497571 () array!72935)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72935 (_ BitVec 32)) Bool)

(assert (=> b!1118770 (= res!747249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497571 mask!1564))))

(declare-fun _keys!1208 () array!72935)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118770 (= lt!497571 (array!72936 (store (arr!35120 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35656 _keys!1208)))))

(declare-fun b!1118771 () Bool)

(declare-fun res!747259 () Bool)

(assert (=> b!1118771 (=> (not res!747259) (not e!637216))))

(declare-datatypes ((List!24434 0))(
  ( (Nil!24431) (Cons!24430 (h!25639 (_ BitVec 64)) (t!34919 List!24434)) )
))
(declare-fun arrayNoDuplicates!0 (array!72935 (_ BitVec 32) List!24434) Bool)

(assert (=> b!1118771 (= res!747259 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24431))))

(declare-fun b!1118772 () Bool)

(declare-fun res!747252 () Bool)

(assert (=> b!1118772 (=> (not res!747252) (not e!637216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118772 (= res!747252 (validMask!0 mask!1564))))

(declare-fun res!747258 () Bool)

(assert (=> start!97792 (=> (not res!747258) (not e!637216))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97792 (= res!747258 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35656 _keys!1208))))))

(assert (=> start!97792 e!637216))

(declare-fun tp_is_empty!28023 () Bool)

(assert (=> start!97792 tp_is_empty!28023))

(declare-fun array_inv!26986 (array!72935) Bool)

(assert (=> start!97792 (array_inv!26986 _keys!1208)))

(assert (=> start!97792 true))

(assert (=> start!97792 tp!83182))

(declare-datatypes ((V!42491 0))(
  ( (V!42492 (val!14068 Int)) )
))
(declare-datatypes ((ValueCell!13302 0))(
  ( (ValueCellFull!13302 (v!16701 V!42491)) (EmptyCell!13302) )
))
(declare-datatypes ((array!72937 0))(
  ( (array!72938 (arr!35121 (Array (_ BitVec 32) ValueCell!13302)) (size!35657 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72937)

(declare-fun e!637218 () Bool)

(declare-fun array_inv!26987 (array!72937) Bool)

(assert (=> start!97792 (and (array_inv!26987 _values!996) e!637218)))

(declare-fun b!1118773 () Bool)

(declare-fun e!637215 () Bool)

(assert (=> b!1118773 (= e!637217 (not e!637215))))

(declare-fun res!747256 () Bool)

(assert (=> b!1118773 (=> res!747256 e!637215)))

(assert (=> b!1118773 (= res!747256 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118773 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36718 0))(
  ( (Unit!36719) )
))
(declare-fun lt!497572 () Unit!36718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72935 (_ BitVec 64) (_ BitVec 32)) Unit!36718)

(assert (=> b!1118773 (= lt!497572 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118774 () Bool)

(declare-fun e!637212 () Bool)

(assert (=> b!1118774 (= e!637212 tp_is_empty!28023)))

(declare-fun b!1118775 () Bool)

(declare-fun e!637213 () Bool)

(assert (=> b!1118775 (= e!637213 tp_is_empty!28023)))

(declare-fun mapIsEmpty!43852 () Bool)

(declare-fun mapRes!43852 () Bool)

(assert (=> mapIsEmpty!43852 mapRes!43852))

(declare-fun b!1118776 () Bool)

(declare-fun res!747255 () Bool)

(assert (=> b!1118776 (=> (not res!747255) (not e!637216))))

(assert (=> b!1118776 (= res!747255 (= (select (arr!35120 _keys!1208) i!673) k0!934))))

(declare-fun b!1118777 () Bool)

(assert (=> b!1118777 (= e!637218 (and e!637212 mapRes!43852))))

(declare-fun condMapEmpty!43852 () Bool)

(declare-fun mapDefault!43852 () ValueCell!13302)

(assert (=> b!1118777 (= condMapEmpty!43852 (= (arr!35121 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13302)) mapDefault!43852)))))

(declare-fun b!1118778 () Bool)

(declare-fun res!747253 () Bool)

(assert (=> b!1118778 (=> (not res!747253) (not e!637216))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118778 (= res!747253 (and (= (size!35657 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35656 _keys!1208) (size!35657 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118779 () Bool)

(declare-fun res!747251 () Bool)

(assert (=> b!1118779 (=> (not res!747251) (not e!637216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118779 (= res!747251 (validKeyInArray!0 k0!934))))

(declare-fun b!1118780 () Bool)

(declare-fun res!747250 () Bool)

(assert (=> b!1118780 (=> (not res!747250) (not e!637216))))

(assert (=> b!1118780 (= res!747250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118781 () Bool)

(assert (=> b!1118781 (= e!637215 true)))

(declare-fun zeroValue!944 () V!42491)

(declare-datatypes ((tuple2!17648 0))(
  ( (tuple2!17649 (_1!8835 (_ BitVec 64)) (_2!8835 V!42491)) )
))
(declare-datatypes ((List!24435 0))(
  ( (Nil!24432) (Cons!24431 (h!25640 tuple2!17648) (t!34920 List!24435)) )
))
(declare-datatypes ((ListLongMap!15617 0))(
  ( (ListLongMap!15618 (toList!7824 List!24435)) )
))
(declare-fun lt!497570 () ListLongMap!15617)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42491)

(declare-fun getCurrentListMapNoExtraKeys!4314 (array!72935 array!72937 (_ BitVec 32) (_ BitVec 32) V!42491 V!42491 (_ BitVec 32) Int) ListLongMap!15617)

(declare-fun dynLambda!2418 (Int (_ BitVec 64)) V!42491)

(assert (=> b!1118781 (= lt!497570 (getCurrentListMapNoExtraKeys!4314 lt!497571 (array!72938 (store (arr!35121 _values!996) i!673 (ValueCellFull!13302 (dynLambda!2418 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35657 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497573 () ListLongMap!15617)

(assert (=> b!1118781 (= lt!497573 (getCurrentListMapNoExtraKeys!4314 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43852 () Bool)

(declare-fun tp!83183 () Bool)

(assert (=> mapNonEmpty!43852 (= mapRes!43852 (and tp!83183 e!637213))))

(declare-fun mapKey!43852 () (_ BitVec 32))

(declare-fun mapRest!43852 () (Array (_ BitVec 32) ValueCell!13302))

(declare-fun mapValue!43852 () ValueCell!13302)

(assert (=> mapNonEmpty!43852 (= (arr!35121 _values!996) (store mapRest!43852 mapKey!43852 mapValue!43852))))

(declare-fun b!1118782 () Bool)

(declare-fun res!747257 () Bool)

(assert (=> b!1118782 (=> (not res!747257) (not e!637217))))

(assert (=> b!1118782 (= res!747257 (arrayNoDuplicates!0 lt!497571 #b00000000000000000000000000000000 Nil!24431))))

(declare-fun b!1118783 () Bool)

(declare-fun res!747254 () Bool)

(assert (=> b!1118783 (=> (not res!747254) (not e!637216))))

(assert (=> b!1118783 (= res!747254 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35656 _keys!1208))))))

(assert (= (and start!97792 res!747258) b!1118772))

(assert (= (and b!1118772 res!747252) b!1118778))

(assert (= (and b!1118778 res!747253) b!1118780))

(assert (= (and b!1118780 res!747250) b!1118771))

(assert (= (and b!1118771 res!747259) b!1118783))

(assert (= (and b!1118783 res!747254) b!1118779))

(assert (= (and b!1118779 res!747251) b!1118776))

(assert (= (and b!1118776 res!747255) b!1118770))

(assert (= (and b!1118770 res!747249) b!1118782))

(assert (= (and b!1118782 res!747257) b!1118773))

(assert (= (and b!1118773 (not res!747256)) b!1118781))

(assert (= (and b!1118777 condMapEmpty!43852) mapIsEmpty!43852))

(assert (= (and b!1118777 (not condMapEmpty!43852)) mapNonEmpty!43852))

(get-info :version)

(assert (= (and mapNonEmpty!43852 ((_ is ValueCellFull!13302) mapValue!43852)) b!1118775))

(assert (= (and b!1118777 ((_ is ValueCellFull!13302) mapDefault!43852)) b!1118774))

(assert (= start!97792 b!1118777))

(declare-fun b_lambda!18463 () Bool)

(assert (=> (not b_lambda!18463) (not b!1118781)))

(declare-fun t!34918 () Bool)

(declare-fun tb!8305 () Bool)

(assert (=> (and start!97792 (= defaultEntry!1004 defaultEntry!1004) t!34918) tb!8305))

(declare-fun result!17171 () Bool)

(assert (=> tb!8305 (= result!17171 tp_is_empty!28023)))

(assert (=> b!1118781 t!34918))

(declare-fun b_and!37771 () Bool)

(assert (= b_and!37769 (and (=> t!34918 result!17171) b_and!37771)))

(declare-fun m!1034205 () Bool)

(assert (=> b!1118771 m!1034205))

(declare-fun m!1034207 () Bool)

(assert (=> mapNonEmpty!43852 m!1034207))

(declare-fun m!1034209 () Bool)

(assert (=> b!1118781 m!1034209))

(declare-fun m!1034211 () Bool)

(assert (=> b!1118781 m!1034211))

(declare-fun m!1034213 () Bool)

(assert (=> b!1118781 m!1034213))

(declare-fun m!1034215 () Bool)

(assert (=> b!1118781 m!1034215))

(declare-fun m!1034217 () Bool)

(assert (=> b!1118773 m!1034217))

(declare-fun m!1034219 () Bool)

(assert (=> b!1118773 m!1034219))

(declare-fun m!1034221 () Bool)

(assert (=> b!1118770 m!1034221))

(declare-fun m!1034223 () Bool)

(assert (=> b!1118770 m!1034223))

(declare-fun m!1034225 () Bool)

(assert (=> b!1118772 m!1034225))

(declare-fun m!1034227 () Bool)

(assert (=> b!1118782 m!1034227))

(declare-fun m!1034229 () Bool)

(assert (=> b!1118780 m!1034229))

(declare-fun m!1034231 () Bool)

(assert (=> start!97792 m!1034231))

(declare-fun m!1034233 () Bool)

(assert (=> start!97792 m!1034233))

(declare-fun m!1034235 () Bool)

(assert (=> b!1118776 m!1034235))

(declare-fun m!1034237 () Bool)

(assert (=> b!1118779 m!1034237))

(check-sat (not b_lambda!18463) b_and!37771 (not mapNonEmpty!43852) (not b!1118781) (not b!1118772) (not start!97792) (not b_next!23493) (not b!1118771) (not b!1118770) (not b!1118782) (not b!1118780) (not b!1118773) tp_is_empty!28023 (not b!1118779))
(check-sat b_and!37771 (not b_next!23493))
