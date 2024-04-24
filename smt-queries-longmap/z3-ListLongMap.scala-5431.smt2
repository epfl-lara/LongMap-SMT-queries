; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72538 () Bool)

(assert start!72538)

(declare-fun b_free!13555 () Bool)

(declare-fun b_next!13555 () Bool)

(assert (=> start!72538 (= b_free!13555 (not b_next!13555))))

(declare-fun tp!47764 () Bool)

(declare-fun b_and!22651 () Bool)

(assert (=> start!72538 (= tp!47764 b_and!22651)))

(declare-fun b!839538 () Bool)

(declare-fun res!570595 () Bool)

(declare-fun e!468693 () Bool)

(assert (=> b!839538 (=> (not res!570595) (not e!468693))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839538 (= res!570595 (validMask!0 mask!1196))))

(declare-fun bm!36940 () Bool)

(declare-datatypes ((V!25609 0))(
  ( (V!25610 (val!7758 Int)) )
))
(declare-fun v!557 () V!25609)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10192 0))(
  ( (tuple2!10193 (_1!5107 (_ BitVec 64)) (_2!5107 V!25609)) )
))
(declare-datatypes ((List!15974 0))(
  ( (Nil!15971) (Cons!15970 (h!17107 tuple2!10192) (t!22337 List!15974)) )
))
(declare-datatypes ((ListLongMap!8963 0))(
  ( (ListLongMap!8964 (toList!4497 List!15974)) )
))
(declare-fun call!36943 () ListLongMap!8963)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47139 0))(
  ( (array!47140 (arr!22596 (Array (_ BitVec 32) (_ BitVec 64))) (size!23037 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47139)

(declare-datatypes ((ValueCell!7271 0))(
  ( (ValueCellFull!7271 (v!10183 V!25609)) (EmptyCell!7271) )
))
(declare-datatypes ((array!47141 0))(
  ( (array!47142 (arr!22597 (Array (_ BitVec 32) ValueCell!7271)) (size!23038 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47141)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25609)

(declare-fun zeroValue!654 () V!25609)

(declare-fun getCurrentListMapNoExtraKeys!2559 (array!47139 array!47141 (_ BitVec 32) (_ BitVec 32) V!25609 V!25609 (_ BitVec 32) Int) ListLongMap!8963)

(assert (=> bm!36940 (= call!36943 (getCurrentListMapNoExtraKeys!2559 _keys!868 (array!47142 (store (arr!22597 _values!688) i!612 (ValueCellFull!7271 v!557)) (size!23038 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839539 () Bool)

(declare-fun res!570599 () Bool)

(assert (=> b!839539 (=> (not res!570599) (not e!468693))))

(assert (=> b!839539 (= res!570599 (and (= (size!23038 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23037 _keys!868) (size!23038 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839540 () Bool)

(declare-fun e!468689 () Bool)

(declare-fun e!468692 () Bool)

(declare-fun mapRes!24731 () Bool)

(assert (=> b!839540 (= e!468689 (and e!468692 mapRes!24731))))

(declare-fun condMapEmpty!24731 () Bool)

(declare-fun mapDefault!24731 () ValueCell!7271)

(assert (=> b!839540 (= condMapEmpty!24731 (= (arr!22597 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7271)) mapDefault!24731)))))

(declare-fun b!839541 () Bool)

(declare-fun res!570597 () Bool)

(assert (=> b!839541 (=> (not res!570597) (not e!468693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47139 (_ BitVec 32)) Bool)

(assert (=> b!839541 (= res!570597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839542 () Bool)

(declare-fun e!468690 () Bool)

(declare-fun call!36944 () ListLongMap!8963)

(assert (=> b!839542 (= e!468690 (= call!36943 call!36944))))

(declare-fun b!839543 () Bool)

(declare-fun res!570601 () Bool)

(assert (=> b!839543 (=> (not res!570601) (not e!468693))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839543 (= res!570601 (and (= (select (arr!22596 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23037 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839544 () Bool)

(declare-fun +!2013 (ListLongMap!8963 tuple2!10192) ListLongMap!8963)

(assert (=> b!839544 (= e!468690 (= call!36943 (+!2013 call!36944 (tuple2!10193 k0!854 v!557))))))

(declare-fun b!839545 () Bool)

(declare-fun tp_is_empty!15421 () Bool)

(assert (=> b!839545 (= e!468692 tp_is_empty!15421)))

(declare-fun b!839546 () Bool)

(declare-fun e!468694 () Bool)

(assert (=> b!839546 (= e!468694 tp_is_empty!15421)))

(declare-fun mapIsEmpty!24731 () Bool)

(assert (=> mapIsEmpty!24731 mapRes!24731))

(declare-fun b!839537 () Bool)

(assert (=> b!839537 (= e!468693 (not true))))

(assert (=> b!839537 e!468690))

(declare-fun c!91474 () Bool)

(assert (=> b!839537 (= c!91474 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28818 0))(
  ( (Unit!28819) )
))
(declare-fun lt!381059 () Unit!28818)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!245 (array!47139 array!47141 (_ BitVec 32) (_ BitVec 32) V!25609 V!25609 (_ BitVec 32) (_ BitVec 64) V!25609 (_ BitVec 32) Int) Unit!28818)

(assert (=> b!839537 (= lt!381059 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!245 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570600 () Bool)

(assert (=> start!72538 (=> (not res!570600) (not e!468693))))

(assert (=> start!72538 (= res!570600 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23037 _keys!868))))))

(assert (=> start!72538 e!468693))

(assert (=> start!72538 tp_is_empty!15421))

(assert (=> start!72538 true))

(assert (=> start!72538 tp!47764))

(declare-fun array_inv!18038 (array!47139) Bool)

(assert (=> start!72538 (array_inv!18038 _keys!868)))

(declare-fun array_inv!18039 (array!47141) Bool)

(assert (=> start!72538 (and (array_inv!18039 _values!688) e!468689)))

(declare-fun b!839547 () Bool)

(declare-fun res!570598 () Bool)

(assert (=> b!839547 (=> (not res!570598) (not e!468693))))

(declare-datatypes ((List!15975 0))(
  ( (Nil!15972) (Cons!15971 (h!17108 (_ BitVec 64)) (t!22338 List!15975)) )
))
(declare-fun arrayNoDuplicates!0 (array!47139 (_ BitVec 32) List!15975) Bool)

(assert (=> b!839547 (= res!570598 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15972))))

(declare-fun mapNonEmpty!24731 () Bool)

(declare-fun tp!47765 () Bool)

(assert (=> mapNonEmpty!24731 (= mapRes!24731 (and tp!47765 e!468694))))

(declare-fun mapKey!24731 () (_ BitVec 32))

(declare-fun mapRest!24731 () (Array (_ BitVec 32) ValueCell!7271))

(declare-fun mapValue!24731 () ValueCell!7271)

(assert (=> mapNonEmpty!24731 (= (arr!22597 _values!688) (store mapRest!24731 mapKey!24731 mapValue!24731))))

(declare-fun b!839548 () Bool)

(declare-fun res!570594 () Bool)

(assert (=> b!839548 (=> (not res!570594) (not e!468693))))

(assert (=> b!839548 (= res!570594 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23037 _keys!868))))))

(declare-fun b!839549 () Bool)

(declare-fun res!570596 () Bool)

(assert (=> b!839549 (=> (not res!570596) (not e!468693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839549 (= res!570596 (validKeyInArray!0 k0!854))))

(declare-fun bm!36941 () Bool)

(assert (=> bm!36941 (= call!36944 (getCurrentListMapNoExtraKeys!2559 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72538 res!570600) b!839538))

(assert (= (and b!839538 res!570595) b!839539))

(assert (= (and b!839539 res!570599) b!839541))

(assert (= (and b!839541 res!570597) b!839547))

(assert (= (and b!839547 res!570598) b!839548))

(assert (= (and b!839548 res!570594) b!839549))

(assert (= (and b!839549 res!570596) b!839543))

(assert (= (and b!839543 res!570601) b!839537))

(assert (= (and b!839537 c!91474) b!839544))

(assert (= (and b!839537 (not c!91474)) b!839542))

(assert (= (or b!839544 b!839542) bm!36940))

(assert (= (or b!839544 b!839542) bm!36941))

(assert (= (and b!839540 condMapEmpty!24731) mapIsEmpty!24731))

(assert (= (and b!839540 (not condMapEmpty!24731)) mapNonEmpty!24731))

(get-info :version)

(assert (= (and mapNonEmpty!24731 ((_ is ValueCellFull!7271) mapValue!24731)) b!839546))

(assert (= (and b!839540 ((_ is ValueCellFull!7271) mapDefault!24731)) b!839545))

(assert (= start!72538 b!839540))

(declare-fun m!784301 () Bool)

(assert (=> b!839549 m!784301))

(declare-fun m!784303 () Bool)

(assert (=> b!839544 m!784303))

(declare-fun m!784305 () Bool)

(assert (=> bm!36941 m!784305))

(declare-fun m!784307 () Bool)

(assert (=> b!839537 m!784307))

(declare-fun m!784309 () Bool)

(assert (=> b!839538 m!784309))

(declare-fun m!784311 () Bool)

(assert (=> b!839543 m!784311))

(declare-fun m!784313 () Bool)

(assert (=> b!839547 m!784313))

(declare-fun m!784315 () Bool)

(assert (=> start!72538 m!784315))

(declare-fun m!784317 () Bool)

(assert (=> start!72538 m!784317))

(declare-fun m!784319 () Bool)

(assert (=> mapNonEmpty!24731 m!784319))

(declare-fun m!784321 () Bool)

(assert (=> b!839541 m!784321))

(declare-fun m!784323 () Bool)

(assert (=> bm!36940 m!784323))

(declare-fun m!784325 () Bool)

(assert (=> bm!36940 m!784325))

(check-sat (not b!839549) (not bm!36941) (not b_next!13555) tp_is_empty!15421 (not b!839544) (not b!839541) (not b!839538) (not mapNonEmpty!24731) (not b!839537) (not bm!36940) (not start!72538) (not b!839547) b_and!22651)
(check-sat b_and!22651 (not b_next!13555))
