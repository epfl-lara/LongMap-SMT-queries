; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97586 () Bool)

(assert start!97586)

(declare-fun b!1114653 () Bool)

(declare-fun res!744095 () Bool)

(declare-fun e!635249 () Bool)

(assert (=> b!1114653 (=> (not res!744095) (not e!635249))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114653 (= res!744095 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43552 () Bool)

(declare-fun mapRes!43552 () Bool)

(assert (=> mapIsEmpty!43552 mapRes!43552))

(declare-fun b!1114654 () Bool)

(declare-fun res!744096 () Bool)

(assert (=> b!1114654 (=> (not res!744096) (not e!635249))))

(declare-datatypes ((array!72450 0))(
  ( (array!72451 (arr!34878 (Array (_ BitVec 32) (_ BitVec 64))) (size!35416 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72450)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114654 (= res!744096 (= (select (arr!34878 _keys!1208) i!673) k0!934))))

(declare-fun b!1114655 () Bool)

(declare-fun res!744102 () Bool)

(assert (=> b!1114655 (=> (not res!744102) (not e!635249))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42225 0))(
  ( (V!42226 (val!13968 Int)) )
))
(declare-datatypes ((ValueCell!13202 0))(
  ( (ValueCellFull!13202 (v!16600 V!42225)) (EmptyCell!13202) )
))
(declare-datatypes ((array!72452 0))(
  ( (array!72453 (arr!34879 (Array (_ BitVec 32) ValueCell!13202)) (size!35417 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72452)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1114655 (= res!744102 (and (= (size!35417 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35416 _keys!1208) (size!35417 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43552 () Bool)

(declare-fun tp!82796 () Bool)

(declare-fun e!635245 () Bool)

(assert (=> mapNonEmpty!43552 (= mapRes!43552 (and tp!82796 e!635245))))

(declare-fun mapKey!43552 () (_ BitVec 32))

(declare-fun mapRest!43552 () (Array (_ BitVec 32) ValueCell!13202))

(declare-fun mapValue!43552 () ValueCell!13202)

(assert (=> mapNonEmpty!43552 (= (arr!34879 _values!996) (store mapRest!43552 mapKey!43552 mapValue!43552))))

(declare-fun b!1114657 () Bool)

(declare-fun e!635246 () Bool)

(declare-fun e!635247 () Bool)

(assert (=> b!1114657 (= e!635246 (and e!635247 mapRes!43552))))

(declare-fun condMapEmpty!43552 () Bool)

(declare-fun mapDefault!43552 () ValueCell!13202)

(assert (=> b!1114657 (= condMapEmpty!43552 (= (arr!34879 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13202)) mapDefault!43552)))))

(declare-fun b!1114658 () Bool)

(declare-fun res!744098 () Bool)

(assert (=> b!1114658 (=> (not res!744098) (not e!635249))))

(assert (=> b!1114658 (= res!744098 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35416 _keys!1208))))))

(declare-fun b!1114659 () Bool)

(declare-fun tp_is_empty!27823 () Bool)

(assert (=> b!1114659 (= e!635245 tp_is_empty!27823)))

(declare-fun b!1114660 () Bool)

(assert (=> b!1114660 (= e!635247 tp_is_empty!27823)))

(declare-fun b!1114661 () Bool)

(declare-fun res!744099 () Bool)

(assert (=> b!1114661 (=> (not res!744099) (not e!635249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114661 (= res!744099 (validMask!0 mask!1564))))

(declare-fun res!744094 () Bool)

(assert (=> start!97586 (=> (not res!744094) (not e!635249))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97586 (= res!744094 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35416 _keys!1208))))))

(assert (=> start!97586 e!635249))

(declare-fun array_inv!26884 (array!72450) Bool)

(assert (=> start!97586 (array_inv!26884 _keys!1208)))

(assert (=> start!97586 true))

(declare-fun array_inv!26885 (array!72452) Bool)

(assert (=> start!97586 (and (array_inv!26885 _values!996) e!635246)))

(declare-fun b!1114656 () Bool)

(declare-fun e!635250 () Bool)

(assert (=> b!1114656 (= e!635250 (not true))))

(declare-fun arrayContainsKey!0 (array!72450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114656 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36407 0))(
  ( (Unit!36408) )
))
(declare-fun lt!496679 () Unit!36407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72450 (_ BitVec 64) (_ BitVec 32)) Unit!36407)

(assert (=> b!1114656 (= lt!496679 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114662 () Bool)

(declare-fun res!744101 () Bool)

(assert (=> b!1114662 (=> (not res!744101) (not e!635249))))

(declare-datatypes ((List!24369 0))(
  ( (Nil!24366) (Cons!24365 (h!25574 (_ BitVec 64)) (t!34841 List!24369)) )
))
(declare-fun arrayNoDuplicates!0 (array!72450 (_ BitVec 32) List!24369) Bool)

(assert (=> b!1114662 (= res!744101 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24366))))

(declare-fun b!1114663 () Bool)

(declare-fun res!744103 () Bool)

(assert (=> b!1114663 (=> (not res!744103) (not e!635249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72450 (_ BitVec 32)) Bool)

(assert (=> b!1114663 (= res!744103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114664 () Bool)

(assert (=> b!1114664 (= e!635249 e!635250)))

(declare-fun res!744097 () Bool)

(assert (=> b!1114664 (=> (not res!744097) (not e!635250))))

(declare-fun lt!496680 () array!72450)

(assert (=> b!1114664 (= res!744097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496680 mask!1564))))

(assert (=> b!1114664 (= lt!496680 (array!72451 (store (arr!34878 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35416 _keys!1208)))))

(declare-fun b!1114665 () Bool)

(declare-fun res!744100 () Bool)

(assert (=> b!1114665 (=> (not res!744100) (not e!635250))))

(assert (=> b!1114665 (= res!744100 (arrayNoDuplicates!0 lt!496680 #b00000000000000000000000000000000 Nil!24366))))

(assert (= (and start!97586 res!744094) b!1114661))

(assert (= (and b!1114661 res!744099) b!1114655))

(assert (= (and b!1114655 res!744102) b!1114663))

(assert (= (and b!1114663 res!744103) b!1114662))

(assert (= (and b!1114662 res!744101) b!1114658))

(assert (= (and b!1114658 res!744098) b!1114653))

(assert (= (and b!1114653 res!744095) b!1114654))

(assert (= (and b!1114654 res!744096) b!1114664))

(assert (= (and b!1114664 res!744097) b!1114665))

(assert (= (and b!1114665 res!744100) b!1114656))

(assert (= (and b!1114657 condMapEmpty!43552) mapIsEmpty!43552))

(assert (= (and b!1114657 (not condMapEmpty!43552)) mapNonEmpty!43552))

(get-info :version)

(assert (= (and mapNonEmpty!43552 ((_ is ValueCellFull!13202) mapValue!43552)) b!1114659))

(assert (= (and b!1114657 ((_ is ValueCellFull!13202) mapDefault!43552)) b!1114660))

(assert (= start!97586 b!1114657))

(declare-fun m!1030917 () Bool)

(assert (=> b!1114656 m!1030917))

(declare-fun m!1030919 () Bool)

(assert (=> b!1114656 m!1030919))

(declare-fun m!1030921 () Bool)

(assert (=> b!1114663 m!1030921))

(declare-fun m!1030923 () Bool)

(assert (=> start!97586 m!1030923))

(declare-fun m!1030925 () Bool)

(assert (=> start!97586 m!1030925))

(declare-fun m!1030927 () Bool)

(assert (=> b!1114662 m!1030927))

(declare-fun m!1030929 () Bool)

(assert (=> b!1114665 m!1030929))

(declare-fun m!1030931 () Bool)

(assert (=> mapNonEmpty!43552 m!1030931))

(declare-fun m!1030933 () Bool)

(assert (=> b!1114654 m!1030933))

(declare-fun m!1030935 () Bool)

(assert (=> b!1114664 m!1030935))

(declare-fun m!1030937 () Bool)

(assert (=> b!1114664 m!1030937))

(declare-fun m!1030939 () Bool)

(assert (=> b!1114653 m!1030939))

(declare-fun m!1030941 () Bool)

(assert (=> b!1114661 m!1030941))

(check-sat (not start!97586) (not b!1114661) (not b!1114664) (not mapNonEmpty!43552) (not b!1114665) (not b!1114653) (not b!1114662) (not b!1114663) tp_is_empty!27823 (not b!1114656))
(check-sat)
