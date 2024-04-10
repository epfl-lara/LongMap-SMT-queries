; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73222 () Bool)

(assert start!73222)

(declare-fun b_free!14137 () Bool)

(declare-fun b_next!14137 () Bool)

(assert (=> start!73222 (= b_free!14137 (not b_next!14137))))

(declare-fun tp!49915 () Bool)

(declare-fun b_and!23433 () Bool)

(assert (=> start!73222 (= tp!49915 b_and!23433)))

(declare-fun b!853374 () Bool)

(declare-fun e!475907 () Bool)

(declare-datatypes ((V!26745 0))(
  ( (V!26746 (val!8184 Int)) )
))
(declare-datatypes ((tuple2!10758 0))(
  ( (tuple2!10759 (_1!5390 (_ BitVec 64)) (_2!5390 V!26745)) )
))
(declare-datatypes ((List!16584 0))(
  ( (Nil!16581) (Cons!16580 (h!17711 tuple2!10758) (t!23167 List!16584)) )
))
(declare-datatypes ((ListLongMap!9527 0))(
  ( (ListLongMap!9528 (toList!4779 List!16584)) )
))
(declare-fun call!38267 () ListLongMap!9527)

(declare-fun call!38266 () ListLongMap!9527)

(assert (=> b!853374 (= e!475907 (= call!38267 call!38266))))

(declare-fun b!853375 () Bool)

(declare-fun res!579587 () Bool)

(declare-fun e!475910 () Bool)

(assert (=> b!853375 (=> (not res!579587) (not e!475910))))

(declare-datatypes ((array!48744 0))(
  ( (array!48745 (arr!23403 (Array (_ BitVec 32) (_ BitVec 64))) (size!23843 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48744)

(declare-datatypes ((List!16585 0))(
  ( (Nil!16582) (Cons!16581 (h!17712 (_ BitVec 64)) (t!23168 List!16585)) )
))
(declare-fun arrayNoDuplicates!0 (array!48744 (_ BitVec 32) List!16585) Bool)

(assert (=> b!853375 (= res!579587 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16582))))

(declare-fun b!853376 () Bool)

(declare-fun e!475909 () Bool)

(declare-fun e!475911 () Bool)

(assert (=> b!853376 (= e!475909 (not e!475911))))

(declare-fun res!579579 () Bool)

(assert (=> b!853376 (=> res!579579 e!475911)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853376 (= res!579579 (not (validKeyInArray!0 (select (arr!23403 _keys!868) from!1053))))))

(assert (=> b!853376 e!475907))

(declare-fun c!91876 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853376 (= c!91876 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29125 0))(
  ( (Unit!29126) )
))
(declare-fun lt!384694 () Unit!29125)

(declare-fun v!557 () V!26745)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7697 0))(
  ( (ValueCellFull!7697 (v!10609 V!26745)) (EmptyCell!7697) )
))
(declare-datatypes ((array!48746 0))(
  ( (array!48747 (arr!23404 (Array (_ BitVec 32) ValueCell!7697)) (size!23844 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48746)

(declare-fun minValue!654 () V!26745)

(declare-fun zeroValue!654 () V!26745)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!398 (array!48744 array!48746 (_ BitVec 32) (_ BitVec 32) V!26745 V!26745 (_ BitVec 32) (_ BitVec 64) V!26745 (_ BitVec 32) Int) Unit!29125)

(assert (=> b!853376 (= lt!384694 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!398 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853377 () Bool)

(declare-fun res!579581 () Bool)

(assert (=> b!853377 (=> (not res!579581) (not e!475910))))

(assert (=> b!853377 (= res!579581 (and (= (size!23844 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23843 _keys!868) (size!23844 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853378 () Bool)

(assert (=> b!853378 (= e!475911 true)))

(declare-fun lt!384698 () tuple2!10758)

(declare-fun lt!384702 () V!26745)

(declare-fun lt!384695 () ListLongMap!9527)

(declare-fun +!2171 (ListLongMap!9527 tuple2!10758) ListLongMap!9527)

(assert (=> b!853378 (= (+!2171 lt!384695 lt!384698) (+!2171 (+!2171 lt!384695 (tuple2!10759 k!854 lt!384702)) lt!384698))))

(declare-fun lt!384701 () V!26745)

(assert (=> b!853378 (= lt!384698 (tuple2!10759 k!854 lt!384701))))

(declare-fun lt!384697 () Unit!29125)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!298 (ListLongMap!9527 (_ BitVec 64) V!26745 V!26745) Unit!29125)

(assert (=> b!853378 (= lt!384697 (addSameAsAddTwiceSameKeyDiffValues!298 lt!384695 k!854 lt!384702 lt!384701))))

(declare-fun lt!384700 () V!26745)

(declare-fun get!12342 (ValueCell!7697 V!26745) V!26745)

(assert (=> b!853378 (= lt!384702 (get!12342 (select (arr!23404 _values!688) from!1053) lt!384700))))

(declare-fun lt!384696 () ListLongMap!9527)

(assert (=> b!853378 (= lt!384696 (+!2171 lt!384695 (tuple2!10759 (select (arr!23403 _keys!868) from!1053) lt!384701)))))

(assert (=> b!853378 (= lt!384701 (get!12342 (select (store (arr!23404 _values!688) i!612 (ValueCellFull!7697 v!557)) from!1053) lt!384700))))

(declare-fun dynLambda!1052 (Int (_ BitVec 64)) V!26745)

(assert (=> b!853378 (= lt!384700 (dynLambda!1052 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384703 () array!48746)

(declare-fun getCurrentListMapNoExtraKeys!2760 (array!48744 array!48746 (_ BitVec 32) (_ BitVec 32) V!26745 V!26745 (_ BitVec 32) Int) ListLongMap!9527)

(assert (=> b!853378 (= lt!384695 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!384703 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853379 () Bool)

(declare-fun e!475912 () Bool)

(declare-fun tp_is_empty!16273 () Bool)

(assert (=> b!853379 (= e!475912 tp_is_empty!16273)))

(declare-fun b!853380 () Bool)

(declare-fun res!579578 () Bool)

(assert (=> b!853380 (=> (not res!579578) (not e!475910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853380 (= res!579578 (validMask!0 mask!1196))))

(declare-fun res!579586 () Bool)

(assert (=> start!73222 (=> (not res!579586) (not e!475910))))

(assert (=> start!73222 (= res!579586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23843 _keys!868))))))

(assert (=> start!73222 e!475910))

(assert (=> start!73222 tp_is_empty!16273))

(assert (=> start!73222 true))

(assert (=> start!73222 tp!49915))

(declare-fun array_inv!18558 (array!48744) Bool)

(assert (=> start!73222 (array_inv!18558 _keys!868)))

(declare-fun e!475905 () Bool)

(declare-fun array_inv!18559 (array!48746) Bool)

(assert (=> start!73222 (and (array_inv!18559 _values!688) e!475905)))

(declare-fun mapNonEmpty!26009 () Bool)

(declare-fun mapRes!26009 () Bool)

(declare-fun tp!49914 () Bool)

(assert (=> mapNonEmpty!26009 (= mapRes!26009 (and tp!49914 e!475912))))

(declare-fun mapKey!26009 () (_ BitVec 32))

(declare-fun mapValue!26009 () ValueCell!7697)

(declare-fun mapRest!26009 () (Array (_ BitVec 32) ValueCell!7697))

(assert (=> mapNonEmpty!26009 (= (arr!23404 _values!688) (store mapRest!26009 mapKey!26009 mapValue!26009))))

(declare-fun mapIsEmpty!26009 () Bool)

(assert (=> mapIsEmpty!26009 mapRes!26009))

(declare-fun b!853381 () Bool)

(declare-fun res!579584 () Bool)

(assert (=> b!853381 (=> (not res!579584) (not e!475910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48744 (_ BitVec 32)) Bool)

(assert (=> b!853381 (= res!579584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853382 () Bool)

(declare-fun res!579580 () Bool)

(assert (=> b!853382 (=> (not res!579580) (not e!475910))))

(assert (=> b!853382 (= res!579580 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23843 _keys!868))))))

(declare-fun b!853383 () Bool)

(declare-fun e!475908 () Bool)

(assert (=> b!853383 (= e!475908 tp_is_empty!16273)))

(declare-fun b!853384 () Bool)

(assert (=> b!853384 (= e!475910 e!475909)))

(declare-fun res!579583 () Bool)

(assert (=> b!853384 (=> (not res!579583) (not e!475909))))

(assert (=> b!853384 (= res!579583 (= from!1053 i!612))))

(assert (=> b!853384 (= lt!384696 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!384703 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853384 (= lt!384703 (array!48747 (store (arr!23404 _values!688) i!612 (ValueCellFull!7697 v!557)) (size!23844 _values!688)))))

(declare-fun lt!384699 () ListLongMap!9527)

(assert (=> b!853384 (= lt!384699 (getCurrentListMapNoExtraKeys!2760 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38263 () Bool)

(assert (=> bm!38263 (= call!38267 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!384703 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853385 () Bool)

(assert (=> b!853385 (= e!475905 (and e!475908 mapRes!26009))))

(declare-fun condMapEmpty!26009 () Bool)

(declare-fun mapDefault!26009 () ValueCell!7697)

