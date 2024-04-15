; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34468 () Bool)

(assert start!34468)

(declare-fun b_free!7405 () Bool)

(declare-fun b_next!7405 () Bool)

(assert (=> start!34468 (= b_free!7405 (not b_next!7405))))

(declare-fun tp!25760 () Bool)

(declare-fun b_and!14587 () Bool)

(assert (=> start!34468 (= tp!25760 b_and!14587)))

(declare-fun b!344240 () Bool)

(declare-fun res!190407 () Bool)

(declare-fun e!211017 () Bool)

(assert (=> b!344240 (=> (not res!190407) (not e!211017))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344240 (= res!190407 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12474 () Bool)

(declare-fun mapRes!12474 () Bool)

(declare-fun tp!25761 () Bool)

(declare-fun e!211014 () Bool)

(assert (=> mapNonEmpty!12474 (= mapRes!12474 (and tp!25761 e!211014))))

(declare-fun mapKey!12474 () (_ BitVec 32))

(declare-datatypes ((V!10787 0))(
  ( (V!10788 (val!3723 Int)) )
))
(declare-datatypes ((ValueCell!3335 0))(
  ( (ValueCellFull!3335 (v!5893 V!10787)) (EmptyCell!3335) )
))
(declare-datatypes ((array!18289 0))(
  ( (array!18290 (arr!8661 (Array (_ BitVec 32) ValueCell!3335)) (size!9014 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18289)

(declare-fun mapRest!12474 () (Array (_ BitVec 32) ValueCell!3335))

(declare-fun mapValue!12474 () ValueCell!3335)

(assert (=> mapNonEmpty!12474 (= (arr!8661 _values!1525) (store mapRest!12474 mapKey!12474 mapValue!12474))))

(declare-fun b!344241 () Bool)

(declare-fun res!190410 () Bool)

(assert (=> b!344241 (=> (not res!190410) (not e!211017))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10787)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18291 0))(
  ( (array!18292 (arr!8662 (Array (_ BitVec 32) (_ BitVec 64))) (size!9015 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18291)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10787)

(declare-datatypes ((tuple2!5340 0))(
  ( (tuple2!5341 (_1!2681 (_ BitVec 64)) (_2!2681 V!10787)) )
))
(declare-datatypes ((List!4963 0))(
  ( (Nil!4960) (Cons!4959 (h!5815 tuple2!5340) (t!10070 List!4963)) )
))
(declare-datatypes ((ListLongMap!4243 0))(
  ( (ListLongMap!4244 (toList!2137 List!4963)) )
))
(declare-fun contains!2206 (ListLongMap!4243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1643 (array!18291 array!18289 (_ BitVec 32) (_ BitVec 32) V!10787 V!10787 (_ BitVec 32) Int) ListLongMap!4243)

(assert (=> b!344241 (= res!190410 (not (contains!2206 (getCurrentListMap!1643 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344242 () Bool)

(declare-fun res!190412 () Bool)

(assert (=> b!344242 (=> (not res!190412) (not e!211017))))

(declare-datatypes ((List!4964 0))(
  ( (Nil!4961) (Cons!4960 (h!5816 (_ BitVec 64)) (t!10071 List!4964)) )
))
(declare-fun arrayNoDuplicates!0 (array!18291 (_ BitVec 32) List!4964) Bool)

(assert (=> b!344242 (= res!190412 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4961))))

(declare-fun b!344243 () Bool)

(declare-fun res!190411 () Bool)

(assert (=> b!344243 (=> (not res!190411) (not e!211017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18291 (_ BitVec 32)) Bool)

(assert (=> b!344243 (= res!190411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344244 () Bool)

(declare-fun res!190408 () Bool)

(assert (=> b!344244 (=> (not res!190408) (not e!211017))))

(assert (=> b!344244 (= res!190408 (and (= (size!9014 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9015 _keys!1895) (size!9014 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344245 () Bool)

(declare-fun tp_is_empty!7357 () Bool)

(assert (=> b!344245 (= e!211014 tp_is_empty!7357)))

(declare-fun b!344247 () Bool)

(declare-fun e!211015 () Bool)

(declare-fun e!211016 () Bool)

(assert (=> b!344247 (= e!211015 (and e!211016 mapRes!12474))))

(declare-fun condMapEmpty!12474 () Bool)

(declare-fun mapDefault!12474 () ValueCell!3335)

(assert (=> b!344247 (= condMapEmpty!12474 (= (arr!8661 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3335)) mapDefault!12474)))))

(declare-fun mapIsEmpty!12474 () Bool)

(assert (=> mapIsEmpty!12474 mapRes!12474))

(declare-datatypes ((SeekEntryResult!3337 0))(
  ( (MissingZero!3337 (index!15527 (_ BitVec 32))) (Found!3337 (index!15528 (_ BitVec 32))) (Intermediate!3337 (undefined!4149 Bool) (index!15529 (_ BitVec 32)) (x!34302 (_ BitVec 32))) (Undefined!3337) (MissingVacant!3337 (index!15530 (_ BitVec 32))) )
))
(declare-fun lt!162447 () SeekEntryResult!3337)

(declare-fun b!344248 () Bool)

(get-info :version)

(assert (=> b!344248 (= e!211017 (and (not ((_ is Found!3337) lt!162447)) (not ((_ is MissingZero!3337) lt!162447)) (not ((_ is MissingVacant!3337) lt!162447)) (not ((_ is Undefined!3337) lt!162447)) (not (= (size!9015 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18291 (_ BitVec 32)) SeekEntryResult!3337)

(assert (=> b!344248 (= lt!162447 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344246 () Bool)

(assert (=> b!344246 (= e!211016 tp_is_empty!7357)))

(declare-fun res!190409 () Bool)

(assert (=> start!34468 (=> (not res!190409) (not e!211017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34468 (= res!190409 (validMask!0 mask!2385))))

(assert (=> start!34468 e!211017))

(assert (=> start!34468 true))

(assert (=> start!34468 tp_is_empty!7357))

(assert (=> start!34468 tp!25760))

(declare-fun array_inv!6440 (array!18289) Bool)

(assert (=> start!34468 (and (array_inv!6440 _values!1525) e!211015)))

(declare-fun array_inv!6441 (array!18291) Bool)

(assert (=> start!34468 (array_inv!6441 _keys!1895)))

(assert (= (and start!34468 res!190409) b!344244))

(assert (= (and b!344244 res!190408) b!344243))

(assert (= (and b!344243 res!190411) b!344242))

(assert (= (and b!344242 res!190412) b!344240))

(assert (= (and b!344240 res!190407) b!344241))

(assert (= (and b!344241 res!190410) b!344248))

(assert (= (and b!344247 condMapEmpty!12474) mapIsEmpty!12474))

(assert (= (and b!344247 (not condMapEmpty!12474)) mapNonEmpty!12474))

(assert (= (and mapNonEmpty!12474 ((_ is ValueCellFull!3335) mapValue!12474)) b!344245))

(assert (= (and b!344247 ((_ is ValueCellFull!3335) mapDefault!12474)) b!344246))

(assert (= start!34468 b!344247))

(declare-fun m!345387 () Bool)

(assert (=> start!34468 m!345387))

(declare-fun m!345389 () Bool)

(assert (=> start!34468 m!345389))

(declare-fun m!345391 () Bool)

(assert (=> start!34468 m!345391))

(declare-fun m!345393 () Bool)

(assert (=> b!344243 m!345393))

(declare-fun m!345395 () Bool)

(assert (=> b!344248 m!345395))

(declare-fun m!345397 () Bool)

(assert (=> b!344241 m!345397))

(assert (=> b!344241 m!345397))

(declare-fun m!345399 () Bool)

(assert (=> b!344241 m!345399))

(declare-fun m!345401 () Bool)

(assert (=> mapNonEmpty!12474 m!345401))

(declare-fun m!345403 () Bool)

(assert (=> b!344242 m!345403))

(declare-fun m!345405 () Bool)

(assert (=> b!344240 m!345405))

(check-sat (not b!344241) (not b!344243) tp_is_empty!7357 (not b!344240) (not start!34468) (not b_next!7405) b_and!14587 (not b!344242) (not b!344248) (not mapNonEmpty!12474))
(check-sat b_and!14587 (not b_next!7405))
