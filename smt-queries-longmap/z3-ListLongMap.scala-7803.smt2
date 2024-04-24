; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97798 () Bool)

(assert start!97798)

(declare-fun b!1115524 () Bool)

(declare-fun e!635912 () Bool)

(declare-fun e!635913 () Bool)

(declare-fun mapRes!43507 () Bool)

(assert (=> b!1115524 (= e!635912 (and e!635913 mapRes!43507))))

(declare-fun condMapEmpty!43507 () Bool)

(declare-datatypes ((V!42185 0))(
  ( (V!42186 (val!13953 Int)) )
))
(declare-datatypes ((ValueCell!13187 0))(
  ( (ValueCellFull!13187 (v!16582 V!42185)) (EmptyCell!13187) )
))
(declare-datatypes ((array!72527 0))(
  ( (array!72528 (arr!34910 (Array (_ BitVec 32) ValueCell!13187)) (size!35447 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72527)

(declare-fun mapDefault!43507 () ValueCell!13187)

(assert (=> b!1115524 (= condMapEmpty!43507 (= (arr!34910 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13187)) mapDefault!43507)))))

(declare-fun res!744238 () Bool)

(declare-fun e!635914 () Bool)

(assert (=> start!97798 (=> (not res!744238) (not e!635914))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72529 0))(
  ( (array!72530 (arr!34911 (Array (_ BitVec 32) (_ BitVec 64))) (size!35448 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72529)

(assert (=> start!97798 (= res!744238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35448 _keys!1208))))))

(assert (=> start!97798 e!635914))

(declare-fun array_inv!26902 (array!72529) Bool)

(assert (=> start!97798 (array_inv!26902 _keys!1208)))

(assert (=> start!97798 true))

(declare-fun array_inv!26903 (array!72527) Bool)

(assert (=> start!97798 (and (array_inv!26903 _values!996) e!635912)))

(declare-fun b!1115525 () Bool)

(declare-fun res!744235 () Bool)

(assert (=> b!1115525 (=> (not res!744235) (not e!635914))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115525 (= res!744235 (and (= (size!35447 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35448 _keys!1208) (size!35447 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115526 () Bool)

(declare-fun res!744240 () Bool)

(assert (=> b!1115526 (=> (not res!744240) (not e!635914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115526 (= res!744240 (validMask!0 mask!1564))))

(declare-fun b!1115527 () Bool)

(declare-fun e!635915 () Bool)

(assert (=> b!1115527 (= e!635914 e!635915)))

(declare-fun res!744239 () Bool)

(assert (=> b!1115527 (=> (not res!744239) (not e!635915))))

(declare-fun lt!497304 () array!72529)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72529 (_ BitVec 32)) Bool)

(assert (=> b!1115527 (= res!744239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497304 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115527 (= lt!497304 (array!72530 (store (arr!34911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35448 _keys!1208)))))

(declare-fun b!1115528 () Bool)

(declare-fun res!744241 () Bool)

(assert (=> b!1115528 (=> (not res!744241) (not e!635914))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115528 (= res!744241 (validKeyInArray!0 k0!934))))

(declare-fun b!1115529 () Bool)

(declare-fun tp_is_empty!27793 () Bool)

(assert (=> b!1115529 (= e!635913 tp_is_empty!27793)))

(declare-fun b!1115530 () Bool)

(declare-fun res!744237 () Bool)

(assert (=> b!1115530 (=> (not res!744237) (not e!635914))))

(declare-datatypes ((List!24340 0))(
  ( (Nil!24337) (Cons!24336 (h!25554 (_ BitVec 64)) (t!34813 List!24340)) )
))
(declare-fun arrayNoDuplicates!0 (array!72529 (_ BitVec 32) List!24340) Bool)

(assert (=> b!1115530 (= res!744237 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24337))))

(declare-fun b!1115531 () Bool)

(declare-fun e!635916 () Bool)

(assert (=> b!1115531 (= e!635916 tp_is_empty!27793)))

(declare-fun b!1115532 () Bool)

(declare-fun res!744244 () Bool)

(assert (=> b!1115532 (=> (not res!744244) (not e!635914))))

(assert (=> b!1115532 (= res!744244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115533 () Bool)

(assert (=> b!1115533 (= e!635915 (not true))))

(declare-fun arrayContainsKey!0 (array!72529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115533 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36539 0))(
  ( (Unit!36540) )
))
(declare-fun lt!497305 () Unit!36539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72529 (_ BitVec 64) (_ BitVec 32)) Unit!36539)

(assert (=> b!1115533 (= lt!497305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115534 () Bool)

(declare-fun res!744236 () Bool)

(assert (=> b!1115534 (=> (not res!744236) (not e!635914))))

(assert (=> b!1115534 (= res!744236 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35448 _keys!1208))))))

(declare-fun mapIsEmpty!43507 () Bool)

(assert (=> mapIsEmpty!43507 mapRes!43507))

(declare-fun b!1115535 () Bool)

(declare-fun res!744242 () Bool)

(assert (=> b!1115535 (=> (not res!744242) (not e!635914))))

(assert (=> b!1115535 (= res!744242 (= (select (arr!34911 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43507 () Bool)

(declare-fun tp!82751 () Bool)

(assert (=> mapNonEmpty!43507 (= mapRes!43507 (and tp!82751 e!635916))))

(declare-fun mapValue!43507 () ValueCell!13187)

(declare-fun mapRest!43507 () (Array (_ BitVec 32) ValueCell!13187))

(declare-fun mapKey!43507 () (_ BitVec 32))

(assert (=> mapNonEmpty!43507 (= (arr!34910 _values!996) (store mapRest!43507 mapKey!43507 mapValue!43507))))

(declare-fun b!1115536 () Bool)

(declare-fun res!744243 () Bool)

(assert (=> b!1115536 (=> (not res!744243) (not e!635915))))

(assert (=> b!1115536 (= res!744243 (arrayNoDuplicates!0 lt!497304 #b00000000000000000000000000000000 Nil!24337))))

(assert (= (and start!97798 res!744238) b!1115526))

(assert (= (and b!1115526 res!744240) b!1115525))

(assert (= (and b!1115525 res!744235) b!1115532))

(assert (= (and b!1115532 res!744244) b!1115530))

(assert (= (and b!1115530 res!744237) b!1115534))

(assert (= (and b!1115534 res!744236) b!1115528))

(assert (= (and b!1115528 res!744241) b!1115535))

(assert (= (and b!1115535 res!744242) b!1115527))

(assert (= (and b!1115527 res!744239) b!1115536))

(assert (= (and b!1115536 res!744243) b!1115533))

(assert (= (and b!1115524 condMapEmpty!43507) mapIsEmpty!43507))

(assert (= (and b!1115524 (not condMapEmpty!43507)) mapNonEmpty!43507))

(get-info :version)

(assert (= (and mapNonEmpty!43507 ((_ is ValueCellFull!13187) mapValue!43507)) b!1115531))

(assert (= (and b!1115524 ((_ is ValueCellFull!13187) mapDefault!43507)) b!1115529))

(assert (= start!97798 b!1115524))

(declare-fun m!1032825 () Bool)

(assert (=> b!1115532 m!1032825))

(declare-fun m!1032827 () Bool)

(assert (=> b!1115530 m!1032827))

(declare-fun m!1032829 () Bool)

(assert (=> b!1115527 m!1032829))

(declare-fun m!1032831 () Bool)

(assert (=> b!1115527 m!1032831))

(declare-fun m!1032833 () Bool)

(assert (=> b!1115535 m!1032833))

(declare-fun m!1032835 () Bool)

(assert (=> start!97798 m!1032835))

(declare-fun m!1032837 () Bool)

(assert (=> start!97798 m!1032837))

(declare-fun m!1032839 () Bool)

(assert (=> b!1115536 m!1032839))

(declare-fun m!1032841 () Bool)

(assert (=> b!1115533 m!1032841))

(declare-fun m!1032843 () Bool)

(assert (=> b!1115533 m!1032843))

(declare-fun m!1032845 () Bool)

(assert (=> b!1115528 m!1032845))

(declare-fun m!1032847 () Bool)

(assert (=> b!1115526 m!1032847))

(declare-fun m!1032849 () Bool)

(assert (=> mapNonEmpty!43507 m!1032849))

(check-sat (not start!97798) (not b!1115528) (not b!1115526) (not mapNonEmpty!43507) (not b!1115530) (not b!1115536) (not b!1115527) (not b!1115532) (not b!1115533) tp_is_empty!27793)
(check-sat)
