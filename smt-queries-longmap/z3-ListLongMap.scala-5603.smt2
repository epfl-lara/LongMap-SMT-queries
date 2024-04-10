; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73404 () Bool)

(assert start!73404)

(declare-fun b_free!14319 () Bool)

(declare-fun b_next!14319 () Bool)

(assert (=> start!73404 (= b_free!14319 (not b_next!14319))))

(declare-fun tp!50460 () Bool)

(declare-fun b_and!23675 () Bool)

(assert (=> start!73404 (= tp!50460 b_and!23675)))

(declare-fun b!856866 () Bool)

(declare-fun res!582018 () Bool)

(declare-fun e!477615 () Bool)

(assert (=> b!856866 (=> (not res!582018) (not e!477615))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49102 0))(
  ( (array!49103 (arr!23582 (Array (_ BitVec 32) (_ BitVec 64))) (size!24022 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49102)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856866 (= res!582018 (and (= (select (arr!23582 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856867 () Bool)

(declare-fun res!582015 () Bool)

(assert (=> b!856867 (=> (not res!582015) (not e!477615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856867 (= res!582015 (validKeyInArray!0 k0!854))))

(declare-fun b!856868 () Bool)

(declare-fun res!582017 () Bool)

(assert (=> b!856868 (=> (not res!582017) (not e!477615))))

(assert (=> b!856868 (= res!582017 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24022 _keys!868))))))

(declare-fun b!856869 () Bool)

(declare-fun res!582016 () Bool)

(assert (=> b!856869 (=> (not res!582016) (not e!477615))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26987 0))(
  ( (V!26988 (val!8275 Int)) )
))
(declare-datatypes ((ValueCell!7788 0))(
  ( (ValueCellFull!7788 (v!10700 V!26987)) (EmptyCell!7788) )
))
(declare-datatypes ((array!49104 0))(
  ( (array!49105 (arr!23583 (Array (_ BitVec 32) ValueCell!7788)) (size!24023 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49104)

(assert (=> b!856869 (= res!582016 (and (= (size!24023 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24022 _keys!868) (size!24023 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!582020 () Bool)

(assert (=> start!73404 (=> (not res!582020) (not e!477615))))

(assert (=> start!73404 (= res!582020 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24022 _keys!868))))))

(assert (=> start!73404 e!477615))

(declare-fun tp_is_empty!16455 () Bool)

(assert (=> start!73404 tp_is_empty!16455))

(assert (=> start!73404 true))

(assert (=> start!73404 tp!50460))

(declare-fun array_inv!18676 (array!49102) Bool)

(assert (=> start!73404 (array_inv!18676 _keys!868)))

(declare-fun e!477612 () Bool)

(declare-fun array_inv!18677 (array!49104) Bool)

(assert (=> start!73404 (and (array_inv!18677 _values!688) e!477612)))

(declare-fun b!856870 () Bool)

(declare-fun e!477613 () Bool)

(assert (=> b!856870 (= e!477613 tp_is_empty!16455)))

(declare-fun b!856871 () Bool)

(declare-fun e!477611 () Bool)

(assert (=> b!856871 (= e!477611 tp_is_empty!16455)))

(declare-fun b!856872 () Bool)

(declare-fun res!582023 () Bool)

(assert (=> b!856872 (=> (not res!582023) (not e!477615))))

(declare-datatypes ((List!16723 0))(
  ( (Nil!16720) (Cons!16719 (h!17850 (_ BitVec 64)) (t!23364 List!16723)) )
))
(declare-fun arrayNoDuplicates!0 (array!49102 (_ BitVec 32) List!16723) Bool)

(assert (=> b!856872 (= res!582023 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16720))))

(declare-fun mapIsEmpty!26282 () Bool)

(declare-fun mapRes!26282 () Bool)

(assert (=> mapIsEmpty!26282 mapRes!26282))

(declare-fun b!856873 () Bool)

(declare-fun res!582022 () Bool)

(assert (=> b!856873 (=> (not res!582022) (not e!477615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856873 (= res!582022 (validMask!0 mask!1196))))

(declare-fun b!856874 () Bool)

(declare-fun e!477614 () Bool)

(assert (=> b!856874 (= e!477615 e!477614)))

(declare-fun res!582021 () Bool)

(assert (=> b!856874 (=> (not res!582021) (not e!477614))))

(assert (=> b!856874 (= res!582021 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10914 0))(
  ( (tuple2!10915 (_1!5468 (_ BitVec 64)) (_2!5468 V!26987)) )
))
(declare-datatypes ((List!16724 0))(
  ( (Nil!16721) (Cons!16720 (h!17851 tuple2!10914) (t!23365 List!16724)) )
))
(declare-datatypes ((ListLongMap!9683 0))(
  ( (ListLongMap!9684 (toList!4857 List!16724)) )
))
(declare-fun lt!386098 () ListLongMap!9683)

(declare-fun lt!386099 () array!49104)

(declare-fun minValue!654 () V!26987)

(declare-fun zeroValue!654 () V!26987)

(declare-fun getCurrentListMapNoExtraKeys!2838 (array!49102 array!49104 (_ BitVec 32) (_ BitVec 32) V!26987 V!26987 (_ BitVec 32) Int) ListLongMap!9683)

(assert (=> b!856874 (= lt!386098 (getCurrentListMapNoExtraKeys!2838 _keys!868 lt!386099 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26987)

(assert (=> b!856874 (= lt!386099 (array!49105 (store (arr!23583 _values!688) i!612 (ValueCellFull!7788 v!557)) (size!24023 _values!688)))))

(declare-fun lt!386101 () ListLongMap!9683)

(assert (=> b!856874 (= lt!386101 (getCurrentListMapNoExtraKeys!2838 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856875 () Bool)

(assert (=> b!856875 (= e!477612 (and e!477613 mapRes!26282))))

(declare-fun condMapEmpty!26282 () Bool)

(declare-fun mapDefault!26282 () ValueCell!7788)

(assert (=> b!856875 (= condMapEmpty!26282 (= (arr!23583 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7788)) mapDefault!26282)))))

(declare-fun b!856876 () Bool)

(assert (=> b!856876 (= e!477614 (not true))))

(declare-fun +!2211 (ListLongMap!9683 tuple2!10914) ListLongMap!9683)

(assert (=> b!856876 (= (getCurrentListMapNoExtraKeys!2838 _keys!868 lt!386099 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2211 (getCurrentListMapNoExtraKeys!2838 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10915 k0!854 v!557)))))

(declare-datatypes ((Unit!29209 0))(
  ( (Unit!29210) )
))
(declare-fun lt!386100 () Unit!29209)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!432 (array!49102 array!49104 (_ BitVec 32) (_ BitVec 32) V!26987 V!26987 (_ BitVec 32) (_ BitVec 64) V!26987 (_ BitVec 32) Int) Unit!29209)

(assert (=> b!856876 (= lt!386100 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!432 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26282 () Bool)

(declare-fun tp!50461 () Bool)

(assert (=> mapNonEmpty!26282 (= mapRes!26282 (and tp!50461 e!477611))))

(declare-fun mapKey!26282 () (_ BitVec 32))

(declare-fun mapValue!26282 () ValueCell!7788)

(declare-fun mapRest!26282 () (Array (_ BitVec 32) ValueCell!7788))

(assert (=> mapNonEmpty!26282 (= (arr!23583 _values!688) (store mapRest!26282 mapKey!26282 mapValue!26282))))

(declare-fun b!856877 () Bool)

(declare-fun res!582019 () Bool)

(assert (=> b!856877 (=> (not res!582019) (not e!477615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49102 (_ BitVec 32)) Bool)

(assert (=> b!856877 (= res!582019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73404 res!582020) b!856873))

(assert (= (and b!856873 res!582022) b!856869))

(assert (= (and b!856869 res!582016) b!856877))

(assert (= (and b!856877 res!582019) b!856872))

(assert (= (and b!856872 res!582023) b!856868))

(assert (= (and b!856868 res!582017) b!856867))

(assert (= (and b!856867 res!582015) b!856866))

(assert (= (and b!856866 res!582018) b!856874))

(assert (= (and b!856874 res!582021) b!856876))

(assert (= (and b!856875 condMapEmpty!26282) mapIsEmpty!26282))

(assert (= (and b!856875 (not condMapEmpty!26282)) mapNonEmpty!26282))

(get-info :version)

(assert (= (and mapNonEmpty!26282 ((_ is ValueCellFull!7788) mapValue!26282)) b!856871))

(assert (= (and b!856875 ((_ is ValueCellFull!7788) mapDefault!26282)) b!856870))

(assert (= start!73404 b!856875))

(declare-fun m!797741 () Bool)

(assert (=> b!856874 m!797741))

(declare-fun m!797743 () Bool)

(assert (=> b!856874 m!797743))

(declare-fun m!797745 () Bool)

(assert (=> b!856874 m!797745))

(declare-fun m!797747 () Bool)

(assert (=> start!73404 m!797747))

(declare-fun m!797749 () Bool)

(assert (=> start!73404 m!797749))

(declare-fun m!797751 () Bool)

(assert (=> mapNonEmpty!26282 m!797751))

(declare-fun m!797753 () Bool)

(assert (=> b!856867 m!797753))

(declare-fun m!797755 () Bool)

(assert (=> b!856876 m!797755))

(declare-fun m!797757 () Bool)

(assert (=> b!856876 m!797757))

(assert (=> b!856876 m!797757))

(declare-fun m!797759 () Bool)

(assert (=> b!856876 m!797759))

(declare-fun m!797761 () Bool)

(assert (=> b!856876 m!797761))

(declare-fun m!797763 () Bool)

(assert (=> b!856866 m!797763))

(declare-fun m!797765 () Bool)

(assert (=> b!856872 m!797765))

(declare-fun m!797767 () Bool)

(assert (=> b!856877 m!797767))

(declare-fun m!797769 () Bool)

(assert (=> b!856873 m!797769))

(check-sat (not b!856874) b_and!23675 (not mapNonEmpty!26282) (not b!856867) (not b!856877) (not b_next!14319) (not b!856876) (not b!856872) (not start!73404) (not b!856873) tp_is_empty!16455)
(check-sat b_and!23675 (not b_next!14319))
