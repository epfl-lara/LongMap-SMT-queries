; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34338 () Bool)

(assert start!34338)

(declare-fun b_free!7313 () Bool)

(declare-fun b_next!7313 () Bool)

(assert (=> start!34338 (= b_free!7313 (not b_next!7313))))

(declare-fun tp!25479 () Bool)

(declare-fun b_and!14517 () Bool)

(assert (=> start!34338 (= tp!25479 b_and!14517)))

(declare-fun mapIsEmpty!12330 () Bool)

(declare-fun mapRes!12330 () Bool)

(assert (=> mapIsEmpty!12330 mapRes!12330))

(declare-fun b!342875 () Bool)

(declare-fun res!189543 () Bool)

(declare-fun e!210246 () Bool)

(assert (=> b!342875 (=> (not res!189543) (not e!210246))))

(declare-datatypes ((array!18121 0))(
  ( (array!18122 (arr!8579 (Array (_ BitVec 32) (_ BitVec 64))) (size!8931 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18121)

(declare-datatypes ((List!4947 0))(
  ( (Nil!4944) (Cons!4943 (h!5799 (_ BitVec 64)) (t!10059 List!4947)) )
))
(declare-fun arrayNoDuplicates!0 (array!18121 (_ BitVec 32) List!4947) Bool)

(assert (=> b!342875 (= res!189543 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4944))))

(declare-fun res!189547 () Bool)

(assert (=> start!34338 (=> (not res!189547) (not e!210246))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34338 (= res!189547 (validMask!0 mask!2385))))

(assert (=> start!34338 e!210246))

(assert (=> start!34338 true))

(declare-fun tp_is_empty!7265 () Bool)

(assert (=> start!34338 tp_is_empty!7265))

(assert (=> start!34338 tp!25479))

(declare-datatypes ((V!10663 0))(
  ( (V!10664 (val!3677 Int)) )
))
(declare-datatypes ((ValueCell!3289 0))(
  ( (ValueCellFull!3289 (v!5851 V!10663)) (EmptyCell!3289) )
))
(declare-datatypes ((array!18123 0))(
  ( (array!18124 (arr!8580 (Array (_ BitVec 32) ValueCell!3289)) (size!8932 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18123)

(declare-fun e!210250 () Bool)

(declare-fun array_inv!6352 (array!18123) Bool)

(assert (=> start!34338 (and (array_inv!6352 _values!1525) e!210250)))

(declare-fun array_inv!6353 (array!18121) Bool)

(assert (=> start!34338 (array_inv!6353 _keys!1895)))

(declare-fun mapNonEmpty!12330 () Bool)

(declare-fun tp!25478 () Bool)

(declare-fun e!210251 () Bool)

(assert (=> mapNonEmpty!12330 (= mapRes!12330 (and tp!25478 e!210251))))

(declare-fun mapValue!12330 () ValueCell!3289)

(declare-fun mapRest!12330 () (Array (_ BitVec 32) ValueCell!3289))

(declare-fun mapKey!12330 () (_ BitVec 32))

(assert (=> mapNonEmpty!12330 (= (arr!8580 _values!1525) (store mapRest!12330 mapKey!12330 mapValue!12330))))

(declare-fun b!342876 () Bool)

(declare-fun e!210252 () Bool)

(assert (=> b!342876 (= e!210250 (and e!210252 mapRes!12330))))

(declare-fun condMapEmpty!12330 () Bool)

(declare-fun mapDefault!12330 () ValueCell!3289)

