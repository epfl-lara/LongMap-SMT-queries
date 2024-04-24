; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72574 () Bool)

(assert start!72574)

(declare-fun b_free!13591 () Bool)

(declare-fun b_next!13591 () Bool)

(assert (=> start!72574 (= b_free!13591 (not b_next!13591))))

(declare-fun tp!47872 () Bool)

(declare-fun b_and!22687 () Bool)

(assert (=> start!72574 (= tp!47872 b_and!22687)))

(declare-fun b!840239 () Bool)

(declare-fun res!571031 () Bool)

(declare-fun e!469017 () Bool)

(assert (=> b!840239 (=> (not res!571031) (not e!469017))))

(declare-datatypes ((array!47209 0))(
  ( (array!47210 (arr!22631 (Array (_ BitVec 32) (_ BitVec 64))) (size!23072 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47209)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47209 (_ BitVec 32)) Bool)

(assert (=> b!840239 (= res!571031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24785 () Bool)

(declare-fun mapRes!24785 () Bool)

(declare-fun tp!47873 () Bool)

(declare-fun e!469013 () Bool)

(assert (=> mapNonEmpty!24785 (= mapRes!24785 (and tp!47873 e!469013))))

(declare-datatypes ((V!25657 0))(
  ( (V!25658 (val!7776 Int)) )
))
(declare-datatypes ((ValueCell!7289 0))(
  ( (ValueCellFull!7289 (v!10201 V!25657)) (EmptyCell!7289) )
))
(declare-fun mapValue!24785 () ValueCell!7289)

(declare-fun mapRest!24785 () (Array (_ BitVec 32) ValueCell!7289))

(declare-fun mapKey!24785 () (_ BitVec 32))

(declare-datatypes ((array!47211 0))(
  ( (array!47212 (arr!22632 (Array (_ BitVec 32) ValueCell!7289)) (size!23073 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47211)

(assert (=> mapNonEmpty!24785 (= (arr!22632 _values!688) (store mapRest!24785 mapKey!24785 mapValue!24785))))

(declare-fun b!840240 () Bool)

(declare-fun e!469015 () Bool)

(declare-datatypes ((tuple2!10224 0))(
  ( (tuple2!10225 (_1!5123 (_ BitVec 64)) (_2!5123 V!25657)) )
))
(declare-datatypes ((List!16001 0))(
  ( (Nil!15998) (Cons!15997 (h!17134 tuple2!10224) (t!22364 List!16001)) )
))
(declare-datatypes ((ListLongMap!8995 0))(
  ( (ListLongMap!8996 (toList!4513 List!16001)) )
))
(declare-fun call!37051 () ListLongMap!8995)

(declare-fun call!37052 () ListLongMap!8995)

(assert (=> b!840240 (= e!469015 (= call!37051 call!37052))))

(declare-fun b!840241 () Bool)

(declare-fun res!571027 () Bool)

(assert (=> b!840241 (=> (not res!571027) (not e!469017))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840241 (= res!571027 (validKeyInArray!0 k0!854))))

(declare-fun b!840242 () Bool)

(declare-fun tp_is_empty!15457 () Bool)

(assert (=> b!840242 (= e!469013 tp_is_empty!15457)))

(declare-fun b!840243 () Bool)

(declare-fun e!469016 () Bool)

(declare-fun e!469018 () Bool)

(assert (=> b!840243 (= e!469016 (and e!469018 mapRes!24785))))

(declare-fun condMapEmpty!24785 () Bool)

(declare-fun mapDefault!24785 () ValueCell!7289)

(assert (=> b!840243 (= condMapEmpty!24785 (= (arr!22632 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7289)) mapDefault!24785)))))

(declare-fun mapIsEmpty!24785 () Bool)

(assert (=> mapIsEmpty!24785 mapRes!24785))

(declare-fun res!571028 () Bool)

(assert (=> start!72574 (=> (not res!571028) (not e!469017))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72574 (= res!571028 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23072 _keys!868))))))

(assert (=> start!72574 e!469017))

(assert (=> start!72574 tp_is_empty!15457))

(assert (=> start!72574 true))

(assert (=> start!72574 tp!47872))

(declare-fun array_inv!18066 (array!47209) Bool)

(assert (=> start!72574 (array_inv!18066 _keys!868)))

(declare-fun array_inv!18067 (array!47211) Bool)

(assert (=> start!72574 (and (array_inv!18067 _values!688) e!469016)))

(declare-fun b!840244 () Bool)

(assert (=> b!840244 (= e!469017 (not true))))

(assert (=> b!840244 e!469015))

(declare-fun c!91528 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840244 (= c!91528 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28840 0))(
  ( (Unit!28841) )
))
(declare-fun lt!381113 () Unit!28840)

(declare-fun v!557 () V!25657)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25657)

(declare-fun zeroValue!654 () V!25657)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!256 (array!47209 array!47211 (_ BitVec 32) (_ BitVec 32) V!25657 V!25657 (_ BitVec 32) (_ BitVec 64) V!25657 (_ BitVec 32) Int) Unit!28840)

(assert (=> b!840244 (= lt!381113 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!256 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840245 () Bool)

(declare-fun res!571026 () Bool)

(assert (=> b!840245 (=> (not res!571026) (not e!469017))))

(assert (=> b!840245 (= res!571026 (and (= (size!23073 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23072 _keys!868) (size!23073 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840246 () Bool)

(declare-fun res!571029 () Bool)

(assert (=> b!840246 (=> (not res!571029) (not e!469017))))

(assert (=> b!840246 (= res!571029 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23072 _keys!868))))))

(declare-fun bm!37048 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2575 (array!47209 array!47211 (_ BitVec 32) (_ BitVec 32) V!25657 V!25657 (_ BitVec 32) Int) ListLongMap!8995)

(assert (=> bm!37048 (= call!37051 (getCurrentListMapNoExtraKeys!2575 _keys!868 (array!47212 (store (arr!22632 _values!688) i!612 (ValueCellFull!7289 v!557)) (size!23073 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840247 () Bool)

(declare-fun res!571033 () Bool)

(assert (=> b!840247 (=> (not res!571033) (not e!469017))))

(declare-datatypes ((List!16002 0))(
  ( (Nil!15999) (Cons!15998 (h!17135 (_ BitVec 64)) (t!22365 List!16002)) )
))
(declare-fun arrayNoDuplicates!0 (array!47209 (_ BitVec 32) List!16002) Bool)

(assert (=> b!840247 (= res!571033 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15999))))

(declare-fun b!840248 () Bool)

(assert (=> b!840248 (= e!469018 tp_is_empty!15457)))

(declare-fun b!840249 () Bool)

(declare-fun res!571030 () Bool)

(assert (=> b!840249 (=> (not res!571030) (not e!469017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840249 (= res!571030 (validMask!0 mask!1196))))

(declare-fun b!840250 () Bool)

(declare-fun res!571032 () Bool)

(assert (=> b!840250 (=> (not res!571032) (not e!469017))))

(assert (=> b!840250 (= res!571032 (and (= (select (arr!22631 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23072 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37049 () Bool)

(assert (=> bm!37049 (= call!37052 (getCurrentListMapNoExtraKeys!2575 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840251 () Bool)

(declare-fun +!2025 (ListLongMap!8995 tuple2!10224) ListLongMap!8995)

(assert (=> b!840251 (= e!469015 (= call!37051 (+!2025 call!37052 (tuple2!10225 k0!854 v!557))))))

(assert (= (and start!72574 res!571028) b!840249))

(assert (= (and b!840249 res!571030) b!840245))

(assert (= (and b!840245 res!571026) b!840239))

(assert (= (and b!840239 res!571031) b!840247))

(assert (= (and b!840247 res!571033) b!840246))

(assert (= (and b!840246 res!571029) b!840241))

(assert (= (and b!840241 res!571027) b!840250))

(assert (= (and b!840250 res!571032) b!840244))

(assert (= (and b!840244 c!91528) b!840251))

(assert (= (and b!840244 (not c!91528)) b!840240))

(assert (= (or b!840251 b!840240) bm!37048))

(assert (= (or b!840251 b!840240) bm!37049))

(assert (= (and b!840243 condMapEmpty!24785) mapIsEmpty!24785))

(assert (= (and b!840243 (not condMapEmpty!24785)) mapNonEmpty!24785))

(get-info :version)

(assert (= (and mapNonEmpty!24785 ((_ is ValueCellFull!7289) mapValue!24785)) b!840242))

(assert (= (and b!840243 ((_ is ValueCellFull!7289) mapDefault!24785)) b!840248))

(assert (= start!72574 b!840243))

(declare-fun m!784769 () Bool)

(assert (=> b!840247 m!784769))

(declare-fun m!784771 () Bool)

(assert (=> bm!37049 m!784771))

(declare-fun m!784773 () Bool)

(assert (=> b!840250 m!784773))

(declare-fun m!784775 () Bool)

(assert (=> b!840244 m!784775))

(declare-fun m!784777 () Bool)

(assert (=> b!840239 m!784777))

(declare-fun m!784779 () Bool)

(assert (=> b!840241 m!784779))

(declare-fun m!784781 () Bool)

(assert (=> mapNonEmpty!24785 m!784781))

(declare-fun m!784783 () Bool)

(assert (=> bm!37048 m!784783))

(declare-fun m!784785 () Bool)

(assert (=> bm!37048 m!784785))

(declare-fun m!784787 () Bool)

(assert (=> start!72574 m!784787))

(declare-fun m!784789 () Bool)

(assert (=> start!72574 m!784789))

(declare-fun m!784791 () Bool)

(assert (=> b!840249 m!784791))

(declare-fun m!784793 () Bool)

(assert (=> b!840251 m!784793))

(check-sat (not b!840247) tp_is_empty!15457 (not bm!37049) (not b_next!13591) b_and!22687 (not b!840244) (not b!840241) (not bm!37048) (not start!72574) (not mapNonEmpty!24785) (not b!840251) (not b!840239) (not b!840249))
(check-sat b_and!22687 (not b_next!13591))
