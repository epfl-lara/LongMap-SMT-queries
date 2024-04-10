; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74820 () Bool)

(assert start!74820)

(declare-fun b_free!15397 () Bool)

(declare-fun b_next!15397 () Bool)

(assert (=> start!74820 (= b_free!15397 (not b_next!15397))))

(declare-fun tp!53888 () Bool)

(declare-fun b_and!25461 () Bool)

(assert (=> start!74820 (= tp!53888 b_and!25461)))

(declare-fun b!882174 () Bool)

(declare-fun e!490955 () Bool)

(declare-fun tp_is_empty!17641 () Bool)

(assert (=> b!882174 (= e!490955 tp_is_empty!17641)))

(declare-fun b!882175 () Bool)

(declare-fun e!490954 () Bool)

(declare-fun e!490952 () Bool)

(assert (=> b!882175 (= e!490954 e!490952)))

(declare-fun res!599335 () Bool)

(assert (=> b!882175 (=> res!599335 e!490952)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51408 0))(
  ( (array!51409 (arr!24725 (Array (_ BitVec 32) (_ BitVec 64))) (size!25165 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51408)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882175 (= res!599335 (not (= (select (arr!24725 _keys!868) from!1053) k!854)))))

(declare-datatypes ((V!28569 0))(
  ( (V!28570 (val!8868 Int)) )
))
(declare-datatypes ((tuple2!11742 0))(
  ( (tuple2!11743 (_1!5882 (_ BitVec 64)) (_2!5882 V!28569)) )
))
(declare-datatypes ((List!17552 0))(
  ( (Nil!17549) (Cons!17548 (h!18679 tuple2!11742) (t!24751 List!17552)) )
))
(declare-datatypes ((ListLongMap!10511 0))(
  ( (ListLongMap!10512 (toList!5271 List!17552)) )
))
(declare-fun lt!399103 () ListLongMap!10511)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399102 () ListLongMap!10511)

(declare-datatypes ((ValueCell!8381 0))(
  ( (ValueCellFull!8381 (v!11328 V!28569)) (EmptyCell!8381) )
))
(declare-datatypes ((array!51410 0))(
  ( (array!51411 (arr!24726 (Array (_ BitVec 32) ValueCell!8381)) (size!25166 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51410)

(declare-fun +!2541 (ListLongMap!10511 tuple2!11742) ListLongMap!10511)

(declare-fun get!13016 (ValueCell!8381 V!28569) V!28569)

(declare-fun dynLambda!1255 (Int (_ BitVec 64)) V!28569)

(assert (=> b!882175 (= lt!399102 (+!2541 lt!399103 (tuple2!11743 (select (arr!24725 _keys!868) from!1053) (get!13016 (select (arr!24726 _values!688) from!1053) (dynLambda!1255 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882176 () Bool)

(declare-fun res!599340 () Bool)

(declare-fun e!490956 () Bool)

(assert (=> b!882176 (=> (not res!599340) (not e!490956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882176 (= res!599340 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!28092 () Bool)

(declare-fun mapRes!28092 () Bool)

(declare-fun tp!53887 () Bool)

(declare-fun e!490951 () Bool)

(assert (=> mapNonEmpty!28092 (= mapRes!28092 (and tp!53887 e!490951))))

(declare-fun mapKey!28092 () (_ BitVec 32))

(declare-fun mapValue!28092 () ValueCell!8381)

(declare-fun mapRest!28092 () (Array (_ BitVec 32) ValueCell!8381))

(assert (=> mapNonEmpty!28092 (= (arr!24726 _values!688) (store mapRest!28092 mapKey!28092 mapValue!28092))))

(declare-fun b!882177 () Bool)

(declare-fun res!599338 () Bool)

(assert (=> b!882177 (=> (not res!599338) (not e!490956))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882177 (= res!599338 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25165 _keys!868))))))

(declare-fun b!882178 () Bool)

(declare-fun res!599339 () Bool)

(assert (=> b!882178 (=> (not res!599339) (not e!490956))))

(assert (=> b!882178 (= res!599339 (and (= (select (arr!24725 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!882179 () Bool)

(declare-fun e!490950 () Bool)

(assert (=> b!882179 (= e!490950 (and e!490955 mapRes!28092))))

(declare-fun condMapEmpty!28092 () Bool)

(declare-fun mapDefault!28092 () ValueCell!8381)

