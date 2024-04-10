; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36752 () Bool)

(assert start!36752)

(declare-fun b!366750 () Bool)

(declare-fun e!224520 () Bool)

(declare-fun e!224523 () Bool)

(assert (=> b!366750 (= e!224520 e!224523)))

(declare-fun res!205203 () Bool)

(assert (=> b!366750 (=> (not res!205203) (not e!224523))))

(declare-datatypes ((array!21013 0))(
  ( (array!21014 (arr!9975 (Array (_ BitVec 32) (_ BitVec 64))) (size!10327 (_ BitVec 32))) )
))
(declare-fun lt!169269 () array!21013)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21013 (_ BitVec 32)) Bool)

(assert (=> b!366750 (= res!205203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169269 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21013)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366750 (= lt!169269 (array!21014 (store (arr!9975 _keys!658) i!548 k!778) (size!10327 _keys!658)))))

(declare-fun b!366751 () Bool)

(declare-fun e!224525 () Bool)

(declare-fun e!224522 () Bool)

(declare-fun mapRes!14355 () Bool)

(assert (=> b!366751 (= e!224525 (and e!224522 mapRes!14355))))

(declare-fun condMapEmpty!14355 () Bool)

(declare-datatypes ((V!12475 0))(
  ( (V!12476 (val!4308 Int)) )
))
(declare-datatypes ((ValueCell!3920 0))(
  ( (ValueCellFull!3920 (v!6505 V!12475)) (EmptyCell!3920) )
))
(declare-datatypes ((array!21015 0))(
  ( (array!21016 (arr!9976 (Array (_ BitVec 32) ValueCell!3920)) (size!10328 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21015)

(declare-fun mapDefault!14355 () ValueCell!3920)

