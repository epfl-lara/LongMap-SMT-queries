; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99470 () Bool)

(assert start!99470)

(declare-fun b_free!25049 () Bool)

(declare-fun b_next!25049 () Bool)

(assert (=> start!99470 (= b_free!25049 (not b_next!25049))))

(declare-fun tp!87860 () Bool)

(declare-fun b_and!40965 () Bool)

(assert (=> start!99470 (= tp!87860 b_and!40965)))

(declare-fun b!1175463 () Bool)

(declare-fun e!668160 () Bool)

(declare-fun e!668169 () Bool)

(declare-fun mapRes!46196 () Bool)

(assert (=> b!1175463 (= e!668160 (and e!668169 mapRes!46196))))

(declare-fun condMapEmpty!46196 () Bool)

(declare-datatypes ((V!44565 0))(
  ( (V!44566 (val!14846 Int)) )
))
(declare-datatypes ((ValueCell!14080 0))(
  ( (ValueCellFull!14080 (v!17484 V!44565)) (EmptyCell!14080) )
))
(declare-datatypes ((array!75967 0))(
  ( (array!75968 (arr!36633 (Array (_ BitVec 32) ValueCell!14080)) (size!37169 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75967)

(declare-fun mapDefault!46196 () ValueCell!14080)

