; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34682 () Bool)

(assert start!34682)

(declare-fun b_free!7489 () Bool)

(declare-fun b_next!7489 () Bool)

(assert (=> start!34682 (= b_free!7489 (not b_next!7489))))

(declare-fun tp!26031 () Bool)

(declare-fun b_and!14709 () Bool)

(assert (=> start!34682 (= tp!26031 b_and!14709)))

(declare-fun b!346498 () Bool)

(declare-fun res!191654 () Bool)

(declare-fun e!212368 () Bool)

(assert (=> b!346498 (=> (not res!191654) (not e!212368))))

(declare-datatypes ((array!18475 0))(
  ( (array!18476 (arr!8748 (Array (_ BitVec 32) (_ BitVec 64))) (size!9100 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18475)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18475 (_ BitVec 32)) Bool)

(assert (=> b!346498 (= res!191654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346499 () Bool)

(declare-fun e!212370 () Bool)

(declare-fun tp_is_empty!7441 () Bool)

(assert (=> b!346499 (= e!212370 tp_is_empty!7441)))

(declare-fun b!346500 () Bool)

(declare-fun res!191650 () Bool)

(assert (=> b!346500 (=> (not res!191650) (not e!212368))))

(declare-datatypes ((List!5067 0))(
  ( (Nil!5064) (Cons!5063 (h!5919 (_ BitVec 64)) (t!10195 List!5067)) )
))
(declare-fun arrayNoDuplicates!0 (array!18475 (_ BitVec 32) List!5067) Bool)

(assert (=> b!346500 (= res!191650 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5064))))

(declare-fun b!346501 () Bool)

(declare-fun res!191652 () Bool)

(assert (=> b!346501 (=> (not res!191652) (not e!212368))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346501 (= res!191652 (validKeyInArray!0 k!1348))))

(declare-fun res!191651 () Bool)

(assert (=> start!34682 (=> (not res!191651) (not e!212368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34682 (= res!191651 (validMask!0 mask!2385))))

(assert (=> start!34682 e!212368))

(assert (=> start!34682 true))

(assert (=> start!34682 tp_is_empty!7441))

(assert (=> start!34682 tp!26031))

(declare-datatypes ((V!10899 0))(
  ( (V!10900 (val!3765 Int)) )
))
(declare-datatypes ((ValueCell!3377 0))(
  ( (ValueCellFull!3377 (v!5947 V!10899)) (EmptyCell!3377) )
))
(declare-datatypes ((array!18477 0))(
  ( (array!18478 (arr!8749 (Array (_ BitVec 32) ValueCell!3377)) (size!9101 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18477)

(declare-fun e!212369 () Bool)

(declare-fun array_inv!6476 (array!18477) Bool)

(assert (=> start!34682 (and (array_inv!6476 _values!1525) e!212369)))

(declare-fun array_inv!6477 (array!18475) Bool)

(assert (=> start!34682 (array_inv!6477 _keys!1895)))

(declare-fun mapIsEmpty!12618 () Bool)

(declare-fun mapRes!12618 () Bool)

(assert (=> mapIsEmpty!12618 mapRes!12618))

(declare-fun mapNonEmpty!12618 () Bool)

(declare-fun tp!26030 () Bool)

(assert (=> mapNonEmpty!12618 (= mapRes!12618 (and tp!26030 e!212370))))

(declare-fun mapRest!12618 () (Array (_ BitVec 32) ValueCell!3377))

(declare-fun mapValue!12618 () ValueCell!3377)

(declare-fun mapKey!12618 () (_ BitVec 32))

(assert (=> mapNonEmpty!12618 (= (arr!8749 _values!1525) (store mapRest!12618 mapKey!12618 mapValue!12618))))

(declare-fun b!346502 () Bool)

(declare-fun res!191649 () Bool)

(assert (=> b!346502 (=> (not res!191649) (not e!212368))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346502 (= res!191649 (and (= (size!9101 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9100 _keys!1895) (size!9101 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346503 () Bool)

(assert (=> b!346503 (= e!212368 false)))

(declare-datatypes ((SeekEntryResult!3373 0))(
  ( (MissingZero!3373 (index!15671 (_ BitVec 32))) (Found!3373 (index!15672 (_ BitVec 32))) (Intermediate!3373 (undefined!4185 Bool) (index!15673 (_ BitVec 32)) (x!34515 (_ BitVec 32))) (Undefined!3373) (MissingVacant!3373 (index!15674 (_ BitVec 32))) )
))
(declare-fun lt!163384 () SeekEntryResult!3373)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18475 (_ BitVec 32)) SeekEntryResult!3373)

(assert (=> b!346503 (= lt!163384 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346504 () Bool)

(declare-fun res!191653 () Bool)

(assert (=> b!346504 (=> (not res!191653) (not e!212368))))

(declare-fun zeroValue!1467 () V!10899)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10899)

(declare-datatypes ((tuple2!5444 0))(
  ( (tuple2!5445 (_1!2733 (_ BitVec 64)) (_2!2733 V!10899)) )
))
(declare-datatypes ((List!5068 0))(
  ( (Nil!5065) (Cons!5064 (h!5920 tuple2!5444) (t!10196 List!5068)) )
))
(declare-datatypes ((ListLongMap!4357 0))(
  ( (ListLongMap!4358 (toList!2194 List!5068)) )
))
(declare-fun contains!2258 (ListLongMap!4357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1715 (array!18475 array!18477 (_ BitVec 32) (_ BitVec 32) V!10899 V!10899 (_ BitVec 32) Int) ListLongMap!4357)

(assert (=> b!346504 (= res!191653 (not (contains!2258 (getCurrentListMap!1715 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346505 () Bool)

(declare-fun e!212367 () Bool)

(assert (=> b!346505 (= e!212369 (and e!212367 mapRes!12618))))

(declare-fun condMapEmpty!12618 () Bool)

(declare-fun mapDefault!12618 () ValueCell!3377)

