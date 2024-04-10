; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78910 () Bool)

(assert start!78910)

(declare-fun b_free!17123 () Bool)

(declare-fun b_next!17123 () Bool)

(assert (=> start!78910 (= b_free!17123 (not b_next!17123))))

(declare-fun tp!59809 () Bool)

(declare-fun b_and!27983 () Bool)

(assert (=> start!78910 (= tp!59809 b_and!27983)))

(declare-fun b!922612 () Bool)

(declare-fun res!622153 () Bool)

(declare-fun e!517672 () Bool)

(assert (=> b!922612 (=> (not res!622153) (not e!517672))))

(declare-datatypes ((array!55238 0))(
  ( (array!55239 (arr!26564 (Array (_ BitVec 32) (_ BitVec 64))) (size!27023 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55238)

(declare-datatypes ((List!18640 0))(
  ( (Nil!18637) (Cons!18636 (h!19782 (_ BitVec 64)) (t!26493 List!18640)) )
))
(declare-fun arrayNoDuplicates!0 (array!55238 (_ BitVec 32) List!18640) Bool)

(assert (=> b!922612 (= res!622153 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18637))))

(declare-fun res!622161 () Bool)

(assert (=> start!78910 (=> (not res!622161) (not e!517672))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78910 (= res!622161 (validMask!0 mask!1881))))

(assert (=> start!78910 e!517672))

(assert (=> start!78910 true))

(declare-fun tp_is_empty!19631 () Bool)

(assert (=> start!78910 tp_is_empty!19631))

(declare-datatypes ((V!31139 0))(
  ( (V!31140 (val!9866 Int)) )
))
(declare-datatypes ((ValueCell!9334 0))(
  ( (ValueCellFull!9334 (v!12384 V!31139)) (EmptyCell!9334) )
))
(declare-datatypes ((array!55240 0))(
  ( (array!55241 (arr!26565 (Array (_ BitVec 32) ValueCell!9334)) (size!27024 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55240)

(declare-fun e!517671 () Bool)

(declare-fun array_inv!20690 (array!55240) Bool)

(assert (=> start!78910 (and (array_inv!20690 _values!1231) e!517671)))

(assert (=> start!78910 tp!59809))

(declare-fun array_inv!20691 (array!55238) Bool)

(assert (=> start!78910 (array_inv!20691 _keys!1487)))

(declare-fun b!922613 () Bool)

(declare-fun e!517669 () Bool)

(declare-fun mapRes!31203 () Bool)

(assert (=> b!922613 (= e!517671 (and e!517669 mapRes!31203))))

(declare-fun condMapEmpty!31203 () Bool)

(declare-fun mapDefault!31203 () ValueCell!9334)

