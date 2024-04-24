; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73402 () Bool)

(assert start!73402)

(declare-fun b_free!14149 () Bool)

(declare-fun b_next!14149 () Bool)

(assert (=> start!73402 (= b_free!14149 (not b_next!14149))))

(declare-fun tp!49951 () Bool)

(declare-fun b_and!23467 () Bool)

(assert (=> start!73402 (= tp!49951 b_and!23467)))

(declare-fun e!476631 () Bool)

(declare-datatypes ((V!26761 0))(
  ( (V!26762 (val!8190 Int)) )
))
(declare-datatypes ((tuple2!10696 0))(
  ( (tuple2!10697 (_1!5359 (_ BitVec 64)) (_2!5359 V!26761)) )
))
(declare-datatypes ((List!16546 0))(
  ( (Nil!16543) (Cons!16542 (h!17679 tuple2!10696) (t!23133 List!16546)) )
))
(declare-datatypes ((ListLongMap!9467 0))(
  ( (ListLongMap!9468 (toList!4749 List!16546)) )
))
(declare-fun call!38347 () ListLongMap!9467)

(declare-fun call!38348 () ListLongMap!9467)

(declare-fun v!557 () V!26761)

(declare-fun b!854559 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2191 (ListLongMap!9467 tuple2!10696) ListLongMap!9467)

(assert (=> b!854559 (= e!476631 (= call!38348 (+!2191 call!38347 (tuple2!10697 k0!854 v!557))))))

(declare-fun bm!38344 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48817 0))(
  ( (array!48818 (arr!23435 (Array (_ BitVec 32) (_ BitVec 64))) (size!23876 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48817)

(declare-datatypes ((ValueCell!7703 0))(
  ( (ValueCellFull!7703 (v!10615 V!26761)) (EmptyCell!7703) )
))
(declare-datatypes ((array!48819 0))(
  ( (array!48820 (arr!23436 (Array (_ BitVec 32) ValueCell!7703)) (size!23877 (_ BitVec 32))) )
))
(declare-fun lt!385238 () array!48819)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26761)

(declare-fun zeroValue!654 () V!26761)

(declare-fun getCurrentListMapNoExtraKeys!2806 (array!48817 array!48819 (_ BitVec 32) (_ BitVec 32) V!26761 V!26761 (_ BitVec 32) Int) ListLongMap!9467)

(assert (=> bm!38344 (= call!38348 (getCurrentListMapNoExtraKeys!2806 _keys!868 lt!385238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26027 () Bool)

(declare-fun mapRes!26027 () Bool)

(assert (=> mapIsEmpty!26027 mapRes!26027))

(declare-fun mapNonEmpty!26027 () Bool)

(declare-fun tp!49952 () Bool)

(declare-fun e!476633 () Bool)

(assert (=> mapNonEmpty!26027 (= mapRes!26027 (and tp!49952 e!476633))))

(declare-fun mapValue!26027 () ValueCell!7703)

(declare-fun mapRest!26027 () (Array (_ BitVec 32) ValueCell!7703))

(declare-fun mapKey!26027 () (_ BitVec 32))

(declare-fun _values!688 () array!48819)

(assert (=> mapNonEmpty!26027 (= (arr!23436 _values!688) (store mapRest!26027 mapKey!26027 mapValue!26027))))

(declare-fun b!854560 () Bool)

(declare-fun e!476635 () Bool)

(declare-fun e!476634 () Bool)

(assert (=> b!854560 (= e!476635 (not e!476634))))

(declare-fun res!580111 () Bool)

(assert (=> b!854560 (=> res!580111 e!476634)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854560 (= res!580111 (not (validKeyInArray!0 (select (arr!23435 _keys!868) from!1053))))))

(assert (=> b!854560 e!476631))

(declare-fun c!92176 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854560 (= c!92176 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29142 0))(
  ( (Unit!29143) )
))
(declare-fun lt!385239 () Unit!29142)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!396 (array!48817 array!48819 (_ BitVec 32) (_ BitVec 32) V!26761 V!26761 (_ BitVec 32) (_ BitVec 64) V!26761 (_ BitVec 32) Int) Unit!29142)

(assert (=> b!854560 (= lt!385239 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!396 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854561 () Bool)

(declare-fun res!580103 () Bool)

(declare-fun e!476636 () Bool)

(assert (=> b!854561 (=> (not res!580103) (not e!476636))))

(assert (=> b!854561 (= res!580103 (and (= (select (arr!23435 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854562 () Bool)

(declare-fun e!476638 () Bool)

(declare-fun e!476637 () Bool)

(assert (=> b!854562 (= e!476638 (and e!476637 mapRes!26027))))

(declare-fun condMapEmpty!26027 () Bool)

(declare-fun mapDefault!26027 () ValueCell!7703)

(assert (=> b!854562 (= condMapEmpty!26027 (= (arr!23436 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7703)) mapDefault!26027)))))

(declare-fun b!854563 () Bool)

(declare-fun res!580106 () Bool)

(assert (=> b!854563 (=> (not res!580106) (not e!476636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854563 (= res!580106 (validMask!0 mask!1196))))

(declare-fun b!854564 () Bool)

(declare-fun tp_is_empty!16285 () Bool)

(assert (=> b!854564 (= e!476633 tp_is_empty!16285)))

(declare-fun b!854566 () Bool)

(declare-fun res!580104 () Bool)

(assert (=> b!854566 (=> (not res!580104) (not e!476636))))

(assert (=> b!854566 (= res!580104 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23876 _keys!868))))))

(declare-fun b!854567 () Bool)

(assert (=> b!854567 (= e!476634 true)))

(declare-fun lt!385243 () V!26761)

(declare-fun lt!385236 () ListLongMap!9467)

(declare-fun lt!385244 () tuple2!10696)

(assert (=> b!854567 (= (+!2191 lt!385236 lt!385244) (+!2191 (+!2191 lt!385236 (tuple2!10697 k0!854 lt!385243)) lt!385244))))

(declare-fun lt!385241 () V!26761)

(assert (=> b!854567 (= lt!385244 (tuple2!10697 k0!854 lt!385241))))

(declare-fun lt!385235 () Unit!29142)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!315 (ListLongMap!9467 (_ BitVec 64) V!26761 V!26761) Unit!29142)

(assert (=> b!854567 (= lt!385235 (addSameAsAddTwiceSameKeyDiffValues!315 lt!385236 k0!854 lt!385243 lt!385241))))

(declare-fun lt!385237 () V!26761)

(declare-fun get!12362 (ValueCell!7703 V!26761) V!26761)

(assert (=> b!854567 (= lt!385243 (get!12362 (select (arr!23436 _values!688) from!1053) lt!385237))))

(declare-fun lt!385240 () ListLongMap!9467)

(assert (=> b!854567 (= lt!385240 (+!2191 lt!385236 (tuple2!10697 (select (arr!23435 _keys!868) from!1053) lt!385241)))))

(assert (=> b!854567 (= lt!385241 (get!12362 (select (store (arr!23436 _values!688) i!612 (ValueCellFull!7703 v!557)) from!1053) lt!385237))))

(declare-fun dynLambda!1062 (Int (_ BitVec 64)) V!26761)

(assert (=> b!854567 (= lt!385237 (dynLambda!1062 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854567 (= lt!385236 (getCurrentListMapNoExtraKeys!2806 _keys!868 lt!385238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854568 () Bool)

(assert (=> b!854568 (= e!476631 (= call!38348 call!38347))))

(declare-fun b!854569 () Bool)

(declare-fun res!580110 () Bool)

(assert (=> b!854569 (=> (not res!580110) (not e!476636))))

(declare-datatypes ((List!16547 0))(
  ( (Nil!16544) (Cons!16543 (h!17680 (_ BitVec 64)) (t!23134 List!16547)) )
))
(declare-fun arrayNoDuplicates!0 (array!48817 (_ BitVec 32) List!16547) Bool)

(assert (=> b!854569 (= res!580110 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16544))))

(declare-fun b!854570 () Bool)

(assert (=> b!854570 (= e!476636 e!476635)))

(declare-fun res!580109 () Bool)

(assert (=> b!854570 (=> (not res!580109) (not e!476635))))

(assert (=> b!854570 (= res!580109 (= from!1053 i!612))))

(assert (=> b!854570 (= lt!385240 (getCurrentListMapNoExtraKeys!2806 _keys!868 lt!385238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854570 (= lt!385238 (array!48820 (store (arr!23436 _values!688) i!612 (ValueCellFull!7703 v!557)) (size!23877 _values!688)))))

(declare-fun lt!385242 () ListLongMap!9467)

(assert (=> b!854570 (= lt!385242 (getCurrentListMapNoExtraKeys!2806 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854571 () Bool)

(declare-fun res!580105 () Bool)

(assert (=> b!854571 (=> (not res!580105) (not e!476636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48817 (_ BitVec 32)) Bool)

(assert (=> b!854571 (= res!580105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854572 () Bool)

(assert (=> b!854572 (= e!476637 tp_is_empty!16285)))

(declare-fun res!580108 () Bool)

(assert (=> start!73402 (=> (not res!580108) (not e!476636))))

(assert (=> start!73402 (= res!580108 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23876 _keys!868))))))

(assert (=> start!73402 e!476636))

(assert (=> start!73402 tp_is_empty!16285))

(assert (=> start!73402 true))

(assert (=> start!73402 tp!49951))

(declare-fun array_inv!18628 (array!48817) Bool)

(assert (=> start!73402 (array_inv!18628 _keys!868)))

(declare-fun array_inv!18629 (array!48819) Bool)

(assert (=> start!73402 (and (array_inv!18629 _values!688) e!476638)))

(declare-fun b!854565 () Bool)

(declare-fun res!580102 () Bool)

(assert (=> b!854565 (=> (not res!580102) (not e!476636))))

(assert (=> b!854565 (= res!580102 (validKeyInArray!0 k0!854))))

(declare-fun bm!38345 () Bool)

(assert (=> bm!38345 (= call!38347 (getCurrentListMapNoExtraKeys!2806 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854573 () Bool)

(declare-fun res!580107 () Bool)

(assert (=> b!854573 (=> (not res!580107) (not e!476636))))

(assert (=> b!854573 (= res!580107 (and (= (size!23877 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23876 _keys!868) (size!23877 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73402 res!580108) b!854563))

(assert (= (and b!854563 res!580106) b!854573))

(assert (= (and b!854573 res!580107) b!854571))

(assert (= (and b!854571 res!580105) b!854569))

(assert (= (and b!854569 res!580110) b!854566))

(assert (= (and b!854566 res!580104) b!854565))

(assert (= (and b!854565 res!580102) b!854561))

(assert (= (and b!854561 res!580103) b!854570))

(assert (= (and b!854570 res!580109) b!854560))

(assert (= (and b!854560 c!92176) b!854559))

(assert (= (and b!854560 (not c!92176)) b!854568))

(assert (= (or b!854559 b!854568) bm!38344))

(assert (= (or b!854559 b!854568) bm!38345))

(assert (= (and b!854560 (not res!580111)) b!854567))

(assert (= (and b!854562 condMapEmpty!26027) mapIsEmpty!26027))

(assert (= (and b!854562 (not condMapEmpty!26027)) mapNonEmpty!26027))

(get-info :version)

(assert (= (and mapNonEmpty!26027 ((_ is ValueCellFull!7703) mapValue!26027)) b!854564))

(assert (= (and b!854562 ((_ is ValueCellFull!7703) mapDefault!26027)) b!854572))

(assert (= start!73402 b!854562))

(declare-fun b_lambda!11695 () Bool)

(assert (=> (not b_lambda!11695) (not b!854567)))

(declare-fun t!23132 () Bool)

(declare-fun tb!4443 () Bool)

(assert (=> (and start!73402 (= defaultEntry!696 defaultEntry!696) t!23132) tb!4443))

(declare-fun result!8505 () Bool)

(assert (=> tb!4443 (= result!8505 tp_is_empty!16285)))

(assert (=> b!854567 t!23132))

(declare-fun b_and!23469 () Bool)

(assert (= b_and!23467 (and (=> t!23132 result!8505) b_and!23469)))

(declare-fun m!796191 () Bool)

(assert (=> bm!38345 m!796191))

(declare-fun m!796193 () Bool)

(assert (=> start!73402 m!796193))

(declare-fun m!796195 () Bool)

(assert (=> start!73402 m!796195))

(declare-fun m!796197 () Bool)

(assert (=> mapNonEmpty!26027 m!796197))

(declare-fun m!796199 () Bool)

(assert (=> bm!38344 m!796199))

(declare-fun m!796201 () Bool)

(assert (=> b!854567 m!796201))

(declare-fun m!796203 () Bool)

(assert (=> b!854567 m!796203))

(declare-fun m!796205 () Bool)

(assert (=> b!854567 m!796205))

(declare-fun m!796207 () Bool)

(assert (=> b!854567 m!796207))

(declare-fun m!796209 () Bool)

(assert (=> b!854567 m!796209))

(assert (=> b!854567 m!796207))

(assert (=> b!854567 m!796199))

(declare-fun m!796211 () Bool)

(assert (=> b!854567 m!796211))

(declare-fun m!796213 () Bool)

(assert (=> b!854567 m!796213))

(assert (=> b!854567 m!796203))

(declare-fun m!796215 () Bool)

(assert (=> b!854567 m!796215))

(declare-fun m!796217 () Bool)

(assert (=> b!854567 m!796217))

(assert (=> b!854567 m!796217))

(declare-fun m!796219 () Bool)

(assert (=> b!854567 m!796219))

(declare-fun m!796221 () Bool)

(assert (=> b!854567 m!796221))

(declare-fun m!796223 () Bool)

(assert (=> b!854567 m!796223))

(declare-fun m!796225 () Bool)

(assert (=> b!854570 m!796225))

(assert (=> b!854570 m!796215))

(declare-fun m!796227 () Bool)

(assert (=> b!854570 m!796227))

(assert (=> b!854560 m!796221))

(assert (=> b!854560 m!796221))

(declare-fun m!796229 () Bool)

(assert (=> b!854560 m!796229))

(declare-fun m!796231 () Bool)

(assert (=> b!854560 m!796231))

(declare-fun m!796233 () Bool)

(assert (=> b!854561 m!796233))

(declare-fun m!796235 () Bool)

(assert (=> b!854569 m!796235))

(declare-fun m!796237 () Bool)

(assert (=> b!854565 m!796237))

(declare-fun m!796239 () Bool)

(assert (=> b!854559 m!796239))

(declare-fun m!796241 () Bool)

(assert (=> b!854563 m!796241))

(declare-fun m!796243 () Bool)

(assert (=> b!854571 m!796243))

(check-sat (not b_next!14149) (not b!854570) (not b!854571) (not b!854560) (not b!854563) tp_is_empty!16285 (not b!854559) (not b!854567) (not mapNonEmpty!26027) (not bm!38344) b_and!23469 (not b_lambda!11695) (not bm!38345) (not b!854569) (not start!73402) (not b!854565))
(check-sat b_and!23469 (not b_next!14149))
