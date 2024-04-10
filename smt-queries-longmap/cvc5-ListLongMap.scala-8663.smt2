; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105340 () Bool)

(assert start!105340)

(declare-fun b_free!27013 () Bool)

(declare-fun b_next!27013 () Bool)

(assert (=> start!105340 (= b_free!27013 (not b_next!27013))))

(declare-fun tp!94549 () Bool)

(declare-fun b_and!44851 () Bool)

(assert (=> start!105340 (= tp!94549 b_and!44851)))

(declare-fun mapIsEmpty!49654 () Bool)

(declare-fun mapRes!49654 () Bool)

(assert (=> mapIsEmpty!49654 mapRes!49654))

(declare-fun res!836800 () Bool)

(declare-fun e!713290 () Bool)

(assert (=> start!105340 (=> (not res!836800) (not e!713290))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105340 (= res!836800 (validMask!0 mask!1466))))

(assert (=> start!105340 e!713290))

(assert (=> start!105340 true))

(assert (=> start!105340 tp!94549))

(declare-fun tp_is_empty!31915 () Bool)

(assert (=> start!105340 tp_is_empty!31915))

(declare-datatypes ((array!81480 0))(
  ( (array!81481 (arr!39300 (Array (_ BitVec 32) (_ BitVec 64))) (size!39836 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81480)

(declare-fun array_inv!29951 (array!81480) Bool)

(assert (=> start!105340 (array_inv!29951 _keys!1118)))

(declare-datatypes ((V!47919 0))(
  ( (V!47920 (val!16020 Int)) )
))
(declare-datatypes ((ValueCell!15194 0))(
  ( (ValueCellFull!15194 (v!18720 V!47919)) (EmptyCell!15194) )
))
(declare-datatypes ((array!81482 0))(
  ( (array!81483 (arr!39301 (Array (_ BitVec 32) ValueCell!15194)) (size!39837 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81482)

(declare-fun e!713291 () Bool)

(declare-fun array_inv!29952 (array!81482) Bool)

(assert (=> start!105340 (and (array_inv!29952 _values!914) e!713291)))

(declare-fun b!1255120 () Bool)

(declare-fun e!713289 () Bool)

(assert (=> b!1255120 (= e!713291 (and e!713289 mapRes!49654))))

(declare-fun condMapEmpty!49654 () Bool)

(declare-fun mapDefault!49654 () ValueCell!15194)

