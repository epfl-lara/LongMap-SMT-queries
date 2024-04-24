; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34396 () Bool)

(assert start!34396)

(declare-fun b_free!7333 () Bool)

(declare-fun b_next!7333 () Bool)

(assert (=> start!34396 (= b_free!7333 (not b_next!7333))))

(declare-fun tp!25545 () Bool)

(declare-fun b_and!14555 () Bool)

(assert (=> start!34396 (= tp!25545 b_and!14555)))

(declare-fun b!343490 () Bool)

(declare-fun e!210620 () Bool)

(declare-fun tp_is_empty!7285 () Bool)

(assert (=> b!343490 (= e!210620 tp_is_empty!7285)))

(declare-fun res!189887 () Bool)

(declare-fun e!210617 () Bool)

(assert (=> start!34396 (=> (not res!189887) (not e!210617))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34396 (= res!189887 (validMask!0 mask!2385))))

(assert (=> start!34396 e!210617))

(assert (=> start!34396 true))

(assert (=> start!34396 tp_is_empty!7285))

(assert (=> start!34396 tp!25545))

(declare-datatypes ((V!10691 0))(
  ( (V!10692 (val!3687 Int)) )
))
(declare-datatypes ((ValueCell!3299 0))(
  ( (ValueCellFull!3299 (v!5864 V!10691)) (EmptyCell!3299) )
))
(declare-datatypes ((array!18160 0))(
  ( (array!18161 (arr!8596 (Array (_ BitVec 32) ValueCell!3299)) (size!8948 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18160)

(declare-fun e!210616 () Bool)

(declare-fun array_inv!6352 (array!18160) Bool)

(assert (=> start!34396 (and (array_inv!6352 _values!1525) e!210616)))

(declare-datatypes ((array!18162 0))(
  ( (array!18163 (arr!8597 (Array (_ BitVec 32) (_ BitVec 64))) (size!8949 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18162)

(declare-fun array_inv!6353 (array!18162) Bool)

(assert (=> start!34396 (array_inv!6353 _keys!1895)))

(declare-fun mapNonEmpty!12366 () Bool)

(declare-fun mapRes!12366 () Bool)

(declare-fun tp!25544 () Bool)

(assert (=> mapNonEmpty!12366 (= mapRes!12366 (and tp!25544 e!210620))))

(declare-fun mapKey!12366 () (_ BitVec 32))

(declare-fun mapRest!12366 () (Array (_ BitVec 32) ValueCell!3299))

(declare-fun mapValue!12366 () ValueCell!3299)

(assert (=> mapNonEmpty!12366 (= (arr!8596 _values!1525) (store mapRest!12366 mapKey!12366 mapValue!12366))))

(declare-fun mapIsEmpty!12366 () Bool)

(assert (=> mapIsEmpty!12366 mapRes!12366))

(declare-fun b!343491 () Bool)

(declare-fun res!189888 () Bool)

(assert (=> b!343491 (=> (not res!189888) (not e!210617))))

(declare-fun zeroValue!1467 () V!10691)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10691)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5260 0))(
  ( (tuple2!5261 (_1!2641 (_ BitVec 64)) (_2!2641 V!10691)) )
))
(declare-datatypes ((List!4862 0))(
  ( (Nil!4859) (Cons!4858 (h!5714 tuple2!5260) (t!9970 List!4862)) )
))
(declare-datatypes ((ListLongMap!4175 0))(
  ( (ListLongMap!4176 (toList!2103 List!4862)) )
))
(declare-fun contains!2180 (ListLongMap!4175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1632 (array!18162 array!18160 (_ BitVec 32) (_ BitVec 32) V!10691 V!10691 (_ BitVec 32) Int) ListLongMap!4175)

(assert (=> b!343491 (= res!189888 (not (contains!2180 (getCurrentListMap!1632 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343492 () Bool)

(declare-fun res!189886 () Bool)

(assert (=> b!343492 (=> (not res!189886) (not e!210617))))

(assert (=> b!343492 (= res!189886 (and (= (size!8948 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8949 _keys!1895) (size!8948 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343493 () Bool)

(declare-fun res!189890 () Bool)

(assert (=> b!343493 (=> (not res!189890) (not e!210617))))

(declare-datatypes ((List!4863 0))(
  ( (Nil!4860) (Cons!4859 (h!5715 (_ BitVec 64)) (t!9971 List!4863)) )
))
(declare-fun arrayNoDuplicates!0 (array!18162 (_ BitVec 32) List!4863) Bool)

(assert (=> b!343493 (= res!189890 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4860))))

(declare-fun b!343494 () Bool)

(assert (=> b!343494 (= e!210617 false)))

(declare-datatypes ((SeekEntryResult!3269 0))(
  ( (MissingZero!3269 (index!15255 (_ BitVec 32))) (Found!3269 (index!15256 (_ BitVec 32))) (Intermediate!3269 (undefined!4081 Bool) (index!15257 (_ BitVec 32)) (x!34140 (_ BitVec 32))) (Undefined!3269) (MissingVacant!3269 (index!15258 (_ BitVec 32))) )
))
(declare-fun lt!162592 () SeekEntryResult!3269)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18162 (_ BitVec 32)) SeekEntryResult!3269)

(assert (=> b!343494 (= lt!162592 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343495 () Bool)

(declare-fun e!210619 () Bool)

(assert (=> b!343495 (= e!210616 (and e!210619 mapRes!12366))))

(declare-fun condMapEmpty!12366 () Bool)

(declare-fun mapDefault!12366 () ValueCell!3299)

(assert (=> b!343495 (= condMapEmpty!12366 (= (arr!8596 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3299)) mapDefault!12366)))))

(declare-fun b!343496 () Bool)

(declare-fun res!189885 () Bool)

(assert (=> b!343496 (=> (not res!189885) (not e!210617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18162 (_ BitVec 32)) Bool)

(assert (=> b!343496 (= res!189885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343497 () Bool)

(declare-fun res!189889 () Bool)

(assert (=> b!343497 (=> (not res!189889) (not e!210617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343497 (= res!189889 (validKeyInArray!0 k0!1348))))

(declare-fun b!343498 () Bool)

(assert (=> b!343498 (= e!210619 tp_is_empty!7285)))

(assert (= (and start!34396 res!189887) b!343492))

(assert (= (and b!343492 res!189886) b!343496))

(assert (= (and b!343496 res!189885) b!343493))

(assert (= (and b!343493 res!189890) b!343497))

(assert (= (and b!343497 res!189889) b!343491))

(assert (= (and b!343491 res!189888) b!343494))

(assert (= (and b!343495 condMapEmpty!12366) mapIsEmpty!12366))

(assert (= (and b!343495 (not condMapEmpty!12366)) mapNonEmpty!12366))

(get-info :version)

(assert (= (and mapNonEmpty!12366 ((_ is ValueCellFull!3299) mapValue!12366)) b!343490))

(assert (= (and b!343495 ((_ is ValueCellFull!3299) mapDefault!12366)) b!343498))

(assert (= start!34396 b!343495))

(declare-fun m!345621 () Bool)

(assert (=> b!343496 m!345621))

(declare-fun m!345623 () Bool)

(assert (=> b!343497 m!345623))

(declare-fun m!345625 () Bool)

(assert (=> b!343491 m!345625))

(assert (=> b!343491 m!345625))

(declare-fun m!345627 () Bool)

(assert (=> b!343491 m!345627))

(declare-fun m!345629 () Bool)

(assert (=> b!343493 m!345629))

(declare-fun m!345631 () Bool)

(assert (=> mapNonEmpty!12366 m!345631))

(declare-fun m!345633 () Bool)

(assert (=> b!343494 m!345633))

(declare-fun m!345635 () Bool)

(assert (=> start!34396 m!345635))

(declare-fun m!345637 () Bool)

(assert (=> start!34396 m!345637))

(declare-fun m!345639 () Bool)

(assert (=> start!34396 m!345639))

(check-sat (not mapNonEmpty!12366) (not b_next!7333) (not b!343496) b_and!14555 (not b!343493) (not start!34396) (not b!343491) tp_is_empty!7285 (not b!343497) (not b!343494))
(check-sat b_and!14555 (not b_next!7333))
