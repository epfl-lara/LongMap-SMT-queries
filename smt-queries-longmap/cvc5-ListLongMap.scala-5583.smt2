; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73282 () Bool)

(assert start!73282)

(declare-fun b_free!14197 () Bool)

(declare-fun b_next!14197 () Bool)

(assert (=> start!73282 (= b_free!14197 (not b_next!14197))))

(declare-fun tp!50095 () Bool)

(declare-fun b_and!23553 () Bool)

(assert (=> start!73282 (= tp!50095 b_and!23553)))

(declare-fun b!854776 () Bool)

(declare-fun e!476619 () Bool)

(declare-fun e!476620 () Bool)

(declare-fun mapRes!26099 () Bool)

(assert (=> b!854776 (= e!476619 (and e!476620 mapRes!26099))))

(declare-fun condMapEmpty!26099 () Bool)

(declare-datatypes ((V!26825 0))(
  ( (V!26826 (val!8214 Int)) )
))
(declare-datatypes ((ValueCell!7727 0))(
  ( (ValueCellFull!7727 (v!10639 V!26825)) (EmptyCell!7727) )
))
(declare-datatypes ((array!48864 0))(
  ( (array!48865 (arr!23463 (Array (_ BitVec 32) ValueCell!7727)) (size!23903 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48864)

(declare-fun mapDefault!26099 () ValueCell!7727)

