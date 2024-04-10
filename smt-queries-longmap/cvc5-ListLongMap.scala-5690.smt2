; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73924 () Bool)

(assert start!73924)

(declare-fun b_free!14839 () Bool)

(declare-fun b_next!14839 () Bool)

(assert (=> start!73924 (= b_free!14839 (not b_next!14839))))

(declare-fun tp!52020 () Bool)

(declare-fun b_and!24591 () Bool)

(assert (=> start!73924 (= tp!52020 b_and!24591)))

(declare-fun b!868755 () Bool)

(declare-fun res!590340 () Bool)

(declare-fun e!483852 () Bool)

(assert (=> b!868755 (=> (not res!590340) (not e!483852))))

(declare-datatypes ((array!50100 0))(
  ( (array!50101 (arr!24081 (Array (_ BitVec 32) (_ BitVec 64))) (size!24521 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50100)

(declare-datatypes ((List!17125 0))(
  ( (Nil!17122) (Cons!17121 (h!18252 (_ BitVec 64)) (t!24162 List!17125)) )
))
(declare-fun arrayNoDuplicates!0 (array!50100 (_ BitVec 32) List!17125) Bool)

(assert (=> b!868755 (= res!590340 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17122))))

(declare-fun res!590347 () Bool)

(assert (=> start!73924 (=> (not res!590347) (not e!483852))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73924 (= res!590347 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24521 _keys!868))))))

(assert (=> start!73924 e!483852))

(declare-fun tp_is_empty!16975 () Bool)

(assert (=> start!73924 tp_is_empty!16975))

(assert (=> start!73924 true))

(assert (=> start!73924 tp!52020))

(declare-fun array_inv!19022 (array!50100) Bool)

(assert (=> start!73924 (array_inv!19022 _keys!868)))

(declare-datatypes ((V!27681 0))(
  ( (V!27682 (val!8535 Int)) )
))
(declare-datatypes ((ValueCell!8048 0))(
  ( (ValueCellFull!8048 (v!10960 V!27681)) (EmptyCell!8048) )
))
(declare-datatypes ((array!50102 0))(
  ( (array!50103 (arr!24082 (Array (_ BitVec 32) ValueCell!8048)) (size!24522 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50102)

(declare-fun e!483851 () Bool)

(declare-fun array_inv!19023 (array!50102) Bool)

(assert (=> start!73924 (and (array_inv!19023 _values!688) e!483851)))

(declare-fun b!868756 () Bool)

(declare-fun e!483849 () Bool)

(assert (=> b!868756 (= e!483852 e!483849)))

(declare-fun res!590346 () Bool)

(assert (=> b!868756 (=> (not res!590346) (not e!483849))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868756 (= res!590346 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11330 0))(
  ( (tuple2!11331 (_1!5676 (_ BitVec 64)) (_2!5676 V!27681)) )
))
(declare-datatypes ((List!17126 0))(
  ( (Nil!17123) (Cons!17122 (h!18253 tuple2!11330) (t!24163 List!17126)) )
))
(declare-datatypes ((ListLongMap!10099 0))(
  ( (ListLongMap!10100 (toList!5065 List!17126)) )
))
(declare-fun lt!394573 () ListLongMap!10099)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394574 () array!50102)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27681)

(declare-fun zeroValue!654 () V!27681)

(declare-fun getCurrentListMapNoExtraKeys!3034 (array!50100 array!50102 (_ BitVec 32) (_ BitVec 32) V!27681 V!27681 (_ BitVec 32) Int) ListLongMap!10099)

(assert (=> b!868756 (= lt!394573 (getCurrentListMapNoExtraKeys!3034 _keys!868 lt!394574 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27681)

(assert (=> b!868756 (= lt!394574 (array!50103 (store (arr!24082 _values!688) i!612 (ValueCellFull!8048 v!557)) (size!24522 _values!688)))))

(declare-fun lt!394576 () ListLongMap!10099)

(assert (=> b!868756 (= lt!394576 (getCurrentListMapNoExtraKeys!3034 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868757 () Bool)

(declare-fun e!483850 () Bool)

(assert (=> b!868757 (= e!483850 tp_is_empty!16975)))

(declare-fun b!868758 () Bool)

(declare-fun res!590348 () Bool)

(assert (=> b!868758 (=> (not res!590348) (not e!483852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868758 (= res!590348 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27062 () Bool)

(declare-fun mapRes!27062 () Bool)

(assert (=> mapIsEmpty!27062 mapRes!27062))

(declare-fun b!868759 () Bool)

(declare-fun res!590343 () Bool)

(assert (=> b!868759 (=> (not res!590343) (not e!483852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50100 (_ BitVec 32)) Bool)

(assert (=> b!868759 (= res!590343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868760 () Bool)

(declare-fun res!590341 () Bool)

(assert (=> b!868760 (=> (not res!590341) (not e!483852))))

(assert (=> b!868760 (= res!590341 (and (= (size!24522 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24521 _keys!868) (size!24522 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868761 () Bool)

(assert (=> b!868761 (= e!483851 (and e!483850 mapRes!27062))))

(declare-fun condMapEmpty!27062 () Bool)

(declare-fun mapDefault!27062 () ValueCell!8048)

