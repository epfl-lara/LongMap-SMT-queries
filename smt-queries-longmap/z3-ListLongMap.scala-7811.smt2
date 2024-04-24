; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97846 () Bool)

(assert start!97846)

(declare-fun b!1116460 () Bool)

(declare-fun res!744955 () Bool)

(declare-fun e!636348 () Bool)

(assert (=> b!1116460 (=> (not res!744955) (not e!636348))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116460 (= res!744955 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43579 () Bool)

(declare-fun mapRes!43579 () Bool)

(declare-fun tp!82823 () Bool)

(declare-fun e!636345 () Bool)

(assert (=> mapNonEmpty!43579 (= mapRes!43579 (and tp!82823 e!636345))))

(declare-datatypes ((V!42249 0))(
  ( (V!42250 (val!13977 Int)) )
))
(declare-datatypes ((ValueCell!13211 0))(
  ( (ValueCellFull!13211 (v!16606 V!42249)) (EmptyCell!13211) )
))
(declare-fun mapRest!43579 () (Array (_ BitVec 32) ValueCell!13211))

(declare-fun mapValue!43579 () ValueCell!13211)

(declare-fun mapKey!43579 () (_ BitVec 32))

(declare-datatypes ((array!72621 0))(
  ( (array!72622 (arr!34957 (Array (_ BitVec 32) ValueCell!13211)) (size!35494 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72621)

(assert (=> mapNonEmpty!43579 (= (arr!34957 _values!996) (store mapRest!43579 mapKey!43579 mapValue!43579))))

(declare-fun mapIsEmpty!43579 () Bool)

(assert (=> mapIsEmpty!43579 mapRes!43579))

(declare-fun b!1116462 () Bool)

(declare-fun res!744959 () Bool)

(assert (=> b!1116462 (=> (not res!744959) (not e!636348))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116462 (= res!744959 (validMask!0 mask!1564))))

(declare-fun b!1116463 () Bool)

(declare-fun e!636343 () Bool)

(assert (=> b!1116463 (= e!636343 (not true))))

(declare-datatypes ((array!72623 0))(
  ( (array!72624 (arr!34958 (Array (_ BitVec 32) (_ BitVec 64))) (size!35495 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72623)

(declare-fun arrayContainsKey!0 (array!72623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116463 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36565 0))(
  ( (Unit!36566) )
))
(declare-fun lt!497448 () Unit!36565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72623 (_ BitVec 64) (_ BitVec 32)) Unit!36565)

(assert (=> b!1116463 (= lt!497448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116464 () Bool)

(declare-fun res!744961 () Bool)

(assert (=> b!1116464 (=> (not res!744961) (not e!636343))))

(declare-fun lt!497449 () array!72623)

(declare-datatypes ((List!24360 0))(
  ( (Nil!24357) (Cons!24356 (h!25574 (_ BitVec 64)) (t!34833 List!24360)) )
))
(declare-fun arrayNoDuplicates!0 (array!72623 (_ BitVec 32) List!24360) Bool)

(assert (=> b!1116464 (= res!744961 (arrayNoDuplicates!0 lt!497449 #b00000000000000000000000000000000 Nil!24357))))

(declare-fun b!1116465 () Bool)

(declare-fun tp_is_empty!27841 () Bool)

(assert (=> b!1116465 (= e!636345 tp_is_empty!27841)))

(declare-fun b!1116466 () Bool)

(assert (=> b!1116466 (= e!636348 e!636343)))

(declare-fun res!744956 () Bool)

(assert (=> b!1116466 (=> (not res!744956) (not e!636343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72623 (_ BitVec 32)) Bool)

(assert (=> b!1116466 (= res!744956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497449 mask!1564))))

(assert (=> b!1116466 (= lt!497449 (array!72624 (store (arr!34958 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35495 _keys!1208)))))

(declare-fun b!1116467 () Bool)

(declare-fun res!744960 () Bool)

(assert (=> b!1116467 (=> (not res!744960) (not e!636348))))

(assert (=> b!1116467 (= res!744960 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24357))))

(declare-fun b!1116468 () Bool)

(declare-fun res!744962 () Bool)

(assert (=> b!1116468 (=> (not res!744962) (not e!636348))))

(assert (=> b!1116468 (= res!744962 (= (select (arr!34958 _keys!1208) i!673) k0!934))))

(declare-fun b!1116469 () Bool)

(declare-fun e!636347 () Bool)

(assert (=> b!1116469 (= e!636347 tp_is_empty!27841)))

(declare-fun res!744964 () Bool)

(assert (=> start!97846 (=> (not res!744964) (not e!636348))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97846 (= res!744964 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35495 _keys!1208))))))

(assert (=> start!97846 e!636348))

(declare-fun array_inv!26932 (array!72623) Bool)

(assert (=> start!97846 (array_inv!26932 _keys!1208)))

(assert (=> start!97846 true))

(declare-fun e!636346 () Bool)

(declare-fun array_inv!26933 (array!72621) Bool)

(assert (=> start!97846 (and (array_inv!26933 _values!996) e!636346)))

(declare-fun b!1116461 () Bool)

(declare-fun res!744957 () Bool)

(assert (=> b!1116461 (=> (not res!744957) (not e!636348))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116461 (= res!744957 (and (= (size!35494 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35495 _keys!1208) (size!35494 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116470 () Bool)

(declare-fun res!744963 () Bool)

(assert (=> b!1116470 (=> (not res!744963) (not e!636348))))

(assert (=> b!1116470 (= res!744963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116471 () Bool)

(declare-fun res!744958 () Bool)

(assert (=> b!1116471 (=> (not res!744958) (not e!636348))))

(assert (=> b!1116471 (= res!744958 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35495 _keys!1208))))))

(declare-fun b!1116472 () Bool)

(assert (=> b!1116472 (= e!636346 (and e!636347 mapRes!43579))))

(declare-fun condMapEmpty!43579 () Bool)

(declare-fun mapDefault!43579 () ValueCell!13211)

(assert (=> b!1116472 (= condMapEmpty!43579 (= (arr!34957 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13211)) mapDefault!43579)))))

(assert (= (and start!97846 res!744964) b!1116462))

(assert (= (and b!1116462 res!744959) b!1116461))

(assert (= (and b!1116461 res!744957) b!1116470))

(assert (= (and b!1116470 res!744963) b!1116467))

(assert (= (and b!1116467 res!744960) b!1116471))

(assert (= (and b!1116471 res!744958) b!1116460))

(assert (= (and b!1116460 res!744955) b!1116468))

(assert (= (and b!1116468 res!744962) b!1116466))

(assert (= (and b!1116466 res!744956) b!1116464))

(assert (= (and b!1116464 res!744961) b!1116463))

(assert (= (and b!1116472 condMapEmpty!43579) mapIsEmpty!43579))

(assert (= (and b!1116472 (not condMapEmpty!43579)) mapNonEmpty!43579))

(get-info :version)

(assert (= (and mapNonEmpty!43579 ((_ is ValueCellFull!13211) mapValue!43579)) b!1116465))

(assert (= (and b!1116472 ((_ is ValueCellFull!13211) mapDefault!43579)) b!1116469))

(assert (= start!97846 b!1116472))

(declare-fun m!1033449 () Bool)

(assert (=> mapNonEmpty!43579 m!1033449))

(declare-fun m!1033451 () Bool)

(assert (=> b!1116460 m!1033451))

(declare-fun m!1033453 () Bool)

(assert (=> b!1116466 m!1033453))

(declare-fun m!1033455 () Bool)

(assert (=> b!1116466 m!1033455))

(declare-fun m!1033457 () Bool)

(assert (=> b!1116462 m!1033457))

(declare-fun m!1033459 () Bool)

(assert (=> b!1116463 m!1033459))

(declare-fun m!1033461 () Bool)

(assert (=> b!1116463 m!1033461))

(declare-fun m!1033463 () Bool)

(assert (=> b!1116468 m!1033463))

(declare-fun m!1033465 () Bool)

(assert (=> start!97846 m!1033465))

(declare-fun m!1033467 () Bool)

(assert (=> start!97846 m!1033467))

(declare-fun m!1033469 () Bool)

(assert (=> b!1116464 m!1033469))

(declare-fun m!1033471 () Bool)

(assert (=> b!1116470 m!1033471))

(declare-fun m!1033473 () Bool)

(assert (=> b!1116467 m!1033473))

(check-sat (not b!1116470) (not b!1116463) (not start!97846) (not b!1116464) (not b!1116467) (not b!1116466) (not mapNonEmpty!43579) tp_is_empty!27841 (not b!1116462) (not b!1116460))
(check-sat)
