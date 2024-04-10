; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72432 () Bool)

(assert start!72432)

(declare-fun b_free!13617 () Bool)

(declare-fun b_next!13617 () Bool)

(assert (=> start!72432 (= b_free!13617 (not b_next!13617))))

(declare-fun tp!47950 () Bool)

(declare-fun b_and!22703 () Bool)

(assert (=> start!72432 (= tp!47950 b_and!22703)))

(declare-fun b!839843 () Bool)

(declare-fun e!468665 () Bool)

(declare-fun e!468666 () Bool)

(declare-fun mapRes!24824 () Bool)

(assert (=> b!839843 (= e!468665 (and e!468666 mapRes!24824))))

(declare-fun condMapEmpty!24824 () Bool)

(declare-datatypes ((V!25691 0))(
  ( (V!25692 (val!7789 Int)) )
))
(declare-datatypes ((ValueCell!7302 0))(
  ( (ValueCellFull!7302 (v!10214 V!25691)) (EmptyCell!7302) )
))
(declare-datatypes ((array!47248 0))(
  ( (array!47249 (arr!22655 (Array (_ BitVec 32) ValueCell!7302)) (size!23095 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47248)

(declare-fun mapDefault!24824 () ValueCell!7302)

(assert (=> b!839843 (= condMapEmpty!24824 (= (arr!22655 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7302)) mapDefault!24824)))))

(declare-fun b!839844 () Bool)

(declare-fun res!571000 () Bool)

(declare-fun e!468670 () Bool)

(assert (=> b!839844 (=> (not res!571000) (not e!468670))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839844 (= res!571000 (validKeyInArray!0 k0!854))))

(declare-fun b!839845 () Bool)

(declare-fun res!570999 () Bool)

(assert (=> b!839845 (=> (not res!570999) (not e!468670))))

(declare-datatypes ((array!47250 0))(
  ( (array!47251 (arr!22656 (Array (_ BitVec 32) (_ BitVec 64))) (size!23096 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47250)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47250 (_ BitVec 32)) Bool)

(assert (=> b!839845 (= res!570999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((tuple2!10318 0))(
  ( (tuple2!10319 (_1!5170 (_ BitVec 64)) (_2!5170 V!25691)) )
))
(declare-datatypes ((List!16114 0))(
  ( (Nil!16111) (Cons!16110 (h!17241 tuple2!10318) (t!22485 List!16114)) )
))
(declare-datatypes ((ListLongMap!9087 0))(
  ( (ListLongMap!9088 (toList!4559 List!16114)) )
))
(declare-fun call!37084 () ListLongMap!9087)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37081 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25691)

(declare-fun zeroValue!654 () V!25691)

(declare-fun getCurrentListMapNoExtraKeys!2548 (array!47250 array!47248 (_ BitVec 32) (_ BitVec 32) V!25691 V!25691 (_ BitVec 32) Int) ListLongMap!9087)

(assert (=> bm!37081 (= call!37084 (getCurrentListMapNoExtraKeys!2548 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570997 () Bool)

(assert (=> start!72432 (=> (not res!570997) (not e!468670))))

(assert (=> start!72432 (= res!570997 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23096 _keys!868))))))

(assert (=> start!72432 e!468670))

(declare-fun tp_is_empty!15483 () Bool)

(assert (=> start!72432 tp_is_empty!15483))

(assert (=> start!72432 true))

(assert (=> start!72432 tp!47950))

(declare-fun array_inv!18044 (array!47250) Bool)

(assert (=> start!72432 (array_inv!18044 _keys!868)))

(declare-fun array_inv!18045 (array!47248) Bool)

(assert (=> start!72432 (and (array_inv!18045 _values!688) e!468665)))

(declare-fun b!839846 () Bool)

(declare-fun res!570994 () Bool)

(assert (=> b!839846 (=> (not res!570994) (not e!468670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839846 (= res!570994 (validMask!0 mask!1196))))

(declare-fun b!839847 () Bool)

(declare-fun e!468668 () Bool)

(declare-fun call!37085 () ListLongMap!9087)

(assert (=> b!839847 (= e!468668 (= call!37085 call!37084))))

(declare-fun b!839848 () Bool)

(declare-fun v!557 () V!25691)

(declare-fun +!2029 (ListLongMap!9087 tuple2!10318) ListLongMap!9087)

(assert (=> b!839848 (= e!468668 (= call!37085 (+!2029 call!37084 (tuple2!10319 k0!854 v!557))))))

(declare-fun b!839849 () Bool)

(declare-fun res!570995 () Bool)

(assert (=> b!839849 (=> (not res!570995) (not e!468670))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839849 (= res!570995 (and (= (select (arr!22656 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23096 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24824 () Bool)

(assert (=> mapIsEmpty!24824 mapRes!24824))

(declare-fun bm!37082 () Bool)

(assert (=> bm!37082 (= call!37085 (getCurrentListMapNoExtraKeys!2548 _keys!868 (array!47249 (store (arr!22655 _values!688) i!612 (ValueCellFull!7302 v!557)) (size!23095 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839850 () Bool)

(declare-fun res!571001 () Bool)

(assert (=> b!839850 (=> (not res!571001) (not e!468670))))

(assert (=> b!839850 (= res!571001 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23096 _keys!868))))))

(declare-fun b!839851 () Bool)

(assert (=> b!839851 (= e!468670 (not true))))

(assert (=> b!839851 e!468668))

(declare-fun c!91285 () Bool)

(assert (=> b!839851 (= c!91285 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28843 0))(
  ( (Unit!28844) )
))
(declare-fun lt!380791 () Unit!28843)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!267 (array!47250 array!47248 (_ BitVec 32) (_ BitVec 32) V!25691 V!25691 (_ BitVec 32) (_ BitVec 64) V!25691 (_ BitVec 32) Int) Unit!28843)

(assert (=> b!839851 (= lt!380791 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!267 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24824 () Bool)

(declare-fun tp!47949 () Bool)

(declare-fun e!468669 () Bool)

(assert (=> mapNonEmpty!24824 (= mapRes!24824 (and tp!47949 e!468669))))

(declare-fun mapKey!24824 () (_ BitVec 32))

(declare-fun mapValue!24824 () ValueCell!7302)

(declare-fun mapRest!24824 () (Array (_ BitVec 32) ValueCell!7302))

(assert (=> mapNonEmpty!24824 (= (arr!22655 _values!688) (store mapRest!24824 mapKey!24824 mapValue!24824))))

(declare-fun b!839852 () Bool)

(assert (=> b!839852 (= e!468666 tp_is_empty!15483)))

(declare-fun b!839853 () Bool)

(declare-fun res!570998 () Bool)

(assert (=> b!839853 (=> (not res!570998) (not e!468670))))

(assert (=> b!839853 (= res!570998 (and (= (size!23095 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23096 _keys!868) (size!23095 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839854 () Bool)

(assert (=> b!839854 (= e!468669 tp_is_empty!15483)))

(declare-fun b!839855 () Bool)

(declare-fun res!570996 () Bool)

(assert (=> b!839855 (=> (not res!570996) (not e!468670))))

(declare-datatypes ((List!16115 0))(
  ( (Nil!16112) (Cons!16111 (h!17242 (_ BitVec 64)) (t!22486 List!16115)) )
))
(declare-fun arrayNoDuplicates!0 (array!47250 (_ BitVec 32) List!16115) Bool)

(assert (=> b!839855 (= res!570996 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16112))))

(assert (= (and start!72432 res!570997) b!839846))

(assert (= (and b!839846 res!570994) b!839853))

(assert (= (and b!839853 res!570998) b!839845))

(assert (= (and b!839845 res!570999) b!839855))

(assert (= (and b!839855 res!570996) b!839850))

(assert (= (and b!839850 res!571001) b!839844))

(assert (= (and b!839844 res!571000) b!839849))

(assert (= (and b!839849 res!570995) b!839851))

(assert (= (and b!839851 c!91285) b!839848))

(assert (= (and b!839851 (not c!91285)) b!839847))

(assert (= (or b!839848 b!839847) bm!37082))

(assert (= (or b!839848 b!839847) bm!37081))

(assert (= (and b!839843 condMapEmpty!24824) mapIsEmpty!24824))

(assert (= (and b!839843 (not condMapEmpty!24824)) mapNonEmpty!24824))

(get-info :version)

(assert (= (and mapNonEmpty!24824 ((_ is ValueCellFull!7302) mapValue!24824)) b!839854))

(assert (= (and b!839843 ((_ is ValueCellFull!7302) mapDefault!24824)) b!839852))

(assert (= start!72432 b!839843))

(declare-fun m!783815 () Bool)

(assert (=> b!839848 m!783815))

(declare-fun m!783817 () Bool)

(assert (=> start!72432 m!783817))

(declare-fun m!783819 () Bool)

(assert (=> start!72432 m!783819))

(declare-fun m!783821 () Bool)

(assert (=> mapNonEmpty!24824 m!783821))

(declare-fun m!783823 () Bool)

(assert (=> b!839849 m!783823))

(declare-fun m!783825 () Bool)

(assert (=> bm!37081 m!783825))

(declare-fun m!783827 () Bool)

(assert (=> bm!37082 m!783827))

(declare-fun m!783829 () Bool)

(assert (=> bm!37082 m!783829))

(declare-fun m!783831 () Bool)

(assert (=> b!839846 m!783831))

(declare-fun m!783833 () Bool)

(assert (=> b!839844 m!783833))

(declare-fun m!783835 () Bool)

(assert (=> b!839851 m!783835))

(declare-fun m!783837 () Bool)

(assert (=> b!839855 m!783837))

(declare-fun m!783839 () Bool)

(assert (=> b!839845 m!783839))

(check-sat b_and!22703 (not b!839848) (not b_next!13617) (not mapNonEmpty!24824) (not bm!37081) (not start!72432) (not b!839844) (not b!839855) (not b!839846) tp_is_empty!15483 (not b!839845) (not b!839851) (not bm!37082))
(check-sat b_and!22703 (not b_next!13617))
