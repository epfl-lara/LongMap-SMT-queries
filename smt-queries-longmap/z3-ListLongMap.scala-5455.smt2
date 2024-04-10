; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72516 () Bool)

(assert start!72516)

(declare-fun b_free!13701 () Bool)

(declare-fun b_next!13701 () Bool)

(assert (=> start!72516 (= b_free!13701 (not b_next!13701))))

(declare-fun tp!48202 () Bool)

(declare-fun b_and!22787 () Bool)

(assert (=> start!72516 (= tp!48202 b_and!22787)))

(declare-fun b!841481 () Bool)

(declare-fun res!572007 () Bool)

(declare-fun e!469424 () Bool)

(assert (=> b!841481 (=> (not res!572007) (not e!469424))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841481 (= res!572007 (validMask!0 mask!1196))))

(declare-fun b!841482 () Bool)

(declare-fun e!469425 () Bool)

(declare-fun tp_is_empty!15567 () Bool)

(assert (=> b!841482 (= e!469425 tp_is_empty!15567)))

(declare-fun b!841483 () Bool)

(assert (=> b!841483 (= e!469424 (not true))))

(declare-fun e!469426 () Bool)

(assert (=> b!841483 e!469426))

(declare-fun c!91411 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841483 (= c!91411 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28901 0))(
  ( (Unit!28902) )
))
(declare-fun lt!380917 () Unit!28901)

(declare-datatypes ((V!25803 0))(
  ( (V!25804 (val!7831 Int)) )
))
(declare-fun v!557 () V!25803)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47412 0))(
  ( (array!47413 (arr!22737 (Array (_ BitVec 32) (_ BitVec 64))) (size!23177 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47412)

(declare-datatypes ((ValueCell!7344 0))(
  ( (ValueCellFull!7344 (v!10256 V!25803)) (EmptyCell!7344) )
))
(declare-datatypes ((array!47414 0))(
  ( (array!47415 (arr!22738 (Array (_ BitVec 32) ValueCell!7344)) (size!23178 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47414)

(declare-fun minValue!654 () V!25803)

(declare-fun zeroValue!654 () V!25803)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!296 (array!47412 array!47414 (_ BitVec 32) (_ BitVec 32) V!25803 V!25803 (_ BitVec 32) (_ BitVec 64) V!25803 (_ BitVec 32) Int) Unit!28901)

(assert (=> b!841483 (= lt!380917 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!296 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841484 () Bool)

(declare-fun res!572009 () Bool)

(assert (=> b!841484 (=> (not res!572009) (not e!469424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841484 (= res!572009 (validKeyInArray!0 k0!854))))

(declare-fun b!841485 () Bool)

(declare-fun res!572002 () Bool)

(assert (=> b!841485 (=> (not res!572002) (not e!469424))))

(assert (=> b!841485 (= res!572002 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23177 _keys!868))))))

(declare-fun res!572008 () Bool)

(assert (=> start!72516 (=> (not res!572008) (not e!469424))))

(assert (=> start!72516 (= res!572008 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23177 _keys!868))))))

(assert (=> start!72516 e!469424))

(assert (=> start!72516 tp_is_empty!15567))

(assert (=> start!72516 true))

(assert (=> start!72516 tp!48202))

(declare-fun array_inv!18090 (array!47412) Bool)

(assert (=> start!72516 (array_inv!18090 _keys!868)))

(declare-fun e!469421 () Bool)

(declare-fun array_inv!18091 (array!47414) Bool)

(assert (=> start!72516 (and (array_inv!18091 _values!688) e!469421)))

(declare-fun mapIsEmpty!24950 () Bool)

(declare-fun mapRes!24950 () Bool)

(assert (=> mapIsEmpty!24950 mapRes!24950))

(declare-fun b!841486 () Bool)

(declare-fun e!469423 () Bool)

(assert (=> b!841486 (= e!469421 (and e!469423 mapRes!24950))))

(declare-fun condMapEmpty!24950 () Bool)

(declare-fun mapDefault!24950 () ValueCell!7344)

(assert (=> b!841486 (= condMapEmpty!24950 (= (arr!22738 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7344)) mapDefault!24950)))))

(declare-fun mapNonEmpty!24950 () Bool)

(declare-fun tp!48201 () Bool)

(assert (=> mapNonEmpty!24950 (= mapRes!24950 (and tp!48201 e!469425))))

(declare-fun mapRest!24950 () (Array (_ BitVec 32) ValueCell!7344))

(declare-fun mapValue!24950 () ValueCell!7344)

(declare-fun mapKey!24950 () (_ BitVec 32))

(assert (=> mapNonEmpty!24950 (= (arr!22738 _values!688) (store mapRest!24950 mapKey!24950 mapValue!24950))))

(declare-fun b!841487 () Bool)

(assert (=> b!841487 (= e!469423 tp_is_empty!15567)))

(declare-fun bm!37333 () Bool)

(declare-datatypes ((tuple2!10392 0))(
  ( (tuple2!10393 (_1!5207 (_ BitVec 64)) (_2!5207 V!25803)) )
))
(declare-datatypes ((List!16173 0))(
  ( (Nil!16170) (Cons!16169 (h!17300 tuple2!10392) (t!22544 List!16173)) )
))
(declare-datatypes ((ListLongMap!9161 0))(
  ( (ListLongMap!9162 (toList!4596 List!16173)) )
))
(declare-fun call!37337 () ListLongMap!9161)

(declare-fun getCurrentListMapNoExtraKeys!2582 (array!47412 array!47414 (_ BitVec 32) (_ BitVec 32) V!25803 V!25803 (_ BitVec 32) Int) ListLongMap!9161)

(assert (=> bm!37333 (= call!37337 (getCurrentListMapNoExtraKeys!2582 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841488 () Bool)

(declare-fun res!572006 () Bool)

(assert (=> b!841488 (=> (not res!572006) (not e!469424))))

(declare-datatypes ((List!16174 0))(
  ( (Nil!16171) (Cons!16170 (h!17301 (_ BitVec 64)) (t!22545 List!16174)) )
))
(declare-fun arrayNoDuplicates!0 (array!47412 (_ BitVec 32) List!16174) Bool)

(assert (=> b!841488 (= res!572006 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16171))))

(declare-fun b!841489 () Bool)

(declare-fun res!572003 () Bool)

(assert (=> b!841489 (=> (not res!572003) (not e!469424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47412 (_ BitVec 32)) Bool)

(assert (=> b!841489 (= res!572003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun call!37336 () ListLongMap!9161)

(declare-fun b!841490 () Bool)

(declare-fun +!2062 (ListLongMap!9161 tuple2!10392) ListLongMap!9161)

(assert (=> b!841490 (= e!469426 (= call!37336 (+!2062 call!37337 (tuple2!10393 k0!854 v!557))))))

(declare-fun bm!37334 () Bool)

(assert (=> bm!37334 (= call!37336 (getCurrentListMapNoExtraKeys!2582 _keys!868 (array!47415 (store (arr!22738 _values!688) i!612 (ValueCellFull!7344 v!557)) (size!23178 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841491 () Bool)

(declare-fun res!572004 () Bool)

(assert (=> b!841491 (=> (not res!572004) (not e!469424))))

(assert (=> b!841491 (= res!572004 (and (= (size!23178 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23177 _keys!868) (size!23178 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841492 () Bool)

(assert (=> b!841492 (= e!469426 (= call!37336 call!37337))))

(declare-fun b!841493 () Bool)

(declare-fun res!572005 () Bool)

(assert (=> b!841493 (=> (not res!572005) (not e!469424))))

(assert (=> b!841493 (= res!572005 (and (= (select (arr!22737 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23177 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72516 res!572008) b!841481))

(assert (= (and b!841481 res!572007) b!841491))

(assert (= (and b!841491 res!572004) b!841489))

(assert (= (and b!841489 res!572003) b!841488))

(assert (= (and b!841488 res!572006) b!841485))

(assert (= (and b!841485 res!572002) b!841484))

(assert (= (and b!841484 res!572009) b!841493))

(assert (= (and b!841493 res!572005) b!841483))

(assert (= (and b!841483 c!91411) b!841490))

(assert (= (and b!841483 (not c!91411)) b!841492))

(assert (= (or b!841490 b!841492) bm!37334))

(assert (= (or b!841490 b!841492) bm!37333))

(assert (= (and b!841486 condMapEmpty!24950) mapIsEmpty!24950))

(assert (= (and b!841486 (not condMapEmpty!24950)) mapNonEmpty!24950))

(get-info :version)

(assert (= (and mapNonEmpty!24950 ((_ is ValueCellFull!7344) mapValue!24950)) b!841482))

(assert (= (and b!841486 ((_ is ValueCellFull!7344) mapDefault!24950)) b!841487))

(assert (= start!72516 b!841486))

(declare-fun m!784907 () Bool)

(assert (=> b!841493 m!784907))

(declare-fun m!784909 () Bool)

(assert (=> b!841489 m!784909))

(declare-fun m!784911 () Bool)

(assert (=> b!841483 m!784911))

(declare-fun m!784913 () Bool)

(assert (=> mapNonEmpty!24950 m!784913))

(declare-fun m!784915 () Bool)

(assert (=> b!841488 m!784915))

(declare-fun m!784917 () Bool)

(assert (=> b!841481 m!784917))

(declare-fun m!784919 () Bool)

(assert (=> bm!37334 m!784919))

(declare-fun m!784921 () Bool)

(assert (=> bm!37334 m!784921))

(declare-fun m!784923 () Bool)

(assert (=> b!841490 m!784923))

(declare-fun m!784925 () Bool)

(assert (=> bm!37333 m!784925))

(declare-fun m!784927 () Bool)

(assert (=> b!841484 m!784927))

(declare-fun m!784929 () Bool)

(assert (=> start!72516 m!784929))

(declare-fun m!784931 () Bool)

(assert (=> start!72516 m!784931))

(check-sat (not b!841483) (not bm!37334) tp_is_empty!15567 (not mapNonEmpty!24950) (not b!841490) (not b!841484) (not bm!37333) b_and!22787 (not b!841481) (not b_next!13701) (not b!841489) (not start!72516) (not b!841488))
(check-sat b_and!22787 (not b_next!13701))
