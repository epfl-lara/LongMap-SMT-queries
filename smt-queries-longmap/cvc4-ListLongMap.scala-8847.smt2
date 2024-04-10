; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107310 () Bool)

(assert start!107310)

(declare-fun b!1271813 () Bool)

(declare-fun res!846099 () Bool)

(declare-fun e!725327 () Bool)

(assert (=> b!1271813 (=> (not res!846099) (not e!725327))))

(declare-datatypes ((V!49191 0))(
  ( (V!49192 (val!16574 Int)) )
))
(declare-datatypes ((ValueCell!15646 0))(
  ( (ValueCellFull!15646 (v!19211 V!49191)) (EmptyCell!15646) )
))
(declare-datatypes ((array!83246 0))(
  ( (array!83247 (arr!40160 (Array (_ BitVec 32) ValueCell!15646)) (size!40696 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83246)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83248 0))(
  ( (array!83249 (arr!40161 (Array (_ BitVec 32) (_ BitVec 64))) (size!40697 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83248)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271813 (= res!846099 (and (= (size!40696 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40697 _keys!1364) (size!40696 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271814 () Bool)

(declare-fun e!725328 () Bool)

(declare-fun e!725326 () Bool)

(declare-fun mapRes!51079 () Bool)

(assert (=> b!1271814 (= e!725328 (and e!725326 mapRes!51079))))

(declare-fun condMapEmpty!51079 () Bool)

(declare-fun mapDefault!51079 () ValueCell!15646)

