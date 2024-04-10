; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72360 () Bool)

(assert start!72360)

(declare-fun b_free!13545 () Bool)

(declare-fun b_next!13545 () Bool)

(assert (=> start!72360 (= b_free!13545 (not b_next!13545))))

(declare-fun tp!47733 () Bool)

(declare-fun b_and!22631 () Bool)

(assert (=> start!72360 (= tp!47733 b_and!22631)))

(declare-fun b!838439 () Bool)

(declare-fun res!570131 () Bool)

(declare-fun e!468021 () Bool)

(assert (=> b!838439 (=> (not res!570131) (not e!468021))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47110 0))(
  ( (array!47111 (arr!22586 (Array (_ BitVec 32) (_ BitVec 64))) (size!23026 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47110)

(declare-datatypes ((V!25595 0))(
  ( (V!25596 (val!7753 Int)) )
))
(declare-datatypes ((ValueCell!7266 0))(
  ( (ValueCellFull!7266 (v!10178 V!25595)) (EmptyCell!7266) )
))
(declare-datatypes ((array!47112 0))(
  ( (array!47113 (arr!22587 (Array (_ BitVec 32) ValueCell!7266)) (size!23027 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47112)

(assert (=> b!838439 (= res!570131 (and (= (size!23027 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23026 _keys!868) (size!23027 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838440 () Bool)

(declare-fun e!468019 () Bool)

(declare-fun e!468020 () Bool)

(declare-fun mapRes!24716 () Bool)

(assert (=> b!838440 (= e!468019 (and e!468020 mapRes!24716))))

(declare-fun condMapEmpty!24716 () Bool)

(declare-fun mapDefault!24716 () ValueCell!7266)

(assert (=> b!838440 (= condMapEmpty!24716 (= (arr!22587 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7266)) mapDefault!24716)))))

(declare-fun b!838441 () Bool)

(assert (=> b!838441 (= e!468021 (not true))))

(declare-fun e!468018 () Bool)

(assert (=> b!838441 e!468018))

(declare-fun c!91177 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838441 (= c!91177 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25595)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25595)

(declare-fun zeroValue!654 () V!25595)

(declare-datatypes ((Unit!28795 0))(
  ( (Unit!28796) )
))
(declare-fun lt!380683 () Unit!28795)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!243 (array!47110 array!47112 (_ BitVec 32) (_ BitVec 32) V!25595 V!25595 (_ BitVec 32) (_ BitVec 64) V!25595 (_ BitVec 32) Int) Unit!28795)

(assert (=> b!838441 (= lt!380683 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24716 () Bool)

(assert (=> mapIsEmpty!24716 mapRes!24716))

(declare-fun b!838442 () Bool)

(declare-fun res!570137 () Bool)

(assert (=> b!838442 (=> (not res!570137) (not e!468021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838442 (= res!570137 (validKeyInArray!0 k0!854))))

(declare-fun bm!36865 () Bool)

(declare-datatypes ((tuple2!10254 0))(
  ( (tuple2!10255 (_1!5138 (_ BitVec 64)) (_2!5138 V!25595)) )
))
(declare-datatypes ((List!16058 0))(
  ( (Nil!16055) (Cons!16054 (h!17185 tuple2!10254) (t!22429 List!16058)) )
))
(declare-datatypes ((ListLongMap!9023 0))(
  ( (ListLongMap!9024 (toList!4527 List!16058)) )
))
(declare-fun call!36868 () ListLongMap!9023)

(declare-fun getCurrentListMapNoExtraKeys!2519 (array!47110 array!47112 (_ BitVec 32) (_ BitVec 32) V!25595 V!25595 (_ BitVec 32) Int) ListLongMap!9023)

(assert (=> bm!36865 (= call!36868 (getCurrentListMapNoExtraKeys!2519 _keys!868 (array!47113 (store (arr!22587 _values!688) i!612 (ValueCellFull!7266 v!557)) (size!23027 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838444 () Bool)

(declare-fun tp_is_empty!15411 () Bool)

(assert (=> b!838444 (= e!468020 tp_is_empty!15411)))

(declare-fun b!838445 () Bool)

(declare-fun call!36869 () ListLongMap!9023)

(assert (=> b!838445 (= e!468018 (= call!36868 call!36869))))

(declare-fun mapNonEmpty!24716 () Bool)

(declare-fun tp!47734 () Bool)

(declare-fun e!468017 () Bool)

(assert (=> mapNonEmpty!24716 (= mapRes!24716 (and tp!47734 e!468017))))

(declare-fun mapValue!24716 () ValueCell!7266)

(declare-fun mapRest!24716 () (Array (_ BitVec 32) ValueCell!7266))

(declare-fun mapKey!24716 () (_ BitVec 32))

(assert (=> mapNonEmpty!24716 (= (arr!22587 _values!688) (store mapRest!24716 mapKey!24716 mapValue!24716))))

(declare-fun bm!36866 () Bool)

(assert (=> bm!36866 (= call!36869 (getCurrentListMapNoExtraKeys!2519 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838446 () Bool)

(declare-fun res!570134 () Bool)

(assert (=> b!838446 (=> (not res!570134) (not e!468021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838446 (= res!570134 (validMask!0 mask!1196))))

(declare-fun b!838447 () Bool)

(assert (=> b!838447 (= e!468017 tp_is_empty!15411)))

(declare-fun b!838443 () Bool)

(declare-fun res!570133 () Bool)

(assert (=> b!838443 (=> (not res!570133) (not e!468021))))

(assert (=> b!838443 (= res!570133 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23026 _keys!868))))))

(declare-fun res!570135 () Bool)

(assert (=> start!72360 (=> (not res!570135) (not e!468021))))

(assert (=> start!72360 (= res!570135 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23026 _keys!868))))))

(assert (=> start!72360 e!468021))

(assert (=> start!72360 tp_is_empty!15411))

(assert (=> start!72360 true))

(assert (=> start!72360 tp!47733))

(declare-fun array_inv!17998 (array!47110) Bool)

(assert (=> start!72360 (array_inv!17998 _keys!868)))

(declare-fun array_inv!17999 (array!47112) Bool)

(assert (=> start!72360 (and (array_inv!17999 _values!688) e!468019)))

(declare-fun b!838448 () Bool)

(declare-fun res!570136 () Bool)

(assert (=> b!838448 (=> (not res!570136) (not e!468021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47110 (_ BitVec 32)) Bool)

(assert (=> b!838448 (= res!570136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838449 () Bool)

(declare-fun +!2001 (ListLongMap!9023 tuple2!10254) ListLongMap!9023)

(assert (=> b!838449 (= e!468018 (= call!36868 (+!2001 call!36869 (tuple2!10255 k0!854 v!557))))))

(declare-fun b!838450 () Bool)

(declare-fun res!570132 () Bool)

(assert (=> b!838450 (=> (not res!570132) (not e!468021))))

(assert (=> b!838450 (= res!570132 (and (= (select (arr!22586 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23026 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838451 () Bool)

(declare-fun res!570130 () Bool)

(assert (=> b!838451 (=> (not res!570130) (not e!468021))))

(declare-datatypes ((List!16059 0))(
  ( (Nil!16056) (Cons!16055 (h!17186 (_ BitVec 64)) (t!22430 List!16059)) )
))
(declare-fun arrayNoDuplicates!0 (array!47110 (_ BitVec 32) List!16059) Bool)

(assert (=> b!838451 (= res!570130 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16056))))

(assert (= (and start!72360 res!570135) b!838446))

(assert (= (and b!838446 res!570134) b!838439))

(assert (= (and b!838439 res!570131) b!838448))

(assert (= (and b!838448 res!570136) b!838451))

(assert (= (and b!838451 res!570130) b!838443))

(assert (= (and b!838443 res!570133) b!838442))

(assert (= (and b!838442 res!570137) b!838450))

(assert (= (and b!838450 res!570132) b!838441))

(assert (= (and b!838441 c!91177) b!838449))

(assert (= (and b!838441 (not c!91177)) b!838445))

(assert (= (or b!838449 b!838445) bm!36865))

(assert (= (or b!838449 b!838445) bm!36866))

(assert (= (and b!838440 condMapEmpty!24716) mapIsEmpty!24716))

(assert (= (and b!838440 (not condMapEmpty!24716)) mapNonEmpty!24716))

(get-info :version)

(assert (= (and mapNonEmpty!24716 ((_ is ValueCellFull!7266) mapValue!24716)) b!838447))

(assert (= (and b!838440 ((_ is ValueCellFull!7266) mapDefault!24716)) b!838444))

(assert (= start!72360 b!838440))

(declare-fun m!782879 () Bool)

(assert (=> b!838451 m!782879))

(declare-fun m!782881 () Bool)

(assert (=> b!838442 m!782881))

(declare-fun m!782883 () Bool)

(assert (=> b!838446 m!782883))

(declare-fun m!782885 () Bool)

(assert (=> start!72360 m!782885))

(declare-fun m!782887 () Bool)

(assert (=> start!72360 m!782887))

(declare-fun m!782889 () Bool)

(assert (=> b!838441 m!782889))

(declare-fun m!782891 () Bool)

(assert (=> mapNonEmpty!24716 m!782891))

(declare-fun m!782893 () Bool)

(assert (=> bm!36865 m!782893))

(declare-fun m!782895 () Bool)

(assert (=> bm!36865 m!782895))

(declare-fun m!782897 () Bool)

(assert (=> b!838450 m!782897))

(declare-fun m!782899 () Bool)

(assert (=> b!838449 m!782899))

(declare-fun m!782901 () Bool)

(assert (=> b!838448 m!782901))

(declare-fun m!782903 () Bool)

(assert (=> bm!36866 m!782903))

(check-sat b_and!22631 (not mapNonEmpty!24716) (not b!838451) (not b!838442) (not b!838441) (not bm!36865) (not b!838448) (not b!838449) tp_is_empty!15411 (not bm!36866) (not b_next!13545) (not start!72360) (not b!838446))
(check-sat b_and!22631 (not b_next!13545))
