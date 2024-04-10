; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70924 () Bool)

(assert start!70924)

(declare-fun b_free!13141 () Bool)

(declare-fun b_next!13141 () Bool)

(assert (=> start!70924 (= b_free!13141 (not b_next!13141))))

(declare-fun tp!46174 () Bool)

(declare-fun b_and!22037 () Bool)

(assert (=> start!70924 (= tp!46174 b_and!22037)))

(declare-fun b!823718 () Bool)

(declare-fun e!458171 () Bool)

(declare-fun e!458170 () Bool)

(declare-fun mapRes!23893 () Bool)

(assert (=> b!823718 (= e!458171 (and e!458170 mapRes!23893))))

(declare-fun condMapEmpty!23893 () Bool)

(declare-datatypes ((V!24803 0))(
  ( (V!24804 (val!7473 Int)) )
))
(declare-datatypes ((ValueCell!7010 0))(
  ( (ValueCellFull!7010 (v!9906 V!24803)) (EmptyCell!7010) )
))
(declare-datatypes ((array!45894 0))(
  ( (array!45895 (arr!21995 (Array (_ BitVec 32) ValueCell!7010)) (size!22416 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45894)

(declare-fun mapDefault!23893 () ValueCell!7010)

