; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34316 () Bool)

(assert start!34316)

(declare-fun b_free!7291 () Bool)

(declare-fun b_next!7291 () Bool)

(assert (=> start!34316 (= b_free!7291 (not b_next!7291))))

(declare-fun tp!25413 () Bool)

(declare-fun b_and!14495 () Bool)

(assert (=> start!34316 (= tp!25413 b_and!14495)))

(declare-fun mapNonEmpty!12297 () Bool)

(declare-fun mapRes!12297 () Bool)

(declare-fun tp!25412 () Bool)

(declare-fun e!210019 () Bool)

(assert (=> mapNonEmpty!12297 (= mapRes!12297 (and tp!25412 e!210019))))

(declare-datatypes ((V!10635 0))(
  ( (V!10636 (val!3666 Int)) )
))
(declare-datatypes ((ValueCell!3278 0))(
  ( (ValueCellFull!3278 (v!5840 V!10635)) (EmptyCell!3278) )
))
(declare-fun mapRest!12297 () (Array (_ BitVec 32) ValueCell!3278))

(declare-fun mapKey!12297 () (_ BitVec 32))

(declare-fun mapValue!12297 () ValueCell!3278)

(declare-datatypes ((array!18079 0))(
  ( (array!18080 (arr!8558 (Array (_ BitVec 32) ValueCell!3278)) (size!8910 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18079)

(assert (=> mapNonEmpty!12297 (= (arr!8558 _values!1525) (store mapRest!12297 mapKey!12297 mapValue!12297))))

(declare-fun b!342479 () Bool)

(declare-fun res!189312 () Bool)

(declare-fun e!210015 () Bool)

(assert (=> b!342479 (=> (not res!189312) (not e!210015))))

(declare-datatypes ((array!18081 0))(
  ( (array!18082 (arr!8559 (Array (_ BitVec 32) (_ BitVec 64))) (size!8911 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18081)

(declare-datatypes ((List!4931 0))(
  ( (Nil!4928) (Cons!4927 (h!5783 (_ BitVec 64)) (t!10043 List!4931)) )
))
(declare-fun arrayNoDuplicates!0 (array!18081 (_ BitVec 32) List!4931) Bool)

(assert (=> b!342479 (= res!189312 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4928))))

(declare-fun mapIsEmpty!12297 () Bool)

(assert (=> mapIsEmpty!12297 mapRes!12297))

(declare-fun b!342481 () Bool)

(declare-fun res!189313 () Bool)

(assert (=> b!342481 (=> (not res!189313) (not e!210015))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18081 (_ BitVec 32)) Bool)

(assert (=> b!342481 (= res!189313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342482 () Bool)

(declare-fun e!210020 () Bool)

(assert (=> b!342482 (= e!210020 false)))

(declare-datatypes ((Unit!10664 0))(
  ( (Unit!10665) )
))
(declare-fun lt!162168 () Unit!10664)

(declare-fun e!210018 () Unit!10664)

(assert (=> b!342482 (= lt!162168 e!210018)))

(declare-fun c!52818 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342482 (= c!52818 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342483 () Bool)

(declare-fun e!210017 () Bool)

(declare-fun tp_is_empty!7243 () Bool)

(assert (=> b!342483 (= e!210017 tp_is_empty!7243)))

(declare-fun b!342484 () Bool)

(assert (=> b!342484 (= e!210019 tp_is_empty!7243)))

(declare-fun b!342485 () Bool)

(declare-fun res!189316 () Bool)

(assert (=> b!342485 (=> (not res!189316) (not e!210015))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342485 (= res!189316 (and (= (size!8910 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8911 _keys!1895) (size!8910 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342486 () Bool)

(declare-fun e!210016 () Bool)

(assert (=> b!342486 (= e!210016 (and e!210017 mapRes!12297))))

(declare-fun condMapEmpty!12297 () Bool)

(declare-fun mapDefault!12297 () ValueCell!3278)

