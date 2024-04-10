; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97582 () Bool)

(assert start!97582)

(declare-fun mapIsEmpty!43537 () Bool)

(declare-fun mapRes!43537 () Bool)

(assert (=> mapIsEmpty!43537 mapRes!43537))

(declare-fun b!1114587 () Bool)

(declare-fun e!635237 () Bool)

(declare-fun tp_is_empty!27813 () Bool)

(assert (=> b!1114587 (= e!635237 tp_is_empty!27813)))

(declare-fun mapNonEmpty!43537 () Bool)

(declare-fun tp!82781 () Bool)

(assert (=> mapNonEmpty!43537 (= mapRes!43537 (and tp!82781 e!635237))))

(declare-datatypes ((V!42211 0))(
  ( (V!42212 (val!13963 Int)) )
))
(declare-datatypes ((ValueCell!13197 0))(
  ( (ValueCellFull!13197 (v!16596 V!42211)) (EmptyCell!13197) )
))
(declare-fun mapValue!43537 () ValueCell!13197)

(declare-fun mapRest!43537 () (Array (_ BitVec 32) ValueCell!13197))

(declare-datatypes ((array!72533 0))(
  ( (array!72534 (arr!34919 (Array (_ BitVec 32) ValueCell!13197)) (size!35455 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72533)

(declare-fun mapKey!43537 () (_ BitVec 32))

(assert (=> mapNonEmpty!43537 (= (arr!34919 _values!996) (store mapRest!43537 mapKey!43537 mapValue!43537))))

(declare-fun b!1114588 () Bool)

(declare-fun e!635236 () Bool)

(declare-fun e!635240 () Bool)

(assert (=> b!1114588 (= e!635236 e!635240)))

(declare-fun res!744014 () Bool)

(assert (=> b!1114588 (=> (not res!744014) (not e!635240))))

(declare-datatypes ((array!72535 0))(
  ( (array!72536 (arr!34920 (Array (_ BitVec 32) (_ BitVec 64))) (size!35456 (_ BitVec 32))) )
))
(declare-fun lt!496849 () array!72535)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72535 (_ BitVec 32)) Bool)

(assert (=> b!1114588 (= res!744014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496849 mask!1564))))

(declare-fun _keys!1208 () array!72535)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114588 (= lt!496849 (array!72536 (store (arr!34920 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35456 _keys!1208)))))

(declare-fun b!1114589 () Bool)

(declare-fun res!744016 () Bool)

(assert (=> b!1114589 (=> (not res!744016) (not e!635236))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114589 (= res!744016 (and (= (size!35455 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35456 _keys!1208) (size!35455 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!744019 () Bool)

(assert (=> start!97582 (=> (not res!744019) (not e!635236))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97582 (= res!744019 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35456 _keys!1208))))))

(assert (=> start!97582 e!635236))

(declare-fun array_inv!26844 (array!72535) Bool)

(assert (=> start!97582 (array_inv!26844 _keys!1208)))

(assert (=> start!97582 true))

(declare-fun e!635238 () Bool)

(declare-fun array_inv!26845 (array!72533) Bool)

(assert (=> start!97582 (and (array_inv!26845 _values!996) e!635238)))

(declare-fun b!1114590 () Bool)

(declare-fun res!744013 () Bool)

(assert (=> b!1114590 (=> (not res!744013) (not e!635236))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114590 (= res!744013 (= (select (arr!34920 _keys!1208) i!673) k0!934))))

(declare-fun b!1114591 () Bool)

(assert (=> b!1114591 (= e!635240 (not true))))

(declare-fun arrayContainsKey!0 (array!72535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114591 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36580 0))(
  ( (Unit!36581) )
))
(declare-fun lt!496850 () Unit!36580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72535 (_ BitVec 64) (_ BitVec 32)) Unit!36580)

(assert (=> b!1114591 (= lt!496850 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114592 () Bool)

(declare-fun res!744022 () Bool)

(assert (=> b!1114592 (=> (not res!744022) (not e!635236))))

(assert (=> b!1114592 (= res!744022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114593 () Bool)

(declare-fun res!744015 () Bool)

(assert (=> b!1114593 (=> (not res!744015) (not e!635240))))

(declare-datatypes ((List!24332 0))(
  ( (Nil!24329) (Cons!24328 (h!25537 (_ BitVec 64)) (t!34813 List!24332)) )
))
(declare-fun arrayNoDuplicates!0 (array!72535 (_ BitVec 32) List!24332) Bool)

(assert (=> b!1114593 (= res!744015 (arrayNoDuplicates!0 lt!496849 #b00000000000000000000000000000000 Nil!24329))))

(declare-fun b!1114594 () Bool)

(declare-fun res!744017 () Bool)

(assert (=> b!1114594 (=> (not res!744017) (not e!635236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114594 (= res!744017 (validMask!0 mask!1564))))

(declare-fun b!1114595 () Bool)

(declare-fun e!635241 () Bool)

(assert (=> b!1114595 (= e!635241 tp_is_empty!27813)))

(declare-fun b!1114596 () Bool)

(declare-fun res!744020 () Bool)

(assert (=> b!1114596 (=> (not res!744020) (not e!635236))))

(assert (=> b!1114596 (= res!744020 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35456 _keys!1208))))))

(declare-fun b!1114597 () Bool)

(assert (=> b!1114597 (= e!635238 (and e!635241 mapRes!43537))))

(declare-fun condMapEmpty!43537 () Bool)

(declare-fun mapDefault!43537 () ValueCell!13197)

(assert (=> b!1114597 (= condMapEmpty!43537 (= (arr!34919 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13197)) mapDefault!43537)))))

(declare-fun b!1114598 () Bool)

(declare-fun res!744021 () Bool)

(assert (=> b!1114598 (=> (not res!744021) (not e!635236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114598 (= res!744021 (validKeyInArray!0 k0!934))))

(declare-fun b!1114599 () Bool)

(declare-fun res!744018 () Bool)

(assert (=> b!1114599 (=> (not res!744018) (not e!635236))))

(assert (=> b!1114599 (= res!744018 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24329))))

(assert (= (and start!97582 res!744019) b!1114594))

(assert (= (and b!1114594 res!744017) b!1114589))

(assert (= (and b!1114589 res!744016) b!1114592))

(assert (= (and b!1114592 res!744022) b!1114599))

(assert (= (and b!1114599 res!744018) b!1114596))

(assert (= (and b!1114596 res!744020) b!1114598))

(assert (= (and b!1114598 res!744021) b!1114590))

(assert (= (and b!1114590 res!744013) b!1114588))

(assert (= (and b!1114588 res!744014) b!1114593))

(assert (= (and b!1114593 res!744015) b!1114591))

(assert (= (and b!1114597 condMapEmpty!43537) mapIsEmpty!43537))

(assert (= (and b!1114597 (not condMapEmpty!43537)) mapNonEmpty!43537))

(get-info :version)

(assert (= (and mapNonEmpty!43537 ((_ is ValueCellFull!13197) mapValue!43537)) b!1114587))

(assert (= (and b!1114597 ((_ is ValueCellFull!13197) mapDefault!43537)) b!1114595))

(assert (= start!97582 b!1114597))

(declare-fun m!1031413 () Bool)

(assert (=> b!1114599 m!1031413))

(declare-fun m!1031415 () Bool)

(assert (=> b!1114588 m!1031415))

(declare-fun m!1031417 () Bool)

(assert (=> b!1114588 m!1031417))

(declare-fun m!1031419 () Bool)

(assert (=> b!1114592 m!1031419))

(declare-fun m!1031421 () Bool)

(assert (=> b!1114598 m!1031421))

(declare-fun m!1031423 () Bool)

(assert (=> start!97582 m!1031423))

(declare-fun m!1031425 () Bool)

(assert (=> start!97582 m!1031425))

(declare-fun m!1031427 () Bool)

(assert (=> b!1114593 m!1031427))

(declare-fun m!1031429 () Bool)

(assert (=> b!1114591 m!1031429))

(declare-fun m!1031431 () Bool)

(assert (=> b!1114591 m!1031431))

(declare-fun m!1031433 () Bool)

(assert (=> b!1114590 m!1031433))

(declare-fun m!1031435 () Bool)

(assert (=> mapNonEmpty!43537 m!1031435))

(declare-fun m!1031437 () Bool)

(assert (=> b!1114594 m!1031437))

(check-sat (not mapNonEmpty!43537) tp_is_empty!27813 (not b!1114592) (not b!1114594) (not b!1114599) (not b!1114598) (not start!97582) (not b!1114593) (not b!1114588) (not b!1114591))
(check-sat)
