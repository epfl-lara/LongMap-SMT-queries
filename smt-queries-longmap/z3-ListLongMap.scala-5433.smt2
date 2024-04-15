; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72364 () Bool)

(assert start!72364)

(declare-fun b_free!13567 () Bool)

(declare-fun b_next!13567 () Bool)

(assert (=> start!72364 (= b_free!13567 (not b_next!13567))))

(declare-fun tp!47800 () Bool)

(declare-fun b_and!22627 () Bool)

(assert (=> start!72364 (= tp!47800 b_and!22627)))

(declare-fun mapNonEmpty!24749 () Bool)

(declare-fun mapRes!24749 () Bool)

(declare-fun tp!47801 () Bool)

(declare-fun e!468070 () Bool)

(assert (=> mapNonEmpty!24749 (= mapRes!24749 (and tp!47801 e!468070))))

(declare-datatypes ((V!25625 0))(
  ( (V!25626 (val!7764 Int)) )
))
(declare-datatypes ((ValueCell!7277 0))(
  ( (ValueCellFull!7277 (v!10183 V!25625)) (EmptyCell!7277) )
))
(declare-fun mapValue!24749 () ValueCell!7277)

(declare-fun mapRest!24749 () (Array (_ BitVec 32) ValueCell!7277))

(declare-fun mapKey!24749 () (_ BitVec 32))

(declare-datatypes ((array!47127 0))(
  ( (array!47128 (arr!22595 (Array (_ BitVec 32) ValueCell!7277)) (size!23037 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47127)

(assert (=> mapNonEmpty!24749 (= (arr!22595 _values!688) (store mapRest!24749 mapKey!24749 mapValue!24749))))

(declare-fun b!838630 () Bool)

(declare-fun e!468068 () Bool)

(assert (=> b!838630 (= e!468068 (not true))))

(declare-fun e!468072 () Bool)

(assert (=> b!838630 e!468072))

(declare-fun c!91145 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838630 (= c!91145 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28753 0))(
  ( (Unit!28754) )
))
(declare-fun lt!380480 () Unit!28753)

(declare-fun v!557 () V!25625)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47129 0))(
  ( (array!47130 (arr!22596 (Array (_ BitVec 32) (_ BitVec 64))) (size!23038 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47129)

(declare-fun minValue!654 () V!25625)

(declare-fun zeroValue!654 () V!25625)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!251 (array!47129 array!47127 (_ BitVec 32) (_ BitVec 32) V!25625 V!25625 (_ BitVec 32) (_ BitVec 64) V!25625 (_ BitVec 32) Int) Unit!28753)

(assert (=> b!838630 (= lt!380480 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!251 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838631 () Bool)

(declare-fun res!570285 () Bool)

(assert (=> b!838631 (=> (not res!570285) (not e!468068))))

(assert (=> b!838631 (= res!570285 (and (= (size!23037 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23038 _keys!868) (size!23037 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!36905 () Bool)

(declare-datatypes ((tuple2!10286 0))(
  ( (tuple2!10287 (_1!5154 (_ BitVec 64)) (_2!5154 V!25625)) )
))
(declare-datatypes ((List!16078 0))(
  ( (Nil!16075) (Cons!16074 (h!17205 tuple2!10286) (t!22440 List!16078)) )
))
(declare-datatypes ((ListLongMap!9045 0))(
  ( (ListLongMap!9046 (toList!4538 List!16078)) )
))
(declare-fun call!36909 () ListLongMap!9045)

(declare-fun getCurrentListMapNoExtraKeys!2558 (array!47129 array!47127 (_ BitVec 32) (_ BitVec 32) V!25625 V!25625 (_ BitVec 32) Int) ListLongMap!9045)

(assert (=> bm!36905 (= call!36909 (getCurrentListMapNoExtraKeys!2558 _keys!868 (array!47128 (store (arr!22595 _values!688) i!612 (ValueCellFull!7277 v!557)) (size!23037 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!36908 () ListLongMap!9045)

(declare-fun bm!36906 () Bool)

(assert (=> bm!36906 (= call!36908 (getCurrentListMapNoExtraKeys!2558 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838632 () Bool)

(declare-fun res!570284 () Bool)

(assert (=> b!838632 (=> (not res!570284) (not e!468068))))

(assert (=> b!838632 (= res!570284 (and (= (select (arr!22596 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23038 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838633 () Bool)

(declare-fun e!468067 () Bool)

(declare-fun e!468069 () Bool)

(assert (=> b!838633 (= e!468067 (and e!468069 mapRes!24749))))

(declare-fun condMapEmpty!24749 () Bool)

(declare-fun mapDefault!24749 () ValueCell!7277)

(assert (=> b!838633 (= condMapEmpty!24749 (= (arr!22595 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7277)) mapDefault!24749)))))

(declare-fun b!838634 () Bool)

(declare-fun res!570290 () Bool)

(assert (=> b!838634 (=> (not res!570290) (not e!468068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838634 (= res!570290 (validMask!0 mask!1196))))

(declare-fun b!838635 () Bool)

(declare-fun res!570288 () Bool)

(assert (=> b!838635 (=> (not res!570288) (not e!468068))))

(declare-datatypes ((List!16079 0))(
  ( (Nil!16076) (Cons!16075 (h!17206 (_ BitVec 64)) (t!22441 List!16079)) )
))
(declare-fun arrayNoDuplicates!0 (array!47129 (_ BitVec 32) List!16079) Bool)

(assert (=> b!838635 (= res!570288 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16076))))

(declare-fun mapIsEmpty!24749 () Bool)

(assert (=> mapIsEmpty!24749 mapRes!24749))

(declare-fun res!570289 () Bool)

(assert (=> start!72364 (=> (not res!570289) (not e!468068))))

(assert (=> start!72364 (= res!570289 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23038 _keys!868))))))

(assert (=> start!72364 e!468068))

(declare-fun tp_is_empty!15433 () Bool)

(assert (=> start!72364 tp_is_empty!15433))

(assert (=> start!72364 true))

(assert (=> start!72364 tp!47800))

(declare-fun array_inv!18068 (array!47129) Bool)

(assert (=> start!72364 (array_inv!18068 _keys!868)))

(declare-fun array_inv!18069 (array!47127) Bool)

(assert (=> start!72364 (and (array_inv!18069 _values!688) e!468067)))

(declare-fun b!838629 () Bool)

(declare-fun res!570291 () Bool)

(assert (=> b!838629 (=> (not res!570291) (not e!468068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47129 (_ BitVec 32)) Bool)

(assert (=> b!838629 (= res!570291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838636 () Bool)

(declare-fun +!2036 (ListLongMap!9045 tuple2!10286) ListLongMap!9045)

(assert (=> b!838636 (= e!468072 (= call!36909 (+!2036 call!36908 (tuple2!10287 k0!854 v!557))))))

(declare-fun b!838637 () Bool)

(assert (=> b!838637 (= e!468070 tp_is_empty!15433)))

(declare-fun b!838638 () Bool)

(assert (=> b!838638 (= e!468072 (= call!36909 call!36908))))

(declare-fun b!838639 () Bool)

(declare-fun res!570286 () Bool)

(assert (=> b!838639 (=> (not res!570286) (not e!468068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838639 (= res!570286 (validKeyInArray!0 k0!854))))

(declare-fun b!838640 () Bool)

(assert (=> b!838640 (= e!468069 tp_is_empty!15433)))

(declare-fun b!838641 () Bool)

(declare-fun res!570287 () Bool)

(assert (=> b!838641 (=> (not res!570287) (not e!468068))))

(assert (=> b!838641 (= res!570287 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23038 _keys!868))))))

(assert (= (and start!72364 res!570289) b!838634))

(assert (= (and b!838634 res!570290) b!838631))

(assert (= (and b!838631 res!570285) b!838629))

(assert (= (and b!838629 res!570291) b!838635))

(assert (= (and b!838635 res!570288) b!838641))

(assert (= (and b!838641 res!570287) b!838639))

(assert (= (and b!838639 res!570286) b!838632))

(assert (= (and b!838632 res!570284) b!838630))

(assert (= (and b!838630 c!91145) b!838636))

(assert (= (and b!838630 (not c!91145)) b!838638))

(assert (= (or b!838636 b!838638) bm!36905))

(assert (= (or b!838636 b!838638) bm!36906))

(assert (= (and b!838633 condMapEmpty!24749) mapIsEmpty!24749))

(assert (= (and b!838633 (not condMapEmpty!24749)) mapNonEmpty!24749))

(get-info :version)

(assert (= (and mapNonEmpty!24749 ((_ is ValueCellFull!7277) mapValue!24749)) b!838637))

(assert (= (and b!838633 ((_ is ValueCellFull!7277) mapDefault!24749)) b!838640))

(assert (= start!72364 b!838633))

(declare-fun m!782411 () Bool)

(assert (=> bm!36906 m!782411))

(declare-fun m!782413 () Bool)

(assert (=> b!838639 m!782413))

(declare-fun m!782415 () Bool)

(assert (=> b!838634 m!782415))

(declare-fun m!782417 () Bool)

(assert (=> b!838636 m!782417))

(declare-fun m!782419 () Bool)

(assert (=> mapNonEmpty!24749 m!782419))

(declare-fun m!782421 () Bool)

(assert (=> b!838632 m!782421))

(declare-fun m!782423 () Bool)

(assert (=> b!838630 m!782423))

(declare-fun m!782425 () Bool)

(assert (=> b!838635 m!782425))

(declare-fun m!782427 () Bool)

(assert (=> start!72364 m!782427))

(declare-fun m!782429 () Bool)

(assert (=> start!72364 m!782429))

(declare-fun m!782431 () Bool)

(assert (=> b!838629 m!782431))

(declare-fun m!782433 () Bool)

(assert (=> bm!36905 m!782433))

(declare-fun m!782435 () Bool)

(assert (=> bm!36905 m!782435))

(check-sat (not b!838630) b_and!22627 (not b_next!13567) (not bm!36906) tp_is_empty!15433 (not start!72364) (not b!838634) (not bm!36905) (not mapNonEmpty!24749) (not b!838639) (not b!838636) (not b!838635) (not b!838629))
(check-sat b_and!22627 (not b_next!13567))
