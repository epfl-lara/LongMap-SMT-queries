; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70948 () Bool)

(assert start!70948)

(declare-fun b_free!13165 () Bool)

(declare-fun b_next!13165 () Bool)

(assert (=> start!70948 (= b_free!13165 (not b_next!13165))))

(declare-fun tp!46245 () Bool)

(declare-fun b_and!22061 () Bool)

(assert (=> start!70948 (= tp!46245 b_and!22061)))

(declare-fun mapNonEmpty!23929 () Bool)

(declare-fun mapRes!23929 () Bool)

(declare-fun tp!46246 () Bool)

(declare-fun e!458350 () Bool)

(assert (=> mapNonEmpty!23929 (= mapRes!23929 (and tp!46246 e!458350))))

(declare-datatypes ((V!24835 0))(
  ( (V!24836 (val!7485 Int)) )
))
(declare-datatypes ((ValueCell!7022 0))(
  ( (ValueCellFull!7022 (v!9918 V!24835)) (EmptyCell!7022) )
))
(declare-fun mapRest!23929 () (Array (_ BitVec 32) ValueCell!7022))

(declare-fun mapValue!23929 () ValueCell!7022)

(declare-datatypes ((array!45940 0))(
  ( (array!45941 (arr!22018 (Array (_ BitVec 32) ValueCell!7022)) (size!22439 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45940)

(declare-fun mapKey!23929 () (_ BitVec 32))

(assert (=> mapNonEmpty!23929 (= (arr!22018 _values!788) (store mapRest!23929 mapKey!23929 mapValue!23929))))

(declare-fun b!823969 () Bool)

(declare-fun e!458353 () Bool)

(declare-fun e!458352 () Bool)

(assert (=> b!823969 (= e!458353 (and e!458352 mapRes!23929))))

(declare-fun condMapEmpty!23929 () Bool)

(declare-fun mapDefault!23929 () ValueCell!7022)

