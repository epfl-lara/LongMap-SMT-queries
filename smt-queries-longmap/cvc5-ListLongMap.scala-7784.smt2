; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97448 () Bool)

(assert start!97448)

(declare-fun b_free!23419 () Bool)

(declare-fun b_next!23419 () Bool)

(assert (=> start!97448 (= b_free!23419 (not b_next!23419))))

(declare-fun tp!82555 () Bool)

(declare-fun b_and!37675 () Bool)

(assert (=> start!97448 (= tp!82555 b_and!37675)))

(declare-fun b!1111881 () Bool)

(declare-fun res!741986 () Bool)

(declare-fun e!633982 () Bool)

(assert (=> b!1111881 (=> (not res!741986) (not e!633982))))

(declare-datatypes ((array!72271 0))(
  ( (array!72272 (arr!34788 (Array (_ BitVec 32) (_ BitVec 64))) (size!35324 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72271)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1111881 (= res!741986 (= (select (arr!34788 _keys!1208) i!673) k!934))))

(declare-fun b!1111882 () Bool)

(declare-fun e!633983 () Bool)

(declare-fun e!633987 () Bool)

(declare-fun mapRes!43336 () Bool)

(assert (=> b!1111882 (= e!633983 (and e!633987 mapRes!43336))))

(declare-fun condMapEmpty!43336 () Bool)

(declare-datatypes ((V!42033 0))(
  ( (V!42034 (val!13896 Int)) )
))
(declare-datatypes ((ValueCell!13130 0))(
  ( (ValueCellFull!13130 (v!16529 V!42033)) (EmptyCell!13130) )
))
(declare-datatypes ((array!72273 0))(
  ( (array!72274 (arr!34789 (Array (_ BitVec 32) ValueCell!13130)) (size!35325 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72273)

(declare-fun mapDefault!43336 () ValueCell!13130)

