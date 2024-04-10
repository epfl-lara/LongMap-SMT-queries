; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97678 () Bool)

(assert start!97678)

(declare-fun b!1116459 () Bool)

(declare-fun res!745459 () Bool)

(declare-fun e!636101 () Bool)

(assert (=> b!1116459 (=> (not res!745459) (not e!636101))))

(declare-datatypes ((array!72715 0))(
  ( (array!72716 (arr!35010 (Array (_ BitVec 32) (_ BitVec 64))) (size!35546 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72715)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42339 0))(
  ( (V!42340 (val!14011 Int)) )
))
(declare-datatypes ((ValueCell!13245 0))(
  ( (ValueCellFull!13245 (v!16644 V!42339)) (EmptyCell!13245) )
))
(declare-datatypes ((array!72717 0))(
  ( (array!72718 (arr!35011 (Array (_ BitVec 32) ValueCell!13245)) (size!35547 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72717)

(assert (=> b!1116459 (= res!745459 (and (= (size!35547 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35546 _keys!1208) (size!35547 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116460 () Bool)

(declare-fun res!745458 () Bool)

(assert (=> b!1116460 (=> (not res!745458) (not e!636101))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116460 (= res!745458 (= (select (arr!35010 _keys!1208) i!673) k0!934))))

(declare-fun b!1116461 () Bool)

(declare-fun res!745454 () Bool)

(assert (=> b!1116461 (=> (not res!745454) (not e!636101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116461 (= res!745454 (validKeyInArray!0 k0!934))))

(declare-fun b!1116462 () Bool)

(declare-fun e!636104 () Bool)

(declare-fun e!636102 () Bool)

(declare-fun mapRes!43681 () Bool)

(assert (=> b!1116462 (= e!636104 (and e!636102 mapRes!43681))))

(declare-fun condMapEmpty!43681 () Bool)

(declare-fun mapDefault!43681 () ValueCell!13245)

(assert (=> b!1116462 (= condMapEmpty!43681 (= (arr!35011 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13245)) mapDefault!43681)))))

(declare-fun res!745457 () Bool)

(assert (=> start!97678 (=> (not res!745457) (not e!636101))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97678 (= res!745457 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35546 _keys!1208))))))

(assert (=> start!97678 e!636101))

(declare-fun array_inv!26908 (array!72715) Bool)

(assert (=> start!97678 (array_inv!26908 _keys!1208)))

(assert (=> start!97678 true))

(declare-fun array_inv!26909 (array!72717) Bool)

(assert (=> start!97678 (and (array_inv!26909 _values!996) e!636104)))

(declare-fun mapIsEmpty!43681 () Bool)

(assert (=> mapIsEmpty!43681 mapRes!43681))

(declare-fun b!1116463 () Bool)

(declare-fun e!636103 () Bool)

(assert (=> b!1116463 (= e!636101 e!636103)))

(declare-fun res!745456 () Bool)

(assert (=> b!1116463 (=> (not res!745456) (not e!636103))))

(declare-fun lt!497137 () array!72715)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72715 (_ BitVec 32)) Bool)

(assert (=> b!1116463 (= res!745456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497137 mask!1564))))

(assert (=> b!1116463 (= lt!497137 (array!72716 (store (arr!35010 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35546 _keys!1208)))))

(declare-fun b!1116464 () Bool)

(declare-fun e!636105 () Bool)

(declare-fun tp_is_empty!27909 () Bool)

(assert (=> b!1116464 (= e!636105 tp_is_empty!27909)))

(declare-fun b!1116465 () Bool)

(declare-fun res!745455 () Bool)

(assert (=> b!1116465 (=> (not res!745455) (not e!636101))))

(declare-datatypes ((List!24368 0))(
  ( (Nil!24365) (Cons!24364 (h!25573 (_ BitVec 64)) (t!34849 List!24368)) )
))
(declare-fun arrayNoDuplicates!0 (array!72715 (_ BitVec 32) List!24368) Bool)

(assert (=> b!1116465 (= res!745455 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24365))))

(declare-fun b!1116466 () Bool)

(assert (=> b!1116466 (= e!636102 tp_is_empty!27909)))

(declare-fun b!1116467 () Bool)

(declare-fun res!745453 () Bool)

(assert (=> b!1116467 (=> (not res!745453) (not e!636103))))

(assert (=> b!1116467 (= res!745453 (arrayNoDuplicates!0 lt!497137 #b00000000000000000000000000000000 Nil!24365))))

(declare-fun b!1116468 () Bool)

(declare-fun res!745460 () Bool)

(assert (=> b!1116468 (=> (not res!745460) (not e!636101))))

(assert (=> b!1116468 (= res!745460 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35546 _keys!1208))))))

(declare-fun b!1116469 () Bool)

(declare-fun res!745461 () Bool)

(assert (=> b!1116469 (=> (not res!745461) (not e!636101))))

(assert (=> b!1116469 (= res!745461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43681 () Bool)

(declare-fun tp!82925 () Bool)

(assert (=> mapNonEmpty!43681 (= mapRes!43681 (and tp!82925 e!636105))))

(declare-fun mapValue!43681 () ValueCell!13245)

(declare-fun mapRest!43681 () (Array (_ BitVec 32) ValueCell!13245))

(declare-fun mapKey!43681 () (_ BitVec 32))

(assert (=> mapNonEmpty!43681 (= (arr!35011 _values!996) (store mapRest!43681 mapKey!43681 mapValue!43681))))

(declare-fun b!1116470 () Bool)

(assert (=> b!1116470 (= e!636103 (not true))))

(declare-fun arrayContainsKey!0 (array!72715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116470 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36640 0))(
  ( (Unit!36641) )
))
(declare-fun lt!497138 () Unit!36640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72715 (_ BitVec 64) (_ BitVec 32)) Unit!36640)

(assert (=> b!1116470 (= lt!497138 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116471 () Bool)

(declare-fun res!745462 () Bool)

(assert (=> b!1116471 (=> (not res!745462) (not e!636101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116471 (= res!745462 (validMask!0 mask!1564))))

(assert (= (and start!97678 res!745457) b!1116471))

(assert (= (and b!1116471 res!745462) b!1116459))

(assert (= (and b!1116459 res!745459) b!1116469))

(assert (= (and b!1116469 res!745461) b!1116465))

(assert (= (and b!1116465 res!745455) b!1116468))

(assert (= (and b!1116468 res!745460) b!1116461))

(assert (= (and b!1116461 res!745454) b!1116460))

(assert (= (and b!1116460 res!745458) b!1116463))

(assert (= (and b!1116463 res!745456) b!1116467))

(assert (= (and b!1116467 res!745453) b!1116470))

(assert (= (and b!1116462 condMapEmpty!43681) mapIsEmpty!43681))

(assert (= (and b!1116462 (not condMapEmpty!43681)) mapNonEmpty!43681))

(get-info :version)

(assert (= (and mapNonEmpty!43681 ((_ is ValueCellFull!13245) mapValue!43681)) b!1116464))

(assert (= (and b!1116462 ((_ is ValueCellFull!13245) mapDefault!43681)) b!1116466))

(assert (= start!97678 b!1116462))

(declare-fun m!1032661 () Bool)

(assert (=> b!1116460 m!1032661))

(declare-fun m!1032663 () Bool)

(assert (=> b!1116471 m!1032663))

(declare-fun m!1032665 () Bool)

(assert (=> b!1116461 m!1032665))

(declare-fun m!1032667 () Bool)

(assert (=> b!1116470 m!1032667))

(declare-fun m!1032669 () Bool)

(assert (=> b!1116470 m!1032669))

(declare-fun m!1032671 () Bool)

(assert (=> mapNonEmpty!43681 m!1032671))

(declare-fun m!1032673 () Bool)

(assert (=> b!1116469 m!1032673))

(declare-fun m!1032675 () Bool)

(assert (=> b!1116463 m!1032675))

(declare-fun m!1032677 () Bool)

(assert (=> b!1116463 m!1032677))

(declare-fun m!1032679 () Bool)

(assert (=> start!97678 m!1032679))

(declare-fun m!1032681 () Bool)

(assert (=> start!97678 m!1032681))

(declare-fun m!1032683 () Bool)

(assert (=> b!1116467 m!1032683))

(declare-fun m!1032685 () Bool)

(assert (=> b!1116465 m!1032685))

(check-sat (not mapNonEmpty!43681) (not b!1116465) (not b!1116463) (not b!1116470) (not b!1116461) tp_is_empty!27909 (not b!1116469) (not b!1116471) (not b!1116467) (not start!97678))
(check-sat)
