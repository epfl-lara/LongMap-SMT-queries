; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97748 () Bool)

(assert start!97748)

(declare-fun b_free!23455 () Bool)

(declare-fun b_next!23455 () Bool)

(assert (=> start!97748 (= b_free!23455 (not b_next!23455))))

(declare-fun tp!83069 () Bool)

(declare-fun b_and!37707 () Bool)

(assert (=> start!97748 (= tp!83069 b_and!37707)))

(declare-fun b!1117841 () Bool)

(declare-fun res!746557 () Bool)

(declare-fun e!636736 () Bool)

(assert (=> b!1117841 (=> (not res!746557) (not e!636736))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72764 0))(
  ( (array!72765 (arr!35035 (Array (_ BitVec 32) (_ BitVec 64))) (size!35573 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72764)

(assert (=> b!1117841 (= res!746557 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35573 _keys!1208))))))

(declare-fun b!1117842 () Bool)

(declare-fun res!746556 () Bool)

(assert (=> b!1117842 (=> (not res!746556) (not e!636736))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72764 (_ BitVec 32)) Bool)

(assert (=> b!1117842 (= res!746556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117843 () Bool)

(declare-fun res!746561 () Bool)

(assert (=> b!1117843 (=> (not res!746561) (not e!636736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117843 (= res!746561 (validMask!0 mask!1564))))

(declare-fun b!1117844 () Bool)

(declare-fun e!636732 () Bool)

(assert (=> b!1117844 (= e!636732 true)))

(declare-datatypes ((V!42441 0))(
  ( (V!42442 (val!14049 Int)) )
))
(declare-fun zeroValue!944 () V!42441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17682 0))(
  ( (tuple2!17683 (_1!8852 (_ BitVec 64)) (_2!8852 V!42441)) )
))
(declare-datatypes ((List!24442 0))(
  ( (Nil!24439) (Cons!24438 (h!25647 tuple2!17682) (t!34914 List!24442)) )
))
(declare-datatypes ((ListLongMap!15651 0))(
  ( (ListLongMap!15652 (toList!7841 List!24442)) )
))
(declare-fun lt!497195 () ListLongMap!15651)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42441)

(declare-datatypes ((ValueCell!13283 0))(
  ( (ValueCellFull!13283 (v!16681 V!42441)) (EmptyCell!13283) )
))
(declare-datatypes ((array!72766 0))(
  ( (array!72767 (arr!35036 (Array (_ BitVec 32) ValueCell!13283)) (size!35574 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72766)

(declare-fun getCurrentListMapNoExtraKeys!4350 (array!72764 array!72766 (_ BitVec 32) (_ BitVec 32) V!42441 V!42441 (_ BitVec 32) Int) ListLongMap!15651)

(assert (=> b!1117844 (= lt!497195 (getCurrentListMapNoExtraKeys!4350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43795 () Bool)

(declare-fun mapRes!43795 () Bool)

(assert (=> mapIsEmpty!43795 mapRes!43795))

(declare-fun b!1117845 () Bool)

(declare-fun res!746554 () Bool)

(declare-fun e!636734 () Bool)

(assert (=> b!1117845 (=> (not res!746554) (not e!636734))))

(declare-fun lt!497196 () array!72764)

(declare-datatypes ((List!24443 0))(
  ( (Nil!24440) (Cons!24439 (h!25648 (_ BitVec 64)) (t!34915 List!24443)) )
))
(declare-fun arrayNoDuplicates!0 (array!72764 (_ BitVec 32) List!24443) Bool)

(assert (=> b!1117845 (= res!746554 (arrayNoDuplicates!0 lt!497196 #b00000000000000000000000000000000 Nil!24440))))

(declare-fun res!746555 () Bool)

(assert (=> start!97748 (=> (not res!746555) (not e!636736))))

(assert (=> start!97748 (= res!746555 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35573 _keys!1208))))))

(assert (=> start!97748 e!636736))

(declare-fun tp_is_empty!27985 () Bool)

(assert (=> start!97748 tp_is_empty!27985))

(declare-fun array_inv!26990 (array!72764) Bool)

(assert (=> start!97748 (array_inv!26990 _keys!1208)))

(assert (=> start!97748 true))

(assert (=> start!97748 tp!83069))

(declare-fun e!636733 () Bool)

(declare-fun array_inv!26991 (array!72766) Bool)

(assert (=> start!97748 (and (array_inv!26991 _values!996) e!636733)))

(declare-fun b!1117846 () Bool)

(declare-fun e!636735 () Bool)

(assert (=> b!1117846 (= e!636735 tp_is_empty!27985)))

(declare-fun b!1117847 () Bool)

(declare-fun e!636738 () Bool)

(assert (=> b!1117847 (= e!636738 tp_is_empty!27985)))

(declare-fun b!1117848 () Bool)

(declare-fun res!746563 () Bool)

(assert (=> b!1117848 (=> (not res!746563) (not e!636736))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117848 (= res!746563 (= (select (arr!35035 _keys!1208) i!673) k0!934))))

(declare-fun b!1117849 () Bool)

(assert (=> b!1117849 (= e!636734 (not e!636732))))

(declare-fun res!746562 () Bool)

(assert (=> b!1117849 (=> res!746562 e!636732)))

(assert (=> b!1117849 (= res!746562 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117849 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36513 0))(
  ( (Unit!36514) )
))
(declare-fun lt!497194 () Unit!36513)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72764 (_ BitVec 64) (_ BitVec 32)) Unit!36513)

(assert (=> b!1117849 (= lt!497194 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117850 () Bool)

(assert (=> b!1117850 (= e!636736 e!636734)))

(declare-fun res!746553 () Bool)

(assert (=> b!1117850 (=> (not res!746553) (not e!636734))))

(assert (=> b!1117850 (= res!746553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497196 mask!1564))))

(assert (=> b!1117850 (= lt!497196 (array!72765 (store (arr!35035 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35573 _keys!1208)))))

(declare-fun b!1117851 () Bool)

(declare-fun res!746560 () Bool)

(assert (=> b!1117851 (=> (not res!746560) (not e!636736))))

(assert (=> b!1117851 (= res!746560 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24440))))

(declare-fun b!1117852 () Bool)

(declare-fun res!746558 () Bool)

(assert (=> b!1117852 (=> (not res!746558) (not e!636736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117852 (= res!746558 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43795 () Bool)

(declare-fun tp!83068 () Bool)

(assert (=> mapNonEmpty!43795 (= mapRes!43795 (and tp!83068 e!636735))))

(declare-fun mapRest!43795 () (Array (_ BitVec 32) ValueCell!13283))

(declare-fun mapKey!43795 () (_ BitVec 32))

(declare-fun mapValue!43795 () ValueCell!13283)

(assert (=> mapNonEmpty!43795 (= (arr!35036 _values!996) (store mapRest!43795 mapKey!43795 mapValue!43795))))

(declare-fun b!1117853 () Bool)

(declare-fun res!746559 () Bool)

(assert (=> b!1117853 (=> (not res!746559) (not e!636736))))

(assert (=> b!1117853 (= res!746559 (and (= (size!35574 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35573 _keys!1208) (size!35574 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117854 () Bool)

(assert (=> b!1117854 (= e!636733 (and e!636738 mapRes!43795))))

(declare-fun condMapEmpty!43795 () Bool)

(declare-fun mapDefault!43795 () ValueCell!13283)

(assert (=> b!1117854 (= condMapEmpty!43795 (= (arr!35036 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13283)) mapDefault!43795)))))

(assert (= (and start!97748 res!746555) b!1117843))

(assert (= (and b!1117843 res!746561) b!1117853))

(assert (= (and b!1117853 res!746559) b!1117842))

(assert (= (and b!1117842 res!746556) b!1117851))

(assert (= (and b!1117851 res!746560) b!1117841))

(assert (= (and b!1117841 res!746557) b!1117852))

(assert (= (and b!1117852 res!746558) b!1117848))

(assert (= (and b!1117848 res!746563) b!1117850))

(assert (= (and b!1117850 res!746553) b!1117845))

(assert (= (and b!1117845 res!746554) b!1117849))

(assert (= (and b!1117849 (not res!746562)) b!1117844))

(assert (= (and b!1117854 condMapEmpty!43795) mapIsEmpty!43795))

(assert (= (and b!1117854 (not condMapEmpty!43795)) mapNonEmpty!43795))

(get-info :version)

(assert (= (and mapNonEmpty!43795 ((_ is ValueCellFull!13283) mapValue!43795)) b!1117846))

(assert (= (and b!1117854 ((_ is ValueCellFull!13283) mapDefault!43795)) b!1117847))

(assert (= start!97748 b!1117854))

(declare-fun m!1033041 () Bool)

(assert (=> mapNonEmpty!43795 m!1033041))

(declare-fun m!1033043 () Bool)

(assert (=> b!1117843 m!1033043))

(declare-fun m!1033045 () Bool)

(assert (=> b!1117852 m!1033045))

(declare-fun m!1033047 () Bool)

(assert (=> b!1117845 m!1033047))

(declare-fun m!1033049 () Bool)

(assert (=> start!97748 m!1033049))

(declare-fun m!1033051 () Bool)

(assert (=> start!97748 m!1033051))

(declare-fun m!1033053 () Bool)

(assert (=> b!1117842 m!1033053))

(declare-fun m!1033055 () Bool)

(assert (=> b!1117848 m!1033055))

(declare-fun m!1033057 () Bool)

(assert (=> b!1117844 m!1033057))

(declare-fun m!1033059 () Bool)

(assert (=> b!1117851 m!1033059))

(declare-fun m!1033061 () Bool)

(assert (=> b!1117850 m!1033061))

(declare-fun m!1033063 () Bool)

(assert (=> b!1117850 m!1033063))

(declare-fun m!1033065 () Bool)

(assert (=> b!1117849 m!1033065))

(declare-fun m!1033067 () Bool)

(assert (=> b!1117849 m!1033067))

(check-sat (not b!1117849) (not start!97748) (not b!1117850) (not b!1117844) b_and!37707 (not b!1117845) tp_is_empty!27985 (not b!1117852) (not mapNonEmpty!43795) (not b_next!23455) (not b!1117851) (not b!1117843) (not b!1117842))
(check-sat b_and!37707 (not b_next!23455))
