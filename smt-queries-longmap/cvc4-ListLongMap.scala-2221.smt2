; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36792 () Bool)

(assert start!36792)

(declare-fun b!367470 () Bool)

(declare-fun res!205746 () Bool)

(declare-fun e!224884 () Bool)

(assert (=> b!367470 (=> (not res!205746) (not e!224884))))

(declare-datatypes ((array!21093 0))(
  ( (array!21094 (arr!10015 (Array (_ BitVec 32) (_ BitVec 64))) (size!10367 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21093)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21093 (_ BitVec 32)) Bool)

(assert (=> b!367470 (= res!205746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367471 () Bool)

(declare-fun res!205742 () Bool)

(assert (=> b!367471 (=> (not res!205742) (not e!224884))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12527 0))(
  ( (V!12528 (val!4328 Int)) )
))
(declare-datatypes ((ValueCell!3940 0))(
  ( (ValueCellFull!3940 (v!6525 V!12527)) (EmptyCell!3940) )
))
(declare-datatypes ((array!21095 0))(
  ( (array!21096 (arr!10016 (Array (_ BitVec 32) ValueCell!3940)) (size!10368 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21095)

(assert (=> b!367471 (= res!205742 (and (= (size!10368 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10367 _keys!658) (size!10368 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14415 () Bool)

(declare-fun mapRes!14415 () Bool)

(assert (=> mapIsEmpty!14415 mapRes!14415))

(declare-fun b!367472 () Bool)

(declare-fun e!224881 () Bool)

(declare-fun e!224882 () Bool)

(assert (=> b!367472 (= e!224881 (and e!224882 mapRes!14415))))

(declare-fun condMapEmpty!14415 () Bool)

(declare-fun mapDefault!14415 () ValueCell!3940)

