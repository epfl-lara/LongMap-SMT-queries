; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40194 () Bool)

(assert start!40194)

(declare-fun b_free!10461 () Bool)

(declare-fun b_next!10461 () Bool)

(assert (=> start!40194 (= b_free!10461 (not b_next!10461))))

(declare-fun tp!36912 () Bool)

(declare-fun b_and!18429 () Bool)

(assert (=> start!40194 (= tp!36912 b_and!18429)))

(declare-fun b!440420 () Bool)

(declare-fun res!260492 () Bool)

(declare-fun e!259486 () Bool)

(assert (=> b!440420 (=> (not res!260492) (not e!259486))))

(declare-datatypes ((array!27039 0))(
  ( (array!27040 (arr!12969 (Array (_ BitVec 32) (_ BitVec 64))) (size!13321 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27039)

(declare-datatypes ((List!7773 0))(
  ( (Nil!7770) (Cons!7769 (h!8625 (_ BitVec 64)) (t!13529 List!7773)) )
))
(declare-fun arrayNoDuplicates!0 (array!27039 (_ BitVec 32) List!7773) Bool)

(assert (=> b!440420 (= res!260492 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7770))))

(declare-fun b!440421 () Bool)

(declare-fun res!260487 () Bool)

(assert (=> b!440421 (=> (not res!260487) (not e!259486))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440421 (= res!260487 (validKeyInArray!0 k0!794))))

(declare-fun b!440422 () Bool)

(declare-fun res!260488 () Bool)

(declare-fun e!259483 () Bool)

(assert (=> b!440422 (=> (not res!260488) (not e!259483))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440422 (= res!260488 (bvsle from!863 i!563))))

(declare-fun b!440423 () Bool)

(declare-fun res!260489 () Bool)

(assert (=> b!440423 (=> (not res!260489) (not e!259486))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16589 0))(
  ( (V!16590 (val!5851 Int)) )
))
(declare-datatypes ((ValueCell!5463 0))(
  ( (ValueCellFull!5463 (v!8098 V!16589)) (EmptyCell!5463) )
))
(declare-datatypes ((array!27041 0))(
  ( (array!27042 (arr!12970 (Array (_ BitVec 32) ValueCell!5463)) (size!13322 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27041)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!440423 (= res!260489 (and (= (size!13322 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13321 _keys!709) (size!13322 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440424 () Bool)

(declare-fun e!259488 () Bool)

(declare-fun e!259485 () Bool)

(declare-fun mapRes!19041 () Bool)

(assert (=> b!440424 (= e!259488 (and e!259485 mapRes!19041))))

(declare-fun condMapEmpty!19041 () Bool)

(declare-fun mapDefault!19041 () ValueCell!5463)

(assert (=> b!440424 (= condMapEmpty!19041 (= (arr!12970 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5463)) mapDefault!19041)))))

(declare-fun b!440425 () Bool)

(assert (=> b!440425 (= e!259486 e!259483)))

(declare-fun res!260491 () Bool)

(assert (=> b!440425 (=> (not res!260491) (not e!259483))))

(declare-fun lt!202580 () array!27039)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27039 (_ BitVec 32)) Bool)

(assert (=> b!440425 (= res!260491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202580 mask!1025))))

(assert (=> b!440425 (= lt!202580 (array!27040 (store (arr!12969 _keys!709) i!563 k0!794) (size!13321 _keys!709)))))

(declare-fun b!440426 () Bool)

(declare-fun e!259484 () Bool)

(assert (=> b!440426 (= e!259484 (not true))))

(declare-fun minValue!515 () V!16589)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202579 () array!27041)

(declare-fun zeroValue!515 () V!16589)

(declare-fun v!412 () V!16589)

(declare-datatypes ((tuple2!7776 0))(
  ( (tuple2!7777 (_1!3899 (_ BitVec 64)) (_2!3899 V!16589)) )
))
(declare-datatypes ((List!7774 0))(
  ( (Nil!7771) (Cons!7770 (h!8626 tuple2!7776) (t!13530 List!7774)) )
))
(declare-datatypes ((ListLongMap!6689 0))(
  ( (ListLongMap!6690 (toList!3360 List!7774)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1549 (array!27039 array!27041 (_ BitVec 32) (_ BitVec 32) V!16589 V!16589 (_ BitVec 32) Int) ListLongMap!6689)

(declare-fun +!1498 (ListLongMap!6689 tuple2!7776) ListLongMap!6689)

(assert (=> b!440426 (= (getCurrentListMapNoExtraKeys!1549 lt!202580 lt!202579 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1498 (getCurrentListMapNoExtraKeys!1549 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7777 k0!794 v!412)))))

(declare-datatypes ((Unit!13100 0))(
  ( (Unit!13101) )
))
(declare-fun lt!202577 () Unit!13100)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!667 (array!27039 array!27041 (_ BitVec 32) (_ BitVec 32) V!16589 V!16589 (_ BitVec 32) (_ BitVec 64) V!16589 (_ BitVec 32) Int) Unit!13100)

(assert (=> b!440426 (= lt!202577 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!667 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440427 () Bool)

(declare-fun res!260484 () Bool)

(assert (=> b!440427 (=> (not res!260484) (not e!259486))))

(assert (=> b!440427 (= res!260484 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13321 _keys!709))))))

(declare-fun mapIsEmpty!19041 () Bool)

(assert (=> mapIsEmpty!19041 mapRes!19041))

(declare-fun b!440428 () Bool)

(declare-fun res!260483 () Bool)

(assert (=> b!440428 (=> (not res!260483) (not e!259486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440428 (= res!260483 (validMask!0 mask!1025))))

(declare-fun b!440429 () Bool)

(declare-fun e!259487 () Bool)

(declare-fun tp_is_empty!11613 () Bool)

(assert (=> b!440429 (= e!259487 tp_is_empty!11613)))

(declare-fun b!440430 () Bool)

(declare-fun res!260486 () Bool)

(assert (=> b!440430 (=> (not res!260486) (not e!259486))))

(declare-fun arrayContainsKey!0 (array!27039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440430 (= res!260486 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440431 () Bool)

(declare-fun res!260481 () Bool)

(assert (=> b!440431 (=> (not res!260481) (not e!259486))))

(assert (=> b!440431 (= res!260481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440432 () Bool)

(declare-fun res!260493 () Bool)

(assert (=> b!440432 (=> (not res!260493) (not e!259486))))

(assert (=> b!440432 (= res!260493 (or (= (select (arr!12969 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12969 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!260490 () Bool)

(assert (=> start!40194 (=> (not res!260490) (not e!259486))))

(assert (=> start!40194 (= res!260490 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13321 _keys!709))))))

(assert (=> start!40194 e!259486))

(assert (=> start!40194 tp_is_empty!11613))

(assert (=> start!40194 tp!36912))

(assert (=> start!40194 true))

(declare-fun array_inv!9414 (array!27041) Bool)

(assert (=> start!40194 (and (array_inv!9414 _values!549) e!259488)))

(declare-fun array_inv!9415 (array!27039) Bool)

(assert (=> start!40194 (array_inv!9415 _keys!709)))

(declare-fun b!440433 () Bool)

(assert (=> b!440433 (= e!259485 tp_is_empty!11613)))

(declare-fun mapNonEmpty!19041 () Bool)

(declare-fun tp!36911 () Bool)

(assert (=> mapNonEmpty!19041 (= mapRes!19041 (and tp!36911 e!259487))))

(declare-fun mapValue!19041 () ValueCell!5463)

(declare-fun mapRest!19041 () (Array (_ BitVec 32) ValueCell!5463))

(declare-fun mapKey!19041 () (_ BitVec 32))

(assert (=> mapNonEmpty!19041 (= (arr!12970 _values!549) (store mapRest!19041 mapKey!19041 mapValue!19041))))

(declare-fun b!440434 () Bool)

(assert (=> b!440434 (= e!259483 e!259484)))

(declare-fun res!260485 () Bool)

(assert (=> b!440434 (=> (not res!260485) (not e!259484))))

(assert (=> b!440434 (= res!260485 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202576 () ListLongMap!6689)

(assert (=> b!440434 (= lt!202576 (getCurrentListMapNoExtraKeys!1549 lt!202580 lt!202579 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440434 (= lt!202579 (array!27042 (store (arr!12970 _values!549) i!563 (ValueCellFull!5463 v!412)) (size!13322 _values!549)))))

(declare-fun lt!202578 () ListLongMap!6689)

(assert (=> b!440434 (= lt!202578 (getCurrentListMapNoExtraKeys!1549 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440435 () Bool)

(declare-fun res!260482 () Bool)

(assert (=> b!440435 (=> (not res!260482) (not e!259483))))

(assert (=> b!440435 (= res!260482 (arrayNoDuplicates!0 lt!202580 #b00000000000000000000000000000000 Nil!7770))))

(assert (= (and start!40194 res!260490) b!440428))

(assert (= (and b!440428 res!260483) b!440423))

(assert (= (and b!440423 res!260489) b!440431))

(assert (= (and b!440431 res!260481) b!440420))

(assert (= (and b!440420 res!260492) b!440427))

(assert (= (and b!440427 res!260484) b!440421))

(assert (= (and b!440421 res!260487) b!440432))

(assert (= (and b!440432 res!260493) b!440430))

(assert (= (and b!440430 res!260486) b!440425))

(assert (= (and b!440425 res!260491) b!440435))

(assert (= (and b!440435 res!260482) b!440422))

(assert (= (and b!440422 res!260488) b!440434))

(assert (= (and b!440434 res!260485) b!440426))

(assert (= (and b!440424 condMapEmpty!19041) mapIsEmpty!19041))

(assert (= (and b!440424 (not condMapEmpty!19041)) mapNonEmpty!19041))

(get-info :version)

(assert (= (and mapNonEmpty!19041 ((_ is ValueCellFull!5463) mapValue!19041)) b!440429))

(assert (= (and b!440424 ((_ is ValueCellFull!5463) mapDefault!19041)) b!440433))

(assert (= start!40194 b!440424))

(declare-fun m!427469 () Bool)

(assert (=> b!440426 m!427469))

(declare-fun m!427471 () Bool)

(assert (=> b!440426 m!427471))

(assert (=> b!440426 m!427471))

(declare-fun m!427473 () Bool)

(assert (=> b!440426 m!427473))

(declare-fun m!427475 () Bool)

(assert (=> b!440426 m!427475))

(declare-fun m!427477 () Bool)

(assert (=> b!440434 m!427477))

(declare-fun m!427479 () Bool)

(assert (=> b!440434 m!427479))

(declare-fun m!427481 () Bool)

(assert (=> b!440434 m!427481))

(declare-fun m!427483 () Bool)

(assert (=> b!440435 m!427483))

(declare-fun m!427485 () Bool)

(assert (=> b!440421 m!427485))

(declare-fun m!427487 () Bool)

(assert (=> b!440432 m!427487))

(declare-fun m!427489 () Bool)

(assert (=> b!440430 m!427489))

(declare-fun m!427491 () Bool)

(assert (=> b!440425 m!427491))

(declare-fun m!427493 () Bool)

(assert (=> b!440425 m!427493))

(declare-fun m!427495 () Bool)

(assert (=> start!40194 m!427495))

(declare-fun m!427497 () Bool)

(assert (=> start!40194 m!427497))

(declare-fun m!427499 () Bool)

(assert (=> b!440431 m!427499))

(declare-fun m!427501 () Bool)

(assert (=> b!440420 m!427501))

(declare-fun m!427503 () Bool)

(assert (=> b!440428 m!427503))

(declare-fun m!427505 () Bool)

(assert (=> mapNonEmpty!19041 m!427505))

(check-sat (not b!440428) (not b!440434) (not b!440425) tp_is_empty!11613 (not start!40194) b_and!18429 (not b_next!10461) (not b!440435) (not b!440421) (not b!440431) (not mapNonEmpty!19041) (not b!440420) (not b!440426) (not b!440430))
(check-sat b_and!18429 (not b_next!10461))
