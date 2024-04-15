; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40990 () Bool)

(assert start!40990)

(declare-fun b_free!10939 () Bool)

(declare-fun b_next!10939 () Bool)

(assert (=> start!40990 (= b_free!10939 (not b_next!10939))))

(declare-fun tp!38643 () Bool)

(declare-fun b_and!19055 () Bool)

(assert (=> start!40990 (= tp!38643 b_and!19055)))

(declare-fun b!456521 () Bool)

(declare-fun e!266672 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28345 0))(
  ( (array!28346 (arr!13616 (Array (_ BitVec 32) (_ BitVec 64))) (size!13969 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28345)

(assert (=> b!456521 (= e!266672 (bvslt from!863 (size!13969 _keys!709)))))

(declare-fun b!456522 () Bool)

(declare-fun e!266673 () Bool)

(declare-fun tp_is_empty!12277 () Bool)

(assert (=> b!456522 (= e!266673 tp_is_empty!12277)))

(declare-fun mapIsEmpty!20056 () Bool)

(declare-fun mapRes!20056 () Bool)

(assert (=> mapIsEmpty!20056 mapRes!20056))

(declare-fun b!456523 () Bool)

(declare-fun res!272537 () Bool)

(declare-fun e!266674 () Bool)

(assert (=> b!456523 (=> (not res!272537) (not e!266674))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456523 (= res!272537 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456524 () Bool)

(declare-fun res!272538 () Bool)

(assert (=> b!456524 (=> (not res!272538) (not e!266674))))

(declare-datatypes ((List!8229 0))(
  ( (Nil!8226) (Cons!8225 (h!9081 (_ BitVec 64)) (t!14048 List!8229)) )
))
(declare-fun arrayNoDuplicates!0 (array!28345 (_ BitVec 32) List!8229) Bool)

(assert (=> b!456524 (= res!272538 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8226))))

(declare-fun b!456525 () Bool)

(declare-fun res!272532 () Bool)

(assert (=> b!456525 (=> (not res!272532) (not e!266674))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456525 (= res!272532 (or (= (select (arr!13616 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13616 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!272536 () Bool)

(assert (=> start!40990 (=> (not res!272536) (not e!266674))))

(assert (=> start!40990 (= res!272536 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13969 _keys!709))))))

(assert (=> start!40990 e!266674))

(assert (=> start!40990 tp_is_empty!12277))

(assert (=> start!40990 tp!38643))

(assert (=> start!40990 true))

(declare-datatypes ((V!17475 0))(
  ( (V!17476 (val!6183 Int)) )
))
(declare-datatypes ((ValueCell!5795 0))(
  ( (ValueCellFull!5795 (v!8443 V!17475)) (EmptyCell!5795) )
))
(declare-datatypes ((array!28347 0))(
  ( (array!28348 (arr!13617 (Array (_ BitVec 32) ValueCell!5795)) (size!13970 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28347)

(declare-fun e!266670 () Bool)

(declare-fun array_inv!9920 (array!28347) Bool)

(assert (=> start!40990 (and (array_inv!9920 _values!549) e!266670)))

(declare-fun array_inv!9921 (array!28345) Bool)

(assert (=> start!40990 (array_inv!9921 _keys!709)))

(declare-fun mapNonEmpty!20056 () Bool)

(declare-fun tp!38644 () Bool)

(declare-fun e!266671 () Bool)

(assert (=> mapNonEmpty!20056 (= mapRes!20056 (and tp!38644 e!266671))))

(declare-fun mapRest!20056 () (Array (_ BitVec 32) ValueCell!5795))

(declare-fun mapValue!20056 () ValueCell!5795)

(declare-fun mapKey!20056 () (_ BitVec 32))

(assert (=> mapNonEmpty!20056 (= (arr!13617 _values!549) (store mapRest!20056 mapKey!20056 mapValue!20056))))

(declare-fun b!456526 () Bool)

(declare-fun e!266677 () Bool)

(assert (=> b!456526 (= e!266677 (not e!266672))))

(declare-fun res!272533 () Bool)

(assert (=> b!456526 (=> res!272533 e!266672)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456526 (= res!272533 (not (validKeyInArray!0 (select (arr!13616 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17475)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17475)

(declare-fun lt!206426 () array!28347)

(declare-fun v!412 () V!17475)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!206424 () array!28345)

(declare-datatypes ((tuple2!8166 0))(
  ( (tuple2!8167 (_1!4094 (_ BitVec 64)) (_2!4094 V!17475)) )
))
(declare-datatypes ((List!8230 0))(
  ( (Nil!8227) (Cons!8226 (h!9082 tuple2!8166) (t!14049 List!8230)) )
))
(declare-datatypes ((ListLongMap!7069 0))(
  ( (ListLongMap!7070 (toList!3550 List!8230)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1745 (array!28345 array!28347 (_ BitVec 32) (_ BitVec 32) V!17475 V!17475 (_ BitVec 32) Int) ListLongMap!7069)

(declare-fun +!1604 (ListLongMap!7069 tuple2!8166) ListLongMap!7069)

(assert (=> b!456526 (= (getCurrentListMapNoExtraKeys!1745 lt!206424 lt!206426 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1604 (getCurrentListMapNoExtraKeys!1745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8167 k0!794 v!412)))))

(declare-datatypes ((Unit!13257 0))(
  ( (Unit!13258) )
))
(declare-fun lt!206422 () Unit!13257)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!741 (array!28345 array!28347 (_ BitVec 32) (_ BitVec 32) V!17475 V!17475 (_ BitVec 32) (_ BitVec 64) V!17475 (_ BitVec 32) Int) Unit!13257)

(assert (=> b!456526 (= lt!206422 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456527 () Bool)

(declare-fun e!266676 () Bool)

(assert (=> b!456527 (= e!266674 e!266676)))

(declare-fun res!272534 () Bool)

(assert (=> b!456527 (=> (not res!272534) (not e!266676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28345 (_ BitVec 32)) Bool)

(assert (=> b!456527 (= res!272534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206424 mask!1025))))

(assert (=> b!456527 (= lt!206424 (array!28346 (store (arr!13616 _keys!709) i!563 k0!794) (size!13969 _keys!709)))))

(declare-fun b!456528 () Bool)

(declare-fun res!272529 () Bool)

(assert (=> b!456528 (=> (not res!272529) (not e!266674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456528 (= res!272529 (validMask!0 mask!1025))))

(declare-fun b!456529 () Bool)

(declare-fun res!272527 () Bool)

(assert (=> b!456529 (=> (not res!272527) (not e!266674))))

(assert (=> b!456529 (= res!272527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456530 () Bool)

(assert (=> b!456530 (= e!266670 (and e!266673 mapRes!20056))))

(declare-fun condMapEmpty!20056 () Bool)

(declare-fun mapDefault!20056 () ValueCell!5795)

(assert (=> b!456530 (= condMapEmpty!20056 (= (arr!13617 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5795)) mapDefault!20056)))))

(declare-fun b!456531 () Bool)

(declare-fun res!272539 () Bool)

(assert (=> b!456531 (=> (not res!272539) (not e!266676))))

(assert (=> b!456531 (= res!272539 (arrayNoDuplicates!0 lt!206424 #b00000000000000000000000000000000 Nil!8226))))

(declare-fun b!456532 () Bool)

(declare-fun res!272540 () Bool)

(assert (=> b!456532 (=> (not res!272540) (not e!266674))))

(assert (=> b!456532 (= res!272540 (and (= (size!13970 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13969 _keys!709) (size!13970 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456533 () Bool)

(declare-fun res!272535 () Bool)

(assert (=> b!456533 (=> (not res!272535) (not e!266676))))

(assert (=> b!456533 (= res!272535 (bvsle from!863 i!563))))

(declare-fun b!456534 () Bool)

(declare-fun res!272531 () Bool)

(assert (=> b!456534 (=> (not res!272531) (not e!266674))))

(assert (=> b!456534 (= res!272531 (validKeyInArray!0 k0!794))))

(declare-fun b!456535 () Bool)

(assert (=> b!456535 (= e!266671 tp_is_empty!12277)))

(declare-fun b!456536 () Bool)

(assert (=> b!456536 (= e!266676 e!266677)))

(declare-fun res!272528 () Bool)

(assert (=> b!456536 (=> (not res!272528) (not e!266677))))

(assert (=> b!456536 (= res!272528 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206425 () ListLongMap!7069)

(assert (=> b!456536 (= lt!206425 (getCurrentListMapNoExtraKeys!1745 lt!206424 lt!206426 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456536 (= lt!206426 (array!28348 (store (arr!13617 _values!549) i!563 (ValueCellFull!5795 v!412)) (size!13970 _values!549)))))

(declare-fun lt!206423 () ListLongMap!7069)

(assert (=> b!456536 (= lt!206423 (getCurrentListMapNoExtraKeys!1745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456537 () Bool)

(declare-fun res!272530 () Bool)

(assert (=> b!456537 (=> (not res!272530) (not e!266674))))

(assert (=> b!456537 (= res!272530 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13969 _keys!709))))))

(assert (= (and start!40990 res!272536) b!456528))

(assert (= (and b!456528 res!272529) b!456532))

(assert (= (and b!456532 res!272540) b!456529))

(assert (= (and b!456529 res!272527) b!456524))

(assert (= (and b!456524 res!272538) b!456537))

(assert (= (and b!456537 res!272530) b!456534))

(assert (= (and b!456534 res!272531) b!456525))

(assert (= (and b!456525 res!272532) b!456523))

(assert (= (and b!456523 res!272537) b!456527))

(assert (= (and b!456527 res!272534) b!456531))

(assert (= (and b!456531 res!272539) b!456533))

(assert (= (and b!456533 res!272535) b!456536))

(assert (= (and b!456536 res!272528) b!456526))

(assert (= (and b!456526 (not res!272533)) b!456521))

(assert (= (and b!456530 condMapEmpty!20056) mapIsEmpty!20056))

(assert (= (and b!456530 (not condMapEmpty!20056)) mapNonEmpty!20056))

(get-info :version)

(assert (= (and mapNonEmpty!20056 ((_ is ValueCellFull!5795) mapValue!20056)) b!456535))

(assert (= (and b!456530 ((_ is ValueCellFull!5795) mapDefault!20056)) b!456522))

(assert (= start!40990 b!456530))

(declare-fun m!439451 () Bool)

(assert (=> start!40990 m!439451))

(declare-fun m!439453 () Bool)

(assert (=> start!40990 m!439453))

(declare-fun m!439455 () Bool)

(assert (=> b!456525 m!439455))

(declare-fun m!439457 () Bool)

(assert (=> mapNonEmpty!20056 m!439457))

(declare-fun m!439459 () Bool)

(assert (=> b!456534 m!439459))

(declare-fun m!439461 () Bool)

(assert (=> b!456531 m!439461))

(declare-fun m!439463 () Bool)

(assert (=> b!456529 m!439463))

(declare-fun m!439465 () Bool)

(assert (=> b!456536 m!439465))

(declare-fun m!439467 () Bool)

(assert (=> b!456536 m!439467))

(declare-fun m!439469 () Bool)

(assert (=> b!456536 m!439469))

(declare-fun m!439471 () Bool)

(assert (=> b!456527 m!439471))

(declare-fun m!439473 () Bool)

(assert (=> b!456527 m!439473))

(declare-fun m!439475 () Bool)

(assert (=> b!456526 m!439475))

(declare-fun m!439477 () Bool)

(assert (=> b!456526 m!439477))

(declare-fun m!439479 () Bool)

(assert (=> b!456526 m!439479))

(assert (=> b!456526 m!439477))

(declare-fun m!439481 () Bool)

(assert (=> b!456526 m!439481))

(assert (=> b!456526 m!439475))

(declare-fun m!439483 () Bool)

(assert (=> b!456526 m!439483))

(declare-fun m!439485 () Bool)

(assert (=> b!456526 m!439485))

(declare-fun m!439487 () Bool)

(assert (=> b!456524 m!439487))

(declare-fun m!439489 () Bool)

(assert (=> b!456523 m!439489))

(declare-fun m!439491 () Bool)

(assert (=> b!456528 m!439491))

(check-sat (not b!456534) (not b!456536) (not b!456528) b_and!19055 (not b!456531) (not b!456524) (not b_next!10939) (not b!456523) (not b!456527) (not b!456529) (not mapNonEmpty!20056) tp_is_empty!12277 (not b!456526) (not start!40990))
(check-sat b_and!19055 (not b_next!10939))
