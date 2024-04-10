; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36918 () Bool)

(assert start!36918)

(declare-fun b_free!8045 () Bool)

(declare-fun b_next!8045 () Bool)

(assert (=> start!36918 (= b_free!8045 (not b_next!8045))))

(declare-fun tp!28850 () Bool)

(declare-fun b_and!15287 () Bool)

(assert (=> start!36918 (= tp!28850 b_and!15287)))

(declare-fun b!369917 () Bool)

(declare-fun res!207621 () Bool)

(declare-fun e!226017 () Bool)

(assert (=> b!369917 (=> (not res!207621) (not e!226017))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21329 0))(
  ( (array!21330 (arr!10133 (Array (_ BitVec 32) (_ BitVec 64))) (size!10485 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21329)

(assert (=> b!369917 (= res!207621 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10485 _keys!658))))))

(declare-fun mapNonEmpty!14604 () Bool)

(declare-fun mapRes!14604 () Bool)

(declare-fun tp!28851 () Bool)

(declare-fun e!226016 () Bool)

(assert (=> mapNonEmpty!14604 (= mapRes!14604 (and tp!28851 e!226016))))

(declare-datatypes ((V!12695 0))(
  ( (V!12696 (val!4391 Int)) )
))
(declare-datatypes ((ValueCell!4003 0))(
  ( (ValueCellFull!4003 (v!6588 V!12695)) (EmptyCell!4003) )
))
(declare-datatypes ((array!21331 0))(
  ( (array!21332 (arr!10134 (Array (_ BitVec 32) ValueCell!4003)) (size!10486 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21331)

(declare-fun mapRest!14604 () (Array (_ BitVec 32) ValueCell!4003))

(declare-fun mapValue!14604 () ValueCell!4003)

(declare-fun mapKey!14604 () (_ BitVec 32))

(assert (=> mapNonEmpty!14604 (= (arr!10134 _values!506) (store mapRest!14604 mapKey!14604 mapValue!14604))))

(declare-fun b!369918 () Bool)

(declare-fun res!207626 () Bool)

(assert (=> b!369918 (=> (not res!207626) (not e!226017))))

(declare-datatypes ((List!5659 0))(
  ( (Nil!5656) (Cons!5655 (h!6511 (_ BitVec 64)) (t!10809 List!5659)) )
))
(declare-fun arrayNoDuplicates!0 (array!21329 (_ BitVec 32) List!5659) Bool)

(assert (=> b!369918 (= res!207626 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5656))))

(declare-fun b!369919 () Bool)

(declare-fun res!207629 () Bool)

(assert (=> b!369919 (=> (not res!207629) (not e!226017))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21329 (_ BitVec 32)) Bool)

(assert (=> b!369919 (= res!207629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369920 () Bool)

(declare-fun e!226015 () Bool)

(declare-fun tp_is_empty!8693 () Bool)

(assert (=> b!369920 (= e!226015 tp_is_empty!8693)))

(declare-fun b!369921 () Bool)

(declare-fun e!226014 () Bool)

(assert (=> b!369921 (= e!226014 (and e!226015 mapRes!14604))))

(declare-fun condMapEmpty!14604 () Bool)

(declare-fun mapDefault!14604 () ValueCell!4003)

