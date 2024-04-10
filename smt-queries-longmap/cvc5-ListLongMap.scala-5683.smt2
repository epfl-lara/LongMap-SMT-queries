; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73882 () Bool)

(assert start!73882)

(declare-fun b_free!14797 () Bool)

(declare-fun b_next!14797 () Bool)

(assert (=> start!73882 (= b_free!14797 (not b_next!14797))))

(declare-fun tp!51894 () Bool)

(declare-fun b_and!24549 () Bool)

(assert (=> start!73882 (= tp!51894 b_and!24549)))

(declare-fun b!867999 () Bool)

(declare-fun e!483471 () Bool)

(declare-fun e!483475 () Bool)

(assert (=> b!867999 (= e!483471 e!483475)))

(declare-fun res!589773 () Bool)

(assert (=> b!867999 (=> (not res!589773) (not e!483475))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867999 (= res!589773 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27625 0))(
  ( (V!27626 (val!8514 Int)) )
))
(declare-datatypes ((tuple2!11298 0))(
  ( (tuple2!11299 (_1!5660 (_ BitVec 64)) (_2!5660 V!27625)) )
))
(declare-datatypes ((List!17097 0))(
  ( (Nil!17094) (Cons!17093 (h!18224 tuple2!11298) (t!24134 List!17097)) )
))
(declare-datatypes ((ListLongMap!10067 0))(
  ( (ListLongMap!10068 (toList!5049 List!17097)) )
))
(declare-fun lt!394322 () ListLongMap!10067)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50024 0))(
  ( (array!50025 (arr!24043 (Array (_ BitVec 32) (_ BitVec 64))) (size!24483 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50024)

(declare-fun minValue!654 () V!27625)

(declare-fun zeroValue!654 () V!27625)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8027 0))(
  ( (ValueCellFull!8027 (v!10939 V!27625)) (EmptyCell!8027) )
))
(declare-datatypes ((array!50026 0))(
  ( (array!50027 (arr!24044 (Array (_ BitVec 32) ValueCell!8027)) (size!24484 (_ BitVec 32))) )
))
(declare-fun lt!394324 () array!50026)

(declare-fun getCurrentListMapNoExtraKeys!3018 (array!50024 array!50026 (_ BitVec 32) (_ BitVec 32) V!27625 V!27625 (_ BitVec 32) Int) ListLongMap!10067)

(assert (=> b!867999 (= lt!394322 (getCurrentListMapNoExtraKeys!3018 _keys!868 lt!394324 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27625)

(declare-fun _values!688 () array!50026)

(assert (=> b!867999 (= lt!394324 (array!50027 (store (arr!24044 _values!688) i!612 (ValueCellFull!8027 v!557)) (size!24484 _values!688)))))

(declare-fun lt!394323 () ListLongMap!10067)

(assert (=> b!867999 (= lt!394323 (getCurrentListMapNoExtraKeys!3018 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868000 () Bool)

(declare-fun e!483470 () Bool)

(declare-fun tp_is_empty!16933 () Bool)

(assert (=> b!868000 (= e!483470 tp_is_empty!16933)))

(declare-fun b!868001 () Bool)

(declare-fun res!589780 () Bool)

(assert (=> b!868001 (=> (not res!589780) (not e!483471))))

(assert (=> b!868001 (= res!589780 (and (= (size!24484 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24483 _keys!868) (size!24484 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868002 () Bool)

(declare-fun res!589778 () Bool)

(assert (=> b!868002 (=> (not res!589778) (not e!483471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868002 (= res!589778 (validMask!0 mask!1196))))

(declare-fun b!868003 () Bool)

(declare-fun e!483474 () Bool)

(assert (=> b!868003 (= e!483474 tp_is_empty!16933)))

(declare-fun res!589774 () Bool)

(assert (=> start!73882 (=> (not res!589774) (not e!483471))))

(assert (=> start!73882 (= res!589774 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24483 _keys!868))))))

(assert (=> start!73882 e!483471))

(assert (=> start!73882 tp_is_empty!16933))

(assert (=> start!73882 true))

(assert (=> start!73882 tp!51894))

(declare-fun array_inv!18998 (array!50024) Bool)

(assert (=> start!73882 (array_inv!18998 _keys!868)))

(declare-fun e!483472 () Bool)

(declare-fun array_inv!18999 (array!50026) Bool)

(assert (=> start!73882 (and (array_inv!18999 _values!688) e!483472)))

(declare-fun b!868004 () Bool)

(declare-fun res!589776 () Bool)

(assert (=> b!868004 (=> (not res!589776) (not e!483471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50024 (_ BitVec 32)) Bool)

(assert (=> b!868004 (= res!589776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26999 () Bool)

(declare-fun mapRes!26999 () Bool)

(assert (=> mapIsEmpty!26999 mapRes!26999))

(declare-fun b!868005 () Bool)

(declare-fun res!589781 () Bool)

(assert (=> b!868005 (=> (not res!589781) (not e!483471))))

(assert (=> b!868005 (= res!589781 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24483 _keys!868))))))

(declare-fun b!868006 () Bool)

(assert (=> b!868006 (= e!483475 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2393 (ListLongMap!10067 tuple2!11298) ListLongMap!10067)

(assert (=> b!868006 (= (getCurrentListMapNoExtraKeys!3018 _keys!868 lt!394324 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2393 (getCurrentListMapNoExtraKeys!3018 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11299 k!854 v!557)))))

(declare-datatypes ((Unit!29784 0))(
  ( (Unit!29785) )
))
(declare-fun lt!394321 () Unit!29784)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!587 (array!50024 array!50026 (_ BitVec 32) (_ BitVec 32) V!27625 V!27625 (_ BitVec 32) (_ BitVec 64) V!27625 (_ BitVec 32) Int) Unit!29784)

(assert (=> b!868006 (= lt!394321 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!587 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868007 () Bool)

(declare-fun res!589777 () Bool)

(assert (=> b!868007 (=> (not res!589777) (not e!483471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868007 (= res!589777 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26999 () Bool)

(declare-fun tp!51895 () Bool)

(assert (=> mapNonEmpty!26999 (= mapRes!26999 (and tp!51895 e!483474))))

(declare-fun mapRest!26999 () (Array (_ BitVec 32) ValueCell!8027))

(declare-fun mapValue!26999 () ValueCell!8027)

(declare-fun mapKey!26999 () (_ BitVec 32))

(assert (=> mapNonEmpty!26999 (= (arr!24044 _values!688) (store mapRest!26999 mapKey!26999 mapValue!26999))))

(declare-fun b!868008 () Bool)

(declare-fun res!589775 () Bool)

(assert (=> b!868008 (=> (not res!589775) (not e!483471))))

(assert (=> b!868008 (= res!589775 (and (= (select (arr!24043 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!868009 () Bool)

(assert (=> b!868009 (= e!483472 (and e!483470 mapRes!26999))))

(declare-fun condMapEmpty!26999 () Bool)

(declare-fun mapDefault!26999 () ValueCell!8027)

