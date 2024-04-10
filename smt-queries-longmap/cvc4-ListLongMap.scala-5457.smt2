; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72530 () Bool)

(assert start!72530)

(declare-fun b_free!13715 () Bool)

(declare-fun b_next!13715 () Bool)

(assert (=> start!72530 (= b_free!13715 (not b_next!13715))))

(declare-fun tp!48243 () Bool)

(declare-fun b_and!22801 () Bool)

(assert (=> start!72530 (= tp!48243 b_and!22801)))

(declare-fun b!841754 () Bool)

(declare-fun res!572176 () Bool)

(declare-fun e!469547 () Bool)

(assert (=> b!841754 (=> (not res!572176) (not e!469547))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841754 (= res!572176 (validMask!0 mask!1196))))

(declare-fun b!841756 () Bool)

(declare-fun e!469552 () Bool)

(declare-fun tp_is_empty!15581 () Bool)

(assert (=> b!841756 (= e!469552 tp_is_empty!15581)))

(declare-fun b!841757 () Bool)

(declare-fun res!572170 () Bool)

(assert (=> b!841757 (=> (not res!572170) (not e!469547))))

(declare-datatypes ((array!47438 0))(
  ( (array!47439 (arr!22750 (Array (_ BitVec 32) (_ BitVec 64))) (size!23190 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47438)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47438 (_ BitVec 32)) Bool)

(assert (=> b!841757 (= res!572170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24971 () Bool)

(declare-fun mapRes!24971 () Bool)

(declare-fun tp!48244 () Bool)

(declare-fun e!469550 () Bool)

(assert (=> mapNonEmpty!24971 (= mapRes!24971 (and tp!48244 e!469550))))

(declare-datatypes ((V!25821 0))(
  ( (V!25822 (val!7838 Int)) )
))
(declare-datatypes ((ValueCell!7351 0))(
  ( (ValueCellFull!7351 (v!10263 V!25821)) (EmptyCell!7351) )
))
(declare-fun mapValue!24971 () ValueCell!7351)

(declare-fun mapKey!24971 () (_ BitVec 32))

(declare-fun mapRest!24971 () (Array (_ BitVec 32) ValueCell!7351))

(declare-datatypes ((array!47440 0))(
  ( (array!47441 (arr!22751 (Array (_ BitVec 32) ValueCell!7351)) (size!23191 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47440)

(assert (=> mapNonEmpty!24971 (= (arr!22751 _values!688) (store mapRest!24971 mapKey!24971 mapValue!24971))))

(declare-fun b!841758 () Bool)

(declare-fun res!572177 () Bool)

(assert (=> b!841758 (=> (not res!572177) (not e!469547))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841758 (= res!572177 (validKeyInArray!0 k!854))))

(declare-fun b!841759 () Bool)

(declare-fun e!469549 () Bool)

(declare-datatypes ((tuple2!10404 0))(
  ( (tuple2!10405 (_1!5213 (_ BitVec 64)) (_2!5213 V!25821)) )
))
(declare-datatypes ((List!16183 0))(
  ( (Nil!16180) (Cons!16179 (h!17310 tuple2!10404) (t!22554 List!16183)) )
))
(declare-datatypes ((ListLongMap!9173 0))(
  ( (ListLongMap!9174 (toList!4602 List!16183)) )
))
(declare-fun call!37379 () ListLongMap!9173)

(declare-fun call!37378 () ListLongMap!9173)

(assert (=> b!841759 (= e!469549 (= call!37379 call!37378))))

(declare-fun b!841760 () Bool)

(declare-fun res!572171 () Bool)

(assert (=> b!841760 (=> (not res!572171) (not e!469547))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841760 (= res!572171 (and (= (select (arr!22750 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23190 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841761 () Bool)

(declare-fun res!572175 () Bool)

(assert (=> b!841761 (=> (not res!572175) (not e!469547))))

(assert (=> b!841761 (= res!572175 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23190 _keys!868))))))

(declare-fun bm!37375 () Bool)

(declare-fun v!557 () V!25821)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25821)

(declare-fun zeroValue!654 () V!25821)

(declare-fun getCurrentListMapNoExtraKeys!2587 (array!47438 array!47440 (_ BitVec 32) (_ BitVec 32) V!25821 V!25821 (_ BitVec 32) Int) ListLongMap!9173)

(assert (=> bm!37375 (= call!37379 (getCurrentListMapNoExtraKeys!2587 _keys!868 (array!47441 (store (arr!22751 _values!688) i!612 (ValueCellFull!7351 v!557)) (size!23191 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37376 () Bool)

(assert (=> bm!37376 (= call!37378 (getCurrentListMapNoExtraKeys!2587 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841762 () Bool)

(declare-fun +!2066 (ListLongMap!9173 tuple2!10404) ListLongMap!9173)

(assert (=> b!841762 (= e!469549 (= call!37379 (+!2066 call!37378 (tuple2!10405 k!854 v!557))))))

(declare-fun b!841763 () Bool)

(assert (=> b!841763 (= e!469547 (not true))))

(assert (=> b!841763 e!469549))

(declare-fun c!91432 () Bool)

(assert (=> b!841763 (= c!91432 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28909 0))(
  ( (Unit!28910) )
))
(declare-fun lt!380938 () Unit!28909)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!300 (array!47438 array!47440 (_ BitVec 32) (_ BitVec 32) V!25821 V!25821 (_ BitVec 32) (_ BitVec 64) V!25821 (_ BitVec 32) Int) Unit!28909)

(assert (=> b!841763 (= lt!380938 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!300 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841755 () Bool)

(declare-fun res!572173 () Bool)

(assert (=> b!841755 (=> (not res!572173) (not e!469547))))

(declare-datatypes ((List!16184 0))(
  ( (Nil!16181) (Cons!16180 (h!17311 (_ BitVec 64)) (t!22555 List!16184)) )
))
(declare-fun arrayNoDuplicates!0 (array!47438 (_ BitVec 32) List!16184) Bool)

(assert (=> b!841755 (= res!572173 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16181))))

(declare-fun res!572174 () Bool)

(assert (=> start!72530 (=> (not res!572174) (not e!469547))))

(assert (=> start!72530 (= res!572174 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23190 _keys!868))))))

(assert (=> start!72530 e!469547))

(assert (=> start!72530 tp_is_empty!15581))

(assert (=> start!72530 true))

(assert (=> start!72530 tp!48243))

(declare-fun array_inv!18102 (array!47438) Bool)

(assert (=> start!72530 (array_inv!18102 _keys!868)))

(declare-fun e!469551 () Bool)

(declare-fun array_inv!18103 (array!47440) Bool)

(assert (=> start!72530 (and (array_inv!18103 _values!688) e!469551)))

(declare-fun b!841764 () Bool)

(declare-fun res!572172 () Bool)

(assert (=> b!841764 (=> (not res!572172) (not e!469547))))

(assert (=> b!841764 (= res!572172 (and (= (size!23191 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23190 _keys!868) (size!23191 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24971 () Bool)

(assert (=> mapIsEmpty!24971 mapRes!24971))

(declare-fun b!841765 () Bool)

(assert (=> b!841765 (= e!469551 (and e!469552 mapRes!24971))))

(declare-fun condMapEmpty!24971 () Bool)

(declare-fun mapDefault!24971 () ValueCell!7351)

