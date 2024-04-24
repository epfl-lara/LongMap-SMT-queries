; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97930 () Bool)

(assert start!97930)

(declare-fun b!1118098 () Bool)

(declare-fun e!637101 () Bool)

(declare-fun tp_is_empty!27925 () Bool)

(assert (=> b!1118098 (= e!637101 tp_is_empty!27925)))

(declare-fun b!1118099 () Bool)

(declare-fun res!746216 () Bool)

(declare-fun e!637104 () Bool)

(assert (=> b!1118099 (=> (not res!746216) (not e!637104))))

(declare-datatypes ((array!72787 0))(
  ( (array!72788 (arr!35040 (Array (_ BitVec 32) (_ BitVec 64))) (size!35577 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72787)

(declare-datatypes ((List!24396 0))(
  ( (Nil!24393) (Cons!24392 (h!25610 (_ BitVec 64)) (t!34869 List!24396)) )
))
(declare-fun arrayNoDuplicates!0 (array!72787 (_ BitVec 32) List!24396) Bool)

(assert (=> b!1118099 (= res!746216 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24393))))

(declare-fun b!1118100 () Bool)

(declare-fun res!746219 () Bool)

(assert (=> b!1118100 (=> (not res!746219) (not e!637104))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42361 0))(
  ( (V!42362 (val!14019 Int)) )
))
(declare-datatypes ((ValueCell!13253 0))(
  ( (ValueCellFull!13253 (v!16648 V!42361)) (EmptyCell!13253) )
))
(declare-datatypes ((array!72789 0))(
  ( (array!72790 (arr!35041 (Array (_ BitVec 32) ValueCell!13253)) (size!35578 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72789)

(assert (=> b!1118100 (= res!746219 (and (= (size!35578 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35577 _keys!1208) (size!35578 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!746217 () Bool)

(assert (=> start!97930 (=> (not res!746217) (not e!637104))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97930 (= res!746217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35577 _keys!1208))))))

(assert (=> start!97930 e!637104))

(declare-fun array_inv!26996 (array!72787) Bool)

(assert (=> start!97930 (array_inv!26996 _keys!1208)))

(assert (=> start!97930 true))

(declare-fun e!637102 () Bool)

(declare-fun array_inv!26997 (array!72789) Bool)

(assert (=> start!97930 (and (array_inv!26997 _values!996) e!637102)))

(declare-fun b!1118101 () Bool)

(declare-fun e!637103 () Bool)

(assert (=> b!1118101 (= e!637103 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36627 0))(
  ( (Unit!36628) )
))
(declare-fun lt!497700 () Unit!36627)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72787 (_ BitVec 64) (_ BitVec 32)) Unit!36627)

(assert (=> b!1118101 (= lt!497700 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118102 () Bool)

(declare-fun res!746222 () Bool)

(assert (=> b!1118102 (=> (not res!746222) (not e!637104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118102 (= res!746222 (validKeyInArray!0 k0!934))))

(declare-fun b!1118103 () Bool)

(declare-fun res!746220 () Bool)

(assert (=> b!1118103 (=> (not res!746220) (not e!637104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72787 (_ BitVec 32)) Bool)

(assert (=> b!1118103 (= res!746220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118104 () Bool)

(declare-fun res!746221 () Bool)

(assert (=> b!1118104 (=> (not res!746221) (not e!637104))))

(assert (=> b!1118104 (= res!746221 (= (select (arr!35040 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43705 () Bool)

(declare-fun mapRes!43705 () Bool)

(assert (=> mapIsEmpty!43705 mapRes!43705))

(declare-fun b!1118105 () Bool)

(declare-fun res!746224 () Bool)

(assert (=> b!1118105 (=> (not res!746224) (not e!637104))))

(assert (=> b!1118105 (= res!746224 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35577 _keys!1208))))))

(declare-fun b!1118106 () Bool)

(declare-fun e!637100 () Bool)

(assert (=> b!1118106 (= e!637102 (and e!637100 mapRes!43705))))

(declare-fun condMapEmpty!43705 () Bool)

(declare-fun mapDefault!43705 () ValueCell!13253)

(assert (=> b!1118106 (= condMapEmpty!43705 (= (arr!35041 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13253)) mapDefault!43705)))))

(declare-fun b!1118107 () Bool)

(assert (=> b!1118107 (= e!637100 tp_is_empty!27925)))

(declare-fun b!1118108 () Bool)

(declare-fun res!746215 () Bool)

(assert (=> b!1118108 (=> (not res!746215) (not e!637103))))

(declare-fun lt!497701 () array!72787)

(assert (=> b!1118108 (= res!746215 (arrayNoDuplicates!0 lt!497701 #b00000000000000000000000000000000 Nil!24393))))

(declare-fun mapNonEmpty!43705 () Bool)

(declare-fun tp!82949 () Bool)

(assert (=> mapNonEmpty!43705 (= mapRes!43705 (and tp!82949 e!637101))))

(declare-fun mapRest!43705 () (Array (_ BitVec 32) ValueCell!13253))

(declare-fun mapKey!43705 () (_ BitVec 32))

(declare-fun mapValue!43705 () ValueCell!13253)

(assert (=> mapNonEmpty!43705 (= (arr!35041 _values!996) (store mapRest!43705 mapKey!43705 mapValue!43705))))

(declare-fun b!1118109 () Bool)

(assert (=> b!1118109 (= e!637104 e!637103)))

(declare-fun res!746218 () Bool)

(assert (=> b!1118109 (=> (not res!746218) (not e!637103))))

(assert (=> b!1118109 (= res!746218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497701 mask!1564))))

(assert (=> b!1118109 (= lt!497701 (array!72788 (store (arr!35040 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35577 _keys!1208)))))

(declare-fun b!1118110 () Bool)

(declare-fun res!746223 () Bool)

(assert (=> b!1118110 (=> (not res!746223) (not e!637104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118110 (= res!746223 (validMask!0 mask!1564))))

(assert (= (and start!97930 res!746217) b!1118110))

(assert (= (and b!1118110 res!746223) b!1118100))

(assert (= (and b!1118100 res!746219) b!1118103))

(assert (= (and b!1118103 res!746220) b!1118099))

(assert (= (and b!1118099 res!746216) b!1118105))

(assert (= (and b!1118105 res!746224) b!1118102))

(assert (= (and b!1118102 res!746222) b!1118104))

(assert (= (and b!1118104 res!746221) b!1118109))

(assert (= (and b!1118109 res!746218) b!1118108))

(assert (= (and b!1118108 res!746215) b!1118101))

(assert (= (and b!1118106 condMapEmpty!43705) mapIsEmpty!43705))

(assert (= (and b!1118106 (not condMapEmpty!43705)) mapNonEmpty!43705))

(get-info :version)

(assert (= (and mapNonEmpty!43705 ((_ is ValueCellFull!13253) mapValue!43705)) b!1118098))

(assert (= (and b!1118106 ((_ is ValueCellFull!13253) mapDefault!43705)) b!1118107))

(assert (= start!97930 b!1118106))

(declare-fun m!1034541 () Bool)

(assert (=> b!1118099 m!1034541))

(declare-fun m!1034543 () Bool)

(assert (=> start!97930 m!1034543))

(declare-fun m!1034545 () Bool)

(assert (=> start!97930 m!1034545))

(declare-fun m!1034547 () Bool)

(assert (=> b!1118109 m!1034547))

(declare-fun m!1034549 () Bool)

(assert (=> b!1118109 m!1034549))

(declare-fun m!1034551 () Bool)

(assert (=> b!1118103 m!1034551))

(declare-fun m!1034553 () Bool)

(assert (=> mapNonEmpty!43705 m!1034553))

(declare-fun m!1034555 () Bool)

(assert (=> b!1118102 m!1034555))

(declare-fun m!1034557 () Bool)

(assert (=> b!1118108 m!1034557))

(declare-fun m!1034559 () Bool)

(assert (=> b!1118101 m!1034559))

(declare-fun m!1034561 () Bool)

(assert (=> b!1118101 m!1034561))

(declare-fun m!1034563 () Bool)

(assert (=> b!1118110 m!1034563))

(declare-fun m!1034565 () Bool)

(assert (=> b!1118104 m!1034565))

(check-sat (not b!1118099) (not b!1118109) (not mapNonEmpty!43705) (not b!1118110) tp_is_empty!27925 (not start!97930) (not b!1118102) (not b!1118101) (not b!1118103) (not b!1118108))
(check-sat)
