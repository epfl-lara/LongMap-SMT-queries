; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74158 () Bool)

(assert start!74158)

(declare-fun b!872362 () Bool)

(declare-fun res!592910 () Bool)

(declare-fun e!485781 () Bool)

(assert (=> b!872362 (=> (not res!592910) (not e!485781))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50528 0))(
  ( (array!50529 (arr!24294 (Array (_ BitVec 32) (_ BitVec 64))) (size!24734 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50528)

(declare-datatypes ((V!27977 0))(
  ( (V!27978 (val!8646 Int)) )
))
(declare-datatypes ((ValueCell!8159 0))(
  ( (ValueCellFull!8159 (v!11071 V!27977)) (EmptyCell!8159) )
))
(declare-datatypes ((array!50530 0))(
  ( (array!50531 (arr!24295 (Array (_ BitVec 32) ValueCell!8159)) (size!24735 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50530)

(assert (=> b!872362 (= res!592910 (and (= (size!24735 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24734 _keys!868) (size!24735 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872363 () Bool)

(declare-fun e!485783 () Bool)

(declare-fun tp_is_empty!17197 () Bool)

(assert (=> b!872363 (= e!485783 tp_is_empty!17197)))

(declare-fun b!872364 () Bool)

(declare-fun res!592911 () Bool)

(assert (=> b!872364 (=> (not res!592911) (not e!485781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872364 (= res!592911 (validMask!0 mask!1196))))

(declare-fun res!592913 () Bool)

(assert (=> start!74158 (=> (not res!592913) (not e!485781))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74158 (= res!592913 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24734 _keys!868))))))

(assert (=> start!74158 e!485781))

(assert (=> start!74158 true))

(declare-fun array_inv!19180 (array!50528) Bool)

(assert (=> start!74158 (array_inv!19180 _keys!868)))

(declare-fun e!485785 () Bool)

(declare-fun array_inv!19181 (array!50530) Bool)

(assert (=> start!74158 (and (array_inv!19181 _values!688) e!485785)))

(declare-fun mapIsEmpty!27398 () Bool)

(declare-fun mapRes!27398 () Bool)

(assert (=> mapIsEmpty!27398 mapRes!27398))

(declare-fun b!872365 () Bool)

(assert (=> b!872365 (= e!485785 (and e!485783 mapRes!27398))))

(declare-fun condMapEmpty!27398 () Bool)

(declare-fun mapDefault!27398 () ValueCell!8159)

