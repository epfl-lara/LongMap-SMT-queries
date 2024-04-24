; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97780 () Bool)

(assert start!97780)

(declare-fun b!1115173 () Bool)

(declare-fun res!743969 () Bool)

(declare-fun e!635753 () Bool)

(assert (=> b!1115173 (=> (not res!743969) (not e!635753))))

(declare-datatypes ((array!72491 0))(
  ( (array!72492 (arr!34892 (Array (_ BitVec 32) (_ BitVec 64))) (size!35429 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72491)

(declare-datatypes ((List!24335 0))(
  ( (Nil!24332) (Cons!24331 (h!25549 (_ BitVec 64)) (t!34808 List!24335)) )
))
(declare-fun arrayNoDuplicates!0 (array!72491 (_ BitVec 32) List!24335) Bool)

(assert (=> b!1115173 (= res!743969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24332))))

(declare-fun b!1115174 () Bool)

(declare-fun e!635754 () Bool)

(assert (=> b!1115174 (= e!635753 e!635754)))

(declare-fun res!743973 () Bool)

(assert (=> b!1115174 (=> (not res!743973) (not e!635754))))

(declare-fun lt!497250 () array!72491)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72491 (_ BitVec 32)) Bool)

(assert (=> b!1115174 (= res!743973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497250 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115174 (= lt!497250 (array!72492 (store (arr!34892 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35429 _keys!1208)))))

(declare-fun b!1115175 () Bool)

(declare-fun res!743970 () Bool)

(assert (=> b!1115175 (=> (not res!743970) (not e!635753))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115175 (= res!743970 (validKeyInArray!0 k0!934))))

(declare-fun res!743971 () Bool)

(assert (=> start!97780 (=> (not res!743971) (not e!635753))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97780 (= res!743971 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35429 _keys!1208))))))

(assert (=> start!97780 e!635753))

(declare-fun array_inv!26886 (array!72491) Bool)

(assert (=> start!97780 (array_inv!26886 _keys!1208)))

(assert (=> start!97780 true))

(declare-datatypes ((V!42161 0))(
  ( (V!42162 (val!13944 Int)) )
))
(declare-datatypes ((ValueCell!13178 0))(
  ( (ValueCellFull!13178 (v!16573 V!42161)) (EmptyCell!13178) )
))
(declare-datatypes ((array!72493 0))(
  ( (array!72494 (arr!34893 (Array (_ BitVec 32) ValueCell!13178)) (size!35430 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72493)

(declare-fun e!635750 () Bool)

(declare-fun array_inv!26887 (array!72493) Bool)

(assert (=> start!97780 (and (array_inv!26887 _values!996) e!635750)))

(declare-fun b!1115176 () Bool)

(declare-fun e!635752 () Bool)

(declare-fun mapRes!43480 () Bool)

(assert (=> b!1115176 (= e!635750 (and e!635752 mapRes!43480))))

(declare-fun condMapEmpty!43480 () Bool)

(declare-fun mapDefault!43480 () ValueCell!13178)

(assert (=> b!1115176 (= condMapEmpty!43480 (= (arr!34893 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13178)) mapDefault!43480)))))

(declare-fun b!1115177 () Bool)

(assert (=> b!1115177 (= e!635754 (not true))))

(declare-fun arrayContainsKey!0 (array!72491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115177 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36529 0))(
  ( (Unit!36530) )
))
(declare-fun lt!497251 () Unit!36529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72491 (_ BitVec 64) (_ BitVec 32)) Unit!36529)

(assert (=> b!1115177 (= lt!497251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115178 () Bool)

(declare-fun res!743974 () Bool)

(assert (=> b!1115178 (=> (not res!743974) (not e!635753))))

(assert (=> b!1115178 (= res!743974 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35429 _keys!1208))))))

(declare-fun b!1115179 () Bool)

(declare-fun res!743965 () Bool)

(assert (=> b!1115179 (=> (not res!743965) (not e!635753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115179 (= res!743965 (validMask!0 mask!1564))))

(declare-fun b!1115180 () Bool)

(declare-fun res!743967 () Bool)

(assert (=> b!1115180 (=> (not res!743967) (not e!635753))))

(assert (=> b!1115180 (= res!743967 (= (select (arr!34892 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43480 () Bool)

(assert (=> mapIsEmpty!43480 mapRes!43480))

(declare-fun b!1115181 () Bool)

(declare-fun res!743966 () Bool)

(assert (=> b!1115181 (=> (not res!743966) (not e!635753))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115181 (= res!743966 (and (= (size!35430 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35429 _keys!1208) (size!35430 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115182 () Bool)

(declare-fun tp_is_empty!27775 () Bool)

(assert (=> b!1115182 (= e!635752 tp_is_empty!27775)))

(declare-fun mapNonEmpty!43480 () Bool)

(declare-fun tp!82724 () Bool)

(declare-fun e!635749 () Bool)

(assert (=> mapNonEmpty!43480 (= mapRes!43480 (and tp!82724 e!635749))))

(declare-fun mapValue!43480 () ValueCell!13178)

(declare-fun mapKey!43480 () (_ BitVec 32))

(declare-fun mapRest!43480 () (Array (_ BitVec 32) ValueCell!13178))

(assert (=> mapNonEmpty!43480 (= (arr!34893 _values!996) (store mapRest!43480 mapKey!43480 mapValue!43480))))

(declare-fun b!1115183 () Bool)

(assert (=> b!1115183 (= e!635749 tp_is_empty!27775)))

(declare-fun b!1115184 () Bool)

(declare-fun res!743972 () Bool)

(assert (=> b!1115184 (=> (not res!743972) (not e!635754))))

(assert (=> b!1115184 (= res!743972 (arrayNoDuplicates!0 lt!497250 #b00000000000000000000000000000000 Nil!24332))))

(declare-fun b!1115185 () Bool)

(declare-fun res!743968 () Bool)

(assert (=> b!1115185 (=> (not res!743968) (not e!635753))))

(assert (=> b!1115185 (= res!743968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97780 res!743971) b!1115179))

(assert (= (and b!1115179 res!743965) b!1115181))

(assert (= (and b!1115181 res!743966) b!1115185))

(assert (= (and b!1115185 res!743968) b!1115173))

(assert (= (and b!1115173 res!743969) b!1115178))

(assert (= (and b!1115178 res!743974) b!1115175))

(assert (= (and b!1115175 res!743970) b!1115180))

(assert (= (and b!1115180 res!743967) b!1115174))

(assert (= (and b!1115174 res!743973) b!1115184))

(assert (= (and b!1115184 res!743972) b!1115177))

(assert (= (and b!1115176 condMapEmpty!43480) mapIsEmpty!43480))

(assert (= (and b!1115176 (not condMapEmpty!43480)) mapNonEmpty!43480))

(get-info :version)

(assert (= (and mapNonEmpty!43480 ((_ is ValueCellFull!13178) mapValue!43480)) b!1115183))

(assert (= (and b!1115176 ((_ is ValueCellFull!13178) mapDefault!43480)) b!1115182))

(assert (= start!97780 b!1115176))

(declare-fun m!1032591 () Bool)

(assert (=> start!97780 m!1032591))

(declare-fun m!1032593 () Bool)

(assert (=> start!97780 m!1032593))

(declare-fun m!1032595 () Bool)

(assert (=> b!1115180 m!1032595))

(declare-fun m!1032597 () Bool)

(assert (=> mapNonEmpty!43480 m!1032597))

(declare-fun m!1032599 () Bool)

(assert (=> b!1115185 m!1032599))

(declare-fun m!1032601 () Bool)

(assert (=> b!1115173 m!1032601))

(declare-fun m!1032603 () Bool)

(assert (=> b!1115177 m!1032603))

(declare-fun m!1032605 () Bool)

(assert (=> b!1115177 m!1032605))

(declare-fun m!1032607 () Bool)

(assert (=> b!1115174 m!1032607))

(declare-fun m!1032609 () Bool)

(assert (=> b!1115174 m!1032609))

(declare-fun m!1032611 () Bool)

(assert (=> b!1115179 m!1032611))

(declare-fun m!1032613 () Bool)

(assert (=> b!1115184 m!1032613))

(declare-fun m!1032615 () Bool)

(assert (=> b!1115175 m!1032615))

(check-sat (not b!1115184) (not b!1115179) (not b!1115177) (not b!1115175) (not b!1115185) (not b!1115173) tp_is_empty!27775 (not start!97780) (not b!1115174) (not mapNonEmpty!43480))
(check-sat)
