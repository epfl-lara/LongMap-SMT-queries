; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43370 () Bool)

(assert start!43370)

(declare-fun b_free!12211 () Bool)

(declare-fun b_next!12211 () Bool)

(assert (=> start!43370 (= b_free!12211 (not b_next!12211))))

(declare-fun tp!42910 () Bool)

(declare-fun b_and!20977 () Bool)

(assert (=> start!43370 (= tp!42910 b_and!20977)))

(declare-fun b!480632 () Bool)

(declare-fun res!286650 () Bool)

(declare-fun e!282798 () Bool)

(assert (=> b!480632 (=> (not res!286650) (not e!282798))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-datatypes ((V!19369 0))(
  ( (V!19370 (val!6909 Int)) )
))
(declare-fun minValue!1458 () V!19369)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19369)

(declare-datatypes ((ValueCell!6500 0))(
  ( (ValueCellFull!6500 (v!9201 V!19369)) (EmptyCell!6500) )
))
(declare-datatypes ((array!31100 0))(
  ( (array!31101 (arr!14954 (Array (_ BitVec 32) ValueCell!6500)) (size!15312 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31100)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31102 0))(
  ( (array!31103 (arr!14955 (Array (_ BitVec 32) (_ BitVec 64))) (size!15313 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31102)

(declare-datatypes ((tuple2!8984 0))(
  ( (tuple2!8985 (_1!4503 (_ BitVec 64)) (_2!4503 V!19369)) )
))
(declare-datatypes ((List!9053 0))(
  ( (Nil!9050) (Cons!9049 (h!9905 tuple2!8984) (t!15255 List!9053)) )
))
(declare-datatypes ((ListLongMap!7899 0))(
  ( (ListLongMap!7900 (toList!3965 List!9053)) )
))
(declare-fun contains!2595 (ListLongMap!7899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2279 (array!31102 array!31100 (_ BitVec 32) (_ BitVec 32) V!19369 V!19369 (_ BitVec 32) Int) ListLongMap!7899)

(assert (=> b!480632 (= res!286650 (contains!2595 (getCurrentListMap!2279 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480633 () Bool)

(declare-fun res!286648 () Bool)

(assert (=> b!480633 (=> (not res!286648) (not e!282798))))

(assert (=> b!480633 (= res!286648 (and (= (size!15312 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15313 _keys!1874) (size!15312 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480634 () Bool)

(declare-fun res!286651 () Bool)

(assert (=> b!480634 (=> (not res!286651) (not e!282798))))

(declare-datatypes ((List!9054 0))(
  ( (Nil!9051) (Cons!9050 (h!9906 (_ BitVec 64)) (t!15256 List!9054)) )
))
(declare-fun arrayNoDuplicates!0 (array!31102 (_ BitVec 32) List!9054) Bool)

(assert (=> b!480634 (= res!286651 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9051))))

(declare-fun b!480635 () Bool)

(declare-fun e!282795 () Bool)

(declare-fun e!282797 () Bool)

(declare-fun mapRes!22288 () Bool)

(assert (=> b!480635 (= e!282795 (and e!282797 mapRes!22288))))

(declare-fun condMapEmpty!22288 () Bool)

(declare-fun mapDefault!22288 () ValueCell!6500)

(assert (=> b!480635 (= condMapEmpty!22288 (= (arr!14954 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6500)) mapDefault!22288)))))

(declare-fun b!480636 () Bool)

(declare-fun e!282796 () Bool)

(declare-fun arrayContainsKey!0 (array!31102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480636 (= e!282796 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!22288 () Bool)

(declare-fun tp!42909 () Bool)

(declare-fun e!282794 () Bool)

(assert (=> mapNonEmpty!22288 (= mapRes!22288 (and tp!42909 e!282794))))

(declare-fun mapRest!22288 () (Array (_ BitVec 32) ValueCell!6500))

(declare-fun mapValue!22288 () ValueCell!6500)

(declare-fun mapKey!22288 () (_ BitVec 32))

(assert (=> mapNonEmpty!22288 (= (arr!14954 _values!1516) (store mapRest!22288 mapKey!22288 mapValue!22288))))

(declare-fun b!480637 () Bool)

(declare-fun res!286652 () Bool)

(assert (=> b!480637 (=> (not res!286652) (not e!282798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31102 (_ BitVec 32)) Bool)

(assert (=> b!480637 (= res!286652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480638 () Bool)

(declare-fun tp_is_empty!13723 () Bool)

(assert (=> b!480638 (= e!282794 tp_is_empty!13723)))

(declare-fun b!480639 () Bool)

(assert (=> b!480639 (= e!282798 (not true))))

(declare-fun lt!218211 () (_ BitVec 32))

(assert (=> b!480639 (arrayForallSeekEntryOrOpenFound!0 lt!218211 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14067 0))(
  ( (Unit!14068) )
))
(declare-fun lt!218210 () Unit!14067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14067)

(assert (=> b!480639 (= lt!218210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218211))))

(declare-fun arrayScanForKey!0 (array!31102 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480639 (= lt!218211 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480639 e!282796))

(declare-fun c!57775 () Bool)

(assert (=> b!480639 (= c!57775 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218212 () Unit!14067)

(declare-fun lemmaKeyInListMapIsInArray!127 (array!31102 array!31100 (_ BitVec 32) (_ BitVec 32) V!19369 V!19369 (_ BitVec 64) Int) Unit!14067)

(assert (=> b!480639 (= lt!218212 (lemmaKeyInListMapIsInArray!127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapIsEmpty!22288 () Bool)

(assert (=> mapIsEmpty!22288 mapRes!22288))

(declare-fun res!286649 () Bool)

(assert (=> start!43370 (=> (not res!286649) (not e!282798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43370 (= res!286649 (validMask!0 mask!2352))))

(assert (=> start!43370 e!282798))

(assert (=> start!43370 true))

(assert (=> start!43370 tp_is_empty!13723))

(declare-fun array_inv!10860 (array!31100) Bool)

(assert (=> start!43370 (and (array_inv!10860 _values!1516) e!282795)))

(assert (=> start!43370 tp!42910))

(declare-fun array_inv!10861 (array!31102) Bool)

(assert (=> start!43370 (array_inv!10861 _keys!1874)))

(declare-fun b!480640 () Bool)

(declare-fun res!286647 () Bool)

(assert (=> b!480640 (=> (not res!286647) (not e!282798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480640 (= res!286647 (validKeyInArray!0 k0!1332))))

(declare-fun b!480641 () Bool)

(assert (=> b!480641 (= e!282796 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480642 () Bool)

(assert (=> b!480642 (= e!282797 tp_is_empty!13723)))

(assert (= (and start!43370 res!286649) b!480633))

(assert (= (and b!480633 res!286648) b!480637))

(assert (= (and b!480637 res!286652) b!480634))

(assert (= (and b!480634 res!286651) b!480632))

(assert (= (and b!480632 res!286650) b!480640))

(assert (= (and b!480640 res!286647) b!480639))

(assert (= (and b!480639 c!57775) b!480636))

(assert (= (and b!480639 (not c!57775)) b!480641))

(assert (= (and b!480635 condMapEmpty!22288) mapIsEmpty!22288))

(assert (= (and b!480635 (not condMapEmpty!22288)) mapNonEmpty!22288))

(get-info :version)

(assert (= (and mapNonEmpty!22288 ((_ is ValueCellFull!6500) mapValue!22288)) b!480638))

(assert (= (and b!480635 ((_ is ValueCellFull!6500) mapDefault!22288)) b!480642))

(assert (= start!43370 b!480635))

(declare-fun m!462457 () Bool)

(assert (=> b!480636 m!462457))

(declare-fun m!462459 () Bool)

(assert (=> b!480634 m!462459))

(declare-fun m!462461 () Bool)

(assert (=> b!480637 m!462461))

(declare-fun m!462463 () Bool)

(assert (=> start!43370 m!462463))

(declare-fun m!462465 () Bool)

(assert (=> start!43370 m!462465))

(declare-fun m!462467 () Bool)

(assert (=> start!43370 m!462467))

(declare-fun m!462469 () Bool)

(assert (=> b!480632 m!462469))

(assert (=> b!480632 m!462469))

(declare-fun m!462471 () Bool)

(assert (=> b!480632 m!462471))

(declare-fun m!462473 () Bool)

(assert (=> mapNonEmpty!22288 m!462473))

(declare-fun m!462475 () Bool)

(assert (=> b!480639 m!462475))

(declare-fun m!462477 () Bool)

(assert (=> b!480639 m!462477))

(declare-fun m!462479 () Bool)

(assert (=> b!480639 m!462479))

(declare-fun m!462481 () Bool)

(assert (=> b!480639 m!462481))

(declare-fun m!462483 () Bool)

(assert (=> b!480640 m!462483))

(check-sat (not b!480637) b_and!20977 (not b!480634) (not start!43370) (not b!480632) (not b!480640) (not b!480636) (not b_next!12211) tp_is_empty!13723 (not mapNonEmpty!22288) (not b!480639))
(check-sat b_and!20977 (not b_next!12211))
