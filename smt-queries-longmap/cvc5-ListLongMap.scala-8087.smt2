; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99388 () Bool)

(assert start!99388)

(declare-fun b_free!24967 () Bool)

(declare-fun b_next!24967 () Bool)

(assert (=> start!99388 (= b_free!24967 (not b_next!24967))))

(declare-fun tp!87615 () Bool)

(declare-fun b_and!40801 () Bool)

(assert (=> start!99388 (= tp!87615 b_and!40801)))

(declare-fun b!1172921 () Bool)

(declare-fun res!778821 () Bool)

(declare-fun e!666691 () Bool)

(assert (=> b!1172921 (=> (not res!778821) (not e!666691))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172921 (= res!778821 (validKeyInArray!0 k!934))))

(declare-fun b!1172922 () Bool)

(declare-fun e!666684 () Bool)

(declare-fun e!666688 () Bool)

(declare-fun mapRes!46073 () Bool)

(assert (=> b!1172922 (= e!666684 (and e!666688 mapRes!46073))))

(declare-fun condMapEmpty!46073 () Bool)

(declare-datatypes ((V!44457 0))(
  ( (V!44458 (val!14805 Int)) )
))
(declare-datatypes ((ValueCell!14039 0))(
  ( (ValueCellFull!14039 (v!17443 V!44457)) (EmptyCell!14039) )
))
(declare-datatypes ((array!75807 0))(
  ( (array!75808 (arr!36553 (Array (_ BitVec 32) ValueCell!14039)) (size!37089 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75807)

(declare-fun mapDefault!46073 () ValueCell!14039)

