; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105116 () Bool)

(assert start!105116)

(declare-fun b_free!26849 () Bool)

(declare-fun b_next!26849 () Bool)

(assert (=> start!105116 (= b_free!26849 (not b_next!26849))))

(declare-fun tp!94048 () Bool)

(declare-fun b_and!44653 () Bool)

(assert (=> start!105116 (= tp!94048 b_and!44653)))

(declare-fun res!835372 () Bool)

(declare-fun e!711505 () Bool)

(assert (=> start!105116 (=> (not res!835372) (not e!711505))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105116 (= res!835372 (validMask!0 mask!1466))))

(assert (=> start!105116 e!711505))

(assert (=> start!105116 true))

(assert (=> start!105116 tp!94048))

(declare-fun tp_is_empty!31751 () Bool)

(assert (=> start!105116 tp_is_empty!31751))

(declare-datatypes ((array!81164 0))(
  ( (array!81165 (arr!39145 (Array (_ BitVec 32) (_ BitVec 64))) (size!39681 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81164)

(declare-fun array_inv!29855 (array!81164) Bool)

(assert (=> start!105116 (array_inv!29855 _keys!1118)))

(declare-datatypes ((V!47699 0))(
  ( (V!47700 (val!15938 Int)) )
))
(declare-datatypes ((ValueCell!15112 0))(
  ( (ValueCellFull!15112 (v!18636 V!47699)) (EmptyCell!15112) )
))
(declare-datatypes ((array!81166 0))(
  ( (array!81167 (arr!39146 (Array (_ BitVec 32) ValueCell!15112)) (size!39682 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81166)

(declare-fun e!711502 () Bool)

(declare-fun array_inv!29856 (array!81166) Bool)

(assert (=> start!105116 (and (array_inv!29856 _values!914) e!711502)))

(declare-fun b!1252656 () Bool)

(declare-fun e!711506 () Bool)

(assert (=> b!1252656 (= e!711506 tp_is_empty!31751)))

(declare-fun mapNonEmpty!49399 () Bool)

(declare-fun mapRes!49399 () Bool)

(declare-fun tp!94049 () Bool)

(assert (=> mapNonEmpty!49399 (= mapRes!49399 (and tp!94049 e!711506))))

(declare-fun mapValue!49399 () ValueCell!15112)

(declare-fun mapRest!49399 () (Array (_ BitVec 32) ValueCell!15112))

(declare-fun mapKey!49399 () (_ BitVec 32))

(assert (=> mapNonEmpty!49399 (= (arr!39146 _values!914) (store mapRest!49399 mapKey!49399 mapValue!49399))))

(declare-fun b!1252657 () Bool)

(declare-fun e!711503 () Bool)

(assert (=> b!1252657 (= e!711502 (and e!711503 mapRes!49399))))

(declare-fun condMapEmpty!49399 () Bool)

(declare-fun mapDefault!49399 () ValueCell!15112)

