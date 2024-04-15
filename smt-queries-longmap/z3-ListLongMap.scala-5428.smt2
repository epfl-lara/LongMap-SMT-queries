; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72334 () Bool)

(assert start!72334)

(declare-fun b_free!13537 () Bool)

(declare-fun b_next!13537 () Bool)

(assert (=> start!72334 (= b_free!13537 (not b_next!13537))))

(declare-fun tp!47711 () Bool)

(declare-fun b_and!22597 () Bool)

(assert (=> start!72334 (= tp!47711 b_and!22597)))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47067 0))(
  ( (array!47068 (arr!22565 (Array (_ BitVec 32) (_ BitVec 64))) (size!23007 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47067)

(declare-fun bm!36815 () Bool)

(declare-datatypes ((V!25585 0))(
  ( (V!25586 (val!7749 Int)) )
))
(declare-datatypes ((ValueCell!7262 0))(
  ( (ValueCellFull!7262 (v!10168 V!25585)) (EmptyCell!7262) )
))
(declare-datatypes ((array!47069 0))(
  ( (array!47070 (arr!22566 (Array (_ BitVec 32) ValueCell!7262)) (size!23008 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47069)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25585)

(declare-fun zeroValue!654 () V!25585)

(declare-datatypes ((tuple2!10256 0))(
  ( (tuple2!10257 (_1!5139 (_ BitVec 64)) (_2!5139 V!25585)) )
))
(declare-datatypes ((List!16053 0))(
  ( (Nil!16050) (Cons!16049 (h!17180 tuple2!10256) (t!22415 List!16053)) )
))
(declare-datatypes ((ListLongMap!9015 0))(
  ( (ListLongMap!9016 (toList!4523 List!16053)) )
))
(declare-fun call!36818 () ListLongMap!9015)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2544 (array!47067 array!47069 (_ BitVec 32) (_ BitVec 32) V!25585 V!25585 (_ BitVec 32) Int) ListLongMap!9015)

(assert (=> bm!36815 (= call!36818 (getCurrentListMapNoExtraKeys!2544 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838044 () Bool)

(declare-fun e!467798 () Bool)

(declare-fun tp_is_empty!15403 () Bool)

(assert (=> b!838044 (= e!467798 tp_is_empty!15403)))

(declare-fun b!838045 () Bool)

(declare-fun res!569928 () Bool)

(declare-fun e!467801 () Bool)

(assert (=> b!838045 (=> (not res!569928) (not e!467801))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838045 (= res!569928 (validKeyInArray!0 k0!854))))

(declare-fun b!838046 () Bool)

(declare-fun res!569930 () Bool)

(assert (=> b!838046 (=> (not res!569930) (not e!467801))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838046 (= res!569930 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23007 _keys!868))))))

(declare-fun b!838047 () Bool)

(declare-fun res!569927 () Bool)

(assert (=> b!838047 (=> (not res!569927) (not e!467801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47067 (_ BitVec 32)) Bool)

(assert (=> b!838047 (= res!569927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838048 () Bool)

(declare-fun e!467799 () Bool)

(assert (=> b!838048 (= e!467799 tp_is_empty!15403)))

(declare-fun b!838049 () Bool)

(declare-fun res!569931 () Bool)

(assert (=> b!838049 (=> (not res!569931) (not e!467801))))

(assert (=> b!838049 (= res!569931 (and (= (size!23008 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23007 _keys!868) (size!23008 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838050 () Bool)

(assert (=> b!838050 (= e!467801 (not true))))

(declare-fun e!467802 () Bool)

(assert (=> b!838050 e!467802))

(declare-fun c!91100 () Bool)

(assert (=> b!838050 (= c!91100 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28735 0))(
  ( (Unit!28736) )
))
(declare-fun lt!380435 () Unit!28735)

(declare-fun v!557 () V!25585)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!242 (array!47067 array!47069 (_ BitVec 32) (_ BitVec 32) V!25585 V!25585 (_ BitVec 32) (_ BitVec 64) V!25585 (_ BitVec 32) Int) Unit!28735)

(assert (=> b!838050 (= lt!380435 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!242 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24704 () Bool)

(declare-fun mapRes!24704 () Bool)

(assert (=> mapIsEmpty!24704 mapRes!24704))

(declare-fun res!569926 () Bool)

(assert (=> start!72334 (=> (not res!569926) (not e!467801))))

(assert (=> start!72334 (= res!569926 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23007 _keys!868))))))

(assert (=> start!72334 e!467801))

(assert (=> start!72334 tp_is_empty!15403))

(assert (=> start!72334 true))

(assert (=> start!72334 tp!47711))

(declare-fun array_inv!18048 (array!47067) Bool)

(assert (=> start!72334 (array_inv!18048 _keys!868)))

(declare-fun e!467797 () Bool)

(declare-fun array_inv!18049 (array!47069) Bool)

(assert (=> start!72334 (and (array_inv!18049 _values!688) e!467797)))

(declare-fun b!838051 () Bool)

(declare-fun res!569925 () Bool)

(assert (=> b!838051 (=> (not res!569925) (not e!467801))))

(assert (=> b!838051 (= res!569925 (and (= (select (arr!22565 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23007 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun call!36819 () ListLongMap!9015)

(declare-fun bm!36816 () Bool)

(assert (=> bm!36816 (= call!36819 (getCurrentListMapNoExtraKeys!2544 _keys!868 (array!47070 (store (arr!22566 _values!688) i!612 (ValueCellFull!7262 v!557)) (size!23008 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838052 () Bool)

(declare-fun res!569929 () Bool)

(assert (=> b!838052 (=> (not res!569929) (not e!467801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838052 (= res!569929 (validMask!0 mask!1196))))

(declare-fun b!838053 () Bool)

(assert (=> b!838053 (= e!467802 (= call!36819 call!36818))))

(declare-fun mapNonEmpty!24704 () Bool)

(declare-fun tp!47710 () Bool)

(assert (=> mapNonEmpty!24704 (= mapRes!24704 (and tp!47710 e!467798))))

(declare-fun mapValue!24704 () ValueCell!7262)

(declare-fun mapKey!24704 () (_ BitVec 32))

(declare-fun mapRest!24704 () (Array (_ BitVec 32) ValueCell!7262))

(assert (=> mapNonEmpty!24704 (= (arr!22566 _values!688) (store mapRest!24704 mapKey!24704 mapValue!24704))))

(declare-fun b!838054 () Bool)

(assert (=> b!838054 (= e!467797 (and e!467799 mapRes!24704))))

(declare-fun condMapEmpty!24704 () Bool)

(declare-fun mapDefault!24704 () ValueCell!7262)

(assert (=> b!838054 (= condMapEmpty!24704 (= (arr!22566 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7262)) mapDefault!24704)))))

(declare-fun b!838055 () Bool)

(declare-fun res!569924 () Bool)

(assert (=> b!838055 (=> (not res!569924) (not e!467801))))

(declare-datatypes ((List!16054 0))(
  ( (Nil!16051) (Cons!16050 (h!17181 (_ BitVec 64)) (t!22416 List!16054)) )
))
(declare-fun arrayNoDuplicates!0 (array!47067 (_ BitVec 32) List!16054) Bool)

(assert (=> b!838055 (= res!569924 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16051))))

(declare-fun b!838056 () Bool)

(declare-fun +!2028 (ListLongMap!9015 tuple2!10256) ListLongMap!9015)

(assert (=> b!838056 (= e!467802 (= call!36819 (+!2028 call!36818 (tuple2!10257 k0!854 v!557))))))

(assert (= (and start!72334 res!569926) b!838052))

(assert (= (and b!838052 res!569929) b!838049))

(assert (= (and b!838049 res!569931) b!838047))

(assert (= (and b!838047 res!569927) b!838055))

(assert (= (and b!838055 res!569924) b!838046))

(assert (= (and b!838046 res!569930) b!838045))

(assert (= (and b!838045 res!569928) b!838051))

(assert (= (and b!838051 res!569925) b!838050))

(assert (= (and b!838050 c!91100) b!838056))

(assert (= (and b!838050 (not c!91100)) b!838053))

(assert (= (or b!838056 b!838053) bm!36816))

(assert (= (or b!838056 b!838053) bm!36815))

(assert (= (and b!838054 condMapEmpty!24704) mapIsEmpty!24704))

(assert (= (and b!838054 (not condMapEmpty!24704)) mapNonEmpty!24704))

(get-info :version)

(assert (= (and mapNonEmpty!24704 ((_ is ValueCellFull!7262) mapValue!24704)) b!838044))

(assert (= (and b!838054 ((_ is ValueCellFull!7262) mapDefault!24704)) b!838048))

(assert (= start!72334 b!838054))

(declare-fun m!782021 () Bool)

(assert (=> bm!36816 m!782021))

(declare-fun m!782023 () Bool)

(assert (=> bm!36816 m!782023))

(declare-fun m!782025 () Bool)

(assert (=> mapNonEmpty!24704 m!782025))

(declare-fun m!782027 () Bool)

(assert (=> b!838047 m!782027))

(declare-fun m!782029 () Bool)

(assert (=> b!838051 m!782029))

(declare-fun m!782031 () Bool)

(assert (=> b!838052 m!782031))

(declare-fun m!782033 () Bool)

(assert (=> bm!36815 m!782033))

(declare-fun m!782035 () Bool)

(assert (=> b!838045 m!782035))

(declare-fun m!782037 () Bool)

(assert (=> b!838055 m!782037))

(declare-fun m!782039 () Bool)

(assert (=> b!838050 m!782039))

(declare-fun m!782041 () Bool)

(assert (=> start!72334 m!782041))

(declare-fun m!782043 () Bool)

(assert (=> start!72334 m!782043))

(declare-fun m!782045 () Bool)

(assert (=> b!838056 m!782045))

(check-sat (not b!838052) (not b!838050) (not bm!36816) (not start!72334) tp_is_empty!15403 (not b!838056) (not mapNonEmpty!24704) (not bm!36815) b_and!22597 (not b!838045) (not b!838047) (not b_next!13537) (not b!838055))
(check-sat b_and!22597 (not b_next!13537))
