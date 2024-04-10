; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34414 () Bool)

(assert start!34414)

(declare-fun b_free!7337 () Bool)

(declare-fun b_next!7337 () Bool)

(assert (=> start!34414 (= b_free!7337 (not b_next!7337))))

(declare-fun tp!25556 () Bool)

(declare-fun b_and!14545 () Bool)

(assert (=> start!34414 (= tp!25556 b_and!14545)))

(declare-fun res!189925 () Bool)

(declare-fun e!210681 () Bool)

(assert (=> start!34414 (=> (not res!189925) (not e!210681))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34414 (= res!189925 (validMask!0 mask!2385))))

(assert (=> start!34414 e!210681))

(assert (=> start!34414 true))

(declare-fun tp_is_empty!7289 () Bool)

(assert (=> start!34414 tp_is_empty!7289))

(assert (=> start!34414 tp!25556))

(declare-datatypes ((V!10695 0))(
  ( (V!10696 (val!3689 Int)) )
))
(declare-datatypes ((ValueCell!3301 0))(
  ( (ValueCellFull!3301 (v!5865 V!10695)) (EmptyCell!3301) )
))
(declare-datatypes ((array!18171 0))(
  ( (array!18172 (arr!8602 (Array (_ BitVec 32) ValueCell!3301)) (size!8954 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18171)

(declare-fun e!210684 () Bool)

(declare-fun array_inv!6370 (array!18171) Bool)

(assert (=> start!34414 (and (array_inv!6370 _values!1525) e!210684)))

(declare-datatypes ((array!18173 0))(
  ( (array!18174 (arr!8603 (Array (_ BitVec 32) (_ BitVec 64))) (size!8955 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18173)

(declare-fun array_inv!6371 (array!18173) Bool)

(assert (=> start!34414 (array_inv!6371 _keys!1895)))

(declare-fun b!343597 () Bool)

(declare-fun e!210680 () Bool)

(assert (=> b!343597 (= e!210680 tp_is_empty!7289)))

(declare-fun b!343598 () Bool)

(declare-fun res!189928 () Bool)

(assert (=> b!343598 (=> (not res!189928) (not e!210681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18173 (_ BitVec 32)) Bool)

(assert (=> b!343598 (= res!189928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343599 () Bool)

(declare-fun res!189924 () Bool)

(assert (=> b!343599 (=> (not res!189924) (not e!210681))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343599 (= res!189924 (validKeyInArray!0 k!1348))))

(declare-fun b!343600 () Bool)

(assert (=> b!343600 (= e!210681 false)))

(declare-datatypes ((SeekEntryResult!3319 0))(
  ( (MissingZero!3319 (index!15455 (_ BitVec 32))) (Found!3319 (index!15456 (_ BitVec 32))) (Intermediate!3319 (undefined!4131 Bool) (index!15457 (_ BitVec 32)) (x!34193 (_ BitVec 32))) (Undefined!3319) (MissingVacant!3319 (index!15458 (_ BitVec 32))) )
))
(declare-fun lt!162580 () SeekEntryResult!3319)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18173 (_ BitVec 32)) SeekEntryResult!3319)

(assert (=> b!343600 (= lt!162580 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12372 () Bool)

(declare-fun mapRes!12372 () Bool)

(declare-fun tp!25557 () Bool)

(assert (=> mapNonEmpty!12372 (= mapRes!12372 (and tp!25557 e!210680))))

(declare-fun mapValue!12372 () ValueCell!3301)

(declare-fun mapRest!12372 () (Array (_ BitVec 32) ValueCell!3301))

(declare-fun mapKey!12372 () (_ BitVec 32))

(assert (=> mapNonEmpty!12372 (= (arr!8602 _values!1525) (store mapRest!12372 mapKey!12372 mapValue!12372))))

(declare-fun mapIsEmpty!12372 () Bool)

(assert (=> mapIsEmpty!12372 mapRes!12372))

(declare-fun b!343601 () Bool)

(declare-fun e!210683 () Bool)

(assert (=> b!343601 (= e!210684 (and e!210683 mapRes!12372))))

(declare-fun condMapEmpty!12372 () Bool)

(declare-fun mapDefault!12372 () ValueCell!3301)

