; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97640 () Bool)

(assert start!97640)

(declare-fun mapNonEmpty!43633 () Bool)

(declare-fun mapRes!43633 () Bool)

(declare-fun tp!82877 () Bool)

(declare-fun e!635734 () Bool)

(assert (=> mapNonEmpty!43633 (= mapRes!43633 (and tp!82877 e!635734))))

(declare-fun mapKey!43633 () (_ BitVec 32))

(declare-datatypes ((V!42297 0))(
  ( (V!42298 (val!13995 Int)) )
))
(declare-datatypes ((ValueCell!13229 0))(
  ( (ValueCellFull!13229 (v!16627 V!42297)) (EmptyCell!13229) )
))
(declare-fun mapRest!43633 () (Array (_ BitVec 32) ValueCell!13229))

(declare-datatypes ((array!72552 0))(
  ( (array!72553 (arr!34929 (Array (_ BitVec 32) ValueCell!13229)) (size!35467 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72552)

(declare-fun mapValue!43633 () ValueCell!13229)

(assert (=> mapNonEmpty!43633 (= (arr!34929 _values!996) (store mapRest!43633 mapKey!43633 mapValue!43633))))

(declare-fun b!1115706 () Bool)

(declare-fun res!744905 () Bool)

(declare-fun e!635736 () Bool)

(assert (=> b!1115706 (=> (not res!744905) (not e!635736))))

(declare-datatypes ((array!72554 0))(
  ( (array!72555 (arr!34930 (Array (_ BitVec 32) (_ BitVec 64))) (size!35468 (_ BitVec 32))) )
))
(declare-fun lt!496841 () array!72554)

(declare-datatypes ((List!24389 0))(
  ( (Nil!24386) (Cons!24385 (h!25594 (_ BitVec 64)) (t!34861 List!24389)) )
))
(declare-fun arrayNoDuplicates!0 (array!72554 (_ BitVec 32) List!24389) Bool)

(assert (=> b!1115706 (= res!744905 (arrayNoDuplicates!0 lt!496841 #b00000000000000000000000000000000 Nil!24386))))

(declare-fun b!1115707 () Bool)

(declare-fun res!744908 () Bool)

(declare-fun e!635733 () Bool)

(assert (=> b!1115707 (=> (not res!744908) (not e!635733))))

(declare-fun _keys!1208 () array!72554)

(assert (=> b!1115707 (= res!744908 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24386))))

(declare-fun mapIsEmpty!43633 () Bool)

(assert (=> mapIsEmpty!43633 mapRes!43633))

(declare-fun b!1115709 () Bool)

(declare-fun e!635735 () Bool)

(declare-fun tp_is_empty!27877 () Bool)

(assert (=> b!1115709 (= e!635735 tp_is_empty!27877)))

(declare-fun b!1115710 () Bool)

(assert (=> b!1115710 (= e!635733 e!635736)))

(declare-fun res!744904 () Bool)

(assert (=> b!1115710 (=> (not res!744904) (not e!635736))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72554 (_ BitVec 32)) Bool)

(assert (=> b!1115710 (= res!744904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496841 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115710 (= lt!496841 (array!72555 (store (arr!34930 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35468 _keys!1208)))))

(declare-fun b!1115711 () Bool)

(declare-fun e!635731 () Bool)

(assert (=> b!1115711 (= e!635731 (and e!635735 mapRes!43633))))

(declare-fun condMapEmpty!43633 () Bool)

(declare-fun mapDefault!43633 () ValueCell!13229)

(assert (=> b!1115711 (= condMapEmpty!43633 (= (arr!34929 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13229)) mapDefault!43633)))))

(declare-fun b!1115712 () Bool)

(declare-fun res!744906 () Bool)

(assert (=> b!1115712 (=> (not res!744906) (not e!635733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115712 (= res!744906 (validMask!0 mask!1564))))

(declare-fun b!1115713 () Bool)

(declare-fun res!744909 () Bool)

(assert (=> b!1115713 (=> (not res!744909) (not e!635733))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115713 (= res!744909 (and (= (size!35467 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35468 _keys!1208) (size!35467 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115714 () Bool)

(declare-fun res!744913 () Bool)

(assert (=> b!1115714 (=> (not res!744913) (not e!635733))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115714 (= res!744913 (validKeyInArray!0 k0!934))))

(declare-fun b!1115708 () Bool)

(assert (=> b!1115708 (= e!635734 tp_is_empty!27877)))

(declare-fun res!744911 () Bool)

(assert (=> start!97640 (=> (not res!744911) (not e!635733))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97640 (= res!744911 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35468 _keys!1208))))))

(assert (=> start!97640 e!635733))

(declare-fun array_inv!26918 (array!72554) Bool)

(assert (=> start!97640 (array_inv!26918 _keys!1208)))

(assert (=> start!97640 true))

(declare-fun array_inv!26919 (array!72552) Bool)

(assert (=> start!97640 (and (array_inv!26919 _values!996) e!635731)))

(declare-fun b!1115715 () Bool)

(declare-fun res!744910 () Bool)

(assert (=> b!1115715 (=> (not res!744910) (not e!635733))))

(assert (=> b!1115715 (= res!744910 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35468 _keys!1208))))))

(declare-fun b!1115716 () Bool)

(declare-fun res!744912 () Bool)

(assert (=> b!1115716 (=> (not res!744912) (not e!635733))))

(assert (=> b!1115716 (= res!744912 (= (select (arr!34930 _keys!1208) i!673) k0!934))))

(declare-fun b!1115717 () Bool)

(declare-fun res!744907 () Bool)

(assert (=> b!1115717 (=> (not res!744907) (not e!635733))))

(assert (=> b!1115717 (= res!744907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115718 () Bool)

(assert (=> b!1115718 (= e!635736 (not true))))

(declare-fun arrayContainsKey!0 (array!72554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115718 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36441 0))(
  ( (Unit!36442) )
))
(declare-fun lt!496842 () Unit!36441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72554 (_ BitVec 64) (_ BitVec 32)) Unit!36441)

(assert (=> b!1115718 (= lt!496842 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97640 res!744911) b!1115712))

(assert (= (and b!1115712 res!744906) b!1115713))

(assert (= (and b!1115713 res!744909) b!1115717))

(assert (= (and b!1115717 res!744907) b!1115707))

(assert (= (and b!1115707 res!744908) b!1115715))

(assert (= (and b!1115715 res!744910) b!1115714))

(assert (= (and b!1115714 res!744913) b!1115716))

(assert (= (and b!1115716 res!744912) b!1115710))

(assert (= (and b!1115710 res!744904) b!1115706))

(assert (= (and b!1115706 res!744905) b!1115718))

(assert (= (and b!1115711 condMapEmpty!43633) mapIsEmpty!43633))

(assert (= (and b!1115711 (not condMapEmpty!43633)) mapNonEmpty!43633))

(get-info :version)

(assert (= (and mapNonEmpty!43633 ((_ is ValueCellFull!13229) mapValue!43633)) b!1115708))

(assert (= (and b!1115711 ((_ is ValueCellFull!13229) mapDefault!43633)) b!1115709))

(assert (= start!97640 b!1115711))

(declare-fun m!1031619 () Bool)

(assert (=> b!1115714 m!1031619))

(declare-fun m!1031621 () Bool)

(assert (=> b!1115706 m!1031621))

(declare-fun m!1031623 () Bool)

(assert (=> b!1115717 m!1031623))

(declare-fun m!1031625 () Bool)

(assert (=> b!1115707 m!1031625))

(declare-fun m!1031627 () Bool)

(assert (=> b!1115710 m!1031627))

(declare-fun m!1031629 () Bool)

(assert (=> b!1115710 m!1031629))

(declare-fun m!1031631 () Bool)

(assert (=> b!1115718 m!1031631))

(declare-fun m!1031633 () Bool)

(assert (=> b!1115718 m!1031633))

(declare-fun m!1031635 () Bool)

(assert (=> b!1115716 m!1031635))

(declare-fun m!1031637 () Bool)

(assert (=> b!1115712 m!1031637))

(declare-fun m!1031639 () Bool)

(assert (=> mapNonEmpty!43633 m!1031639))

(declare-fun m!1031641 () Bool)

(assert (=> start!97640 m!1031641))

(declare-fun m!1031643 () Bool)

(assert (=> start!97640 m!1031643))

(check-sat (not b!1115712) (not b!1115717) (not b!1115706) (not b!1115718) (not b!1115714) (not b!1115707) (not start!97640) (not mapNonEmpty!43633) tp_is_empty!27877 (not b!1115710))
(check-sat)
