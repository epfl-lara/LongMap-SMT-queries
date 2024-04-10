; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78436 () Bool)

(assert start!78436)

(declare-fun b!914822 () Bool)

(declare-fun e!513287 () Bool)

(declare-datatypes ((array!54382 0))(
  ( (array!54383 (arr!26140 (Array (_ BitVec 32) (_ BitVec 64))) (size!26599 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54382)

(assert (=> b!914822 (= e!513287 (bvsgt #b00000000000000000000000000000000 (size!26599 _keys!1487)))))

(declare-fun b!914823 () Bool)

(declare-fun e!513286 () Bool)

(declare-fun tp_is_empty!19195 () Bool)

(assert (=> b!914823 (= e!513286 tp_is_empty!19195)))

(declare-fun res!616888 () Bool)

(assert (=> start!78436 (=> (not res!616888) (not e!513287))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78436 (= res!616888 (validMask!0 mask!1881))))

(assert (=> start!78436 e!513287))

(assert (=> start!78436 true))

(declare-datatypes ((V!30559 0))(
  ( (V!30560 (val!9648 Int)) )
))
(declare-datatypes ((ValueCell!9116 0))(
  ( (ValueCellFull!9116 (v!12165 V!30559)) (EmptyCell!9116) )
))
(declare-datatypes ((array!54384 0))(
  ( (array!54385 (arr!26141 (Array (_ BitVec 32) ValueCell!9116)) (size!26600 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54384)

(declare-fun e!513285 () Bool)

(declare-fun array_inv!20414 (array!54384) Bool)

(assert (=> start!78436 (and (array_inv!20414 _values!1231) e!513285)))

(declare-fun array_inv!20415 (array!54382) Bool)

(assert (=> start!78436 (array_inv!20415 _keys!1487)))

(declare-fun mapIsEmpty!30537 () Bool)

(declare-fun mapRes!30537 () Bool)

(assert (=> mapIsEmpty!30537 mapRes!30537))

(declare-fun b!914824 () Bool)

(declare-fun res!616887 () Bool)

(assert (=> b!914824 (=> (not res!616887) (not e!513287))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914824 (= res!616887 (and (= (size!26600 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26599 _keys!1487) (size!26600 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914825 () Bool)

(declare-fun e!513283 () Bool)

(assert (=> b!914825 (= e!513283 tp_is_empty!19195)))

(declare-fun mapNonEmpty!30537 () Bool)

(declare-fun tp!58604 () Bool)

(assert (=> mapNonEmpty!30537 (= mapRes!30537 (and tp!58604 e!513286))))

(declare-fun mapRest!30537 () (Array (_ BitVec 32) ValueCell!9116))

(declare-fun mapKey!30537 () (_ BitVec 32))

(declare-fun mapValue!30537 () ValueCell!9116)

(assert (=> mapNonEmpty!30537 (= (arr!26141 _values!1231) (store mapRest!30537 mapKey!30537 mapValue!30537))))

(declare-fun b!914826 () Bool)

(declare-fun res!616889 () Bool)

(assert (=> b!914826 (=> (not res!616889) (not e!513287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54382 (_ BitVec 32)) Bool)

(assert (=> b!914826 (= res!616889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914827 () Bool)

(assert (=> b!914827 (= e!513285 (and e!513283 mapRes!30537))))

(declare-fun condMapEmpty!30537 () Bool)

(declare-fun mapDefault!30537 () ValueCell!9116)

