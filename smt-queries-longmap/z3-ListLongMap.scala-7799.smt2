; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97540 () Bool)

(assert start!97540)

(declare-fun b!1113768 () Bool)

(declare-fun e!634861 () Bool)

(declare-fun e!634863 () Bool)

(assert (=> b!1113768 (= e!634861 e!634863)))

(declare-fun res!743392 () Bool)

(assert (=> b!1113768 (=> (not res!743392) (not e!634863))))

(declare-datatypes ((array!72449 0))(
  ( (array!72450 (arr!34877 (Array (_ BitVec 32) (_ BitVec 64))) (size!35413 (_ BitVec 32))) )
))
(declare-fun lt!496723 () array!72449)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72449 (_ BitVec 32)) Bool)

(assert (=> b!1113768 (= res!743392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496723 mask!1564))))

(declare-fun _keys!1208 () array!72449)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113768 (= lt!496723 (array!72450 (store (arr!34877 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35413 _keys!1208)))))

(declare-fun mapNonEmpty!43474 () Bool)

(declare-fun mapRes!43474 () Bool)

(declare-fun tp!82718 () Bool)

(declare-fun e!634860 () Bool)

(assert (=> mapNonEmpty!43474 (= mapRes!43474 (and tp!82718 e!634860))))

(declare-fun mapKey!43474 () (_ BitVec 32))

(declare-datatypes ((V!42155 0))(
  ( (V!42156 (val!13942 Int)) )
))
(declare-datatypes ((ValueCell!13176 0))(
  ( (ValueCellFull!13176 (v!16575 V!42155)) (EmptyCell!13176) )
))
(declare-fun mapRest!43474 () (Array (_ BitVec 32) ValueCell!13176))

(declare-fun mapValue!43474 () ValueCell!13176)

(declare-datatypes ((array!72451 0))(
  ( (array!72452 (arr!34878 (Array (_ BitVec 32) ValueCell!13176)) (size!35414 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72451)

(assert (=> mapNonEmpty!43474 (= (arr!34878 _values!996) (store mapRest!43474 mapKey!43474 mapValue!43474))))

(declare-fun res!743390 () Bool)

(assert (=> start!97540 (=> (not res!743390) (not e!634861))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97540 (= res!743390 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35413 _keys!1208))))))

(assert (=> start!97540 e!634861))

(declare-fun array_inv!26812 (array!72449) Bool)

(assert (=> start!97540 (array_inv!26812 _keys!1208)))

(assert (=> start!97540 true))

(declare-fun e!634859 () Bool)

(declare-fun array_inv!26813 (array!72451) Bool)

(assert (=> start!97540 (and (array_inv!26813 _values!996) e!634859)))

(declare-fun b!1113769 () Bool)

(declare-fun res!743388 () Bool)

(assert (=> b!1113769 (=> (not res!743388) (not e!634861))))

(declare-datatypes ((List!24315 0))(
  ( (Nil!24312) (Cons!24311 (h!25520 (_ BitVec 64)) (t!34796 List!24315)) )
))
(declare-fun arrayNoDuplicates!0 (array!72449 (_ BitVec 32) List!24315) Bool)

(assert (=> b!1113769 (= res!743388 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24312))))

(declare-fun b!1113770 () Bool)

(declare-fun res!743389 () Bool)

(assert (=> b!1113770 (=> (not res!743389) (not e!634861))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113770 (= res!743389 (= (select (arr!34877 _keys!1208) i!673) k0!934))))

(declare-fun b!1113771 () Bool)

(declare-fun res!743385 () Bool)

(assert (=> b!1113771 (=> (not res!743385) (not e!634861))))

(assert (=> b!1113771 (= res!743385 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35413 _keys!1208))))))

(declare-fun b!1113772 () Bool)

(declare-fun e!634858 () Bool)

(declare-fun tp_is_empty!27771 () Bool)

(assert (=> b!1113772 (= e!634858 tp_is_empty!27771)))

(declare-fun b!1113773 () Bool)

(declare-fun res!743391 () Bool)

(assert (=> b!1113773 (=> (not res!743391) (not e!634861))))

(assert (=> b!1113773 (= res!743391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113774 () Bool)

(declare-fun res!743387 () Bool)

(assert (=> b!1113774 (=> (not res!743387) (not e!634861))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113774 (= res!743387 (and (= (size!35414 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35413 _keys!1208) (size!35414 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113775 () Bool)

(assert (=> b!1113775 (= e!634859 (and e!634858 mapRes!43474))))

(declare-fun condMapEmpty!43474 () Bool)

(declare-fun mapDefault!43474 () ValueCell!13176)

(assert (=> b!1113775 (= condMapEmpty!43474 (= (arr!34878 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13176)) mapDefault!43474)))))

(declare-fun b!1113776 () Bool)

(declare-fun res!743383 () Bool)

(assert (=> b!1113776 (=> (not res!743383) (not e!634863))))

(assert (=> b!1113776 (= res!743383 (arrayNoDuplicates!0 lt!496723 #b00000000000000000000000000000000 Nil!24312))))

(declare-fun b!1113777 () Bool)

(assert (=> b!1113777 (= e!634860 tp_is_empty!27771)))

(declare-fun b!1113778 () Bool)

(declare-fun res!743386 () Bool)

(assert (=> b!1113778 (=> (not res!743386) (not e!634861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113778 (= res!743386 (validMask!0 mask!1564))))

(declare-fun b!1113779 () Bool)

(assert (=> b!1113779 (= e!634863 (not true))))

(declare-fun arrayContainsKey!0 (array!72449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113779 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36550 0))(
  ( (Unit!36551) )
))
(declare-fun lt!496724 () Unit!36550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72449 (_ BitVec 64) (_ BitVec 32)) Unit!36550)

(assert (=> b!1113779 (= lt!496724 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113780 () Bool)

(declare-fun res!743384 () Bool)

(assert (=> b!1113780 (=> (not res!743384) (not e!634861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113780 (= res!743384 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43474 () Bool)

(assert (=> mapIsEmpty!43474 mapRes!43474))

(assert (= (and start!97540 res!743390) b!1113778))

(assert (= (and b!1113778 res!743386) b!1113774))

(assert (= (and b!1113774 res!743387) b!1113773))

(assert (= (and b!1113773 res!743391) b!1113769))

(assert (= (and b!1113769 res!743388) b!1113771))

(assert (= (and b!1113771 res!743385) b!1113780))

(assert (= (and b!1113780 res!743384) b!1113770))

(assert (= (and b!1113770 res!743389) b!1113768))

(assert (= (and b!1113768 res!743392) b!1113776))

(assert (= (and b!1113776 res!743383) b!1113779))

(assert (= (and b!1113775 condMapEmpty!43474) mapIsEmpty!43474))

(assert (= (and b!1113775 (not condMapEmpty!43474)) mapNonEmpty!43474))

(get-info :version)

(assert (= (and mapNonEmpty!43474 ((_ is ValueCellFull!13176) mapValue!43474)) b!1113777))

(assert (= (and b!1113775 ((_ is ValueCellFull!13176) mapDefault!43474)) b!1113772))

(assert (= start!97540 b!1113775))

(declare-fun m!1030867 () Bool)

(assert (=> b!1113779 m!1030867))

(declare-fun m!1030869 () Bool)

(assert (=> b!1113779 m!1030869))

(declare-fun m!1030871 () Bool)

(assert (=> b!1113778 m!1030871))

(declare-fun m!1030873 () Bool)

(assert (=> b!1113770 m!1030873))

(declare-fun m!1030875 () Bool)

(assert (=> b!1113769 m!1030875))

(declare-fun m!1030877 () Bool)

(assert (=> b!1113768 m!1030877))

(declare-fun m!1030879 () Bool)

(assert (=> b!1113768 m!1030879))

(declare-fun m!1030881 () Bool)

(assert (=> b!1113776 m!1030881))

(declare-fun m!1030883 () Bool)

(assert (=> b!1113773 m!1030883))

(declare-fun m!1030885 () Bool)

(assert (=> start!97540 m!1030885))

(declare-fun m!1030887 () Bool)

(assert (=> start!97540 m!1030887))

(declare-fun m!1030889 () Bool)

(assert (=> b!1113780 m!1030889))

(declare-fun m!1030891 () Bool)

(assert (=> mapNonEmpty!43474 m!1030891))

(check-sat (not b!1113769) tp_is_empty!27771 (not b!1113780) (not b!1113778) (not b!1113773) (not b!1113779) (not mapNonEmpty!43474) (not start!97540) (not b!1113768) (not b!1113776))
(check-sat)
