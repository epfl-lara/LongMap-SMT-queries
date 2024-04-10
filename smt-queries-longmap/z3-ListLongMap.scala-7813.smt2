; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97624 () Bool)

(assert start!97624)

(declare-fun b!1115406 () Bool)

(declare-fun res!744644 () Bool)

(declare-fun e!635616 () Bool)

(assert (=> b!1115406 (=> (not res!744644) (not e!635616))))

(declare-datatypes ((array!72611 0))(
  ( (array!72612 (arr!34958 (Array (_ BitVec 32) (_ BitVec 64))) (size!35494 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72611)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72611 (_ BitVec 32)) Bool)

(assert (=> b!1115406 (= res!744644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115407 () Bool)

(declare-fun e!635615 () Bool)

(assert (=> b!1115407 (= e!635615 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115407 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36610 0))(
  ( (Unit!36611) )
))
(declare-fun lt!496975 () Unit!36610)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72611 (_ BitVec 64) (_ BitVec 32)) Unit!36610)

(assert (=> b!1115407 (= lt!496975 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115408 () Bool)

(declare-fun res!744645 () Bool)

(assert (=> b!1115408 (=> (not res!744645) (not e!635616))))

(declare-datatypes ((List!24347 0))(
  ( (Nil!24344) (Cons!24343 (h!25552 (_ BitVec 64)) (t!34828 List!24347)) )
))
(declare-fun arrayNoDuplicates!0 (array!72611 (_ BitVec 32) List!24347) Bool)

(assert (=> b!1115408 (= res!744645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24344))))

(declare-fun b!1115409 () Bool)

(declare-fun e!635614 () Bool)

(declare-fun tp_is_empty!27855 () Bool)

(assert (=> b!1115409 (= e!635614 tp_is_empty!27855)))

(declare-fun b!1115410 () Bool)

(declare-fun e!635619 () Bool)

(assert (=> b!1115410 (= e!635619 tp_is_empty!27855)))

(declare-fun b!1115411 () Bool)

(assert (=> b!1115411 (= e!635616 e!635615)))

(declare-fun res!744648 () Bool)

(assert (=> b!1115411 (=> (not res!744648) (not e!635615))))

(declare-fun lt!496976 () array!72611)

(assert (=> b!1115411 (= res!744648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496976 mask!1564))))

(assert (=> b!1115411 (= lt!496976 (array!72612 (store (arr!34958 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35494 _keys!1208)))))

(declare-fun b!1115413 () Bool)

(declare-fun res!744647 () Bool)

(assert (=> b!1115413 (=> (not res!744647) (not e!635616))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42267 0))(
  ( (V!42268 (val!13984 Int)) )
))
(declare-datatypes ((ValueCell!13218 0))(
  ( (ValueCellFull!13218 (v!16617 V!42267)) (EmptyCell!13218) )
))
(declare-datatypes ((array!72613 0))(
  ( (array!72614 (arr!34959 (Array (_ BitVec 32) ValueCell!13218)) (size!35495 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72613)

(assert (=> b!1115413 (= res!744647 (and (= (size!35495 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35494 _keys!1208) (size!35495 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115414 () Bool)

(declare-fun res!744646 () Bool)

(assert (=> b!1115414 (=> (not res!744646) (not e!635615))))

(assert (=> b!1115414 (= res!744646 (arrayNoDuplicates!0 lt!496976 #b00000000000000000000000000000000 Nil!24344))))

(declare-fun b!1115415 () Bool)

(declare-fun res!744649 () Bool)

(assert (=> b!1115415 (=> (not res!744649) (not e!635616))))

(assert (=> b!1115415 (= res!744649 (= (select (arr!34958 _keys!1208) i!673) k0!934))))

(declare-fun b!1115416 () Bool)

(declare-fun res!744651 () Bool)

(assert (=> b!1115416 (=> (not res!744651) (not e!635616))))

(assert (=> b!1115416 (= res!744651 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35494 _keys!1208))))))

(declare-fun b!1115412 () Bool)

(declare-fun e!635618 () Bool)

(declare-fun mapRes!43600 () Bool)

(assert (=> b!1115412 (= e!635618 (and e!635614 mapRes!43600))))

(declare-fun condMapEmpty!43600 () Bool)

(declare-fun mapDefault!43600 () ValueCell!13218)

(assert (=> b!1115412 (= condMapEmpty!43600 (= (arr!34959 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13218)) mapDefault!43600)))))

(declare-fun res!744643 () Bool)

(assert (=> start!97624 (=> (not res!744643) (not e!635616))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97624 (= res!744643 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35494 _keys!1208))))))

(assert (=> start!97624 e!635616))

(declare-fun array_inv!26874 (array!72611) Bool)

(assert (=> start!97624 (array_inv!26874 _keys!1208)))

(assert (=> start!97624 true))

(declare-fun array_inv!26875 (array!72613) Bool)

(assert (=> start!97624 (and (array_inv!26875 _values!996) e!635618)))

(declare-fun mapIsEmpty!43600 () Bool)

(assert (=> mapIsEmpty!43600 mapRes!43600))

(declare-fun mapNonEmpty!43600 () Bool)

(declare-fun tp!82844 () Bool)

(assert (=> mapNonEmpty!43600 (= mapRes!43600 (and tp!82844 e!635619))))

(declare-fun mapKey!43600 () (_ BitVec 32))

(declare-fun mapValue!43600 () ValueCell!13218)

(declare-fun mapRest!43600 () (Array (_ BitVec 32) ValueCell!13218))

(assert (=> mapNonEmpty!43600 (= (arr!34959 _values!996) (store mapRest!43600 mapKey!43600 mapValue!43600))))

(declare-fun b!1115417 () Bool)

(declare-fun res!744652 () Bool)

(assert (=> b!1115417 (=> (not res!744652) (not e!635616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115417 (= res!744652 (validKeyInArray!0 k0!934))))

(declare-fun b!1115418 () Bool)

(declare-fun res!744650 () Bool)

(assert (=> b!1115418 (=> (not res!744650) (not e!635616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115418 (= res!744650 (validMask!0 mask!1564))))

(assert (= (and start!97624 res!744643) b!1115418))

(assert (= (and b!1115418 res!744650) b!1115413))

(assert (= (and b!1115413 res!744647) b!1115406))

(assert (= (and b!1115406 res!744644) b!1115408))

(assert (= (and b!1115408 res!744645) b!1115416))

(assert (= (and b!1115416 res!744651) b!1115417))

(assert (= (and b!1115417 res!744652) b!1115415))

(assert (= (and b!1115415 res!744649) b!1115411))

(assert (= (and b!1115411 res!744648) b!1115414))

(assert (= (and b!1115414 res!744646) b!1115407))

(assert (= (and b!1115412 condMapEmpty!43600) mapIsEmpty!43600))

(assert (= (and b!1115412 (not condMapEmpty!43600)) mapNonEmpty!43600))

(get-info :version)

(assert (= (and mapNonEmpty!43600 ((_ is ValueCellFull!13218) mapValue!43600)) b!1115410))

(assert (= (and b!1115412 ((_ is ValueCellFull!13218) mapDefault!43600)) b!1115409))

(assert (= start!97624 b!1115412))

(declare-fun m!1031959 () Bool)

(assert (=> b!1115418 m!1031959))

(declare-fun m!1031961 () Bool)

(assert (=> b!1115415 m!1031961))

(declare-fun m!1031963 () Bool)

(assert (=> b!1115408 m!1031963))

(declare-fun m!1031965 () Bool)

(assert (=> b!1115406 m!1031965))

(declare-fun m!1031967 () Bool)

(assert (=> b!1115417 m!1031967))

(declare-fun m!1031969 () Bool)

(assert (=> mapNonEmpty!43600 m!1031969))

(declare-fun m!1031971 () Bool)

(assert (=> b!1115411 m!1031971))

(declare-fun m!1031973 () Bool)

(assert (=> b!1115411 m!1031973))

(declare-fun m!1031975 () Bool)

(assert (=> b!1115407 m!1031975))

(declare-fun m!1031977 () Bool)

(assert (=> b!1115407 m!1031977))

(declare-fun m!1031979 () Bool)

(assert (=> start!97624 m!1031979))

(declare-fun m!1031981 () Bool)

(assert (=> start!97624 m!1031981))

(declare-fun m!1031983 () Bool)

(assert (=> b!1115414 m!1031983))

(check-sat (not b!1115418) (not b!1115407) tp_is_empty!27855 (not start!97624) (not b!1115408) (not b!1115417) (not b!1115406) (not b!1115414) (not b!1115411) (not mapNonEmpty!43600))
(check-sat)
