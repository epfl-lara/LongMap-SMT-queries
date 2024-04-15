; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73372 () Bool)

(assert start!73372)

(declare-fun b_free!14305 () Bool)

(declare-fun b_next!14305 () Bool)

(assert (=> start!73372 (= b_free!14305 (not b_next!14305))))

(declare-fun tp!50420 () Bool)

(declare-fun b_and!23635 () Bool)

(assert (=> start!73372 (= tp!50420 b_and!23635)))

(declare-fun b!856375 () Bool)

(declare-fun res!581722 () Bool)

(declare-fun e!477337 () Bool)

(assert (=> b!856375 (=> (not res!581722) (not e!477337))))

(declare-datatypes ((array!49059 0))(
  ( (array!49060 (arr!23561 (Array (_ BitVec 32) (_ BitVec 64))) (size!24003 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49059)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49059 (_ BitVec 32)) Bool)

(assert (=> b!856375 (= res!581722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856376 () Bool)

(declare-fun res!581717 () Bool)

(assert (=> b!856376 (=> (not res!581717) (not e!477337))))

(declare-datatypes ((V!26969 0))(
  ( (V!26970 (val!8268 Int)) )
))
(declare-datatypes ((ValueCell!7781 0))(
  ( (ValueCellFull!7781 (v!10687 V!26969)) (EmptyCell!7781) )
))
(declare-datatypes ((array!49061 0))(
  ( (array!49062 (arr!23562 (Array (_ BitVec 32) ValueCell!7781)) (size!24004 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49061)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!856376 (= res!581717 (and (= (size!24004 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24003 _keys!868) (size!24004 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856377 () Bool)

(declare-fun res!581716 () Bool)

(assert (=> b!856377 (=> (not res!581716) (not e!477337))))

(declare-datatypes ((List!16715 0))(
  ( (Nil!16712) (Cons!16711 (h!17842 (_ BitVec 64)) (t!23347 List!16715)) )
))
(declare-fun arrayNoDuplicates!0 (array!49059 (_ BitVec 32) List!16715) Bool)

(assert (=> b!856377 (= res!581716 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16712))))

(declare-fun b!856378 () Bool)

(declare-fun res!581723 () Bool)

(assert (=> b!856378 (=> (not res!581723) (not e!477337))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856378 (= res!581723 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24003 _keys!868))))))

(declare-fun b!856380 () Bool)

(declare-fun res!581719 () Bool)

(assert (=> b!856380 (=> (not res!581719) (not e!477337))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856380 (= res!581719 (and (= (select (arr!23561 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856381 () Bool)

(declare-fun res!581720 () Bool)

(assert (=> b!856381 (=> (not res!581720) (not e!477337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856381 (= res!581720 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26261 () Bool)

(declare-fun mapRes!26261 () Bool)

(declare-fun tp!50419 () Bool)

(declare-fun e!477338 () Bool)

(assert (=> mapNonEmpty!26261 (= mapRes!26261 (and tp!50419 e!477338))))

(declare-fun mapValue!26261 () ValueCell!7781)

(declare-fun mapRest!26261 () (Array (_ BitVec 32) ValueCell!7781))

(declare-fun mapKey!26261 () (_ BitVec 32))

(assert (=> mapNonEmpty!26261 (= (arr!23562 _values!688) (store mapRest!26261 mapKey!26261 mapValue!26261))))

(declare-fun b!856382 () Bool)

(declare-fun res!581724 () Bool)

(assert (=> b!856382 (=> (not res!581724) (not e!477337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856382 (= res!581724 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26261 () Bool)

(assert (=> mapIsEmpty!26261 mapRes!26261))

(declare-fun b!856383 () Bool)

(declare-fun tp_is_empty!16441 () Bool)

(assert (=> b!856383 (= e!477338 tp_is_empty!16441)))

(declare-fun b!856384 () Bool)

(declare-fun e!477339 () Bool)

(declare-fun e!477341 () Bool)

(assert (=> b!856384 (= e!477339 (and e!477341 mapRes!26261))))

(declare-fun condMapEmpty!26261 () Bool)

(declare-fun mapDefault!26261 () ValueCell!7781)

(assert (=> b!856384 (= condMapEmpty!26261 (= (arr!23562 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7781)) mapDefault!26261)))))

(declare-fun res!581718 () Bool)

(assert (=> start!73372 (=> (not res!581718) (not e!477337))))

(assert (=> start!73372 (= res!581718 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24003 _keys!868))))))

(assert (=> start!73372 e!477337))

(assert (=> start!73372 tp_is_empty!16441))

(assert (=> start!73372 true))

(assert (=> start!73372 tp!50420))

(declare-fun array_inv!18728 (array!49059) Bool)

(assert (=> start!73372 (array_inv!18728 _keys!868)))

(declare-fun array_inv!18729 (array!49061) Bool)

(assert (=> start!73372 (and (array_inv!18729 _values!688) e!477339)))

(declare-fun b!856379 () Bool)

(declare-fun e!477342 () Bool)

(assert (=> b!856379 (= e!477337 e!477342)))

(declare-fun res!581721 () Bool)

(assert (=> b!856379 (=> (not res!581721) (not e!477342))))

(assert (=> b!856379 (= res!581721 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385780 () array!49061)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10910 0))(
  ( (tuple2!10911 (_1!5466 (_ BitVec 64)) (_2!5466 V!26969)) )
))
(declare-datatypes ((List!16716 0))(
  ( (Nil!16713) (Cons!16712 (h!17843 tuple2!10910) (t!23348 List!16716)) )
))
(declare-datatypes ((ListLongMap!9669 0))(
  ( (ListLongMap!9670 (toList!4850 List!16716)) )
))
(declare-fun lt!385779 () ListLongMap!9669)

(declare-fun minValue!654 () V!26969)

(declare-fun zeroValue!654 () V!26969)

(declare-fun getCurrentListMapNoExtraKeys!2857 (array!49059 array!49061 (_ BitVec 32) (_ BitVec 32) V!26969 V!26969 (_ BitVec 32) Int) ListLongMap!9669)

(assert (=> b!856379 (= lt!385779 (getCurrentListMapNoExtraKeys!2857 _keys!868 lt!385780 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26969)

(assert (=> b!856379 (= lt!385780 (array!49062 (store (arr!23562 _values!688) i!612 (ValueCellFull!7781 v!557)) (size!24004 _values!688)))))

(declare-fun lt!385781 () ListLongMap!9669)

(assert (=> b!856379 (= lt!385781 (getCurrentListMapNoExtraKeys!2857 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856385 () Bool)

(assert (=> b!856385 (= e!477342 (not true))))

(declare-fun +!2228 (ListLongMap!9669 tuple2!10910) ListLongMap!9669)

(assert (=> b!856385 (= (getCurrentListMapNoExtraKeys!2857 _keys!868 lt!385780 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2228 (getCurrentListMapNoExtraKeys!2857 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10911 k0!854 v!557)))))

(declare-datatypes ((Unit!29125 0))(
  ( (Unit!29126) )
))
(declare-fun lt!385778 () Unit!29125)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!425 (array!49059 array!49061 (_ BitVec 32) (_ BitVec 32) V!26969 V!26969 (_ BitVec 32) (_ BitVec 64) V!26969 (_ BitVec 32) Int) Unit!29125)

(assert (=> b!856385 (= lt!385778 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!425 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856386 () Bool)

(assert (=> b!856386 (= e!477341 tp_is_empty!16441)))

(assert (= (and start!73372 res!581718) b!856382))

(assert (= (and b!856382 res!581724) b!856376))

(assert (= (and b!856376 res!581717) b!856375))

(assert (= (and b!856375 res!581722) b!856377))

(assert (= (and b!856377 res!581716) b!856378))

(assert (= (and b!856378 res!581723) b!856381))

(assert (= (and b!856381 res!581720) b!856380))

(assert (= (and b!856380 res!581719) b!856379))

(assert (= (and b!856379 res!581721) b!856385))

(assert (= (and b!856384 condMapEmpty!26261) mapIsEmpty!26261))

(assert (= (and b!856384 (not condMapEmpty!26261)) mapNonEmpty!26261))

(get-info :version)

(assert (= (and mapNonEmpty!26261 ((_ is ValueCellFull!7781) mapValue!26261)) b!856383))

(assert (= (and b!856384 ((_ is ValueCellFull!7781) mapDefault!26261)) b!856386))

(assert (= start!73372 b!856384))

(declare-fun m!796773 () Bool)

(assert (=> mapNonEmpty!26261 m!796773))

(declare-fun m!796775 () Bool)

(assert (=> b!856375 m!796775))

(declare-fun m!796777 () Bool)

(assert (=> b!856380 m!796777))

(declare-fun m!796779 () Bool)

(assert (=> b!856382 m!796779))

(declare-fun m!796781 () Bool)

(assert (=> b!856385 m!796781))

(declare-fun m!796783 () Bool)

(assert (=> b!856385 m!796783))

(assert (=> b!856385 m!796783))

(declare-fun m!796785 () Bool)

(assert (=> b!856385 m!796785))

(declare-fun m!796787 () Bool)

(assert (=> b!856385 m!796787))

(declare-fun m!796789 () Bool)

(assert (=> b!856377 m!796789))

(declare-fun m!796791 () Bool)

(assert (=> b!856381 m!796791))

(declare-fun m!796793 () Bool)

(assert (=> start!73372 m!796793))

(declare-fun m!796795 () Bool)

(assert (=> start!73372 m!796795))

(declare-fun m!796797 () Bool)

(assert (=> b!856379 m!796797))

(declare-fun m!796799 () Bool)

(assert (=> b!856379 m!796799))

(declare-fun m!796801 () Bool)

(assert (=> b!856379 m!796801))

(check-sat tp_is_empty!16441 (not b!856379) (not mapNonEmpty!26261) (not b!856381) (not start!73372) (not b!856377) b_and!23635 (not b!856385) (not b!856382) (not b_next!14305) (not b!856375))
(check-sat b_and!23635 (not b_next!14305))
