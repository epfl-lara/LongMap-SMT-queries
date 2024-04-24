; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73024 () Bool)

(assert start!73024)

(declare-fun b_free!13771 () Bool)

(declare-fun b_next!13771 () Bool)

(assert (=> start!73024 (= b_free!13771 (not b_next!13771))))

(declare-fun tp!48817 () Bool)

(declare-fun b_and!22867 () Bool)

(assert (=> start!73024 (= tp!48817 b_and!22867)))

(declare-fun mapNonEmpty!25460 () Bool)

(declare-fun mapRes!25460 () Bool)

(declare-fun tp!48818 () Bool)

(declare-fun e!472621 () Bool)

(assert (=> mapNonEmpty!25460 (= mapRes!25460 (and tp!48818 e!472621))))

(declare-datatypes ((V!26257 0))(
  ( (V!26258 (val!8001 Int)) )
))
(declare-datatypes ((ValueCell!7514 0))(
  ( (ValueCellFull!7514 (v!10426 V!26257)) (EmptyCell!7514) )
))
(declare-fun mapRest!25460 () (Array (_ BitVec 32) ValueCell!7514))

(declare-fun mapKey!25460 () (_ BitVec 32))

(declare-datatypes ((array!48077 0))(
  ( (array!48078 (arr!23065 (Array (_ BitVec 32) ValueCell!7514)) (size!23506 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48077)

(declare-fun mapValue!25460 () ValueCell!7514)

(assert (=> mapNonEmpty!25460 (= (arr!23065 _values!688) (store mapRest!25460 mapKey!25460 mapValue!25460))))

(declare-fun b!846508 () Bool)

(declare-fun res!574806 () Bool)

(declare-fun e!472624 () Bool)

(assert (=> b!846508 (=> (not res!574806) (not e!472624))))

(declare-datatypes ((array!48079 0))(
  ( (array!48080 (arr!23066 (Array (_ BitVec 32) (_ BitVec 64))) (size!23507 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48079)

(declare-datatypes ((List!16242 0))(
  ( (Nil!16239) (Cons!16238 (h!17375 (_ BitVec 64)) (t!22605 List!16242)) )
))
(declare-fun arrayNoDuplicates!0 (array!48079 (_ BitVec 32) List!16242) Bool)

(assert (=> b!846508 (= res!574806 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16239))))

(declare-fun b!846509 () Bool)

(declare-fun tp_is_empty!15907 () Bool)

(assert (=> b!846509 (= e!472621 tp_is_empty!15907)))

(declare-fun b!846510 () Bool)

(declare-fun res!574807 () Bool)

(assert (=> b!846510 (=> (not res!574807) (not e!472624))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846510 (= res!574807 (and (= (select (arr!23066 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846511 () Bool)

(declare-fun e!472622 () Bool)

(assert (=> b!846511 (= e!472622 tp_is_empty!15907)))

(declare-fun b!846512 () Bool)

(declare-fun res!574808 () Bool)

(assert (=> b!846512 (=> (not res!574808) (not e!472624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846512 (= res!574808 (validKeyInArray!0 k0!854))))

(declare-fun b!846513 () Bool)

(declare-fun res!574812 () Bool)

(assert (=> b!846513 (=> (not res!574812) (not e!472624))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48079 (_ BitVec 32)) Bool)

(assert (=> b!846513 (= res!574812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!574811 () Bool)

(assert (=> start!73024 (=> (not res!574811) (not e!472624))))

(assert (=> start!73024 (= res!574811 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23507 _keys!868))))))

(assert (=> start!73024 e!472624))

(assert (=> start!73024 true))

(assert (=> start!73024 tp!48817))

(declare-fun array_inv!18380 (array!48079) Bool)

(assert (=> start!73024 (array_inv!18380 _keys!868)))

(declare-fun e!472620 () Bool)

(declare-fun array_inv!18381 (array!48077) Bool)

(assert (=> start!73024 (and (array_inv!18381 _values!688) e!472620)))

(assert (=> start!73024 tp_is_empty!15907))

(declare-fun mapIsEmpty!25460 () Bool)

(assert (=> mapIsEmpty!25460 mapRes!25460))

(declare-fun b!846514 () Bool)

(declare-fun res!574810 () Bool)

(assert (=> b!846514 (=> (not res!574810) (not e!472624))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!846514 (= res!574810 (and (= (size!23506 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23507 _keys!868) (size!23506 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846515 () Bool)

(declare-fun res!574813 () Bool)

(assert (=> b!846515 (=> (not res!574813) (not e!472624))))

(assert (=> b!846515 (= res!574813 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23507 _keys!868))))))

(declare-fun b!846516 () Bool)

(assert (=> b!846516 (= e!472620 (and e!472622 mapRes!25460))))

(declare-fun condMapEmpty!25460 () Bool)

(declare-fun mapDefault!25460 () ValueCell!7514)

(assert (=> b!846516 (= condMapEmpty!25460 (= (arr!23065 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7514)) mapDefault!25460)))))

(declare-fun b!846517 () Bool)

(declare-fun res!574809 () Bool)

(assert (=> b!846517 (=> (not res!574809) (not e!472624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846517 (= res!574809 (validMask!0 mask!1196))))

(declare-fun b!846518 () Bool)

(assert (=> b!846518 (= e!472624 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10376 0))(
  ( (tuple2!10377 (_1!5199 (_ BitVec 64)) (_2!5199 V!26257)) )
))
(declare-datatypes ((List!16243 0))(
  ( (Nil!16240) (Cons!16239 (h!17376 tuple2!10376) (t!22606 List!16243)) )
))
(declare-datatypes ((ListLongMap!9147 0))(
  ( (ListLongMap!9148 (toList!4589 List!16243)) )
))
(declare-fun lt!381788 () ListLongMap!9147)

(declare-fun minValue!654 () V!26257)

(declare-fun zeroValue!654 () V!26257)

(declare-fun getCurrentListMapNoExtraKeys!2647 (array!48079 array!48077 (_ BitVec 32) (_ BitVec 32) V!26257 V!26257 (_ BitVec 32) Int) ListLongMap!9147)

(assert (=> b!846518 (= lt!381788 (getCurrentListMapNoExtraKeys!2647 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73024 res!574811) b!846517))

(assert (= (and b!846517 res!574809) b!846514))

(assert (= (and b!846514 res!574810) b!846513))

(assert (= (and b!846513 res!574812) b!846508))

(assert (= (and b!846508 res!574806) b!846515))

(assert (= (and b!846515 res!574813) b!846512))

(assert (= (and b!846512 res!574808) b!846510))

(assert (= (and b!846510 res!574807) b!846518))

(assert (= (and b!846516 condMapEmpty!25460) mapIsEmpty!25460))

(assert (= (and b!846516 (not condMapEmpty!25460)) mapNonEmpty!25460))

(get-info :version)

(assert (= (and mapNonEmpty!25460 ((_ is ValueCellFull!7514) mapValue!25460)) b!846509))

(assert (= (and b!846516 ((_ is ValueCellFull!7514) mapDefault!25460)) b!846511))

(assert (= start!73024 b!846516))

(declare-fun m!788633 () Bool)

(assert (=> b!846517 m!788633))

(declare-fun m!788635 () Bool)

(assert (=> mapNonEmpty!25460 m!788635))

(declare-fun m!788637 () Bool)

(assert (=> b!846518 m!788637))

(declare-fun m!788639 () Bool)

(assert (=> b!846510 m!788639))

(declare-fun m!788641 () Bool)

(assert (=> start!73024 m!788641))

(declare-fun m!788643 () Bool)

(assert (=> start!73024 m!788643))

(declare-fun m!788645 () Bool)

(assert (=> b!846508 m!788645))

(declare-fun m!788647 () Bool)

(assert (=> b!846513 m!788647))

(declare-fun m!788649 () Bool)

(assert (=> b!846512 m!788649))

(check-sat (not b!846517) (not b!846518) tp_is_empty!15907 (not b!846512) b_and!22867 (not start!73024) (not b_next!13771) (not mapNonEmpty!25460) (not b!846508) (not b!846513))
(check-sat b_and!22867 (not b_next!13771))
