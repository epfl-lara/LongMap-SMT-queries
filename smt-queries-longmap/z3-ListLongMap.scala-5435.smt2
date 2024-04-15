; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72376 () Bool)

(assert start!72376)

(declare-fun b_free!13579 () Bool)

(declare-fun b_next!13579 () Bool)

(assert (=> start!72376 (= b_free!13579 (not b_next!13579))))

(declare-fun tp!47837 () Bool)

(declare-fun b_and!22639 () Bool)

(assert (=> start!72376 (= tp!47837 b_and!22639)))

(declare-datatypes ((V!25641 0))(
  ( (V!25642 (val!7770 Int)) )
))
(declare-datatypes ((tuple2!10296 0))(
  ( (tuple2!10297 (_1!5159 (_ BitVec 64)) (_2!5159 V!25641)) )
))
(declare-datatypes ((List!16087 0))(
  ( (Nil!16084) (Cons!16083 (h!17214 tuple2!10296) (t!22449 List!16087)) )
))
(declare-datatypes ((ListLongMap!9055 0))(
  ( (ListLongMap!9056 (toList!4543 List!16087)) )
))
(declare-fun call!36944 () ListLongMap!9055)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!36941 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47151 0))(
  ( (array!47152 (arr!22607 (Array (_ BitVec 32) (_ BitVec 64))) (size!23049 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47151)

(declare-datatypes ((ValueCell!7283 0))(
  ( (ValueCellFull!7283 (v!10189 V!25641)) (EmptyCell!7283) )
))
(declare-datatypes ((array!47153 0))(
  ( (array!47154 (arr!22608 (Array (_ BitVec 32) ValueCell!7283)) (size!23050 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47153)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25641)

(declare-fun zeroValue!654 () V!25641)

(declare-fun getCurrentListMapNoExtraKeys!2563 (array!47151 array!47153 (_ BitVec 32) (_ BitVec 32) V!25641 V!25641 (_ BitVec 32) Int) ListLongMap!9055)

(assert (=> bm!36941 (= call!36944 (getCurrentListMapNoExtraKeys!2563 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838863 () Bool)

(declare-fun e!468178 () Bool)

(declare-fun call!36945 () ListLongMap!9055)

(assert (=> b!838863 (= e!468178 (= call!36945 call!36944))))

(declare-fun b!838864 () Bool)

(declare-fun res!570428 () Bool)

(declare-fun e!468177 () Bool)

(assert (=> b!838864 (=> (not res!570428) (not e!468177))))

(declare-datatypes ((List!16088 0))(
  ( (Nil!16085) (Cons!16084 (h!17215 (_ BitVec 64)) (t!22450 List!16088)) )
))
(declare-fun arrayNoDuplicates!0 (array!47151 (_ BitVec 32) List!16088) Bool)

(assert (=> b!838864 (= res!570428 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16085))))

(declare-fun mapIsEmpty!24767 () Bool)

(declare-fun mapRes!24767 () Bool)

(assert (=> mapIsEmpty!24767 mapRes!24767))

(declare-fun b!838865 () Bool)

(declare-fun res!570431 () Bool)

(assert (=> b!838865 (=> (not res!570431) (not e!468177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47151 (_ BitVec 32)) Bool)

(assert (=> b!838865 (= res!570431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838866 () Bool)

(assert (=> b!838866 (= e!468177 (not true))))

(assert (=> b!838866 e!468178))

(declare-fun c!91163 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838866 (= c!91163 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25641)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28763 0))(
  ( (Unit!28764) )
))
(declare-fun lt!380498 () Unit!28763)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!256 (array!47151 array!47153 (_ BitVec 32) (_ BitVec 32) V!25641 V!25641 (_ BitVec 32) (_ BitVec 64) V!25641 (_ BitVec 32) Int) Unit!28763)

(assert (=> b!838866 (= lt!380498 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!256 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24767 () Bool)

(declare-fun tp!47836 () Bool)

(declare-fun e!468176 () Bool)

(assert (=> mapNonEmpty!24767 (= mapRes!24767 (and tp!47836 e!468176))))

(declare-fun mapKey!24767 () (_ BitVec 32))

(declare-fun mapRest!24767 () (Array (_ BitVec 32) ValueCell!7283))

(declare-fun mapValue!24767 () ValueCell!7283)

(assert (=> mapNonEmpty!24767 (= (arr!22608 _values!688) (store mapRest!24767 mapKey!24767 mapValue!24767))))

(declare-fun res!570432 () Bool)

(assert (=> start!72376 (=> (not res!570432) (not e!468177))))

(assert (=> start!72376 (= res!570432 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23049 _keys!868))))))

(assert (=> start!72376 e!468177))

(declare-fun tp_is_empty!15445 () Bool)

(assert (=> start!72376 tp_is_empty!15445))

(assert (=> start!72376 true))

(assert (=> start!72376 tp!47837))

(declare-fun array_inv!18076 (array!47151) Bool)

(assert (=> start!72376 (array_inv!18076 _keys!868)))

(declare-fun e!468175 () Bool)

(declare-fun array_inv!18077 (array!47153) Bool)

(assert (=> start!72376 (and (array_inv!18077 _values!688) e!468175)))

(declare-fun b!838867 () Bool)

(assert (=> b!838867 (= e!468176 tp_is_empty!15445)))

(declare-fun bm!36942 () Bool)

(assert (=> bm!36942 (= call!36945 (getCurrentListMapNoExtraKeys!2563 _keys!868 (array!47154 (store (arr!22608 _values!688) i!612 (ValueCellFull!7283 v!557)) (size!23050 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838868 () Bool)

(declare-fun res!570429 () Bool)

(assert (=> b!838868 (=> (not res!570429) (not e!468177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838868 (= res!570429 (validKeyInArray!0 k0!854))))

(declare-fun b!838869 () Bool)

(declare-fun e!468180 () Bool)

(assert (=> b!838869 (= e!468180 tp_is_empty!15445)))

(declare-fun b!838870 () Bool)

(declare-fun +!2039 (ListLongMap!9055 tuple2!10296) ListLongMap!9055)

(assert (=> b!838870 (= e!468178 (= call!36945 (+!2039 call!36944 (tuple2!10297 k0!854 v!557))))))

(declare-fun b!838871 () Bool)

(declare-fun res!570435 () Bool)

(assert (=> b!838871 (=> (not res!570435) (not e!468177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838871 (= res!570435 (validMask!0 mask!1196))))

(declare-fun b!838872 () Bool)

(assert (=> b!838872 (= e!468175 (and e!468180 mapRes!24767))))

(declare-fun condMapEmpty!24767 () Bool)

(declare-fun mapDefault!24767 () ValueCell!7283)

(assert (=> b!838872 (= condMapEmpty!24767 (= (arr!22608 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7283)) mapDefault!24767)))))

(declare-fun b!838873 () Bool)

(declare-fun res!570430 () Bool)

(assert (=> b!838873 (=> (not res!570430) (not e!468177))))

(assert (=> b!838873 (= res!570430 (and (= (size!23050 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23049 _keys!868) (size!23050 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838874 () Bool)

(declare-fun res!570434 () Bool)

(assert (=> b!838874 (=> (not res!570434) (not e!468177))))

(assert (=> b!838874 (= res!570434 (and (= (select (arr!22607 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23049 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838875 () Bool)

(declare-fun res!570433 () Bool)

(assert (=> b!838875 (=> (not res!570433) (not e!468177))))

(assert (=> b!838875 (= res!570433 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23049 _keys!868))))))

(assert (= (and start!72376 res!570432) b!838871))

(assert (= (and b!838871 res!570435) b!838873))

(assert (= (and b!838873 res!570430) b!838865))

(assert (= (and b!838865 res!570431) b!838864))

(assert (= (and b!838864 res!570428) b!838875))

(assert (= (and b!838875 res!570433) b!838868))

(assert (= (and b!838868 res!570429) b!838874))

(assert (= (and b!838874 res!570434) b!838866))

(assert (= (and b!838866 c!91163) b!838870))

(assert (= (and b!838866 (not c!91163)) b!838863))

(assert (= (or b!838870 b!838863) bm!36942))

(assert (= (or b!838870 b!838863) bm!36941))

(assert (= (and b!838872 condMapEmpty!24767) mapIsEmpty!24767))

(assert (= (and b!838872 (not condMapEmpty!24767)) mapNonEmpty!24767))

(get-info :version)

(assert (= (and mapNonEmpty!24767 ((_ is ValueCellFull!7283) mapValue!24767)) b!838867))

(assert (= (and b!838872 ((_ is ValueCellFull!7283) mapDefault!24767)) b!838869))

(assert (= start!72376 b!838872))

(declare-fun m!782567 () Bool)

(assert (=> b!838866 m!782567))

(declare-fun m!782569 () Bool)

(assert (=> b!838865 m!782569))

(declare-fun m!782571 () Bool)

(assert (=> b!838871 m!782571))

(declare-fun m!782573 () Bool)

(assert (=> b!838868 m!782573))

(declare-fun m!782575 () Bool)

(assert (=> b!838874 m!782575))

(declare-fun m!782577 () Bool)

(assert (=> bm!36942 m!782577))

(declare-fun m!782579 () Bool)

(assert (=> bm!36942 m!782579))

(declare-fun m!782581 () Bool)

(assert (=> start!72376 m!782581))

(declare-fun m!782583 () Bool)

(assert (=> start!72376 m!782583))

(declare-fun m!782585 () Bool)

(assert (=> bm!36941 m!782585))

(declare-fun m!782587 () Bool)

(assert (=> b!838864 m!782587))

(declare-fun m!782589 () Bool)

(assert (=> b!838870 m!782589))

(declare-fun m!782591 () Bool)

(assert (=> mapNonEmpty!24767 m!782591))

(check-sat (not b!838868) (not b!838864) b_and!22639 tp_is_empty!15445 (not b!838866) (not bm!36942) (not b_next!13579) (not b!838871) (not mapNonEmpty!24767) (not b!838865) (not b!838870) (not start!72376) (not bm!36941))
(check-sat b_and!22639 (not b_next!13579))
