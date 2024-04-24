; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97200 () Bool)

(assert start!97200)

(declare-fun b!1104454 () Bool)

(declare-fun res!736492 () Bool)

(declare-fun e!630530 () Bool)

(assert (=> b!1104454 (=> (not res!736492) (not e!630530))))

(declare-datatypes ((array!71525 0))(
  ( (array!71526 (arr!34416 (Array (_ BitVec 32) (_ BitVec 64))) (size!34953 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71525)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41505 0))(
  ( (V!41506 (val!13698 Int)) )
))
(declare-datatypes ((ValueCell!12932 0))(
  ( (ValueCellFull!12932 (v!16325 V!41505)) (EmptyCell!12932) )
))
(declare-datatypes ((array!71527 0))(
  ( (array!71528 (arr!34417 (Array (_ BitVec 32) ValueCell!12932)) (size!34954 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71527)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104454 (= res!736492 (and (= (size!34954 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34953 _keys!1208) (size!34954 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42721 () Bool)

(declare-fun mapRes!42721 () Bool)

(declare-fun tp!81641 () Bool)

(declare-fun e!630532 () Bool)

(assert (=> mapNonEmpty!42721 (= mapRes!42721 (and tp!81641 e!630532))))

(declare-fun mapKey!42721 () (_ BitVec 32))

(declare-fun mapRest!42721 () (Array (_ BitVec 32) ValueCell!12932))

(declare-fun mapValue!42721 () ValueCell!12932)

(assert (=> mapNonEmpty!42721 (= (arr!34417 _values!996) (store mapRest!42721 mapKey!42721 mapValue!42721))))

(declare-fun b!1104456 () Bool)

(declare-fun res!736494 () Bool)

(assert (=> b!1104456 (=> (not res!736494) (not e!630530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71525 (_ BitVec 32)) Bool)

(assert (=> b!1104456 (= res!736494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104457 () Bool)

(declare-fun res!736495 () Bool)

(assert (=> b!1104457 (=> (not res!736495) (not e!630530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104457 (= res!736495 (validMask!0 mask!1564))))

(declare-fun b!1104455 () Bool)

(declare-fun e!630528 () Bool)

(declare-fun tp_is_empty!27283 () Bool)

(assert (=> b!1104455 (= e!630528 tp_is_empty!27283)))

(declare-fun res!736493 () Bool)

(assert (=> start!97200 (=> (not res!736493) (not e!630530))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97200 (= res!736493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34953 _keys!1208))))))

(assert (=> start!97200 e!630530))

(declare-fun array_inv!26536 (array!71525) Bool)

(assert (=> start!97200 (array_inv!26536 _keys!1208)))

(assert (=> start!97200 true))

(declare-fun e!630531 () Bool)

(declare-fun array_inv!26537 (array!71527) Bool)

(assert (=> start!97200 (and (array_inv!26537 _values!996) e!630531)))

(declare-fun b!1104458 () Bool)

(assert (=> b!1104458 (= e!630531 (and e!630528 mapRes!42721))))

(declare-fun condMapEmpty!42721 () Bool)

(declare-fun mapDefault!42721 () ValueCell!12932)

(assert (=> b!1104458 (= condMapEmpty!42721 (= (arr!34417 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12932)) mapDefault!42721)))))

(declare-fun mapIsEmpty!42721 () Bool)

(assert (=> mapIsEmpty!42721 mapRes!42721))

(declare-fun b!1104459 () Bool)

(assert (=> b!1104459 (= e!630532 tp_is_empty!27283)))

(declare-fun b!1104460 () Bool)

(assert (=> b!1104460 (= e!630530 (bvsgt #b00000000000000000000000000000000 (size!34953 _keys!1208)))))

(assert (= (and start!97200 res!736493) b!1104457))

(assert (= (and b!1104457 res!736495) b!1104454))

(assert (= (and b!1104454 res!736492) b!1104456))

(assert (= (and b!1104456 res!736494) b!1104460))

(assert (= (and b!1104458 condMapEmpty!42721) mapIsEmpty!42721))

(assert (= (and b!1104458 (not condMapEmpty!42721)) mapNonEmpty!42721))

(get-info :version)

(assert (= (and mapNonEmpty!42721 ((_ is ValueCellFull!12932) mapValue!42721)) b!1104459))

(assert (= (and b!1104458 ((_ is ValueCellFull!12932) mapDefault!42721)) b!1104455))

(assert (= start!97200 b!1104458))

(declare-fun m!1025101 () Bool)

(assert (=> mapNonEmpty!42721 m!1025101))

(declare-fun m!1025103 () Bool)

(assert (=> b!1104456 m!1025103))

(declare-fun m!1025105 () Bool)

(assert (=> b!1104457 m!1025105))

(declare-fun m!1025107 () Bool)

(assert (=> start!97200 m!1025107))

(declare-fun m!1025109 () Bool)

(assert (=> start!97200 m!1025109))

(check-sat (not mapNonEmpty!42721) tp_is_empty!27283 (not b!1104456) (not b!1104457) (not start!97200))
(check-sat)
