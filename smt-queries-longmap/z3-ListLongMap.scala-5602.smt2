; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73398 () Bool)

(assert start!73398)

(declare-fun b_free!14313 () Bool)

(declare-fun b_next!14313 () Bool)

(assert (=> start!73398 (= b_free!14313 (not b_next!14313))))

(declare-fun tp!50443 () Bool)

(declare-fun b_and!23669 () Bool)

(assert (=> start!73398 (= tp!50443 b_and!23669)))

(declare-fun mapIsEmpty!26273 () Bool)

(declare-fun mapRes!26273 () Bool)

(assert (=> mapIsEmpty!26273 mapRes!26273))

(declare-fun b!856758 () Bool)

(declare-fun res!581936 () Bool)

(declare-fun e!477561 () Bool)

(assert (=> b!856758 (=> (not res!581936) (not e!477561))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856758 (= res!581936 (validKeyInArray!0 k0!854))))

(declare-fun b!856759 () Bool)

(declare-fun e!477559 () Bool)

(declare-fun tp_is_empty!16449 () Bool)

(assert (=> b!856759 (= e!477559 tp_is_empty!16449)))

(declare-fun b!856760 () Bool)

(declare-fun res!581935 () Bool)

(assert (=> b!856760 (=> (not res!581935) (not e!477561))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856760 (= res!581935 (validMask!0 mask!1196))))

(declare-fun b!856761 () Bool)

(declare-fun res!581937 () Bool)

(assert (=> b!856761 (=> (not res!581937) (not e!477561))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49090 0))(
  ( (array!49091 (arr!23576 (Array (_ BitVec 32) (_ BitVec 64))) (size!24016 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49090)

(assert (=> b!856761 (= res!581937 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24016 _keys!868))))))

(declare-fun b!856762 () Bool)

(declare-fun res!581938 () Bool)

(assert (=> b!856762 (=> (not res!581938) (not e!477561))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26979 0))(
  ( (V!26980 (val!8272 Int)) )
))
(declare-datatypes ((ValueCell!7785 0))(
  ( (ValueCellFull!7785 (v!10697 V!26979)) (EmptyCell!7785) )
))
(declare-datatypes ((array!49092 0))(
  ( (array!49093 (arr!23577 (Array (_ BitVec 32) ValueCell!7785)) (size!24017 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49092)

(assert (=> b!856762 (= res!581938 (and (= (size!24017 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24016 _keys!868) (size!24017 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856763 () Bool)

(declare-fun e!477557 () Bool)

(assert (=> b!856763 (= e!477557 tp_is_empty!16449)))

(declare-fun b!856764 () Bool)

(declare-fun e!477558 () Bool)

(assert (=> b!856764 (= e!477558 (and e!477559 mapRes!26273))))

(declare-fun condMapEmpty!26273 () Bool)

(declare-fun mapDefault!26273 () ValueCell!7785)

(assert (=> b!856764 (= condMapEmpty!26273 (= (arr!23577 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7785)) mapDefault!26273)))))

(declare-fun b!856765 () Bool)

(declare-fun e!477560 () Bool)

(assert (=> b!856765 (= e!477561 e!477560)))

(declare-fun res!581942 () Bool)

(assert (=> b!856765 (=> (not res!581942) (not e!477560))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856765 (= res!581942 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!10908 0))(
  ( (tuple2!10909 (_1!5465 (_ BitVec 64)) (_2!5465 V!26979)) )
))
(declare-datatypes ((List!16718 0))(
  ( (Nil!16715) (Cons!16714 (h!17845 tuple2!10908) (t!23359 List!16718)) )
))
(declare-datatypes ((ListLongMap!9677 0))(
  ( (ListLongMap!9678 (toList!4854 List!16718)) )
))
(declare-fun lt!386062 () ListLongMap!9677)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386063 () array!49092)

(declare-fun minValue!654 () V!26979)

(declare-fun zeroValue!654 () V!26979)

(declare-fun getCurrentListMapNoExtraKeys!2835 (array!49090 array!49092 (_ BitVec 32) (_ BitVec 32) V!26979 V!26979 (_ BitVec 32) Int) ListLongMap!9677)

(assert (=> b!856765 (= lt!386062 (getCurrentListMapNoExtraKeys!2835 _keys!868 lt!386063 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26979)

(assert (=> b!856765 (= lt!386063 (array!49093 (store (arr!23577 _values!688) i!612 (ValueCellFull!7785 v!557)) (size!24017 _values!688)))))

(declare-fun lt!386064 () ListLongMap!9677)

(assert (=> b!856765 (= lt!386064 (getCurrentListMapNoExtraKeys!2835 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856766 () Bool)

(declare-fun res!581941 () Bool)

(assert (=> b!856766 (=> (not res!581941) (not e!477561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49090 (_ BitVec 32)) Bool)

(assert (=> b!856766 (= res!581941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856767 () Bool)

(assert (=> b!856767 (= e!477560 (not true))))

(declare-fun +!2210 (ListLongMap!9677 tuple2!10908) ListLongMap!9677)

(assert (=> b!856767 (= (getCurrentListMapNoExtraKeys!2835 _keys!868 lt!386063 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2210 (getCurrentListMapNoExtraKeys!2835 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10909 k0!854 v!557)))))

(declare-datatypes ((Unit!29207 0))(
  ( (Unit!29208) )
))
(declare-fun lt!386065 () Unit!29207)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!431 (array!49090 array!49092 (_ BitVec 32) (_ BitVec 32) V!26979 V!26979 (_ BitVec 32) (_ BitVec 64) V!26979 (_ BitVec 32) Int) Unit!29207)

(assert (=> b!856767 (= lt!386065 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!431 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856768 () Bool)

(declare-fun res!581940 () Bool)

(assert (=> b!856768 (=> (not res!581940) (not e!477561))))

(assert (=> b!856768 (= res!581940 (and (= (select (arr!23576 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856769 () Bool)

(declare-fun res!581934 () Bool)

(assert (=> b!856769 (=> (not res!581934) (not e!477561))))

(declare-datatypes ((List!16719 0))(
  ( (Nil!16716) (Cons!16715 (h!17846 (_ BitVec 64)) (t!23360 List!16719)) )
))
(declare-fun arrayNoDuplicates!0 (array!49090 (_ BitVec 32) List!16719) Bool)

(assert (=> b!856769 (= res!581934 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16716))))

(declare-fun mapNonEmpty!26273 () Bool)

(declare-fun tp!50442 () Bool)

(assert (=> mapNonEmpty!26273 (= mapRes!26273 (and tp!50442 e!477557))))

(declare-fun mapValue!26273 () ValueCell!7785)

(declare-fun mapRest!26273 () (Array (_ BitVec 32) ValueCell!7785))

(declare-fun mapKey!26273 () (_ BitVec 32))

(assert (=> mapNonEmpty!26273 (= (arr!23577 _values!688) (store mapRest!26273 mapKey!26273 mapValue!26273))))

(declare-fun res!581939 () Bool)

(assert (=> start!73398 (=> (not res!581939) (not e!477561))))

(assert (=> start!73398 (= res!581939 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24016 _keys!868))))))

(assert (=> start!73398 e!477561))

(assert (=> start!73398 tp_is_empty!16449))

(assert (=> start!73398 true))

(assert (=> start!73398 tp!50443))

(declare-fun array_inv!18672 (array!49090) Bool)

(assert (=> start!73398 (array_inv!18672 _keys!868)))

(declare-fun array_inv!18673 (array!49092) Bool)

(assert (=> start!73398 (and (array_inv!18673 _values!688) e!477558)))

(assert (= (and start!73398 res!581939) b!856760))

(assert (= (and b!856760 res!581935) b!856762))

(assert (= (and b!856762 res!581938) b!856766))

(assert (= (and b!856766 res!581941) b!856769))

(assert (= (and b!856769 res!581934) b!856761))

(assert (= (and b!856761 res!581937) b!856758))

(assert (= (and b!856758 res!581936) b!856768))

(assert (= (and b!856768 res!581940) b!856765))

(assert (= (and b!856765 res!581942) b!856767))

(assert (= (and b!856764 condMapEmpty!26273) mapIsEmpty!26273))

(assert (= (and b!856764 (not condMapEmpty!26273)) mapNonEmpty!26273))

(get-info :version)

(assert (= (and mapNonEmpty!26273 ((_ is ValueCellFull!7785) mapValue!26273)) b!856763))

(assert (= (and b!856764 ((_ is ValueCellFull!7785) mapDefault!26273)) b!856759))

(assert (= start!73398 b!856764))

(declare-fun m!797651 () Bool)

(assert (=> b!856768 m!797651))

(declare-fun m!797653 () Bool)

(assert (=> b!856758 m!797653))

(declare-fun m!797655 () Bool)

(assert (=> start!73398 m!797655))

(declare-fun m!797657 () Bool)

(assert (=> start!73398 m!797657))

(declare-fun m!797659 () Bool)

(assert (=> b!856767 m!797659))

(declare-fun m!797661 () Bool)

(assert (=> b!856767 m!797661))

(assert (=> b!856767 m!797661))

(declare-fun m!797663 () Bool)

(assert (=> b!856767 m!797663))

(declare-fun m!797665 () Bool)

(assert (=> b!856767 m!797665))

(declare-fun m!797667 () Bool)

(assert (=> b!856766 m!797667))

(declare-fun m!797669 () Bool)

(assert (=> mapNonEmpty!26273 m!797669))

(declare-fun m!797671 () Bool)

(assert (=> b!856760 m!797671))

(declare-fun m!797673 () Bool)

(assert (=> b!856769 m!797673))

(declare-fun m!797675 () Bool)

(assert (=> b!856765 m!797675))

(declare-fun m!797677 () Bool)

(assert (=> b!856765 m!797677))

(declare-fun m!797679 () Bool)

(assert (=> b!856765 m!797679))

(check-sat (not b_next!14313) (not b!856769) (not b!856767) (not start!73398) tp_is_empty!16449 (not b!856758) (not b!856765) (not mapNonEmpty!26273) b_and!23669 (not b!856766) (not b!856760))
(check-sat b_and!23669 (not b_next!14313))
