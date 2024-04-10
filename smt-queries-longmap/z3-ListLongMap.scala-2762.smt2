; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40426 () Bool)

(assert start!40426)

(declare-fun b!444653 () Bool)

(declare-fun e!261475 () Bool)

(declare-fun e!261476 () Bool)

(declare-fun mapRes!19344 () Bool)

(assert (=> b!444653 (= e!261475 (and e!261476 mapRes!19344))))

(declare-fun condMapEmpty!19344 () Bool)

(declare-datatypes ((V!16853 0))(
  ( (V!16854 (val!5950 Int)) )
))
(declare-datatypes ((ValueCell!5562 0))(
  ( (ValueCellFull!5562 (v!8201 V!16853)) (EmptyCell!5562) )
))
(declare-datatypes ((array!27431 0))(
  ( (array!27432 (arr!13163 (Array (_ BitVec 32) ValueCell!5562)) (size!13515 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27431)

(declare-fun mapDefault!19344 () ValueCell!5562)

(assert (=> b!444653 (= condMapEmpty!19344 (= (arr!13163 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5562)) mapDefault!19344)))))

(declare-fun b!444654 () Bool)

(declare-fun e!261474 () Bool)

(assert (=> b!444654 (= e!261474 false)))

(declare-fun lt!203525 () Bool)

(declare-datatypes ((array!27433 0))(
  ( (array!27434 (arr!13164 (Array (_ BitVec 32) (_ BitVec 64))) (size!13516 (_ BitVec 32))) )
))
(declare-fun lt!203524 () array!27433)

(declare-datatypes ((List!7876 0))(
  ( (Nil!7873) (Cons!7872 (h!8728 (_ BitVec 64)) (t!13634 List!7876)) )
))
(declare-fun arrayNoDuplicates!0 (array!27433 (_ BitVec 32) List!7876) Bool)

(assert (=> b!444654 (= lt!203525 (arrayNoDuplicates!0 lt!203524 #b00000000000000000000000000000000 Nil!7873))))

(declare-fun b!444655 () Bool)

(declare-fun res!263709 () Bool)

(declare-fun e!261472 () Bool)

(assert (=> b!444655 (=> (not res!263709) (not e!261472))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27433)

(assert (=> b!444655 (= res!263709 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13516 _keys!709))))))

(declare-fun b!444656 () Bool)

(declare-fun tp_is_empty!11811 () Bool)

(assert (=> b!444656 (= e!261476 tp_is_empty!11811)))

(declare-fun b!444657 () Bool)

(declare-fun res!263705 () Bool)

(assert (=> b!444657 (=> (not res!263705) (not e!261472))))

(assert (=> b!444657 (= res!263705 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7873))))

(declare-fun res!263703 () Bool)

(assert (=> start!40426 (=> (not res!263703) (not e!261472))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40426 (= res!263703 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13516 _keys!709))))))

(assert (=> start!40426 e!261472))

(assert (=> start!40426 true))

(declare-fun array_inv!9546 (array!27431) Bool)

(assert (=> start!40426 (and (array_inv!9546 _values!549) e!261475)))

(declare-fun array_inv!9547 (array!27433) Bool)

(assert (=> start!40426 (array_inv!9547 _keys!709)))

(declare-fun b!444658 () Bool)

(declare-fun res!263708 () Bool)

(assert (=> b!444658 (=> (not res!263708) (not e!261472))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444658 (= res!263708 (and (= (size!13515 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13516 _keys!709) (size!13515 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19344 () Bool)

(declare-fun tp!37326 () Bool)

(declare-fun e!261471 () Bool)

(assert (=> mapNonEmpty!19344 (= mapRes!19344 (and tp!37326 e!261471))))

(declare-fun mapValue!19344 () ValueCell!5562)

(declare-fun mapKey!19344 () (_ BitVec 32))

(declare-fun mapRest!19344 () (Array (_ BitVec 32) ValueCell!5562))

(assert (=> mapNonEmpty!19344 (= (arr!13163 _values!549) (store mapRest!19344 mapKey!19344 mapValue!19344))))

(declare-fun b!444659 () Bool)

(assert (=> b!444659 (= e!261471 tp_is_empty!11811)))

(declare-fun b!444660 () Bool)

(assert (=> b!444660 (= e!261472 e!261474)))

(declare-fun res!263701 () Bool)

(assert (=> b!444660 (=> (not res!263701) (not e!261474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27433 (_ BitVec 32)) Bool)

(assert (=> b!444660 (= res!263701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203524 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!444660 (= lt!203524 (array!27434 (store (arr!13164 _keys!709) i!563 k0!794) (size!13516 _keys!709)))))

(declare-fun b!444661 () Bool)

(declare-fun res!263707 () Bool)

(assert (=> b!444661 (=> (not res!263707) (not e!261472))))

(declare-fun arrayContainsKey!0 (array!27433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444661 (= res!263707 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444662 () Bool)

(declare-fun res!263702 () Bool)

(assert (=> b!444662 (=> (not res!263702) (not e!261472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444662 (= res!263702 (validKeyInArray!0 k0!794))))

(declare-fun b!444663 () Bool)

(declare-fun res!263704 () Bool)

(assert (=> b!444663 (=> (not res!263704) (not e!261472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444663 (= res!263704 (validMask!0 mask!1025))))

(declare-fun b!444664 () Bool)

(declare-fun res!263706 () Bool)

(assert (=> b!444664 (=> (not res!263706) (not e!261472))))

(assert (=> b!444664 (= res!263706 (or (= (select (arr!13164 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13164 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19344 () Bool)

(assert (=> mapIsEmpty!19344 mapRes!19344))

(declare-fun b!444665 () Bool)

(declare-fun res!263710 () Bool)

(assert (=> b!444665 (=> (not res!263710) (not e!261472))))

(assert (=> b!444665 (= res!263710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40426 res!263703) b!444663))

(assert (= (and b!444663 res!263704) b!444658))

(assert (= (and b!444658 res!263708) b!444665))

(assert (= (and b!444665 res!263710) b!444657))

(assert (= (and b!444657 res!263705) b!444655))

(assert (= (and b!444655 res!263709) b!444662))

(assert (= (and b!444662 res!263702) b!444664))

(assert (= (and b!444664 res!263706) b!444661))

(assert (= (and b!444661 res!263707) b!444660))

(assert (= (and b!444660 res!263701) b!444654))

(assert (= (and b!444653 condMapEmpty!19344) mapIsEmpty!19344))

(assert (= (and b!444653 (not condMapEmpty!19344)) mapNonEmpty!19344))

(get-info :version)

(assert (= (and mapNonEmpty!19344 ((_ is ValueCellFull!5562) mapValue!19344)) b!444659))

(assert (= (and b!444653 ((_ is ValueCellFull!5562) mapDefault!19344)) b!444656))

(assert (= start!40426 b!444653))

(declare-fun m!430453 () Bool)

(assert (=> start!40426 m!430453))

(declare-fun m!430455 () Bool)

(assert (=> start!40426 m!430455))

(declare-fun m!430457 () Bool)

(assert (=> b!444661 m!430457))

(declare-fun m!430459 () Bool)

(assert (=> b!444664 m!430459))

(declare-fun m!430461 () Bool)

(assert (=> b!444662 m!430461))

(declare-fun m!430463 () Bool)

(assert (=> b!444665 m!430463))

(declare-fun m!430465 () Bool)

(assert (=> b!444657 m!430465))

(declare-fun m!430467 () Bool)

(assert (=> b!444660 m!430467))

(declare-fun m!430469 () Bool)

(assert (=> b!444660 m!430469))

(declare-fun m!430471 () Bool)

(assert (=> b!444654 m!430471))

(declare-fun m!430473 () Bool)

(assert (=> b!444663 m!430473))

(declare-fun m!430475 () Bool)

(assert (=> mapNonEmpty!19344 m!430475))

(check-sat (not mapNonEmpty!19344) (not b!444662) (not start!40426) (not b!444654) (not b!444660) (not b!444663) (not b!444661) (not b!444665) (not b!444657) tp_is_empty!11811)
(check-sat)
