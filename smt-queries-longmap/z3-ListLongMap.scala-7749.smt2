; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97232 () Bool)

(assert start!97232)

(declare-fun b!1106502 () Bool)

(declare-fun res!738467 () Bool)

(declare-fun e!631383 () Bool)

(assert (=> b!1106502 (=> (not res!738467) (not e!631383))))

(declare-datatypes ((array!71764 0))(
  ( (array!71765 (arr!34535 (Array (_ BitVec 32) (_ BitVec 64))) (size!35073 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71764)

(declare-datatypes ((List!24133 0))(
  ( (Nil!24130) (Cons!24129 (h!25338 (_ BitVec 64)) (t!34389 List!24133)) )
))
(declare-fun arrayNoDuplicates!0 (array!71764 (_ BitVec 32) List!24133) Bool)

(assert (=> b!1106502 (= res!738467 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24130))))

(declare-fun b!1106503 () Bool)

(declare-fun res!738466 () Bool)

(assert (=> b!1106503 (=> (not res!738466) (not e!631383))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106503 (= res!738466 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35073 _keys!1208))))))

(declare-fun mapNonEmpty!43021 () Bool)

(declare-fun mapRes!43021 () Bool)

(declare-fun tp!81941 () Bool)

(declare-fun e!631384 () Bool)

(assert (=> mapNonEmpty!43021 (= mapRes!43021 (and tp!81941 e!631384))))

(declare-datatypes ((V!41753 0))(
  ( (V!41754 (val!13791 Int)) )
))
(declare-datatypes ((ValueCell!13025 0))(
  ( (ValueCellFull!13025 (v!16423 V!41753)) (EmptyCell!13025) )
))
(declare-fun mapRest!43021 () (Array (_ BitVec 32) ValueCell!13025))

(declare-fun mapValue!43021 () ValueCell!13025)

(declare-datatypes ((array!71766 0))(
  ( (array!71767 (arr!34536 (Array (_ BitVec 32) ValueCell!13025)) (size!35074 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71766)

(declare-fun mapKey!43021 () (_ BitVec 32))

(assert (=> mapNonEmpty!43021 (= (arr!34536 _values!996) (store mapRest!43021 mapKey!43021 mapValue!43021))))

(declare-fun mapIsEmpty!43021 () Bool)

(assert (=> mapIsEmpty!43021 mapRes!43021))

(declare-fun b!1106504 () Bool)

(declare-fun e!631386 () Bool)

(declare-fun e!631385 () Bool)

(assert (=> b!1106504 (= e!631386 (and e!631385 mapRes!43021))))

(declare-fun condMapEmpty!43021 () Bool)

(declare-fun mapDefault!43021 () ValueCell!13025)

(assert (=> b!1106504 (= condMapEmpty!43021 (= (arr!34536 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13025)) mapDefault!43021)))))

(declare-fun b!1106505 () Bool)

(declare-fun res!738464 () Bool)

(assert (=> b!1106505 (=> (not res!738464) (not e!631383))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106505 (= res!738464 (validKeyInArray!0 k0!934))))

(declare-fun b!1106506 () Bool)

(declare-fun res!738461 () Bool)

(assert (=> b!1106506 (=> (not res!738461) (not e!631383))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106506 (= res!738461 (and (= (size!35074 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35073 _keys!1208) (size!35074 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106507 () Bool)

(declare-fun res!738465 () Bool)

(declare-fun e!631381 () Bool)

(assert (=> b!1106507 (=> (not res!738465) (not e!631381))))

(declare-fun lt!495294 () array!71764)

(assert (=> b!1106507 (= res!738465 (arrayNoDuplicates!0 lt!495294 #b00000000000000000000000000000000 Nil!24130))))

(declare-fun b!1106508 () Bool)

(assert (=> b!1106508 (= e!631381 (not true))))

(declare-fun arrayContainsKey!0 (array!71764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106508 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36135 0))(
  ( (Unit!36136) )
))
(declare-fun lt!495293 () Unit!36135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71764 (_ BitVec 64) (_ BitVec 32)) Unit!36135)

(assert (=> b!1106508 (= lt!495293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!738460 () Bool)

(assert (=> start!97232 (=> (not res!738460) (not e!631383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97232 (= res!738460 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35073 _keys!1208))))))

(assert (=> start!97232 e!631383))

(declare-fun array_inv!26634 (array!71764) Bool)

(assert (=> start!97232 (array_inv!26634 _keys!1208)))

(assert (=> start!97232 true))

(declare-fun array_inv!26635 (array!71766) Bool)

(assert (=> start!97232 (and (array_inv!26635 _values!996) e!631386)))

(declare-fun b!1106509 () Bool)

(declare-fun res!738468 () Bool)

(assert (=> b!1106509 (=> (not res!738468) (not e!631383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71764 (_ BitVec 32)) Bool)

(assert (=> b!1106509 (= res!738468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106510 () Bool)

(declare-fun tp_is_empty!27469 () Bool)

(assert (=> b!1106510 (= e!631384 tp_is_empty!27469)))

(declare-fun b!1106511 () Bool)

(assert (=> b!1106511 (= e!631383 e!631381)))

(declare-fun res!738469 () Bool)

(assert (=> b!1106511 (=> (not res!738469) (not e!631381))))

(assert (=> b!1106511 (= res!738469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495294 mask!1564))))

(assert (=> b!1106511 (= lt!495294 (array!71765 (store (arr!34535 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35073 _keys!1208)))))

(declare-fun b!1106512 () Bool)

(declare-fun res!738463 () Bool)

(assert (=> b!1106512 (=> (not res!738463) (not e!631383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106512 (= res!738463 (validMask!0 mask!1564))))

(declare-fun b!1106513 () Bool)

(declare-fun res!738462 () Bool)

(assert (=> b!1106513 (=> (not res!738462) (not e!631383))))

(assert (=> b!1106513 (= res!738462 (= (select (arr!34535 _keys!1208) i!673) k0!934))))

(declare-fun b!1106514 () Bool)

(assert (=> b!1106514 (= e!631385 tp_is_empty!27469)))

(assert (= (and start!97232 res!738460) b!1106512))

(assert (= (and b!1106512 res!738463) b!1106506))

(assert (= (and b!1106506 res!738461) b!1106509))

(assert (= (and b!1106509 res!738468) b!1106502))

(assert (= (and b!1106502 res!738467) b!1106503))

(assert (= (and b!1106503 res!738466) b!1106505))

(assert (= (and b!1106505 res!738464) b!1106513))

(assert (= (and b!1106513 res!738462) b!1106511))

(assert (= (and b!1106511 res!738469) b!1106507))

(assert (= (and b!1106507 res!738465) b!1106508))

(assert (= (and b!1106504 condMapEmpty!43021) mapIsEmpty!43021))

(assert (= (and b!1106504 (not condMapEmpty!43021)) mapNonEmpty!43021))

(get-info :version)

(assert (= (and mapNonEmpty!43021 ((_ is ValueCellFull!13025) mapValue!43021)) b!1106510))

(assert (= (and b!1106504 ((_ is ValueCellFull!13025) mapDefault!43021)) b!1106514))

(assert (= start!97232 b!1106504))

(declare-fun m!1025019 () Bool)

(assert (=> mapNonEmpty!43021 m!1025019))

(declare-fun m!1025021 () Bool)

(assert (=> b!1106511 m!1025021))

(declare-fun m!1025023 () Bool)

(assert (=> b!1106511 m!1025023))

(declare-fun m!1025025 () Bool)

(assert (=> b!1106508 m!1025025))

(declare-fun m!1025027 () Bool)

(assert (=> b!1106508 m!1025027))

(declare-fun m!1025029 () Bool)

(assert (=> b!1106509 m!1025029))

(declare-fun m!1025031 () Bool)

(assert (=> b!1106502 m!1025031))

(declare-fun m!1025033 () Bool)

(assert (=> b!1106513 m!1025033))

(declare-fun m!1025035 () Bool)

(assert (=> start!97232 m!1025035))

(declare-fun m!1025037 () Bool)

(assert (=> start!97232 m!1025037))

(declare-fun m!1025039 () Bool)

(assert (=> b!1106507 m!1025039))

(declare-fun m!1025041 () Bool)

(assert (=> b!1106505 m!1025041))

(declare-fun m!1025043 () Bool)

(assert (=> b!1106512 m!1025043))

(check-sat tp_is_empty!27469 (not b!1106505) (not mapNonEmpty!43021) (not b!1106502) (not b!1106512) (not b!1106511) (not start!97232) (not b!1106507) (not b!1106509) (not b!1106508))
(check-sat)
