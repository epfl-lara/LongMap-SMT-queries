; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97654 () Bool)

(assert start!97654)

(declare-fun b!1115991 () Bool)

(declare-fun res!745102 () Bool)

(declare-fun e!635888 () Bool)

(assert (=> b!1115991 (=> (not res!745102) (not e!635888))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115991 (= res!745102 (validKeyInArray!0 k0!934))))

(declare-fun b!1115992 () Bool)

(declare-fun res!745100 () Bool)

(declare-fun e!635886 () Bool)

(assert (=> b!1115992 (=> (not res!745100) (not e!635886))))

(declare-datatypes ((array!72667 0))(
  ( (array!72668 (arr!34986 (Array (_ BitVec 32) (_ BitVec 64))) (size!35522 (_ BitVec 32))) )
))
(declare-fun lt!497066 () array!72667)

(declare-datatypes ((List!24358 0))(
  ( (Nil!24355) (Cons!24354 (h!25563 (_ BitVec 64)) (t!34839 List!24358)) )
))
(declare-fun arrayNoDuplicates!0 (array!72667 (_ BitVec 32) List!24358) Bool)

(assert (=> b!1115992 (= res!745100 (arrayNoDuplicates!0 lt!497066 #b00000000000000000000000000000000 Nil!24355))))

(declare-fun res!745098 () Bool)

(assert (=> start!97654 (=> (not res!745098) (not e!635888))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72667)

(assert (=> start!97654 (= res!745098 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35522 _keys!1208))))))

(assert (=> start!97654 e!635888))

(declare-fun array_inv!26892 (array!72667) Bool)

(assert (=> start!97654 (array_inv!26892 _keys!1208)))

(assert (=> start!97654 true))

(declare-datatypes ((V!42307 0))(
  ( (V!42308 (val!13999 Int)) )
))
(declare-datatypes ((ValueCell!13233 0))(
  ( (ValueCellFull!13233 (v!16632 V!42307)) (EmptyCell!13233) )
))
(declare-datatypes ((array!72669 0))(
  ( (array!72670 (arr!34987 (Array (_ BitVec 32) ValueCell!13233)) (size!35523 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72669)

(declare-fun e!635885 () Bool)

(declare-fun array_inv!26893 (array!72669) Bool)

(assert (=> start!97654 (and (array_inv!26893 _values!996) e!635885)))

(declare-fun b!1115993 () Bool)

(declare-fun res!745094 () Bool)

(assert (=> b!1115993 (=> (not res!745094) (not e!635888))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115993 (= res!745094 (= (select (arr!34986 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43645 () Bool)

(declare-fun mapRes!43645 () Bool)

(assert (=> mapIsEmpty!43645 mapRes!43645))

(declare-fun b!1115994 () Bool)

(assert (=> b!1115994 (= e!635886 (not true))))

(declare-fun arrayContainsKey!0 (array!72667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115994 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36628 0))(
  ( (Unit!36629) )
))
(declare-fun lt!497065 () Unit!36628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72667 (_ BitVec 64) (_ BitVec 32)) Unit!36628)

(assert (=> b!1115994 (= lt!497065 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115995 () Bool)

(declare-fun res!745099 () Bool)

(assert (=> b!1115995 (=> (not res!745099) (not e!635888))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72667 (_ BitVec 32)) Bool)

(assert (=> b!1115995 (= res!745099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43645 () Bool)

(declare-fun tp!82889 () Bool)

(declare-fun e!635884 () Bool)

(assert (=> mapNonEmpty!43645 (= mapRes!43645 (and tp!82889 e!635884))))

(declare-fun mapValue!43645 () ValueCell!13233)

(declare-fun mapRest!43645 () (Array (_ BitVec 32) ValueCell!13233))

(declare-fun mapKey!43645 () (_ BitVec 32))

(assert (=> mapNonEmpty!43645 (= (arr!34987 _values!996) (store mapRest!43645 mapKey!43645 mapValue!43645))))

(declare-fun b!1115996 () Bool)

(declare-fun e!635889 () Bool)

(declare-fun tp_is_empty!27885 () Bool)

(assert (=> b!1115996 (= e!635889 tp_is_empty!27885)))

(declare-fun b!1115997 () Bool)

(declare-fun res!745093 () Bool)

(assert (=> b!1115997 (=> (not res!745093) (not e!635888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115997 (= res!745093 (validMask!0 mask!1564))))

(declare-fun b!1115998 () Bool)

(declare-fun res!745097 () Bool)

(assert (=> b!1115998 (=> (not res!745097) (not e!635888))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115998 (= res!745097 (and (= (size!35523 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35522 _keys!1208) (size!35523 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115999 () Bool)

(declare-fun res!745101 () Bool)

(assert (=> b!1115999 (=> (not res!745101) (not e!635888))))

(assert (=> b!1115999 (= res!745101 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35522 _keys!1208))))))

(declare-fun b!1116000 () Bool)

(assert (=> b!1116000 (= e!635888 e!635886)))

(declare-fun res!745096 () Bool)

(assert (=> b!1116000 (=> (not res!745096) (not e!635886))))

(assert (=> b!1116000 (= res!745096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497066 mask!1564))))

(assert (=> b!1116000 (= lt!497066 (array!72668 (store (arr!34986 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35522 _keys!1208)))))

(declare-fun b!1116001 () Bool)

(declare-fun res!745095 () Bool)

(assert (=> b!1116001 (=> (not res!745095) (not e!635888))))

(assert (=> b!1116001 (= res!745095 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24355))))

(declare-fun b!1116002 () Bool)

(assert (=> b!1116002 (= e!635884 tp_is_empty!27885)))

(declare-fun b!1116003 () Bool)

(assert (=> b!1116003 (= e!635885 (and e!635889 mapRes!43645))))

(declare-fun condMapEmpty!43645 () Bool)

(declare-fun mapDefault!43645 () ValueCell!13233)

(assert (=> b!1116003 (= condMapEmpty!43645 (= (arr!34987 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13233)) mapDefault!43645)))))

(assert (= (and start!97654 res!745098) b!1115997))

(assert (= (and b!1115997 res!745093) b!1115998))

(assert (= (and b!1115998 res!745097) b!1115995))

(assert (= (and b!1115995 res!745099) b!1116001))

(assert (= (and b!1116001 res!745095) b!1115999))

(assert (= (and b!1115999 res!745101) b!1115991))

(assert (= (and b!1115991 res!745102) b!1115993))

(assert (= (and b!1115993 res!745094) b!1116000))

(assert (= (and b!1116000 res!745096) b!1115992))

(assert (= (and b!1115992 res!745100) b!1115994))

(assert (= (and b!1116003 condMapEmpty!43645) mapIsEmpty!43645))

(assert (= (and b!1116003 (not condMapEmpty!43645)) mapNonEmpty!43645))

(get-info :version)

(assert (= (and mapNonEmpty!43645 ((_ is ValueCellFull!13233) mapValue!43645)) b!1116002))

(assert (= (and b!1116003 ((_ is ValueCellFull!13233) mapDefault!43645)) b!1115996))

(assert (= start!97654 b!1116003))

(declare-fun m!1032349 () Bool)

(assert (=> b!1115993 m!1032349))

(declare-fun m!1032351 () Bool)

(assert (=> b!1116000 m!1032351))

(declare-fun m!1032353 () Bool)

(assert (=> b!1116000 m!1032353))

(declare-fun m!1032355 () Bool)

(assert (=> b!1115992 m!1032355))

(declare-fun m!1032357 () Bool)

(assert (=> b!1115994 m!1032357))

(declare-fun m!1032359 () Bool)

(assert (=> b!1115994 m!1032359))

(declare-fun m!1032361 () Bool)

(assert (=> mapNonEmpty!43645 m!1032361))

(declare-fun m!1032363 () Bool)

(assert (=> b!1116001 m!1032363))

(declare-fun m!1032365 () Bool)

(assert (=> b!1115997 m!1032365))

(declare-fun m!1032367 () Bool)

(assert (=> start!97654 m!1032367))

(declare-fun m!1032369 () Bool)

(assert (=> start!97654 m!1032369))

(declare-fun m!1032371 () Bool)

(assert (=> b!1115991 m!1032371))

(declare-fun m!1032373 () Bool)

(assert (=> b!1115995 m!1032373))

(check-sat (not b!1116001) (not b!1115991) (not start!97654) tp_is_empty!27885 (not b!1116000) (not b!1115995) (not b!1115994) (not b!1115992) (not b!1115997) (not mapNonEmpty!43645))
(check-sat)
