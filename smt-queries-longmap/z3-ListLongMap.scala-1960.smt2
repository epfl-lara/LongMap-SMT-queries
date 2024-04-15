; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34492 () Bool)

(assert start!34492)

(declare-fun b_free!7429 () Bool)

(declare-fun b_next!7429 () Bool)

(assert (=> start!34492 (= b_free!7429 (not b_next!7429))))

(declare-fun tp!25832 () Bool)

(declare-fun b_and!14611 () Bool)

(assert (=> start!34492 (= tp!25832 b_and!14611)))

(declare-fun mapNonEmpty!12510 () Bool)

(declare-fun mapRes!12510 () Bool)

(declare-fun tp!25833 () Bool)

(declare-fun e!211195 () Bool)

(assert (=> mapNonEmpty!12510 (= mapRes!12510 (and tp!25833 e!211195))))

(declare-datatypes ((V!10819 0))(
  ( (V!10820 (val!3735 Int)) )
))
(declare-datatypes ((ValueCell!3347 0))(
  ( (ValueCellFull!3347 (v!5905 V!10819)) (EmptyCell!3347) )
))
(declare-fun mapRest!12510 () (Array (_ BitVec 32) ValueCell!3347))

(declare-fun mapKey!12510 () (_ BitVec 32))

(declare-fun mapValue!12510 () ValueCell!3347)

(declare-datatypes ((array!18335 0))(
  ( (array!18336 (arr!8684 (Array (_ BitVec 32) ValueCell!3347)) (size!9037 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18335)

(assert (=> mapNonEmpty!12510 (= (arr!8684 _values!1525) (store mapRest!12510 mapKey!12510 mapValue!12510))))

(declare-fun b!344564 () Bool)

(declare-fun e!211198 () Bool)

(declare-fun e!211197 () Bool)

(assert (=> b!344564 (= e!211198 (and e!211197 mapRes!12510))))

(declare-fun condMapEmpty!12510 () Bool)

(declare-fun mapDefault!12510 () ValueCell!3347)

(assert (=> b!344564 (= condMapEmpty!12510 (= (arr!8684 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3347)) mapDefault!12510)))))

(declare-fun b!344565 () Bool)

(declare-fun tp_is_empty!7381 () Bool)

(assert (=> b!344565 (= e!211197 tp_is_empty!7381)))

(declare-fun b!344566 () Bool)

(declare-fun res!190628 () Bool)

(declare-fun e!211194 () Bool)

(assert (=> b!344566 (=> (not res!190628) (not e!211194))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10819)

(declare-datatypes ((array!18337 0))(
  ( (array!18338 (arr!8685 (Array (_ BitVec 32) (_ BitVec 64))) (size!9038 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18337)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10819)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5362 0))(
  ( (tuple2!5363 (_1!2692 (_ BitVec 64)) (_2!2692 V!10819)) )
))
(declare-datatypes ((List!4981 0))(
  ( (Nil!4978) (Cons!4977 (h!5833 tuple2!5362) (t!10088 List!4981)) )
))
(declare-datatypes ((ListLongMap!4265 0))(
  ( (ListLongMap!4266 (toList!2148 List!4981)) )
))
(declare-fun contains!2217 (ListLongMap!4265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1654 (array!18337 array!18335 (_ BitVec 32) (_ BitVec 32) V!10819 V!10819 (_ BitVec 32) Int) ListLongMap!4265)

(assert (=> b!344566 (= res!190628 (not (contains!2217 (getCurrentListMap!1654 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!190624 () Bool)

(assert (=> start!34492 (=> (not res!190624) (not e!211194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34492 (= res!190624 (validMask!0 mask!2385))))

(assert (=> start!34492 e!211194))

(assert (=> start!34492 true))

(assert (=> start!34492 tp_is_empty!7381))

(assert (=> start!34492 tp!25832))

(declare-fun array_inv!6456 (array!18335) Bool)

(assert (=> start!34492 (and (array_inv!6456 _values!1525) e!211198)))

(declare-fun array_inv!6457 (array!18337) Bool)

(assert (=> start!34492 (array_inv!6457 _keys!1895)))

(declare-fun b!344567 () Bool)

(declare-fun res!190625 () Bool)

(assert (=> b!344567 (=> (not res!190625) (not e!211194))))

(assert (=> b!344567 (= res!190625 (and (= (size!9037 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9038 _keys!1895) (size!9037 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344568 () Bool)

(declare-fun res!190623 () Bool)

(assert (=> b!344568 (=> (not res!190623) (not e!211194))))

(declare-datatypes ((List!4982 0))(
  ( (Nil!4979) (Cons!4978 (h!5834 (_ BitVec 64)) (t!10089 List!4982)) )
))
(declare-fun arrayNoDuplicates!0 (array!18337 (_ BitVec 32) List!4982) Bool)

(assert (=> b!344568 (= res!190623 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4979))))

(declare-fun b!344569 () Bool)

(assert (=> b!344569 (= e!211194 false)))

(declare-datatypes ((SeekEntryResult!3343 0))(
  ( (MissingZero!3343 (index!15551 (_ BitVec 32))) (Found!3343 (index!15552 (_ BitVec 32))) (Intermediate!3343 (undefined!4155 Bool) (index!15553 (_ BitVec 32)) (x!34340 (_ BitVec 32))) (Undefined!3343) (MissingVacant!3343 (index!15554 (_ BitVec 32))) )
))
(declare-fun lt!162483 () SeekEntryResult!3343)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18337 (_ BitVec 32)) SeekEntryResult!3343)

(assert (=> b!344569 (= lt!162483 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344570 () Bool)

(assert (=> b!344570 (= e!211195 tp_is_empty!7381)))

(declare-fun b!344571 () Bool)

(declare-fun res!190626 () Bool)

(assert (=> b!344571 (=> (not res!190626) (not e!211194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18337 (_ BitVec 32)) Bool)

(assert (=> b!344571 (= res!190626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12510 () Bool)

(assert (=> mapIsEmpty!12510 mapRes!12510))

(declare-fun b!344572 () Bool)

(declare-fun res!190627 () Bool)

(assert (=> b!344572 (=> (not res!190627) (not e!211194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344572 (= res!190627 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34492 res!190624) b!344567))

(assert (= (and b!344567 res!190625) b!344571))

(assert (= (and b!344571 res!190626) b!344568))

(assert (= (and b!344568 res!190623) b!344572))

(assert (= (and b!344572 res!190627) b!344566))

(assert (= (and b!344566 res!190628) b!344569))

(assert (= (and b!344564 condMapEmpty!12510) mapIsEmpty!12510))

(assert (= (and b!344564 (not condMapEmpty!12510)) mapNonEmpty!12510))

(get-info :version)

(assert (= (and mapNonEmpty!12510 ((_ is ValueCellFull!3347) mapValue!12510)) b!344570))

(assert (= (and b!344564 ((_ is ValueCellFull!3347) mapDefault!12510)) b!344565))

(assert (= start!34492 b!344564))

(declare-fun m!345627 () Bool)

(assert (=> b!344568 m!345627))

(declare-fun m!345629 () Bool)

(assert (=> b!344572 m!345629))

(declare-fun m!345631 () Bool)

(assert (=> b!344571 m!345631))

(declare-fun m!345633 () Bool)

(assert (=> start!34492 m!345633))

(declare-fun m!345635 () Bool)

(assert (=> start!34492 m!345635))

(declare-fun m!345637 () Bool)

(assert (=> start!34492 m!345637))

(declare-fun m!345639 () Bool)

(assert (=> mapNonEmpty!12510 m!345639))

(declare-fun m!345641 () Bool)

(assert (=> b!344569 m!345641))

(declare-fun m!345643 () Bool)

(assert (=> b!344566 m!345643))

(assert (=> b!344566 m!345643))

(declare-fun m!345645 () Bool)

(assert (=> b!344566 m!345645))

(check-sat (not b!344569) (not b!344572) (not b!344571) (not mapNonEmpty!12510) (not b!344568) tp_is_empty!7381 (not b!344566) (not start!34492) (not b_next!7429) b_and!14611)
(check-sat b_and!14611 (not b_next!7429))
