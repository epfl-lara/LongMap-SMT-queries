; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97708 () Bool)

(assert start!97708)

(declare-fun b!1113769 () Bool)

(declare-fun res!742887 () Bool)

(declare-fun e!635103 () Bool)

(assert (=> b!1113769 (=> (not res!742887) (not e!635103))))

(declare-datatypes ((array!72357 0))(
  ( (array!72358 (arr!34825 (Array (_ BitVec 32) (_ BitVec 64))) (size!35362 (_ BitVec 32))) )
))
(declare-fun lt!497035 () array!72357)

(declare-datatypes ((List!24309 0))(
  ( (Nil!24306) (Cons!24305 (h!25523 (_ BitVec 64)) (t!34782 List!24309)) )
))
(declare-fun arrayNoDuplicates!0 (array!72357 (_ BitVec 32) List!24309) Bool)

(assert (=> b!1113769 (= res!742887 (arrayNoDuplicates!0 lt!497035 #b00000000000000000000000000000000 Nil!24306))))

(declare-fun b!1113770 () Bool)

(declare-fun e!635102 () Bool)

(declare-fun tp_is_empty!27703 () Bool)

(assert (=> b!1113770 (= e!635102 tp_is_empty!27703)))

(declare-fun b!1113771 () Bool)

(declare-fun res!742893 () Bool)

(declare-fun e!635104 () Bool)

(assert (=> b!1113771 (=> (not res!742893) (not e!635104))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72357)

(assert (=> b!1113771 (= res!742893 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35362 _keys!1208))))))

(declare-fun b!1113772 () Bool)

(declare-fun res!742892 () Bool)

(assert (=> b!1113772 (=> (not res!742892) (not e!635104))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42065 0))(
  ( (V!42066 (val!13908 Int)) )
))
(declare-datatypes ((ValueCell!13142 0))(
  ( (ValueCellFull!13142 (v!16537 V!42065)) (EmptyCell!13142) )
))
(declare-datatypes ((array!72359 0))(
  ( (array!72360 (arr!34826 (Array (_ BitVec 32) ValueCell!13142)) (size!35363 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72359)

(assert (=> b!1113772 (= res!742892 (and (= (size!35363 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35362 _keys!1208) (size!35363 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43372 () Bool)

(declare-fun mapRes!43372 () Bool)

(assert (=> mapIsEmpty!43372 mapRes!43372))

(declare-fun b!1113773 () Bool)

(declare-fun res!742886 () Bool)

(assert (=> b!1113773 (=> (not res!742886) (not e!635104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72357 (_ BitVec 32)) Bool)

(assert (=> b!1113773 (= res!742886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113774 () Bool)

(assert (=> b!1113774 (= e!635104 e!635103)))

(declare-fun res!742885 () Bool)

(assert (=> b!1113774 (=> (not res!742885) (not e!635103))))

(assert (=> b!1113774 (= res!742885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497035 mask!1564))))

(assert (=> b!1113774 (= lt!497035 (array!72358 (store (arr!34825 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35362 _keys!1208)))))

(declare-fun b!1113775 () Bool)

(declare-fun res!742890 () Bool)

(assert (=> b!1113775 (=> (not res!742890) (not e!635104))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113775 (= res!742890 (validKeyInArray!0 k0!934))))

(declare-fun b!1113776 () Bool)

(declare-fun res!742891 () Bool)

(assert (=> b!1113776 (=> (not res!742891) (not e!635104))))

(assert (=> b!1113776 (= res!742891 (= (select (arr!34825 _keys!1208) i!673) k0!934))))

(declare-fun b!1113777 () Bool)

(declare-fun e!635105 () Bool)

(declare-fun e!635101 () Bool)

(assert (=> b!1113777 (= e!635105 (and e!635101 mapRes!43372))))

(declare-fun condMapEmpty!43372 () Bool)

(declare-fun mapDefault!43372 () ValueCell!13142)

(assert (=> b!1113777 (= condMapEmpty!43372 (= (arr!34826 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13142)) mapDefault!43372)))))

(declare-fun b!1113778 () Bool)

(declare-fun res!742888 () Bool)

(assert (=> b!1113778 (=> (not res!742888) (not e!635104))))

(assert (=> b!1113778 (= res!742888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24306))))

(declare-fun b!1113779 () Bool)

(assert (=> b!1113779 (= e!635103 (not true))))

(declare-fun arrayContainsKey!0 (array!72357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113779 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36487 0))(
  ( (Unit!36488) )
))
(declare-fun lt!497034 () Unit!36487)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72357 (_ BitVec 64) (_ BitVec 32)) Unit!36487)

(assert (=> b!1113779 (= lt!497034 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113780 () Bool)

(declare-fun res!742894 () Bool)

(assert (=> b!1113780 (=> (not res!742894) (not e!635104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113780 (= res!742894 (validMask!0 mask!1564))))

(declare-fun b!1113781 () Bool)

(assert (=> b!1113781 (= e!635101 tp_is_empty!27703)))

(declare-fun res!742889 () Bool)

(assert (=> start!97708 (=> (not res!742889) (not e!635104))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97708 (= res!742889 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35362 _keys!1208))))))

(assert (=> start!97708 e!635104))

(declare-fun array_inv!26834 (array!72357) Bool)

(assert (=> start!97708 (array_inv!26834 _keys!1208)))

(assert (=> start!97708 true))

(declare-fun array_inv!26835 (array!72359) Bool)

(assert (=> start!97708 (and (array_inv!26835 _values!996) e!635105)))

(declare-fun mapNonEmpty!43372 () Bool)

(declare-fun tp!82616 () Bool)

(assert (=> mapNonEmpty!43372 (= mapRes!43372 (and tp!82616 e!635102))))

(declare-fun mapKey!43372 () (_ BitVec 32))

(declare-fun mapValue!43372 () ValueCell!13142)

(declare-fun mapRest!43372 () (Array (_ BitVec 32) ValueCell!13142))

(assert (=> mapNonEmpty!43372 (= (arr!34826 _values!996) (store mapRest!43372 mapKey!43372 mapValue!43372))))

(assert (= (and start!97708 res!742889) b!1113780))

(assert (= (and b!1113780 res!742894) b!1113772))

(assert (= (and b!1113772 res!742892) b!1113773))

(assert (= (and b!1113773 res!742886) b!1113778))

(assert (= (and b!1113778 res!742888) b!1113771))

(assert (= (and b!1113771 res!742893) b!1113775))

(assert (= (and b!1113775 res!742890) b!1113776))

(assert (= (and b!1113776 res!742891) b!1113774))

(assert (= (and b!1113774 res!742885) b!1113769))

(assert (= (and b!1113769 res!742887) b!1113779))

(assert (= (and b!1113777 condMapEmpty!43372) mapIsEmpty!43372))

(assert (= (and b!1113777 (not condMapEmpty!43372)) mapNonEmpty!43372))

(get-info :version)

(assert (= (and mapNonEmpty!43372 ((_ is ValueCellFull!13142) mapValue!43372)) b!1113770))

(assert (= (and b!1113777 ((_ is ValueCellFull!13142) mapDefault!43372)) b!1113781))

(assert (= start!97708 b!1113777))

(declare-fun m!1031655 () Bool)

(assert (=> b!1113778 m!1031655))

(declare-fun m!1031657 () Bool)

(assert (=> b!1113773 m!1031657))

(declare-fun m!1031659 () Bool)

(assert (=> start!97708 m!1031659))

(declare-fun m!1031661 () Bool)

(assert (=> start!97708 m!1031661))

(declare-fun m!1031663 () Bool)

(assert (=> b!1113769 m!1031663))

(declare-fun m!1031665 () Bool)

(assert (=> b!1113779 m!1031665))

(declare-fun m!1031667 () Bool)

(assert (=> b!1113779 m!1031667))

(declare-fun m!1031669 () Bool)

(assert (=> b!1113780 m!1031669))

(declare-fun m!1031671 () Bool)

(assert (=> b!1113775 m!1031671))

(declare-fun m!1031673 () Bool)

(assert (=> b!1113774 m!1031673))

(declare-fun m!1031675 () Bool)

(assert (=> b!1113774 m!1031675))

(declare-fun m!1031677 () Bool)

(assert (=> b!1113776 m!1031677))

(declare-fun m!1031679 () Bool)

(assert (=> mapNonEmpty!43372 m!1031679))

(check-sat tp_is_empty!27703 (not b!1113780) (not b!1113769) (not start!97708) (not b!1113773) (not mapNonEmpty!43372) (not b!1113779) (not b!1113778) (not b!1113775) (not b!1113774))
(check-sat)
