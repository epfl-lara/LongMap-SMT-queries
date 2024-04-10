; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72418 () Bool)

(assert start!72418)

(declare-fun b_free!13603 () Bool)

(declare-fun b_next!13603 () Bool)

(assert (=> start!72418 (= b_free!13603 (not b_next!13603))))

(declare-fun tp!47908 () Bool)

(declare-fun b_and!22689 () Bool)

(assert (=> start!72418 (= tp!47908 b_and!22689)))

(declare-fun b!839570 () Bool)

(declare-fun e!468539 () Bool)

(assert (=> b!839570 (= e!468539 (not true))))

(declare-fun e!468542 () Bool)

(assert (=> b!839570 e!468542))

(declare-fun c!91264 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839570 (= c!91264 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25673 0))(
  ( (V!25674 (val!7782 Int)) )
))
(declare-fun v!557 () V!25673)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47220 0))(
  ( (array!47221 (arr!22641 (Array (_ BitVec 32) (_ BitVec 64))) (size!23081 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47220)

(declare-fun minValue!654 () V!25673)

(declare-fun zeroValue!654 () V!25673)

(declare-datatypes ((ValueCell!7295 0))(
  ( (ValueCellFull!7295 (v!10207 V!25673)) (EmptyCell!7295) )
))
(declare-datatypes ((array!47222 0))(
  ( (array!47223 (arr!22642 (Array (_ BitVec 32) ValueCell!7295)) (size!23082 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47222)

(declare-datatypes ((Unit!28833 0))(
  ( (Unit!28834) )
))
(declare-fun lt!380770 () Unit!28833)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!262 (array!47220 array!47222 (_ BitVec 32) (_ BitVec 32) V!25673 V!25673 (_ BitVec 32) (_ BitVec 64) V!25673 (_ BitVec 32) Int) Unit!28833)

(assert (=> b!839570 (= lt!380770 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839571 () Bool)

(declare-fun res!570831 () Bool)

(assert (=> b!839571 (=> (not res!570831) (not e!468539))))

(assert (=> b!839571 (= res!570831 (and (= (select (arr!22641 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23081 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839572 () Bool)

(declare-fun e!468544 () Bool)

(declare-fun tp_is_empty!15469 () Bool)

(assert (=> b!839572 (= e!468544 tp_is_empty!15469)))

(declare-fun res!570832 () Bool)

(assert (=> start!72418 (=> (not res!570832) (not e!468539))))

(assert (=> start!72418 (= res!570832 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23081 _keys!868))))))

(assert (=> start!72418 e!468539))

(assert (=> start!72418 tp_is_empty!15469))

(assert (=> start!72418 true))

(assert (=> start!72418 tp!47908))

(declare-fun array_inv!18034 (array!47220) Bool)

(assert (=> start!72418 (array_inv!18034 _keys!868)))

(declare-fun e!468543 () Bool)

(declare-fun array_inv!18035 (array!47222) Bool)

(assert (=> start!72418 (and (array_inv!18035 _values!688) e!468543)))

(declare-fun b!839573 () Bool)

(declare-fun res!570833 () Bool)

(assert (=> b!839573 (=> (not res!570833) (not e!468539))))

(assert (=> b!839573 (= res!570833 (and (= (size!23082 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23081 _keys!868) (size!23082 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839574 () Bool)

(declare-fun res!570829 () Bool)

(assert (=> b!839574 (=> (not res!570829) (not e!468539))))

(declare-datatypes ((List!16102 0))(
  ( (Nil!16099) (Cons!16098 (h!17229 (_ BitVec 64)) (t!22473 List!16102)) )
))
(declare-fun arrayNoDuplicates!0 (array!47220 (_ BitVec 32) List!16102) Bool)

(assert (=> b!839574 (= res!570829 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16099))))

(declare-fun mapNonEmpty!24803 () Bool)

(declare-fun mapRes!24803 () Bool)

(declare-fun tp!47907 () Bool)

(declare-fun e!468540 () Bool)

(assert (=> mapNonEmpty!24803 (= mapRes!24803 (and tp!47907 e!468540))))

(declare-fun mapKey!24803 () (_ BitVec 32))

(declare-fun mapRest!24803 () (Array (_ BitVec 32) ValueCell!7295))

(declare-fun mapValue!24803 () ValueCell!7295)

(assert (=> mapNonEmpty!24803 (= (arr!22642 _values!688) (store mapRest!24803 mapKey!24803 mapValue!24803))))

(declare-fun b!839575 () Bool)

(declare-fun res!570828 () Bool)

(assert (=> b!839575 (=> (not res!570828) (not e!468539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839575 (= res!570828 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!24803 () Bool)

(assert (=> mapIsEmpty!24803 mapRes!24803))

(declare-datatypes ((tuple2!10304 0))(
  ( (tuple2!10305 (_1!5163 (_ BitVec 64)) (_2!5163 V!25673)) )
))
(declare-datatypes ((List!16103 0))(
  ( (Nil!16100) (Cons!16099 (h!17230 tuple2!10304) (t!22474 List!16103)) )
))
(declare-datatypes ((ListLongMap!9073 0))(
  ( (ListLongMap!9074 (toList!4552 List!16103)) )
))
(declare-fun call!37042 () ListLongMap!9073)

(declare-fun bm!37039 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2542 (array!47220 array!47222 (_ BitVec 32) (_ BitVec 32) V!25673 V!25673 (_ BitVec 32) Int) ListLongMap!9073)

(assert (=> bm!37039 (= call!37042 (getCurrentListMapNoExtraKeys!2542 _keys!868 (array!47223 (store (arr!22642 _values!688) i!612 (ValueCellFull!7295 v!557)) (size!23082 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839576 () Bool)

(declare-fun res!570827 () Bool)

(assert (=> b!839576 (=> (not res!570827) (not e!468539))))

(assert (=> b!839576 (= res!570827 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23081 _keys!868))))))

(declare-fun b!839577 () Bool)

(declare-fun call!37043 () ListLongMap!9073)

(assert (=> b!839577 (= e!468542 (= call!37042 call!37043))))

(declare-fun b!839578 () Bool)

(declare-fun res!570830 () Bool)

(assert (=> b!839578 (=> (not res!570830) (not e!468539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47220 (_ BitVec 32)) Bool)

(assert (=> b!839578 (= res!570830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839579 () Bool)

(assert (=> b!839579 (= e!468540 tp_is_empty!15469)))

(declare-fun bm!37040 () Bool)

(assert (=> bm!37040 (= call!37043 (getCurrentListMapNoExtraKeys!2542 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839580 () Bool)

(declare-fun +!2023 (ListLongMap!9073 tuple2!10304) ListLongMap!9073)

(assert (=> b!839580 (= e!468542 (= call!37042 (+!2023 call!37043 (tuple2!10305 k!854 v!557))))))

(declare-fun b!839581 () Bool)

(declare-fun res!570826 () Bool)

(assert (=> b!839581 (=> (not res!570826) (not e!468539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839581 (= res!570826 (validMask!0 mask!1196))))

(declare-fun b!839582 () Bool)

(assert (=> b!839582 (= e!468543 (and e!468544 mapRes!24803))))

(declare-fun condMapEmpty!24803 () Bool)

(declare-fun mapDefault!24803 () ValueCell!7295)

