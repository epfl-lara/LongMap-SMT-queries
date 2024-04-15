; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43370 () Bool)

(assert start!43370)

(declare-fun b_free!12211 () Bool)

(declare-fun b_next!12211 () Bool)

(assert (=> start!43370 (= b_free!12211 (not b_next!12211))))

(declare-fun tp!42910 () Bool)

(declare-fun b_and!20941 () Bool)

(assert (=> start!43370 (= tp!42910 b_and!20941)))

(declare-fun b!480422 () Bool)

(declare-fun res!286525 () Bool)

(declare-fun e!282659 () Bool)

(assert (=> b!480422 (=> (not res!286525) (not e!282659))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19369 0))(
  ( (V!19370 (val!6909 Int)) )
))
(declare-fun minValue!1458 () V!19369)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19369)

(declare-datatypes ((ValueCell!6500 0))(
  ( (ValueCellFull!6500 (v!9194 V!19369)) (EmptyCell!6500) )
))
(declare-datatypes ((array!31107 0))(
  ( (array!31108 (arr!14958 (Array (_ BitVec 32) ValueCell!6500)) (size!15317 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31107)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31109 0))(
  ( (array!31110 (arr!14959 (Array (_ BitVec 32) (_ BitVec 64))) (size!15318 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31109)

(declare-datatypes ((tuple2!9116 0))(
  ( (tuple2!9117 (_1!4569 (_ BitVec 64)) (_2!4569 V!19369)) )
))
(declare-datatypes ((List!9179 0))(
  ( (Nil!9176) (Cons!9175 (h!10031 tuple2!9116) (t!15380 List!9179)) )
))
(declare-datatypes ((ListLongMap!8019 0))(
  ( (ListLongMap!8020 (toList!4025 List!9179)) )
))
(declare-fun contains!2602 (ListLongMap!8019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2278 (array!31109 array!31107 (_ BitVec 32) (_ BitVec 32) V!19369 V!19369 (_ BitVec 32) Int) ListLongMap!8019)

(assert (=> b!480422 (= res!286525 (contains!2602 (getCurrentListMap!2278 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480423 () Bool)

(declare-fun res!286526 () Bool)

(assert (=> b!480423 (=> (not res!286526) (not e!282659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31109 (_ BitVec 32)) Bool)

(assert (=> b!480423 (= res!286526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480424 () Bool)

(declare-fun e!282661 () Bool)

(assert (=> b!480424 (= e!282661 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480425 () Bool)

(declare-fun res!286529 () Bool)

(assert (=> b!480425 (=> (not res!286529) (not e!282659))))

(declare-datatypes ((List!9180 0))(
  ( (Nil!9177) (Cons!9176 (h!10032 (_ BitVec 64)) (t!15381 List!9180)) )
))
(declare-fun arrayNoDuplicates!0 (array!31109 (_ BitVec 32) List!9180) Bool)

(assert (=> b!480425 (= res!286529 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9177))))

(declare-fun b!480426 () Bool)

(assert (=> b!480426 (= e!282659 (not true))))

(declare-fun lt!217965 () (_ BitVec 32))

(assert (=> b!480426 (arrayForallSeekEntryOrOpenFound!0 lt!217965 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14080 0))(
  ( (Unit!14081) )
))
(declare-fun lt!217964 () Unit!14080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14080)

(assert (=> b!480426 (= lt!217964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!217965))))

(declare-fun arrayScanForKey!0 (array!31109 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480426 (= lt!217965 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480426 e!282661))

(declare-fun c!57731 () Bool)

(assert (=> b!480426 (= c!57731 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!217966 () Unit!14080)

(declare-fun lemmaKeyInListMapIsInArray!129 (array!31109 array!31107 (_ BitVec 32) (_ BitVec 32) V!19369 V!19369 (_ BitVec 64) Int) Unit!14080)

(assert (=> b!480426 (= lt!217966 (lemmaKeyInListMapIsInArray!129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480427 () Bool)

(declare-fun res!286527 () Bool)

(assert (=> b!480427 (=> (not res!286527) (not e!282659))))

(assert (=> b!480427 (= res!286527 (and (= (size!15317 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15318 _keys!1874) (size!15317 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480428 () Bool)

(declare-fun e!282662 () Bool)

(declare-fun tp_is_empty!13723 () Bool)

(assert (=> b!480428 (= e!282662 tp_is_empty!13723)))

(declare-fun b!480429 () Bool)

(declare-fun arrayContainsKey!0 (array!31109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480429 (= e!282661 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!286530 () Bool)

(assert (=> start!43370 (=> (not res!286530) (not e!282659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43370 (= res!286530 (validMask!0 mask!2352))))

(assert (=> start!43370 e!282659))

(assert (=> start!43370 true))

(assert (=> start!43370 tp_is_empty!13723))

(declare-fun e!282658 () Bool)

(declare-fun array_inv!10880 (array!31107) Bool)

(assert (=> start!43370 (and (array_inv!10880 _values!1516) e!282658)))

(assert (=> start!43370 tp!42910))

(declare-fun array_inv!10881 (array!31109) Bool)

(assert (=> start!43370 (array_inv!10881 _keys!1874)))

(declare-fun b!480430 () Bool)

(declare-fun res!286528 () Bool)

(assert (=> b!480430 (=> (not res!286528) (not e!282659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480430 (= res!286528 (validKeyInArray!0 k0!1332))))

(declare-fun b!480431 () Bool)

(declare-fun e!282660 () Bool)

(assert (=> b!480431 (= e!282660 tp_is_empty!13723)))

(declare-fun b!480432 () Bool)

(declare-fun mapRes!22288 () Bool)

(assert (=> b!480432 (= e!282658 (and e!282660 mapRes!22288))))

(declare-fun condMapEmpty!22288 () Bool)

(declare-fun mapDefault!22288 () ValueCell!6500)

(assert (=> b!480432 (= condMapEmpty!22288 (= (arr!14958 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6500)) mapDefault!22288)))))

(declare-fun mapIsEmpty!22288 () Bool)

(assert (=> mapIsEmpty!22288 mapRes!22288))

(declare-fun mapNonEmpty!22288 () Bool)

(declare-fun tp!42909 () Bool)

(assert (=> mapNonEmpty!22288 (= mapRes!22288 (and tp!42909 e!282662))))

(declare-fun mapRest!22288 () (Array (_ BitVec 32) ValueCell!6500))

(declare-fun mapKey!22288 () (_ BitVec 32))

(declare-fun mapValue!22288 () ValueCell!6500)

(assert (=> mapNonEmpty!22288 (= (arr!14958 _values!1516) (store mapRest!22288 mapKey!22288 mapValue!22288))))

(assert (= (and start!43370 res!286530) b!480427))

(assert (= (and b!480427 res!286527) b!480423))

(assert (= (and b!480423 res!286526) b!480425))

(assert (= (and b!480425 res!286529) b!480422))

(assert (= (and b!480422 res!286525) b!480430))

(assert (= (and b!480430 res!286528) b!480426))

(assert (= (and b!480426 c!57731) b!480429))

(assert (= (and b!480426 (not c!57731)) b!480424))

(assert (= (and b!480432 condMapEmpty!22288) mapIsEmpty!22288))

(assert (= (and b!480432 (not condMapEmpty!22288)) mapNonEmpty!22288))

(get-info :version)

(assert (= (and mapNonEmpty!22288 ((_ is ValueCellFull!6500) mapValue!22288)) b!480428))

(assert (= (and b!480432 ((_ is ValueCellFull!6500) mapDefault!22288)) b!480431))

(assert (= start!43370 b!480432))

(declare-fun m!461541 () Bool)

(assert (=> b!480422 m!461541))

(assert (=> b!480422 m!461541))

(declare-fun m!461543 () Bool)

(assert (=> b!480422 m!461543))

(declare-fun m!461545 () Bool)

(assert (=> b!480425 m!461545))

(declare-fun m!461547 () Bool)

(assert (=> mapNonEmpty!22288 m!461547))

(declare-fun m!461549 () Bool)

(assert (=> b!480430 m!461549))

(declare-fun m!461551 () Bool)

(assert (=> b!480426 m!461551))

(declare-fun m!461553 () Bool)

(assert (=> b!480426 m!461553))

(declare-fun m!461555 () Bool)

(assert (=> b!480426 m!461555))

(declare-fun m!461557 () Bool)

(assert (=> b!480426 m!461557))

(declare-fun m!461559 () Bool)

(assert (=> start!43370 m!461559))

(declare-fun m!461561 () Bool)

(assert (=> start!43370 m!461561))

(declare-fun m!461563 () Bool)

(assert (=> start!43370 m!461563))

(declare-fun m!461565 () Bool)

(assert (=> b!480429 m!461565))

(declare-fun m!461567 () Bool)

(assert (=> b!480423 m!461567))

(check-sat (not b!480422) (not b!480429) tp_is_empty!13723 (not mapNonEmpty!22288) (not start!43370) b_and!20941 (not b!480430) (not b_next!12211) (not b!480425) (not b!480423) (not b!480426))
(check-sat b_and!20941 (not b_next!12211))
