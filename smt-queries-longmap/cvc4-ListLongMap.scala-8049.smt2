; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99138 () Bool)

(assert start!99138)

(declare-fun b_free!24743 () Bool)

(declare-fun b_next!24743 () Bool)

(assert (=> start!99138 (= b_free!24743 (not b_next!24743))))

(declare-fun tp!86940 () Bool)

(declare-fun b_and!40335 () Bool)

(assert (=> start!99138 (= tp!86940 b_and!40335)))

(declare-fun b!1166514 () Bool)

(declare-fun res!773758 () Bool)

(declare-fun e!663075 () Bool)

(assert (=> b!1166514 (=> (not res!773758) (not e!663075))))

(declare-datatypes ((array!75377 0))(
  ( (array!75378 (arr!36339 (Array (_ BitVec 32) (_ BitVec 64))) (size!36875 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75377)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1166514 (= res!773758 (= (select (arr!36339 _keys!1208) i!673) k!934))))

(declare-fun b!1166515 () Bool)

(declare-fun e!663076 () Bool)

(declare-fun e!663078 () Bool)

(declare-fun mapRes!45734 () Bool)

(assert (=> b!1166515 (= e!663076 (and e!663078 mapRes!45734))))

(declare-fun condMapEmpty!45734 () Bool)

(declare-datatypes ((V!44157 0))(
  ( (V!44158 (val!14693 Int)) )
))
(declare-datatypes ((ValueCell!13927 0))(
  ( (ValueCellFull!13927 (v!17330 V!44157)) (EmptyCell!13927) )
))
(declare-datatypes ((array!75379 0))(
  ( (array!75380 (arr!36340 (Array (_ BitVec 32) ValueCell!13927)) (size!36876 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75379)

(declare-fun mapDefault!45734 () ValueCell!13927)

