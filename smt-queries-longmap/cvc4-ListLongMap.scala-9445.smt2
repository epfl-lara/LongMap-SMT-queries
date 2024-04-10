; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112282 () Bool)

(assert start!112282)

(declare-fun b_free!30677 () Bool)

(declare-fun b_next!30677 () Bool)

(assert (=> start!112282 (= b_free!30677 (not b_next!30677))))

(declare-fun tp!107667 () Bool)

(declare-fun b_and!49409 () Bool)

(assert (=> start!112282 (= tp!107667 b_and!49409)))

(declare-fun b!1330425 () Bool)

(declare-fun e!758280 () Bool)

(declare-fun e!758279 () Bool)

(declare-fun mapRes!56554 () Bool)

(assert (=> b!1330425 (= e!758280 (and e!758279 mapRes!56554))))

(declare-fun condMapEmpty!56554 () Bool)

(declare-datatypes ((V!53885 0))(
  ( (V!53886 (val!18368 Int)) )
))
(declare-datatypes ((ValueCell!17395 0))(
  ( (ValueCellFull!17395 (v!21005 V!53885)) (EmptyCell!17395) )
))
(declare-datatypes ((array!90062 0))(
  ( (array!90063 (arr!43497 (Array (_ BitVec 32) ValueCell!17395)) (size!44047 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90062)

(declare-fun mapDefault!56554 () ValueCell!17395)

