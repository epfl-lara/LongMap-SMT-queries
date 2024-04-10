; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74316 () Bool)

(assert start!74316)

(declare-fun b_free!15079 () Bool)

(declare-fun b_next!15079 () Bool)

(assert (=> start!74316 (= b_free!15079 (not b_next!15079))))

(declare-fun tp!52911 () Bool)

(declare-fun b_and!24855 () Bool)

(assert (=> start!74316 (= tp!52911 b_and!24855)))

(declare-fun b!874478 () Bool)

(declare-fun res!594280 () Bool)

(declare-fun e!486888 () Bool)

(assert (=> b!874478 (=> (not res!594280) (not e!486888))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50774 0))(
  ( (array!50775 (arr!24415 (Array (_ BitVec 32) (_ BitVec 64))) (size!24855 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50774)

(assert (=> b!874478 (= res!594280 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24855 _keys!868))))))

(declare-fun b!874479 () Bool)

(declare-fun res!594278 () Bool)

(assert (=> b!874479 (=> (not res!594278) (not e!486888))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28145 0))(
  ( (V!28146 (val!8709 Int)) )
))
(declare-datatypes ((ValueCell!8222 0))(
  ( (ValueCellFull!8222 (v!11138 V!28145)) (EmptyCell!8222) )
))
(declare-datatypes ((array!50776 0))(
  ( (array!50777 (arr!24416 (Array (_ BitVec 32) ValueCell!8222)) (size!24856 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50776)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874479 (= res!594278 (and (= (size!24856 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24855 _keys!868) (size!24856 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874480 () Bool)

(declare-fun res!594282 () Bool)

(assert (=> b!874480 (=> (not res!594282) (not e!486888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50774 (_ BitVec 32)) Bool)

(assert (=> b!874480 (= res!594282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874481 () Bool)

(declare-fun e!486889 () Bool)

(declare-fun tp_is_empty!17323 () Bool)

(assert (=> b!874481 (= e!486889 tp_is_empty!17323)))

(declare-fun b!874482 () Bool)

(declare-fun e!486890 () Bool)

(declare-fun mapRes!27593 () Bool)

(assert (=> b!874482 (= e!486890 (and e!486889 mapRes!27593))))

(declare-fun condMapEmpty!27593 () Bool)

(declare-fun mapDefault!27593 () ValueCell!8222)

