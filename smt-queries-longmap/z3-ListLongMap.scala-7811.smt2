; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97612 () Bool)

(assert start!97612)

(declare-fun b!1115172 () Bool)

(declare-fun res!744469 () Bool)

(declare-fun e!635506 () Bool)

(assert (=> b!1115172 (=> (not res!744469) (not e!635506))))

(declare-datatypes ((array!72589 0))(
  ( (array!72590 (arr!34947 (Array (_ BitVec 32) (_ BitVec 64))) (size!35483 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72589)

(declare-datatypes ((List!24342 0))(
  ( (Nil!24339) (Cons!24338 (h!25547 (_ BitVec 64)) (t!34823 List!24342)) )
))
(declare-fun arrayNoDuplicates!0 (array!72589 (_ BitVec 32) List!24342) Bool)

(assert (=> b!1115172 (= res!744469 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24339))))

(declare-fun b!1115173 () Bool)

(declare-fun res!744471 () Bool)

(assert (=> b!1115173 (=> (not res!744471) (not e!635506))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115173 (= res!744471 (validKeyInArray!0 k0!934))))

(declare-fun res!744467 () Bool)

(assert (=> start!97612 (=> (not res!744467) (not e!635506))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97612 (= res!744467 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35483 _keys!1208))))))

(assert (=> start!97612 e!635506))

(declare-fun array_inv!26868 (array!72589) Bool)

(assert (=> start!97612 (array_inv!26868 _keys!1208)))

(assert (=> start!97612 true))

(declare-datatypes ((V!42251 0))(
  ( (V!42252 (val!13978 Int)) )
))
(declare-datatypes ((ValueCell!13212 0))(
  ( (ValueCellFull!13212 (v!16611 V!42251)) (EmptyCell!13212) )
))
(declare-datatypes ((array!72591 0))(
  ( (array!72592 (arr!34948 (Array (_ BitVec 32) ValueCell!13212)) (size!35484 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72591)

(declare-fun e!635507 () Bool)

(declare-fun array_inv!26869 (array!72591) Bool)

(assert (=> start!97612 (and (array_inv!26869 _values!996) e!635507)))

(declare-fun b!1115174 () Bool)

(declare-fun res!744464 () Bool)

(assert (=> b!1115174 (=> (not res!744464) (not e!635506))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115174 (= res!744464 (= (select (arr!34947 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43582 () Bool)

(declare-fun mapRes!43582 () Bool)

(assert (=> mapIsEmpty!43582 mapRes!43582))

(declare-fun b!1115175 () Bool)

(declare-fun e!635511 () Bool)

(declare-fun tp_is_empty!27843 () Bool)

(assert (=> b!1115175 (= e!635511 tp_is_empty!27843)))

(declare-fun mapNonEmpty!43582 () Bool)

(declare-fun tp!82826 () Bool)

(assert (=> mapNonEmpty!43582 (= mapRes!43582 (and tp!82826 e!635511))))

(declare-fun mapRest!43582 () (Array (_ BitVec 32) ValueCell!13212))

(declare-fun mapValue!43582 () ValueCell!13212)

(declare-fun mapKey!43582 () (_ BitVec 32))

(assert (=> mapNonEmpty!43582 (= (arr!34948 _values!996) (store mapRest!43582 mapKey!43582 mapValue!43582))))

(declare-fun b!1115176 () Bool)

(declare-fun res!744470 () Bool)

(assert (=> b!1115176 (=> (not res!744470) (not e!635506))))

(assert (=> b!1115176 (= res!744470 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35483 _keys!1208))))))

(declare-fun b!1115177 () Bool)

(declare-fun res!744472 () Bool)

(assert (=> b!1115177 (=> (not res!744472) (not e!635506))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115177 (= res!744472 (and (= (size!35484 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35483 _keys!1208) (size!35484 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115178 () Bool)

(declare-fun e!635509 () Bool)

(assert (=> b!1115178 (= e!635509 tp_is_empty!27843)))

(declare-fun b!1115179 () Bool)

(declare-fun e!635508 () Bool)

(assert (=> b!1115179 (= e!635508 (not true))))

(declare-fun arrayContainsKey!0 (array!72589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115179 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36602 0))(
  ( (Unit!36603) )
))
(declare-fun lt!496939 () Unit!36602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72589 (_ BitVec 64) (_ BitVec 32)) Unit!36602)

(assert (=> b!1115179 (= lt!496939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115180 () Bool)

(declare-fun res!744468 () Bool)

(assert (=> b!1115180 (=> (not res!744468) (not e!635506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72589 (_ BitVec 32)) Bool)

(assert (=> b!1115180 (= res!744468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115181 () Bool)

(declare-fun res!744463 () Bool)

(assert (=> b!1115181 (=> (not res!744463) (not e!635508))))

(declare-fun lt!496940 () array!72589)

(assert (=> b!1115181 (= res!744463 (arrayNoDuplicates!0 lt!496940 #b00000000000000000000000000000000 Nil!24339))))

(declare-fun b!1115182 () Bool)

(declare-fun res!744465 () Bool)

(assert (=> b!1115182 (=> (not res!744465) (not e!635506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115182 (= res!744465 (validMask!0 mask!1564))))

(declare-fun b!1115183 () Bool)

(assert (=> b!1115183 (= e!635506 e!635508)))

(declare-fun res!744466 () Bool)

(assert (=> b!1115183 (=> (not res!744466) (not e!635508))))

(assert (=> b!1115183 (= res!744466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496940 mask!1564))))

(assert (=> b!1115183 (= lt!496940 (array!72590 (store (arr!34947 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35483 _keys!1208)))))

(declare-fun b!1115184 () Bool)

(assert (=> b!1115184 (= e!635507 (and e!635509 mapRes!43582))))

(declare-fun condMapEmpty!43582 () Bool)

(declare-fun mapDefault!43582 () ValueCell!13212)

(assert (=> b!1115184 (= condMapEmpty!43582 (= (arr!34948 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13212)) mapDefault!43582)))))

(assert (= (and start!97612 res!744467) b!1115182))

(assert (= (and b!1115182 res!744465) b!1115177))

(assert (= (and b!1115177 res!744472) b!1115180))

(assert (= (and b!1115180 res!744468) b!1115172))

(assert (= (and b!1115172 res!744469) b!1115176))

(assert (= (and b!1115176 res!744470) b!1115173))

(assert (= (and b!1115173 res!744471) b!1115174))

(assert (= (and b!1115174 res!744464) b!1115183))

(assert (= (and b!1115183 res!744466) b!1115181))

(assert (= (and b!1115181 res!744463) b!1115179))

(assert (= (and b!1115184 condMapEmpty!43582) mapIsEmpty!43582))

(assert (= (and b!1115184 (not condMapEmpty!43582)) mapNonEmpty!43582))

(get-info :version)

(assert (= (and mapNonEmpty!43582 ((_ is ValueCellFull!13212) mapValue!43582)) b!1115175))

(assert (= (and b!1115184 ((_ is ValueCellFull!13212) mapDefault!43582)) b!1115178))

(assert (= start!97612 b!1115184))

(declare-fun m!1031803 () Bool)

(assert (=> b!1115183 m!1031803))

(declare-fun m!1031805 () Bool)

(assert (=> b!1115183 m!1031805))

(declare-fun m!1031807 () Bool)

(assert (=> b!1115172 m!1031807))

(declare-fun m!1031809 () Bool)

(assert (=> b!1115179 m!1031809))

(declare-fun m!1031811 () Bool)

(assert (=> b!1115179 m!1031811))

(declare-fun m!1031813 () Bool)

(assert (=> start!97612 m!1031813))

(declare-fun m!1031815 () Bool)

(assert (=> start!97612 m!1031815))

(declare-fun m!1031817 () Bool)

(assert (=> b!1115180 m!1031817))

(declare-fun m!1031819 () Bool)

(assert (=> b!1115174 m!1031819))

(declare-fun m!1031821 () Bool)

(assert (=> b!1115182 m!1031821))

(declare-fun m!1031823 () Bool)

(assert (=> b!1115181 m!1031823))

(declare-fun m!1031825 () Bool)

(assert (=> mapNonEmpty!43582 m!1031825))

(declare-fun m!1031827 () Bool)

(assert (=> b!1115173 m!1031827))

(check-sat (not b!1115173) (not b!1115183) (not mapNonEmpty!43582) (not b!1115179) (not b!1115182) tp_is_empty!27843 (not b!1115181) (not start!97612) (not b!1115180) (not b!1115172))
(check-sat)
