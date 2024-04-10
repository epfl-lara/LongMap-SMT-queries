; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97732 () Bool)

(assert start!97732)

(declare-fun b!1117512 () Bool)

(declare-fun res!746265 () Bool)

(declare-fun e!636591 () Bool)

(assert (=> b!1117512 (=> (not res!746265) (not e!636591))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117512 (= res!746265 (validKeyInArray!0 k0!934))))

(declare-fun b!1117513 () Bool)

(declare-fun res!746266 () Bool)

(assert (=> b!1117513 (=> (not res!746266) (not e!636591))))

(declare-datatypes ((array!72817 0))(
  ( (array!72818 (arr!35061 (Array (_ BitVec 32) (_ BitVec 64))) (size!35597 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72817)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117513 (= res!746266 (= (select (arr!35061 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43762 () Bool)

(declare-fun mapRes!43762 () Bool)

(declare-fun tp!83006 () Bool)

(declare-fun e!636590 () Bool)

(assert (=> mapNonEmpty!43762 (= mapRes!43762 (and tp!83006 e!636590))))

(declare-fun mapKey!43762 () (_ BitVec 32))

(declare-datatypes ((V!42411 0))(
  ( (V!42412 (val!14038 Int)) )
))
(declare-datatypes ((ValueCell!13272 0))(
  ( (ValueCellFull!13272 (v!16671 V!42411)) (EmptyCell!13272) )
))
(declare-fun mapValue!43762 () ValueCell!13272)

(declare-datatypes ((array!72819 0))(
  ( (array!72820 (arr!35062 (Array (_ BitVec 32) ValueCell!13272)) (size!35598 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72819)

(declare-fun mapRest!43762 () (Array (_ BitVec 32) ValueCell!13272))

(assert (=> mapNonEmpty!43762 (= (arr!35062 _values!996) (store mapRest!43762 mapKey!43762 mapValue!43762))))

(declare-fun b!1117514 () Bool)

(declare-fun e!636587 () Bool)

(declare-fun e!636586 () Bool)

(assert (=> b!1117514 (= e!636587 (and e!636586 mapRes!43762))))

(declare-fun condMapEmpty!43762 () Bool)

(declare-fun mapDefault!43762 () ValueCell!13272)

(assert (=> b!1117514 (= condMapEmpty!43762 (= (arr!35062 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13272)) mapDefault!43762)))))

(declare-fun b!1117515 () Bool)

(declare-fun e!636589 () Bool)

(assert (=> b!1117515 (= e!636591 e!636589)))

(declare-fun res!746268 () Bool)

(assert (=> b!1117515 (=> (not res!746268) (not e!636589))))

(declare-fun lt!497299 () array!72817)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72817 (_ BitVec 32)) Bool)

(assert (=> b!1117515 (= res!746268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497299 mask!1564))))

(assert (=> b!1117515 (= lt!497299 (array!72818 (store (arr!35061 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35597 _keys!1208)))))

(declare-fun mapIsEmpty!43762 () Bool)

(assert (=> mapIsEmpty!43762 mapRes!43762))

(declare-fun b!1117516 () Bool)

(declare-fun tp_is_empty!27963 () Bool)

(assert (=> b!1117516 (= e!636590 tp_is_empty!27963)))

(declare-fun b!1117517 () Bool)

(declare-fun res!746269 () Bool)

(assert (=> b!1117517 (=> (not res!746269) (not e!636591))))

(declare-datatypes ((List!24388 0))(
  ( (Nil!24385) (Cons!24384 (h!25593 (_ BitVec 64)) (t!34869 List!24388)) )
))
(declare-fun arrayNoDuplicates!0 (array!72817 (_ BitVec 32) List!24388) Bool)

(assert (=> b!1117517 (= res!746269 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24385))))

(declare-fun b!1117518 () Bool)

(declare-fun res!746264 () Bool)

(assert (=> b!1117518 (=> (not res!746264) (not e!636591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117518 (= res!746264 (validMask!0 mask!1564))))

(declare-fun b!1117520 () Bool)

(assert (=> b!1117520 (= e!636586 tp_is_empty!27963)))

(declare-fun b!1117521 () Bool)

(declare-fun res!746272 () Bool)

(assert (=> b!1117521 (=> (not res!746272) (not e!636591))))

(assert (=> b!1117521 (= res!746272 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35597 _keys!1208))))))

(declare-fun b!1117522 () Bool)

(declare-fun res!746271 () Bool)

(assert (=> b!1117522 (=> (not res!746271) (not e!636589))))

(assert (=> b!1117522 (= res!746271 (arrayNoDuplicates!0 lt!497299 #b00000000000000000000000000000000 Nil!24385))))

(declare-fun b!1117523 () Bool)

(declare-fun res!746267 () Bool)

(assert (=> b!1117523 (=> (not res!746267) (not e!636591))))

(assert (=> b!1117523 (= res!746267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117524 () Bool)

(declare-fun res!746270 () Bool)

(assert (=> b!1117524 (=> (not res!746270) (not e!636591))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117524 (= res!746270 (and (= (size!35598 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35597 _keys!1208) (size!35598 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117519 () Bool)

(assert (=> b!1117519 (= e!636589 (not true))))

(declare-fun arrayContainsKey!0 (array!72817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117519 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36674 0))(
  ( (Unit!36675) )
))
(declare-fun lt!497300 () Unit!36674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72817 (_ BitVec 64) (_ BitVec 32)) Unit!36674)

(assert (=> b!1117519 (= lt!497300 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!746263 () Bool)

(assert (=> start!97732 (=> (not res!746263) (not e!636591))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97732 (= res!746263 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35597 _keys!1208))))))

(assert (=> start!97732 e!636591))

(declare-fun array_inv!26942 (array!72817) Bool)

(assert (=> start!97732 (array_inv!26942 _keys!1208)))

(assert (=> start!97732 true))

(declare-fun array_inv!26943 (array!72819) Bool)

(assert (=> start!97732 (and (array_inv!26943 _values!996) e!636587)))

(assert (= (and start!97732 res!746263) b!1117518))

(assert (= (and b!1117518 res!746264) b!1117524))

(assert (= (and b!1117524 res!746270) b!1117523))

(assert (= (and b!1117523 res!746267) b!1117517))

(assert (= (and b!1117517 res!746269) b!1117521))

(assert (= (and b!1117521 res!746272) b!1117512))

(assert (= (and b!1117512 res!746265) b!1117513))

(assert (= (and b!1117513 res!746266) b!1117515))

(assert (= (and b!1117515 res!746268) b!1117522))

(assert (= (and b!1117522 res!746271) b!1117519))

(assert (= (and b!1117514 condMapEmpty!43762) mapIsEmpty!43762))

(assert (= (and b!1117514 (not condMapEmpty!43762)) mapNonEmpty!43762))

(get-info :version)

(assert (= (and mapNonEmpty!43762 ((_ is ValueCellFull!13272) mapValue!43762)) b!1117516))

(assert (= (and b!1117514 ((_ is ValueCellFull!13272) mapDefault!43762)) b!1117520))

(assert (= start!97732 b!1117514))

(declare-fun m!1033363 () Bool)

(assert (=> b!1117518 m!1033363))

(declare-fun m!1033365 () Bool)

(assert (=> b!1117513 m!1033365))

(declare-fun m!1033367 () Bool)

(assert (=> b!1117519 m!1033367))

(declare-fun m!1033369 () Bool)

(assert (=> b!1117519 m!1033369))

(declare-fun m!1033371 () Bool)

(assert (=> b!1117515 m!1033371))

(declare-fun m!1033373 () Bool)

(assert (=> b!1117515 m!1033373))

(declare-fun m!1033375 () Bool)

(assert (=> b!1117522 m!1033375))

(declare-fun m!1033377 () Bool)

(assert (=> b!1117512 m!1033377))

(declare-fun m!1033379 () Bool)

(assert (=> b!1117523 m!1033379))

(declare-fun m!1033381 () Bool)

(assert (=> mapNonEmpty!43762 m!1033381))

(declare-fun m!1033383 () Bool)

(assert (=> start!97732 m!1033383))

(declare-fun m!1033385 () Bool)

(assert (=> start!97732 m!1033385))

(declare-fun m!1033387 () Bool)

(assert (=> b!1117517 m!1033387))

(check-sat (not b!1117517) tp_is_empty!27963 (not b!1117522) (not start!97732) (not b!1117518) (not b!1117515) (not b!1117523) (not b!1117512) (not b!1117519) (not mapNonEmpty!43762))
(check-sat)
