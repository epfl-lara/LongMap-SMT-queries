; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73994 () Bool)

(assert start!73994)

(declare-fun b_free!14909 () Bool)

(declare-fun b_next!14909 () Bool)

(assert (=> start!73994 (= b_free!14909 (not b_next!14909))))

(declare-fun tp!52230 () Bool)

(declare-fun b_and!24661 () Bool)

(assert (=> start!73994 (= tp!52230 b_and!24661)))

(declare-fun mapNonEmpty!27167 () Bool)

(declare-fun mapRes!27167 () Bool)

(declare-fun tp!52231 () Bool)

(declare-fun e!484478 () Bool)

(assert (=> mapNonEmpty!27167 (= mapRes!27167 (and tp!52231 e!484478))))

(declare-datatypes ((V!27773 0))(
  ( (V!27774 (val!8570 Int)) )
))
(declare-datatypes ((ValueCell!8083 0))(
  ( (ValueCellFull!8083 (v!10995 V!27773)) (EmptyCell!8083) )
))
(declare-fun mapValue!27167 () ValueCell!8083)

(declare-fun mapRest!27167 () (Array (_ BitVec 32) ValueCell!8083))

(declare-fun mapKey!27167 () (_ BitVec 32))

(declare-datatypes ((array!50236 0))(
  ( (array!50237 (arr!24149 (Array (_ BitVec 32) ValueCell!8083)) (size!24589 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50236)

(assert (=> mapNonEmpty!27167 (= (arr!24149 _values!688) (store mapRest!27167 mapKey!27167 mapValue!27167))))

(declare-fun b!870015 () Bool)

(declare-fun res!591288 () Bool)

(declare-fun e!484483 () Bool)

(assert (=> b!870015 (=> (not res!591288) (not e!484483))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50238 0))(
  ( (array!50239 (arr!24150 (Array (_ BitVec 32) (_ BitVec 64))) (size!24590 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50238)

(assert (=> b!870015 (= res!591288 (and (= (size!24589 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24590 _keys!868) (size!24589 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870016 () Bool)

(declare-fun res!591293 () Bool)

(assert (=> b!870016 (=> (not res!591293) (not e!484483))))

(declare-datatypes ((List!17179 0))(
  ( (Nil!17176) (Cons!17175 (h!18306 (_ BitVec 64)) (t!24216 List!17179)) )
))
(declare-fun arrayNoDuplicates!0 (array!50238 (_ BitVec 32) List!17179) Bool)

(assert (=> b!870016 (= res!591293 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17176))))

(declare-fun b!870018 () Bool)

(declare-fun res!591287 () Bool)

(assert (=> b!870018 (=> (not res!591287) (not e!484483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50238 (_ BitVec 32)) Bool)

(assert (=> b!870018 (= res!591287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27167 () Bool)

(assert (=> mapIsEmpty!27167 mapRes!27167))

(declare-fun b!870019 () Bool)

(declare-fun res!591291 () Bool)

(assert (=> b!870019 (=> (not res!591291) (not e!484483))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870019 (= res!591291 (and (= (select (arr!24150 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!870020 () Bool)

(declare-fun res!591292 () Bool)

(assert (=> b!870020 (=> (not res!591292) (not e!484483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870020 (= res!591292 (validKeyInArray!0 k!854))))

(declare-fun b!870021 () Bool)

(declare-fun e!484480 () Bool)

(declare-fun e!484479 () Bool)

(assert (=> b!870021 (= e!484480 (and e!484479 mapRes!27167))))

(declare-fun condMapEmpty!27167 () Bool)

(declare-fun mapDefault!27167 () ValueCell!8083)

