; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35044 () Bool)

(assert start!35044)

(declare-fun b_free!7733 () Bool)

(declare-fun b_next!7733 () Bool)

(assert (=> start!35044 (= b_free!7733 (not b_next!7733))))

(declare-fun tp!26777 () Bool)

(declare-fun b_and!14963 () Bool)

(assert (=> start!35044 (= tp!26777 b_and!14963)))

(declare-fun b!351338 () Bool)

(declare-fun e!215153 () Bool)

(declare-fun tp_is_empty!7685 () Bool)

(assert (=> b!351338 (= e!215153 tp_is_empty!7685)))

(declare-fun b!351339 () Bool)

(declare-fun e!215152 () Bool)

(declare-fun e!215151 () Bool)

(assert (=> b!351339 (= e!215152 e!215151)))

(declare-fun res!194853 () Bool)

(assert (=> b!351339 (=> (not res!194853) (not e!215151))))

(declare-datatypes ((SeekEntryResult!3456 0))(
  ( (MissingZero!3456 (index!16003 (_ BitVec 32))) (Found!3456 (index!16004 (_ BitVec 32))) (Intermediate!3456 (undefined!4268 Bool) (index!16005 (_ BitVec 32)) (x!34968 (_ BitVec 32))) (Undefined!3456) (MissingVacant!3456 (index!16006 (_ BitVec 32))) )
))
(declare-fun lt!164746 () SeekEntryResult!3456)

(assert (=> b!351339 (= res!194853 (and (not (is-Found!3456 lt!164746)) (not (is-MissingZero!3456 lt!164746)) (is-MissingVacant!3456 lt!164746)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18957 0))(
  ( (array!18958 (arr!8984 (Array (_ BitVec 32) (_ BitVec 64))) (size!9336 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18957)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18957 (_ BitVec 32)) SeekEntryResult!3456)

(assert (=> b!351339 (= lt!164746 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351340 () Bool)

(declare-fun e!215154 () Bool)

(declare-fun mapRes!12999 () Bool)

(assert (=> b!351340 (= e!215154 (and e!215153 mapRes!12999))))

(declare-fun condMapEmpty!12999 () Bool)

(declare-datatypes ((V!11223 0))(
  ( (V!11224 (val!3887 Int)) )
))
(declare-datatypes ((ValueCell!3499 0))(
  ( (ValueCellFull!3499 (v!6074 V!11223)) (EmptyCell!3499) )
))
(declare-datatypes ((array!18959 0))(
  ( (array!18960 (arr!8985 (Array (_ BitVec 32) ValueCell!3499)) (size!9337 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18959)

(declare-fun mapDefault!12999 () ValueCell!3499)

