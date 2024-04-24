; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38330 () Bool)

(assert start!38330)

(declare-fun b!395370 () Bool)

(declare-fun e!239373 () Bool)

(declare-fun tp_is_empty!9811 () Bool)

(assert (=> b!395370 (= e!239373 tp_is_empty!9811)))

(declare-fun mapNonEmpty!16329 () Bool)

(declare-fun mapRes!16329 () Bool)

(declare-fun tp!32124 () Bool)

(assert (=> mapNonEmpty!16329 (= mapRes!16329 (and tp!32124 e!239373))))

(declare-datatypes ((V!14187 0))(
  ( (V!14188 (val!4950 Int)) )
))
(declare-datatypes ((ValueCell!4562 0))(
  ( (ValueCellFull!4562 (v!7197 V!14187)) (EmptyCell!4562) )
))
(declare-fun mapValue!16329 () ValueCell!4562)

(declare-datatypes ((array!23524 0))(
  ( (array!23525 (arr!11214 (Array (_ BitVec 32) ValueCell!4562)) (size!11566 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23524)

(declare-fun mapRest!16329 () (Array (_ BitVec 32) ValueCell!4562))

(declare-fun mapKey!16329 () (_ BitVec 32))

(assert (=> mapNonEmpty!16329 (= (arr!11214 _values!549) (store mapRest!16329 mapKey!16329 mapValue!16329))))

(declare-fun b!395371 () Bool)

(declare-fun e!239371 () Bool)

(declare-datatypes ((array!23526 0))(
  ( (array!23527 (arr!11215 (Array (_ BitVec 32) (_ BitVec 64))) (size!11567 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23526)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395371 (= e!239371 (not (= (size!11567 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025))))))

(declare-fun b!395372 () Bool)

(declare-fun res!226685 () Bool)

(assert (=> b!395372 (=> (not res!226685) (not e!239371))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395372 (= res!226685 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11567 _keys!709))))))

(declare-fun b!395373 () Bool)

(declare-fun res!226686 () Bool)

(assert (=> b!395373 (=> (not res!226686) (not e!239371))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395373 (= res!226686 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16329 () Bool)

(assert (=> mapIsEmpty!16329 mapRes!16329))

(declare-fun b!395374 () Bool)

(declare-fun res!226683 () Bool)

(assert (=> b!395374 (=> (not res!226683) (not e!239371))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395374 (= res!226683 (and (= (size!11566 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11567 _keys!709) (size!11566 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395375 () Bool)

(declare-fun res!226684 () Bool)

(assert (=> b!395375 (=> (not res!226684) (not e!239371))))

(assert (=> b!395375 (= res!226684 (or (= (select (arr!11215 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11215 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395376 () Bool)

(declare-fun res!226687 () Bool)

(assert (=> b!395376 (=> (not res!226687) (not e!239371))))

(declare-datatypes ((List!6374 0))(
  ( (Nil!6371) (Cons!6370 (h!7226 (_ BitVec 64)) (t!11540 List!6374)) )
))
(declare-fun arrayNoDuplicates!0 (array!23526 (_ BitVec 32) List!6374) Bool)

(assert (=> b!395376 (= res!226687 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6371))))

(declare-fun b!395377 () Bool)

(declare-fun e!239374 () Bool)

(declare-fun e!239375 () Bool)

(assert (=> b!395377 (= e!239374 (and e!239375 mapRes!16329))))

(declare-fun condMapEmpty!16329 () Bool)

(declare-fun mapDefault!16329 () ValueCell!4562)

(assert (=> b!395377 (= condMapEmpty!16329 (= (arr!11214 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4562)) mapDefault!16329)))))

(declare-fun b!395378 () Bool)

(declare-fun res!226688 () Bool)

(assert (=> b!395378 (=> (not res!226688) (not e!239371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395378 (= res!226688 (validKeyInArray!0 k0!794))))

(declare-fun res!226682 () Bool)

(assert (=> start!38330 (=> (not res!226682) (not e!239371))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38330 (= res!226682 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11567 _keys!709))))))

(assert (=> start!38330 e!239371))

(assert (=> start!38330 true))

(declare-fun array_inv!8294 (array!23524) Bool)

(assert (=> start!38330 (and (array_inv!8294 _values!549) e!239374)))

(declare-fun array_inv!8295 (array!23526) Bool)

(assert (=> start!38330 (array_inv!8295 _keys!709)))

(declare-fun b!395379 () Bool)

(assert (=> b!395379 (= e!239375 tp_is_empty!9811)))

(declare-fun b!395380 () Bool)

(declare-fun res!226690 () Bool)

(assert (=> b!395380 (=> (not res!226690) (not e!239371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23526 (_ BitVec 32)) Bool)

(assert (=> b!395380 (= res!226690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395381 () Bool)

(declare-fun res!226689 () Bool)

(assert (=> b!395381 (=> (not res!226689) (not e!239371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395381 (= res!226689 (validMask!0 mask!1025))))

(assert (= (and start!38330 res!226682) b!395381))

(assert (= (and b!395381 res!226689) b!395374))

(assert (= (and b!395374 res!226683) b!395380))

(assert (= (and b!395380 res!226690) b!395376))

(assert (= (and b!395376 res!226687) b!395372))

(assert (= (and b!395372 res!226685) b!395378))

(assert (= (and b!395378 res!226688) b!395375))

(assert (= (and b!395375 res!226684) b!395373))

(assert (= (and b!395373 res!226686) b!395371))

(assert (= (and b!395377 condMapEmpty!16329) mapIsEmpty!16329))

(assert (= (and b!395377 (not condMapEmpty!16329)) mapNonEmpty!16329))

(get-info :version)

(assert (= (and mapNonEmpty!16329 ((_ is ValueCellFull!4562) mapValue!16329)) b!395370))

(assert (= (and b!395377 ((_ is ValueCellFull!4562) mapDefault!16329)) b!395379))

(assert (= start!38330 b!395377))

(declare-fun m!391707 () Bool)

(assert (=> b!395380 m!391707))

(declare-fun m!391709 () Bool)

(assert (=> mapNonEmpty!16329 m!391709))

(declare-fun m!391711 () Bool)

(assert (=> b!395381 m!391711))

(declare-fun m!391713 () Bool)

(assert (=> b!395375 m!391713))

(declare-fun m!391715 () Bool)

(assert (=> b!395376 m!391715))

(declare-fun m!391717 () Bool)

(assert (=> b!395378 m!391717))

(declare-fun m!391719 () Bool)

(assert (=> start!38330 m!391719))

(declare-fun m!391721 () Bool)

(assert (=> start!38330 m!391721))

(declare-fun m!391723 () Bool)

(assert (=> b!395373 m!391723))

(check-sat (not b!395378) (not start!38330) (not b!395373) (not b!395380) (not b!395376) tp_is_empty!9811 (not mapNonEmpty!16329) (not b!395381))
(check-sat)
