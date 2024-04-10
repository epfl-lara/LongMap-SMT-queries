; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34452 () Bool)

(assert start!34452)

(declare-fun b_free!7375 () Bool)

(declare-fun b_next!7375 () Bool)

(assert (=> start!34452 (= b_free!7375 (not b_next!7375))))

(declare-fun tp!25671 () Bool)

(declare-fun b_and!14583 () Bool)

(assert (=> start!34452 (= tp!25671 b_and!14583)))

(declare-fun mapNonEmpty!12429 () Bool)

(declare-fun mapRes!12429 () Bool)

(declare-fun tp!25670 () Bool)

(declare-fun e!210967 () Bool)

(assert (=> mapNonEmpty!12429 (= mapRes!12429 (and tp!25670 e!210967))))

(declare-datatypes ((V!10747 0))(
  ( (V!10748 (val!3708 Int)) )
))
(declare-datatypes ((ValueCell!3320 0))(
  ( (ValueCellFull!3320 (v!5884 V!10747)) (EmptyCell!3320) )
))
(declare-fun mapValue!12429 () ValueCell!3320)

(declare-fun mapKey!12429 () (_ BitVec 32))

(declare-datatypes ((array!18245 0))(
  ( (array!18246 (arr!8639 (Array (_ BitVec 32) ValueCell!3320)) (size!8991 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18245)

(declare-fun mapRest!12429 () (Array (_ BitVec 32) ValueCell!3320))

(assert (=> mapNonEmpty!12429 (= (arr!8639 _values!1525) (store mapRest!12429 mapKey!12429 mapValue!12429))))

(declare-fun b!344110 () Bool)

(declare-fun tp_is_empty!7327 () Bool)

(assert (=> b!344110 (= e!210967 tp_is_empty!7327)))

(declare-fun b!344111 () Bool)

(declare-fun res!190269 () Bool)

(declare-fun e!210968 () Bool)

(assert (=> b!344111 (=> (not res!190269) (not e!210968))))

(declare-datatypes ((array!18247 0))(
  ( (array!18248 (arr!8640 (Array (_ BitVec 32) (_ BitVec 64))) (size!8992 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18247)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18247 (_ BitVec 32)) Bool)

(assert (=> b!344111 (= res!190269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12429 () Bool)

(assert (=> mapIsEmpty!12429 mapRes!12429))

(declare-fun b!344112 () Bool)

(declare-fun e!210965 () Bool)

(declare-fun e!210966 () Bool)

(assert (=> b!344112 (= e!210965 (and e!210966 mapRes!12429))))

(declare-fun condMapEmpty!12429 () Bool)

(declare-fun mapDefault!12429 () ValueCell!3320)

