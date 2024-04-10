; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78464 () Bool)

(assert start!78464)

(declare-fun b!914972 () Bool)

(declare-fun res!616956 () Bool)

(declare-fun e!513407 () Bool)

(assert (=> b!914972 (=> (not res!616956) (not e!513407))))

(declare-datatypes ((array!54410 0))(
  ( (array!54411 (arr!26152 (Array (_ BitVec 32) (_ BitVec 64))) (size!26611 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54410)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54410 (_ BitVec 32)) Bool)

(assert (=> b!914972 (= res!616956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!616955 () Bool)

(assert (=> start!78464 (=> (not res!616955) (not e!513407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78464 (= res!616955 (validMask!0 mask!1881))))

(assert (=> start!78464 e!513407))

(assert (=> start!78464 true))

(declare-datatypes ((V!30575 0))(
  ( (V!30576 (val!9654 Int)) )
))
(declare-datatypes ((ValueCell!9122 0))(
  ( (ValueCellFull!9122 (v!12171 V!30575)) (EmptyCell!9122) )
))
(declare-datatypes ((array!54412 0))(
  ( (array!54413 (arr!26153 (Array (_ BitVec 32) ValueCell!9122)) (size!26612 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54412)

(declare-fun e!513404 () Bool)

(declare-fun array_inv!20420 (array!54412) Bool)

(assert (=> start!78464 (and (array_inv!20420 _values!1231) e!513404)))

(declare-fun array_inv!20421 (array!54410) Bool)

(assert (=> start!78464 (array_inv!20421 _keys!1487)))

(declare-fun b!914973 () Bool)

(declare-fun e!513403 () Bool)

(declare-fun tp_is_empty!19207 () Bool)

(assert (=> b!914973 (= e!513403 tp_is_empty!19207)))

(declare-fun mapNonEmpty!30561 () Bool)

(declare-fun mapRes!30561 () Bool)

(declare-fun tp!58628 () Bool)

(assert (=> mapNonEmpty!30561 (= mapRes!30561 (and tp!58628 e!513403))))

(declare-fun mapRest!30561 () (Array (_ BitVec 32) ValueCell!9122))

(declare-fun mapValue!30561 () ValueCell!9122)

(declare-fun mapKey!30561 () (_ BitVec 32))

(assert (=> mapNonEmpty!30561 (= (arr!26153 _values!1231) (store mapRest!30561 mapKey!30561 mapValue!30561))))

(declare-fun b!914974 () Bool)

(declare-fun e!513405 () Bool)

(assert (=> b!914974 (= e!513405 tp_is_empty!19207)))

(declare-fun mapIsEmpty!30561 () Bool)

(assert (=> mapIsEmpty!30561 mapRes!30561))

(declare-fun b!914975 () Bool)

(declare-fun res!616958 () Bool)

(assert (=> b!914975 (=> (not res!616958) (not e!513407))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914975 (= res!616958 (and (= (size!26612 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26611 _keys!1487) (size!26612 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914976 () Bool)

(declare-fun res!616957 () Bool)

(assert (=> b!914976 (=> (not res!616957) (not e!513407))))

(assert (=> b!914976 (= res!616957 (and (bvsle #b00000000000000000000000000000000 (size!26611 _keys!1487)) (bvslt (size!26611 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914977 () Bool)

(assert (=> b!914977 (= e!513404 (and e!513405 mapRes!30561))))

(declare-fun condMapEmpty!30561 () Bool)

(declare-fun mapDefault!30561 () ValueCell!9122)

