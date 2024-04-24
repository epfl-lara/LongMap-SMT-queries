; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72544 () Bool)

(assert start!72544)

(declare-fun b_free!13561 () Bool)

(declare-fun b_next!13561 () Bool)

(assert (=> start!72544 (= b_free!13561 (not b_next!13561))))

(declare-fun tp!47782 () Bool)

(declare-fun b_and!22657 () Bool)

(assert (=> start!72544 (= tp!47782 b_and!22657)))

(declare-datatypes ((V!25617 0))(
  ( (V!25618 (val!7761 Int)) )
))
(declare-datatypes ((tuple2!10198 0))(
  ( (tuple2!10199 (_1!5110 (_ BitVec 64)) (_2!5110 V!25617)) )
))
(declare-datatypes ((List!15979 0))(
  ( (Nil!15976) (Cons!15975 (h!17112 tuple2!10198) (t!22342 List!15979)) )
))
(declare-datatypes ((ListLongMap!8969 0))(
  ( (ListLongMap!8970 (toList!4500 List!15979)) )
))
(declare-fun call!36962 () ListLongMap!8969)

(declare-fun v!557 () V!25617)

(declare-fun e!468743 () Bool)

(declare-fun b!839654 () Bool)

(declare-fun call!36961 () ListLongMap!8969)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2016 (ListLongMap!8969 tuple2!10198) ListLongMap!8969)

(assert (=> b!839654 (= e!468743 (= call!36962 (+!2016 call!36961 (tuple2!10199 k0!854 v!557))))))

(declare-fun b!839655 () Bool)

(declare-fun e!468747 () Bool)

(declare-fun tp_is_empty!15427 () Bool)

(assert (=> b!839655 (= e!468747 tp_is_empty!15427)))

(declare-fun b!839656 () Bool)

(declare-fun res!570669 () Bool)

(declare-fun e!468744 () Bool)

(assert (=> b!839656 (=> (not res!570669) (not e!468744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839656 (= res!570669 (validKeyInArray!0 k0!854))))

(declare-fun b!839657 () Bool)

(declare-fun res!570673 () Bool)

(assert (=> b!839657 (=> (not res!570673) (not e!468744))))

(declare-datatypes ((array!47151 0))(
  ( (array!47152 (arr!22602 (Array (_ BitVec 32) (_ BitVec 64))) (size!23043 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47151)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47151 (_ BitVec 32)) Bool)

(assert (=> b!839657 (= res!570673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24740 () Bool)

(declare-fun mapRes!24740 () Bool)

(assert (=> mapIsEmpty!24740 mapRes!24740))

(declare-fun b!839659 () Bool)

(assert (=> b!839659 (= e!468744 (not true))))

(assert (=> b!839659 e!468743))

(declare-fun c!91483 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839659 (= c!91483 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28824 0))(
  ( (Unit!28825) )
))
(declare-fun lt!381068 () Unit!28824)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7274 0))(
  ( (ValueCellFull!7274 (v!10186 V!25617)) (EmptyCell!7274) )
))
(declare-datatypes ((array!47153 0))(
  ( (array!47154 (arr!22603 (Array (_ BitVec 32) ValueCell!7274)) (size!23044 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47153)

(declare-fun minValue!654 () V!25617)

(declare-fun zeroValue!654 () V!25617)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!248 (array!47151 array!47153 (_ BitVec 32) (_ BitVec 32) V!25617 V!25617 (_ BitVec 32) (_ BitVec 64) V!25617 (_ BitVec 32) Int) Unit!28824)

(assert (=> b!839659 (= lt!381068 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!248 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!36958 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2562 (array!47151 array!47153 (_ BitVec 32) (_ BitVec 32) V!25617 V!25617 (_ BitVec 32) Int) ListLongMap!8969)

(assert (=> bm!36958 (= call!36962 (getCurrentListMapNoExtraKeys!2562 _keys!868 (array!47154 (store (arr!22603 _values!688) i!612 (ValueCellFull!7274 v!557)) (size!23044 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839660 () Bool)

(declare-fun res!570671 () Bool)

(assert (=> b!839660 (=> (not res!570671) (not e!468744))))

(assert (=> b!839660 (= res!570671 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23043 _keys!868))))))

(declare-fun b!839661 () Bool)

(declare-fun res!570672 () Bool)

(assert (=> b!839661 (=> (not res!570672) (not e!468744))))

(assert (=> b!839661 (= res!570672 (and (= (select (arr!22602 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23043 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839662 () Bool)

(assert (=> b!839662 (= e!468743 (= call!36962 call!36961))))

(declare-fun b!839663 () Bool)

(declare-fun res!570668 () Bool)

(assert (=> b!839663 (=> (not res!570668) (not e!468744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839663 (= res!570668 (validMask!0 mask!1196))))

(declare-fun b!839664 () Bool)

(declare-fun e!468746 () Bool)

(assert (=> b!839664 (= e!468746 tp_is_empty!15427)))

(declare-fun bm!36959 () Bool)

(assert (=> bm!36959 (= call!36961 (getCurrentListMapNoExtraKeys!2562 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24740 () Bool)

(declare-fun tp!47783 () Bool)

(assert (=> mapNonEmpty!24740 (= mapRes!24740 (and tp!47783 e!468747))))

(declare-fun mapRest!24740 () (Array (_ BitVec 32) ValueCell!7274))

(declare-fun mapValue!24740 () ValueCell!7274)

(declare-fun mapKey!24740 () (_ BitVec 32))

(assert (=> mapNonEmpty!24740 (= (arr!22603 _values!688) (store mapRest!24740 mapKey!24740 mapValue!24740))))

(declare-fun b!839658 () Bool)

(declare-fun res!570670 () Bool)

(assert (=> b!839658 (=> (not res!570670) (not e!468744))))

(declare-datatypes ((List!15980 0))(
  ( (Nil!15977) (Cons!15976 (h!17113 (_ BitVec 64)) (t!22343 List!15980)) )
))
(declare-fun arrayNoDuplicates!0 (array!47151 (_ BitVec 32) List!15980) Bool)

(assert (=> b!839658 (= res!570670 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15977))))

(declare-fun res!570667 () Bool)

(assert (=> start!72544 (=> (not res!570667) (not e!468744))))

(assert (=> start!72544 (= res!570667 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23043 _keys!868))))))

(assert (=> start!72544 e!468744))

(assert (=> start!72544 tp_is_empty!15427))

(assert (=> start!72544 true))

(assert (=> start!72544 tp!47782))

(declare-fun array_inv!18044 (array!47151) Bool)

(assert (=> start!72544 (array_inv!18044 _keys!868)))

(declare-fun e!468745 () Bool)

(declare-fun array_inv!18045 (array!47153) Bool)

(assert (=> start!72544 (and (array_inv!18045 _values!688) e!468745)))

(declare-fun b!839665 () Bool)

(declare-fun res!570666 () Bool)

(assert (=> b!839665 (=> (not res!570666) (not e!468744))))

(assert (=> b!839665 (= res!570666 (and (= (size!23044 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23043 _keys!868) (size!23044 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839666 () Bool)

(assert (=> b!839666 (= e!468745 (and e!468746 mapRes!24740))))

(declare-fun condMapEmpty!24740 () Bool)

(declare-fun mapDefault!24740 () ValueCell!7274)

(assert (=> b!839666 (= condMapEmpty!24740 (= (arr!22603 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7274)) mapDefault!24740)))))

(assert (= (and start!72544 res!570667) b!839663))

(assert (= (and b!839663 res!570668) b!839665))

(assert (= (and b!839665 res!570666) b!839657))

(assert (= (and b!839657 res!570673) b!839658))

(assert (= (and b!839658 res!570670) b!839660))

(assert (= (and b!839660 res!570671) b!839656))

(assert (= (and b!839656 res!570669) b!839661))

(assert (= (and b!839661 res!570672) b!839659))

(assert (= (and b!839659 c!91483) b!839654))

(assert (= (and b!839659 (not c!91483)) b!839662))

(assert (= (or b!839654 b!839662) bm!36958))

(assert (= (or b!839654 b!839662) bm!36959))

(assert (= (and b!839666 condMapEmpty!24740) mapIsEmpty!24740))

(assert (= (and b!839666 (not condMapEmpty!24740)) mapNonEmpty!24740))

(get-info :version)

(assert (= (and mapNonEmpty!24740 ((_ is ValueCellFull!7274) mapValue!24740)) b!839655))

(assert (= (and b!839666 ((_ is ValueCellFull!7274) mapDefault!24740)) b!839664))

(assert (= start!72544 b!839666))

(declare-fun m!784379 () Bool)

(assert (=> b!839656 m!784379))

(declare-fun m!784381 () Bool)

(assert (=> bm!36958 m!784381))

(declare-fun m!784383 () Bool)

(assert (=> bm!36958 m!784383))

(declare-fun m!784385 () Bool)

(assert (=> mapNonEmpty!24740 m!784385))

(declare-fun m!784387 () Bool)

(assert (=> b!839657 m!784387))

(declare-fun m!784389 () Bool)

(assert (=> b!839654 m!784389))

(declare-fun m!784391 () Bool)

(assert (=> b!839659 m!784391))

(declare-fun m!784393 () Bool)

(assert (=> b!839661 m!784393))

(declare-fun m!784395 () Bool)

(assert (=> start!72544 m!784395))

(declare-fun m!784397 () Bool)

(assert (=> start!72544 m!784397))

(declare-fun m!784399 () Bool)

(assert (=> b!839658 m!784399))

(declare-fun m!784401 () Bool)

(assert (=> bm!36959 m!784401))

(declare-fun m!784403 () Bool)

(assert (=> b!839663 m!784403))

(check-sat (not mapNonEmpty!24740) (not b!839656) (not bm!36958) (not start!72544) tp_is_empty!15427 (not bm!36959) (not b!839658) (not b!839659) (not b!839654) b_and!22657 (not b_next!13561) (not b!839657) (not b!839663))
(check-sat b_and!22657 (not b_next!13561))
