; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105110 () Bool)

(assert start!105110)

(declare-fun b_free!26843 () Bool)

(declare-fun b_next!26843 () Bool)

(assert (=> start!105110 (= b_free!26843 (not b_next!26843))))

(declare-fun tp!94030 () Bool)

(declare-fun b_and!44647 () Bool)

(assert (=> start!105110 (= tp!94030 b_and!44647)))

(declare-fun b!1252584 () Bool)

(declare-fun res!835324 () Bool)

(declare-fun e!711447 () Bool)

(assert (=> b!1252584 (=> (not res!835324) (not e!711447))))

(declare-datatypes ((array!81152 0))(
  ( (array!81153 (arr!39139 (Array (_ BitVec 32) (_ BitVec 64))) (size!39675 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81152)

(declare-datatypes ((List!27789 0))(
  ( (Nil!27786) (Cons!27785 (h!28994 (_ BitVec 64)) (t!41268 List!27789)) )
))
(declare-fun arrayNoDuplicates!0 (array!81152 (_ BitVec 32) List!27789) Bool)

(assert (=> b!1252584 (= res!835324 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27786))))

(declare-fun b!1252585 () Bool)

(declare-fun e!711451 () Bool)

(declare-fun e!711452 () Bool)

(declare-fun mapRes!49390 () Bool)

(assert (=> b!1252585 (= e!711451 (and e!711452 mapRes!49390))))

(declare-fun condMapEmpty!49390 () Bool)

(declare-datatypes ((V!47691 0))(
  ( (V!47692 (val!15935 Int)) )
))
(declare-datatypes ((ValueCell!15109 0))(
  ( (ValueCellFull!15109 (v!18633 V!47691)) (EmptyCell!15109) )
))
(declare-datatypes ((array!81154 0))(
  ( (array!81155 (arr!39140 (Array (_ BitVec 32) ValueCell!15109)) (size!39676 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81154)

(declare-fun mapDefault!49390 () ValueCell!15109)

