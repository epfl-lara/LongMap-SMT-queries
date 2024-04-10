; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99032 () Bool)

(assert start!99032)

(declare-fun b_free!24637 () Bool)

(declare-fun b_next!24637 () Bool)

(assert (=> start!99032 (= b_free!24637 (not b_next!24637))))

(declare-fun tp!86622 () Bool)

(declare-fun b_and!40123 () Bool)

(assert (=> start!99032 (= tp!86622 b_and!40123)))

(declare-fun b!1164138 () Bool)

(declare-fun e!661921 () Bool)

(declare-fun e!661920 () Bool)

(declare-fun mapRes!45575 () Bool)

(assert (=> b!1164138 (= e!661921 (and e!661920 mapRes!45575))))

(declare-fun condMapEmpty!45575 () Bool)

(declare-datatypes ((V!44017 0))(
  ( (V!44018 (val!14640 Int)) )
))
(declare-datatypes ((ValueCell!13874 0))(
  ( (ValueCellFull!13874 (v!17277 V!44017)) (EmptyCell!13874) )
))
(declare-datatypes ((array!75173 0))(
  ( (array!75174 (arr!36237 (Array (_ BitVec 32) ValueCell!13874)) (size!36773 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75173)

(declare-fun mapDefault!45575 () ValueCell!13874)

