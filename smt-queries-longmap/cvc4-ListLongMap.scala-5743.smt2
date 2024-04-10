; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74290 () Bool)

(assert start!74290)

(declare-fun b_free!15053 () Bool)

(declare-fun b_next!15053 () Bool)

(assert (=> start!74290 (= b_free!15053 (not b_next!15053))))

(declare-fun tp!52833 () Bool)

(declare-fun b_and!24829 () Bool)

(assert (=> start!74290 (= tp!52833 b_and!24829)))

(declare-fun b!874049 () Bool)

(declare-fun res!593966 () Bool)

(declare-fun e!486693 () Bool)

(assert (=> b!874049 (=> (not res!593966) (not e!486693))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874049 (= res!593966 (validKeyInArray!0 k!854))))

(declare-fun res!593967 () Bool)

(assert (=> start!74290 (=> (not res!593967) (not e!486693))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50722 0))(
  ( (array!50723 (arr!24389 (Array (_ BitVec 32) (_ BitVec 64))) (size!24829 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50722)

(assert (=> start!74290 (= res!593967 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24829 _keys!868))))))

(assert (=> start!74290 e!486693))

(declare-fun tp_is_empty!17297 () Bool)

(assert (=> start!74290 tp_is_empty!17297))

(assert (=> start!74290 true))

(assert (=> start!74290 tp!52833))

(declare-fun array_inv!19240 (array!50722) Bool)

(assert (=> start!74290 (array_inv!19240 _keys!868)))

(declare-datatypes ((V!28109 0))(
  ( (V!28110 (val!8696 Int)) )
))
(declare-datatypes ((ValueCell!8209 0))(
  ( (ValueCellFull!8209 (v!11125 V!28109)) (EmptyCell!8209) )
))
(declare-datatypes ((array!50724 0))(
  ( (array!50725 (arr!24390 (Array (_ BitVec 32) ValueCell!8209)) (size!24830 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50724)

(declare-fun e!486695 () Bool)

(declare-fun array_inv!19241 (array!50724) Bool)

(assert (=> start!74290 (and (array_inv!19241 _values!688) e!486695)))

(declare-fun b!874050 () Bool)

(assert (=> b!874050 (= e!486693 false)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28109)

(declare-fun zeroValue!654 () V!28109)

(declare-fun v!557 () V!28109)

(declare-datatypes ((tuple2!11494 0))(
  ( (tuple2!11495 (_1!5758 (_ BitVec 64)) (_2!5758 V!28109)) )
))
(declare-datatypes ((List!17313 0))(
  ( (Nil!17310) (Cons!17309 (h!18440 tuple2!11494) (t!24354 List!17313)) )
))
(declare-datatypes ((ListLongMap!10263 0))(
  ( (ListLongMap!10264 (toList!5147 List!17313)) )
))
(declare-fun lt!395872 () ListLongMap!10263)

(declare-fun getCurrentListMapNoExtraKeys!3114 (array!50722 array!50724 (_ BitVec 32) (_ BitVec 32) V!28109 V!28109 (_ BitVec 32) Int) ListLongMap!10263)

(assert (=> b!874050 (= lt!395872 (getCurrentListMapNoExtraKeys!3114 _keys!868 (array!50725 (store (arr!24390 _values!688) i!612 (ValueCellFull!8209 v!557)) (size!24830 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395873 () ListLongMap!10263)

(assert (=> b!874050 (= lt!395873 (getCurrentListMapNoExtraKeys!3114 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874051 () Bool)

(declare-fun res!593970 () Bool)

(assert (=> b!874051 (=> (not res!593970) (not e!486693))))

(assert (=> b!874051 (= res!593970 (and (= (select (arr!24389 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27554 () Bool)

(declare-fun mapRes!27554 () Bool)

(assert (=> mapIsEmpty!27554 mapRes!27554))

(declare-fun b!874052 () Bool)

(declare-fun res!593963 () Bool)

(assert (=> b!874052 (=> (not res!593963) (not e!486693))))

(assert (=> b!874052 (= res!593963 (and (= (size!24830 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24829 _keys!868) (size!24830 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27554 () Bool)

(declare-fun tp!52834 () Bool)

(declare-fun e!486692 () Bool)

(assert (=> mapNonEmpty!27554 (= mapRes!27554 (and tp!52834 e!486692))))

(declare-fun mapValue!27554 () ValueCell!8209)

(declare-fun mapKey!27554 () (_ BitVec 32))

(declare-fun mapRest!27554 () (Array (_ BitVec 32) ValueCell!8209))

(assert (=> mapNonEmpty!27554 (= (arr!24390 _values!688) (store mapRest!27554 mapKey!27554 mapValue!27554))))

(declare-fun b!874053 () Bool)

(assert (=> b!874053 (= e!486692 tp_is_empty!17297)))

(declare-fun b!874054 () Bool)

(declare-fun res!593969 () Bool)

(assert (=> b!874054 (=> (not res!593969) (not e!486693))))

(declare-datatypes ((List!17314 0))(
  ( (Nil!17311) (Cons!17310 (h!18441 (_ BitVec 64)) (t!24355 List!17314)) )
))
(declare-fun arrayNoDuplicates!0 (array!50722 (_ BitVec 32) List!17314) Bool)

(assert (=> b!874054 (= res!593969 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17311))))

(declare-fun b!874055 () Bool)

(declare-fun e!486691 () Bool)

(assert (=> b!874055 (= e!486691 tp_is_empty!17297)))

(declare-fun b!874056 () Bool)

(declare-fun res!593964 () Bool)

(assert (=> b!874056 (=> (not res!593964) (not e!486693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874056 (= res!593964 (validMask!0 mask!1196))))

(declare-fun b!874057 () Bool)

(declare-fun res!593968 () Bool)

(assert (=> b!874057 (=> (not res!593968) (not e!486693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50722 (_ BitVec 32)) Bool)

(assert (=> b!874057 (= res!593968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874058 () Bool)

(declare-fun res!593965 () Bool)

(assert (=> b!874058 (=> (not res!593965) (not e!486693))))

(assert (=> b!874058 (= res!593965 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24829 _keys!868))))))

(declare-fun b!874059 () Bool)

(assert (=> b!874059 (= e!486695 (and e!486691 mapRes!27554))))

(declare-fun condMapEmpty!27554 () Bool)

(declare-fun mapDefault!27554 () ValueCell!8209)

