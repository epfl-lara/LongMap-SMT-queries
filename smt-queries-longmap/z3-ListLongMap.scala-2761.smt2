; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40404 () Bool)

(assert start!40404)

(declare-fun b!444448 () Bool)

(declare-fun res!263585 () Bool)

(declare-fun e!261367 () Bool)

(assert (=> b!444448 (=> (not res!263585) (not e!261367))))

(declare-datatypes ((array!27420 0))(
  ( (array!27421 (arr!13157 (Array (_ BitVec 32) (_ BitVec 64))) (size!13509 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27420)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16843 0))(
  ( (V!16844 (val!5946 Int)) )
))
(declare-datatypes ((ValueCell!5558 0))(
  ( (ValueCellFull!5558 (v!8198 V!16843)) (EmptyCell!5558) )
))
(declare-datatypes ((array!27422 0))(
  ( (array!27423 (arr!13158 (Array (_ BitVec 32) ValueCell!5558)) (size!13510 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27422)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444448 (= res!263585 (and (= (size!13510 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13509 _keys!709) (size!13510 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19332 () Bool)

(declare-fun mapRes!19332 () Bool)

(assert (=> mapIsEmpty!19332 mapRes!19332))

(declare-fun b!444449 () Bool)

(declare-fun res!263587 () Bool)

(assert (=> b!444449 (=> (not res!263587) (not e!261367))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444449 (= res!263587 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13509 _keys!709))))))

(declare-fun b!444451 () Bool)

(declare-fun res!263586 () Bool)

(assert (=> b!444451 (=> (not res!263586) (not e!261367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27420 (_ BitVec 32)) Bool)

(assert (=> b!444451 (= res!263586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444452 () Bool)

(declare-fun e!261370 () Bool)

(declare-fun e!261372 () Bool)

(assert (=> b!444452 (= e!261370 (and e!261372 mapRes!19332))))

(declare-fun condMapEmpty!19332 () Bool)

(declare-fun mapDefault!19332 () ValueCell!5558)

(assert (=> b!444452 (= condMapEmpty!19332 (= (arr!13158 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5558)) mapDefault!19332)))))

(declare-fun b!444453 () Bool)

(declare-fun e!261369 () Bool)

(assert (=> b!444453 (= e!261369 false)))

(declare-fun lt!203520 () Bool)

(declare-fun lt!203519 () array!27420)

(declare-datatypes ((List!7786 0))(
  ( (Nil!7783) (Cons!7782 (h!8638 (_ BitVec 64)) (t!13536 List!7786)) )
))
(declare-fun arrayNoDuplicates!0 (array!27420 (_ BitVec 32) List!7786) Bool)

(assert (=> b!444453 (= lt!203520 (arrayNoDuplicates!0 lt!203519 #b00000000000000000000000000000000 Nil!7783))))

(declare-fun b!444454 () Bool)

(assert (=> b!444454 (= e!261367 e!261369)))

(declare-fun res!263582 () Bool)

(assert (=> b!444454 (=> (not res!263582) (not e!261369))))

(assert (=> b!444454 (= res!263582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203519 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!444454 (= lt!203519 (array!27421 (store (arr!13157 _keys!709) i!563 k0!794) (size!13509 _keys!709)))))

(declare-fun b!444455 () Bool)

(declare-fun res!263580 () Bool)

(assert (=> b!444455 (=> (not res!263580) (not e!261367))))

(declare-fun arrayContainsKey!0 (array!27420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444455 (= res!263580 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444456 () Bool)

(declare-fun tp_is_empty!11803 () Bool)

(assert (=> b!444456 (= e!261372 tp_is_empty!11803)))

(declare-fun b!444457 () Bool)

(declare-fun res!263581 () Bool)

(assert (=> b!444457 (=> (not res!263581) (not e!261367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444457 (= res!263581 (validMask!0 mask!1025))))

(declare-fun b!444450 () Bool)

(declare-fun res!263584 () Bool)

(assert (=> b!444450 (=> (not res!263584) (not e!261367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444450 (= res!263584 (validKeyInArray!0 k0!794))))

(declare-fun res!263578 () Bool)

(assert (=> start!40404 (=> (not res!263578) (not e!261367))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40404 (= res!263578 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13509 _keys!709))))))

(assert (=> start!40404 e!261367))

(assert (=> start!40404 true))

(declare-fun array_inv!9616 (array!27422) Bool)

(assert (=> start!40404 (and (array_inv!9616 _values!549) e!261370)))

(declare-fun array_inv!9617 (array!27420) Bool)

(assert (=> start!40404 (array_inv!9617 _keys!709)))

(declare-fun mapNonEmpty!19332 () Bool)

(declare-fun tp!37314 () Bool)

(declare-fun e!261368 () Bool)

(assert (=> mapNonEmpty!19332 (= mapRes!19332 (and tp!37314 e!261368))))

(declare-fun mapValue!19332 () ValueCell!5558)

(declare-fun mapRest!19332 () (Array (_ BitVec 32) ValueCell!5558))

(declare-fun mapKey!19332 () (_ BitVec 32))

(assert (=> mapNonEmpty!19332 (= (arr!13158 _values!549) (store mapRest!19332 mapKey!19332 mapValue!19332))))

(declare-fun b!444458 () Bool)

(declare-fun res!263579 () Bool)

(assert (=> b!444458 (=> (not res!263579) (not e!261367))))

(assert (=> b!444458 (= res!263579 (or (= (select (arr!13157 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13157 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444459 () Bool)

(declare-fun res!263583 () Bool)

(assert (=> b!444459 (=> (not res!263583) (not e!261367))))

(assert (=> b!444459 (= res!263583 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7783))))

(declare-fun b!444460 () Bool)

(assert (=> b!444460 (= e!261368 tp_is_empty!11803)))

(assert (= (and start!40404 res!263578) b!444457))

(assert (= (and b!444457 res!263581) b!444448))

(assert (= (and b!444448 res!263585) b!444451))

(assert (= (and b!444451 res!263586) b!444459))

(assert (= (and b!444459 res!263583) b!444449))

(assert (= (and b!444449 res!263587) b!444450))

(assert (= (and b!444450 res!263584) b!444458))

(assert (= (and b!444458 res!263579) b!444455))

(assert (= (and b!444455 res!263580) b!444454))

(assert (= (and b!444454 res!263582) b!444453))

(assert (= (and b!444452 condMapEmpty!19332) mapIsEmpty!19332))

(assert (= (and b!444452 (not condMapEmpty!19332)) mapNonEmpty!19332))

(get-info :version)

(assert (= (and mapNonEmpty!19332 ((_ is ValueCellFull!5558) mapValue!19332)) b!444460))

(assert (= (and b!444452 ((_ is ValueCellFull!5558) mapDefault!19332)) b!444456))

(assert (= start!40404 b!444452))

(declare-fun m!430575 () Bool)

(assert (=> b!444454 m!430575))

(declare-fun m!430577 () Bool)

(assert (=> b!444454 m!430577))

(declare-fun m!430579 () Bool)

(assert (=> b!444457 m!430579))

(declare-fun m!430581 () Bool)

(assert (=> b!444458 m!430581))

(declare-fun m!430583 () Bool)

(assert (=> b!444451 m!430583))

(declare-fun m!430585 () Bool)

(assert (=> b!444450 m!430585))

(declare-fun m!430587 () Bool)

(assert (=> b!444459 m!430587))

(declare-fun m!430589 () Bool)

(assert (=> b!444455 m!430589))

(declare-fun m!430591 () Bool)

(assert (=> b!444453 m!430591))

(declare-fun m!430593 () Bool)

(assert (=> start!40404 m!430593))

(declare-fun m!430595 () Bool)

(assert (=> start!40404 m!430595))

(declare-fun m!430597 () Bool)

(assert (=> mapNonEmpty!19332 m!430597))

(check-sat (not start!40404) (not b!444453) (not b!444455) (not b!444459) (not b!444450) (not b!444454) tp_is_empty!11803 (not b!444457) (not mapNonEmpty!19332) (not b!444451))
(check-sat)
