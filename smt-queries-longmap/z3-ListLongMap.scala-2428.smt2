; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38340 () Bool)

(assert start!38340)

(declare-fun b!395367 () Bool)

(declare-fun res!226652 () Bool)

(declare-fun e!239375 () Bool)

(assert (=> b!395367 (=> (not res!226652) (not e!239375))))

(declare-datatypes ((array!23521 0))(
  ( (array!23522 (arr!11213 (Array (_ BitVec 32) (_ BitVec 64))) (size!11565 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23521)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14181 0))(
  ( (V!14182 (val!4948 Int)) )
))
(declare-datatypes ((ValueCell!4560 0))(
  ( (ValueCellFull!4560 (v!7194 V!14181)) (EmptyCell!4560) )
))
(declare-datatypes ((array!23523 0))(
  ( (array!23524 (arr!11214 (Array (_ BitVec 32) ValueCell!4560)) (size!11566 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23523)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395367 (= res!226652 (and (= (size!11566 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11565 _keys!709) (size!11566 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395368 () Bool)

(declare-fun e!239377 () Bool)

(declare-fun e!239373 () Bool)

(declare-fun mapRes!16323 () Bool)

(assert (=> b!395368 (= e!239377 (and e!239373 mapRes!16323))))

(declare-fun condMapEmpty!16323 () Bool)

(declare-fun mapDefault!16323 () ValueCell!4560)

(assert (=> b!395368 (= condMapEmpty!16323 (= (arr!11214 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4560)) mapDefault!16323)))))

(declare-fun mapIsEmpty!16323 () Bool)

(assert (=> mapIsEmpty!16323 mapRes!16323))

(declare-fun mapNonEmpty!16323 () Bool)

(declare-fun tp!32118 () Bool)

(declare-fun e!239374 () Bool)

(assert (=> mapNonEmpty!16323 (= mapRes!16323 (and tp!32118 e!239374))))

(declare-fun mapValue!16323 () ValueCell!4560)

(declare-fun mapRest!16323 () (Array (_ BitVec 32) ValueCell!4560))

(declare-fun mapKey!16323 () (_ BitVec 32))

(assert (=> mapNonEmpty!16323 (= (arr!11214 _values!549) (store mapRest!16323 mapKey!16323 mapValue!16323))))

(declare-fun b!395369 () Bool)

(declare-fun tp_is_empty!9807 () Bool)

(assert (=> b!395369 (= e!239373 tp_is_empty!9807)))

(declare-fun b!395370 () Bool)

(declare-fun res!226654 () Bool)

(assert (=> b!395370 (=> (not res!226654) (not e!239375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23521 (_ BitVec 32)) Bool)

(assert (=> b!395370 (= res!226654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395372 () Bool)

(assert (=> b!395372 (= e!239375 false)))

(declare-fun lt!187081 () Bool)

(declare-datatypes ((List!6509 0))(
  ( (Nil!6506) (Cons!6505 (h!7361 (_ BitVec 64)) (t!11683 List!6509)) )
))
(declare-fun arrayNoDuplicates!0 (array!23521 (_ BitVec 32) List!6509) Bool)

(assert (=> b!395372 (= lt!187081 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6506))))

(declare-fun b!395373 () Bool)

(assert (=> b!395373 (= e!239374 tp_is_empty!9807)))

(declare-fun res!226653 () Bool)

(assert (=> start!38340 (=> (not res!226653) (not e!239375))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38340 (= res!226653 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11565 _keys!709))))))

(assert (=> start!38340 e!239375))

(assert (=> start!38340 true))

(declare-fun array_inv!8230 (array!23523) Bool)

(assert (=> start!38340 (and (array_inv!8230 _values!549) e!239377)))

(declare-fun array_inv!8231 (array!23521) Bool)

(assert (=> start!38340 (array_inv!8231 _keys!709)))

(declare-fun b!395371 () Bool)

(declare-fun res!226651 () Bool)

(assert (=> b!395371 (=> (not res!226651) (not e!239375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395371 (= res!226651 (validMask!0 mask!1025))))

(assert (= (and start!38340 res!226653) b!395371))

(assert (= (and b!395371 res!226651) b!395367))

(assert (= (and b!395367 res!226652) b!395370))

(assert (= (and b!395370 res!226654) b!395372))

(assert (= (and b!395368 condMapEmpty!16323) mapIsEmpty!16323))

(assert (= (and b!395368 (not condMapEmpty!16323)) mapNonEmpty!16323))

(get-info :version)

(assert (= (and mapNonEmpty!16323 ((_ is ValueCellFull!4560) mapValue!16323)) b!395373))

(assert (= (and b!395368 ((_ is ValueCellFull!4560) mapDefault!16323)) b!395369))

(assert (= start!38340 b!395368))

(declare-fun m!391453 () Bool)

(assert (=> b!395371 m!391453))

(declare-fun m!391455 () Bool)

(assert (=> b!395372 m!391455))

(declare-fun m!391457 () Bool)

(assert (=> start!38340 m!391457))

(declare-fun m!391459 () Bool)

(assert (=> start!38340 m!391459))

(declare-fun m!391461 () Bool)

(assert (=> mapNonEmpty!16323 m!391461))

(declare-fun m!391463 () Bool)

(assert (=> b!395370 m!391463))

(check-sat (not b!395371) (not b!395372) (not start!38340) (not b!395370) tp_is_empty!9807 (not mapNonEmpty!16323))
(check-sat)
