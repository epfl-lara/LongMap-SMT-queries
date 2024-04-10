; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99158 () Bool)

(assert start!99158)

(declare-fun b_free!24763 () Bool)

(declare-fun b_next!24763 () Bool)

(assert (=> start!99158 (= b_free!24763 (not b_next!24763))))

(declare-fun tp!87000 () Bool)

(declare-fun b_and!40375 () Bool)

(assert (=> start!99158 (= tp!87000 b_and!40375)))

(declare-fun b!1166984 () Bool)

(declare-fun e!663314 () Bool)

(declare-fun e!663321 () Bool)

(declare-fun mapRes!45764 () Bool)

(assert (=> b!1166984 (= e!663314 (and e!663321 mapRes!45764))))

(declare-fun condMapEmpty!45764 () Bool)

(declare-datatypes ((V!44185 0))(
  ( (V!44186 (val!14703 Int)) )
))
(declare-datatypes ((ValueCell!13937 0))(
  ( (ValueCellFull!13937 (v!17340 V!44185)) (EmptyCell!13937) )
))
(declare-datatypes ((array!75417 0))(
  ( (array!75418 (arr!36359 (Array (_ BitVec 32) ValueCell!13937)) (size!36895 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75417)

(declare-fun mapDefault!45764 () ValueCell!13937)

