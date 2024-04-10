; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74918 () Bool)

(assert start!74918)

(declare-fun b_free!15437 () Bool)

(declare-fun b_next!15437 () Bool)

(assert (=> start!74918 (= b_free!15437 (not b_next!15437))))

(declare-fun tp!54013 () Bool)

(declare-fun b_and!25573 () Bool)

(assert (=> start!74918 (= tp!54013 b_and!25573)))

(declare-fun b!883461 () Bool)

(declare-fun res!600209 () Bool)

(declare-fun e!491675 () Bool)

(assert (=> b!883461 (=> (not res!600209) (not e!491675))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883461 (= res!600209 (validKeyInArray!0 k!854))))

(declare-fun b!883462 () Bool)

(declare-fun e!491680 () Bool)

(declare-fun tp_is_empty!17681 () Bool)

(assert (=> b!883462 (= e!491680 tp_is_empty!17681)))

(declare-fun b!883463 () Bool)

(declare-fun res!600206 () Bool)

(assert (=> b!883463 (=> (not res!600206) (not e!491675))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51488 0))(
  ( (array!51489 (arr!24763 (Array (_ BitVec 32) (_ BitVec 64))) (size!25203 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51488)

(declare-datatypes ((V!28621 0))(
  ( (V!28622 (val!8888 Int)) )
))
(declare-datatypes ((ValueCell!8401 0))(
  ( (ValueCellFull!8401 (v!11357 V!28621)) (EmptyCell!8401) )
))
(declare-datatypes ((array!51490 0))(
  ( (array!51491 (arr!24764 (Array (_ BitVec 32) ValueCell!8401)) (size!25204 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51490)

(assert (=> b!883463 (= res!600206 (and (= (size!25204 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25203 _keys!868) (size!25204 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883464 () Bool)

(declare-datatypes ((Unit!30139 0))(
  ( (Unit!30140) )
))
(declare-fun e!491678 () Unit!30139)

(declare-fun Unit!30141 () Unit!30139)

(assert (=> b!883464 (= e!491678 Unit!30141)))

(declare-fun res!600212 () Bool)

(assert (=> start!74918 (=> (not res!600212) (not e!491675))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74918 (= res!600212 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25203 _keys!868))))))

(assert (=> start!74918 e!491675))

(assert (=> start!74918 tp_is_empty!17681))

(assert (=> start!74918 true))

(assert (=> start!74918 tp!54013))

(declare-fun array_inv!19498 (array!51488) Bool)

(assert (=> start!74918 (array_inv!19498 _keys!868)))

(declare-fun e!491676 () Bool)

(declare-fun array_inv!19499 (array!51490) Bool)

(assert (=> start!74918 (and (array_inv!19499 _values!688) e!491676)))

(declare-fun b!883465 () Bool)

(declare-fun mapRes!28158 () Bool)

(assert (=> b!883465 (= e!491676 (and e!491680 mapRes!28158))))

(declare-fun condMapEmpty!28158 () Bool)

(declare-fun mapDefault!28158 () ValueCell!8401)

