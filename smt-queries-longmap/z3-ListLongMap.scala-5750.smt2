; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74496 () Bool)

(assert start!74496)

(declare-fun b_free!15091 () Bool)

(declare-fun b_next!15091 () Bool)

(assert (=> start!74496 (= b_free!15091 (not b_next!15091))))

(declare-fun tp!52949 () Bool)

(declare-fun b_and!24877 () Bool)

(assert (=> start!74496 (= tp!52949 b_and!24877)))

(declare-fun b!875579 () Bool)

(declare-fun res!594763 () Bool)

(declare-fun e!487562 () Bool)

(assert (=> b!875579 (=> (not res!594763) (not e!487562))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50849 0))(
  ( (array!50850 (arr!24448 (Array (_ BitVec 32) (_ BitVec 64))) (size!24889 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50849)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875579 (= res!594763 (and (= (select (arr!24448 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594764 () Bool)

(assert (=> start!74496 (=> (not res!594764) (not e!487562))))

(assert (=> start!74496 (= res!594764 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24889 _keys!868))))))

(assert (=> start!74496 e!487562))

(declare-fun tp_is_empty!17335 () Bool)

(assert (=> start!74496 tp_is_empty!17335))

(assert (=> start!74496 true))

(assert (=> start!74496 tp!52949))

(declare-fun array_inv!19338 (array!50849) Bool)

(assert (=> start!74496 (array_inv!19338 _keys!868)))

(declare-datatypes ((V!28161 0))(
  ( (V!28162 (val!8715 Int)) )
))
(declare-datatypes ((ValueCell!8228 0))(
  ( (ValueCellFull!8228 (v!11144 V!28161)) (EmptyCell!8228) )
))
(declare-datatypes ((array!50851 0))(
  ( (array!50852 (arr!24449 (Array (_ BitVec 32) ValueCell!8228)) (size!24890 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50851)

(declare-fun e!487558 () Bool)

(declare-fun array_inv!19339 (array!50851) Bool)

(assert (=> start!74496 (and (array_inv!19339 _values!688) e!487558)))

(declare-fun b!875580 () Bool)

(declare-fun res!594769 () Bool)

(assert (=> b!875580 (=> (not res!594769) (not e!487562))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875580 (= res!594769 (validMask!0 mask!1196))))

(declare-fun b!875581 () Bool)

(declare-fun res!594766 () Bool)

(assert (=> b!875581 (=> (not res!594766) (not e!487562))))

(assert (=> b!875581 (= res!594766 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24889 _keys!868))))))

(declare-fun b!875582 () Bool)

(declare-fun e!487561 () Bool)

(assert (=> b!875582 (= e!487561 tp_is_empty!17335)))

(declare-fun mapIsEmpty!27611 () Bool)

(declare-fun mapRes!27611 () Bool)

(assert (=> mapIsEmpty!27611 mapRes!27611))

(declare-fun b!875583 () Bool)

(declare-fun res!594765 () Bool)

(assert (=> b!875583 (=> (not res!594765) (not e!487562))))

(declare-datatypes ((List!17288 0))(
  ( (Nil!17285) (Cons!17284 (h!18421 (_ BitVec 64)) (t!24321 List!17288)) )
))
(declare-fun arrayNoDuplicates!0 (array!50849 (_ BitVec 32) List!17288) Bool)

(assert (=> b!875583 (= res!594765 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17285))))

(declare-fun b!875584 () Bool)

(declare-fun res!594767 () Bool)

(assert (=> b!875584 (=> (not res!594767) (not e!487562))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!875584 (= res!594767 (and (= (size!24890 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24889 _keys!868) (size!24890 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875585 () Bool)

(declare-fun e!487560 () Bool)

(assert (=> b!875585 (= e!487560 tp_is_empty!17335)))

(declare-fun b!875586 () Bool)

(declare-fun res!594770 () Bool)

(assert (=> b!875586 (=> (not res!594770) (not e!487562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50849 (_ BitVec 32)) Bool)

(assert (=> b!875586 (= res!594770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875587 () Bool)

(assert (=> b!875587 (= e!487558 (and e!487560 mapRes!27611))))

(declare-fun condMapEmpty!27611 () Bool)

(declare-fun mapDefault!27611 () ValueCell!8228)

(assert (=> b!875587 (= condMapEmpty!27611 (= (arr!24449 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8228)) mapDefault!27611)))))

(declare-fun b!875588 () Bool)

(assert (=> b!875588 (= e!487562 false)))

(declare-fun v!557 () V!28161)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28161)

(declare-fun zeroValue!654 () V!28161)

(declare-datatypes ((tuple2!11442 0))(
  ( (tuple2!11443 (_1!5732 (_ BitVec 64)) (_2!5732 V!28161)) )
))
(declare-datatypes ((List!17289 0))(
  ( (Nil!17286) (Cons!17285 (h!18422 tuple2!11442) (t!24322 List!17289)) )
))
(declare-datatypes ((ListLongMap!10213 0))(
  ( (ListLongMap!10214 (toList!5122 List!17289)) )
))
(declare-fun lt!396347 () ListLongMap!10213)

(declare-fun getCurrentListMapNoExtraKeys!3165 (array!50849 array!50851 (_ BitVec 32) (_ BitVec 32) V!28161 V!28161 (_ BitVec 32) Int) ListLongMap!10213)

(assert (=> b!875588 (= lt!396347 (getCurrentListMapNoExtraKeys!3165 _keys!868 (array!50852 (store (arr!24449 _values!688) i!612 (ValueCellFull!8228 v!557)) (size!24890 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396348 () ListLongMap!10213)

(assert (=> b!875588 (= lt!396348 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27611 () Bool)

(declare-fun tp!52948 () Bool)

(assert (=> mapNonEmpty!27611 (= mapRes!27611 (and tp!52948 e!487561))))

(declare-fun mapKey!27611 () (_ BitVec 32))

(declare-fun mapRest!27611 () (Array (_ BitVec 32) ValueCell!8228))

(declare-fun mapValue!27611 () ValueCell!8228)

(assert (=> mapNonEmpty!27611 (= (arr!24449 _values!688) (store mapRest!27611 mapKey!27611 mapValue!27611))))

(declare-fun b!875589 () Bool)

(declare-fun res!594768 () Bool)

(assert (=> b!875589 (=> (not res!594768) (not e!487562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875589 (= res!594768 (validKeyInArray!0 k0!854))))

(assert (= (and start!74496 res!594764) b!875580))

(assert (= (and b!875580 res!594769) b!875584))

(assert (= (and b!875584 res!594767) b!875586))

(assert (= (and b!875586 res!594770) b!875583))

(assert (= (and b!875583 res!594765) b!875581))

(assert (= (and b!875581 res!594766) b!875589))

(assert (= (and b!875589 res!594768) b!875579))

(assert (= (and b!875579 res!594763) b!875588))

(assert (= (and b!875587 condMapEmpty!27611) mapIsEmpty!27611))

(assert (= (and b!875587 (not condMapEmpty!27611)) mapNonEmpty!27611))

(get-info :version)

(assert (= (and mapNonEmpty!27611 ((_ is ValueCellFull!8228) mapValue!27611)) b!875582))

(assert (= (and b!875587 ((_ is ValueCellFull!8228) mapDefault!27611)) b!875585))

(assert (= start!74496 b!875587))

(declare-fun m!816055 () Bool)

(assert (=> mapNonEmpty!27611 m!816055))

(declare-fun m!816057 () Bool)

(assert (=> b!875589 m!816057))

(declare-fun m!816059 () Bool)

(assert (=> b!875580 m!816059))

(declare-fun m!816061 () Bool)

(assert (=> b!875588 m!816061))

(declare-fun m!816063 () Bool)

(assert (=> b!875588 m!816063))

(declare-fun m!816065 () Bool)

(assert (=> b!875588 m!816065))

(declare-fun m!816067 () Bool)

(assert (=> b!875583 m!816067))

(declare-fun m!816069 () Bool)

(assert (=> b!875586 m!816069))

(declare-fun m!816071 () Bool)

(assert (=> start!74496 m!816071))

(declare-fun m!816073 () Bool)

(assert (=> start!74496 m!816073))

(declare-fun m!816075 () Bool)

(assert (=> b!875579 m!816075))

(check-sat (not b!875583) b_and!24877 tp_is_empty!17335 (not b_next!15091) (not mapNonEmpty!27611) (not b!875589) (not b!875580) (not b!875588) (not b!875586) (not start!74496))
(check-sat b_and!24877 (not b_next!15091))
