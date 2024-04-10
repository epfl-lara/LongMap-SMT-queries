; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33984 () Bool)

(assert start!33984)

(declare-fun b_free!7115 () Bool)

(declare-fun b_next!7115 () Bool)

(assert (=> start!33984 (= b_free!7115 (not b_next!7115))))

(declare-fun tp!24864 () Bool)

(declare-fun b_and!14305 () Bool)

(assert (=> start!33984 (= tp!24864 b_and!14305)))

(declare-fun b!338548 () Bool)

(declare-fun e!207722 () Bool)

(declare-fun e!207720 () Bool)

(assert (=> b!338548 (= e!207722 e!207720)))

(declare-fun res!187012 () Bool)

(assert (=> b!338548 (=> (not res!187012) (not e!207720))))

(declare-datatypes ((SeekEntryResult!3240 0))(
  ( (MissingZero!3240 (index!15139 (_ BitVec 32))) (Found!3240 (index!15140 (_ BitVec 32))) (Intermediate!3240 (undefined!4052 Bool) (index!15141 (_ BitVec 32)) (x!33728 (_ BitVec 32))) (Undefined!3240) (MissingVacant!3240 (index!15142 (_ BitVec 32))) )
))
(declare-fun lt!160840 () SeekEntryResult!3240)

(assert (=> b!338548 (= res!187012 (and (not (is-Found!3240 lt!160840)) (is-MissingZero!3240 lt!160840)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17729 0))(
  ( (array!17730 (arr!8390 (Array (_ BitVec 32) (_ BitVec 64))) (size!8742 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17729 (_ BitVec 32)) SeekEntryResult!3240)

(assert (=> b!338548 (= lt!160840 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12012 () Bool)

(declare-fun mapRes!12012 () Bool)

(declare-fun tp!24863 () Bool)

(declare-fun e!207721 () Bool)

(assert (=> mapNonEmpty!12012 (= mapRes!12012 (and tp!24863 e!207721))))

(declare-datatypes ((V!10399 0))(
  ( (V!10400 (val!3578 Int)) )
))
(declare-datatypes ((ValueCell!3190 0))(
  ( (ValueCellFull!3190 (v!5745 V!10399)) (EmptyCell!3190) )
))
(declare-fun mapValue!12012 () ValueCell!3190)

(declare-datatypes ((array!17731 0))(
  ( (array!17732 (arr!8391 (Array (_ BitVec 32) ValueCell!3190)) (size!8743 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17731)

(declare-fun mapRest!12012 () (Array (_ BitVec 32) ValueCell!3190))

(declare-fun mapKey!12012 () (_ BitVec 32))

(assert (=> mapNonEmpty!12012 (= (arr!8391 _values!1525) (store mapRest!12012 mapKey!12012 mapValue!12012))))

(declare-fun b!338549 () Bool)

(declare-fun e!207726 () Bool)

(declare-fun e!207723 () Bool)

(assert (=> b!338549 (= e!207726 (and e!207723 mapRes!12012))))

(declare-fun condMapEmpty!12012 () Bool)

(declare-fun mapDefault!12012 () ValueCell!3190)

