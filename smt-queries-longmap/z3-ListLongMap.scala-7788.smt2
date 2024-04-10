; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97474 () Bool)

(assert start!97474)

(declare-fun res!742393 () Bool)

(declare-fun e!634265 () Bool)

(assert (=> start!97474 (=> (not res!742393) (not e!634265))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72323 0))(
  ( (array!72324 (arr!34814 (Array (_ BitVec 32) (_ BitVec 64))) (size!35350 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72323)

(assert (=> start!97474 (= res!742393 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35350 _keys!1208))))))

(assert (=> start!97474 e!634265))

(declare-fun array_inv!26772 (array!72323) Bool)

(assert (=> start!97474 (array_inv!26772 _keys!1208)))

(assert (=> start!97474 true))

(declare-datatypes ((V!42067 0))(
  ( (V!42068 (val!13909 Int)) )
))
(declare-datatypes ((ValueCell!13143 0))(
  ( (ValueCellFull!13143 (v!16542 V!42067)) (EmptyCell!13143) )
))
(declare-datatypes ((array!72325 0))(
  ( (array!72326 (arr!34815 (Array (_ BitVec 32) ValueCell!13143)) (size!35351 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72325)

(declare-fun e!634268 () Bool)

(declare-fun array_inv!26773 (array!72325) Bool)

(assert (=> start!97474 (and (array_inv!26773 _values!996) e!634268)))

(declare-fun b!1112481 () Bool)

(declare-fun e!634267 () Bool)

(assert (=> b!1112481 (= e!634267 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112481 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36506 0))(
  ( (Unit!36507) )
))
(declare-fun lt!496526 () Unit!36506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72323 (_ BitVec 64) (_ BitVec 32)) Unit!36506)

(assert (=> b!1112481 (= lt!496526 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112482 () Bool)

(declare-fun e!634269 () Bool)

(declare-fun tp_is_empty!27705 () Bool)

(assert (=> b!1112482 (= e!634269 tp_is_empty!27705)))

(declare-fun b!1112483 () Bool)

(declare-fun res!742397 () Bool)

(assert (=> b!1112483 (=> (not res!742397) (not e!634265))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112483 (= res!742397 (validMask!0 mask!1564))))

(declare-fun b!1112484 () Bool)

(declare-fun res!742400 () Bool)

(assert (=> b!1112484 (=> (not res!742400) (not e!634265))))

(assert (=> b!1112484 (= res!742400 (= (select (arr!34814 _keys!1208) i!673) k0!934))))

(declare-fun b!1112485 () Bool)

(declare-fun res!742394 () Bool)

(assert (=> b!1112485 (=> (not res!742394) (not e!634265))))

(declare-datatypes ((List!24291 0))(
  ( (Nil!24288) (Cons!24287 (h!25496 (_ BitVec 64)) (t!34772 List!24291)) )
))
(declare-fun arrayNoDuplicates!0 (array!72323 (_ BitVec 32) List!24291) Bool)

(assert (=> b!1112485 (= res!742394 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24288))))

(declare-fun b!1112486 () Bool)

(declare-fun res!742396 () Bool)

(assert (=> b!1112486 (=> (not res!742396) (not e!634265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72323 (_ BitVec 32)) Bool)

(assert (=> b!1112486 (= res!742396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112487 () Bool)

(declare-fun res!742401 () Bool)

(assert (=> b!1112487 (=> (not res!742401) (not e!634265))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112487 (= res!742401 (and (= (size!35351 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35350 _keys!1208) (size!35351 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112488 () Bool)

(declare-fun res!742395 () Bool)

(assert (=> b!1112488 (=> (not res!742395) (not e!634267))))

(declare-fun lt!496525 () array!72323)

(assert (=> b!1112488 (= res!742395 (arrayNoDuplicates!0 lt!496525 #b00000000000000000000000000000000 Nil!24288))))

(declare-fun b!1112489 () Bool)

(assert (=> b!1112489 (= e!634265 e!634267)))

(declare-fun res!742402 () Bool)

(assert (=> b!1112489 (=> (not res!742402) (not e!634267))))

(assert (=> b!1112489 (= res!742402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496525 mask!1564))))

(assert (=> b!1112489 (= lt!496525 (array!72324 (store (arr!34814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35350 _keys!1208)))))

(declare-fun mapNonEmpty!43375 () Bool)

(declare-fun mapRes!43375 () Bool)

(declare-fun tp!82619 () Bool)

(assert (=> mapNonEmpty!43375 (= mapRes!43375 (and tp!82619 e!634269))))

(declare-fun mapValue!43375 () ValueCell!13143)

(declare-fun mapRest!43375 () (Array (_ BitVec 32) ValueCell!13143))

(declare-fun mapKey!43375 () (_ BitVec 32))

(assert (=> mapNonEmpty!43375 (= (arr!34815 _values!996) (store mapRest!43375 mapKey!43375 mapValue!43375))))

(declare-fun b!1112490 () Bool)

(declare-fun e!634264 () Bool)

(assert (=> b!1112490 (= e!634264 tp_is_empty!27705)))

(declare-fun b!1112491 () Bool)

(declare-fun res!742399 () Bool)

(assert (=> b!1112491 (=> (not res!742399) (not e!634265))))

(assert (=> b!1112491 (= res!742399 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35350 _keys!1208))))))

(declare-fun mapIsEmpty!43375 () Bool)

(assert (=> mapIsEmpty!43375 mapRes!43375))

(declare-fun b!1112492 () Bool)

(declare-fun res!742398 () Bool)

(assert (=> b!1112492 (=> (not res!742398) (not e!634265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112492 (= res!742398 (validKeyInArray!0 k0!934))))

(declare-fun b!1112493 () Bool)

(assert (=> b!1112493 (= e!634268 (and e!634264 mapRes!43375))))

(declare-fun condMapEmpty!43375 () Bool)

(declare-fun mapDefault!43375 () ValueCell!13143)

(assert (=> b!1112493 (= condMapEmpty!43375 (= (arr!34815 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13143)) mapDefault!43375)))))

(assert (= (and start!97474 res!742393) b!1112483))

(assert (= (and b!1112483 res!742397) b!1112487))

(assert (= (and b!1112487 res!742401) b!1112486))

(assert (= (and b!1112486 res!742396) b!1112485))

(assert (= (and b!1112485 res!742394) b!1112491))

(assert (= (and b!1112491 res!742399) b!1112492))

(assert (= (and b!1112492 res!742398) b!1112484))

(assert (= (and b!1112484 res!742400) b!1112489))

(assert (= (and b!1112489 res!742402) b!1112488))

(assert (= (and b!1112488 res!742395) b!1112481))

(assert (= (and b!1112493 condMapEmpty!43375) mapIsEmpty!43375))

(assert (= (and b!1112493 (not condMapEmpty!43375)) mapNonEmpty!43375))

(get-info :version)

(assert (= (and mapNonEmpty!43375 ((_ is ValueCellFull!13143) mapValue!43375)) b!1112482))

(assert (= (and b!1112493 ((_ is ValueCellFull!13143) mapDefault!43375)) b!1112490))

(assert (= start!97474 b!1112493))

(declare-fun m!1030009 () Bool)

(assert (=> start!97474 m!1030009))

(declare-fun m!1030011 () Bool)

(assert (=> start!97474 m!1030011))

(declare-fun m!1030013 () Bool)

(assert (=> b!1112485 m!1030013))

(declare-fun m!1030015 () Bool)

(assert (=> b!1112492 m!1030015))

(declare-fun m!1030017 () Bool)

(assert (=> b!1112483 m!1030017))

(declare-fun m!1030019 () Bool)

(assert (=> b!1112486 m!1030019))

(declare-fun m!1030021 () Bool)

(assert (=> b!1112488 m!1030021))

(declare-fun m!1030023 () Bool)

(assert (=> b!1112489 m!1030023))

(declare-fun m!1030025 () Bool)

(assert (=> b!1112489 m!1030025))

(declare-fun m!1030027 () Bool)

(assert (=> mapNonEmpty!43375 m!1030027))

(declare-fun m!1030029 () Bool)

(assert (=> b!1112481 m!1030029))

(declare-fun m!1030031 () Bool)

(assert (=> b!1112481 m!1030031))

(declare-fun m!1030033 () Bool)

(assert (=> b!1112484 m!1030033))

(check-sat (not b!1112488) (not b!1112481) (not start!97474) (not b!1112483) tp_is_empty!27705 (not b!1112489) (not b!1112492) (not b!1112485) (not b!1112486) (not mapNonEmpty!43375))
(check-sat)
