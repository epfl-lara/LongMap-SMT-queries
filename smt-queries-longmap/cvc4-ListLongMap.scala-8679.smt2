; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105476 () Bool)

(assert start!105476)

(declare-fun b_free!27113 () Bool)

(declare-fun b_next!27113 () Bool)

(assert (=> start!105476 (= b_free!27113 (not b_next!27113))))

(declare-fun tp!94856 () Bool)

(declare-fun b_and!44969 () Bool)

(assert (=> start!105476 (= tp!94856 b_and!44969)))

(declare-fun mapIsEmpty!49810 () Bool)

(declare-fun mapRes!49810 () Bool)

(assert (=> mapIsEmpty!49810 mapRes!49810))

(declare-fun b!1256599 () Bool)

(declare-fun e!714384 () Bool)

(declare-fun tp_is_empty!32015 () Bool)

(assert (=> b!1256599 (= e!714384 tp_is_empty!32015)))

(declare-fun b!1256600 () Bool)

(declare-fun e!714381 () Bool)

(assert (=> b!1256600 (= e!714381 tp_is_empty!32015)))

(declare-fun res!837683 () Bool)

(declare-fun e!714382 () Bool)

(assert (=> start!105476 (=> (not res!837683) (not e!714382))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105476 (= res!837683 (validMask!0 mask!1466))))

(assert (=> start!105476 e!714382))

(assert (=> start!105476 true))

(assert (=> start!105476 tp!94856))

(assert (=> start!105476 tp_is_empty!32015))

(declare-datatypes ((array!81670 0))(
  ( (array!81671 (arr!39393 (Array (_ BitVec 32) (_ BitVec 64))) (size!39929 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81670)

(declare-fun array_inv!30011 (array!81670) Bool)

(assert (=> start!105476 (array_inv!30011 _keys!1118)))

(declare-datatypes ((V!48051 0))(
  ( (V!48052 (val!16070 Int)) )
))
(declare-datatypes ((ValueCell!15244 0))(
  ( (ValueCellFull!15244 (v!18771 V!48051)) (EmptyCell!15244) )
))
(declare-datatypes ((array!81672 0))(
  ( (array!81673 (arr!39394 (Array (_ BitVec 32) ValueCell!15244)) (size!39930 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81672)

(declare-fun e!714385 () Bool)

(declare-fun array_inv!30012 (array!81672) Bool)

(assert (=> start!105476 (and (array_inv!30012 _values!914) e!714385)))

(declare-fun b!1256601 () Bool)

(declare-fun res!837682 () Bool)

(assert (=> b!1256601 (=> (not res!837682) (not e!714382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81670 (_ BitVec 32)) Bool)

(assert (=> b!1256601 (= res!837682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256602 () Bool)

(assert (=> b!1256602 (= e!714385 (and e!714381 mapRes!49810))))

(declare-fun condMapEmpty!49810 () Bool)

(declare-fun mapDefault!49810 () ValueCell!15244)

