; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73628 () Bool)

(assert start!73628)

(declare-fun b_free!14543 () Bool)

(declare-fun b_next!14543 () Bool)

(assert (=> start!73628 (= b_free!14543 (not b_next!14543))))

(declare-fun tp!51133 () Bool)

(declare-fun b_and!24065 () Bool)

(assert (=> start!73628 (= tp!51133 b_and!24065)))

(declare-fun b!861844 () Bool)

(declare-fun res!585678 () Bool)

(declare-fun e!480181 () Bool)

(assert (=> b!861844 (=> (not res!585678) (not e!480181))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49522 0))(
  ( (array!49523 (arr!23792 (Array (_ BitVec 32) (_ BitVec 64))) (size!24232 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49522)

(declare-datatypes ((V!27285 0))(
  ( (V!27286 (val!8387 Int)) )
))
(declare-datatypes ((ValueCell!7900 0))(
  ( (ValueCellFull!7900 (v!10812 V!27285)) (EmptyCell!7900) )
))
(declare-datatypes ((array!49524 0))(
  ( (array!49525 (arr!23793 (Array (_ BitVec 32) ValueCell!7900)) (size!24233 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49524)

(assert (=> b!861844 (= res!585678 (and (= (size!24233 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24232 _keys!868) (size!24233 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861845 () Bool)

(declare-fun res!585680 () Bool)

(assert (=> b!861845 (=> (not res!585680) (not e!480181))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861845 (= res!585680 (validKeyInArray!0 k!854))))

(declare-fun b!861846 () Bool)

(declare-fun e!480179 () Bool)

(declare-fun e!480177 () Bool)

(declare-fun mapRes!26618 () Bool)

(assert (=> b!861846 (= e!480179 (and e!480177 mapRes!26618))))

(declare-fun condMapEmpty!26618 () Bool)

(declare-fun mapDefault!26618 () ValueCell!7900)

