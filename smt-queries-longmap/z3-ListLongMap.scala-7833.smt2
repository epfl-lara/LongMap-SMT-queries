; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97978 () Bool)

(assert start!97978)

(declare-fun b_free!23443 () Bool)

(declare-fun b_next!23443 () Bool)

(assert (=> start!97978 (= b_free!23443 (not b_next!23443))))

(declare-fun tp!83032 () Bool)

(declare-fun b_and!37727 () Bool)

(assert (=> start!97978 (= tp!83032 b_and!37727)))

(declare-fun b!1119045 () Bool)

(declare-fun e!637547 () Bool)

(assert (=> b!1119045 (= e!637547 true)))

(declare-datatypes ((V!42425 0))(
  ( (V!42426 (val!14043 Int)) )
))
(declare-fun zeroValue!944 () V!42425)

(declare-datatypes ((array!72883 0))(
  ( (array!72884 (arr!35088 (Array (_ BitVec 32) (_ BitVec 64))) (size!35625 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72883)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17630 0))(
  ( (tuple2!17631 (_1!8826 (_ BitVec 64)) (_2!8826 V!42425)) )
))
(declare-datatypes ((List!24419 0))(
  ( (Nil!24416) (Cons!24415 (h!25633 tuple2!17630) (t!34892 List!24419)) )
))
(declare-datatypes ((ListLongMap!15607 0))(
  ( (ListLongMap!15608 (toList!7819 List!24419)) )
))
(declare-fun lt!497857 () ListLongMap!15607)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13277 0))(
  ( (ValueCellFull!13277 (v!16672 V!42425)) (EmptyCell!13277) )
))
(declare-datatypes ((array!72885 0))(
  ( (array!72886 (arr!35089 (Array (_ BitVec 32) ValueCell!13277)) (size!35626 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72885)

(declare-fun minValue!944 () V!42425)

(declare-fun getCurrentListMapNoExtraKeys!4349 (array!72883 array!72885 (_ BitVec 32) (_ BitVec 32) V!42425 V!42425 (_ BitVec 32) Int) ListLongMap!15607)

(assert (=> b!1119045 (= lt!497857 (getCurrentListMapNoExtraKeys!4349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119046 () Bool)

(declare-fun e!637545 () Bool)

(assert (=> b!1119046 (= e!637545 (not e!637547))))

(declare-fun res!746947 () Bool)

(assert (=> b!1119046 (=> res!746947 e!637547)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119046 (= res!746947 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119046 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36667 0))(
  ( (Unit!36668) )
))
(declare-fun lt!497856 () Unit!36667)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72883 (_ BitVec 64) (_ BitVec 32)) Unit!36667)

(assert (=> b!1119046 (= lt!497856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119047 () Bool)

(declare-fun res!746953 () Bool)

(declare-fun e!637546 () Bool)

(assert (=> b!1119047 (=> (not res!746953) (not e!637546))))

(declare-datatypes ((List!24420 0))(
  ( (Nil!24417) (Cons!24416 (h!25634 (_ BitVec 64)) (t!34893 List!24420)) )
))
(declare-fun arrayNoDuplicates!0 (array!72883 (_ BitVec 32) List!24420) Bool)

(assert (=> b!1119047 (= res!746953 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24417))))

(declare-fun b!1119048 () Bool)

(declare-fun res!746955 () Bool)

(assert (=> b!1119048 (=> (not res!746955) (not e!637546))))

(assert (=> b!1119048 (= res!746955 (= (select (arr!35088 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43777 () Bool)

(declare-fun mapRes!43777 () Bool)

(assert (=> mapIsEmpty!43777 mapRes!43777))

(declare-fun b!1119050 () Bool)

(assert (=> b!1119050 (= e!637546 e!637545)))

(declare-fun res!746952 () Bool)

(assert (=> b!1119050 (=> (not res!746952) (not e!637545))))

(declare-fun lt!497855 () array!72883)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72883 (_ BitVec 32)) Bool)

(assert (=> b!1119050 (= res!746952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497855 mask!1564))))

(assert (=> b!1119050 (= lt!497855 (array!72884 (store (arr!35088 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35625 _keys!1208)))))

(declare-fun b!1119051 () Bool)

(declare-fun res!746956 () Bool)

(assert (=> b!1119051 (=> (not res!746956) (not e!637546))))

(assert (=> b!1119051 (= res!746956 (and (= (size!35626 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35625 _keys!1208) (size!35626 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119052 () Bool)

(declare-fun res!746949 () Bool)

(assert (=> b!1119052 (=> (not res!746949) (not e!637546))))

(assert (=> b!1119052 (= res!746949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119053 () Bool)

(declare-fun res!746948 () Bool)

(assert (=> b!1119053 (=> (not res!746948) (not e!637545))))

(assert (=> b!1119053 (= res!746948 (arrayNoDuplicates!0 lt!497855 #b00000000000000000000000000000000 Nil!24417))))

(declare-fun mapNonEmpty!43777 () Bool)

(declare-fun tp!83033 () Bool)

(declare-fun e!637544 () Bool)

(assert (=> mapNonEmpty!43777 (= mapRes!43777 (and tp!83033 e!637544))))

(declare-fun mapKey!43777 () (_ BitVec 32))

(declare-fun mapRest!43777 () (Array (_ BitVec 32) ValueCell!13277))

(declare-fun mapValue!43777 () ValueCell!13277)

(assert (=> mapNonEmpty!43777 (= (arr!35089 _values!996) (store mapRest!43777 mapKey!43777 mapValue!43777))))

(declare-fun b!1119054 () Bool)

(declare-fun res!746951 () Bool)

(assert (=> b!1119054 (=> (not res!746951) (not e!637546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119054 (= res!746951 (validKeyInArray!0 k0!934))))

(declare-fun b!1119055 () Bool)

(declare-fun res!746954 () Bool)

(assert (=> b!1119055 (=> (not res!746954) (not e!637546))))

(assert (=> b!1119055 (= res!746954 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35625 _keys!1208))))))

(declare-fun b!1119056 () Bool)

(declare-fun res!746950 () Bool)

(assert (=> b!1119056 (=> (not res!746950) (not e!637546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119056 (= res!746950 (validMask!0 mask!1564))))

(declare-fun b!1119049 () Bool)

(declare-fun e!637548 () Bool)

(declare-fun e!637542 () Bool)

(assert (=> b!1119049 (= e!637548 (and e!637542 mapRes!43777))))

(declare-fun condMapEmpty!43777 () Bool)

(declare-fun mapDefault!43777 () ValueCell!13277)

(assert (=> b!1119049 (= condMapEmpty!43777 (= (arr!35089 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13277)) mapDefault!43777)))))

(declare-fun res!746946 () Bool)

(assert (=> start!97978 (=> (not res!746946) (not e!637546))))

(assert (=> start!97978 (= res!746946 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35625 _keys!1208))))))

(assert (=> start!97978 e!637546))

(declare-fun tp_is_empty!27973 () Bool)

(assert (=> start!97978 tp_is_empty!27973))

(declare-fun array_inv!27028 (array!72883) Bool)

(assert (=> start!97978 (array_inv!27028 _keys!1208)))

(assert (=> start!97978 true))

(assert (=> start!97978 tp!83032))

(declare-fun array_inv!27029 (array!72885) Bool)

(assert (=> start!97978 (and (array_inv!27029 _values!996) e!637548)))

(declare-fun b!1119057 () Bool)

(assert (=> b!1119057 (= e!637544 tp_is_empty!27973)))

(declare-fun b!1119058 () Bool)

(assert (=> b!1119058 (= e!637542 tp_is_empty!27973)))

(assert (= (and start!97978 res!746946) b!1119056))

(assert (= (and b!1119056 res!746950) b!1119051))

(assert (= (and b!1119051 res!746956) b!1119052))

(assert (= (and b!1119052 res!746949) b!1119047))

(assert (= (and b!1119047 res!746953) b!1119055))

(assert (= (and b!1119055 res!746954) b!1119054))

(assert (= (and b!1119054 res!746951) b!1119048))

(assert (= (and b!1119048 res!746955) b!1119050))

(assert (= (and b!1119050 res!746952) b!1119053))

(assert (= (and b!1119053 res!746948) b!1119046))

(assert (= (and b!1119046 (not res!746947)) b!1119045))

(assert (= (and b!1119049 condMapEmpty!43777) mapIsEmpty!43777))

(assert (= (and b!1119049 (not condMapEmpty!43777)) mapNonEmpty!43777))

(get-info :version)

(assert (= (and mapNonEmpty!43777 ((_ is ValueCellFull!13277) mapValue!43777)) b!1119057))

(assert (= (and b!1119049 ((_ is ValueCellFull!13277) mapDefault!43777)) b!1119058))

(assert (= start!97978 b!1119049))

(declare-fun m!1035171 () Bool)

(assert (=> b!1119046 m!1035171))

(declare-fun m!1035173 () Bool)

(assert (=> b!1119046 m!1035173))

(declare-fun m!1035175 () Bool)

(assert (=> b!1119048 m!1035175))

(declare-fun m!1035177 () Bool)

(assert (=> b!1119052 m!1035177))

(declare-fun m!1035179 () Bool)

(assert (=> b!1119050 m!1035179))

(declare-fun m!1035181 () Bool)

(assert (=> b!1119050 m!1035181))

(declare-fun m!1035183 () Bool)

(assert (=> b!1119047 m!1035183))

(declare-fun m!1035185 () Bool)

(assert (=> start!97978 m!1035185))

(declare-fun m!1035187 () Bool)

(assert (=> start!97978 m!1035187))

(declare-fun m!1035189 () Bool)

(assert (=> b!1119056 m!1035189))

(declare-fun m!1035191 () Bool)

(assert (=> mapNonEmpty!43777 m!1035191))

(declare-fun m!1035193 () Bool)

(assert (=> b!1119053 m!1035193))

(declare-fun m!1035195 () Bool)

(assert (=> b!1119045 m!1035195))

(declare-fun m!1035197 () Bool)

(assert (=> b!1119054 m!1035197))

(check-sat b_and!37727 (not start!97978) (not mapNonEmpty!43777) tp_is_empty!27973 (not b!1119045) (not b!1119052) (not b!1119046) (not b!1119047) (not b!1119056) (not b!1119050) (not b_next!23443) (not b!1119054) (not b!1119053))
(check-sat b_and!37727 (not b_next!23443))
