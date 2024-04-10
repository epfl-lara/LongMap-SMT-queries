; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34634 () Bool)

(assert start!34634)

(declare-fun b_free!7481 () Bool)

(declare-fun b_next!7481 () Bool)

(assert (=> start!34634 (= b_free!7481 (not b_next!7481))))

(declare-fun tp!26001 () Bool)

(declare-fun b_and!14697 () Bool)

(assert (=> start!34634 (= tp!26001 b_and!14697)))

(declare-fun mapIsEmpty!12600 () Bool)

(declare-fun mapRes!12600 () Bool)

(assert (=> mapIsEmpty!12600 mapRes!12600))

(declare-fun b!346104 () Bool)

(declare-fun e!212126 () Bool)

(declare-datatypes ((SeekEntryResult!3369 0))(
  ( (MissingZero!3369 (index!15655 (_ BitVec 32))) (Found!3369 (index!15656 (_ BitVec 32))) (Intermediate!3369 (undefined!4181 Bool) (index!15657 (_ BitVec 32)) (x!34475 (_ BitVec 32))) (Undefined!3369) (MissingVacant!3369 (index!15658 (_ BitVec 32))) )
))
(declare-fun lt!163180 () SeekEntryResult!3369)

(declare-datatypes ((array!18455 0))(
  ( (array!18456 (arr!8740 (Array (_ BitVec 32) (_ BitVec 64))) (size!9092 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18455)

(assert (=> b!346104 (= e!212126 (and (bvsge (index!15656 lt!163180) #b00000000000000000000000000000000) (bvsge (index!15656 lt!163180) (size!9092 _keys!1895))))))

(declare-fun b!346105 () Bool)

(declare-fun res!191458 () Bool)

(declare-fun e!212125 () Bool)

(assert (=> b!346105 (=> (not res!191458) (not e!212125))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10887 0))(
  ( (V!10888 (val!3761 Int)) )
))
(declare-fun zeroValue!1467 () V!10887)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3373 0))(
  ( (ValueCellFull!3373 (v!5941 V!10887)) (EmptyCell!3373) )
))
(declare-datatypes ((array!18457 0))(
  ( (array!18458 (arr!8741 (Array (_ BitVec 32) ValueCell!3373)) (size!9093 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18457)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10887)

(declare-datatypes ((tuple2!5438 0))(
  ( (tuple2!5439 (_1!2730 (_ BitVec 64)) (_2!2730 V!10887)) )
))
(declare-datatypes ((List!5061 0))(
  ( (Nil!5058) (Cons!5057 (h!5913 tuple2!5438) (t!10185 List!5061)) )
))
(declare-datatypes ((ListLongMap!4351 0))(
  ( (ListLongMap!4352 (toList!2191 List!5061)) )
))
(declare-fun contains!2253 (ListLongMap!4351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1712 (array!18455 array!18457 (_ BitVec 32) (_ BitVec 32) V!10887 V!10887 (_ BitVec 32) Int) ListLongMap!4351)

(assert (=> b!346105 (= res!191458 (not (contains!2253 (getCurrentListMap!1712 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!191457 () Bool)

(assert (=> start!34634 (=> (not res!191457) (not e!212125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34634 (= res!191457 (validMask!0 mask!2385))))

(assert (=> start!34634 e!212125))

(assert (=> start!34634 true))

(declare-fun tp_is_empty!7433 () Bool)

(assert (=> start!34634 tp_is_empty!7433))

(assert (=> start!34634 tp!26001))

(declare-fun e!212122 () Bool)

(declare-fun array_inv!6468 (array!18457) Bool)

(assert (=> start!34634 (and (array_inv!6468 _values!1525) e!212122)))

(declare-fun array_inv!6469 (array!18455) Bool)

(assert (=> start!34634 (array_inv!6469 _keys!1895)))

(declare-fun b!346106 () Bool)

(declare-fun res!191455 () Bool)

(assert (=> b!346106 (=> (not res!191455) (not e!212125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346106 (= res!191455 (validKeyInArray!0 k!1348))))

(declare-fun b!346107 () Bool)

(declare-fun e!212123 () Bool)

(assert (=> b!346107 (= e!212123 tp_is_empty!7433)))

(declare-fun b!346108 () Bool)

(declare-fun e!212127 () Bool)

(assert (=> b!346108 (= e!212127 tp_is_empty!7433)))

(declare-fun b!346109 () Bool)

(assert (=> b!346109 (= e!212125 e!212126)))

(declare-fun res!191460 () Bool)

(assert (=> b!346109 (=> (not res!191460) (not e!212126))))

(assert (=> b!346109 (= res!191460 (and (is-Found!3369 lt!163180) (= (select (arr!8740 _keys!1895) (index!15656 lt!163180)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18455 (_ BitVec 32)) SeekEntryResult!3369)

(assert (=> b!346109 (= lt!163180 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346110 () Bool)

(declare-fun res!191459 () Bool)

(assert (=> b!346110 (=> (not res!191459) (not e!212126))))

(declare-fun arrayContainsKey!0 (array!18455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346110 (= res!191459 (arrayContainsKey!0 _keys!1895 k!1348 (index!15656 lt!163180)))))

(declare-fun b!346111 () Bool)

(declare-fun res!191456 () Bool)

(assert (=> b!346111 (=> (not res!191456) (not e!212125))))

(declare-datatypes ((List!5062 0))(
  ( (Nil!5059) (Cons!5058 (h!5914 (_ BitVec 64)) (t!10186 List!5062)) )
))
(declare-fun arrayNoDuplicates!0 (array!18455 (_ BitVec 32) List!5062) Bool)

(assert (=> b!346111 (= res!191456 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5059))))

(declare-fun b!346112 () Bool)

(declare-fun res!191462 () Bool)

(assert (=> b!346112 (=> (not res!191462) (not e!212125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18455 (_ BitVec 32)) Bool)

(assert (=> b!346112 (= res!191462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12600 () Bool)

(declare-fun tp!26000 () Bool)

(assert (=> mapNonEmpty!12600 (= mapRes!12600 (and tp!26000 e!212127))))

(declare-fun mapValue!12600 () ValueCell!3373)

(declare-fun mapKey!12600 () (_ BitVec 32))

(declare-fun mapRest!12600 () (Array (_ BitVec 32) ValueCell!3373))

(assert (=> mapNonEmpty!12600 (= (arr!8741 _values!1525) (store mapRest!12600 mapKey!12600 mapValue!12600))))

(declare-fun b!346113 () Bool)

(declare-fun res!191461 () Bool)

(assert (=> b!346113 (=> (not res!191461) (not e!212125))))

(assert (=> b!346113 (= res!191461 (and (= (size!9093 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9092 _keys!1895) (size!9093 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346114 () Bool)

(assert (=> b!346114 (= e!212122 (and e!212123 mapRes!12600))))

(declare-fun condMapEmpty!12600 () Bool)

(declare-fun mapDefault!12600 () ValueCell!3373)

