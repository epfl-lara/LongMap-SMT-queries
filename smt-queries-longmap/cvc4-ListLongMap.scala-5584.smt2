; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73292 () Bool)

(assert start!73292)

(declare-fun b_free!14207 () Bool)

(declare-fun b_next!14207 () Bool)

(assert (=> start!73292 (= b_free!14207 (not b_next!14207))))

(declare-fun tp!50125 () Bool)

(declare-fun b_and!23563 () Bool)

(assert (=> start!73292 (= tp!50125 b_and!23563)))

(declare-fun b!854941 () Bool)

(declare-fun e!476697 () Bool)

(declare-fun tp_is_empty!16343 () Bool)

(assert (=> b!854941 (= e!476697 tp_is_empty!16343)))

(declare-fun b!854942 () Bool)

(declare-fun res!580594 () Bool)

(declare-fun e!476696 () Bool)

(assert (=> b!854942 (=> (not res!580594) (not e!476696))))

(declare-datatypes ((array!48882 0))(
  ( (array!48883 (arr!23472 (Array (_ BitVec 32) (_ BitVec 64))) (size!23912 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48882)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48882 (_ BitVec 32)) Bool)

(assert (=> b!854942 (= res!580594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854943 () Bool)

(declare-fun res!580597 () Bool)

(assert (=> b!854943 (=> (not res!580597) (not e!476696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854943 (= res!580597 (validMask!0 mask!1196))))

(declare-fun b!854944 () Bool)

(declare-fun res!580601 () Bool)

(assert (=> b!854944 (=> (not res!580601) (not e!476696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854944 (= res!580601 (and (= (select (arr!23472 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26114 () Bool)

(declare-fun mapRes!26114 () Bool)

(assert (=> mapIsEmpty!26114 mapRes!26114))

(declare-fun b!854945 () Bool)

(declare-fun res!580600 () Bool)

(assert (=> b!854945 (=> (not res!580600) (not e!476696))))

(declare-datatypes ((List!16640 0))(
  ( (Nil!16637) (Cons!16636 (h!17767 (_ BitVec 64)) (t!23281 List!16640)) )
))
(declare-fun arrayNoDuplicates!0 (array!48882 (_ BitVec 32) List!16640) Bool)

(assert (=> b!854945 (= res!580600 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16637))))

(declare-fun b!854946 () Bool)

(assert (=> b!854946 (= e!476696 false)))

(declare-datatypes ((V!26837 0))(
  ( (V!26838 (val!8219 Int)) )
))
(declare-fun v!557 () V!26837)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7732 0))(
  ( (ValueCellFull!7732 (v!10644 V!26837)) (EmptyCell!7732) )
))
(declare-datatypes ((array!48884 0))(
  ( (array!48885 (arr!23473 (Array (_ BitVec 32) ValueCell!7732)) (size!23913 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48884)

(declare-fun minValue!654 () V!26837)

(declare-fun zeroValue!654 () V!26837)

(declare-datatypes ((tuple2!10826 0))(
  ( (tuple2!10827 (_1!5424 (_ BitVec 64)) (_2!5424 V!26837)) )
))
(declare-datatypes ((List!16641 0))(
  ( (Nil!16638) (Cons!16637 (h!17768 tuple2!10826) (t!23282 List!16641)) )
))
(declare-datatypes ((ListLongMap!9595 0))(
  ( (ListLongMap!9596 (toList!4813 List!16641)) )
))
(declare-fun lt!385609 () ListLongMap!9595)

(declare-fun getCurrentListMapNoExtraKeys!2794 (array!48882 array!48884 (_ BitVec 32) (_ BitVec 32) V!26837 V!26837 (_ BitVec 32) Int) ListLongMap!9595)

(assert (=> b!854946 (= lt!385609 (getCurrentListMapNoExtraKeys!2794 _keys!868 (array!48885 (store (arr!23473 _values!688) i!612 (ValueCellFull!7732 v!557)) (size!23913 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385608 () ListLongMap!9595)

(assert (=> b!854946 (= lt!385608 (getCurrentListMapNoExtraKeys!2794 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!580595 () Bool)

(assert (=> start!73292 (=> (not res!580595) (not e!476696))))

(assert (=> start!73292 (= res!580595 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23912 _keys!868))))))

(assert (=> start!73292 e!476696))

(assert (=> start!73292 tp_is_empty!16343))

(assert (=> start!73292 true))

(assert (=> start!73292 tp!50125))

(declare-fun array_inv!18598 (array!48882) Bool)

(assert (=> start!73292 (array_inv!18598 _keys!868)))

(declare-fun e!476698 () Bool)

(declare-fun array_inv!18599 (array!48884) Bool)

(assert (=> start!73292 (and (array_inv!18599 _values!688) e!476698)))

(declare-fun b!854947 () Bool)

(declare-fun res!580598 () Bool)

(assert (=> b!854947 (=> (not res!580598) (not e!476696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854947 (= res!580598 (validKeyInArray!0 k!854))))

(declare-fun b!854948 () Bool)

(declare-fun e!476694 () Bool)

(assert (=> b!854948 (= e!476694 tp_is_empty!16343)))

(declare-fun b!854949 () Bool)

(declare-fun res!580599 () Bool)

(assert (=> b!854949 (=> (not res!580599) (not e!476696))))

(assert (=> b!854949 (= res!580599 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23912 _keys!868))))))

(declare-fun b!854950 () Bool)

(assert (=> b!854950 (= e!476698 (and e!476694 mapRes!26114))))

(declare-fun condMapEmpty!26114 () Bool)

(declare-fun mapDefault!26114 () ValueCell!7732)

