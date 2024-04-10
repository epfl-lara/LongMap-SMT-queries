; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42262 () Bool)

(assert start!42262)

(declare-fun b_free!11767 () Bool)

(declare-fun b_next!11767 () Bool)

(assert (=> start!42262 (= b_free!11767 (not b_next!11767))))

(declare-fun tp!41328 () Bool)

(declare-fun b_and!20205 () Bool)

(assert (=> start!42262 (= tp!41328 b_and!20205)))

(declare-fun mapIsEmpty!21499 () Bool)

(declare-fun mapRes!21499 () Bool)

(assert (=> mapIsEmpty!21499 mapRes!21499))

(declare-fun b!471605 () Bool)

(declare-fun e!276416 () Bool)

(declare-fun tp_is_empty!13195 () Bool)

(assert (=> b!471605 (= e!276416 tp_is_empty!13195)))

(declare-fun b!471606 () Bool)

(declare-fun res!281732 () Bool)

(declare-fun e!276419 () Bool)

(assert (=> b!471606 (=> (not res!281732) (not e!276419))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30151 0))(
  ( (array!30152 (arr!14497 (Array (_ BitVec 32) (_ BitVec 64))) (size!14849 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30151)

(declare-datatypes ((V!18699 0))(
  ( (V!18700 (val!6642 Int)) )
))
(declare-datatypes ((ValueCell!6254 0))(
  ( (ValueCellFull!6254 (v!8933 V!18699)) (EmptyCell!6254) )
))
(declare-datatypes ((array!30153 0))(
  ( (array!30154 (arr!14498 (Array (_ BitVec 32) ValueCell!6254)) (size!14850 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30153)

(assert (=> b!471606 (= res!281732 (and (= (size!14850 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14849 _keys!1025) (size!14850 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471607 () Bool)

(declare-fun e!276420 () Bool)

(declare-fun e!276418 () Bool)

(assert (=> b!471607 (= e!276420 (and e!276418 mapRes!21499))))

(declare-fun condMapEmpty!21499 () Bool)

(declare-fun mapDefault!21499 () ValueCell!6254)

