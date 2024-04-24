; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72568 () Bool)

(assert start!72568)

(declare-fun b_free!13585 () Bool)

(declare-fun b_next!13585 () Bool)

(assert (=> start!72568 (= b_free!13585 (not b_next!13585))))

(declare-fun tp!47854 () Bool)

(declare-fun b_and!22681 () Bool)

(assert (=> start!72568 (= tp!47854 b_and!22681)))

(declare-fun b!840122 () Bool)

(declare-fun res!570959 () Bool)

(declare-fun e!468961 () Bool)

(assert (=> b!840122 (=> (not res!570959) (not e!468961))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840122 (= res!570959 (validMask!0 mask!1196))))

(declare-fun b!840123 () Bool)

(declare-fun e!468964 () Bool)

(declare-fun tp_is_empty!15451 () Bool)

(assert (=> b!840123 (= e!468964 tp_is_empty!15451)))

(declare-fun b!840124 () Bool)

(declare-fun res!570958 () Bool)

(assert (=> b!840124 (=> (not res!570958) (not e!468961))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47197 0))(
  ( (array!47198 (arr!22625 (Array (_ BitVec 32) (_ BitVec 64))) (size!23066 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47197)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!840124 (= res!570958 (and (= (select (arr!22625 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23066 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840125 () Bool)

(declare-fun e!468962 () Bool)

(declare-datatypes ((V!25649 0))(
  ( (V!25650 (val!7773 Int)) )
))
(declare-datatypes ((tuple2!10218 0))(
  ( (tuple2!10219 (_1!5120 (_ BitVec 64)) (_2!5120 V!25649)) )
))
(declare-datatypes ((List!15995 0))(
  ( (Nil!15992) (Cons!15991 (h!17128 tuple2!10218) (t!22358 List!15995)) )
))
(declare-datatypes ((ListLongMap!8989 0))(
  ( (ListLongMap!8990 (toList!4510 List!15995)) )
))
(declare-fun call!37034 () ListLongMap!8989)

(declare-fun call!37033 () ListLongMap!8989)

(assert (=> b!840125 (= e!468962 (= call!37034 call!37033))))

(declare-fun b!840126 () Bool)

(declare-fun e!468959 () Bool)

(assert (=> b!840126 (= e!468959 tp_is_empty!15451)))

(declare-fun b!840128 () Bool)

(declare-fun res!570955 () Bool)

(assert (=> b!840128 (=> (not res!570955) (not e!468961))))

(assert (=> b!840128 (= res!570955 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23066 _keys!868))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37030 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7286 0))(
  ( (ValueCellFull!7286 (v!10198 V!25649)) (EmptyCell!7286) )
))
(declare-datatypes ((array!47199 0))(
  ( (array!47200 (arr!22626 (Array (_ BitVec 32) ValueCell!7286)) (size!23067 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47199)

(declare-fun minValue!654 () V!25649)

(declare-fun zeroValue!654 () V!25649)

(declare-fun getCurrentListMapNoExtraKeys!2572 (array!47197 array!47199 (_ BitVec 32) (_ BitVec 32) V!25649 V!25649 (_ BitVec 32) Int) ListLongMap!8989)

(assert (=> bm!37030 (= call!37033 (getCurrentListMapNoExtraKeys!2572 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840129 () Bool)

(declare-fun e!468963 () Bool)

(declare-fun mapRes!24776 () Bool)

(assert (=> b!840129 (= e!468963 (and e!468959 mapRes!24776))))

(declare-fun condMapEmpty!24776 () Bool)

(declare-fun mapDefault!24776 () ValueCell!7286)

(assert (=> b!840129 (= condMapEmpty!24776 (= (arr!22626 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7286)) mapDefault!24776)))))

(declare-fun v!557 () V!25649)

(declare-fun b!840130 () Bool)

(declare-fun +!2024 (ListLongMap!8989 tuple2!10218) ListLongMap!8989)

(assert (=> b!840130 (= e!468962 (= call!37034 (+!2024 call!37033 (tuple2!10219 k0!854 v!557))))))

(declare-fun b!840131 () Bool)

(declare-fun res!570960 () Bool)

(assert (=> b!840131 (=> (not res!570960) (not e!468961))))

(declare-datatypes ((List!15996 0))(
  ( (Nil!15993) (Cons!15992 (h!17129 (_ BitVec 64)) (t!22359 List!15996)) )
))
(declare-fun arrayNoDuplicates!0 (array!47197 (_ BitVec 32) List!15996) Bool)

(assert (=> b!840131 (= res!570960 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15993))))

(declare-fun b!840132 () Bool)

(declare-fun res!570956 () Bool)

(assert (=> b!840132 (=> (not res!570956) (not e!468961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47197 (_ BitVec 32)) Bool)

(assert (=> b!840132 (= res!570956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24776 () Bool)

(declare-fun tp!47855 () Bool)

(assert (=> mapNonEmpty!24776 (= mapRes!24776 (and tp!47855 e!468964))))

(declare-fun mapValue!24776 () ValueCell!7286)

(declare-fun mapKey!24776 () (_ BitVec 32))

(declare-fun mapRest!24776 () (Array (_ BitVec 32) ValueCell!7286))

(assert (=> mapNonEmpty!24776 (= (arr!22626 _values!688) (store mapRest!24776 mapKey!24776 mapValue!24776))))

(declare-fun b!840133 () Bool)

(declare-fun res!570957 () Bool)

(assert (=> b!840133 (=> (not res!570957) (not e!468961))))

(assert (=> b!840133 (= res!570957 (and (= (size!23067 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23066 _keys!868) (size!23067 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24776 () Bool)

(assert (=> mapIsEmpty!24776 mapRes!24776))

(declare-fun b!840134 () Bool)

(assert (=> b!840134 (= e!468961 (not true))))

(assert (=> b!840134 e!468962))

(declare-fun c!91519 () Bool)

(assert (=> b!840134 (= c!91519 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28836 0))(
  ( (Unit!28837) )
))
(declare-fun lt!381104 () Unit!28836)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!254 (array!47197 array!47199 (_ BitVec 32) (_ BitVec 32) V!25649 V!25649 (_ BitVec 32) (_ BitVec 64) V!25649 (_ BitVec 32) Int) Unit!28836)

(assert (=> b!840134 (= lt!381104 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37031 () Bool)

(assert (=> bm!37031 (= call!37034 (getCurrentListMapNoExtraKeys!2572 _keys!868 (array!47200 (store (arr!22626 _values!688) i!612 (ValueCellFull!7286 v!557)) (size!23067 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570954 () Bool)

(assert (=> start!72568 (=> (not res!570954) (not e!468961))))

(assert (=> start!72568 (= res!570954 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23066 _keys!868))))))

(assert (=> start!72568 e!468961))

(assert (=> start!72568 tp_is_empty!15451))

(assert (=> start!72568 true))

(assert (=> start!72568 tp!47854))

(declare-fun array_inv!18062 (array!47197) Bool)

(assert (=> start!72568 (array_inv!18062 _keys!868)))

(declare-fun array_inv!18063 (array!47199) Bool)

(assert (=> start!72568 (and (array_inv!18063 _values!688) e!468963)))

(declare-fun b!840127 () Bool)

(declare-fun res!570961 () Bool)

(assert (=> b!840127 (=> (not res!570961) (not e!468961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840127 (= res!570961 (validKeyInArray!0 k0!854))))

(assert (= (and start!72568 res!570954) b!840122))

(assert (= (and b!840122 res!570959) b!840133))

(assert (= (and b!840133 res!570957) b!840132))

(assert (= (and b!840132 res!570956) b!840131))

(assert (= (and b!840131 res!570960) b!840128))

(assert (= (and b!840128 res!570955) b!840127))

(assert (= (and b!840127 res!570961) b!840124))

(assert (= (and b!840124 res!570958) b!840134))

(assert (= (and b!840134 c!91519) b!840130))

(assert (= (and b!840134 (not c!91519)) b!840125))

(assert (= (or b!840130 b!840125) bm!37031))

(assert (= (or b!840130 b!840125) bm!37030))

(assert (= (and b!840129 condMapEmpty!24776) mapIsEmpty!24776))

(assert (= (and b!840129 (not condMapEmpty!24776)) mapNonEmpty!24776))

(get-info :version)

(assert (= (and mapNonEmpty!24776 ((_ is ValueCellFull!7286) mapValue!24776)) b!840123))

(assert (= (and b!840129 ((_ is ValueCellFull!7286) mapDefault!24776)) b!840126))

(assert (= start!72568 b!840129))

(declare-fun m!784691 () Bool)

(assert (=> b!840127 m!784691))

(declare-fun m!784693 () Bool)

(assert (=> bm!37030 m!784693))

(declare-fun m!784695 () Bool)

(assert (=> start!72568 m!784695))

(declare-fun m!784697 () Bool)

(assert (=> start!72568 m!784697))

(declare-fun m!784699 () Bool)

(assert (=> mapNonEmpty!24776 m!784699))

(declare-fun m!784701 () Bool)

(assert (=> bm!37031 m!784701))

(declare-fun m!784703 () Bool)

(assert (=> bm!37031 m!784703))

(declare-fun m!784705 () Bool)

(assert (=> b!840131 m!784705))

(declare-fun m!784707 () Bool)

(assert (=> b!840130 m!784707))

(declare-fun m!784709 () Bool)

(assert (=> b!840134 m!784709))

(declare-fun m!784711 () Bool)

(assert (=> b!840122 m!784711))

(declare-fun m!784713 () Bool)

(assert (=> b!840132 m!784713))

(declare-fun m!784715 () Bool)

(assert (=> b!840124 m!784715))

(check-sat (not b!840127) (not b!840122) b_and!22681 (not b!840132) (not mapNonEmpty!24776) (not b_next!13585) (not b!840130) (not start!72568) (not bm!37030) (not bm!37031) (not b!840131) (not b!840134) tp_is_empty!15451)
(check-sat b_and!22681 (not b_next!13585))
