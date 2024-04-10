; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33648 () Bool)

(assert start!33648)

(declare-fun b_free!6883 () Bool)

(declare-fun b_next!6883 () Bool)

(assert (=> start!33648 (= b_free!6883 (not b_next!6883))))

(declare-fun tp!24152 () Bool)

(declare-fun b_and!14063 () Bool)

(assert (=> start!33648 (= tp!24152 b_and!14063)))

(declare-fun b!334074 () Bool)

(declare-fun res!184111 () Bool)

(declare-fun e!205100 () Bool)

(assert (=> b!334074 (=> (not res!184111) (not e!205100))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3153 0))(
  ( (MissingZero!3153 (index!14791 (_ BitVec 32))) (Found!3153 (index!14792 (_ BitVec 32))) (Intermediate!3153 (undefined!3965 Bool) (index!14793 (_ BitVec 32)) (x!33287 (_ BitVec 32))) (Undefined!3153) (MissingVacant!3153 (index!14794 (_ BitVec 32))) )
))
(declare-fun lt!159456 () SeekEntryResult!3153)

(declare-datatypes ((array!17263 0))(
  ( (array!17264 (arr!8162 (Array (_ BitVec 32) (_ BitVec 64))) (size!8514 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17263)

(declare-fun arrayContainsKey!0 (array!17263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334074 (= res!184111 (arrayContainsKey!0 _keys!1895 k!1348 (index!14792 lt!159456)))))

(declare-fun b!334075 () Bool)

(declare-fun e!205099 () Bool)

(declare-fun e!205097 () Bool)

(declare-fun mapRes!11649 () Bool)

(assert (=> b!334075 (= e!205099 (and e!205097 mapRes!11649))))

(declare-fun condMapEmpty!11649 () Bool)

(declare-datatypes ((V!10091 0))(
  ( (V!10092 (val!3462 Int)) )
))
(declare-datatypes ((ValueCell!3074 0))(
  ( (ValueCellFull!3074 (v!5624 V!10091)) (EmptyCell!3074) )
))
(declare-datatypes ((array!17265 0))(
  ( (array!17266 (arr!8163 (Array (_ BitVec 32) ValueCell!3074)) (size!8515 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17265)

(declare-fun mapDefault!11649 () ValueCell!3074)

