; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97514 () Bool)

(assert start!97514)

(declare-fun b!1113249 () Bool)

(declare-fun e!634600 () Bool)

(declare-fun tp_is_empty!27751 () Bool)

(assert (=> b!1113249 (= e!634600 tp_is_empty!27751)))

(declare-fun b!1113250 () Bool)

(declare-fun res!743021 () Bool)

(declare-fun e!634601 () Bool)

(assert (=> b!1113250 (=> (not res!743021) (not e!634601))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113250 (= res!743021 (validMask!0 mask!1564))))

(declare-fun b!1113251 () Bool)

(declare-fun res!743023 () Bool)

(assert (=> b!1113251 (=> (not res!743023) (not e!634601))))

(declare-datatypes ((array!72308 0))(
  ( (array!72309 (arr!34807 (Array (_ BitVec 32) (_ BitVec 64))) (size!35345 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72308)

(declare-datatypes ((List!24340 0))(
  ( (Nil!24337) (Cons!24336 (h!25545 (_ BitVec 64)) (t!34812 List!24340)) )
))
(declare-fun arrayNoDuplicates!0 (array!72308 (_ BitVec 32) List!24340) Bool)

(assert (=> b!1113251 (= res!743023 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24337))))

(declare-fun b!1113252 () Bool)

(declare-fun res!743015 () Bool)

(declare-fun e!634597 () Bool)

(assert (=> b!1113252 (=> (not res!743015) (not e!634597))))

(declare-fun lt!496463 () array!72308)

(assert (=> b!1113252 (= res!743015 (arrayNoDuplicates!0 lt!496463 #b00000000000000000000000000000000 Nil!24337))))

(declare-fun b!1113253 () Bool)

(declare-fun e!634599 () Bool)

(assert (=> b!1113253 (= e!634599 tp_is_empty!27751)))

(declare-fun b!1113254 () Bool)

(declare-fun res!743017 () Bool)

(assert (=> b!1113254 (=> (not res!743017) (not e!634601))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113254 (= res!743017 (= (select (arr!34807 _keys!1208) i!673) k0!934))))

(declare-fun b!1113255 () Bool)

(declare-fun res!743014 () Bool)

(assert (=> b!1113255 (=> (not res!743014) (not e!634601))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42129 0))(
  ( (V!42130 (val!13932 Int)) )
))
(declare-datatypes ((ValueCell!13166 0))(
  ( (ValueCellFull!13166 (v!16564 V!42129)) (EmptyCell!13166) )
))
(declare-datatypes ((array!72310 0))(
  ( (array!72311 (arr!34808 (Array (_ BitVec 32) ValueCell!13166)) (size!35346 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72310)

(assert (=> b!1113255 (= res!743014 (and (= (size!35346 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35345 _keys!1208) (size!35346 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113256 () Bool)

(assert (=> b!1113256 (= e!634601 e!634597)))

(declare-fun res!743022 () Bool)

(assert (=> b!1113256 (=> (not res!743022) (not e!634597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72308 (_ BitVec 32)) Bool)

(assert (=> b!1113256 (= res!743022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496463 mask!1564))))

(assert (=> b!1113256 (= lt!496463 (array!72309 (store (arr!34807 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35345 _keys!1208)))))

(declare-fun mapNonEmpty!43444 () Bool)

(declare-fun mapRes!43444 () Bool)

(declare-fun tp!82688 () Bool)

(assert (=> mapNonEmpty!43444 (= mapRes!43444 (and tp!82688 e!634599))))

(declare-fun mapRest!43444 () (Array (_ BitVec 32) ValueCell!13166))

(declare-fun mapKey!43444 () (_ BitVec 32))

(declare-fun mapValue!43444 () ValueCell!13166)

(assert (=> mapNonEmpty!43444 (= (arr!34808 _values!996) (store mapRest!43444 mapKey!43444 mapValue!43444))))

(declare-fun b!1113257 () Bool)

(declare-fun res!743020 () Bool)

(assert (=> b!1113257 (=> (not res!743020) (not e!634601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113257 (= res!743020 (validKeyInArray!0 k0!934))))

(declare-fun b!1113258 () Bool)

(assert (=> b!1113258 (= e!634597 (not true))))

(declare-fun arrayContainsKey!0 (array!72308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113258 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36357 0))(
  ( (Unit!36358) )
))
(declare-fun lt!496464 () Unit!36357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72308 (_ BitVec 64) (_ BitVec 32)) Unit!36357)

(assert (=> b!1113258 (= lt!496464 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113259 () Bool)

(declare-fun res!743016 () Bool)

(assert (=> b!1113259 (=> (not res!743016) (not e!634601))))

(assert (=> b!1113259 (= res!743016 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35345 _keys!1208))))))

(declare-fun b!1113260 () Bool)

(declare-fun e!634602 () Bool)

(assert (=> b!1113260 (= e!634602 (and e!634600 mapRes!43444))))

(declare-fun condMapEmpty!43444 () Bool)

(declare-fun mapDefault!43444 () ValueCell!13166)

(assert (=> b!1113260 (= condMapEmpty!43444 (= (arr!34808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13166)) mapDefault!43444)))))

(declare-fun b!1113261 () Bool)

(declare-fun res!743018 () Bool)

(assert (=> b!1113261 (=> (not res!743018) (not e!634601))))

(assert (=> b!1113261 (= res!743018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43444 () Bool)

(assert (=> mapIsEmpty!43444 mapRes!43444))

(declare-fun res!743019 () Bool)

(assert (=> start!97514 (=> (not res!743019) (not e!634601))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97514 (= res!743019 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35345 _keys!1208))))))

(assert (=> start!97514 e!634601))

(declare-fun array_inv!26836 (array!72308) Bool)

(assert (=> start!97514 (array_inv!26836 _keys!1208)))

(assert (=> start!97514 true))

(declare-fun array_inv!26837 (array!72310) Bool)

(assert (=> start!97514 (and (array_inv!26837 _values!996) e!634602)))

(assert (= (and start!97514 res!743019) b!1113250))

(assert (= (and b!1113250 res!743021) b!1113255))

(assert (= (and b!1113255 res!743014) b!1113261))

(assert (= (and b!1113261 res!743018) b!1113251))

(assert (= (and b!1113251 res!743023) b!1113259))

(assert (= (and b!1113259 res!743016) b!1113257))

(assert (= (and b!1113257 res!743020) b!1113254))

(assert (= (and b!1113254 res!743017) b!1113256))

(assert (= (and b!1113256 res!743022) b!1113252))

(assert (= (and b!1113252 res!743015) b!1113258))

(assert (= (and b!1113260 condMapEmpty!43444) mapIsEmpty!43444))

(assert (= (and b!1113260 (not condMapEmpty!43444)) mapNonEmpty!43444))

(get-info :version)

(assert (= (and mapNonEmpty!43444 ((_ is ValueCellFull!13166) mapValue!43444)) b!1113253))

(assert (= (and b!1113260 ((_ is ValueCellFull!13166) mapDefault!43444)) b!1113249))

(assert (= start!97514 b!1113260))

(declare-fun m!1029981 () Bool)

(assert (=> b!1113261 m!1029981))

(declare-fun m!1029983 () Bool)

(assert (=> b!1113251 m!1029983))

(declare-fun m!1029985 () Bool)

(assert (=> start!97514 m!1029985))

(declare-fun m!1029987 () Bool)

(assert (=> start!97514 m!1029987))

(declare-fun m!1029989 () Bool)

(assert (=> b!1113258 m!1029989))

(declare-fun m!1029991 () Bool)

(assert (=> b!1113258 m!1029991))

(declare-fun m!1029993 () Bool)

(assert (=> b!1113252 m!1029993))

(declare-fun m!1029995 () Bool)

(assert (=> b!1113257 m!1029995))

(declare-fun m!1029997 () Bool)

(assert (=> mapNonEmpty!43444 m!1029997))

(declare-fun m!1029999 () Bool)

(assert (=> b!1113250 m!1029999))

(declare-fun m!1030001 () Bool)

(assert (=> b!1113254 m!1030001))

(declare-fun m!1030003 () Bool)

(assert (=> b!1113256 m!1030003))

(declare-fun m!1030005 () Bool)

(assert (=> b!1113256 m!1030005))

(check-sat tp_is_empty!27751 (not mapNonEmpty!43444) (not b!1113258) (not b!1113257) (not start!97514) (not b!1113261) (not b!1113250) (not b!1113251) (not b!1113256) (not b!1113252))
(check-sat)
