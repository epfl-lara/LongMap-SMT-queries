; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72894 () Bool)

(assert start!72894)

(declare-fun b_free!13809 () Bool)

(declare-fun b_next!13809 () Bool)

(assert (=> start!72894 (= b_free!13809 (not b_next!13809))))

(declare-fun tp!48931 () Bool)

(declare-fun b_and!22895 () Bool)

(assert (=> start!72894 (= tp!48931 b_and!22895)))

(declare-fun b!846232 () Bool)

(declare-fun res!574924 () Bool)

(declare-fun e!472327 () Bool)

(assert (=> b!846232 (=> (not res!574924) (not e!472327))))

(declare-datatypes ((array!48104 0))(
  ( (array!48105 (arr!23083 (Array (_ BitVec 32) (_ BitVec 64))) (size!23523 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48104)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48104 (_ BitVec 32)) Bool)

(assert (=> b!846232 (= res!574924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846233 () Bool)

(declare-fun res!574922 () Bool)

(assert (=> b!846233 (=> (not res!574922) (not e!472327))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846233 (= res!574922 (validKeyInArray!0 k0!854))))

(declare-fun b!846234 () Bool)

(declare-fun res!574921 () Bool)

(assert (=> b!846234 (=> (not res!574921) (not e!472327))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846234 (= res!574921 (and (= (select (arr!23083 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846235 () Bool)

(declare-fun e!472325 () Bool)

(declare-fun e!472326 () Bool)

(declare-fun mapRes!25517 () Bool)

(assert (=> b!846235 (= e!472325 (and e!472326 mapRes!25517))))

(declare-fun condMapEmpty!25517 () Bool)

(declare-datatypes ((V!26307 0))(
  ( (V!26308 (val!8020 Int)) )
))
(declare-datatypes ((ValueCell!7533 0))(
  ( (ValueCellFull!7533 (v!10445 V!26307)) (EmptyCell!7533) )
))
(declare-datatypes ((array!48106 0))(
  ( (array!48107 (arr!23084 (Array (_ BitVec 32) ValueCell!7533)) (size!23524 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48106)

(declare-fun mapDefault!25517 () ValueCell!7533)

(assert (=> b!846235 (= condMapEmpty!25517 (= (arr!23084 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7533)) mapDefault!25517)))))

(declare-fun res!574919 () Bool)

(assert (=> start!72894 (=> (not res!574919) (not e!472327))))

(assert (=> start!72894 (= res!574919 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23523 _keys!868))))))

(assert (=> start!72894 e!472327))

(declare-fun tp_is_empty!15945 () Bool)

(assert (=> start!72894 tp_is_empty!15945))

(assert (=> start!72894 true))

(assert (=> start!72894 tp!48931))

(declare-fun array_inv!18340 (array!48104) Bool)

(assert (=> start!72894 (array_inv!18340 _keys!868)))

(declare-fun array_inv!18341 (array!48106) Bool)

(assert (=> start!72894 (and (array_inv!18341 _values!688) e!472325)))

(declare-fun b!846236 () Bool)

(declare-fun res!574918 () Bool)

(assert (=> b!846236 (=> (not res!574918) (not e!472327))))

(assert (=> b!846236 (= res!574918 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23523 _keys!868))))))

(declare-fun b!846237 () Bool)

(declare-fun res!574923 () Bool)

(assert (=> b!846237 (=> (not res!574923) (not e!472327))))

(declare-datatypes ((List!16335 0))(
  ( (Nil!16332) (Cons!16331 (h!17462 (_ BitVec 64)) (t!22706 List!16335)) )
))
(declare-fun arrayNoDuplicates!0 (array!48104 (_ BitVec 32) List!16335) Bool)

(assert (=> b!846237 (= res!574923 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16332))))

(declare-fun b!846238 () Bool)

(assert (=> b!846238 (= e!472326 tp_is_empty!15945)))

(declare-fun b!846239 () Bool)

(assert (=> b!846239 (= e!472327 false)))

(declare-datatypes ((tuple2!10474 0))(
  ( (tuple2!10475 (_1!5248 (_ BitVec 64)) (_2!5248 V!26307)) )
))
(declare-datatypes ((List!16336 0))(
  ( (Nil!16333) (Cons!16332 (h!17463 tuple2!10474) (t!22707 List!16336)) )
))
(declare-datatypes ((ListLongMap!9243 0))(
  ( (ListLongMap!9244 (toList!4637 List!16336)) )
))
(declare-fun lt!381499 () ListLongMap!9243)

(declare-fun v!557 () V!26307)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26307)

(declare-fun zeroValue!654 () V!26307)

(declare-fun getCurrentListMapNoExtraKeys!2622 (array!48104 array!48106 (_ BitVec 32) (_ BitVec 32) V!26307 V!26307 (_ BitVec 32) Int) ListLongMap!9243)

(assert (=> b!846239 (= lt!381499 (getCurrentListMapNoExtraKeys!2622 _keys!868 (array!48107 (store (arr!23084 _values!688) i!612 (ValueCellFull!7533 v!557)) (size!23524 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381498 () ListLongMap!9243)

(assert (=> b!846239 (= lt!381498 (getCurrentListMapNoExtraKeys!2622 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25517 () Bool)

(assert (=> mapIsEmpty!25517 mapRes!25517))

(declare-fun b!846240 () Bool)

(declare-fun res!574925 () Bool)

(assert (=> b!846240 (=> (not res!574925) (not e!472327))))

(assert (=> b!846240 (= res!574925 (and (= (size!23524 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23523 _keys!868) (size!23524 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846241 () Bool)

(declare-fun e!472324 () Bool)

(assert (=> b!846241 (= e!472324 tp_is_empty!15945)))

(declare-fun mapNonEmpty!25517 () Bool)

(declare-fun tp!48930 () Bool)

(assert (=> mapNonEmpty!25517 (= mapRes!25517 (and tp!48930 e!472324))))

(declare-fun mapValue!25517 () ValueCell!7533)

(declare-fun mapKey!25517 () (_ BitVec 32))

(declare-fun mapRest!25517 () (Array (_ BitVec 32) ValueCell!7533))

(assert (=> mapNonEmpty!25517 (= (arr!23084 _values!688) (store mapRest!25517 mapKey!25517 mapValue!25517))))

(declare-fun b!846242 () Bool)

(declare-fun res!574920 () Bool)

(assert (=> b!846242 (=> (not res!574920) (not e!472327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846242 (= res!574920 (validMask!0 mask!1196))))

(assert (= (and start!72894 res!574919) b!846242))

(assert (= (and b!846242 res!574920) b!846240))

(assert (= (and b!846240 res!574925) b!846232))

(assert (= (and b!846232 res!574924) b!846237))

(assert (= (and b!846237 res!574923) b!846236))

(assert (= (and b!846236 res!574918) b!846233))

(assert (= (and b!846233 res!574922) b!846234))

(assert (= (and b!846234 res!574921) b!846239))

(assert (= (and b!846235 condMapEmpty!25517) mapIsEmpty!25517))

(assert (= (and b!846235 (not condMapEmpty!25517)) mapNonEmpty!25517))

(get-info :version)

(assert (= (and mapNonEmpty!25517 ((_ is ValueCellFull!7533) mapValue!25517)) b!846241))

(assert (= (and b!846235 ((_ is ValueCellFull!7533) mapDefault!25517)) b!846238))

(assert (= start!72894 b!846235))

(declare-fun m!787699 () Bool)

(assert (=> b!846239 m!787699))

(declare-fun m!787701 () Bool)

(assert (=> b!846239 m!787701))

(declare-fun m!787703 () Bool)

(assert (=> b!846239 m!787703))

(declare-fun m!787705 () Bool)

(assert (=> b!846242 m!787705))

(declare-fun m!787707 () Bool)

(assert (=> b!846233 m!787707))

(declare-fun m!787709 () Bool)

(assert (=> start!72894 m!787709))

(declare-fun m!787711 () Bool)

(assert (=> start!72894 m!787711))

(declare-fun m!787713 () Bool)

(assert (=> b!846237 m!787713))

(declare-fun m!787715 () Bool)

(assert (=> b!846232 m!787715))

(declare-fun m!787717 () Bool)

(assert (=> mapNonEmpty!25517 m!787717))

(declare-fun m!787719 () Bool)

(assert (=> b!846234 m!787719))

(check-sat (not b!846242) (not b!846239) (not start!72894) (not b!846233) (not mapNonEmpty!25517) (not b!846237) (not b_next!13809) b_and!22895 (not b!846232) tp_is_empty!15945)
(check-sat b_and!22895 (not b_next!13809))
