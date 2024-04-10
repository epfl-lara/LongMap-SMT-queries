; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72346 () Bool)

(assert start!72346)

(declare-fun b_free!13531 () Bool)

(declare-fun b_next!13531 () Bool)

(assert (=> start!72346 (= b_free!13531 (not b_next!13531))))

(declare-fun tp!47691 () Bool)

(declare-fun b_and!22617 () Bool)

(assert (=> start!72346 (= tp!47691 b_and!22617)))

(declare-fun b!838166 () Bool)

(declare-fun res!569968 () Bool)

(declare-fun e!467893 () Bool)

(assert (=> b!838166 (=> (not res!569968) (not e!467893))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838166 (= res!569968 (validKeyInArray!0 k!854))))

(declare-fun b!838167 () Bool)

(declare-fun res!569966 () Bool)

(assert (=> b!838167 (=> (not res!569966) (not e!467893))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47084 0))(
  ( (array!47085 (arr!22573 (Array (_ BitVec 32) (_ BitVec 64))) (size!23013 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47084)

(assert (=> b!838167 (= res!569966 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23013 _keys!868))))))

(declare-fun b!838168 () Bool)

(declare-fun e!467894 () Bool)

(declare-fun tp_is_empty!15397 () Bool)

(assert (=> b!838168 (= e!467894 tp_is_empty!15397)))

(declare-fun b!838169 () Bool)

(declare-fun res!569964 () Bool)

(assert (=> b!838169 (=> (not res!569964) (not e!467893))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838169 (= res!569964 (validMask!0 mask!1196))))

(declare-fun b!838170 () Bool)

(assert (=> b!838170 (= e!467893 (not true))))

(declare-fun e!467891 () Bool)

(assert (=> b!838170 e!467891))

(declare-fun c!91156 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!838170 (= c!91156 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25577 0))(
  ( (V!25578 (val!7746 Int)) )
))
(declare-fun v!557 () V!25577)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28785 0))(
  ( (Unit!28786) )
))
(declare-fun lt!380662 () Unit!28785)

(declare-datatypes ((ValueCell!7259 0))(
  ( (ValueCellFull!7259 (v!10171 V!25577)) (EmptyCell!7259) )
))
(declare-datatypes ((array!47086 0))(
  ( (array!47087 (arr!22574 (Array (_ BitVec 32) ValueCell!7259)) (size!23014 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47086)

(declare-fun minValue!654 () V!25577)

(declare-fun zeroValue!654 () V!25577)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!238 (array!47084 array!47086 (_ BitVec 32) (_ BitVec 32) V!25577 V!25577 (_ BitVec 32) (_ BitVec 64) V!25577 (_ BitVec 32) Int) Unit!28785)

(assert (=> b!838170 (= lt!380662 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!238 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24695 () Bool)

(declare-fun mapRes!24695 () Bool)

(assert (=> mapIsEmpty!24695 mapRes!24695))

(declare-fun res!569963 () Bool)

(assert (=> start!72346 (=> (not res!569963) (not e!467893))))

(assert (=> start!72346 (= res!569963 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23013 _keys!868))))))

(assert (=> start!72346 e!467893))

(assert (=> start!72346 tp_is_empty!15397))

(assert (=> start!72346 true))

(assert (=> start!72346 tp!47691))

(declare-fun array_inv!17988 (array!47084) Bool)

(assert (=> start!72346 (array_inv!17988 _keys!868)))

(declare-fun e!467892 () Bool)

(declare-fun array_inv!17989 (array!47086) Bool)

(assert (=> start!72346 (and (array_inv!17989 _values!688) e!467892)))

(declare-fun mapNonEmpty!24695 () Bool)

(declare-fun tp!47692 () Bool)

(assert (=> mapNonEmpty!24695 (= mapRes!24695 (and tp!47692 e!467894))))

(declare-fun mapValue!24695 () ValueCell!7259)

(declare-fun mapKey!24695 () (_ BitVec 32))

(declare-fun mapRest!24695 () (Array (_ BitVec 32) ValueCell!7259))

(assert (=> mapNonEmpty!24695 (= (arr!22574 _values!688) (store mapRest!24695 mapKey!24695 mapValue!24695))))

(declare-datatypes ((tuple2!10244 0))(
  ( (tuple2!10245 (_1!5133 (_ BitVec 64)) (_2!5133 V!25577)) )
))
(declare-datatypes ((List!16049 0))(
  ( (Nil!16046) (Cons!16045 (h!17176 tuple2!10244) (t!22420 List!16049)) )
))
(declare-datatypes ((ListLongMap!9013 0))(
  ( (ListLongMap!9014 (toList!4522 List!16049)) )
))
(declare-fun call!36826 () ListLongMap!9013)

(declare-fun b!838171 () Bool)

(declare-fun call!36827 () ListLongMap!9013)

(declare-fun +!1997 (ListLongMap!9013 tuple2!10244) ListLongMap!9013)

(assert (=> b!838171 (= e!467891 (= call!36827 (+!1997 call!36826 (tuple2!10245 k!854 v!557))))))

(declare-fun b!838172 () Bool)

(declare-fun e!467895 () Bool)

(assert (=> b!838172 (= e!467895 tp_is_empty!15397)))

(declare-fun b!838173 () Bool)

(declare-fun res!569969 () Bool)

(assert (=> b!838173 (=> (not res!569969) (not e!467893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47084 (_ BitVec 32)) Bool)

(assert (=> b!838173 (= res!569969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838174 () Bool)

(assert (=> b!838174 (= e!467891 (= call!36827 call!36826))))

(declare-fun b!838175 () Bool)

(assert (=> b!838175 (= e!467892 (and e!467895 mapRes!24695))))

(declare-fun condMapEmpty!24695 () Bool)

(declare-fun mapDefault!24695 () ValueCell!7259)

