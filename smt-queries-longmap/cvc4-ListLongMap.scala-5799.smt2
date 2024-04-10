; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74812 () Bool)

(assert start!74812)

(declare-fun b_free!15389 () Bool)

(declare-fun b_next!15389 () Bool)

(assert (=> start!74812 (= b_free!15389 (not b_next!15389))))

(declare-fun tp!53864 () Bool)

(declare-fun b_and!25445 () Bool)

(assert (=> start!74812 (= tp!53864 b_and!25445)))

(declare-fun b!881996 () Bool)

(declare-fun res!599201 () Bool)

(declare-fun e!490851 () Bool)

(assert (=> b!881996 (=> (not res!599201) (not e!490851))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51394 0))(
  ( (array!51395 (arr!24718 (Array (_ BitVec 32) (_ BitVec 64))) (size!25158 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51394)

(declare-datatypes ((V!28557 0))(
  ( (V!28558 (val!8864 Int)) )
))
(declare-datatypes ((ValueCell!8377 0))(
  ( (ValueCellFull!8377 (v!11324 V!28557)) (EmptyCell!8377) )
))
(declare-datatypes ((array!51396 0))(
  ( (array!51397 (arr!24719 (Array (_ BitVec 32) ValueCell!8377)) (size!25159 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51396)

(assert (=> b!881996 (= res!599201 (and (= (size!25159 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25158 _keys!868) (size!25159 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881997 () Bool)

(declare-fun res!599211 () Bool)

(assert (=> b!881997 (=> (not res!599211) (not e!490851))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881997 (= res!599211 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25158 _keys!868))))))

(declare-fun mapIsEmpty!28080 () Bool)

(declare-fun mapRes!28080 () Bool)

(assert (=> mapIsEmpty!28080 mapRes!28080))

(declare-fun b!881998 () Bool)

(declare-fun res!599206 () Bool)

(assert (=> b!881998 (=> (not res!599206) (not e!490851))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881998 (= res!599206 (and (= (select (arr!24718 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!881999 () Bool)

(declare-fun e!490854 () Bool)

(declare-fun e!490857 () Bool)

(assert (=> b!881999 (= e!490854 (and e!490857 mapRes!28080))))

(declare-fun condMapEmpty!28080 () Bool)

(declare-fun mapDefault!28080 () ValueCell!8377)

