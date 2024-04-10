; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33878 () Bool)

(assert start!33878)

(declare-fun b_free!7057 () Bool)

(declare-fun b_next!7057 () Bool)

(assert (=> start!33878 (= b_free!7057 (not b_next!7057))))

(declare-fun tp!24684 () Bool)

(declare-fun b_and!14243 () Bool)

(assert (=> start!33878 (= tp!24684 b_and!14243)))

(declare-fun b!337260 () Bool)

(declare-fun e!206968 () Bool)

(declare-fun e!206969 () Bool)

(assert (=> b!337260 (= e!206968 e!206969)))

(declare-fun res!186272 () Bool)

(assert (=> b!337260 (=> (not res!186272) (not e!206969))))

(declare-datatypes ((SeekEntryResult!3221 0))(
  ( (MissingZero!3221 (index!15063 (_ BitVec 32))) (Found!3221 (index!15064 (_ BitVec 32))) (Intermediate!3221 (undefined!4033 Bool) (index!15065 (_ BitVec 32)) (x!33617 (_ BitVec 32))) (Undefined!3221) (MissingVacant!3221 (index!15066 (_ BitVec 32))) )
))
(declare-fun lt!160402 () SeekEntryResult!3221)

(assert (=> b!337260 (= res!186272 (and (not (is-Found!3221 lt!160402)) (is-MissingZero!3221 lt!160402)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17613 0))(
  ( (array!17614 (arr!8334 (Array (_ BitVec 32) (_ BitVec 64))) (size!8686 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17613)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17613 (_ BitVec 32)) SeekEntryResult!3221)

(assert (=> b!337260 (= lt!160402 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337261 () Bool)

(declare-fun res!186265 () Bool)

(assert (=> b!337261 (=> (not res!186265) (not e!206968))))

(declare-datatypes ((List!4771 0))(
  ( (Nil!4768) (Cons!4767 (h!5623 (_ BitVec 64)) (t!9865 List!4771)) )
))
(declare-fun arrayNoDuplicates!0 (array!17613 (_ BitVec 32) List!4771) Bool)

(assert (=> b!337261 (= res!186265 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4768))))

(declare-fun b!337262 () Bool)

(declare-fun e!206965 () Bool)

(declare-fun tp_is_empty!7009 () Bool)

(assert (=> b!337262 (= e!206965 tp_is_empty!7009)))

(declare-fun b!337263 () Bool)

(declare-fun res!186271 () Bool)

(assert (=> b!337263 (=> (not res!186271) (not e!206968))))

(declare-datatypes ((V!10323 0))(
  ( (V!10324 (val!3549 Int)) )
))
(declare-datatypes ((ValueCell!3161 0))(
  ( (ValueCellFull!3161 (v!5714 V!10323)) (EmptyCell!3161) )
))
(declare-datatypes ((array!17615 0))(
  ( (array!17616 (arr!8335 (Array (_ BitVec 32) ValueCell!3161)) (size!8687 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17615)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337263 (= res!186271 (and (= (size!8687 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8686 _keys!1895) (size!8687 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337264 () Bool)

(declare-fun e!206967 () Bool)

(declare-fun e!206966 () Bool)

(declare-fun mapRes!11919 () Bool)

(assert (=> b!337264 (= e!206967 (and e!206966 mapRes!11919))))

(declare-fun condMapEmpty!11919 () Bool)

(declare-fun mapDefault!11919 () ValueCell!3161)

