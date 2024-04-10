; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99134 () Bool)

(assert start!99134)

(declare-fun b_free!24739 () Bool)

(declare-fun b_next!24739 () Bool)

(assert (=> start!99134 (= b_free!24739 (not b_next!24739))))

(declare-fun tp!86928 () Bool)

(declare-fun b_and!40327 () Bool)

(assert (=> start!99134 (= tp!86928 b_and!40327)))

(declare-fun b!1166420 () Bool)

(declare-fun res!773683 () Bool)

(declare-fun e!663028 () Bool)

(assert (=> b!1166420 (=> (not res!773683) (not e!663028))))

(declare-datatypes ((array!75369 0))(
  ( (array!75370 (arr!36335 (Array (_ BitVec 32) (_ BitVec 64))) (size!36871 (_ BitVec 32))) )
))
(declare-fun lt!525248 () array!75369)

(declare-datatypes ((List!25476 0))(
  ( (Nil!25473) (Cons!25472 (h!26681 (_ BitVec 64)) (t!37207 List!25476)) )
))
(declare-fun arrayNoDuplicates!0 (array!75369 (_ BitVec 32) List!25476) Bool)

(assert (=> b!1166420 (= res!773683 (arrayNoDuplicates!0 lt!525248 #b00000000000000000000000000000000 Nil!25473))))

(declare-fun b!1166421 () Bool)

(declare-fun e!663029 () Bool)

(declare-fun e!663033 () Bool)

(declare-fun mapRes!45728 () Bool)

(assert (=> b!1166421 (= e!663029 (and e!663033 mapRes!45728))))

(declare-fun condMapEmpty!45728 () Bool)

(declare-datatypes ((V!44153 0))(
  ( (V!44154 (val!14691 Int)) )
))
(declare-datatypes ((ValueCell!13925 0))(
  ( (ValueCellFull!13925 (v!17328 V!44153)) (EmptyCell!13925) )
))
(declare-datatypes ((array!75371 0))(
  ( (array!75372 (arr!36336 (Array (_ BitVec 32) ValueCell!13925)) (size!36872 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75371)

(declare-fun mapDefault!45728 () ValueCell!13925)

