; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73822 () Bool)

(assert start!73822)

(declare-fun b_free!14737 () Bool)

(declare-fun b_next!14737 () Bool)

(assert (=> start!73822 (= b_free!14737 (not b_next!14737))))

(declare-fun tp!51715 () Bool)

(declare-fun b_and!24453 () Bool)

(assert (=> start!73822 (= tp!51715 b_and!24453)))

(declare-fun b!866675 () Bool)

(declare-fun res!588867 () Bool)

(declare-fun e!482776 () Bool)

(assert (=> b!866675 (=> (not res!588867) (not e!482776))))

(declare-datatypes ((array!49906 0))(
  ( (array!49907 (arr!23984 (Array (_ BitVec 32) (_ BitVec 64))) (size!24424 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49906)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49906 (_ BitVec 32)) Bool)

(assert (=> b!866675 (= res!588867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866676 () Bool)

(declare-fun e!482782 () Bool)

(declare-fun tp_is_empty!16873 () Bool)

(assert (=> b!866676 (= e!482782 tp_is_empty!16873)))

(declare-fun b!866677 () Bool)

(declare-fun res!588868 () Bool)

(assert (=> b!866677 (=> (not res!588868) (not e!482776))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866677 (= res!588868 (validKeyInArray!0 k!854))))

(declare-fun b!866678 () Bool)

(declare-fun e!482781 () Bool)

(assert (=> b!866678 (= e!482776 e!482781)))

(declare-fun res!588869 () Bool)

(assert (=> b!866678 (=> (not res!588869) (not e!482781))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866678 (= res!588869 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27545 0))(
  ( (V!27546 (val!8484 Int)) )
))
(declare-datatypes ((ValueCell!7997 0))(
  ( (ValueCellFull!7997 (v!10909 V!27545)) (EmptyCell!7997) )
))
(declare-datatypes ((array!49908 0))(
  ( (array!49909 (arr!23985 (Array (_ BitVec 32) ValueCell!7997)) (size!24425 (_ BitVec 32))) )
))
(declare-fun lt!393349 () array!49908)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11250 0))(
  ( (tuple2!11251 (_1!5636 (_ BitVec 64)) (_2!5636 V!27545)) )
))
(declare-datatypes ((List!17051 0))(
  ( (Nil!17048) (Cons!17047 (h!18178 tuple2!11250) (t!24054 List!17051)) )
))
(declare-datatypes ((ListLongMap!10019 0))(
  ( (ListLongMap!10020 (toList!5025 List!17051)) )
))
(declare-fun lt!393337 () ListLongMap!10019)

(declare-fun minValue!654 () V!27545)

(declare-fun zeroValue!654 () V!27545)

(declare-fun getCurrentListMapNoExtraKeys!2995 (array!49906 array!49908 (_ BitVec 32) (_ BitVec 32) V!27545 V!27545 (_ BitVec 32) Int) ListLongMap!10019)

(assert (=> b!866678 (= lt!393337 (getCurrentListMapNoExtraKeys!2995 _keys!868 lt!393349 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27545)

(declare-fun _values!688 () array!49908)

(assert (=> b!866678 (= lt!393349 (array!49909 (store (arr!23985 _values!688) i!612 (ValueCellFull!7997 v!557)) (size!24425 _values!688)))))

(declare-fun lt!393346 () ListLongMap!10019)

(assert (=> b!866678 (= lt!393346 (getCurrentListMapNoExtraKeys!2995 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866679 () Bool)

(declare-fun res!588866 () Bool)

(assert (=> b!866679 (=> (not res!588866) (not e!482776))))

(assert (=> b!866679 (= res!588866 (and (= (size!24425 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24424 _keys!868) (size!24425 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!588863 () Bool)

(assert (=> start!73822 (=> (not res!588863) (not e!482776))))

(assert (=> start!73822 (= res!588863 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24424 _keys!868))))))

(assert (=> start!73822 e!482776))

(assert (=> start!73822 tp_is_empty!16873))

(assert (=> start!73822 true))

(assert (=> start!73822 tp!51715))

(declare-fun array_inv!18954 (array!49906) Bool)

(assert (=> start!73822 (array_inv!18954 _keys!868)))

(declare-fun e!482777 () Bool)

(declare-fun array_inv!18955 (array!49908) Bool)

(assert (=> start!73822 (and (array_inv!18955 _values!688) e!482777)))

(declare-fun b!866680 () Bool)

(declare-fun mapRes!26909 () Bool)

(assert (=> b!866680 (= e!482777 (and e!482782 mapRes!26909))))

(declare-fun condMapEmpty!26909 () Bool)

(declare-fun mapDefault!26909 () ValueCell!7997)

