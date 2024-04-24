; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72556 () Bool)

(assert start!72556)

(declare-fun b_free!13573 () Bool)

(declare-fun b_next!13573 () Bool)

(assert (=> start!72556 (= b_free!13573 (not b_next!13573))))

(declare-fun tp!47818 () Bool)

(declare-fun b_and!22669 () Bool)

(assert (=> start!72556 (= tp!47818 b_and!22669)))

(declare-fun res!570813 () Bool)

(declare-fun e!468853 () Bool)

(assert (=> start!72556 (=> (not res!570813) (not e!468853))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47173 0))(
  ( (array!47174 (arr!22613 (Array (_ BitVec 32) (_ BitVec 64))) (size!23054 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47173)

(assert (=> start!72556 (= res!570813 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23054 _keys!868))))))

(assert (=> start!72556 e!468853))

(declare-fun tp_is_empty!15439 () Bool)

(assert (=> start!72556 tp_is_empty!15439))

(assert (=> start!72556 true))

(assert (=> start!72556 tp!47818))

(declare-fun array_inv!18052 (array!47173) Bool)

(assert (=> start!72556 (array_inv!18052 _keys!868)))

(declare-datatypes ((V!25633 0))(
  ( (V!25634 (val!7767 Int)) )
))
(declare-datatypes ((ValueCell!7280 0))(
  ( (ValueCellFull!7280 (v!10192 V!25633)) (EmptyCell!7280) )
))
(declare-datatypes ((array!47175 0))(
  ( (array!47176 (arr!22614 (Array (_ BitVec 32) ValueCell!7280)) (size!23055 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47175)

(declare-fun e!468851 () Bool)

(declare-fun array_inv!18053 (array!47175) Bool)

(assert (=> start!72556 (and (array_inv!18053 _values!688) e!468851)))

(declare-fun mapIsEmpty!24758 () Bool)

(declare-fun mapRes!24758 () Bool)

(assert (=> mapIsEmpty!24758 mapRes!24758))

(declare-fun b!839888 () Bool)

(declare-fun e!468854 () Bool)

(assert (=> b!839888 (= e!468854 tp_is_empty!15439)))

(declare-fun b!839889 () Bool)

(declare-fun res!570810 () Bool)

(assert (=> b!839889 (=> (not res!570810) (not e!468853))))

(declare-datatypes ((List!15986 0))(
  ( (Nil!15983) (Cons!15982 (h!17119 (_ BitVec 64)) (t!22349 List!15986)) )
))
(declare-fun arrayNoDuplicates!0 (array!47173 (_ BitVec 32) List!15986) Bool)

(assert (=> b!839889 (= res!570810 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15983))))

(declare-fun b!839890 () Bool)

(declare-fun res!570815 () Bool)

(assert (=> b!839890 (=> (not res!570815) (not e!468853))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839890 (= res!570815 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23054 _keys!868))))))

(declare-fun b!839891 () Bool)

(declare-fun res!570814 () Bool)

(assert (=> b!839891 (=> (not res!570814) (not e!468853))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839891 (= res!570814 (validKeyInArray!0 k0!854))))

(declare-fun b!839892 () Bool)

(declare-fun res!570816 () Bool)

(assert (=> b!839892 (=> (not res!570816) (not e!468853))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47173 (_ BitVec 32)) Bool)

(assert (=> b!839892 (= res!570816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839893 () Bool)

(declare-fun e!468852 () Bool)

(assert (=> b!839893 (= e!468852 tp_is_empty!15439)))

(declare-fun b!839894 () Bool)

(declare-fun e!468856 () Bool)

(declare-datatypes ((tuple2!10206 0))(
  ( (tuple2!10207 (_1!5114 (_ BitVec 64)) (_2!5114 V!25633)) )
))
(declare-datatypes ((List!15987 0))(
  ( (Nil!15984) (Cons!15983 (h!17120 tuple2!10206) (t!22350 List!15987)) )
))
(declare-datatypes ((ListLongMap!8977 0))(
  ( (ListLongMap!8978 (toList!4504 List!15987)) )
))
(declare-fun call!36998 () ListLongMap!8977)

(declare-fun call!36997 () ListLongMap!8977)

(assert (=> b!839894 (= e!468856 (= call!36998 call!36997))))

(declare-fun b!839895 () Bool)

(declare-fun res!570817 () Bool)

(assert (=> b!839895 (=> (not res!570817) (not e!468853))))

(assert (=> b!839895 (= res!570817 (and (= (select (arr!22613 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23054 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839896 () Bool)

(assert (=> b!839896 (= e!468853 (not true))))

(assert (=> b!839896 e!468856))

(declare-fun c!91501 () Bool)

(assert (=> b!839896 (= c!91501 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25633)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28830 0))(
  ( (Unit!28831) )
))
(declare-fun lt!381086 () Unit!28830)

(declare-fun minValue!654 () V!25633)

(declare-fun zeroValue!654 () V!25633)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!251 (array!47173 array!47175 (_ BitVec 32) (_ BitVec 32) V!25633 V!25633 (_ BitVec 32) (_ BitVec 64) V!25633 (_ BitVec 32) Int) Unit!28830)

(assert (=> b!839896 (= lt!381086 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!251 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839897 () Bool)

(assert (=> b!839897 (= e!468851 (and e!468854 mapRes!24758))))

(declare-fun condMapEmpty!24758 () Bool)

(declare-fun mapDefault!24758 () ValueCell!7280)

(assert (=> b!839897 (= condMapEmpty!24758 (= (arr!22614 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7280)) mapDefault!24758)))))

(declare-fun bm!36994 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2566 (array!47173 array!47175 (_ BitVec 32) (_ BitVec 32) V!25633 V!25633 (_ BitVec 32) Int) ListLongMap!8977)

(assert (=> bm!36994 (= call!36997 (getCurrentListMapNoExtraKeys!2566 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839898 () Bool)

(declare-fun res!570811 () Bool)

(assert (=> b!839898 (=> (not res!570811) (not e!468853))))

(assert (=> b!839898 (= res!570811 (and (= (size!23055 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23054 _keys!868) (size!23055 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839899 () Bool)

(declare-fun res!570812 () Bool)

(assert (=> b!839899 (=> (not res!570812) (not e!468853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839899 (= res!570812 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24758 () Bool)

(declare-fun tp!47819 () Bool)

(assert (=> mapNonEmpty!24758 (= mapRes!24758 (and tp!47819 e!468852))))

(declare-fun mapKey!24758 () (_ BitVec 32))

(declare-fun mapValue!24758 () ValueCell!7280)

(declare-fun mapRest!24758 () (Array (_ BitVec 32) ValueCell!7280))

(assert (=> mapNonEmpty!24758 (= (arr!22614 _values!688) (store mapRest!24758 mapKey!24758 mapValue!24758))))

(declare-fun bm!36995 () Bool)

(assert (=> bm!36995 (= call!36998 (getCurrentListMapNoExtraKeys!2566 _keys!868 (array!47176 (store (arr!22614 _values!688) i!612 (ValueCellFull!7280 v!557)) (size!23055 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839900 () Bool)

(declare-fun +!2020 (ListLongMap!8977 tuple2!10206) ListLongMap!8977)

(assert (=> b!839900 (= e!468856 (= call!36998 (+!2020 call!36997 (tuple2!10207 k0!854 v!557))))))

(assert (= (and start!72556 res!570813) b!839899))

(assert (= (and b!839899 res!570812) b!839898))

(assert (= (and b!839898 res!570811) b!839892))

(assert (= (and b!839892 res!570816) b!839889))

(assert (= (and b!839889 res!570810) b!839890))

(assert (= (and b!839890 res!570815) b!839891))

(assert (= (and b!839891 res!570814) b!839895))

(assert (= (and b!839895 res!570817) b!839896))

(assert (= (and b!839896 c!91501) b!839900))

(assert (= (and b!839896 (not c!91501)) b!839894))

(assert (= (or b!839900 b!839894) bm!36995))

(assert (= (or b!839900 b!839894) bm!36994))

(assert (= (and b!839897 condMapEmpty!24758) mapIsEmpty!24758))

(assert (= (and b!839897 (not condMapEmpty!24758)) mapNonEmpty!24758))

(get-info :version)

(assert (= (and mapNonEmpty!24758 ((_ is ValueCellFull!7280) mapValue!24758)) b!839893))

(assert (= (and b!839897 ((_ is ValueCellFull!7280) mapDefault!24758)) b!839888))

(assert (= start!72556 b!839897))

(declare-fun m!784535 () Bool)

(assert (=> b!839895 m!784535))

(declare-fun m!784537 () Bool)

(assert (=> b!839899 m!784537))

(declare-fun m!784539 () Bool)

(assert (=> b!839900 m!784539))

(declare-fun m!784541 () Bool)

(assert (=> b!839896 m!784541))

(declare-fun m!784543 () Bool)

(assert (=> bm!36995 m!784543))

(declare-fun m!784545 () Bool)

(assert (=> bm!36995 m!784545))

(declare-fun m!784547 () Bool)

(assert (=> mapNonEmpty!24758 m!784547))

(declare-fun m!784549 () Bool)

(assert (=> b!839892 m!784549))

(declare-fun m!784551 () Bool)

(assert (=> b!839891 m!784551))

(declare-fun m!784553 () Bool)

(assert (=> start!72556 m!784553))

(declare-fun m!784555 () Bool)

(assert (=> start!72556 m!784555))

(declare-fun m!784557 () Bool)

(assert (=> b!839889 m!784557))

(declare-fun m!784559 () Bool)

(assert (=> bm!36994 m!784559))

(check-sat (not b!839889) tp_is_empty!15439 (not b_next!13573) (not b!839891) (not b!839892) (not mapNonEmpty!24758) (not start!72556) (not b!839899) (not bm!36995) (not b!839900) (not b!839896) b_and!22669 (not bm!36994))
(check-sat b_and!22669 (not b_next!13573))
