; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34478 () Bool)

(assert start!34478)

(declare-fun b_free!7401 () Bool)

(declare-fun b_next!7401 () Bool)

(assert (=> start!34478 (= b_free!7401 (not b_next!7401))))

(declare-fun tp!25748 () Bool)

(declare-fun b_and!14609 () Bool)

(assert (=> start!34478 (= tp!25748 b_and!14609)))

(declare-fun mapIsEmpty!12468 () Bool)

(declare-fun mapRes!12468 () Bool)

(assert (=> mapIsEmpty!12468 mapRes!12468))

(declare-fun res!190504 () Bool)

(declare-fun e!211164 () Bool)

(assert (=> start!34478 (=> (not res!190504) (not e!211164))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34478 (= res!190504 (validMask!0 mask!2385))))

(assert (=> start!34478 e!211164))

(assert (=> start!34478 true))

(declare-fun tp_is_empty!7353 () Bool)

(assert (=> start!34478 tp_is_empty!7353))

(assert (=> start!34478 tp!25748))

(declare-datatypes ((V!10781 0))(
  ( (V!10782 (val!3721 Int)) )
))
(declare-datatypes ((ValueCell!3333 0))(
  ( (ValueCellFull!3333 (v!5897 V!10781)) (EmptyCell!3333) )
))
(declare-datatypes ((array!18295 0))(
  ( (array!18296 (arr!8664 (Array (_ BitVec 32) ValueCell!3333)) (size!9016 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18295)

(declare-fun e!211162 () Bool)

(declare-fun array_inv!6416 (array!18295) Bool)

(assert (=> start!34478 (and (array_inv!6416 _values!1525) e!211162)))

(declare-datatypes ((array!18297 0))(
  ( (array!18298 (arr!8665 (Array (_ BitVec 32) (_ BitVec 64))) (size!9017 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18297)

(declare-fun array_inv!6417 (array!18297) Bool)

(assert (=> start!34478 (array_inv!6417 _keys!1895)))

(declare-fun mapNonEmpty!12468 () Bool)

(declare-fun tp!25749 () Bool)

(declare-fun e!211161 () Bool)

(assert (=> mapNonEmpty!12468 (= mapRes!12468 (and tp!25749 e!211161))))

(declare-fun mapKey!12468 () (_ BitVec 32))

(declare-fun mapValue!12468 () ValueCell!3333)

(declare-fun mapRest!12468 () (Array (_ BitVec 32) ValueCell!3333))

(assert (=> mapNonEmpty!12468 (= (arr!8664 _values!1525) (store mapRest!12468 mapKey!12468 mapValue!12468))))

(declare-fun b!344461 () Bool)

(assert (=> b!344461 (= e!211164 false)))

(declare-datatypes ((SeekEntryResult!3340 0))(
  ( (MissingZero!3340 (index!15539 (_ BitVec 32))) (Found!3340 (index!15540 (_ BitVec 32))) (Intermediate!3340 (undefined!4152 Bool) (index!15541 (_ BitVec 32)) (x!34302 (_ BitVec 32))) (Undefined!3340) (MissingVacant!3340 (index!15542 (_ BitVec 32))) )
))
(declare-fun lt!162676 () SeekEntryResult!3340)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18297 (_ BitVec 32)) SeekEntryResult!3340)

(assert (=> b!344461 (= lt!162676 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344462 () Bool)

(assert (=> b!344462 (= e!211161 tp_is_empty!7353)))

(declare-fun b!344463 () Bool)

(declare-fun res!190500 () Bool)

(assert (=> b!344463 (=> (not res!190500) (not e!211164))))

(declare-datatypes ((List!5008 0))(
  ( (Nil!5005) (Cons!5004 (h!5860 (_ BitVec 64)) (t!10124 List!5008)) )
))
(declare-fun arrayNoDuplicates!0 (array!18297 (_ BitVec 32) List!5008) Bool)

(assert (=> b!344463 (= res!190500 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5005))))

(declare-fun b!344464 () Bool)

(declare-fun res!190501 () Bool)

(assert (=> b!344464 (=> (not res!190501) (not e!211164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18297 (_ BitVec 32)) Bool)

(assert (=> b!344464 (= res!190501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344465 () Bool)

(declare-fun res!190502 () Bool)

(assert (=> b!344465 (=> (not res!190502) (not e!211164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344465 (= res!190502 (validKeyInArray!0 k0!1348))))

(declare-fun b!344466 () Bool)

(declare-fun e!211163 () Bool)

(assert (=> b!344466 (= e!211163 tp_is_empty!7353)))

(declare-fun b!344467 () Bool)

(declare-fun res!190505 () Bool)

(assert (=> b!344467 (=> (not res!190505) (not e!211164))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344467 (= res!190505 (and (= (size!9016 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9017 _keys!1895) (size!9016 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344468 () Bool)

(assert (=> b!344468 (= e!211162 (and e!211163 mapRes!12468))))

(declare-fun condMapEmpty!12468 () Bool)

(declare-fun mapDefault!12468 () ValueCell!3333)

(assert (=> b!344468 (= condMapEmpty!12468 (= (arr!8664 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3333)) mapDefault!12468)))))

(declare-fun b!344469 () Bool)

(declare-fun res!190503 () Bool)

(assert (=> b!344469 (=> (not res!190503) (not e!211164))))

(declare-fun zeroValue!1467 () V!10781)

(declare-fun minValue!1467 () V!10781)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5386 0))(
  ( (tuple2!5387 (_1!2704 (_ BitVec 64)) (_2!2704 V!10781)) )
))
(declare-datatypes ((List!5009 0))(
  ( (Nil!5006) (Cons!5005 (h!5861 tuple2!5386) (t!10125 List!5009)) )
))
(declare-datatypes ((ListLongMap!4299 0))(
  ( (ListLongMap!4300 (toList!2165 List!5009)) )
))
(declare-fun contains!2223 (ListLongMap!4299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1686 (array!18297 array!18295 (_ BitVec 32) (_ BitVec 32) V!10781 V!10781 (_ BitVec 32) Int) ListLongMap!4299)

(assert (=> b!344469 (= res!190503 (not (contains!2223 (getCurrentListMap!1686 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34478 res!190504) b!344467))

(assert (= (and b!344467 res!190505) b!344464))

(assert (= (and b!344464 res!190501) b!344463))

(assert (= (and b!344463 res!190500) b!344465))

(assert (= (and b!344465 res!190502) b!344469))

(assert (= (and b!344469 res!190503) b!344461))

(assert (= (and b!344468 condMapEmpty!12468) mapIsEmpty!12468))

(assert (= (and b!344468 (not condMapEmpty!12468)) mapNonEmpty!12468))

(get-info :version)

(assert (= (and mapNonEmpty!12468 ((_ is ValueCellFull!3333) mapValue!12468)) b!344462))

(assert (= (and b!344468 ((_ is ValueCellFull!3333) mapDefault!12468)) b!344466))

(assert (= start!34478 b!344468))

(declare-fun m!346077 () Bool)

(assert (=> b!344463 m!346077))

(declare-fun m!346079 () Bool)

(assert (=> b!344464 m!346079))

(declare-fun m!346081 () Bool)

(assert (=> mapNonEmpty!12468 m!346081))

(declare-fun m!346083 () Bool)

(assert (=> b!344461 m!346083))

(declare-fun m!346085 () Bool)

(assert (=> start!34478 m!346085))

(declare-fun m!346087 () Bool)

(assert (=> start!34478 m!346087))

(declare-fun m!346089 () Bool)

(assert (=> start!34478 m!346089))

(declare-fun m!346091 () Bool)

(assert (=> b!344469 m!346091))

(assert (=> b!344469 m!346091))

(declare-fun m!346093 () Bool)

(assert (=> b!344469 m!346093))

(declare-fun m!346095 () Bool)

(assert (=> b!344465 m!346095))

(check-sat tp_is_empty!7353 (not b_next!7401) b_and!14609 (not b!344465) (not start!34478) (not b!344461) (not mapNonEmpty!12468) (not b!344469) (not b!344463) (not b!344464))
(check-sat b_and!14609 (not b_next!7401))
