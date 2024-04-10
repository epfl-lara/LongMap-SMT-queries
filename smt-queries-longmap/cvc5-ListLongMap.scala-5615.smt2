; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73474 () Bool)

(assert start!73474)

(declare-fun b_free!14389 () Bool)

(declare-fun b_next!14389 () Bool)

(assert (=> start!73474 (= b_free!14389 (not b_next!14389))))

(declare-fun tp!50670 () Bool)

(declare-fun b_and!23757 () Bool)

(assert (=> start!73474 (= tp!50670 b_and!23757)))

(declare-fun mapNonEmpty!26387 () Bool)

(declare-fun mapRes!26387 () Bool)

(declare-fun tp!50671 () Bool)

(declare-fun e!478270 () Bool)

(assert (=> mapNonEmpty!26387 (= mapRes!26387 (and tp!50671 e!478270))))

(declare-fun mapKey!26387 () (_ BitVec 32))

(declare-datatypes ((V!27081 0))(
  ( (V!27082 (val!8310 Int)) )
))
(declare-datatypes ((ValueCell!7823 0))(
  ( (ValueCellFull!7823 (v!10735 V!27081)) (EmptyCell!7823) )
))
(declare-fun mapRest!26387 () (Array (_ BitVec 32) ValueCell!7823))

(declare-fun mapValue!26387 () ValueCell!7823)

(declare-datatypes ((array!49238 0))(
  ( (array!49239 (arr!23650 (Array (_ BitVec 32) ValueCell!7823)) (size!24090 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49238)

(assert (=> mapNonEmpty!26387 (= (arr!23650 _values!688) (store mapRest!26387 mapKey!26387 mapValue!26387))))

(declare-fun mapIsEmpty!26387 () Bool)

(assert (=> mapIsEmpty!26387 mapRes!26387))

(declare-fun b!858167 () Bool)

(declare-fun e!478276 () Bool)

(declare-fun tp_is_empty!16525 () Bool)

(assert (=> b!858167 (= e!478276 tp_is_empty!16525)))

(declare-fun b!858168 () Bool)

(declare-fun res!582993 () Bool)

(declare-fun e!478273 () Bool)

(assert (=> b!858168 (=> (not res!582993) (not e!478273))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858168 (= res!582993 (validKeyInArray!0 k!854))))

(declare-fun b!858169 () Bool)

(declare-fun e!478275 () Bool)

(assert (=> b!858169 (= e!478275 true)))

(declare-datatypes ((tuple2!10970 0))(
  ( (tuple2!10971 (_1!5496 (_ BitVec 64)) (_2!5496 V!27081)) )
))
(declare-datatypes ((List!16777 0))(
  ( (Nil!16774) (Cons!16773 (h!17904 tuple2!10970) (t!23432 List!16777)) )
))
(declare-datatypes ((ListLongMap!9739 0))(
  ( (ListLongMap!9740 (toList!4885 List!16777)) )
))
(declare-fun lt!386584 () ListLongMap!9739)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((array!49240 0))(
  ( (array!49241 (arr!23651 (Array (_ BitVec 32) (_ BitVec 64))) (size!24091 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49240)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!386581 () ListLongMap!9739)

(declare-fun +!2238 (ListLongMap!9739 tuple2!10970) ListLongMap!9739)

(declare-fun get!12452 (ValueCell!7823 V!27081) V!27081)

(declare-fun dynLambda!1078 (Int (_ BitVec 64)) V!27081)

(assert (=> b!858169 (= lt!386581 (+!2238 lt!386584 (tuple2!10971 (select (arr!23651 _keys!868) from!1053) (get!12452 (select (arr!23650 _values!688) from!1053) (dynLambda!1078 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!582994 () Bool)

(assert (=> start!73474 (=> (not res!582994) (not e!478273))))

(assert (=> start!73474 (= res!582994 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24091 _keys!868))))))

(assert (=> start!73474 e!478273))

(assert (=> start!73474 tp_is_empty!16525))

(assert (=> start!73474 true))

(assert (=> start!73474 tp!50670))

(declare-fun array_inv!18732 (array!49240) Bool)

(assert (=> start!73474 (array_inv!18732 _keys!868)))

(declare-fun e!478274 () Bool)

(declare-fun array_inv!18733 (array!49238) Bool)

(assert (=> start!73474 (and (array_inv!18733 _values!688) e!478274)))

(declare-fun b!858170 () Bool)

(declare-fun res!582998 () Bool)

(assert (=> b!858170 (=> (not res!582998) (not e!478273))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858170 (= res!582998 (validMask!0 mask!1196))))

(declare-fun b!858171 () Bool)

(declare-fun res!582996 () Bool)

(assert (=> b!858171 (=> (not res!582996) (not e!478273))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858171 (= res!582996 (and (= (select (arr!23651 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858172 () Bool)

(declare-fun e!478272 () Bool)

(assert (=> b!858172 (= e!478273 e!478272)))

(declare-fun res!582991 () Bool)

(assert (=> b!858172 (=> (not res!582991) (not e!478272))))

(assert (=> b!858172 (= res!582991 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386583 () array!49238)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27081)

(declare-fun zeroValue!654 () V!27081)

(declare-fun getCurrentListMapNoExtraKeys!2866 (array!49240 array!49238 (_ BitVec 32) (_ BitVec 32) V!27081 V!27081 (_ BitVec 32) Int) ListLongMap!9739)

(assert (=> b!858172 (= lt!386581 (getCurrentListMapNoExtraKeys!2866 _keys!868 lt!386583 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27081)

(assert (=> b!858172 (= lt!386583 (array!49239 (store (arr!23650 _values!688) i!612 (ValueCellFull!7823 v!557)) (size!24090 _values!688)))))

(declare-fun lt!386580 () ListLongMap!9739)

(assert (=> b!858172 (= lt!386580 (getCurrentListMapNoExtraKeys!2866 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858173 () Bool)

(declare-fun res!582997 () Bool)

(assert (=> b!858173 (=> (not res!582997) (not e!478273))))

(assert (=> b!858173 (= res!582997 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24091 _keys!868))))))

(declare-fun b!858174 () Bool)

(declare-fun res!582990 () Bool)

(assert (=> b!858174 (=> (not res!582990) (not e!478273))))

(declare-datatypes ((List!16778 0))(
  ( (Nil!16775) (Cons!16774 (h!17905 (_ BitVec 64)) (t!23433 List!16778)) )
))
(declare-fun arrayNoDuplicates!0 (array!49240 (_ BitVec 32) List!16778) Bool)

(assert (=> b!858174 (= res!582990 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16775))))

(declare-fun b!858175 () Bool)

(declare-fun res!582989 () Bool)

(assert (=> b!858175 (=> (not res!582989) (not e!478273))))

(assert (=> b!858175 (= res!582989 (and (= (size!24090 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24091 _keys!868) (size!24090 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858176 () Bool)

(assert (=> b!858176 (= e!478274 (and e!478276 mapRes!26387))))

(declare-fun condMapEmpty!26387 () Bool)

(declare-fun mapDefault!26387 () ValueCell!7823)

