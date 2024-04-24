; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34462 () Bool)

(assert start!34462)

(declare-fun b_free!7399 () Bool)

(declare-fun b_next!7399 () Bool)

(assert (=> start!34462 (= b_free!7399 (not b_next!7399))))

(declare-fun tp!25743 () Bool)

(declare-fun b_and!14621 () Bool)

(assert (=> start!34462 (= tp!25743 b_and!14621)))

(declare-fun b!344381 () Bool)

(declare-fun res!190482 () Bool)

(declare-fun e!211113 () Bool)

(assert (=> b!344381 (=> (not res!190482) (not e!211113))))

(declare-datatypes ((array!18284 0))(
  ( (array!18285 (arr!8658 (Array (_ BitVec 32) (_ BitVec 64))) (size!9010 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18284)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18284 (_ BitVec 32)) Bool)

(assert (=> b!344381 (= res!190482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344382 () Bool)

(declare-fun res!190484 () Bool)

(assert (=> b!344382 (=> (not res!190484) (not e!211113))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344382 (= res!190484 (validKeyInArray!0 k0!1348))))

(declare-fun b!344383 () Bool)

(declare-fun res!190480 () Bool)

(assert (=> b!344383 (=> (not res!190480) (not e!211113))))

(declare-datatypes ((V!10779 0))(
  ( (V!10780 (val!3720 Int)) )
))
(declare-fun zeroValue!1467 () V!10779)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3332 0))(
  ( (ValueCellFull!3332 (v!5897 V!10779)) (EmptyCell!3332) )
))
(declare-datatypes ((array!18286 0))(
  ( (array!18287 (arr!8659 (Array (_ BitVec 32) ValueCell!3332)) (size!9011 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18286)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10779)

(declare-datatypes ((tuple2!5302 0))(
  ( (tuple2!5303 (_1!2662 (_ BitVec 64)) (_2!2662 V!10779)) )
))
(declare-datatypes ((List!4905 0))(
  ( (Nil!4902) (Cons!4901 (h!5757 tuple2!5302) (t!10013 List!4905)) )
))
(declare-datatypes ((ListLongMap!4217 0))(
  ( (ListLongMap!4218 (toList!2124 List!4905)) )
))
(declare-fun contains!2201 (ListLongMap!4217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1653 (array!18284 array!18286 (_ BitVec 32) (_ BitVec 32) V!10779 V!10779 (_ BitVec 32) Int) ListLongMap!4217)

(assert (=> b!344383 (= res!190480 (not (contains!2201 (getCurrentListMap!1653 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344384 () Bool)

(declare-fun e!211111 () Bool)

(declare-fun tp_is_empty!7351 () Bool)

(assert (=> b!344384 (= e!211111 tp_is_empty!7351)))

(declare-fun b!344385 () Bool)

(declare-fun res!190479 () Bool)

(assert (=> b!344385 (=> (not res!190479) (not e!211113))))

(assert (=> b!344385 (= res!190479 (and (= (size!9011 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9010 _keys!1895) (size!9011 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12465 () Bool)

(declare-fun mapRes!12465 () Bool)

(declare-fun tp!25742 () Bool)

(declare-fun e!211114 () Bool)

(assert (=> mapNonEmpty!12465 (= mapRes!12465 (and tp!25742 e!211114))))

(declare-fun mapKey!12465 () (_ BitVec 32))

(declare-fun mapRest!12465 () (Array (_ BitVec 32) ValueCell!3332))

(declare-fun mapValue!12465 () ValueCell!3332)

(assert (=> mapNonEmpty!12465 (= (arr!8659 _values!1525) (store mapRest!12465 mapKey!12465 mapValue!12465))))

(declare-fun mapIsEmpty!12465 () Bool)

(assert (=> mapIsEmpty!12465 mapRes!12465))

(declare-fun b!344387 () Bool)

(declare-fun res!190481 () Bool)

(assert (=> b!344387 (=> (not res!190481) (not e!211113))))

(declare-datatypes ((List!4906 0))(
  ( (Nil!4903) (Cons!4902 (h!5758 (_ BitVec 64)) (t!10014 List!4906)) )
))
(declare-fun arrayNoDuplicates!0 (array!18284 (_ BitVec 32) List!4906) Bool)

(assert (=> b!344387 (= res!190481 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4903))))

(declare-fun b!344388 () Bool)

(assert (=> b!344388 (= e!211113 false)))

(declare-datatypes ((SeekEntryResult!3291 0))(
  ( (MissingZero!3291 (index!15343 (_ BitVec 32))) (Found!3291 (index!15344 (_ BitVec 32))) (Intermediate!3291 (undefined!4103 Bool) (index!15345 (_ BitVec 32)) (x!34250 (_ BitVec 32))) (Undefined!3291) (MissingVacant!3291 (index!15346 (_ BitVec 32))) )
))
(declare-fun lt!162691 () SeekEntryResult!3291)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18284 (_ BitVec 32)) SeekEntryResult!3291)

(assert (=> b!344388 (= lt!162691 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344389 () Bool)

(assert (=> b!344389 (= e!211114 tp_is_empty!7351)))

(declare-fun res!190483 () Bool)

(assert (=> start!34462 (=> (not res!190483) (not e!211113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34462 (= res!190483 (validMask!0 mask!2385))))

(assert (=> start!34462 e!211113))

(assert (=> start!34462 true))

(assert (=> start!34462 tp_is_empty!7351))

(assert (=> start!34462 tp!25743))

(declare-fun e!211115 () Bool)

(declare-fun array_inv!6396 (array!18286) Bool)

(assert (=> start!34462 (and (array_inv!6396 _values!1525) e!211115)))

(declare-fun array_inv!6397 (array!18284) Bool)

(assert (=> start!34462 (array_inv!6397 _keys!1895)))

(declare-fun b!344386 () Bool)

(assert (=> b!344386 (= e!211115 (and e!211111 mapRes!12465))))

(declare-fun condMapEmpty!12465 () Bool)

(declare-fun mapDefault!12465 () ValueCell!3332)

(assert (=> b!344386 (= condMapEmpty!12465 (= (arr!8659 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3332)) mapDefault!12465)))))

(assert (= (and start!34462 res!190483) b!344385))

(assert (= (and b!344385 res!190479) b!344381))

(assert (= (and b!344381 res!190482) b!344387))

(assert (= (and b!344387 res!190481) b!344382))

(assert (= (and b!344382 res!190484) b!344383))

(assert (= (and b!344383 res!190480) b!344388))

(assert (= (and b!344386 condMapEmpty!12465) mapIsEmpty!12465))

(assert (= (and b!344386 (not condMapEmpty!12465)) mapNonEmpty!12465))

(get-info :version)

(assert (= (and mapNonEmpty!12465 ((_ is ValueCellFull!3332) mapValue!12465)) b!344389))

(assert (= (and b!344386 ((_ is ValueCellFull!3332) mapDefault!12465)) b!344384))

(assert (= start!34462 b!344386))

(declare-fun m!346281 () Bool)

(assert (=> start!34462 m!346281))

(declare-fun m!346283 () Bool)

(assert (=> start!34462 m!346283))

(declare-fun m!346285 () Bool)

(assert (=> start!34462 m!346285))

(declare-fun m!346287 () Bool)

(assert (=> b!344388 m!346287))

(declare-fun m!346289 () Bool)

(assert (=> b!344383 m!346289))

(assert (=> b!344383 m!346289))

(declare-fun m!346291 () Bool)

(assert (=> b!344383 m!346291))

(declare-fun m!346293 () Bool)

(assert (=> b!344382 m!346293))

(declare-fun m!346295 () Bool)

(assert (=> mapNonEmpty!12465 m!346295))

(declare-fun m!346297 () Bool)

(assert (=> b!344387 m!346297))

(declare-fun m!346299 () Bool)

(assert (=> b!344381 m!346299))

(check-sat (not b!344387) tp_is_empty!7351 b_and!14621 (not b!344383) (not start!34462) (not mapNonEmpty!12465) (not b_next!7399) (not b!344388) (not b!344381) (not b!344382))
(check-sat b_and!14621 (not b_next!7399))
