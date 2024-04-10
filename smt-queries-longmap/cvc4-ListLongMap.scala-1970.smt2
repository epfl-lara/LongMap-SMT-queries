; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34686 () Bool)

(assert start!34686)

(declare-fun b_free!7493 () Bool)

(declare-fun b_next!7493 () Bool)

(assert (=> start!34686 (= b_free!7493 (not b_next!7493))))

(declare-fun tp!26042 () Bool)

(declare-fun b_and!14713 () Bool)

(assert (=> start!34686 (= tp!26042 b_and!14713)))

(declare-fun b!346552 () Bool)

(declare-fun res!191689 () Bool)

(declare-fun e!212398 () Bool)

(assert (=> b!346552 (=> (not res!191689) (not e!212398))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346552 (= res!191689 (validKeyInArray!0 k!1348))))

(declare-fun b!346553 () Bool)

(assert (=> b!346553 (= e!212398 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18483 0))(
  ( (array!18484 (arr!8752 (Array (_ BitVec 32) (_ BitVec 64))) (size!9104 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18483)

(declare-datatypes ((SeekEntryResult!3375 0))(
  ( (MissingZero!3375 (index!15679 (_ BitVec 32))) (Found!3375 (index!15680 (_ BitVec 32))) (Intermediate!3375 (undefined!4187 Bool) (index!15681 (_ BitVec 32)) (x!34517 (_ BitVec 32))) (Undefined!3375) (MissingVacant!3375 (index!15682 (_ BitVec 32))) )
))
(declare-fun lt!163390 () SeekEntryResult!3375)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18483 (_ BitVec 32)) SeekEntryResult!3375)

(assert (=> b!346553 (= lt!163390 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346554 () Bool)

(declare-fun res!191687 () Bool)

(assert (=> b!346554 (=> (not res!191687) (not e!212398))))

(declare-datatypes ((V!10903 0))(
  ( (V!10904 (val!3767 Int)) )
))
(declare-datatypes ((ValueCell!3379 0))(
  ( (ValueCellFull!3379 (v!5949 V!10903)) (EmptyCell!3379) )
))
(declare-datatypes ((array!18485 0))(
  ( (array!18486 (arr!8753 (Array (_ BitVec 32) ValueCell!3379)) (size!9105 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18485)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346554 (= res!191687 (and (= (size!9105 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9104 _keys!1895) (size!9105 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12624 () Bool)

(declare-fun mapRes!12624 () Bool)

(assert (=> mapIsEmpty!12624 mapRes!12624))

(declare-fun b!346555 () Bool)

(declare-fun res!191685 () Bool)

(assert (=> b!346555 (=> (not res!191685) (not e!212398))))

(declare-fun zeroValue!1467 () V!10903)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10903)

(declare-datatypes ((tuple2!5448 0))(
  ( (tuple2!5449 (_1!2735 (_ BitVec 64)) (_2!2735 V!10903)) )
))
(declare-datatypes ((List!5071 0))(
  ( (Nil!5068) (Cons!5067 (h!5923 tuple2!5448) (t!10199 List!5071)) )
))
(declare-datatypes ((ListLongMap!4361 0))(
  ( (ListLongMap!4362 (toList!2196 List!5071)) )
))
(declare-fun contains!2260 (ListLongMap!4361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1717 (array!18483 array!18485 (_ BitVec 32) (_ BitVec 32) V!10903 V!10903 (_ BitVec 32) Int) ListLongMap!4361)

(assert (=> b!346555 (= res!191685 (not (contains!2260 (getCurrentListMap!1717 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!191690 () Bool)

(assert (=> start!34686 (=> (not res!191690) (not e!212398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34686 (= res!191690 (validMask!0 mask!2385))))

(assert (=> start!34686 e!212398))

(assert (=> start!34686 true))

(declare-fun tp_is_empty!7445 () Bool)

(assert (=> start!34686 tp_is_empty!7445))

(assert (=> start!34686 tp!26042))

(declare-fun e!212400 () Bool)

(declare-fun array_inv!6480 (array!18485) Bool)

(assert (=> start!34686 (and (array_inv!6480 _values!1525) e!212400)))

(declare-fun array_inv!6481 (array!18483) Bool)

(assert (=> start!34686 (array_inv!6481 _keys!1895)))

(declare-fun b!346556 () Bool)

(declare-fun res!191686 () Bool)

(assert (=> b!346556 (=> (not res!191686) (not e!212398))))

(declare-datatypes ((List!5072 0))(
  ( (Nil!5069) (Cons!5068 (h!5924 (_ BitVec 64)) (t!10200 List!5072)) )
))
(declare-fun arrayNoDuplicates!0 (array!18483 (_ BitVec 32) List!5072) Bool)

(assert (=> b!346556 (= res!191686 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5069))))

(declare-fun mapNonEmpty!12624 () Bool)

(declare-fun tp!26043 () Bool)

(declare-fun e!212399 () Bool)

(assert (=> mapNonEmpty!12624 (= mapRes!12624 (and tp!26043 e!212399))))

(declare-fun mapValue!12624 () ValueCell!3379)

(declare-fun mapRest!12624 () (Array (_ BitVec 32) ValueCell!3379))

(declare-fun mapKey!12624 () (_ BitVec 32))

(assert (=> mapNonEmpty!12624 (= (arr!8753 _values!1525) (store mapRest!12624 mapKey!12624 mapValue!12624))))

(declare-fun b!346557 () Bool)

(declare-fun res!191688 () Bool)

(assert (=> b!346557 (=> (not res!191688) (not e!212398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18483 (_ BitVec 32)) Bool)

(assert (=> b!346557 (= res!191688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346558 () Bool)

(declare-fun e!212397 () Bool)

(assert (=> b!346558 (= e!212397 tp_is_empty!7445)))

(declare-fun b!346559 () Bool)

(assert (=> b!346559 (= e!212400 (and e!212397 mapRes!12624))))

(declare-fun condMapEmpty!12624 () Bool)

(declare-fun mapDefault!12624 () ValueCell!3379)

