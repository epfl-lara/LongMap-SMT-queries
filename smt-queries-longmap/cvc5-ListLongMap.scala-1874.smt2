; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33678 () Bool)

(assert start!33678)

(declare-fun b_free!6913 () Bool)

(declare-fun b_next!6913 () Bool)

(assert (=> start!33678 (= b_free!6913 (not b_next!6913))))

(declare-fun tp!24242 () Bool)

(declare-fun b_and!14093 () Bool)

(assert (=> start!33678 (= tp!24242 b_and!14093)))

(declare-fun b!334569 () Bool)

(declare-fun res!184472 () Bool)

(declare-fun e!205371 () Bool)

(assert (=> b!334569 (=> (not res!184472) (not e!205371))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17323 0))(
  ( (array!17324 (arr!8192 (Array (_ BitVec 32) (_ BitVec 64))) (size!8544 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17323)

(declare-datatypes ((SeekEntryResult!3166 0))(
  ( (MissingZero!3166 (index!14843 (_ BitVec 32))) (Found!3166 (index!14844 (_ BitVec 32))) (Intermediate!3166 (undefined!3978 Bool) (index!14845 (_ BitVec 32)) (x!33340 (_ BitVec 32))) (Undefined!3166) (MissingVacant!3166 (index!14846 (_ BitVec 32))) )
))
(declare-fun lt!159547 () SeekEntryResult!3166)

(declare-fun arrayContainsKey!0 (array!17323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334569 (= res!184472 (arrayContainsKey!0 _keys!1895 k!1348 (index!14844 lt!159547)))))

(declare-fun b!334570 () Bool)

(declare-fun e!205366 () Bool)

(declare-fun tp_is_empty!6865 () Bool)

(assert (=> b!334570 (= e!205366 tp_is_empty!6865)))

(declare-fun b!334571 () Bool)

(declare-fun e!205370 () Bool)

(assert (=> b!334571 (= e!205370 tp_is_empty!6865)))

(declare-fun b!334573 () Bool)

(declare-fun res!184470 () Bool)

(declare-fun e!205367 () Bool)

(assert (=> b!334573 (=> (not res!184470) (not e!205367))))

(declare-datatypes ((List!4672 0))(
  ( (Nil!4669) (Cons!4668 (h!5524 (_ BitVec 64)) (t!9760 List!4672)) )
))
(declare-fun arrayNoDuplicates!0 (array!17323 (_ BitVec 32) List!4672) Bool)

(assert (=> b!334573 (= res!184470 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4669))))

(declare-fun mapIsEmpty!11694 () Bool)

(declare-fun mapRes!11694 () Bool)

(assert (=> mapIsEmpty!11694 mapRes!11694))

(declare-fun b!334574 () Bool)

(declare-fun e!205369 () Bool)

(assert (=> b!334574 (= e!205369 (and e!205370 mapRes!11694))))

(declare-fun condMapEmpty!11694 () Bool)

(declare-datatypes ((V!10131 0))(
  ( (V!10132 (val!3477 Int)) )
))
(declare-datatypes ((ValueCell!3089 0))(
  ( (ValueCellFull!3089 (v!5639 V!10131)) (EmptyCell!3089) )
))
(declare-datatypes ((array!17325 0))(
  ( (array!17326 (arr!8193 (Array (_ BitVec 32) ValueCell!3089)) (size!8545 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17325)

(declare-fun mapDefault!11694 () ValueCell!3089)

