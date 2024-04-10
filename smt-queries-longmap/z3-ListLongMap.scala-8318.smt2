; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101258 () Bool)

(assert start!101258)

(declare-fun b_free!26181 () Bool)

(declare-fun b_next!26181 () Bool)

(assert (=> start!101258 (= b_free!26181 (not b_next!26181))))

(declare-fun tp!91564 () Bool)

(declare-fun b_and!43479 () Bool)

(assert (=> start!101258 (= tp!91564 b_and!43479)))

(declare-fun b!1216256 () Bool)

(declare-fun res!807624 () Bool)

(declare-fun e!690534 () Bool)

(assert (=> b!1216256 (=> (not res!807624) (not e!690534))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78543 0))(
  ( (array!78544 (arr!37906 (Array (_ BitVec 32) (_ BitVec 64))) (size!38442 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78543)

(assert (=> b!1216256 (= res!807624 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38442 _keys!1208))))))

(declare-fun b!1216257 () Bool)

(declare-fun res!807621 () Bool)

(assert (=> b!1216257 (=> (not res!807621) (not e!690534))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216257 (= res!807621 (validKeyInArray!0 k0!934))))

(declare-fun b!1216258 () Bool)

(declare-fun res!807616 () Bool)

(declare-fun e!690535 () Bool)

(assert (=> b!1216258 (=> (not res!807616) (not e!690535))))

(declare-fun lt!552837 () array!78543)

(declare-datatypes ((List!26722 0))(
  ( (Nil!26719) (Cons!26718 (h!27927 (_ BitVec 64)) (t!39883 List!26722)) )
))
(declare-fun arrayNoDuplicates!0 (array!78543 (_ BitVec 32) List!26722) Bool)

(assert (=> b!1216258 (= res!807616 (arrayNoDuplicates!0 lt!552837 #b00000000000000000000000000000000 Nil!26719))))

(declare-fun mapNonEmpty!48202 () Bool)

(declare-fun mapRes!48202 () Bool)

(declare-fun tp!91565 () Bool)

(declare-fun e!690536 () Bool)

(assert (=> mapNonEmpty!48202 (= mapRes!48202 (and tp!91565 e!690536))))

(declare-datatypes ((V!46307 0))(
  ( (V!46308 (val!15499 Int)) )
))
(declare-datatypes ((ValueCell!14733 0))(
  ( (ValueCellFull!14733 (v!18152 V!46307)) (EmptyCell!14733) )
))
(declare-fun mapRest!48202 () (Array (_ BitVec 32) ValueCell!14733))

(declare-fun mapKey!48202 () (_ BitVec 32))

(declare-datatypes ((array!78545 0))(
  ( (array!78546 (arr!37907 (Array (_ BitVec 32) ValueCell!14733)) (size!38443 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78545)

(declare-fun mapValue!48202 () ValueCell!14733)

(assert (=> mapNonEmpty!48202 (= (arr!37907 _values!996) (store mapRest!48202 mapKey!48202 mapValue!48202))))

(declare-fun b!1216259 () Bool)

(declare-fun res!807625 () Bool)

(assert (=> b!1216259 (=> (not res!807625) (not e!690534))))

(assert (=> b!1216259 (= res!807625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26719))))

(declare-fun e!690532 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1216260 () Bool)

(assert (=> b!1216260 (= e!690532 (or (= from!1455 i!673) (bvsge from!1455 i!673) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38442 _keys!1208)) (bvslt (bvsub (size!38442 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38442 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46307)

(declare-datatypes ((tuple2!19916 0))(
  ( (tuple2!19917 (_1!9969 (_ BitVec 64)) (_2!9969 V!46307)) )
))
(declare-datatypes ((List!26723 0))(
  ( (Nil!26720) (Cons!26719 (h!27928 tuple2!19916) (t!39884 List!26723)) )
))
(declare-datatypes ((ListLongMap!17885 0))(
  ( (ListLongMap!17886 (toList!8958 List!26723)) )
))
(declare-fun lt!552840 () ListLongMap!17885)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46307)

(declare-fun getCurrentListMapNoExtraKeys!5385 (array!78543 array!78545 (_ BitVec 32) (_ BitVec 32) V!46307 V!46307 (_ BitVec 32) Int) ListLongMap!17885)

(declare-fun dynLambda!3274 (Int (_ BitVec 64)) V!46307)

(assert (=> b!1216260 (= lt!552840 (getCurrentListMapNoExtraKeys!5385 lt!552837 (array!78546 (store (arr!37907 _values!996) i!673 (ValueCellFull!14733 (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38443 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552839 () ListLongMap!17885)

(assert (=> b!1216260 (= lt!552839 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48202 () Bool)

(assert (=> mapIsEmpty!48202 mapRes!48202))

(declare-fun b!1216262 () Bool)

(assert (=> b!1216262 (= e!690534 e!690535)))

(declare-fun res!807620 () Bool)

(assert (=> b!1216262 (=> (not res!807620) (not e!690535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78543 (_ BitVec 32)) Bool)

(assert (=> b!1216262 (= res!807620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552837 mask!1564))))

(assert (=> b!1216262 (= lt!552837 (array!78544 (store (arr!37906 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38442 _keys!1208)))))

(declare-fun b!1216263 () Bool)

(declare-fun res!807626 () Bool)

(assert (=> b!1216263 (=> (not res!807626) (not e!690534))))

(assert (=> b!1216263 (= res!807626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216264 () Bool)

(declare-fun res!807618 () Bool)

(assert (=> b!1216264 (=> (not res!807618) (not e!690534))))

(assert (=> b!1216264 (= res!807618 (= (select (arr!37906 _keys!1208) i!673) k0!934))))

(declare-fun b!1216265 () Bool)

(declare-fun tp_is_empty!30885 () Bool)

(assert (=> b!1216265 (= e!690536 tp_is_empty!30885)))

(declare-fun b!1216266 () Bool)

(declare-fun res!807622 () Bool)

(assert (=> b!1216266 (=> (not res!807622) (not e!690534))))

(assert (=> b!1216266 (= res!807622 (and (= (size!38443 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38442 _keys!1208) (size!38443 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216267 () Bool)

(declare-fun e!690537 () Bool)

(assert (=> b!1216267 (= e!690537 tp_is_empty!30885)))

(declare-fun res!807623 () Bool)

(assert (=> start!101258 (=> (not res!807623) (not e!690534))))

(assert (=> start!101258 (= res!807623 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38442 _keys!1208))))))

(assert (=> start!101258 e!690534))

(assert (=> start!101258 tp_is_empty!30885))

(declare-fun array_inv!28860 (array!78543) Bool)

(assert (=> start!101258 (array_inv!28860 _keys!1208)))

(assert (=> start!101258 true))

(assert (=> start!101258 tp!91564))

(declare-fun e!690538 () Bool)

(declare-fun array_inv!28861 (array!78545) Bool)

(assert (=> start!101258 (and (array_inv!28861 _values!996) e!690538)))

(declare-fun b!1216261 () Bool)

(assert (=> b!1216261 (= e!690535 (not e!690532))))

(declare-fun res!807619 () Bool)

(assert (=> b!1216261 (=> res!807619 e!690532)))

(assert (=> b!1216261 (= res!807619 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216261 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40324 0))(
  ( (Unit!40325) )
))
(declare-fun lt!552838 () Unit!40324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78543 (_ BitVec 64) (_ BitVec 32)) Unit!40324)

(assert (=> b!1216261 (= lt!552838 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216268 () Bool)

(assert (=> b!1216268 (= e!690538 (and e!690537 mapRes!48202))))

(declare-fun condMapEmpty!48202 () Bool)

(declare-fun mapDefault!48202 () ValueCell!14733)

(assert (=> b!1216268 (= condMapEmpty!48202 (= (arr!37907 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14733)) mapDefault!48202)))))

(declare-fun b!1216269 () Bool)

(declare-fun res!807617 () Bool)

(assert (=> b!1216269 (=> (not res!807617) (not e!690534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216269 (= res!807617 (validMask!0 mask!1564))))

(assert (= (and start!101258 res!807623) b!1216269))

(assert (= (and b!1216269 res!807617) b!1216266))

(assert (= (and b!1216266 res!807622) b!1216263))

(assert (= (and b!1216263 res!807626) b!1216259))

(assert (= (and b!1216259 res!807625) b!1216256))

(assert (= (and b!1216256 res!807624) b!1216257))

(assert (= (and b!1216257 res!807621) b!1216264))

(assert (= (and b!1216264 res!807618) b!1216262))

(assert (= (and b!1216262 res!807620) b!1216258))

(assert (= (and b!1216258 res!807616) b!1216261))

(assert (= (and b!1216261 (not res!807619)) b!1216260))

(assert (= (and b!1216268 condMapEmpty!48202) mapIsEmpty!48202))

(assert (= (and b!1216268 (not condMapEmpty!48202)) mapNonEmpty!48202))

(get-info :version)

(assert (= (and mapNonEmpty!48202 ((_ is ValueCellFull!14733) mapValue!48202)) b!1216265))

(assert (= (and b!1216268 ((_ is ValueCellFull!14733) mapDefault!48202)) b!1216267))

(assert (= start!101258 b!1216268))

(declare-fun b_lambda!21857 () Bool)

(assert (=> (not b_lambda!21857) (not b!1216260)))

(declare-fun t!39882 () Bool)

(declare-fun tb!10981 () Bool)

(assert (=> (and start!101258 (= defaultEntry!1004 defaultEntry!1004) t!39882) tb!10981))

(declare-fun result!22559 () Bool)

(assert (=> tb!10981 (= result!22559 tp_is_empty!30885)))

(assert (=> b!1216260 t!39882))

(declare-fun b_and!43481 () Bool)

(assert (= b_and!43479 (and (=> t!39882 result!22559) b_and!43481)))

(declare-fun m!1121041 () Bool)

(assert (=> start!101258 m!1121041))

(declare-fun m!1121043 () Bool)

(assert (=> start!101258 m!1121043))

(declare-fun m!1121045 () Bool)

(assert (=> b!1216262 m!1121045))

(declare-fun m!1121047 () Bool)

(assert (=> b!1216262 m!1121047))

(declare-fun m!1121049 () Bool)

(assert (=> b!1216259 m!1121049))

(declare-fun m!1121051 () Bool)

(assert (=> b!1216269 m!1121051))

(declare-fun m!1121053 () Bool)

(assert (=> b!1216260 m!1121053))

(declare-fun m!1121055 () Bool)

(assert (=> b!1216260 m!1121055))

(declare-fun m!1121057 () Bool)

(assert (=> b!1216260 m!1121057))

(declare-fun m!1121059 () Bool)

(assert (=> b!1216260 m!1121059))

(declare-fun m!1121061 () Bool)

(assert (=> b!1216258 m!1121061))

(declare-fun m!1121063 () Bool)

(assert (=> b!1216264 m!1121063))

(declare-fun m!1121065 () Bool)

(assert (=> b!1216257 m!1121065))

(declare-fun m!1121067 () Bool)

(assert (=> b!1216261 m!1121067))

(declare-fun m!1121069 () Bool)

(assert (=> b!1216261 m!1121069))

(declare-fun m!1121071 () Bool)

(assert (=> mapNonEmpty!48202 m!1121071))

(declare-fun m!1121073 () Bool)

(assert (=> b!1216263 m!1121073))

(check-sat (not b!1216260) (not b!1216262) tp_is_empty!30885 (not b_next!26181) b_and!43481 (not b!1216263) (not start!101258) (not b!1216259) (not mapNonEmpty!48202) (not b!1216269) (not b!1216258) (not b_lambda!21857) (not b!1216261) (not b!1216257))
(check-sat b_and!43481 (not b_next!26181))
