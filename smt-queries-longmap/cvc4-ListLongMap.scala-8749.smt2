; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106196 () Bool)

(assert start!106196)

(declare-fun b_free!27533 () Bool)

(declare-fun b_next!27533 () Bool)

(assert (=> start!106196 (= b_free!27533 (not b_next!27533))))

(declare-fun tp!96163 () Bool)

(declare-fun b_and!45565 () Bool)

(assert (=> start!106196 (= tp!96163 b_and!45565)))

(declare-fun b!1264373 () Bool)

(declare-fun e!719948 () Bool)

(declare-fun tp_is_empty!32435 () Bool)

(assert (=> b!1264373 (= e!719948 tp_is_empty!32435)))

(declare-fun mapIsEmpty!50488 () Bool)

(declare-fun mapRes!50488 () Bool)

(assert (=> mapIsEmpty!50488 mapRes!50488))

(declare-fun res!842034 () Bool)

(declare-fun e!719946 () Bool)

(assert (=> start!106196 (=> (not res!842034) (not e!719946))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106196 (= res!842034 (validMask!0 mask!1466))))

(assert (=> start!106196 e!719946))

(assert (=> start!106196 true))

(assert (=> start!106196 tp!96163))

(assert (=> start!106196 tp_is_empty!32435))

(declare-datatypes ((array!82498 0))(
  ( (array!82499 (arr!39791 (Array (_ BitVec 32) (_ BitVec 64))) (size!40327 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82498)

(declare-fun array_inv!30283 (array!82498) Bool)

(assert (=> start!106196 (array_inv!30283 _keys!1118)))

(declare-datatypes ((V!48611 0))(
  ( (V!48612 (val!16280 Int)) )
))
(declare-datatypes ((ValueCell!15454 0))(
  ( (ValueCellFull!15454 (v!18994 V!48611)) (EmptyCell!15454) )
))
(declare-datatypes ((array!82500 0))(
  ( (array!82501 (arr!39792 (Array (_ BitVec 32) ValueCell!15454)) (size!40328 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82500)

(declare-fun e!719951 () Bool)

(declare-fun array_inv!30284 (array!82500) Bool)

(assert (=> start!106196 (and (array_inv!30284 _values!914) e!719951)))

(declare-fun mapNonEmpty!50488 () Bool)

(declare-fun tp!96164 () Bool)

(declare-fun e!719950 () Bool)

(assert (=> mapNonEmpty!50488 (= mapRes!50488 (and tp!96164 e!719950))))

(declare-fun mapValue!50488 () ValueCell!15454)

(declare-fun mapRest!50488 () (Array (_ BitVec 32) ValueCell!15454))

(declare-fun mapKey!50488 () (_ BitVec 32))

(assert (=> mapNonEmpty!50488 (= (arr!39792 _values!914) (store mapRest!50488 mapKey!50488 mapValue!50488))))

(declare-fun b!1264374 () Bool)

(assert (=> b!1264374 (= e!719951 (and e!719948 mapRes!50488))))

(declare-fun condMapEmpty!50488 () Bool)

(declare-fun mapDefault!50488 () ValueCell!15454)

