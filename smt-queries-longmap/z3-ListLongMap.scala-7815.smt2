; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97636 () Bool)

(assert start!97636)

(declare-fun res!744825 () Bool)

(declare-fun e!635725 () Bool)

(assert (=> start!97636 (=> (not res!744825) (not e!635725))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72635 0))(
  ( (array!72636 (arr!34970 (Array (_ BitVec 32) (_ BitVec 64))) (size!35506 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72635)

(assert (=> start!97636 (= res!744825 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35506 _keys!1208))))))

(assert (=> start!97636 e!635725))

(declare-fun array_inv!26880 (array!72635) Bool)

(assert (=> start!97636 (array_inv!26880 _keys!1208)))

(assert (=> start!97636 true))

(declare-datatypes ((V!42283 0))(
  ( (V!42284 (val!13990 Int)) )
))
(declare-datatypes ((ValueCell!13224 0))(
  ( (ValueCellFull!13224 (v!16623 V!42283)) (EmptyCell!13224) )
))
(declare-datatypes ((array!72637 0))(
  ( (array!72638 (arr!34971 (Array (_ BitVec 32) ValueCell!13224)) (size!35507 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72637)

(declare-fun e!635724 () Bool)

(declare-fun array_inv!26881 (array!72637) Bool)

(assert (=> start!97636 (and (array_inv!26881 _values!996) e!635724)))

(declare-fun mapNonEmpty!43618 () Bool)

(declare-fun mapRes!43618 () Bool)

(declare-fun tp!82862 () Bool)

(declare-fun e!635722 () Bool)

(assert (=> mapNonEmpty!43618 (= mapRes!43618 (and tp!82862 e!635722))))

(declare-fun mapRest!43618 () (Array (_ BitVec 32) ValueCell!13224))

(declare-fun mapValue!43618 () ValueCell!13224)

(declare-fun mapKey!43618 () (_ BitVec 32))

(assert (=> mapNonEmpty!43618 (= (arr!34971 _values!996) (store mapRest!43618 mapKey!43618 mapValue!43618))))

(declare-fun b!1115640 () Bool)

(declare-fun res!744830 () Bool)

(assert (=> b!1115640 (=> (not res!744830) (not e!635725))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115640 (= res!744830 (and (= (size!35507 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35506 _keys!1208) (size!35507 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115641 () Bool)

(declare-fun res!744828 () Bool)

(assert (=> b!1115641 (=> (not res!744828) (not e!635725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115641 (= res!744828 (validMask!0 mask!1564))))

(declare-fun b!1115642 () Bool)

(declare-fun res!744831 () Bool)

(assert (=> b!1115642 (=> (not res!744831) (not e!635725))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115642 (= res!744831 (validKeyInArray!0 k0!934))))

(declare-fun b!1115643 () Bool)

(declare-fun res!744832 () Bool)

(assert (=> b!1115643 (=> (not res!744832) (not e!635725))))

(declare-datatypes ((List!24352 0))(
  ( (Nil!24349) (Cons!24348 (h!25557 (_ BitVec 64)) (t!34833 List!24352)) )
))
(declare-fun arrayNoDuplicates!0 (array!72635 (_ BitVec 32) List!24352) Bool)

(assert (=> b!1115643 (= res!744832 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24349))))

(declare-fun b!1115644 () Bool)

(declare-fun e!635726 () Bool)

(assert (=> b!1115644 (= e!635726 (not true))))

(declare-fun arrayContainsKey!0 (array!72635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115644 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36616 0))(
  ( (Unit!36617) )
))
(declare-fun lt!497011 () Unit!36616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72635 (_ BitVec 64) (_ BitVec 32)) Unit!36616)

(assert (=> b!1115644 (= lt!497011 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115645 () Bool)

(declare-fun e!635723 () Bool)

(assert (=> b!1115645 (= e!635724 (and e!635723 mapRes!43618))))

(declare-fun condMapEmpty!43618 () Bool)

(declare-fun mapDefault!43618 () ValueCell!13224)

(assert (=> b!1115645 (= condMapEmpty!43618 (= (arr!34971 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13224)) mapDefault!43618)))))

(declare-fun b!1115646 () Bool)

(declare-fun res!744824 () Bool)

(assert (=> b!1115646 (=> (not res!744824) (not e!635725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72635 (_ BitVec 32)) Bool)

(assert (=> b!1115646 (= res!744824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115647 () Bool)

(declare-fun res!744826 () Bool)

(assert (=> b!1115647 (=> (not res!744826) (not e!635725))))

(assert (=> b!1115647 (= res!744826 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35506 _keys!1208))))))

(declare-fun b!1115648 () Bool)

(declare-fun tp_is_empty!27867 () Bool)

(assert (=> b!1115648 (= e!635722 tp_is_empty!27867)))

(declare-fun b!1115649 () Bool)

(assert (=> b!1115649 (= e!635725 e!635726)))

(declare-fun res!744823 () Bool)

(assert (=> b!1115649 (=> (not res!744823) (not e!635726))))

(declare-fun lt!497012 () array!72635)

(assert (=> b!1115649 (= res!744823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497012 mask!1564))))

(assert (=> b!1115649 (= lt!497012 (array!72636 (store (arr!34970 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35506 _keys!1208)))))

(declare-fun mapIsEmpty!43618 () Bool)

(assert (=> mapIsEmpty!43618 mapRes!43618))

(declare-fun b!1115650 () Bool)

(declare-fun res!744827 () Bool)

(assert (=> b!1115650 (=> (not res!744827) (not e!635725))))

(assert (=> b!1115650 (= res!744827 (= (select (arr!34970 _keys!1208) i!673) k0!934))))

(declare-fun b!1115651 () Bool)

(assert (=> b!1115651 (= e!635723 tp_is_empty!27867)))

(declare-fun b!1115652 () Bool)

(declare-fun res!744829 () Bool)

(assert (=> b!1115652 (=> (not res!744829) (not e!635726))))

(assert (=> b!1115652 (= res!744829 (arrayNoDuplicates!0 lt!497012 #b00000000000000000000000000000000 Nil!24349))))

(assert (= (and start!97636 res!744825) b!1115641))

(assert (= (and b!1115641 res!744828) b!1115640))

(assert (= (and b!1115640 res!744830) b!1115646))

(assert (= (and b!1115646 res!744824) b!1115643))

(assert (= (and b!1115643 res!744832) b!1115647))

(assert (= (and b!1115647 res!744826) b!1115642))

(assert (= (and b!1115642 res!744831) b!1115650))

(assert (= (and b!1115650 res!744827) b!1115649))

(assert (= (and b!1115649 res!744823) b!1115652))

(assert (= (and b!1115652 res!744829) b!1115644))

(assert (= (and b!1115645 condMapEmpty!43618) mapIsEmpty!43618))

(assert (= (and b!1115645 (not condMapEmpty!43618)) mapNonEmpty!43618))

(get-info :version)

(assert (= (and mapNonEmpty!43618 ((_ is ValueCellFull!13224) mapValue!43618)) b!1115648))

(assert (= (and b!1115645 ((_ is ValueCellFull!13224) mapDefault!43618)) b!1115651))

(assert (= start!97636 b!1115645))

(declare-fun m!1032115 () Bool)

(assert (=> b!1115652 m!1032115))

(declare-fun m!1032117 () Bool)

(assert (=> b!1115644 m!1032117))

(declare-fun m!1032119 () Bool)

(assert (=> b!1115644 m!1032119))

(declare-fun m!1032121 () Bool)

(assert (=> mapNonEmpty!43618 m!1032121))

(declare-fun m!1032123 () Bool)

(assert (=> b!1115641 m!1032123))

(declare-fun m!1032125 () Bool)

(assert (=> b!1115642 m!1032125))

(declare-fun m!1032127 () Bool)

(assert (=> b!1115646 m!1032127))

(declare-fun m!1032129 () Bool)

(assert (=> b!1115650 m!1032129))

(declare-fun m!1032131 () Bool)

(assert (=> b!1115643 m!1032131))

(declare-fun m!1032133 () Bool)

(assert (=> b!1115649 m!1032133))

(declare-fun m!1032135 () Bool)

(assert (=> b!1115649 m!1032135))

(declare-fun m!1032137 () Bool)

(assert (=> start!97636 m!1032137))

(declare-fun m!1032139 () Bool)

(assert (=> start!97636 m!1032139))

(check-sat (not mapNonEmpty!43618) (not b!1115641) (not start!97636) (not b!1115643) (not b!1115642) (not b!1115649) (not b!1115644) (not b!1115652) tp_is_empty!27867 (not b!1115646))
(check-sat)
