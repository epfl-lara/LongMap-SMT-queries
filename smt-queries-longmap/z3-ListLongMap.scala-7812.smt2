; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97610 () Bool)

(assert start!97610)

(declare-fun b!1115121 () Bool)

(declare-fun res!744463 () Bool)

(declare-fun e!635461 () Bool)

(assert (=> b!1115121 (=> (not res!744463) (not e!635461))))

(declare-datatypes ((array!72496 0))(
  ( (array!72497 (arr!34901 (Array (_ BitVec 32) (_ BitVec 64))) (size!35439 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72496)

(declare-datatypes ((List!24378 0))(
  ( (Nil!24375) (Cons!24374 (h!25583 (_ BitVec 64)) (t!34850 List!24378)) )
))
(declare-fun arrayNoDuplicates!0 (array!72496 (_ BitVec 32) List!24378) Bool)

(assert (=> b!1115121 (= res!744463 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24375))))

(declare-fun mapNonEmpty!43588 () Bool)

(declare-fun mapRes!43588 () Bool)

(declare-fun tp!82832 () Bool)

(declare-fun e!635463 () Bool)

(assert (=> mapNonEmpty!43588 (= mapRes!43588 (and tp!82832 e!635463))))

(declare-fun mapKey!43588 () (_ BitVec 32))

(declare-datatypes ((V!42257 0))(
  ( (V!42258 (val!13980 Int)) )
))
(declare-datatypes ((ValueCell!13214 0))(
  ( (ValueCellFull!13214 (v!16612 V!42257)) (EmptyCell!13214) )
))
(declare-fun mapRest!43588 () (Array (_ BitVec 32) ValueCell!13214))

(declare-datatypes ((array!72498 0))(
  ( (array!72499 (arr!34902 (Array (_ BitVec 32) ValueCell!13214)) (size!35440 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72498)

(declare-fun mapValue!43588 () ValueCell!13214)

(assert (=> mapNonEmpty!43588 (= (arr!34902 _values!996) (store mapRest!43588 mapKey!43588 mapValue!43588))))

(declare-fun b!1115123 () Bool)

(declare-fun res!744459 () Bool)

(assert (=> b!1115123 (=> (not res!744459) (not e!635461))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115123 (= res!744459 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35439 _keys!1208))))))

(declare-fun b!1115124 () Bool)

(declare-fun e!635464 () Bool)

(assert (=> b!1115124 (= e!635461 e!635464)))

(declare-fun res!744458 () Bool)

(assert (=> b!1115124 (=> (not res!744458) (not e!635464))))

(declare-fun lt!496751 () array!72496)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72496 (_ BitVec 32)) Bool)

(assert (=> b!1115124 (= res!744458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496751 mask!1564))))

(assert (=> b!1115124 (= lt!496751 (array!72497 (store (arr!34901 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35439 _keys!1208)))))

(declare-fun b!1115125 () Bool)

(declare-fun res!744454 () Bool)

(assert (=> b!1115125 (=> (not res!744454) (not e!635461))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115125 (= res!744454 (validKeyInArray!0 k0!934))))

(declare-fun b!1115126 () Bool)

(declare-fun res!744460 () Bool)

(assert (=> b!1115126 (=> (not res!744460) (not e!635464))))

(assert (=> b!1115126 (= res!744460 (arrayNoDuplicates!0 lt!496751 #b00000000000000000000000000000000 Nil!24375))))

(declare-fun b!1115127 () Bool)

(assert (=> b!1115127 (= e!635464 (not true))))

(declare-fun arrayContainsKey!0 (array!72496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115127 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36421 0))(
  ( (Unit!36422) )
))
(declare-fun lt!496752 () Unit!36421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72496 (_ BitVec 64) (_ BitVec 32)) Unit!36421)

(assert (=> b!1115127 (= lt!496752 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115128 () Bool)

(declare-fun tp_is_empty!27847 () Bool)

(assert (=> b!1115128 (= e!635463 tp_is_empty!27847)))

(declare-fun b!1115129 () Bool)

(declare-fun res!744462 () Bool)

(assert (=> b!1115129 (=> (not res!744462) (not e!635461))))

(assert (=> b!1115129 (= res!744462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115130 () Bool)

(declare-fun e!635466 () Bool)

(declare-fun e!635465 () Bool)

(assert (=> b!1115130 (= e!635466 (and e!635465 mapRes!43588))))

(declare-fun condMapEmpty!43588 () Bool)

(declare-fun mapDefault!43588 () ValueCell!13214)

(assert (=> b!1115130 (= condMapEmpty!43588 (= (arr!34902 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13214)) mapDefault!43588)))))

(declare-fun b!1115131 () Bool)

(assert (=> b!1115131 (= e!635465 tp_is_empty!27847)))

(declare-fun b!1115132 () Bool)

(declare-fun res!744461 () Bool)

(assert (=> b!1115132 (=> (not res!744461) (not e!635461))))

(assert (=> b!1115132 (= res!744461 (= (select (arr!34901 _keys!1208) i!673) k0!934))))

(declare-fun b!1115133 () Bool)

(declare-fun res!744455 () Bool)

(assert (=> b!1115133 (=> (not res!744455) (not e!635461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115133 (= res!744455 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43588 () Bool)

(assert (=> mapIsEmpty!43588 mapRes!43588))

(declare-fun res!744456 () Bool)

(assert (=> start!97610 (=> (not res!744456) (not e!635461))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97610 (= res!744456 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35439 _keys!1208))))))

(assert (=> start!97610 e!635461))

(declare-fun array_inv!26898 (array!72496) Bool)

(assert (=> start!97610 (array_inv!26898 _keys!1208)))

(assert (=> start!97610 true))

(declare-fun array_inv!26899 (array!72498) Bool)

(assert (=> start!97610 (and (array_inv!26899 _values!996) e!635466)))

(declare-fun b!1115122 () Bool)

(declare-fun res!744457 () Bool)

(assert (=> b!1115122 (=> (not res!744457) (not e!635461))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115122 (= res!744457 (and (= (size!35440 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35439 _keys!1208) (size!35440 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97610 res!744456) b!1115133))

(assert (= (and b!1115133 res!744455) b!1115122))

(assert (= (and b!1115122 res!744457) b!1115129))

(assert (= (and b!1115129 res!744462) b!1115121))

(assert (= (and b!1115121 res!744463) b!1115123))

(assert (= (and b!1115123 res!744459) b!1115125))

(assert (= (and b!1115125 res!744454) b!1115132))

(assert (= (and b!1115132 res!744461) b!1115124))

(assert (= (and b!1115124 res!744458) b!1115126))

(assert (= (and b!1115126 res!744460) b!1115127))

(assert (= (and b!1115130 condMapEmpty!43588) mapIsEmpty!43588))

(assert (= (and b!1115130 (not condMapEmpty!43588)) mapNonEmpty!43588))

(get-info :version)

(assert (= (and mapNonEmpty!43588 ((_ is ValueCellFull!13214) mapValue!43588)) b!1115128))

(assert (= (and b!1115130 ((_ is ValueCellFull!13214) mapDefault!43588)) b!1115131))

(assert (= start!97610 b!1115130))

(declare-fun m!1031229 () Bool)

(assert (=> start!97610 m!1031229))

(declare-fun m!1031231 () Bool)

(assert (=> start!97610 m!1031231))

(declare-fun m!1031233 () Bool)

(assert (=> b!1115125 m!1031233))

(declare-fun m!1031235 () Bool)

(assert (=> b!1115132 m!1031235))

(declare-fun m!1031237 () Bool)

(assert (=> b!1115126 m!1031237))

(declare-fun m!1031239 () Bool)

(assert (=> b!1115133 m!1031239))

(declare-fun m!1031241 () Bool)

(assert (=> b!1115124 m!1031241))

(declare-fun m!1031243 () Bool)

(assert (=> b!1115124 m!1031243))

(declare-fun m!1031245 () Bool)

(assert (=> mapNonEmpty!43588 m!1031245))

(declare-fun m!1031247 () Bool)

(assert (=> b!1115121 m!1031247))

(declare-fun m!1031249 () Bool)

(assert (=> b!1115127 m!1031249))

(declare-fun m!1031251 () Bool)

(assert (=> b!1115127 m!1031251))

(declare-fun m!1031253 () Bool)

(assert (=> b!1115129 m!1031253))

(check-sat (not b!1115127) (not mapNonEmpty!43588) (not b!1115126) (not b!1115133) (not b!1115129) (not b!1115125) tp_is_empty!27847 (not b!1115124) (not b!1115121) (not start!97610))
(check-sat)
