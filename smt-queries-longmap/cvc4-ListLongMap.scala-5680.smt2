; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73868 () Bool)

(assert start!73868)

(declare-fun b_free!14783 () Bool)

(declare-fun b_next!14783 () Bool)

(assert (=> start!73868 (= b_free!14783 (not b_next!14783))))

(declare-fun tp!51853 () Bool)

(declare-fun b_and!24535 () Bool)

(assert (=> start!73868 (= tp!51853 b_and!24535)))

(declare-fun b!867747 () Bool)

(declare-fun res!589587 () Bool)

(declare-fun e!483344 () Bool)

(assert (=> b!867747 (=> (not res!589587) (not e!483344))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49998 0))(
  ( (array!49999 (arr!24030 (Array (_ BitVec 32) (_ BitVec 64))) (size!24470 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49998)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867747 (= res!589587 (and (= (select (arr!24030 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!867748 () Bool)

(declare-fun res!589589 () Bool)

(assert (=> b!867748 (=> (not res!589589) (not e!483344))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49998 (_ BitVec 32)) Bool)

(assert (=> b!867748 (= res!589589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867749 () Bool)

(declare-fun res!589592 () Bool)

(assert (=> b!867749 (=> (not res!589592) (not e!483344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867749 (= res!589592 (validKeyInArray!0 k!854))))

(declare-fun b!867750 () Bool)

(declare-fun e!483347 () Bool)

(declare-fun tp_is_empty!16919 () Bool)

(assert (=> b!867750 (= e!483347 tp_is_empty!16919)))

(declare-fun b!867751 () Bool)

(declare-fun e!483348 () Bool)

(assert (=> b!867751 (= e!483348 tp_is_empty!16919)))

(declare-fun b!867752 () Bool)

(declare-fun res!589590 () Bool)

(assert (=> b!867752 (=> (not res!589590) (not e!483344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867752 (= res!589590 (validMask!0 mask!1196))))

(declare-fun b!867753 () Bool)

(declare-fun e!483349 () Bool)

(assert (=> b!867753 (= e!483344 e!483349)))

(declare-fun res!589591 () Bool)

(assert (=> b!867753 (=> (not res!589591) (not e!483349))))

(assert (=> b!867753 (= res!589591 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27605 0))(
  ( (V!27606 (val!8507 Int)) )
))
(declare-datatypes ((ValueCell!8020 0))(
  ( (ValueCellFull!8020 (v!10932 V!27605)) (EmptyCell!8020) )
))
(declare-datatypes ((array!50000 0))(
  ( (array!50001 (arr!24031 (Array (_ BitVec 32) ValueCell!8020)) (size!24471 (_ BitVec 32))) )
))
(declare-fun lt!394237 () array!50000)

(declare-fun minValue!654 () V!27605)

(declare-fun zeroValue!654 () V!27605)

(declare-datatypes ((tuple2!11286 0))(
  ( (tuple2!11287 (_1!5654 (_ BitVec 64)) (_2!5654 V!27605)) )
))
(declare-datatypes ((List!17086 0))(
  ( (Nil!17083) (Cons!17082 (h!18213 tuple2!11286) (t!24123 List!17086)) )
))
(declare-datatypes ((ListLongMap!10055 0))(
  ( (ListLongMap!10056 (toList!5043 List!17086)) )
))
(declare-fun lt!394239 () ListLongMap!10055)

(declare-fun getCurrentListMapNoExtraKeys!3012 (array!49998 array!50000 (_ BitVec 32) (_ BitVec 32) V!27605 V!27605 (_ BitVec 32) Int) ListLongMap!10055)

(assert (=> b!867753 (= lt!394239 (getCurrentListMapNoExtraKeys!3012 _keys!868 lt!394237 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27605)

(declare-fun _values!688 () array!50000)

(assert (=> b!867753 (= lt!394237 (array!50001 (store (arr!24031 _values!688) i!612 (ValueCellFull!8020 v!557)) (size!24471 _values!688)))))

(declare-fun lt!394240 () ListLongMap!10055)

(assert (=> b!867753 (= lt!394240 (getCurrentListMapNoExtraKeys!3012 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867754 () Bool)

(declare-fun res!589586 () Bool)

(assert (=> b!867754 (=> (not res!589586) (not e!483344))))

(assert (=> b!867754 (= res!589586 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24470 _keys!868))))))

(declare-fun res!589588 () Bool)

(assert (=> start!73868 (=> (not res!589588) (not e!483344))))

(assert (=> start!73868 (= res!589588 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24470 _keys!868))))))

(assert (=> start!73868 e!483344))

(assert (=> start!73868 tp_is_empty!16919))

(assert (=> start!73868 true))

(assert (=> start!73868 tp!51853))

(declare-fun array_inv!18986 (array!49998) Bool)

(assert (=> start!73868 (array_inv!18986 _keys!868)))

(declare-fun e!483346 () Bool)

(declare-fun array_inv!18987 (array!50000) Bool)

(assert (=> start!73868 (and (array_inv!18987 _values!688) e!483346)))

(declare-fun b!867755 () Bool)

(declare-fun res!589585 () Bool)

(assert (=> b!867755 (=> (not res!589585) (not e!483344))))

(declare-datatypes ((List!17087 0))(
  ( (Nil!17084) (Cons!17083 (h!18214 (_ BitVec 64)) (t!24124 List!17087)) )
))
(declare-fun arrayNoDuplicates!0 (array!49998 (_ BitVec 32) List!17087) Bool)

(assert (=> b!867755 (= res!589585 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17084))))

(declare-fun b!867756 () Bool)

(declare-fun mapRes!26978 () Bool)

(assert (=> b!867756 (= e!483346 (and e!483348 mapRes!26978))))

(declare-fun condMapEmpty!26978 () Bool)

(declare-fun mapDefault!26978 () ValueCell!8020)

