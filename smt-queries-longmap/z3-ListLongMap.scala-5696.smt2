; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73962 () Bool)

(assert start!73962)

(declare-fun b_free!14877 () Bool)

(declare-fun b_next!14877 () Bool)

(assert (=> start!73962 (= b_free!14877 (not b_next!14877))))

(declare-fun tp!52134 () Bool)

(declare-fun b_and!24629 () Bool)

(assert (=> start!73962 (= tp!52134 b_and!24629)))

(declare-fun b!869439 () Bool)

(declare-fun res!590860 () Bool)

(declare-fun e!484193 () Bool)

(assert (=> b!869439 (=> (not res!590860) (not e!484193))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50174 0))(
  ( (array!50175 (arr!24118 (Array (_ BitVec 32) (_ BitVec 64))) (size!24558 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50174)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869439 (= res!590860 (and (= (select (arr!24118 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869440 () Bool)

(declare-fun res!590855 () Bool)

(assert (=> b!869440 (=> (not res!590855) (not e!484193))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50174 (_ BitVec 32)) Bool)

(assert (=> b!869440 (= res!590855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869441 () Bool)

(declare-fun e!484191 () Bool)

(assert (=> b!869441 (= e!484193 e!484191)))

(declare-fun res!590859 () Bool)

(assert (=> b!869441 (=> (not res!590859) (not e!484191))))

(assert (=> b!869441 (= res!590859 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27731 0))(
  ( (V!27732 (val!8554 Int)) )
))
(declare-datatypes ((tuple2!11362 0))(
  ( (tuple2!11363 (_1!5692 (_ BitVec 64)) (_2!5692 V!27731)) )
))
(declare-datatypes ((List!17152 0))(
  ( (Nil!17149) (Cons!17148 (h!18279 tuple2!11362) (t!24189 List!17152)) )
))
(declare-datatypes ((ListLongMap!10131 0))(
  ( (ListLongMap!10132 (toList!5081 List!17152)) )
))
(declare-fun lt!394803 () ListLongMap!10131)

(declare-datatypes ((ValueCell!8067 0))(
  ( (ValueCellFull!8067 (v!10979 V!27731)) (EmptyCell!8067) )
))
(declare-datatypes ((array!50176 0))(
  ( (array!50177 (arr!24119 (Array (_ BitVec 32) ValueCell!8067)) (size!24559 (_ BitVec 32))) )
))
(declare-fun lt!394802 () array!50176)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27731)

(declare-fun zeroValue!654 () V!27731)

(declare-fun getCurrentListMapNoExtraKeys!3050 (array!50174 array!50176 (_ BitVec 32) (_ BitVec 32) V!27731 V!27731 (_ BitVec 32) Int) ListLongMap!10131)

(assert (=> b!869441 (= lt!394803 (getCurrentListMapNoExtraKeys!3050 _keys!868 lt!394802 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27731)

(declare-fun _values!688 () array!50176)

(assert (=> b!869441 (= lt!394802 (array!50177 (store (arr!24119 _values!688) i!612 (ValueCellFull!8067 v!557)) (size!24559 _values!688)))))

(declare-fun lt!394801 () ListLongMap!10131)

(assert (=> b!869441 (= lt!394801 (getCurrentListMapNoExtraKeys!3050 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27119 () Bool)

(declare-fun mapRes!27119 () Bool)

(assert (=> mapIsEmpty!27119 mapRes!27119))

(declare-fun b!869442 () Bool)

(declare-fun res!590853 () Bool)

(assert (=> b!869442 (=> (not res!590853) (not e!484193))))

(assert (=> b!869442 (= res!590853 (and (= (size!24559 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24558 _keys!868) (size!24559 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869443 () Bool)

(declare-fun res!590854 () Bool)

(assert (=> b!869443 (=> (not res!590854) (not e!484193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869443 (= res!590854 (validMask!0 mask!1196))))

(declare-fun b!869444 () Bool)

(declare-fun res!590861 () Bool)

(assert (=> b!869444 (=> (not res!590861) (not e!484193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869444 (= res!590861 (validKeyInArray!0 k0!854))))

(declare-fun b!869445 () Bool)

(assert (=> b!869445 (= e!484191 (not true))))

(declare-fun +!2421 (ListLongMap!10131 tuple2!11362) ListLongMap!10131)

(assert (=> b!869445 (= (getCurrentListMapNoExtraKeys!3050 _keys!868 lt!394802 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2421 (getCurrentListMapNoExtraKeys!3050 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11363 k0!854 v!557)))))

(declare-datatypes ((Unit!29840 0))(
  ( (Unit!29841) )
))
(declare-fun lt!394804 () Unit!29840)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!615 (array!50174 array!50176 (_ BitVec 32) (_ BitVec 32) V!27731 V!27731 (_ BitVec 32) (_ BitVec 64) V!27731 (_ BitVec 32) Int) Unit!29840)

(assert (=> b!869445 (= lt!394804 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!615 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869446 () Bool)

(declare-fun res!590857 () Bool)

(assert (=> b!869446 (=> (not res!590857) (not e!484193))))

(assert (=> b!869446 (= res!590857 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24558 _keys!868))))))

(declare-fun b!869447 () Bool)

(declare-fun e!484195 () Bool)

(declare-fun e!484194 () Bool)

(assert (=> b!869447 (= e!484195 (and e!484194 mapRes!27119))))

(declare-fun condMapEmpty!27119 () Bool)

(declare-fun mapDefault!27119 () ValueCell!8067)

(assert (=> b!869447 (= condMapEmpty!27119 (= (arr!24119 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8067)) mapDefault!27119)))))

(declare-fun b!869448 () Bool)

(declare-fun e!484190 () Bool)

(declare-fun tp_is_empty!17013 () Bool)

(assert (=> b!869448 (= e!484190 tp_is_empty!17013)))

(declare-fun res!590856 () Bool)

(assert (=> start!73962 (=> (not res!590856) (not e!484193))))

(assert (=> start!73962 (= res!590856 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24558 _keys!868))))))

(assert (=> start!73962 e!484193))

(assert (=> start!73962 tp_is_empty!17013))

(assert (=> start!73962 true))

(assert (=> start!73962 tp!52134))

(declare-fun array_inv!19050 (array!50174) Bool)

(assert (=> start!73962 (array_inv!19050 _keys!868)))

(declare-fun array_inv!19051 (array!50176) Bool)

(assert (=> start!73962 (and (array_inv!19051 _values!688) e!484195)))

(declare-fun mapNonEmpty!27119 () Bool)

(declare-fun tp!52135 () Bool)

(assert (=> mapNonEmpty!27119 (= mapRes!27119 (and tp!52135 e!484190))))

(declare-fun mapKey!27119 () (_ BitVec 32))

(declare-fun mapRest!27119 () (Array (_ BitVec 32) ValueCell!8067))

(declare-fun mapValue!27119 () ValueCell!8067)

(assert (=> mapNonEmpty!27119 (= (arr!24119 _values!688) (store mapRest!27119 mapKey!27119 mapValue!27119))))

(declare-fun b!869449 () Bool)

(declare-fun res!590858 () Bool)

(assert (=> b!869449 (=> (not res!590858) (not e!484193))))

(declare-datatypes ((List!17153 0))(
  ( (Nil!17150) (Cons!17149 (h!18280 (_ BitVec 64)) (t!24190 List!17153)) )
))
(declare-fun arrayNoDuplicates!0 (array!50174 (_ BitVec 32) List!17153) Bool)

(assert (=> b!869449 (= res!590858 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17150))))

(declare-fun b!869450 () Bool)

(assert (=> b!869450 (= e!484194 tp_is_empty!17013)))

(assert (= (and start!73962 res!590856) b!869443))

(assert (= (and b!869443 res!590854) b!869442))

(assert (= (and b!869442 res!590853) b!869440))

(assert (= (and b!869440 res!590855) b!869449))

(assert (= (and b!869449 res!590858) b!869446))

(assert (= (and b!869446 res!590857) b!869444))

(assert (= (and b!869444 res!590861) b!869439))

(assert (= (and b!869439 res!590860) b!869441))

(assert (= (and b!869441 res!590859) b!869445))

(assert (= (and b!869447 condMapEmpty!27119) mapIsEmpty!27119))

(assert (= (and b!869447 (not condMapEmpty!27119)) mapNonEmpty!27119))

(get-info :version)

(assert (= (and mapNonEmpty!27119 ((_ is ValueCellFull!8067) mapValue!27119)) b!869448))

(assert (= (and b!869447 ((_ is ValueCellFull!8067) mapDefault!27119)) b!869450))

(assert (= start!73962 b!869447))

(declare-fun m!810977 () Bool)

(assert (=> mapNonEmpty!27119 m!810977))

(declare-fun m!810979 () Bool)

(assert (=> start!73962 m!810979))

(declare-fun m!810981 () Bool)

(assert (=> start!73962 m!810981))

(declare-fun m!810983 () Bool)

(assert (=> b!869444 m!810983))

(declare-fun m!810985 () Bool)

(assert (=> b!869443 m!810985))

(declare-fun m!810987 () Bool)

(assert (=> b!869445 m!810987))

(declare-fun m!810989 () Bool)

(assert (=> b!869445 m!810989))

(assert (=> b!869445 m!810989))

(declare-fun m!810991 () Bool)

(assert (=> b!869445 m!810991))

(declare-fun m!810993 () Bool)

(assert (=> b!869445 m!810993))

(declare-fun m!810995 () Bool)

(assert (=> b!869441 m!810995))

(declare-fun m!810997 () Bool)

(assert (=> b!869441 m!810997))

(declare-fun m!810999 () Bool)

(assert (=> b!869441 m!810999))

(declare-fun m!811001 () Bool)

(assert (=> b!869449 m!811001))

(declare-fun m!811003 () Bool)

(assert (=> b!869439 m!811003))

(declare-fun m!811005 () Bool)

(assert (=> b!869440 m!811005))

(check-sat (not b_next!14877) (not b!869440) tp_is_empty!17013 (not b!869444) (not b!869449) (not start!73962) (not b!869445) (not b!869441) b_and!24629 (not b!869443) (not mapNonEmpty!27119))
(check-sat b_and!24629 (not b_next!14877))
