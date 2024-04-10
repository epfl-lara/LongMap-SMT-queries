; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97798 () Bool)

(assert start!97798)

(declare-fun b_free!23499 () Bool)

(declare-fun b_next!23499 () Bool)

(assert (=> start!97798 (= b_free!23499 (not b_next!23499))))

(declare-fun tp!83200 () Bool)

(declare-fun b_and!37781 () Bool)

(assert (=> start!97798 (= tp!83200 b_and!37781)))

(declare-fun b!1118902 () Bool)

(declare-fun e!637275 () Bool)

(declare-fun e!637279 () Bool)

(declare-fun mapRes!43861 () Bool)

(assert (=> b!1118902 (= e!637275 (and e!637279 mapRes!43861))))

(declare-fun condMapEmpty!43861 () Bool)

(declare-datatypes ((V!42499 0))(
  ( (V!42500 (val!14071 Int)) )
))
(declare-datatypes ((ValueCell!13305 0))(
  ( (ValueCellFull!13305 (v!16704 V!42499)) (EmptyCell!13305) )
))
(declare-datatypes ((array!72947 0))(
  ( (array!72948 (arr!35126 (Array (_ BitVec 32) ValueCell!13305)) (size!35662 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72947)

(declare-fun mapDefault!43861 () ValueCell!13305)

(assert (=> b!1118902 (= condMapEmpty!43861 (= (arr!35126 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13305)) mapDefault!43861)))))

(declare-fun b!1118903 () Bool)

(declare-fun res!747348 () Bool)

(declare-fun e!637280 () Bool)

(assert (=> b!1118903 (=> (not res!747348) (not e!637280))))

(declare-datatypes ((array!72949 0))(
  ( (array!72950 (arr!35127 (Array (_ BitVec 32) (_ BitVec 64))) (size!35663 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72949)

(declare-datatypes ((List!24440 0))(
  ( (Nil!24437) (Cons!24436 (h!25645 (_ BitVec 64)) (t!34931 List!24440)) )
))
(declare-fun arrayNoDuplicates!0 (array!72949 (_ BitVec 32) List!24440) Bool)

(assert (=> b!1118903 (= res!747348 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24437))))

(declare-fun b!1118904 () Bool)

(declare-fun res!747357 () Bool)

(assert (=> b!1118904 (=> (not res!747357) (not e!637280))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118904 (= res!747357 (= (select (arr!35127 _keys!1208) i!673) k0!934))))

(declare-fun b!1118905 () Bool)

(declare-fun res!747358 () Bool)

(assert (=> b!1118905 (=> (not res!747358) (not e!637280))))

(assert (=> b!1118905 (= res!747358 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35663 _keys!1208))))))

(declare-fun b!1118906 () Bool)

(declare-fun e!637281 () Bool)

(assert (=> b!1118906 (= e!637280 e!637281)))

(declare-fun res!747351 () Bool)

(assert (=> b!1118906 (=> (not res!747351) (not e!637281))))

(declare-fun lt!497608 () array!72949)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72949 (_ BitVec 32)) Bool)

(assert (=> b!1118906 (= res!747351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497608 mask!1564))))

(assert (=> b!1118906 (= lt!497608 (array!72950 (store (arr!35127 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35663 _keys!1208)))))

(declare-fun b!1118907 () Bool)

(declare-fun res!747356 () Bool)

(assert (=> b!1118907 (=> (not res!747356) (not e!637280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118907 (= res!747356 (validMask!0 mask!1564))))

(declare-fun b!1118908 () Bool)

(declare-fun res!747349 () Bool)

(assert (=> b!1118908 (=> (not res!747349) (not e!637280))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118908 (= res!747349 (and (= (size!35662 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35663 _keys!1208) (size!35662 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43861 () Bool)

(declare-fun tp!83201 () Bool)

(declare-fun e!637276 () Bool)

(assert (=> mapNonEmpty!43861 (= mapRes!43861 (and tp!83201 e!637276))))

(declare-fun mapRest!43861 () (Array (_ BitVec 32) ValueCell!13305))

(declare-fun mapValue!43861 () ValueCell!13305)

(declare-fun mapKey!43861 () (_ BitVec 32))

(assert (=> mapNonEmpty!43861 (= (arr!35126 _values!996) (store mapRest!43861 mapKey!43861 mapValue!43861))))

(declare-fun b!1118909 () Bool)

(declare-fun e!637278 () Bool)

(assert (=> b!1118909 (= e!637281 (not e!637278))))

(declare-fun res!747352 () Bool)

(assert (=> b!1118909 (=> res!747352 e!637278)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1118909 (= res!747352 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118909 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36724 0))(
  ( (Unit!36725) )
))
(declare-fun lt!497607 () Unit!36724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72949 (_ BitVec 64) (_ BitVec 32)) Unit!36724)

(assert (=> b!1118909 (= lt!497607 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118910 () Bool)

(assert (=> b!1118910 (= e!637278 true)))

(declare-fun zeroValue!944 () V!42499)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17654 0))(
  ( (tuple2!17655 (_1!8838 (_ BitVec 64)) (_2!8838 V!42499)) )
))
(declare-datatypes ((List!24441 0))(
  ( (Nil!24438) (Cons!24437 (h!25646 tuple2!17654) (t!34932 List!24441)) )
))
(declare-datatypes ((ListLongMap!15623 0))(
  ( (ListLongMap!15624 (toList!7827 List!24441)) )
))
(declare-fun lt!497606 () ListLongMap!15623)

(declare-fun minValue!944 () V!42499)

(declare-fun getCurrentListMapNoExtraKeys!4317 (array!72949 array!72947 (_ BitVec 32) (_ BitVec 32) V!42499 V!42499 (_ BitVec 32) Int) ListLongMap!15623)

(declare-fun dynLambda!2421 (Int (_ BitVec 64)) V!42499)

(assert (=> b!1118910 (= lt!497606 (getCurrentListMapNoExtraKeys!4317 lt!497608 (array!72948 (store (arr!35126 _values!996) i!673 (ValueCellFull!13305 (dynLambda!2421 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35662 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497609 () ListLongMap!15623)

(assert (=> b!1118910 (= lt!497609 (getCurrentListMapNoExtraKeys!4317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118911 () Bool)

(declare-fun tp_is_empty!28029 () Bool)

(assert (=> b!1118911 (= e!637279 tp_is_empty!28029)))

(declare-fun b!1118912 () Bool)

(declare-fun res!747354 () Bool)

(assert (=> b!1118912 (=> (not res!747354) (not e!637280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118912 (= res!747354 (validKeyInArray!0 k0!934))))

(declare-fun b!1118914 () Bool)

(assert (=> b!1118914 (= e!637276 tp_is_empty!28029)))

(declare-fun b!1118915 () Bool)

(declare-fun res!747350 () Bool)

(assert (=> b!1118915 (=> (not res!747350) (not e!637280))))

(assert (=> b!1118915 (= res!747350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43861 () Bool)

(assert (=> mapIsEmpty!43861 mapRes!43861))

(declare-fun b!1118913 () Bool)

(declare-fun res!747353 () Bool)

(assert (=> b!1118913 (=> (not res!747353) (not e!637281))))

(assert (=> b!1118913 (= res!747353 (arrayNoDuplicates!0 lt!497608 #b00000000000000000000000000000000 Nil!24437))))

(declare-fun res!747355 () Bool)

(assert (=> start!97798 (=> (not res!747355) (not e!637280))))

(assert (=> start!97798 (= res!747355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35663 _keys!1208))))))

(assert (=> start!97798 e!637280))

(assert (=> start!97798 tp_is_empty!28029))

(declare-fun array_inv!26992 (array!72949) Bool)

(assert (=> start!97798 (array_inv!26992 _keys!1208)))

(assert (=> start!97798 true))

(assert (=> start!97798 tp!83200))

(declare-fun array_inv!26993 (array!72947) Bool)

(assert (=> start!97798 (and (array_inv!26993 _values!996) e!637275)))

(assert (= (and start!97798 res!747355) b!1118907))

(assert (= (and b!1118907 res!747356) b!1118908))

(assert (= (and b!1118908 res!747349) b!1118915))

(assert (= (and b!1118915 res!747350) b!1118903))

(assert (= (and b!1118903 res!747348) b!1118905))

(assert (= (and b!1118905 res!747358) b!1118912))

(assert (= (and b!1118912 res!747354) b!1118904))

(assert (= (and b!1118904 res!747357) b!1118906))

(assert (= (and b!1118906 res!747351) b!1118913))

(assert (= (and b!1118913 res!747353) b!1118909))

(assert (= (and b!1118909 (not res!747352)) b!1118910))

(assert (= (and b!1118902 condMapEmpty!43861) mapIsEmpty!43861))

(assert (= (and b!1118902 (not condMapEmpty!43861)) mapNonEmpty!43861))

(get-info :version)

(assert (= (and mapNonEmpty!43861 ((_ is ValueCellFull!13305) mapValue!43861)) b!1118914))

(assert (= (and b!1118902 ((_ is ValueCellFull!13305) mapDefault!43861)) b!1118911))

(assert (= start!97798 b!1118902))

(declare-fun b_lambda!18469 () Bool)

(assert (=> (not b_lambda!18469) (not b!1118910)))

(declare-fun t!34930 () Bool)

(declare-fun tb!8311 () Bool)

(assert (=> (and start!97798 (= defaultEntry!1004 defaultEntry!1004) t!34930) tb!8311))

(declare-fun result!17183 () Bool)

(assert (=> tb!8311 (= result!17183 tp_is_empty!28029)))

(assert (=> b!1118910 t!34930))

(declare-fun b_and!37783 () Bool)

(assert (= b_and!37781 (and (=> t!34930 result!17183) b_and!37783)))

(declare-fun m!1034307 () Bool)

(assert (=> mapNonEmpty!43861 m!1034307))

(declare-fun m!1034309 () Bool)

(assert (=> b!1118904 m!1034309))

(declare-fun m!1034311 () Bool)

(assert (=> b!1118906 m!1034311))

(declare-fun m!1034313 () Bool)

(assert (=> b!1118906 m!1034313))

(declare-fun m!1034315 () Bool)

(assert (=> b!1118907 m!1034315))

(declare-fun m!1034317 () Bool)

(assert (=> b!1118909 m!1034317))

(declare-fun m!1034319 () Bool)

(assert (=> b!1118909 m!1034319))

(declare-fun m!1034321 () Bool)

(assert (=> b!1118903 m!1034321))

(declare-fun m!1034323 () Bool)

(assert (=> start!97798 m!1034323))

(declare-fun m!1034325 () Bool)

(assert (=> start!97798 m!1034325))

(declare-fun m!1034327 () Bool)

(assert (=> b!1118915 m!1034327))

(declare-fun m!1034329 () Bool)

(assert (=> b!1118912 m!1034329))

(declare-fun m!1034331 () Bool)

(assert (=> b!1118910 m!1034331))

(declare-fun m!1034333 () Bool)

(assert (=> b!1118910 m!1034333))

(declare-fun m!1034335 () Bool)

(assert (=> b!1118910 m!1034335))

(declare-fun m!1034337 () Bool)

(assert (=> b!1118910 m!1034337))

(declare-fun m!1034339 () Bool)

(assert (=> b!1118913 m!1034339))

(check-sat (not b!1118907) (not b!1118915) (not b!1118909) (not b!1118906) (not b_next!23499) (not b!1118903) (not mapNonEmpty!43861) b_and!37783 (not start!97798) (not b!1118912) (not b_lambda!18469) (not b!1118913) (not b!1118910) tp_is_empty!28029)
(check-sat b_and!37783 (not b_next!23499))
