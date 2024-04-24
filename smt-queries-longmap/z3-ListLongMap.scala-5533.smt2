; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73150 () Bool)

(assert start!73150)

(declare-fun b_free!13897 () Bool)

(declare-fun b_next!13897 () Bool)

(assert (=> start!73150 (= b_free!13897 (not b_next!13897))))

(declare-fun tp!49196 () Bool)

(declare-fun b_and!22993 () Bool)

(assert (=> start!73150 (= tp!49196 b_and!22993)))

(declare-fun b!848701 () Bool)

(declare-fun res!576363 () Bool)

(declare-fun e!473642 () Bool)

(assert (=> b!848701 (=> (not res!576363) (not e!473642))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48327 0))(
  ( (array!48328 (arr!23190 (Array (_ BitVec 32) (_ BitVec 64))) (size!23631 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48327)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!848701 (= res!576363 (and (= (select (arr!23190 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun e!473646 () Bool)

(declare-datatypes ((V!26425 0))(
  ( (V!26426 (val!8064 Int)) )
))
(declare-fun v!557 () V!26425)

(declare-datatypes ((tuple2!10464 0))(
  ( (tuple2!10465 (_1!5243 (_ BitVec 64)) (_2!5243 V!26425)) )
))
(declare-datatypes ((List!16335 0))(
  ( (Nil!16332) (Cons!16331 (h!17468 tuple2!10464) (t!22698 List!16335)) )
))
(declare-datatypes ((ListLongMap!9235 0))(
  ( (ListLongMap!9236 (toList!4633 List!16335)) )
))
(declare-fun call!37591 () ListLongMap!9235)

(declare-fun call!37592 () ListLongMap!9235)

(declare-fun b!848702 () Bool)

(declare-fun +!2093 (ListLongMap!9235 tuple2!10464) ListLongMap!9235)

(assert (=> b!848702 (= e!473646 (= call!37592 (+!2093 call!37591 (tuple2!10465 k0!854 v!557))))))

(declare-fun mapNonEmpty!25649 () Bool)

(declare-fun mapRes!25649 () Bool)

(declare-fun tp!49195 () Bool)

(declare-fun e!473644 () Bool)

(assert (=> mapNonEmpty!25649 (= mapRes!25649 (and tp!49195 e!473644))))

(declare-fun mapKey!25649 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7577 0))(
  ( (ValueCellFull!7577 (v!10489 V!26425)) (EmptyCell!7577) )
))
(declare-fun mapRest!25649 () (Array (_ BitVec 32) ValueCell!7577))

(declare-fun mapValue!25649 () ValueCell!7577)

(declare-datatypes ((array!48329 0))(
  ( (array!48330 (arr!23191 (Array (_ BitVec 32) ValueCell!7577)) (size!23632 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48329)

(assert (=> mapNonEmpty!25649 (= (arr!23191 _values!688) (store mapRest!25649 mapKey!25649 mapValue!25649))))

(declare-fun mapIsEmpty!25649 () Bool)

(assert (=> mapIsEmpty!25649 mapRes!25649))

(declare-fun b!848703 () Bool)

(declare-fun e!473641 () Bool)

(declare-fun e!473643 () Bool)

(assert (=> b!848703 (= e!473641 (and e!473643 mapRes!25649))))

(declare-fun condMapEmpty!25649 () Bool)

(declare-fun mapDefault!25649 () ValueCell!7577)

(assert (=> b!848703 (= condMapEmpty!25649 (= (arr!23191 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7577)) mapDefault!25649)))))

(declare-fun b!848704 () Bool)

(declare-fun tp_is_empty!16033 () Bool)

(assert (=> b!848704 (= e!473644 tp_is_empty!16033)))

(declare-fun b!848705 () Bool)

(declare-fun e!473647 () Bool)

(assert (=> b!848705 (= e!473647 (not true))))

(assert (=> b!848705 e!473646))

(declare-fun c!91798 () Bool)

(assert (=> b!848705 (= c!91798 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28964 0))(
  ( (Unit!28965) )
))
(declare-fun lt!382200 () Unit!28964)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26425)

(declare-fun zeroValue!654 () V!26425)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!318 (array!48327 array!48329 (_ BitVec 32) (_ BitVec 32) V!26425 V!26425 (_ BitVec 32) (_ BitVec 64) V!26425 (_ BitVec 32) Int) Unit!28964)

(assert (=> b!848705 (= lt!382200 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!318 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848706 () Bool)

(assert (=> b!848706 (= e!473642 e!473647)))

(declare-fun res!576357 () Bool)

(assert (=> b!848706 (=> (not res!576357) (not e!473647))))

(assert (=> b!848706 (= res!576357 (= from!1053 i!612))))

(declare-fun lt!382202 () array!48329)

(declare-fun lt!382201 () ListLongMap!9235)

(declare-fun getCurrentListMapNoExtraKeys!2691 (array!48327 array!48329 (_ BitVec 32) (_ BitVec 32) V!26425 V!26425 (_ BitVec 32) Int) ListLongMap!9235)

(assert (=> b!848706 (= lt!382201 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!382202 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848706 (= lt!382202 (array!48330 (store (arr!23191 _values!688) i!612 (ValueCellFull!7577 v!557)) (size!23632 _values!688)))))

(declare-fun lt!382199 () ListLongMap!9235)

(assert (=> b!848706 (= lt!382199 (getCurrentListMapNoExtraKeys!2691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!576361 () Bool)

(assert (=> start!73150 (=> (not res!576361) (not e!473642))))

(assert (=> start!73150 (= res!576361 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23631 _keys!868))))))

(assert (=> start!73150 e!473642))

(assert (=> start!73150 tp_is_empty!16033))

(assert (=> start!73150 true))

(assert (=> start!73150 tp!49196))

(declare-fun array_inv!18462 (array!48327) Bool)

(assert (=> start!73150 (array_inv!18462 _keys!868)))

(declare-fun array_inv!18463 (array!48329) Bool)

(assert (=> start!73150 (and (array_inv!18463 _values!688) e!473641)))

(declare-fun bm!37588 () Bool)

(assert (=> bm!37588 (= call!37591 (getCurrentListMapNoExtraKeys!2691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848707 () Bool)

(declare-fun res!576364 () Bool)

(assert (=> b!848707 (=> (not res!576364) (not e!473642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48327 (_ BitVec 32)) Bool)

(assert (=> b!848707 (= res!576364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848708 () Bool)

(declare-fun res!576359 () Bool)

(assert (=> b!848708 (=> (not res!576359) (not e!473642))))

(assert (=> b!848708 (= res!576359 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23631 _keys!868))))))

(declare-fun b!848709 () Bool)

(declare-fun res!576360 () Bool)

(assert (=> b!848709 (=> (not res!576360) (not e!473642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848709 (= res!576360 (validMask!0 mask!1196))))

(declare-fun bm!37589 () Bool)

(assert (=> bm!37589 (= call!37592 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!382202 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848710 () Bool)

(assert (=> b!848710 (= e!473646 (= call!37592 call!37591))))

(declare-fun b!848711 () Bool)

(declare-fun res!576356 () Bool)

(assert (=> b!848711 (=> (not res!576356) (not e!473642))))

(declare-datatypes ((List!16336 0))(
  ( (Nil!16333) (Cons!16332 (h!17469 (_ BitVec 64)) (t!22699 List!16336)) )
))
(declare-fun arrayNoDuplicates!0 (array!48327 (_ BitVec 32) List!16336) Bool)

(assert (=> b!848711 (= res!576356 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16333))))

(declare-fun b!848712 () Bool)

(declare-fun res!576362 () Bool)

(assert (=> b!848712 (=> (not res!576362) (not e!473642))))

(assert (=> b!848712 (= res!576362 (and (= (size!23632 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23631 _keys!868) (size!23632 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848713 () Bool)

(assert (=> b!848713 (= e!473643 tp_is_empty!16033)))

(declare-fun b!848714 () Bool)

(declare-fun res!576358 () Bool)

(assert (=> b!848714 (=> (not res!576358) (not e!473642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848714 (= res!576358 (validKeyInArray!0 k0!854))))

(assert (= (and start!73150 res!576361) b!848709))

(assert (= (and b!848709 res!576360) b!848712))

(assert (= (and b!848712 res!576362) b!848707))

(assert (= (and b!848707 res!576364) b!848711))

(assert (= (and b!848711 res!576356) b!848708))

(assert (= (and b!848708 res!576359) b!848714))

(assert (= (and b!848714 res!576358) b!848701))

(assert (= (and b!848701 res!576363) b!848706))

(assert (= (and b!848706 res!576357) b!848705))

(assert (= (and b!848705 c!91798) b!848702))

(assert (= (and b!848705 (not c!91798)) b!848710))

(assert (= (or b!848702 b!848710) bm!37589))

(assert (= (or b!848702 b!848710) bm!37588))

(assert (= (and b!848703 condMapEmpty!25649) mapIsEmpty!25649))

(assert (= (and b!848703 (not condMapEmpty!25649)) mapNonEmpty!25649))

(get-info :version)

(assert (= (and mapNonEmpty!25649 ((_ is ValueCellFull!7577) mapValue!25649)) b!848704))

(assert (= (and b!848703 ((_ is ValueCellFull!7577) mapDefault!25649)) b!848713))

(assert (= start!73150 b!848703))

(declare-fun m!790055 () Bool)

(assert (=> b!848706 m!790055))

(declare-fun m!790057 () Bool)

(assert (=> b!848706 m!790057))

(declare-fun m!790059 () Bool)

(assert (=> b!848706 m!790059))

(declare-fun m!790061 () Bool)

(assert (=> b!848705 m!790061))

(declare-fun m!790063 () Bool)

(assert (=> b!848701 m!790063))

(declare-fun m!790065 () Bool)

(assert (=> b!848702 m!790065))

(declare-fun m!790067 () Bool)

(assert (=> mapNonEmpty!25649 m!790067))

(declare-fun m!790069 () Bool)

(assert (=> bm!37589 m!790069))

(declare-fun m!790071 () Bool)

(assert (=> bm!37588 m!790071))

(declare-fun m!790073 () Bool)

(assert (=> start!73150 m!790073))

(declare-fun m!790075 () Bool)

(assert (=> start!73150 m!790075))

(declare-fun m!790077 () Bool)

(assert (=> b!848714 m!790077))

(declare-fun m!790079 () Bool)

(assert (=> b!848707 m!790079))

(declare-fun m!790081 () Bool)

(assert (=> b!848711 m!790081))

(declare-fun m!790083 () Bool)

(assert (=> b!848709 m!790083))

(check-sat (not b!848707) (not b!848711) (not b!848706) b_and!22993 (not start!73150) (not b!848709) (not b!848705) (not b!848714) tp_is_empty!16033 (not bm!37588) (not mapNonEmpty!25649) (not b_next!13897) (not bm!37589) (not b!848702))
(check-sat b_and!22993 (not b_next!13897))
