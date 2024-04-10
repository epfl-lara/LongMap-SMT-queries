; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104828 () Bool)

(assert start!104828)

(declare-fun b_free!26633 () Bool)

(declare-fun b_next!26633 () Bool)

(assert (=> start!104828 (= b_free!26633 (not b_next!26633))))

(declare-fun tp!93389 () Bool)

(declare-fun b_and!44401 () Bool)

(assert (=> start!104828 (= tp!93389 b_and!44401)))

(declare-fun res!833522 () Bool)

(declare-fun e!709207 () Bool)

(assert (=> start!104828 (=> (not res!833522) (not e!709207))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104828 (= res!833522 (validMask!0 mask!1466))))

(assert (=> start!104828 e!709207))

(assert (=> start!104828 true))

(assert (=> start!104828 tp!93389))

(declare-fun tp_is_empty!31535 () Bool)

(assert (=> start!104828 tp_is_empty!31535))

(declare-datatypes ((array!80750 0))(
  ( (array!80751 (arr!38942 (Array (_ BitVec 32) (_ BitVec 64))) (size!39478 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80750)

(declare-fun array_inv!29717 (array!80750) Bool)

(assert (=> start!104828 (array_inv!29717 _keys!1118)))

(declare-datatypes ((V!47411 0))(
  ( (V!47412 (val!15830 Int)) )
))
(declare-datatypes ((ValueCell!15004 0))(
  ( (ValueCellFull!15004 (v!18526 V!47411)) (EmptyCell!15004) )
))
(declare-datatypes ((array!80752 0))(
  ( (array!80753 (arr!38943 (Array (_ BitVec 32) ValueCell!15004)) (size!39479 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80752)

(declare-fun e!709203 () Bool)

(declare-fun array_inv!29718 (array!80752) Bool)

(assert (=> start!104828 (and (array_inv!29718 _values!914) e!709203)))

(declare-fun b!1249536 () Bool)

(declare-fun e!709204 () Bool)

(declare-fun mapRes!49063 () Bool)

(assert (=> b!1249536 (= e!709203 (and e!709204 mapRes!49063))))

(declare-fun condMapEmpty!49063 () Bool)

(declare-fun mapDefault!49063 () ValueCell!15004)

