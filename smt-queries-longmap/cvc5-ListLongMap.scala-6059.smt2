; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78418 () Bool)

(assert start!78418)

(declare-fun res!616865 () Bool)

(declare-fun e!513191 () Bool)

(assert (=> start!78418 (=> (not res!616865) (not e!513191))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78418 (= res!616865 (validMask!0 mask!1881))))

(assert (=> start!78418 e!513191))

(assert (=> start!78418 true))

(declare-datatypes ((V!30543 0))(
  ( (V!30544 (val!9642 Int)) )
))
(declare-datatypes ((ValueCell!9110 0))(
  ( (ValueCellFull!9110 (v!12159 V!30543)) (EmptyCell!9110) )
))
(declare-datatypes ((array!54358 0))(
  ( (array!54359 (arr!26129 (Array (_ BitVec 32) ValueCell!9110)) (size!26588 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54358)

(declare-fun e!513190 () Bool)

(declare-fun array_inv!20406 (array!54358) Bool)

(assert (=> start!78418 (and (array_inv!20406 _values!1231) e!513190)))

(declare-datatypes ((array!54360 0))(
  ( (array!54361 (arr!26130 (Array (_ BitVec 32) (_ BitVec 64))) (size!26589 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54360)

(declare-fun array_inv!20407 (array!54360) Bool)

(assert (=> start!78418 (array_inv!20407 _keys!1487)))

(declare-fun b!914738 () Bool)

(declare-fun e!513189 () Bool)

(declare-fun tp_is_empty!19183 () Bool)

(assert (=> b!914738 (= e!513189 tp_is_empty!19183)))

(declare-fun mapNonEmpty!30516 () Bool)

(declare-fun mapRes!30516 () Bool)

(declare-fun tp!58583 () Bool)

(declare-fun e!513187 () Bool)

(assert (=> mapNonEmpty!30516 (= mapRes!30516 (and tp!58583 e!513187))))

(declare-fun mapValue!30516 () ValueCell!9110)

(declare-fun mapRest!30516 () (Array (_ BitVec 32) ValueCell!9110))

(declare-fun mapKey!30516 () (_ BitVec 32))

(assert (=> mapNonEmpty!30516 (= (arr!26129 _values!1231) (store mapRest!30516 mapKey!30516 mapValue!30516))))

(declare-fun mapIsEmpty!30516 () Bool)

(assert (=> mapIsEmpty!30516 mapRes!30516))

(declare-fun b!914739 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914739 (= e!513191 (and (= (size!26588 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26589 _keys!1487) (size!26588 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (not (= (size!26589 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)))))))

(declare-fun b!914740 () Bool)

(assert (=> b!914740 (= e!513187 tp_is_empty!19183)))

(declare-fun b!914741 () Bool)

(assert (=> b!914741 (= e!513190 (and e!513189 mapRes!30516))))

(declare-fun condMapEmpty!30516 () Bool)

(declare-fun mapDefault!30516 () ValueCell!9110)

