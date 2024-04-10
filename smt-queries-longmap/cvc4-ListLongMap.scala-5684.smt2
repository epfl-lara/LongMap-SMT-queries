; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73892 () Bool)

(assert start!73892)

(declare-fun b_free!14807 () Bool)

(declare-fun b_next!14807 () Bool)

(assert (=> start!73892 (= b_free!14807 (not b_next!14807))))

(declare-fun tp!51925 () Bool)

(declare-fun b_and!24559 () Bool)

(assert (=> start!73892 (= tp!51925 b_and!24559)))

(declare-fun b!868179 () Bool)

(declare-fun res!589914 () Bool)

(declare-fun e!483561 () Bool)

(assert (=> b!868179 (=> (not res!589914) (not e!483561))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868179 (= res!589914 (validMask!0 mask!1196))))

(declare-fun b!868180 () Bool)

(declare-fun e!483563 () Bool)

(declare-fun tp_is_empty!16943 () Bool)

(assert (=> b!868180 (= e!483563 tp_is_empty!16943)))

(declare-fun b!868181 () Bool)

(declare-fun res!589908 () Bool)

(assert (=> b!868181 (=> (not res!589908) (not e!483561))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50042 0))(
  ( (array!50043 (arr!24052 (Array (_ BitVec 32) (_ BitVec 64))) (size!24492 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50042)

(assert (=> b!868181 (= res!589908 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24492 _keys!868))))))

(declare-fun b!868182 () Bool)

(declare-fun res!589909 () Bool)

(assert (=> b!868182 (=> (not res!589909) (not e!483561))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27637 0))(
  ( (V!27638 (val!8519 Int)) )
))
(declare-datatypes ((ValueCell!8032 0))(
  ( (ValueCellFull!8032 (v!10944 V!27637)) (EmptyCell!8032) )
))
(declare-datatypes ((array!50044 0))(
  ( (array!50045 (arr!24053 (Array (_ BitVec 32) ValueCell!8032)) (size!24493 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50044)

(assert (=> b!868182 (= res!589909 (and (= (size!24493 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24492 _keys!868) (size!24493 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27014 () Bool)

(declare-fun mapRes!27014 () Bool)

(declare-fun tp!51924 () Bool)

(assert (=> mapNonEmpty!27014 (= mapRes!27014 (and tp!51924 e!483563))))

(declare-fun mapKey!27014 () (_ BitVec 32))

(declare-fun mapValue!27014 () ValueCell!8032)

(declare-fun mapRest!27014 () (Array (_ BitVec 32) ValueCell!8032))

(assert (=> mapNonEmpty!27014 (= (arr!24053 _values!688) (store mapRest!27014 mapKey!27014 mapValue!27014))))

(declare-fun b!868183 () Bool)

(declare-fun res!589911 () Bool)

(assert (=> b!868183 (=> (not res!589911) (not e!483561))))

(declare-datatypes ((List!17103 0))(
  ( (Nil!17100) (Cons!17099 (h!18230 (_ BitVec 64)) (t!24140 List!17103)) )
))
(declare-fun arrayNoDuplicates!0 (array!50042 (_ BitVec 32) List!17103) Bool)

(assert (=> b!868183 (= res!589911 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17100))))

(declare-fun b!868184 () Bool)

(declare-fun res!589910 () Bool)

(assert (=> b!868184 (=> (not res!589910) (not e!483561))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868184 (= res!589910 (validKeyInArray!0 k!854))))

(declare-fun b!868185 () Bool)

(declare-fun e!483560 () Bool)

(assert (=> b!868185 (= e!483560 (not true))))

(declare-fun v!557 () V!27637)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27637)

(declare-fun zeroValue!654 () V!27637)

(declare-fun lt!394383 () array!50044)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!11306 0))(
  ( (tuple2!11307 (_1!5664 (_ BitVec 64)) (_2!5664 V!27637)) )
))
(declare-datatypes ((List!17104 0))(
  ( (Nil!17101) (Cons!17100 (h!18231 tuple2!11306) (t!24141 List!17104)) )
))
(declare-datatypes ((ListLongMap!10075 0))(
  ( (ListLongMap!10076 (toList!5053 List!17104)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3022 (array!50042 array!50044 (_ BitVec 32) (_ BitVec 32) V!27637 V!27637 (_ BitVec 32) Int) ListLongMap!10075)

(declare-fun +!2397 (ListLongMap!10075 tuple2!11306) ListLongMap!10075)

(assert (=> b!868185 (= (getCurrentListMapNoExtraKeys!3022 _keys!868 lt!394383 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2397 (getCurrentListMapNoExtraKeys!3022 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11307 k!854 v!557)))))

(declare-datatypes ((Unit!29792 0))(
  ( (Unit!29793) )
))
(declare-fun lt!394382 () Unit!29792)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!591 (array!50042 array!50044 (_ BitVec 32) (_ BitVec 32) V!27637 V!27637 (_ BitVec 32) (_ BitVec 64) V!27637 (_ BitVec 32) Int) Unit!29792)

(assert (=> b!868185 (= lt!394382 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!591 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!589915 () Bool)

(assert (=> start!73892 (=> (not res!589915) (not e!483561))))

(assert (=> start!73892 (= res!589915 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24492 _keys!868))))))

(assert (=> start!73892 e!483561))

(assert (=> start!73892 tp_is_empty!16943))

(assert (=> start!73892 true))

(assert (=> start!73892 tp!51925))

(declare-fun array_inv!19006 (array!50042) Bool)

(assert (=> start!73892 (array_inv!19006 _keys!868)))

(declare-fun e!483565 () Bool)

(declare-fun array_inv!19007 (array!50044) Bool)

(assert (=> start!73892 (and (array_inv!19007 _values!688) e!483565)))

(declare-fun b!868186 () Bool)

(assert (=> b!868186 (= e!483561 e!483560)))

(declare-fun res!589913 () Bool)

(assert (=> b!868186 (=> (not res!589913) (not e!483560))))

(assert (=> b!868186 (= res!589913 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394381 () ListLongMap!10075)

(assert (=> b!868186 (= lt!394381 (getCurrentListMapNoExtraKeys!3022 _keys!868 lt!394383 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868186 (= lt!394383 (array!50045 (store (arr!24053 _values!688) i!612 (ValueCellFull!8032 v!557)) (size!24493 _values!688)))))

(declare-fun lt!394384 () ListLongMap!10075)

(assert (=> b!868186 (= lt!394384 (getCurrentListMapNoExtraKeys!3022 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27014 () Bool)

(assert (=> mapIsEmpty!27014 mapRes!27014))

(declare-fun b!868187 () Bool)

(declare-fun res!589912 () Bool)

(assert (=> b!868187 (=> (not res!589912) (not e!483561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50042 (_ BitVec 32)) Bool)

(assert (=> b!868187 (= res!589912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868188 () Bool)

(declare-fun e!483564 () Bool)

(assert (=> b!868188 (= e!483565 (and e!483564 mapRes!27014))))

(declare-fun condMapEmpty!27014 () Bool)

(declare-fun mapDefault!27014 () ValueCell!8032)

