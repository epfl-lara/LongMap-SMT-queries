; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74292 () Bool)

(assert start!74292)

(declare-fun b_free!15055 () Bool)

(declare-fun b_next!15055 () Bool)

(assert (=> start!74292 (= b_free!15055 (not b_next!15055))))

(declare-fun tp!52839 () Bool)

(declare-fun b_and!24831 () Bool)

(assert (=> start!74292 (= tp!52839 b_and!24831)))

(declare-fun res!593994 () Bool)

(declare-fun e!486706 () Bool)

(assert (=> start!74292 (=> (not res!593994) (not e!486706))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50726 0))(
  ( (array!50727 (arr!24391 (Array (_ BitVec 32) (_ BitVec 64))) (size!24831 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50726)

(assert (=> start!74292 (= res!593994 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24831 _keys!868))))))

(assert (=> start!74292 e!486706))

(declare-fun tp_is_empty!17299 () Bool)

(assert (=> start!74292 tp_is_empty!17299))

(assert (=> start!74292 true))

(assert (=> start!74292 tp!52839))

(declare-fun array_inv!19242 (array!50726) Bool)

(assert (=> start!74292 (array_inv!19242 _keys!868)))

(declare-datatypes ((V!28113 0))(
  ( (V!28114 (val!8697 Int)) )
))
(declare-datatypes ((ValueCell!8210 0))(
  ( (ValueCellFull!8210 (v!11126 V!28113)) (EmptyCell!8210) )
))
(declare-datatypes ((array!50728 0))(
  ( (array!50729 (arr!24392 (Array (_ BitVec 32) ValueCell!8210)) (size!24832 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50728)

(declare-fun e!486708 () Bool)

(declare-fun array_inv!19243 (array!50728) Bool)

(assert (=> start!74292 (and (array_inv!19243 _values!688) e!486708)))

(declare-fun b!874082 () Bool)

(declare-fun e!486707 () Bool)

(assert (=> b!874082 (= e!486707 tp_is_empty!17299)))

(declare-fun b!874083 () Bool)

(assert (=> b!874083 (= e!486706 false)))

(declare-fun v!557 () V!28113)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11496 0))(
  ( (tuple2!11497 (_1!5759 (_ BitVec 64)) (_2!5759 V!28113)) )
))
(declare-datatypes ((List!17315 0))(
  ( (Nil!17312) (Cons!17311 (h!18442 tuple2!11496) (t!24356 List!17315)) )
))
(declare-datatypes ((ListLongMap!10265 0))(
  ( (ListLongMap!10266 (toList!5148 List!17315)) )
))
(declare-fun lt!395879 () ListLongMap!10265)

(declare-fun minValue!654 () V!28113)

(declare-fun zeroValue!654 () V!28113)

(declare-fun getCurrentListMapNoExtraKeys!3115 (array!50726 array!50728 (_ BitVec 32) (_ BitVec 32) V!28113 V!28113 (_ BitVec 32) Int) ListLongMap!10265)

(assert (=> b!874083 (= lt!395879 (getCurrentListMapNoExtraKeys!3115 _keys!868 (array!50729 (store (arr!24392 _values!688) i!612 (ValueCellFull!8210 v!557)) (size!24832 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395878 () ListLongMap!10265)

(assert (=> b!874083 (= lt!395878 (getCurrentListMapNoExtraKeys!3115 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874084 () Bool)

(declare-fun res!593987 () Bool)

(assert (=> b!874084 (=> (not res!593987) (not e!486706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50726 (_ BitVec 32)) Bool)

(assert (=> b!874084 (= res!593987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874085 () Bool)

(declare-fun res!593990 () Bool)

(assert (=> b!874085 (=> (not res!593990) (not e!486706))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874085 (= res!593990 (validKeyInArray!0 k!854))))

(declare-fun b!874086 () Bool)

(declare-fun res!593991 () Bool)

(assert (=> b!874086 (=> (not res!593991) (not e!486706))))

(assert (=> b!874086 (= res!593991 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24831 _keys!868))))))

(declare-fun b!874087 () Bool)

(declare-fun res!593989 () Bool)

(assert (=> b!874087 (=> (not res!593989) (not e!486706))))

(assert (=> b!874087 (= res!593989 (and (= (size!24832 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24831 _keys!868) (size!24832 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874088 () Bool)

(declare-fun res!593993 () Bool)

(assert (=> b!874088 (=> (not res!593993) (not e!486706))))

(declare-datatypes ((List!17316 0))(
  ( (Nil!17313) (Cons!17312 (h!18443 (_ BitVec 64)) (t!24357 List!17316)) )
))
(declare-fun arrayNoDuplicates!0 (array!50726 (_ BitVec 32) List!17316) Bool)

(assert (=> b!874088 (= res!593993 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17313))))

(declare-fun b!874089 () Bool)

(declare-fun e!486709 () Bool)

(assert (=> b!874089 (= e!486709 tp_is_empty!17299)))

(declare-fun mapIsEmpty!27557 () Bool)

(declare-fun mapRes!27557 () Bool)

(assert (=> mapIsEmpty!27557 mapRes!27557))

(declare-fun b!874090 () Bool)

(declare-fun res!593988 () Bool)

(assert (=> b!874090 (=> (not res!593988) (not e!486706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874090 (= res!593988 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27557 () Bool)

(declare-fun tp!52840 () Bool)

(assert (=> mapNonEmpty!27557 (= mapRes!27557 (and tp!52840 e!486707))))

(declare-fun mapValue!27557 () ValueCell!8210)

(declare-fun mapRest!27557 () (Array (_ BitVec 32) ValueCell!8210))

(declare-fun mapKey!27557 () (_ BitVec 32))

(assert (=> mapNonEmpty!27557 (= (arr!24392 _values!688) (store mapRest!27557 mapKey!27557 mapValue!27557))))

(declare-fun b!874091 () Bool)

(declare-fun res!593992 () Bool)

(assert (=> b!874091 (=> (not res!593992) (not e!486706))))

(assert (=> b!874091 (= res!593992 (and (= (select (arr!24391 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874092 () Bool)

(assert (=> b!874092 (= e!486708 (and e!486709 mapRes!27557))))

(declare-fun condMapEmpty!27557 () Bool)

(declare-fun mapDefault!27557 () ValueCell!8210)

