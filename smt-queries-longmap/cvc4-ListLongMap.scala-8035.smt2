; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99054 () Bool)

(assert start!99054)

(declare-fun b_free!24659 () Bool)

(declare-fun b_next!24659 () Bool)

(assert (=> start!99054 (= b_free!24659 (not b_next!24659))))

(declare-fun tp!86688 () Bool)

(declare-fun b_and!40167 () Bool)

(assert (=> start!99054 (= tp!86688 b_and!40167)))

(declare-fun b!1164622 () Bool)

(declare-fun e!662154 () Bool)

(declare-fun e!662151 () Bool)

(declare-fun mapRes!45608 () Bool)

(assert (=> b!1164622 (= e!662154 (and e!662151 mapRes!45608))))

(declare-fun condMapEmpty!45608 () Bool)

(declare-datatypes ((V!44045 0))(
  ( (V!44046 (val!14651 Int)) )
))
(declare-datatypes ((ValueCell!13885 0))(
  ( (ValueCellFull!13885 (v!17288 V!44045)) (EmptyCell!13885) )
))
(declare-datatypes ((array!75213 0))(
  ( (array!75214 (arr!36257 (Array (_ BitVec 32) ValueCell!13885)) (size!36793 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75213)

(declare-fun mapDefault!45608 () ValueCell!13885)

