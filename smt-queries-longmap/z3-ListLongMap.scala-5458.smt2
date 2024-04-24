; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72700 () Bool)

(assert start!72700)

(declare-fun b_free!13717 () Bool)

(declare-fun b_next!13717 () Bool)

(assert (=> start!72700 (= b_free!13717 (not b_next!13717))))

(declare-fun tp!48250 () Bool)

(declare-fun b_and!22813 () Bool)

(assert (=> start!72700 (= tp!48250 b_and!22813)))

(declare-fun b!842696 () Bool)

(declare-fun e!470150 () Bool)

(declare-fun tp_is_empty!15583 () Bool)

(assert (=> b!842696 (= e!470150 tp_is_empty!15583)))

(declare-fun b!842697 () Bool)

(declare-fun res!572538 () Bool)

(declare-fun e!470147 () Bool)

(assert (=> b!842697 (=> (not res!572538) (not e!470147))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47459 0))(
  ( (array!47460 (arr!22756 (Array (_ BitVec 32) (_ BitVec 64))) (size!23197 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47459)

(assert (=> b!842697 (= res!572538 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23197 _keys!868))))))

(declare-fun b!842698 () Bool)

(declare-fun res!572540 () Bool)

(assert (=> b!842698 (=> (not res!572540) (not e!470147))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!842698 (= res!572540 (and (= (select (arr!22756 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23197 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24974 () Bool)

(declare-fun mapRes!24974 () Bool)

(assert (=> mapIsEmpty!24974 mapRes!24974))

(declare-fun b!842699 () Bool)

(declare-fun e!470151 () Bool)

(assert (=> b!842699 (= e!470151 tp_is_empty!15583)))

(declare-datatypes ((V!25825 0))(
  ( (V!25826 (val!7839 Int)) )
))
(declare-datatypes ((tuple2!10334 0))(
  ( (tuple2!10335 (_1!5178 (_ BitVec 64)) (_2!5178 V!25825)) )
))
(declare-datatypes ((List!16106 0))(
  ( (Nil!16103) (Cons!16102 (h!17239 tuple2!10334) (t!22469 List!16106)) )
))
(declare-datatypes ((ListLongMap!9105 0))(
  ( (ListLongMap!9106 (toList!4568 List!16106)) )
))
(declare-fun call!37430 () ListLongMap!9105)

(declare-fun v!557 () V!25825)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37426 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7352 0))(
  ( (ValueCellFull!7352 (v!10264 V!25825)) (EmptyCell!7352) )
))
(declare-datatypes ((array!47461 0))(
  ( (array!47462 (arr!22757 (Array (_ BitVec 32) ValueCell!7352)) (size!23198 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47461)

(declare-fun minValue!654 () V!25825)

(declare-fun zeroValue!654 () V!25825)

(declare-fun getCurrentListMapNoExtraKeys!2627 (array!47459 array!47461 (_ BitVec 32) (_ BitVec 32) V!25825 V!25825 (_ BitVec 32) Int) ListLongMap!9105)

(assert (=> bm!37426 (= call!37430 (getCurrentListMapNoExtraKeys!2627 _keys!868 (array!47462 (store (arr!22757 _values!688) i!612 (ValueCellFull!7352 v!557)) (size!23198 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842700 () Bool)

(declare-fun res!572545 () Bool)

(assert (=> b!842700 (=> (not res!572545) (not e!470147))))

(declare-datatypes ((List!16107 0))(
  ( (Nil!16104) (Cons!16103 (h!17240 (_ BitVec 64)) (t!22470 List!16107)) )
))
(declare-fun arrayNoDuplicates!0 (array!47459 (_ BitVec 32) List!16107) Bool)

(assert (=> b!842700 (= res!572545 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16104))))

(declare-fun b!842701 () Bool)

(assert (=> b!842701 (= e!470147 (not true))))

(declare-fun e!470149 () Bool)

(assert (=> b!842701 e!470149))

(declare-fun c!91717 () Bool)

(assert (=> b!842701 (= c!91717 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28928 0))(
  ( (Unit!28929) )
))
(declare-fun lt!381302 () Unit!28928)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!300 (array!47459 array!47461 (_ BitVec 32) (_ BitVec 32) V!25825 V!25825 (_ BitVec 32) (_ BitVec 64) V!25825 (_ BitVec 32) Int) Unit!28928)

(assert (=> b!842701 (= lt!381302 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!300 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842702 () Bool)

(declare-fun res!572542 () Bool)

(assert (=> b!842702 (=> (not res!572542) (not e!470147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47459 (_ BitVec 32)) Bool)

(assert (=> b!842702 (= res!572542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842703 () Bool)

(declare-fun call!37429 () ListLongMap!9105)

(assert (=> b!842703 (= e!470149 (= call!37430 call!37429))))

(declare-fun res!572541 () Bool)

(assert (=> start!72700 (=> (not res!572541) (not e!470147))))

(assert (=> start!72700 (= res!572541 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23197 _keys!868))))))

(assert (=> start!72700 e!470147))

(assert (=> start!72700 tp_is_empty!15583))

(assert (=> start!72700 true))

(assert (=> start!72700 tp!48250))

(declare-fun array_inv!18154 (array!47459) Bool)

(assert (=> start!72700 (array_inv!18154 _keys!868)))

(declare-fun e!470148 () Bool)

(declare-fun array_inv!18155 (array!47461) Bool)

(assert (=> start!72700 (and (array_inv!18155 _values!688) e!470148)))

(declare-fun b!842704 () Bool)

(declare-fun res!572544 () Bool)

(assert (=> b!842704 (=> (not res!572544) (not e!470147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842704 (= res!572544 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24974 () Bool)

(declare-fun tp!48251 () Bool)

(assert (=> mapNonEmpty!24974 (= mapRes!24974 (and tp!48251 e!470151))))

(declare-fun mapValue!24974 () ValueCell!7352)

(declare-fun mapRest!24974 () (Array (_ BitVec 32) ValueCell!7352))

(declare-fun mapKey!24974 () (_ BitVec 32))

(assert (=> mapNonEmpty!24974 (= (arr!22757 _values!688) (store mapRest!24974 mapKey!24974 mapValue!24974))))

(declare-fun bm!37427 () Bool)

(assert (=> bm!37427 (= call!37429 (getCurrentListMapNoExtraKeys!2627 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842705 () Bool)

(assert (=> b!842705 (= e!470148 (and e!470150 mapRes!24974))))

(declare-fun condMapEmpty!24974 () Bool)

(declare-fun mapDefault!24974 () ValueCell!7352)

(assert (=> b!842705 (= condMapEmpty!24974 (= (arr!22757 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7352)) mapDefault!24974)))))

(declare-fun b!842706 () Bool)

(declare-fun +!2073 (ListLongMap!9105 tuple2!10334) ListLongMap!9105)

(assert (=> b!842706 (= e!470149 (= call!37430 (+!2073 call!37429 (tuple2!10335 k0!854 v!557))))))

(declare-fun b!842707 () Bool)

(declare-fun res!572543 () Bool)

(assert (=> b!842707 (=> (not res!572543) (not e!470147))))

(assert (=> b!842707 (= res!572543 (and (= (size!23198 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23197 _keys!868) (size!23198 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842708 () Bool)

(declare-fun res!572539 () Bool)

(assert (=> b!842708 (=> (not res!572539) (not e!470147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842708 (= res!572539 (validKeyInArray!0 k0!854))))

(assert (= (and start!72700 res!572541) b!842704))

(assert (= (and b!842704 res!572544) b!842707))

(assert (= (and b!842707 res!572543) b!842702))

(assert (= (and b!842702 res!572542) b!842700))

(assert (= (and b!842700 res!572545) b!842697))

(assert (= (and b!842697 res!572538) b!842708))

(assert (= (and b!842708 res!572539) b!842698))

(assert (= (and b!842698 res!572540) b!842701))

(assert (= (and b!842701 c!91717) b!842706))

(assert (= (and b!842701 (not c!91717)) b!842703))

(assert (= (or b!842706 b!842703) bm!37426))

(assert (= (or b!842706 b!842703) bm!37427))

(assert (= (and b!842705 condMapEmpty!24974) mapIsEmpty!24974))

(assert (= (and b!842705 (not condMapEmpty!24974)) mapNonEmpty!24974))

(get-info :version)

(assert (= (and mapNonEmpty!24974 ((_ is ValueCellFull!7352) mapValue!24974)) b!842699))

(assert (= (and b!842705 ((_ is ValueCellFull!7352) mapDefault!24974)) b!842696))

(assert (= start!72700 b!842705))

(declare-fun m!786407 () Bool)

(assert (=> b!842706 m!786407))

(declare-fun m!786409 () Bool)

(assert (=> b!842702 m!786409))

(declare-fun m!786411 () Bool)

(assert (=> start!72700 m!786411))

(declare-fun m!786413 () Bool)

(assert (=> start!72700 m!786413))

(declare-fun m!786415 () Bool)

(assert (=> bm!37426 m!786415))

(declare-fun m!786417 () Bool)

(assert (=> bm!37426 m!786417))

(declare-fun m!786419 () Bool)

(assert (=> b!842708 m!786419))

(declare-fun m!786421 () Bool)

(assert (=> b!842704 m!786421))

(declare-fun m!786423 () Bool)

(assert (=> b!842701 m!786423))

(declare-fun m!786425 () Bool)

(assert (=> b!842698 m!786425))

(declare-fun m!786427 () Bool)

(assert (=> b!842700 m!786427))

(declare-fun m!786429 () Bool)

(assert (=> mapNonEmpty!24974 m!786429))

(declare-fun m!786431 () Bool)

(assert (=> bm!37427 m!786431))

(check-sat tp_is_empty!15583 (not b!842702) (not start!72700) (not b!842706) (not b_next!13717) (not b!842704) (not b!842701) (not bm!37426) b_and!22813 (not bm!37427) (not mapNonEmpty!24974) (not b!842700) (not b!842708))
(check-sat b_and!22813 (not b_next!13717))
