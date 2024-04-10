; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107192 () Bool)

(assert start!107192)

(declare-fun b!1270751 () Bool)

(declare-fun res!845569 () Bool)

(declare-fun e!724442 () Bool)

(assert (=> b!1270751 (=> (not res!845569) (not e!724442))))

(declare-datatypes ((V!49035 0))(
  ( (V!49036 (val!16515 Int)) )
))
(declare-datatypes ((ValueCell!15587 0))(
  ( (ValueCellFull!15587 (v!19152 V!49035)) (EmptyCell!15587) )
))
(declare-datatypes ((array!83020 0))(
  ( (array!83021 (arr!40047 (Array (_ BitVec 32) ValueCell!15587)) (size!40583 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83020)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83022 0))(
  ( (array!83023 (arr!40048 (Array (_ BitVec 32) (_ BitVec 64))) (size!40584 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83022)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270751 (= res!845569 (and (= (size!40583 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40584 _keys!1364) (size!40583 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270752 () Bool)

(declare-fun e!724440 () Bool)

(declare-fun e!724443 () Bool)

(declare-fun mapRes!50902 () Bool)

(assert (=> b!1270752 (= e!724440 (and e!724443 mapRes!50902))))

(declare-fun condMapEmpty!50902 () Bool)

(declare-fun mapDefault!50902 () ValueCell!15587)

