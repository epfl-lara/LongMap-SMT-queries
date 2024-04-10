; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107234 () Bool)

(assert start!107234)

(declare-fun mapNonEmpty!50965 () Bool)

(declare-fun mapRes!50965 () Bool)

(declare-fun tp!97306 () Bool)

(declare-fun e!724754 () Bool)

(assert (=> mapNonEmpty!50965 (= mapRes!50965 (and tp!97306 e!724754))))

(declare-datatypes ((V!49091 0))(
  ( (V!49092 (val!16536 Int)) )
))
(declare-datatypes ((ValueCell!15608 0))(
  ( (ValueCellFull!15608 (v!19173 V!49091)) (EmptyCell!15608) )
))
(declare-datatypes ((array!83102 0))(
  ( (array!83103 (arr!40088 (Array (_ BitVec 32) ValueCell!15608)) (size!40624 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83102)

(declare-fun mapValue!50965 () ValueCell!15608)

(declare-fun mapRest!50965 () (Array (_ BitVec 32) ValueCell!15608))

(declare-fun mapKey!50965 () (_ BitVec 32))

(assert (=> mapNonEmpty!50965 (= (arr!40088 _values!1134) (store mapRest!50965 mapKey!50965 mapValue!50965))))

(declare-fun res!845759 () Bool)

(declare-fun e!724755 () Bool)

(assert (=> start!107234 (=> (not res!845759) (not e!724755))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107234 (= res!845759 (validMask!0 mask!1730))))

(assert (=> start!107234 e!724755))

(declare-fun e!724757 () Bool)

(declare-fun array_inv!30491 (array!83102) Bool)

(assert (=> start!107234 (and (array_inv!30491 _values!1134) e!724757)))

(assert (=> start!107234 true))

(declare-datatypes ((array!83104 0))(
  ( (array!83105 (arr!40089 (Array (_ BitVec 32) (_ BitVec 64))) (size!40625 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83104)

(declare-fun array_inv!30492 (array!83104) Bool)

(assert (=> start!107234 (array_inv!30492 _keys!1364)))

(declare-fun b!1271129 () Bool)

(declare-fun res!845758 () Bool)

(assert (=> b!1271129 (=> (not res!845758) (not e!724755))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271129 (= res!845758 (and (= (size!40624 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40625 _keys!1364) (size!40624 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271130 () Bool)

(declare-fun tp_is_empty!32923 () Bool)

(assert (=> b!1271130 (= e!724754 tp_is_empty!32923)))

(declare-fun b!1271131 () Bool)

(declare-fun res!845757 () Bool)

(assert (=> b!1271131 (=> (not res!845757) (not e!724755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83104 (_ BitVec 32)) Bool)

(assert (=> b!1271131 (= res!845757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271132 () Bool)

(declare-fun e!724758 () Bool)

(assert (=> b!1271132 (= e!724757 (and e!724758 mapRes!50965))))

(declare-fun condMapEmpty!50965 () Bool)

(declare-fun mapDefault!50965 () ValueCell!15608)

