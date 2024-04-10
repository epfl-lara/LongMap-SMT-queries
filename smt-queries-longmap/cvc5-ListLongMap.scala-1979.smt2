; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34736 () Bool)

(assert start!34736)

(declare-fun b_free!7543 () Bool)

(declare-fun b_next!7543 () Bool)

(assert (=> start!34736 (= b_free!7543 (not b_next!7543))))

(declare-fun tp!26193 () Bool)

(declare-fun b_and!14763 () Bool)

(assert (=> start!34736 (= tp!26193 b_and!14763)))

(declare-fun res!192290 () Bool)

(declare-fun e!212850 () Bool)

(assert (=> start!34736 (=> (not res!192290) (not e!212850))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34736 (= res!192290 (validMask!0 mask!2385))))

(assert (=> start!34736 e!212850))

(assert (=> start!34736 true))

(declare-fun tp_is_empty!7495 () Bool)

(assert (=> start!34736 tp_is_empty!7495))

(assert (=> start!34736 tp!26193))

(declare-datatypes ((V!10971 0))(
  ( (V!10972 (val!3792 Int)) )
))
(declare-datatypes ((ValueCell!3404 0))(
  ( (ValueCellFull!3404 (v!5974 V!10971)) (EmptyCell!3404) )
))
(declare-datatypes ((array!18581 0))(
  ( (array!18582 (arr!8801 (Array (_ BitVec 32) ValueCell!3404)) (size!9153 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18581)

(declare-fun e!212848 () Bool)

(declare-fun array_inv!6518 (array!18581) Bool)

(assert (=> start!34736 (and (array_inv!6518 _values!1525) e!212848)))

(declare-datatypes ((array!18583 0))(
  ( (array!18584 (arr!8802 (Array (_ BitVec 32) (_ BitVec 64))) (size!9154 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18583)

(declare-fun array_inv!6519 (array!18583) Bool)

(assert (=> start!34736 (array_inv!6519 _keys!1895)))

(declare-fun b!347375 () Bool)

(declare-fun e!212846 () Bool)

(assert (=> b!347375 (= e!212846 tp_is_empty!7495)))

(declare-fun b!347376 () Bool)

(declare-fun res!192287 () Bool)

(assert (=> b!347376 (=> (not res!192287) (not e!212850))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347376 (= res!192287 (and (= (size!9153 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9154 _keys!1895) (size!9153 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347377 () Bool)

(declare-fun e!212849 () Bool)

(assert (=> b!347377 (= e!212850 e!212849)))

(declare-fun res!192284 () Bool)

(assert (=> b!347377 (=> (not res!192284) (not e!212849))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3396 0))(
  ( (MissingZero!3396 (index!15763 (_ BitVec 32))) (Found!3396 (index!15764 (_ BitVec 32))) (Intermediate!3396 (undefined!4208 Bool) (index!15765 (_ BitVec 32)) (x!34610 (_ BitVec 32))) (Undefined!3396) (MissingVacant!3396 (index!15766 (_ BitVec 32))) )
))
(declare-fun lt!163540 () SeekEntryResult!3396)

(assert (=> b!347377 (= res!192284 (and (is-Found!3396 lt!163540) (= (select (arr!8802 _keys!1895) (index!15764 lt!163540)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18583 (_ BitVec 32)) SeekEntryResult!3396)

(assert (=> b!347377 (= lt!163540 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347378 () Bool)

(declare-fun res!192288 () Bool)

(assert (=> b!347378 (=> (not res!192288) (not e!212850))))

(declare-datatypes ((List!5111 0))(
  ( (Nil!5108) (Cons!5107 (h!5963 (_ BitVec 64)) (t!10239 List!5111)) )
))
(declare-fun arrayNoDuplicates!0 (array!18583 (_ BitVec 32) List!5111) Bool)

(assert (=> b!347378 (= res!192288 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5108))))

(declare-fun b!347379 () Bool)

(declare-fun res!192283 () Bool)

(assert (=> b!347379 (=> (not res!192283) (not e!212849))))

(declare-fun arrayContainsKey!0 (array!18583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347379 (= res!192283 (arrayContainsKey!0 _keys!1895 k!1348 (index!15764 lt!163540)))))

(declare-fun b!347380 () Bool)

(declare-fun res!192286 () Bool)

(assert (=> b!347380 (=> (not res!192286) (not e!212850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347380 (= res!192286 (validKeyInArray!0 k!1348))))

(declare-fun b!347381 () Bool)

(declare-fun e!212845 () Bool)

(assert (=> b!347381 (= e!212845 tp_is_empty!7495)))

(declare-fun b!347382 () Bool)

(declare-fun mapRes!12699 () Bool)

(assert (=> b!347382 (= e!212848 (and e!212846 mapRes!12699))))

(declare-fun condMapEmpty!12699 () Bool)

(declare-fun mapDefault!12699 () ValueCell!3404)

