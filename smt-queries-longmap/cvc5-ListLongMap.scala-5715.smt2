; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74074 () Bool)

(assert start!74074)

(declare-fun b!871445 () Bool)

(declare-fun e!485199 () Bool)

(declare-fun tp_is_empty!17125 () Bool)

(assert (=> b!871445 (= e!485199 tp_is_empty!17125)))

(declare-fun b!871446 () Bool)

(declare-fun e!485196 () Bool)

(assert (=> b!871446 (= e!485196 false)))

(declare-fun lt!395467 () Bool)

(declare-datatypes ((array!50388 0))(
  ( (array!50389 (arr!24225 (Array (_ BitVec 32) (_ BitVec 64))) (size!24665 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50388)

(declare-datatypes ((List!17228 0))(
  ( (Nil!17225) (Cons!17224 (h!18355 (_ BitVec 64)) (t!24265 List!17228)) )
))
(declare-fun arrayNoDuplicates!0 (array!50388 (_ BitVec 32) List!17228) Bool)

(assert (=> b!871446 (= lt!395467 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17225))))

(declare-fun b!871447 () Bool)

(declare-fun res!592356 () Bool)

(assert (=> b!871447 (=> (not res!592356) (not e!485196))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50388 (_ BitVec 32)) Bool)

(assert (=> b!871447 (= res!592356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592355 () Bool)

(assert (=> start!74074 (=> (not res!592355) (not e!485196))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74074 (= res!592355 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24665 _keys!868))))))

(assert (=> start!74074 e!485196))

(assert (=> start!74074 true))

(declare-fun array_inv!19128 (array!50388) Bool)

(assert (=> start!74074 (array_inv!19128 _keys!868)))

(declare-datatypes ((V!27881 0))(
  ( (V!27882 (val!8610 Int)) )
))
(declare-datatypes ((ValueCell!8123 0))(
  ( (ValueCellFull!8123 (v!11035 V!27881)) (EmptyCell!8123) )
))
(declare-datatypes ((array!50390 0))(
  ( (array!50391 (arr!24226 (Array (_ BitVec 32) ValueCell!8123)) (size!24666 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50390)

(declare-fun e!485198 () Bool)

(declare-fun array_inv!19129 (array!50390) Bool)

(assert (=> start!74074 (and (array_inv!19129 _values!688) e!485198)))

(declare-fun b!871448 () Bool)

(declare-fun mapRes!27287 () Bool)

(assert (=> b!871448 (= e!485198 (and e!485199 mapRes!27287))))

(declare-fun condMapEmpty!27287 () Bool)

(declare-fun mapDefault!27287 () ValueCell!8123)

