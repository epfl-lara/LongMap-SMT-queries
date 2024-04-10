; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99740 () Bool)

(assert start!99740)

(declare-fun b_free!25319 () Bool)

(declare-fun b_next!25319 () Bool)

(assert (=> start!99740 (= b_free!25319 (not b_next!25319))))

(declare-fun tp!88670 () Bool)

(declare-fun b_and!41505 () Bool)

(assert (=> start!99740 (= tp!88670 b_and!41505)))

(declare-fun b!1184175 () Bool)

(declare-fun e!673280 () Bool)

(declare-fun e!673278 () Bool)

(declare-fun mapRes!46601 () Bool)

(assert (=> b!1184175 (= e!673280 (and e!673278 mapRes!46601))))

(declare-fun condMapEmpty!46601 () Bool)

(declare-datatypes ((V!44925 0))(
  ( (V!44926 (val!14981 Int)) )
))
(declare-datatypes ((ValueCell!14215 0))(
  ( (ValueCellFull!14215 (v!17619 V!44925)) (EmptyCell!14215) )
))
(declare-datatypes ((array!76499 0))(
  ( (array!76500 (arr!36899 (Array (_ BitVec 32) ValueCell!14215)) (size!37435 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76499)

(declare-fun mapDefault!46601 () ValueCell!14215)

