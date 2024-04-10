; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97486 () Bool)

(assert start!97486)

(declare-fun b!1112715 () Bool)

(declare-fun res!742575 () Bool)

(declare-fun e!634375 () Bool)

(assert (=> b!1112715 (=> (not res!742575) (not e!634375))))

(declare-datatypes ((array!72347 0))(
  ( (array!72348 (arr!34826 (Array (_ BitVec 32) (_ BitVec 64))) (size!35362 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72347)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42083 0))(
  ( (V!42084 (val!13915 Int)) )
))
(declare-datatypes ((ValueCell!13149 0))(
  ( (ValueCellFull!13149 (v!16548 V!42083)) (EmptyCell!13149) )
))
(declare-datatypes ((array!72349 0))(
  ( (array!72350 (arr!34827 (Array (_ BitVec 32) ValueCell!13149)) (size!35363 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72349)

(assert (=> b!1112715 (= res!742575 (and (= (size!35363 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35362 _keys!1208) (size!35363 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112716 () Bool)

(declare-fun e!634372 () Bool)

(declare-fun tp_is_empty!27717 () Bool)

(assert (=> b!1112716 (= e!634372 tp_is_empty!27717)))

(declare-fun b!1112717 () Bool)

(declare-fun res!742580 () Bool)

(assert (=> b!1112717 (=> (not res!742580) (not e!634375))))

(declare-datatypes ((List!24297 0))(
  ( (Nil!24294) (Cons!24293 (h!25502 (_ BitVec 64)) (t!34778 List!24297)) )
))
(declare-fun arrayNoDuplicates!0 (array!72347 (_ BitVec 32) List!24297) Bool)

(assert (=> b!1112717 (= res!742580 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24294))))

(declare-fun b!1112718 () Bool)

(declare-fun res!742578 () Bool)

(declare-fun e!634373 () Bool)

(assert (=> b!1112718 (=> (not res!742578) (not e!634373))))

(declare-fun lt!496561 () array!72347)

(assert (=> b!1112718 (= res!742578 (arrayNoDuplicates!0 lt!496561 #b00000000000000000000000000000000 Nil!24294))))

(declare-fun b!1112719 () Bool)

(assert (=> b!1112719 (= e!634375 e!634373)))

(declare-fun res!742582 () Bool)

(assert (=> b!1112719 (=> (not res!742582) (not e!634373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72347 (_ BitVec 32)) Bool)

(assert (=> b!1112719 (= res!742582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496561 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112719 (= lt!496561 (array!72348 (store (arr!34826 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35362 _keys!1208)))))

(declare-fun b!1112720 () Bool)

(declare-fun res!742574 () Bool)

(assert (=> b!1112720 (=> (not res!742574) (not e!634375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112720 (= res!742574 (validMask!0 mask!1564))))

(declare-fun b!1112721 () Bool)

(declare-fun res!742579 () Bool)

(assert (=> b!1112721 (=> (not res!742579) (not e!634375))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1112721 (= res!742579 (= (select (arr!34826 _keys!1208) i!673) k0!934))))

(declare-fun b!1112722 () Bool)

(declare-fun res!742581 () Bool)

(assert (=> b!1112722 (=> (not res!742581) (not e!634375))))

(assert (=> b!1112722 (= res!742581 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35362 _keys!1208))))))

(declare-fun b!1112723 () Bool)

(declare-fun e!634377 () Bool)

(declare-fun e!634374 () Bool)

(declare-fun mapRes!43393 () Bool)

(assert (=> b!1112723 (= e!634377 (and e!634374 mapRes!43393))))

(declare-fun condMapEmpty!43393 () Bool)

(declare-fun mapDefault!43393 () ValueCell!13149)

(assert (=> b!1112723 (= condMapEmpty!43393 (= (arr!34827 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13149)) mapDefault!43393)))))

(declare-fun b!1112724 () Bool)

(assert (=> b!1112724 (= e!634373 (not true))))

(declare-fun arrayContainsKey!0 (array!72347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112724 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36514 0))(
  ( (Unit!36515) )
))
(declare-fun lt!496562 () Unit!36514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72347 (_ BitVec 64) (_ BitVec 32)) Unit!36514)

(assert (=> b!1112724 (= lt!496562 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43393 () Bool)

(assert (=> mapIsEmpty!43393 mapRes!43393))

(declare-fun b!1112725 () Bool)

(declare-fun res!742576 () Bool)

(assert (=> b!1112725 (=> (not res!742576) (not e!634375))))

(assert (=> b!1112725 (= res!742576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112726 () Bool)

(assert (=> b!1112726 (= e!634374 tp_is_empty!27717)))

(declare-fun res!742573 () Bool)

(assert (=> start!97486 (=> (not res!742573) (not e!634375))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97486 (= res!742573 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35362 _keys!1208))))))

(assert (=> start!97486 e!634375))

(declare-fun array_inv!26784 (array!72347) Bool)

(assert (=> start!97486 (array_inv!26784 _keys!1208)))

(assert (=> start!97486 true))

(declare-fun array_inv!26785 (array!72349) Bool)

(assert (=> start!97486 (and (array_inv!26785 _values!996) e!634377)))

(declare-fun b!1112727 () Bool)

(declare-fun res!742577 () Bool)

(assert (=> b!1112727 (=> (not res!742577) (not e!634375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112727 (= res!742577 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43393 () Bool)

(declare-fun tp!82637 () Bool)

(assert (=> mapNonEmpty!43393 (= mapRes!43393 (and tp!82637 e!634372))))

(declare-fun mapValue!43393 () ValueCell!13149)

(declare-fun mapRest!43393 () (Array (_ BitVec 32) ValueCell!13149))

(declare-fun mapKey!43393 () (_ BitVec 32))

(assert (=> mapNonEmpty!43393 (= (arr!34827 _values!996) (store mapRest!43393 mapKey!43393 mapValue!43393))))

(assert (= (and start!97486 res!742573) b!1112720))

(assert (= (and b!1112720 res!742574) b!1112715))

(assert (= (and b!1112715 res!742575) b!1112725))

(assert (= (and b!1112725 res!742576) b!1112717))

(assert (= (and b!1112717 res!742580) b!1112722))

(assert (= (and b!1112722 res!742581) b!1112727))

(assert (= (and b!1112727 res!742577) b!1112721))

(assert (= (and b!1112721 res!742579) b!1112719))

(assert (= (and b!1112719 res!742582) b!1112718))

(assert (= (and b!1112718 res!742578) b!1112724))

(assert (= (and b!1112723 condMapEmpty!43393) mapIsEmpty!43393))

(assert (= (and b!1112723 (not condMapEmpty!43393)) mapNonEmpty!43393))

(get-info :version)

(assert (= (and mapNonEmpty!43393 ((_ is ValueCellFull!13149) mapValue!43393)) b!1112716))

(assert (= (and b!1112723 ((_ is ValueCellFull!13149) mapDefault!43393)) b!1112726))

(assert (= start!97486 b!1112723))

(declare-fun m!1030165 () Bool)

(assert (=> b!1112717 m!1030165))

(declare-fun m!1030167 () Bool)

(assert (=> b!1112725 m!1030167))

(declare-fun m!1030169 () Bool)

(assert (=> start!97486 m!1030169))

(declare-fun m!1030171 () Bool)

(assert (=> start!97486 m!1030171))

(declare-fun m!1030173 () Bool)

(assert (=> b!1112719 m!1030173))

(declare-fun m!1030175 () Bool)

(assert (=> b!1112719 m!1030175))

(declare-fun m!1030177 () Bool)

(assert (=> b!1112724 m!1030177))

(declare-fun m!1030179 () Bool)

(assert (=> b!1112724 m!1030179))

(declare-fun m!1030181 () Bool)

(assert (=> b!1112727 m!1030181))

(declare-fun m!1030183 () Bool)

(assert (=> b!1112721 m!1030183))

(declare-fun m!1030185 () Bool)

(assert (=> b!1112718 m!1030185))

(declare-fun m!1030187 () Bool)

(assert (=> b!1112720 m!1030187))

(declare-fun m!1030189 () Bool)

(assert (=> mapNonEmpty!43393 m!1030189))

(check-sat (not b!1112720) (not b!1112717) (not start!97486) (not b!1112725) tp_is_empty!27717 (not b!1112724) (not b!1112727) (not b!1112719) (not mapNonEmpty!43393) (not b!1112718))
(check-sat)
