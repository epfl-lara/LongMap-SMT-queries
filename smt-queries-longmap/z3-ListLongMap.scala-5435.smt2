; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72562 () Bool)

(assert start!72562)

(declare-fun b_free!13579 () Bool)

(declare-fun b_next!13579 () Bool)

(assert (=> start!72562 (= b_free!13579 (not b_next!13579))))

(declare-fun tp!47836 () Bool)

(declare-fun b_and!22675 () Bool)

(assert (=> start!72562 (= tp!47836 b_and!22675)))

(declare-fun b!840005 () Bool)

(declare-fun e!468907 () Bool)

(declare-fun e!468909 () Bool)

(declare-fun mapRes!24767 () Bool)

(assert (=> b!840005 (= e!468907 (and e!468909 mapRes!24767))))

(declare-fun condMapEmpty!24767 () Bool)

(declare-datatypes ((V!25641 0))(
  ( (V!25642 (val!7770 Int)) )
))
(declare-datatypes ((ValueCell!7283 0))(
  ( (ValueCellFull!7283 (v!10195 V!25641)) (EmptyCell!7283) )
))
(declare-datatypes ((array!47185 0))(
  ( (array!47186 (arr!22619 (Array (_ BitVec 32) ValueCell!7283)) (size!23060 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47185)

(declare-fun mapDefault!24767 () ValueCell!7283)

(assert (=> b!840005 (= condMapEmpty!24767 (= (arr!22619 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7283)) mapDefault!24767)))))

(declare-fun mapNonEmpty!24767 () Bool)

(declare-fun tp!47837 () Bool)

(declare-fun e!468905 () Bool)

(assert (=> mapNonEmpty!24767 (= mapRes!24767 (and tp!47837 e!468905))))

(declare-fun mapValue!24767 () ValueCell!7283)

(declare-fun mapKey!24767 () (_ BitVec 32))

(declare-fun mapRest!24767 () (Array (_ BitVec 32) ValueCell!7283))

(assert (=> mapNonEmpty!24767 (= (arr!22619 _values!688) (store mapRest!24767 mapKey!24767 mapValue!24767))))

(declare-fun b!840006 () Bool)

(declare-fun res!570885 () Bool)

(declare-fun e!468910 () Bool)

(assert (=> b!840006 (=> (not res!570885) (not e!468910))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47187 0))(
  ( (array!47188 (arr!22620 (Array (_ BitVec 32) (_ BitVec 64))) (size!23061 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47187)

(assert (=> b!840006 (= res!570885 (and (= (size!23060 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23061 _keys!868) (size!23060 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840007 () Bool)

(declare-fun res!570888 () Bool)

(assert (=> b!840007 (=> (not res!570888) (not e!468910))))

(declare-datatypes ((List!15991 0))(
  ( (Nil!15988) (Cons!15987 (h!17124 (_ BitVec 64)) (t!22354 List!15991)) )
))
(declare-fun arrayNoDuplicates!0 (array!47187 (_ BitVec 32) List!15991) Bool)

(assert (=> b!840007 (= res!570888 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15988))))

(declare-fun v!557 () V!25641)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37012 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25641)

(declare-fun zeroValue!654 () V!25641)

(declare-datatypes ((tuple2!10212 0))(
  ( (tuple2!10213 (_1!5117 (_ BitVec 64)) (_2!5117 V!25641)) )
))
(declare-datatypes ((List!15992 0))(
  ( (Nil!15989) (Cons!15988 (h!17125 tuple2!10212) (t!22355 List!15992)) )
))
(declare-datatypes ((ListLongMap!8983 0))(
  ( (ListLongMap!8984 (toList!4507 List!15992)) )
))
(declare-fun call!37015 () ListLongMap!8983)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2569 (array!47187 array!47185 (_ BitVec 32) (_ BitVec 32) V!25641 V!25641 (_ BitVec 32) Int) ListLongMap!8983)

(assert (=> bm!37012 (= call!37015 (getCurrentListMapNoExtraKeys!2569 _keys!868 (array!47186 (store (arr!22619 _values!688) i!612 (ValueCellFull!7283 v!557)) (size!23060 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570887 () Bool)

(assert (=> start!72562 (=> (not res!570887) (not e!468910))))

(assert (=> start!72562 (= res!570887 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23061 _keys!868))))))

(assert (=> start!72562 e!468910))

(declare-fun tp_is_empty!15445 () Bool)

(assert (=> start!72562 tp_is_empty!15445))

(assert (=> start!72562 true))

(assert (=> start!72562 tp!47836))

(declare-fun array_inv!18058 (array!47187) Bool)

(assert (=> start!72562 (array_inv!18058 _keys!868)))

(declare-fun array_inv!18059 (array!47185) Bool)

(assert (=> start!72562 (and (array_inv!18059 _values!688) e!468907)))

(declare-fun b!840008 () Bool)

(assert (=> b!840008 (= e!468910 (not true))))

(declare-fun e!468908 () Bool)

(assert (=> b!840008 e!468908))

(declare-fun c!91510 () Bool)

(assert (=> b!840008 (= c!91510 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28834 0))(
  ( (Unit!28835) )
))
(declare-fun lt!381095 () Unit!28834)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!253 (array!47187 array!47185 (_ BitVec 32) (_ BitVec 32) V!25641 V!25641 (_ BitVec 32) (_ BitVec 64) V!25641 (_ BitVec 32) Int) Unit!28834)

(assert (=> b!840008 (= lt!381095 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!253 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24767 () Bool)

(assert (=> mapIsEmpty!24767 mapRes!24767))

(declare-fun b!840009 () Bool)

(declare-fun res!570886 () Bool)

(assert (=> b!840009 (=> (not res!570886) (not e!468910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840009 (= res!570886 (validMask!0 mask!1196))))

(declare-fun call!37016 () ListLongMap!8983)

(declare-fun bm!37013 () Bool)

(assert (=> bm!37013 (= call!37016 (getCurrentListMapNoExtraKeys!2569 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840010 () Bool)

(assert (=> b!840010 (= e!468908 (= call!37015 call!37016))))

(declare-fun b!840011 () Bool)

(declare-fun res!570882 () Bool)

(assert (=> b!840011 (=> (not res!570882) (not e!468910))))

(assert (=> b!840011 (= res!570882 (and (= (select (arr!22620 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23061 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840012 () Bool)

(declare-fun res!570884 () Bool)

(assert (=> b!840012 (=> (not res!570884) (not e!468910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47187 (_ BitVec 32)) Bool)

(assert (=> b!840012 (= res!570884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840013 () Bool)

(declare-fun res!570883 () Bool)

(assert (=> b!840013 (=> (not res!570883) (not e!468910))))

(assert (=> b!840013 (= res!570883 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23061 _keys!868))))))

(declare-fun b!840014 () Bool)

(declare-fun +!2023 (ListLongMap!8983 tuple2!10212) ListLongMap!8983)

(assert (=> b!840014 (= e!468908 (= call!37015 (+!2023 call!37016 (tuple2!10213 k0!854 v!557))))))

(declare-fun b!840015 () Bool)

(assert (=> b!840015 (= e!468905 tp_is_empty!15445)))

(declare-fun b!840016 () Bool)

(assert (=> b!840016 (= e!468909 tp_is_empty!15445)))

(declare-fun b!840017 () Bool)

(declare-fun res!570889 () Bool)

(assert (=> b!840017 (=> (not res!570889) (not e!468910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840017 (= res!570889 (validKeyInArray!0 k0!854))))

(assert (= (and start!72562 res!570887) b!840009))

(assert (= (and b!840009 res!570886) b!840006))

(assert (= (and b!840006 res!570885) b!840012))

(assert (= (and b!840012 res!570884) b!840007))

(assert (= (and b!840007 res!570888) b!840013))

(assert (= (and b!840013 res!570883) b!840017))

(assert (= (and b!840017 res!570889) b!840011))

(assert (= (and b!840011 res!570882) b!840008))

(assert (= (and b!840008 c!91510) b!840014))

(assert (= (and b!840008 (not c!91510)) b!840010))

(assert (= (or b!840014 b!840010) bm!37012))

(assert (= (or b!840014 b!840010) bm!37013))

(assert (= (and b!840005 condMapEmpty!24767) mapIsEmpty!24767))

(assert (= (and b!840005 (not condMapEmpty!24767)) mapNonEmpty!24767))

(get-info :version)

(assert (= (and mapNonEmpty!24767 ((_ is ValueCellFull!7283) mapValue!24767)) b!840015))

(assert (= (and b!840005 ((_ is ValueCellFull!7283) mapDefault!24767)) b!840016))

(assert (= start!72562 b!840005))

(declare-fun m!784613 () Bool)

(assert (=> start!72562 m!784613))

(declare-fun m!784615 () Bool)

(assert (=> start!72562 m!784615))

(declare-fun m!784617 () Bool)

(assert (=> b!840009 m!784617))

(declare-fun m!784619 () Bool)

(assert (=> bm!37013 m!784619))

(declare-fun m!784621 () Bool)

(assert (=> b!840007 m!784621))

(declare-fun m!784623 () Bool)

(assert (=> b!840011 m!784623))

(declare-fun m!784625 () Bool)

(assert (=> mapNonEmpty!24767 m!784625))

(declare-fun m!784627 () Bool)

(assert (=> b!840008 m!784627))

(declare-fun m!784629 () Bool)

(assert (=> b!840014 m!784629))

(declare-fun m!784631 () Bool)

(assert (=> b!840012 m!784631))

(declare-fun m!784633 () Bool)

(assert (=> b!840017 m!784633))

(declare-fun m!784635 () Bool)

(assert (=> bm!37012 m!784635))

(declare-fun m!784637 () Bool)

(assert (=> bm!37012 m!784637))

(check-sat (not b!840008) (not bm!37013) (not b!840009) (not b!840014) b_and!22675 (not start!72562) (not bm!37012) (not b!840007) (not b!840012) tp_is_empty!15445 (not mapNonEmpty!24767) (not b_next!13579) (not b!840017))
(check-sat b_and!22675 (not b_next!13579))
