; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4024 () Bool)

(assert start!4024)

(declare-fun b_free!929 () Bool)

(declare-fun b_next!929 () Bool)

(assert (=> start!4024 (= b_free!929 (not b_next!929))))

(declare-fun tp!4207 () Bool)

(declare-fun b_and!1739 () Bool)

(assert (=> start!4024 (= tp!4207 b_and!1739)))

(declare-fun b!29361 () Bool)

(declare-fun e!18960 () Bool)

(declare-fun tp_is_empty!1283 () Bool)

(assert (=> b!29361 (= e!18960 tp_is_empty!1283)))

(declare-fun b!29362 () Bool)

(declare-fun res!17600 () Bool)

(declare-fun e!18961 () Bool)

(assert (=> b!29362 (=> (not res!17600) (not e!18961))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29362 (= res!17600 (validKeyInArray!0 k!1304))))

(declare-fun b!29363 () Bool)

(declare-fun res!17598 () Bool)

(assert (=> b!29363 (=> (not res!17598) (not e!18961))))

(declare-datatypes ((array!1797 0))(
  ( (array!1798 (arr!852 (Array (_ BitVec 32) (_ BitVec 64))) (size!953 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1797)

(declare-datatypes ((List!706 0))(
  ( (Nil!703) (Cons!702 (h!1269 (_ BitVec 64)) (t!3399 List!706)) )
))
(declare-fun arrayNoDuplicates!0 (array!1797 (_ BitVec 32) List!706) Bool)

(assert (=> b!29363 (= res!17598 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!703))))

(declare-fun b!29364 () Bool)

(declare-fun e!18957 () Bool)

(declare-fun mapRes!1453 () Bool)

(assert (=> b!29364 (= e!18957 (and e!18960 mapRes!1453))))

(declare-fun condMapEmpty!1453 () Bool)

(declare-datatypes ((V!1535 0))(
  ( (V!1536 (val!668 Int)) )
))
(declare-datatypes ((ValueCell!442 0))(
  ( (ValueCellFull!442 (v!1757 V!1535)) (EmptyCell!442) )
))
(declare-datatypes ((array!1799 0))(
  ( (array!1800 (arr!853 (Array (_ BitVec 32) ValueCell!442)) (size!954 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1799)

(declare-fun mapDefault!1453 () ValueCell!442)

