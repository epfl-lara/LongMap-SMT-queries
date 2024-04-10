; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73678 () Bool)

(assert start!73678)

(declare-fun b_free!14593 () Bool)

(declare-fun b_next!14593 () Bool)

(assert (=> start!73678 (= b_free!14593 (not b_next!14593))))

(declare-fun tp!51282 () Bool)

(declare-fun b_and!24165 () Bool)

(assert (=> start!73678 (= tp!51282 b_and!24165)))

(declare-fun b!863075 () Bool)

(declare-fun res!586483 () Bool)

(declare-fun e!480831 () Bool)

(assert (=> b!863075 (=> (not res!586483) (not e!480831))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49620 0))(
  ( (array!49621 (arr!23841 (Array (_ BitVec 32) (_ BitVec 64))) (size!24281 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49620)

(assert (=> b!863075 (= res!586483 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24281 _keys!868))))))

(declare-fun b!863076 () Bool)

(declare-fun res!586487 () Bool)

(assert (=> b!863076 (=> (not res!586487) (not e!480831))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863076 (= res!586487 (and (= (select (arr!23841 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863077 () Bool)

(declare-fun res!586489 () Bool)

(assert (=> b!863077 (=> (not res!586489) (not e!480831))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863077 (= res!586489 (validMask!0 mask!1196))))

(declare-fun b!863078 () Bool)

(declare-fun res!586493 () Bool)

(assert (=> b!863078 (=> (not res!586493) (not e!480831))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27353 0))(
  ( (V!27354 (val!8412 Int)) )
))
(declare-datatypes ((ValueCell!7925 0))(
  ( (ValueCellFull!7925 (v!10837 V!27353)) (EmptyCell!7925) )
))
(declare-datatypes ((array!49622 0))(
  ( (array!49623 (arr!23842 (Array (_ BitVec 32) ValueCell!7925)) (size!24282 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49622)

(assert (=> b!863078 (= res!586493 (and (= (size!24282 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24281 _keys!868) (size!24282 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863079 () Bool)

(declare-fun e!480835 () Bool)

(declare-fun e!480833 () Bool)

(declare-fun mapRes!26693 () Bool)

(assert (=> b!863079 (= e!480835 (and e!480833 mapRes!26693))))

(declare-fun condMapEmpty!26693 () Bool)

(declare-fun mapDefault!26693 () ValueCell!7925)

