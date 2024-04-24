; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3962 () Bool)

(assert start!3962)

(declare-fun b_free!871 () Bool)

(declare-fun b_next!871 () Bool)

(assert (=> start!3962 (= b_free!871 (not b_next!871))))

(declare-fun tp!4033 () Bool)

(declare-fun b_and!1671 () Bool)

(assert (=> start!3962 (= tp!4033 b_and!1671)))

(declare-fun b!28385 () Bool)

(declare-fun res!16917 () Bool)

(declare-fun e!18351 () Bool)

(assert (=> b!28385 (=> (not res!16917) (not e!18351))))

(declare-datatypes ((array!1667 0))(
  ( (array!1668 (arr!787 (Array (_ BitVec 32) (_ BitVec 64))) (size!888 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1667)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28385 (= res!16917 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1366 () Bool)

(declare-fun mapRes!1366 () Bool)

(assert (=> mapIsEmpty!1366 mapRes!1366))

(declare-fun b!28386 () Bool)

(declare-fun res!16922 () Bool)

(declare-fun e!18352 () Bool)

(assert (=> b!28386 (=> (not res!16922) (not e!18352))))

(declare-datatypes ((List!652 0))(
  ( (Nil!649) (Cons!648 (h!1215 (_ BitVec 64)) (t!3339 List!652)) )
))
(declare-fun arrayNoDuplicates!0 (array!1667 (_ BitVec 32) List!652) Bool)

(assert (=> b!28386 (= res!16922 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!649))))

(declare-fun b!28387 () Bool)

(assert (=> b!28387 (= e!18352 e!18351)))

(declare-fun res!16918 () Bool)

(assert (=> b!28387 (=> (not res!16918) (not e!18351))))

(declare-datatypes ((V!1459 0))(
  ( (V!1460 (val!639 Int)) )
))
(declare-datatypes ((tuple2!1058 0))(
  ( (tuple2!1059 (_1!540 (_ BitVec 64)) (_2!540 V!1459)) )
))
(declare-datatypes ((List!653 0))(
  ( (Nil!650) (Cons!649 (h!1216 tuple2!1058) (t!3340 List!653)) )
))
(declare-datatypes ((ListLongMap!629 0))(
  ( (ListLongMap!630 (toList!330 List!653)) )
))
(declare-fun lt!10773 () ListLongMap!629)

(declare-fun contains!272 (ListLongMap!629 (_ BitVec 64)) Bool)

(assert (=> b!28387 (= res!16918 (not (contains!272 lt!10773 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!413 0))(
  ( (ValueCellFull!413 (v!1728 V!1459)) (EmptyCell!413) )
))
(declare-datatypes ((array!1669 0))(
  ( (array!1670 (arr!788 (Array (_ BitVec 32) ValueCell!413)) (size!889 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1669)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1459)

(declare-fun minValue!1443 () V!1459)

(declare-fun getCurrentListMap!159 (array!1667 array!1669 (_ BitVec 32) (_ BitVec 32) V!1459 V!1459 (_ BitVec 32) Int) ListLongMap!629)

(assert (=> b!28387 (= lt!10773 (getCurrentListMap!159 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28388 () Bool)

(declare-fun e!18353 () Bool)

(declare-fun tp_is_empty!1225 () Bool)

(assert (=> b!28388 (= e!18353 tp_is_empty!1225)))

(declare-fun b!28389 () Bool)

(declare-fun e!18349 () Bool)

(assert (=> b!28389 (= e!18351 (not e!18349))))

(declare-fun res!16919 () Bool)

(assert (=> b!28389 (=> res!16919 e!18349)))

(assert (=> b!28389 (= res!16919 (not (= (size!888 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10771 () (_ BitVec 32))

(assert (=> b!28389 (contains!272 lt!10773 (select (arr!787 _keys!1833) lt!10771))))

(declare-datatypes ((Unit!653 0))(
  ( (Unit!654) )
))
(declare-fun lt!10770 () Unit!653)

(declare-fun lemmaValidKeyInArrayIsInListMap!16 (array!1667 array!1669 (_ BitVec 32) (_ BitVec 32) V!1459 V!1459 (_ BitVec 32) Int) Unit!653)

(assert (=> b!28389 (= lt!10770 (lemmaValidKeyInArrayIsInListMap!16 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10771 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28389 (= lt!10771 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28390 () Bool)

(declare-fun e!18350 () Bool)

(assert (=> b!28390 (= e!18350 tp_is_empty!1225)))

(declare-fun b!28391 () Bool)

(declare-fun e!18355 () Bool)

(assert (=> b!28391 (= e!18355 (and e!18353 mapRes!1366))))

(declare-fun condMapEmpty!1366 () Bool)

(declare-fun mapDefault!1366 () ValueCell!413)

(assert (=> b!28391 (= condMapEmpty!1366 (= (arr!788 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!413)) mapDefault!1366)))))

(declare-fun mapNonEmpty!1366 () Bool)

(declare-fun tp!4032 () Bool)

(assert (=> mapNonEmpty!1366 (= mapRes!1366 (and tp!4032 e!18350))))

(declare-fun mapKey!1366 () (_ BitVec 32))

(declare-fun mapRest!1366 () (Array (_ BitVec 32) ValueCell!413))

(declare-fun mapValue!1366 () ValueCell!413)

(assert (=> mapNonEmpty!1366 (= (arr!788 _values!1501) (store mapRest!1366 mapKey!1366 mapValue!1366))))

(declare-fun b!28393 () Bool)

(declare-fun res!16915 () Bool)

(assert (=> b!28393 (=> (not res!16915) (not e!18352))))

(assert (=> b!28393 (= res!16915 (and (= (size!889 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!888 _keys!1833) (size!889 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28394 () Bool)

(declare-fun res!16920 () Bool)

(assert (=> b!28394 (=> (not res!16920) (not e!18352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1667 (_ BitVec 32)) Bool)

(assert (=> b!28394 (= res!16920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28395 () Bool)

(assert (=> b!28395 (= e!18349 true)))

(declare-datatypes ((SeekEntryResult!67 0))(
  ( (MissingZero!67 (index!2390 (_ BitVec 32))) (Found!67 (index!2391 (_ BitVec 32))) (Intermediate!67 (undefined!879 Bool) (index!2392 (_ BitVec 32)) (x!6321 (_ BitVec 32))) (Undefined!67) (MissingVacant!67 (index!2393 (_ BitVec 32))) )
))
(declare-fun lt!10772 () SeekEntryResult!67)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1667 (_ BitVec 32)) SeekEntryResult!67)

(assert (=> b!28395 (= lt!10772 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28392 () Bool)

(declare-fun res!16916 () Bool)

(assert (=> b!28392 (=> (not res!16916) (not e!18352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28392 (= res!16916 (validKeyInArray!0 k0!1304))))

(declare-fun res!16921 () Bool)

(assert (=> start!3962 (=> (not res!16921) (not e!18352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3962 (= res!16921 (validMask!0 mask!2294))))

(assert (=> start!3962 e!18352))

(assert (=> start!3962 true))

(assert (=> start!3962 tp!4033))

(declare-fun array_inv!547 (array!1669) Bool)

(assert (=> start!3962 (and (array_inv!547 _values!1501) e!18355)))

(declare-fun array_inv!548 (array!1667) Bool)

(assert (=> start!3962 (array_inv!548 _keys!1833)))

(assert (=> start!3962 tp_is_empty!1225))

(assert (= (and start!3962 res!16921) b!28393))

(assert (= (and b!28393 res!16915) b!28394))

(assert (= (and b!28394 res!16920) b!28386))

(assert (= (and b!28386 res!16922) b!28392))

(assert (= (and b!28392 res!16916) b!28387))

(assert (= (and b!28387 res!16918) b!28385))

(assert (= (and b!28385 res!16917) b!28389))

(assert (= (and b!28389 (not res!16919)) b!28395))

(assert (= (and b!28391 condMapEmpty!1366) mapIsEmpty!1366))

(assert (= (and b!28391 (not condMapEmpty!1366)) mapNonEmpty!1366))

(get-info :version)

(assert (= (and mapNonEmpty!1366 ((_ is ValueCellFull!413) mapValue!1366)) b!28390))

(assert (= (and b!28391 ((_ is ValueCellFull!413) mapDefault!1366)) b!28388))

(assert (= start!3962 b!28391))

(declare-fun m!22505 () Bool)

(assert (=> b!28389 m!22505))

(assert (=> b!28389 m!22505))

(declare-fun m!22507 () Bool)

(assert (=> b!28389 m!22507))

(declare-fun m!22509 () Bool)

(assert (=> b!28389 m!22509))

(declare-fun m!22511 () Bool)

(assert (=> b!28389 m!22511))

(declare-fun m!22513 () Bool)

(assert (=> mapNonEmpty!1366 m!22513))

(declare-fun m!22515 () Bool)

(assert (=> b!28394 m!22515))

(declare-fun m!22517 () Bool)

(assert (=> b!28392 m!22517))

(declare-fun m!22519 () Bool)

(assert (=> start!3962 m!22519))

(declare-fun m!22521 () Bool)

(assert (=> start!3962 m!22521))

(declare-fun m!22523 () Bool)

(assert (=> start!3962 m!22523))

(declare-fun m!22525 () Bool)

(assert (=> b!28387 m!22525))

(declare-fun m!22527 () Bool)

(assert (=> b!28387 m!22527))

(declare-fun m!22529 () Bool)

(assert (=> b!28386 m!22529))

(declare-fun m!22531 () Bool)

(assert (=> b!28395 m!22531))

(declare-fun m!22533 () Bool)

(assert (=> b!28385 m!22533))

(check-sat (not b!28387) (not mapNonEmpty!1366) (not b!28385) tp_is_empty!1225 (not start!3962) (not b!28394) b_and!1671 (not b!28389) (not b!28392) (not b_next!871) (not b!28386) (not b!28395))
(check-sat b_and!1671 (not b_next!871))
