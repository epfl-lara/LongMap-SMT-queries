; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72526 () Bool)

(assert start!72526)

(declare-fun b_free!13729 () Bool)

(declare-fun b_next!13729 () Bool)

(assert (=> start!72526 (= b_free!13729 (not b_next!13729))))

(declare-fun tp!48287 () Bool)

(declare-fun b_and!22789 () Bool)

(assert (=> start!72526 (= tp!48287 b_and!22789)))

(declare-fun b!841788 () Bool)

(declare-fun res!572228 () Bool)

(declare-fun e!469528 () Bool)

(assert (=> b!841788 (=> (not res!572228) (not e!469528))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47443 0))(
  ( (array!47444 (arr!22753 (Array (_ BitVec 32) (_ BitVec 64))) (size!23195 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47443)

(declare-datatypes ((V!25841 0))(
  ( (V!25842 (val!7845 Int)) )
))
(declare-datatypes ((ValueCell!7358 0))(
  ( (ValueCellFull!7358 (v!10264 V!25841)) (EmptyCell!7358) )
))
(declare-datatypes ((array!47445 0))(
  ( (array!47446 (arr!22754 (Array (_ BitVec 32) ValueCell!7358)) (size!23196 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47445)

(assert (=> b!841788 (= res!572228 (and (= (size!23196 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23195 _keys!868) (size!23196 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841789 () Bool)

(declare-fun res!572232 () Bool)

(assert (=> b!841789 (=> (not res!572232) (not e!469528))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841789 (= res!572232 (and (= (select (arr!22753 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23195 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841791 () Bool)

(declare-fun e!469530 () Bool)

(declare-fun tp_is_empty!15595 () Bool)

(assert (=> b!841791 (= e!469530 tp_is_empty!15595)))

(declare-datatypes ((tuple2!10436 0))(
  ( (tuple2!10437 (_1!5229 (_ BitVec 64)) (_2!5229 V!25841)) )
))
(declare-datatypes ((List!16205 0))(
  ( (Nil!16202) (Cons!16201 (h!17332 tuple2!10436) (t!22567 List!16205)) )
))
(declare-datatypes ((ListLongMap!9195 0))(
  ( (ListLongMap!9196 (toList!4613 List!16205)) )
))
(declare-fun call!37394 () ListLongMap!9195)

(declare-fun e!469526 () Bool)

(declare-fun b!841792 () Bool)

(declare-fun call!37395 () ListLongMap!9195)

(declare-fun v!557 () V!25841)

(declare-fun +!2092 (ListLongMap!9195 tuple2!10436) ListLongMap!9195)

(assert (=> b!841792 (= e!469526 (= call!37395 (+!2092 call!37394 (tuple2!10437 k0!854 v!557))))))

(declare-fun b!841793 () Bool)

(declare-fun e!469527 () Bool)

(assert (=> b!841793 (= e!469527 tp_is_empty!15595)))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37391 () Bool)

(declare-fun minValue!654 () V!25841)

(declare-fun zeroValue!654 () V!25841)

(declare-fun getCurrentListMapNoExtraKeys!2628 (array!47443 array!47445 (_ BitVec 32) (_ BitVec 32) V!25841 V!25841 (_ BitVec 32) Int) ListLongMap!9195)

(assert (=> bm!37391 (= call!37395 (getCurrentListMapNoExtraKeys!2628 _keys!868 (array!47446 (store (arr!22754 _values!688) i!612 (ValueCellFull!7358 v!557)) (size!23196 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841794 () Bool)

(declare-fun res!572234 () Bool)

(assert (=> b!841794 (=> (not res!572234) (not e!469528))))

(assert (=> b!841794 (= res!572234 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23195 _keys!868))))))

(declare-fun b!841795 () Bool)

(assert (=> b!841795 (= e!469528 (not true))))

(assert (=> b!841795 e!469526))

(declare-fun c!91388 () Bool)

(assert (=> b!841795 (= c!91388 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28869 0))(
  ( (Unit!28870) )
))
(declare-fun lt!380723 () Unit!28869)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!309 (array!47443 array!47445 (_ BitVec 32) (_ BitVec 32) V!25841 V!25841 (_ BitVec 32) (_ BitVec 64) V!25841 (_ BitVec 32) Int) Unit!28869)

(assert (=> b!841795 (= lt!380723 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!309 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841796 () Bool)

(declare-fun e!469525 () Bool)

(declare-fun mapRes!24992 () Bool)

(assert (=> b!841796 (= e!469525 (and e!469527 mapRes!24992))))

(declare-fun condMapEmpty!24992 () Bool)

(declare-fun mapDefault!24992 () ValueCell!7358)

(assert (=> b!841796 (= condMapEmpty!24992 (= (arr!22754 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7358)) mapDefault!24992)))))

(declare-fun mapNonEmpty!24992 () Bool)

(declare-fun tp!48286 () Bool)

(assert (=> mapNonEmpty!24992 (= mapRes!24992 (and tp!48286 e!469530))))

(declare-fun mapValue!24992 () ValueCell!7358)

(declare-fun mapRest!24992 () (Array (_ BitVec 32) ValueCell!7358))

(declare-fun mapKey!24992 () (_ BitVec 32))

(assert (=> mapNonEmpty!24992 (= (arr!22754 _values!688) (store mapRest!24992 mapKey!24992 mapValue!24992))))

(declare-fun res!572229 () Bool)

(assert (=> start!72526 (=> (not res!572229) (not e!469528))))

(assert (=> start!72526 (= res!572229 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23195 _keys!868))))))

(assert (=> start!72526 e!469528))

(assert (=> start!72526 tp_is_empty!15595))

(assert (=> start!72526 true))

(assert (=> start!72526 tp!48287))

(declare-fun array_inv!18180 (array!47443) Bool)

(assert (=> start!72526 (array_inv!18180 _keys!868)))

(declare-fun array_inv!18181 (array!47445) Bool)

(assert (=> start!72526 (and (array_inv!18181 _values!688) e!469525)))

(declare-fun b!841790 () Bool)

(declare-fun res!572231 () Bool)

(assert (=> b!841790 (=> (not res!572231) (not e!469528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841790 (= res!572231 (validMask!0 mask!1196))))

(declare-fun bm!37392 () Bool)

(assert (=> bm!37392 (= call!37394 (getCurrentListMapNoExtraKeys!2628 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24992 () Bool)

(assert (=> mapIsEmpty!24992 mapRes!24992))

(declare-fun b!841797 () Bool)

(declare-fun res!572235 () Bool)

(assert (=> b!841797 (=> (not res!572235) (not e!469528))))

(declare-datatypes ((List!16206 0))(
  ( (Nil!16203) (Cons!16202 (h!17333 (_ BitVec 64)) (t!22568 List!16206)) )
))
(declare-fun arrayNoDuplicates!0 (array!47443 (_ BitVec 32) List!16206) Bool)

(assert (=> b!841797 (= res!572235 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16203))))

(declare-fun b!841798 () Bool)

(declare-fun res!572230 () Bool)

(assert (=> b!841798 (=> (not res!572230) (not e!469528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47443 (_ BitVec 32)) Bool)

(assert (=> b!841798 (= res!572230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841799 () Bool)

(assert (=> b!841799 (= e!469526 (= call!37395 call!37394))))

(declare-fun b!841800 () Bool)

(declare-fun res!572233 () Bool)

(assert (=> b!841800 (=> (not res!572233) (not e!469528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841800 (= res!572233 (validKeyInArray!0 k0!854))))

(assert (= (and start!72526 res!572229) b!841790))

(assert (= (and b!841790 res!572231) b!841788))

(assert (= (and b!841788 res!572228) b!841798))

(assert (= (and b!841798 res!572230) b!841797))

(assert (= (and b!841797 res!572235) b!841794))

(assert (= (and b!841794 res!572234) b!841800))

(assert (= (and b!841800 res!572233) b!841789))

(assert (= (and b!841789 res!572232) b!841795))

(assert (= (and b!841795 c!91388) b!841792))

(assert (= (and b!841795 (not c!91388)) b!841799))

(assert (= (or b!841792 b!841799) bm!37391))

(assert (= (or b!841792 b!841799) bm!37392))

(assert (= (and b!841796 condMapEmpty!24992) mapIsEmpty!24992))

(assert (= (and b!841796 (not condMapEmpty!24992)) mapNonEmpty!24992))

(get-info :version)

(assert (= (and mapNonEmpty!24992 ((_ is ValueCellFull!7358) mapValue!24992)) b!841791))

(assert (= (and b!841796 ((_ is ValueCellFull!7358) mapDefault!24992)) b!841793))

(assert (= start!72526 b!841796))

(declare-fun m!784517 () Bool)

(assert (=> b!841790 m!784517))

(declare-fun m!784519 () Bool)

(assert (=> b!841795 m!784519))

(declare-fun m!784521 () Bool)

(assert (=> b!841800 m!784521))

(declare-fun m!784523 () Bool)

(assert (=> b!841789 m!784523))

(declare-fun m!784525 () Bool)

(assert (=> bm!37392 m!784525))

(declare-fun m!784527 () Bool)

(assert (=> mapNonEmpty!24992 m!784527))

(declare-fun m!784529 () Bool)

(assert (=> b!841792 m!784529))

(declare-fun m!784531 () Bool)

(assert (=> start!72526 m!784531))

(declare-fun m!784533 () Bool)

(assert (=> start!72526 m!784533))

(declare-fun m!784535 () Bool)

(assert (=> b!841797 m!784535))

(declare-fun m!784537 () Bool)

(assert (=> b!841798 m!784537))

(declare-fun m!784539 () Bool)

(assert (=> bm!37391 m!784539))

(declare-fun m!784541 () Bool)

(assert (=> bm!37391 m!784541))

(check-sat (not bm!37392) (not mapNonEmpty!24992) (not b_next!13729) (not b!841795) (not b!841800) (not b!841792) b_and!22789 (not b!841798) (not b!841797) tp_is_empty!15595 (not start!72526) (not b!841790) (not bm!37391))
(check-sat b_and!22789 (not b_next!13729))
