; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72486 () Bool)

(assert start!72486)

(declare-fun b_free!13671 () Bool)

(declare-fun b_next!13671 () Bool)

(assert (=> start!72486 (= b_free!13671 (not b_next!13671))))

(declare-fun tp!48111 () Bool)

(declare-fun b_and!22757 () Bool)

(assert (=> start!72486 (= tp!48111 b_and!22757)))

(declare-fun res!571648 () Bool)

(declare-fun e!469156 () Bool)

(assert (=> start!72486 (=> (not res!571648) (not e!469156))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47352 0))(
  ( (array!47353 (arr!22707 (Array (_ BitVec 32) (_ BitVec 64))) (size!23147 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47352)

(assert (=> start!72486 (= res!571648 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23147 _keys!868))))))

(assert (=> start!72486 e!469156))

(declare-fun tp_is_empty!15537 () Bool)

(assert (=> start!72486 tp_is_empty!15537))

(assert (=> start!72486 true))

(assert (=> start!72486 tp!48111))

(declare-fun array_inv!18076 (array!47352) Bool)

(assert (=> start!72486 (array_inv!18076 _keys!868)))

(declare-datatypes ((V!25763 0))(
  ( (V!25764 (val!7816 Int)) )
))
(declare-datatypes ((ValueCell!7329 0))(
  ( (ValueCellFull!7329 (v!10241 V!25763)) (EmptyCell!7329) )
))
(declare-datatypes ((array!47354 0))(
  ( (array!47355 (arr!22708 (Array (_ BitVec 32) ValueCell!7329)) (size!23148 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47354)

(declare-fun e!469153 () Bool)

(declare-fun array_inv!18077 (array!47354) Bool)

(assert (=> start!72486 (and (array_inv!18077 _values!688) e!469153)))

(declare-fun b!840896 () Bool)

(declare-fun res!571643 () Bool)

(assert (=> b!840896 (=> (not res!571643) (not e!469156))))

(declare-datatypes ((List!16150 0))(
  ( (Nil!16147) (Cons!16146 (h!17277 (_ BitVec 64)) (t!22521 List!16150)) )
))
(declare-fun arrayNoDuplicates!0 (array!47352 (_ BitVec 32) List!16150) Bool)

(assert (=> b!840896 (= res!571643 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16147))))

(declare-fun v!557 () V!25763)

(declare-fun e!469154 () Bool)

(declare-datatypes ((tuple2!10364 0))(
  ( (tuple2!10365 (_1!5193 (_ BitVec 64)) (_2!5193 V!25763)) )
))
(declare-datatypes ((List!16151 0))(
  ( (Nil!16148) (Cons!16147 (h!17278 tuple2!10364) (t!22522 List!16151)) )
))
(declare-datatypes ((ListLongMap!9133 0))(
  ( (ListLongMap!9134 (toList!4582 List!16151)) )
))
(declare-fun call!37247 () ListLongMap!9133)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!37246 () ListLongMap!9133)

(declare-fun b!840897 () Bool)

(declare-fun +!2051 (ListLongMap!9133 tuple2!10364) ListLongMap!9133)

(assert (=> b!840897 (= e!469154 (= call!37247 (+!2051 call!37246 (tuple2!10365 k0!854 v!557))))))

(declare-fun b!840898 () Bool)

(declare-fun res!571645 () Bool)

(assert (=> b!840898 (=> (not res!571645) (not e!469156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840898 (= res!571645 (validKeyInArray!0 k0!854))))

(declare-fun b!840899 () Bool)

(declare-fun e!469155 () Bool)

(declare-fun mapRes!24905 () Bool)

(assert (=> b!840899 (= e!469153 (and e!469155 mapRes!24905))))

(declare-fun condMapEmpty!24905 () Bool)

(declare-fun mapDefault!24905 () ValueCell!7329)

(assert (=> b!840899 (= condMapEmpty!24905 (= (arr!22708 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7329)) mapDefault!24905)))))

(declare-fun mapNonEmpty!24905 () Bool)

(declare-fun tp!48112 () Bool)

(declare-fun e!469152 () Bool)

(assert (=> mapNonEmpty!24905 (= mapRes!24905 (and tp!48112 e!469152))))

(declare-fun mapValue!24905 () ValueCell!7329)

(declare-fun mapKey!24905 () (_ BitVec 32))

(declare-fun mapRest!24905 () (Array (_ BitVec 32) ValueCell!7329))

(assert (=> mapNonEmpty!24905 (= (arr!22708 _values!688) (store mapRest!24905 mapKey!24905 mapValue!24905))))

(declare-fun b!840900 () Bool)

(assert (=> b!840900 (= e!469155 tp_is_empty!15537)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37243 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25763)

(declare-fun zeroValue!654 () V!25763)

(declare-fun getCurrentListMapNoExtraKeys!2569 (array!47352 array!47354 (_ BitVec 32) (_ BitVec 32) V!25763 V!25763 (_ BitVec 32) Int) ListLongMap!9133)

(assert (=> bm!37243 (= call!37247 (getCurrentListMapNoExtraKeys!2569 _keys!868 (array!47355 (store (arr!22708 _values!688) i!612 (ValueCellFull!7329 v!557)) (size!23148 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840901 () Bool)

(declare-fun res!571647 () Bool)

(assert (=> b!840901 (=> (not res!571647) (not e!469156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47352 (_ BitVec 32)) Bool)

(assert (=> b!840901 (= res!571647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840902 () Bool)

(declare-fun res!571649 () Bool)

(assert (=> b!840902 (=> (not res!571649) (not e!469156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840902 (= res!571649 (validMask!0 mask!1196))))

(declare-fun b!840903 () Bool)

(assert (=> b!840903 (= e!469156 (not true))))

(assert (=> b!840903 e!469154))

(declare-fun c!91366 () Bool)

(assert (=> b!840903 (= c!91366 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28883 0))(
  ( (Unit!28884) )
))
(declare-fun lt!380872 () Unit!28883)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!287 (array!47352 array!47354 (_ BitVec 32) (_ BitVec 32) V!25763 V!25763 (_ BitVec 32) (_ BitVec 64) V!25763 (_ BitVec 32) Int) Unit!28883)

(assert (=> b!840903 (= lt!380872 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!287 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840904 () Bool)

(assert (=> b!840904 (= e!469152 tp_is_empty!15537)))

(declare-fun bm!37244 () Bool)

(assert (=> bm!37244 (= call!37246 (getCurrentListMapNoExtraKeys!2569 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840905 () Bool)

(declare-fun res!571644 () Bool)

(assert (=> b!840905 (=> (not res!571644) (not e!469156))))

(assert (=> b!840905 (= res!571644 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23147 _keys!868))))))

(declare-fun b!840906 () Bool)

(assert (=> b!840906 (= e!469154 (= call!37247 call!37246))))

(declare-fun b!840907 () Bool)

(declare-fun res!571646 () Bool)

(assert (=> b!840907 (=> (not res!571646) (not e!469156))))

(assert (=> b!840907 (= res!571646 (and (= (select (arr!22707 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23147 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840908 () Bool)

(declare-fun res!571642 () Bool)

(assert (=> b!840908 (=> (not res!571642) (not e!469156))))

(assert (=> b!840908 (= res!571642 (and (= (size!23148 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23147 _keys!868) (size!23148 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24905 () Bool)

(assert (=> mapIsEmpty!24905 mapRes!24905))

(assert (= (and start!72486 res!571648) b!840902))

(assert (= (and b!840902 res!571649) b!840908))

(assert (= (and b!840908 res!571642) b!840901))

(assert (= (and b!840901 res!571647) b!840896))

(assert (= (and b!840896 res!571643) b!840905))

(assert (= (and b!840905 res!571644) b!840898))

(assert (= (and b!840898 res!571645) b!840907))

(assert (= (and b!840907 res!571646) b!840903))

(assert (= (and b!840903 c!91366) b!840897))

(assert (= (and b!840903 (not c!91366)) b!840906))

(assert (= (or b!840897 b!840906) bm!37243))

(assert (= (or b!840897 b!840906) bm!37244))

(assert (= (and b!840899 condMapEmpty!24905) mapIsEmpty!24905))

(assert (= (and b!840899 (not condMapEmpty!24905)) mapNonEmpty!24905))

(get-info :version)

(assert (= (and mapNonEmpty!24905 ((_ is ValueCellFull!7329) mapValue!24905)) b!840904))

(assert (= (and b!840899 ((_ is ValueCellFull!7329) mapDefault!24905)) b!840900))

(assert (= start!72486 b!840899))

(declare-fun m!784517 () Bool)

(assert (=> start!72486 m!784517))

(declare-fun m!784519 () Bool)

(assert (=> start!72486 m!784519))

(declare-fun m!784521 () Bool)

(assert (=> b!840896 m!784521))

(declare-fun m!784523 () Bool)

(assert (=> b!840902 m!784523))

(declare-fun m!784525 () Bool)

(assert (=> b!840897 m!784525))

(declare-fun m!784527 () Bool)

(assert (=> b!840901 m!784527))

(declare-fun m!784529 () Bool)

(assert (=> bm!37243 m!784529))

(declare-fun m!784531 () Bool)

(assert (=> bm!37243 m!784531))

(declare-fun m!784533 () Bool)

(assert (=> b!840898 m!784533))

(declare-fun m!784535 () Bool)

(assert (=> bm!37244 m!784535))

(declare-fun m!784537 () Bool)

(assert (=> b!840903 m!784537))

(declare-fun m!784539 () Bool)

(assert (=> mapNonEmpty!24905 m!784539))

(declare-fun m!784541 () Bool)

(assert (=> b!840907 m!784541))

(check-sat b_and!22757 (not b_next!13671) (not start!72486) (not b!840896) (not mapNonEmpty!24905) (not b!840902) (not b!840897) (not b!840898) tp_is_empty!15537 (not bm!37244) (not b!840903) (not b!840901) (not bm!37243))
(check-sat b_and!22757 (not b_next!13671))
