; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73442 () Bool)

(assert start!73442)

(declare-fun b_free!14357 () Bool)

(declare-fun b_next!14357 () Bool)

(assert (=> start!73442 (= b_free!14357 (not b_next!14357))))

(declare-fun tp!50574 () Bool)

(declare-fun b_and!23713 () Bool)

(assert (=> start!73442 (= tp!50574 b_and!23713)))

(declare-fun res!582529 () Bool)

(declare-fun e!477955 () Bool)

(assert (=> start!73442 (=> (not res!582529) (not e!477955))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49176 0))(
  ( (array!49177 (arr!23619 (Array (_ BitVec 32) (_ BitVec 64))) (size!24059 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49176)

(assert (=> start!73442 (= res!582529 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24059 _keys!868))))))

(assert (=> start!73442 e!477955))

(declare-fun tp_is_empty!16493 () Bool)

(assert (=> start!73442 tp_is_empty!16493))

(assert (=> start!73442 true))

(assert (=> start!73442 tp!50574))

(declare-fun array_inv!18704 (array!49176) Bool)

(assert (=> start!73442 (array_inv!18704 _keys!868)))

(declare-datatypes ((V!27037 0))(
  ( (V!27038 (val!8294 Int)) )
))
(declare-datatypes ((ValueCell!7807 0))(
  ( (ValueCellFull!7807 (v!10719 V!27037)) (EmptyCell!7807) )
))
(declare-datatypes ((array!49178 0))(
  ( (array!49179 (arr!23620 (Array (_ BitVec 32) ValueCell!7807)) (size!24060 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49178)

(declare-fun e!477954 () Bool)

(declare-fun array_inv!18705 (array!49178) Bool)

(assert (=> start!73442 (and (array_inv!18705 _values!688) e!477954)))

(declare-fun b!857550 () Bool)

(declare-fun res!582530 () Bool)

(assert (=> b!857550 (=> (not res!582530) (not e!477955))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!857550 (= res!582530 (and (= (select (arr!23619 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!857551 () Bool)

(declare-fun e!477956 () Bool)

(declare-fun mapRes!26339 () Bool)

(assert (=> b!857551 (= e!477954 (and e!477956 mapRes!26339))))

(declare-fun condMapEmpty!26339 () Bool)

(declare-fun mapDefault!26339 () ValueCell!7807)

