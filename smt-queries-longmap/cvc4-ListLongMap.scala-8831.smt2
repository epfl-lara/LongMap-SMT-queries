; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107214 () Bool)

(assert start!107214)

(declare-fun mapNonEmpty!50935 () Bool)

(declare-fun mapRes!50935 () Bool)

(declare-fun tp!97276 () Bool)

(declare-fun e!724605 () Bool)

(assert (=> mapNonEmpty!50935 (= mapRes!50935 (and tp!97276 e!724605))))

(declare-datatypes ((V!49063 0))(
  ( (V!49064 (val!16526 Int)) )
))
(declare-datatypes ((ValueCell!15598 0))(
  ( (ValueCellFull!15598 (v!19163 V!49063)) (EmptyCell!15598) )
))
(declare-datatypes ((array!83062 0))(
  ( (array!83063 (arr!40068 (Array (_ BitVec 32) ValueCell!15598)) (size!40604 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83062)

(declare-fun mapKey!50935 () (_ BitVec 32))

(declare-fun mapRest!50935 () (Array (_ BitVec 32) ValueCell!15598))

(declare-fun mapValue!50935 () ValueCell!15598)

(assert (=> mapNonEmpty!50935 (= (arr!40068 _values!1134) (store mapRest!50935 mapKey!50935 mapValue!50935))))

(declare-fun res!845669 () Bool)

(declare-fun e!724606 () Bool)

(assert (=> start!107214 (=> (not res!845669) (not e!724606))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107214 (= res!845669 (validMask!0 mask!1730))))

(assert (=> start!107214 e!724606))

(declare-fun e!724604 () Bool)

(declare-fun array_inv!30475 (array!83062) Bool)

(assert (=> start!107214 (and (array_inv!30475 _values!1134) e!724604)))

(assert (=> start!107214 true))

(declare-datatypes ((array!83064 0))(
  ( (array!83065 (arr!40069 (Array (_ BitVec 32) (_ BitVec 64))) (size!40605 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83064)

(declare-fun array_inv!30476 (array!83064) Bool)

(assert (=> start!107214 (array_inv!30476 _keys!1364)))

(declare-fun b!1270949 () Bool)

(declare-fun res!845667 () Bool)

(assert (=> b!1270949 (=> (not res!845667) (not e!724606))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1270949 (= res!845667 (and (= (size!40604 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40605 _keys!1364) (size!40604 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270950 () Bool)

(declare-fun e!724608 () Bool)

(assert (=> b!1270950 (= e!724604 (and e!724608 mapRes!50935))))

(declare-fun condMapEmpty!50935 () Bool)

(declare-fun mapDefault!50935 () ValueCell!15598)

