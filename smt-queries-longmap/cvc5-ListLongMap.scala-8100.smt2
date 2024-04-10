; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99466 () Bool)

(assert start!99466)

(declare-fun b_free!25045 () Bool)

(declare-fun b_next!25045 () Bool)

(assert (=> start!99466 (= b_free!25045 (not b_next!25045))))

(declare-fun tp!87849 () Bool)

(declare-fun b_and!40957 () Bool)

(assert (=> start!99466 (= tp!87849 b_and!40957)))

(declare-fun b!1175339 () Bool)

(declare-fun e!668095 () Bool)

(declare-fun e!668097 () Bool)

(declare-fun mapRes!46190 () Bool)

(assert (=> b!1175339 (= e!668095 (and e!668097 mapRes!46190))))

(declare-fun condMapEmpty!46190 () Bool)

(declare-datatypes ((V!44561 0))(
  ( (V!44562 (val!14844 Int)) )
))
(declare-datatypes ((ValueCell!14078 0))(
  ( (ValueCellFull!14078 (v!17482 V!44561)) (EmptyCell!14078) )
))
(declare-datatypes ((array!75961 0))(
  ( (array!75962 (arr!36630 (Array (_ BitVec 32) ValueCell!14078)) (size!37166 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75961)

(declare-fun mapDefault!46190 () ValueCell!14078)

