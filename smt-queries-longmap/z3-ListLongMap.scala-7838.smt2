; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97766 () Bool)

(assert start!97766)

(declare-fun b_free!23473 () Bool)

(declare-fun b_next!23473 () Bool)

(assert (=> start!97766 (= b_free!23473 (not b_next!23473))))

(declare-fun tp!83122 () Bool)

(declare-fun b_and!37725 () Bool)

(assert (=> start!97766 (= tp!83122 b_and!37725)))

(declare-fun b!1118219 () Bool)

(declare-fun res!746859 () Bool)

(declare-fun e!636923 () Bool)

(assert (=> b!1118219 (=> (not res!746859) (not e!636923))))

(declare-datatypes ((array!72800 0))(
  ( (array!72801 (arr!35053 (Array (_ BitVec 32) (_ BitVec 64))) (size!35591 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72800)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72800 (_ BitVec 32)) Bool)

(assert (=> b!1118219 (= res!746859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!746853 () Bool)

(assert (=> start!97766 (=> (not res!746853) (not e!636923))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97766 (= res!746853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35591 _keys!1208))))))

(assert (=> start!97766 e!636923))

(declare-fun tp_is_empty!28003 () Bool)

(assert (=> start!97766 tp_is_empty!28003))

(declare-fun array_inv!27000 (array!72800) Bool)

(assert (=> start!97766 (array_inv!27000 _keys!1208)))

(assert (=> start!97766 true))

(assert (=> start!97766 tp!83122))

(declare-datatypes ((V!42465 0))(
  ( (V!42466 (val!14058 Int)) )
))
(declare-datatypes ((ValueCell!13292 0))(
  ( (ValueCellFull!13292 (v!16690 V!42465)) (EmptyCell!13292) )
))
(declare-datatypes ((array!72802 0))(
  ( (array!72803 (arr!35054 (Array (_ BitVec 32) ValueCell!13292)) (size!35592 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72802)

(declare-fun e!636922 () Bool)

(declare-fun array_inv!27001 (array!72802) Bool)

(assert (=> start!97766 (and (array_inv!27001 _values!996) e!636922)))

(declare-fun b!1118220 () Bool)

(declare-fun e!636926 () Bool)

(assert (=> b!1118220 (= e!636926 tp_is_empty!28003)))

(declare-fun mapIsEmpty!43822 () Bool)

(declare-fun mapRes!43822 () Bool)

(assert (=> mapIsEmpty!43822 mapRes!43822))

(declare-fun b!1118221 () Bool)

(declare-fun res!746860 () Bool)

(assert (=> b!1118221 (=> (not res!746860) (not e!636923))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118221 (= res!746860 (= (select (arr!35053 _keys!1208) i!673) k0!934))))

(declare-fun b!1118222 () Bool)

(declare-fun e!636925 () Bool)

(assert (=> b!1118222 (= e!636923 e!636925)))

(declare-fun res!746850 () Bool)

(assert (=> b!1118222 (=> (not res!746850) (not e!636925))))

(declare-fun lt!497276 () array!72800)

(assert (=> b!1118222 (= res!746850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497276 mask!1564))))

(assert (=> b!1118222 (= lt!497276 (array!72801 (store (arr!35053 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35591 _keys!1208)))))

(declare-fun b!1118223 () Bool)

(declare-fun e!636927 () Bool)

(assert (=> b!1118223 (= e!636927 tp_is_empty!28003)))

(declare-fun b!1118224 () Bool)

(declare-fun res!746854 () Bool)

(assert (=> b!1118224 (=> (not res!746854) (not e!636923))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118224 (= res!746854 (and (= (size!35592 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35591 _keys!1208) (size!35592 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118225 () Bool)

(declare-fun res!746852 () Bool)

(assert (=> b!1118225 (=> (not res!746852) (not e!636925))))

(declare-datatypes ((List!24456 0))(
  ( (Nil!24453) (Cons!24452 (h!25661 (_ BitVec 64)) (t!34928 List!24456)) )
))
(declare-fun arrayNoDuplicates!0 (array!72800 (_ BitVec 32) List!24456) Bool)

(assert (=> b!1118225 (= res!746852 (arrayNoDuplicates!0 lt!497276 #b00000000000000000000000000000000 Nil!24453))))

(declare-fun b!1118226 () Bool)

(declare-fun res!746851 () Bool)

(assert (=> b!1118226 (=> (not res!746851) (not e!636923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118226 (= res!746851 (validMask!0 mask!1564))))

(declare-fun b!1118227 () Bool)

(declare-fun e!636924 () Bool)

(assert (=> b!1118227 (= e!636925 (not e!636924))))

(declare-fun res!746855 () Bool)

(assert (=> b!1118227 (=> res!746855 e!636924)))

(assert (=> b!1118227 (= res!746855 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118227 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36521 0))(
  ( (Unit!36522) )
))
(declare-fun lt!497277 () Unit!36521)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72800 (_ BitVec 64) (_ BitVec 32)) Unit!36521)

(assert (=> b!1118227 (= lt!497277 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118228 () Bool)

(declare-fun res!746857 () Bool)

(assert (=> b!1118228 (=> (not res!746857) (not e!636923))))

(assert (=> b!1118228 (= res!746857 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24453))))

(declare-fun b!1118229 () Bool)

(declare-fun res!746858 () Bool)

(assert (=> b!1118229 (=> (not res!746858) (not e!636923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118229 (= res!746858 (validKeyInArray!0 k0!934))))

(declare-fun b!1118230 () Bool)

(assert (=> b!1118230 (= e!636922 (and e!636926 mapRes!43822))))

(declare-fun condMapEmpty!43822 () Bool)

(declare-fun mapDefault!43822 () ValueCell!13292)

(assert (=> b!1118230 (= condMapEmpty!43822 (= (arr!35054 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13292)) mapDefault!43822)))))

(declare-fun b!1118231 () Bool)

(declare-fun res!746856 () Bool)

(assert (=> b!1118231 (=> (not res!746856) (not e!636923))))

(assert (=> b!1118231 (= res!746856 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35591 _keys!1208))))))

(declare-fun mapNonEmpty!43822 () Bool)

(declare-fun tp!83123 () Bool)

(assert (=> mapNonEmpty!43822 (= mapRes!43822 (and tp!83123 e!636927))))

(declare-fun mapValue!43822 () ValueCell!13292)

(declare-fun mapRest!43822 () (Array (_ BitVec 32) ValueCell!13292))

(declare-fun mapKey!43822 () (_ BitVec 32))

(assert (=> mapNonEmpty!43822 (= (arr!35054 _values!996) (store mapRest!43822 mapKey!43822 mapValue!43822))))

(declare-fun b!1118232 () Bool)

(assert (=> b!1118232 (= e!636924 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17692 0))(
  ( (tuple2!17693 (_1!8857 (_ BitVec 64)) (_2!8857 V!42465)) )
))
(declare-datatypes ((List!24457 0))(
  ( (Nil!24454) (Cons!24453 (h!25662 tuple2!17692) (t!34929 List!24457)) )
))
(declare-datatypes ((ListLongMap!15661 0))(
  ( (ListLongMap!15662 (toList!7846 List!24457)) )
))
(declare-fun lt!497275 () ListLongMap!15661)

(declare-fun minValue!944 () V!42465)

(declare-fun zeroValue!944 () V!42465)

(declare-fun getCurrentListMapNoExtraKeys!4355 (array!72800 array!72802 (_ BitVec 32) (_ BitVec 32) V!42465 V!42465 (_ BitVec 32) Int) ListLongMap!15661)

(assert (=> b!1118232 (= lt!497275 (getCurrentListMapNoExtraKeys!4355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!97766 res!746853) b!1118226))

(assert (= (and b!1118226 res!746851) b!1118224))

(assert (= (and b!1118224 res!746854) b!1118219))

(assert (= (and b!1118219 res!746859) b!1118228))

(assert (= (and b!1118228 res!746857) b!1118231))

(assert (= (and b!1118231 res!746856) b!1118229))

(assert (= (and b!1118229 res!746858) b!1118221))

(assert (= (and b!1118221 res!746860) b!1118222))

(assert (= (and b!1118222 res!746850) b!1118225))

(assert (= (and b!1118225 res!746852) b!1118227))

(assert (= (and b!1118227 (not res!746855)) b!1118232))

(assert (= (and b!1118230 condMapEmpty!43822) mapIsEmpty!43822))

(assert (= (and b!1118230 (not condMapEmpty!43822)) mapNonEmpty!43822))

(get-info :version)

(assert (= (and mapNonEmpty!43822 ((_ is ValueCellFull!13292) mapValue!43822)) b!1118223))

(assert (= (and b!1118230 ((_ is ValueCellFull!13292) mapDefault!43822)) b!1118220))

(assert (= start!97766 b!1118230))

(declare-fun m!1033293 () Bool)

(assert (=> b!1118222 m!1033293))

(declare-fun m!1033295 () Bool)

(assert (=> b!1118222 m!1033295))

(declare-fun m!1033297 () Bool)

(assert (=> b!1118232 m!1033297))

(declare-fun m!1033299 () Bool)

(assert (=> b!1118221 m!1033299))

(declare-fun m!1033301 () Bool)

(assert (=> b!1118228 m!1033301))

(declare-fun m!1033303 () Bool)

(assert (=> b!1118226 m!1033303))

(declare-fun m!1033305 () Bool)

(assert (=> mapNonEmpty!43822 m!1033305))

(declare-fun m!1033307 () Bool)

(assert (=> start!97766 m!1033307))

(declare-fun m!1033309 () Bool)

(assert (=> start!97766 m!1033309))

(declare-fun m!1033311 () Bool)

(assert (=> b!1118219 m!1033311))

(declare-fun m!1033313 () Bool)

(assert (=> b!1118225 m!1033313))

(declare-fun m!1033315 () Bool)

(assert (=> b!1118229 m!1033315))

(declare-fun m!1033317 () Bool)

(assert (=> b!1118227 m!1033317))

(declare-fun m!1033319 () Bool)

(assert (=> b!1118227 m!1033319))

(check-sat (not b!1118219) (not mapNonEmpty!43822) (not b!1118227) b_and!37725 (not b!1118226) (not b!1118225) (not b!1118228) (not start!97766) (not b!1118229) (not b!1118222) (not b!1118232) tp_is_empty!28003 (not b_next!23473))
(check-sat b_and!37725 (not b_next!23473))
