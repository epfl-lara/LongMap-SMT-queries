; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74026 () Bool)

(assert start!74026)

(declare-fun b_free!14941 () Bool)

(declare-fun b_next!14941 () Bool)

(assert (=> start!74026 (= b_free!14941 (not b_next!14941))))

(declare-fun tp!52326 () Bool)

(declare-fun b_and!24693 () Bool)

(assert (=> start!74026 (= tp!52326 b_and!24693)))

(declare-fun b!870591 () Bool)

(declare-fun res!591720 () Bool)

(declare-fun e!484771 () Bool)

(assert (=> b!870591 (=> (not res!591720) (not e!484771))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870591 (= res!591720 (validMask!0 mask!1196))))

(declare-fun b!870592 () Bool)

(declare-fun e!484769 () Bool)

(declare-fun tp_is_empty!17077 () Bool)

(assert (=> b!870592 (= e!484769 tp_is_empty!17077)))

(declare-fun b!870593 () Bool)

(declare-fun res!591722 () Bool)

(assert (=> b!870593 (=> (not res!591722) (not e!484771))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50298 0))(
  ( (array!50299 (arr!24180 (Array (_ BitVec 32) (_ BitVec 64))) (size!24620 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50298)

(assert (=> b!870593 (= res!591722 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24620 _keys!868))))))

(declare-fun res!591719 () Bool)

(assert (=> start!74026 (=> (not res!591719) (not e!484771))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74026 (= res!591719 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24620 _keys!868))))))

(assert (=> start!74026 e!484771))

(assert (=> start!74026 tp_is_empty!17077))

(assert (=> start!74026 true))

(assert (=> start!74026 tp!52326))

(declare-fun array_inv!19094 (array!50298) Bool)

(assert (=> start!74026 (array_inv!19094 _keys!868)))

(declare-datatypes ((V!27817 0))(
  ( (V!27818 (val!8586 Int)) )
))
(declare-datatypes ((ValueCell!8099 0))(
  ( (ValueCellFull!8099 (v!11011 V!27817)) (EmptyCell!8099) )
))
(declare-datatypes ((array!50300 0))(
  ( (array!50301 (arr!24181 (Array (_ BitVec 32) ValueCell!8099)) (size!24621 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50300)

(declare-fun e!484768 () Bool)

(declare-fun array_inv!19095 (array!50300) Bool)

(assert (=> start!74026 (and (array_inv!19095 _values!688) e!484768)))

(declare-fun b!870594 () Bool)

(declare-fun res!591725 () Bool)

(assert (=> b!870594 (=> (not res!591725) (not e!484771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50298 (_ BitVec 32)) Bool)

(assert (=> b!870594 (= res!591725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27215 () Bool)

(declare-fun mapRes!27215 () Bool)

(assert (=> mapIsEmpty!27215 mapRes!27215))

(declare-fun b!870595 () Bool)

(declare-fun res!591718 () Bool)

(assert (=> b!870595 (=> (not res!591718) (not e!484771))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!870595 (= res!591718 (and (= (select (arr!24180 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!870596 () Bool)

(declare-fun e!484766 () Bool)

(assert (=> b!870596 (= e!484766 (not true))))

(declare-fun v!557 () V!27817)

(declare-fun lt!395185 () array!50300)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27817)

(declare-fun zeroValue!654 () V!27817)

(declare-datatypes ((tuple2!11406 0))(
  ( (tuple2!11407 (_1!5714 (_ BitVec 64)) (_2!5714 V!27817)) )
))
(declare-datatypes ((List!17197 0))(
  ( (Nil!17194) (Cons!17193 (h!18324 tuple2!11406) (t!24234 List!17197)) )
))
(declare-datatypes ((ListLongMap!10175 0))(
  ( (ListLongMap!10176 (toList!5103 List!17197)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3072 (array!50298 array!50300 (_ BitVec 32) (_ BitVec 32) V!27817 V!27817 (_ BitVec 32) Int) ListLongMap!10175)

(declare-fun +!2440 (ListLongMap!10175 tuple2!11406) ListLongMap!10175)

(assert (=> b!870596 (= (getCurrentListMapNoExtraKeys!3072 _keys!868 lt!395185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2440 (getCurrentListMapNoExtraKeys!3072 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11407 k!854 v!557)))))

(declare-datatypes ((Unit!29878 0))(
  ( (Unit!29879) )
))
(declare-fun lt!395186 () Unit!29878)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!634 (array!50298 array!50300 (_ BitVec 32) (_ BitVec 32) V!27817 V!27817 (_ BitVec 32) (_ BitVec 64) V!27817 (_ BitVec 32) Int) Unit!29878)

(assert (=> b!870596 (= lt!395186 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!634 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870597 () Bool)

(assert (=> b!870597 (= e!484771 e!484766)))

(declare-fun res!591717 () Bool)

(assert (=> b!870597 (=> (not res!591717) (not e!484766))))

(assert (=> b!870597 (= res!591717 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395188 () ListLongMap!10175)

(assert (=> b!870597 (= lt!395188 (getCurrentListMapNoExtraKeys!3072 _keys!868 lt!395185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870597 (= lt!395185 (array!50301 (store (arr!24181 _values!688) i!612 (ValueCellFull!8099 v!557)) (size!24621 _values!688)))))

(declare-fun lt!395187 () ListLongMap!10175)

(assert (=> b!870597 (= lt!395187 (getCurrentListMapNoExtraKeys!3072 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870598 () Bool)

(declare-fun res!591723 () Bool)

(assert (=> b!870598 (=> (not res!591723) (not e!484771))))

(assert (=> b!870598 (= res!591723 (and (= (size!24621 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24620 _keys!868) (size!24621 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27215 () Bool)

(declare-fun tp!52327 () Bool)

(assert (=> mapNonEmpty!27215 (= mapRes!27215 (and tp!52327 e!484769))))

(declare-fun mapKey!27215 () (_ BitVec 32))

(declare-fun mapValue!27215 () ValueCell!8099)

(declare-fun mapRest!27215 () (Array (_ BitVec 32) ValueCell!8099))

(assert (=> mapNonEmpty!27215 (= (arr!24181 _values!688) (store mapRest!27215 mapKey!27215 mapValue!27215))))

(declare-fun b!870599 () Bool)

(declare-fun res!591721 () Bool)

(assert (=> b!870599 (=> (not res!591721) (not e!484771))))

(declare-datatypes ((List!17198 0))(
  ( (Nil!17195) (Cons!17194 (h!18325 (_ BitVec 64)) (t!24235 List!17198)) )
))
(declare-fun arrayNoDuplicates!0 (array!50298 (_ BitVec 32) List!17198) Bool)

(assert (=> b!870599 (= res!591721 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17195))))

(declare-fun b!870600 () Bool)

(declare-fun e!484770 () Bool)

(assert (=> b!870600 (= e!484770 tp_is_empty!17077)))

(declare-fun b!870601 () Bool)

(assert (=> b!870601 (= e!484768 (and e!484770 mapRes!27215))))

(declare-fun condMapEmpty!27215 () Bool)

(declare-fun mapDefault!27215 () ValueCell!8099)

