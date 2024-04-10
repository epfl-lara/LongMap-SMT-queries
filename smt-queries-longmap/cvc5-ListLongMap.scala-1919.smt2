; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34160 () Bool)

(assert start!34160)

(declare-fun b_free!7183 () Bool)

(declare-fun b_next!7183 () Bool)

(assert (=> start!34160 (= b_free!7183 (not b_next!7183))))

(declare-fun tp!25083 () Bool)

(declare-fun b_and!14383 () Bool)

(assert (=> start!34160 (= tp!25083 b_and!14383)))

(declare-fun mapIsEmpty!12129 () Bool)

(declare-fun mapRes!12129 () Bool)

(assert (=> mapIsEmpty!12129 mapRes!12129))

(declare-fun b!340377 () Bool)

(declare-fun e!208817 () Bool)

(assert (=> b!340377 (= e!208817 false)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17875 0))(
  ( (array!17876 (arr!8458 (Array (_ BitVec 32) (_ BitVec 64))) (size!8810 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17875)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3268 0))(
  ( (MissingZero!3268 (index!15251 (_ BitVec 32))) (Found!3268 (index!15252 (_ BitVec 32))) (Intermediate!3268 (undefined!4080 Bool) (index!15253 (_ BitVec 32)) (x!33902 (_ BitVec 32))) (Undefined!3268) (MissingVacant!3268 (index!15254 (_ BitVec 32))) )
))
(declare-fun lt!161581 () SeekEntryResult!3268)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17875 (_ BitVec 32)) SeekEntryResult!3268)

(assert (=> b!340377 (= lt!161581 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340378 () Bool)

(declare-fun res!187986 () Bool)

(assert (=> b!340378 (=> (not res!187986) (not e!208817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340378 (= res!187986 (validKeyInArray!0 k!1348))))

(declare-fun b!340379 () Bool)

(declare-fun e!208816 () Bool)

(declare-fun tp_is_empty!7135 () Bool)

(assert (=> b!340379 (= e!208816 tp_is_empty!7135)))

(declare-fun b!340380 () Bool)

(declare-fun e!208818 () Bool)

(assert (=> b!340380 (= e!208818 (and e!208816 mapRes!12129))))

(declare-fun condMapEmpty!12129 () Bool)

(declare-datatypes ((V!10491 0))(
  ( (V!10492 (val!3612 Int)) )
))
(declare-datatypes ((ValueCell!3224 0))(
  ( (ValueCellFull!3224 (v!5784 V!10491)) (EmptyCell!3224) )
))
(declare-datatypes ((array!17877 0))(
  ( (array!17878 (arr!8459 (Array (_ BitVec 32) ValueCell!3224)) (size!8811 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17877)

(declare-fun mapDefault!12129 () ValueCell!3224)

