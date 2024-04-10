; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20284 () Bool)

(assert start!20284)

(declare-fun b_free!4943 () Bool)

(declare-fun b_next!4943 () Bool)

(assert (=> start!20284 (= b_free!4943 (not b_next!4943))))

(declare-fun tp!17861 () Bool)

(declare-fun b_and!11689 () Bool)

(assert (=> start!20284 (= tp!17861 b_and!11689)))

(declare-fun b!199694 () Bool)

(declare-fun res!94966 () Bool)

(declare-fun e!131050 () Bool)

(assert (=> b!199694 (=> (not res!94966) (not e!131050))))

(declare-datatypes ((array!8837 0))(
  ( (array!8838 (arr!4169 (Array (_ BitVec 32) (_ BitVec 64))) (size!4494 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8837)

(declare-datatypes ((List!2613 0))(
  ( (Nil!2610) (Cons!2609 (h!3251 (_ BitVec 64)) (t!7544 List!2613)) )
))
(declare-fun arrayNoDuplicates!0 (array!8837 (_ BitVec 32) List!2613) Bool)

(assert (=> b!199694 (= res!94966 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2610))))

(declare-fun mapNonEmpty!8267 () Bool)

(declare-fun mapRes!8267 () Bool)

(declare-fun tp!17860 () Bool)

(declare-fun e!131051 () Bool)

(assert (=> mapNonEmpty!8267 (= mapRes!8267 (and tp!17860 e!131051))))

(declare-datatypes ((V!6045 0))(
  ( (V!6046 (val!2444 Int)) )
))
(declare-datatypes ((ValueCell!2056 0))(
  ( (ValueCellFull!2056 (v!4414 V!6045)) (EmptyCell!2056) )
))
(declare-fun mapRest!8267 () (Array (_ BitVec 32) ValueCell!2056))

(declare-datatypes ((array!8839 0))(
  ( (array!8840 (arr!4170 (Array (_ BitVec 32) ValueCell!2056)) (size!4495 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8839)

(declare-fun mapValue!8267 () ValueCell!2056)

(declare-fun mapKey!8267 () (_ BitVec 32))

(assert (=> mapNonEmpty!8267 (= (arr!4170 _values!649) (store mapRest!8267 mapKey!8267 mapValue!8267))))

(declare-fun b!199695 () Bool)

(declare-fun res!94971 () Bool)

(assert (=> b!199695 (=> (not res!94971) (not e!131050))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8837 (_ BitVec 32)) Bool)

(assert (=> b!199695 (= res!94971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199696 () Bool)

(assert (=> b!199696 (= e!131050 (not true))))

(declare-fun lt!98475 () array!8839)

(declare-fun zeroValue!615 () V!6045)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3696 0))(
  ( (tuple2!3697 (_1!1859 (_ BitVec 64)) (_2!1859 V!6045)) )
))
(declare-datatypes ((List!2614 0))(
  ( (Nil!2611) (Cons!2610 (h!3252 tuple2!3696) (t!7545 List!2614)) )
))
(declare-datatypes ((ListLongMap!2609 0))(
  ( (ListLongMap!2610 (toList!1320 List!2614)) )
))
(declare-fun lt!98471 () ListLongMap!2609)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6045)

(declare-fun getCurrentListMap!911 (array!8837 array!8839 (_ BitVec 32) (_ BitVec 32) V!6045 V!6045 (_ BitVec 32) Int) ListLongMap!2609)

(assert (=> b!199696 (= lt!98471 (getCurrentListMap!911 _keys!825 lt!98475 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98470 () ListLongMap!2609)

(declare-fun lt!98474 () ListLongMap!2609)

(assert (=> b!199696 (and (= lt!98470 lt!98474) (= lt!98474 lt!98470))))

(declare-fun lt!98473 () ListLongMap!2609)

(declare-fun v!520 () V!6045)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!347 (ListLongMap!2609 tuple2!3696) ListLongMap!2609)

(assert (=> b!199696 (= lt!98474 (+!347 lt!98473 (tuple2!3697 k!843 v!520)))))

(declare-datatypes ((Unit!5996 0))(
  ( (Unit!5997) )
))
(declare-fun lt!98472 () Unit!5996)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!24 (array!8837 array!8839 (_ BitVec 32) (_ BitVec 32) V!6045 V!6045 (_ BitVec 32) (_ BitVec 64) V!6045 (_ BitVec 32) Int) Unit!5996)

(assert (=> b!199696 (= lt!98472 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!24 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!285 (array!8837 array!8839 (_ BitVec 32) (_ BitVec 32) V!6045 V!6045 (_ BitVec 32) Int) ListLongMap!2609)

(assert (=> b!199696 (= lt!98470 (getCurrentListMapNoExtraKeys!285 _keys!825 lt!98475 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199696 (= lt!98475 (array!8840 (store (arr!4170 _values!649) i!601 (ValueCellFull!2056 v!520)) (size!4495 _values!649)))))

(assert (=> b!199696 (= lt!98473 (getCurrentListMapNoExtraKeys!285 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199697 () Bool)

(declare-fun res!94967 () Bool)

(assert (=> b!199697 (=> (not res!94967) (not e!131050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199697 (= res!94967 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8267 () Bool)

(assert (=> mapIsEmpty!8267 mapRes!8267))

(declare-fun b!199698 () Bool)

(declare-fun res!94968 () Bool)

(assert (=> b!199698 (=> (not res!94968) (not e!131050))))

(assert (=> b!199698 (= res!94968 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4494 _keys!825))))))

(declare-fun res!94972 () Bool)

(assert (=> start!20284 (=> (not res!94972) (not e!131050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20284 (= res!94972 (validMask!0 mask!1149))))

(assert (=> start!20284 e!131050))

(declare-fun e!131054 () Bool)

(declare-fun array_inv!2739 (array!8839) Bool)

(assert (=> start!20284 (and (array_inv!2739 _values!649) e!131054)))

(assert (=> start!20284 true))

(declare-fun tp_is_empty!4799 () Bool)

(assert (=> start!20284 tp_is_empty!4799))

(declare-fun array_inv!2740 (array!8837) Bool)

(assert (=> start!20284 (array_inv!2740 _keys!825)))

(assert (=> start!20284 tp!17861))

(declare-fun b!199699 () Bool)

(declare-fun e!131053 () Bool)

(assert (=> b!199699 (= e!131054 (and e!131053 mapRes!8267))))

(declare-fun condMapEmpty!8267 () Bool)

(declare-fun mapDefault!8267 () ValueCell!2056)

