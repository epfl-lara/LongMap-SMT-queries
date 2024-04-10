; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78082 () Bool)

(assert start!78082)

(declare-fun b_free!16609 () Bool)

(declare-fun b_next!16609 () Bool)

(assert (=> start!78082 (= b_free!16609 (not b_next!16609))))

(declare-fun tp!58097 () Bool)

(declare-fun b_and!27181 () Bool)

(assert (=> start!78082 (= tp!58097 b_and!27181)))

(declare-fun res!614921 () Bool)

(declare-fun e!511152 () Bool)

(assert (=> start!78082 (=> (not res!614921) (not e!511152))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78082 (= res!614921 (validMask!0 mask!1756))))

(assert (=> start!78082 e!511152))

(declare-datatypes ((V!30335 0))(
  ( (V!30336 (val!9564 Int)) )
))
(declare-datatypes ((ValueCell!9032 0))(
  ( (ValueCellFull!9032 (v!12073 V!30335)) (EmptyCell!9032) )
))
(declare-datatypes ((array!54054 0))(
  ( (array!54055 (arr!25983 (Array (_ BitVec 32) ValueCell!9032)) (size!26442 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54054)

(declare-fun e!511154 () Bool)

(declare-fun array_inv!20308 (array!54054) Bool)

(assert (=> start!78082 (and (array_inv!20308 _values!1152) e!511154)))

(assert (=> start!78082 tp!58097))

(assert (=> start!78082 true))

(declare-fun tp_is_empty!19027 () Bool)

(assert (=> start!78082 tp_is_empty!19027))

(declare-datatypes ((array!54056 0))(
  ( (array!54057 (arr!25984 (Array (_ BitVec 32) (_ BitVec 64))) (size!26443 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54056)

(declare-fun array_inv!20309 (array!54056) Bool)

(assert (=> start!78082 (array_inv!20309 _keys!1386)))

(declare-fun mapNonEmpty!30262 () Bool)

(declare-fun mapRes!30262 () Bool)

(declare-fun tp!58098 () Bool)

(declare-fun e!511155 () Bool)

(assert (=> mapNonEmpty!30262 (= mapRes!30262 (and tp!58098 e!511155))))

(declare-fun mapKey!30262 () (_ BitVec 32))

(declare-fun mapRest!30262 () (Array (_ BitVec 32) ValueCell!9032))

(declare-fun mapValue!30262 () ValueCell!9032)

(assert (=> mapNonEmpty!30262 (= (arr!25983 _values!1152) (store mapRest!30262 mapKey!30262 mapValue!30262))))

(declare-fun b!911413 () Bool)

(declare-fun res!614920 () Bool)

(assert (=> b!911413 (=> (not res!614920) (not e!511152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54056 (_ BitVec 32)) Bool)

(assert (=> b!911413 (= res!614920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30262 () Bool)

(assert (=> mapIsEmpty!30262 mapRes!30262))

(declare-fun b!911414 () Bool)

(declare-fun res!614923 () Bool)

(assert (=> b!911414 (=> (not res!614923) (not e!511152))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!911414 (= res!614923 (inRange!0 i!717 mask!1756))))

(declare-fun b!911415 () Bool)

(declare-fun res!614922 () Bool)

(assert (=> b!911415 (=> (not res!614922) (not e!511152))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30335)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30335)

(declare-datatypes ((tuple2!12458 0))(
  ( (tuple2!12459 (_1!6240 (_ BitVec 64)) (_2!6240 V!30335)) )
))
(declare-datatypes ((List!18251 0))(
  ( (Nil!18248) (Cons!18247 (h!19393 tuple2!12458) (t!25836 List!18251)) )
))
(declare-datatypes ((ListLongMap!11155 0))(
  ( (ListLongMap!11156 (toList!5593 List!18251)) )
))
(declare-fun contains!4637 (ListLongMap!11155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2855 (array!54056 array!54054 (_ BitVec 32) (_ BitVec 32) V!30335 V!30335 (_ BitVec 32) Int) ListLongMap!11155)

(assert (=> b!911415 (= res!614922 (contains!4637 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911416 () Bool)

(declare-fun e!511151 () Bool)

(assert (=> b!911416 (= e!511151 tp_is_empty!19027)))

(declare-fun b!911417 () Bool)

(assert (=> b!911417 (= e!511152 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26443 _keys!1386))))))

(declare-fun b!911418 () Bool)

(assert (=> b!911418 (= e!511154 (and e!511151 mapRes!30262))))

(declare-fun condMapEmpty!30262 () Bool)

(declare-fun mapDefault!30262 () ValueCell!9032)

