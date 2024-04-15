; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72838 () Bool)

(assert start!72838)

(declare-fun b_free!13771 () Bool)

(declare-fun b_next!13771 () Bool)

(assert (=> start!72838 (= b_free!13771 (not b_next!13771))))

(declare-fun tp!48818 () Bool)

(declare-fun b_and!22831 () Bool)

(assert (=> start!72838 (= tp!48818 b_and!22831)))

(declare-fun b!845367 () Bool)

(declare-fun e!471891 () Bool)

(assert (=> b!845367 (= e!471891 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26257 0))(
  ( (V!26258 (val!8001 Int)) )
))
(declare-datatypes ((tuple2!10470 0))(
  ( (tuple2!10471 (_1!5246 (_ BitVec 64)) (_2!5246 V!26257)) )
))
(declare-datatypes ((List!16330 0))(
  ( (Nil!16327) (Cons!16326 (h!17457 tuple2!10470) (t!22692 List!16330)) )
))
(declare-datatypes ((ListLongMap!9229 0))(
  ( (ListLongMap!9230 (toList!4630 List!16330)) )
))
(declare-fun lt!381191 () ListLongMap!9229)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48033 0))(
  ( (array!48034 (arr!23048 (Array (_ BitVec 32) (_ BitVec 64))) (size!23490 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48033)

(declare-datatypes ((ValueCell!7514 0))(
  ( (ValueCellFull!7514 (v!10420 V!26257)) (EmptyCell!7514) )
))
(declare-datatypes ((array!48035 0))(
  ( (array!48036 (arr!23049 (Array (_ BitVec 32) ValueCell!7514)) (size!23491 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48035)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26257)

(declare-fun zeroValue!654 () V!26257)

(declare-fun getCurrentListMapNoExtraKeys!2644 (array!48033 array!48035 (_ BitVec 32) (_ BitVec 32) V!26257 V!26257 (_ BitVec 32) Int) ListLongMap!9229)

(assert (=> b!845367 (= lt!381191 (getCurrentListMapNoExtraKeys!2644 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845368 () Bool)

(declare-fun res!574355 () Bool)

(assert (=> b!845368 (=> (not res!574355) (not e!471891))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845368 (= res!574355 (validKeyInArray!0 k0!854))))

(declare-fun b!845369 () Bool)

(declare-fun res!574357 () Bool)

(assert (=> b!845369 (=> (not res!574357) (not e!471891))))

(declare-datatypes ((List!16331 0))(
  ( (Nil!16328) (Cons!16327 (h!17458 (_ BitVec 64)) (t!22693 List!16331)) )
))
(declare-fun arrayNoDuplicates!0 (array!48033 (_ BitVec 32) List!16331) Bool)

(assert (=> b!845369 (= res!574357 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16328))))

(declare-fun b!845370 () Bool)

(declare-fun res!574356 () Bool)

(assert (=> b!845370 (=> (not res!574356) (not e!471891))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845370 (= res!574356 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23490 _keys!868))))))

(declare-fun b!845371 () Bool)

(declare-fun res!574352 () Bool)

(assert (=> b!845371 (=> (not res!574352) (not e!471891))))

(assert (=> b!845371 (= res!574352 (and (= (select (arr!23048 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845372 () Bool)

(declare-fun e!471890 () Bool)

(declare-fun tp_is_empty!15907 () Bool)

(assert (=> b!845372 (= e!471890 tp_is_empty!15907)))

(declare-fun b!845373 () Bool)

(declare-fun res!574354 () Bool)

(assert (=> b!845373 (=> (not res!574354) (not e!471891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845373 (= res!574354 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25460 () Bool)

(declare-fun mapRes!25460 () Bool)

(declare-fun tp!48817 () Bool)

(assert (=> mapNonEmpty!25460 (= mapRes!25460 (and tp!48817 e!471890))))

(declare-fun mapRest!25460 () (Array (_ BitVec 32) ValueCell!7514))

(declare-fun mapKey!25460 () (_ BitVec 32))

(declare-fun mapValue!25460 () ValueCell!7514)

(assert (=> mapNonEmpty!25460 (= (arr!23049 _values!688) (store mapRest!25460 mapKey!25460 mapValue!25460))))

(declare-fun b!845374 () Bool)

(declare-fun e!471894 () Bool)

(assert (=> b!845374 (= e!471894 tp_is_empty!15907)))

(declare-fun b!845375 () Bool)

(declare-fun res!574359 () Bool)

(assert (=> b!845375 (=> (not res!574359) (not e!471891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48033 (_ BitVec 32)) Bool)

(assert (=> b!845375 (= res!574359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845366 () Bool)

(declare-fun res!574358 () Bool)

(assert (=> b!845366 (=> (not res!574358) (not e!471891))))

(assert (=> b!845366 (= res!574358 (and (= (size!23491 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23490 _keys!868) (size!23491 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!574353 () Bool)

(assert (=> start!72838 (=> (not res!574353) (not e!471891))))

(assert (=> start!72838 (= res!574353 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23490 _keys!868))))))

(assert (=> start!72838 e!471891))

(assert (=> start!72838 true))

(assert (=> start!72838 tp!48818))

(declare-fun array_inv!18386 (array!48033) Bool)

(assert (=> start!72838 (array_inv!18386 _keys!868)))

(declare-fun e!471893 () Bool)

(declare-fun array_inv!18387 (array!48035) Bool)

(assert (=> start!72838 (and (array_inv!18387 _values!688) e!471893)))

(assert (=> start!72838 tp_is_empty!15907))

(declare-fun b!845376 () Bool)

(assert (=> b!845376 (= e!471893 (and e!471894 mapRes!25460))))

(declare-fun condMapEmpty!25460 () Bool)

(declare-fun mapDefault!25460 () ValueCell!7514)

(assert (=> b!845376 (= condMapEmpty!25460 (= (arr!23049 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7514)) mapDefault!25460)))))

(declare-fun mapIsEmpty!25460 () Bool)

(assert (=> mapIsEmpty!25460 mapRes!25460))

(assert (= (and start!72838 res!574353) b!845373))

(assert (= (and b!845373 res!574354) b!845366))

(assert (= (and b!845366 res!574358) b!845375))

(assert (= (and b!845375 res!574359) b!845369))

(assert (= (and b!845369 res!574357) b!845370))

(assert (= (and b!845370 res!574356) b!845368))

(assert (= (and b!845368 res!574355) b!845371))

(assert (= (and b!845371 res!574352) b!845367))

(assert (= (and b!845376 condMapEmpty!25460) mapIsEmpty!25460))

(assert (= (and b!845376 (not condMapEmpty!25460)) mapNonEmpty!25460))

(get-info :version)

(assert (= (and mapNonEmpty!25460 ((_ is ValueCellFull!7514) mapValue!25460)) b!845372))

(assert (= (and b!845376 ((_ is ValueCellFull!7514) mapDefault!25460)) b!845374))

(assert (= start!72838 b!845376))

(declare-fun m!786587 () Bool)

(assert (=> start!72838 m!786587))

(declare-fun m!786589 () Bool)

(assert (=> start!72838 m!786589))

(declare-fun m!786591 () Bool)

(assert (=> b!845369 m!786591))

(declare-fun m!786593 () Bool)

(assert (=> b!845375 m!786593))

(declare-fun m!786595 () Bool)

(assert (=> b!845371 m!786595))

(declare-fun m!786597 () Bool)

(assert (=> b!845368 m!786597))

(declare-fun m!786599 () Bool)

(assert (=> mapNonEmpty!25460 m!786599))

(declare-fun m!786601 () Bool)

(assert (=> b!845373 m!786601))

(declare-fun m!786603 () Bool)

(assert (=> b!845367 m!786603))

(check-sat b_and!22831 (not b_next!13771) (not b!845368) (not mapNonEmpty!25460) (not b!845367) tp_is_empty!15907 (not b!845373) (not start!72838) (not b!845369) (not b!845375))
(check-sat b_and!22831 (not b_next!13771))
