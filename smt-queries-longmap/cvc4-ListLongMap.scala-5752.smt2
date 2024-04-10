; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74344 () Bool)

(assert start!74344)

(declare-fun b_free!15107 () Bool)

(declare-fun b_next!15107 () Bool)

(assert (=> start!74344 (= b_free!15107 (not b_next!15107))))

(declare-fun tp!52996 () Bool)

(declare-fun b_and!24883 () Bool)

(assert (=> start!74344 (= tp!52996 b_and!24883)))

(declare-fun b!874940 () Bool)

(declare-fun res!594617 () Bool)

(declare-fun e!487099 () Bool)

(assert (=> b!874940 (=> (not res!594617) (not e!487099))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874940 (= res!594617 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27635 () Bool)

(declare-fun mapRes!27635 () Bool)

(declare-fun tp!52995 () Bool)

(declare-fun e!487096 () Bool)

(assert (=> mapNonEmpty!27635 (= mapRes!27635 (and tp!52995 e!487096))))

(declare-datatypes ((V!28181 0))(
  ( (V!28182 (val!8723 Int)) )
))
(declare-datatypes ((ValueCell!8236 0))(
  ( (ValueCellFull!8236 (v!11152 V!28181)) (EmptyCell!8236) )
))
(declare-fun mapValue!27635 () ValueCell!8236)

(declare-fun mapKey!27635 () (_ BitVec 32))

(declare-fun mapRest!27635 () (Array (_ BitVec 32) ValueCell!8236))

(declare-datatypes ((array!50830 0))(
  ( (array!50831 (arr!24443 (Array (_ BitVec 32) ValueCell!8236)) (size!24883 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50830)

(assert (=> mapNonEmpty!27635 (= (arr!24443 _values!688) (store mapRest!27635 mapKey!27635 mapValue!27635))))

(declare-fun b!874942 () Bool)

(declare-fun res!594612 () Bool)

(assert (=> b!874942 (=> (not res!594612) (not e!487099))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50832 0))(
  ( (array!50833 (arr!24444 (Array (_ BitVec 32) (_ BitVec 64))) (size!24884 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50832)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874942 (= res!594612 (and (= (select (arr!24444 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874943 () Bool)

(declare-fun res!594614 () Bool)

(assert (=> b!874943 (=> (not res!594614) (not e!487099))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874943 (= res!594614 (and (= (size!24883 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24884 _keys!868) (size!24883 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874944 () Bool)

(declare-fun res!594616 () Bool)

(assert (=> b!874944 (=> (not res!594616) (not e!487099))))

(assert (=> b!874944 (= res!594616 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24884 _keys!868))))))

(declare-fun b!874945 () Bool)

(declare-fun res!594618 () Bool)

(assert (=> b!874945 (=> (not res!594618) (not e!487099))))

(declare-datatypes ((List!17348 0))(
  ( (Nil!17345) (Cons!17344 (h!18475 (_ BitVec 64)) (t!24389 List!17348)) )
))
(declare-fun arrayNoDuplicates!0 (array!50832 (_ BitVec 32) List!17348) Bool)

(assert (=> b!874945 (= res!594618 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17345))))

(declare-fun b!874946 () Bool)

(declare-fun res!594615 () Bool)

(assert (=> b!874946 (=> (not res!594615) (not e!487099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50832 (_ BitVec 32)) Bool)

(assert (=> b!874946 (= res!594615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874947 () Bool)

(declare-fun res!594611 () Bool)

(assert (=> b!874947 (=> (not res!594611) (not e!487099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874947 (= res!594611 (validKeyInArray!0 k!854))))

(declare-fun b!874948 () Bool)

(declare-fun tp_is_empty!17351 () Bool)

(assert (=> b!874948 (= e!487096 tp_is_empty!17351)))

(declare-fun b!874949 () Bool)

(declare-fun e!487100 () Bool)

(declare-fun e!487098 () Bool)

(assert (=> b!874949 (= e!487100 (and e!487098 mapRes!27635))))

(declare-fun condMapEmpty!27635 () Bool)

(declare-fun mapDefault!27635 () ValueCell!8236)

