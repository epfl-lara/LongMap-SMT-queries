; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78732 () Bool)

(assert start!78732)

(declare-fun b_free!16945 () Bool)

(declare-fun b_next!16945 () Bool)

(assert (=> start!78732 (= b_free!16945 (not b_next!16945))))

(declare-fun tp!59276 () Bool)

(declare-fun b_and!27627 () Bool)

(assert (=> start!78732 (= tp!59276 b_and!27627)))

(declare-fun b!918452 () Bool)

(declare-fun res!619245 () Bool)

(declare-fun e!515585 () Bool)

(assert (=> b!918452 (=> (not res!619245) (not e!515585))))

(declare-datatypes ((array!54890 0))(
  ( (array!54891 (arr!26390 (Array (_ BitVec 32) (_ BitVec 64))) (size!26849 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54890)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54890 (_ BitVec 32)) Bool)

(assert (=> b!918452 (= res!619245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918453 () Bool)

(declare-fun e!515584 () Bool)

(declare-fun e!515587 () Bool)

(declare-fun mapRes!30936 () Bool)

(assert (=> b!918453 (= e!515584 (and e!515587 mapRes!30936))))

(declare-fun condMapEmpty!30936 () Bool)

(declare-datatypes ((V!30903 0))(
  ( (V!30904 (val!9777 Int)) )
))
(declare-datatypes ((ValueCell!9245 0))(
  ( (ValueCellFull!9245 (v!12295 V!30903)) (EmptyCell!9245) )
))
(declare-datatypes ((array!54892 0))(
  ( (array!54893 (arr!26391 (Array (_ BitVec 32) ValueCell!9245)) (size!26850 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54892)

(declare-fun mapDefault!30936 () ValueCell!9245)

