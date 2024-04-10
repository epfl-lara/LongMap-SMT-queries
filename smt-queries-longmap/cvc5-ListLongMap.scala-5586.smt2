; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73300 () Bool)

(assert start!73300)

(declare-fun b_free!14215 () Bool)

(declare-fun b_next!14215 () Bool)

(assert (=> start!73300 (= b_free!14215 (not b_next!14215))))

(declare-fun tp!50149 () Bool)

(declare-fun b_and!23571 () Bool)

(assert (=> start!73300 (= tp!50149 b_and!23571)))

(declare-fun b!855073 () Bool)

(declare-fun e!476758 () Bool)

(assert (=> b!855073 (= e!476758 false)))

(declare-datatypes ((V!26849 0))(
  ( (V!26850 (val!8223 Int)) )
))
(declare-datatypes ((tuple2!10832 0))(
  ( (tuple2!10833 (_1!5427 (_ BitVec 64)) (_2!5427 V!26849)) )
))
(declare-datatypes ((List!16646 0))(
  ( (Nil!16643) (Cons!16642 (h!17773 tuple2!10832) (t!23287 List!16646)) )
))
(declare-datatypes ((ListLongMap!9601 0))(
  ( (ListLongMap!9602 (toList!4816 List!16646)) )
))
(declare-fun lt!385633 () ListLongMap!9601)

(declare-fun v!557 () V!26849)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48898 0))(
  ( (array!48899 (arr!23480 (Array (_ BitVec 32) (_ BitVec 64))) (size!23920 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48898)

(declare-datatypes ((ValueCell!7736 0))(
  ( (ValueCellFull!7736 (v!10648 V!26849)) (EmptyCell!7736) )
))
(declare-datatypes ((array!48900 0))(
  ( (array!48901 (arr!23481 (Array (_ BitVec 32) ValueCell!7736)) (size!23921 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48900)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26849)

(declare-fun zeroValue!654 () V!26849)

(declare-fun getCurrentListMapNoExtraKeys!2797 (array!48898 array!48900 (_ BitVec 32) (_ BitVec 32) V!26849 V!26849 (_ BitVec 32) Int) ListLongMap!9601)

(assert (=> b!855073 (= lt!385633 (getCurrentListMapNoExtraKeys!2797 _keys!868 (array!48901 (store (arr!23481 _values!688) i!612 (ValueCellFull!7736 v!557)) (size!23921 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385632 () ListLongMap!9601)

(assert (=> b!855073 (= lt!385632 (getCurrentListMapNoExtraKeys!2797 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855074 () Bool)

(declare-fun res!580690 () Bool)

(assert (=> b!855074 (=> (not res!580690) (not e!476758))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!855074 (= res!580690 (and (= (select (arr!23480 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26126 () Bool)

(declare-fun mapRes!26126 () Bool)

(declare-fun tp!50148 () Bool)

(declare-fun e!476755 () Bool)

(assert (=> mapNonEmpty!26126 (= mapRes!26126 (and tp!50148 e!476755))))

(declare-fun mapKey!26126 () (_ BitVec 32))

(declare-fun mapRest!26126 () (Array (_ BitVec 32) ValueCell!7736))

(declare-fun mapValue!26126 () ValueCell!7736)

(assert (=> mapNonEmpty!26126 (= (arr!23481 _values!688) (store mapRest!26126 mapKey!26126 mapValue!26126))))

(declare-fun b!855075 () Bool)

(declare-fun res!580695 () Bool)

(assert (=> b!855075 (=> (not res!580695) (not e!476758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855075 (= res!580695 (validMask!0 mask!1196))))

(declare-fun b!855076 () Bool)

(declare-fun res!580691 () Bool)

(assert (=> b!855076 (=> (not res!580691) (not e!476758))))

(assert (=> b!855076 (= res!580691 (and (= (size!23921 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23920 _keys!868) (size!23921 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855077 () Bool)

(declare-fun e!476754 () Bool)

(declare-fun tp_is_empty!16351 () Bool)

(assert (=> b!855077 (= e!476754 tp_is_empty!16351)))

(declare-fun res!580692 () Bool)

(assert (=> start!73300 (=> (not res!580692) (not e!476758))))

(assert (=> start!73300 (= res!580692 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23920 _keys!868))))))

(assert (=> start!73300 e!476758))

(assert (=> start!73300 tp_is_empty!16351))

(assert (=> start!73300 true))

(assert (=> start!73300 tp!50149))

(declare-fun array_inv!18604 (array!48898) Bool)

(assert (=> start!73300 (array_inv!18604 _keys!868)))

(declare-fun e!476756 () Bool)

(declare-fun array_inv!18605 (array!48900) Bool)

(assert (=> start!73300 (and (array_inv!18605 _values!688) e!476756)))

(declare-fun b!855078 () Bool)

(declare-fun res!580696 () Bool)

(assert (=> b!855078 (=> (not res!580696) (not e!476758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48898 (_ BitVec 32)) Bool)

(assert (=> b!855078 (= res!580696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26126 () Bool)

(assert (=> mapIsEmpty!26126 mapRes!26126))

(declare-fun b!855079 () Bool)

(declare-fun res!580697 () Bool)

(assert (=> b!855079 (=> (not res!580697) (not e!476758))))

(declare-datatypes ((List!16647 0))(
  ( (Nil!16644) (Cons!16643 (h!17774 (_ BitVec 64)) (t!23288 List!16647)) )
))
(declare-fun arrayNoDuplicates!0 (array!48898 (_ BitVec 32) List!16647) Bool)

(assert (=> b!855079 (= res!580697 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16644))))

(declare-fun b!855080 () Bool)

(declare-fun res!580694 () Bool)

(assert (=> b!855080 (=> (not res!580694) (not e!476758))))

(assert (=> b!855080 (= res!580694 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23920 _keys!868))))))

(declare-fun b!855081 () Bool)

(declare-fun res!580693 () Bool)

(assert (=> b!855081 (=> (not res!580693) (not e!476758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855081 (= res!580693 (validKeyInArray!0 k!854))))

(declare-fun b!855082 () Bool)

(assert (=> b!855082 (= e!476755 tp_is_empty!16351)))

(declare-fun b!855083 () Bool)

(assert (=> b!855083 (= e!476756 (and e!476754 mapRes!26126))))

(declare-fun condMapEmpty!26126 () Bool)

(declare-fun mapDefault!26126 () ValueCell!7736)

