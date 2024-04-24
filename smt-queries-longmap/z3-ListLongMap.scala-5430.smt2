; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72532 () Bool)

(assert start!72532)

(declare-fun b_free!13549 () Bool)

(declare-fun b_next!13549 () Bool)

(assert (=> start!72532 (= b_free!13549 (not b_next!13549))))

(declare-fun tp!47746 () Bool)

(declare-fun b_and!22645 () Bool)

(assert (=> start!72532 (= tp!47746 b_and!22645)))

(declare-fun b!839420 () Bool)

(declare-fun e!468636 () Bool)

(declare-fun tp_is_empty!15415 () Bool)

(assert (=> b!839420 (= e!468636 tp_is_empty!15415)))

(declare-fun b!839421 () Bool)

(declare-fun res!570525 () Bool)

(declare-fun e!468639 () Bool)

(assert (=> b!839421 (=> (not res!570525) (not e!468639))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47127 0))(
  ( (array!47128 (arr!22590 (Array (_ BitVec 32) (_ BitVec 64))) (size!23031 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47127)

(declare-datatypes ((V!25601 0))(
  ( (V!25602 (val!7755 Int)) )
))
(declare-datatypes ((ValueCell!7268 0))(
  ( (ValueCellFull!7268 (v!10180 V!25601)) (EmptyCell!7268) )
))
(declare-datatypes ((array!47129 0))(
  ( (array!47130 (arr!22591 (Array (_ BitVec 32) ValueCell!7268)) (size!23032 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47129)

(assert (=> b!839421 (= res!570525 (and (= (size!23032 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23031 _keys!868) (size!23032 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839423 () Bool)

(declare-fun res!570529 () Bool)

(assert (=> b!839423 (=> (not res!570529) (not e!468639))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839423 (= res!570529 (and (= (select (arr!22590 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23031 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839424 () Bool)

(declare-fun e!468635 () Bool)

(assert (=> b!839424 (= e!468635 tp_is_empty!15415)))

(declare-fun b!839425 () Bool)

(declare-fun e!468640 () Bool)

(declare-fun mapRes!24722 () Bool)

(assert (=> b!839425 (= e!468640 (and e!468635 mapRes!24722))))

(declare-fun condMapEmpty!24722 () Bool)

(declare-fun mapDefault!24722 () ValueCell!7268)

(assert (=> b!839425 (= condMapEmpty!24722 (= (arr!22591 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7268)) mapDefault!24722)))))

(declare-fun mapIsEmpty!24722 () Bool)

(assert (=> mapIsEmpty!24722 mapRes!24722))

(declare-fun b!839426 () Bool)

(declare-fun res!570524 () Bool)

(assert (=> b!839426 (=> (not res!570524) (not e!468639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839426 (= res!570524 (validMask!0 mask!1196))))

(declare-fun b!839427 () Bool)

(declare-fun res!570523 () Bool)

(assert (=> b!839427 (=> (not res!570523) (not e!468639))))

(declare-datatypes ((List!15970 0))(
  ( (Nil!15967) (Cons!15966 (h!17103 (_ BitVec 64)) (t!22333 List!15970)) )
))
(declare-fun arrayNoDuplicates!0 (array!47127 (_ BitVec 32) List!15970) Bool)

(assert (=> b!839427 (= res!570523 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15967))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10186 0))(
  ( (tuple2!10187 (_1!5104 (_ BitVec 64)) (_2!5104 V!25601)) )
))
(declare-datatypes ((List!15971 0))(
  ( (Nil!15968) (Cons!15967 (h!17104 tuple2!10186) (t!22334 List!15971)) )
))
(declare-datatypes ((ListLongMap!8957 0))(
  ( (ListLongMap!8958 (toList!4494 List!15971)) )
))
(declare-fun call!36925 () ListLongMap!8957)

(declare-fun bm!36922 () Bool)

(declare-fun minValue!654 () V!25601)

(declare-fun zeroValue!654 () V!25601)

(declare-fun getCurrentListMapNoExtraKeys!2557 (array!47127 array!47129 (_ BitVec 32) (_ BitVec 32) V!25601 V!25601 (_ BitVec 32) Int) ListLongMap!8957)

(assert (=> bm!36922 (= call!36925 (getCurrentListMapNoExtraKeys!2557 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24722 () Bool)

(declare-fun tp!47747 () Bool)

(assert (=> mapNonEmpty!24722 (= mapRes!24722 (and tp!47747 e!468636))))

(declare-fun mapValue!24722 () ValueCell!7268)

(declare-fun mapRest!24722 () (Array (_ BitVec 32) ValueCell!7268))

(declare-fun mapKey!24722 () (_ BitVec 32))

(assert (=> mapNonEmpty!24722 (= (arr!22591 _values!688) (store mapRest!24722 mapKey!24722 mapValue!24722))))

(declare-fun call!36926 () ListLongMap!8957)

(declare-fun v!557 () V!25601)

(declare-fun b!839428 () Bool)

(declare-fun e!468638 () Bool)

(declare-fun +!2010 (ListLongMap!8957 tuple2!10186) ListLongMap!8957)

(assert (=> b!839428 (= e!468638 (= call!36926 (+!2010 call!36925 (tuple2!10187 k0!854 v!557))))))

(declare-fun b!839429 () Bool)

(assert (=> b!839429 (= e!468639 (not true))))

(assert (=> b!839429 e!468638))

(declare-fun c!91465 () Bool)

(assert (=> b!839429 (= c!91465 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28812 0))(
  ( (Unit!28813) )
))
(declare-fun lt!381050 () Unit!28812)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!242 (array!47127 array!47129 (_ BitVec 32) (_ BitVec 32) V!25601 V!25601 (_ BitVec 32) (_ BitVec 64) V!25601 (_ BitVec 32) Int) Unit!28812)

(assert (=> b!839429 (= lt!381050 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!242 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839430 () Bool)

(assert (=> b!839430 (= e!468638 (= call!36926 call!36925))))

(declare-fun b!839431 () Bool)

(declare-fun res!570527 () Bool)

(assert (=> b!839431 (=> (not res!570527) (not e!468639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47127 (_ BitVec 32)) Bool)

(assert (=> b!839431 (= res!570527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!570522 () Bool)

(assert (=> start!72532 (=> (not res!570522) (not e!468639))))

(assert (=> start!72532 (= res!570522 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23031 _keys!868))))))

(assert (=> start!72532 e!468639))

(assert (=> start!72532 tp_is_empty!15415))

(assert (=> start!72532 true))

(assert (=> start!72532 tp!47746))

(declare-fun array_inv!18034 (array!47127) Bool)

(assert (=> start!72532 (array_inv!18034 _keys!868)))

(declare-fun array_inv!18035 (array!47129) Bool)

(assert (=> start!72532 (and (array_inv!18035 _values!688) e!468640)))

(declare-fun b!839422 () Bool)

(declare-fun res!570528 () Bool)

(assert (=> b!839422 (=> (not res!570528) (not e!468639))))

(assert (=> b!839422 (= res!570528 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23031 _keys!868))))))

(declare-fun bm!36923 () Bool)

(assert (=> bm!36923 (= call!36926 (getCurrentListMapNoExtraKeys!2557 _keys!868 (array!47130 (store (arr!22591 _values!688) i!612 (ValueCellFull!7268 v!557)) (size!23032 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839432 () Bool)

(declare-fun res!570526 () Bool)

(assert (=> b!839432 (=> (not res!570526) (not e!468639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839432 (= res!570526 (validKeyInArray!0 k0!854))))

(assert (= (and start!72532 res!570522) b!839426))

(assert (= (and b!839426 res!570524) b!839421))

(assert (= (and b!839421 res!570525) b!839431))

(assert (= (and b!839431 res!570527) b!839427))

(assert (= (and b!839427 res!570523) b!839422))

(assert (= (and b!839422 res!570528) b!839432))

(assert (= (and b!839432 res!570526) b!839423))

(assert (= (and b!839423 res!570529) b!839429))

(assert (= (and b!839429 c!91465) b!839428))

(assert (= (and b!839429 (not c!91465)) b!839430))

(assert (= (or b!839428 b!839430) bm!36923))

(assert (= (or b!839428 b!839430) bm!36922))

(assert (= (and b!839425 condMapEmpty!24722) mapIsEmpty!24722))

(assert (= (and b!839425 (not condMapEmpty!24722)) mapNonEmpty!24722))

(get-info :version)

(assert (= (and mapNonEmpty!24722 ((_ is ValueCellFull!7268) mapValue!24722)) b!839420))

(assert (= (and b!839425 ((_ is ValueCellFull!7268) mapDefault!24722)) b!839424))

(assert (= start!72532 b!839425))

(declare-fun m!784223 () Bool)

(assert (=> b!839427 m!784223))

(declare-fun m!784225 () Bool)

(assert (=> start!72532 m!784225))

(declare-fun m!784227 () Bool)

(assert (=> start!72532 m!784227))

(declare-fun m!784229 () Bool)

(assert (=> b!839432 m!784229))

(declare-fun m!784231 () Bool)

(assert (=> mapNonEmpty!24722 m!784231))

(declare-fun m!784233 () Bool)

(assert (=> b!839426 m!784233))

(declare-fun m!784235 () Bool)

(assert (=> b!839423 m!784235))

(declare-fun m!784237 () Bool)

(assert (=> b!839429 m!784237))

(declare-fun m!784239 () Bool)

(assert (=> bm!36923 m!784239))

(declare-fun m!784241 () Bool)

(assert (=> bm!36923 m!784241))

(declare-fun m!784243 () Bool)

(assert (=> b!839431 m!784243))

(declare-fun m!784245 () Bool)

(assert (=> b!839428 m!784245))

(declare-fun m!784247 () Bool)

(assert (=> bm!36922 m!784247))

(check-sat b_and!22645 (not bm!36922) (not b!839427) (not b!839431) (not b!839429) (not bm!36923) (not b!839432) (not b!839426) (not b!839428) (not b_next!13549) tp_is_empty!15415 (not start!72532) (not mapNonEmpty!24722))
(check-sat b_and!22645 (not b_next!13549))
