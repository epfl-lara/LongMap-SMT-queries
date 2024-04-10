; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36764 () Bool)

(assert start!36764)

(declare-fun b!366966 () Bool)

(declare-fun res!205370 () Bool)

(declare-fun e!224631 () Bool)

(assert (=> b!366966 (=> (not res!205370) (not e!224631))))

(declare-datatypes ((array!21037 0))(
  ( (array!21038 (arr!9987 (Array (_ BitVec 32) (_ BitVec 64))) (size!10339 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21037)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366966 (= res!205370 (or (= (select (arr!9987 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9987 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366967 () Bool)

(declare-fun res!205363 () Bool)

(assert (=> b!366967 (=> (not res!205363) (not e!224631))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12491 0))(
  ( (V!12492 (val!4314 Int)) )
))
(declare-datatypes ((ValueCell!3926 0))(
  ( (ValueCellFull!3926 (v!6511 V!12491)) (EmptyCell!3926) )
))
(declare-datatypes ((array!21039 0))(
  ( (array!21040 (arr!9988 (Array (_ BitVec 32) ValueCell!3926)) (size!10340 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21039)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!366967 (= res!205363 (and (= (size!10340 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10339 _keys!658) (size!10340 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14373 () Bool)

(declare-fun mapRes!14373 () Bool)

(declare-fun tp!28449 () Bool)

(declare-fun e!224630 () Bool)

(assert (=> mapNonEmpty!14373 (= mapRes!14373 (and tp!28449 e!224630))))

(declare-fun mapRest!14373 () (Array (_ BitVec 32) ValueCell!3926))

(declare-fun mapKey!14373 () (_ BitVec 32))

(declare-fun mapValue!14373 () ValueCell!3926)

(assert (=> mapNonEmpty!14373 (= (arr!9988 _values!506) (store mapRest!14373 mapKey!14373 mapValue!14373))))

(declare-fun b!366968 () Bool)

(declare-fun res!205369 () Bool)

(assert (=> b!366968 (=> (not res!205369) (not e!224631))))

(assert (=> b!366968 (= res!205369 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10339 _keys!658))))))

(declare-fun b!366969 () Bool)

(declare-fun res!205367 () Bool)

(assert (=> b!366969 (=> (not res!205367) (not e!224631))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366969 (= res!205367 (validKeyInArray!0 k!778))))

(declare-fun b!366970 () Bool)

(declare-fun res!205365 () Bool)

(assert (=> b!366970 (=> (not res!205365) (not e!224631))))

(declare-datatypes ((List!5557 0))(
  ( (Nil!5554) (Cons!5553 (h!6409 (_ BitVec 64)) (t!10707 List!5557)) )
))
(declare-fun arrayNoDuplicates!0 (array!21037 (_ BitVec 32) List!5557) Bool)

(assert (=> b!366970 (= res!205365 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5554))))

(declare-fun b!366971 () Bool)

(declare-fun e!224632 () Bool)

(assert (=> b!366971 (= e!224631 e!224632)))

(declare-fun res!205362 () Bool)

(assert (=> b!366971 (=> (not res!205362) (not e!224632))))

(declare-fun lt!169305 () array!21037)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21037 (_ BitVec 32)) Bool)

(assert (=> b!366971 (= res!205362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169305 mask!970))))

(assert (=> b!366971 (= lt!169305 (array!21038 (store (arr!9987 _keys!658) i!548 k!778) (size!10339 _keys!658)))))

(declare-fun b!366973 () Bool)

(declare-fun tp_is_empty!8539 () Bool)

(assert (=> b!366973 (= e!224630 tp_is_empty!8539)))

(declare-fun b!366974 () Bool)

(declare-fun e!224633 () Bool)

(declare-fun e!224628 () Bool)

(assert (=> b!366974 (= e!224633 (and e!224628 mapRes!14373))))

(declare-fun condMapEmpty!14373 () Bool)

(declare-fun mapDefault!14373 () ValueCell!3926)

