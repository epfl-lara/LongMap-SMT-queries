; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73000 () Bool)

(assert start!73000)

(declare-fun b_free!13747 () Bool)

(declare-fun b_next!13747 () Bool)

(assert (=> start!73000 (= b_free!13747 (not b_next!13747))))

(declare-fun tp!48746 () Bool)

(declare-fun b_and!22843 () Bool)

(assert (=> start!73000 (= tp!48746 b_and!22843)))

(declare-fun b!846112 () Bool)

(declare-fun res!574520 () Bool)

(declare-fun e!472441 () Bool)

(assert (=> b!846112 (=> (not res!574520) (not e!472441))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48033 0))(
  ( (array!48034 (arr!23043 (Array (_ BitVec 32) (_ BitVec 64))) (size!23484 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48033)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846112 (= res!574520 (and (= (select (arr!23043 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846113 () Bool)

(declare-fun e!472440 () Bool)

(declare-fun tp_is_empty!15883 () Bool)

(assert (=> b!846113 (= e!472440 tp_is_empty!15883)))

(declare-fun b!846114 () Bool)

(declare-fun res!574523 () Bool)

(assert (=> b!846114 (=> (not res!574523) (not e!472441))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26225 0))(
  ( (V!26226 (val!7989 Int)) )
))
(declare-datatypes ((ValueCell!7502 0))(
  ( (ValueCellFull!7502 (v!10414 V!26225)) (EmptyCell!7502) )
))
(declare-datatypes ((array!48035 0))(
  ( (array!48036 (arr!23044 (Array (_ BitVec 32) ValueCell!7502)) (size!23485 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48035)

(assert (=> b!846114 (= res!574523 (and (= (size!23485 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23484 _keys!868) (size!23485 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!574525 () Bool)

(assert (=> start!73000 (=> (not res!574525) (not e!472441))))

(assert (=> start!73000 (= res!574525 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23484 _keys!868))))))

(assert (=> start!73000 e!472441))

(assert (=> start!73000 true))

(assert (=> start!73000 tp!48746))

(declare-fun array_inv!18366 (array!48033) Bool)

(assert (=> start!73000 (array_inv!18366 _keys!868)))

(declare-fun e!472444 () Bool)

(declare-fun array_inv!18367 (array!48035) Bool)

(assert (=> start!73000 (and (array_inv!18367 _values!688) e!472444)))

(assert (=> start!73000 tp_is_empty!15883))

(declare-fun b!846115 () Bool)

(declare-fun res!574522 () Bool)

(assert (=> b!846115 (=> (not res!574522) (not e!472441))))

(declare-datatypes ((List!16228 0))(
  ( (Nil!16225) (Cons!16224 (h!17361 (_ BitVec 64)) (t!22591 List!16228)) )
))
(declare-fun arrayNoDuplicates!0 (array!48033 (_ BitVec 32) List!16228) Bool)

(assert (=> b!846115 (= res!574522 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16225))))

(declare-fun b!846116 () Bool)

(declare-fun e!472443 () Bool)

(declare-fun mapRes!25424 () Bool)

(assert (=> b!846116 (= e!472444 (and e!472443 mapRes!25424))))

(declare-fun condMapEmpty!25424 () Bool)

(declare-fun mapDefault!25424 () ValueCell!7502)

(assert (=> b!846116 (= condMapEmpty!25424 (= (arr!23044 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7502)) mapDefault!25424)))))

(declare-fun b!846117 () Bool)

(assert (=> b!846117 (= e!472441 false)))

(declare-datatypes ((tuple2!10362 0))(
  ( (tuple2!10363 (_1!5192 (_ BitVec 64)) (_2!5192 V!26225)) )
))
(declare-datatypes ((List!16229 0))(
  ( (Nil!16226) (Cons!16225 (h!17362 tuple2!10362) (t!22592 List!16229)) )
))
(declare-datatypes ((ListLongMap!9133 0))(
  ( (ListLongMap!9134 (toList!4582 List!16229)) )
))
(declare-fun lt!381752 () ListLongMap!9133)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26225)

(declare-fun zeroValue!654 () V!26225)

(declare-fun getCurrentListMapNoExtraKeys!2640 (array!48033 array!48035 (_ BitVec 32) (_ BitVec 32) V!26225 V!26225 (_ BitVec 32) Int) ListLongMap!9133)

(assert (=> b!846117 (= lt!381752 (getCurrentListMapNoExtraKeys!2640 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25424 () Bool)

(assert (=> mapIsEmpty!25424 mapRes!25424))

(declare-fun b!846118 () Bool)

(declare-fun res!574518 () Bool)

(assert (=> b!846118 (=> (not res!574518) (not e!472441))))

(assert (=> b!846118 (= res!574518 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23484 _keys!868))))))

(declare-fun b!846119 () Bool)

(assert (=> b!846119 (= e!472443 tp_is_empty!15883)))

(declare-fun b!846120 () Bool)

(declare-fun res!574519 () Bool)

(assert (=> b!846120 (=> (not res!574519) (not e!472441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846120 (= res!574519 (validKeyInArray!0 k0!854))))

(declare-fun b!846121 () Bool)

(declare-fun res!574524 () Bool)

(assert (=> b!846121 (=> (not res!574524) (not e!472441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846121 (= res!574524 (validMask!0 mask!1196))))

(declare-fun b!846122 () Bool)

(declare-fun res!574521 () Bool)

(assert (=> b!846122 (=> (not res!574521) (not e!472441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48033 (_ BitVec 32)) Bool)

(assert (=> b!846122 (= res!574521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25424 () Bool)

(declare-fun tp!48745 () Bool)

(assert (=> mapNonEmpty!25424 (= mapRes!25424 (and tp!48745 e!472440))))

(declare-fun mapValue!25424 () ValueCell!7502)

(declare-fun mapKey!25424 () (_ BitVec 32))

(declare-fun mapRest!25424 () (Array (_ BitVec 32) ValueCell!7502))

(assert (=> mapNonEmpty!25424 (= (arr!23044 _values!688) (store mapRest!25424 mapKey!25424 mapValue!25424))))

(assert (= (and start!73000 res!574525) b!846121))

(assert (= (and b!846121 res!574524) b!846114))

(assert (= (and b!846114 res!574523) b!846122))

(assert (= (and b!846122 res!574521) b!846115))

(assert (= (and b!846115 res!574522) b!846118))

(assert (= (and b!846118 res!574518) b!846120))

(assert (= (and b!846120 res!574519) b!846112))

(assert (= (and b!846112 res!574520) b!846117))

(assert (= (and b!846116 condMapEmpty!25424) mapIsEmpty!25424))

(assert (= (and b!846116 (not condMapEmpty!25424)) mapNonEmpty!25424))

(get-info :version)

(assert (= (and mapNonEmpty!25424 ((_ is ValueCellFull!7502) mapValue!25424)) b!846113))

(assert (= (and b!846116 ((_ is ValueCellFull!7502) mapDefault!25424)) b!846119))

(assert (= start!73000 b!846116))

(declare-fun m!788417 () Bool)

(assert (=> start!73000 m!788417))

(declare-fun m!788419 () Bool)

(assert (=> start!73000 m!788419))

(declare-fun m!788421 () Bool)

(assert (=> b!846115 m!788421))

(declare-fun m!788423 () Bool)

(assert (=> b!846120 m!788423))

(declare-fun m!788425 () Bool)

(assert (=> b!846112 m!788425))

(declare-fun m!788427 () Bool)

(assert (=> b!846117 m!788427))

(declare-fun m!788429 () Bool)

(assert (=> b!846122 m!788429))

(declare-fun m!788431 () Bool)

(assert (=> mapNonEmpty!25424 m!788431))

(declare-fun m!788433 () Bool)

(assert (=> b!846121 m!788433))

(check-sat (not b!846120) b_and!22843 (not b!846122) (not mapNonEmpty!25424) (not b!846121) (not b_next!13747) (not b!846115) (not start!73000) (not b!846117) tp_is_empty!15883)
(check-sat b_and!22843 (not b_next!13747))
