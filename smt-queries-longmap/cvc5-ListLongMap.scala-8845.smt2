; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107294 () Bool)

(assert start!107294)

(declare-fun b!1271669 () Bool)

(declare-fun res!846028 () Bool)

(declare-fun e!725207 () Bool)

(assert (=> b!1271669 (=> (not res!846028) (not e!725207))))

(declare-datatypes ((V!49171 0))(
  ( (V!49172 (val!16566 Int)) )
))
(declare-datatypes ((ValueCell!15638 0))(
  ( (ValueCellFull!15638 (v!19203 V!49171)) (EmptyCell!15638) )
))
(declare-datatypes ((array!83214 0))(
  ( (array!83215 (arr!40144 (Array (_ BitVec 32) ValueCell!15638)) (size!40680 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83214)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83216 0))(
  ( (array!83217 (arr!40145 (Array (_ BitVec 32) (_ BitVec 64))) (size!40681 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83216)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271669 (= res!846028 (and (= (size!40680 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40681 _keys!1364) (size!40680 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271670 () Bool)

(declare-fun e!725206 () Bool)

(declare-fun e!725208 () Bool)

(declare-fun mapRes!51055 () Bool)

(assert (=> b!1271670 (= e!725206 (and e!725208 mapRes!51055))))

(declare-fun condMapEmpty!51055 () Bool)

(declare-fun mapDefault!51055 () ValueCell!15638)

