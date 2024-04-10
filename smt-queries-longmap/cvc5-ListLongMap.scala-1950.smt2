; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34446 () Bool)

(assert start!34446)

(declare-fun b_free!7369 () Bool)

(declare-fun b_next!7369 () Bool)

(assert (=> start!34446 (= b_free!7369 (not b_next!7369))))

(declare-fun tp!25653 () Bool)

(declare-fun b_and!14577 () Bool)

(assert (=> start!34446 (= tp!25653 b_and!14577)))

(declare-fun res!190214 () Bool)

(declare-fun e!210922 () Bool)

(assert (=> start!34446 (=> (not res!190214) (not e!210922))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34446 (= res!190214 (validMask!0 mask!2385))))

(assert (=> start!34446 e!210922))

(assert (=> start!34446 true))

(declare-fun tp_is_empty!7321 () Bool)

(assert (=> start!34446 tp_is_empty!7321))

(assert (=> start!34446 tp!25653))

(declare-datatypes ((V!10739 0))(
  ( (V!10740 (val!3705 Int)) )
))
(declare-datatypes ((ValueCell!3317 0))(
  ( (ValueCellFull!3317 (v!5881 V!10739)) (EmptyCell!3317) )
))
(declare-datatypes ((array!18233 0))(
  ( (array!18234 (arr!8633 (Array (_ BitVec 32) ValueCell!3317)) (size!8985 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18233)

(declare-fun e!210923 () Bool)

(declare-fun array_inv!6398 (array!18233) Bool)

(assert (=> start!34446 (and (array_inv!6398 _values!1525) e!210923)))

(declare-datatypes ((array!18235 0))(
  ( (array!18236 (arr!8634 (Array (_ BitVec 32) (_ BitVec 64))) (size!8986 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18235)

(declare-fun array_inv!6399 (array!18235) Bool)

(assert (=> start!34446 (array_inv!6399 _keys!1895)))

(declare-fun mapNonEmpty!12420 () Bool)

(declare-fun mapRes!12420 () Bool)

(declare-fun tp!25652 () Bool)

(declare-fun e!210921 () Bool)

(assert (=> mapNonEmpty!12420 (= mapRes!12420 (and tp!25652 e!210921))))

(declare-fun mapRest!12420 () (Array (_ BitVec 32) ValueCell!3317))

(declare-fun mapValue!12420 () ValueCell!3317)

(declare-fun mapKey!12420 () (_ BitVec 32))

(assert (=> mapNonEmpty!12420 (= (arr!8633 _values!1525) (store mapRest!12420 mapKey!12420 mapValue!12420))))

(declare-fun b!344029 () Bool)

(declare-fun res!190213 () Bool)

(assert (=> b!344029 (=> (not res!190213) (not e!210922))))

(declare-datatypes ((List!4985 0))(
  ( (Nil!4982) (Cons!4981 (h!5837 (_ BitVec 64)) (t!10101 List!4985)) )
))
(declare-fun arrayNoDuplicates!0 (array!18235 (_ BitVec 32) List!4985) Bool)

(assert (=> b!344029 (= res!190213 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4982))))

(declare-fun b!344030 () Bool)

(assert (=> b!344030 (= e!210922 false)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3332 0))(
  ( (MissingZero!3332 (index!15507 (_ BitVec 32))) (Found!3332 (index!15508 (_ BitVec 32))) (Intermediate!3332 (undefined!4144 Bool) (index!15509 (_ BitVec 32)) (x!34254 (_ BitVec 32))) (Undefined!3332) (MissingVacant!3332 (index!15510 (_ BitVec 32))) )
))
(declare-fun lt!162628 () SeekEntryResult!3332)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18235 (_ BitVec 32)) SeekEntryResult!3332)

(assert (=> b!344030 (= lt!162628 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344031 () Bool)

(declare-fun res!190212 () Bool)

(assert (=> b!344031 (=> (not res!190212) (not e!210922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344031 (= res!190212 (validKeyInArray!0 k!1348))))

(declare-fun b!344032 () Bool)

(declare-fun res!190215 () Bool)

(assert (=> b!344032 (=> (not res!190215) (not e!210922))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344032 (= res!190215 (and (= (size!8985 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8986 _keys!1895) (size!8985 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344033 () Bool)

(declare-fun e!210920 () Bool)

(assert (=> b!344033 (= e!210923 (and e!210920 mapRes!12420))))

(declare-fun condMapEmpty!12420 () Bool)

(declare-fun mapDefault!12420 () ValueCell!3317)

