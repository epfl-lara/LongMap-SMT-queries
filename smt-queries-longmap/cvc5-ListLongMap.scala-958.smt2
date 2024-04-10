; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20844 () Bool)

(assert start!20844)

(declare-fun b_free!5497 () Bool)

(declare-fun b_next!5497 () Bool)

(assert (=> start!20844 (= b_free!5497 (not b_next!5497))))

(declare-fun tp!19531 () Bool)

(declare-fun b_and!12243 () Bool)

(assert (=> start!20844 (= tp!19531 b_and!12243)))

(declare-fun b!209120 () Bool)

(declare-fun e!136286 () Bool)

(declare-fun e!136288 () Bool)

(declare-fun mapRes!9107 () Bool)

(assert (=> b!209120 (= e!136286 (and e!136288 mapRes!9107))))

(declare-fun condMapEmpty!9107 () Bool)

(declare-datatypes ((V!6793 0))(
  ( (V!6794 (val!2724 Int)) )
))
(declare-datatypes ((ValueCell!2336 0))(
  ( (ValueCellFull!2336 (v!4694 V!6793)) (EmptyCell!2336) )
))
(declare-datatypes ((array!9919 0))(
  ( (array!9920 (arr!4710 (Array (_ BitVec 32) ValueCell!2336)) (size!5035 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9919)

(declare-fun mapDefault!9107 () ValueCell!2336)

