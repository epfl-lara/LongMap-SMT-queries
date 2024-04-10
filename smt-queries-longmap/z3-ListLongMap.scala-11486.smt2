; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133716 () Bool)

(assert start!133716)

(declare-fun b_free!32079 () Bool)

(declare-fun b_next!32079 () Bool)

(assert (=> start!133716 (= b_free!32079 (not b_next!32079))))

(declare-fun tp!113441 () Bool)

(declare-fun b_and!51649 () Bool)

(assert (=> start!133716 (= tp!113441 b_and!51649)))

(declare-fun b!1563455 () Bool)

(declare-fun e!871363 () Bool)

(assert (=> b!1563455 (= e!871363 false)))

(declare-fun lt!671892 () Bool)

(declare-datatypes ((V!59939 0))(
  ( (V!59940 (val!19483 Int)) )
))
(declare-datatypes ((tuple2!25136 0))(
  ( (tuple2!25137 (_1!12579 (_ BitVec 64)) (_2!12579 V!59939)) )
))
(declare-datatypes ((List!36520 0))(
  ( (Nil!36517) (Cons!36516 (h!37962 tuple2!25136) (t!51367 List!36520)) )
))
(declare-datatypes ((ListLongMap!22571 0))(
  ( (ListLongMap!22572 (toList!11301 List!36520)) )
))
(declare-fun lt!671891 () ListLongMap!22571)

(declare-fun contains!10291 (ListLongMap!22571 (_ BitVec 64)) Bool)

(assert (=> b!1563455 (= lt!671892 (contains!10291 lt!671891 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563456 () Bool)

(declare-fun e!871366 () Bool)

(assert (=> b!1563456 (= e!871366 e!871363)))

(declare-fun res!1068860 () Bool)

(assert (=> b!1563456 (=> (not res!1068860) (not e!871363))))

(assert (=> b!1563456 (= res!1068860 (not (contains!10291 lt!671891 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59939)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59939)

(declare-datatypes ((array!104294 0))(
  ( (array!104295 (arr!50339 (Array (_ BitVec 32) (_ BitVec 64))) (size!50889 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104294)

(declare-datatypes ((ValueCell!18369 0))(
  ( (ValueCellFull!18369 (v!22235 V!59939)) (EmptyCell!18369) )
))
(declare-datatypes ((array!104296 0))(
  ( (array!104297 (arr!50340 (Array (_ BitVec 32) ValueCell!18369)) (size!50890 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104296)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6684 (array!104294 array!104296 (_ BitVec 32) (_ BitVec 32) V!59939 V!59939 (_ BitVec 32) Int) ListLongMap!22571)

(assert (=> b!1563456 (= lt!671891 (getCurrentListMapNoExtraKeys!6684 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563457 () Bool)

(declare-fun res!1068859 () Bool)

(assert (=> b!1563457 (=> (not res!1068859) (not e!871366))))

(declare-datatypes ((List!36521 0))(
  ( (Nil!36518) (Cons!36517 (h!37963 (_ BitVec 64)) (t!51368 List!36521)) )
))
(declare-fun arrayNoDuplicates!0 (array!104294 (_ BitVec 32) List!36521) Bool)

(assert (=> b!1563457 (= res!1068859 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36518))))

(declare-fun b!1563458 () Bool)

(declare-fun e!871361 () Bool)

(declare-fun e!871364 () Bool)

(declare-fun mapRes!59574 () Bool)

(assert (=> b!1563458 (= e!871361 (and e!871364 mapRes!59574))))

(declare-fun condMapEmpty!59574 () Bool)

(declare-fun mapDefault!59574 () ValueCell!18369)

(assert (=> b!1563458 (= condMapEmpty!59574 (= (arr!50340 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18369)) mapDefault!59574)))))

(declare-fun mapNonEmpty!59574 () Bool)

(declare-fun tp!113442 () Bool)

(declare-fun e!871362 () Bool)

(assert (=> mapNonEmpty!59574 (= mapRes!59574 (and tp!113442 e!871362))))

(declare-fun mapKey!59574 () (_ BitVec 32))

(declare-fun mapRest!59574 () (Array (_ BitVec 32) ValueCell!18369))

(declare-fun mapValue!59574 () ValueCell!18369)

(assert (=> mapNonEmpty!59574 (= (arr!50340 _values!487) (store mapRest!59574 mapKey!59574 mapValue!59574))))

(declare-fun b!1563459 () Bool)

(declare-fun res!1068861 () Bool)

(assert (=> b!1563459 (=> (not res!1068861) (not e!871366))))

(assert (=> b!1563459 (= res!1068861 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50889 _keys!637)) (bvslt from!782 (size!50889 _keys!637))))))

(declare-fun b!1563460 () Bool)

(declare-fun res!1068857 () Bool)

(assert (=> b!1563460 (=> (not res!1068857) (not e!871366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104294 (_ BitVec 32)) Bool)

(assert (=> b!1563460 (= res!1068857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563461 () Bool)

(declare-fun res!1068856 () Bool)

(assert (=> b!1563461 (=> (not res!1068856) (not e!871366))))

(assert (=> b!1563461 (= res!1068856 (and (= (size!50890 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50889 _keys!637) (size!50890 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59574 () Bool)

(assert (=> mapIsEmpty!59574 mapRes!59574))

(declare-fun res!1068858 () Bool)

(assert (=> start!133716 (=> (not res!1068858) (not e!871366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133716 (= res!1068858 (validMask!0 mask!947))))

(assert (=> start!133716 e!871366))

(assert (=> start!133716 tp!113441))

(declare-fun tp_is_empty!38799 () Bool)

(assert (=> start!133716 tp_is_empty!38799))

(assert (=> start!133716 true))

(declare-fun array_inv!39121 (array!104294) Bool)

(assert (=> start!133716 (array_inv!39121 _keys!637)))

(declare-fun array_inv!39122 (array!104296) Bool)

(assert (=> start!133716 (and (array_inv!39122 _values!487) e!871361)))

(declare-fun b!1563462 () Bool)

(assert (=> b!1563462 (= e!871364 tp_is_empty!38799)))

(declare-fun b!1563463 () Bool)

(declare-fun res!1068855 () Bool)

(assert (=> b!1563463 (=> (not res!1068855) (not e!871366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563463 (= res!1068855 (not (validKeyInArray!0 (select (arr!50339 _keys!637) from!782))))))

(declare-fun b!1563464 () Bool)

(assert (=> b!1563464 (= e!871362 tp_is_empty!38799)))

(assert (= (and start!133716 res!1068858) b!1563461))

(assert (= (and b!1563461 res!1068856) b!1563460))

(assert (= (and b!1563460 res!1068857) b!1563457))

(assert (= (and b!1563457 res!1068859) b!1563459))

(assert (= (and b!1563459 res!1068861) b!1563463))

(assert (= (and b!1563463 res!1068855) b!1563456))

(assert (= (and b!1563456 res!1068860) b!1563455))

(assert (= (and b!1563458 condMapEmpty!59574) mapIsEmpty!59574))

(assert (= (and b!1563458 (not condMapEmpty!59574)) mapNonEmpty!59574))

(get-info :version)

(assert (= (and mapNonEmpty!59574 ((_ is ValueCellFull!18369) mapValue!59574)) b!1563464))

(assert (= (and b!1563458 ((_ is ValueCellFull!18369) mapDefault!59574)) b!1563462))

(assert (= start!133716 b!1563458))

(declare-fun m!1438973 () Bool)

(assert (=> b!1563460 m!1438973))

(declare-fun m!1438975 () Bool)

(assert (=> b!1563457 m!1438975))

(declare-fun m!1438977 () Bool)

(assert (=> b!1563456 m!1438977))

(declare-fun m!1438979 () Bool)

(assert (=> b!1563456 m!1438979))

(declare-fun m!1438981 () Bool)

(assert (=> mapNonEmpty!59574 m!1438981))

(declare-fun m!1438983 () Bool)

(assert (=> b!1563455 m!1438983))

(declare-fun m!1438985 () Bool)

(assert (=> b!1563463 m!1438985))

(assert (=> b!1563463 m!1438985))

(declare-fun m!1438987 () Bool)

(assert (=> b!1563463 m!1438987))

(declare-fun m!1438989 () Bool)

(assert (=> start!133716 m!1438989))

(declare-fun m!1438991 () Bool)

(assert (=> start!133716 m!1438991))

(declare-fun m!1438993 () Bool)

(assert (=> start!133716 m!1438993))

(check-sat (not b!1563455) (not b!1563463) (not b!1563460) (not start!133716) tp_is_empty!38799 (not b!1563456) b_and!51649 (not b_next!32079) (not b!1563457) (not mapNonEmpty!59574))
(check-sat b_and!51649 (not b_next!32079))
