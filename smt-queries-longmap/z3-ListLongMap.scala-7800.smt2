; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97538 () Bool)

(assert start!97538)

(declare-fun b!1113717 () Bool)

(declare-fun res!743378 () Bool)

(declare-fun e!634818 () Bool)

(assert (=> b!1113717 (=> (not res!743378) (not e!634818))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113717 (= res!743378 (validMask!0 mask!1564))))

(declare-fun b!1113719 () Bool)

(declare-fun res!743382 () Bool)

(assert (=> b!1113719 (=> (not res!743382) (not e!634818))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72356 0))(
  ( (array!72357 (arr!34831 (Array (_ BitVec 32) (_ BitVec 64))) (size!35369 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72356)

(assert (=> b!1113719 (= res!743382 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35369 _keys!1208))))))

(declare-fun b!1113720 () Bool)

(declare-fun e!634813 () Bool)

(declare-fun tp_is_empty!27775 () Bool)

(assert (=> b!1113720 (= e!634813 tp_is_empty!27775)))

(declare-fun mapNonEmpty!43480 () Bool)

(declare-fun mapRes!43480 () Bool)

(declare-fun tp!82724 () Bool)

(assert (=> mapNonEmpty!43480 (= mapRes!43480 (and tp!82724 e!634813))))

(declare-fun mapKey!43480 () (_ BitVec 32))

(declare-datatypes ((V!42161 0))(
  ( (V!42162 (val!13944 Int)) )
))
(declare-datatypes ((ValueCell!13178 0))(
  ( (ValueCellFull!13178 (v!16576 V!42161)) (EmptyCell!13178) )
))
(declare-fun mapValue!43480 () ValueCell!13178)

(declare-datatypes ((array!72358 0))(
  ( (array!72359 (arr!34832 (Array (_ BitVec 32) ValueCell!13178)) (size!35370 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72358)

(declare-fun mapRest!43480 () (Array (_ BitVec 32) ValueCell!13178))

(assert (=> mapNonEmpty!43480 (= (arr!34832 _values!996) (store mapRest!43480 mapKey!43480 mapValue!43480))))

(declare-fun b!1113721 () Bool)

(declare-fun res!743383 () Bool)

(assert (=> b!1113721 (=> (not res!743383) (not e!634818))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113721 (= res!743383 (and (= (size!35370 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35369 _keys!1208) (size!35370 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113722 () Bool)

(declare-fun res!743374 () Bool)

(assert (=> b!1113722 (=> (not res!743374) (not e!634818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72356 (_ BitVec 32)) Bool)

(assert (=> b!1113722 (= res!743374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113723 () Bool)

(declare-fun e!634817 () Bool)

(assert (=> b!1113723 (= e!634817 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113723 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36371 0))(
  ( (Unit!36372) )
))
(declare-fun lt!496535 () Unit!36371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72356 (_ BitVec 64) (_ BitVec 32)) Unit!36371)

(assert (=> b!1113723 (= lt!496535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113724 () Bool)

(declare-fun res!743379 () Bool)

(assert (=> b!1113724 (=> (not res!743379) (not e!634817))))

(declare-fun lt!496536 () array!72356)

(declare-datatypes ((List!24350 0))(
  ( (Nil!24347) (Cons!24346 (h!25555 (_ BitVec 64)) (t!34822 List!24350)) )
))
(declare-fun arrayNoDuplicates!0 (array!72356 (_ BitVec 32) List!24350) Bool)

(assert (=> b!1113724 (= res!743379 (arrayNoDuplicates!0 lt!496536 #b00000000000000000000000000000000 Nil!24347))))

(declare-fun mapIsEmpty!43480 () Bool)

(assert (=> mapIsEmpty!43480 mapRes!43480))

(declare-fun b!1113725 () Bool)

(declare-fun res!743376 () Bool)

(assert (=> b!1113725 (=> (not res!743376) (not e!634818))))

(assert (=> b!1113725 (= res!743376 (= (select (arr!34831 _keys!1208) i!673) k0!934))))

(declare-fun b!1113726 () Bool)

(declare-fun res!743381 () Bool)

(assert (=> b!1113726 (=> (not res!743381) (not e!634818))))

(assert (=> b!1113726 (= res!743381 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24347))))

(declare-fun b!1113727 () Bool)

(declare-fun e!634816 () Bool)

(assert (=> b!1113727 (= e!634816 tp_is_empty!27775)))

(declare-fun b!1113718 () Bool)

(declare-fun e!634814 () Bool)

(assert (=> b!1113718 (= e!634814 (and e!634816 mapRes!43480))))

(declare-fun condMapEmpty!43480 () Bool)

(declare-fun mapDefault!43480 () ValueCell!13178)

(assert (=> b!1113718 (= condMapEmpty!43480 (= (arr!34832 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13178)) mapDefault!43480)))))

(declare-fun res!743375 () Bool)

(assert (=> start!97538 (=> (not res!743375) (not e!634818))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97538 (= res!743375 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35369 _keys!1208))))))

(assert (=> start!97538 e!634818))

(declare-fun array_inv!26854 (array!72356) Bool)

(assert (=> start!97538 (array_inv!26854 _keys!1208)))

(assert (=> start!97538 true))

(declare-fun array_inv!26855 (array!72358) Bool)

(assert (=> start!97538 (and (array_inv!26855 _values!996) e!634814)))

(declare-fun b!1113728 () Bool)

(assert (=> b!1113728 (= e!634818 e!634817)))

(declare-fun res!743377 () Bool)

(assert (=> b!1113728 (=> (not res!743377) (not e!634817))))

(assert (=> b!1113728 (= res!743377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496536 mask!1564))))

(assert (=> b!1113728 (= lt!496536 (array!72357 (store (arr!34831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35369 _keys!1208)))))

(declare-fun b!1113729 () Bool)

(declare-fun res!743380 () Bool)

(assert (=> b!1113729 (=> (not res!743380) (not e!634818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113729 (= res!743380 (validKeyInArray!0 k0!934))))

(assert (= (and start!97538 res!743375) b!1113717))

(assert (= (and b!1113717 res!743378) b!1113721))

(assert (= (and b!1113721 res!743383) b!1113722))

(assert (= (and b!1113722 res!743374) b!1113726))

(assert (= (and b!1113726 res!743381) b!1113719))

(assert (= (and b!1113719 res!743382) b!1113729))

(assert (= (and b!1113729 res!743380) b!1113725))

(assert (= (and b!1113725 res!743376) b!1113728))

(assert (= (and b!1113728 res!743377) b!1113724))

(assert (= (and b!1113724 res!743379) b!1113723))

(assert (= (and b!1113718 condMapEmpty!43480) mapIsEmpty!43480))

(assert (= (and b!1113718 (not condMapEmpty!43480)) mapNonEmpty!43480))

(get-info :version)

(assert (= (and mapNonEmpty!43480 ((_ is ValueCellFull!13178) mapValue!43480)) b!1113720))

(assert (= (and b!1113718 ((_ is ValueCellFull!13178) mapDefault!43480)) b!1113727))

(assert (= start!97538 b!1113718))

(declare-fun m!1030293 () Bool)

(assert (=> b!1113729 m!1030293))

(declare-fun m!1030295 () Bool)

(assert (=> b!1113724 m!1030295))

(declare-fun m!1030297 () Bool)

(assert (=> mapNonEmpty!43480 m!1030297))

(declare-fun m!1030299 () Bool)

(assert (=> b!1113728 m!1030299))

(declare-fun m!1030301 () Bool)

(assert (=> b!1113728 m!1030301))

(declare-fun m!1030303 () Bool)

(assert (=> start!97538 m!1030303))

(declare-fun m!1030305 () Bool)

(assert (=> start!97538 m!1030305))

(declare-fun m!1030307 () Bool)

(assert (=> b!1113726 m!1030307))

(declare-fun m!1030309 () Bool)

(assert (=> b!1113725 m!1030309))

(declare-fun m!1030311 () Bool)

(assert (=> b!1113723 m!1030311))

(declare-fun m!1030313 () Bool)

(assert (=> b!1113723 m!1030313))

(declare-fun m!1030315 () Bool)

(assert (=> b!1113717 m!1030315))

(declare-fun m!1030317 () Bool)

(assert (=> b!1113722 m!1030317))

(check-sat (not b!1113726) (not b!1113723) (not start!97538) tp_is_empty!27775 (not b!1113724) (not mapNonEmpty!43480) (not b!1113722) (not b!1113729) (not b!1113728) (not b!1113717))
(check-sat)
