; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97256 () Bool)

(assert start!97256)

(declare-fun b_free!23233 () Bool)

(declare-fun b_next!23233 () Bool)

(assert (=> start!97256 (= b_free!23233 (not b_next!23233))))

(declare-fun tp!81997 () Bool)

(declare-fun b_and!37271 () Bool)

(assert (=> start!97256 (= tp!81997 b_and!37271)))

(declare-fun b!1107042 () Bool)

(declare-fun e!631642 () Bool)

(declare-fun e!631644 () Bool)

(assert (=> b!1107042 (= e!631642 e!631644)))

(declare-fun res!738847 () Bool)

(assert (=> b!1107042 (=> (not res!738847) (not e!631644))))

(declare-datatypes ((array!71808 0))(
  ( (array!71809 (arr!34557 (Array (_ BitVec 32) (_ BitVec 64))) (size!35095 (_ BitVec 32))) )
))
(declare-fun lt!495386 () array!71808)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71808 (_ BitVec 32)) Bool)

(assert (=> b!1107042 (= res!738847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495386 mask!1564))))

(declare-fun _keys!1208 () array!71808)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107042 (= lt!495386 (array!71809 (store (arr!34557 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35095 _keys!1208)))))

(declare-fun mapNonEmpty!43057 () Bool)

(declare-fun mapRes!43057 () Bool)

(declare-fun tp!81998 () Bool)

(declare-fun e!631639 () Bool)

(assert (=> mapNonEmpty!43057 (= mapRes!43057 (and tp!81998 e!631639))))

(declare-datatypes ((V!41785 0))(
  ( (V!41786 (val!13803 Int)) )
))
(declare-datatypes ((ValueCell!13037 0))(
  ( (ValueCellFull!13037 (v!16435 V!41785)) (EmptyCell!13037) )
))
(declare-fun mapValue!43057 () ValueCell!13037)

(declare-fun mapRest!43057 () (Array (_ BitVec 32) ValueCell!13037))

(declare-datatypes ((array!71810 0))(
  ( (array!71811 (arr!34558 (Array (_ BitVec 32) ValueCell!13037)) (size!35096 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71810)

(declare-fun mapKey!43057 () (_ BitVec 32))

(assert (=> mapNonEmpty!43057 (= (arr!34558 _values!996) (store mapRest!43057 mapKey!43057 mapValue!43057))))

(declare-fun b!1107043 () Bool)

(declare-fun res!738848 () Bool)

(assert (=> b!1107043 (=> (not res!738848) (not e!631642))))

(declare-datatypes ((List!24147 0))(
  ( (Nil!24144) (Cons!24143 (h!25352 (_ BitVec 64)) (t!34417 List!24147)) )
))
(declare-fun arrayNoDuplicates!0 (array!71808 (_ BitVec 32) List!24147) Bool)

(assert (=> b!1107043 (= res!738848 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24144))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46369 () Bool)

(declare-fun minValue!944 () V!41785)

(declare-datatypes ((tuple2!17486 0))(
  ( (tuple2!17487 (_1!8754 (_ BitVec 64)) (_2!8754 V!41785)) )
))
(declare-datatypes ((List!24148 0))(
  ( (Nil!24145) (Cons!24144 (h!25353 tuple2!17486) (t!34418 List!24148)) )
))
(declare-datatypes ((ListLongMap!15455 0))(
  ( (ListLongMap!15456 (toList!7743 List!24148)) )
))
(declare-fun call!46373 () ListLongMap!15455)

(declare-fun zeroValue!944 () V!41785)

(declare-fun getCurrentListMapNoExtraKeys!4262 (array!71808 array!71810 (_ BitVec 32) (_ BitVec 32) V!41785 V!41785 (_ BitVec 32) Int) ListLongMap!15455)

(declare-fun dynLambda!2331 (Int (_ BitVec 64)) V!41785)

(assert (=> bm!46369 (= call!46373 (getCurrentListMapNoExtraKeys!4262 lt!495386 (array!71811 (store (arr!34558 _values!996) i!673 (ValueCellFull!13037 (dynLambda!2331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35096 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107044 () Bool)

(declare-fun res!738844 () Bool)

(assert (=> b!1107044 (=> (not res!738844) (not e!631644))))

(assert (=> b!1107044 (= res!738844 (arrayNoDuplicates!0 lt!495386 #b00000000000000000000000000000000 Nil!24144))))

(declare-fun b!1107045 () Bool)

(declare-fun e!631637 () Bool)

(assert (=> b!1107045 (= e!631637 true)))

(declare-fun e!631641 () Bool)

(assert (=> b!1107045 e!631641))

(declare-fun c!108990 () Bool)

(assert (=> b!1107045 (= c!108990 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36151 0))(
  ( (Unit!36152) )
))
(declare-fun lt!495385 () Unit!36151)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!243 (array!71808 array!71810 (_ BitVec 32) (_ BitVec 32) V!41785 V!41785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36151)

(assert (=> b!1107045 (= lt!495385 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107046 () Bool)

(declare-fun e!631643 () Bool)

(declare-fun e!631640 () Bool)

(assert (=> b!1107046 (= e!631643 (and e!631640 mapRes!43057))))

(declare-fun condMapEmpty!43057 () Bool)

(declare-fun mapDefault!43057 () ValueCell!13037)

(assert (=> b!1107046 (= condMapEmpty!43057 (= (arr!34558 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13037)) mapDefault!43057)))))

(declare-fun b!1107047 () Bool)

(declare-fun res!738840 () Bool)

(assert (=> b!1107047 (=> (not res!738840) (not e!631642))))

(assert (=> b!1107047 (= res!738840 (and (= (size!35096 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35095 _keys!1208) (size!35096 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107048 () Bool)

(assert (=> b!1107048 (= e!631644 (not e!631637))))

(declare-fun res!738843 () Bool)

(assert (=> b!1107048 (=> res!738843 e!631637)))

(assert (=> b!1107048 (= res!738843 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35095 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107048 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495387 () Unit!36151)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71808 (_ BitVec 64) (_ BitVec 32)) Unit!36151)

(assert (=> b!1107048 (= lt!495387 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!738849 () Bool)

(assert (=> start!97256 (=> (not res!738849) (not e!631642))))

(assert (=> start!97256 (= res!738849 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35095 _keys!1208))))))

(assert (=> start!97256 e!631642))

(declare-fun tp_is_empty!27493 () Bool)

(assert (=> start!97256 tp_is_empty!27493))

(declare-fun array_inv!26648 (array!71808) Bool)

(assert (=> start!97256 (array_inv!26648 _keys!1208)))

(assert (=> start!97256 true))

(assert (=> start!97256 tp!81997))

(declare-fun array_inv!26649 (array!71810) Bool)

(assert (=> start!97256 (and (array_inv!26649 _values!996) e!631643)))

(declare-fun b!1107049 () Bool)

(assert (=> b!1107049 (= e!631640 tp_is_empty!27493)))

(declare-fun b!1107050 () Bool)

(declare-fun res!738842 () Bool)

(assert (=> b!1107050 (=> (not res!738842) (not e!631642))))

(assert (=> b!1107050 (= res!738842 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35095 _keys!1208))))))

(declare-fun mapIsEmpty!43057 () Bool)

(assert (=> mapIsEmpty!43057 mapRes!43057))

(declare-fun bm!46370 () Bool)

(declare-fun call!46372 () ListLongMap!15455)

(assert (=> bm!46370 (= call!46372 (getCurrentListMapNoExtraKeys!4262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107051 () Bool)

(assert (=> b!1107051 (= e!631641 (= call!46373 call!46372))))

(declare-fun b!1107052 () Bool)

(declare-fun res!738846 () Bool)

(assert (=> b!1107052 (=> (not res!738846) (not e!631642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107052 (= res!738846 (validMask!0 mask!1564))))

(declare-fun b!1107053 () Bool)

(declare-fun res!738845 () Bool)

(assert (=> b!1107053 (=> (not res!738845) (not e!631642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107053 (= res!738845 (validKeyInArray!0 k0!934))))

(declare-fun b!1107054 () Bool)

(assert (=> b!1107054 (= e!631639 tp_is_empty!27493)))

(declare-fun b!1107055 () Bool)

(declare-fun res!738841 () Bool)

(assert (=> b!1107055 (=> (not res!738841) (not e!631642))))

(assert (=> b!1107055 (= res!738841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107056 () Bool)

(declare-fun -!970 (ListLongMap!15455 (_ BitVec 64)) ListLongMap!15455)

(assert (=> b!1107056 (= e!631641 (= call!46373 (-!970 call!46372 k0!934)))))

(declare-fun b!1107057 () Bool)

(declare-fun res!738850 () Bool)

(assert (=> b!1107057 (=> (not res!738850) (not e!631642))))

(assert (=> b!1107057 (= res!738850 (= (select (arr!34557 _keys!1208) i!673) k0!934))))

(assert (= (and start!97256 res!738849) b!1107052))

(assert (= (and b!1107052 res!738846) b!1107047))

(assert (= (and b!1107047 res!738840) b!1107055))

(assert (= (and b!1107055 res!738841) b!1107043))

(assert (= (and b!1107043 res!738848) b!1107050))

(assert (= (and b!1107050 res!738842) b!1107053))

(assert (= (and b!1107053 res!738845) b!1107057))

(assert (= (and b!1107057 res!738850) b!1107042))

(assert (= (and b!1107042 res!738847) b!1107044))

(assert (= (and b!1107044 res!738844) b!1107048))

(assert (= (and b!1107048 (not res!738843)) b!1107045))

(assert (= (and b!1107045 c!108990) b!1107056))

(assert (= (and b!1107045 (not c!108990)) b!1107051))

(assert (= (or b!1107056 b!1107051) bm!46369))

(assert (= (or b!1107056 b!1107051) bm!46370))

(assert (= (and b!1107046 condMapEmpty!43057) mapIsEmpty!43057))

(assert (= (and b!1107046 (not condMapEmpty!43057)) mapNonEmpty!43057))

(get-info :version)

(assert (= (and mapNonEmpty!43057 ((_ is ValueCellFull!13037) mapValue!43057)) b!1107054))

(assert (= (and b!1107046 ((_ is ValueCellFull!13037) mapDefault!43057)) b!1107049))

(assert (= start!97256 b!1107046))

(declare-fun b_lambda!18229 () Bool)

(assert (=> (not b_lambda!18229) (not bm!46369)))

(declare-fun t!34416 () Bool)

(declare-fun tb!8091 () Bool)

(assert (=> (and start!97256 (= defaultEntry!1004 defaultEntry!1004) t!34416) tb!8091))

(declare-fun result!16751 () Bool)

(assert (=> tb!8091 (= result!16751 tp_is_empty!27493)))

(assert (=> bm!46369 t!34416))

(declare-fun b_and!37273 () Bool)

(assert (= b_and!37271 (and (=> t!34416 result!16751) b_and!37273)))

(declare-fun m!1025403 () Bool)

(assert (=> b!1107055 m!1025403))

(declare-fun m!1025405 () Bool)

(assert (=> mapNonEmpty!43057 m!1025405))

(declare-fun m!1025407 () Bool)

(assert (=> bm!46370 m!1025407))

(declare-fun m!1025409 () Bool)

(assert (=> b!1107043 m!1025409))

(declare-fun m!1025411 () Bool)

(assert (=> b!1107052 m!1025411))

(declare-fun m!1025413 () Bool)

(assert (=> b!1107042 m!1025413))

(declare-fun m!1025415 () Bool)

(assert (=> b!1107042 m!1025415))

(declare-fun m!1025417 () Bool)

(assert (=> b!1107056 m!1025417))

(declare-fun m!1025419 () Bool)

(assert (=> b!1107044 m!1025419))

(declare-fun m!1025421 () Bool)

(assert (=> b!1107053 m!1025421))

(declare-fun m!1025423 () Bool)

(assert (=> b!1107045 m!1025423))

(declare-fun m!1025425 () Bool)

(assert (=> b!1107057 m!1025425))

(declare-fun m!1025427 () Bool)

(assert (=> b!1107048 m!1025427))

(declare-fun m!1025429 () Bool)

(assert (=> b!1107048 m!1025429))

(declare-fun m!1025431 () Bool)

(assert (=> bm!46369 m!1025431))

(declare-fun m!1025433 () Bool)

(assert (=> bm!46369 m!1025433))

(declare-fun m!1025435 () Bool)

(assert (=> bm!46369 m!1025435))

(declare-fun m!1025437 () Bool)

(assert (=> start!97256 m!1025437))

(declare-fun m!1025439 () Bool)

(assert (=> start!97256 m!1025439))

(check-sat (not b!1107055) (not bm!46370) (not b!1107048) (not b!1107053) (not bm!46369) (not b!1107052) (not start!97256) (not b_lambda!18229) tp_is_empty!27493 (not b_next!23233) (not b!1107043) (not b!1107056) (not b!1107045) (not b!1107044) b_and!37273 (not b!1107042) (not mapNonEmpty!43057))
(check-sat b_and!37273 (not b_next!23233))
