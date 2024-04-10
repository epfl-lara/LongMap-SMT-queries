; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34474 () Bool)

(assert start!34474)

(declare-fun b_free!7397 () Bool)

(declare-fun b_next!7397 () Bool)

(assert (=> start!34474 (= b_free!7397 (not b_next!7397))))

(declare-fun tp!25736 () Bool)

(declare-fun b_and!14605 () Bool)

(assert (=> start!34474 (= tp!25736 b_and!14605)))

(declare-fun res!190468 () Bool)

(declare-fun e!211134 () Bool)

(assert (=> start!34474 (=> (not res!190468) (not e!211134))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34474 (= res!190468 (validMask!0 mask!2385))))

(assert (=> start!34474 e!211134))

(assert (=> start!34474 true))

(declare-fun tp_is_empty!7349 () Bool)

(assert (=> start!34474 tp_is_empty!7349))

(assert (=> start!34474 tp!25736))

(declare-datatypes ((V!10775 0))(
  ( (V!10776 (val!3719 Int)) )
))
(declare-datatypes ((ValueCell!3331 0))(
  ( (ValueCellFull!3331 (v!5895 V!10775)) (EmptyCell!3331) )
))
(declare-datatypes ((array!18287 0))(
  ( (array!18288 (arr!8660 (Array (_ BitVec 32) ValueCell!3331)) (size!9012 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18287)

(declare-fun e!211133 () Bool)

(declare-fun array_inv!6412 (array!18287) Bool)

(assert (=> start!34474 (and (array_inv!6412 _values!1525) e!211133)))

(declare-datatypes ((array!18289 0))(
  ( (array!18290 (arr!8661 (Array (_ BitVec 32) (_ BitVec 64))) (size!9013 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18289)

(declare-fun array_inv!6413 (array!18289) Bool)

(assert (=> start!34474 (array_inv!6413 _keys!1895)))

(declare-fun mapNonEmpty!12462 () Bool)

(declare-fun mapRes!12462 () Bool)

(declare-fun tp!25737 () Bool)

(declare-fun e!211130 () Bool)

(assert (=> mapNonEmpty!12462 (= mapRes!12462 (and tp!25737 e!211130))))

(declare-fun mapRest!12462 () (Array (_ BitVec 32) ValueCell!3331))

(declare-fun mapValue!12462 () ValueCell!3331)

(declare-fun mapKey!12462 () (_ BitVec 32))

(assert (=> mapNonEmpty!12462 (= (arr!8660 _values!1525) (store mapRest!12462 mapKey!12462 mapValue!12462))))

(declare-fun b!344407 () Bool)

(declare-fun res!190464 () Bool)

(assert (=> b!344407 (=> (not res!190464) (not e!211134))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344407 (= res!190464 (validKeyInArray!0 k!1348))))

(declare-fun b!344408 () Bool)

(declare-fun res!190469 () Bool)

(assert (=> b!344408 (=> (not res!190469) (not e!211134))))

(declare-datatypes ((List!5006 0))(
  ( (Nil!5003) (Cons!5002 (h!5858 (_ BitVec 64)) (t!10122 List!5006)) )
))
(declare-fun arrayNoDuplicates!0 (array!18289 (_ BitVec 32) List!5006) Bool)

(assert (=> b!344408 (= res!190469 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5003))))

(declare-fun b!344409 () Bool)

(declare-fun res!190466 () Bool)

(assert (=> b!344409 (=> (not res!190466) (not e!211134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18289 (_ BitVec 32)) Bool)

(assert (=> b!344409 (= res!190466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344410 () Bool)

(declare-fun e!211132 () Bool)

(assert (=> b!344410 (= e!211133 (and e!211132 mapRes!12462))))

(declare-fun condMapEmpty!12462 () Bool)

(declare-fun mapDefault!12462 () ValueCell!3331)

