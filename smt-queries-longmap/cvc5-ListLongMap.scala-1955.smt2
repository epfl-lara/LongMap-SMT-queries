; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34476 () Bool)

(assert start!34476)

(declare-fun b_free!7399 () Bool)

(declare-fun b_next!7399 () Bool)

(assert (=> start!34476 (= b_free!7399 (not b_next!7399))))

(declare-fun tp!25743 () Bool)

(declare-fun b_and!14607 () Bool)

(assert (=> start!34476 (= tp!25743 b_and!14607)))

(declare-fun b!344434 () Bool)

(declare-fun res!190483 () Bool)

(declare-fun e!211148 () Bool)

(assert (=> b!344434 (=> (not res!190483) (not e!211148))))

(declare-datatypes ((array!18291 0))(
  ( (array!18292 (arr!8662 (Array (_ BitVec 32) (_ BitVec 64))) (size!9014 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18291)

(declare-datatypes ((List!5007 0))(
  ( (Nil!5004) (Cons!5003 (h!5859 (_ BitVec 64)) (t!10123 List!5007)) )
))
(declare-fun arrayNoDuplicates!0 (array!18291 (_ BitVec 32) List!5007) Bool)

(assert (=> b!344434 (= res!190483 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5004))))

(declare-fun b!344435 () Bool)

(declare-fun e!211146 () Bool)

(declare-fun tp_is_empty!7351 () Bool)

(assert (=> b!344435 (= e!211146 tp_is_empty!7351)))

(declare-fun mapNonEmpty!12465 () Bool)

(declare-fun mapRes!12465 () Bool)

(declare-fun tp!25742 () Bool)

(assert (=> mapNonEmpty!12465 (= mapRes!12465 (and tp!25742 e!211146))))

(declare-fun mapKey!12465 () (_ BitVec 32))

(declare-datatypes ((V!10779 0))(
  ( (V!10780 (val!3720 Int)) )
))
(declare-datatypes ((ValueCell!3332 0))(
  ( (ValueCellFull!3332 (v!5896 V!10779)) (EmptyCell!3332) )
))
(declare-fun mapValue!12465 () ValueCell!3332)

(declare-fun mapRest!12465 () (Array (_ BitVec 32) ValueCell!3332))

(declare-datatypes ((array!18293 0))(
  ( (array!18294 (arr!8663 (Array (_ BitVec 32) ValueCell!3332)) (size!9015 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18293)

(assert (=> mapNonEmpty!12465 (= (arr!8663 _values!1525) (store mapRest!12465 mapKey!12465 mapValue!12465))))

(declare-fun b!344436 () Bool)

(declare-fun e!211147 () Bool)

(assert (=> b!344436 (= e!211147 tp_is_empty!7351)))

(declare-fun res!190482 () Bool)

(assert (=> start!34476 (=> (not res!190482) (not e!211148))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34476 (= res!190482 (validMask!0 mask!2385))))

(assert (=> start!34476 e!211148))

(assert (=> start!34476 true))

(assert (=> start!34476 tp_is_empty!7351))

(assert (=> start!34476 tp!25743))

(declare-fun e!211145 () Bool)

(declare-fun array_inv!6414 (array!18293) Bool)

(assert (=> start!34476 (and (array_inv!6414 _values!1525) e!211145)))

(declare-fun array_inv!6415 (array!18291) Bool)

(assert (=> start!34476 (array_inv!6415 _keys!1895)))

(declare-fun b!344437 () Bool)

(assert (=> b!344437 (= e!211145 (and e!211147 mapRes!12465))))

(declare-fun condMapEmpty!12465 () Bool)

(declare-fun mapDefault!12465 () ValueCell!3332)

