; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74902 () Bool)

(assert start!74902)

(declare-fun b_free!15421 () Bool)

(declare-fun b_next!15421 () Bool)

(assert (=> start!74902 (= b_free!15421 (not b_next!15421))))

(declare-fun tp!53965 () Bool)

(declare-fun b_and!25541 () Bool)

(assert (=> start!74902 (= tp!53965 b_and!25541)))

(declare-fun res!599964 () Bool)

(declare-fun e!491484 () Bool)

(assert (=> start!74902 (=> (not res!599964) (not e!491484))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51456 0))(
  ( (array!51457 (arr!24747 (Array (_ BitVec 32) (_ BitVec 64))) (size!25187 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51456)

(assert (=> start!74902 (= res!599964 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25187 _keys!868))))))

(assert (=> start!74902 e!491484))

(declare-fun tp_is_empty!17665 () Bool)

(assert (=> start!74902 tp_is_empty!17665))

(assert (=> start!74902 true))

(assert (=> start!74902 tp!53965))

(declare-fun array_inv!19484 (array!51456) Bool)

(assert (=> start!74902 (array_inv!19484 _keys!868)))

(declare-datatypes ((V!28601 0))(
  ( (V!28602 (val!8880 Int)) )
))
(declare-datatypes ((ValueCell!8393 0))(
  ( (ValueCellFull!8393 (v!11349 V!28601)) (EmptyCell!8393) )
))
(declare-datatypes ((array!51458 0))(
  ( (array!51459 (arr!24748 (Array (_ BitVec 32) ValueCell!8393)) (size!25188 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51458)

(declare-fun e!491489 () Bool)

(declare-fun array_inv!19485 (array!51458) Bool)

(assert (=> start!74902 (and (array_inv!19485 _values!688) e!491489)))

(declare-fun b!883092 () Bool)

(declare-fun e!491486 () Bool)

(declare-fun e!491490 () Bool)

(assert (=> b!883092 (= e!491486 e!491490)))

(declare-fun res!599966 () Bool)

(assert (=> b!883092 (=> res!599966 e!491490)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!883092 (= res!599966 (not (= (select (arr!24747 _keys!868) from!1053) k!854)))))

(declare-datatypes ((tuple2!11762 0))(
  ( (tuple2!11763 (_1!5892 (_ BitVec 64)) (_2!5892 V!28601)) )
))
(declare-datatypes ((List!17571 0))(
  ( (Nil!17568) (Cons!17567 (h!18698 tuple2!11762) (t!24794 List!17571)) )
))
(declare-datatypes ((ListLongMap!10531 0))(
  ( (ListLongMap!10532 (toList!5281 List!17571)) )
))
(declare-fun lt!399603 () ListLongMap!10531)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399608 () ListLongMap!10531)

(declare-fun +!2550 (ListLongMap!10531 tuple2!11762) ListLongMap!10531)

(declare-fun get!13036 (ValueCell!8393 V!28601) V!28601)

(declare-fun dynLambda!1263 (Int (_ BitVec 64)) V!28601)

(assert (=> b!883092 (= lt!399603 (+!2550 lt!399608 (tuple2!11763 (select (arr!24747 _keys!868) from!1053) (get!13036 (select (arr!24748 _values!688) from!1053) (dynLambda!1263 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883093 () Bool)

(declare-fun e!491485 () Bool)

(assert (=> b!883093 (= e!491485 tp_is_empty!17665)))

(declare-fun mapNonEmpty!28134 () Bool)

(declare-fun mapRes!28134 () Bool)

(declare-fun tp!53966 () Bool)

(declare-fun e!491488 () Bool)

(assert (=> mapNonEmpty!28134 (= mapRes!28134 (and tp!53966 e!491488))))

(declare-fun mapValue!28134 () ValueCell!8393)

(declare-fun mapKey!28134 () (_ BitVec 32))

(declare-fun mapRest!28134 () (Array (_ BitVec 32) ValueCell!8393))

(assert (=> mapNonEmpty!28134 (= (arr!24748 _values!688) (store mapRest!28134 mapKey!28134 mapValue!28134))))

(declare-fun b!883094 () Bool)

(declare-fun res!599967 () Bool)

(assert (=> b!883094 (=> (not res!599967) (not e!491484))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883094 (= res!599967 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25187 _keys!868))))))

(declare-fun b!883095 () Bool)

(declare-fun res!599962 () Bool)

(assert (=> b!883095 (=> (not res!599962) (not e!491484))))

(declare-datatypes ((List!17572 0))(
  ( (Nil!17569) (Cons!17568 (h!18699 (_ BitVec 64)) (t!24795 List!17572)) )
))
(declare-fun arrayNoDuplicates!0 (array!51456 (_ BitVec 32) List!17572) Bool)

(assert (=> b!883095 (= res!599962 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17569))))

(declare-fun b!883096 () Bool)

(declare-fun res!599960 () Bool)

(assert (=> b!883096 (=> (not res!599960) (not e!491484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883096 (= res!599960 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!28134 () Bool)

(assert (=> mapIsEmpty!28134 mapRes!28134))

(declare-fun b!883097 () Bool)

(declare-fun res!599961 () Bool)

(assert (=> b!883097 (=> (not res!599961) (not e!491484))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51456 (_ BitVec 32)) Bool)

(assert (=> b!883097 (= res!599961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883098 () Bool)

(assert (=> b!883098 (= e!491490 true)))

(assert (=> b!883098 false))

(declare-datatypes ((Unit!30116 0))(
  ( (Unit!30117) )
))
(declare-fun lt!399610 () Unit!30116)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51456 (_ BitVec 64) (_ BitVec 32) List!17572) Unit!30116)

(assert (=> b!883098 (= lt!399610 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17569))))

(declare-fun arrayContainsKey!0 (array!51456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883098 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399611 () Unit!30116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51456 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30116)

(assert (=> b!883098 (= lt!399611 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883098 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17569)))

(declare-fun lt!399602 () Unit!30116)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51456 (_ BitVec 32) (_ BitVec 32)) Unit!30116)

(assert (=> b!883098 (= lt!399602 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!883099 () Bool)

(assert (=> b!883099 (= e!491488 tp_is_empty!17665)))

(declare-fun b!883100 () Bool)

(declare-fun res!599957 () Bool)

(assert (=> b!883100 (=> (not res!599957) (not e!491484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883100 (= res!599957 (validMask!0 mask!1196))))

(declare-fun b!883101 () Bool)

(assert (=> b!883101 (= e!491489 (and e!491485 mapRes!28134))))

(declare-fun condMapEmpty!28134 () Bool)

(declare-fun mapDefault!28134 () ValueCell!8393)

