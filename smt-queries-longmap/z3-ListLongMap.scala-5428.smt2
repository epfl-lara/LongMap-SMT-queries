; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72354 () Bool)

(assert start!72354)

(declare-fun b_free!13539 () Bool)

(declare-fun b_next!13539 () Bool)

(assert (=> start!72354 (= b_free!13539 (not b_next!13539))))

(declare-fun tp!47716 () Bool)

(declare-fun b_and!22625 () Bool)

(assert (=> start!72354 (= tp!47716 b_and!22625)))

(declare-fun b!838322 () Bool)

(declare-fun res!570064 () Bool)

(declare-fun e!467967 () Bool)

(assert (=> b!838322 (=> (not res!570064) (not e!467967))))

(declare-datatypes ((array!47100 0))(
  ( (array!47101 (arr!22581 (Array (_ BitVec 32) (_ BitVec 64))) (size!23021 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47100)

(declare-datatypes ((List!16054 0))(
  ( (Nil!16051) (Cons!16050 (h!17181 (_ BitVec 64)) (t!22425 List!16054)) )
))
(declare-fun arrayNoDuplicates!0 (array!47100 (_ BitVec 32) List!16054) Bool)

(assert (=> b!838322 (= res!570064 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16051))))

(declare-fun b!838323 () Bool)

(declare-fun res!570065 () Bool)

(assert (=> b!838323 (=> (not res!570065) (not e!467967))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838323 (= res!570065 (validMask!0 mask!1196))))

(declare-fun b!838324 () Bool)

(declare-fun e!467965 () Bool)

(declare-fun tp_is_empty!15405 () Bool)

(assert (=> b!838324 (= e!467965 tp_is_empty!15405)))

(declare-fun b!838325 () Bool)

(declare-fun e!467966 () Bool)

(assert (=> b!838325 (= e!467966 tp_is_empty!15405)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25587 0))(
  ( (V!25588 (val!7750 Int)) )
))
(declare-datatypes ((tuple2!10250 0))(
  ( (tuple2!10251 (_1!5136 (_ BitVec 64)) (_2!5136 V!25587)) )
))
(declare-datatypes ((List!16055 0))(
  ( (Nil!16052) (Cons!16051 (h!17182 tuple2!10250) (t!22426 List!16055)) )
))
(declare-datatypes ((ListLongMap!9019 0))(
  ( (ListLongMap!9020 (toList!4525 List!16055)) )
))
(declare-fun call!36850 () ListLongMap!9019)

(declare-datatypes ((ValueCell!7263 0))(
  ( (ValueCellFull!7263 (v!10175 V!25587)) (EmptyCell!7263) )
))
(declare-datatypes ((array!47102 0))(
  ( (array!47103 (arr!22582 (Array (_ BitVec 32) ValueCell!7263)) (size!23022 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47102)

(declare-fun minValue!654 () V!25587)

(declare-fun zeroValue!654 () V!25587)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!36847 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2517 (array!47100 array!47102 (_ BitVec 32) (_ BitVec 32) V!25587 V!25587 (_ BitVec 32) Int) ListLongMap!9019)

(assert (=> bm!36847 (= call!36850 (getCurrentListMapNoExtraKeys!2517 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838326 () Bool)

(declare-fun res!570061 () Bool)

(assert (=> b!838326 (=> (not res!570061) (not e!467967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47100 (_ BitVec 32)) Bool)

(assert (=> b!838326 (= res!570061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838327 () Bool)

(declare-fun res!570060 () Bool)

(assert (=> b!838327 (=> (not res!570060) (not e!467967))))

(assert (=> b!838327 (= res!570060 (and (= (size!23022 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23021 _keys!868) (size!23022 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838328 () Bool)

(declare-fun res!570058 () Bool)

(assert (=> b!838328 (=> (not res!570058) (not e!467967))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838328 (= res!570058 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23021 _keys!868))))))

(declare-fun res!570059 () Bool)

(assert (=> start!72354 (=> (not res!570059) (not e!467967))))

(assert (=> start!72354 (= res!570059 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23021 _keys!868))))))

(assert (=> start!72354 e!467967))

(assert (=> start!72354 tp_is_empty!15405))

(assert (=> start!72354 true))

(assert (=> start!72354 tp!47716))

(declare-fun array_inv!17994 (array!47100) Bool)

(assert (=> start!72354 (array_inv!17994 _keys!868)))

(declare-fun e!467968 () Bool)

(declare-fun array_inv!17995 (array!47102) Bool)

(assert (=> start!72354 (and (array_inv!17995 _values!688) e!467968)))

(declare-fun mapIsEmpty!24707 () Bool)

(declare-fun mapRes!24707 () Bool)

(assert (=> mapIsEmpty!24707 mapRes!24707))

(declare-fun b!838329 () Bool)

(declare-fun res!570062 () Bool)

(assert (=> b!838329 (=> (not res!570062) (not e!467967))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!838329 (= res!570062 (and (= (select (arr!22581 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23021 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838330 () Bool)

(assert (=> b!838330 (= e!467968 (and e!467965 mapRes!24707))))

(declare-fun condMapEmpty!24707 () Bool)

(declare-fun mapDefault!24707 () ValueCell!7263)

(assert (=> b!838330 (= condMapEmpty!24707 (= (arr!22582 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7263)) mapDefault!24707)))))

(declare-fun v!557 () V!25587)

(declare-fun bm!36848 () Bool)

(declare-fun call!36851 () ListLongMap!9019)

(assert (=> bm!36848 (= call!36851 (getCurrentListMapNoExtraKeys!2517 _keys!868 (array!47103 (store (arr!22582 _values!688) i!612 (ValueCellFull!7263 v!557)) (size!23022 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24707 () Bool)

(declare-fun tp!47715 () Bool)

(assert (=> mapNonEmpty!24707 (= mapRes!24707 (and tp!47715 e!467966))))

(declare-fun mapRest!24707 () (Array (_ BitVec 32) ValueCell!7263))

(declare-fun mapKey!24707 () (_ BitVec 32))

(declare-fun mapValue!24707 () ValueCell!7263)

(assert (=> mapNonEmpty!24707 (= (arr!22582 _values!688) (store mapRest!24707 mapKey!24707 mapValue!24707))))

(declare-fun e!467964 () Bool)

(declare-fun b!838331 () Bool)

(declare-fun +!2000 (ListLongMap!9019 tuple2!10250) ListLongMap!9019)

(assert (=> b!838331 (= e!467964 (= call!36851 (+!2000 call!36850 (tuple2!10251 k0!854 v!557))))))

(declare-fun b!838332 () Bool)

(assert (=> b!838332 (= e!467967 (not true))))

(assert (=> b!838332 e!467964))

(declare-fun c!91168 () Bool)

(assert (=> b!838332 (= c!91168 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28791 0))(
  ( (Unit!28792) )
))
(declare-fun lt!380674 () Unit!28791)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!241 (array!47100 array!47102 (_ BitVec 32) (_ BitVec 32) V!25587 V!25587 (_ BitVec 32) (_ BitVec 64) V!25587 (_ BitVec 32) Int) Unit!28791)

(assert (=> b!838332 (= lt!380674 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!241 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838333 () Bool)

(declare-fun res!570063 () Bool)

(assert (=> b!838333 (=> (not res!570063) (not e!467967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838333 (= res!570063 (validKeyInArray!0 k0!854))))

(declare-fun b!838334 () Bool)

(assert (=> b!838334 (= e!467964 (= call!36851 call!36850))))

(assert (= (and start!72354 res!570059) b!838323))

(assert (= (and b!838323 res!570065) b!838327))

(assert (= (and b!838327 res!570060) b!838326))

(assert (= (and b!838326 res!570061) b!838322))

(assert (= (and b!838322 res!570064) b!838328))

(assert (= (and b!838328 res!570058) b!838333))

(assert (= (and b!838333 res!570063) b!838329))

(assert (= (and b!838329 res!570062) b!838332))

(assert (= (and b!838332 c!91168) b!838331))

(assert (= (and b!838332 (not c!91168)) b!838334))

(assert (= (or b!838331 b!838334) bm!36848))

(assert (= (or b!838331 b!838334) bm!36847))

(assert (= (and b!838330 condMapEmpty!24707) mapIsEmpty!24707))

(assert (= (and b!838330 (not condMapEmpty!24707)) mapNonEmpty!24707))

(get-info :version)

(assert (= (and mapNonEmpty!24707 ((_ is ValueCellFull!7263) mapValue!24707)) b!838325))

(assert (= (and b!838330 ((_ is ValueCellFull!7263) mapDefault!24707)) b!838324))

(assert (= start!72354 b!838330))

(declare-fun m!782801 () Bool)

(assert (=> mapNonEmpty!24707 m!782801))

(declare-fun m!782803 () Bool)

(assert (=> start!72354 m!782803))

(declare-fun m!782805 () Bool)

(assert (=> start!72354 m!782805))

(declare-fun m!782807 () Bool)

(assert (=> b!838332 m!782807))

(declare-fun m!782809 () Bool)

(assert (=> b!838326 m!782809))

(declare-fun m!782811 () Bool)

(assert (=> b!838329 m!782811))

(declare-fun m!782813 () Bool)

(assert (=> b!838331 m!782813))

(declare-fun m!782815 () Bool)

(assert (=> bm!36847 m!782815))

(declare-fun m!782817 () Bool)

(assert (=> bm!36848 m!782817))

(declare-fun m!782819 () Bool)

(assert (=> bm!36848 m!782819))

(declare-fun m!782821 () Bool)

(assert (=> b!838323 m!782821))

(declare-fun m!782823 () Bool)

(assert (=> b!838333 m!782823))

(declare-fun m!782825 () Bool)

(assert (=> b!838322 m!782825))

(check-sat (not b!838332) (not b!838326) (not mapNonEmpty!24707) (not bm!36847) tp_is_empty!15405 (not b!838333) (not b_next!13539) (not start!72354) (not b!838331) b_and!22625 (not b!838322) (not b!838323) (not bm!36848))
(check-sat b_and!22625 (not b_next!13539))
